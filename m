Return-Path: <SRS0=F/sc=EY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B03DFC56202
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2020 06:55:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1D4224654
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2020 06:55:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aF5sLtfH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="oiKSsv9R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1D4224654
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0wVY8CdSKDvUkeEg3g37jlYDiFRuAKpj6etDHD3sg5M=; b=aF5sLtfHw7N3PwAT3O+z65uST
	pslBfo9p+FfPosmcVKsqrhOELlhsH/EYM5WPxx6KZQ/zUQxyx3hlB2HVyWDlcmSDdd+fflun14xkc
	U/aUQSwIoTyXVj4Tiz0Y9Kf3VcqYWZdFOTLIhlSaUTTnv0txvzdzwoQqteTKFk29wuPEfr3O2IB+b
	yW8v81Fx1+M4X/SgZ31cUtFxzg7enUw3WNN4GfpsiFT3afi5HFP3z15zKqJdB0VNqVBkggKmcTobM
	AIg0u/Nvu2D3ve4vRu9uMeMMtEzeuERTz3xgH+B6ZJzspt5MyewEz0sgubMEE9g2jDA5zRLij1h3M
	+4YMaXzDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfHNL-00047b-M6; Wed, 18 Nov 2020 06:55:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfHNH-00045v-7z; Wed, 18 Nov 2020 06:55:28 +0000
Received: from kernel.org (unknown [77.125.7.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6554424655;
 Wed, 18 Nov 2020 06:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605682525;
 bh=ijXF7PUCZPM+SCn0c+6woTjKwc8l6BuK+EQkKzOZoH8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oiKSsv9RDCQm1S/HmggqtrPvdJmgXqMRBK6MAHqh9Yd/MlSYNip+OwN+JVDWvyw4j
 PaowVWNf6v5Qw5aC1zUcALKjA0MeiiAKYuhFd5N18H92PtIsqdOsAxh4AC1cLHAVVu
 7NvCS9CGGb6cKrHrwQ+X3wdidxAmVeF4uLboBzI8=
Date: Wed, 18 Nov 2020 08:55:09 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Shakeel Butt <shakeelb@google.com>
Subject: Re: [PATCH v9 6/9] secretmem: add memcg accounting
Message-ID: <20201118065509.GK370813@kernel.org>
References: <20201117162932.13649-1-rppt@kernel.org>
 <20201117162932.13649-7-rppt@kernel.org>
 <20201117193358.GB109785@carbon.dhcp.thefacebook.com>
 <CALvZod5mJnR2DXoYTbp9RX4uR7zVyqAPfD+XKpqXKgxaNyJ1VA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALvZod5mJnR2DXoYTbp9RX4uR7zVyqAPfD+XKpqXKgxaNyJ1VA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_015527_448078_4F45DA6D 
X-CRM114-Status: GOOD (  19.90  )
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
 Dave Hansen <dave.hansen@linux.intel.com>, Linux MM <linux-mm@kvack.org>,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 17, 2020 at 12:02:01PM -0800, Shakeel Butt wrote:
> On Tue, Nov 17, 2020 at 11:49 AM Roman Gushchin <guro@fb.com> wrote:
> >
> > On Tue, Nov 17, 2020 at 06:29:29PM +0200, Mike Rapoport wrote:
> > > From: Mike Rapoport <rppt@linux.ibm.com>
> > >
> > > Account memory consumed by secretmem to memcg. The accounting is updated
> > > when the memory is actually allocated and freed.
> > >
> > > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> [snip]
> > >
> > > +static int secretmem_account_pages(struct page *page, gfp_t gfp, int order)
> > > +{
> > > +     int err;
> > > +
> > > +     err = memcg_kmem_charge_page(page, gfp, order);
> 
> I haven't looked at the whole series but it seems like these pages
> will be mapped into the userspace, so this patch has dependency on
> Roman's "mm: allow mapping
> accounted kernel pages to userspace" patch series.

Yes, that's why I rebased the patches on top of mmotm.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
