Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5296AEE0AC6
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Feb 2026 10:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DWDAxtbnWL0SFHAEEt9udqgS6Mhqx8SOmHQ0Z+49Pq8=; b=GIQWWgen8xQxtb
	mbl4bQw/ekpDKyPgBylpR0Wkq6EveE9h86wqnEklNQg+aTAuVP43urJa0aUlQskW1MUaE8acQSQMX
	/wZOPKtp3DPl3yP089auDkrQNW5KBe5jVW0nein9dm6quGAM1SkyDEpRpkBDgcKDNOcQsMhXBQ8qE
	7h4/HfhCavfYdLsOdEIx76+7hGR0JoR7lHmGkXzqXFfUgUVhYPj2T/NLVTZVcGNl1/iFRw/UGLAAt
	hZy4WloXC6Ln/VQn82XMhQMoJ75zp/Nq3V0j8PpBm8iBSjC02uFckdnVcoD5JeoeJUB/Hme0EIVdN
	EY2LLHZr2v7ftd2ZBfFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofYD-0000000CKNX-2C8N;
	Sat, 07 Feb 2026 10:28:29 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofYB-0000000CKM0-48X0
	for linux-riscv@lists.infradead.org;
	Sat, 07 Feb 2026 10:28:29 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a8fba3f769so13294105ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 07 Feb 2026 02:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770460107; x=1771064907; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+8+8e2Muqu/Yew07HhgrpNy1KIqgEE5XsSJFOA8tRxU=;
        b=Gn+qlrajpyvgVKAvt5BnAKVRNbKNQ7s8EDmo4TpBDTUEaJPZtFSQbQOdEInvPwPI7E
         qaOj24VLlFH1hXDnokcUByOEL6fYjeVYScKw4lmWTgSVQB9QfsNFQMfUThhp0ufQOlvK
         PfRaN9ZzezIxM0jT2ML7SM36HBzmgPpGakNL5L0eM7VEgSOcLZ9yET7O6/gqk8s43mL4
         o2po4ULftwQQtfsmyK06j9tj6oRGw8wLHUg5k5aeKd4tn/CI5CPtQOj9/B+0TZo7LfX+
         HQxEVGWxYyy0z+KrW7x691MkSaHMjQWhS+mUV39ootlsTQvLot08Lcr3dC4Lti1VKSnZ
         CE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460107; x=1771064907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+8+8e2Muqu/Yew07HhgrpNy1KIqgEE5XsSJFOA8tRxU=;
        b=U7GJ9tzNUhtWTqZYvdy/D8v62v3pp/ZXwRSO2/aBzhfT9vtGiHlVSrlTT2MmBYtL+g
         IlzZLqMVKqxrerDL52YULDEgdv+nabu8Y6SDDAD6KHns3IFjx9dTBq7yzk7LzskYpXvl
         bU+ofFQVJwTcRv7Lp+rLX+UlmaTICH1U3xzEbRIhSXM7gmls9QJUDqbj9jDnnwVG5txG
         85zVll9plfwsCjKgPtuotf/hvQhj5p4SbqzEVCrtOqtyGSavtG2n2l+cQoL9R+ETmmWS
         A/hH+P3tkC2B73qW7d5nTPTp/KvHuAwYJEmKWE4b+JgtK72gPWw4W1a2o/UogK83iDbx
         3OoA==
X-Gm-Message-State: AOJu0YzybxFfnp/9m8Mz2QfGp+iur369JmEAdNRD+OCAq6XcaUgsBuQe
	PEqKUK2cYiuCbkQEMf5R2k5HY1APA9SCtZsnj3KimspT8ueOBU+ixBfKoUyywVNIaVY=
X-Gm-Gg: AZuq6aIpxAk1DKaP26Pmfr57o8xBSGiU+unwXAISgeDU0Cuv8sAUoHoQRxxhdHCilgb
	sRVUGKIRJGxzhns37GxfaipD3f1obQmmXUck/60blsya2WHtFaAb/uWstCCVe2nDGutbIOyTKFh
	I7ZAHLX52Wc4Dv36C3ZoplqckZV8RVSJXeI+r3zcYN6bGgGXyX0gDk8GHNDhMej5mA3N04YEqBW
	MNZFu3w6/uXD6Tj25YXDfpblUpws5GOadviRghYG7cHutq8pNUvpmgbS7DjDklyVfKKPgRWIl4f
	nbrmJxiwQXVwOcEAX6R7q3s8qt5gSvXadCCnSTw1VrsolOqsEU0VllpuB5Ri+SD8nDZAHN2by12
	6Wngtg+ICZX0vAAfcjTFrpV/4I6L3dgZ8liEtp0LSt97iCa3DSp6bSTDjh5Tq0ni3KtBazaHOu2
	9C6yoDXjXJUmvxlbt3fsM59vj0AyqsTfCbPyBYxbnUJN8fk7FSk71Q2w==
