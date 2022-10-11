Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DE0C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Oct 2022 18:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iWbkLQ/hypQO5kN97WYoveEqphxJC/CNDOpwwEqBBIU=; b=RNidaZJdCsjgBY
	HoMqN57Tw2hLvFzPh3alEdMVOFc3OW49WHh7zeBVos4ZmdA8Zddb+3qLywFVO3Eww5If5YqCS9PRW
	PEGKshDe3BIerVAN2VCHwazZYNOA3gsyO/uGbE4OqvO9Fk77yYl1SSeTE7Bvj9XcaNWiFL1YShp3s
	j56B/Qk9DlDsgHL+MSU8gEx3K6CnykYT0qBKMRDINjX//fdDN6wfZNzo5WT8oKpctDy0MvmLB57E/
	e4DprSbPjd0VRYtM7he8/jmU2RO5vviJroJPJR/vpf1j1fOc6CgawZ76oYU7ccpYRXJy4Htp/Gc6G
	pdGhWuF3otB7MCuoFwtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiJxM-005RI7-Bf; Tue, 11 Oct 2022 18:26:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiJxJ-005RHJ-Js
	for linux-riscv@lists.infradead.org; Tue, 11 Oct 2022 18:26:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E47276125B;
	Tue, 11 Oct 2022 18:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC2AC433D6;
	Tue, 11 Oct 2022 18:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665512776;
	bh=J1QglBDz0A4rrN8x8OQRswdslKdljioFPj+KQgEeTtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rYL+UfgN0YEuAZOgwbeVumJflwBLesqSB0hK/UZJUf+6vINcQ3+J9YqxYFpBpBS4N
	 hlKBv2feGsEOIORc5DNn6BlwJ9LmHXBvqt9g5HZHozoHIqvy/bu7WIDfg8Et8ELetc
	 J+IUhAwixh0IF5Ni7EzjvyHDEpRVpxAZErqXDag03CDZBNIPVdapCAc669/Yug7iS6
	 hwsbdNAjU4ca/rRuoTdDU31Rj6c+zFBWN+3LMnnG0CxEIpTSdDfVA+Yhnsr4wWmPpf
	 Ua18QtbDqvID1nmTJgnHYgj5bWAZi09uov4X6ShO0yj5FWWsubiHKkgrpAhn0bnILC
	 xF654ElDRBzYQ==
Date: Tue, 11 Oct 2022 19:26:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: conor.dooley@microchip.com, linux-riscv@lists.infradead.org
Subject: Re: [GIT PULL 0/2] microchip maintainers updates
Message-ID: <Y0W1RCmy7DOkJw4/@spud>
References: <20221010221704.2161221-1-conor@kernel.org>
 <mhng-3d156172-2b15-4ef8-abe8-3eb251a528eb@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-3d156172-2b15-4ef8-abe8-3eb251a528eb@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_112617_716492_E0079F84 
X-CRM114-Status: GOOD (  15.75  )
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

On Tue, Oct 11, 2022 at 11:20:29AM -0700, Palmer Dabbelt wrote:
> On Mon, 10 Oct 2022 15:17:03 PDT (-0700), Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > Hey Palmer,
> > 
> > Two maintainers changes that I posted on the lists a while back.
> > Neither applied at the time b/c the maintainers entry was being updated
> > in the soc fixes branch and in some for-next branches at the same time
> > and they conflicted.
> > 
> > If you could pick the two that'd be great.
> 
> So you want me to just pick up these patches?

Please.

> That's OK, it's just not a
> pull request and that's what the subject says.

Sorry about that. I'd seen people doing it that way for trivial
patchsets, eg to arm-soc for dt-bindings, to signify that they
were intended to be/ready to be picked directly. I'll stick with
"pull" for tags only in the future.

Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
