Return-Path: <SRS0=IJcX=SV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3832C10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2019 01:04:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B51A7214DA
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2019 01:04:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dhD/2gpe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="kfPmko0b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B51A7214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dqLqN90UgQ9zuB9blSe/IkwoEF0jJ30Zg+29x3pJZsw=; b=dhD/2gpesjk91fFku9awMJZ/l
	j74/cbAyxV6hdTavrsac6a5hHmwfcAkXb9PUf1Rf1l3akzFau9MvMlFnWCsEV4aCAXg54P1ZogPpa
	anFTdukYab8CdIB5zBKWNkbJP9klQf0FGPfisMM6tSrcHwhhBIyrPigwV5/4M0VLyc5gS79uepmEK
	Zkva1y0h2H3pjlbdDvTE/Je8ENMHrWoH6c4wZko1KHKOnZJrc8eRmOMjQY9x9lIx1McgiCEO1qgPV
	AL+dBcMLd/BRMSYyubgsZ1FZ3meWJdU8SidUWpEs2DF9cSzB3mGJPXdukFFgzYUWc10USQHDR0q6L
	9tCeTqKgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHHxK-0005Fb-LS; Fri, 19 Apr 2019 01:04:42 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHHxH-0005FA-40
 for linux-riscv@lists.infradead.org; Fri, 19 Apr 2019 01:04:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1555635880; x=1587171880;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=JNCt4ralk0VadV9rI8zNMEe1OWC5/ViM+mry1FGDxlM=;
 b=kfPmko0b9gWEOM7ToRwNIQ3tz72Fl8Z5J/8IhmD/gMn29c1avOfDobgA
 NX43OhbWTtWuijZWa1r2nqSlXTNLqkWVBYKzr/K7vnr9O93HaDhWDtoEi
 ApGwHfoSd5rjrJjABPiu3YtFKmqAfa279ygsTnC/Uz4r/mP+mWUuHbGCQ
 4Qs08f0OKCAGFHHbKK7inBfO+uxCET72uMnOx+WZpwPawmNGX1DlrcLgv
 RJ+YuT1CizNRwqGg7xzAQwTfo1Z1pictm/GGvjwVUiJwBoNYLaGm1NWEv
 PKxK1bvk32uGUGDdX6dgKc+lQ/nj7+ArI5qzMfbHet8SZqjfQp772ZN6E Q==;
X-IronPort-AV: E=Sophos;i="5.60,368,1549900800"; d="scan'208";a="108048954"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Apr 2019 09:04:37 +0800
IronPort-SDR: 37AoI3nFK/f2fww2xYSmQm7RvuXQjmUxI4gn+dz764VmcYvHPYRPyWUvdcx7lBCoK3H4jmha9t
 wHKPTFWS3l9Fn0mzyqqH+bzf59OnpjH3o7thDrFo9q5EHYyxYfVfF1ORbvn53JaNai0Tp42YYi
 w3Ehr3qHm8Lx4J/SacZhu2GXqTYC/m5P5PGLpCOc8AKAp/NW199S1cLn52K812gYkMoPqfkw5w
 jvKa8E53EIIWhsDvMbg966Y5xu3auvFKPTYlOCnQhkZs6ScWVnVqn0+0ERmsVbaRN52qUqftiH
 cxPWIe9ff5qZDsRG92fJkJKT
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 18 Apr 2019 17:41:16 -0700
IronPort-SDR: PQR7nOItCqyBJzQYvRhU0UFx1nEetSzlPMBSxEpDHPcrR/bWebKsjXtP4/6ZOR9NjIxVlo15VQ
 CF4wNaEv3BDEJmG3ShBB7joswaPwzgIvA7mHYOEFQGGJfeO8ZjCMrbgUpp2UP4HW7cEPMjQibG
 Vs2mRJCPcV3BtuM48t/1J9KJOyVeOjG+I2gMivURKmXU9g0y8Soj9kYhGgCDZpFcqHaBlScf14
 CTcRrgbN4djH750Tr12ON6tuwzNoyKc9kPld8Q0HpRougXQOeHZATi2BW2HBDOgEm6Bo3G3OzL
 0Ro=
