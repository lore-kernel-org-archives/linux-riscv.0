Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AA1104C007
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 11:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/bnLmm5q2fjgb/k92/H8LAnCBAlLqQ986RZkMOgaqew=; b=p8KjOINfe9TPfMNP6YZejmViYG
	uUGVZcL7Ikjn6Mnp2GggXtK3llyCcMsrE16Sqfsc8swOr4ow9s8sOYsi+GmpPMUIyTtaUMHjZaGV9
	Z6BB+hHYeZlEowYQtzqaiTES8RTIhPr6QzaQmVPzsezab8mgSGg0NZNIKDFokFBvRObJpMDdDkoCx
	aAo8zg6oIf6SPnswCUlyuVLX1SCUMiJd4uw/ztD1oY+bYEi0Ydge+wa4nY6tfcmIFxN1pHb1zOJ8w
	MqtRts4huYml4go7SZiMODZSGw81d5p4HLdTR5xnKNfVHVp5DbC0Ot/VyCUAlgzZ+rEmppQRP0DNO
	8DzwRbgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0HeG-0000000BUJC-0j45;
	Wed, 11 Mar 2026 11:22:44 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0HeC-0000000BUIm-1HFW
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 11:22:42 +0000
Received: by mail-wr1-x442.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso9852406f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2026 04:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773228158; x=1773832958; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=71JEXDKvk0T0GLw/C3/yP1izsh+35dMcuquWuyEuUe0=;
        b=HuKya2N9ZVqRLQpwg/G1Rs2cpxRs8DlpBpvAN6gmt4Lwb+ojMTObS+c8YWgx40LPO0
         dSsj2cmaWtk9mmUv6XH0m7NQprFFaBruhTb/8HQAjviZ3BE58O6E093xXB8kD+r+Zoae
         fk6wHA5S0r/TyAN7b6erTtdpD1bptIUVaR2oPmNTM3h/plIBEh/D2ERAp3MgqQoqtmza
         fjxtJRDPZL8/VtKdNhY/ag1giqmTzHqw4eIRQ5RsM03BcOaFgunlkhffZ+8HCRXcJxa/
         17++QxG1jZaXLovCSV7XJydDIK46GlqedQhUg4jKWjT9T26gJPP38fI7PTR3VLMtnedt
         nxdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773228158; x=1773832958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71JEXDKvk0T0GLw/C3/yP1izsh+35dMcuquWuyEuUe0=;
        b=h85bwm0mrroN8rqq1Qr917qSQWqlHezCvkrR1dMiM9TvVnQzByjQcROL85+OvPaYWn
         ihwu/k1YP9Gr4yqvaRZcyAigQS5SJ1rYBa0qruOQOsZHwGBeKuhRb4w7uLxyc3pi3gM2
         /QndD6PTlX7pdAR7yrifizPh600Dh9rKiRWoNJuQI7yi5ImwLwz5sIaXRycevVPfSmmb
         5B2NUvWmVLd11zrY50vIzFDy+mc+44IWGn/CcQHEbZGOeiyn+cF2RlgH7V3erun4YQIR
         Ni9upMqmNCGyQh/ENFf1YvPn2hqDD/FF2iZzdUrsIx0PfrIP5RUCWQRYNHVMvvO2klOF
         NSiA==
X-Forwarded-Encrypted: i=1; AJvYcCXGflNR9VzUApLKwTTt7gZxpRsrIgUSsjDZJPDZN4dFjaAQYQMRnpmxsP+aEynAPn8h7Djx7gbe7KI2Og==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEVmrwESvl7HYD7R9vbfi++w1KMFKWESCf9rr7coEpUUngcgLJ
	Xs4RnmtnQ1OskTG9VPadB9BBjNrh1zniR+EzskB8vG7JhfVm8IVEsBPRwvDQQE3jfIoNzRG5en1
	2u3ZxOZP1TQ==
