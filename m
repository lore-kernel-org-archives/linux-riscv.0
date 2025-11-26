Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CFBD10F4D
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 13:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bof4Ha0ntXn5ehfiaABq2NfM5P9/kcV+9UPgdDnz228=; b=N7IUbwBfdUhrcN
	PvnVlpoARmizqHUqfLmodwtLyfzTDBzS9URPva7XzGRoy5EWMw0DkII9fk0cOar28iOJjsKCMmemW
	C7Hcy7Kly34LyEwubVX5dz/GD1iMDPQ9Htve68ZwC3d8+putKcB9X5/eovejIChd4T1zksh5zBaKl
	LDYXvJMsZRTf9ExItmDtUwSYzsfhaw4Us645265gvNakf96lviQa/hcTh5Qz+m4YAyOUAT8TTc7/s
	oFnJ5WBhIsBXV5qMp2ZazVUVaDP7uERIzIArhxFxRoJRjQm9/sVi4iczR6LSywZW98B84dAELB14T
	e+05xvcR6tSDDF8c75Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOFt5-0000000F3dy-1HxQ;
	Wed, 26 Nov 2025 13:48:51 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOFt2-0000000F3d7-2BWw
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 13:48:50 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9740840F20
	for <linux-riscv@lists.infradead.org>; Wed, 26 Nov 2025 13:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1764164921;
	bh=8tSDiXim3QR/kaoDLnnxSME/024paOOB5M+joUFPjK8=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=mvoJ4JSliyZnxMAksL+FDe/U5EMZ7XXFCqAfES7bLPu7ajTbgCETuI7FDOYiv4WHn
	 ZkrmGYuRygk3UMb9edioUgHYKFvOiQBdFsEFI8Ic7XyFPigis12qt+JfB5DsVQp9AA
	 S9O6VGR1y5n0F6d37mbKHvY/TrJsICQqhc5JyIMK+rqhD6B1efYQ0RRyZw5CyY88TS
	 yd23hkmbRdDfRCKHg2MecCCFEm5QlMSF392nLgySsbttU5ZL4PBQe62zd2x151j6hA
	 o2PqfKoUTe9CCdHjKCH/fWdN06atW7/LHvqVokQoacwBwV3tVKdbRegFZqpK8bgLhe
	 0QP88uIFzA5B9TDi5KZBT9SMW4GYvUp3bsn75praNmDbBgd0GgfbKR1BRh47TlU4v6
	 n7MJNjqvua7gYY604/PwFOUF8DLpQx0k4RA0/gsg8bgknYO4H2KqSjRMl86Z7LBOFZ
	 Wr7w8BGxkI1dTq3ZKd+/P55VTLIMWA6JYN5Q2s4f2EU23KlGJ8JsNdb1vAX/rZLRKh
	 WcJCHrz0Gca3IPEu5r4oaRdpsnnJw8DmOlMeZNAO3+e7W16jR6QSmmToYsIjBwgZef
	 lju+p3KVTfcoNy5uYhMdmqoViHXPv7zkk9wrhAOYnUg34xobaY5VELCXdLAiplriau
	 6fbGwYCmeR2ACPCZ055uJ02g=
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b73599315adso521701566b.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Nov 2025 05:48:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764164920; x=1764769720;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8tSDiXim3QR/kaoDLnnxSME/024paOOB5M+joUFPjK8=;
        b=nYqxmFkzJMq0/E+KTh6KrUhpRroCI0GKprRQ61rRCQAj2ku0jTrEzoxHITV3bC3mbJ
         eyXiFGqh+PAW9WQ44B73OK76DKhU3N4nfhKbVyUPK1G8SGuh2u9sRUEjHU0jVNzngg3N
         MzsL3ulFf34sSB0yMPog2JOruRDu6N2WdYTrF5VAxV8xY8HmV5WRjg31WNKQeQhaeXnP
         2HIioFXzbVWYH1KAPG7hPupPOG5bpIBG/HDgEOL29eZmszre0VoNvrEWjhATH9cKPlTJ
         Z9axMEVSmor6gOliYgiyxSSNvsc/afzuYyFm7vnt2oVfm6BXXNNjW6brPKesOh+yS0nV
         gEew==
