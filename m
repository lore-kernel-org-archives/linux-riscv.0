Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B28C38145
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Sep 2022 10:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iclZ55AsnWecpxvyJPNH4lQEbZdJpSALbUobLgBMK6A=; b=CeFkKu+TidiTvU470shmUXzjmM
	uZ76rk4XqME9vAVttLDxSDZXrOhRdS4dBPFK+z5wVqtBLmrJkmEKrlV65OZ0GkS1hyrABJ01Pfl7u
	O2Yfs7FVXNxpKYCMfziYXthCQNL2oePEoqvTjlo69JBoN7famMMIhJcsYv429W5UcjR6G9Ug5umum
	dS7BRNaKcxYYC2XKJsFRYbwff44oLje5u+nV1vrAdTTrATQqD0ZjGQQrcKZCynRJmri3ZlF2N5w9P
	I5wrj0NFi/G1yLem/+klQPkLtZL7gJTe69ENRqmBg6daEM5M46dN1fN4TAVYAFWB9vghqGVbCoIKK
	OHtA9wtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVs6p-005FnQ-B9; Wed, 07 Sep 2022 10:16:39 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVs6m-005FlG-0d
	for linux-riscv@lists.infradead.org; Wed, 07 Sep 2022 10:16:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662545796; x=1694081796;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=oG/rTyJfL3+KZX6K/6NP9h6bWZE1yxt+UXbMI1HplF8=;
  b=eT/CuDBl9RVY/9Ul5NuvZ+oRZFnw5BPyTjR6dDfWsQMJYwtCseTny0sP
   rNXxs02idgTjV/+mz+Q49wr4J52iznVyqb5GjYn8F0C/EZL5qQRAxmuZV
   XlVCVC0PhLp+H4znDD0Y4K0Ot8F0HofivOntunwZLo1XKVMMCUvwCO8mT
   aR0GLWKkDs177BoC2Mbka0mIqKuFSsQn9MNEBkPrEAmOjryo1mHPMaLDc
   H8aqJGXPVgRBC5ZSn+H2cXxJEUTGlYfTQxkd6+UtkDOvUUV2d1Vy4A4Ge
   IvOGr8z65+l97kuycLhliXOF3k7tVmkXAdJ/29NBdBOfMzWI0fbPZKNLj
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="296834351"
X-IronPort-AV: E=Sophos;i="5.93,296,1654585200"; 
   d="scan'208";a="296834351"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 03:16:31 -0700
X-IronPort-AV: E=Sophos;i="5.93,296,1654585200"; 
   d="scan'208";a="676121421"
Received: from dmatouse-mobl.ger.corp.intel.com ([10.251.223.53])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 03:16:24 -0700
Date: Wed, 7 Sep 2022 13:16:23 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    linux-serial <linux-serial@vger.kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, Tobias Klauser <tklauser@distanz.ch>, 
    Richard Genoud <richard.genoud@gmail.com>, 
    Nicolas Ferre <nicolas.ferre@microchip.com>, 
    Alexandre Belloni <alexandre.belloni@bootlin.com>, 
    Claudiu Beznea <claudiu.beznea@microchip.com>, 
    Vladimir Zapolskiy <vz@mleia.com>, Liviu Dudau <liviu.dudau@arm.com>, 
    Sudeep Holla <sudeep.holla@arm.com>, 
    Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
    Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
    Pengutronix Kernel Team <kernel@pengutronix.de>, 
    Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
    =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>, 
    Manivannan Sadhasivam <mani@kernel.org>, 
    Russell King <linux@armlinux.org.uk>, 
    Florian Fainelli <f.fainelli@gmail.com>, 
    bcm-kernel-feedback-list@broadcom.com, 
    =?ISO-8859-15?Q?Pali_Roh=E1r?= <pali@kernel.org>, 
    Kevin Cernekee <cernekee@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, Orson Zhai <orsonzhai@gmail.com>, 
    Baolin Wang <baolin.wang7@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
    Patrice Chotard <patrice.chotard@foss.st.com>, 
    linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/4] tty: TX helpers
In-Reply-To: <dec6d5c4-45b7-f087-95f4-bf1dae9e9d27@kernel.org>
Message-ID: <4e9b4471-a6f2-4b16-d830-67d253ae4e6a@linux.intel.com>
References: <20220906104805.23211-1-jslaby@suse.cz> <Yxcvbk281f/vy4vb@hovoldconsulting.com> <dec6d5c4-45b7-f087-95f4-bf1dae9e9d27@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1625185259-1662545792=:1717"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_031636_312059_25A79C60 
X-CRM114-Status: GOOD (  28.85  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1625185259-1662545792=:1717
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 7 Sep 2022, Jiri Slaby wrote:

> On 06. 09. 22, 13:30, Johan Hovold wrote:
> > On Tue, Sep 06, 2022 at 12:48:01PM +0200, Jiri Slaby wrote:
> > > This series introduces DEFINE_UART_PORT_TX_HELPER +
> > > DEFINE_UART_PORT_TX_HELPER_LIMITED TX helpers. See PATCH 2/4 for the
> > > details. Comments welcome.
> > > 
> > > Then it switches drivers to use them. First, to
> > > DEFINE_UART_PORT_TX_HELPER() in 3/4 and then
> > > DEFINE_UART_PORT_TX_HELPER_LIMITED() in 4/4.
> > > 
> > > The diffstat of patches 3+4 is as follows:
> > >   26 files changed, 191 insertions(+), 823 deletions(-)
> > > which appears to be nice.
> > 
> > Not really. This is horrid. Quality can't be measured in LoC (only).
> > 
> > The resulting code is unreadable. And for no good reason.
> 
> IMO, it's much more readable than the original ~ 30 various (and buggy -- see
> Ilpo's fixes) copies of this code. Apart from that, it makes further rework
> much easier (I have switch to kfifo in my mind for example).
> 
> > [ And note that you're "saving" something like 20 lines per driver:
> 
> It's not about saving, it's about deduplicating and unifying.
>
> > 	 12 files changed, 84 insertions(+), 349 deletions(-)
> > ]
> > 
> > NAK
> 
> I'd love to come up with something nicer. That would be a function in
> serial-core calling hooks like I had [1] for example. But provided all those
> CPU workarounds/thunks, it'd be quite expensive to call two functions per
> character.
> 
> Or creating a static inline (having ± the macro content) and the hooks as
> parameters and hope for optimizations to eliminate thunks (also suggested in
> the past [1]).
> 
> [1] https://lore.kernel.org/all/20220411105405.9519-1-jslaby@suse.cz/

I second Jiri here.

Saving lines in drivers is not that important compared with all removing 
all the variants of the same thing that have crept there over the years.

I suspect the main reason for the variants is that everybody just used 
other drivers as examples and therefore we've a few "main" variant 
branches depending on which of the drivers was used as an example for the 
other. That is hardly a good enough reason to keep them different and as 
long as each driver keeps its own function for this, it will eventually 
lead to similar differentiation so e.g. a one-time band-aid similarization 
would not help in the long run.

Also, I don't understand why you see it unreadable when the actual code is 
out in the open in that macro. It's formatted much better than e.g. 
read_poll_timeout() if you want an example of something that is hardly 
readable ;-). I agree though there's a learning-curve, albeit small, that 
it actually creates a function but that doesn't seem to me as big of an 
obstacle you seem to think.


-- 
 i.

--8323329-1625185259-1662545792=:1717
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1625185259-1662545792=:1717--

