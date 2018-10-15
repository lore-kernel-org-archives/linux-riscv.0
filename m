Return-Path: <SRS0=r0AO=M3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C5FC04EB9
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 22:57:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC8792054F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 22:57:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q6/mJs+e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="F/CNNzbo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC8792054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hHDhvl+BfJa+skDtTBrO7f/+w1h1hHOoyH3gNlxiYOs=; b=Q6/mJs+eJ5to3//svmOQGT1oj
	6ydkzmjC60A+4xKNvZF17IqGwCCBJmAVQ2bQ4DIeScZ9yCBivfdCb54yPr7HEpqsT0LBXKQSMxoHS
	u5MBEkZr0ZW7Op5d5QQeqBFCXoqeJJ02UenUNSYddzun/ns/BXT1znyje9KmPaiCvmNLV/DN7W8o1
	PaFAgU41AOtCkV8anKeigf++d+LZYqJ7SDbY2UgHFUkGqvHV4M7Lm0lJob78AnHI3DtXOw2aHxAkz
	v1/iMtOvhioYhOigmaV/sSgh/y9QwGpNdKloyZZ3ZNXSqzVWB9QlcVITynq0IRzbl5KfC1ZrQH+Mm
	0jhJ/OPXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCBo5-0008DK-3J; Mon, 15 Oct 2018 22:57:49 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCBo2-0008CX-OJ
 for linux-riscv@lists.infradead.org; Mon, 15 Oct 2018 22:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1539644267; x=1571180267;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=TNWsDsrY0+1IONRcBFghvNkJcTRtv8K90Rbf9IJ+PFU=;
 b=F/CNNzboSnUZj/AgGdFqmXMfk9DLCzBbn9OGQ+/rekERDTJnrdMhq+2E
 ZXJ57ZvmwjquZ1fzUykrumj+2xto9UsfgzCk4MniNoBCBf3Qpq1mSOwAp
 z+CUFVxwNUAHbaVomCvcIhstN9i6rcxM4e/9g0jJfUKPo0WODihhEFPsi
 mrN/dQYGwqvXywN0qLAIvgLAMqZ1slUZjSWgFgUBGF8+1uhGBTusCBUhv
 rCO7zOjM8Sji0Ut9mj4R3PJcRqAHWN5aDIDwI16JhC5bd3voBIYQwfqnv
 m+Jtk3+PWXpn5wRraKKhLoPdPDo1Q5iCcoK+ZEP49KWfF+3NeKH/gv51a A==;
X-IronPort-AV: E=Sophos;i="5.54,386,1534780800"; d="scan'208";a="92013127"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Oct 2018 06:57:36 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 15 Oct 2018 15:42:10 -0700
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.73.114])
 ([10.111.73.114])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 Oct 2018 15:57:36 -0700
Subject: Re: [RFC 1/4] pwm: sifive: Add DT documentation for SiFive PWM
 Controller.
To: Thierry Reding <thierry.reding@gmail.com>,
 Wesley Terpstra <wesley@sifive.com>
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
 <1539111085-25502-2-git-send-email-atish.patra@wdc.com>
 <20181010134926.GD21134@ulmo>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <25758ab9-eb36-741b-6264-42412b3ddd8e@wdc.com>
Date: Mon, 15 Oct 2018 15:57:35 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181010134926.GD21134@ulmo>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181015_155746_831170_5B342A81 
X-CRM114-Status: GOOD (  20.93  )
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
Message-ID: <20181015225735.JHH6CgAfNDS6xhGTwTQh-09s2x6kZrhWtZVcwn_LnQk@z>

On 10/10/18 6:49 AM, Thierry Reding wrote:
> On Tue, Oct 09, 2018 at 11:51:22AM -0700, Atish Patra wrote:
>> From: "Wesley W. Terpstra" <wesley@sifive.com>
>>
>> DT documentation for PWM controller added with updated compatible
>> string.
>>
>> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
>> [Atish: Compatible string update]
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> ---
>>   .../devicetree/bindings/pwm/pwm-sifive.txt         | 32 ++++++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt
>>
>> diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.txt b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
>> new file mode 100644
>> index 00000000..532b10fc
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
>> @@ -0,0 +1,32 @@
>> +SiFive PWM controller
>> +
>> +Unlike most other PWM controllers, the SiFive PWM controller currently only
>> +supports one period for all channels in the PWM. This is set globally in DTS.
>> +The period also has significant restrictions on the values it can achieve,
>> +which the driver rounds to the nearest achievable frequency.
> 
> What restrictions are these? If "nearest achievable" is too far off the
> target period it might be preferable to error out.
> 

@Wes: Any comments?

>> +Required properties:
>> +- compatible: should be one of
>> +	"sifive,fu540-c000-pwm0","sifive,pwm0".
> 
> What's the '0' in here? A version number?
>

I think yes. Since fu540 is the first Linux capable RISC-V core, SiFive 
Guys decided mark it as version 0.

@Wesly: Please correct me if I am wrong.

>> +	PWM controller is HiFive Unleashed specific chip which warrants a
>> +	specific compatible string. The second string is kept for backward
>> +	compatibility until a firmware update with latest compatible string.
>> +- reg: physical base address and length of the controller's registers
>> +- clocks: The frequency the controller runs at
>> +- #pwm-cells: Should be 2.
>> +  The first cell is the PWM channel number
>> +  The second cell is the PWM polarity
>> +- sifive,approx-period: the driver will get as close to this period as it can
> 
> Given the above comment, maybe "sifive,period"?
> 

ok.
In Unleashed board, the DT is loaded by FSBL (first stage boot loader). 
Thus, changing device tree entries requires a FSBL update. If we update 
this string, we need to update the driver to parse both properties so 
that existing devices with older firmware continue to work.

This is probably ok as we anyways do that for compatible strings. Just 
wanted to update that here for the record.

Regards,
Atish
> Thierry
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