X-Forwarded-Encrypted: i=1; AJvYcCX//c7x9sM2lql524d25Th8CNpzLbUUur1lFiAJaQdN7jpZxRlQcu74o0rsXtRCw+Ev9YXkDr0pX/s+PQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwP77/23MaoPf7dNQ2w7gn/ZRC0bItZdg7oDWoj8erH3ieURXus
	eRQvXty229cpWM7wTMQP7F4SLdETyhcnd10oO30mNhN965DjGnPeEYlrZmAQdmj7u70cQiK9Yqc
	Mpb5a4FwWZMqI9h2tlf7xuvMVbJurr0ZpchhmR7/VhbddmLjKavvaAbzcBqNULd1geNscVtXzU8
	tEqoZJyekIikwUQL/QoIbR9bk3VAoEQHfuv247YmJcGa/iz0ovHQa5NIAh2Of9
X-Gm-Gg: ASbGnctrSfofh03l21GmpK2ExDNr+K7kJISOSHzzKqH13YFj+JktpydT4F4mb/8NB06
	sgbs7sqI/3Bp+SQFIm+pyvWhYX2VKaA70HoNpJpwgdZ0siUmIdAl55/myKr9WHgvHpk8n02OSYA
	4E3r6F6IlSbuS418JROutOcl6k7wcb3ruNtPZO75fGn5gDqohT5MnIixlDF1qzaUgKUj8qjAANi
	1VXNGC7BoeD0rZpKQsSfyE=
X-Received: by 2002:a17:907:747:b0:b76:4c16:6afe with SMTP id a640c23a62f3a-b76c5515075mr805408466b.28.1764164920238;
        Wed, 26 Nov 2025 05:48:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLKHFKjeNKFDLBCWuoLI7LoCDiBUNTGNnjw3M0Z7AUZP+8akQ8XWy4+nFsuyFOyeVAq6RuchgQ7gQPdfGCxms=
X-Received: by 2002:a17:907:747:b0:b76:4c16:6afe with SMTP id
 a640c23a62f3a-b76c5515075mr805404666b.28.1764164919793; Wed, 26 Nov 2025
 05:48:39 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Nov 2025 07:48:39 -0600
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Nov 2025 07:48:39 -0600
MIME-Version: 1.0
In-Reply-To: <20251125-maternity-undercook-b63205b44225@spud>
References: <20251123225059.49665-1-e@freeshell.de> <20251125-maternity-undercook-b63205b44225@spud>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Wed, 26 Nov 2025 07:48:39 -0600
X-Gm-Features: AWmQ_bkXGhgpYrjkoB-2nJZAemu3rGwCX0x-Yw6XhH7TYjeF556-OBtAsCt56vQ
Message-ID: <CAJM55Z92+ceFXgh-0U2vf-8Rzs003RPD2X=spAMM8dbK=YtxAA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] riscv: dts: starfive: Add OrangePi RV board
To: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Conor Dooley <conor@kernel.org>, E Shattow <e@freeshell.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_054848_967945_4A174417 
X-CRM114-Status: GOOD (  14.68  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Conor Dooley (2025-11-25 23:24:37)
> From: Conor Dooley <conor.dooley@microchip.com>
>
> On Sun, 23 Nov 2025 14:50:43 -0800, E Shattow wrote:
> > Icenowy is busy and so with their permission I have applied v2 review
> > feedback. Additionally I revise the commit messages. This should now be in
> > good shape for -next
> >
> > - E
> >
> > Changes since v2:
> > - enable active high mmc1 card detect gpio
> > - drop delete-node from mmc0 reset pins following commit fa939a287224
> >   ("dts: starfive: jh7110-common: split out mmc0 reset pins from common
> >   into boards")
> > - sort phy0 properties rx before tx
> > - revise commit description of SoC peripherals as list
> > - revise commit description of compatible binding
> >
> > [...]
>
> Applied to riscv-dt-for-next, thanks! I know I mentioned waiting for
> Emil, but this stuff is actually fairly simple so I just went ahead
> with grabbing it.

That's fine thanks. I was under the impression that this still needed some work,
but it seems like you've fixed it up when merging.

In case you still want it here is my

Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
