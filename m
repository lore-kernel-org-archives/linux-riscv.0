Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1917C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 10:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ZkcRJT0M/hgEokVuRrvc0cvw+oIgw/ujOmRqkvlb7E=; b=0FhVADm9WUWd+Q
	MEHqHIb9c5WS5qWvQqcfWFWPSxFztZc4BiGHWLi6ugLziRUNV1au28C6j7rd9s0smKewlcevo9OQT
	bk5gs02U3wUV47dWIBGFkOw1RnVpCiXO37aByt9hCv64UYGCjXmO0USpe/QkKLw9KKJWRB4VJkk1Y
	xEcDcH876QUtkUpyOBf78KyYAYBgMCOW+ssYovldzKJPkjFrXA7oWz4YUBvn/VPfKaeHbv/MICmb7
	mHohBg4uD0cNHIC1GhaKkze6aYZx1yU+xH9qUdxJwGs9bABVw6oXO6F9CMj5qpCH7DFjEmjCUcfFv
	u19UyYaTk2rYtYarUeFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0IVt-0000000C4Li-3cGJ;
	Fri, 26 Apr 2024 10:09:05 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0IVK-0000000C3ph-0gej
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 10:08:36 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-41b782405d5so7617225e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 03:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714126109; x=1714730909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/o9GJYOsp32C4ZK5XVSIqlhvuJ+jgCOlcUd/wXUyPQ=;
        b=Abt0r0pLe4EuY1QWj5JHWIAUmB749aSfpSyaaP5Dh5d2nGYxECGoNUy0JM7TfQjZQd
         atYO57IJlGEQIveQyyFj5b+TnugbWvJBs5pK/D90h4xHSNSwlded5yp4Ri5OlXZfe9Uz
         fSy3WX+ra5HGomyLpTHYbvWgau/lTPBjez70TmTWrLw+GMitllRA0qOBLIsZFt7f2mQe
         lxaG6f5iuN+3Bi2lnrHE7IE0KZwobrVLvfuNY6Y7n/utqK2hMuFaJlmjdALiEI0+9aWH
         Rvz86FdXVW4ZC4m3RrWUiMgXXpQjkBTsKyTGNoTRwIDmxv0vTRuAfetO41UwADuPxpR+
         iLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714126109; x=1714730909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/o9GJYOsp32C4ZK5XVSIqlhvuJ+jgCOlcUd/wXUyPQ=;
        b=t7h8GSkH+ScOWM/ShZc3UO2nXmP1YgjHnUgi34pZZkjIs9i0YPqn8wG/YdB31/CRtf
         Pyjb2Pfg7bbkSMKYyOItz9LZn035RS4jSbzDEYK4kMgWCr7qQqYbi9B+gob/q+8gPEC4
         n4ym6BtagmyzTbBbHsKHemH0AbhdW1Y0GqbKvpeazv0DDdQJhSk+Ne38SBuBdkzZsHAk
         fLPMORVcNvbncM0Kukp95g7G3QF7aBUg4qV3DgC6iWUgpIKVNzMlhVc9HZCQX2pYtE1p
         K35Nf/mxnT0h3Rx9cFNKyHJrohC02Tf7oNCGh50LYxB50zUccHizamcqzVgJQGq54xsp
         Ejlw==
X-Gm-Message-State: AOJu0Yx3SzmaCadj8XJt+ML/RX3Cw10OezWxu2/Okte7SEt2rfCtyIkA
	c/Ij1XMnbsdB5RnCRJDBVcLT0aFsgjtcogL431UTuxQ67Kyc/uSZNX/F7yRH4QG9PfQCz/Zt8A4
	z7Qw=
X-Google-Smtp-Source: AGHT+IEh6NIFQ2Uyrzgy0aM64I6nu5g4sKURqj0IXaRCsh7nQfcAkDuLTIjmEAm4akfyGuourKpDww==
X-Received: by 2002:a05:6000:124e:b0:341:cd0d:b78a with SMTP id j14-20020a056000124e00b00341cd0db78amr1941742wrx.48.1714126108988;
        Fri, 26 Apr 2024 03:08:28 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a3-20020adffb83000000b0034b32e5e9ccsm11528726wrr.64.2024.04.26.03.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 03:08:28 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	christoph.muellner@vrull.eu,
	heiko@sntech.de,
	charlie@rivosinc.com,
	David.Laight@ACULAB.COM,
	parri.andrea@gmail.com,
	luxu.kernel@bytedance.com
Subject: [PATCH v3 6/6] KVM: riscv: selftests: Add Zawrs extension to get-reg-list test
Date: Fri, 26 Apr 2024 12:08:26 +0200
Message-ID: <20240426100820.14762-14-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240426100820.14762-8-ajones@ventanamicro.com>
References: <20240426100820.14762-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_030830_259906_DC858760 
X-CRM114-Status: UNSURE (   8.79  )
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
