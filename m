Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3A4108B8E3
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 09:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TZtNb2sBKl8vMi37O+fo+16UuOHBU38UbuBIJ9d5jKg=; b=HtJmRHzR+Qtrpb
	JVCt67KEfFmdKclnv7NI983DM+R1umJ9MIGWkxvkSQxgDZoh0CFJfsiam8KJIEtrzOtAQ9gIXOtps
	pYxVZC6u7HwZiPIOwslGLB/nKwsDcTa1BAHXks4wclV0iTzHQavXmkYMVD9P3H0jM8+HsR65Scw9B
	iaoRyynxYE+zXTYJutsg8JJwQ4PSnIHA9SGEDbVy6rzN+zjeyC6peanXjcdSzexBP4fwuQcpswAqc
	jY8hZWWeuiumTyyvmfKhrxMEOIAWubQlY0AAjz0ZB8Co/RiWzxEB1OYQ3f3ZqfCO6FoAfUGzmT/+5
	W4Tc9/ZSP2ViUoSklDRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WWI-0000000CWGg-2k0r;
	Fri, 20 Mar 2026 09:51:54 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WWF-0000000CWGB-1CQ9
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 09:51:53 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774000306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SB0KpBn5A09Moyx+zjJpQCHUxGkKOb8xwpecR+YoJT4=;
	b=ux7sY9ywu+wS45NR3bq7PywwA4yYp30v4K9OZ3Eua2QuPZ2luZmhd+98gprsJzH8xMB6Nf
	bXJjA8h8o5i/Y29DqWrnoMESdqi7RX+zRDB2jAHBO9x1sk9Lwda/m2n2LHrDjmm2dXUlqt
	i6aWySuiFz498jMm/x8VCqt1OVKoXpU=
Date: Fri, 20 Mar 2026 17:50:50 +0800
Message-Id: <DH7ILSL8DXBO.ZR74CL1QEUBU@linux.dev>
Cc: <dlan@kernel.org>, <gregkh@linuxfoundation.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-usb@vger.kernel.org>, <spacemit@lists.linux.dev>,
 <thinh.nguyen@synopsys.com>
Subject: Re: [PATCH 1/1] usb: dwc3: dwc3-generic-plat: Add optional VBUS
 regulator support
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <huang.ze@linux.dev>
To: "Chukun Pan" <amadeus@jmu.edu.cn>, <huang.ze@linux.dev>
References: <DH7FXPBMB1K5.28IT6DZQ280ZV@linux.dev>
 <20260320081826.1331721-1-amadeus@jmu.edu.cn>
In-Reply-To: <20260320081826.1331721-1-amadeus@jmu.edu.cn>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_025151_837608_D1677989 
X-CRM114-Status: GOOD (  20.24  )
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

Hi Chukun

On Fri Mar 20, 2026 at 4:18 PM CST, Chukun Pan wrote:
> Hi,
>
>> I don't think it's a good idea to tie this optional VBUS regulator
>> implementation to the SpacemiT K1 platform.
>>
>> While the K1 SoC does have a DRD controller, current boards in the wild
>> (like Jupiter[1], OrangePi RV2[2], and Banana Pi F3[3]) all route this
>> port to an onboard hub[4][5]. IMHO, managing the downstream VBUS regulator
>> via the onboard_usb_dev driver is the correct approach for us.
>
> I'm sorry, but I don't quite understand why it's necessary to use
> onboard_usb_dev driver instead.
>

I think it's better to align the driver with the actual hardware. I'm not
opposed to managing any regulators in usb host/device drivers. But if we
do have an onboard hub, and regulator belongs to the downstream ports of
the hub, then it's hub's job, right?

>
> The DRD controller is connected to the onboard USB hub, so it can
> only operate in host mode. If all downstream ports of the USB hub
> use the same VBUS supply, then what's the problem with using this?

It does work.

Many boards leave gpio controlled regulators always on, that's what we
want to solve. If we have to choose the parent of these regulators, why
not put them in the correct hierarchy?

>
>> K1 platform currently does not need this feature here.
>>
>> Considering the role switch, I think it would be better to hold off on
>> this until there is an actual board/user that relies on it.
>
> There is a board without onboard USB hub,

If such a board really need the regulator, IMO, your patch is the way to go.

>
> such as the OrangePi R2S.
> So this is possible for boards that don't have onboard USB hub?

OrangePi haven't released the schematic yet.

That's what I could find [1], which seems similar to RV2.

    &usb3hub {
    	vbus-gpios = <&gpio 123 0>;	/* gpio_123 for usb3 hub pwr and output vbus */
    	status = "okay";
    };

[1] https://github.com/orangepi-xunlong/linux-orangepi/blob/orange-pi-6.6-ky/arch/riscv/boot/dts/ky/x1_orangepi-r2s.dts#L762

>
> Thanks,
> Chukun

Thanks,
Ze

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
