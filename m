Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96B6C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 08:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aJyNt7LrLlf/rBT/nURcOGL7Y8hiQP2X6GGK4MOCi94=; b=t518miKzmc7lZ5
	pBtst3SSKmGtP7Z7OQemDJ3msHrp26ilaIJ5R0vpzwoeW4o6ExUpBlurDF1Gw6X3TfqMMz4UiaDTb
	hPbsug0tmAuJxkEYpoz+Ntkkhw+q/5I/OlKLf21ncLXvpw4UdSRN4xxirlsy4l+teR8IdylAGboma
	TX4RJahs4SzSbKhak1ggymo5iVjDdIamlAW7b7StmQAbpc5lpex2r8Tq0tyT3c0j/yxpJD92+5vp3
	pUDf6s59u6Oltr7wXWdcqjtmzlsqcW4uCl7l/fzhIzBtNNdhrcepfMAzf6st4mOrR31NyVMIaVXdv
	GZ36bCN5o1hZEcUR3GSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvC8s-0000000G2bc-1lHe;
	Fri, 12 Apr 2024 08:20:14 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvC8p-0000000G2W8-075W
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 08:20:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C23821C0006;
	Fri, 12 Apr 2024 08:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712910002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bJUCIMn/rajlyaxnzTNwaSCWbhEzp97H4xnhV905vNo=;
	b=LJortwtJQGNY1eJbDqWKF0mbUu0wPY02T1X/U3Q6Sl9WboKySSj6lhd/4CFBa6jpmnUFoO
	zWfp8i0vng69W5sOjVS2xplF+bkHDIvCHxWpozMmDZ+HFy3D762e9WMqlxsv41MiZdS5N1
	7y0mmaZsQB0Zt8wkDnKPWQULtzNE9TValSAPnaJDn/2HoVCiBdGWyauOfGOsRVBDbWdbZy
	crwunf0rBpXtQUtVD6wKbSCw/4FzQsGrcfR9KZYT99cA6PW0+Vtc4TC99Qmmp0QzxsnsbG
	3uazTukszLfnq5yMb++rNTm4zXM8EWRg3LMXV5indkSuYoRtjzvQ2KaEBh+4XA==
Date: Fri, 12 Apr 2024 10:20:00 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wefu@redhat.com
Cc: jszhang@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, guoren@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: rtc: Add optional property "prescaler"
 in APM X-Gene RTC Document
Message-ID: <20240412082000279430d0@mail.local>
References: <20240412080238.134191-1-wefu@redhat.com>
 <20240412080238.134191-3-wefu@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240412080238.134191-3-wefu@redhat.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_012011_254329_4914B6D6 
X-CRM114-Status: GOOD (  14.40  )
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

On 12/04/2024 16:01:44+0800, wefu@redhat.com wrote:
> From: Wei Fu <wefu@redhat.com>
> 
> Add optional property "prescaler" for APM X-Gene RTC.
> The clock source on some platform to RTC is NOT 1HZ,
> so we need to prescale the clock to make the input clock become 1HZ,
> like (32K/prescaler) = 1HZ on the XuanTie TH1520 AP sub-system RTC.
> 
> Signed-off-by: Wei Fu <wefu@redhat.com>
> ---
>  .../devicetree/bindings/rtc/xgene-rtc.txt        | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/xgene-rtc.txt b/Documentation/devicetree/bindings/rtc/xgene-rtc.txt
> index fd195c358446..25ba8cf0cc31 100644
> --- a/Documentation/devicetree/bindings/rtc/xgene-rtc.txt
> +++ b/Documentation/devicetree/bindings/rtc/xgene-rtc.txt
> @@ -10,6 +10,9 @@ Required properties:
>  - #clock-cells: Should be 1.
>  - clocks: Reference to the clock entry.
>  
> +Optional properties:
> +- prescaler: Reference to the Value of Counter Prescaler.

What about getting the input clock rate and calculate the needed
prescaler instead of having it in the device tree?

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
