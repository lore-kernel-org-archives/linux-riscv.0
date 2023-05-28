Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BEBC77B7C
	for <linux-riscv@archiver.kernel.org>; Sun, 28 May 2023 10:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=otvKhFaC39gVlWdvAo/MUan8iEAnfCDFylzn20VbxEw=; b=yNgLSoppMCpDnS
	6PvC7pA3MeVYp+y5lCVFFdCYkyOIMzeAY3tPNLOG1J7bLPi1crgoOcAHtUpGHkEMXrkOeekFclBJ5
	mkPiVojd55Wzv1bExCHp/4QK+0ZFPCM/E6VQvAN57TKmgW2hqGkirom9PfXKk7WhKPYzI9Vxtnrk8
	7VpnJeMpfmqR9U5krBdAUZDzyzZldYWnb9jNPV08JdfkLWutWIejBkzI/2fOOOUCjnXR7QFTK10iA
	Pj91FGO8fAuqg4/8jH5KYFVaOhjKnqw6Wlhqbl/kdOa2UwOmybE2MczNyjTjktayUPlXSemXf0CcS
	n9M9Gkr6mP3j3nUGgahQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3DSa-007Kx9-0p;
	Sun, 28 May 2023 10:17:12 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3DSV-007KwS-2b
	for linux-riscv@lists.infradead.org;
	Sun, 28 May 2023 10:17:10 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 34SAH2PX002019;
	Sun, 28 May 2023 12:17:02 +0200
Date: Sun, 28 May 2023 12:17:02 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>
Cc: Zhangjin Wu <falcon@tinylab.org>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com
Subject: Re: [PATCH 00/13] tools/nolibc: riscv: Add full rv32 support
Message-ID: <20230528101702.GG1956@1wt.eu>
References: <cover.1684949267.git.falcon@tinylab.org>
 <20230528075955.GE1956@1wt.eu>
 <210e5ed9-be89-4e48-9c1e-3eb5b0dd288a@t-8ch.de>
 <30bf1742-64ff-4f92-beab-332108d0201f@t-8ch.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <30bf1742-64ff-4f92-beab-332108d0201f@t-8ch.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_031708_821464_10AE6E4C 
X-CRM114-Status: UNSURE (   9.52  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, May 28, 2023 at 11:41:53AM +0200, Thomas Wei=DFschuh wrote:
> > If you are fine with pushing more stuff to this branch, picking up =

> > the fix for the duplicated test gettimeofday_bad2 (7) would be nice, to=
o.
> =

> And the ppoll() argument cleanup (10) for that matter.

OK now both done, thank you.

> IMO it would be more convenient to move generic cleanup patches to the
> beginning of the series.
> When the reviewers are focussing on the real changes they won't be
> interrupted by the cleanups. Also the maintainer can more easily pick
> them up independently, so they are dealt with and nobody has to worry
> about them anymore.

Agreed!

Thanks!
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
