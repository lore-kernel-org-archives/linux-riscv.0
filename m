Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B499E784BE
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 01:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dd5TU/A5oL+zB5y/BZouo8qYjsLZBo19xv6uFiR3FhE=; b=wvbZJcsZx5ZKqz
	un8KsuBJsLZmuaaVc5GguyUQ0CY9HxQk+p4NWxDAlvl74q+PDSTUJSpG1H+a9rRbNvvRowoAJSv2x
	3DCUk5wqie39FLaSn9DXin5G0wVlyPuq/OjDsyA1K+M9tsAopHoMsP6YYVZNeiDgF7YYSqS6d3LEJ
	+PCr4T/CZsq0mEWUWoELdKiv6WrqI/ksdMTSENmCEu0Ii0/FEuNHn2d6LJ6+ok3B/J6uHWG1DvaGk
	tjOY89XdtArLKSArAiaKObvxgwDsL8IXP5Hexrk3X8hMzaKVuJzJoRp4d2bc0ixTx7D6+mkLtb+t0
	6OIU4BWGeINObewru3SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va1wz-00000003BM9-0NjP;
	Mon, 29 Dec 2025 01:21:33 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va1ws-00000003BLE-0BT5
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 01:21:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766971218;
	bh=HjPCSciAn5sVVRUOoQBxpkF3fdcwbHn1thnE3om09YI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=aVScxXB5ajk8nsyHVbqyulChahzfyWHuZ6EOvh4MvFwVIc/AKTm5IIWPzh6kmQMSe
	 h0mCTaJGqJM8fchETHBns4nQJE/59IUULp6f1zgbJtvkQkDqqRELbYkwRoNkOv+3bF
	 YoiPVThoW4rTJ8Oj3JlkrtytPP5apOWe57ktXwD8=
X-QQ-mid: zesmtpgz9t1766971209t9fc9de5a
X-QQ-Originating-IP: fT6Q8r14RLfcZbpJL9RtazBttNJy4iPas1PtPR2xOX0=
Received: from = ( [183.48.244.56])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 Dec 2025 09:20:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16357926230597589350
EX-QQ-RecipientCnt: 13
Date: Mon, 29 Dec 2025 09:20:08 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 1/4] i2c: spacemit: configure ILCR for accurate SCL
 frequency
Message-ID: <20BB6D852C5C87DF+aVHXSI7Mn5GH-xBF@kernel.org>
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
 <20251118-p1-kconfig-fix-v3-1-8839c5ac5db3@linux.spacemit.com>
 <81eca0ab-47a3-4b12-98ae-fbd46a15ff93@riscstar.com>
 <BD74A47E5BB66010+aU4j6CgGxebcBV5I@kernel.org>
 <569E6DA87DE510D5+aU4-1Jl9XxjAWQq4@kernel.org>
 <4a76e9bf-926e-4b77-a2f8-ee4a72b2f1dd@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4a76e9bf-926e-4b77-a2f8-ee4a72b2f1dd@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OXvkGtaK08fGzVyBcvDPqJcIA53HT9A+ZpqG1btxeAnhOYGYpEPMnSfv
	DGcIhq5g6sZKK3vJAWTtne04ZOQZf0wbR/mNi4KJDfbl2N/KScZjlkpO986CQ5ZXGFPXIh2
	ioZ31RNhXYNUrliC1i49dquCM/I+1VmEy5OvhaKnzZ9YuMW69lowfvbHm421qbdZz77yJ9Z
	2c0xL1hKMdqFeAilR6kG6v1gDcsAW6r8mEa0zjetDJJTj7Vsn/q1GTeDkh4HNcVFGuZZGfx
	1z/g0hyvAfMSd0AlKytiaZ/gCFsSQ2RMYKpl2St2K4267pvYcdpCHShDj81scxHacKQ1UdX
	LdZEjdxVYnxzbHE1jAR3rp48orvIBnkeXQLtpkJER/JcJ7Hn12I+I9ka+5cb/5BfxIvoqut
	3BNB+DSfmrDKBarbE7cOtJ/A/13vzeYXawFnV2YIk61JQdGr+yJKcDMxD8XMC5ydutzL4JK
	kJnyc4xThYficgFm21pjvX0K9G6C7YfCsx5fm47mXiVUlMPtgZZZc6Aa1XKxY2mtQmffrJK
	re4yQsZkhJ2bt7mvtBPBZ1NH2k4G8+5C4jxYRt7eYaUtWvy7RLc+9a6fVS7LcUGnOpnOlhB
	2Uf0zTNCU9jTdkjAlp/kwJJhzol7zikVaPstUAGni4Fd/xWAz4jVd8BEKMHEj79ZqIVf+TM
	nSJsE0kqRK0TLN6jAUJ3ZHLGGTAC8HjhCf1zUhuoAPrCcDAh5WB/fivyEdLTWsU1ijvCAKM
	4V1lEzatn7S7NZNFizdcUQl0gM7w6GzhCJpYqo1xLcxZtOYoE6VJVxcgmrv42uIAL7+RuOP
	i5sxzZd49LDtE3DzkE3UGbLatJWn8aelU6qFOVUMMciafueaMlUIlJHNQX/k8EBtLr5CC3l
	xJnYAUAekK4F/JUI9miS35uFQMXXA5EzdozhP5RA2qUVedvSzrMT8VIFY332p5HGIVE/K72
	Qac2whpmTxtzBrAv+7eTPtz9gN+E+FoYKBHKzGzjheDFhCmZsEbFtnjdy/r0mIUQ7nuWVWz
	+fzla//JJ8r3Awr2Re3NMWV7UpHjrxrk0G1bjTm9pzFx9n/uYW
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_172126_658773_496FE18B 
X-CRM114-Status: GOOD (  11.48  )
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

On Sun, Dec 28, 2025 at 06:58:00PM -0600, Alex Elder wrote:
> On 12/26/25 1:52 AM, Troy Mitchell wrote:
> > > > > +static int spacemit_i2c_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> > > > > +				     unsigned long parent_rate)
> > > > > +{
> > > > > +	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
> > > > > +	u32 lv, lcr, mask, shift, max_lv;
> > > > > +
> > > > > +	lv = DIV_ROUND_UP(parent_rate, rate);
> > > > 
> > > > Would DIV_ROUND_CLOSEST() give a more accurate value?
> > > I'll test it.
> > Same result. So I'll keep it.
> 
> Is that true for all clock rates? 
I only test 400k.
> Anyway, it's not
> a huge deal, but especially when the number of rates
> isn't very high this can make a difference.
I'll test more. Thanks!

                          - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
