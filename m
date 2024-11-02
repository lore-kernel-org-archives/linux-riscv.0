Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B56E677FC
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Nov 2024 11:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i95DX+p/eKy+8+QArX8EUxg3ZCMFN/8Q9DLi0C8UhMQ=; b=DJMwD6HkiAxzFo
	KAMUfsmJeVe5Ui0aj5JrTgXT0gqmlNo2SSSFIcq6id6gf0i3mZ41OW//+wEQT8E+Fx69aCZJGQbLz
	OLQ++AJqFpAvXANYitQi6+ejjeYlX9ghIt+Dk2eBHQiBXuqIvFXor6jfFVt7uYYHgDpa8q44jaWfv
	YGgnkzL8lWmIHxnd5UJwiuJtvucoIilHEdgk94xmyOT3sPtTYTvYhjugcHYvozdpvz1vzJLYPhivF
	V5RI6acGcejQhqfNwNDJcGkrApfxZ6SER6N/1MFepMYBoDuKNcZgYT0o+7dX8x0c75L7hBGiPDc9e
	0NqnnafKKKkRNz9z7v3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7CmZ-00000009ewn-2Yxr;
	Sat, 02 Nov 2024 11:59:07 +0000
Received: from mail-pf1-f174.google.com ([209.85.210.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Chq-00000009dvb-2xRW
	for linux-riscv@lists.infradead.org;
	Sat, 02 Nov 2024 11:54:16 +0000
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-720d01caa66so1302733b3a.2
        for <linux-riscv@lists.infradead.org>; Sat, 02 Nov 2024 04:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730548453; x=1731153253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cVx7U4bzYVpyfgKjWQr0MaSdBVExKH9K4jnX08inNnM=;
        b=Hvop8hDlpwaQkVV79QAEu2oaUEGclaG4peEBEaAuqjh0+SygWOd8/LIYYB2v0x3RPY
         YDfxVzlXTNWY8uQ9My6EW8EIhQY1Mk47ML/2K76kJqktPfaZHT5/0JHQ0e81GGBPZBZr
         YAYIV4alOPtqbgQm8uqL0rpa0lIgwUJENDlj4CzPkcCixrPsAEiM4kUwb8okOi7RdMjt
         M7tuBHbzdGfU4PnXoTb3LurdA0hw095bAdRwiJIqVeLHD8KB5awboaPxPK4cJAS4cRSX
         OC1A+OCTWKZnm+afwS6rII/QnfMUZUH6baVyr3YICvMCIcRSenMbhJz4/hyCJsSYqO0K
         WS8g==
X-Forwarded-Encrypted: i=1; AJvYcCXTaf964O4GPTLCorXYr6K/65zOAS6KJNB0UjbcBSaNxzxH5KKWLACU7MgR7+jhy+3wSsLwAYaxbmOVVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqRfBTee6Y82Cc+PjULP254N8vB4IrPWP+c/N87cfIAy9CukVB
	LxVFcVcM/0oYhPDHLMDpUzHUAJLtOq/uMWNxSNOIt2sxHL3IpRCZ
X-Google-Smtp-Source: AGHT+IHADfTBPOuMjseNhPZnBBPX7nUxyp7rMazi1phiYKiysXu9Wg3hN940Yi3yFmnRm7R8Dx3VBQ==
X-Received: by 2002:a05:6a21:164a:b0:1d9:69cd:ae22 with SMTP id adf61e73a8af0-1db91dec892mr13325470637.30.1730548453509;
        Sat, 02 Nov 2024 04:54:13 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc31874bsm3986223b3a.213.2024.11.02.04.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 04:54:12 -0700 (PDT)
Date: Sat, 2 Nov 2024 20:54:11 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, linux-pci@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 2/2] PCI: microchip: rework reg region handing to
 support using either instance 1 or 2
Message-ID: <20241102115411.GE2260768@rocinante>
References: <20240814-outmost-untainted-cedd4adcd551@spud>
 <20241101195129.GA1318063@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241101195129.GA1318063@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_045414_771752_AE709A19 
X-CRM114-Status: GOOD (  24.87  )
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

Hello,

> > The PCI host controller on PolarFire SoC has multiple "instances", each
> > with their own bridge and ctrl address spaces. The original binding has
> > an "apb" register region, and it is expected to be set to the base
> > address of the host controllers register space. Defines in the driver
> > were used to compute the addresses of the bridge and ctrl address ranges
> > corresponding to instance1. Some customers want to use instance0 however
> > and that requires changing the defines in the driver, which is clearly
> > not a portable solution.
> 
> The subject mentions "instance 1 or 2".
> 
> This paragraph implies adding support for "instance0" ("customers want
> to use instance0").
> 
> The DT patch suggests that we're adding support for "instance2"
> ("customers want to use instance2").
> 
> Both patches suggest that the existing support is for "instance 1".
> 
> Maybe what's being added is "instance 2", and this commit log should
> s/instance0/instance 2/ ?  And probably s/instance1/instance 1/ so the
> style is consistent?
> 
> Is this a "pick one or the other but not both" situation, or does this
> device support two independent PCIe controllers?
> 
> I first thought this driver supported a single PCIe controller, and
> you were adding support for a second independent controller.
> 
> But the fact that you say "the [singular] host controller on
> PolarFire", and you're not changing mc_host_probe() to call
> pci_host_common_probe() more than once makes me think there is only a
> single PCIe controller, and for some reason you can choose to operate
> it using either register set 1 or register set 2.

Conor, let me know if we need to clarify the commit log per Bjorn's
questions.  If so, then I will do it directly on the branch.

	Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
