Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350F8CD4851
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 14:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x7kjd6SgFrNy+HoB/bgDG0M1Vwj7sxMH4lLKEMk7YLQ=; b=BYz3BRzrrgwANM
	da6wH/mFs3ECpe1vkvlr31VvNkt+ntid/4dlL32g1X27s/WEx9K58TFYDyIO7K/wB8jDMl7R0HmFj
	ABUz5xDiEk5ftx3VRxoHayXj8Ly/hL1uEcDXo90WwOOpUXjkJEJjjLTiseAgp4FjRrREkKtwTI53o
	JJ4Dh+mxr7H6Y/xNGRJcLTMJfiTJ6xQcxhZQRVN/4cympX0DfBlU/rQq5oyUt8Rir5QVevoA5Y6gk
	OgDtma79J0mpBp3bC6Fpq7hGFhSrb36o1JltJi5YZsYqUWNrbtpxexVGap11mgmA/oNrplA/jH4+B
	vb8QL6Bp/quEXL1y5oGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAkY-00000002xIm-0NOv;
	Wed, 13 May 2026 14:39:50 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAkV-00000002xHs-1Usr
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 14:39:48 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-bce57c132b2so573989766b.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 07:39:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778683185; cv=none;
        d=google.com; s=arc-20240605;
        b=N309iq/qNT4bQmIzFKr6hIZJ3xtI2wtUzIWBYtnxHwYRGiMmS6w1Ebiy6BIM3m3gy0
         XS0rT6YpZS81o+DvNGgi6WsLMBV0nPTSYcpIjiDUQXre5qPooBTSU/6U5G7+zgtuzSUc
         FdNM9ipcZRa+02L6u/8gkYiA7mDOufrm8dLUg1zCuntg90JH7NmorV4ZMMmgFMgpHt57
         RpURa9baboQByeJaCwkZYHm/fP6+/LouXtKnkgSo37uYan5+oTCSslOHMEWP2ryXyxx0
         90qpL8KAi4KEPOeSbUdmMCNP/TCU4i/vIS3QiWKXL6VElIMinBhAAcePFd9tkzefDRgq
         FEfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OaBPAaai2do6tTEr5ZFJIJdibTEdzt3Q2IEnGfklUBk=;
        fh=aIeKituxQk8yITLqRxhBB1cAHI4zAoPvAXoNxYwPLxI=;
        b=KCokejyIlIBrRKtozofCDcXZEjReW4a3hY+sTbjlQPTRAlOEX3TU+CWI/DohuwWoKU
         5tg58if0RnLk5TxsrpzOXvaBWqPQ5qa3xXS2n8hDYXnq8m2jpRggrMAd6+u/vdHkRMSJ
         KCDPqb0JpX5Uwjwp6oIGJrxpG/HCbvX/CCDDXovGjnSbAZu1LCST6/qYDqVjOipCIYts
         +YBNk5LDW81mTBvVdQCe6OPuWDd27WH2bRoYb5a4+QOki9CcMVEPKtg0w2ipssN7JfJR
         twkPrYqsy2SoW7C5wPNPXDmFORzUltt1M7P8bj00jZFfaAb5SlNT43D5STuqMt1sSoD5
         kgYg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778683185; x=1779287985; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OaBPAaai2do6tTEr5ZFJIJdibTEdzt3Q2IEnGfklUBk=;
        b=fKT2ntv2llTJ5gtcD28MJa42auPcPrYmbqNfJ2CP2qikflYB/vAUbpAJ2KvSA9511E
         SRjfkEQVdxIQAVmMIfiLAQ9m3THltsGv5N4+PrvYsuOHPDXt1gGPkYg/lx982Oge7qMm
         KQZZj5dZyRL6jvEEc/aAAIpkB4v5HOfUog+x6CHG8k5nu2c2W3PsnS1ThNialAwjrrCM
         cF3roh7QyRDU/+QLOhOzlOquXBzKzFOIUH8OWxqbVmhmhG7RoKhkUelYNBu0VbSgECJp
         1NnOFjo+zY8p+vPqvsFzBz7K2zDGZJ67qfPXm93tJSkEeeEgEiqSA/7TMHselCO+YdFq
         FjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778683185; x=1779287985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaBPAaai2do6tTEr5ZFJIJdibTEdzt3Q2IEnGfklUBk=;
        b=VkfjZ3iVUL4/NIQI22SffSaSrd/C/em2Wafz4pvCzLtLgS2YVu4h4EEWQn7d3G1Bdo
         PJ7gPWZN8SOuZpNxBEqXY+y+6VBp+ay+Tfz3sSql1Gkl2DlN2atAokmtXEvufaiIiG5a
         R65mnGKTBbw74OY2wxZ2ipeOnAJHV7QhGWeEf83kjGrdCIuu1um7ncgiew/c19arh88S
         uzwqZFDyckPDGiAcxQZrgfLSQ/pe6V4q55h2Fjybu/IsxjmVjvwk1rcfnFHDs/mcZ8Za
         qIGrVxdEhMxeg8+deV43ZwgdLUKOvOIgSOyQNd0Zrzb3Is91gXsXCYgZ235IcDp4rKAp
         MPuw==
