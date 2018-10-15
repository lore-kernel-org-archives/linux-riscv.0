Return-Path: <SRS0=r0AO=M3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87289C04EB9
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 22:46:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 559ED208B3
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 22:46:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tnds6A9I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Q6r2P9SC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 559ED208B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DrwAHjrldY9zlrjXbFdEwjpZqdZfNaNqxU3VIkNURW4=; b=tnds6A9IkG2t9cMKxON9Iud0i
	alnKRonSrKjlyh2u5ltkvh7lXcpNqRZ3fFBeRqKIVFR6ZAxVlj40j7mV4YS5PMaoAu+Iph82XnO5w
	+hxTh0h+ncc1QxOCxikRst20X4EotFLcMFHpOZw2yyPc/7je2I2QOHphVpBEkLAMBW0mPgn92ULwM
	B/1KYJi2gfJuv3Ed4rwkkc4yF9KP8m/9kiQPKtOGcfEc+VpRPjBZWi7+byHFPJWv/Lfwts10YhnOS
	0/ne7P6hn4uIAO8I1hU7nloTQZLIgz5SCbgyoXN45KEM/MkZZBLXdMCuK7R2pvL2in93E+qN2G2YH
	Fe2FYmMpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCBcf-0003Qw-IH; Mon, 15 Oct 2018 22:46:01 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCBcc-0003P2-Ca
 for linux-riscv@lists.infradead.org; Mon, 15 Oct 2018 22:45:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1539643558; x=1571179558;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=0kqf4lYkvDyufTbLog7W6BaQxp+WNMo095AGVKAKpQo=;
 b=Q6r2P9SCW4gscnFf6KOxR9UfoG1Fpd+UIGuQzZPVsGryk6kAXvBzcN1f
 Xpxj6AZLh6PU0OipvEPoORfCXaP0aPSkPVbtS+T3on7jJy/dK7RXsx0MD
 8xaw0GEjVUK9ubvFXuIx9hd4zElxzI0R9FNH7fUeqB+XTdjoNqy3T04K5
 +HM63mF4T8XD+nSPhqyo3cDWxEl9q1tQq++0BNmYDQlxdztwZmmWSzexh
 pEaSyWGNpfzOvsGJ0Q1ec1DQl5KMgYJA78vSUNVYSqPqxyzap+5a/4UDr
 mP2LTvEJfvceN/h8MlJEoaQ7nv63dIa+EjG8pfSP0IbO1m/7+Ny1xFP9M w==;
X-IronPort-AV: E=Sophos;i="5.54,386,1534780800"; d="scan'208";a="93684434"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Oct 2018 06:45:46 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 15 Oct 2018 15:30:22 -0700
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.73.114])
 ([10.111.73.114])
 by uls-op-cesaip01.wdc.com with ESMTP; 15 Oct 2018 15:45:47 -0700
Subject: Re: [RFC 1/4] pwm: sifive: Add DT documentation for SiFive PWM
 Controller.
To: Thierry Reding <thierry.reding@gmail.com>,
 Wesley Terpstra <wesley@sifive.com>
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
 <1539111085-25502-2-git-send-email-atish.patra@wdc.com>
 <20181010135109.GE21134@ulmo>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <ef19e79a-d975-bde4-1692-65389ead7c15@wdc.com>
Date: Mon, 15 Oct 2018 15:45:46 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181010135109.GE21134@ulmo>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181015_154558_468756_7DF7086A 
X-CRM114-Status: GOOD (  15.24  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linus.walleij@linaro.org, palmer@sifive.com, linux-kernel@vger.kernel.org,
 hch@infradead.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181015224546.0VeDZqhZ1wwfm8rtReNMrcYwAYdriQ4mRcQ4E97Beos@z>

On 10/10/18 6:51 AM, Thierry Reding wrote:
> On Tue, Oct 09, 2018 at 11:51:22AM -0700, Atish Patra wrote:
> [...]
>> +- interrupts: one interrupt per PWM channel (currently unused in the driver)
> 
> This should probably say what the interrupt is used for. And once you
> have that, remove the comment about it being unused in the driver. DT
> is OS agnostic, so "driver" is very unspecific and your claim may
> actually be false.
> 
> Thierry
> 
As per my understanding, they are generated by hardware but no usage of 
pwm interrupts as of now.

I am not sure if removing the entire entry is a good idea.
What would be the best way to represent that information ?

May be this ?

+-interrupts: one interrupt per PWM channel. No usage in HiFive 
Unleashed SoC.

Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
