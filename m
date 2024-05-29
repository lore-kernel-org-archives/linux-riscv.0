Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FFCC25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 08:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kax0XJKtdSfFZS7eMEMEbB7VAcyKbpRAhPXNLupS72w=; b=PmhKm2VX9r0SuByZDzz3ZAJn/S
	geldv6SfyV/UaUGauQ/xMfS10CQWeMdzJ9IfS2qr7EUFpL77yYV+L2xgrgc/mXmfqT5T6vd1+Zcjv
	1Ajw3/N4ZG4ZSZvBLmldVVCf3HsvxDyRLjVvjAzVtFCTDIm77NSN3XahS1Za58mv6PlzpRLeVkJJE
	gANhMeMaLVFIQsFtczifMpAMB0VuoqE/lpL6rOrfA+Cjv5Hmj1r5SaXrqotFvDsVCgdpjBTpDJICD
	DZuaby+4BPCmmi4ArezDq1KqzrnOL10/Lt6/BUlDk//Xfp2GM7VN+Q/NvLcRXHb9RH/Jlw+l7bCCp
	gJRapxjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCEzk-00000003VtC-3tAH;
	Wed, 29 May 2024 08:49:16 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCEzg-00000003Vou-2fT4
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 08:49:15 +0000
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DFA923FE69
	for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 08:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1716972546;
	bh=EJ2t9GtZmp+s6cfLA48Ay8n38h3UwJsqAm7P3XzHLVk=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=U8qwZoQ+HFrFEfg/08soGOR8WBdcPCFgZ10+vA+S89djPvfBw1ClP3ArxDf5dc481
	 7yyS4gLfzDoxrWf8bKZHwDdH4WhKdfR8kUKPHO+HjhMgqjMLFPb3GO6icKAfMsxu5F
	 cG64C1LQUlNSBUcFGvpWEO3W5dyH8xTrWEgw/8TlHCv1CcCV/5F7XHreI5uKhxbUgS
	 VlQxdiHdWhD+jgnxqPpTAW4ybIRxO2KlSQzPMW7x427lwaUxmjIv6bO28B2d31Fh6t
	 feGcTlnkxNrTq2pjI+Oj7YoOdehBYgu47canUh7ImDyO+1tX6Y3DOV/kRag1dViaMI
	 FQvYi+KBccGEw==
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-804cb147fe3so455963241.3
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 01:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716972545; x=1717577345;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EJ2t9GtZmp+s6cfLA48Ay8n38h3UwJsqAm7P3XzHLVk=;
        b=kWG85/2SkVH5uaZiTd+NtjkMqerJ4VLPBZQ7Qq2BYv7OIJI8HFebelPZmSq7+hxVUE
         KT+yJhpGGmqifirFrXwgJwBkHSaru6X7DaaNU7GyEKiCipvgWhPloieXsFU+m/NHIZ9W
         y/x1A628EvyoV7vI4AS3XDwu5q2FgA/Ps2VFlvLyHBRDtvv7FORqcbndWdGJ0Pnjk0rp
         T1A5PelBZqxrOVTiuS4KMi21SHqPUEOQ8hJbGPekI3mRWIhjEFAapjkmlLCdNUFfzzfO
         7/j8xDYQiKnSgHBX31SEKw5Ulv94FP6PstRZ9QhKMgk1vqDlMyuBTb564aizfXuwG/cM
         RGOw==
X-Forwarded-Encrypted: i=1; AJvYcCXNukCEjyOQiIJvzaNFN130gEyMWk2kogkqlVA7AapSW16ePLaLQ4miGOm8R+O37L0QLxTQk8zZfXZxaEN0cu03EAKPXRobBR4ULpcCBtTL
X-Gm-Message-State: AOJu0YyzyW/pj/19BLsqXh7rlcDMkWC0e8MsmE/qQfIPVQ9/oKBML3QP
	pfRkKuOaetuEWywPu8nRHD3oPMgKBKNpRepuoGs0B/iXEMrU7Z3L9rAP7doEPUiyD8jJnOqoxMg
	j8i4AkSC2KQYemWK9lJsnX0NU0ChyZDmWKl1emMYSVq1witumysqPBVbiOLaqAmgmPNc+hDZRog
	4zbsg9XkeEcmbYp1C5BCZ7jQaV1YWRMSuaWomaXfn6e2ZLE6vSFeRtFS5H
