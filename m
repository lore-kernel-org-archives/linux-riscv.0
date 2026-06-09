Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099D2CD98C5
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 16:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vGFhhC4CFBGpMjciERdDH+LPCsUjVD3VsHnLORnqmq4=; b=LE7zxjWpe9HM4c
	AV6FnS40LBLn7ZlCQu7cWZBewGDUqNYe/tqw7LYd1Qjs0e0HwlsMuj1suFFhVLb+i5mg0CHCggg5d
	lwrvoUXx03gAAvN9RJmVgt61U65mr7x6e5S+teyqAFzSWAaZb2J7glNPXHStvzM3eOOicjY4LjCBJ
	VHwvRFfMepJJ5/QgmzVLqqaIe4hGRmXnxHe6gsBcPZeIPk+kU1E3bmZnBoC4P1Lv6ewEypsAeMz/t
	KFkta1GwRkaDkUlsPyhqH0uBoGegs9Ij5tFDec18IbtbTOVy644ERuqUI4Mw6sXzrMsFaiyjaELS5
	89IbS+lzbu9axmcXq+PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWz3C-000000060P5-0f1I;
	Tue, 09 Jun 2026 16:11:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWz39-000000060OQ-4BHn
	for linux-riscv@bombadil.infradead.org;
	Tue, 09 Jun 2026 16:11:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6Uz2/S8q1bGzYbvjOi+dd2PPF/EKmkqQlSRIaTmPAZs=; b=S6NhHWbYb+r9YYNNwkGOm0CSKw
	o3tH8GyUc+SchE1yA8IjpjfmQvDs0cP6b44cmVCrbTGjrqJ/dMBJptuBrVZ7wmmOOATaXGaax/cxr
	9ZWKIwlOTO2fqC4NW+k5uLLi3XacVe0Ow652OaKvVu4cFqV66Cr/cAEgtLL4HkfCiKvkKONERLYU/
	ppkzucjIOu03Vh2IxtWhz02lDqtdxdgbfNJx0WOSCnvPYnWrWx4ifT9LgZJUowRCHgDInB/X78OmP
	oGY5uBgegQbfLSNm5IgldPl/FANWisiDyshQqxSEXe3v5uMqufxDRoF3fR6L2qn3BNmBOTXrtXwgV
	f7EA5cFw==;
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWz36-00000002mhD-2lpf
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 16:11:34 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-48611addcfbso2350774b6e.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 09:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1781021490; x=1781626290; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Uz2/S8q1bGzYbvjOi+dd2PPF/EKmkqQlSRIaTmPAZs=;
        b=a4hxhfutlOsXKA4zNAz/pRU8DZaBeeOOMVLmBlEEnbROOKVY84LMwswNEd1nQxGZp8
         wsME+TGsWmUvZp2ctRISYgcCNLNz+v5qofX9kTNcT833tWxQXUfrQ/5GVS6XVg93u5O0
         IzBUcqINqPYry/H62YrlNShV9RfSkNVoNS/YgbaZBA/8CIlNdyVf+0/XaQyRVhMsvP8t
         p0UNGqEoja+iXFBCXXauPPk2cq+sMGZP8YfYGzH3xwzD58bkAtRK2i8Id2gpiJ9byRaF
         i3GAtE1R5DwmkPfuMP1I+QXMwrfOUGz+CD92yKwMg8l1hz5AGUuIPEmGvy8/TftVCyLC
         Nc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781021490; x=1781626290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Uz2/S8q1bGzYbvjOi+dd2PPF/EKmkqQlSRIaTmPAZs=;
        b=OjBECJzvrec7XfkqStUVHeq4pWEcdyj+gDCMnbjJecRGUCVVgdVaZd8nSQVymagiK4
         faVHCAcgaz2X03qm8AK+rMjFPptyxrAu6pha4vhapv1GC4Lm6yKO+zCgn7BN+XSiwt9z
         CjbQRcu5L58zNvl/7hK30GdtoypgPvFh4zrrpY/fUuFkbNFAGk0N4ALMJnn8WmO/3yRs
         TJC+fUlHHDzDnngRboi1D/n513oZQXlq9PZmxZvLzWYui15LUFcvmdmEYtOVFRtEqvmx
         ApC1CEM2m80FfXl+EBdthcF7vrBgLqYBCXrpL6gl0ESjPb5na7iVwzNymNWQveO52TOG
         5ciw==
X-Forwarded-Encrypted: i=1; AFNElJ9EAFHPfOTc31fL8v5CJBbv1Nt1tsWzctn+kBKSMWCA8zbGieEqFI+dvOwVrjNwKxperxWxtQCgNJFJhg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk5xoxWR9etzrD1AegQ0VTPJNkgeHJlkj/DbVqxIvTURhR776n
	lpXvin74xehaw1SQG0GOAwW/lMFkxXLme4StKor9q8lnPxBGMBhZAQ09Yb/ZRoVtK7w=
