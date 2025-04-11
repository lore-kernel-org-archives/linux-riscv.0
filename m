Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A122FC369A9
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 07:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0de0TFSWXGb5w5sVgt3rtKnSseHz0fJDkwMlErohnQE=; b=IKxVQ13rZA7XWW
	akEobHob0W4oBOtlK2i4+CTBYT0IehyW/Orj+5ugoXu3doE4Cr11d+/9q5QwgzY7rMUqc3/rEOA0/
	Qztif9D6pAwE7JgLOANIdfluqYJ8Dl3vCl5lYLxBrzLOqk4wRK9Ml7NuCc2d92HFDStT6srhVJpzs
	Sd/Wok0UJMMyNnz0BVimfcsTUvt+mUeKkE85+HAJoUSvz0szXE///PQoic5AyRhPPSbm6lRD0YHeG
	KCmpv9FkJ+zC8mmyuusC5MrI+qMaOn1qMjt7ScOU5ovUEhPj/k5v0+Y5jPrSio+CkyrWozdEty1w/
	jRsFkRM8j8Uk155HiX9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38qb-0000000CsLV-2v9o;
	Fri, 11 Apr 2025 07:30:45 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38n2-0000000Cr9m-0jFF
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 07:27:05 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-224191d92e4so16939005ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Apr 2025 00:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744356423; x=1744961223; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ENXPmp9Sy2IzNDd02W7czpvRgisjjQJ7XRFhqNoZ+g=;
        b=habtQq3x8XXOHz3G5CaIcbT3yIhruAV6qxejzOMWNPfY+FYNJECJ8+mCl2lTB0tFcq
         gIcu1+qWeOH7st+20yub5h88MO+N0e562UQw33fy17podQy/VppGA51ulvGBAjzk7gFf
         Fed/u0Z1vQ+GwQU47ooU1guJplE4YC/ScoyhDLkFvbnaIaJJXfKtDvuVkplLU1EoYZ/r
         8MJWYXRtWE/JuR3aX4Y8uv9m0ZNA6XPAxczWsVef1duEAW0cIVXJqTIljnw339bcYtx/
         I/DffZWlOBfLVOeyRZ7MWvGSd8DQ6WNbPQLBQgtQZsVQqPTF3M/oK5tW95GVXMSK/pFW
         M8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744356423; x=1744961223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ENXPmp9Sy2IzNDd02W7czpvRgisjjQJ7XRFhqNoZ+g=;
        b=k1qH2vVHbQX20agYS+XlgMVAHWFZx4JhJ+SyvExm4ABupLEqUnt7gdHLFJgGNVL50/
         JIsSLAivCcRiGCoz2SrGBwz9YIfFKSi02B+vDHg19h7nGUnBu41ESi+0xuO845mFgS1/
         pD0clhKfq4V8zdxbaO2VOJwXCkLK+Vy5SrjGFhPlCea2O0vzXd8Qo22HFeL02wTPVZt+
         1rdFxZJTdrsnYSoCgZn2ihfy9MLF6gVQ1B3O+s5r+LNN7cRq1JTkbLfWGVpx3+yaOL7g
         p2q5PmVeTm9GW8cKyNyDQCxrsFO5wVGkoq40GWDiPn8SCdNqi63r9+4SaOJwJEdD43Cq
         tx5w==
X-Gm-Message-State: AOJu0YzfIW6/yRBW26B08DZN9vGkM7Qj1woX8XX18Kp1b4MUuKypr49m
	rytOBRbssAgYYYoQsMqqbG8gW0eeDDPMcyvplZai7qVQvkTUlq4tVAAlcxehsEs=