X-Gm-Gg: ATEYQzy+tTruOwpFPlh+UYLN8I6yV7VfhS9ppMSSSKfY1Ivz8lvWOLEUHZ8etQn8NXV
	S4jJOLSwHyVuHOYWaW2V/DlcUKBWFUhttRHQsyPUxbpn29f9fzfSIBF3qULfcR0kBPXmP60i6sX
	reTVSLD1sgB+MBcXiyAD17YbjUfkSQkoTWhwwwuCR5rMcuQRhKVjeEE9FKXV1HuAkD98QTw5u5K
	Ck8GpFYLkUvnBziYsfptcnQydKE0dHePXZiHHuRmtA+/rO6YB4TIe95LE9p09s+Ot858KOuEjor
	GxGTOSgD3edb8UEwRtuD1WN0HsjQNy51FOMyXe5aVfUTdKjW5pd20PVAw8PxkA3J4p8DcqIYVFY
	A8DPfjHgzcpoj+VFyKxj+xOSvy7p6cRwAdItMzfNxLqHtpcFb4axv9yLT/Jc/pWxylsaXlN3Qsq
	d3WmvwTciEy1lCco6Bjj1m2HB4HWnhopy5LJQRi1NVK1JBt0aAK9yp8nwarXeiGVyYiiAQlzODi
	TRY/qdu2wCFotg=
X-Received: by 2002:a5d:5850:0:b0:439:b671:1d8f with SMTP id ffacd0b85a97d-439f842409cmr4214740f8f.45.1773228157344;
        Wed, 11 Mar 2026 04:22:37 -0700 (PDT)
