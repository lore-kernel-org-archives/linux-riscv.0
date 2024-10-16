Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9C3D206B3
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 14:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DKeps2Pc1WP1SilLhxq3NIShAhhgqN1hOTDQgaeSNb8=; b=Gh2Cu3GHBzEDOV
	UOgPNy6lmawApHRN8yz/IzZ9C3XDFsgBV5ONkmRLzEATiRJMimkK7cCrBZIAo+d5K86W0izqKgqAY
	s9tLGqVozQGIhj8wqsXXiN9RZOHf8vwIHf1RozLDnIbRTvNXT6tjzmykAL3hnlpPkASRC13H8G+zX
	uJU8r62n6zwVgXtjsx0FzLRSSRPX+auzNZPlUvpeAtGriBLkFh53viipx97U+qPqOfUfu2GLttzgT
	zOd3oO+UNnOIgE2a3YdNXPtgQ6kEHM+/oH1VNX0kglpFM/gYaUAjjAV8JcnOL05v3p/vaq5Yny/kx
	sFG9zg/oXXGiJNRKd/Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t14p3-0000000C2Wn-0Mn8;
	Wed, 16 Oct 2024 14:16:21 +0000
Received: from mail-lf1-f48.google.com ([209.85.167.48])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t14oy-0000000C2UZ-3I7S
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 14:16:19 +0000
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539fb49c64aso4762204e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 07:16:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729088174; x=1729692974;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zji2jjc7lmYCBaxDKjU5IirMGrQxMUOMfum9ROWevj4=;
        b=H3dfpo/X11Sy7qwb/1q0mUrM5RIxzT9fWAPPF4YSF+Ihwcc4zcIlPAs6If0IJtOKHa
         bN6HyaAQX1Wi73cG/pT/PHz4++sXQoe/8j4O0c8JoBPAa95cmZ6ybJK9ht22B8qU/z2G
         9h3ndpNRsSUVqlvlk6hONjJA680BCmEF8uOEf6sLfIYhwfcm+HiDwCWHBkK3AvH60PEs
         FfLrNuXxf5QWYM6DmO9UK7EIF7dytCBCdS6Q2AibJ5C9vme3UM3ROyvUme7LDEP8opDv
         so6cODfsTMh1EGgy0u/Z6k12Ew5JkcyHXsGC73mJjwPNin7p5qmwT7Yr6r6VyGPKNDtV
         NkDg==
X-Forwarded-Encrypted: i=1; AJvYcCUY5LU+U59C/69gzriAjQqkWP6vv006qe+cJlK8HkSZ1J0e7Zec/uDAUP42QjByolD84YG8YoQKXlIddQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9I3CgqxkZTQGjhAG7maVk0mpaMNbLPaYbbsIxRqGj9jnNlIDO
	kJIdmnRxHntXxdXyczwauWBszG/Q88lHavBEU5rBFvmi8ah7c+3P57DmZx2NAkSMUvp6fe6wqdL
	K22Fvivsm+oN1KeO9J6uCWhAmoII=
X-Google-Smtp-Source: AGHT+IE98DjXYsvonEn7MnmPN+JCagURuswXEjP6x9DsDz5MmxRBUXYi+4++5nWYQ8Ogm2EWnbuG+myw2gPNuaM96Gw=
X-Received: by 2002:a05:6512:1598:b0:539:905c:15c5 with SMTP id
 2adb3069b0e04-539e5521da6mr11043400e87.35.1729088173959; Wed, 16 Oct 2024
 07:16:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240922145151.130999-1-hal.feng@starfivetech.com>
 <20240922145151.130999-4-hal.feng@starfivetech.com> <CAMZ6Rq+EM37Gvx8bLEwvhn+kUC9yGDiapwD0KX31-x-e-Rm3yQ@mail.gmail.com>
 <EAC60558E0B6E4BB+e5384c3c-ba45-48f5-a86f-a74e84309a14@linux.starfivetech.com>
 <CAMZ6RqLvzvttbCMFbZiY9v=nGcH+O3EV91c+x7GxTbkKhdTcwg@mail.gmail.com>
In-Reply-To: <CAMZ6RqLvzvttbCMFbZiY9v=nGcH+O3EV91c+x7GxTbkKhdTcwg@mail.gmail.com>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Wed, 16 Oct 2024 23:16:03 +0900
Message-ID: <CAMZ6RqK428Pvwrgc=KPKjetZaTC8R55HzypMooOTziM8eMMxHg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241016_071616_846179_E089EFB7 
X-CRM114-Status: GOOD (  25.10  )
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

