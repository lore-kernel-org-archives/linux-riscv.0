Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E713D78770
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 15:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hnq73XJmevfmDga31+j5KlxwGrWIXARiUpqPZ5CebjQ=; b=hnda8BltOdPwYS
	4u2YLGkZnDbo+ewAgLJQmqVq0Ve5W2NKpiSNvsA+sQjVNAU2hf/StBdJUGreGYeUNovZ86Fbv5OLE
	TQGzRbFBWmg+/4h2DIwI1pQUh4D6/mIxjw+C0asNiIWGTP9DVW2tZOB/45FTh67g2zknX9499dRA+
	i9aJh/tcsPfqHejAtb1FQTENTjrQoBlAVGXYYOY7m6POBWKKDARkjyzlfw0w0VXaLDFry9lCOUZI7
	qorUDbfefFIg7Sjppexjj0AspByx5qDGLkUbr68f4JHrDzRcWJ94A0JR2PxC+XXNyw6hHVMj77lTz
	HZBO372GwY/fBZkKuwQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcOt-0000000AVhQ-2zcT;
	Fri, 19 Dec 2025 15:28:15 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcOq-0000000AVgS-2OvP
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 15:28:14 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-8888a444300so20756776d6.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Dec 2025 07:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766158091; x=1766762891; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yf0ImYCnIty6Hsv8vMFIKwqY2rPgEKUaMHY5AG2sRYk=;
        b=rOaIYSrcekuAkjA818HtjDfwHIXXahOy4iMJ3TCbnPBSuoJomwz+Czh4obZL1VQAzI
         hSi6gZp0JRTc4wUbSgTf+XI5MRcQlOTaC+ZzWTBJJ4zgaQRYwYocMtIqwJZN5v1ibyhQ
         2Zlyg60gi0Za/ulVx+Tc1AjSrwSHtDT9G55U5irwKAmwITmDVsEUe1WF42eTzRYP9zBc
         bpY8gKwyl87cswHyRQL/QtI+copg2KXOPwwjrbIzulbeyN3tG/00hZXaSKOwLKEVm3P+
         vYADA2UQrKINEfZ+8dBwdkxrvswTezHOxxaCFCFmnNSo8lnEj7LxtycV796nAcHd3wy6
         CgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766158091; x=1766762891;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yf0ImYCnIty6Hsv8vMFIKwqY2rPgEKUaMHY5AG2sRYk=;
        b=LBMpCaaTE7w8Xz7AxVmQDm3rA673dsUsbmwWjOpINr6FEQXfuOYIdwxnlVvtIoZ8CV
         upi/pAfdVWZOgph93smGgOGsc/VzQ8NS04sFQKL50U+g6dxQVwqaICntkbOAR9wcmQKj
         Yi9jqKtPAWxxEap+AAQ3adxP3zbSWreiL2xvYnMuWVTwH/JtRvxckcsXsMCY7oCl7Df1
         cq3eabxY6Feh9eujTgbbE9M7iK76QU1OK9VGVANuso38hNpMX+yPdbOSc5wamQWdRD7E
         d4xvkr2yJ0n6kRtw5MZXft+A8k5CHe81pQ+i9jNfIysOsw0P1HFcjpLNU+drP0qpd6PC
         iSBw==
X-Forwarded-Encrypted: i=1; AJvYcCWqKoGGUrdXTj+JRisw8LVfc2ZQkgIy3ZMp7XleiIXwiwvPI/4btZawVgf/N7wmdi37uJDpvMa5l+4iMA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeZCnExkKx+2F74DIIUqwyjazVnkVn2Vd4EuFkytZZozLOLPgF
	2E946rxd4/fsklInQQEDfYhEo5kM1QY5gdswW+udfZMuFpW/Q5g5SJ21FikGJpSt7rE=
X-Gm-Gg: AY/fxX42CpG2m9YvQKpDeqyYAv9XGlNmxwpsMrCP1XtL7YvSPfmE5Bd7sHENhfnc13H
	CMkozGjN2Uq9E/tHQsnYN3hDJn7N7F7ntkMafmW0UTPbvjoGcp6TjM42sSTSI9H6rpCpv/9LNs1
	2/NDvifyx2ZsvURlCJ00ldZejz/VlH5YlKD2eg0TjznJu2o12NVlCceQmfLOyuXEIbwrJVTUVA0
	taUZD+fSHB1XUxJ/O8TZq2M+5hx7nWx46KI/bR2wO5YSJu4RfC+BjgwcVhtK2AzxXdxBu/5gHZy
	FGLR4pmm1xLgDICpAXQdpxOp+bb5KmNnD/1oa8DCDlP2iIS2uBcdFTko2SsXz3Mg/NbmJ9hLqxw
	Rj9csfec1uRvMOHehXGOnogdglCUtDk0V8JfKogcZPqOm3GoCeZxferAMUr72EA23j+dz/FMcW7
	89Mb63TBMQjGf5Nmd9Ril0rLMBUorp0wgpepMYcz+vEhQE0DE4t2c=
