Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7169C36002
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 13:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kaIMJGLHRO9cY7Zte6x4A/go7tynDmHZjUvAQ9SEa28=; b=qFzE9oVyO08T8K
	X5oVE0wgV+9rvivOe2ZWh5OE2Ojjf1CfjAnW0nO10kPFhsThrq9aSt9fQvQzmmjKW+mQ5FBYr3Il7
	Oleu1oICZAH0XpSWmG6A1tX9ED1MzZRbvl00BeAQIdExhzQRwwepidclnoihwmKvFx6L48xb/vsdn
	8sNEc7EAg3EY241wHJpnYvRiUkatfaW266cloFbB1juZ+guJU8m+wHWwZgDIxGzFdJ5sACgd48ktr
	fjR7Y0nD/+WfESwIXXrZ2tBBzxZqxbZxsTMinDKOAUeRJ5ojjYYdTO/XQfbKX2bkquC8TufKvMu8G
	vVOoUVE7QfDkVGE2xaIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twhSn-00000003BlX-1Agi;
	Mon, 24 Mar 2025 13:03:33 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twhIS-000000036EY-0Ypl
	for linux-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 12:52:53 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-85de3e8d0adso42256339f.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Mar 2025 05:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742820770; x=1743425570; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6X0oWdoPDnrM5Ggl2vFdtnlylP4PXBXYERzQLRD3cjM=;
        b=e1URaDaeff65sJjrVhqqXPuziBQcoJUloYDr4jJQMoXhs7WVCNwQC0Qv+QrRFl7shH
         exbGb8sRGZi57Oj69HfoQg6tfKjL3G666yvQzDmewmZiO2j5gDAE2SQSC1XFSnd0+Y0Q
         xL9olMgIPXD8z43Jd4IYbek9GwKvaKmWikMlW6zQYIsABdMDPNyfi5wTrIqtmAhJ9E/W
         H7dO2g/9+dTDtlK1JQ66h/XtBSdmX4+yAQ2vSJMtvoVoqSDxOkhh0Y7at7NEkbvdz81j
         QfDZpnhrXfgzBF7QVI62F1aQtnY6bh5ViFMVgXqpPAQxWHIaioa4+or/VQkmxBNKBrMi
         0fRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742820770; x=1743425570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6X0oWdoPDnrM5Ggl2vFdtnlylP4PXBXYERzQLRD3cjM=;
        b=ZB2g6+DySDPgoBRVx7D2pGKEik80CTtp7wzykqv0tw4f5kCkdyQriyms6J3V45anua
         TrRvc8g8LvAQz922LDJwNEpxKejneoOXw7DYj5GYE4mNfqBVmYxKR10Dk67IJ2I26FxD
         Mf/Wr9p7+YCvZH6t0z2v+SanrGg+uPa+sACwr18bTgKQQmNY2XHOwimIrR9jp32wz+yw
         diaWpc/V6aLVqBE4X8f5js5ovR2iw0Qlpkl6nOv863Vq9+wnr9uFZuLTnuoehqgw/GjF
         RAzqueftAM9KJQauQ5YUAso5rWjW3D/L5TJXnFAaf7zTTBy2u7l7CCqKqWUfQa9E/cPs
         FFdw==
X-Forwarded-Encrypted: i=1; AJvYcCU35ebhGgWUpy3knWka+DEMs5z4tl+qBEz+2+KzEgb4fHC4ye1tW0FtC6qVXGnDZoE3+lAMPqv3dsds8w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrhANyKNtCAWuw8yHrbb2JU+0nOcgBtLe5s+h6qflmHSwVqWpZ
	mMLgSWxOne67r8pnyseWG2RMFQgeUR8ou7pk05FBYMe60ehaNstHuxCdFkHYuyY=
X-Gm-Gg: ASbGncvE6r1BDldFH/+hmZk25OC2rv/eKo8/JtJJ39jpqz1cmYA+K5t+b7/aJiWkJ4s
	dvPtv/YwKrg3xC6PqguKqgyjbIv893EsCPqIy0a2bzk5M147wZurgkGKeFXBt4f1/7SA7M1bS0p
	SIUEb710XBneoj8+9avnB5J886I4iJx7gBOCRiGBXXMSFBZ6KAaM05bKZa21QdORw6o8ky5dRwT
	t25QWQhnL532RsJc33vNsufUFV2dWIWtxDeomlzmULAC3Vr6GC4JIVfoVx5tSqtO6pyWCu2OuzP
	X0Qs56D2/wdNAXEIeT3M2pxv83NljXTrpcOjNzn8FbQ/frP7wwPzuyCkEj+tGONPifpj+ss7U5h
	ja6OI+PHV
