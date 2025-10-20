Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270CCCCD193
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 09:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kn4YuRL5RHW0jyVyei455U/WjH/Ye+z+UfePRdBLaFQ=; b=hVbuXKjM9r2jsS
	BnLj6qtWaHcywBnk9sn/bxQ7ugKtpqI/uGf65gPmzHSGI516r31QBTy2COy369Lj6nYHjes7P8sLU
	HTODN94N7OxnYiEkm59RxUqJTF1yTGNI/mnP8qWJBePwNxaM8cwSlFbbgJbie0EaWWs9rYOz+J7iL
	R9WcIDFS/T9tfD43YXmFw1Z1A2dp5rtCSw2vgZCo+8uIyNOFHCRaNVB2ZIk0oP3aEV1eESiCmDyOk
	M5Rcpx+txajCfMkztypcHpfF0DdBVpNzksoriwf9wp0S//JTTwidr0dI716X4i5VO9tVzW4siSRf8
	/VBJPzkxGOW+D45h20jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmbp-0000000CfjC-1WbA;
	Mon, 20 Oct 2025 09:55:21 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmbm-0000000Cfi6-1xfO
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 09:55:19 +0000
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 390D23F596
	for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 09:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1760954112;
	bh=mEBranLPBa0mzFLmxRJ9fx9ZSptWmlBhnJV3QiXyr/c=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=GPnV7rh/dePfS0J50Fc0Z4tT3PWiNoALYZOmqlmwpsE7kTC7+JLZdGnlRkHZACdmK
	 gPGvl777plLiTKZleZrukEfx2LMdbjkhWsxVxqXvgmgOJLA3THwM8wt7e5u7yMrFdg
	 AiDa1JS6RCymOFQSdhXtCqgM5Atula4LZDEhnZT9gFG6xyxusaO8Pr+Xv1tSxGdKDa
	 rvBYqBIdRRt0sX/U8MvQxARw5oXcUTTAFVji3y9Rbrsp7kFnlXIMUjPkKGnX9lhWMQ
	 ITV+R6TgoCnAQft3waRpfeCOZPZybMU000c73ebmCb+qlLf6g1DZ/HMQ530V6IGydD
	 lfC6qmiT6ICf4JWduJ579SqqbN7wJ2MpOgG1uwLzEzjsz3AOc2vgLkAmeh/TZRmQgS
	 +4CIe/U1WXsNKSapdVn7bzf87OR+5U4WJzPLHpNey0Ru2X/J+6a2vbtbbBYkVzmFW5
	 bzujJYBx5FiuUlXhCJjioHPOv94xjjpeT7lH/6+OxC5tGWl9by8lCS58CfTpIIRcjH
	 Ktn2RvRzUcuCB8wH82WeINzACHjb5jp7iNtv4sHUrO2sqan1N/bMeluOBhFGhlzexL
	 +dshKWXCQ6emtdot8ttdXM+4jfMIml2qcvsP/gAWxmWDWulQCgN5XUjPOAGLcgg58R
	 urERqNaGd+IPIODJsSHkIGMs=
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5a176319aafso8111938137.1
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 02:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760954110; x=1761558910;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mEBranLPBa0mzFLmxRJ9fx9ZSptWmlBhnJV3QiXyr/c=;
        b=okUzG2fGTFiBtPkd1ja7hLb+ZROO3FzEW6H6DLedVLQccmIKgCnfrZdN/ZCMsimilE
         S7c2C0ug2TvwP2a6Q0ZL1vJaUx8paCsRbY1MgB5hgaiXJjNwKoXZNaPUJcNtzeOp/ADT
         G9AzMp/oc26vLWQVDRi3YRFkZTyePgVyf+IF7K/XZ/ndesnM6tuuR7a2OIeFqbuq9IGz
         ZF+ynDydK8qcRXXGEUHks6ljlOH+XPXrEODUMBheSKKu7o79a82Nn/DG2ex1sVr8uzsp
         +jdKtopBNIyzMe/EJpjDmc9rrhI/4KXGE8FNWlUw/3A/8GqW74xNEtdrJBqZugIJCsXN
         Pnsg==
