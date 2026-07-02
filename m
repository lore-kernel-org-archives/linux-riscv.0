Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C79C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 09:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	References:MIME-Version:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rrrYScvh9OjozIbqwZq6ldRHBOGXB4KFz/hPRRODFKk=; b=qf/KMcc+IXjBYcfNhAtSiezx9K
	khsoILkUG6ku+62qHp/6Jkq6bz64rKYh12UWsqpH8/gup56WBE9adQf92OP/RLfa0C3yQOJPfFDf9
	Fu5JHw9BYh1Yb52wI+JnZ3N1iDyxIF1lmKsr02hhwZjxqOjHAaBnG1rgCbA08TXw+4qmoaEc1+CmS
	8Zmj+fyYswpUwKCol65+661zCkLgey7WiLjGyVJMcWbtd+KE1HYuS7sSIj4YRcdWD+kAdgfIQqR+j
	/hgpXpYlLEv7rNjR21KMUyge2pcQ5ZjE/ldH/TmPxCAo9TbZyddbi6q1xRtsB6CjpGxW4yok7lKdB
	tiUMbvGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDTZ-00000003yio-2oDU;
	Thu, 02 Jul 2026 09:12:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDTY-00000003yi3-2yrA
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 09:12:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6AD02404C4
	for <linux-riscv@lists.infradead.org>; Thu,  2 Jul 2026 09:12:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 527BE1F0155E
	for <linux-riscv@lists.infradead.org>; Thu,  2 Jul 2026 09:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782983572;
	bh=z3us1EYcPhA08D2V/YJ+nWiOnRiCmeZ4lZeMhncdG0g=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=lPyvPnDueqS9ZIaG4AR8IxxE8u+oV1PYjwXXaoyKWknbM6OhQLYanydVuc1qzgo3z
	 R+JWVZq5YV93ScxHlquZZEI93rboq8ubHxikSWMv+AFhTH61bnsbIfLwDQqmN/fcDh
	 L7OatAaU/eNHLzOUDAhmQAWRK86el8sgoojYtGqc2e+aa4Ab7EPhmdyDoi/e3911uD
	 H9YT4uVHlukHAKxHgypn/78J+0kzaG/PPT63uA23z0e0Jy2jiwUJiGiPEI4aLZoKPK
	 fgZnHkddf2MFQObw8Uq2YbfAhlewJXDrb5n2lpce9v8zY+WoWQU5rj6NBSeycKhtT0
	 BpJ6v3y8RhK+A==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39957d210f4so15245061fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jul 2026 02:12:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp4D96o905HWGPLgkISmS5Hu5em9ImSiB33pH51NxiHFNd/sJncS+0S0+HoGcYZNpwnk79YltMgMo+AfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpmRZjPfpuLkKbj/RXcQbCSP3d8zz2h/DbHGGyym4kcf3xKQBr
	OYcpPpiR0URbkNXQCaLQDTnYmHoNA7q2EZq1B2rc5ftKpO+BOYy9xZd/uyXcI5yfMrzdeoCaILC
	LKLJ9G+sarMBZ1UojZHsNHbfdmNB9qPK10H1oee8AXQ==
X-Received: by 2002:a2e:9c86:0:b0:39b:35bd:e705 with SMTP id
 38308e7fff4ca-39b35bdebfemr6340391fa.37.1782983570078; Thu, 02 Jul 2026
 02:12:50 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Jul 2026 04:12:46 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Jul 2026 04:12:46 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <akOZFIowVvprnAMf@vaman>
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
 <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
 <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com> <akOZFIowVvprnAMf@vaman>
Date: Thu, 2 Jul 2026 04:12:46 -0500
X-Gmail-Original-Message-ID: <CAMRc=MfBcOhbj=ETxy2Xz9o_nyzykrEhKAc3jYi6V5_jMZEE3Q@mail.gmail.com>
X-Gm-Features: AVVi8Cc0cbGsvWIHn6Ltbm1wzcUWjyqAHy25YdAMNK19MIl0j9ziewcxopNMKrw
Message-ID: <CAMRc=MfBcOhbj=ETxy2Xz9o_nyzykrEhKAc3jYi6V5_jMZEE3Q@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Vinod Koul <vkoul@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Radu Rendec <rrendec@redhat.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>
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

On Tue, 30 Jun 2026 12:23:16 +0200, Vinod Koul <vkoul@kernel.org> said:
> On 29-06-26, 16:51, Geert Uytterhoeven wrote:
>> > Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
>> > driver instead of the MAC driver where it was previously. Instead of cramming
>> > both HLOS and firmware handling into the same driver, I figured it makes more
>> > sense to have a dedicated, cleaner driver as the two share very little code (if
>> > any).
>>
>> I think you are mixing up DT bindings and driver implementation?
>
> Should the bindings change if we have different driver and firmware
> implementations? Isn't binding supposed to be agnostic of
> implementations..?
>

I've thought about it some more and I believe this question is philosophical in
nature.

sa8775p and sa8255p are *the same* hardware. I can flash different firmware on
the same Lemans Ride board and it becomes one or the other. Yet they are not
described by the same DTS and the bindings differ as well. I don't see why we
wouldn't allow the same approach for the this PHY.

We treat it as different HW variant when it's managed by firmware - just like
we do with the rest of the SoC.

Bart

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
