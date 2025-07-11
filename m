Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB89AC83F22
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 14:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1diA3qIYV57+v8YPa9XZ4Z+nIofosT2LXlSIUBW75gI=; b=L2bxANCuKmxbyc
	X1fmROVBZsss0S8j9nxhsDBsY4J+LeRZ2bh3jK187pNc/hgjdeTqb84YTtOpgDCUcQ7//KvUNZsUD
	bWogNiVdFctfmZ14ANWNY0jRhKTTimt9iXi5UOp4kdsHC9fDUtic3IYMOwpuiubhclE7mwI/tq7WP
	nRLVSNXiCZbGFEVwbM/OjHrrHH/opkGy8JRQSknlrdDTVtLJYQ607HCdSE7lMYox4i7+z6h39MQYl
	Yibq8J4SdgoAoLBAzNhILVMuttSZxE/furax4Y29AqGhzHX/dBwi8YxEvAXQeBQ9SK724Ha4IodbO
	zW1LTCGECwQjBDvJ1AVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFDZ-0000000F5v0-0cGa;
	Fri, 11 Jul 2025 14:59:17 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaE7q-0000000Ewsq-0oXK
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 13:49:20 +0000
Received: from localhost (unknown [210.73.43.2])
	by APP-05 (Coremail) with SMTP id zQCowAAXq1tWFnFoLswUAw--.18300S2;
	Fri, 11 Jul 2025 21:49:10 +0800 (CST)
Date: Fri, 11 Jul 2025 21:49:09 +0800
From: Jingwei Wang <wangjingwei@iscas.ac.cn>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: alexghiti@rivosinc.com, Nelson Chu <nelson@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Stop considering R_RISCV_NONE as bad relocations
Message-ID: <20250711134909.GA73430@iscas.ac.cn>
References: <20250710-dev-alex-riscv_none_bad_relocs_v1-v1-1-758f2fcc6e75@rivosinc.com>
 <mhng-7CDAD4A1-707B-4ACE-BAF0-643C281B9AD7@palmerdabbelt-mac>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-7CDAD4A1-707B-4ACE-BAF0-643C281B9AD7@palmerdabbelt-mac>
User-Agent: Mutt/2.2.14
X-CM-TRANSID: zQCowAAXq1tWFnFoLswUAw--.18300S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCryrCFWUXF1UJrykAw4ruFg_yoW5uF43pF
	W2kw10kF1kCw18XrnFq3W0qr409an5Kw4fWFy8WrWrZ345Zr1Iqrs3K3W3XF9rWwn3tr4F
	va1akr4kJF15AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkEb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26F8l6FkdMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUtVW8ZwCY02Av
	z4vE14v_Xr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07b5nY
	7UUUUU=
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: pzdqwy5lqj4v3l6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_064918_590929_CF4F2231 
X-CRM114-Status: GOOD (  26.27  )
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

Hi all,

On Thu, Jul 10, 2025 at 11:43:00AM -0700, Palmer Dabbelt wrote:
> On Thu, 10 Jul 2025 01:34:31 PDT (-0700), alexghiti@rivosinc.com wrote:
> > Even though those relocations should not be present in the final
> > vmlinux, there are a lot of them. And since those relocations are
> > considered "bad", they flood the compilation output which may hide some
> > legitimate bad relocations.
> >
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >  arch/riscv/tools/relocs_check.sh | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/tools/relocs_check.sh b/arch/riscv/tools/relocs_check.sh
> > index baeb2e7b2290558d696afbc5429d6a3c69ae49e1..742993e6a8cba72c657dd2f8f5dabc4c415e84bd 100755
> > --- a/arch/riscv/tools/relocs_check.sh
> > +++ b/arch/riscv/tools/relocs_check.sh
> > @@ -14,7 +14,9 @@ bad_relocs=$(
> >  ${srctree}/scripts/relocs_check.sh "$@" |
> >  	# These relocations are okay
> >  	#	R_RISCV_RELATIVE
> > -	grep -F -w -v 'R_RISCV_RELATIVE'
> > +	#	R_RISCV_NONE
> > +	grep -F -w -v 'R_RISCV_RELATIVE
> > +R_RISCV_NONE'
> >  )
>
> I'm not super opposed to it, but is there a way to just warn once or
> something?  It's probably best to still report something, as there's likely
> some sort of toolchain issue here.
>

I think Alexandre's approach is ideal from the kernel's perspective.
This doesn't really seem to be a bug; I see it more as a case where the
toolchain's handling of R_RISCV_NONE doesn't quite match the kernel's
expectations.

I found the large number of R_RISCV_NONE relocs only appear in the final
vmlinux. The key difference is the kernel build's --emit-relocs flag
and the *(.rela.text*) directive in vmlinux.lds.S. This combination
forces all relocation entries, including those marked as R_RISCV_NONE,
to be written verbatim into the final vmlinux.

I traced this back to BFD's implementation and found that during
relaxation (e.g., when an auipc+jalr is optimized to a jal), the linker
modifies the first reloc slot to R_RISCV_JAL and marks the second,
now-useless slot as R_RISCV_DELETE. In the cleanup phase, to prevent
reprocessing, BFD then changes the cleaned-up DELETE marker to
R_RISCV_NONE. This is how, when the kernel specifies --emit-relocs,
these R_RISCV_NONE markers get preserved in the final .rela.text section.

To truly change this, it seems to depend on whether the binutils
is willing to add a stage to clean up these harmless but
useless markers.

If possible, I was thinking we could perhaps iterate and remove the
R_RISCV_NONE entries from .rela.text before the alignment pass.

But if there's no agreement on the BFD side, Alexandre's approach still
seems correct and aligns with the psABI, where R_RISCV_NONE has no
operational meaning.

> Also: if you can reproduce it, Nelson can probably fix it.  I'm CCing him.
>

Reproducing the issue is simple: you just need a call instruction to
create a relaxation opportunity, then link with --emit-relocs and a
linker script that includes *(.rela.text*). :)

For convenience, I've put a minimal, self-contained reproduction case
here: https://gist.github.com/Jingwiw/762606e1dc3b77c352b394e8c5e846de

> >
> >  if [ -z "$bad_relocs" ]; then
>

Reviewed-by: Jingwei Wang <wangjingwei@iscas.ac.cn>

Thanks,
Jingwei


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