X-Google-Smtp-Source: AGHT+IESCa7TzSgsPFxRQ8nOnf1gW1Aedmg8uL4v5ngWrg3XKHmo91iY/SWKPTEaWsgBtfXN5+6Jow==
X-Received: by 2002:a05:622a:588e:b0:4ec:f6ae:d5d9 with SMTP id d75a77b69052e-4f4abd9768bmr44575641cf.39.1766158090847;
        Fri, 19 Dec 2025 07:28:10 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac62f973sm19054751cf.18.2025.12.19.07.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 07:28:10 -0800 (PST)
Message-ID: <ee9ce749-5ee4-41d9-8d1b-7b3b507b2217@riscstar.com>
Date: Fri, 19 Dec 2025 09:28:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] Introduce SpacemiT K1 PCIe phy support
From: Alex Elder <elder@riscstar.com>
To: dlan@gentoo.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org
Cc: ziyao@disroot.org, aurelien@aurel32.net, johannes@erdfelt.com,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 p.zabel@pengutronix.de, guodong@riscstar.com, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251218151235.454997-1-elder@riscstar.com>
Content-Language: en-US
In-Reply-To: <20251218151235.454997-1-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_072812_787560_584A8022 
X-CRM114-Status: GOOD (  22.17  )
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

On 12/18/25 9:12 AM, Alex Elder wrote:
> This series introduces a PHY driver to support PCIe on the SpacemiT K1
> SoC.  The PCIe controller implementation is derived from a Synopsys
> DesignWare PCIe IP.  The PHY driver supports one combination PCIe/USB
> PHY as well as two PCIe-only PHYs.  The combo PHY port uses one PCIe
> lane, and the other two ports each have two lanes.  All PCIe ports
> operate at 5 GT/second.
> 
> The PCIe PHYs must be configured using a value that can only be
> determined using the combo PHY, operating in PCIe mode.  To allow
> that PHY to be used for USB, the needed calibration step is performed
> by the PHY driver automatically at probe time.  Once this step is done,
> the PHY can be used for either PCIe or USB.
> 
> The PCIe controller driver that was included in earlier versions of
> this series has already been accepted upstream:
>    a812b09a6b599 ("dt-bindings: pci: spacemit: Introduce PCIe host
> 		  controller")
>    ff64e078e45fa ("PCI: spacemit: Add SpacemiT PCIe host driver")
> However this series still includes devicetree patches to enable the
> PCIe controller (along with the PHYs).
> 
> The patches that remain in version 7 of this series are unchanged;
> they are simply rebased on top of Linux v6.19-rc1.  The first two
> patches are the DT bindings for the PCIe and combo PCIe/USB PHY.
> The third is the PHY driver, and the last two are devicetree updates
> to enable the PCIe controller and PHYs.
> 
> 					-Alex

Yixun pointed out that I neglected to provide a summary of the
change history in this message.  Here is a link to version 6,
which summarizes prior history.  My explanation for v7 indicates
what changed since v6.
  
https://lore.kernel.org/lkml/20251113214540.2623070-1-elder@riscstar.com/

He also said I neglected to add Neil's Reviewed-by tag, which
is true.  That is here:
  
https://lore.kernel.org/all/ba532f8d-a452-40e5-af46-b58b89f70a92@linaro.org/

Sorry about that.  If requested, I can send an otherwise
unchanged version 8, but for now I'll assume that's not
necessary.

					-Alex

> Alex Elder (5):
>    dt-bindings: phy: spacemit: Add SpacemiT PCIe/combo PHY
>    dt-bindings: phy: spacemit: Introduce PCIe PHY
>    phy: spacemit: Introduce PCIe/combo PHY
>    riscv: dts: spacemit: Add a PCIe regulator
>    riscv: dts: spacemit: PCIe and PHY-related updates
> 
>   .../bindings/phy/spacemit,k1-combo-phy.yaml   | 114 +++
>   .../bindings/phy/spacemit,k1-pcie-phy.yaml    |  71 ++
>   .../boot/dts/spacemit/k1-bananapi-f3.dts      |  44 ++
>   arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  33 +
>   arch/riscv/boot/dts/spacemit/k1.dtsi          | 176 +++++
>   drivers/phy/Kconfig                           |  11 +
>   drivers/phy/Makefile                          |   1 +
>   drivers/phy/phy-spacemit-k1-pcie.c            | 670 ++++++++++++++++++
>   8 files changed, 1120 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
>   create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml
>   create mode 100644 drivers/phy/phy-spacemit-k1-pcie.c
> 
> 
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