X-Received: by 2002:a05:6102:512a:b0:48b:8bd6:1a59 with SMTP id ada2fe7eead31-48b8bd61bfdmr7190099137.24.1716972545017;
        Wed, 29 May 2024 01:49:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwpijt0PsidAXBp+RcaLzwT5vMVN002Oe/FiayvOw00xh/Jrg4nuJALXiWsepj1/IQE/b8s7BaI+i4L1m2fO4=
X-Received: by 2002:a05:6102:512a:b0:48b:8bd6:1a59 with SMTP id
 ada2fe7eead31-48b8bd61bfdmr7190044137.24.1716972543771; Wed, 29 May 2024
 01:49:03 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 29 May 2024 04:49:03 -0400
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <87zfsy102h.fsf@igel.home>
References: <20240508111604.887466-1-emil.renner.berthing@canonical.com>
 <87wmo2nmee.fsf@linux-m68k.org> <CAJM55Z-F6N6ua5LoqyMFogDtLp=FaRPoDv4osXFDMjR1b8r9nw@mail.gmail.com>
 <87zfsy102h.fsf@igel.home>
Mime-Version: 1.0
Date: Wed, 29 May 2024 04:49:03 -0400
Message-ID: <CAJM55Z8Ce1i==pSUj0z4T2y71g713-675mAYQP5qSN5Euz=rLQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] riscv: dts: starfive: Enable Bluetooth on JH7100 boards
To: Andreas Schwab <schwab@linux-m68k.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_014913_002240_1E3915AE 
X-CRM114-Status: GOOD (  14.61  )
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

Andreas Schwab wrote:
> On Mai 10 2024, Emil Renner Berthing wrote:
>
> > You don't include any information useful for debugging this, but if it get's
> > far enough to load the firmware could you at least make sure you run the
> > version below, so that's at least the same.
> >
> > https://github.com/esmil/linux/blob/visionfive/firmware/brcm/BCM43430A1.hcd
>
> That didn't change anything (and there are no messages related to
> firmware loading from hci_uart).
>
> [  +0.879623] Bluetooth: Core ver 2.22
> [  +0.004843] NET: Registered PF_BLUETOOTH protocol family
> [  +0.008787] Bluetooth: HCI device and connection manager initialized
> [  +0.021944] Bluetooth: HCI socket layer initialized
> [  +0.008488] Bluetooth: L2CAP socket layer initialized
> [  +0.006333] Bluetooth: SCO socket layer initialized
> [  +0.097478] Bluetooth: HCI UART driver ver 2.3
> [  +0.007943] Bluetooth: HCI UART protocol H4 registered
> [  +0.006066] Bluetooth: HCI UART protocol BCSP registered
> [  +0.006962] Bluetooth: HCI UART protocol LL registered
> [  +0.000015] Bluetooth: HCI UART protocol ATH3K registered
> [  +0.000084] Bluetooth: HCI UART protocol Three-wire (H5) registered
> [  +0.000247] Bluetooth: HCI UART protocol Intel registered
> [  +0.000455] Bluetooth: HCI UART protocol Broadcom registered
> [  +0.000084] Bluetooth: HCI UART protocol QCA registered
> [  +0.000008] Bluetooth: HCI UART protocol AG6XX registered
> [  +0.000057] Bluetooth: HCI UART protocol Marvell registered
> [  +0.051854] hci_uart_bcm serial0-0: supply vbat not found, using dummy regulator
> [  +0.000387] hci_uart_bcm serial0-0: supply vddio not found, using dummy regulator
> [  +0.094658] hci_uart_bcm serial0-0: No reset resource, using default baud rate
> [  +0.990297] Bluetooth: hci0: command 0x1001 tx timeout
> [  +0.022893] Bluetooth: hci0: BCM: Reading local version info failed (-110)
> [  +3.306159] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
> [  +0.013336] Bluetooth: BNEP filters: protocol multicast
> [  +0.124262] Bluetooth: BNEP socket layer initialized

Oddly it doesn't work on my Starlight board either. I was thinking the firmware
might set up pinconf differently, but comparing

  /sys/kernel/debug/pinctrl/11910000.pinctrl-pinctrl-starfive/pinconf-pins

on the two boards shows no differences. I've also not been able to spot any
differences in how the AP6236 module is connected in the schematics for the two
boards, so not really sure how to proceed.

If you're also testing on the Starlight board then I can update the
patch to just
enable Bluetooth on that I guess.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