Received: from usa003981.ad.shared (HELO [10.86.53.90]) ([10.86.53.90])
 by uls-op-cesaip02.wdc.com with ESMTP; 18 Apr 2019 18:04:36 -0700
Subject: Re: [PATCH v5 0/2] tty: serial: add DT bindings and serial driver for
 the SiFive FU540 UART
To: Kevin Hilman <khilman@baylibre.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
References: <20190413020111.23400-1-paul.walmsley@sifive.com>
 <7hmukmew5j.fsf@baylibre.com>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <883f3d5f-9b04-1435-30d3-2b48ab7eb76d@wdc.com>
Date: Thu, 18 Apr 2019 18:04:34 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7hmukmew5j.fsf@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_180439_224415_B0103702 
X-CRM114-Status: GOOD (  22.91  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/18/19 4:22 PM, Kevin Hilman wrote:
> Hi Paul,
> 
> Paul Walmsley <paul.walmsley@sifive.com> writes:
> 
>> This series adds a serial driver, with console support, for the
>> UART IP block present on the SiFive FU540 SoC.  The programming
>> model is straightforward, but unique.
>>
>> Boot-tested on a SiFive FU540 HiFive-U board, using BBL and the
>> open-source FSBL (with appropriate patches to the DT data).
>>
>> This fifth version fixes a bug in the set_termios handler,
>> found by Andreas Schwab <schwab@suse.de>.
>>
>> The patches in this series can also be found, with the PRCI patches,
>> DT patches, and DT prerequisite patch, at:
>>
>> https://github.com/sifive/riscv-linux/tree/dev/paulw/serial-v5.1-rc4
> 
> I tried this branch, and it doesn't boot on my unleashed board.
> 
> Here's the boot log when I pass the DT built from your branch via
> u-boot: https://termbin.com/rfp3.
> 

Unfortunately, that won't work. The current DT modifications by OpenSBI.

1. Change hart status to "masked" from "okay".
2. M-mode interrupt masking in PLIC node.
3. Add a chosen node for serial access in U-Boot.

You can ignore 3 for your use case. However, if you pass a dtb built 
from source code, that will have hart0 enabled and M-mode interrupts 
enabled in DT.

Not sure if we should do these DT modifications in U-Boot as well.

I also noticed that your kernel is booting only 1 hart.
Just FYI: RISC-V SMP for U-Boot patches are merged in master. So you 
should be able to boot all cpus. You can ingore FU540_ENABLED_HART_MASK 
in OpenSBI build as well.

Regards,
Atish
> I also tried the same thing, but using the DT that's hard-coded into
> SBI/u-boot.  That doesn't boot fully either[1], but one thing I noted is
> that with the DT from the kernel tree, the printk timestamps aren't
> moving.  Maybe I'm still missing some kconfig options to enable the
> right clock and/or IRQ controllers? I'm using this fragment[2] on top of
> the default defconfig (arch/riscv/configs/defconfig).
> 
> Could you share the defconfig you're using when testing your branch?
> 
> Also for reference, I'm able to successfully build/boot the
> 5.1-rc1-unleashed branch from Atish's tree[3] using that kconfig
> fragment[2] (and the hard-coded DT from u-boot/SBI).  Full log here[4].
> 
> Thanks,
> 
> Kevin
> 
> [1] https://termbin.com/wuc9
> [2]
> CONFIG_CLK_SIFIVE=y
> CONFIG_CLK_SIFIVE_FU540_PRCI=y
> 
> CONFIG_SERIAL_SIFIVE=y
> CONFIG_SERIAL_SIFIVE_CONSOLE=y
> 
> CONFIG_SIFIVE_PLIC=y
> CONFIG_SPI=y
> CONFIG_SPI_SIFIVE=y
> CONFIG_GPIOLIB=y
> CONFIG_GPIO_SIFIVE=y
> CONFIG_PWM_SIFIVE=y
> 
> CONFIG_CLK_U54_PRCI=y
> CONFIG_CLK_GEMGXL_MGMT=y
> 
> [3] https://github.com/atishp04/linux/tree/5.1-rc1-unleashed
> [4] https://termbin.com/12bg
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
