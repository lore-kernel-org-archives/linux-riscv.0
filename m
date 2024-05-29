Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1B9C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 08:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6vjEoVqPjDoHiZcxl+3ACNRZ6Zv0E1qKzvVNRwiIWcM=; b=yG4BbTs6DExMieZmqtV3n9ZPWG
	yTJZmbiRA8mExFk/R+7Fyqq2Rxm2OhuXS9Z5qQxKCX5zKDgLKkM+/44ekO4Tu0ZTY69Gj+h19rHCe
	TFqc4DYC0RR4+v32SV9vfeeskHG2jNES+68RIRRpWyVGC7iXYbN5Up2qOlMKF6x/UoTczQWVZtRbO
	OECLDxqq3GQPEmDJozxmn1irshBnGQJxQd9Xt/pxyLprS8dPsZ8xlUxCJOPI85ljsU0MmQdN+8iMm
	0TDW1uK3+iBglfTDZr32sfA+t1YG9R8JupowihKIL6V6R73+Hx6UUKoDpbIvUgVLcJ3Moc4H+mImH
	Pk6jN/fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCF85-00000003Y6M-3f1p;
	Wed, 29 May 2024 08:57:53 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCF82-00000003Y5o-2gMM
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 08:57:52 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 258863FE6E
	for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 08:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1716973066;
	bh=7E/ixyFBMdyfw3d95h9lXIVPkbHsrCtTkTVK1phqYPQ=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=RYPmipFThOvRZamXv7dKsE9jv16hu36nElWWZR0hmdeNqjpEcU4PPVIqo2WqS07Md
	 a5olWPRMVUZ9lRWKy/KoM7sueb/E/sYZ1q73ysDX6r7g9GtrmUCzaBGQ2qZMexXV3J
	 2XKDKrPX6Tez5RL2Z7vcZLzUPsadEK+Pg6TsShTxrpLIGMpEtDfqKFdZf0AWm3TMWx
	 DSIlt51COg5wCDbOtLMW39LrpvR2A9VewLABU8m1MvlL+QGHqk60vjEqAGj4Fd4d7R
	 bVvKafUCi2/b+2cJb37EbTEb0qoBrR4FmoUfHCJ0LESbW75qLsP1YDqpvJFSAlMc7k
	 iPufM8nr9fKYA==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-43fb02d8204so20508591cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 01:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716973065; x=1717577865;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7E/ixyFBMdyfw3d95h9lXIVPkbHsrCtTkTVK1phqYPQ=;
        b=IlNpQI4Ibi0PYvDFBTQAefwMzwbRv2Wh2hbiUAh3E7LpZWdtPCnGH8Wy3hRT4U2Z4s
         DFlCSfJpxbDuOhxb/Zuui5m73cjQwYmsEwiLBXd9A/+zgWJeT6PQlaWcBdIZITmgox+r
         +hL8p9G3OUuH9F7ZDJHRzQugE8i8sJZ0aMgkPvgYW2iR0DTauVF99YaqXaSBfjN2Ls+G
         wTwLa3TKVVgv8wRft/eU9mn2wx3dLQctsQgHgr9ovQ51tjheri+JOdJ/KBJjsr/a4Hbb
         GRfK62ApDV4kUua0VFAHeaxIE0rU3Qbd+pHoSqK/1dMmqJctSkIgIXHZ1I5RBqd4DUF0
         bvPA==
X-Forwarded-Encrypted: i=1; AJvYcCULuaPxqV5xPE1g5yJ5OdpkqsMaJ7oyeIRQUGtELA1b6mRJ6Jd5SK4kTZfj1JLGP/NeDHIeUg85EQSxbQB2MGaH3HhB8j6HE5KnH2tRin0o
X-Gm-Message-State: AOJu0YyK5H891ihblz6iGxZohm3Bg6Mj4lK6RjAVBLp1zU2XJmbbGet7
	vuQa/7iL68USnYftkPpX0vU1mb/QATpuuQCUUK975CmUxtNgpLDbcpwKcD3LfMSB5Sh8bNlK1RP
	Xhy3KSyyAv3vrFx7ew9WB51u5lbf96lMJW5PsXfxXbCRv+8fiuqgMMn/5vsE3yPTjfX/nAC8wAJ
	LqVYq25OJnld/b1iGXcwVvlaKXj0ZXmW1W6yNeBgXc2DiBCRMlg1303XV7
X-Received: by 2002:a05:622a:50a:b0:43a:9cd3:7fed with SMTP id d75a77b69052e-43fb0e6de43mr160149141cf.17.1716973065122;
        Wed, 29 May 2024 01:57:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1j+AFmFPVCTE536njafbvZ4XRvDNgWG8gWthUfQYV0su8dbTfEujaBQjWaVYrBYJsDICRI63w3lUZ8Q15BP8=
