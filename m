Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D253BC32771
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 14:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQSQDdWWqcGPz6U+bV1HJ0OFmshD+ox8hlsuvp5c4Sg=; b=gAlm7lGXkcQYcS
	G/gsXv4zlMWSRD6GWL5/RNvmT2iD9k6FnZSD7cZIOm9l5Dcsyy9etaJle8YrNBiwS91Ctp6z2SCLK
	dMvU5uM7gL8OOmX1zKMu+9ttrv+hEh9MkdA3db4CZAkVMx/ia4kFS6n5AW7iaMGdOwHjiI0X4W5SG
	IJMoShzvaM3zcfs85d2craYE+Zt/ptfieEomNM9pCrZYac2PytNEhvO3IbTpmt33hopHH51UIBXXe
	7NeKCk/i3naiarY4rjI7eFPS+q0U6nez8kAhfp1YBk4U1YYtqRxFfWMhDJQZqOebaktROmmn0PwPZ
	ghYo5pAfhuOQsxrh0ODQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP2eR-009MoK-4X; Fri, 19 Aug 2022 14:07:07 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP2eO-009Mlv-HR
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 14:07:05 +0000
Received: by mail-lf1-x129.google.com with SMTP id u9so6238616lfg.11
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 07:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Y5wU/lr2kCgDK8lG9CyJ4ihOIqFedal4gpsPlmBBmbM=;
        b=jJWQ0N3ShCM/zS3ZJLsVi+3/exXqeKldfgzmzwJVszO1Ww1nmBEuDkohzSoOFvkiJA
         A12o925w0niqN9C1jXAwBk0UncazuFBREDefU+xo1b1sk8mqVdJ4pNEu8Ds+jwhQoaLn
         VJD+oe/FnqfDaZCMYZ9+3yEY2+IxOZowPAWEIpwJfa3z94ftyfBYxxD4tH9KeAsA/crg
         yLNZ5oHGuWkL5nvShBrZx/kUgl9SABz9u4SBnKHr3x+qStWGNTxwei/YUYmnSRAVqCPE
         YIoLgMTXyctDipZUlXIODar0xVbaSKEY4xc4ZtE1VwNcEHm+kqe3pCINQYOfdeeMskzN
         4HuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Y5wU/lr2kCgDK8lG9CyJ4ihOIqFedal4gpsPlmBBmbM=;
        b=z+adw78TpzE7wPfpeC5SdZ/UhwDXeBAdNFljUlaCHVSBDRvvTXesv265IHF9ria1RE
         KRSfbW+nly1eYPewpHoWGjfpjh7y69jbFEzFbclQI24WRk/BuapwSPBDRGiVkV0uMvTV
         l+KV7IuC+Fezg71kP1DsQ2xu82H8tV/6hK4swBKOuMX0lWDlIURFKeB8mpOl6YacMQ/U
         5CRKscyaOjcoVN2HIj+iCnCTfQ+28aCEl2Sfhn+I54/ymwU4QEKCdTwsPt1HzRGPK3KY
         wyBFerloP1Wlz4EgHQPXx3TCjydIE6JBVo1g3MSGSXDyGFs2ksJMplrMsVaO6C4QWlp2
         HqsA==
X-Gm-Message-State: ACgBeo1reMuIvPSANV1+FBfMhi+3YmqmqE2kPY1Lkb3HjLsjLHHnM7Ey
	T6jze3Lycn92fVpGrenMyKablg==
X-Google-Smtp-Source: AA6agR56dTKRHSCi5p6LBTjQt57Avyf6is6sSgD+Osdvq9IpZ+Cwxi3NLqgKbOctE3X9RuCkqTobAw==
X-Received: by 2002:ac2:4f15:0:b0:48b:a030:969c with SMTP id k21-20020ac24f15000000b0048ba030969cmr2341253lfr.609.1660918020239;
        Fri, 19 Aug 2022 07:07:00 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5? (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id m17-20020a056512359100b00492cd4bd383sm172795lfr.223.2022.08.19.07.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 07:06:59 -0700 (PDT)
Message-ID: <138af26e-8e36-63a0-d3a0-5af866318839@linaro.org>
Date: Fri, 19 Aug 2022 17:06:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 6/6] riscv: dts: microchip: add the mpfs' fabric clock
 control
Content-Language: en-US
To: Conor.Dooley@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 Daire.McNamara@microchip.com
Cc: paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20220819122259.183600-1-conor.dooley@microchip.com>
 <20220819122259.183600-7-conor.dooley@microchip.com>
 <3df8d4bd-3d38-cecd-6589-ccc1be01b886@linaro.org>
 <3ffba600-bda9-8ffa-a435-9a6f94e072b8@microchip.com>
 <f3d8be5c-737b-8c71-9926-a4036c797769@linaro.org>
 <19ca2ca1-c678-c669-4214-e92416e37191@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <19ca2ca1-c678-c669-4214-e92416e37191@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_070704_635678_79BAF601 
X-CRM114-Status: GOOD (  16.76  )
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

On 19/08/2022 16:48, Conor.Dooley@microchip.com wrote:
> On 19/08/2022 14:28, Krzysztof Kozlowski wrote:
>>> Maybe that is me exploiting the "should", but I was not sure how to
>>> include the location in the devicetree.
>>
>> Neither node names nor clock names are considered an ABI, but some
>> pieces like to rely on them. Now you created such dependency so imagine
>> someone prepares a DTSI/DTS with "clock-controller" names for all four
>> blocks. How you driver would behave?
> 
> -EEXIST, registration fails in the core.
> 
>> The DTS would be perfectly valid but driver would not accept it
>> (conflicting names) or behave incorrect.
>>
>> I think what you need is the clock-output-names property. The core
>> schema dtschema/schemas/clock/clock.yaml recommends unified
>> interpretation of it - list of names for all the clocks - but accepts
>> other uses, e.g. as a prefix.
> 
> So could I do `clock-output-names = "ccc_nw";`. That would work for me,
> with one question:
> How would I enforce the unique-ness of this property, since it would be
> a per CCC/clock-controller property? Maybe I missed something, but I
> gave it a shot with two different CCC nodes having "ccc_nw" & dtbs_check
> did not complain. Up to me to explain the restriction in the dt-bindings
> description?

Uniqueness among entire DTS? I don't think you can, except of course
mentioning it in description. Your driver should handle such DTS -
minimally by gracefully failing but better behaving in some default way.

> 
> FWIW I would then have:
> ccc_sw: clock-controller@38400000 {
> 	compatible = "microchip,mpfs-ccc";
> 	reg = <0x0 0x38400000 0x0 0x1000>, <0x0 0x38800000 0x0 0x1000>,
> 	      <0x0 0x39400000 0x0 0x1000>, <0x0 0x39800000 0x0 0x1000>;
> 	#clock-cells = <1>;
> 	clock-output-names = "ccc_sw";
> 	status = "disabled";
> };
> 
> & in the binding:
>    clock-output-names:
>      pattern: ^ccc_[ns][ew]$

Yes, although this won't enforce uniqueness.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
