Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9C6C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 15:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AP9yH5RCPUJHUGqZ5oqsISMFyY52o1Nxdd2UkR0S8LM=; b=VcNU1GHzP67bH3
	wzQ9CYWkLRNBA7DFaIOGqK6y/VVDcj6oUrt4nCTD9iyYywKQdrKYymwzjT+U9v6XyNmH7sjLNgRFA
	wDaNLdXv+ccQh9uqt8+5zHVpO8azdcsxKdWpETVB2rSVePug0LcwyrRPxuyeQRNuJdQ/DJhjUMoYr
	iBPFb4bhrNssrht9nLC4t/KOaRi2QEWQlmablBDAPdgh3qACr43t/V6yq0ViH5RD0YzYhh3YgWoz2
	c3u3CQU4+jcH49kN2A/Fj7xOkEeNwPDcimpfW3sdD+WwKSze/onFDC3/EHfHBC2Ui+KB23IrFNYLo
	IPfsA1S85hTcGJCn9FrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD5s7-00ABsq-5c; Wed, 04 Jan 2023 15:40:07 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD5qG-00AAvt-TF
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 15:38:14 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pD5qA-0007gv-QA; Wed, 04 Jan 2023 16:38:06 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Ard Biesheuvel <ardb@kernel.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-efi@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH 4/6] riscv: Fix EFI stub usage of KASAN instrumented string functions
Date: Wed, 04 Jan 2023 16:38:05 +0100
Message-ID: <10490920.nUPlyArG6x@diego>
In-Reply-To: <20221216162141.1701255-5-alexghiti@rivosinc.com>
References: <20221216162141.1701255-1-alexghiti@rivosinc.com> <20221216162141.1701255-5-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_073813_026713_FD782378 
X-CRM114-Status: GOOD (  10.84  )
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

Am Freitag, 16. Dezember 2022, 17:21:39 CET schrieb Alexandre Ghiti:
> The EFI stub must not use any KASAN instrumented code as the kernel
> proper did not initialize the thread pointer and the mapping for the
> KASAN shadow region.
> 
> Avoid using generic string functions by copying stub dependencies from
> lib/string.c to drivers/firmware/efi/libstub/string.c as RISC-V does
> not implement architecture-specific versions of those functions.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

I think a similar change already went into 6.2-rc1 [0],
though it seems to leave strcmp in place in image-vars.h



[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=da8dd0c75b3f82eb366eb1745fb473ea92c8c087



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