X-Google-Smtp-Source: AGHT+IGosqVsP6xD9EOhI7VXXnx9Y+44HitNgUDbYxTirUwdX5Z/bTtbV3lrW2oS8n5r7ikaiZEZ7g==
X-Received: by 2002:a05:6602:488b:b0:85b:505a:7e01 with SMTP id ca18e2360f4ac-85e2ca364aamr1471217539f.5.1742820769907;
        Mon, 24 Mar 2025 05:52:49 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85e2bc273b7sm164604339f.19.2025.03.24.05.52.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 05:52:49 -0700 (PDT)
Message-ID: <b9af5eec-db85-4465-895f-d7781ebe9dd9@riscstar.com>
Date: Mon, 24 Mar 2025 07:52:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 3/7] clk: spacemit: add reset controller support
To: Haylen Chu <heylenay@4d2.org>, p.zabel@pengutronix.de,
 mturquette@baylibre.com, sboyd@kernel.org, dlan@gentoo.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 guodong@riscstar.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-4-elder@riscstar.com> <Z-FOJFHOsU_dLkmS@ketchup>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <Z-FOJFHOsU_dLkmS@ketchup>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_055252_175741_250B428A 
X-CRM114-Status: GOOD (  22.45  )
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

On 3/24/25 7:20 AM, Haylen Chu wrote:
> On Fri, Mar 21, 2025 at 10:18:26AM -0500, Alex Elder wrote:
>> Define ccu_reset_data as a structure that contains the constant
>> register offset and bitmasks used to assert and deassert a reset
>> control on a SpacemiT K1 CCU. Define ccu_reset_controller_data as
>> a structure that contains the address of an array of those structures
>> and a count of the number of elements in the array.
>>
>> Add a pointer to a ccu_reset_controller_data structure to the
>> k1_ccu_data structure.  Reset support is optional for SpacemiT CCUs;
>> the new pointer field will be null for CCUs without any resets.
>>
>> Finally, define a new ccu_reset_controller structure, which (for
>> a CCU with resets) contains a pointer to the constant reset data,
>> the regmap to be used for the controller, and an embedded a reset
>> controller structure.
>>
>> Each reset control is asserted or deasserted by updating bits in
>> a register.  The bits used are defined by an assert mask and a
>> deassert mask.  In some cases, one (non-zero) mask asserts reset
>> and a different (non-zero) mask deasserts it.  Otherwise one mask
>> is nonzero, and the other is zero.  Either way, the bits in
>> both masks are cleared, then either the assert mask or the deassert
>> mask is set in a register to affect the state of a reset control.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/clk/spacemit/ccu-k1.c | 93 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 93 insertions(+)
>>
>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
>> index f7367271396a0..6d879411c6c05 100644
>> --- a/drivers/clk/spacemit/ccu-k1.c
>> +++ b/drivers/clk/spacemit/ccu-k1.c
> 
> ...
> 
>> +static int
>> +k1_rst_update(struct reset_controller_dev *rcdev, unsigned long id, bool assert)
>> +{
>> +	struct ccu_reset_controller *controller = rcdev_to_controller(rcdev);
>> +	struct regmap *regmap = controller->regmap;
>> +	const struct ccu_reset_data *data;
>> +	u32 val;
>> +	int ret;
>> +
>> +	data = &controller->data->data[id];
>> +
>> +	ret = regmap_read(regmap, data->offset, &val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	val &= ~(data->assert_mask | data->deassert_mask);
>> +	val |= assert ? data->assert_mask : data->deassert_mask;
>> +
>> +	return regmap_write(regmap, data->offset, val);
>> +}
> 
> I don't think it's safe to write the regmap based on a value read
> earlier without the regmap's inner lock held: it's totally fine for the
> clock part to issue an update of the register at the same time. Without
> knowledge on it, reset code may rollback the clock bits written by clock
> code earlier to the original value. That's why I keep using ccu_update()
> everywhere and dropped ccu_write().

That's a great point, thank you.  I'll modify it to use
regmap_update_bits(), which is better anyway.

					-Alex

> 
> Thanks,
> Haylen Chu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
