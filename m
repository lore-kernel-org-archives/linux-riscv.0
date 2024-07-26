Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9BDC3DA49
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 08:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kXB9hZ36/9dBo4bpLjvKevzi5hzrXS8Ptkg3hsbv8kg=; b=eQUYx0to3IjGNH
	hM2vjXNzmuUVUJg/N5vS54Ylh3t4iNdZFwm2v6mrsUBPCf139kBpxdCHq04sxbqyVx240RuYbHYdX
	2nwehV8m4JtqaSG55mejri3WAhsF4GqGdaLn9gq6/o1MsSOdCN1i9ETYrsybV2Rsj6BdmSN+2rAM+
	0kjLn97VCmos+gOQJToB4eq4KGNk2K+QwDP3p47Fr5ZMVeMg3ydDcdd2QImDgrkaWYoLOZLYJIFr8
	x1PD7HuwkUMBu+k37VENQ6PSEMHrhmT17ItDVnDM+atgaDHJ0puWh0CDOYn5wqE6wCwRMCUvJmKU4
	qOkqGaquKihKOeQ4tjdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXGeS-00000003NHY-38Hn;
	Fri, 26 Jul 2024 08:50:12 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXGeJ-00000003N9k-3uoz
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 08:50:05 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-396e2d21812so5765815ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 01:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721983802; x=1722588602; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bh0dPmnNd790JEXkCnnwPZ9r1VDA3UO+2QohszDGqoo=;
        b=WV7WCV1OqDOaphnSkrZdJOrj7L2gklGJ7nLmO7m2kGpz3n6psTEQXtUuCXQ+05yfV/
         yhoqbQUsIS+8j4SGqs8Rkf6atrYZgbGsqbtU2W704wewUTXGwsObR7cQrvSFFwtujchB
         qyN73B9sedsVf2J+9lxbVCzlEnFrSOCi8yFDYF6EACDIAHyVGuknkkNBZvxeImaQlwdS
         F810LuHEV9vGHu6F6yztexCQIogA9vGLArbRQLdRzCI0SObYNYfBVAosLoCsErIxcv43
         mpGMqsCmgAfhIDhNVyoX9h0IKteq7hI1cAflHEeuX+RaFGBbDGzUTT4F+vPM+Njh1mZ/
         Stng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721983803; x=1722588603;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bh0dPmnNd790JEXkCnnwPZ9r1VDA3UO+2QohszDGqoo=;
        b=Ciy3KQmorzfUUlal4aUIyXweIYtWZcTu7l1LwIno90EKU1vO/Or0frIGvXQl2kUuXG
         FlwAR55Cj0HuuDfxQ/HSezMb7k1L+vDP3Qu8oCZslNCINOt/JcE5Mf7e8qz3oGoaI51d
         zKg9NbSxVaTo3oNOSjfSw4nE44qV3JwuaVEC8kCDA6uFrfQdd3K8Z6P4vxL3FLE4ZAfD
         Nq7SDupKxGxIEFhE3W5HzOmcfj/tEKRqfFsoeRfJnNhvEqDqlThlGGlKT+tttHnrY0qF
         BCW//Y5bgFugLbaonXrbWhqO2r4h0zOMPGoyao3dNc3KiEjDByy158GEa1rCsgBVr6R6
         7FPg==
X-Forwarded-Encrypted: i=1; AJvYcCUX7i19ZWGlWFkKbJsEIm8yZREbQRVAIbFjGsx34YY03+X4WvYUkMgIufMmb+m4x9x8XAByRFlbarx035x/V9ZRvSx6k35vXADu4hiVZDm7
X-Gm-Message-State: AOJu0YyO+UB6zODyk5FK+/tQHGT2ykj5rfEB65QzSZ+yMeOYYkfSHCUi
	yo6MzDR51feEXvjEVD7zAFlqaBuAkUfGDPjqK9j4Y7QhJvf+LVnbKNYEzpXhiYg=
X-Google-Smtp-Source: AGHT+IEC0sacpJpGdjediwFUkg9JGJyg+dOU1D2hf0SgxjyukSNI0E33M4o24q3PFduqql67IyeZjQ==
X-Received: by 2002:a05:6e02:2162:b0:374:9c67:1df6 with SMTP id e9e14a558f8ab-39a21814055mr55639775ab.22.1721983802742;
        Fri, 26 Jul 2024 01:50:02 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f816db18sm2049645a12.33.2024.07.26.01.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 01:50:02 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v8 5/5] KVM: riscv: selftests: Add Svade and Svadu Extension to get-reg-list test
Date: Fri, 26 Jul 2024 16:49:30 +0800
Message-Id: <20240726084931.28924-6-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240726084931.28924-1-yongxuan.wang@sifive.com>
References: <20240726084931.28924-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_015004_102592_CC171596 
X-CRM114-Status: UNSURE (   8.23  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Update the get-reg-list test to test the Svade and Svadu Extensions are
available for guest OS.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 8e34f7fa44e9..aac40652e181 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -45,6 +45,8 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSAIA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSCOFPMF:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSTC:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVADE:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVADU:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVNAPOT:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVPBMT:
@@ -418,6 +420,8 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(SSAIA),
 		KVM_ISA_EXT_ARR(SSCOFPMF),
 		KVM_ISA_EXT_ARR(SSTC),
+		KVM_ISA_EXT_ARR(SVADE),
+		KVM_ISA_EXT_ARR(SVADU),
 		KVM_ISA_EXT_ARR(SVINVAL),
 		KVM_ISA_EXT_ARR(SVNAPOT),
 		KVM_ISA_EXT_ARR(SVPBMT),
@@ -949,6 +953,8 @@ KVM_ISA_EXT_SIMPLE_CONFIG(h, H);
 KVM_ISA_EXT_SUBLIST_CONFIG(smstateen, SMSTATEEN);
 KVM_ISA_EXT_SIMPLE_CONFIG(sscofpmf, SSCOFPMF);
 KVM_ISA_EXT_SIMPLE_CONFIG(sstc, SSTC);
+KVM_ISA_EXT_SIMPLE_CONFIG(svade, SVADE);
+KVM_ISA_EXT_SIMPLE_CONFIG(svadu, SVADU);
 KVM_ISA_EXT_SIMPLE_CONFIG(svinval, SVINVAL);
 KVM_ISA_EXT_SIMPLE_CONFIG(svnapot, SVNAPOT);
 KVM_ISA_EXT_SIMPLE_CONFIG(svpbmt, SVPBMT);
@@ -1012,6 +1018,8 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_smstateen,
 	&config_sscofpmf,
 	&config_sstc,
+	&config_svade,
+	&config_svadu,
 	&config_svinval,
 	&config_svnapot,
 	&config_svpbmt,
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
