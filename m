Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE9DC4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 15:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7fS/vES14BXrZL0Medsbkkj6jvzU3+WMM1yW7sWJCEA=; b=SRP9T48WFZY4orhfIKeXtv01vd
	HxUo4hckGNqerc5l4lUbLxiYb+0q6B2xf9PeREw5u03whNbxBesGSO/bNJ8Z0LS0OvWrdATIF/5+m
	1MlcItE0gIpkMXmuH3eZuIeJvUQDlc1HPRBDVdC73MpAeRBnCTpxa4leqO+nSLGAH6aWcfzyrTMje
	VDSv6lZls84096kqNgvWln9OAKOReQ3vyOyZWl1oXeuf/bYOICbzEsUu5NMSHwlGavenuVsh1qrgy
	XdulI3l826iaHER3vYtTdyU+je8DNEu8nbbIQol18NuvFxP9P5Jo1QMnQ2S5YJfQ4iYknYMuUVfN6
	XidnUAHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r01lA-00H0oo-1a;
	Mon, 06 Nov 2023 15:43:28 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r01l7-00H0mx-2K
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 15:43:27 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5afa071d100so94074167b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 06 Nov 2023 07:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699285403; x=1699890203; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ABS8rPoBy1ITQ62kUEvxWovIfmSWeQOAvNCpebOJLoI=;
        b=QrzPLK3IWq94auIC/393/M34mlrwLbk2pJx3FhssHzES1ReGmrL2chu3zyJFs15ER3
         JXrIwDDzkuBi8LHoWXOSiD5qk3/w9rWaZPf7qnv3oBNRLX0mW9GxROhYPSZAhruENtKZ
         hYcqdal6z4JRrX6beG5hLjeadmhrkzRTFSlJxIYKK9KIOFiAAxv7vGIEDiayxBOqECp9
         uA9oQiVV62YgGbGXfM9pODMHhl987+QNzThaRKOWWLoElXji2eE07Dv+VoKG4SyDOFUz
         FORzkJk6787JE1pRMMDt/vY9nwXB4sU110g/GbsW4RS0YoZNk3PGXNEzk+Qb8+NJy8Rl
         M2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699285403; x=1699890203;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ABS8rPoBy1ITQ62kUEvxWovIfmSWeQOAvNCpebOJLoI=;
        b=ID7NkYgaKTiWQmboNS9yYcPM8WXxMeV4Pl6HY8f9Wy2L+YMNHZZ5+TJXCYNBLHjhb6
         ZVUlkfjCF6sBkQ/o9KXX9QtXmJ0tpiCqb2hvrl8PIMgI7drb+D9su1dqfSLH7EXwN4JK
         H5OBH2vyDXDbY01GLJywr7mZaQJYNCHoc8TXI8kRU7YdEk6+92E07Akn+PjhJwi8Yr7h
         yVIymmaLeuwzDMhfeE4lZ7fML1rXL8aJdBNJkcUjht3rL9F/cpxwxk6qdbSuu63zXwgw
         eqUMoumWejhDImFdXUE3ePzLJZFOS53kWX7QK6SgIj39VaN2ULLlmITfpqAxbStDWKJ0
         8QzA==
X-Gm-Message-State: AOJu0YxAyZE0jynEMCg9YRwsEU1LP2sO2Wh1BX+bCJ27eFY3pMeb4x/O
	2JqUlDMTdqAhJ4LxlL8Vb7i5ntNXY1w=
X-Google-Smtp-Source: AGHT+IFZU6oilNAmMp5GLulg+dwoZ1zspXQbywwTDejvG8kP1K7yDCwH0QkLRrw/RyNVPmFev9uMuH6PQSU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:ce94:0:b0:da0:3bea:cdc7 with SMTP id
 x142-20020a25ce94000000b00da03beacdc7mr527390ybe.2.1699285402751; Mon, 06 Nov
 2023 07:43:22 -0800 (PST)
Date: Mon, 6 Nov 2023 07:43:07 -0800
In-Reply-To: <ZUYcb6no9ADYytrx@yilunxu-OptiPlex-7050>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <ZUYcb6no9ADYytrx@yilunxu-OptiPlex-7050>
Message-ID: <ZUkJiwp8VHY0ICab@google.com>
Subject: Re: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Xu Yilun <yilun.xu@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Anish Moorthy <amoorthy@google.com>, David Matlack <dmatlack@google.com>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_074325_780319_91404202 
X-CRM114-Status: GOOD (  17.75  )
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

On Sat, Nov 04, 2023, Xu Yilun wrote:
> > +KVM_SET_USER_MEMORY_REGION2 is an extension to KVM_SET_USER_MEMORY_REGION that
> > +allows mapping guest_memfd memory into a guest.  All fields shared with
> > +KVM_SET_USER_MEMORY_REGION identically.  Userspace can set KVM_MEM_PRIVATE in
> > +flags to have KVM bind the memory region to a given guest_memfd range of
> > +[guest_memfd_offset, guest_memfd_offset + memory_size].  The target guest_memfd
>                                                         ^
> The range end should be exclusive, is it?

Yes, that should be a ')', not a ']'.

> > +static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
> > +{
> > +	const char *anon_name = "[kvm-gmem]";
> > +	struct kvm_gmem *gmem;
> > +	struct inode *inode;
> > +	struct file *file;
> > +	int fd, err;
> > +
> > +	fd = get_unused_fd_flags(0);
> > +	if (fd < 0)
> > +		return fd;
> > +
> > +	gmem = kzalloc(sizeof(*gmem), GFP_KERNEL);
> > +	if (!gmem) {
> > +		err = -ENOMEM;
> > +		goto err_fd;
> > +	}
> > +
> > +	/*
> > +	 * Use the so called "secure" variant, which creates a unique inode
> > +	 * instead of reusing a single inode.  Each guest_memfd instance needs
> > +	 * its own inode to track the size, flags, etc.
> > +	 */
> > +	file = anon_inode_getfile_secure(anon_name, &kvm_gmem_fops, gmem,
> > +					 O_RDWR, NULL);
> > +	if (IS_ERR(file)) {
> > +		err = PTR_ERR(file);
> > +		goto err_gmem;
> > +	}
> > +
> > +	file->f_flags |= O_LARGEFILE;
> > +
> > +	inode = file->f_inode;
> > +	WARN_ON(file->f_mapping != inode->i_mapping);
> 
> Just curious, why should we check the mapping fields which is garanteed in
> other subsystem?

Mostly to document the behavior.  The vast majority of folks that read this code
will be KVM developers, not file systems developers, and will likely have no clue
about the relationship between f_mapping and i_mapping.  And in the extremely
unlikely scenario that anon_inode_getfile_secure() no longer sets f_mapping, a
WARN detects the issue whereas a comment does not.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
