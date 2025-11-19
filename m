Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261E3CF31B5
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 12:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OF5QhWClIi0ncqWG3I9kTjcZ7nO+Da1AGKO45+O4hT0=; b=LYGmjlIunrWriz
	EJB3Klco0a3ZW6cKCwzOlQDPX5ZTH1Uxq/jm8VzMmb9LCAn1WoAyQG2MlgGjVcS9+lITfu93Sz3EK
	JXVPGWmyC+0FvodYqpb5Sdg0hslIyvxE0ZY5EnfpaFzRlLv/NGsyyW5OxAhW3nZ2S+eo7nTso52t4
	NvAGd7uJE6uJx3TfMbrLBbo/g39mnon//U0I5Ov/R2Qkemhg27wIrnDhdFzuDy6NmvrJq8EuSBZae
	DkBscfoobBx6vSE3oUkbzAY6TFlOrr8CLMFT6b2hjk/CMD+rtrcHqT33g8xVpZ62Ijap6L3C6KkeF
	y5VmD4DVzBXl13vBbnGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLh0R-000000035fA-3AYc;
	Wed, 19 Nov 2025 12:09:51 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLh0N-000000035dr-1dz6
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 12:09:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1763554129;
	bh=S7h+FU1LHdECY8e1Sl6WspAIu8Ya6oOxnRRIjO3o1OE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=vuBbkI0cnNYwopfj/0QYDEObcS3sfeHHrWCoxtpDpMPpesu2pyIdjsLrf1uflsXmy
	 s8BON9DgM0ZF/hBkhrkQJL3cVcZAxIj63VspfOdaKZ3EgjauZNNZkJzrhEk/XifAzl
	 tQ70ebDCIOL1sPhcxiFP1lFFH/OHTiV044egcUXM=
X-QQ-mid: zesmtpip2t1763554117t9482c6f6
X-QQ-Originating-IP: IK9N0AlKm0p8CM/IABJTzm7XNr6l+1k2JU3qct77bqo=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 19 Nov 2025 20:08:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12270866521218039204
EX-QQ-RecipientCnt: 18
Date: Wed, 19 Nov 2025 20:08:35 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Encrow Thorne <jyc0019@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] i2c: k1: add reset support
Message-ID: <2A293BCA6504D560+aR2zQzsDieMGOva5@troy-wujie14pro-arch>
References: <20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com>
 <20251119-i2c-k1_reset-support-v1-2-0e9e82bf9b65@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251119-i2c-k1_reset-support-v1-2-0e9e82bf9b65@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mk3pYwnXiIiD1/t9VxyfPdFlIsdTdYCLqw5i7RY5fjz6omcSQWqkIEvh
	jv1a2rhHbLdGy5aVDqurdJuJZv/i6I+oZh+levqFMEJn6pT+WuoE9ywpkxgTo9gTDNxXYpu
	Z9+htKga9sv8iPsYjAqboaXx4rYe7zrAXcvMKPTHKkzI4v9nDLsjbZXodu9jkUZhcBlq2NP
	piQ9mxramzyaqS+xEOELL4+gaJsMx75DMlOyb3xsSjXLBwm/XLXIh5oopr5+1vs/BdGmgRJ
	YvW5mfNzFufMdsh3DfKWn5zfOrWcMe2Esbt9sm5Ui6lT+3n5nPWvfJ55fT12EJ8rrrXKt9Y
	u4fOWhyZ6Oxyf99Eyl39axyjzY+Nu+F4R26Y+8hU/j9W4l1vVLPBhT22yRQXyu3H/nEDHoc
	mIb9la/S9MirXMhoHkDJtlEC946BpglvA6rh07DARc7oowQuxBKmk/pmN80LAM6qoykW/DU
	7S1Z/c5AktuoQvVjsFo1Ar3LDz35WkUWx3NdLKBR3wQ8Orbn06mm2TgX03uWxj4by9xFr3L
	GrScWvbaxfmCkUyZXQysz7duvxAm0wZZ05BmeXeZHzc8mg04OfTBuTS2U8BOIFwZDKpnXW5
	gW3lZ0mF5fM+DVx5vbXwpjin42KhQWFd6mp6+6qkD3fnYFZZpPnfgQZwpLFd/2EpZ+E3n4a
	ObYFcv40TadvdOC6Jvw1AEvfZMs9DX6gSLHoDiwGAQ8VfhncRFemuy+DPySDhOKBSI9f5jP
	w//I+C72LS0+m+EgLhE/2eb9VZR+bG/0e8B7lzaxwKqRMyjKuXd5Bqtk9r2I0y6WiKPANU7
	C/aZwnbDbI+JkARigAV/xbZyeVt7ZowAmUEKFJ94RUcn/wiuyOMBGNXGRxS5wQ5CnucEHJN
	YLyxx2wS/G2N5/x24BVxZQ7H8rTRRkDU1nP3t5lUQzCqMPZ/Jr6SeuQgtvO3f15GS7CkSv9
	FXyZfYntpBuOzWXXrDVTb+LOcqhnldABB3XTsAgWXnZP86gpFSEFOYTkJ5tHfet7AXeQLXG
	KTNZ9daYhFA21HmjTQbqh459zsiCKKtN/kFh1WH4yzEfqf44mt
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_040948_472907_EAE556E9 
X-CRM114-Status: GOOD (  18.21  )
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

Hi Encrow,

On Wed, Nov 19, 2025 at 07:46:44PM +0800, Encrow Thorne wrote:
> Add reset control handling to the K1 I2C driver.
> 
> Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index 6b918770e612..64d817d8315d 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -10,6 +10,7 @@
>   #include <linux/module.h>
>   #include <linux/of_address.h>
>   #include <linux/platform_device.h>
> + #include <linux/reset.h>
>  
>  /* spacemit i2c registers */
>  #define SPACEMIT_ICR		 0x0		/* Control register */
> @@ -113,6 +114,7 @@ struct spacemit_i2c_dev {
>  	void __iomem *base;
>  	int irq;
>  	u32 clock_freq;
> +	struct reset_control *resets;
>  
>  	struct i2c_msg *msgs;
>  	u32 msg_num;
> @@ -571,6 +573,15 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
>  	if (IS_ERR(clk))
>  		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
>  
> +	i2c->resets = devm_reset_control_get_optional(dev, NULL);
> +	if (IS_ERR(i2c->resets))
> +		return dev_err_probe(dev, PTR_ERR(i2c->resets),
> +				    "failed to get reset\n");
Please align.

> +
> +	reset_control_assert(i2c->resets);
> +	udelay(2);
This seems to be a very small value. If this
has been verified multiple times?

                        - Troy
> +	reset_control_deassert(i2c->resets);
> +
>  	spacemit_i2c_reset(i2c);
>  
>  	i2c_set_adapdata(&i2c->adapt, i2c);
> 
> -- 
> 2.25.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
