Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30662C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 15:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lnIxUX1zZz9I+uAJkJhRdxj+dCj0PwxbpdKH9uH84tQ=; b=FZGN+qP4+Wcw7FZEYH+k/PAcyK
	pHEFjSiHB+hJxpMTLhXof3xOuzVIX/a7zmdVjV+llp73Kl3FSpcpIfrUSc5hDCYsqXhHVmaPkeDx7
	+x2qr4BjWKE7xf6fc0VyQ3ymczts8Per618nm+ItqvSMz1Xc6mAb1WXiOL386pLZU8sgRKV+bkyRj
	AYVZxxc9E0tHU8Gj5hNU4uv123Bz6ydtUS/jb9Ou6EUngxKyq6QVIOBl4DS5UkZMis9snbFywGuKQ
	6iMHwJyG2p11CZ4cxNvOBR+g13+q5UkL7WhS+B0u1+/GzKz+Ee+wP+oHosAONZ3RkoslyDmt/zfmc
	lN/R66Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyaA-000GoL-1a;
	Wed, 20 Dec 2023 15:34:02 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFya6-000Gnl-2Y
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 15:34:00 +0000
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 734393F740
	for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 15:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1703086433;
	bh=+HVYDneHKVp/XU1Z/f/NTkNW5tbTInLvnUZS1rPPIyg=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=g4yARkhObuoNtljJ8PU6PoUKrSRZCXINbpX4tq7ZokKxsSy2W1cJFmZhsWTnGc5/d
	 9Qht01ZpIkGA2wG8MqNRyEGArnhxFQbpy8tQOvAkW2FWXEUMPqVcfkT775kkagwAJP
	 U9wb3uqxN9HgriDS8xtk/rJS5d+XLng3LGS87UGxz1PE4NRLC7rRH3GZDFJOHvJK74
	 2Kjs0/fHhED9NRWzctz2IXTB7qjjOvl62yxZFNR6U20ZeR9QfgnyrAi06dOKf8ujnu
	 DSZcfnYKSm2X4GeGyHPfn5oCXFNO2xLgARfk/dnBZCIODtg8PVBdlKXqENpP6LuhyN
	 1PhDPOwSPMRqA==
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-77f6e8e3be3so569238685a.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 07:33:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703086432; x=1703691232;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+HVYDneHKVp/XU1Z/f/NTkNW5tbTInLvnUZS1rPPIyg=;
        b=GJGTjMLfLIS0DSmEPvBQgCWGXv7ghVXW/+3y+rNeKjczeZEZ1d9kqZd7cj4AHCG2E5
         DQbCWMuIgTI+FNqFEXw3LpPcvnoxe+6WMHWOomrEE8H/pNC83Uf8nxqk4aoBvCbgc5H4
         +Z3ulkFglQepYIkWDJu4cKuCzjf+r2WqRPunfYprB7exVCFC2BClPsIx0De6nTIWs3ZS
         uV8dkNplS78h3FApk2HacMG0FQrqfJr+O99KioWlCB8CmA80r22fmI8+fEfzS6/f9uML
         t5LeHUdNWwjYywL9f+JVMPzL7Dhi28lbIiAvzVUvpa4MyH/U1eG6Enio2bwxdQAejb2d
         NaTg==
X-Gm-Message-State: AOJu0YzRa68RiMKICU0LPad2RlBYZGqXkPKdL5Cw7ErO2ZU6TimHJR5j
	KTbtT92vSCRqLy3J59gjRZMfefqQvn1IMCXunv1hB47MjIfOGRHVh6GRMirGxOJvhVsnhmLPqxj
	be2xYHxTbmgKWhxZUYJcVRdMvK+9ZUN2LCVN+z2ub2zPbyMg2seVFjkZ+geXkhg==
X-Received: by 2002:ae9:f811:0:b0:77f:1572:f8e2 with SMTP id x17-20020ae9f811000000b0077f1572f8e2mr15537948qkh.53.1703086432114;
        Wed, 20 Dec 2023 07:33:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3L7mi2h3cBjp7o3vfhRJ3HDeZBy2tBj5Qlbg1frVHnfR2OHAeRuKccJX697ixjrfWmHuGzXgUFxyDwwaBIPk=
