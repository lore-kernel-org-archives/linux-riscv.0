Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E12C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 16:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gh3YWIe8NLZ+QZ0Fa6sFdh9R62rihrOv9KOYJCrtBUs=; b=N0scYBifGwHmVq
	HM1CR3Xl533N4AE/cY6ZRD2V29aIWZT+m0ttDPPBRaLpVHd3T+aPeL/MT7eRqVaPlPSAobyVMCzdC
	lmluOY9YRQUkGvUESC/gaLaQ1AE5dFIFn+2pRQaA1mSMX/qTXqZlCa7e9YHQQq/0q+kD8UAg7Xfhb
	o8wXqO0c4FouQYMS2QJQf3K0DKnw+fWpZyhUHTfe4mmyfy11+n9SZ+f1jBFeh8N8EyIwvOw5w8qqE
	Yu9BG/rVP8p0tOYv7EdviSpKqsn6egtfKB0d+dsB3g57zZYWn0BRhoMkGLNeM8rHMAk4+y2GTtGb7
	Bse0QwszcodztLLAsAzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyaUw-009r4s-04;
	Thu, 02 Nov 2023 16:24:46 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyaUs-009r3r-2G;
	Thu, 02 Nov 2023 16:24:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2668ACE2132;
	Thu,  2 Nov 2023 16:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFBABC433C8;
	Thu,  2 Nov 2023 16:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698942279;
	bh=1oyVMjQI7OXHCUtZSgK71uJyeSsja11PK2zu0Sgh3ck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ciKD3SqqJbMFjIcI6bCCYkwFV34fiO2ArRgF5fXcYKuOaGXb4Wyi9zozkY1GPacll
	 Wb4+rsmrOAiUFpUvVmXoDHyclytLXtYqrhZkU0PpNpIyYDeZGFKHZDDWtqHWW99OuO
	 qo3jhEw/diJ1a/cjqpth3wyK9LJTK2A2KbT6VwEC/UhcdzfCTDR5j8l+p9MS2DAQxb
	 LzKQyThoycm/wTmhlnVYtsizofoKOqeGHL2Li2UrkzPUXr3zUUph4Dx0xK0JakNnV7
	 d57GUWFGv9wIfjooWNbwoPxilLaGhd+yLjY93dOc3Y/tHVaznNMcGB6moDDpowdxsF
	 zbisHCIeWrzQg==
Date: Thu, 2 Nov 2023 17:24:27 +0100
From: Christian Brauner <brauner@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Chao Peng <chao.p.peng@linux.intel.com>,
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>,
	Anish Moorthy <amoorthy@google.com>,
	David Matlack <dmatlack@google.com>,
	Yu Zhang <yu.c.zhang@linux.intel.com>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
	Vlastimil Babka <vbabka@suse.cz>,
	Vishal Annapurve <vannapurve@google.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Maciej Szmigiero <mail@maciej.szmigiero.name>,
	David Hildenbrand <david@redhat.com>,
	Quentin Perret <qperret@google.com>,
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>,
	Liam Merwick <liam.merwick@oracle.com>,
	Isaku Yamahata <isaku.yamahata@gmail.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH v13 15/35] fs: Export anon_inode_getfile_secure() for use
 by KVM
Message-ID: <20231102-freihalten-vorsah-fdd68051b005@brauner>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-16-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231027182217.3615211-16-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_092443_113878_84CD64F1 
X-CRM114-Status: GOOD (  12.13  )
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

On Fri, Oct 27, 2023 at 11:21:57AM -0700, Sean Christopherson wrote:
> Export anon_inode_getfile_secure() so that it can be used by KVM to create
> and manage file-based guest memory without need a fullblow filesystem.
> The "standard" anon_inode_getfd() doesn't work for KVM's use case as KVM
> needs a unique inode for each file, e.g. to be able to independently
> manage the size and lifecycle of a given file.
> 
> Note, KVM doesn't need a "secure" version, just unique inodes, i.e. ignore
> the name.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

Before we enshrine this misleading name let's rename this to:

create_anon_inode_getfile()

I don't claim it's a great name but it's better than *_secure() which is
very confusing. So just:

struct file *create_anon_inode_getfile(const char *name,
                                       const struct file_operations *fops,
                                       void *priv, int flags)

May also just remove that context_inode argument from the exported
function. The only other caller is io_uring. And neither it nor this
patchset need the context_inode thing afaict. Merge conflict risk is
extremely low so carrying that as part of this patchset is fine and
shouldn't cause huge issues for you.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
