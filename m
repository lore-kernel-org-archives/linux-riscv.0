Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03BBCFC265
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 11:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQ/cyycb9UWEqniZzbGnaXLqOJxzzNSYZgaRSsCJZwY=; b=2Y9s86t+9R/SgX
	o2Wo5qmMZAFFK0Lsy3rcpopyHsSO2WsMjyJBeRQmkYmUjRzAcJWffjvX+m80IiuClfNlxdUaezJ+J
	9w3JsXifL5ODTcH//1EmmrYhk8uTOqQ97q9zPJmNN/kfrWB7pI34XPbg1bT28TJ94hwes0K4nEWfV
	VjDOynMbc58CSyb7XRMbukz7U2eZ/A/nrjtMdvSmlg4Ia7JRvObhbvMjBPVgdDBGtEzXoxaJYCRMX
	S4VG7fvJxISeLS7w3BJQeMhj8Y3pPppVgje0+ZA6TfQyh6K12o1YhtTMwERXGQPXmWN5pYwuF/+pp
	HG28/9hkGs0y2u1gvmMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMPgK-00000008KOc-2AOE;
	Fri, 21 Nov 2025 11:52:04 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMPgH-00000008KNo-45C0
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 11:52:03 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E7CB33F945
	for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 11:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1763725918;
	bh=1CJiYe46/9wzpUjF7HFzcDRB3znZsib+GR7IhrbsegE=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=bl4UgAIvlQSL4T2H+0ScDTJ7yIhheoSk316DE5bSx2n/U5WY+kIg/Do0OZqE3ze6M
	 GBLKVKGqicaWipUXLXu1TXg6/hOBxyIINHqUTARw48HQKvAOBTQkvKd5srEXC3AUzJ
	 CmqbYlnEWekuHQswtiVJc1/U7+VcMUL7JxEwNguCvzjhOSPkeGNunDXuKHXUFi98tq
	 0c3mMjeOrWEpa76YjwmXz2ZiBrLxBcj00V5NUTvh+2Aa6oLl+i2yaywedWDyFWtzLn
	 /vGH3AENBWCCGKH/d5HjDN0bRZmDW+hRLMkO0KRanps/dTPyx4nYOXtwCpAI54Lw1G
	 8W+ki/tLjrHvCUcTWlzxd4rvqT0zml4kB6o7aKPcurYxWVlrYigZfFiTbqdkvBHkmB
	 WsrcVbFSkMZQRxo0FG+s/fiEbVrpD1/9YXZkM6niCgJNKzc0xhuyTfVBADkTR/E2D4
	 dsBxWQP+YFBRTwQj+EIcUk7iTTXwssguUxstG8iKwBU/aSEHvJbmroOwE/N0cgPGi9
	 L6HjljiS7BHba8eLvObtjCr6B+2mGSmNUaLSkk5D5/h63xHwMldQsGYDXaqdFiQjvV
	 62KEJb43wXvX7hskOZf2hg8Eha91Gc7/h/5vwGdXQbSZ0Myzr8yU5HYxbKnYqUBecN
	 2Rx3L5ov/KpWiwGC9isUrsKc=
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-640b8d02165so3320300a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 03:51:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763725918; x=1764330718;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1CJiYe46/9wzpUjF7HFzcDRB3znZsib+GR7IhrbsegE=;
        b=Eof8reJdbSHTF/zBsJYfv/X3garNj0HYWM/MV3QVJ+YSr0xBdCcOsi9+qN6v31ElEx
         5M1X5lNlYKahvzIS871e53oc7Guy08DECrzL+ehVl+rxksfWUKG4ynY/7tijLfMxv5rn
         z/6qMo+Ay/AMpHREnZyJRuRwYeqSv52JCiIMuZIPcUeIWD0npX1LcNEd1prA7AWI1UoI
         VbQd6wjbDGaOfc9qK5ha9riqCu8h2aDbhbG92Vqvqat39vS4uId6vu2HDjn01W+u4HqJ
         6zlEFonpFAZcYjVJPE0MuZoa2L+fS+hm0M+BAFlIF96oLbhmx1hYNFTIdsop6Ou+/nyg
         Fzng==