X-Gm-Gg: Acq92OGnCY4kKoDFvF9Y2VJNubrN4OweZI/dlGJ+7B6b/tkApSr4QIV1WMy9ozsMUKu
	GCl9i2nbfWtcozaX4JaIW2OKoeSiO+dmRPvDGdB9F2D2G0wpdeotdR3lxCcTqedMlTRTQnAxdHb
	D65G9AKf6GzBDg/f1QOPr7EHb7WzCQziHsiphhyPHI/frSeXb4ITFUOfo5SeueMKsl07nzT2CJR
	xHgbvlFLzikMxZ220JXvQcVE2UVLMJe62tacAI8UtmK0VmFAlkyzGC85EtNRXjHouOdkYYgzlNj
	VC+/Pz1fJNJTFWbf7q4HFJfpjRey6GVLal7xVuaqvpagXi+Oc93tmXDAWclIYopImDJz0D9thdu
	Dz3M8ogbcogDehRhRCjbeyuUdtYRm3Typr1ovSJDWHLA2qTy8Mj0+w7/fzJ1oePlyPoqqhq2I4V
	h5k2ENL86B75mUW91AOJDstN8ownaUQOGfh/slJnjfY6zu
X-Received: by 2002:a05:6808:1301:b0:47b:d07b:ecac with SMTP id 5614622812f47-4868db2e306mr15084950b6e.10.1781021490024;
        Tue, 09 Jun 2026 09:11:30 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b91f944sm16430240b6e.9.2026.06.09.09.11.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 09:11:29 -0700 (PDT)
Message-ID: <b025f81e-e3a5-4b55-a6b4-cbd9731fe0df@riscstar.com>
Date: Tue, 9 Jun 2026 11:11:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
To: Manivannan Sadhasivam <mani@kernel.org>,
 Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
 Nam Cao <namcao@linutronix.de>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Randolph Lin <randolph@andestech.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vidya Sagar <vidyas@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20260517014841.254085-1-inochiama@gmail.com>
 <20260517014841.254085-6-inochiama@gmail.com>
 <wztjdv4t5cn7djj3jyvheest7rn5nr2g3efzwods2fz3yy5wn2@hbl644sd6fst>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <wztjdv4t5cn7djj3jyvheest7rn5nr2g3efzwods2fz3yy5wn2@hbl644sd6fst>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_171133_029401_96028416 
X-CRM114-Status: GOOD (  18.81  )
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

On 6/9/26 9:18 AM, Manivannan Sadhasivam wrote:
> On Sun, May 17, 2026 at 09:48:40AM +0800, Inochi Amaoto wrote:
>> The PCIe controller on Spacemit K3 is almost a standard Synopsys
>> DesignWare PCIe IP with extra link and reset control. Unlike
>> the PCIe controller on K1, this controller supports external MSI
>> interrupt controller and can use multiple PHYs at the same time.
>>
>> Add driver to support PCIe controller on Spacemit K3 PCIe.
>>
>> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
>> ---
>>   drivers/pci/controller/dwc/Kconfig            |   4 +-
>>   drivers/pci/controller/dwc/pcie-spacemit-k1.c | 169 ++++++++++++++++++
>>   2 files changed, 171 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
>> index f2fde13107f2..fae971ecd876 100644
>> --- a/drivers/pci/controller/dwc/Kconfig
>> +++ b/drivers/pci/controller/dwc/Kconfig
>> @@ -439,7 +439,7 @@ config PCIE_SOPHGO_DW
>>   	  Sophgo SoCs.
>>   
>>   config PCIE_SPACEMIT_K1
>> -	tristate "SpacemiT K1 PCIe controller (host mode)"
>> +	tristate "SpacemiT K1/K3 PCIe controller (host mode)"
> 
> Can you just say 'SpacemiT PCIe controller (host mode)"? I believe I asked Alex
> while adding K1 support and he said this driver might not support future IP
> revisions, but here we are.

(Sorry if I said that in error.)  Will this be K1 and K3 only?
If so what you say is fine, but I agree with Mani, if it's going
to also form the basis of K5 (or whatever) just make it "SpacemiT".
And probably change the Kconfig symbol to PCIE_SPACEMIT.

					-Alex

>>   	depends on ARCH_SPACEMIT || COMPILE_TEST
>>   	depends on HAS_IOMEM
>>   	select PCIE_DW_HOST
>> @@ -447,7 +447,7 @@ config PCIE_SPACEMIT_K1
>>   	default ARCH_SPACEMIT
>>   	help
>>   	  Enables support for the DesignWare based PCIe controller in
>> -	  the SpacemiT K1 SoC operating in host mode.  Three controllers
>> +	  the SpacemiT K1/K3 SoC operating in host mode. Three controllers
>>   	  are available on the K1 SoC; the first of these shares a PHY
>>   	  with a USB 3.0 host controller (one or the other can be used).
>>   . . .

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
