Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C875CD6E5D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 22:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ydWM/mfgxj7Sz7Q48Z7kr4JohYFoO4GKLFwp3yxOcjA=; b=jgW8IbWqrUufFy
	H4ikcPQOkBaD4hhCA78p2F6xCHa1FtEvAPJRF1O8jOHEL097yPWWHRE9meb6kPoU2k/knHEoAkk1B
	iD+ZNx/DRLyHl/t2tj8SL7+pfpIgEbULO7v5DwMKtBQ566n7yRR0qhZthY8XtuEijL/Jbax1nWzZJ
	+fF6ygDMGcyavUSzorIuJaoYcGlP/f65zhNxhlerFdtUJH0DN/exaM0xRDjYNcbxnVy9+F4GJfQft
	ybEvKA50bavDF0NfyX84IGTRaXhuFrJW8NWzAKBQ8Ma+zr0ldi4yVyf8BzsWf3x2cmx0MCXOFYKsK
	k6JKuIw+hO1hFqxmOZZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUXOV-0000000DsLY-3K20;
	Tue, 02 Jun 2026 22:15:31 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUXOT-0000000DsLC-2I0z
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 22:15:31 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-36d8b644473so3108508a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jun 2026 15:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780438528; x=1781043328; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wyg13nmb1cl4XVRXyc9+1Xf9pv1Lvsh32cV5wFSbV18=;
        b=rMpldvJtL/F0aG6TfeuW1hN6PQF83yroUYkuD+Mer2M4nAhRNTAJPlzqQA4o2PLe+2
         Qz22lKZ1dy5/0aVUqGRFJswTTSzMqOU98woeCr/mCJAuGul2NPCX07s+qM3jsqset1Hl
         /u5kQcjSs66ucK0gAW5nowRjuxCLpgiKFuPK+Y8b/g0RS2Z2hA0r5TrmhopsYgDgesXD
         xQ2JlfiRNx+/f/qji2EVoGqoRwmyZ8+hwGzSZZ2V/5EWZhjV4ZYKjw8PcQnQcGUVdRew
         4+CwsBgf7XAbVlh5eDdTT+6eTBAi86GZWsaQ5okQt+cak0rabozNQT6Fov6/mgy22900
         Odsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780438528; x=1781043328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wyg13nmb1cl4XVRXyc9+1Xf9pv1Lvsh32cV5wFSbV18=;
        b=a0m7rlBs6iF/n0ImKX1zhOUjSftO+qoFnozOvbUSJvDx2AzSmm6RQMMK3zyZ0I08sb
         dMIR4Sk+2RoMvyiiMbRlQUL6ABXguVZCXMelFDJQZfDaNUzW478hKtvZRN7Vx5kQtX6M
         ysDsJEHYRxaw5LCR2SLvi3XdUvhinbPN/7CD6fSpqAK+4nmc+aIubH1wO8SABL+V0+Yc
         2GOqACBir8UGTF9Qpc7Fm6qoS+GVaEMqk4Ckt4KqlxCGKdqf8lUvxN20G+gRfHBgY55C
         RYPblztg2noa9LEuRc31YnW0utHMaKjlAfZN3plWCVTphXVpG3gDXaOd7RMjcAKdHVzu
         pHrA==
X-Forwarded-Encrypted: i=1; AFNElJ/5dZCwig7wTv9bEX2Vqt5s56U00KZMwxeqo+2X66T7PnSVH12HARJfO0LdYrzi052yE2dQnyC+uHDnAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yws11ONjiyKaGgrl3FpxXOav8wjG62EyeaUCLvKeNcvcTWyw50T
	G8nr4lnAyzaHtapMP5dQ++4XbpDpP8T4/8d4Wa9qo5azQfe19VgmX4oo
X-Gm-Gg: Acq92OHW6ek+UhEoZjRrYeaTtaNmhtoQKWjW5sJV+YYITcOXufQvszvJlMSKmBu837S
	vz8OiNqkn5ar125/WTnbSgr1smNAzmieVFr8uNg47FzWrpEHmmUSCyZzhpYRUqfqX0IAGCl5x5p
	pl+RgihPyquHBQB3x4KWAV6fN2gLDHyP7Gw3jih9mD5RvueC5CJkIv8pWUO5IVWqk3jeTpYJbFf
	zgKqVkhDRCgyLQqisMVbl/SSr2Pcx0KOwfhSCA5nXGgNjw6rwnsYn+xXpXwS7YAxl1/Gh0d0/mA
	0IoamKGHXpdvF2uEth4HeNsg/2fQR4cG5grQrLGNB8X3NUlMnW621bNAr9t0ZXtfcRK0Ewh80vi
	YoS1AHr5ZUreQiyDjYaC8ef+N7id9ORY75GFhkEGXhzKLE01FmMA6oIDHa0lIPWFyDxPboJJN6+
	xiiao8Uy7QimmzDFDGFK6ykPI3baywV+neQbulBET3/66M
X-Received: by 2002:a17:90b:1d87:b0:368:a297:bd38 with SMTP id 98e67ed59e1d1-36e2f3c11dcmr712758a91.7.1780438528332;
        Tue, 02 Jun 2026 15:15:28 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36e174db6afsm287366a91.2.2026.06.02.15.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 15:15:27 -0700 (PDT)
Date: Wed, 3 Jun 2026 06:15:08 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Zixian Zeng <sycamoremoon376@gmail.com>, 
	Han Gao <gaohan@iscas.ac.cn>
Cc: Inochi Amaoto <inochiama@gmail.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Han Gao <rabenda.cn@gmail.com>
Subject: Re: (subset) [PATCH 0/2] riscv: sophgo: sg2042: Enable PCIe DMA
 coherence
Message-ID: <ah9VwHZbIuDSqmbe@inochi.infowork>
References: <20260331171248.973014-1-gaohan@iscas.ac.cn>
 <178028263198.557087.6386925175219722340.b4-ty@b4>
 <ah6gcvKQlHlrW1qn@inochi.infowork>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ah6gcvKQlHlrW1qn@inochi.infowork>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_151529_588900_DC370A42 
X-CRM114-Status: GOOD (  12.36  )
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

On Tue, Jun 02, 2026 at 05:21:32PM +0800, Inochi Amaoto wrote:
> On Mon, Jun 01, 2026 at 10:57:24AM +0800, Inochi Amaoto wrote:
> > On Wed, 01 Apr 2026 01:12:46 +0800, Han Gao wrote:
> > > The SG2042 hardware design supports cache-coherent PCIe.
> > > 
> > > With recent firmware updates [1], it allows to use DMA coherent.
> > > 
> > > [1] https://github.com/sophgo/edk2-non-osi/commit/017a5aea26a066fd2bf501b7893937183165af36
> > > 
> > > Han Gao (2):
> > >   dt-bindings: pci: sophgo: Add dma-coherent property for SG2042
> > >   riscv: dts: sophgo: Add dma-coherent to SG2042 PCIe controllers
> > > 
> > > [...]
> > 
> > Applied to for-next, thanks!
> > 
> > [2/2] riscv: dts: sophgo: Add dma-coherent to SG2042 PCIe controllers
> >       https://github.com/sophgo/linux/commit/e728a57834d06b9bbf9bbed69e3ea16416d257d5
> > 
> > Thanks,
> > Inochi
> > 
> 
> Revoke this apply due to https://lore.kernel.org/sophgo/ahu57vcS0oOFmCI9@mertle/
> 

Reapply this as this error is resolved.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
