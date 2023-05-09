Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484DBC77B7C
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 13:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1GPLtW/TuHg6KoOshQ6ax3kZwDybZyRr1BYPdqVgRwY=; b=Rv6bTJL3JHBEdl
	qlvXofJxf4Mg5P8h9b5SGgbdyTD2YaUB88AYfjHb9QPSOQk8Yst4gbWp9WUFZ5fdBbrx2PIkO55lW
	ilh1QKYt4Y8OoGFmZD/MHqesUS0ag7iqOV1yFRV9D+MAp08CYpVGBh1Nkn7ThQ17tFdN8eIBTzJNm
	WdvPDcG+BZwoP1ngDYba4EPmkta9cOFZn3QYJ8E0YTrgyaZtvIOo9jNVr/P259CYbWqSTpdvX/KsY
	EVvXGDZucPRc1Me9LDqr9wefA2R4qfQlfbHy0xwltdSxl8/uQnLwdEOtkELfy/j4buU3Cy7yloQav
	D3sHwj2ASusPEVnxO41g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwMxV-003LtG-0J;
	Tue, 09 May 2023 13:00:49 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKes-002uaE-1k
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 10:33:28 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-64115e652eeso41451266b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 03:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1683628405; x=1686220405;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=otAeXCQ9wHQgYb9XVLjxDELtJAEuURMD8rtVKOhLCTY=;
        b=a9gJeRbmISiXvK9+ul3SdWxI8z70Xub/NyicER2OxvyXBKL8WAsFJ+NZKPU4fljCMg
         jEWPgHcpV+zQtBxAvfFc0rsrG0sq4TIjaUlrodvh0dfOo4QGlXqDcFGClwooFLaRg+iW
         f5Sea6jREl7x6Zk+llerqT3zNu0RJbFkfJow2/bAZ71mKI+rtbJWHdU+9dBVtKPfzhLH
         RfUQluZd74bWBzHBmIui7882fXj9GbBfCAuPdJ5MTXw4gTFPoDw0DaXiRulGAU9C4b6H
         fl9t9ICOqSmqf94z8fPDKhXmhLYrgX+d/g+8kGAd2ICbtYdaP/Y8K6/uZRPkW4UChHW3
         jTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683628405; x=1686220405;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=otAeXCQ9wHQgYb9XVLjxDELtJAEuURMD8rtVKOhLCTY=;
        b=XM1gz/N/dJN7mSllcCDqaJq3KRPKJZ3+sMbC7WEREgCEopz1X48+vBW5ZRxwRTE1iv
         48KnxQmAKs1v/m3a+wU+MoBCG2NQ/F9VgWCAT2jsG5rDRpPgXNx+pwG+wBeQbn9Y+zud
         WCuNvuIcZWsD1chd2PJgjz1DHEy+FT54YsnPGuUCwiLtbjw/NbeMwuBcHbexe2v3aLZo
         tfRGkfYqnpuwvJWUXVVEAdygLGvhNIWKXRXHUQKu2RGZWG0zub77cgSUOLhgW0Ck5Kc/
         65O09pzuUQupTlwQPzChIE3m3PhkGpCr0aE0edUgpZU3WZTryqvA4RBl4hxYPem9jVcH
         /Bng==
X-Gm-Message-State: AC+VfDxSWZtOZxZjAwdErb3lk3wCTkxSoZDODRVjDhv0S6pYjVSXBcd8
	rR7egRRT2TdNgmfXu/h/8WlARM4aBpAGqWHw2Dag1hEiyjqmYl/QxDG+wz/niaR3772dIPTuSmk
	2sU4K2gsJAnqZMEHGYS2r9RwOZe87DLHfPkcypQmUPWyTg3BsnhEYc3GBZwEL413WcJOHnL+d+X
	2+Hu6tP6OFTZF9
X-Google-Smtp-Source: ACHHUZ7GzqAZDpDxZD2SUwiWoansXVS+z1qNjyguAay5WAkNMAyCcaNR9ja+6NBQli6ZWMZZmnBJcg==
X-Received: by 2002:a17:902:da92:b0:1ac:94b3:3ab4 with SMTP id j18-20020a170902da9200b001ac94b33ab4mr2357313plx.27.1683628405463;
        Tue, 09 May 2023 03:33:25 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o11-20020a170902d4cb00b001a076025715sm1195191plg.117.2023.05.09.03.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 03:33:24 -0700 (PDT)
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
Subject: [PATCH -next v19 22/24] riscv: detect assembler support for .option arch
Date: Tue,  9 May 2023 10:30:31 +0000
Message-Id: <20230509103033.11285-23-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230509103033.11285-1-andy.chiu@sifive.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_033326_581425_51D4BE6D 
X-CRM114-Status: GOOD (  11.23  )
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
