Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B21CA0EEB
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 00:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DyvjgMIRea8tl2w9+FgVNGM/su0hxAIesjZsGLyGGSY=; b=fmikmAonyhHvj9
	6jqY+Y5jaGyMK9curEvMM/pkcW98Nj+C80Y0gR1rjMNYubZh0EOLWjK7E7POgnaRlzTfum0Cw9moR
	bSmAIMMv7gLG1gVSOhMA4R2ioLTbydN8OmAFc56Hf670ZqEspOthjGVJlKtPVQ8uKDs9uOXLCGdhk
	iZAOKD0w7OhCXw/vDIGrTtS2ANjPVH7z+Ma2ifnrR9f0ZS9SQY8RraL+K+FfvuPB4q8cQvWzH/D7g
	H6uHn4wQ1VTtHYF0g9Uf2p9nDBawpPtUjx+bhnBMAl776d4U/ld7MMmGMmVC9pblZzTz42QM5lkh1
	zvjH/HR74ZbIUi6HNDnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoWzB-0000000BzJE-0Fr4;
	Wed, 20 Aug 2025 00:47:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoVBq-0000000BnDI-3nMt
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 22:52:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2ACA35C54FB;
	Tue, 19 Aug 2025 22:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F330CC4CEF1;
	Tue, 19 Aug 2025 22:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1755643945;
	bh=VHQSLjKvrE7HNYDGcF9hXuERvtRcIH2r8IoBLnp3tGI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VRxHnEG0v+ow/6aDnDx9elsJSvUiowJJ8lN6T/rQnlpoiVhnpwkQciMdIi1zv7RGi
	 JjRDJ+b5lNRiClIOfVFV9zJEGb4tyLGmOugHSddO5s/H/Xv/WdbI/U9GjhEUmqdAYU
	 IYxp75U+ahWCvfr+9L94JLCV8JuGzpMCyjjDGXrA=
Date: Tue, 19 Aug 2025 15:52:24 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, David Hildenbrand
 <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jason Gunthorpe
 <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu
 <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>, Zi Yan
 <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache
 <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain
 <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, Shuah Khan
 <shuah@kernel.org>, kernel@collabora.com
Subject: Re: [PATCH v2 4/8] selftests/mm: Add -Wunused family of flags
Message-Id: <20250819155224.23fe3d79896e269bd9e27d04@linux-foundation.org>
In-Reply-To: <57c816d6-a9ba-47c9-8f40-3978580b7f67@arm.com>
References: <20250731160132.1795351-1-usama.anjum@collabora.com>
	<20250731160132.1795351-5-usama.anjum@collabora.com>
	<57c816d6-a9ba-47c9-8f40-3978580b7f67@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_155226_989800_07E3E610 
X-CRM114-Status: GOOD (  13.09  )
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

On Mon, 18 Aug 2025 10:16:35 +0200 Kevin Brodsky <kevin.brodsky@arm.com> wrote:

> >  # Avoid accidental wrong builds, due to built-in rules working just a little
> >  # bit too well--but not quite as well as required for our situation here.
> >  #
> > @@ -35,6 +34,7 @@ MAKEFLAGS += --no-builtin-rules
> >  
> >  CFLAGS = -Wall -O2 -I $(top_srcdir) $(EXTRA_CFLAGS) $(KHDR_INCLUDES) $(TOOLS_INCLUDES)
> >  CFLAGS += -Wunreachable-code
> > +CFLAGS += -Wunused  -Wunused-parameter -Wunused-function -Wunused-label -Wunused-variable -Wunused-value
> 
> -Wall implies all of these except -Wunused-parameter (at least according
> to gcc(1)).
> 
> As to -Wunused-parameter I am frankly not convinced it's worth the
> hassle. We're getting 90 lines changed in patch 6-8 just to mark
> parameters as unused, in other words noise to keep the compiler happy.
> It is not enabled by default in the kernel proper precisely because it
> is so noisy when callbacks are involved.

Yeah, we rely upon unused parameters in a million places:

#else
static inline void some_stub_function(type1 arg2, type2 arg2)
{
}
#endif

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
