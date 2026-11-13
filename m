Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C07606A31C
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 07:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MG8uF7RH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HxVJOfRN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SJHTZTlVpfxKVIT7ET8TaO3RfRRzibJtcEHElS0JWPI=; b=MG8uF7RHyvQNOQ6xocIgO+Wu+k
	Hos0WBXdW6YuZljQHJbZjMspTqXYReAYchZWaAaPk7HdFY9kcf5ngHrfVJBaNbHrFNErJdcSCIAos
	H7XWxBJvLKZXOM9vNuhOeTF7MB2nRUP2ZGzxK72PQzJpLmrRuwYA/xVirAv30irRxq0XPBUiMv70w
	dfL+RmYrtN8JiSX7EuLy+/G284YogWZS5FHHt2P9/QL9wxeROtTF1DkH0BP/2fjp29D2jbtxboT/6
	CSo1rr05jjA6LD1ldiPKpXHWNQd+k9jYpQ1a4jKQrwqmLy6PDMebynr8MFs3TJ2hHJWPlI1WGXxoS
	QGWMQN8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRldG-0000000Btpl-1Dew;
	Fri, 13 Nov 2026 07:23:34 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRldC-0000000Btoa-2Vw4
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 07:23:32 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8bddb1172a4so108201b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 23:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794554609; x=1795159409; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VDKHNKMPhCvwPugcpF6BOJrNWHPrkmJauqAcAuvRmCY=;
        b=HxVJOfRNegfi8H11o0VeiZ0eMybMAYYvIX9c/sLHgmlEw8alk3khvXfcBv0bWQmSqy
         QPAhs6SWNPB1/WSO7OuXtgEMGzEKIB+2OK+vLYWzLujNkH8Lo7Cjub0GA3YNY3UaH8pO
         IuQS1A9g+n0lXy+m9aNONQsGtSV0Ef/OSJ7A3tyntRGKKOp9QWU7yFj9Dmwg6l+y4My5
         pT6+DUZrYvpe7jZg7vL0ectmoQAtRF6ZFNd8pRyyuPoF3rPlMa2JnEozvKwLLthuVIgD
         O7U+mz3tCpi7ZUMz6Qp4qa6Rq2mGG8ne+/xdOlHYkAuT83IOjgHnlGYBbFhgepoySzNL
         Ydyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794554609; x=1795159409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VDKHNKMPhCvwPugcpF6BOJrNWHPrkmJauqAcAuvRmCY=;
        b=P4DNUxgSravmT+UJ+9Df5kXmDyBnTFRchISOIJGVXkB50+BvKDwp2KlVewMAMu0kaF
         THj1wv8p2wggZHoFIPF1xsphEAKHVt59G/pjtyDd1fwfqp53RXKpDEMG4KG+mxjj0nhc
         OodQ72TvBs2ks3NuCQwtIHBXSPl/aeAES7FP+iTM/X2DTAUOgpj+eHo47hSSofebuZdY
         IIWkMK/RDb6duuTW3IRH5dX5x3NWl+bEbeS+6USyM1NVHLLe7pHcQ/hPho7DxHfTCdJm
         t0vq9RvhOPZBQLxqwgQwVepQcgT3N/I0piYJVO+ECDpfZvGE1GvXHfeQsVwAybMKGkyM
         +cqQ==
X-Forwarded-Encrypted: i=1; AL+hErEN4YvLyvQlbpT30yUAVUj6LbRKhcf3mI+ByR6n8hBkujBmQP+K2yfR5Lh8YHZN1Lam2yroXe4/DwCj9g==@lists.infradead.org
X-Gm-Message-State: APuU4Z94biqkmzCF3e2vJODlR0BxODhJs0baUY2+AZzj9ZYhXMaMWKEI
	DyaUbZgVJpQSwucNhwN2HuUjhGoFltCwPBJutM4kEhopPK50cwY+9JxC
X-Gm-Gg: AYBFou3I+8vr0C981tHQpd69o5HbMX0br7ykeGIXJ72nekbWVwvfTMbZdjczn7Rxo+e
	gq+ulpDRTdCNrBkKXKzCQg1v4s355mk/tDtqCvZbniny9kBEkxmoP2SvX5Nl3/9rV7rZWgVn2x+
	6F1vtPJ7kAY3Y3DyggUqQdqds9lMcs/qrBtJcm9q6sVtEsFJsm0E4iAHX/Ec0ElmgOTliDBapMP
	3rnmDLBQs3Tt2AutxP9RXFUpYozhCfHo3xSbM/cYng8Tu7d1Pe0uXKsKeYUvLoFS7vAiC2mdJxK
	p5c1+w79ZdoEi2VKkPZQE4fBluln9EOWC1UnSHemUNZujwi0zvH2W1Wb7A7VDzGI7Msmo4ZXjxK
	uJDxs5ckKoUPE5CR/YyqzFSUAQzDosRRb2h38JAuk+vtES1in2du8vDGGH6YXdoTVUfY3Z+zf4f
	Nt7QkyVmN8CVqiLaPUYE8AI3N6+74Y4wzEJ+R/I9ZSMJcYg8Ck/YQRjmiX4dQTvy4+NCCz6OqAu
	lMKcXDQmg19IVTWu9MOKs5xSc932ikzvdOYP8xRqqtUlskK6UAe5mUnNAyx64Dd9aDZLTnQTTnV
	nNtbFciRZy6P6uv+tQJQlKPWbhqAwpItYEtOaYtgXKbfs3yGX6uXk1ZX4Tf/wtgpyOl5XhJsSG6
	VCGACj7tTtpfT
