Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EE4FF60ED
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 08:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0tZ9pNNEFib/JMu8LFiAIzkI2GxN2UijGV1nV5pyIDs=; b=q3r1QvA0iFiQgv
	iSvQzGDr/46bNRt0/Msi/1sdEKzE1ItgcW7D3aFA2C3m8DcK2w51ziqouUyA3Q8EG7kBtS/VZY8/2
	OuXL+i6EmgstP2F4ijwvypeReMxHALJ8/ljugHny3AKGBNyv6DgxCeUQpXQz8a5VI1oyz/rPx2fIN
	t+3OM7qcxeoh3NNN234i7e1NZOC22yYEqAO6VAhBmPdQyMKyO6YP2J2bjC/Cv4qtJ5E03P0L3ExFO
	ftaXXGn1HHwaglmxic1V5ct722Jl4JzQv2jL1GCjTiLRKIPuhV8FDej6llNZYCg4+0+jAkwmAua4T
	rMXliITklvKUOHmufzQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7UhJ-0000000Ccvs-3GdP;
	Tue, 31 Mar 2026 08:43:41 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7UhG-0000000Cctc-1oEo
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 08:43:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774946569;
	bh=/uvGm2tgjmbaLFdSZktoAKCcvUL0XxD/eA5skeTmt24=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=hc0P82uiLXmBwiJ10SpbwQHDWalcrCXctz7gaKpoOfm4zjjAj6BzgzNICUHo//51J
	 RpWJjErLtwfwY8W2MoegH2FS+GeeiEOTwpD8GPKylzrJQdOg96o1lyxHVfbUfdY7vn
	 peY682b1ySOeOmuw5F1A1Ak2HVRgW9AXOFZjsqkc=
X-QQ-mid: zesmtpsz9t1774946567t1dceea17
X-QQ-Originating-IP: Nru55Ic+l8JgLfAeWFW3/2SH3CgH47atZ3QRPmdUeJA=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 31 Mar 2026 16:42:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15209079779085793497
EX-QQ-RecipientCnt: 10
Date: Tue, 31 Mar 2026 16:42:45 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Chukun Pan <amadeus@jmu.edu.cn>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Yixun Lan <dlan@kernel.org>, Ze Huang <huang.ze@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, spacemit@lists.linux.dev,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v3 1/1] usb: dwc3: Add optional VBUS regulator support to
 SpacemiT K1
Message-ID: <5E6BDCE16DD4ADB0+acuJBfKF-SCAOu2_@kernel.org>
References: <20260326100010.3588454-1-amadeus@jmu.edu.cn>
 <20260326100010.3588454-2-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260326100010.3588454-2-amadeus@jmu.edu.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NZcrde3zhHkVLuLpntG7TPHMdl/gXoK3X6JuO7HIKdI4knYe0zrsChIs
	7SspeR4jWF7D2roKU73d4J4YJUR4bTy7RHBHqUyvUDJP3NeaNey6CJH+lGE90IiJna92yLi
	KjPVHN2vN3zHRMO8JKm7HN1VjUqRJ1T3OYDH/PpBp7n2bwpa2Z0rw35yWOrF1AkBhkfNVpU
	SgZKkMk2Os0i50Lj/JQUipZ1/HwYfXt/OmbSLBos0tR0ijdUid8HLF9wjIZ6dyO+Kg1XLsK
	IWJiLt6hWqJTo/bSH2KxIRr+74AFTQq/VkigDlELyxT1mKBrkS7p1NMyhNYQR5XLsAKt1j+
	BzrPkj3wnzVMXDgUyRWg2MwLBXl6KZuTmCHqTKy89ksWMpxQW3Bd91mVnqh/O5NhKcmhi2p
	Kk4yUpAyPWyMF8QbJEoxUI7ZOT+MbYebexTsTU0al32aCMvkSRSyLWbKWgAfRr8z9eULLmH
	ClLgdO8qhSWtQLvGvqgb2wl18JxFrKyI/kirOeUwWoV/UjbIu9JzB+IkK3ty538DzJDVP8D
	d9j+a/TSUdght6FWAAAggP7rgZex3cWD4JRfrEzOia3SijIuJ9fX5jLJ+KdIhMFqgp45kDY
	gyZW8ywo57bZLjlVsd9H19hvBUqJu/f20o8xBLxwk72ACaj4fn+EjeYhyUtYLiBH8Ro7yMR
	ZXt02fq8RSdb7UxR1rJZM/jvFKC7FI1YH7Amhns7kFiJ6yTH5V6wPhkfAuQpQcstBnMT76l
	uzsYUBHUzIc8k67IlnVvW/rPfI2FvNlR8v0mPoMO/C8TfcgEPfawq+wKdQzhp7GavVOM5w9
	ajjynfQdOXh0KaTDkwSP1EqA4TqrvRv/5toQXhokr/9lqtFUGNmrqxpW4yoBlOzN4tLofp6
	cgJqnJSELzFuE0zIqseff8WfUKYf3X2uXcwjBLdyDOkvTdHTTeDnQkiVXXo48KCkoDCuEqb
	auD8pBYf4QDAtqeB6Q19tzPCbctSjJNaOg238B0Le/hCWScmk4IBOEpGenjp/N1sY+Mt2wu
	pVx+yINUpeDU6glKtmzfXFjpKM+YZKdz0XfbcNsocz1jd6aZ9b
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_014338_891916_909FBE83 
X-CRM114-Status: GOOD (  17.31  )
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

On Thu, Mar 26, 2026 at 18:00:10 CST, Chukun Pan wrote:
> Some SpacemiT K1 boards (like OrangePi R2S) provide USB VBUS
> through a controllable regulator. Add support for the optional
> vbus-supply property so the regulator can be properly managed
> in host mode instead of left always-on. Note that this doesn't
> apply to USB Hub downstream ports with different VBUS supplies.
> 
> The enabled and disabled actions of the regulator are handled
> automatically by devm_regulator_get_enable_optional().
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  drivers/usb/dwc3/dwc3-generic-plat.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
> index e846844e0023..64f5e9f20663 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -12,6 +12,8 @@
>  #include <linux/reset.h>
>  #include <linux/regmap.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/usb/otg.h>
>  #include "glue.h"
>  
>  #define EIC7700_HSP_BUS_FILTER_EN	BIT(0)
> @@ -69,6 +71,20 @@ static int dwc3_eic7700_init(struct dwc3_generic *dwc3g)
>  	return 0;
>  }
>  
> +static int dwc3_spacemit_k1_init(struct dwc3_generic *dwc3g)
> +{
> +	struct device *dev = dwc3g->dev;
> +
> +	if (usb_get_dr_mode(dev) == USB_DR_MODE_HOST) {
The logic looks good, but the structure can be further improved to better align with
standard kernel coding style:

if (usb_get_dr_mode(dev) != USB_DR_MODE_HOST)
  return 0;
> +		int ret = devm_regulator_get_enable_optional(dev, "vbus");
Could you please move the declaration of ret to the top of the function?

Otherwise, LGTM.
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
