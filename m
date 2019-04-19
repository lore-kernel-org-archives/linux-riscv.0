Return-Path: <SRS0=IJcX=SV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8CBEC282DA
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2019 19:29:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F15221479
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2019 19:29:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tVuHPFdr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="mlYgsU/q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F15221479
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DTYksv/6KPBGjvf/SaU1YcCqtKn34kpnQpkKLUmdRHY=; b=tVuHPFdrcFr9KGrUQzeWDs7l+
	Gl7gosiLfpxSGRMFkIGyzvE3Avs4DpLkkhFPs0lo49dRy6E5PDK3N+73vjoJsLvApZ1DhV9H7XCNu
	mu2/qHzVvgtoVzi9QRvDVIl8sTOdzFhFDlp7iyHX0n0ucSrSXRfFc/78A6aGAVnn0wOoTszfUGTNc
	eTk6G50zzb3xW4/qYSSTLHAid7PUnjnCe39yrlhVESef+yXO9u5Sps1olYXPL6C4FujOlDSmpQlol
	92r5IAiMyYU0dv0x3JnXTsJB8P6u+OZ9znPauLTF8adUm0ng8udMQaqO2n9iDAJS6P4DxB+b3nNHL
	tCtItkdHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHZCe-0003RF-Gd; Fri, 19 Apr 2019 19:29:40 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHZCa-0003QZ-JO
 for linux-riscv@lists.infradead.org; Fri, 19 Apr 2019 19:29:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1555702177; x=1587238177;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=A+7h5WbTxEYTGjfoEubh+u73kHoj9ynkG6MnblQmpP4=;
 b=mlYgsU/q89Jq1ubK+8khKPox8SK6bd6Fz4t0s6JlFPtgCyhvuAzWLPYV
 PVUlqIOo5LsxGuk7NhBG/MJef+tBVjHvUUfTgS4/J3Q2VIOw0f8iD7wil
 h9jJlaLKobIc9usTL5Di+uiglZ/2EYi3ZMwwVrehH0Zpy/x6ml/ZGvgnn
 Ry91iaTkms3ha9Fod/C2FIezpE9do+f7SXL4V2NZ+keSffO4dxvyIykxJ
 hFjyukQCbV08PSCOllUe1ZOoOkkYbZNefjjgUWK/zKYQJZutvG+Ehk/WZ
 gU0uDS1ny2C1/HOXSB10DR4Nfil8MNYYSvdqVW54AuLVs3ngdMVuxxu1D A==;
X-IronPort-AV: E=Sophos;i="5.60,371,1549900800"; d="scan'208";a="107599885"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Apr 2019 03:29:35 +0800
IronPort-SDR: wP3rsWGfHsD3uDIDtRDrlOBnZCFU5RVqag6Mkgs1Mg0eS/u5dfggT2eCL061BBnuyFPVqy6OZB
 YbNR7eqSwN+5PcNLdLY5o7r99Ieqzo/g7rtgNgRdZHm7BJwNj56MBkxzdPXLJMrof9cg9TDDNh
 nNtj0BsE8fun+1tDuf2DXutn3H/rEVINatQIsPRebtWhqqzgutcJRQF8GwbVfEOlzrE6RObBmA
 yFN4FASr6HOnUpRf55lnSCZi0Pvhg0Qr4UdZI110KX155eoKH+4dJVTNkqZiY5MINQcnhxIBWR
 DcMfw16h0rvJiJv5450VUoCY
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 19 Apr 2019 12:08:22 -0700
IronPort-SDR: 6LU24F7zEw6o0ER6ll9wtyVM/KuKY0PPYLt5iD21lXXc0Dl+j+QK2O7Jz9xWQmSm6iGRqrgHHL
 tgl9C8yU/ML2cD/Cg44+Cxzl+Ut113gQx079gemju7YbfAv7wiG5hVa7lZxH3l5HwFUTkWg/4i
 6MWUDnpnwby0vJTjyZudP/58raJb5RsxerpiqzUq1KJWbYIHqocwMOlcK6BHEIkY+jmdRwCY3o
 Hkin8yYUux70pH8lCYFZZlxNUCEJr4O1sk0EaWsSoQkHxKfIWrTY2cMNV9hUmuVxaS29tgFNj0
 yrQ=
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.66.167])
 ([10.111.66.167])
 by uls-op-cesaip02.wdc.com with ESMTP; 19 Apr 2019 12:29:35 -0700
Subject: Re: [PATCH v5 0/2] tty: serial: add DT bindings and serial driver for
 the SiFive FU540 UART
