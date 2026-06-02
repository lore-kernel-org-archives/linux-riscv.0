Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22411CD6E57
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 09:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SzPJNJKgG+sMxQPfCfBrqDjYWYVXiLmF1pNjNpxGYmw=; b=4TWuHY0S4pAbmU
	7V8ubaknlt+wln7hwhJSTkdSdymXQWI4lWCtahKkLwZvEM1pwDrB3KVfNYy7qbZ+FaY8RYhDRvWwT
	9UDFO85Ph5634qtIoNxFCX739pxht864lZzOQZ0laoIUyn6G0NoKnhNUO5revjUFBcWhbJDhbIZHo
	34UorsZFLD9zT3+54f3DJnT0F6bwNhCUIJowf51JvaI5KostJ/CXN3h7iGtnPFO/kxU5s9JzgvklQ
	pdN8WtuDEFTfWXS0kU7fc3ZsMWdfHSKim2RasWx5VasPTGhwU3q4PEeywzQxZ226ShaEAFO6vkdrf
	XNkI9ojIhPecKipUpTeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULJs-0000000Cdxh-3hrm;
	Tue, 02 Jun 2026 09:21:56 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULJq-0000000Cdvf-219l
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 09:21:55 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c0c20f0c0aso15508065ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jun 2026 02:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780392113; x=1780996913; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z//VwuvdHhuIm5iM3Xnk2cWF15mlTMeV9P1PgKLz92Q=;
        b=LsjQM/qJyUPfd9jykejwgvLiVsa5GDBe+IX+g3EakBfnZtqbr1IuVNToTEiFmTyGgL
         FvqbNjjfmBnvMuMGo8/rhzUOx569sdE+9jL+sSgHc1YjNztwGCmhlmzODo0yaiUFZ8Bu
         6n/DE2gTxBIBeG6l9+dOPnOBQaYPHeAvhbkkinwnTWVLl2TvLhmrdEd8hQRLAkXlDSAh
         WWQtc/TpPkV0mG80Q+6splR5g0ceO6YmAD08dyYCfn1hpyCmrLmSUzZzGIWFDy/ah8pQ
         VJ9aqdCjawWb5ZDGOjfXex4zQE/wa5fiQhqGApV6ETsp7OM5oabwNVyAiLw+vsbZ1hFZ
         BOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780392113; x=1780996913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z//VwuvdHhuIm5iM3Xnk2cWF15mlTMeV9P1PgKLz92Q=;
        b=Vd3G9GAml1vd8pb1VRSHpgGh8aumK3R6biSRb8naSwtZy3Bpv+cOhKj9rX23m2c7KX
         mTCB0zlw7R79C5OlG8TTyqSeAj2XycJE5e8lUTunwyZsicWpNXOX4VZZ83ZysOfpYqdj
         ddT8MwTz94vthMyde89Ob12bOOeG77gvp4p4KzY/WM4yAgm0+BO1aOfZHc53S+cflXNN
         vHG0USzN2HUb3DZ+2+H2vbaLWzL3enAj6wjPM1w9BMyeMFpCz9CMQW/b4kh/R5UIEH3X
         B07a7pfwWm9LKjtOs8fTfuECGAorKEqPQC8gbU0hGiFXbdaqkystHFVJ0ONXO6NYU8TW
         XvKg==
X-Forwarded-Encrypted: i=1; AFNElJ8awLQrbg8SOylUrxr14+e3r/HmC/CHYTefF3B8e6gAcX2s1Y9TK32sFrjuAD3ZosUvyvmP8vTS73liuA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8hz7QI5cWLwC2RLl/8i8GY9zL04uGKKczbxXRm+94+lBqDE0W
	x3d+Z5A32+uqv+jE80H5QZ9r5vVMklaeNWUyFjlLlP5KWC4eoFTPjpSz
X-Gm-Gg: Acq92OH114myqrNGAA5qdbJygl1lQ0nYRgiDNYsEqNwH5+QF+PcbBf5CJAHJe/85RgV
	cBRIRhwHYglWOcmno3UVPFP1duVMuZFXaIdwrCgX1x3CgkdKauBZ19F/sQqTaDsBzyG2YuY9jgW
	HxU8rIAt2WlnyXSilBq87M7oIorOxgoBBROMVnSeJwI1F2clZE6gJN9BEGWHU7sIX6umDVmlkho
	tKzLa2L1oAqm1ur0Ktz17PSiX5oxmes0J2Lcud+La58AqwOVhJEenrkDKvXXrMTUOTiH3mCOJcZ
	UA7Ag9lK9vOAxsZeNxpjCAu2s38gyXA82DlUqfvkThHwuozeL8G+AFVaFa3cy8X/PT5KLP3t/Jh
	HXoyAM7b3W87RJB71pnJWuURnzPDg/yNICPImjKaaUDa0Tmx7t/PlZ6Qfk6/VNzPPAkaJYaIZDA
	ocHQbRXY4VyYAe5DIaZsl/MmiQvbd1wrjAKA==
X-Received: by 2002:a17:902:ccc8:b0:2bd:ba44:6c07 with SMTP id d9443c01a7336-2bf367f292cmr150201385ad.16.1780392113499;
        Tue, 02 Jun 2026 02:21:53 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c5a350sm173102185ad.83.2026.06.02.02.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:21:52 -0700 (PDT)
Date: Tue, 2 Jun 2026 17:21:32 +0800
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
Message-ID: <ah6gcvKQlHlrW1qn@inochi.infowork>
References: <20260331171248.973014-1-gaohan@iscas.ac.cn>
 <178028263198.557087.6386925175219722340.b4-ty@b4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <178028263198.557087.6386925175219722340.b4-ty@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_022154_524990_CE4A127D 
X-CRM114-Status: GOOD (  10.57  )
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

On Mon, Jun 01, 2026 at 10:57:24AM +0800, Inochi Amaoto wrote:
> On Wed, 01 Apr 2026 01:12:46 +0800, Han Gao wrote:
> > The SG2042 hardware design supports cache-coherent PCIe.
> > 
> > With recent firmware updates [1], it allows to use DMA coherent.
> > 
> > [1] https://github.com/sophgo/edk2-non-osi/commit/017a5aea26a066fd2bf501b7893937183165af36
> > 
> > Han Gao (2):
> >   dt-bindings: pci: sophgo: Add dma-coherent property for SG2042
> >   riscv: dts: sophgo: Add dma-coherent to SG2042 PCIe controllers
> > 
> > [...]
> 
> Applied to for-next, thanks!
> 
> [2/2] riscv: dts: sophgo: Add dma-coherent to SG2042 PCIe controllers
>       https://github.com/sophgo/linux/commit/e728a57834d06b9bbf9bbed69e3ea16416d257d5
> 
> Thanks,
> Inochi
> 

Revoke this apply due to https://lore.kernel.org/sophgo/ahu57vcS0oOFmCI9@mertle/

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
