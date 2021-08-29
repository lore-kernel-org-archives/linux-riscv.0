Return-Path: <SRS0=5jhf=NU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B0D8C432BE
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Aug 2021 10:17:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31C4C60E73
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Aug 2021 10:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 31C4C60E73
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=mail.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MIBc8kwGyf/OZGaPYvQEYgwDpGFbUrXvnWQ5g+Y8bno=; b=yU+X8qge22XzlZ
	zCHtLD1O04YAN82evIooGvjSq5zccW3+H43/++lXWSzmAktCyDtFyrePSAP+XDw3L4hdLvxZQ1Tyo
	dtGRl1i5KLy7+vEThmhklDSFV2H9eKfpbEw1b9OwsRD3uZkdUA9V0UCljf3Ku2PShI9VB9saQFt5s
	sW4Bguq9sFGcKO3KJsdcTu1ygR3jC5zrSpNu5LutA1ObQM1D5cAVDfHWijK0i9MnowlpTrxRnRgDU
	7dpqwZkWH8FL3PEs3dmHuRbEhzbnxczg/g4NYKHhgjbXZBf+6StzMFqBUjL6TA1gRk4PhJqbHMdNP
	sddcwTHn38XkWYVS5zgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKHs8-00FN09-Mb; Sun, 29 Aug 2021 10:17:04 +0000
Received: from smtp48.i.mail.ru ([94.100.177.108])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKHs5-00FMzD-7i
 for linux-riscv@lists.infradead.org; Sun, 29 Aug 2021 10:17:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=VZgNaS1mLdlvZJztEjsG9uU8c+U32c8iiPysRhjd9m4=; 
 t=1630232221;x=1630837621; 
 b=qRKz3N6BYQfnU5qs0P0VqpzrureAK5z6XTNz5m+FydZJfqxPH5OuQDtx0TVOOJYGqIYvgEkQA5h1ix0E6Pmo7svPng0JhV7xPBNB7jMZ2sMwpZY9D28TquEvbzy6kHXqMWN61qFfRkcaxX2tTs7WfG2LDe1Bwv9T/+U+uhGwAf/Movn7WS66IHIyfSEhxuw0MPiWSz9ly/zy2D8qjPXsB2C1VddRtuQOGBbMzyHxIDn1hrVHtlfgHOTc7C/HgMD9gHkeSbju77DNPEikW40/QpOuEEU4GprUjGMHVaLx7uvcHviZA4LpCGTicYQfopcMtOL+wHKGrrS8+ksW8a1ONg==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <cerg2010cerg2010@mail.ru>)
 id 1mKHs1-0002yE-1L; Sun, 29 Aug 2021 13:16:57 +0300
Date: Sun, 29 Aug 2021 13:16:49 +0300
From: Sergey Larin <cerg2010cerg2010@mail.ru>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: vdso: map data page before vDSO code
Message-ID: <YStekax6zSKApmRC@hp>
References: <20210829094708.169037-1-cerg2010cerg2010@mail.ru>
 <02601412-6f01-f4e5-699a-e285fc3fdf3a@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <02601412-6f01-f4e5-699a-e285fc3fdf3a@huawei.com>
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=cerg2010cerg2010@mail.ru
 smtp.mailfrom=cerg2010cerg2010@mail.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD92087353F0EC44DD9C4DAED859F16A63896D62C811FDE4A33182A05F5380850400EE31BA4DA85BC9891809E91445A529A4066006618D1C40D9E25B3326023DA7B
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE74FC7AD0AD96C1577EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637829D9538242026C38638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8BE3992D3DA6F0F9073F11D206F93CADB6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE77A825AB47F0FC8649FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD186FD1C55BDD38FC3FD2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B5F0C88D684269EDEA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC702ADF1C0A6F83E73AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637EDDE4FD3F6DF783AD81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F783D6DB41994EC49CE5475246E174218B5C8C57E37DE458BEDA766A37F9254B7
X-B7AD71C0: AC4F5C86D027EB782CDD5689AFBDA7A213B5FB47DCBC3458834459D11680B505A58435F6B5465CCF6E8D7AE0BB36E769
X-C1DE0DAB: 0D63561A33F958A5ADA0B25F9C80F90779E9679EB5508820042D3654C38D9FF9D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75438CC92D4039F4E2410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34A63B03BCD35E0C0AF1593815AD0C10A101A327B40812B95BE11397FA7036B6955BEAADA9564F020D1D7E09C32AA3244C7A6454AD43A0A4B997B4CD5B2E18516E24AF4FAF06DA24FD8D5DD81C2BAB7D1D
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojMpcxcuSaa4E1/55aF8zTjw==
X-Mailru-Sender: B6CA852314BECD1116C83C047D515D65CA45700ABDFD0123026E14154E9EB39DD944A9F887ED1F5C51913ECE9F5D4CE557914126969F3D9578C09B768FF42B7F4F0A872F021F9059A8B6234B51EB8B42EAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210829_031701_676878_4031D00D 
X-CRM114-Status: GOOD (  31.05  )
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

