Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94380606A320
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 11:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jp7CiCbo;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nmiYFJD/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/fZy2BNxjuER0+yOCGYBUQQQQM4f3gFpMG0GbmWespA=; b=Jp7CiCboequscJ9/JC6FwGr/hx
	DxQinqNb17/cpQoWVlCaNCmFGdH9wqu0ODT08fhWalhHSeJWgkjLnOLKucXqe0KaVRzgi5IUiAiA/
	gZjVeq4baoZ7HPYksmtrsrT3CGKbwWVDukBNfwDbntez8prhc6E4fnAao3MNOPBPvqQFFYDQNeeyo
	0MpoQTUplUP1rAw2CzMaX5NGmdf9VWEJpCV+V10BdRlKPuut8KBTTMXa0AjUGH2GDnvfKpeZ2K092
	YrjHwMAcP+uUgaH1F5GiAZsdKo/D8AEcT8ZZmnC8ypt/jsEaIr3V9eaEP8tpPZ0ZJdJtiBRb/9Pmb
	4r9Fg32w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdxv-00000008jX7-1aNM;
	Wed, 18 Nov 2026 11:36:39 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdxr-00000008jVY-2f9G
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 11:36:38 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cddee4abc57so282810a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 03:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795001795; x=1795606595; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EohF+oRx/8zwt+ylfzEGCIcRitUdjLX/99U3WEU8q48=;
        b=nmiYFJD/b/VvYXkMz9ImfJLWWDvrXGbwtNWZnDUuSVlQ+9l1hWaatgMHSg6vtH1MBR
         jM0d28HovLuqsCkTOQ4AQg2izt3AkBL5G4teuSDMNxRLaMuzkbfzWHj/bqUBFHN+BLpa
         ZCwpozAIzOqHjnYpPbrJQCr4Md5DjJvDMmF8YuXVtHChQqcbd8Axg72Ix8drPE3F5dsz
         8jFGc4uz/Eplr0omN9k5meesPyvoslATtlC8K6+0DKII4vu/ka1nH3hOwqqoGpBpjMEB
         Q/Pr/owGXB7teVzhPgeHwLd4SYgpy+P2Wxc2cd8iieDVjHFwOoZj6u54vyxs064KNi/a
         ZGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001795; x=1795606595;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EohF+oRx/8zwt+ylfzEGCIcRitUdjLX/99U3WEU8q48=;
        b=Hu3UL/iI58jFkCnOHBlboeLx2KKtkzDBiiBFL/tf3E7goAdjnUYYDuWodZG66smJxZ
         GIai6a2PMRvBrJKLmR5CoapPGcpmZyuvxw3fTk4rvSwuFB2f/q3mpaWVsb69s3QA+WCd
         DAWFnOGuZrB6vZy5eJxShxV+7TC+kYbIp1x/xRYp8mwxQ+oUw6SgIyGyADc/Z7yYav0n
         OKAFFGN5AG0OkueU7Z0AfijJpYPh0WqlX7kn+g9/m6y5Fy82sXu8HQdEkRUS4ebooeeR
         1KB6Z7g75QcdyGYgRZ2Fxtb418u0ArYhes0V7Z+/2p2MSQbMyNPAJm42Aiju7l1K+HPI
         XSUg==
X-Forwarded-Encrypted: i=1; AL+hErFlaMXgL3vMQPqA7xJB/LcxIAdaGx5uVLUn/YL4b9nc66IxvSfzQNvIOg1LzpEC/+uS6RTbjp2j056WEA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8WoqdwKh1prj/jmB+yaQZDJbUTk2OUyJPz85IeFlm+dkqnWvfH
	T/HyQEk7/5slBvoNtmgqlUV0LIs7JLTwS8HmjTn4gC688TXiCnA9ypU9
X-Gm-Gg: AZFdTZcTT0DonORkwj+pfUcs+RxfiTPa9O6hOYErk4madmoHmUH/ptV996XmyAtra1M
	sg7oipRvrFXbfNwE8CWMcKFrdy9RinVC7+M+mHIJVZM7fUfcaWXviqkiNP+HtnVYcirYNlubM97
	AsjLxkPrSPTadU7tbImMqaGz6kJKsV7JoR2CnhT/NWV9u53uDsBo9qr7Cj6BlaavoPN+/FMdvHM
	dRctvfdXasmaFfJtxMiKt4En8nvItgtFDFZJOcSDRmZ5AYRCGX/1HLckX04kMnxGbDhyCnjBkUD
	Kyb56iPykEhz4SQl9M3rnKNuBuB57kVDuZ9LBERkdm7BqSTufjpD8xptFxtNuzYiGFRWZsCZW8S
	U21xop71qvGdNS1uf/+xFOLl4xYrMfBbL6tGaDZQJkR8+dLbXu02WS5b7YuER3+CAXNf/QQ5N9d
	19cHuXRK/M2py5ICgFjRbcV45xerFdCnMFN9nK4l8fLlKVWQ5wsJuFoDg2h3+tshHf8ujMgH7Ut
	5E0K7YyvFr7zW/2d5W5YPL5AAy8mZN7gFNkmYKk0UolJUuSYdrbZexl2/YI0aOT7mYTnKuokQAd
	cpGKCs4kQMPectv7JuNth7p4Ouo=
