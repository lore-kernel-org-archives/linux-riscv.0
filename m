Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038BBEDEC02
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 02:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yhJ9R6B2wfoSMnNFekjaygn35SSBc4rAmzeJ8fpK9vU=; b=bA2xGMeJe8Zgd+
	K5ZfNPtFG4Y1CyoXEkWUq/gpkMXr2Ye7m0rC3JOGQ44Hjei9FIlNummV6WwTx93bsV/7Xy0aiLEv4
	mqoO0CHKINzs1H8UYavQK+6Itzop653Awk3wvFK/gBNkEBqp3yq7gaX9wcWoVIC9ahdeP2cMI0YLi
	ika7y6lb8jVoVQaSwZvIDC4mPBOUT/jZLg584zB4Bz949B+KcOeRbgwsJpG7BFoX3zwVkD0DtJ6iX
	9k6BEm7w2vt83I1vhIXrbGTRIJFWLPHzecJ2tpnUmWyywckLXm+Vr3W4NmVltozUXoQIUf+YYAE7P
	0/qsT/W3Mc/Frq1dhvdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxbyn-0000000GIx4-2qeK;
	Wed, 04 Mar 2026 02:28:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxbyk-0000000GIwf-2TO6;
	Wed, 04 Mar 2026 02:28:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 41CFF43A1B;
	Wed,  4 Mar 2026 02:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB983C116C6;
	Wed,  4 Mar 2026 02:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772591329;
	bh=w0enNDJ6vj/GjKs1g6Qapybf69Y+ysKOpkctiG5RrpQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=spjB+qe83UoElqhhSNfGwtYNBZK6rgflA8nN48IzNFPIWPeUr3QRcXVdCtF1NJKnf
	 z5EksqVKhftC9MLC9j/7nGeIaaTR87yGm5Rwd8MxIRtsUMKdsilMMJ3Cd9iakxj8Bd
	 EH9ATACpJVqsf4PLZG7kLZaviIgPJnXRNiYRro7z9N/ZFYixQx9IlT7mTSxw717b7C
	 FtZrlDgcd81FIPR+0JhvBn0boDgv6oQAtRyqPocimgjFVPbqTR/7W2RrWO0jyc8Sw9
	 QZEusDhvc5/gFZA6KC6+NigNLVm6yl1rbhBl2iBivGRlsjsn6q5oZHNnRRI6Qq4pAT
	 NJF9zxNmgNh2w==
Date: Tue, 3 Mar 2026 18:28:45 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Yury Norov <ynorov@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "David S. Miller"
 <davem@davemloft.net>, "Michael S. Tsirkin" <mst@redhat.com>, "Theodore
 Ts'o" <tytso@mit.edu>, Albert Ou <aou@eecs.berkeley.edu>, Alexander Duyck
 <alexanderduyck@fb.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Alexandra Winter
 <wintera@linux.ibm.com>, Andreas Dilger <adilger.kernel@dilger.ca>, Andrew
 Lunn <andrew+netdev@lunn.ch>, Anna Schumaker <anna@kernel.org>, Anton
 Yakovlev <anton.yakovlev@opensynergy.com>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Aswin Karuvally <aswin@linux.ibm.com>, Borislav Petkov
 <bp@alien8.de>, Carlos Maiolino <cem@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Chao Yu <chao@kernel.org>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Christian Brauner <brauner@kernel.org>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, David Airlie <airlied@gmail.com>, Dominique
 Martinet <asmadeus@codewreck.org>, Dongsheng Yang
 <dongsheng.yang@linux.dev>, Eric Dumazet <edumazet@google.com>, Eric Van
 Hensbergen <ericvh@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Herbert
 Xu <herbert@gondor.apana.org.au>, Ingo Molnar <mingo@redhat.com>, Jaegeuk
 Kim <jaegeuk@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Janosch Frank <frankja@linux.ibm.com>, Jaroslav Kysela <perex@perex.cz>,
 Jens Axboe <axboe@kernel.dk>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Latchesar Ionkov <lucho@ionkov.net>,
 Linus Walleij <linusw@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Mark Brown <broonie@kernel.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Miklos Szeredi <miklos@szeredi.hu>, Namhyung Kim
 <namhyung@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paolo Abeni
 <pabeni@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley
 <pjw@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Sean Christopherson <seanjc@google.com>, Simona
 Vetter <simona@ffwll.ch>, Takashi Iwai <tiwai@suse.com>, Thomas Gleixner
 <tglx@kernel.org>, Trond Myklebust <trondmy@kernel.org>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Vasily Gorbik <gor@linux.ibm.com>, Will Deacon
 <will@kernel.org>, Yury Norov <yury.norov@gmail.com>, Zheng Gu
 <cengku@gmail.com>, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-block@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 dm-devel@lists.linux.dev, netdev@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-mm@kvack.org,
 linux-perf-users@vger.kernel.org, v9fs@lists.linux.dev,
 virtualization@lists.linux.dev, linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/8] mm: globalize rest_of_page() macro
Message-ID: <20260303182845.250bb2de@kernel.org>
In-Reply-To: <20260304012717.201797-1-ynorov@nvidia.com>
References: <20260304012717.201797-1-ynorov@nvidia.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_182850_695565_C403CA2F 
X-CRM114-Status: GOOD (  13.85  )
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

On Tue,  3 Mar 2026 20:27:08 -0500 Yury Norov wrote:
> The net/9p networking driver has a handy macro to calculate the
> amount of bytes from a given pointer to the end of page. Move it
> to core/mm, and apply tree-wide. No functional changes intended.
> 
> This series was originally introduced as a single patch #07/12 in:
> 
> https://lore.kernel.org/all/20260219181407.290201-1-ynorov@nvidia.com/
> 
> Split it for better granularity and submit separately.

I don't get what the motivation is here. Another helper developers
and readers of the code will need to know about just to replace 
obvious and easy to comprehend math.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
