Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561B1C6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 08:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=czP/X0nevh2QTDiemFYL0KXrPAu4gDyTYzv2n0rGFyA=; b=vQ1PP6Bw6aOeyW
	OOYGyINHqAx3y6HK7rP++Vbe5z1sduvo80NQr4LbV55HeWq28LNJKpfFObt56dSqEu8G5G8GufBH7
	Gohnsl8e+fuqxIlvbyFUx6nJsRhhn9KnUpTSXMbwE/CcC5JeYbzMZQT9LbQwUGt7d/bn1D1MxeoF+
	CK3dMw+0n9JhbbfKyxufF/zN+CHX+c1mvbDbVL+tQf2chPHM8xaLMlC0Lx6Vd4eJ9zvvXIzWXfZyj
	TwdWcuDELDAuk6Bxp7OK/byCYGRweVq93H6/KHRqeINkTfsYZfOS23sFiErg/6Sr+lALOLirFaSsT
	+81yRXU9nLHTg5/kSWjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp2bZ-00000003h5b-2sLJ;
	Tue, 26 Mar 2024 08:56:25 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp2bU-00000003h22-0XUL
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 08:56:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A8D3C0009;
	Tue, 26 Mar 2024 08:56:11 +0000 (UTC)
Message-ID: <be1b8bb6-ae08-4173-9ce5-26f2acee5950@ghiti.fr>
Date: Tue, 26 Mar 2024 09:56:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: hwprobe: do not produce frtace relocation
Content-Language: en-US
To: Vladimir Isaev <vladimir.isaev@syntacore.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, catalin.marinas@arm.com,
 evan@rivosinc.com, nicolas@fjasle.eu, tglx@linutronix.de,
 samitolvanen@google.com, masahiroy@kernel.org, maskray@google.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 guoren@kernel.org
Cc: Roman Artemev <roman.artemev@syntacore.com>
References: <20240313085843.17661-1-vladimir.isaev@syntacore.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240313085843.17661-1-vladimir.isaev@syntacore.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_015622_428691_7E6ACEAF 
X-CRM114-Status: GOOD (  15.61  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Vladimir,

s/frtace/ftrace

On 13/03/2024 08:35, Vladimir Isaev wrote:
> Such relocation causes crash of android linker similar to one
> described in commit e05d57dcb8c7
> ("riscv: Fixup __vdso_gettimeofday broke dynamic ftrace").
>
> Looks like this relocation is added by CONFIG_DYNAMIC_FTRACE which is
> disabled in the default android kernel.
>
> Before:
>
> readelf -rW arch/riscv/kernel/vdso/vdso.so:
>
> Relocation section '.rela.dyn' at offset 0xd00 contains 1 entry:
>      Offset             Info             Type
> 0000000000000d20  0000000000000003 R_RISCV_RELATIVE
>
> objdump:
> 0000000000000c86 <__vdso_riscv_hwprobe@@LINUX_4.15>:
>   c86:   0001                    nop
>   c88:   0001                    nop
>   c8a:   0001                    nop
>   c8c:   0001                    nop
>   c8e:   e211                    bnez    a2,c92 <__vdso_riscv_hwprobe...
>
> After:
> readelf -rW arch/riscv/kernel/vdso/vdso.so:
>
> There are no relocations in this file.
>
> objdump:
> 0000000000000c86 <__vdso_riscv_hwprobe@@LINUX_4.15>:
>   c86:   e211                    bnez    a2,c8a <__vdso_riscv_hwprobe...
>   c88:   c6b9                    beqz    a3,cd6 <__vdso_riscv_hwprobe...
>   c8a:   e739                    bnez    a4,cd8 <__vdso_riscv_hwprobe...
>   c8c:   ffffd797                auipc   a5,0xffffd
>
> Also disable SCS since it also should not be available in vdso.
>
> Fixes: aa5af0aa90ba ("RISC-V: Add hwprobe vDSO function and data")
> Signed-off-by: Roman Artemev <roman.artemev@syntacore.com>
> Signed-off-by: Vladimir Isaev <vladimir.isaev@syntacore.com>
> ---
>   arch/riscv/kernel/vdso/Makefile | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index 9b517fe1b8a8..272c431ac5b9 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -37,6 +37,7 @@ endif
>   
>   # Disable -pg to prevent insert call site
>   CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
> +CFLAGS_REMOVE_hwprobe.o = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)


I did not find a way to remove those flags for all C files 
automatically, too bad. But then I noticed that we were the only 
architecture which does not check for dynamic relocations in vdso, so at 
least we'll fail loudly. I'll send a patch for that soon.

This should go into -fixes.

Anyway, you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


>   
>   # Disable profiling and instrumentation for VDSO code
>   GCOV_PROFILE := n

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
