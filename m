Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07F2D15DAC
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 15:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mrxyTx6Mz0DdvA975bAVKbxCtpLMTQJBAe5BKLHPFdA=; b=ZyH9LsbXkR5Dxz
	jlsdATA0jbYf6Qovc+K92A7vuEK+Bsq2JYyOgQLeRyD28JZ0cPWaU1ewOtNhyY4rY7j5OfIjA8UCG
	6/hwcOVdkRYJvTr5zek/06jJOGOu5oawURtHe2ovbIMC0k+10dNaPMUXtyxU6uPfKyRzY6+bi4+Se
	X+SiTdRvUUY7qugmeEnlGLHIBSQvQGePflrFF0uyauiiEihPx7+9OdCdU2lzLsfeIe9/klo30TZRD
	UIGMRFPzCIKUPKug3LIkGrv+qp2xwvLVOTjgyU0ZmxYpGoGShdaVtdYuES3qZhFAcsM8k40PEtnKG
	9AbW+2oRD1CI3kmYfVQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2u86-00000007keZ-15TJ;
	Mon, 21 Oct 2024 15:15:34 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2shp-00000007TEy-2vKs
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 13:44:23 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20c7ee8fe6bso42231955ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 21 Oct 2024 06:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1729518260; x=1730123060; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rEnajADAbGhm3M1pNyKurdElPnt+aWsHL33PQ0Q7Gvs=;
        b=qX4/L0RNDzuNjgI1TUmbUMfTQrgo2i4FQI1Adsnz8btVRVXsEv6F9ZhwVWKmqXZwpc
         DOJN0r45Ds01C90Y50PTPAJuIzFEHf0bQVj4vXoZXn6zGxWBCtjPe64sW+4x36k9m/aj
         bIH/BDLIqGuOG8hyL/jnfu+ooNFuORbskyIzGDbjycop5uxb1Wac6PJzxi5NMrLeAbHn
         Jrkyz3MpSdXuk9nntoqY2VDoMdTX/5SzPDQgtjQRNNG5dTqaGVs4/V9km+8iN/Bdcdwz
         SXSy7uGMR6p7aMjVOzcrvApFKxgtsKWEd8weAgmUmdhMRpMNiYXBtOp6QQ0S0zWKcZoR
         XFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729518260; x=1730123060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rEnajADAbGhm3M1pNyKurdElPnt+aWsHL33PQ0Q7Gvs=;
        b=uZy6TguybWcMhm9noldAhm6TVLXrybgRdzRvs21XdW8FcK4CD+yhzObPKOZF2exwo1
         IY0VG4SqrwSjZGIOn1bTVjRyeZa8GAuamYY/DpWmXYTaEVOWDy8sZ33S3dwuihxjcrt8
         6nxaVfBV/4jPM5M5NscWDloHqyRtDUlGgBWoHvsxZ9CSUx/puJxQ5t1pk7X6y6z0Ph6p
         yjbzs5QgP4EJzLTYkjzFw4qEkpSx03xI+w2bP9+hbq4Iz6WcQ/R4QNCbk3k5akHiuCvJ
         w/rtAm7WFv8LoCbnsZxX6Et6U0mgf6UkH7kVNCMyLf7Ep3OqcoFab/RZnDbmbras7tDx
         jlVw==
X-Forwarded-Encrypted: i=1; AJvYcCXMCp0rTNk/VJxVEsrG3ZhLwR7d4HqOF7IMoKVoDkLACDbQkNFouZ/ianS/PDQeKAd7x2UEG3YN89PYKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxcVFE8vYPmwrS+VF7KVtiUuG3+ECApl4IgIcwIQVhE2MH1RfQC
	KXbSWBfw+yO586yLe9sIjSBm33gRUhsmCwo6LD1i7/Lxz73COXzNFImpL/zVUKQ=
X-Google-Smtp-Source: AGHT+IHN/ehUoWz4nWNTcpRpWVKsXcIc7vWF74OZtujCoQlKZC39nGhEfqrrlaKVy+NS5GzpK/RF+Q==
X-Received: by 2002:a17:903:1d1:b0:20c:e262:2580 with SMTP id d9443c01a7336-20e5a8fb25amr172757925ad.44.1729518260070;
        Mon, 21 Oct 2024 06:44:20 -0700 (PDT)
