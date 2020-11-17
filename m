Return-Path: <SRS0=V/Dh=EX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 230CDC63697
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 20:02:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94C7B20773
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 20:02:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NTbJO2FA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="U5ZlwbFb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94C7B20773
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8uLoIpJpYN1XnOIjjgrulA5cOV7XrEaY5BVUYdm3Y4k=; b=NTbJO2FA8orQB/F/iOuYX1Cwj
	PRDU2SrxOsnRskaRZU6Tm2O+3OLmzfA7n36HPHV8JUVsF2VIkEGht8SjOfyqjLNks17lg3Bd/kwT8
	OCMNP4SIOJcZ4HX0Z37ShOg+KFT6XlrO8kABY2Ri2LFv5O620v+i9OKIUOcDVUNSavjo/Z1OO1Glz
	c/brhKgEi0yoV2GEN7Fx6s8Avm/WO45SsNXfAqrNkuN4//GFSBUzIAuTwNgyx+pKE5WD2nGW0WT65
	6fB8+g3WVq926jQ3Gs1k/BS50We7CKgynF8YmdB9OR/jiwBswwI0t1LJ2bpEYHxP3vHUOyGUoHHbu
	kTR0i3/QQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf7BG-0007w6-1Q; Tue, 17 Nov 2020 20:02:22 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf7BA-0007sy-DT
 for linux-riscv@lists.infradead.org; Tue, 17 Nov 2020 20:02:18 +0000
Received: by mail-lj1-x242.google.com with SMTP id s9so25664577ljo.11
 for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2020 12:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GSCHMMM0D0q85Saw3BGZ1mrSdRqytsRtsFlwlLFUG1Q=;
 b=U5ZlwbFbW6wzZ9SjWFK+Je9NtJURJfuA+CBtm8mpTtA3OAFV31Gt7/PVFooFI3hJSJ
 FPe5GnyQ9vo+K8E4DGvg2CmIfBjU80aj+PwOMi9JxkBrfyCFhmQwE8yG25tVzzpwHM/G
 +SLjkMHpsWn0eetojTcyUPdUG+YBEUlN6bkAREdia0RwgRe5Az5vSyoEcUpsdqwdqQS2
 wQsiqbs+NFvyybKCLcEoNJlXX+Q79meG+WhN0TKvoL+R5ZHI5kwQtcSrRMvmI503HpW4
 iQFfKDV7kGEefpCno1fqlRK8X77oqYAJVuKjI7LR9wx0wgLXu6vuCzgHwKA6G32zuy1F
 Z/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GSCHMMM0D0q85Saw3BGZ1mrSdRqytsRtsFlwlLFUG1Q=;
 b=HlLwHQNgvXgaR22JEGSa3/vNQpcBtX+IFKiItRCkc5zc5SkAQGoRQ78c1/ceE0NYvC
 paO/tzfJmyOivt/i4Zf6aVeDiJ6uVDJavuqhFTOPxV+8aX3FRVsiMsrIH72X10d/WY/q
 PH721F67tdW07NyUoif81dG0Y1bTOAewhifxxjYSzZ7g6A0mT/FqXEh1LMsQbndoOR7+
 +wYrN4jNwriXoGBMyR0pkUMlZO+ZbCHNWaZ0SXckj+FU+3EKHxCy/gVzJyzMNafK93vb
 NI+7NTQnioyBUaRqSA5+5GshhClUfTkIiBxaNFLZzKySFye2Uv6+wzGiAqf5bYzHdijy
 QhRA==
X-Gm-Message-State: AOAM532x+YdKF2QOCuGF0voZg001gv4dMRcas+xF3kKDQPMVgygxeFgp
 E4fNaOa0YZgIW06lL9WBccND+Iyp0KuCAw4vhDuH4w==
X-Google-Smtp-Source: ABdhPJzrteo1SoLGHTARp2PUs3U3i4VQkUG29Mj40M+A73s5OoqlPLDhJ7M0v+3kzosqo9RIkW4zU8tz5/C7FbMtdpI=
X-Received: by 2002:a05:651c:204c:: with SMTP id
 t12mr2581977ljo.347.1605643332643; 
 Tue, 17 Nov 2020 12:02:12 -0800 (PST)
MIME-Version: 1.0
References: <20201117162932.13649-1-rppt@kernel.org>
 <20201117162932.13649-7-rppt@kernel.org>
 <20201117193358.GB109785@carbon.dhcp.thefacebook.com>
In-Reply-To: <20201117193358.GB109785@carbon.dhcp.thefacebook.com>
From: Shakeel Butt <shakeelb@google.com>
Date: Tue, 17 Nov 2020 12:02:01 -0800
Message-ID: <CALvZod5mJnR2DXoYTbp9RX4uR7zVyqAPfD+XKpqXKgxaNyJ1VA@mail.gmail.com>
Subject: Re: [PATCH v9 6/9] secretmem: add memcg accounting
To: Roman Gushchin <guro@fb.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_150216_512051_66993B29 
X-CRM114-Status: GOOD (  15.84  )
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
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 17, 2020 at 11:49 AM Roman Gushchin <guro@fb.com> wrote:
>
> On Tue, Nov 17, 2020 at 06:29:29PM +0200, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> >
> > Account memory consumed by secretmem to memcg. The accounting is updated
> > when the memory is actually allocated and freed.
> >
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
[snip]
> >
> > +static int secretmem_account_pages(struct page *page, gfp_t gfp, int order)
> > +{
> > +     int err;
> > +
> > +     err = memcg_kmem_charge_page(page, gfp, order);

I haven't looked at the whole series but it seems like these pages
will be mapped into the userspace, so this patch has dependency on
Roman's "mm: allow mapping
accounted kernel pages to userspace" patch series.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
