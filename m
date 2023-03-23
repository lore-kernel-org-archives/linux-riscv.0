Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15BBC6FD1C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 15:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F3n0ZckaFobdrkcZaCtJgMDvlM8OIV7ocDT5IEXfAgc=; b=DPQEVFBq5kwAFk
	p1RDaZ8oQBATPFZJJ7x/NC7i6bRGQRN5ZuXG2t2OZ/4pr/JF6EluFvSoQelzYJQWJvUBi0Qdru45Y
	Zj9B97QK+E+zGnqwuLLZb+sqvGj5WXVRztsKooi7xPhFBgHp09iPuiWBtZNEaYzyfm0dfOEXmphGY
	XRfs5mPLTqksP5dtYjVoKe016OwSbo4t3r9KQGYa/lRXPiEc3yUVHXgg7s7ISOemzY9Yw+MZBwWEH
	Ft+JrBNE6+k5AGwbEg0M0R+umJ/HSTbpJbWBDF/UQmjm4JUdTDkzueF/ks7mSzujjR2DRYOGEXKI/
	f1unERyJTEdhg/mx78AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMRi-002Hrb-0R;
	Thu, 23 Mar 2023 15:01:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMRg-002HqJ-2p
	for linux-riscv@bombadil.infradead.org;
	Thu, 23 Mar 2023 15:01:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BYoTKoh2oaNxCYlsCt/bFwPgHo97od34r6h8Ka1Tses=; b=YbYwpD6rQ2Tt+IvJnZyAUAQeru
	TMdEbbNTwCX15jyM4M+Fw6x6LPERowz8F2tR/TeqH/brr6OWUNfYl6BBD4KGU1lA5WDr/Bi3XkPMJ
	82Cj8Q41jIxvXVrIMSXz5SpNYBGmHTEX+sCajAyXfw0a7h7siQQRXzplP6iyxwtYelMxytJIVRIod
	t+zmxRdZsr/7f3YzMduEARzMT93EcQUGd4o8wl0531UNPLP8KsLHDzRjwMDoEfbe38M70FMtzMcYc
	rMtEQxxPB2pyW6nFUOzev+eJn05V44Vm/yvq4NSOCGpTCVuG3+2WPhcD3YPVQanA8PoGDmtOuhnKz
	3XWCO7SA==;
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMRW-004t0b-2Q
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 15:01:38 +0000
Received: by mail-pj1-x1035.google.com with SMTP id gp15-20020a17090adf0f00b0023d1bbd9f9eso2246136pjb.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 08:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679583684;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BYoTKoh2oaNxCYlsCt/bFwPgHo97od34r6h8Ka1Tses=;
        b=DqXgOrNCmgxCkO3fN35n3mAne+CXZvia4w/MJIDLeN/j4ng68vuqyGlut4wg/LgD65
         FMoBupViafdgAxEwWtpxM1jGxDs8Eq5TfJH39bZPjjy4XjPw6oJYMPdWqcNAI+Lr72a+
         z+vlDU1MLIVbrE25YIrwwYOY4qyhqpSTOjqrvVVUUjpmD5khBvkAhYAEQIq57s9yRQbS
         96R+DnB4++T9fg/aa+CjPJj+RhwLcORGIxw///qvNgt6pZ/tXodW9FicF4J3RR2Htfhk
         l+VMx+IsicS05FfKuYe/EDLu6mjD0IsUdCUPUuUOGxXWD0atth/9Uj3ugHrtUxbJOJ1S
         Ja4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679583684;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BYoTKoh2oaNxCYlsCt/bFwPgHo97od34r6h8Ka1Tses=;
        b=W3+9juq95fgwnsBJgEwJs5N+P1Z9dOm5L639J8QxWC5COUeRQidcWh1AC2qI0elvy2
         eLhiCIGoR6YcWohky79mu51rRARMNEgHcUN6IDNy8uuP+k/7v0FEe/sAMYen1kCySDwu
         xznXuVkA1K7n95z+1ekY6eCKK3dpbyP7b225DKS/zJRH8Si42KEutRa4dJ+1e/f/CSsv
         YR2K1EbMk6F2bvq5GAMaeqk3rf20h+AQZ/whFTYDqNk/CCXv2svvcEJJm8vbW8tIlWFb
         sAKzIZuciUKQiHznHKmJCESv0i51m/haAOPhDrQcvwkvffgVtzia+3ntXFHNhdQ3uVcC
         lXvQ==
X-Gm-Message-State: AO0yUKXwMWpnSWjpCZycRGgOVn7gotT4X5pveirUO3HbdnAlfZQ0zZif
	9629C8uu9BJgT6TqaHK6wmShbmK4OtjRifXaOxwRMA3edXdfoa2cfXp/NfxwdYgDEUg8SROM0Jx
	XDr4+5TSJkQBc+yepIbZupxJcEo5TiYF+cTMXnrginZ3G1tS7GWpULDTRZ5pP/uyi2cB4jDXW4E
	exzogKQ482mlp+
X-Google-Smtp-Source: AK7set/RqhPy57RVMl+b0k//9zMeEBHGG9QTpL++qz91v0jRmKZ3Kkxa9Cz2bI1AWk/Tldw55GeoLQ==
X-Received: by 2002:a17:903:288c:b0:1a1:9842:2020 with SMTP id ku12-20020a170903288c00b001a198422020mr5872275plb.43.1679583684117;
        Thu, 23 Mar 2023 08:01:24 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902854900b0019f53e0f136sm12503965plo.232.2023.03.23.08.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 08:01:23 -0700 (PDT)
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
Subject: [PATCH -next v16 19/20] riscv: detect assembler support for .option arch
Date: Thu, 23 Mar 2023 14:59:23 +0000
Message-Id: <20230323145924.4194-20-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230323145924.4194-1-andy.chiu@sifive.com>
References: <20230323145924.4194-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_150131_368586_353F65DE 
X-CRM114-Status: GOOD (  10.43  )
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
---
 arch/riscv/Kconfig | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 36a5b6fed0d3..4f8fd4002f1d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -244,6 +244,12 @@ config RISCV_DMA_NONCOHERENT
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
 
@@ -442,7 +448,7 @@ config TOOLCHAIN_HAS_ZBB
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