On Sun, Aug 29, 2021 at 05:59:04PM +0800, Kefeng Wang wrote:
> Hi Sergey
> 
> There is already one fix,
> 
> https://patchwork.kernel.org/project/linux-riscv/list/?series=534877
> 

Oh, I missed it. That one looks cleaner. Thanks anyway!

> On 2021/8/29 17:47, Sergey Larin wrote:
> > Current vDSO implementation assumes that the code size always fits in
> > single page, and the data page follows it:
> > 
> > 	PROVIDE(_vdso_data = . + PAGE_SIZE);
> > 
> > However, this was not the case with my kernel build - the
> > shared object had the size of 4800 bytes. This, obviously, is more than
> > 4096 and requires second page for the rest of the data.
> > 
> > CLOCK_REALTIME_COARSE clock became broken. It was always returning 0
> > because vDSO code was reading the second code page, not the
> > data page. Glibc uses this clock for the time() function.
> > 
> > So instead of computing the offset for the data page (it is necessary to
> > do in runtime - you can't know the size of the binary while you're
> > building it) simply move it behind the code like the ARM does:
> > 
> > 	PROVIDE(_vdso_data = . - PAGE_SIZE);
> > 
> > This commit also fixes arch_vma_name for the data page - it was
> > reporting the same '[vdso]' name for it in my case.
> > 
> > Since I don't have the real hardware, the change was debugged with KGDB
> > in RVVM and also verified in QEMU.
> > 
> > Signed-off-by: Sergey Larin <cerg2010cerg2010@mail.ru>
> > ---
> >   arch/riscv/kernel/vdso.c          | 22 +++++++++++-----------
> >   arch/riscv/kernel/vdso/vdso.lds.S |  2 +-
> >   2 files changed, 12 insertions(+), 12 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
> > index 25a3b8849599..0c49390e9be3 100644
> > --- a/arch/riscv/kernel/vdso.c
> > +++ b/arch/riscv/kernel/vdso.c
> > @@ -44,13 +44,13 @@ static int __init vdso_init(void)
> >   		return -ENOMEM;
> >   	}
> > +	vdso_pagelist[0] = virt_to_page(vdso_data);
> >   	for (i = 0; i < vdso_pages; i++) {
> >   		struct page *pg;
> >   		pg = virt_to_page(vdso_start + (i << PAGE_SHIFT));
> > -		vdso_pagelist[i] = pg;
> > +		vdso_pagelist[i + 1] = pg;
> >   	}
> > -	vdso_pagelist[i] = virt_to_page(vdso_data);
> >   	return 0;
> >   }
> > @@ -77,21 +77,21 @@ int arch_setup_additional_pages(struct linux_binprm *bprm,
> >   	 * install_special_mapping or the perf counter mmap tracking code
> >   	 * will fail to recognise it as a vDSO (since arch_vma_name fails).
> >   	 */
> > -	mm->context.vdso = (void *)vdso_base;
> > +	mm->context.vdso = (void *)vdso_base + PAGE_SIZE;
> > -	ret =
> > -	   install_special_mapping(mm, vdso_base, vdso_pages << PAGE_SHIFT,
> > -		(VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC),
> > -		vdso_pagelist);
> > +	ret = install_special_mapping(mm, vdso_base, PAGE_SIZE,
> > +		(VM_READ | VM_MAYREAD), &vdso_pagelist[0]);
> >   	if (unlikely(ret)) {
> >   		mm->context.vdso = NULL;
> >   		goto end;
> >   	}
> > -	vdso_base += (vdso_pages << PAGE_SHIFT);
> > -	ret = install_special_mapping(mm, vdso_base, PAGE_SIZE,
> > -		(VM_READ | VM_MAYREAD), &vdso_pagelist[vdso_pages]);
> > +	vdso_base += PAGE_SIZE;
> > +	ret =
> > +	   install_special_mapping(mm, vdso_base, vdso_pages << PAGE_SHIFT,
> > +		(VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC),
> > +		&vdso_pagelist[1]);
> >   	if (unlikely(ret))
> >   		mm->context.vdso = NULL;
> > @@ -105,7 +105,7 @@ const char *arch_vma_name(struct vm_area_struct *vma)
> >   	if (vma->vm_mm && (vma->vm_start == (long)vma->vm_mm->context.vdso))
> >   		return "[vdso]";
> >   	if (vma->vm_mm && (vma->vm_start ==
> > -			   (long)vma->vm_mm->context.vdso + PAGE_SIZE))
> > +			   (long)vma->vm_mm->context.vdso - PAGE_SIZE))
> >   		return "[vdso_data]";
> >   	return NULL;
> >   }
> > diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
> > index e6f558bca71b..fd8a31075256 100644
> > --- a/arch/riscv/kernel/vdso/vdso.lds.S
> > +++ b/arch/riscv/kernel/vdso/vdso.lds.S
> > @@ -8,7 +8,7 @@ OUTPUT_ARCH(riscv)
> >   SECTIONS
> >   {
> > -	PROVIDE(_vdso_data = . + PAGE_SIZE);
> > +	PROVIDE(_vdso_data = . - PAGE_SIZE);
> >   	. = SIZEOF_HEADERS;
> >   	.hash		: { *(.hash) }			:text

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
