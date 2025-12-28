Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6812E784BE
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Dec 2025 10:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YlMcRmFd/ui0OEAM4BXSKL0r/wBl9xKwA87+iqvAMxo=; b=XaNOEC5SZi0nyL
	H/W2i7fphz3+QlteKpZdu4p1bGaEjTgnDOMFV8gVyJDuxW3iIG8N3VBKMDythcdxOhCvVJDOhJTw+
	xiDwb+/Ok96kDHp4TO1Nma/ldP8XFzb/KAbiLxqQu5pBwZwe5ReTRybIMOt+jLAl/VXRvm5VDm4V2
	hvRw1GHhhJQ45657exwv2QVEeGKGSmFmuh0WWtUYVVwqJKLPSY3D5rHqc6FqAYPOfH7UMvB0vmsIF
	JoHfeY01SeDPdN3+uKbMjWaiotyVUU65WPFlc9mac6DRAty4yysQNjR4xA15LPSDdBc++D59VMsq9
	c8YU+B4PxvEFiWNylCoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZo6Z-00000002dcw-22q1;
	Sun, 28 Dec 2025 10:34:31 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZo6W-00000002dbq-2pvd
	for linux-riscv@lists.infradead.org;
	Sun, 28 Dec 2025 10:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766917992;
	bh=EzH4x/BNzr/lijse2yQMrkmiQWJgzq4fknJut0n9rrQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=lSDwEc9M9qi7AA8fAkbd6uG2mJYbi2PNFedG+zsi3Bg8favhMBp6KnrxiCuy+yzI4
	 KALZB+drN1o0k8xu1a9qAu8yO+j/3DCTm4vZgeBtbPsCuMcv9A7jbbb8Ad75sJzzqC
	 H4R4ZvAcoXW9gpy4CYVnjkLlsLhnVCJGSW1GqexQ=
X-QQ-mid: zesmtpip3t1766917984t9c041ffe
X-QQ-Originating-IP: ijGSZ0W9HF/cKHoSJdDGWVc9A8Zuav/z0wDMfel/LEU=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 28 Dec 2025 18:33:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5019635549963342539
EX-QQ-RecipientCnt: 11
Date: Sun, 28 Dec 2025 18:33:03 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v5 0/2] i2c: spacemit: introduce pio for k1
Message-ID: <F15FE03F15DE1BD1+aVEHX0IU79i-bRot@troy-wujie14pro-arch>
References: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
 <bjbt6gqnqtorlrft2oezr6mxuyywhebdmlnidtqlpf3qputojm@hkdp5a7boozb>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bjbt6gqnqtorlrft2oezr6mxuyywhebdmlnidtqlpf3qputojm@hkdp5a7boozb>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MjQ00mYXMHtu+WVdgHLTKemwh1i5Q/wdKEshUjUgljgotNbntG2k4Bzo
	ya4JxyJ2S3XiDcZ7QtelwazLwmyLfLT3OfmHkQlv4scpu51hsHGqrUIo4hZCOBCtDhR5jvc
	65K1uoDZRdZTS2rIGXpY37NEyXlVhZWiqftfFab+gWcb9YHGrPreWM+L/SPRggWCSsQQP/g
	IwbrM9ZNdVK/oOdQcx/YVc87ZF4dkE2kR7t+bFUUMR5Mqln/YQganX74qaE83FVE4VwcBQK
	4pXWOI4yypIjZ0hLRGNgIuz4dRuxtv0gUrB/j1zA33j5zY6WwZFNUDvv6SNq3nUgtkiUE8b
	v0GJ8bIoTgT9POLtuNSCYQU3Hir+9aMIUNYhuYDd9wEE6Hs5pM04ixyuWYL+uhU2MXpYA0z
	FJgwGw0dCYBIHdgFsoetqhE9jzGYjuDGBmqM3gBl6f5rBs0UU5ZftbDJjYykp2L4RHMMFBl
	b0T8ATYKPIRJ8azTrn4TfTf2KaXCTbWTip7KssK8OuR7kALCfUy7Hj4JFy66nqCm/aQKE7v
	Z/uz9aYFsMCoxHwqwNfTF6AxuEn1gpDmhMVrGVJGMc+MHv8XkVjqy51Fn3sU4i1195UBi4f
	PGXBpruTXW66UU5eoAttFZ4cttXMm/AzhuN+cZZsnNzMKt8RU+SS7rG8b2rcc2Pyzql+3B5
	RvfJBAQtO4XG3lq+IKPBtknf8tJSHwNBHzN1z2zigqwY1uqB2vmjxaP7KZso6T8QLJzYyre
	OJPeyIeQHvtoO6dmGur7wkPe81RiXP4qXGhf+i6kXjEjRV8/3/cP4dyygvfvnsn4RLNgW9E
	IrcUSgTBcDWTMYzEGJrw6nYmszTz9Bl2GooTcMGbpg8FLpQ2lqNxzWJhkDkZSmbIE2Zj0kJ
	2MtBS+NrWXd4VTWA93pgR/HGqPlzuQbpqLj3QnftBMX9lJP8OIJZ8F8fB5EHm3PMVB0m8IK
	xwd+jPUZt3iVLwCsLoXfYBaS70j7mAQgsmIIcWzE0Lk4E6URxHp5lOjfLOWKHVgqeT9OyxF
	GaFtbV8sRRMxBxUNxxrk7pw3paKr8BoQdw4LfV5EsaXWknEa1lLImuI+RyL+z3tWm8mLhIl
	n9bKjBy8vOi
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_023429_158263_8B2B5433 
X-CRM114-Status: GOOD (  10.07  )
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

On Sat, Dec 27, 2025 at 08:38:44PM +0100, Andi Shyti wrote:
> Hi Troy,
> 
> On Fri, Dec 26, 2025 at 11:31:09AM +0800, Troy Mitchell wrote:
> > This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
> > enabling the use of I2C in atomic context.
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> > Troy Mitchell (2):
> >       i2c: spacemit: replace i2c_xfer_msg()
> >       i2c: spacemit: introduce pio for k1
> 
> Do we still have RnB and Tested by Aurelien here?
No, I removed them.

wait_pio() has been reworked, which results in a significant change in
the underlying logic. As a consequence, the old RB and TB no longer
appear to be applicable.

                          - Troy
> 
> Andi
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
