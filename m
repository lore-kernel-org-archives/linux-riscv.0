Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54622C36005
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 08:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NcbwdBAOrHyCwpQ8dEfpD9RANqIbxbekTyx1bKkWn6A=; b=ePk0K3OVlQ3f4t
	4LophXZVS3G6V8GEB5e8btWKmdma73qQC3sau2oFtwzJPECR5t99JvrfBHlYLJ+84h8kCdVgRlyLk
	liePZdTmW4DPN4QDArKQy88cNeXd6BANXlAX2QZRJw0/jIUQy2Rq9SGlPDuO7zKmMwyB/x66czV3f
	x6SnawlUzE0LP+QYKxXVv1cwZAgg2dWYVncfJhzgqnIqCzBXCsFoEYtXsBVqpZB30Ri098d9VdChX
	ysTfS+5aqjryuDZ8MIl7Xva+lNagbWMqyML6QNS7W/8GQ+KyY2l062DEsb8ce8smrM//LFCEiyFdG
	zLP2jypxDu91z6SrTAkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Jai-00000005Mjo-2Nr0;
	Mon, 28 Apr 2025 08:11:52 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9JNu-00000005Kwe-0BpZ
	for linux-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 07:58:39 +0000
Received: from [198.18.0.1] (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [27.18.99.221])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1360754e8;
	Mon, 28 Apr 2025 15:58:30 +0800 (GMT+08:00)
Message-ID: <a3478dff-ae04-4d3a-ac51-2efc994cda19@whut.edu.cn>
Date: Mon, 28 Apr 2025 15:58:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: add usb3.0 support for K1
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250428-b4-k1-dwc3-v2-v1-0-7cb061abd619@whut.edu.cn>
 <20250428-b4-k1-dwc3-v2-v1-2-7cb061abd619@whut.edu.cn>
Content-Language: en-US
From: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <20250428-b4-k1-dwc3-v2-v1-2-7cb061abd619@whut.edu.cn>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHU9NVh9MH0JDGR0YTE8ZQ1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVJSUpZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE9VSktLVUpCS0
	tZBg++
X-HM-Tid: 0a967b679ee503a1kunm1360754e8
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Oj46ATo6VjJCFTRLKTM*DA0p
	OBEwCjlVSlVKTE9OQ0lMSkpOTU9LVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVJSUpZV1kIAVlBSkJKQzcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_005838_292006_FDD9074A 
X-CRM114-Status: UNSURE (   6.52  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi all,

I found some mistakes in the patch


I will correct them in next version.
Sorry for the confusion and thanks for your review!


On 4/28/25 3:38 PM, Ze Huang wrote:
> Add USB 3.0 support for the SpacemiT K1 SoC, including the
> following components:
...
> +
> +		usbphy0: phy@c0940000 {
> +			compatible = "spacemit,usb2-phy";

compatible = "spacemit,k1-usb2-phy ";

> +			reg = <0x0 0xc0940000 0x0 0x200>;
> +			clocks = <&syscon_apmu CLK_USB_AXI>;
> +			status = "disabled";
> +		};
> +
> +		usbphy1: phy@c09c0000 {
> +			compatible = "spacemit,usb2-phy";

compatible = "spacemit,k1-usb2-phy ";

> +			reg = <0x0 0xc09c0000 0x0 0x200>;
> +			clocks = <&syscon_apmu CLK_USB_P1>;
> +			status = "disabled";
> +		};
> +
> +		usbphy2: phy@0xc0a30000 {

usbphy2: phy@c0a30000 {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
