Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B621C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 14:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8dJuorkFn+i1KNoy+W/xVWeW313lvgiwTeONwr1We2U=; b=ann+TGNTGjQ8fB
	e3dmLL4u0dWMkW4UB3DuSTl+9ghhC1/b/eldWE6QXkHcCmQegwKCH6EWvLrZ/l/qzcQmYhvNqxoqe
	/2Kb+oeTsU7W0GkQMrFkQ28ZrnB24RsdT1GnQNDjliSqv9qoM4rREVYWaUr2JgFkKW+aLA5olmtpk
	xt4Jlll/gxyM+zWcEAlvPVJKRRQ6AEXNwlmhms6hWIFGiKqfKcsLnczySZkOyDqVy4HWfgqEXioeh
	dIzMnSnPcjym4cuJfhLdAbqL8OZXo3r0uEuXFx6CY9gYF13kAqPkNgYCg2ZwX7UW6X9yMyNLlQLsf
	bEdHHpJ+vyI4kUpcZ0ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zUp-005aLk-1x;
	Tue, 28 Nov 2023 14:55:31 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7zUm-005aIV-0h
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 14:55:30 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5b9a456798eso3282011a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 06:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701183327; x=1701788127; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+VVLFlRU9wYvo88+4OGIocSm8Yau0IVgd5ynlDYwNo0=;
        b=bSVdzN78952+8E3m2+jhcWwyUSs0Dv3EwjqNIVpoRcj5o4xq9ih79XMbT4Ajw+LddZ
         93+5N+Jhe+wOG8lEK+OYaqQl5DCB+acPZVwSJ1nhJ3dLtmMfUq+VSUOzkqnlPQ8weYNt
         ZZX8RSpSiaz3LL2oMvfizSEQPkPnukLPCG6gSSZABjhuyyzgdubk8lTLeNhcd3a5Z+q+
         CPNPJNb/92TtjxAhA0jaWLyPIrRiOlzNoPaKl0qxYCt55S8bf/WzHuI3sAgE9C3V6+uM
         AArrKicr1s+Z0Pl5rU0yEFx9cfwkn12ciY7P6LbU8O5bgmcGSfqPm7PIfYfMQknBRrZV
         ottQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701183327; x=1701788127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VVLFlRU9wYvo88+4OGIocSm8Yau0IVgd5ynlDYwNo0=;
        b=Fqnfpo1HlZaPUsGjXnRHuJprYiBg+wnvkIi2inD3hJDi1fa8CHHgaOjO1f3aXyMCk0
         qyD2wS43NNG+DTmgjbRgPkUQdGGo1d7WSRokMU8PDVRlxatsNaI8gPKfT/xR5gPpD9HG
         //c5S+BcWnLXSLhLiMtEZZ60/aMs9qHBrscXKuoxDNsLBz7ixbNeSJmBE3WugaAehwy+
         xcgDskbNSG2j5Una5SiebBFhfMtzsLtiZzGm+3J++CQCWjm9vJAF/VL5CDyfLVfSwySm
         4QAEzu7CGxGYX78+OTtAYvMwh7pR/tZrMgtzhPoBJsnOh3SmrZc23c1DtEHaP8Smo8dL
         nenw==
X-Gm-Message-State: AOJu0YwI5pJLR2Eq7r1HMnSdxgh32B+ZIXfeV4wQoBStMTswnIuFSBYk
	AggeVejoP1Ibbs++SaIZNOKZkw==
X-Google-Smtp-Source: AGHT+IHZ95VAy9/7S8RkRKOXL8kFHrGKjfJWJoXp0yuxzlNt0eSXamoYyifB6bHsdqesqmrNE+3K7g==
X-Received: by 2002:a17:90a:1a5d:b0:280:24c7:509 with SMTP id 29-20020a17090a1a5d00b0028024c70509mr13617016pjl.46.1701183327478;
        Tue, 28 Nov 2023 06:55:27 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902e80b00b001bf11cf2e21sm10281552plg.210.2023.11.28.06.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 06:55:27 -0800 (PST)
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
Subject: [PATCH 15/15] KVM: riscv: selftests: Add Zfa extension to get-reg-list test
Date: Tue, 28 Nov 2023 20:23:57 +0530
Message-Id: <20231128145357.413321-16-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231128145357.413321-1-apatel@ventanamicro.com>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_065528_271361_E327DD29 
X-CRM114-Status: UNSURE (   8.20  )
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

The KVM RISC-V allows Zfa extension for Guest/VM so let us
add this extension to get-reg-list test.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index df03bc511fbf..3ae919469c38 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -49,6 +49,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBKC:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBKX:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBS:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZFA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZFH:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZFHMIN:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOM:
@@ -392,6 +393,7 @@ static const char *isa_ext_id_to_str(const char *prefix, __u64 id)
 		KVM_ISA_EXT_ARR(ZBKC),
 		KVM_ISA_EXT_ARR(ZBKX),
 		KVM_ISA_EXT_ARR(ZBS),
+		KVM_ISA_EXT_ARR(ZFA),
 		KVM_ISA_EXT_ARR(ZFH),
 		KVM_ISA_EXT_ARR(ZFHMIN),
 		KVM_ISA_EXT_ARR(ZICBOM),
@@ -796,6 +798,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zbkb, ZBKB);
 KVM_ISA_EXT_SIMPLE_CONFIG(zbkc, ZBKC);
 KVM_ISA_EXT_SIMPLE_CONFIG(zbkx, ZBKX);
 KVM_ISA_EXT_SIMPLE_CONFIG(zbs, ZBS);
+KVM_ISA_EXT_SIMPLE_CONFIG(zfa, ZFA);
 KVM_ISA_EXT_SIMPLE_CONFIG(zfh, ZFH);
 KVM_ISA_EXT_SIMPLE_CONFIG(zfhmin, ZFHMIN);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicbom, ZICBOM);
@@ -844,6 +847,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_zbkc,
 	&config_zbkx,
 	&config_zbs,
+	&config_zfa,
 	&config_zfh,
 	&config_zfhmin,
 	&config_zicbom,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
