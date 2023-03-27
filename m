Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28F0C76195
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 18:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vhBKiIqgwFHsxVlCUO/Mw4pJmRHll4ZZzdykVNlPcxQ=; b=H2qlP/giUFZVq4
	C0FTK9iWL3gSARz2481WYSUj3Z/sOZVrOJOBRzmC2WEXs4vmDHdM+yxOji46vt0RzEduCHAkqthjm
	WCG4INY2PRTtDVU4y/YNnSNai3JZc/3sImULDRFPJ8YMFZnXX22gPpDyRTBidwHEBim2Giwcxy3+W
	6eLhcmesgx6QjNv1S0RK2AMnWmzo7vD+0sLxnWq8HNsLcHc5sAAv2R6jDO3t2Ax37NItm4ejnFcFi
	GDh1GWpu3FoARGLZnH1jaQyoQGD1J0I2EeUwcu+w5N5k00mRp8KcmyIZ+YUcIigCrXl8ZOkxJj/Ih
	kNgpaTMaWJlfc2F14ybw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgr8r-00BybJ-3C;
	Mon, 27 Mar 2023 18:00:25 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq4H-00Blrz-0q
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 16:51:38 +0000
Received: by mail-pl1-x633.google.com with SMTP id k2so9000343pll.8
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 09:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679935896;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hiu59K4ph7SyXp7BjEwK3G+rRiskRbPrjMkudHH9DX4=;
        b=QWnMeMAw76FAwhzMn4Uk36MPSLQPpKRLeS1D4hpxe1nQ57onnoaHguOj3xxhq5Kfvt
         ir/sA5vm8f1ImqHe5Ks+zV+xx8hq9zAGrinmYJjeDY8aUxYBTDEavc+EAZPQ4UdO5WWa
         0cQTcJY5x1AWOh3mq5+NlFRWuJE5txhwbsrZjDnfD4ccWgTEKcJQH2oYnkm/43BloOZX
         Bd600p/EEEP4JgYIo+5zouODY+DAe0Lq1CGBd+7fdQ9ZEXmD3kjlufXKbllCGh8go4V1
         sw9QjsQ9spUli+b+1e5OyxhJKiv6+cXGqpp8epY6B3Uv/NXbaJIJJisVMtDIfpf0DIyz
         mhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679935896;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hiu59K4ph7SyXp7BjEwK3G+rRiskRbPrjMkudHH9DX4=;
        b=R3a89gJvXBYSNQl3P85OkAlXoPGThddN+chvl/3YbvaK3SggjGnnRGadijHB2asVvr
         m6F5aDNFXoB3kuYLmx72TVHtmb7U7HAbqxgdlyWmHkRTg6vK4tTOmO/mJIVMZakVN6//
         VzIWHTCc7ESdVqwrjcCrFbqeaNTpDg1D1x5pyoA//mQLQeusN+7HubWkzYrN4kR0rFwB
         lCVuO3NqEDhDc2uV4ZM4Xmdrp1RXIYVk63PP6XegafoaqhawJ1PI2EwJtpxj4wwuuaaM
         k0JT8wWJPZMayuWYshsFtW/WiJB9RcoNZSN35md8UiUx6ymVpeRqMRGvz2ksooB93RYB
         mWtg==
X-Gm-Message-State: AO0yUKVntymVL4l5PvnqHn2LeD0n4YSO1Ba159aNi9ruNdEVW5WlHFBX
	Tumpcb/b9LHyUunX4LZM3B9Jl0a77vmIHasBmyRZPRDqvcjD16gnDNFIUS6guXZeONNXjXZbPhV
	zvBz0Br3z6OgW2Ov4cF3GpxqgLGAwctVzAzhdXZFRssdr28Fjq9BwJq6AUFtwN4CXAfYjDn2rpT
	0bW7PjOEPkZM9D
X-Google-Smtp-Source: AK7set9+GC9+Bty6r5d7gOWAsOAU/walK7TMB8DnUDiKe6bQP+Vru5jrC6tUDELMN7f8lL3pTEuLiw==
X-Received: by 2002:a05:6a20:bc83:b0:d4:9fce:6c6a with SMTP id fx3-20020a056a20bc8300b000d49fce6c6amr11715440pzb.49.1679935896366;
        Mon, 27 Mar 2023 09:51:36 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q20-20020a62e114000000b0061949fe3beasm19310550pfh.22.2023.03.27.09.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 09:51:35 -0700 (PDT)
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
Subject: [PATCH -next v17 19/20] riscv: detect assembler support for .option arch
Date: Mon, 27 Mar 2023 16:49:39 +0000
Message-Id: <20230327164941.20491-20-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230327164941.20491-1-andy.chiu@sifive.com>
References: <20230327164941.20491-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_095137_316644_A3237427 
X-CRM114-Status: GOOD (  10.59  )
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
---
 arch/riscv/Kconfig | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d7252ced4ae6..91d5f2731f06 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -245,6 +245,12 @@ config RISCV_DMA_NONCOHERENT
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
 
@@ -443,7 +449,7 @@ config TOOLCHAIN_HAS_ZBB
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
