Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051E5C4167D
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Nov 2023 18:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QtNbky5ICUoQwWru3lCpSLWwKJFcg5eGmYmhowvZlYE=; b=aJgCKZvbIh3B8I
	0QPXB9S5aBgg05KxWHRcsK6NYbUfGZxJHPqbEGfxuH4fpB/Srla+9g4+BeU09vLo/aO2DBDLveK4T
	Zqc9xjdzMHhm12x5MO59bd62Np+1nLaB8qc3TI+XPKmeRPZ8r0MmgUIncj4SJqJUHZ8Y9xF7QQjGn
	OK/Ih/3UOJbtS1XOXfzwiH1XqK6FPAYrZ7TZvyVS4bfRnjFUSqJ3Rkm0pcELTJvIGnE0cpyPsqZmd
	D6gAC898B1OmYjwAovb/wQsfmFcqrn5c4t9dltuHiFYFA20WsfM5wpTBGtWXbmaimMvlsbz4I5epM
	gpFfWZEw8AXux4vXOCpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0nON-004VC3-2f;
	Wed, 08 Nov 2023 18:35:07 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0nOK-004VAl-2X
	for linux-riscv@lists.infradead.org;
	Wed, 08 Nov 2023 18:35:06 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40790b0a224so53676245e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 Nov 2023 10:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699468502; x=1700073302; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n9ZiV2Esj98CTfgH59OBDcgahkXqDMdEC5lhTkmlSa0=;
        b=W9OJD2GFPpJXak7X05JqU6ulTJvgg30uECqiq2u3vT7bHBJi3ASGI55Pf9F/E4ad3N
         gSkfkR5AbWOk9UtDDJVh8iAOQAlo1Mr8OqOKG69DIsN68t6C2XJFPXfxs5cMAfmUmEnY
         3eLiLMxpbHaj8Oomfp2LRHPdDAeQqNM7GZcyqARdLlngj3bUCAm9J+TVswLVj72XjTEN
         CuwDLQNNgDRY0OjHZPS7jr95E06DE/SLZGdkM8bwrXwwR9gw/3W9Iv5Yn7GFsxCn44aL
         WvT+YG20egSrPRTUnuaELLJMfsPz3Rc7qvsGH+nn0b+igBx/USsGCcKLFZg915ZQA/Q5
         m8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699468502; x=1700073302;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n9ZiV2Esj98CTfgH59OBDcgahkXqDMdEC5lhTkmlSa0=;
        b=t9+p3RiajIdENyC9GvnX67GZyf1cYiU45L/+lOidtsRgVpoVrEbJ/HJk6BzQh943GD
         KhmJVqJFkf/s0/Jt1WeEZxMXd2MIEXc7OtmiZ3dILGGJQ+knQw0hUGKzneZZb7MJCXal
         zeODA2Q0iFR173Rx4yvMP3P+fPYwMpy1ROIJvL0KTKuCSAqF7QHV2AXs/QphkFmr/kCD
         b4j4l+O3mM952QM/rfTP98OBzP7cpiry1mv6kHshNUgaANZM2OZvtofJ5tgfGS3Fa57i
         p6uJrHnHJ8BtAcM2DBGBF+MzJwPYNN65c8E6zTugqNJ2Jc4YBjrHAjqXp5L+YLjSOXg3
         XfEg==
X-Gm-Message-State: AOJu0YyBIwtlMRsco06XHVgT3e+vdYj0Erv3ExbeBDZu49KeaqNzLcvb
	xwwDdq8r15d27SdTg+3yx9burQ==
X-Google-Smtp-Source: AGHT+IEerzRoblFu8LqWqAyQVzl32Dow78v7sZDoe2sPpmQgBWRRfSrEcftCpyNmsXV1yimnvtHQ6A==
X-Received: by 2002:a05:600c:190e:b0:405:1c19:b747 with SMTP id j14-20020a05600c190e00b004051c19b747mr2262734wmq.15.1699468501866;
        Wed, 08 Nov 2023 10:35:01 -0800 (PST)
Received: from salami.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id g4-20020a05600c310400b004068e09a70bsm20156528wmo.31.2023.11.08.10.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 10:35:00 -0800 (PST)
Message-ID: <d6664edcccd81edc5caa54e8da43b5c571a3ea76.camel@linaro.org>
Subject: Re: [PATCH RFC 00/17] Solve iommu probe races around iommu_fwspec
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Zhenhua Huang <quic_zhenhuah@quicinc.com>, 
 acpica-devel@lists.linuxfoundation.org, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>,  Albert Ou <aou@eecs.berkeley.edu>,
 asahi@lists.linux.dev, Lu Baolu <baolu.lu@linux.intel.com>,  Catalin
 Marinas <catalin.marinas@arm.com>, Dexuan Cui <decui@microsoft.com>,
 devicetree@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Frank
 Rowand <frowand.list@gmail.com>, Hanjun Guo <guohanjun@huawei.com>, Haiyang
 Zhang <haiyangz@microsoft.com>, Christoph Hellwig <hch@lst.de>,
 iommu@lists.linux.dev, Jean-Philippe Brucker <jean-philippe@linaro.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>, "K.
 Y. Srinivasan" <kys@microsoft.com>,  Len Brown <lenb@kernel.org>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org, 
 linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Hector Martin <marcan@marcan.st>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Robert Moore
 <robert.moore@intel.com>, Rob Herring <robh+dt@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Suravee
 Suthikulpanit <suravee.suthikulpanit@amd.com>, Sven Peter
 <sven@svenpeter.dev>, Thierry Reding <thierry.reding@gmail.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>,  Krishna Reddy
 <vdumpa@nvidia.com>, Vineet Gupta <vgupta@kernel.org>, 
 virtualization@lists.linux-foundation.org, Wei Liu <wei.liu@kernel.org>,
 Will Deacon <will@kernel.org>
Date: Wed, 08 Nov 2023 18:34:58 +0000
In-Reply-To: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
User-Agent: Evolution 3.50.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_103504_835845_6FD12A01 
X-CRM114-Status: GOOD (  12.74  )
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

Hi Jason,

On Fri, 2023-11-03 at 13:44 -0300, Jason Gunthorpe wrote:
> This is a more complete solution that the first attempt here:
> https://lore.kernel.org/r/1698825902-10685-1-git-send-email-quic_zhenhuah@quicinc.com
> 
> I haven't been able to test this on any HW that touches these paths, so if
> some people with HW can help get it in shape it can become non-RFC.

Thank you for this series.

Please note that we're also observing this issue on 6.1.
I think this series is a good candidate for a back port (slightly complicated by
the fact that various refactors have happened since).

For me, it's working fine so far on master, and I've also done my own back port
to 6.1 and am currently testing both. An official back port once finalised
could be useful, though :-)


Cheers,
Andre'


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