X-Forwarded-Encrypted: i=1; AFNElJ+oxcDpGE8ec/inGxS2KLW/d4omhmS+fQB2sT7/X5DC9FFc9be4Mgjjucs8oAaijMTTy4ub9VsPNRzZPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxE+jDojnZvbWHs4TwRIowSMiQlnypR9C4QupNsHTNObBgaYure
	av4nmCSED9UALUVOTJH3K9g4NRBUS6H5EWullP59/ieBPKBvvvoGTabCl/kfcA013xG9etpv2Sy
	jICOQI9ueIhEOd1L1Q+d4J2WNk+GbtWc=
X-Gm-Gg: Acq92OHwUsicnNmyDpsNLQlTZz1k7us/azt4QFKqahk3jNwsjFSBHnznUjqiZuj4WSh
	MXs7NTrJBiAmtho3wPB7IoWSSci3LBqpz+d+n8j3PP8PGB0n01zPSmuL3bmtAX939uOIrhBMt+T
	kylwOeQygmHrwHZY4qLVNr6EKFRdLgniX0S4ESccSNicUFNiaZjmYhQA2uITo5mMwmWcVPV7qxK
	ZhWzLp2pngEJAeD82xWRNjYjZbQihHEx+Ezegk+GcUVukRRLe2fsxn/R4/QJ1/sgI6x2x7mrWpV
	Qg2sVA==
X-Received: by 2002:a17:907:3d43:b0:bcb:b15f:14a1 with SMTP id
 a640c23a62f3a-bd23aa1844fmr479690166b.7.1778683185065; Wed, 13 May 2026
 07:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <CANAwSgREs-Ai5RxuiD4Ue-8OGGdrhnLSBmSePBrjN3x9=59zrA@mail.gmail.com>
 <20260513105030.1074335-1-amadeus@jmu.edu.cn>
In-Reply-To: <20260513105030.1074335-1-amadeus@jmu.edu.cn>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 13 May 2026 20:09:29 +0530
X-Gm-Features: AVHnY4LObZPjOHYcJad_9LeD-36GYglsaC0zIs_XJX_NY4Ny0UPRl2ZDzVqaAoE
Message-ID: <CANAwSgQ5-ATFGESe+=sEuGfEHwqDxg6b_QL=WJSV0gONFLmiZA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] riscv: dts: spacemit: k1-bananapi-f3: Add
 vin-supply for PCIe 3.3V regulator
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, dlan@kernel.org, gaohan@iscas.ac.cn, 
	huang.ze@linux.dev, krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org, 
	robh@kernel.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_073947_413216_5016D6F1 
X-CRM114-Status: GOOD (  13.77  )
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

Hi Chukun

On Wed, 13 May 2026 at 16:20, Chukun Pan <amadeus@jmu.edu.cn> wrote:
>
> Hi,
>
> > @@ -39,6 +39,7 @@ pcie_vcc_3v3: regulator-pcie-vcc3v3 {
> >               regulator-min-microvolt = <3300000>;
> >               regulator-max-microvolt = <3300000>;
> >               regulator-always-on;
> > +             vin-supply = <&reg_vcc5v0_sys>;
> >       };
>
> > Plese check power tree page 4
> >
> > USBVBUS->SY8386J UXXX -> PCIE_VCC3V3 for pcie vin source
> >
> > USBVBUS is power source from the typec port.
>
> So this isn't from VCC5V0_SYS. USBVBUS and DC_IN can be
> considered as the same power source.

I am not the hardware person. USBVBUS supplies 12V, and VCC5V0_SYS supplies 5V
As I understand it, SY8386J UXXX serves as a step-down DC/DC regulator
for your PCI device.

[1] https://datasheet4u.com/download_new.php?id=1604744

USBVBUS is the input for the PCIe source, so this should be vin-supply
= <&rreg_dc_in>;
It is as per the schematic

Thanks
-Anand

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
