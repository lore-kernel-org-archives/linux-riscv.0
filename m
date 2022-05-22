Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C404C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 22 May 2022 03:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tGtUpWdOT+RU1RdomzVa6RMroiomMqpYrIDF8vR2iII=; b=2Yh5DZili1rz//
	kiIYjHRcHM2uY6shWBDYCZ48xajaRk2HPWtbekjdlMGGOnPMExUV8MrOpfrHmmp9437YIJxDxHXMH
	bOWS5+VygjYmwO5gLRhQghVmhA9sTbFqbIA+TUJpaJ/bPakWDi9OTt1PPmAPuR+QpxSbiR1AXh7E2
	gZPCv9SZgqqshi4q3PYhL3PXM2xtjXJ/W3CGOL5awtZwIfKZCYtfEYKuFAeAqwws1v/jcuuQhPjcQ
	Yj7otfJBla4rOaEfXnVPDE/rV5talygUs+SoH40YmkSVxBdzmavFhkP1LeS+iByuKOi38swYDrV7t
	8BYXNq6CZ8AquLxmDlqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsbx1-000Q8L-Et; Sun, 22 May 2022 03:08:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsbwy-000Q7N-6N
 for linux-riscv@lists.infradead.org; Sun, 22 May 2022 03:08:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653188889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Gam7sumT5W8pDuiX0Cgy71xdDr4WJ12i+0TurLsscg=;
 b=IFzgCf4gZeNer2NCaygHn4fGszzLw7hopM5/a+WGGui3U8LDMlfMASd3qvBd2JyooRWqSV
 W/uAm59b4sN/wO9LyeuIcm7JuLdWO113R43MtetT9VfIUSchk8MfEZQMtJCK/jYABmc7Vr
 +7nBtWAc0UnzivqKUFpfZSApNY6h2Vs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-aBcYdxJHOsOykZ25peM-Bg-1; Sat, 21 May 2022 23:08:04 -0400
X-MC-Unique: aBcYdxJHOsOykZ25peM-Bg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEDCB3C01C0F;
 Sun, 22 May 2022 03:08:03 +0000 (UTC)
