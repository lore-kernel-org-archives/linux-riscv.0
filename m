Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3274CA0EE4
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 21:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ybPTt20WTFcSxTFnrlLyWbD6nZo3WUcTMyUlcqXmXyY=; b=joXIm3qCpPF++V
	atlxoDi2YQsL41HfPx/gr0zy7Dj3je/pUHDxgawMcmxXyxKZKj2q42CjwcwZAKJW7OzUtZ5CDrTXX
	fe8lfFh18OQW1ZQZs5T4GdEkzoMv4+CjzdisRQYhHyUIHrJZhmh7j1lQDfK9lzhcyadfrOTB4NQUJ
	uRBBIzR+m+SZ8tPVi9Rek3wPwse2i0fQ06IgvNhawZ+Vdaw2dzdFZFDN04KEdWwI1MICNChKOVY86
	8Uc+vG2JenNI6KWsY6sNTECiiBfcIFyP9DMakTfHvdKHPPbQHBIKKTjolYH87KNZPD05yn4+RRJ7Z
	PB2UbN+7aJIZijQA9zhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umIx0-0000000F0rY-2665;
	Wed, 13 Aug 2025 21:24:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umIuh-0000000F0a8-2m06
	for linux-riscv@bombadil.infradead.org;
	Wed, 13 Aug 2025 21:21:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xQFA3sAGjQq+4OU7ujcZ9yGUOwCjhbmi0pcUP6tFJ2k=; b=V4C4tBnNAV9sytYzWPoewjkJjp
	vSURmQoJfzeoakEK5xPx2ERCB99ZA+k+DTltNmi7OX9p625a81TBOBsouM9MWk4enoUE+gow8UMwl
	LPA9dwfLLXl8AvSgpQvM4xGGkiw9d0ucaqN1VjDIjSHHR4UwnRfFjC0TQoxuqvOXlgkcHGjtJq/U/
	glF29Mc7UJsLQiqkc6nZ7f68o9UCipZxuOXvQdgiBukzQjDu5WSTytN9kctrDdEGMNqflB2d3EP3/
	hb9InbocbH0HcW7AOw5NQyW9MJbXHUYILMvI4Y1/M9MehtB3QjDuJWp/vsYsb2kCm8gJ7BQlFfqSo
	v0+kSqCQ==;
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umIua-0000000GCjF-1HJA
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 21:21:37 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3e5700448fbso2588495ab.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Aug 2025 14:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755120089; x=1755724889; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xQFA3sAGjQq+4OU7ujcZ9yGUOwCjhbmi0pcUP6tFJ2k=;
        b=YxnWHUOD3fHf5YjyG5gNvqVMS94uk5ZZI8iClrJbBNkETlj6dnRNadFVMnQO9bExXX
         OLeTXjIEejBymLGd12e39e46oBNDnIrEwJLz+b2GiSgGCoqlccmR51IhWJ7qV8tMQR/6
         sj8TEzDlSzRUdHfQurclSaY6tB4gRPAZUXQqYp56PQX6vfChaWgW5p8jXofRfA7oeuM7
         ahJyMopv1ZvqCv5+uXT6LFBSxPP4QD6EvcvLIomVmGbri5UA0BqnbHUQZyfMiPRI7d0H
         xH1dT77z5+CXfRHw7iPEI7twW/YPc0oALhJaYuwNyadM3R9ICz30M0wPampkWR8tobiK
         egug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755120089; x=1755724889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xQFA3sAGjQq+4OU7ujcZ9yGUOwCjhbmi0pcUP6tFJ2k=;
        b=djIVEB1nuOZJa57v9wC+6yKWvd3XizahD0/h1ULg05y0QCy6lsUXOC3kcX1ZvppsUB
         lPcFTdsAvtiIMFbo/rIfgOnQfIm2v9WBl0mNCVQhHk3WCSNO9SKGefHiANLi7XXs929B
         2s+GVnmZWeIsIYyjg3auXMSHTvueCDLl287u5+VzWf2ezCFYm8CohzMoHQNi0lfLnllG
         IJHeWDArp4vQUf5ZQTFQn9/xBFHr4eRr68qz8FK+noIHcouV9KvWg4Tv/BWVVU9zxiYg
         CaIFCuCSrLoLz8C6zPdlPSD45QAv3KTnMvnZL/gXwC1hkQ4imnN8MSoDd2FLWBaN5aIi
         BPGA==