X-Received: by 2002:a17:902:ce09:b0:2a9:30d4:2b0c with SMTP id d9443c01a7336-2a951826630mr55155985ad.46.1770460107028;
        Sat, 07 Feb 2026 02:28:27 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951a638a1sm46516555ad.17.2026.02.07.02.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:28:26 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 07 Feb 2026 18:27:58 +0800
Subject: [PATCH 4/8] riscv: cpufeature: Add parsing for Za64rs, Ziccamoa,
 Ziccif, and Zicclsm
MIME-Version: 1.0
Message-Id: <20260207-isa-ext-parse-export-v1-4-a64d3a8bc20a@riscstar.com>
References: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
In-Reply-To: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_022828_030243_A640A451 
X-CRM114-Status: GOOD (  10.98  )
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

Add ISA extension parsing for four memory system related extensions:

 - Za64rs: reservation set size of at most 64 bytes
 - Ziccamoa: main memory must support all atomics in A
 - Ziccif: main memory instruction fetch atomicity
 - Zicclsm: main memory must support misaligned loads and stores

Za64rs depends on Zalrsc (or the A extension, which implies Zalrsc).
Ziccamoa depends on Zaamo (or the A extension, which implies Zaamo).
Both use dependency callbacks to enforce these requirements.

All of them are labeled as mandatory in RVA23 Profile 1.0.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/include/asm/hwcap.h |  4 ++++
 arch/riscv/kernel/cpufeature.c | 13 +++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 35e87e4a8475a9201e84e7f9f8a4d10dfd9e4759..5a050fae5302c7717596799967d8d514e7dfc536 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -114,6 +114,10 @@
 #define RISCV_ISA_EXT_ZICFILP		104
 #define RISCV_ISA_EXT_ZICFISS		105
 #define RISCV_ISA_EXT_SUPM		106
+#define RISCV_ISA_EXT_ZA64RS		107
+#define RISCV_ISA_EXT_ZICCAMOA		108
+#define RISCV_ISA_EXT_ZICCIF		109
+#define RISCV_ISA_EXT_ZICCLSM		110
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 68c94fe29cd1b26925fa38a5c877d699bbc88e25..fee5b20bb171334e8ca60af25485f43a9acef619 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -347,6 +347,15 @@ static int riscv_ext_zalrsc_depends(const struct riscv_isa_ext_data *data,
 	return -EPROBE_DEFER;
 }
 
+static int riscv_ext_zaamo_depends(const struct riscv_isa_ext_data *data,
+				   const unsigned long *isa_bitmap)
+{
+	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZAAMO))
+		return 0;
+
+	return -EPROBE_DEFER;
+}
+
 static const unsigned int riscv_a_exts[] = {
 	RISCV_ISA_EXT_ZAAMO,
 	RISCV_ISA_EXT_ZALRSC,
@@ -552,6 +561,9 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
+	__RISCV_ISA_EXT_DATA_VALIDATE(ziccamoa, RISCV_ISA_EXT_ZICCAMOA, riscv_ext_zaamo_depends),
+	__RISCV_ISA_EXT_DATA(ziccif, RISCV_ISA_EXT_ZICCIF),
+	__RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
 	__RISCV_ISA_EXT_DATA_VALIDATE(ziccrse, RISCV_ISA_EXT_ZICCRSE, riscv_ext_zalrsc_depends),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts,
 					  riscv_cfilp_validate),
@@ -565,6 +577,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
 	__RISCV_ISA_EXT_DATA(zimop, RISCV_ISA_EXT_ZIMOP),
+	__RISCV_ISA_EXT_DATA_VALIDATE(za64rs, RISCV_ISA_EXT_ZA64RS, riscv_ext_zalrsc_depends),
 	__RISCV_ISA_EXT_DATA(zaamo, RISCV_ISA_EXT_ZAAMO),
 	__RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
 	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
