Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B646BC61DF4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 08:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e3VqSk5DDpD7NAQN7leza+b/cS9lapYhllbW1CDqEXw=; b=EaisbXxuFXj5Md
	qy0LtcfRaxB6Gf+naltE0zgvXRkxzL/VwAdQKkZgQeCsGo/UkSd9QaagsRzNkrjwMczOlmwo2PrHQ
	/SU2ny+UO0jKCCJryWifWr0sEeNGoSx6lJqBDljvl0NprKCM/BEVYepYvLbuJluQbBud+a7keRMF7
	OQ+1IeJc/3dbCSisiA1Qwpcf61fBpxsTzDRZUMuffBYW8LYB2+kAIO218PiaIq8XAsHUdsa+r5z2u
	Oe6B7haNXyJRYYJUIxZYgspSNBNBTFyUwq4GFVASG9nAa86LI26mZSYIr59SoyFsLbRfGOQ71L+nH
	lutiLTNRsiiX/vSWI+Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Rk2-006Xbm-1z;
	Fri, 24 Nov 2023 08:40:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Rjz-006XZG-0X
	for linux-riscv@lists.infradead.org;
	Fri, 24 Nov 2023 08:40:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700815242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TtiruDUnh8gIdyydjQh1DSHosPodlSxaPwJiylzKhys=;
	b=F4thSS2tcNtsIBSxb9UmTsg3yRymx+/UJCKri+bf7PDNdTsrFVTGYat4Kn77z5JOxiam0s
	a27ws93ho2CgCRVvB3YuQI2hOneCVtzak+GqCtBWaS4vhscs8D+/U4ryTCuol2+UGVg75B
	X9AQVfI9XFDorHL7e3GwNOXY0uunD2M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-QXyK2TnoOxKNhbHg3BDyOw-1; Fri, 24 Nov 2023 03:40:39 -0500
X-MC-Unique: QXyK2TnoOxKNhbHg3BDyOw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98B7D828CEA;
	Fri, 24 Nov 2023 08:40:38 +0000 (UTC)
Received: from localhost (unknown [10.72.112.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D59C0112130A;
	Fri, 24 Nov 2023 08:40:36 +0000 (UTC)
Date: Fri, 24 Nov 2023 16:40:33 +0800
From: Baoquan He <bhe@redhat.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, kexec@lists.infradead.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-parisc@vger.kernel.org, akpm@linux-foundation.org,
	nathan@kernel.org, yujie.liu@intel.com
Subject: Re: [PATCH v2 2/7] kexec_file: print out debugging message if
 required
Message-ID: <ZWBhgfhFONEYcJZf@MiWiFi-R3L-srv>
References: <20231124033642.520686-1-bhe@redhat.com>
 <20231124033642.520686-3-bhe@redhat.com>
 <971ed2ceaeeba882d2b4c39015ee5ae5db3f5e82.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <971ed2ceaeeba882d2b4c39015ee5ae5db3f5e82.camel@perches.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_004047_289512_A4D8F017 
X-CRM114-Status: GOOD (  12.92  )
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

On 11/23/23 at 11:16pm, Joe Perches wrote:
> On Fri, 2023-11-24 at 11:36 +0800, Baoquan He wrote:
> > Replace pr_debug() with the newly added kexec_dprintk() in kexec_file
> > loading related codes.
> 
> trivia for pr_debug -> kexec_dprintk conversions for
> the entire patch set:

OK, will check all patchset and adjust the indendation, thanks.

> 
> > diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> []
> > @@ -551,9 +551,12 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
> >  		phdr->p_filesz = phdr->p_memsz = mend - mstart + 1;
> >  		phdr->p_align = 0;
> >  		ehdr->e_phnum++;
> > -		pr_debug("Crash PT_LOAD ELF header. phdr=%p vaddr=0x%llx, paddr=0x%llx, sz=0x%llx e_phnum=%d p_offset=0x%llx\n",
> > +#ifdef CONFIG_KEXEC_FILE
> > +		kexec_dprintk("Crash PT_LOAD ELF header. phdr=%p vaddr=0x%llx, paddr=0x%llx, "
> > +			"sz=0x%llx e_phnum=%d p_offset=0x%llx\n",
> >  			phdr, phdr->p_vaddr, phdr->p_paddr, phdr->p_filesz,
> >  			ehdr->e_phnum, phdr->p_offset);
> 
> It's good form to rewrap continuation lines to the open parenthesis
> 
> > diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> []
> > @@ -389,11 +391,12 @@ SYSCALL_DEFINE5(kexec_file_load, int, kernel_fd, int, initrd_fd,
> >  	if (ret)
> >  		goto out;
> >  
> > +	kexec_dprintk("nr_segments = %lu\n", image->nr_segments);
> >  	for (i = 0; i < image->nr_segments; i++) {
> >  		struct kexec_segment *ksegment;
> >  
> >  		ksegment = &image->segment[i];
> > -		pr_debug("Loading segment %d: buf=0x%p bufsz=0x%zx mem=0x%lx memsz=0x%zx\n",
> > +		kexec_dprintk("segment[%d]: buf=0x%p bufsz=0x%zx mem=0x%lx memsz=0x%zx\n",
> >  			 i, ksegment->buf, ksegment->bufsz, ksegment->mem,
> >  			 ksegment->memsz);
> 
> here too etc...
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