X-Received: by 2002:a05:622a:50a:b0:43a:9cd3:7fed with SMTP id
 d75a77b69052e-43fb0e6de43mr160148901cf.17.1716973064666; Wed, 29 May 2024
 01:57:44 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 29 May 2024 04:57:44 -0400
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <CAJM55Z8Ce1i==pSUj0z4T2y71g713-675mAYQP5qSN5Euz=rLQ@mail.gmail.com>
References: <20240508111604.887466-1-emil.renner.berthing@canonical.com>
 <87wmo2nmee.fsf@linux-m68k.org> <CAJM55Z-F6N6ua5LoqyMFogDtLp=FaRPoDv4osXFDMjR1b8r9nw@mail.gmail.com>
 <87zfsy102h.fsf@igel.home> <CAJM55Z8Ce1i==pSUj0z4T2y71g713-675mAYQP5qSN5Euz=rLQ@mail.gmail.com>
Mime-Version: 1.0
Date: Wed, 29 May 2024 04:57:44 -0400
Message-ID: <CAJM55Z8Bhv-CSR5PKhFfN7dG-rBcEeH+rmL=i2Ass_QuYtBi+Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] riscv: dts: starfive: Enable Bluetooth on JH7100 boards
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Andreas Schwab <schwab@linux-m68k.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_015750_836565_3274CF01 
X-CRM114-Status: GOOD (  18.85  )
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

Emil Renner Berthing wrote:
> Andreas Schwab wrote:
> > On Mai 10 2024, Emil Renner Berthing wrote:
> >
> > > You don't include any information useful for debugging this, but if it get's
> > > far enough to load the firmware could you at least make sure you run the
> > > version below, so that's at least the same.
> > >
> > > https://github.com/esmil/linux/blob/visionfive/firmware/brcm/BCM43430A1.hcd
> >
> > That didn't change anything (and there are no messages related to
> > firmware loading from hci_uart).
> >
> > [  +0.879623] Bluetooth: Core ver 2.22
> > [  +0.004843] NET: Registered PF_BLUETOOTH protocol family
> > [  +0.008787] Bluetooth: HCI device and connection manager initialized
> > [  +0.021944] Bluetooth: HCI socket layer initialized
> > [  +0.008488] Bluetooth: L2CAP socket layer initialized
> > [  +0.006333] Bluetooth: SCO socket layer initialized
> > [  +0.097478] Bluetooth: HCI UART driver ver 2.3
> > [  +0.007943] Bluetooth: HCI UART protocol H4 registered
> > [  +0.006066] Bluetooth: HCI UART protocol BCSP registered
> > [  +0.006962] Bluetooth: HCI UART protocol LL registered
> > [  +0.000015] Bluetooth: HCI UART protocol ATH3K registered
> > [  +0.000084] Bluetooth: HCI UART protocol Three-wire (H5) registered
> > [  +0.000247] Bluetooth: HCI UART protocol Intel registered
> > [  +0.000455] Bluetooth: HCI UART protocol Broadcom registered
> > [  +0.000084] Bluetooth: HCI UART protocol QCA registered
> > [  +0.000008] Bluetooth: HCI UART protocol AG6XX registered
> > [  +0.000057] Bluetooth: HCI UART protocol Marvell registered
> > [  +0.051854] hci_uart_bcm serial0-0: supply vbat not found, using dummy regulator
> > [  +0.000387] hci_uart_bcm serial0-0: supply vddio not found, using dummy regulator
> > [  +0.094658] hci_uart_bcm serial0-0: No reset resource, using default baud rate
> > [  +0.990297] Bluetooth: hci0: command 0x1001 tx timeout
> > [  +0.022893] Bluetooth: hci0: BCM: Reading local version info failed (-110)
> > [  +3.306159] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
> > [  +0.013336] Bluetooth: BNEP filters: protocol multicast
> > [  +0.124262] Bluetooth: BNEP socket layer initialized
>
> Oddly it doesn't work on my Starlight board either. I was thinking the firmware
> might set up pinconf differently, but comparing
>
>   /sys/kernel/debug/pinctrl/11910000.pinctrl-pinctrl-starfive/pinconf-pins
>
> on the two boards shows no differences. I've also not been able to spot any
> differences in how the AP6236 module is connected in the schematics for the two
> boards, so not really sure how to proceed.
>
> If you're also testing on the Starlight board then I can update the patch to just
> enable Bluetooth on that I guess.

* I meant update the patch to only enable bluetooth on the VisionFive V1 of
  course.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
