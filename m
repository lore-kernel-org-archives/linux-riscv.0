Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADD8C77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 17:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1GPLtW/TuHg6KoOshQ6ax3kZwDybZyRr1BYPdqVgRwY=; b=JWyB9oZGTa18LO
	ZsvumXVg3ZrR4YLvYgv18TsVjgp8LqKq4mLBM6ozQnO7rMTG8xPhe0pkYN2N2HfXuobBJQ8iuA1hc
	/PMEnNdjkdLW3S/Bsbt6wImJQBal01VpC0K5QrOpTuMU737xo2hF3k0Q5QzdWpy+4qSpS6hiL30MO
	tYPJVolMihJKT/a2XxThIIgs5NGQK00EvECSMU4iymrX/xqy4vddWiXg8j/y+WggphyzCqMH6eb3G
	xSRPD29N1IaHQhVPZXHDh57lTuCi/JKvqGEZC7GmtY9fSaicFMB+Hc/Ohh7eg1naD/Fe9PJBkwlOF
	eWqIlsSm4IpGjOauKFUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzhSk-00De4x-0d;
	Thu, 18 May 2023 17:30:50 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgOX-00DRoB-1P
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 16:22:26 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-64d2c865e4eso117524b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 May 2023 09:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1684426944; x=1687018944;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=otAeXCQ9wHQgYb9XVLjxDELtJAEuURMD8rtVKOhLCTY=;
        b=D/9sOFm0nUPg7worQhPCe8AEkybdsphU5jCDpgLdO9TLPPtzwMLnHN4CNVbP429e3D
         eULZY3lyqSOBA1qyH0PHY7QdZLNl777TdCjPBf1rE74ioqjMdTXrdFsVY8DvG+GbMSOD
         Md4+ngoAXRWb9Qg3zYkRZa7wl7u+CQYE9+Df8UAb09fw6XXjdBAqgFHk2VNMiWrDCgEE
         byFdEbpAzIt1KIR2OsmKXQRjz/sTGjLSoWvBSh+x0JH8Ag3df79t2YgbZdahgQMMoKlS
         GtiUQBhjGH9oPM/6XGYQ8dkfVFRqub3su28Hq5uY8n/6k2vchxT1eCdiAdkgwCUZjeab
         Tylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684426944; x=1687018944;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=otAeXCQ9wHQgYb9XVLjxDELtJAEuURMD8rtVKOhLCTY=;
        b=Jq88GikXVcUlHLnunybG5ku5v5dYdDqv6N6c4Vph8BZnQGwW91L5HuQbbK54M8SbGD
         Z+dJJfIw/V5PPxSQ3+1DTOML3LClASHInwwasSHLtHyGeZ9Wsx6lNvm5iMQ5JZcYGKDI
         7CnKoYuyyCDNtorwA8aGtTazYCEvMeCVbOD4mwXYXLAcQTfOLVGx4K7SeSO8jo8lk9l6
         4upbtlcvSjEZYe3s2ISksp+LqSZoT4ic2eDQCH2vVWVXK2Yqf9X1FGUWrcm3999ZEdbv
         u9JQB4sR7TAFTcKapy98ZQk0JP3gEIkM3o8OUe0byS2GStd4OqD0OREd9GtjKYLLq4Hc
         FKnQ==
X-Gm-Message-State: AC+VfDwn4E/cCYv9eb0RG5vEhvgmJCYuKiIMEZJc4p2evRj6NNcxBOjb
	IoJ0340yWGHVZr3hj8gcoONoqzWNNytEPxFXrRJ7KigxNH71EEH9gytE2DwvVVIDNLmlwr20KaK
	il+0cyACddbCSIo9z/YqHYPunRG0338A3vB3QuqUCCKyMPTYt5dWJz8FN/l0qmOO6U48+PwWGZL
	a7FX19LmR1wu8IGS8=
X-Google-Smtp-Source: ACHHUZ7Wb2l5IYTrIfdDslfKAs+d+oKUxRkxvubNrCroZUnDUOrovMWjksdkc3+3iJAItG2BSv0b0Q==
X-Received: by 2002:a05:6a00:1acd:b0:63b:6149:7ad6 with SMTP id f13-20020a056a001acd00b0063b61497ad6mr4711081pfv.34.1684426944416;
        Thu, 18 May 2023 09:22:24 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id x23-20020a62fb17000000b006414b2c9efasm1515862pfm.123.2023.05.18.09.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 09:22:23 -0700 (PDT)
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
Subject: [PATCH -next v20 22/26] riscv: detect assembler support for .option arch
Date: Thu, 18 May 2023 16:19:45 +0000
Message-Id: <20230518161949.11203-23-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518161949.11203-1-andy.chiu@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_092225_474881_5E80A8A1 
X-CRM114-Status: GOOD (  10.61  )
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