Received: from localhost (ovpn-12-97.pek2.redhat.com [10.72.12.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43D2A40D0161;
 Sun, 22 May 2022 03:08:00 +0000 (UTC)
Date: Sun, 22 May 2022 11:07:57 +0800
From: Baoquan He <bhe@redhat.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: lizhengyu3@huawei.com, liaochang1@huawei.com, alex@ghiti.fr,
 aou@eecs.berkeley.edu, Bjorn Topel <bjorn.topel@gmail.com>,
 ebiederm@xmission.com, guoren@linux.alibaba.com, jszhang@kernel.org,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, mick@ics.forth.gr,
 Paul Walmsley <paul.walmsley@sifive.com>, penberg@kernel.org,
 sunnanyong@huawei.com, wangkefeng.wang@huawei.com
Subject: Re: [PATCH v3 -next 1/6] kexec_file: Fix kexec_file.c build error
 for riscv platform
Message-ID: <YompDXEY1MaHElmE@MiWiFi-R3L-srv>
References: <20220408100914.150110-2-lizhengyu3@huawei.com>
 <mhng-33c63a92-49e5-48a0-8f54-797c797ee373@palmer-mbp2014>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-33c63a92-49e5-48a0-8f54-797c797ee373@palmer-mbp2014>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220521_200812_352085_50EAB653 
X-CRM114-Status: GOOD (  26.49  )
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

On 05/20/22 at 08:45am, Palmer Dabbelt wrote:
> On Fri, 08 Apr 2022 03:09:09 PDT (-0700), lizhengyu3@huawei.com wrote:
> > From: Liao Chang <liaochang1@huawei.com>
> > 
> > When CONFIG_KEXEC_FILE is set for riscv platform, the compilation of
> > kernel/kexec_file.c generate build error:
> > 
> > kernel/kexec_file.c: In function 'crash_prepare_elf64_headers':
> > ./arch/riscv/include/asm/page.h:110:71: error: request for member 'virt_addr' in something not a structure or union
> >   110 |  ((x) >= PAGE_OFFSET && (!IS_ENABLED(CONFIG_64BIT) || (x) < kernel_map.virt_addr))
> >       |                                                                       ^
> > ./arch/riscv/include/asm/page.h:131:2: note: in expansion of macro 'is_linear_mapping'
> >   131 |  is_linear_mapping(_x) ?       \
> >       |  ^~~~~~~~~~~~~~~~~
> > ./arch/riscv/include/asm/page.h:140:31: note: in expansion of macro '__va_to_pa_nodebug'
> >   140 | #define __phys_addr_symbol(x) __va_to_pa_nodebug(x)
> >       |                               ^~~~~~~~~~~~~~~~~~
> > ./arch/riscv/include/asm/page.h:143:24: note: in expansion of macro '__phys_addr_symbol'
> >   143 | #define __pa_symbol(x) __phys_addr_symbol(RELOC_HIDE((unsigned long)(x), 0))
> >       |                        ^~~~~~~~~~~~~~~~~~
> > kernel/kexec_file.c:1327:36: note: in expansion of macro '__pa_symbol'
> >  1327 |   phdr->p_offset = phdr->p_paddr = __pa_symbol(_text);
> > 
> > This occurs is because the "kernel_map" referenced in macro
> > is_linear_mapping()  is suppose to be the one of struct kernel_mapping
> > defined in arch/riscv/mm/init.c, but the 2nd argument of
> > crash_prepare_elf64_header() has same symbol name, in expansion of macro
> > is_linear_mapping in function crash_prepare_elf64_header(), "kernel_map"
> > actually is the local variable.
> > 
> > Signed-off-by: Liao Chang <liaochang1@huawei.com>
> > ---
> >  include/linux/kexec.h | 2 +-
> >  kernel/kexec_file.c   | 4 ++--
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> > index 58d1b58a971e..ebb1bffbf068 100644
> > --- a/include/linux/kexec.h
> > +++ b/include/linux/kexec.h
> > @@ -227,7 +227,7 @@ struct crash_mem {
> >  extern int crash_exclude_mem_range(struct crash_mem *mem,
> >  				   unsigned long long mstart,
> >  				   unsigned long long mend);
> > -extern int crash_prepare_elf64_headers(struct crash_mem *mem, int kernel_map,
> > +extern int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
> >  				       void **addr, unsigned long *sz);
> >  #endif /* CONFIG_KEXEC_FILE */
> > 
> > diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> > index 8347fc158d2b..331a4f0f10f5 100644
> > --- a/kernel/kexec_file.c
> > +++ b/kernel/kexec_file.c
> > @@ -1260,7 +1260,7 @@ int crash_exclude_mem_range(struct crash_mem *mem,
> >  	return 0;
> >  }
> > 
> > -int crash_prepare_elf64_headers(struct crash_mem *mem, int kernel_map,
> > +int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
> >  			  void **addr, unsigned long *sz)
> >  {
> >  	Elf64_Ehdr *ehdr;
> > @@ -1324,7 +1324,7 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int kernel_map,
> >  	phdr++;
> > 
> >  	/* Prepare PT_LOAD type program header for kernel text region */
> > -	if (kernel_map) {
> > +	if (need_kernel_map) {
> >  		phdr->p_type = PT_LOAD;
> >  		phdr->p_flags = PF_R|PF_W|PF_X;
> >  		phdr->p_vaddr = (unsigned long) _text;
> 
> IMO this is fine: we could rename all the kernel_map stuff in arch/riscv,
> but this is much more self-contained.  It's not been ack'd by anyone else,
> but get_maintainers just suggests the kexec@ list so I'm going to take it
> via the RISC-V tree along with the rest of these.

I ever checked this patch, and thought the renaming of kernel_map in
arch/riscv might be more reasonable, because 'need_kernel_map' is obviously
redundant and looks silly, considering in a generic code. But searching
result of kernel_map under arch/riscv stops me suggesting that.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