X-Forwarded-Encrypted: i=1; AJvYcCX5LR7MXdhSWPT0oas7KTSisJR/6KMo1HjZ00+4fKMht3IpQ7YFPSbVvk5BnYuNUAALgzM4cIp1CnIPEA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr+aZ0elD14Bn7qqGVVdaMH2wy4LNU6HnbNFQz+jL9pQqppV0s
	R34kjhVZA80LvMfyoCn4WL8Eo4nQwNMKp13PizCEoRhzOF0w6RNKOocZHm0iAVmaQWAQsD0/C4I
	IT1BTQBvfiOtH7KzWCYfP/QIymiCDM/oSj0tlOAR7mPMt9+YkejqVcTbKKEOC69+HrXApEnOw21
	NvbBqCpv5mLBZPdcN4Ly+zFew5fiijhqdGWzbdgu3wXebLYSaqosD0DLvRthm/
X-Gm-Gg: ASbGnctzQyv5gm4hEtmEmUA75fVWTVuCkUya7juUre98x1JiZe7Ul4d+r8VQ6EWROQU
	E572JLU+xZg0fqS3QE5D7FS93R16s0pg7//iEQcprtxIa8RIzLnQDxNZ06YrMSlT+0lpyJ/z6gq
	AJpdPItnuqp8IWAvJ4LzljaRi93Y31y7fR/SkJVJGrCPYVhPXfZuZ+d3LeIOe2lLBL
X-Received: by 2002:a17:907:3e88:b0:b72:8489:7e65 with SMTP id a640c23a62f3a-b76716dbe58mr249513466b.31.1763725918442;
        Fri, 21 Nov 2025 03:51:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmmbb/l3K7dtugr+S1m3/Wv8PJ5+8oknGlLjROzkp0sM+lmlNKNB0zjV4+LxEvknw2diFiHds/C+1CuD4T17s=
X-Received: by 2002:a17:907:3e88:b0:b72:8489:7e65 with SMTP id
 a640c23a62f3a-b76716dbe58mr249509966b.31.1763725918024; Fri, 21 Nov 2025
 03:51:58 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 Nov 2025 03:51:56 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 Nov 2025 03:51:56 -0800
MIME-Version: 1.0
In-Reply-To: <20251120082946.109378-5-hal.feng@starfivetech.com>
References: <20251120082946.109378-1-hal.feng@starfivetech.com> <20251120082946.109378-5-hal.feng@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Fri, 21 Nov 2025 03:51:56 -0800
X-Gm-Features: AWmQ_bkB8niCYgVkDWKDtP_0Ppy1-V0zOFN4wZx7lFmVJ6bRkVFOMoAbi3kETSM
Message-ID: <CAJM55Z89bBnr_GX81bPmCV0iHKbURAg=SbrTut_DUa-7gdK91A@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] riscv: dts: starfive: Add VisionFive 2 Lite board
 device tree
To: Albert Ou <aou@eecs.berkeley.edu>, Bjorn Helgaas <bhelgaas@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, E Shattow <e@freeshell.de>, 
	Hal Feng <hal.feng@starfivetech.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_035202_137578_AF27B5AA 
X-CRM114-Status: UNSURE (   4.95  )
X-CRM114-Notice: Please train this message.
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

Quoting Hal Feng (2025-11-20 09:29:45)
> VisionFive 2 Lite is a mini SBC based on the StarFive JH7110S SoC.
>
> Board features:
> - JH7110S SoC
> - 4/8 GiB LPDDR4 DRAM
> - AXP15060 PMIC
> - 40 pin GPIO header
> - 1x USB 3.0 host port
> - 3x USB 2.0 host port
> - 1x M.2 M-Key (size: 2242)
> - 1x MicroSD slot (optional non-removable 64GiB eMMC)
> - 1x QSPI Flash
> - 1x I2C EEPROM
> - 1x 1Gbps Ethernet port
> - SDIO-based Wi-Fi & UART-based Bluetooth
> - 1x HDMI port
> - 1x 2-lane DSI
> - 1x 2-lane CSI
>
> VisionFive 2 Lite schematics: https://doc-en.rvspace.org/VisionFive2Lite/PDF/VF2_LITE_V1.10_TF_20250818_SCH.pdf
> VisionFive 2 Lite Quick Start Guide: https://doc-en.rvspace.org/VisionFive2Lite/VisionFive2LiteQSG/index.html
> More documents: https://doc-en.rvspace.org/Doc_Center/visionfive_2_lite.html
>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>

Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
