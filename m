Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7D5C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 10:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CnzX0cILTFnmpscuroQeO7Mq3r3NjB9MKJ51gGrlb2I=; b=hzO7NBlxZlYd4m
	1el02sHcFhzFUpAiz0PrK0MjaqbbO1xwkkmtnD81/mZF5a1ou3XyidtuGYKAAJOsJ1BMMG4aRv379
	rEMAYin9LAp8T3omk35Ibs+5eDZWIzUQ1U7x+YXRIb1cEP0GUCkOOoJWxyAO1bOoDQMppbJWNezKd
	1HZ7iHka2UYb7M0TuvYMTuso+iT8JpFwTQoO2FYl61NgrKr2Vz/yheDsgpDoaE7SaA/jEuMP0tqFH
	I8uHV+ZYZBKRGfbMTi1fesnBpUE8V9pKe+RBslhq8tw0L85ijKZjBA/B4JetOrz+dSDpgjA+6OGJH
	IHRti2DCpErABH/rCtDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEq0L-00BgdX-VE; Tue, 01 Feb 2022 10:03:17 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEq09-00BgaQ-EG; Tue, 01 Feb 2022 10:03:06 +0000
Received: by mail-ej1-x635.google.com with SMTP id h7so52537741ejf.1;
 Tue, 01 Feb 2022 02:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mClIZuGiU90N8/wVEGuz0kPrT8HDVsO1SF0mMBp9TKA=;
 b=m8l3iizy6m+bL/jBYQ1WY3ATqWzlyg2KTCyNULM3eVNvkC5wqKTucOmaIxZWFKKHKC
 O4vEtqtNwuq399PL5WPFG5Z7vCu6zPPjoimtCnr8vb/5lojlVqjvZJwxMJzVd0Vk35+r
 ZVAR+4L1KqtGJhgkD+zr3U76KGUGG1P7/BPweFRor+Y6JBV2yCS0CX+UFmYJA0lC10As
 KSMXOwfQMpM5C1cOo7NxFB454lv8KZ0AWzZzM/pxNJiKv31JpTcyWfsVCUPzCl573dFS
 WOqZrDF8DuO60afmvVeUg1FCdgzqdmHYIJrUyRb6laaV9nlyKLCU0X2qcosie45x9Rgc
 yezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mClIZuGiU90N8/wVEGuz0kPrT8HDVsO1SF0mMBp9TKA=;
 b=lvK/eLm4OhkawIpmpJL2jiTT7+W/Imiak0w+PjM3vLRh+I/nuHtNVqaRfKC61aSKMk
 6atYYD3vYx8JlrysPV5CbtYZHpZt44KJ/Ml8NQaZy4YNhIXEzerJWnD9z+m0GOQwSJDB
 4sTrjnDM/6IOcSwLdMNG7sm/AkxhJHMtI+4K0kikiCXXlFZBOZZ1wK+1WLRtzpPnO/v8
 y6u7NOA3crYywU241yoECGKbyTbqHd0Mx0cMmZ/3UTSFSIirjkwwcGaepsTyepcQjDU5
 Pghb4ix8SI+KBF6N8Msw2rYtIZIXPrcehEH1YyZJajqlwfs83C+hWgrmVLD7E/PHGmb1
 xquA==
X-Gm-Message-State: AOAM532KW9sY/VX+sqo3o02cOcmeMlScO46PNc3Pc7gQdSl5T9zHiPi2
 pgysXY1Jiip72eZTm+T0I5W18e5erGoPB9/cj+8=
X-Google-Smtp-Source: ABdhPJyfD5PfJ3o2DgbfikfmuisQ6IDuSCV1txCGADlAID79HMnZ8k2HT/445aAlBSn/3Hrxj9wDnw0NxNHNH60hLfE=
X-Received: by 2002:a17:907:1c1c:: with SMTP id
 nc28mr20280513ejc.651.1643709778741; 
 Tue, 01 Feb 2022 02:02:58 -0800 (PST)
MIME-Version: 1.0
References: <20220128151540.164759-1-david@redhat.com>
In-Reply-To: <20220128151540.164759-1-david@redhat.com>
From: Anatoly Pugachev <matorola@gmail.com>
Date: Tue, 1 Feb 2022 13:02:45 +0300
Message-ID: <CADxRZqx_rAkwFVwSc1ohm-RqKD=-pcBsR+rBrRaw9KazQncANQ@mail.gmail.com>
Subject: Re: [PATCH RFC v1] drivers/base/node: consolidate node device
 subsystem initialization in node_dev_init()
To: David Hildenbrand <david@redhat.com>
Cc: Linux Kernel list <linux-kernel@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>, "David S. Miller" <davem@davemloft.net>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, x86@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, linux-s390 <linux-s390@vger.kernel.org>, 
 linux-sh@vger.kernel.org, Sparc kernel list <sparclinux@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_020305_504234_13712924 
X-CRM114-Status: GOOD (  17.03  )
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

On Mon, Jan 31, 2022 at 2:11 PM David Hildenbrand <david@redhat.com> wrote:
>
> ... and call node_dev_init() after memory_dev_init() from driver_init(),
> so before any of the existing arch/subsys calls. All online nodes should
> be known at that point.
>
> This is in line with memory_dev_init(), which initializes the memory
> device subsystem and creates all memory block devices.
>
> Similar to memory_dev_init(), panic() if anything goes wrong, we don't
> want to continue with such basic initialization errors.
>
> The important part is that node_dev_init() gets called after
> memory_dev_init() and after cpu_dev_init(), but before any of the
> relevant archs call register_cpu() to register the new cpu device under
> the node device. The latter should be the case for the current users
> of topology_init().
>
> RFC because I tested only on x86-64 and s390x, I think I cross-compiled all
> applicable architectures except riscv and sparc.

Compiled and boot tested on sparc.

Tested-by: Anatoly Pugachev <matorola@gmail.com> (sparc64)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
