Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DA0CA5FCE
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 03:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8jGvcLg9VrS5rlL3RWc4OjMbcP6+DzK7Ax2yCUUmdQ=; b=kqnMgsA4jn29hK
	s1iO9cxVU0VyfXCKIjDQ6UUeOnJCF+gqm2xw8+qXLLNnbH+G5Hd1XMdo+Q2hhhuPsu0umvux24lFp
	z5McwbrnZ7M4hnbSAsARCF1F28tGCs6E1JfAd55P2lyAXMGZTy1BvY6iVLbEQVRb0tXTIJJc6vUS0
	0eKJd7SRFO0w1mi417iNLgdnJoOhrZwkjkin+hT42nvddlWlvbbhpViIxwAmGrCXODe6DhpAmRjMq
	mTHP0Pf8ly2xgo/AOtX1cpsXCVEfCvyaLXX6yDyBNQVojUj11vyYnurZ9Lp8euupNx7M+TgogqxW6
	eA65jDBXVY3WzuavswgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCTV6-0000000AX8Q-3Diw;
	Fri, 02 Oct 2026 02:59:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCTV5-0000000AX8F-0ylz
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 02:59:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 77641409B7;
	Fri,  2 Oct 2026 02:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEE431F000FF;
	Fri,  2 Oct 2026 02:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790909994;
	bh=b36/hSATJ+CNgsxZHWieBzcEzJFLGew5hunDmQfVWpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N7/lYlpQ8dU3+Ev+T5aZ8sl7r7ixWokSS9yNFD4+ktFmirTXtboqRNTJA9W4K1Umk
	 TQZlEm3F1oPSNWchAY9ROUrCj8D9MQgovqrj6vNEZEtLkhZOqaSm13XCj9UpZxfFJx
	 4wXQOzqBFXasGN4fVbbMBfhYJwYNxlTJMsRb9VkIue0i/c80A6PpL3/3f3oIXSkOhY
	 0+eiRe1GU6VZIl/hWKRSZfr3kTX65G0Sv32iP1AJJo0v1fSWM7HDV2mfaLysJry0EQ
	 7CZwepiqGkzqX+RtSNnvbiCEJzXkl+VBGTwqUBjRu/TN1kU8RO9SWeWMkBx5ovdMiv
	 riDN4NJBzs4OA==
Date: Fri, 2 Oct 2026 02:59:52 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jennifer Berringer <jberring@redhat.com>,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] scsi: ufs: spacemit: k3: Add UFS Host Controller
 driver
Message-ID: <20261002025952-GKB51329@kernel.org>
References: <20260921-08-k3-ufs-support-v6-0-3479768a2299@kernel.org>
 <20260921-08-k3-ufs-support-v6-2-3479768a2299@kernel.org>
 <DLLQJDEA91FU.18Q1TSX09AUR3@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DLLQJDEA91FU.18Q1TSX09AUR3@linux.spacemit.com>
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

Hi Troy,

On 17:25 Tue 22 Sep     , Troy Mitchell wrote:
> On Mon Sep 21, 2026 at 8:36 PM +08, Yixun Lan wrote:
> > [...]
> >
> > +static int ufs_spacemit_link_startup_pre_change(struct ufs_hba *hba)
> > +{
> > +	u32 value, sys1clk_1us;
> > +	int err;
> > +
> > +	err = ufs_spacemit_mphy_init(hba);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	err = ufs_spacemit_uniprov1p6_init(hba);
> > +	if (err < 0)
> > +		return err;
> > +
> 
> Should this be `if (err)`? The call chain is:
> 
>   ufs_spacemit_uniprov1p6_init()
>     -> ufs_spacemit_dme_set()
>       -> ufshcd_dme_set()
>         -> ufshcd_dme_set_attr()
> 
> ufshcd_dme_set_attr() returns 0 on success and non-zero on failure,
the comment of ufshcd_dme_set_attr() says so,

> including positive UIC error codes. The current check misses those.
> 
but as I checked the code, there is no positive err code, so I don't
think it's necessary to change

> Also, ufshcd_link_startup() ignores the PRE_CHANGE return value in this
> series' base, so returning an error here alone will not abort startup.
> 
I think it's totally fine for it to ignore, as there are follow-up
checks, as I see, it's function of link_startup_notify() that returning
the error code

> > [...]
> >
> > +static int ufs_spacemit_apply_dev_quirks(struct ufs_hba *hba)
> > +{
> > [...]
> > +	err = ufs_spacemit_dme_set(hba, setup_attrs, ARRAY_SIZE(setup_attrs));
> > +	if (err < 0)
> > +		return err;
> The same `if (err)` check is needed here for positive DME errors.
> 
ditto
> > +
> > +	return ufs_spacemit_wait_mphy_pll_lock(hba);
> > +}
> > +
> > [...]
> >
> > +static int ufs_spacemit_init(struct ufs_hba *hba)
> > +{
> > [...]
> > +	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
> > +
> > +	return 0;
> > +}
> > +
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
