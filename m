Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A53CD2069D
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 05:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7i0LV2SnxBrHvNx0F6DTtUinu5mzgs70bXcq+C6CHaU=; b=yRQqo9PHAbGpKA
	6tnhcgCRYwgJGva/RcPyRB3jaNvZQfRPxRiLdT4371/EbMtCRkNtAHsvfIz9fItbBU378To0Jy2xh
	RjqCYF8rE/dECNFutw/7HecvvlROEJ5Uxpqh5nO/wsYxe8MfyNiyC4JkwKyvsEHjbWm0UkOY44oNk
	Ml59CRgXODQZ1rQ4y3mLKhpPByYE0HhuVP1vD0wSDe3iV7NvZJtxOVrzmygPBqLFCtsZr2fFErzDp
	vDiq22Ns15N++LcIFye0LTRbGooIa+tf2lnonL5fSVcG9B6N9S2S6d/za6maQXHZkRfZ3s5UFLMjr
	hUVLJ7OfievqklDNRj4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0wEh-0000000AXSo-2SMP;
	Wed, 16 Oct 2024 05:06:15 +0000
Received: from mail-ej1-f47.google.com ([209.85.218.47])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0wEd-0000000AXS1-42wn
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 05:06:14 +0000
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a99eb8b607aso497580466b.2
        for <linux-riscv@lists.infradead.org>; Tue, 15 Oct 2024 22:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729055169; x=1729659969;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJpmoZDHNXOCQ0hPtAG85Btn1S/XrnkL2QxgMJLjgU0=;
        b=DpkbKF31have8XDwWGSvTKGrFlWG/fJmJtdWAM9pmsbcN6B4kX2GU/YE/LEQJ7MLWu
         moh8Jgqxf0zfjYjMwyEPNMxfGPgwfw9bv8VdhzU/QvgIwa9eJ4qnmP15UpAb1ZnhjagX
         fatfmO04KoelgRKpqHZDfaP3Wcp8VAOiSIDtsp4/KGFY/X5mKROTlRByjyYS+40tBU1f
         kH1V1CUP7ZeJdsGWVL2vLO9NZfn04ZCuJChkCG67uetujQQLk9gdiJD2cBjRw6RRT8PP
         7TspwLq9s79OqKPqtaqH7BgICoz5SWkFoI/ok4Ll4Nf2tdCHnYZYX6uT4vZqR5CO+pxT
         o7ag==
X-Forwarded-Encrypted: i=1; AJvYcCUIsBbTR7tn9JHZUN/87qQoy0sXncB1h3dO3gpkCADJB60ciB7X8mII+x3uy1YoOx0XCHfBJGCiWx5LBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHGpxe5qzEIP43m0TxjybHFgRC26Y46WvUZTRvP1DsMGplFWvN
	KiXJOSwZy/W+6E7oxNIYluM1yyEKougCDaSFAh1lkXg00VzZW1TOve/lj8Cx5HjpGcH6BC4HAe+
	1H+jTYgnhYGpGDfgNWS6JIWuuubI=
X-Google-Smtp-Source: AGHT+IH74YJJx49nsFhkFyT1RiTJLRloxAcb38iBw6/nz//HY/ZNyBiPGvMCwwwDAg2enWh0s8igaco8Z4E7VnmPpHo=
X-Received: by 2002:a17:907:e216:b0:a99:7c14:9197 with SMTP id
 a640c23a62f3a-a9a34e9b0a6mr190098066b.64.1729055169080; Tue, 15 Oct 2024
 22:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240922145151.130999-1-hal.feng@starfivetech.com>
 <20240922145151.130999-4-hal.feng@starfivetech.com> <CAMZ6Rq+EM37Gvx8bLEwvhn+kUC9yGDiapwD0KX31-x-e-Rm3yQ@mail.gmail.com>
 <EAC60558E0B6E4BB+e5384c3c-ba45-48f5-a86f-a74e84309a14@linux.starfivetech.com>
In-Reply-To: <EAC60558E0B6E4BB+e5384c3c-ba45-48f5-a86f-a74e84309a14@linux.starfivetech.com>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Wed, 16 Oct 2024 14:05:57 +0900
Message-ID: <CAMZ6RqLvzvttbCMFbZiY9v=nGcH+O3EV91c+x7GxTbkKhdTcwg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] can: Add driver for CAST CAN Bus Controller
To: Hal Feng <hal.feng@linux.starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Hal Feng <hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_220612_027363_4277C500 
X-CRM114-Status: GOOD (  23.77  )
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

On Tue. 15 Oct. 2024 at 18:33, Hal Feng <hal.feng@linux.starfivetech.com> wrote:
> On 9/23/2024 11:41 AM, Vincent MAILHOL wrote:
> > Hi Hal,
> >
> > A few more comments on top of what Andrew already wrote.
> >
> > On Mon. 23 Sep. 2024 at 00:09, Hal Feng <hal.feng@starfivetech.com> wrote:
> >> From: William Qiu <william.qiu@starfivetech.com>
> >>
> >> Add driver for CAST CAN Bus Controller used on
> >> StarFive JH7110 SoC.
> >>
> >> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> >> Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
> >> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> >> ---

(...)

> >> +       stats->rx_packets++;
> >> +       netif_receive_skb(skb);
> >> +
> >> +       return 1;
> >
> > Why return 1 on success and 0 on failure? The convention in the kernel
> > is that 0 means success. If you really want to keep 0 for failure, at
> > least make this return boolean true or boolean false, but overall, try
> > to follow the return conventions.
>
> The return value here represents the number of successfully received packets.
> It is used in ccan_rx_poll() for counting the number of successfully
> received packets.

Ack. I guess this will become more clear after you implement the queue logic.

(...)

> >> +
> >> +       if (priv->cantype == CAST_CAN_TYPE_CANFD) {
> >> +               priv->can.ctrlmode_supported = CAN_CTRLMODE_LOOPBACK | CAN_CTRLMODE_FD;
> >> +               priv->can.data_bittiming_const = &ccan_data_bittiming_const_canfd;
> >> +       } else {
> >> +               priv->can.ctrlmode_supported = CAN_CTRLMODE_LOOPBACK;
> >> +       }
> >
> > Nitpick, consider doing this:
> >
> >   priv->can.ctrlmode_supported = CAN_CTRLMODE_LOOPBACK;
> >   if (priv->cantype == CAST_CAN_TYPE_CANFD) {
> >           priv->can.ctrlmode_supported |= CAN_CTRLMODE_FD;
> >           priv->can.data_bittiming_const = &ccan_data_bittiming_const_canfd;
> >   }
>
> OK.
>
> >
> > Also, does you hardware support dlc greater than 8 (c.f.
> > CAN_CTRLMODE_CC_LEN8_DLC)?
>
> The class CAN (CC) mode does not support, but the CAN FD mode supports.

So, CAN_CTRLMODE_CC_LEN8_DLC is a Classical CAN feature. Strictly
speaking, this does not exist in CAN FD. Do you mean that only the
CAST_CAN_TYPE_CANFD supports sending Classical CAN frames with a DLC
greater than 8?

If none of the Classical CAN or CAN FD variants of your device is able
to send Classical CAN frames with a DLC greater than 8, then this is
just not supported by your device.

Could you share the datasheet so that I can double check this?

(...)

> Sorry for the late reply. Thank you for your detailed review.

No problem, take your time!


Yours sincerely,
Vincent Mailhol

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