X-Received: by 2002:ae9:f811:0:b0:77f:1572:f8e2 with SMTP id
 x17-20020ae9f811000000b0077f1572f8e2mr15537935qkh.53.1703086431776; Wed, 20
 Dec 2023 07:33:51 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 Dec 2023 07:33:51 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <3b2d41cd-4c0a-4277-8650-e6da37139023@collabora.com>
References: <20231220004638.2463643-1-cristian.ciocaltea@collabora.com>
 <20231220004638.2463643-2-cristian.ciocaltea@collabora.com>
 <CAJM55Z9DhojDTDPEqx3NO5g61=ezRg-U9odixbZugcXRRVmS7w@mail.gmail.com> <3b2d41cd-4c0a-4277-8650-e6da37139023@collabora.com>
Mime-Version: 1.0
Date: Wed, 20 Dec 2023 07:33:51 -0800
Message-ID: <CAJM55Z-pq=J1vZ9=25jQJ+0DxXOBGEdxxZsB3jKg+MSF06atTg@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] riscv: dts: starfive: jh7100: Add sysmain and gmac
 DT nodes
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Jacob Keller <jacob.e.keller@intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, kernel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_073359_223739_A9A9F212 
X-CRM114-Status: GOOD (  19.87  )
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

Cristian Ciocaltea wrote:
> On 12/20/23 15:43, Emil Renner Berthing wrote:
> > Cristian Ciocaltea wrote:
> >> Provide the sysmain and gmac DT nodes supporting the DWMAC found on the
> >> StarFive JH7100 SoC.
> >>
> >> Co-developed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> >> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> >> ---
> >>  arch/riscv/boot/dts/starfive/jh7100.dtsi | 36 ++++++++++++++++++++++++
> >>  1 file changed, 36 insertions(+)
> >>
> >> diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> >> index c216aaecac53..2ebdebe6a81c 100644
> >> --- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
> >> +++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> >> @@ -204,6 +204,37 @@ sdio1: mmc@10010000 {
> >>  			status = "disabled";
> >>  		};
> >>
> >> +		gmac: ethernet@10020000 {
> >> +			compatible = "starfive,jh7100-dwmac", "snps,dwmac";
> >> +			reg = <0x0 0x10020000 0x0 0x10000>;
> >> +			clocks = <&clkgen JH7100_CLK_GMAC_ROOT_DIV>,
> >> +				 <&clkgen JH7100_CLK_GMAC_AHB>,
> >> +				 <&clkgen JH7100_CLK_GMAC_PTP_REF>,
> >> +				 <&clkgen JH7100_CLK_GMAC_TX_INV>,
> >> +				 <&clkgen JH7100_CLK_GMAC_GTX>;
> >> +			clock-names = "stmmaceth", "pclk", "ptp_ref", "tx", "gtx";
> >> +			resets = <&rstgen JH7100_RSTN_GMAC_AHB>;
> >> +			reset-names = "ahb";
> >> +			interrupts = <6>, <7>;
> >> +			interrupt-names = "macirq", "eth_wake_irq";
> >> +			max-frame-size = <9000>;
> >> +			snps,multicast-filter-bins = <32>;
> >> +			snps,perfect-filter-entries = <128>;
> >> +			starfive,syscon = <&sysmain 0x70 0>;
> >> +			rx-fifo-depth = <32768>;
> >> +			tx-fifo-depth = <16384>;
> >> +			snps,axi-config = <&stmmac_axi_setup>;
> >> +			snps,fixed-burst;
> >> +			snps,force_thresh_dma_mode;
> >
> > Compared to v4 you're missing a
> >
> >   snps,no-pbl-x8;
> >
> > here. It might be the right thing to do, but then I would have expected
> > it to me mentioned in the cover letter version history.
>
> Oh yes, I missed to add this to the changelog, sorry!  I dropped that
> because the property is only valid for snps,dwmac-{3.50a, 4.10a, 4.20a,
> 5.20} compatibles, while we have plain snps,dwmac to handle 3.7x.
>
> We could have probably used snps,dwmac-3.70a or snps,dwmac-3.710, but
> I'm not sure which is the exact chip revision and it wouldn't really
> change anything as there is no special handling for them in the
> snps,dwmac.yaml binding.

I see, makes sense. This way works fine for me.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