On Wed. 16 Oct. 2024 at 14:05, Vincent MAILHOL
<mailhol.vincent@wanadoo.fr> wrote:
> On Tue. 15 Oct. 2024 at 18:33, Hal Feng <hal.feng@linux.starfivetech.com> wrote:
> > On 9/23/2024 11:41 AM, Vincent MAILHOL wrote:
> > > Hi Hal,
> > >
> > > A few more comments on top of what Andrew already wrote.
> > >
> > > On Mon. 23 Sep. 2024 at 00:09, Hal Feng <hal.feng@starfivetech.com> wrote:
> > >> From: William Qiu <william.qiu@starfivetech.com>
> > >>
> > >> Add driver for CAST CAN Bus Controller used on
> > >> StarFive JH7110 SoC.
> > >>
> > >> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> > >> Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
> > >> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > >> ---

(...)

> > >> +
> > >> +       if (priv->cantype == CAST_CAN_TYPE_CANFD) {
> > >> +               priv->can.ctrlmode_supported = CAN_CTRLMODE_LOOPBACK | CAN_CTRLMODE_FD;
> > >> +               priv->can.data_bittiming_const = &ccan_data_bittiming_const_canfd;
> > >> +       } else {
> > >> +               priv->can.ctrlmode_supported = CAN_CTRLMODE_LOOPBACK;
> > >> +       }
> > >
> > > Nitpick, consider doing this:
> > >
> > >   priv->can.ctrlmode_supported = CAN_CTRLMODE_LOOPBACK;
> > >   if (priv->cantype == CAST_CAN_TYPE_CANFD) {
> > >           priv->can.ctrlmode_supported |= CAN_CTRLMODE_FD;
> > >           priv->can.data_bittiming_const = &ccan_data_bittiming_const_canfd;
> > >   }
> >
> > OK.
> >
> > >
> > > Also, does you hardware support dlc greater than 8 (c.f.
> > > CAN_CTRLMODE_CC_LEN8_DLC)?
> >
> > The class CAN (CC) mode does not support, but the CAN FD mode supports.
>
> So, CAN_CTRLMODE_CC_LEN8_DLC is a Classical CAN feature. Strictly
> speaking, this does not exist in CAN FD. Do you mean that only the
> CAST_CAN_TYPE_CANFD supports sending Classical CAN frames with a DLC
> greater than 8?
>
> If none of the Classical CAN or CAN FD variants of your device is able
> to send Classical CAN frames with a DLC greater than 8, then this is
> just not supported by your device.
>
> Could you share the datasheet so that I can double check this?

I received the datasheet from a good samaritan. With this, I was able
to confirm a few things.

1/ Your device can support CAN_CTRLMODE_CC_LEN8_DLC:

This is shown in the datasheet at:

  Table 3-52 Definition of the DLC (according to the CAN 2.0 / FD specification)

DLC values 9 to 15 (binary 1001 to 1111) are accepted by the device.
When sending and receiving such frames, can_frame->len is set to 8 and
can_frame->len8_dlc is set to the actual DLC value. Use the
can_cc_dlc2len() and can_get_cc_dlc() helpers for this.


2/ Your device can support CAN_CTRLMODE_TDC_AUTO:

This is documented in the datasheet at:

  8.8 TDC and RDC

This will allow the use of higher bitrates (e.g. 4 Mbits/s) in CAN-FD.
You can refer to this commit for an example of how to implement it:

  https://git.kernel.org/torvalds/c/1010a8fa9608


3/ Your device can support CAN_CTRLMODE_3_SAMPLES:

This is called triple mode redundancy (TMR) in your datasheet.


4/ Your device can support CAN_CTRLMODE_LISTENONLY:

This is documented in the datasheet at:

  3.9.10.2. Listen Only Mode (LOM)


5/ Your device can support CAN_CTRLMODE_ONE_SHOT:

This is documented in the datasheet at:

  6.5.3 Single Shot Transmit Trigger


6/ Your device can support CAN_CTRLMODE_BERR_REPORTING:

This is shown in the datasheet at:

  Table 3-24 Error Counter Registers RECNT (0xb2) and TECNT (0xb3)


7/ Your device can support CAN_CTRLMODE_PRESUME_ACK:

c.f. the SACK (self acknowledge) register


So your device comes with MANY features. I would like to see those
implemented in your driver. Most of the time, adding a feature just
means writing one value to a register.

Please let me know if any of this is unclear.


Yours sincerely,
Vincent Mailhol

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
