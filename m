Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B559CCD1BF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 00:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wIFrb1vAgaY1ZLsasV95bu9o2lmHcv0KTip4c5L+P18=; b=Dj0ky5JO72gi/I
	Ylc1p6OI8xP1xm4eSDoLy60W3kXumAc2zbxhbp1Z8CvweoGHYyOcorr16oqMxnOYqJqSnmAySKI8e
	lUmhrXrU0QOlYpQ6aY49IYk9Yg5ZuVXrdqMA6eHff7mz+RX7uPU0AVC3QyXCFmFXMSqjZ4oANrY2p
	n8Y0wH4IpyHneMDGe28SL+K278EmMxeBlRqWNTckgxVtF4xBZiGXJLVWszb1ww2ADqS/krssscyY1
	fc//4HzfdkIWtBXg8gbdXXO/f0L+euLyY6tADzvwf+8ngy3PDO04gTzGppiY/u7OpaLxCWrY9X+uI
	kLc+KSXP7WqInCCcHpzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5GX-00000007rmz-1SXk;
	Fri, 24 Oct 2025 00:02:45 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5GV-00000007rmb-0E4U
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 00:02:44 +0000
Received: from localhost (unknown [116.232.147.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 09A64340F1D;
	Fri, 24 Oct 2025 00:02:38 +0000 (UTC)
Date: Fri, 24 Oct 2025 08:02:28 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Conor Dooley <conor@kernel.org>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>,
	michael.opdenacker@rootcommit.com, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <emil.renner.berthing@gmail.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] riscv: dts: spacemit: add Ethernet and PDMA to
 OrangePi RV2
Message-ID: <20251024000228-GYA1537773@gentoo.org>
References: <20251022201807.1474789-1-michael.opdenacker@rootcommit.com>
 <20251022201807.1474789-2-michael.opdenacker@rootcommit.com>
 <f8a55f89-2612-49e3-88c6-acb523ac74d3@iscas.ac.cn>
 <20251023-lizard-sharpie-70f2a000327f@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251023-lizard-sharpie-70f2a000327f@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_170243_270272_E3B5C675 
X-CRM114-Status: GOOD (  24.69  )
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

Hi Michael, =


Since the patch itself is good enough, so I will just take it,
I will drop those CCs if no objection..

On 19:30 Thu 23 Oct     , Conor Dooley wrote:
> On Thu, Oct 23, 2025 at 01:58:22PM +0800, Vivian Wang wrote:
> > Thank you so much for the patch and testing results. Only some nitpicks
> > follow.
> > =

> > On 10/23/25 04:18, michael.opdenacker@rootcommit.com wrote:
> > > From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> > >
> > > The OrangePi RV2 board ships two RGMII ethernet ports.
> > > Each has an external Motorcomm YT8531C PHY attached, the PHY uses GPIO
> > > for reset pin control.
> > >
> > > Enable PDMA for the SpacemiT K1-based SoC in the OrangePi RV2 board.
> > >
> > > Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> > > CC: Emil Renner Berthing <emil.renner.berthing@gmail.com>
> > > CC: Yixun Lan <dlan@gentoo.org>
> > > CC: Vivian Wang <wangruikang@iscas.ac.cn>
> > =

> > Firstly, it is usually spelt "Cc:", with one upper-case C and one
> > lower-case c.
> =

> I don't think this matters at all, the git tooling at least doesn't
> care.
> =

I think it's super useful by putting additional "Cc" into individual patch
especially for a large series to notify specific maintainers while not spam=
 others


> > Secondly, "Cc:" should not be necessary in the patch/commit message.
> > From Documentation/process/submitting-patches.rst:
> > =

> > =A0 =A0 If a person has had the opportunity to comment on a patch, but =
has not
> > =A0 =A0 provided such comments, you may optionally add a ``Cc:`` tag to=
 the patch.
> > =A0 =A0 This tag documents that potentially interested parties have bee=
n included in
> > =A0 =A0 the discussion.
> > =

> > If you look through the git logs of Linux, Cc tags are really not a
> > regular occurrence except those marking patches as suitable for
> > backporting to stable.
> =

> If people want to handle CC lists by putting it in the patches (it's
> what I do when I have no cover letter) just put them after the --- line
> and git send-email will still pick the CCs up but they won't end up in
> the history.
> =

indeed, good suggestion!


-- =

Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