To: Kevin Hilman <khilman@baylibre.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
References: <20190413020111.23400-1-paul.walmsley@sifive.com>
 <7hmukmew5j.fsf@baylibre.com> <883f3d5f-9b04-1435-30d3-2b48ab7eb76d@wdc.com>
 <7h5zr9dcsi.fsf@baylibre.com>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <f2bb876c-2b44-663b-ea06-d849f721fb6c@wdc.com>
Date: Fri, 19 Apr 2019 12:29:33 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7h5zr9dcsi.fsf@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190419_122936_759831_EBAE73E6 
X-CRM114-Status: GOOD (  26.49  )
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

On 4/19/19 12:18 PM, Kevin Hilman wrote:
> Atish Patra <atish.patra@wdc.com> writes:
> 
>> On 4/18/19 4:22 PM, Kevin Hilman wrote:
>>> Hi Paul,
>>>
>>> Paul Walmsley <paul.walmsley@sifive.com> writes:
>>>
>>>> This series adds a serial driver, with console support, for the
>>>> UART IP block present on the SiFive FU540 SoC.  The programming
>>>> model is straightforward, but unique.
>>>>
>>>> Boot-tested on a SiFive FU540 HiFive-U board, using BBL and the
>>>> open-source FSBL (with appropriate patches to the DT data).
>>>>
>>>> This fifth version fixes a bug in the set_termios handler,
>>>> found by Andreas Schwab <schwab@suse.de>.
>>>>
>>>> The patches in this series can also be found, with the PRCI patches,
>>>> DT patches, and DT prerequisite patch, at:
>>>>
>>>> https://github.com/sifive/riscv-linux/tree/dev/paulw/serial-v5.1-rc4
>>>
>>> I tried this branch, and it doesn't boot on my unleashed board.
>>>
>>> Here's the boot log when I pass the DT built from your branch via
>>> u-boot: https://termbin.com/rfp3.
>>>
>>
>> Unfortunately, that won't work. The current DT modifications by OpenSBI.
>>
>> 1. Change hart status to "masked" from "okay".
>> 2. M-mode interrupt masking in PLIC node.
>> 3. Add a chosen node for serial access in U-Boot.
>>
>> You can ignore 3 for your use case. However, if you pass a dtb built
>> from source code, that will have hart0 enabled and M-mode interrupts
>> enabled in DT.
> 
> Hmm, so what you're saying is there not currently any way to pass a DT
> built from source using OpenSBI + mainline u-boot?
> 

OpenSBI can accept DT built from source with following build option.

FW_PAYLOAD_FDT="<unleashed>.dtb"

More documentation:
https://github.com/riscv/opensbi/blob/master/docs/firmware/fw_payload.md

> As a short-term workaround, is there a way to make these changes from
> the u-boot command-line after loading a DTB built from source into
> memory?  If so, I could at least script that part.
> 
> 
>> Not sure if we should do these DT modifications in U-Boot as well.
> 
> I guess so (and I'd be happy to test the patch.)
> 
> Either that, or the upstream DTs (or code) should have those features to
> the right settings.
> 
> Speaking of which, I tried to patch the DT from Paul's recent series[1]
> to make the necessary changes.  I can see where to change cpu0 from
> "okay" to "masked", but I'm not so sure how to make the PLIC change.
> 

Here is the code snippet of how OpenSBI modifies the DT.

https://github.com/riscv/opensbi/blob/master/platform/sifive/fu540/platform.c#L53

If you just want to use custom built DTB, you can use OpenSBI build 
option instead of scripting these.

We don't want OpenSBI to keep modifying the DT forever. But we have to 
do it until there is a better solution available.

> I was hoping to be able to review/test Paul's DT patches, but now I'm a
> bit confused as to how to do that.
> 
>> I also noticed that your kernel is booting only 1 hart.
>> Just FYI: RISC-V SMP for U-Boot patches are merged in master. So you
>> should be able to boot all cpus. You can ingore FU540_ENABLED_HART_MASK
>> in OpenSBI build as well.
> 
> Ah, nice.
> 
> I've just updated to u-boot master branch with SMP enabled, and build a
> new openSBI (also from master branch) with u-boot payload. Using your
> v5.1-rc4_unleashed branch, I see 4 CPUs booting:
> https://termbin.com/kg13
> 

Great.

Regards,
Atish
> Thanks,
> 
> Kevin
> 
> [1] https://lore.kernel.org/lkml/20190413020111.23400-1-paul.walmsley@sifive.com/T/#m77daa2857b76ec7cbca0672ad03ae286f61ca0e6
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