X-Forwarded-Encrypted: i=1; AJvYcCUj7epufoMTMrDlBG+zhi0MymN6SX/RA/t3adPnr4az4MyPzCkt9nSdn3WUH1V1jF3Qv4sjv4+THFG61A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMJsfNcLYoLY7CY/St4QZvzQz0vb3YTmvUb4BqP3tjWcbubGjr
	/8vMKG5Z7SQymPk37SFser9s7pS9RNWyRgS8hBWbIcz3EaHcV8JOE291iyxyzOL5LGk=
X-Gm-Gg: ASbGncv6sGKNXTQ1AY+Ira2LSKBZac7EJqGEfSsIbgyZudPtHj4/ezNqpQIudFOM4mq
	e3oNDHu9Nf1PTZNU/4yg7vYHxvYrw4tjVYANsSD8bj4fLIzADFcvpdDxGZzKb5Qe0JxI2jRsS8r
	M9a0CZn6FN6uOv0kQ/sOhug2aVIe0Xblrez6jK+KQHiRL5lW6NAtaoHyS4ydlRbTnQDsDLtdaOT
	T6fgeK2f59CQxlRCmXGLJTvc00RK1i/GAJCqGjJDuixtI2hT8luCnDJxjYShRfuuYR9kga7hphV
	hoeJotmb5vUUk/hagj0/4W8QjkG0BMbPSUW0N3LoTf273a//YS74mUF8b/b58slHIoiekFvL50v
	v8astfTPGezJ0ia9uD+6simOvNqRRPpWFv68OezKlAl93un6MesJZRI2igWgicg5btFmNxB12
X-Google-Smtp-Source: AGHT+IE/IGDUbFdQagnAGSx2I8HtgwdLHjigGbzbwJHyQIwj+Wi68+UGSe/1cR20+rAO3AtGn9HtGg==
X-Received: by 2002:a05:6e02:1c0e:b0:3e5:4351:ad0a with SMTP id e9e14a558f8ab-3e57078c28amr12232635ab.7.1755120085109;
        Wed, 13 Aug 2025 14:21:25 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e5418db19csm46937395ab.2.2025.08.13.14.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 14:21:24 -0700 (PDT)
Message-ID: <8ebc466c-1b9f-4ba3-a38e-bda6007c5b97@riscstar.com>
Date: Wed, 13 Aug 2025 16:21:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: phy: spacemit: introduce PCIe root
 complex
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: lpieralisi@kernel.org, quic_schintav@quicinc.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
 p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, inochiama@gmail.com,
 fan.ni@samsung.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 palmer@dabbelt.com, paul.walmsley@sifive.com, spacemit@lists.linux.dev,
 thippeswamy.havalige@amd.com, namcao@linutronix.de,
 linux-pci@vger.kernel.org, shradha.t@samsung.com, vkoul@kernel.org,
 dlan@gentoo.org, johan+linaro@kernel.org, kishon@kernel.org,
 mani@kernel.org, mayank.rana@oss.qualcomm.com, tglx@linutronix.de,
 bhelgaas@google.com, linux-phy@lists.infradead.org, kwilczynski@kernel.org,
 linux-riscv@lists.infradead.org
References: <20250813184701.2444372-1-elder@riscstar.com>
 <20250813184701.2444372-4-elder@riscstar.com>
 <175511815210.798605.10564052572461813362.robh@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <175511815210.798605.10564052572461813362.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_222135_653983_5C98E8F5 
X-CRM114-Status: GOOD (  17.32  )
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

On 8/13/25 3:49 PM, Rob Herring (Arm) wrote:
> 
> On Wed, 13 Aug 2025 13:46:57 -0500, Alex Elder wrote:
>> Add the Device Tree binding for the PCIe root complex found on the
>> SpacemiT K1 SoC.  This device is derived from the Synopsys Designware
>> PCIe IP.  It supports up to three PCIe ports operating at PCIe gen 2
>> link speeds (5 GT/sec).  One of the ports uses a combo PHY, which is
>> typically used to support a USB 3 port.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   .../bindings/pci/spacemit,k1-pcie-rc.yaml     | 141 ++++++++++++++++++
>>   1 file changed, 141 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-rc.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:

Mine didn't for some reason, so I must be doing something wrong.

Simple inspection shows my compatible string contains ".yaml"!

I'll fix in a new version.  Sorry I missed this.

					-Alex

> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/pci/spacemit,k1-pcie-rc.example.dtb: /example-0/pcie@ca000000: failed to match any schema with compatible: ['spacemit,k1-pcie-rc']
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250813184701.2444372-4-elder@riscstar.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