Received: from localhost (p200300f65f20eb04af6ce06839112ad8.dip0.t-ipconnect.de. [2003:f6:5f20:eb04:af6c:e068:3911:2ad8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-439f81f143asm6384561f8f.23.2026.03.11.04.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 04:22:36 -0700 (PDT)
Date: Wed, 11 Mar 2026 12:22:35 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [Patch] PCI/MSI: Handle lack of irqdomain gracefully
Message-ID: <abE_QoS5DM-ZltaV@monoceros>
References: <20241213115704.353665-1-alexghiti@rivosinc.com>
 <87v7vn917f.ffs@tglx>
 <CAHVXubiNMp9chdUdvYjiQC2LMhNMMaGEiLMWZ-4RSV54jakP3g@mail.gmail.com>
 <87ed2a8ow5.ffs@tglx>
MIME-Version: 1.0
In-Reply-To: <87ed2a8ow5.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_042240_556874_C6F2F15E 
X-CRM114-Status: GOOD (  20.57  )
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
Cc: "Aaron D. Johnson" <debbugreporter@fnord.greeley.co.us>, Alexandre Ghiti <alexghiti@rivosinc.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 1127635@bugs.debian.org, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <helgaas@kernel.org>, linux-riscv@lists.infradead.org, regressions@lists.linux.dev
Content-Type: multipart/mixed; boundary="===============1370005524643044078=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1370005524643044078==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a3utkw7fjimqlhqs"
Content-Disposition: inline


--a3utkw7fjimqlhqs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Patch] PCI/MSI: Handle lack of irqdomain gracefully
MIME-Version: 1.0

Control: forwarded -1 https://lore.kernel.org/lkml/abE_QoS5DM-ZltaV@monocer=
os

#regzbot introduced: a60b990798eb17433d0283788280422b1bd94b18
#regzbot from: "Aaron D. Johnson" <debbugreporter@fnord.greeley.co.us>
#regzbot monitor: https://bugs.debian.org/1127635

Hello,

On Sat, Dec 14, 2024 at 12:50:18PM +0100, Thomas Gleixner wrote:
> Alexandre observed a warning emitted from pci_msi_setup_msi_irqs() on a
> RISCV platform which does not provide PCI/MSI support:
>=20
>  WARNING: CPU: 1 PID: 1 at drivers/pci/msi/msi.h:121 pci_msi_setup_msi_ir=
qs+0x2c/0x32
>  __pci_enable_msix_range+0x30c/0x596
>  pci_msi_setup_msi_irqs+0x2c/0x32
>  pci_alloc_irq_vectors_affinity+0xb8/0xe2
>=20
> RISCV uses hierarchical interrupt domains and correctly does not implement
> the legacy fallback. The warning triggers from the legacy fallback stub.
>=20
> That warning is bogus as the PCI/MSI layer knows whether a PCI/MSI parent
> domain is associated with the device or not. There is a check for MSI-X,
> which has a legacy assumption. But that legacy fallback assumption is only
> valid when legacy support is enabled, but otherwise the check should simp=
ly
> return -ENOTSUPP.
>=20
> Loongarch tripped over the same problem and blindly enabled legacy support
> without implementing the legacy fallbacks. There are weak implementations
> which return an error, so the problem was papered over.
>=20
> Correct pci_msi_domain_supports() to evaluate the legacy mode and add
> the missing supported check into the MSI enable path to complete it.
>=20
> Fixes: d2a463b29741 ("PCI/MSI: Reject multi-MSI early")
> Reported-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Cc: stable@vger.kernel.org

this patch became a60b990798eb17433d0283788280422b1bd94b18 in v6.13-rc5
and was backported to 6.12.y and 6.6.y (aed157301c65 and b1f7476e07b9
respectively).

A Debian user (Aaron, on Cc:) on powerpc has boot problems and bisected
them to this commit. The relevant boot log of the failure is:

[    2.643879] BUG: Kernel NULL pointer dereference on read at 0x00000000
[    2.643891] Faulting instruction address: 0xc000000000a39514
[    2.643902] Oops: Kernel access of bad area, sig: 11 [#1]
[    2.643909] BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2048 NUMA pSeries
[    2.643920] Modules linked in: ohci_pci(+) ehci_hcd nvme_fabrics ohci_hc=
d nvme_keyring nvme_core usbcore nvme_auth scsi_transport_fc ipr configfs e=
hea(+) usb_common
[    2.643965] CPU: 5 UID: 0 PID: 250 Comm: (udev-worker) Not tainted 6.12.=
17-powerpc64 #1  Debian 6.12.17-1
[    2.643976] Hardware name: IBM,8204-E8A POWER6 (architected) 0x3e0302 0x=
f000002 of:IBM,EL350_118 hv:phyp pSeries
[    2.643986] NIP:  c000000000a39514 LR: c000000000a36ed8 CTR: c000000000a=
35820
[    2.643995] REGS: c0000000351f6f60 TRAP: 0300   Not tainted  (6.12.17-po=
werpc64 Debian 6.12.17-1)
[    2.644004] MSR:  8000000000009032 <SF,EE,ME,IR,DR,RI>  CR: 24222288  XE=
R: 00000000
[    2.644031] CFAR: c00000000000cfc4 DAR: 0000000000000000 DSISR: 40000000=
 IRQMASK: 0
[    2.644031] GPR00: c000000000a36ed8 c0000000351f7200 c00000000182e200 c0=
000003df294000
[    2.644031] GPR04: 0000000000000000 0000000000000000 0000000000000000 00=
00000000000000
[    2.644031] GPR08: 0000000000000001 0000000000000000 c00000000228fcc0 00=
00000044222288
[    2.644031] GPR12: c000000000a35820 c00000000eeacb00 0000000000000020 00=
00010037fcab20
[    2.644031] GPR16: 0000000022222248 0000000000020000 0000000000000000 00=
003fffebe8bb80
[    2.644031] GPR20: 0000000000000000 c00000000204db60 c00000000204dd60 c0=
0000000b1ae780
[    2.644031] GPR24: 0000000000000000 00003fff8c9ac758 0000000000000000 c0=
000003df294000
[    2.644031] GPR28: 0000000000000001 0000000000000000 c0000003df294000 00=
00000000000001
[    2.644164] NIP [c000000000a39514] pci_msi_domain_supports (drivers/pci/=
msi/irqdomain.c:366)
[    2.644181] LR [c000000000a36ed8] __pci_enable_msi_range (drivers/pci/ms=
i/msi.c:437)
[    2.644192] Call Trace:
[    2.644197] [c0000000351f7200] [c0000000351f7304] 0xc0000000351f7304 (un=
reliable)
[    2.644211] [c0000000351f7340] [c000000000a3578c] pci_alloc_irq_vectors_=
affinity (drivers/pci/msi/api.c:277)
[    2.644225] [c0000000351f73d0] [c0003d0007d2f4d4] usb_hcd_pci_probe (dri=
vers/usb/core/hcd-pci.c:192) usbcore
[    2.644246] [c0000000351f7470] [c0003d00084e6030] ohci_pci_probe (driver=
s/usb/host/ohci-pci.c:285) ohci_pci
[    2.644260] [c0000000351f7490] [c000000000a260e8] local_pci_probe (drive=
rs/pci/pci-driver.c:324)
[    2.644274] [c0000000351f7510] [c000000000a26218] pci_call_probe (driver=
s/pci/pci-driver.c:392 (discriminator 1))
[    2.644287] [c0000000351f7670] [c000000000a27348] pci_device_probe (driv=
ers/pci/pci-driver.c:452)
[    2.644300] [c0000000351f76b0] [c000000000b2e658] really_probe (drivers/=
base/dd.c:579 drivers/base/dd.c:658)
[    2.644314] [c0000000351f7740] [c000000000b2eb24] __driver_probe_device =
(drivers/base/dd.c:800)
[    2.644327] [c0000000351f77c0] [c000000000b2edc4] driver_probe_device (d=
rivers/base/dd.c:831)
[    2.644340] [c0000000351f7800] [c000000000b2f188] __driver_attach (drive=
rs/base/dd.c:1217)
[    2.644352] [c0000000351f7880] [c000000000b2ac64] bus_for_each_dev (driv=
ers/base/bus.c:370)
[    2.644365] [c0000000351f78e0] [c000000000b2dac4] driver_attach (drivers=
/base/dd.c:1234)
[    2.644377] [c0000000351f7900] [c000000000b2cd98] bus_add_driver (driver=
s/base/bus.c:675)
[    2.644389] [c0000000351f7990] [c000000000b30ae4] driver_register (drive=
rs/base/driver.c:246)
[    2.644402] [c0000000351f7a00] [c000000000a24f88] __pci_register_driver =
(drivers/pci/pci-driver.c:1450)
[    2.644415] [c0000000351f7a20] [c0003d00084e6800] ohci_pci_init (drivers=
/usb/host/ohci-pci.c:308) ohci_pci
[    2.644429] [c0000000351f7a50] [c00000000000fd60] do_one_initcall (init/=
main.c:1269)
[    2.644444] [c0000000351f7b30] [c0000000002760f8] do_init_module (kernel=
/module/main.c:2543)
[    2.644460] [c0000000351f7bb0] [c000000000278fe4] init_module_from_file =
(kernel/module/main.c:3199)
[    2.644473] [c0000000351f7c90] [c0000000002793e0] sys_finit_module (kern=
el/module/main.c:3211 kernel/module/main.c:3238 kernel/module/main.c:3221)
[    2.644487] [c0000000351f7da0] [c00000000002c084] system_call_exception =
(arch/powerpc/kernel/syscall.c:171)
[    2.644500] [c0000000351f7e50] [c00000000000cb54] system_call_common (ar=
ch/powerpc/kernel/interrupt_64.S:292)
[    2.644515] --- interrupt: c00 at 0x3fff8d653d8c
[    2.644522] NIP:  00003fff8d653d8c LR: 00003fff8c9a4680 CTR: 00000000000=
00000
[    2.644531] REGS: c0000000351f7e80 TRAP: 0c00   Not tainted  (6.12.17-po=
werpc64 Debian 6.12.17-1)
[    2.644541] MSR:  800000000200f032 <SF,VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 22=
222222  XER: 00000000
[    2.644573] IRQMASK: 0
[    2.644573] GPR00: 0000000000000161 00003fffebe8b640 00003fff8d757100 00=
00000000000052
[    2.644573] GPR04: 00003fff8c9ac758 0000000000000004 0000000000000058 00=
0000000000005a
[    2.644573] GPR08: 0000000000000000 0000000000000000 0000000000000000 00=
00000000000000
[    2.644573] GPR12: 0000000000000000 00003fff8de947c0 0000000000000020 00=
00010037fcab20
[    2.644573] GPR16: 0000000022222248 0000000000020000 0000000000000000 00=
003fffebe8bb80
[    2.644573] GPR20: 0000000000000000 00003fffebe8bb70 0000000000000007 00=
00010037fca210
[    2.644573] GPR24: 0000000000000000 0000000000000000 0000010037f6be40 00=
00000000000004
[    2.644573] GPR28: 00003fff8c9ac758 0000000000020000 0000000000000004 00=
00010037fca210
[    2.644698] NIP [00003fff8d653d8c] 0x3fff8d653d8c
[    2.644705] LR [00003fff8c9a4680] 0x3fff8c9a4680
[    2.644713] --- interrupt: c00
[ 2.644719] Code: 4182002c e92a0088 80690000 7c632038 7c632278 7c630034 546=
3d97e 786307e0 4e800020 60000000 60000000 e92a0020 <80690000> 4bffffd8 6000=
0000 7ca50034
All code
=3D=3D=3D=3D=3D=3D=3D=3D
   0:*	41 82 00 2c 	beq     0x2c		<-- trapping instruction
   4:	e9 2a 00 88 	ld      r9,136(r10)
   8:	80 69 00 00 	lwz     r3,0(r9)
   c:	7c 63 20 38 	and     r3,r3,r4
  10:	7c 63 22 78 	xor     r3,r3,r4
  14:	7c 63 00 34 	cntlzw  r3,r3
  18:	54 63 d9 7e 	srwi    r3,r3,5
  1c:	78 63 07 e0 	clrldi  r3,r3,63
  20:	4e 80 00 20 	blr
  24:	60 00 00 00 	nop
  28:	60 00 00 00 	nop
  2c:	e9 2a 00 20 	ld      r9,32(r10)
  30:	80 69 00 00 	lwz     r3,0(r9)
  34:	4b ff ff d8 	b       0xc
  38:	60 00 00 00 	nop
  3c:	7c a5 00 34 	cntlzw  r5,r5

Code starting with the faulting instruction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   0:	80 69 00 00 	lwz     r3,0(r9)
   4:	4b ff ff d8 	b       0xffffffffffffffdc
   8:	60 00 00 00 	nop
   c:	7c a5 00 34 	cntlzw  r5,r5
[    2.644769] ---[ end trace 0000000000000000 ]---


(That's the bug splat from the bug report piped through
scripts/decode_stacktrace.sh)

The kernel has CONFIG_PCI_MSI_ARCH_FALLBACKS=3Dy, so the first hunk
shouldn't change anything.

The disassembly of pci_msi_domain_supports in the kernel looks as
follows:

	c000000000a394c0 <pci_msi_domain_supports>:
	pci_msi_domain_supports():
	debian/build/build_powerpc_none_powerpc64/drivers/pci/msi/irqdomain.c:334
	c000000000a394c0:       60 00 00 00     nop
	c000000000a394c4:       60 00 00 00     nop
	debian/build/build_powerpc_none_powerpc64/drivers/pci/msi/irqdomain.c:353
	c000000000a394c8:       e9 43 02 e8     ld      r10,744(r3)
	c000000000a394cc:       2c 2a 00 00     cmpdi   r10,0
	c000000000a394d0:       41 82 00 50     beq     c000000000a39520 <pci_msi_=
domain_supports+0x60>
	irq_domain_is_hierarchy():
	debian/build/build_powerpc_none_powerpc64/include/linux/irqdomain.h:661
	c000000000a394d4:       81 2a 00 28     lwz     r9,40(r10)
	pci_msi_domain_supports():
	debian/build/build_powerpc_none_powerpc64/drivers/pci/msi/irqdomain.c:353 =
(discriminator 1)
	c000000000a394d8:       71 28 00 01     andi.   r8,r9,1
	c000000000a394dc:       41 82 00 44     beq     c000000000a39520 <pci_msi_=
domain_supports+0x60>
	debian/build/build_powerpc_none_powerpc64/drivers/pci/msi/irqdomain.c:359 =
(discriminator 1)
	c000000000a394e0:       71 29 01 00     andi.   r9,r9,256
	c000000000a394e4:       41 82 00 2c     beq     c000000000a39510 <pci_msi_=
domain_supports+0x50>
	debian/build/build_powerpc_none_powerpc64/drivers/pci/msi/irqdomain.c:375
	c000000000a394e8:       e9 2a 00 88     ld      r9,136(r10)
	c000000000a394ec:       80 69 00 00     lwz     r3,0(r9)
	debian/build/build_powerpc_none_powerpc64/drivers/pci/msi/irqdomain.c:378
	c000000000a394f0:       7c 63 20 38     and     r3,r3,r4
	c000000000a394f4:       7c 63 22 78     xor     r3,r3,r4
	c000000000a394f8:       7c 63 00 34     cntlzw  r3,r3
	c000000000a394fc:       54 63 d9 7e     srwi    r3,r3,5
	debian/build/build_powerpc_none_powerpc64/drivers/pci/msi/irqdomain.c:379
	c000000000a39500:       78 63 07 e0     clrldi  r3,r3,63
	c000000000a39504:       4e 80 00 20     blr
	c000000000a39508:       60 00 00 00     nop
	c000000000a3950c:       60 00 00 00     nop
	debian/build/build_powerpc_none_powerpc64/drivers/pci/msi/irqdomain.c:366
	c000000000a39510:       e9 2a 00 20     ld      r9,32(r10)
	c000000000a39514:       80 69 00 00     lwz     r3,0(r9)
	c000000000a39518:       4b ff ff d8     b       c000000000a394f0 <pci_msi_=
domain_supports+0x30>
	c000000000a3951c:       60 00 00 00     nop
	debian/build/build_powerpc_none_powerpc64/drivers/pci/msi/irqdomain.c:355
	c000000000a39520:       7c a5 00 34     cntlzw  r5,r5
	c000000000a39524:       54 a3 d9 7e     srwi    r3,r5,5
	debian/build/build_powerpc_none_powerpc64/drivers/pci/msi/irqdomain.c:379
	c000000000a39528:       78 63 07 e0     clrldi  r3,r3,63
	c000000000a3952c:       4e 80 00 20     blr


so the trapping happens in drivers/pci/msi/irqdomain.c:366 which is:

365	                info =3D domain->host_data;
366	                supported =3D info->flags;

According to the register dump domain =3D=3D r10 =3D=3D NULL, but then this=
 code
would not have been reached and the faulting instruction would be at
c000000000a39510. So maybe it's only .host_data =3D NULL and the register
dump is unreliable??

The offsets match: .host_data is at offset 32 of struct
irq_domain and .flags is at offset 0 of struct msi_domain_info.

For more details see
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1127635 .

Does someone spot the issue?

Best regards
Uwe

--a3utkw7fjimqlhqs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmxUHgACgkQj4D7WH0S
/k7RMAf+Ib+ojz3n8cN56Z7t4xKMmmxRacNhEiOCbgr7Lm/HHLuhzOVfW6xz1KPK
dFhxEW/rTgQG0bB6rlOPHOEOkq+tMgrOpYRchtKfwq+Jloc/mlIqGxBlr/1Z4Rv9
0rGM6N6+ZMX9si+Q6JJF7KLkBRwmfOCi1wJiAvw8fMUV85CIMQzs/jCM6njCVW+H
XannyN7nTQ1yGM9k1LIRB0AYeXDe8w/P6zLhxo/dZkhxw+VEDdtcF+nqEPplXGW3
pdBDIg4zC/Qw/leOFkVxh2JQC0SAAMDX7/wtJkqmkyBWo6ggyHkj6SKOBhUau5ig
KG3Eibs2snymi88z8CP3VkHRhxhPxw==
=KkQC
-----END PGP SIGNATURE-----

--a3utkw7fjimqlhqs--


--===============1370005524643044078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1370005524643044078==--

