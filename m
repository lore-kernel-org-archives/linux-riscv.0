Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE05EE0AC6
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Feb 2026 10:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=blNiz/YZJ1MHCuYznS72NQspJGUdpA2c2uJDtUwfTRY=; b=BkJ4YZhZ84he6d
	MC4k9W7ws25J7tRSChTJsXKlDnJLe8fPURTjCXjuSn9ALIya1/MmHiQuM65k9/Ye8BrJTZKJlABwa
	HowVuiT0V1tTZA9A+kvk1mTtHcA7Rs4kcM+sCKWvFzWbe5+22yyBbHFpoYjrU8YdjcxUc64OfnZnS
	jAJP8SXOQJ+8zwAMvpWp1t8hYLEp+af4okVqRk3k2gNWeId8yhKilE+gJqNoDPYjB/fDOeCvJzcdB
	0tko+DANMYyonQ5adBy/pXItKepTwFXSwCWnxBe17aYF4fRZ4c0LegvdHNUU/6iLrJ/iAtw2wEq7H
	LkpN0zfGbNc05vYUeBsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofYQ-0000000CKU1-1p0L;
	Sat, 07 Feb 2026 10:28:42 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofYO-0000000CKSC-00Vt
	for linux-riscv@lists.infradead.org;
	Sat, 07 Feb 2026 10:28:41 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-2aad1bb5058so2018035ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 07 Feb 2026 02:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770460119; x=1771064919; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CU5Aha03/+6mFH7XzcL+dyKhPjDRJyW+j5FgiEHyxWA=;
        b=hFlxDhvdoU590KjZT4qN45Zi9wVvis0ua/jU9NBUFK4nIE4J5NR04UeRtSaRFy4UAa
         6tMN1OxysTEQrax0Rx0QNYvxTbhKxJhATwJsBSBM3/rOhnHgz0XMtaaB96HZImqHsJl9
         wDKw6IK74PmRI1bDlBXIpSGOSKIhbjqwiBfjTci2Cp/zGsgFQ3tO5SCzJedJd3ttHfe7
         GHTC4OOGd5KYQuV9NtIV+nKU2gVydwKEBycZ6SGaNOxAY3InxHT2WgxNmWO5Mev0SGGE
         UfhCwhFBUHfEx/tuTfNtGRr9mE1hAtjARfaBSncuMId/pNY725Cc17Hxx04k1KOH4tKC
         7NsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460119; x=1771064919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CU5Aha03/+6mFH7XzcL+dyKhPjDRJyW+j5FgiEHyxWA=;
        b=WOpOlikY4xPVb/huEvMJE2hshu7doU1jqsS/eCF4lYVko3xOe+4kGoNXTaQulBLVcL
         MJuE5tMi6Y2HOVPo1BkKxc6dZ1+Ke/lcBYtwRPuXzkfsXGn+lLszcyNHGIiy3rdNSeN+
         Zn8wBLgHtPtcEzlx1D/xcGhk67V/gSP5BnASuPfpBJ5jMZTbywEKnWlOA6freWjuNnbN
         5hkdSkLL7Yu8AqJpvEP/HtT5JN1j6BgJb0PNnfUPkCCfhHDrU5S4epPFc91HsQibArmq
         yT3nBH7tcbiG29cUsh78+PMm73/NFcWWOUabZ5t9tuaCmZudsO9cuaTM40qvp0mzjDUA
         /rYg==
X-Gm-Message-State: AOJu0YyGrrZec2Qut6KG+04OH4LTSve/lLU5d2Rd936ZDEZyjL8q3+rv
	SRquweY7uB2e25J7FJ2zl8wFz32RkINGpbk6fXfOxUkWinOgPsH0tynyhQg12lsF9Rg=
