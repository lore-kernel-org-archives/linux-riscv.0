Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E064AC54E58
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 00:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JW8GICYe9STxbXQP1KleTI7SM/xceK1CdfAPL7adc1w=; b=yHvL/HQw7VhJ6I
	aFpmEP7QG1FPWGS6h94lLMl9K6YdIGuU6HPf8N2CenFqDbhVBTQOlhRik/NbOv10tRH0adNrgJblp
	ECVCqlV0Xj/6Q1lB2TXdxCAQyHmgyZ/hda1UCX9yF3CZVLFfKJrVqryvdPRTZXO5CAH08Qet9g2s+
	EPGuaNL4yj+9zdoeiKGMM1LjSU9PoBK6MlgLF0ESQIJqJBfrTkm6k0vjR1tzX8SkH6E7JxnIijxbj
	xECcEulL9FpfKXEnxLENvbyfJ2/h1exW5w8H/6oK2ExwSIuyLAXDBDjk8wFdGqD3yAhnD5qCdpdvB
	txwHO9WLk2kcCe6fx7RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkCng-00000008B0w-42dl;
	Wed, 13 Mar 2024 00:48:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkCnd-00000008Az8-10kp
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 00:48:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710290930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V/I7rfb7fSwv9EVlLwLZyE6cq/I2crR3JWNIky7ODFU=;
	b=A/4xmStZDqHtzWbIiQ4lIWJR9pBtrViK44eZgxOFPpnpbcYvkay9azLFuLl131q0KUmeVn
	kUlrkDD0kK+JG6LI7v76epAzAGY2tHJAzFrG3ZQcj54TOhy0FeyJKxSI/FVc+jMmnATDVt
	YtxDgB2DqEQvDNIvQy4ZsNoTpE7y/5s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-Tx39TiVcPDK1NGuCqWNU_g-1; Tue, 12 Mar 2024 20:48:48 -0400
X-MC-Unique: Tx39TiVcPDK1NGuCqWNU_g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CAF58800262;
	Wed, 13 Mar 2024 00:48:47 +0000 (UTC)
Received: from localhost (unknown [10.72.116.13])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24F7510E47;
	Wed, 13 Mar 2024 00:48:46 +0000 (UTC)
Date: Wed, 13 Mar 2024 08:48:44 +0800
From: Baoquan He <bhe@redhat.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, kexec@lists.infradead.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-parisc@vger.kernel.org, akpm@linux-foundation.org,
	joe@perches.com, nathan@kernel.org, conor@kernel.org
Subject: Re: kexec verbose dumps with 6.8 [was: [PATCH v4 1/7] kexec_file:
 add kexec_file flag to control debug printing]
Message-ID: <ZfD37AlznCXJ6P54@MiWiFi-R3L-srv>
References: <20231213055747.61826-1-bhe@redhat.com>
 <20231213055747.61826-2-bhe@redhat.com>
 <4c775fca-5def-4a2d-8437-7130b02722a2@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4c775fca-5def-4a2d-8437-7130b02722a2@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_174853_382131_CDAB8595 
X-CRM114-Status: GOOD (  20.65  )
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

Hi Jiri,

On 03/12/24 at 10:58am, Jiri Slaby wrote:
> On 13. 12. 23, 6:57, Baoquan He wrote:
 ... snip...
> > --- a/include/linux/kexec.h
> > +++ b/include/linux/kexec.h
> ...
> > @@ -500,6 +500,13 @@ static inline int crash_hotplug_memory_support(void) { return 0; }
> >   static inline unsigned int crash_get_elfcorehdr_size(void) { return 0; }
> >   #endif
> > +extern bool kexec_file_dbg_print;
> > +
> > +#define kexec_dprintk(fmt, ...)					\
> > +	printk("%s" fmt,					\
> > +	       kexec_file_dbg_print ? KERN_INFO : KERN_DEBUG,	\
> > +	       ##__VA_ARGS__)
> 
> This means you dump it _always_. Only with different levels.

It dumped always too with pr_debug() before, I just add a switch to
control it's pr_info() or pr_debug().

> 
> And without any prefix whatsoever, so people see bloat like this in their
> log now:
> [  +0.000001] 0000000000001000-000000000009ffff (1)
> [  +0.000002] 000000007f96d000-000000007f97efff (3)
> [  +0.000002] 0000000000800000-0000000000807fff (4)
> [  +0.000001] 000000000080b000-000000000080bfff (4)
> [  +0.000002] 0000000000810000-00000000008fffff (4)
> [  +0.000001] 000000007f97f000-000000007f9fefff (4)
> [  +0.000001] 000000007ff00000-000000007fffffff (4)
> [  +0.000002] 0000000000000000-0000000000000fff (2)

On which arch are you seeing this? There should be one line above these
range printing to tell what they are, like:

E820 memmap:
0000000000000000-000000000009a3ff (1)
000000000009a400-000000000009ffff (2)
00000000000e0000-00000000000fffff (2)
0000000000100000-000000006ff83fff (1)
000000006ff84000-000000007ac50fff (2)

> 
> without actually knowing what that is.
> 
> There should be nothing logged if that is not asked for and especially if
> kexec load went fine, right?

Right. Before this patch, those pr_debug() were already there. You need
enable them to print out like add '#define DEBUG' in *.c file, or enable
the dynamic debugging of the file or function. With this patch applied,
you only need specify '-d' when you execute kexec command with
kexec_file load interface, like:

kexec -s -l -d /boot/vmlinuz-xxxx.img --initrd xxx.img --reuse-cmdline

For kexec_file load, it is not logging if not specifying '-d', unless
you take way to make pr_debug() work in that file.

> 
> Can this be redesigned, please?

Sure, after making clear what's going on with this, I will try.

> 
> Actually what was wrong on the pr_debug()s? Can you simply turn them on from
> the kernel when -d is passed to kexec instead of all this?

Joe suggested this during v1 reviewing:
https://lore.kernel.org/all/1e7863ec4e4ab10b84fd0e64f30f8464d2e484a3.camel@perches.com/T/#u

> 
> ...
> > --- a/kernel/kexec_core.c
> > +++ b/kernel/kexec_core.c
> > @@ -52,6 +52,8 @@ atomic_t __kexec_lock = ATOMIC_INIT(0);
> >   /* Flag to indicate we are going to kexec a new kernel */
> >   bool kexec_in_progress = false;
> > +bool kexec_file_dbg_print;
> 
> Ugh, and a global flag for this?

Yeah, kexec_file_dbg_print records if '-d' is specified when 'kexec'
command executed. Anything wrong with the global flag?

Thanks
Baoquan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
