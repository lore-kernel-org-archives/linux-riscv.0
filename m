Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70AAC7EE24
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 16:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1GPLtW/TuHg6KoOshQ6ax3kZwDybZyRr1BYPdqVgRwY=; b=bK6Z/Cx/7+hOKd
	v2BJi33iYvPSxwwVdMdjijpgnpT5/msgVt1MIq1foHJ3klpbeKRW/5JWhTJWKDY9ZJuzguTARnSmm
	R+8XG6eXHlqrWvvZM11q1GY8GBFdzZHGVR3zM+249A+v2yV71ktE2TNDiQROkIQEfqL4S8pQNiGOf
	EoGlTE1TL4EYLa2Aj99g+8Hk+8QDK3yCD8EEUmCj/NKaBuDHydUCj1AXS67m51dpfiljguZfEQ7W8
	FXxGb/XKQAogCoGa3qcGEoc/priACzEU5S+XzP0J2by0BbNoxbU4JtyV4rvkU1Ty3vHcX8bmB22c1
	IRiPn0rYSKfeqhJMTOUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6DFd-00GAMo-0L;
	Mon, 05 Jun 2023 16:40:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6DFb-00GAMB-2W
	for linux-riscv@bombadil.infradead.org;
	Mon, 05 Jun 2023 16:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=otAeXCQ9wHQgYb9XVLjxDELtJAEuURMD8rtVKOhLCTY=; b=eEE+gJJaO1xwAl+Rr+UDC6ag0I
	qyoB/RRbS1HZBWVqWKiYNtZA5tIKtOE3o0W4wTPoPWvXeBMbSFY2m0NX/Ni8XCSjJ3dzcRbnD578b
	xrknlrqfIuVk9F3U0AO09n/NjOdSn52EXXigLTtu1l7WkEjb2HaDSyi3Zcr2Mmk34FXlWdCciHOo1
	SD9MUScAbKt5srS8mjBbUBPyVw4IJ6OgKCB6Ip13fINfYha5cKPWLJoEqpqOcx8vzTrvE2TZB4SwO
	dV6VwtMMwFlETwWvjf+bOkudg4lfZL5u6wBIhwAFomE8GKIB8rq2Rz2Ty76iRh2Z81qOGXnfwpcPl
	cSTTjiCA==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CLN-003OKH-0D
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 15:42:07 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b041ccea75so25803735ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 08:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1685979723; x=1688571723;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=otAeXCQ9wHQgYb9XVLjxDELtJAEuURMD8rtVKOhLCTY=;
        b=GICIV0NT3It7ucO3UJ2gZ3jwWoXXmy+OwT1H5NbInsfp5nA4wkafaRhlHFTstvSRBh
         HrgwpW4h5xWhdHU5ITjegRyaHLqfW/L89qevzwb/bAUBVlOWqU/GD9cTUDJw+9R0DgPD
         ZNa/KLi6O4dbI/4ZDzUkMkfn4AfssCHHZJ5Pm0FE7BbjdNhDoxhx+H7EdiUDcz9LSAWr
         byidMK6H48ZqoRk44q3djMvlCoVRFxk+nACOTzIASAunp7MtsAYRVcijCCZK1YtiHUlK
         24/fRBlKkn6Tztjd2kjYHpbXuK6mIt/MK7OyBI9bq1b05GLmBZ8siaMHqDSlmWIZ5sL4
         dDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979723; x=1688571723;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=otAeXCQ9wHQgYb9XVLjxDELtJAEuURMD8rtVKOhLCTY=;
        b=cO6uCNQG5u8TP87maIx+/QZKeJDgvL46cgk1b/obhlRFAuaXDE9uo5Vup0ElmTE2nD
         Ry8Kh9Vn0eWuRkoglwtOGsb3xq8Mzhv7Y0RB0JvyUDSNrkWi15OpeGtHrCzc/95ARCmI
         fEjsyjxq02Upj0TTv7azOShG8faJZjn98up/zuWGSP9cb0wJKa62fKnapXLN88QLIscs
         XSUKoD4qtmSqTBoFh1grchEKUUxRgr7QEufBqSL+4MPi/wYSOB2bLUL6keAL1lvV/n/C
         m9Sa4X6/qKJ8SXOVWdFyuuqKhzURaGX+ZiED0OXh6ayhA4rAhXTuxS/5KINE7nHMejId
         IubA==
X-Gm-Message-State: AC+VfDyNPgQuKKvNehJkZynZJbzC4TNmFVA8kTNn3de7qaydDKg3F4dN
	En4e7+wmWq5eFX4ZoEEcSXDpqVr8+mBXUoGJfJ0a4Yed548SmHpgCgsYYRp8lBTSKZFFYXurIFs
	kXaaFnBOK0EAI1eyW1tPMYVCkvgoI8WqIrAFf6ZIZgHXZa1V0qWTqGXjQURGWehZ5CkJPMXM3iK
	Nz2La4G1AOHZSkbcQ=
X-Google-Smtp-Source: ACHHUZ43cS6OalvTGtWBOXIW7qcclVUVLOPKWYSft4n7VdSMybpc1v45G04KlhkE9QfwM2PE1BpY6A==
X-Received: by 2002:a17:902:7008:b0:1ab:eee:c5d7 with SMTP id y8-20020a170902700800b001ab0eeec5d7mr4014641plk.48.1685979723069;
        Mon, 05 Jun 2023 08:42:03 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id jk19-20020a170903331300b001b0aec3ed59sm6725962plb.256.2023.06.05.08.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:42:02 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Subject: [PATCH -next v21 23/27] riscv: detect assembler support for .option arch
Date: Mon,  5 Jun 2023 11:07:20 +0000
Message-Id: <20230605110724.21391-24-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230605110724.21391-1-andy.chiu@sifive.com>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_164205_282848_30106911 
X-CRM114-Status: GOOD (  10.47  )
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

Some extensions use .option arch directive to selectively enable certain
extensions in parts of its assembly code. For example, Zbb uses it to
inform assmebler to emit bit manipulation instructions. However,
supporting of this directive only exist on GNU assembler and has not
landed on clang at the moment, making TOOLCHAIN_HAS_ZBB depend on
AS_IS_GNU.

While it is still under review at https://reviews.llvm.org/D123515, the
upcoming Vector patch also requires this feature in assembler. Thus,
provide Kconfig AS_HAS_OPTION_ARCH to detect such feature. Then
TOOLCHAIN_HAS_XXX will be turned on automatically when the feature land.

Suggested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/Kconfig | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 348c0fa1fc8c..1019b519d590 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -262,6 +262,12 @@ config RISCV_DMA_NONCOHERENT
 config AS_HAS_INSN
 	def_bool $(as-instr,.insn r 51$(comma) 0$(comma) 0$(comma) t0$(comma) t0$(comma) zero)
 
+config AS_HAS_OPTION_ARCH
+	# https://reviews.llvm.org/D123515
+	def_bool y
+	depends on $(as-instr, .option arch$(comma) +m)
+	depends on !$(as-instr, .option arch$(comma) -i)
+
 source "arch/riscv/Kconfig.socs"
 source "arch/riscv/Kconfig.errata"
 
@@ -466,7 +472,7 @@ config TOOLCHAIN_HAS_ZBB
 	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbb)
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
 	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
-	depends on AS_IS_GNU
+	depends on AS_HAS_OPTION_ARCH
 
 config RISCV_ISA_ZBB
 	bool "Zbb extension support for bit manipulation instructions"
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
