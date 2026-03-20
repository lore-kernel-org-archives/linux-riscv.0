Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF221098796
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 15:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tFolG3FTEMkhkY2lbkj/kKtJdDGShsa3DaX7hZcXAD8=; b=fy7PYc+tqNIuvH
	4x15LNShgwFlncVYPqa0GAcj7mi/IKN8gZKpkJrw7cXR6MSXsUkWyH1691qJElKksZI0cT2k5JuiZ
	hhjQKyJ19RkUOHFMP9DURCf+I8xG42CvXtYf9l7/RWR9NfBrZHwWB+6s5UZbOLmkxjd1DGFnb3meU
	Zu2OzYLU2upAThPceFbEn9gI1z7hhOM4IRPyPU2M9yDH/4YFKcJ6v+Vl/fgM5VV7Gslmas3XNMMDN
	D+ewaJ6qLbc26iQO8f7zZtSsaBG6pPRk4epiZtEg4gy6myAXfvuXbFh0tLKlJ9ofkkYQD0kwLQqi5
	74EfRZT7DAIpSJec5mPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bQr-0000000D0DB-3CPL;
	Fri, 20 Mar 2026 15:06:37 +0000
Received: from out-178.mta0.migadu.com ([91.218.175.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bQo-0000000D0As-0pn4
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 15:06:36 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774019191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+gY0U88ZU3WFbE3S3UKhriDpSE3AB91y+8EwGdS+r/8=;
	b=ru+5fBvcm+pEAo0/qfX05QZrWp0JkVZkWaK/eGQezaL3cnyirJyZv/JIfWcEZr2udZrJys
	gL0u5/AscC8IMzlMsA/pii/52ijo4kxbVFlQM1NI/KKq0zjVsmDEwfSU0xz/UNh7xUJ8EN
	tSAdsI23J8B4l9To3y/mCEgDpxusVNI=
Date: Fri, 20 Mar 2026 23:05:33 +0800
Message-Id: <DH7PARAFZS7V.1YIE6OED3NA6C@linux.dev>
Subject: Re: [PATCH 1/1] usb: dwc3: dwc3-generic-plat: Add optional VBUS
 regulator support
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <huang.ze@linux.dev>
To: "Chukun Pan" <amadeus@jmu.edu.cn>, <huang.ze@linux.dev>
Cc: <dlan@kernel.org>, <gregkh@linuxfoundation.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-usb@vger.kernel.org>, <spacemit@lists.linux.dev>,
 <thinh.nguyen@synopsys.com>
References: <DH7ILSL8DXBO.ZR74CL1QEUBU@linux.dev>
 <20260320104026.1350571-1-amadeus@jmu.edu.cn>
In-Reply-To: <20260320104026.1350571-1-amadeus@jmu.edu.cn>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_080634_762929_28BBFFFD 
X-CRM114-Status: GOOD (  13.51  )
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

On Fri Mar 20, 2026 at 6:40 PM CST, Chukun Pan wrote:
> Hi,
>
>> I think it's better to align the driver with the actual hardware. I'm not
>> opposed to managing any regulators in usb host/device drivers. But if we
>> do have an onboard hub, and regulator belongs to the downstream ports of
>> the hub, then it's hub's job, right?
>
>> Many boards leave gpio controlled regulators always on, that's what we
>> want to solve. If we have to choose the parent of these regulators, why
>> not put them in the correct hierarchy?
>
> I think we can manage the regulator in the USB host driver first,
> and then use it after the onboard_usb_dev driver has been merged.
> This is better than keeping the regulator always on.
>
>> If such a board really need the regulator, IMO, your patch is the way to go.
>>
>> OrangePi haven't released the schematic yet.
>>
>> That's what I could find [1], which seems similar to RV2.
>
> There is no onboard USB hub. Just check the image:
>
> http://www.orangepi.org/img/r2s/details/17.png
> http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-R2S.html
>

That's fine, thanks.

> Thanks,
> Chukun


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
