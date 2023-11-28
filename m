Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E63C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 16:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6IEDMvI4jAO9sr4W961cz3IFoXkWd6eQQSZ5c0ZuNsk=; b=3n4BimYn+2jphL
	gvKXovKYjFWXGVa62tYZ/u4ZTcQfpRtUaU5FF9gFp+T2X7EU7dgU8MKlu1TpzTTlbbbRZRVJWcv94
	ipaRuM598XhOaG8AgrerENXa4NpLcFWNHvcSGeIqk/Pw6RebQe4/60HlbYJ9PgpdSRRVNpFxCv7CA
	leDaHUHgyXVtbAPcB8BgjVWIv/lsHiGo6uHKJw+9w4gAXANKsYooNsxV2rEcCD2HXyS8wM6CO+iib
	w70Fieil15qeGD++5xOzfH4We+Vo7NKSMx3Fq20ehsAYk2NgW5T41x3ZSl0sepZK2k5bOfwVNQN1x
	41HIyhT5+KY2XgfTMeTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r80WB-005l9E-0X;
	Tue, 28 Nov 2023 16:00:59 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zTk-005ZG6-23
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 14:54:26 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1ce28faa92dso42812515ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 06:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701183263; x=1701788063; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqoarEcYKPTwyPmOGP/1tRxw/l4x1unFGwuPZisXSs0=;
        b=Fa5ZJJBqRs231uAYHT/BIKzlC0UCwWmp3GpBvIFrCnT+U7I0rBX72vAF09UH7PomoI
         Zyr7fo9QuzEHzQe1gvKOJtTjEwJsv/l24E1mqaSqoONYPROQZe449WyCkUTXZW3iYqBR
         NwnM9LUz3MJ08IBGBIaJbD4kOGLkB86N7LCVwTCFVylizfvfXRtiYiuFu7C9M9NA7MWz
         wWcC0Hw7jqNAKw0lNTjzX8fGEe2ptcGEkob5EtKzwr+yyeNDg8FbrKdHZ49ZxzIjCu+z
         8WT5gjs/0hRIF0lSzGeBesJl5XnftlwWic2A3GWgnklgBitFKRqvahyT+rr8Lp91nJZB
         MTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701183263; x=1701788063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqoarEcYKPTwyPmOGP/1tRxw/l4x1unFGwuPZisXSs0=;
        b=lBl9/xKI3+Q6NHFB0tU10C9KnhqY+utpRLeGSAinoE5nD/nOEeU1cAZ/BSuNgCVd7I
         6SqxGbdSMnjKlxNuRsPScIhJ3ZFuO7CNqsA7wyqi4Ua46umubtw5IjuwVFtES8fqKN2C
         gmyFxDXbaTCbGEGGW1BE4SIpqDBTQwNNJ5VFZaQBcFgz4CdhgY4wYlrKYCo1e2XQVZYM
         ehZfVfcFVTcNiRwZJez+cqkdks+XCzfcAQXx5CoWeFSGNe9W9/J9pXZibMbExv6m04KM
         bDbFj9yY2F7y6w2vIVfyIbNw65ue+blBhgw/VDJyBsSWA3xxGETVsZ9qOdgwoMS8EPCp
         z5/A==
X-Gm-Message-State: AOJu0Yz+gxoFF0ljBqIJeSNaly3IxqUAggZ47kUiYqqH01WxPoFapdAw
	MQByJUTrAjyNKsw2SybxigxYUA==
X-Google-Smtp-Source: AGHT+IF0goMcAklKoJKTKjWtl2nqOMf0dgEj4xslQsxSZoF9zhQ3gTvjB8b3QY0TAV4Wuuo/tXKSpA==
X-Received: by 2002:a17:902:e843:b0:1cf:c404:45dd with SMTP id t3-20020a170902e84300b001cfc40445ddmr8585604plg.57.1701183262958;
        Tue, 28 Nov 2023 06:54:22 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902e80b00b001bf11cf2e21sm10281552plg.210.2023.11.28.06.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 06:54:22 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 03/15] KVM: riscv: selftests: Add Zbc extension to get-reg-list test
Date: Tue, 28 Nov 2023 20:23:45 +0530
Message-Id: <20231128145357.413321-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231128145357.413321-1-apatel@ventanamicro.com>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_065424_698595_3E5D612A 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The KVM RISC-V allows Zbc extension for Guest/VM so let us add
this extension to get-reg-list test.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index b6b4b6d7dacd..4b75b011f2d8 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -44,6 +44,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVPBMT:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBB:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBC:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBS:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOM:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOZ:
@@ -361,6 +362,7 @@ static const char *isa_ext_id_to_str(const char *prefix, __u64 id)
 		KVM_ISA_EXT_ARR(SVPBMT),
 		KVM_ISA_EXT_ARR(ZBA),
 		KVM_ISA_EXT_ARR(ZBB),
+		KVM_ISA_EXT_ARR(ZBC),
 		KVM_ISA_EXT_ARR(ZBS),
 		KVM_ISA_EXT_ARR(ZICBOM),
 		KVM_ISA_EXT_ARR(ZICBOZ),
@@ -739,6 +741,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(svnapot, SVNAPOT);
 KVM_ISA_EXT_SIMPLE_CONFIG(svpbmt, SVPBMT);
 KVM_ISA_EXT_SIMPLE_CONFIG(zba, ZBA);
 KVM_ISA_EXT_SIMPLE_CONFIG(zbb, ZBB);
+KVM_ISA_EXT_SIMPLE_CONFIG(zbc, ZBC);
 KVM_ISA_EXT_SIMPLE_CONFIG(zbs, ZBS);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicbom, ZICBOM);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicboz, ZICBOZ);
@@ -761,6 +764,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_svpbmt,
 	&config_zba,
 	&config_zbb,
+	&config_zbc,
 	&config_zbs,
 	&config_zicbom,
 	&config_zicboz,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
