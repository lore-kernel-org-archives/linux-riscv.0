Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34370C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 15:55:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFC6860F50
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 15:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DFC6860F50
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3QcX3lv3a4fWo6ofrwYt6+tskvYl8ueTdHV8DX+tyZc=; b=syWzg24aFjO74X
	mQzt4Ziuk4d53XrRkDxZE+pHdIEdPUQ1mYxuiBM33PKz5vh8+nFOgPKpGENOoF4ZTCet61SmCgjvx
	JhiSNq+xu6BSlTEq9aIMgiVWSStu0PghWURqqWZGQwJQgl45NeZKww4JlcS4v/71VdwSXlbZTUTPk
	rOrwPPnbqteis/xVmAbyfvezf5QB9nlIFX0m42ycr0JME1bjim+kNepz7Abk8R7MK2ZuHr3rL1RGE
	MV1fNtWaiERptoxUXbqE667oqxdehEc3dZ/mGwxMW5rce27CzOWS7ie3BSAlpftdT0MPV0RO/du2B
	bax2r/XxolZo8JqQylcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdaP8-008FM8-Jl; Thu, 21 Oct 2021 15:54:54 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdaP4-008FKN-Hz
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 15:54:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=nuk5wXVWvlScj8F5cNPxIBfqcFgRzo61uL
 st2AhOA9s=; b=ti8/dSwsWZPp5MGojDCDoNAbRjvSB5msWSpS7fteEpfK7agBTp
 A9M4OwUUxT/c7093nJy6NBNn5FbvMNqjtiaWkrrxp5537xwtuRSTG9zQzZvOxwrp
 saoqhf6HBB94kqdw/Ni9rOg3ldNOiDxt7ygvRdia08mY60RuDcJQPfMk8=
Received: from xhacker (unknown [101.86.20.138])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygD3+UkijXFh+oJcAA--.16862S2; 
 Thu, 21 Oct 2021 23:54:10 +0800 (CST)
Date: Thu, 21 Oct 2021 23:47:24 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Masahiro Yamada
 <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nick
 Desaulniers <ndesaulniers@google.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] riscv: switch to relative exception tables
Message-ID: <20211021234724.5a2ccc6f@xhacker>
In-Reply-To: <352c54e1-b164-38d9-43fb-dbc28ab38ac7@huawei.com>
References: <20211020220529.54ccf4e9@xhacker> <20211020220700.04bcdeca@xhacker>
 <352c54e1-b164-38d9-43fb-dbc28ab38ac7@huawei.com>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygD3+UkijXFh+oJcAA--.16862S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJw1xJryUtr1rtr4UJF1UWrg_yoW5Kw45pF
 WUJayjkFWrAr1UWanFgw4DGF18tw40ka1rWryFqa1UAasxXF93Wan7trya93WkGr18A34Y
 9rWaqryvyw4Yy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkqb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
 42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
 WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
 I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F
 4UMIIF0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
 cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU85GYPUUUUU==
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_085451_079235_CE7D0784 
X-CRM114-Status: GOOD (  23.75  )
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

On Thu, 21 Oct 2021 19:42:48 +0800
Kefeng Wang <wangkefeng.wang@huawei.com> wrote:

