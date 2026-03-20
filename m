Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFAC1093182
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 07:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=87KlHzoPuYo5AVisPhcImjFDeEiBVzxm9/oHV536sV0=; b=ZH5N/+mrafWMaz
	zrScqAjL5qllmhtl5zvWnu+YIDxzTxFnhUa0etKwgIRaasQlR8O55szMLsVPfuWv45p0a7RbKMvbZ
	nYZHMFpLY3ACRTwvHDZRNLFuakXFVDYDjVrLiu7SSQVDRF8XG3iFzunQl0uMgiuDxUXVn3mwXKze3
	YipM5pJmkpSoLMKjC1hF+RDUXAS5wFL11MLJL8sA+Hh1FZyNRIM/dFFKRHJTNLtDAJgUn6W5a2yIQ
	FvTj3QvxZK0HNaRPlJCSkQOFTW3MLZewAHbDX5OP5f1Y5DqrDAPLZH8qdQA9U5O3oN9CjKiO8yjts
	7gWq9t0MV1GHLin25/ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UYw-0000000CHZk-2EfE;
	Fri, 20 Mar 2026 07:46:30 +0000
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UYs-0000000CHYv-0Vtt
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 07:46:28 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773992778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xpMLAOZvhEkRytV+fa+rQ9qyVsW7tLTtfEbuNXc7Mh0=;
	b=cuId0NRlWcRCWES4HU+Lc0ibv221MW3lWyOOSu7k/bwBjgd6QZ39zqgGbVZbJJ35e4WLsi
	ivNw38ZPjVePckXTnkAQjc1bCiwMpGJ3HUWyE35Nio1vJntwQpAvjhLXhu7qIOjQjyIG0A
	22Zoytt9cfpinC0/jvLWb2yWP4He7zQ=
Date: Fri, 20 Mar 2026 15:45:20 +0800
Message-Id: <DH7FXPBMB1K5.28IT6DZQ280ZV@linux.dev>
Cc: <dlan@kernel.org>, <gregkh@linuxfoundation.org>, <huang.ze@linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-usb@vger.kernel.org>, <spacemit@lists.linux.dev>
Subject: Re: [PATCH 1/1] usb: dwc3: dwc3-generic-plat: Add optional VBUS
 regulator support
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <huang.ze@linux.dev>
To: "Chukun Pan" <amadeus@jmu.edu.cn>, <thinh.nguyen@synopsys.com>
References: <20260319214633.cyzr7silffbzisot@synopsys.com>
 <20260320063621.1204038-1-amadeus@jmu.edu.cn>
In-Reply-To: <20260320063621.1204038-1-amadeus@jmu.edu.cn>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_004626_377319_49EBC48E 
X-CRM114-Status: GOOD (  18.77  )
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

On Fri Mar 20, 2026 at 2:36 PM CST, Chukun Pan wrote:
> Hi,
>
>> In my previous response, I noted to pass the name/id that best match
>> your platform in the dwc3_generic_config. This structure is passed as
>> private data corresponding to your k1 platform compatible string. That
>> should solve the naming issue (i.e. you can keep the name "vbus").
>
> Thank you for your suggestion, I will change it to match compatible.
>
>> > Do I need to check if it's in host mode?
>>
>> Is your k1 a DRD controller, and that it can operate in device mode?
>> If so, does it save power to disable the regulator while operating in
>> device mode?
>
> It is a DRD controller that supports switching between Host and Device
> modes. I will change it to enable regulator only in Host mode.
>
>> > > Also do we want to disable the regulator on system suspend? If so,
>> > > we may need a regulator handle.
>> > 
>> > I'll add it if you think it's necessary.
>> >
>> Same comment as above, but this will be more involved. E.g. you may only
>> want to disable the vbus when remote wakeup is disabled and power saving
>> is more essential (disabling vbus will disconnect the device).
>
> I will consider implementing it in the future.
>
> Thanks,
> Chukun

Hi Chukun,

I don't think it's a good idea to tie this optional VBUS regulator
implementation to the SpacemiT K1 platform.

While the K1 SoC does have a DRD controller, current boards in the wild
(like Jupiter[1], OrangePi RV2[2], and Banana Pi F3[3]) all route this
port to an onboard hub[4][5]. IMHO, managing the downstream VBUS regulator
via the onboard_usb_dev driver is the correct approach for us.

[1] https://github.com/milkv-jupiter/jupiter-files/blob/main/hardware/v1_0/jupiter-sch-v1_0.pdf (page 20)
[2] https://drive.google.com/drive/folders/1pcI_U0C3VJKTCg8A1zj08CwNbohnONSR (page 16)
[3] https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/view (page 24)
[4] https://www.lcsc.com/datasheet/C209756.pdf
[5] https://www.lcsc.com/datasheet/C157362.pdf

K1 platform currently does not need this feature here.

Considering the role switch, I think it would be better to hold off on this
until there is an actual board/user that relies on it.

Thanks,
Ze

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
