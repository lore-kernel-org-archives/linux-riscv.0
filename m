Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F66AC4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 15:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l9zcfqLW/0m5gXFCsjfnzyl5SURCM+CfRJRwjhcNJfE=; b=ccH+hkrKTpea+x
	eOjQmYqbZFKlQ2ByfS8SHAiQTnY1gk3ppRVd+DG+pFBkUeAUsLNQ6bBGLaqo5waRVYAXicBwqHAcO
	btGO4dkg+7ACiXPhv6VsRZwq7/IxeV1ByRuSCpGN0HH9rHuRJ0lXKUzsjxDvMv/th/zZsaCYrc+Pp
	lowXuwrRbSATElmI73DGxSkbVR9/av1SLsESMyo2jzGtj4U1esatdGJRhGT3G3KW27A3FKKPsTjby
	K/wo2WAHBuWJP0h+RQn14nXLn6ANBPhU5bchLBu1Ga4Nf+E2hQpjRzQRfVfVTnVF6/9ooiTRUNN5/
	TtVef6pNinlj1O8QfYzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r01L8-00Gy4j-0I;
	Mon, 06 Nov 2023 15:16:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r01L4-00Gy3a-2e;
	Mon, 06 Nov 2023 15:16:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 750E260DDA;
	Mon,  6 Nov 2023 15:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC322C433C8;
	Mon,  6 Nov 2023 15:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699283789;
	bh=zDZFduCEDJmeuVjp8rHp1YK3z18DtyX3wrd2wnaF+Bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qMMyAp8P8d1YZR+ToLbBSMxg7E0h+nAM09J8k36AJrgWT3pLgMKJv3rUJwYZoBC+5
	 /7HcfewbvKZBV+XxkAhBXKfAMpJI5v88gc4Hx8N8Z+ws3elm72tPTVmOM+mru/Ax7o
	 hgKcBnrkjrOwDRP6ZT7ROB1Yw66jbjLQJ8E14gCmpX61VhuiBziDh0K7mRiqlcqPKr
	 f2Apj/1uFkrm0Y9QqXxL4Y0uZAXlZ2WeCIdMR3xorlstgRMc5NC4/sI8S+JkZDghFD
	 iwus793QJkToU2FLLBik2jgcjMG6YyKIg5FBdgreEw23GWddN78m4uMrF2NWf2K1cn
	 BhSHwanj5lm1w==
Date: Mon, 6 Nov 2023 16:16:16 +0100
From: Christian Brauner <brauner@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sean Christopherson <seanjc@google.com>,
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
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH 14/34] fs: Rename anon_inode_getfile_secure() and
 anon_inode_getfd_secure()
Message-ID: <20231106-kondor-anfahren-23157efabaef@brauner>
References: <20231105163040.14904-1-pbonzini@redhat.com>
 <20231105163040.14904-15-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231105163040.14904-15-pbonzini@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_071630_941507_C0031E84 
X-CRM114-Status: GOOD (  20.25  )
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

On Sun, Nov 05, 2023 at 05:30:17PM +0100, Paolo Bonzini wrote:
> The call to the inode_init_security_anon() LSM hook is not the sole
> reason to use anon_inode_getfile_secure() or anon_inode_getfd_secure().
> For example, the functions also allow one to create a file with non-zero
> size, without needing a full-blown filesystem.  In this case, you don't
> need a "secure" version, just unique inodes; the current name of the
> functions is confusing and does not explain well the difference with
> the more "standard" anon_inode_getfile() and anon_inode_getfd().
> 
> Of course, there is another side of the coin; neither io_uring nor
> userfaultfd strictly speaking need distinct inodes, and it is not
> that clear anymore that anon_inode_create_get{file,fd}() allow the LSM
> to intercept and block the inode's creation.  If one was so inclined,
> anon_inode_getfile_secure() and anon_inode_getfd_secure() could be kept,
> using the shared inode or a new one depending on CONFIG_SECURITY.
> However, this is probably overkill, and potentially a cause of bugs in
> different configurations.  Therefore, just add a comment to io_uring
> and userfaultfd explaining the choice of the function.
> 
> While at it, remove the export for what is now anon_inode_create_getfd().
> There is no in-tree module that uses it, and the old name is gone anyway.

That's great, thanks.

> If anybody actually needs the symbol, they can ask or they can just use
> anon_inode_create_getfile(), which will be exported very soon for use
> in KVM.
> 
> Suggested-by: Christian Brauner <brauner@kernel.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Looks good to me,
Reviewed-by: Christian Brauner <brauner@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
