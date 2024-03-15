Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52192C54E67
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 13:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ZkcRJT0M/hgEokVuRrvc0cvw+oIgw/ujOmRqkvlb7E=; b=S7ntoZAMDxeMsB
	IuRvzNthlygIdpTSjNfKQYJs9m+2urcv3o4GRME85kAO4b3L8rf+ijYeWHNXDsh6MF13wPAV/vhLa
	xT8XdLZVxaUyDu7Z7MQZnw63sTDVdGbB9R9PpzD0pBikyCTTot0pspFJFOq/+x4lhSThrFJ6Rjvg6
	yhQMZ7TAJpkhvmCMI5aD4N/kOWDsPn5mkVZGbCkoWibxwCaKfk8Ys2/bx7zh/5kiGeuOpwfGeDLeQ
	KJAb81CguzMtUMVAYiJUQx3oDSV8eesheW/KnTjzrUjwc8mpik+9zr+U7tLKuXjS6p6rDjjyuGoJr
	tUIXUmQBLG3C6pYQIEZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl7nO-00000000MAP-2pJN;
	Fri, 15 Mar 2024 13:40:26 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl7nH-00000000M4O-3d2a
	for linux-riscv@lists.infradead.org;
	Fri, 15 Mar 2024 13:40:21 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-566e869f631so2424582a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Mar 2024 06:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1710510018; x=1711114818; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/o9GJYOsp32C4ZK5XVSIqlhvuJ+jgCOlcUd/wXUyPQ=;
        b=T7augNcSkbcPvxljZ+eDo5Jf0rsP4CjUpbcrQzpdOHKi4p4x/6Y7USnMRQVR6dqkBB
         meDzsrGyc3Its4nf1EVQMgBxYxXzN3VB/aXYrgC8SKEc6Vw/jK3dLfZTYe115s+vIBbs
         n4a/PFz1hmiNmrVcG7bIYu1LFFNZNvfs/+qD4h1riW7aZnEm1BSA9SvmRQJgdK/MNCfT
         gy1Y/ltYQjY46zk9aMu0YK53zdjpegZm5T/DpvDFqlPFRiIntTsIuW6oT+LTz36zkEmh
         SEc7Y0fBtane0V089U2nJ0vu/6hzH1ubo3rJeSfKUf6rrS3+m5huLEcV771ALIo6vKQK
         cXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710510018; x=1711114818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/o9GJYOsp32C4ZK5XVSIqlhvuJ+jgCOlcUd/wXUyPQ=;
        b=RuF1QtGuMec2g8KEVNPg/uxSdPNjBQnfU7xRqKqFcJNhRF750VV8bYbca96K3BaGkI
         hc46hJWQZz67sGTqEL2XQNJByNm8JN5hzxMuTEncaJ5L9geDuN8eG/KOFwrAWU3eNxTy
         11cP28kiSg9Vgkp7kM7C7iGMF0xAooZumkIEZNkulRKcUR99LorUSQP5YMyV6EU6TdH0
         hf7bJvYfTcT4t7xpRK4e13aLQ0zfyTboV5FMtTWvqDGQe9CBlly2nfVXZs5rGKSNiLff
         CXos4tU1IDaz5IJT3ba6BmAo/TEIcfCj/tVRVrTafF+cNjYFq/981ZFIcoE8/4SvYxG1
         dunw==
X-Gm-Message-State: AOJu0Yy26SmwBuXawFhggfVlBwlHgrUm+RTYHAKzKHCi2fIEtUNRCr1n
	z2B4Jg4NIVdok/z+ryH+TH4PlxoL3BShKfpgqSel6fLtuvaEtHO4QN/SiMR0E8VwNvbaXRqJFCF
	O
X-Google-Smtp-Source: AGHT+IHMmMev7FozGWhg8NxuQCBT5iLAlNeos2MLLF5+m9qRz57N/3fevZMrHs6G12EvzA8Wcnw9lA==
X-Received: by 2002:a17:906:3e18:b0:a44:51c1:733c with SMTP id k24-20020a1709063e1800b00a4451c1733cmr3380353eji.39.1710510017851;
        Fri, 15 Mar 2024 06:40:17 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id q23-20020a170906b29700b00a4558314ea0sm1755920ejz.15.2024.03.15.06.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 06:40:17 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	christoph.muellner@vrull.eu,
	heiko@sntech.de,
	charlie@rivosinc.com,
	David.Laight@ACULAB.COM
Subject: [PATCH 5/5] KVM: riscv: selftests: Add Zawrs extension to get-reg-list test
Date: Fri, 15 Mar 2024 14:40:15 +0100
Message-ID: <20240315134009.580167-12-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315134009.580167-7-ajones@ventanamicro.com>
References: <20240315134009.580167-7-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_064020_002304_C14B0802 
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

KVM RISC-V allows the Zawrs extension for the Guest/VM, so add it
to the get-reg-list test.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index b882b7b9b785..8c4c27bd4b88 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -48,6 +48,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVNAPOT:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVPBMT:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZACAS:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZAWRS:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBB:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBC:
@@ -413,6 +414,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(SVNAPOT),
 		KVM_ISA_EXT_ARR(SVPBMT),
 		KVM_ISA_EXT_ARR(ZACAS),
+		KVM_ISA_EXT_ARR(ZAWRS),
 		KVM_ISA_EXT_ARR(ZBA),
 		KVM_ISA_EXT_ARR(ZBB),
 		KVM_ISA_EXT_ARR(ZBC),
@@ -936,6 +938,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(svinval, SVINVAL);
 KVM_ISA_EXT_SIMPLE_CONFIG(svnapot, SVNAPOT);
 KVM_ISA_EXT_SIMPLE_CONFIG(svpbmt, SVPBMT);
 KVM_ISA_EXT_SIMPLE_CONFIG(zacas, ZACAS);
+KVM_ISA_EXT_SIMPLE_CONFIG(zawrs, ZAWRS);
 KVM_ISA_EXT_SIMPLE_CONFIG(zba, ZBA);
 KVM_ISA_EXT_SIMPLE_CONFIG(zbb, ZBB);
 KVM_ISA_EXT_SIMPLE_CONFIG(zbc, ZBC);
@@ -991,6 +994,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_svnapot,
 	&config_svpbmt,
 	&config_zacas,
+	&config_zawrs,
 	&config_zba,
 	&config_zbb,
 	&config_zbc,
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
