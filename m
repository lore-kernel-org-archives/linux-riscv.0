Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9629D6AB16
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 21:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KWO6rSXvioKGGgGgKqmmcHMu6+LIeOoe0HlKYtf5MlI=; b=Q7b4ZI0bMTDuRK
	7Uh134QSrLzr/Ef/Ijf7gthoAHFDmhUmrVZUwzvTCny70A5WvSXUAmim0uAl3EqVAh3KJHBE/3dAJ
	2jL2UnncQHGpVDQUP+xGvxkGDW47B2mQzf8JbIQWGYRxL4S1HrWAHMGUSbAw7adKjLYZTI+bY3NKK
	uCSJ74q5RwUBxtzSsbgm0fmf35UKiMrORC2RX9IdbzNDvkOGtumfC5tBjA3tswzmFzIDQsQfwMx3a
	P4D89F/Al233hsaSWZRwp0waQFvWugJodryzjQmKRaggUeiNAQQY5B0A9VHh6uDiljNrI87H2RA5z
	gzRBd02G5DuVgzsuxpug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Q3a-00000000pvh-40VC;
	Thu, 02 Apr 2026 21:58:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Q3X-00000000pvK-2qEg;
	Thu, 02 Apr 2026 21:58:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B9BAC403EA;
	Thu,  2 Apr 2026 21:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D96C116C6;
	Thu,  2 Apr 2026 21:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775167106;
	bh=QvUc9vANqYsb1luDp8UYk1f8BqkeVaTMVXLV75eutnQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KBJzCsq7TNcgHpU+TWPAd3W8YuuJXdgpviR9Ow38UzYp/E+eDMYCQdUq5+04/Mnru
	 vF8yruBgH9Kqoxj3RdUA00tDQnEgnr1qE7AXbmqG7qka9IVu/f1eZKTg86JWT+ETrn
	 TjxI1jdECoYVYFvAydaPvhTr0DLyOkSNS0rHhfEWArmmkmeciwTpFwX+5aQHpstoUl
	 foXfbAlUvknuR2UINHvJ3kK1f5ozCCWUSVy6PFFL3eEN4gpoDz+keSHvFP6Ep2zvPe
	 Ej2doeiB7lotVTyVy6ov80wS5IsFWdnGSH4WR6z1XJ7lBV9TObDwXGWdYhpggyK3MT
	 1b1VbHt8uneOw==
Date: Thu, 2 Apr 2026 15:58:18 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Yury Norov <ynorov@nvidia.com>
cc: Andrew Morton <akpm@linux-foundation.org>, 
    "David S. Miller" <davem@davemloft.net>, 
    "Michael S. Tsirkin" <mst@redhat.com>, Theodore Ts'o <tytso@mit.edu>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexander Duyck <alexanderduyck@fb.com>, 
    Alexander Gordeev <agordeev@linux.ibm.com>, 
    Alexander Viro <viro@zeniv.linux.org.uk>, 
    Alexandra Winter <wintera@linux.ibm.com>, 
    Andreas Dilger <adilger.kernel@dilger.ca>, 
    Andrew Lunn <andrew+netdev@lunn.ch>, Anna Schumaker <anna@kernel.org>, 
    Anton Yakovlev <anton.yakovlev@opensynergy.com>, 
    Arnaldo Carvalho de Melo <acme@kernel.org>, 
    Aswin Karuvally <aswin@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, 
    Carlos Maiolino <cem@kernel.org>, 
    Catalin Marinas <catalin.marinas@arm.com>, Chao Yu <chao@kernel.org>, 
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
    Herbert Xu <herbert@gondor.apana.org.au>, Ingo Molnar <mingo@redhat.com>, 
    Jaegeuk Kim <jaegeuk@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
    Jani Nikula <jani.nikula@linux.intel.com>, 
    Janosch Frank <frankja@linux.ibm.com>, Jaroslav Kysela <perex@perex.cz>, 
    Jens Axboe <axboe@kernel.dk>, 
    Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
    Latchesar Ionkov <lucho@ionkov.net>, Linus Walleij <linusw@kernel.org>, 
    Madhavan Srinivasan <maddy@linux.ibm.com>, Mark Brown <broonie@kernel.org>, 
    Michael Ellerman <mpe@ellerman.id.au>, Miklos Szeredi <miklos@szeredi.hu>, 
    Namhyung Kim <namhyung@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Paolo Abeni <pabeni@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
    Paul Walmsley <pjw@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
    Rodrigo Vivi <rodrigo.vivi@intel.com>, 
    Sean Christopherson <seanjc@google.com>, Simona Vetter <simona@ffwll.ch>, 
    Takashi Iwai <tiwai@suse.com>, Thomas Gleixner <tglx@kernel.org>, 
    Trond Myklebust <trondmy@kernel.org>, 
    Tvrtko Ursulin <tursulin@ursulin.net>, Vasily Gorbik <gor@linux.ibm.com>, 
    Will Deacon <will@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
    Zheng Gu <cengku@gmail.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
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
Subject: Re: [PATCH 8/8] arch: use rest_of_page() macro where appropriate
In-Reply-To: <20260304012717.201797-9-ynorov@nvidia.com>
Message-ID: <ee15482d-22a8-9686-ba64-d216b25d8e68@kernel.org>
References: <20260304012717.201797-1-ynorov@nvidia.com> <20260304012717.201797-9-ynorov@nvidia.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_145827_760839_652AE72D 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

On Tue, 3 Mar 2026, Yury Norov wrote:

> Switch arch code to using the macro. No functional changes intended.
> 
> Signed-off-by: Yury Norov <ynorov@nvidia.com>

Acked-by: Paul Walmsley <pjw@kernel.org> # arch/riscv


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