X-Gm-Gg: AZuq6aIqbgWLNAaP6MjOAX2rln/6O6HXKucqfNvr6R7NbtmpZBcVYbi1GzY/UkCc2tL
	C12UJJN8xD5tE52aJL8c0zp7nj+v3BoZ+iku0vUvbxoV2SCUrkzIkSyo5hugscQLQEHshvLVaxV
	X5lcNNCH8em18YaHD6RkyQSRrzsorZuBVOiRTYGLX3LnEPr5/kbgRnRpPHG3PaEIC7xArNmaoqU
	UDDGy4kqtBpHTTQnWL1lo/MZdGWEeldqRvXPzSDp2AdTKEUcUVRUY1wII7h+OKrVxYa3gRuXt5W
	H7qYTtHOZvrNbctDiHYEEbopW6EfslS1n3c57PxAUjv59mSHZuB1SbM5rSuqMDHdsEqreF2HhL9
	3KMIxnFgdl4UsUxxD307Hb6JLXQaXSm/yMtiOaEjyE6myqqcDaCJv7w8a+Z9trN3AAD4u04j7yh
	IE9DnH4stL4EjOpNRGfVMbIs27HtSCl2O4OMI/K932+srF3Z2eZHEirRcrM05+SFyH
X-Received: by 2002:a17:902:da91:b0:2a0:c5a6:c8df with SMTP id d9443c01a7336-2a9516cd2fbmr58164775ad.21.1770460119068;
        Sat, 07 Feb 2026 02:28:39 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951a638a1sm46516555ad.17.2026.02.07.02.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:28:38 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 07 Feb 2026 18:28:01 +0800
Subject: [PATCH 7/8] riscv: cpufeature: Add parsing for Ssccptr,
 Sscounterenw, Sstvala, Sstvecd, and Ssu64xl
MIME-Version: 1.0
Message-Id: <20260207-isa-ext-parse-export-v1-7-a64d3a8bc20a@riscstar.com>
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
X-CRM114-CacheID: sfid-20260207_022840_049456_9971FB7F 
X-CRM114-Status: UNSURE (   7.85  )
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

Add ISA extension parsing for five supervisor-level extensions ratified
in RISC-V Profiles Version 1.0:

 - Ssccptr: main memory hardware page-table reads
 - Sscounterenw: writable enables in scounteren for any supported counter
 - Sstvala: stval provides all needed values
 - Sstvecd: stvec supports Direct mode
 - Ssu64xl: UXLEN=64 must be supported

These are simple extensions with no dependencies.

All of them are labeled as mandatory in RVA23 Profile 1.0.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/include/asm/hwcap.h | 5 +++++
 arch/riscv/kernel/cpufeature.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 5a050fae5302c7717596799967d8d514e7dfc536..75f64f5b7355db6ea5218f544ceda3be9619a58a 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -118,6 +118,11 @@
 #define RISCV_ISA_EXT_ZICCAMOA		108
 #define RISCV_ISA_EXT_ZICCIF		109
 #define RISCV_ISA_EXT_ZICCLSM		110
+#define RISCV_ISA_EXT_SSCCPTR		111
+#define RISCV_ISA_EXT_SSCOUNTERENW	112
+#define RISCV_ISA_EXT_SSTVALA		113
+#define RISCV_ISA_EXT_SSTVECD		114
+#define RISCV_ISA_EXT_SSU64XL		115
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index fee5b20bb171334e8ca60af25485f43a9acef619..fff35a3e85db70f5610df2667f2b4f45f091cb2b 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -643,9 +643,14 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_supm_exts),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
+	__RISCV_ISA_EXT_DATA(ssccptr, RISCV_ISA_EXT_SSCCPTR),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
+	__RISCV_ISA_EXT_DATA(sscounterenw, RISCV_ISA_EXT_SSCOUNTERENW),
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_supm_exts),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
+	__RISCV_ISA_EXT_DATA(sstvala, RISCV_ISA_EXT_SSTVALA),
+	__RISCV_ISA_EXT_DATA(sstvecd, RISCV_ISA_EXT_SSTVECD),
+	__RISCV_ISA_EXT_DATA(ssu64xl, RISCV_ISA_EXT_SSU64XL),
 	__RISCV_ISA_EXT_DATA_VALIDATE(supm, RISCV_ISA_EXT_SUPM, riscv_ext_supm_validate),
 	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),
 	__RISCV_ISA_EXT_DATA_VALIDATE(svadu, RISCV_ISA_EXT_SVADU, riscv_ext_svadu_validate),

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
