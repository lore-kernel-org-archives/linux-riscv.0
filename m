Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A51CC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 18:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GZakbzv3eAxBPKJZECS5Yb1lWvuN8qS9IF7Xv3JgEJU=; b=HuV31QjaL1lZGc
	m7Hyi/gt80768FPtjNlTSs2fh387HJr0Mp4UlIuuays9cU7/IXFDKV9W12euFLknFrmDBFfx5psw8
	6/IG9NsD1H1OR75Q71WR0jrguVein+9r8QdkehaR0wDoCRqEInOGEN8QOU33r28nWnWJ2dL7Qk3C5
	3IqTfFo2IMnYn9QGMDrgnqsqpedbXGNezqR2ux2r9VurVK5K/+m0hkNL3uqKLkyS4GfkwVyTCp8wK
	+X1fHSX4vak+WGDOykr4zpRDOb1XRzCzni32MxbVihPDUH+marSb3whJnLDbnehiuhOZqRF9eedM3
	lFuyn3/nV7FVLgG7JU3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpafa-003DWh-0S; Tue, 23 Nov 2021 18:37:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpafX-003DVO-Df
 for linux-riscv@lists.infradead.org; Tue, 23 Nov 2021 18:37:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 570C860F51;
 Tue, 23 Nov 2021 18:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637692646;
 bh=CPp+EZzvht2UJuG3JAmmdvF/axVrYgpUWpHqf/YqpYI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oC/3OeS/Lcp9RHr5Zd07yQdbSTFmAbQks3s3QF2h1MFV110EfTkrUc3LD0/I32cF4
 TAIozCZM8LCV+jiVw99wlyh+Z/OnHcquy5ruseHAWF5jC9c871IKikV1Fbz8X0xuBy
 pZmrpNWfaMWkzLeK+Go2PCtcr3xzxfZjUxUoQ2ByCsFOd8FM2R4l+az0RoD8wCmum6
 NDVAWL5jiShWE5EC8mZ5jiEvNH8ioLqxy/4mFq89APdWdrIpsf21he3s/jN+2IOI/z
 XSVV63+ABDP4DXcUDZUYyDzI+NTPPCV2sMMqU4ZsimBhu+TSzvmqyebUlMXz3auNoH
 9gJJWilfUo6rA==
Date: Tue, 23 Nov 2021 10:37:25 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Song Liu <song@kernel.org>
Cc: fenghua.yu@intel.com, reinette.chatre@intel.com, bpf
 <bpf@vger.kernel.org>, james.morse@arm.com, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, dave.hansen@linux.intel.com, X86 ML <x86@kernel.org>, "H.
 Peter Anvin" <hpa@zytor.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH bpf] cacheinfo: move get_cpu_cacheinfo_id() back out
Message-ID: <20211123103725.204a854c@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <CAPhsuW4g1PhdczQh=iqDR_CzB=6FoM4QPF9DmknEP0hZ_Ac3TA@mail.gmail.com>
References: <20211120165528.197359-1-kuba@kernel.org>
 <CAPhsuW4g1PhdczQh=iqDR_CzB=6FoM4QPF9DmknEP0hZ_Ac3TA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_103727_566374_69ACFE6D 
X-CRM114-Status: GOOD (  14.16  )
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

On Tue, 23 Nov 2021 07:45:41 -1000 Song Liu wrote:
> > x86 resctrl folks, does this look okay?
> >
> > I'd like to do some bpf header cleanups in -next which this is blocking.
> > How would you like to handle that? This change looks entirely harmless,
> > can I get an ack and take this via bpf/netdev to Linus ASAP so it
> > propagates to all trees?  
> 
> Does this patch target the bpf tree, or the bpf-next tree? If we want to unblock
> bpf header cleanup in -next, we can simply include it in a set for bpf-next.

No strong preference. Since this is very much not a bpf patch and
should be safe my intuition is to ship it to Linus ASAP and avoid 
any potential conflicts with other -next trees. Also riscv people 
may appreciate it getting fixed sooner rather than later. If they 
trip up the same dependency later on in the cycle and we've already
committed this patch to bpf-next they'd have to duplicate the patch
in their tree.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
