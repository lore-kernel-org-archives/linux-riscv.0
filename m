Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3B9EB7ECF
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 12:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sJTo0y83WNKb/s9UQUMybwSUlRHk4oZ1vu0pRMnlEmY=; b=dK+QL5pqC0n/hq
	3fqoOyurJaTp1H9N0jt4mufYmShbI84XaBXsu2e88/Mod65A+0FdSdcn2klINlImrIHIsOfBJQi2/
	r4ZySSqhkNltsKDK0LgyLlTpkJ7TR6vq+YNQW3/hjIaGZnM0WRMxDgOt4e7hQqsQuFxCCsF951FIU
	68V6F0Pb/G+mzbZFaPxpsgLktFP66lKi7dYsxtos2hUYLTeYQQYMx/sipleaSvsDFuWdO3Da2LasY
	eTpsJgYUoKV8GWvup5765Vl2glihBuXIeIQwjMuZNFsoDIK3p8m8cUXYK1DKChmhJs9Pot81PrJeS
	oFUwHYXMOatT4HkM5KSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxle7-0000000HCeM-2r6L;
	Wed, 04 Mar 2026 12:48:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxle5-0000000HCd7-3cqg;
	Wed, 04 Mar 2026 12:48:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YsXg2qDZ+ZjnQnj/eNfiIgU3SLUyimkRR7bx5y5oB4w=; b=U5NhpZCn934XojSyVFL1nj1S/W
	2SwNvFKnKgDXQSzq6m51IMvSlZX+ne4bEh4E01vZtYgpLee5ixUDi8qEHb4R97fy2f4d2ReNAtXFl
	2Myy/FM9yjpIi4F5MCjGcXNEoyN2WDgyc7039UPkredIXwYhk1etVNasHnwai+IB6c4ro8VQTd24m
	dlAjACdWYLWNFfSy+VdBxKivYhNczBRSHxMPHao0CvqQusPNjCznq/i4rksmb+FqExqEhxu3s5ruZ
	HIicL8wW2i2h8YBWX0vQS1a34HK9wPAQFs79TabY9VaeD6tSKbvzAdMAvOXPYXBWy7iVhi1jbb7PJ
	KVa5pNSQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxle2-00000004Z41-2FWR;
	Wed, 04 Mar 2026 12:48:06 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 07040300666; Wed, 04 Mar 2026 13:48:06 +0100 (CET)
Date: Wed, 4 Mar 2026 13:48:05 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Jens Axboe <axboe@kernel.dk>, Jakub Kicinski <kuba@kernel.org>,
	Yury Norov <ynorov@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Theodore Ts'o <tytso@mit.edu>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Alexandra Winter <wintera@linux.ibm.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Anna Schumaker <anna@kernel.org>,
	Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Aswin Karuvally <aswin@linux.ibm.com>,
	Borislav Petkov <bp@alien8.de>, Carlos Maiolino <cem@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chao Yu <chao@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Christian Brauner <brauner@kernel.org>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Dongsheng Yang <dongsheng.yang@linux.dev>,
	Eric Dumazet <edumazet@google.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ingo Molnar <mingo@redhat.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Linus Walleij <linusw@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mark Brown <broonie@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Namhyung Kim <namhyung@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <pjw@kernel.org>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Simona Vetter <simona@ffwll.ch>, Takashi Iwai <tiwai@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Trond Myklebust <trondmy@kernel.org>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
	Yury Norov <yury.norov@gmail.com>, Zheng Gu <cengku@gmail.com>,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-block@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	dm-devel@lists.linux.dev, netdev@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-mm@kvack.org, linux-perf-users@vger.kernel.org,
	v9fs@lists.linux.dev, virtualization@lists.linux.dev,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/8] mm: globalize rest_of_page() macro
Message-ID: <20260304124805.GB2277644@noisy.programming.kicks-ass.net>
References: <20260304012717.201797-1-ynorov@nvidia.com>
 <20260303182845.250bb2de@kernel.org>
 <f8d86743-6231-414d-a5e8-65e867123fea@kernel.dk>
 <aaedwFwXh9QXS3Ju@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aaedwFwXh9QXS3Ju@google.com>
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

On Tue, Mar 03, 2026 at 06:49:36PM -0800, Sean Christopherson wrote:
> On Tue, Mar 03, 2026, Jens Axboe wrote:
> > On 3/3/26 7:28 PM, Jakub Kicinski wrote:
> > > On Tue,  3 Mar 2026 20:27:08 -0500 Yury Norov wrote:
> > >> The net/9p networking driver has a handy macro to calculate the
> > >> amount of bytes from a given pointer to the end of page. Move it
> > >> to core/mm, and apply tree-wide. No functional changes intended.
> > >>
> > >> This series was originally introduced as a single patch #07/12 in:
> > >>
> > >> https://lore.kernel.org/all/20260219181407.290201-1-ynorov@nvidia.com/
> > >>
> > >> Split it for better granularity and submit separately.
> > > 
> > > I don't get what the motivation is here. Another helper developers
> > > and readers of the code will need to know about just to replace 
> > > obvious and easy to comprehend math.
> > 
> > I fully agree, I had the same thought reading this.
> 
> +1 from KVM-land.

Right, this. I hate these pointless helpers that obscure perfectly
sensible and obvious code -- and for me that includes things like
rounddown() and DIV_ROUND_UP().

It just makes the code harder to read.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