> On 2021/10/20 22:07, Jisheng Zhang wrote:
> > From: Jisheng Zhang <jszhang@kernel.org>
> > 
> > Similar as other architectures such as arm64, x86 and so on, use
> > offsets relative to the exception table entry values rather than
> > absolute addresses for both the exception locationand the fixup.
> > 
> > However, RISCV label difference will actually produce two relocations,
> > a pair of R_RISCV_ADD32 and R_RISCV_SUB32. Take below simple code for
> > example:
> > 
> > $ cat test.S
> > .section .text
> > 1:
> >          nop
> > .section __ex_table,"a"
> >          .balign 4
> >          .long (1b - .)
> > .previous
> > 
> > $ riscv64-linux-gnu-gcc -c test.S
> > $ riscv64-linux-gnu-readelf -r test.o
> > Relocation section '.rela__ex_table' at offset 0x100 contains 2 entries:
> >    Offset          Info           Type           Sym. Value    Sym. Name + Addend
> > 000000000000  000600000023 R_RISCV_ADD32     0000000000000000 .L1^B1 + 0
> > 000000000000  000500000027 R_RISCV_SUB32     0000000000000000 .L0  + 0
> > 
> > The modpost will complain the R_RISCV_SUB32 relocation, so we need to
> > patch modpost.c to skip this relocation for .rela__ex_table section.
> > 
> > After this patch, the __ex_table section size of defconfig vmlinux is
> > reduced from 7072 Bytes to 3536 Bytes.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---  
> 
> 
> 
> ...
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index cb8ab7d91d30..0aa14b5bd124 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -1830,6 +1830,27 @@ static int addend_mips_rel(struct elf_info *elf, Elf_Shdr *sechdr, Elf_Rela *r)
> >   	return 0;
> >   }
> >   
> > +#ifndef EM_RISCV
> > +#define EM_RISCV		243
> > +#endif
> > +
> > +#ifndef R_RISCV_SUB32
> > +#define R_RISCV_SUB32		39
> > +#endif
> > +
> > +static int addend_riscv_rela(struct elf_info *elf, Elf_Shdr *sechdr, Elf_Rela *r)
> > +{
> > +	unsigned int r_typ = ELF_R_TYPE(r->r_info);
> > +	const char *fromsec;
> > +
> > +	fromsec = sech_name(elf, sechdr);
> > +	fromsec += strlen(".rela");
> > +
> > +	if (!strcmp("__ex_table", fromsec) && r_typ == R_RISCV_SUB32)
> > +		return 1;	/* skip this */
> > +	return 0;
> > +}
> > +
> >   static void section_rela(const char *modname, struct elf_info *elf,
> >   			 Elf_Shdr *sechdr)
> >   {
> > @@ -1866,6 +1887,12 @@ static void section_rela(const char *modname, struct elf_info *elf,
> >   		r_sym = ELF_R_SYM(r.r_info);
> >   #endif
> >   		r.r_addend = TO_NATIVE(rela->r_addend);
> > +		switch (elf->hdr->e_machine) {
> > +		case EM_RISCV:
> > +			if (addend_riscv_rela(elf, sechdr, &r))  
> directly use
> if (!strcmp("__ex_table", fromsec) && ELF_R_TYPE(r.r_info) == R_RISCV_SUB32)

My local initial patch is as direct as this LoC;) then later I thought we may
need do something more in future. But now I think we can do code
refactoring then. Will send patch v3 soon.

Thanks

> 
> > +				continue;
> > +			break;
> > +		}
> >   		sym = elf->symtab_start + r_sym;
> >   		/* Skip special sections */
> >   		if (is_shndx_special(sym->st_shndx))
> > diff --git a/scripts/sorttable.c b/scripts/sorttable.c
> > index 6ee4fa882919..39e86e4acea3 100644
> > --- a/scripts/sorttable.c
> > +++ b/scripts/sorttable.c
> > @@ -346,6 +346,7 @@ static int do_file(char const *const fname, void *addr)
> >   	case EM_PARISC:
> >   	case EM_PPC:
> >   	case EM_PPC64:
> > +	case EM_RISCV:
> >   		custom_sort = sort_relative_table;
> >   		break;
> >   	case EM_ARCOMPACT:
> > @@ -353,7 +354,6 @@ static int do_file(char const *const fname, void *addr)
> >   	case EM_ARM:
> >   	case EM_MICROBLAZE:
> >   	case EM_MIPS:
> > -	case EM_RISCV:
> >   	case EM_XTENSA:
> >   		break;
> >   	default:
> >   



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
