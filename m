Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7738AC43334
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 13:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c4ZYz0WdBu2WZsHXf5GFa65AVKnmN/FD0Fof3l0xnLA=; b=qeBAdF/DtAMNRf
	i4KQW1zblem21v/wdpY1tSXF0/Vhzxie3lNpxAc6WYMeINnTEMaPA1/8XP0Is2OZaUu557Kjfq2f2
	hXY3NoTkqo4ngdqncWoCyqaVA6Co8oIq5Vs9sw4L3PA2ElB3XV8HLmvDJNzjVeH00AhuEEg54ZOkX
	heI0fbYQHcRfKeG6jpJdQ7PdVntI3kg2ZvY5O4SyhoydusL9mjUTcElViNOS3HAWkOs+ekFsMhZur
	uKq4vRjdOW/H8eGx3DR+aCjiqmvZUnhm2WcnCJVdqzwdho1b7GBmCQGkduia50L3ZFbFzc2TXtnms
	CmFWeF5Yvozwe5z6sPhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwkUg-003JLb-OU; Thu, 02 Jun 2022 13:04:06 +0000
Received: from sym.noone.org ([178.63.92.236] helo=sym2.noone.org)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwkUd-003JKM-FP
	for linux-riscv@lists.infradead.org; Thu, 02 Jun 2022 13:04:05 +0000
Received: by sym2.noone.org (Postfix, from userid 1002)
	id 4LDR6N62M9zvjhW; Thu,  2 Jun 2022 15:03:56 +0200 (CEST)
Date: Thu, 2 Jun 2022 15:03:56 +0200
From: Tobias Klauser <tklauser@distanz.ch>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	rppt@kernel.org, Arnd Bergmann <arnd@arndb.de>,
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH] riscv: Wire up memfd_secret in UAPI header
Message-ID: <20220602130355.y4npvxm3wegnwjpp@distanz.ch>
References: <20220505084611.tut66faep5r37r6c@distanz.ch>
 <mhng-671a8d6b-c318-431b-b209-c6bde465a420@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-671a8d6b-c318-431b-b209-c6bde465a420@palmer-ri-x1c9>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_060403_705086_65E1F52D 
X-CRM114-Status: GOOD (  14.59  )
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

On 2022-06-02 at 07:57:21 +0200, Palmer Dabbelt <palmer@dabbelt.com> wrote:
> On Thu, 05 May 2022 01:46:11 PDT (-0700), tklauser@distanz.ch wrote:
> > On 2022-05-05 at 10:18:15 +0200, Tobias Klauser <tklauser@distanz.ch> wrote:
> > > Move the __ARCH_WANT_MEMFD_SECRET define added in commit 7bb7f2ac24a0
> > > ("arch, mm: wire up memfd_secret system call where relevant") to
> > > <uapi/asm/unistd.h> so __NR_memfd_secret is defined when including
> > > <unistd.h> in userspace.
> > > 
> > > This allows the memds_secret selftest to pass on riscv.
> >                   ^- this should say memfd_secret
> > 
> > I can fix it up in a v2 if needed.
> 
> No big deal, I don't mind squashing stuff like that.  This is on for-next
> (no fixes, I'm still on 5.19).  I added
> 
> Fixes: 7bb7f2ac24a0 ("arch, mm: wire up memfd_secret system call where relevant")
> Cc: stable@vger.kernel.org
> 
> but LMK if you think that's wrong for some reason.

All of the above sounds good to me. Thank you!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