X-Received: by 2002:a05:6a00:bc8c:b0:8bd:30c8:e414 with SMTP id d2e1a72fcca58-8beb3458494mr3160450b3a.1.1794554609089;
        Thu, 12 Nov 2026 23:23:29 -0800 (PST)
Received: from chenyou.. ([140.116.78.205])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8becbad7de3sm649518b3a.0.2026.11.12.23.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:23:28 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chen.wang@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	hminas@synopsys.com,
	gregkh@linuxfoundation.org,
	looong.bin@gmail.com,
	dinguyen@opensource.altera.com,
	paulz@synopsys.com,
	balbi@ti.com,
	dlan@gentoo.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: Re: [PATCH 0/4] usb: dwc2: Add USB DRD support on CV1800 Series SoC
Date: Fri, 13 Nov 2026 15:23:05 +0800
Message-ID: <20261113072305.220610-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110070627.217946-1-inochiama@gmail.com>
References: <20261110070627.217946-1-inochiama@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_232330_662414_126FAFD5 
X-CRM114-Status: GOOD (  23.44  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 03:06:21PM +0800, Inochi Amaoto wrote:
> The current DRD implementation of DRD will cause a interrupt flow on
> CV1800 Series SoC. It has two reasons:
> 1. The DRD does not sync the phy mode when change the controller mode,
>    it is a violation of the DRD as it does not rely on a OTG phy.
> 2. The CV1800 is entered with a Session End Detected interrupt, but the
>    DRD code has no change on it, so the controller will enter the
>    interrupt storm.

Thanks, fixing this in dwc2 makes sense to me. I am dropping my PHY
series [1].

I tested patches 1-3 on a Milk-V Duo 256M (SG2002), on top of
f66469d9905b, with this on the board DTS:

  &usb {
  	dr_mode = "otg";
  	usb-role-switch;
  	role-switch-default-mode = "peripheral";
  	status = "okay";
  };

R=/sys/class/usb_role/4340000.usb-role-switch below.

Bare board on a PC, after booting:

  # echo device > $R/role
  # devmem 0x03000048 32
  0x000003C0
  # cat /sys/class/udc/*/state
  configured

  PC$ lsusb | grep 0525
  Bus 003 Device 012: ID 0525:a4a2 Netchip Technology, Inc. Linux-USB Ethernet/RNDIS Gadget

  # echo host > $R/role
  # devmem 0x04340000 32    (GOTGCTL)
  0x002C00FC
  # devmem 0x04340004 32    (GOTGINT)
  0x00000000

The interrupt count did not move over one second in host mode, so no
storm. Switching back to device gave "configured" again, and "none"
went back to device. I did one host/device round on each of two boots.

On the USB & Ethernet IO board, with a USB stick plugged in:

  # echo host > $R/role
  [  136.556790] hub 1-1:1.0: 4 ports detected
  [  136.837392] usb 1-1.1: new high-speed USB device number 3 using dwc2
  [  139.174764]  sda: sda1 sda2 sda3 sda4

  GINTMSK 0xF300081E, HPRT0 0x00001005

Tested-by: Chen-Yu Yeh <chenyou910331@gmail.com> # Milk-V Duo 256M

> Note: This patches set does not resolve all the problems, as
>       usb_add_hcd() will override the role set by dwc2, but I am not
>       sure whether it should change skip_phy_initialization of hcd.
>       So I kept it as it is and users still needs to set the role
>       in the userspace as "role-switch-default-mode" in devicetree
>       takes no effect.

I see the same at boot, and the "set mode" print in the PHY driver
shows the order:

  [    1.777738] phy phy-3000000.syscon:phy@48.0: set mode 6
  [    1.778979] phy phy-3000000.syscon:phy@48.0: set mode 5
  [    1.779005] phy phy-3000000.syscon:phy@48.0: set mode 1

That is PHY_MODE_USB_DEVICE from dwc2_drd_init(), then HOST_SS (not
supported by the PHY) and HOST from usb_add_hcd(). The PHY ends up in
host (0x03000048 = 0x142) while the controller is still in device mode
(GINTSTS = 0x04000020). On the bare board the UDC stays "not attached"
and the PC sees nothing. On the IO board the hub does not show up
either. So until a role is written, the port does not work in either
mode. This was the same on all three boots.

I am happy to test the next versions on the Duo 256M, in both device
and host mode, and send a Tested-by.

Once your series is merged, would you like me to send the DTS change
for the Duo 256M, or would you prefer to do it yourself?

[1] https://lore.kernel.org/all/avLC68zOj8WKuslb@inochi.infowork/

Regards,
Chen-Yu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
