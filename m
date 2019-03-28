Return-Path: <SRS0=Etk4=R7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58891C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 18:47:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A86320700
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 18:47:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QVU+CYDV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A86320700
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+xh1nZn4F7bUxE+cbmKYfHzmBS9paRDhAQAUJfzd0+4=; b=QVU+CYDVkZmafc
	W7nn7tkpKGIUNWyw2FCtO5beP5zz3v18AJYMuL5CtXokhAs/F1PaHx7nD49RJLoqY2E5sg7GBlU/E
	m5V/B+8ILaMOCdBr3r31yXJxZS3uYqJ5FKW19lZk1DACFUM6I9ZXRowD5/RYqS42Im31BBmJZuk8m
	U5n2NnsXuR+XX+UhQ78z6JsrvjEG9p5hFD1xT7iZD5aIYYVuB7N6yYhn9cDvWtxr6jrxT/BT76uwd
	dqrF68y5gW1WPNL6TNRS1BSlG8KQSDnLTMmZQ1Nv09jxQkLjQZzVxp2s9p19v7TXznx6AXXfEopjH
	q4jcmnU2TDpA6f4ZOlVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9a3l-00070q-VS; Thu, 28 Mar 2019 18:47:29 +0000
Received: from foss.arm.com ([217.140.101.70])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9a3j-000707-47
 for linux-riscv@lists.infradead.org; Thu, 28 Mar 2019 18:47:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B8DA15AB;
 Thu, 28 Mar 2019 11:47:25 -0700 (PDT)
Received: from [10.1.196.105] (eglon.cambridge.arm.com [10.1.196.105])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AAB73F614;
 Thu, 28 Mar 2019 11:47:22 -0700 (PDT)
Subject: Re: [PATCH 1/2] edac: sifive: Add DT documentation for SiFive L2
 cache Controller
To: Rob Herring <robh@kernel.org>, Yash Shah <yash.shah@sifive.com>
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
 <1552382461-13051-2-git-send-email-yash.shah@sifive.com>
 <20190328131657.GA9056@bogus>
From: James Morse <james.morse@arm.com>
Message-ID: <be7246a0-2426-995d-0a24-f104c173d752@arm.com>
Date: Thu, 28 Mar 2019 18:47:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190328131657.GA9056@bogus>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_114727_177354_11DD46C8 
X-CRM114-Status: GOOD (  19.37  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 palmer@sifive.com, linux-kernel@vger.kernel.org, bp@alien8.de,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, mchehab@kernel.org,
 linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Rob, Yash,

On 28/03/2019 13:16, Rob Herring wrote:
> On Tue, Mar 12, 2019 at 02:51:00PM +0530, Yash Shah wrote:
>> DT documentation for L2 cache controller added.

>> diff --git a/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt b/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt
>> new file mode 100644
>> index 0000000..abce09f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt
>> @@ -0,0 +1,31 @@
>> +SiFive L2 Cache EDAC driver device tree bindings
>> +-------------------------------------------------
>> +This driver uses the EDAC framework to report L2 cache controller ECC errors.
> 
> Bindings are for h/w blocks, not drivers. (And Boris may want a single 
> driver, but bindings should reflect the h/w, not what Linux (currently) 
> wants.

For h/w block compatibles and edac, I think all we need now is to ensure the DT contains
the three compatible strings: platform (if there is one), soc and ip-name (if its a
re-usable thing).
This is so that linux can pick the biggest of the three (usually platform) to probe the
driver from, as this lets us capture platform properties we only find out about later.

The single-driver idea is because ras/edac gets done late, (its not necessary to boot
linux on the board), and the edac core has difficulty with multiple components feeding
into it.

I don't think we need platform-specific-drivers until someone has a platform that needs
one for this multiple-component issue. To let us do that later (and possibly your
customer's customer to do it), we'd like to avoid probing based on the smallest
compatible, and use the biggest instead.
This lets us remove the platform-compatible from the L2-cache-controller driver's list,
and let some platform driver use it as a library instead. This is to avoid 'but not this
one' checks in the driver.

Yes it results in more one-line patches to enable support in the kernel, but these are
also statements that this platform/soc supports ras/edac. Its possible to build a soc out
of components that all support ras, but not have it working end-to-end.
(oh its optional, was it turned on? Does firmware need to enable something? Is there a
side-band signal, was it wired up everywhere).


> Are the only controls for ECC? Are all the cache attributes discoverable 
> (size, ways, line size, level, etc.)? 

>> +Example:
>> +
>> +cache-controller@2010000 {
>> +	compatible = "sifive,fu540-c000-ccache", "sifive,ccache0";

/me googles
fu540-c000 is the soc, but it doesn't have dram, so it must get used in other platforms.

If there is anything the platform/firmware can influence with this thing please ensure
they have properties in here. (firmware-privilege enables, or pins that have to be tied
high/lwo)

As an example of the problem we're tring to avoid: someone could re-use the design of
"sifive,ccache0" in another soc, where the DRAM controller also supports edac. From just
"sifive,ccache0", they can't tell their system (which needs a multi-component driver) from
yours, which just needs this one.

There may be a clever way of getting DT to do this...


>> +	interrupt-parent = <&plic>;
>> +	interrupts = <1 2 3>;
>> +	reg = <0x0 0x2010000 0x0 0x1000 0x0 0x8000000 0x0 0x2000000>;
>> +	reg-names = "control", "sideband";
>> +};
>> -- 
>> 1.9.1
>>


Thanks,

James

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
