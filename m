Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E38C10DC1
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 08:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y0tGe5aKz/7VjHYBn1JE5vadMhhDiA/fBQxwTHNZxRc=; b=Sh/IcD5uwjfkq9
	15wNlsX7fllKn8UETh76SDSkJur5nL2/w8Quriq2Isv8n0p5kk540kFD46rHZPlE9tSgOYsLSZSUa
	//k2pKrBQHVi6apOw3dxJzbaCSGT94CUv+QNl2+oxD5uRL08ymVoyAjHcVcXNtztQY1YR/e95xP7l
	l2W2uJ9T6cwZtUyqV1wvZ6R0iD2qV1HIfOvjsHlepkz1gyhP/9gDeTzlFVIyd3X9MR85YmQt8/M8E
	jX+eHJIi8XTFUNg1C3/xpuFzVhI9TRm8reSVGXk0kCQfLvwZBgwtUgJzx0L2znMi14PeWCyIKDYTm
	d23ypx+c/u613JGzWLlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA4Y4-003J7Q-1x;
	Mon, 04 Dec 2023 08:43:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA4Y0-003J3o-1n
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 08:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701679403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WNLdrMB2tgHHf0igk8Wyh8lratwDZ12KyFRCSXbkkjQ=;
	b=T5YwPX+OLcSB2IpzA+4MnitNUrYuaWr3ZceYyyfdGyUTj9rR5Oa5rXCFg04SURjd21SJEl
	LSeo0w/PnRfKAAb7sqYLt/ZQi28S8BAmsfit/BsrwO3pvAyOXAkKaIUJ3SQ4+zdla7k4vJ
	hoHHM8aDTsQK2YWecer8MWe6cUvfTXE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-S3KQUAwxNAKg8YP9LTNJfQ-1; Mon, 04 Dec 2023 03:43:18 -0500
X-MC-Unique: S3KQUAwxNAKg8YP9LTNJfQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC51685A5B5;
	Mon,  4 Dec 2023 08:43:17 +0000 (UTC)
Received: from localhost (unknown [10.72.113.121])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF09C36E2;
	Mon,  4 Dec 2023 08:43:08 +0000 (UTC)
Date: Mon, 4 Dec 2023 16:43:05 +0800
From: Baoquan He <bhe@redhat.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, kexec@lists.infradead.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-parisc@vger.kernel.org, akpm@linux-foundation.org,
	nathan@kernel.org
Subject: Re: [PATCH v3 2/7] kexec_file: print out debugging message if
 required
Message-ID: <ZW2RGdFFsO1yIaZm@MiWiFi-R3L-srv>
References: <20231130023955.5257-1-bhe@redhat.com>
 <20231130023955.5257-3-bhe@redhat.com>
 <81c62af671ebbfad61dd46aa056050a56bf535a2.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <81c62af671ebbfad61dd46aa056050a56bf535a2.camel@perches.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_004325_336106_DED65C82 
X-CRM114-Status: GOOD (  12.20  )
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

On 11/29/23 at 06:52pm, Joe Perches wrote:
> On Thu, 2023-11-30 at 10:39 +0800, Baoquan He wrote:
> > Replace pr_debug() with the newly added kexec_dprintk() in kexec_file
> > loading related codes.
> 
> trivia:
> 
> > diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> []
> > @@ -551,9 +551,12 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
> >  		phdr->p_filesz = phdr->p_memsz = mend - mstart + 1;
> >  		phdr->p_align = 0;
> >  		ehdr->e_phnum++;
> > -		pr_debug("Crash PT_LOAD ELF header. phdr=%p vaddr=0x%llx, paddr=0x%llx, sz=0x%llx e_phnum=%d p_offset=0x%llx\n",
> > -			phdr, phdr->p_vaddr, phdr->p_paddr, phdr->p_filesz,
> > -			ehdr->e_phnum, phdr->p_offset);
> > +#ifdef CONFIG_KEXEC_FILE
> > +		kexec_dprintk("Crash PT_LOAD ELF header. phdr=%p vaddr=0x%llx, paddr=0x%llx, "
> > +			      "sz=0x%llx e_phnum=%d p_offset=0x%llx\n",
> > +			      phdr, phdr->p_vaddr, phdr->p_paddr, phdr->p_filesz,
> > +			      ehdr->e_phnum, phdr->p_offset);
> > +#endif
> 
> Perhaps run checkpatch and coalesce the format string.

Sorry for being late to reply, this comment was missed.

I broke it into two because it's a too long line and not friendly for
reading. I did notice there's such line breaking code. I can change it
if it's not suggested. Thanks for careful checking.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
