Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC65EB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 22:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mFe0HiyirxuAXSkp/GotstQAV+9X9j4uMhj/jIKd3Tk=; b=1DhW8rsZDHfuZ7
	+9IGeLpnGiN5IzEwgTh46IdJu4RSm41c0Qeh+W0YXnY9rCrLtGxoen3EaRjW+0yfLXq9GjAyAUqrW
	GFFDsTMitQj9ytV3N4AGTiCWspeOoPLRaCY0ORH7Fzeoxr/ftpCSSsUs1tlhG3i/TZQ2HT/TfmlAb
	Pu/8DDRdY3n6anCx6MZ9qS9Yo5uqtLcgJUcTSe8wKF0yXxVY4w5fybymZjg0JoColOSL7LYd4QtQC
	38x5fvBxlEphd1IBsJwvkEOcNTWU5Kd1RUMuAF0836tgki/mwEal4EgtKFScUQKrcewZQ+3zL7xNY
	RzFgQ6OY3KvvlEl9h84g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJM8X-00G0gK-0X;
	Tue, 11 Jul 2023 22:47:13 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJM8T-00G0fY-2p
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 22:47:11 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1b9e9765f2cso16652175ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 15:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689115624; x=1691707624;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=RtH9FmNVb+GZQwIzxQc1bZ4di4brpl9MkUqFJmWCtvc=;
        b=a2eIKlTz8dhU4v0VoMbIdtxZYTNG1qd2Q61S2J+ik+8IsH0xI+hTEwF05curWxz7p4
         Tvq67dW2xZE6lwmgh7UCrnKOGqv0YjRmkMuhP7LsizU5bfIG3GjbZO+yZjQCW63SSk4W
         SCUR24lAYmeIHD2pLWiIkwBRFwEXtz/vdCHMvmWJ2eahUhHPk/3EsiDla25aVrtFkOD3
         en0WAIQ/oQgU6vOj2CNfVvQxqYJrjkMrAJ8YioLttR4kftfaJirT1WqE2nxuiV5+35gi
         d71TMwEMvAx18ydEqkdULZozZJY5idbMp6XX+aTZazpjY9Cszw4V2VuWCQEzh0CCsW8J
         0Pew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689115624; x=1691707624;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RtH9FmNVb+GZQwIzxQc1bZ4di4brpl9MkUqFJmWCtvc=;
        b=i3hzidlrGnA5rnqeuuxL8kg0NYC7sXAOuH6Or8Dgtz4gKJ740vQhHlPoCLa8nKFQa/
         UNWWVD4BSshHCOus38U0mUJsh7iopDih4uPHCkG5i7W05Bo914p5y/uPaUvvbrl0WRDp
         Pvqy7V0qgEy0jATH0JoJ5JcFG8umShbjWtrM8/yYX8Bt7hbAwcv61EgQnuhzkN4//r1S
         tjxlMW+EAI8xLisuOPglWXXlJRrgCx0LeWCq0GpMckQE8Kvbjmfijku5ogc4S7TIhm8k
         XI799fARNBGUjv5uo8GOum0nlocuqqoq5TQ1x5Gce75WxqoMR/+LCjbIy/577LqtJPhK
         mkmQ==
X-Gm-Message-State: ABy/qLYNSkApYYHu+iAMwKPWtcKX7IFWGzjLTAHIKyABr3yroNqfMttw
	GpeAoeWnxdgeWp+TCYB3j3ZU57Khptj+zuNi8zg=
X-Google-Smtp-Source: APBJJlGOTkndJ/ubNgA9o5A7E+MoK1VYx5vSzty7LtJIZ4yKJq6UfY4CgPD3o++V2ZI94wmOSnGF0w==
X-Received: by 2002:a17:902:e746:b0:1b9:ce7a:8603 with SMTP id p6-20020a170902e74600b001b9ce7a8603mr11204102plf.66.1689115623919;
        Tue, 11 Jul 2023 15:47:03 -0700 (PDT)
Received: from localhost ([50.38.6.230])
        by smtp.gmail.com with ESMTPSA id d2-20020a170902aa8200b001ac40488620sm2454762plr.92.2023.07.11.15.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 15:47:03 -0700 (PDT)
Subject: [PATCH] RISC-V: Don't include Zicsr or Zifencei in I from ACPI
Date: Tue, 11 Jul 2023 15:46:00 -0700
Message-Id: <20230711224600.10879-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: linux-riscv@lists.infradead.org,          linux-acpi@vger.kernel.org,
  Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Sunil V L <sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_154709_917950_56709001 
X-CRM114-Status: GOOD (  11.45  )
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

ACPI ISA strings are based on a specification after Zicsr and Zifencei
were split out of I, so we shouldn't be treating them as part of I.  We
haven't release an ACPI-based kernel yet, so we don't need to worry
about compatibility with the old ISA strings.

Fixes: 396c018332a1 ("RISC-V: cpufeature: Add ACPI support in riscv_fill_hwcap()")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/kernel/cpufeature.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index bdcf460ea53d..a8f66c015229 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -317,19 +317,14 @@ void __init riscv_fill_hwcap(void)
 #undef SET_ISA_EXT_MAP
 		}
 
-		/*
-		 * Linux requires the following extensions, so we may as well
-		 * always set them.
-		 */
-		set_bit(RISCV_ISA_EXT_ZICSR, isainfo->isa);
-		set_bit(RISCV_ISA_EXT_ZIFENCEI, isainfo->isa);
-
 		/*
 		 * These ones were as they were part of the base ISA when the
 		 * port & dt-bindings were upstreamed, and so can be set
 		 * unconditionally where `i` is in riscv,isa on DT systems.
 		 */
 		if (acpi_disabled) {
+			set_bit(RISCV_ISA_EXT_ZICSR, isainfo->isa);
+			set_bit(RISCV_ISA_EXT_ZIFENCEI, isainfo->isa);
 			set_bit(RISCV_ISA_EXT_ZICNTR, isainfo->isa);
 			set_bit(RISCV_ISA_EXT_ZIHPM, isainfo->isa);
 		}
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
