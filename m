Return-Path: <SRS0=a4kH=HG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6482FC433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 11:35:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCB3464F46
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 11:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCB3464F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hVcyUpwPp9VfbLCcvriLryltnCmbXV7RmL27UZAWu0k=; b=W8My4S/nEsNjAyhn8bS3bbXJq
	WWQiQZGgxOZdFXkx0dXflGQiWlCvxvii4AQlehufh/GfKknMQbgkyASPvSA1bF5ad+BSLjlBxmAfl
	z4ya9sbFuNdc9tjEM7WyLvsA+2gZLuZEO6qho8KqknsmEx+VgVEK+fG3f0NKYn4KbEiOUhkpdWJRo
	JCnLwkSgqGxbqUTWqrRB9nZQaOM/RvsQSSBBIRHOrzfa2VGJKdPUXp+ltV8tvSbLZyGfWUbDjbUil
	necfjBLvEps9+12XXV47YXxajIkmJhOXvCa0crGQtJyjigj+P1MQEhfNbyIVPUTyAh7DbobjHKd/z
	xuaOL3Tvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7cuV-0003sk-U5; Thu, 04 Feb 2021 11:34:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7cuR-0003qS-KA; Thu, 04 Feb 2021 11:34:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B41964F45;
 Thu,  4 Feb 2021 11:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612438488;
 bh=kdvaYUzyR0twFNgrfjDXxc4xk/nIUc95siq77AcMxUw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sy9fx25cRRyQxUg4PQiuwRqTEHX658JxHyGPHq/88My/x1kvTH4DAJ2aISoI2aXkQ
 7q4ImT49/hSnXgZZe5nIte5an8yCdFl3/nKBSmL1KtXUQmhK86d+bWvAKpFB/hCPJ+
 vHFmENUyT6t71Pv7oR0jOWL5QdCiNYnsM7hkVvYdNA83FthQ8MT6l5HSIaqDtEq017
 v3Uf42+f0Hl/atXgvQESI8GiyyIE+mqMxGUZE9ZuSWQ78rGF9JCQdy6unJPKAA/OZt
 AfPnD+C9cBVf98rjrYDltnlBiJ+vDveF6Nvs2anXspx7fDGAP1j2/zrNQYpSDiRu3a
 P3N5VPANbVUIA==
Date: Thu, 4 Feb 2021 13:34:32 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v16 06/11] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <20210204113432.GS242749@kernel.org>
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-7-rppt@kernel.org>
 <YBqT/nwFpfP2EyeJ@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YBqT/nwFpfP2EyeJ@dhcp22.suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_063451_874581_E7500295 
X-CRM114-Status: GOOD (  13.71  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 03, 2021 at 01:15:58PM +0100, Michal Hocko wrote:
> On Thu 21-01-21 14:27:18, Mike Rapoport wrote:
> > +static struct file *secretmem_file_create(unsigned long flags)
> > +{
> > +	struct file *file = ERR_PTR(-ENOMEM);
> > +	struct secretmem_ctx *ctx;
> > +	struct inode *inode;
> > +
> > +	inode = alloc_anon_inode(secretmem_mnt->mnt_sb);
> > +	if (IS_ERR(inode))
> > +		return ERR_CAST(inode);
> > +
> > +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> > +	if (!ctx)
> > +		goto err_free_inode;
> > +
> > +	file = alloc_file_pseudo(inode, secretmem_mnt, "secretmem",
> > +				 O_RDWR, &secretmem_fops);
> > +	if (IS_ERR(file))
> > +		goto err_free_ctx;
> > +
> > +	mapping_set_unevictable(inode->i_mapping);
> 
> Btw. you need also mapping_set_gfp_mask(mapping, GFP_HIGHUSER) because
> the default is GFP_HIGHUSER_MOVABLE and you do not support migration so
> no pages from movable zones should be allowed.

Ok.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
