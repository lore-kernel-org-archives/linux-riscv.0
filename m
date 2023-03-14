Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7159C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 13:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajf9Oun3YdnWGzdFP1M62HONk/blMLSN7D/fg3acTCI=; b=cNpDbrT5HFnrXF
	CX/43bX/rI3Y/psPzoyLoNfKKyJaCyH1mV8xoHAqQJmeugQSdDUlanq5tGczqFG2UtFPwi0mb0cCY
	0x2R51pibKoNsePq6KvjSNLpnrMTiRc+sGkm1LUBYXkRJN1xpGLQ5rgPjqrfysOlUr/0DF4g26oVC
	HiXcKlX3rihjPgchmSvN1FHCe+AACPC6qjW4PUxrWEx3VSGXlW0EO+pmYxkbmPcaPRNSktOnvMhA/
	ISOHvHJ4llpjsjXvbmPX/XHxuJ7djNIev99BRIc4L8aEGzckuW2UXoSka6IS9KQdWJFtAfQ5BISUz
	ILVpU/vSsS9XSeH7xxeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc4kJ-00AJAh-2t;
	Tue, 14 Mar 2023 13:31:19 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3] helo=gandalf.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc4kF-00AJ88-2z;
	Tue, 14 Mar 2023 13:31:17 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PbZD96Sf2z4x5R;
	Wed, 15 Mar 2023 00:31:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1678800666;
	bh=RWpQH91z9oCPCV7UgB1VjeBlCalvsZzq/D68BsBI0Ww=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Gmi2DLvR7FFuYEzpwxyajVFJgqqPUe+t2SrIuwdBqzYcgbPpV3TLjtx3waxpWL6PS
	 Tlm2qgbZO6FByZBDH6vF20yDA6dWo8oqnebJk3mUZNrFfgeS07oV/YOl+wQ/pjVzZu
	 NwgdFlLy64biV7j4n9vGCDKf7dkUIoM/W/PbkbUt8GCcCNGFWLT03R3isUmlhyjLoN
	 z+e+Uak4GXq1yhQ7L0Ld0I2uWeJ7ZdLzkVARLCWcim1o6ZC2zU4FnwLI9WmUPUXLXt
	 pck/4eDZ5TqTFY6UejLoZnpTjGPIH2V00sS3IcxUEmiEM4sMhD557XPpadOlNh7qRi
	 JJdlXEA0IptgQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Fangrui Song <maskray@google.com>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Andy Lutomirski <luto@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-mips@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Fangrui Song <maskray@google.com>
Subject: Re: [PATCH v3] vdso: Improve cmd_vdso_check to check all dynamic
 relocations
In-Reply-To: <20230310190750.3323802-1-maskray@google.com>
References: <20230310190750.3323802-1-maskray@google.com>
Date: Wed, 15 Mar 2023 00:28:53 +1100
Message-ID: <87jzzjo416.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_063116_364682_809F2E0D 
X-CRM114-Status: GOOD (  11.02  )
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

Fangrui Song <maskray@google.com> writes:
> The actual intention is that no dynamic relocation exists. However, some
> GNU ld ports produce unneeded R_*_NONE. (If a port fails to determine
> the exact .rel[a].dyn size, the trailing zeros become R_*_NONE
> relocations. E.g. ld's powerpc port recently fixed
> https://sourceware.org/bugzilla/show_bug.cgi?id=29540) R_*_NONE are
> generally no-op in the dynamic loaders. So just ignore them.
>
> With the change, we can remove ARCH_REL_TYPE_ABS. ARCH_REL_TYPE_ABS is a
> bit misnomer as ports may check RELAVETIVE/GLOB_DAT/JUMP_SLOT which are
> not called "absolute relocations". (The patch is motivated by the arm64
> port missing R_AARCH64_RELATIVE.)
>
> Signed-off-by: Fangrui Song <maskray@google.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com> # for vDSO, aarch64
> Tested-by: Vincenzo Frascino <vincenzo.frascino@arm.com> # for aarch64
> ---
> Changes from v2:
> * rebase
>
> Changes from v3:
> * Add a comment before `include $(srctree)/lib/vdso/Makefile` in every touched arch Makefile
> ---
>  arch/arm/vdso/Makefile            |  4 +---
>  arch/arm64/kernel/vdso/Makefile   |  4 +---
>  arch/arm64/kernel/vdso32/Makefile |  3 ---
>  arch/csky/kernel/vdso/Makefile    |  4 +---
>  arch/loongarch/vdso/Makefile      |  4 +---
>  arch/mips/vdso/Makefile           |  4 +---
>  arch/powerpc/kernel/vdso/Makefile |  2 +-

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
