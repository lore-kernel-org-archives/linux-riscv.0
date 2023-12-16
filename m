Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44279C41535
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Dec 2023 19:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=K5cONSTu6KIxjORjPlEEdJ95SA3kcWfk0S+jXg7ZZX8=; b=j82CQVqrgU9D3vBVOYYeMZmFFA
	4Xp+eEGlNn7zt7mkIQOQiCzsWZkNoFn9yiLerA7Q1TCfkEoyTFb7+wVHRXDqLS4puefLLaxul1nWp
	uR1FKm8/X5OvuFck8czXWdHdnLhCTeKMcXTM5ahNvN5jgso68sG4KquyFwLm/J953yc2LfRxwBHUe
	B0QXRsA6JTu4+v47jwglSnnju+d9I2yqxB/uRd1hBQRODY4mEzz7pe2I3Xpi1DDC/M8WBckP3fDlZ
	vNdWcg9Bj1HV98/gqMA/cp+QMXm1+ahIsje/VIzE6QmwZgY8lE2PNlG+qjmpYEv0Gygb9bkSFht8/
	LD0TJScg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEaHM-006cZS-1H;
	Sat, 16 Dec 2023 19:24:52 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEaHI-006cYV-0G
	for linux-riscv@lists.infradead.org;
	Sat, 16 Dec 2023 19:24:49 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 85AB53F15F
	for <linux-riscv@lists.infradead.org>; Sat, 16 Dec 2023 19:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702754682;
	bh=arp4KgnNalvlcscGqi/VgrS8JYrKrYTVbwSx1z/f2Zk=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=iscJyetlYx/Qnbmo/VkOHDYJiCr4Rk8y/rSSWRPM/rY61Og3jIV6/7uBwigcl8MsO
	 nEh1GHEqwlbBs9B+EMeRoFZiGLe/23dIWe0Bt2o0mReBGGkHQYap0cNVByxdnc+34T
	 h+EQOsZLiewz3AMDlS0z8NoYPv+MQTVijewBcp4PzNDh0HHueJkQssF8moXHX8o5eC
	 8C711SnZsGtXNF7Wy8UR1dZ8YDwUp3X1QYK+Eyvb/xZ2E25GE2Hj3Bq5sfVVgZ1xQ3
	 JzKqk2z4sTzvWQl/s7n/Wp8SsYk1vGvyI+zOUTjy5iif0RoJDF9iodY/x3Jn+B5/Mm
	 HhCVXkepkTWPg==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-425927c274aso33525751cf.1
        for <linux-riscv@lists.infradead.org>; Sat, 16 Dec 2023 11:24:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702754681; x=1703359481;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=arp4KgnNalvlcscGqi/VgrS8JYrKrYTVbwSx1z/f2Zk=;
        b=rOYUc5avNueqqgPAPl4ogSYMCVYu6hjDQRlJaR3U0DGL0ww+028wp9Nd3BUo8k8ujk
         8IXaKvXHZcVIzqR46OU477n2Yt0bHgBcAAM2Q0ujxdzi/Aswe4tzykCdU1VTfigQ7pUx
         m98hxvVJpwtPcbgpN4Qp1RHa4n+LALCItqpeTTeIR9s2eHdew7aWlDD8M7VMGK5r+73G
         81ZZ0CSc0SAEA8P87L/7i62mk+iJWEHgBIg7cbCQdeOGokGABwueVu0hgQQtrUZeUa57
         D18FEES9RG4766OIKfIuQMBecbTzm6zhNpCJ9/Vua5gn5t6KTMJqj3hC2dh0PJl4yhCN
         s2Nw==
X-Gm-Message-State: AOJu0Yy71RcSKOwtfqiJ4WrT3+5PZDIka5u4oExxqFLVbHooHPb3Xn7F
	1jY2e2ZQsMBqlU/Af/bhX+ev6+iwRszZWJr5iBbr9by7C3w0xSrb8zhBSucd2+3kSrCFDTbTa/5
	r7ByGGHkHwr+gLUWnNUwNF34sW4q8N+1KVsZHsWv0HgjIZAVldqo7WxCQZ7nKFA==
X-Received: by 2002:a05:622a:1cf:b0:418:1565:ed50 with SMTP id t15-20020a05622a01cf00b004181565ed50mr17632948qtw.66.1702754681679;
        Sat, 16 Dec 2023 11:24:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHh1FB45qk7mcuI2qHGO1vj4JgeCLK0ZvhpRnKj5MhPIcHzu1iD+2wJffax6hiqvMJOiTseak4ew2mkMkdlIE8=
X-Received: by 2002:a05:622a:1cf:b0:418:1565:ed50 with SMTP id
 t15-20020a05622a01cf00b004181565ed50mr17632917qtw.66.1702754681432; Sat, 16
 Dec 2023 11:24:41 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 16 Dec 2023 11:24:40 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <698fbb5d-0750-4f2a-857f-5429e5f589f9@collabora.com>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-13-cristian.ciocaltea@collabora.com>
 <CAJM55Z9e=vjGKNnmURN15mvXo2bVd3igBA-3puF9q7eh5hiP+A@mail.gmail.com>
 <2f06ce36-0dc1-495e-b6a6-318951a53e8d@collabora.com> <698fbb5d-0750-4f2a-857f-5429e5f589f9@collabora.com>
Mime-Version: 1.0
Date: Sat, 16 Dec 2023 11:24:40 -0800
Message-ID: <CAJM55Z-e8mkjac-nCF9_w6EmMVbL9ued0mAcjwTMF=pKDLkMsA@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] [UNTESTED] riscv: dts: starfive:
 beaglev-starlight: Enable gmac
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Samin Guo <samin.guo@starfivetech.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231216_112448_258082_B2E307C2 
X-CRM114-Status: GOOD (  13.23  )
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
> On 11/28/23 02:40, Cristian Ciocaltea wrote:
> > On 11/26/23 23:10, Emil Renner Berthing wrote:
> >> Cristian Ciocaltea wrote:
> >>> The BeagleV Starlight SBC uses a Microchip KSZ9031RNXCA PHY supporting
> >>> RGMII-ID.
> >>>
>
> [...]
>
> >> You've alse removed the phy reset gpio on the Starlight board:
> >>
> >>   snps,reset-gpios = <&gpio 63 GPIO_ACTIVE_LOW>
> >>
> >> Why?
> >
> > I missed this in v1 as the gmac handling was done exclusively in
> > jh7100-common. Thanks for noticing!
>
> Hi Emil,
>
> I think the reset doesn't actually trigger because "snps,reset-gpios" is
> not a valid property, it should have been "snps,reset-gpio" (without the
> trailing "s").
>
> However, this seems to be deprecated now, and the recommended approach
> would be to define the reset gpio in the phy node, which I did in [1].
>
> Hopefully this won't cause any unexpected behaviour. Otherwise we should
> probably simply drop it.
>
> [1]: https://lore.kernel.org/lkml/20231215204050.2296404-8-cristian.ciocaltea@collabora.com/

Oh, nice catch! With your v3 patches the Starlight board still works fine and
GPIO63 is correctly grabbed and used for "PHY reset".

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
