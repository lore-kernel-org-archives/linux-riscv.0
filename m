Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940C9C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Mar 2022 12:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qg/TfZ4HryhDbBqVFhWT4Q11E7heEEJugvyE7bbzgkw=; b=XMT97ZoJ6zbfTR
	IrslOhsorLwBkyRYx1aQhUsgmUJKT4ykPhRqz3EomhJ/WYsMeZ6+Ik8IRPOYkDHW10E/7HueyFRGR
	4C3+PQw0Il9Q10yTmj+wdOwR54V7mbicUsB+RSSv/7C2eWBhLPVqR6U/I9AP2rY+dF2cM73qi/7hA
	2ltWjuC3LrDWyyeNAYRYIH10GXY8/z3RnAX0zKh3G//oM2eNOpwVp9WFq8evA65AvwUA+SGrCJfvy
	tCgRGU7Nmfzov5ikczlR8Ip72QeY5MDdu/zvFKK5d2Af+SCbStP2G7nxNrw/ljMBiBxRLGaucn7NP
	oE8N/0tQohoWKwd3X9mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVBn7-001ah7-1F; Fri, 18 Mar 2022 12:33:13 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVBn3-001afP-P2
 for linux-riscv@lists.infradead.org; Fri, 18 Mar 2022 12:33:11 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 7-20020a05600c228700b00385fd860f49so4765182wmf.0
 for <linux-riscv@lists.infradead.org>; Fri, 18 Mar 2022 05:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IVKS+fo96/p9+Ih0mtD1prOXn3p+8FAfNSeavgBoyPA=;
 b=3GHvS5GfsxA3hWn2yBsGEk+Id9A1k83DXM7Qz7rPLPSbaLz70JZuOs7fhFKFiF/tVE
 qN72ygb18bLrX2baBq9OIxfq6pbxhprw5EJrLQ7MgevpG97wS48Iu/Ro1H+pFzl148W5
 efTpmQB1RZnXoR+Z3B2qqXC4fOeDs0oiQCnxwoDls4Ak/wqZ7VkhWEnNFXdKXlEO7/N7
 kVrFK3ZubPjJAePF0HppUIb7cZlFvs6x8nC0blI0z89RL2nWdhyiGnmHiKBNDa5W3ME2
 4RvRH3oef2qhEgsTzSr8kQCsamWAEfZinSXODgPAvG408hYTyC2gbxhyM5KEbnYO28SE
 Eprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IVKS+fo96/p9+Ih0mtD1prOXn3p+8FAfNSeavgBoyPA=;
 b=GwM1udChUISsurX8r7QIv7reXPQDFj0pQOJnbTlT4ziqUKE/bWsRpmwNxBJHKuuLIv
 t4jQhsgnuay6wcBaufeMLrgEHvJy+uOb0JqP5G4TA+AZ4rp5kLJ5i84Dej2iOxxzpTbM
 YOs1u3gwzjwvMS/1DYebzLP62Ig7LRF5wl0UQ6NaIIoPvnrlbz4IFe7l79yP9s0xEuVB
 oHmmt7mf8oiWUaW/Hhg4VdBqSCZ87ieb0aFk3nNwH5FKcBKVRsggI50uPGyXdt0VQ6FU
 rySjmuxar+Uzk5Yh+30VCFUa7MqA1cxh9wfqB+OV5mEXe0b0yiHOMEjtP+gU7i9cMac8
 cjkA==
X-Gm-Message-State: AOAM533B1+LF4XFKvrKqWe31/1g57hio+z2bJHnN9BcuoCErlcqDEKDR
 jmif21SGELfioOSW214evo17ig==
X-Google-Smtp-Source: ABdhPJzwV71tEEpc6CSFgC+ZWzrTAQczGRUmTh+nKq++cYrW3WPOz/9gdoKDEDyvmVHSUi2XSLkP2Q==
X-Received: by 2002:a05:600c:3c89:b0:37f:aacb:cac7 with SMTP id
 bg9-20020a05600c3c8900b0037faacbcac7mr478320wmb.1.1647606786696; 
 Fri, 18 Mar 2022 05:33:06 -0700 (PDT)
Received: from [192.168.2.222] ([109.76.4.19])
 by smtp.gmail.com with ESMTPSA id
 g6-20020adfd1e6000000b00203f8effc22sm1701999wrd.63.2022.03.18.05.33.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 05:33:06 -0700 (PDT)
Message-ID: <c11f65fb-a756-0233-791b-6ecc3d9f4f05@conchuod.ie>
Date: Fri, 18 Mar 2022 12:33:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/2] Add support for hwrng on PolarFire SoC
Content-Language: en-US
To: conor.dooley@microchip.com, mpm@selenic.com, herbert@gondor.apana.org.au
Cc: lewis.hanly@microchip.com, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20220307154023.813158-1-conor.dooley@microchip.com>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <20220307154023.813158-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_053309_853216_C9BB0850 
X-CRM114-Status: GOOD (  16.26  )
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

There's an error in the probe function's reference counting.
Will fix that along with the quality estimation in v2.

Can safely ignore this version of the series.

Thanks,
Conor.

On 07/03/2022 15:40, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> As it says on the tin, add support for the hardware rng on PolarFire
> SoC, which is accessed via the system controller. While we're at it,
> add the rng driver to the list of files included as part of the SoC
> support in MAINTAINERS.
> 
> Base commit is in arm/soc branch of the soc tree as the hwrng driver
> depends on the system controller, which is to be introduced via that
> tree in 5.18
> 
> Conor Dooley (2):
>    hwrng: mpfs - add polarfire soc hwrng support
>    MAINTAINERS: update PolarFire SoC support
> 
>   MAINTAINERS                       |   1 +
>   drivers/char/hw_random/Kconfig    |  13 ++++
>   drivers/char/hw_random/Makefile   |   1 +
>   drivers/char/hw_random/mpfs-rng.c | 103 ++++++++++++++++++++++++++++++
>   4 files changed, 118 insertions(+)
>   create mode 100644 drivers/char/hw_random/mpfs-rng.c
> 
> 
> base-commit: a483b1b232e616d0095a59b987ffc739bc1b56bc

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
