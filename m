Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C43C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Dec 2021 22:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V18oeZCp1cLbPSMmWq6mR0VVamUMt+JCM9xjG8iPz64=; b=ckmQmgQM1CqXr2
	s/DO/4DkcFvlFbv5hAl+Vz3rxOj+huoX/bTLrOkoulPs4as1b3v/hkG56NZi8BvSYavsO1XI5VKj3
	Vv3njf+zitj7hWZ9ZoMLMlDpfmDB0C8gPoaO62k1ARxYQotXG80zFDxoBw+1V2UezGmQyUqQ3BkCq
	GBTlMYxp0YxAwFr80LHqUatMGZYXMfKdZ9GsnJliB/tzChzP/tvxMOCoFz2y6S/aMSjIJYJPiXhkQ
	OtojWsafHDJk1jB02ISZUbbShIJxjxyH95Fo6+lVkvp1Gr22LqD+7HKMXNyS6ikYYWXPV0B1L0IVq
	zSNW1GGE4fzTI2QgQMbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtddB-000xAV-UR; Sat, 04 Dec 2021 22:35:45 +0000
Received: from smtprelay0133.hostedemail.com ([216.40.44.133]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtdd8-000x9F-NO
 for linux-riscv@lists.infradead.org; Sat, 04 Dec 2021 22:35:44 +0000
Received: from omf11.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 98888181D2FC9;
 Sat,  4 Dec 2021 22:35:39 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf11.hostedemail.com (Postfix) with ESMTPA id EB20020033; 
 Sat,  4 Dec 2021 22:34:37 +0000 (UTC)
Message-ID: <2ced60214ef3bf449e27f5cb22d3dbd0863d97bb.camel@perches.com>
Subject: Re: [PATCH] MAINTAINERS: Sort entries using parse-maintainers.pl
From: Joe Perches <joe@perches.com>
To: Jonathan =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc: linux-kernel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>,  Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>,  linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev
Date: Sat, 04 Dec 2021 14:34:36 -0800
In-Reply-To: <YavGALvWdsW+BO9w@latitude>
References: <20211204175255.1361385-1-j.neuschaefer@gmx.net>
 <429227f33cf14aee6f0668a3d98aa220b54383d6.camel@perches.com>
 <YavGALvWdsW+BO9w@latitude>
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
X-Stat-Signature: 38ddh1sw19sydmoenji6nsdzpy4fsty1
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: EB20020033
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/GhABztSc7GYEWxwTLNE04mHDPa73JKYY=
X-HE-Tag: 1638657277-951064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211204_143542_864196_72033627 
X-CRM114-Status: GOOD (  13.19  )
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

On Sat, 2021-12-04 at 20:48 +0100, Jonathan Neusch=E4fer wrote:
> On Sat, Dec 04, 2021 at 10:20:24AM -0800, Joe Perches wrote:
> > On Sat, 2021-12-04 at 18:52 +0100, Jonathan Neusch=E4fer wrote:
> > > The MAINTAINERS file got slightly out of order again, making it
> > > difficult to put new entries at the right (alphabetical) position.
> > > =

> > > Run parse-maintainers.pl to restore the alphabetical order.
> > []
> > > Checkpatch warns about a few unordered "F:" lines within sections, bu=
t I
> > > left those alone because I wanted this patch to be as automated as po=
ssible.
> > =

> > The --order option does that.
> > =

> > $ ./scripts/parse-maintainers.pl --order --output MAINTAINERS
> =

> Ah, good point.
> =

> Unfortunately, the result of parse-maintainers.pl --order currently
> produces a (small) merge conflict when merged/cherry-picked on top of
> -next, so it might be better to start without --order. (Not sure.)

My preference is still to automate the running of this command
by some script and apply it just before every -rc1 is released.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
