Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736F3C5CFDB
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 10:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aiWIYYeY2nFDGjhGIj6ufsB/aA9yfnkWSFzDyc6mH1A=; b=cqz6B4RBj+fMUs
	V4rPxcoBvBvexi0ULXVQ8nLgGW841sXYa3NyMQ9sDLJuhz0fW7VggQdYENpyvu1bCKiIzeAyLw8wJ
	kw7FHeloQr38GvOJI0FyinhVMEbtYzA25pFCzsQohGHpfPiMF5VGaiytzQRIy/CZSdx+2agH0CRNY
	+NTDldNjw0C6FhYgJb77Hli74QlnIBoiNWbE+Pzzwms4PdZ0nT7L1BmLZ1W7TA3Pm99HijQKlb4/P
	5gPdj9MMtU6zOY44Lp9qYYkmrHOXuuAyu0D8mMOHoZak9863ag1T84knx+kZ7IhxdRK+M8X9GEGAH
	Qo84RXLroicui7gfX54g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSXR-00000000RpU-2z6k;
	Thu, 13 Aug 2026 10:19:53 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSXP-00000000Rno-1RQp
	for linux-riscv@lists.infradead.org;
	Thu, 13 Aug 2026 10:19:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qdAeuLqcTg0r3BctkPvFE7yUe+SHFHuPonXE6/RBmLw=; b=wWHO0cgqWKxsqqTEf9XD1q7ptH
	W0ilpGHM5+3y5MzIcVSHDLVUdi1zLN+UQFT2Q1tvKSwGvP7dSYtkYRPkH8NmAwMSx39duVmwpLU5M
	3mo6PEPYeY2Jb1MrizS3YAgerjBQR6o/4TL+7k/Ne1OnEYQHyTFGaCDGklBCRkGG3ZNtVKDjWJfLd
	NU0lPT3m+/kKNQrnqpkd4ic0S77aCV2KRW9nNCV8Ksf1HUxfAl73S2CzvmFZprw8Sx0lVUeR6A+1T
	IgUifsVYwD0HO1zBMe/H4zuY353uS3RmrG/SVjDWYfKTXUoSHvma015fSllLmIn6/TQ3dDu31RF+F
	mE5zfNjA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wuSX4-0052dW-3D;
	Thu, 13 Aug 2026 10:19:31 +0000
Date: Thu, 13 Aug 2026 03:19:26 -0700
From: Breno Leitao <leitao@debian.org>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: SJ Park <sj@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, kernel-team@meta.com, 
	Andrew Morton <akpm@linux-foundation.org>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, david@kernel.org
Subject: Re: [PATCH v2] tools/mm: add hwpoison-panic tool
Message-ID: <an2Yr4n6ahggXKo1@gmail.com>
References: <20260803-memory_failure_rewrite_test-v2-1-ed020ce42129@debian.org>
 <be68a841-a326-4826-8e02-5148736dd356@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <be68a841-a326-4826-8e02-5148736dd356@huawei.com>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_031951_392096_665B1979 
X-CRM114-Status: GOOD (  13.10  )
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

Hello Miaohe,

First of all, thanks for looking at this one.

On Thu, Aug 13, 2026 at 03:32:34PM +0800, Miaohe Lin wrote:
> On 2026/8/3 19:31, Breno Leitao wrote:
> > +static int pick_kpageflags_phys_addr(uint64_t want, uint64_t *phys_addr)
> > +{
> > +	uint64_t pfn = (16UL << 20) / page_size;
> 
> Could we use SZ_16M macro here?

Sure, for that I will include ../../include/linux/sizes.h in the next
version.

> > +/* hard_offline_page() injects with MF_SW_SIMULATED, so unpoison is allowed. */
> > +static void unpoison_pfn(uint64_t pfn)
> > +{
> > +	char path[PATH_MAX], buf[32];
> > +	const char *debugfs;
> > +	int fd, len;
> > +
> > +	debugfs = debugfs__mount();
> 
> I might be miss something but I can't find the implementation of debugfs__mount.

It is an ugly macro declared in tools/lib/api/fs/fs.h:

        #define FS(name)                                \
                const char *name##__mountpoint(void);   \
                const char *name##__mount(void);        \
                bool name##__configured(void);

And then:
        FS(debugfs)

> > +	if (access(INJECT_PATH, W_OK))
> > +		fatal("%s not present (no MEMORY_HOTPLUG?)\n", INJECT_PATH);
> 
> MEMORY_HOTPLUG?

lol. it should be MEMORY_FAILURE

I will get these points fixed and respin.
--breno

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