X-Received: by 2002:a17:90b:4488:b0:3b0:e388:d9da with SMTP id 98e67ed59e1d1-3b3d0761702mr2554146a91.29.1795001794613;
        Wed, 18 Nov 2026 03:36:34 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac254ba6sm8944570a91.4.2026.11.18.03.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:36:34 -0800 (PST)
Date: Wed, 18 Nov 2026 19:36:04 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	chen.wang@linux.dev, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, hminas@synopsys.com, gregkh@linuxfoundation.org, 
	looong.bin@gmail.com, dinguyen@opensource.altera.com, paulz@synopsys.com, balbi@ti.com, 
	dlan@gentoo.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/4] usb: dwc2: Add USB DRD support on CV1800 Series SoC
Message-ID: <av2M-6w1u5mOyqDM@inochi.infowork>
References: <20261110070627.217946-1-inochiama@gmail.com>
 <20261113072305.220610-1-chenyou910331@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261113072305.220610-1-chenyou910331@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_033635_687755_6137E188 
X-CRM114-Status: GOOD (  36.65  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 03:23:05PM +0800, Chen-Yu Yeh wrote:
> On Tue, Nov 10, 2026 at 03:06:21PM +0800, Inochi Amaoto wrote:
> > The current DRD implementation of DRD will cause a interrupt flow on
> > CV1800 Series SoC. It has two reasons:
> > 1. The DRD does not sync the phy mode when change the controller mode,
> >    it is a violation of the DRD as it does not rely on a OTG phy.
> > 2. The CV1800 is entered with a Session End Detected interrupt, but the
> >    DRD code has no change on it, so the controller will enter the
> >    interrupt storm.
> 
> Thanks, fixing this in dwc2 makes sense to me. I am dropping my PHY
> series [1].
> 
> I tested patches 1-3 on a Milk-V Duo 256M (SG2002), on top of
> f66469d9905b, with this on the board DTS:
> 
>   &usb {
>   	dr_mode = "otg";
>   	usb-role-switch;
>   	role-switch-default-mode = "peripheral";
>   	status = "okay";
>   };
> 
> R=/sys/class/usb_role/4340000.usb-role-switch below.
> 
> Bare board on a PC, after booting:
> 
>   # echo device > $R/role
>   # devmem 0x03000048 32
>   0x000003C0
>   # cat /sys/class/udc/*/state
>   configured
> 
>   PC$ lsusb | grep 0525
>   Bus 003 Device 012: ID 0525:a4a2 Netchip Technology, Inc. Linux-USB Ethernet/RNDIS Gadget
> 
>   # echo host > $R/role
>   # devmem 0x04340000 32    (GOTGCTL)
>   0x002C00FC
>   # devmem 0x04340004 32    (GOTGINT)
>   0x00000000
> 
> The interrupt count did not move over one second in host mode, so no
> storm. Switching back to device gave "configured" again, and "none"
> went back to device. I did one host/device round on each of two boots.
> 
> On the USB & Ethernet IO board, with a USB stick plugged in:
> 
>   # echo host > $R/role
>   [  136.556790] hub 1-1:1.0: 4 ports detected
>   [  136.837392] usb 1-1.1: new high-speed USB device number 3 using dwc2
>   [  139.174764]  sda: sda1 sda2 sda3 sda4
> 
>   GINTMSK 0xF300081E, HPRT0 0x00001005
> 
> Tested-by: Chen-Yu Yeh <chenyou910331@gmail.com> # Milk-V Duo 256M
> 
> > Note: This patches set does not resolve all the problems, as
> >       usb_add_hcd() will override the role set by dwc2, but I am not
> >       sure whether it should change skip_phy_initialization of hcd.
> >       So I kept it as it is and users still needs to set the role
> >       in the userspace as "role-switch-default-mode" in devicetree
> >       takes no effect.
> 
> I see the same at boot, and the "set mode" print in the PHY driver
> shows the order:
> 
>   [    1.777738] phy phy-3000000.syscon:phy@48.0: set mode 6
>   [    1.778979] phy phy-3000000.syscon:phy@48.0: set mode 5
>   [    1.779005] phy phy-3000000.syscon:phy@48.0: set mode 1
> 
> That is PHY_MODE_USB_DEVICE from dwc2_drd_init(), then HOST_SS (not
> supported by the PHY) and HOST from usb_add_hcd(). The PHY ends up in
> host (0x03000048 = 0x142) while the controller is still in device mode
> (GINTSTS = 0x04000020). On the bare board the UDC stays "not attached"
> and the PC sees nothing. On the IO board the hub does not show up
> either. So until a role is written, the port does not work in either
> mode. This was the same on all three boots.
> 
> I am happy to test the next versions on the Duo 256M, in both device
> and host mode, and send a Tested-by.
> 

If there are no other bug in this patch. There should be no new
version. The device probe problem is not a very big one. And I have
no idea about these thing. Since my time is tight, you are free to
send the fix for the device mode.

> Once your series is merged, would you like me to send the DTS change
> for the Duo 256M, or would you prefer to do it yourself?
> 
> [1] https://lore.kernel.org/all/avLC68zOj8WKuslb@inochi.infowork/
> 
> Regards,
> Chen-Yu

It depends, if you accept setting this to host, I can add them
at once. (Note: once set, no change will be accepted).

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