X-Forwarded-Encrypted: i=1; AJvYcCUhDvUFSDRYX5MgVp6ZuEZB2Ity9/3GHyz9oHNaeutxv71bSi7Ja+DF6mvWdDzhKkNxct8aXjZGMAKXrw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCx/OGMXmIp7RtoJPMkfkIr5VRRzrlp6zS4u0Jn87TkUL09wvC
	5OYX2iQo1CJVqxDNPbEd5eyaMnF8xHTzzxkihfSPRTzAL0Of+qJyAsoF96jwvD8BAJDOlMDN4xv
	4nR9534hq6jY3s1FkEML3LNjyDFz0R5YzCdn3WqIinxj7UILsus/aWGASaRZUEfI0M9Uzz7N3El
	sbh/JxFLYYloeiQUy2K95oZ4RJ8F33yfcYSQTnJ63b1bpi65u9wkNMJKquyzER
X-Gm-Gg: ASbGncs2z5Y0Y0k0vUYtzXi44d0/HLMlQu6/ZxdnLlqrMJBCxfUHx1j/4Lpw2iUcnK7
	IwoSApM+8lfHNxyZ12NkQ8yIBLrM6iAhl99sLpSAxPq7lKaj+vdXrGsp7VIbOEZnCaCbym4HKcW
	XDcXr+DMIW106mqjPabPzxh2eOE9sJTwydKvrYGl0HRfgSYduo4A8ONg3xNtiNhZaPLBC+hDBRQ
	gE2JFBEsSlD0sGT
X-Received: by 2002:a05:6102:2c8a:b0:5ca:714b:2dcd with SMTP id ada2fe7eead31-5d7ce77b197mr5090708137.10.1760954110387;
        Mon, 20 Oct 2025 02:55:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8U9dwM6qULSdCBv1qTum4Bp6zRtcLVxnBY4adzvxZNg4OxsHj3q1MDPNwZUFy1CWdBXERfTMV4CjpVWjcmns=
X-Received: by 2002:a05:6102:2c8a:b0:5ca:714b:2dcd with SMTP id
 ada2fe7eead31-5d7ce77b197mr5090696137.10.1760954110055; Mon, 20 Oct 2025
 02:55:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Oct 2025 04:55:09 -0500
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Oct 2025 04:55:09 -0500
MIME-Version: 1.0
In-Reply-To: <aPXAyeDC7YXAketm@aurel32.net>
References: <20251019191519.3898095-1-aurelien@aurel32.net>
 <20251019191519.3898095-2-aurelien@aurel32.net> <CANBLGczi3GeaC4aWECV8NS-zqSHgRa-5onynz9fGsZeN8qgysg@mail.gmail.com>
 <aPXAyeDC7YXAketm@aurel32.net>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Mon, 20 Oct 2025 04:55:09 -0500
X-Gm-Features: AS18NWArKI2YauisXr79VuYk9B-KtJdQQBJvjv4Xg4AX0iHaDUW4DU_PmGIO6p4
Message-ID: <CAJM55Z_BzfRo5aKf2VrneTymSizwDQq6OfMK_LNgyoGjp43K8Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] driver: reset: spacemit-p1: add driver for poweroff/reboot
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_025518_698639_FEE7E38B 
X-CRM114-Status: GOOD (  17.55  )
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

Quoting Aurelien Jarno (2025-10-20 06:55:37)
> Hi Emil,
>
> On 2025-10-19 22:53, Emil Renner Berthing wrote:
> > On Sun, 19 Oct 2025 at 22:34, Aurelien Jarno <aurelien@aurel32.net> wrote:
> > > diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> > > index 8248895ca9038..063202923d95d 100644
> > > --- a/drivers/power/reset/Kconfig
> > > +++ b/drivers/power/reset/Kconfig
> > > @@ -283,6 +283,15 @@ config POWER_RESET_KEYSTONE
> > >         help
> > >           Reboot support for the KEYSTONE SoCs.
> > >
> > > +config POWER_RESET_SPACEMIT_P1
> > > +       bool "SpacemiT P1 poweroff and reset driver"
> >
> > The driver code looks to be written to work as a module, but here it
> > says "bool" not "tristate".
>
> I have just tested to build it as a module, and it indeed works that
> way. I'll change that to tristate in the next version.
>
> > > +       depends on ARCH_SPACEMIT || COMPILE_TEST
> > > +       select MFD_SPACEMIT_P1
> > > +       default ARCH_SPACEMIT
> >
> > If it does work as a module I'd prefer "default m" here.
>
> Do you mean "default m" or "default m if ARCH_SPACEMIT"?

Just "default m" should be fine since the driver already depends on
ARCH_SPACEMIT, but the 2nd version is more explicit.

A quick grep doesn't show an overwhelming majority of one over the other, so I
guess it's up to the maintainers.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