Received: from [10.211.55.3] ([4.28.11.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7ef1a953sm26029185ad.112.2024.10.21.06.44.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 06:44:19 -0700 (PDT)
Message-ID: <2b449955-6596-4c9a-9799-f15d186e260f@riscstar.com>
Date: Mon, 21 Oct 2024 08:44:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] riscv: dts: starfive: add DeepComputing FML13V01
 board device tree
To: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: Guodong Xu <guodong@riscstar.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>, rafal@milecki.pl,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Drew Fustini <drew@beagleboard.org>, Alexandru Stan <ams@frame.work>,
 Daniel Schaefer <dhs@frame.work>, Sandie Cao <sandie.cao@deepcomputing.io>,
 Yuning Liang <yuning.liang@deepcomputing.io>,
 Huiming Qiu <huiming.qiu@deepcomputing.io>, linux@frame.work,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241020134959.519462-1-guodong@riscstar.com>
 <20241020134959.519462-4-guodong@riscstar.com>
 <ae5gels34ozgzrcrwz53wj22hoy5cq3crn3dmkhitxlffmnavt@6lbmrcpjmqyd>
 <20241021-unroll-empower-3ab903615d6d@spud>
 <c048d270-7a07-4807-b816-0f4e0aeb67f7@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <c048d270-7a07-4807-b816-0f4e0aeb67f7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_064421_976578_E713B447 
X-CRM114-Status: GOOD (  18.64  )
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

On 10/21/24 7:47 AM, Krzysztof Kozlowski wrote:
> On 21/10/2024 13:16, Conor Dooley wrote:
>> On Mon, Oct 21, 2024 at 09:17:59AM +0200, Krzysztof Kozlowski wrote:
>>> On Sun, Oct 20, 2024 at 09:49:59PM +0800, Guodong Xu wrote:
>>>> From: Sandie Cao <sandie.cao@deepcomputing.io>
>>>> +&camss {
>>>> +	status = "disabled";
>>>> +};
>>>> +
>>>> +&csi2rx {
>>>> +	status = "disabled";
>>>> +};
>>
>> You can drop these two, I marked them disabled in the common file
>> earlier this week.
>> 1
>>>> +
>>>> +&gmac0 {
>>>> +	status = "disabled";
>>>> +};
>>>> +
>>>> +&i2c0 {
>>>> +	status = "disabled";
>>>> +};
>>>> +
>>>> +&pwm {
>>>> +	status = "disabled";
>>>> +};
>>>> +
>>>> +&pwmdac {
>>>> +	status = "disabled";
>>>> +};
>>>> +
>>>> +&spi0 {
>>>> +	status = "disabled";
>>>
>>> If your board has to disable all these, then they should not have been
>>> enabled in DTSI in the first place. Only blocks present and working in
>>> the SoC (without amny external needs) should be enabled.
>>>
>>> I suggest to fix that aspect first.
>>
>> Eh, I don't think I agree. Having 5 disables here is a lesser evil than
>> reproducing 90% of jh7110-common.dtsi or shunting a bunch of stuff
>> around. Emil?
> 
> Why reproducing 90%? Only enable would be here, no? Or you want to say
> the common DTSI has things which do not exist?

For what it's worth, I agree with Krzysztof.  In the (long) cover
page we pointed this out, and offered to do it in a followup patch.
But if requested we can do it now.

So in v6, a new patch would be inserted before the other three,
and it would:
- Remove the status = "okay" lines for those nodes that are not enabled
   in this new platform, in "jh7110-common.dtsi"
- Add nodes where appropriate in:
     jh7110-milkv-mars.dts
     jh7110-pine64-star64.dts
     jh7110-starfive-visionfive-2.dtsi
   They'll look like this, to enable the ones disabled above, e.g.:
     &gmac0 {
         status = "okay";
     };

     &i2c0 {
         status = "okay";
     };

You guys should come to agreement, but I do think what Krzysztof says
is the right approach.  And unless convinced otherwise, this will be
what shows up in the next version of this series.

					-Alex

> Best regards,
> Krzysztof
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