X-Gm-Gg: ASbGnctNGYL6nBIygBgo8YTLvq3qlCMPFMwghTmSqH4NGiC3SpG0Ivr/C0Ep/mnURSX
	kBKV3L05Y0rGh8H7g4MX0XMevwv/C0aiGMzHWyaWos5GiXb/KGqRp4WHl/NSDmsFIA5b6GD/IJZ
	CB1/KFTkIqqVHw3TMYTNhf4r3XLa3IFoz7yiod9Tr+nBNb012af2ji3d0wIWf/amI6kDaS9P/pu
	PHOI72g+FkG0U79uQKJKkmHmIGB+Eq7EQtY2XVdHYC77sIRE14hOX3MMq8kLZVE/hBhGiO36pE+
	eklId+Uys+u7fSi+ro0zrvJBt1IoE31Ny2ta3Kue3dEiwRzTIsNW1Nf3yROJAhyjBp+8NyrPjf1
	8QQ==
X-Google-Smtp-Source: AGHT+IF6mn86yuiqI6kJMhDegTA4bq362CwYWfmUPLstVHdii8BaLlLtNTUJiV5Fpt/tDNcOxZpdgg==
X-Received: by 2002:a17:902:db0b:b0:224:10a2:cae7 with SMTP id d9443c01a7336-22bea4f666emr31781715ad.40.1744356423321;
        Fri, 11 Apr 2025 00:27:03 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b654adsm42523585ad.1.2025.04.11.00.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 00:27:03 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	charlie@rivosinc.com,
	jesse@rivosinc.com,
	evan@rivosinc.com,
	nylon.chen@sifive.com,
	cleger@rivosinc.com,
	zhangchunyan@iscas.ac.cn,
	samuel.holland@sifive.com,
	zong.li@sifive.com
Subject: [PATCH 1/2] riscv: misaligned: Add handling for ZCB instructions
Date: Fri, 11 Apr 2025 15:38:49 +0800
Message-Id: <20250411073850.3699180-2-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411073850.3699180-1-nylon.chen@sifive.com>
References: <20250411073850.3699180-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_002704_211018_0A5201AC 
X-CRM114-Status: UNSURE (   8.93  )
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

Add support for the Zcb extension's compressed half-word instructions
(C.LHU, C.LH, and C.SH) in the RISC-V misaligned access trap handler.

Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 arch/riscv/kernel/traps_misaligned.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 7cc108aed74e..d7275dfb6b7e 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -88,6 +88,13 @@
 #define INSN_MATCH_C_FSWSP		0xe002
 #define INSN_MASK_C_FSWSP		0xe003
 
+#define INSN_MATCH_C_LHU		0x8400
+#define INSN_MASK_C_LHU			0xfc43
+#define INSN_MATCH_C_LH			0x8440
+#define INSN_MASK_C_LH			0xfc43
+#define INSN_MATCH_C_SH			0x8c00
+#define INSN_MASK_C_SH			0xfc43
+
 #define INSN_LEN(insn)			((((insn) & 0x3) < 0x3) ? 2 : 4)
 
 #if defined(CONFIG_64BIT)
@@ -431,6 +438,13 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
 		fp = 1;
 		len = 4;
 #endif
+	} else if ((insn & INSN_MASK_C_LHU) == INSN_MATCH_C_LHU) {
+		len = 2;
+		insn = RVC_RS2S(insn) << SH_RD;
+	} else if ((insn & INSN_MASK_C_LH) == INSN_MATCH_C_LH) {
+		len = 2;
+		shift = 8 * (sizeof(ulong) - len);
+		insn = RVC_RS2S(insn) << SH_RD;
 	} else {
 		regs->epc = epc;
 		return -1;
@@ -530,6 +544,9 @@ static int handle_scalar_misaligned_store(struct pt_regs *regs)
 		len = 4;
 		val.data_ulong = GET_F32_RS2C(insn, regs);
 #endif
+	} else if ((insn & INSN_MASK_C_SH) == INSN_MATCH_C_SH) {
+		len = 2;
+		val.data_ulong = GET_RS2S(insn, regs);
 	} else {
 		regs->epc = epc;
 		return -1;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
