Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FBAC88E75
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 15:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=htvDSZDJuENHrNS32ymKukvNecdT2ly0KRS+ysU8EoU=; b=l5p9LEb70cY0hL
	8jDPAebIMpBRVZta/7sejTobCXP2oziSpNco1eaRDCL3Vbf2jv+RIbFfTasjPeje6L/ERKPU3yxJL
	nU6vkgwGadYYiwyJTvvyt+Le2ReJJ83ZD0hWxCNo1tXJee3KJ0wtaLDkTgPnx7UANbgZbAZYSSvcP
	e05EjXNp30qlaUE+6kOMrEu3YMkIUPnkYlnRvLaE+CU/U8yTlJdl8tKAaHYH5myF6Gv/0/90aJSOo
	QCUr/QFGT5b9Wy7VPNGjFJG3J/B73U+mTv7j4e2ZabSYdXtpbYhm+7LTPEyXaPLz4bJgPKfszZrg0
	R/lOBC9VXy0qNSW5RMrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68bs-00000004AAz-29k1;
	Mon, 14 Sep 2026 15:28:44 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68bp-00000004AA8-30hT
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 15:28:42 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-8692a856865so2592722b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2026 08:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399721; x=1790004521; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P1JKkCEZE/08JY/nIzj8bs0RkzGsOhreN3VjKeZuF/k=;
        b=Uf1LjYjttJXsfc9gSAXRHnnNNaG435aizIq5XQ2iZ0z1zCRdPxzsoOv+AXQJ9pP/CK
         VCIYCrZmzaGAXskWWNHj4MfyoknNidv5blX4D/oP/s10jOjHczBy5Sp7iGyMiq2E5VxJ
         6wryweW21V3D1o+RtG8CI2O/tNwjFjzIvoNYJNIETs71t+YEebwZJWnWijSMqQTTuMOs
         Jq8FDsPzZ/40mi5oVFyPZyHHJr8DEEjcABYV9KPP4gwYsHUTqV7q4mENPbert3vwO9ch
         oEdNNoM7Wazo37MjZ/NjBWt+Dvx7npojoIj8AbFNEsj3W/LYUMHqxMRZ4Iq6XiqbSC/T
         Ig3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399721; x=1790004521;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1JKkCEZE/08JY/nIzj8bs0RkzGsOhreN3VjKeZuF/k=;
        b=jORF4acxgdL/pyXJQA4FVv4wHIGQxpYXeJRpKCwxLEfEGkXp7aO4fCl5ewIuB6V4s+
         3il8ySskU8z1aNvXX3jYstLNU6l1Og5n3vEFe8h9NVyKYzeKtgwS8Nh1fgIYwpTvWftU
         YhDPOkRByQI2axPieme7tEmixK8THLYsjWROv7FCVVdGPu+9vySGPAzO4XwM36V7WpQ6
         kth7vH+MCdkdObqjLAeW12HJ4DHZSx/YJ6MhAy1mLvexPpWkQeEYKJMnJoZGQvGwolHW
         fZ5aXSR5Q//HcdLa69xdHmVJlxe8vGN0oDPCkjpNJusDCqQwkcZ51DovcKY+QmSNafAy
         lURQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+zovfPeI2Y25Mrh6o9x/OtBExE02KoYWg/4wN+CQqp9Rf2CJ4x2WOQ3W+calxRMnNTdfJZOoSOABkiA==@lists.infradead.org
X-Gm-Message-State: AFuF++n7c7ZHBtCuaj/SrICFVNGAGtyoX7HfrfqDha4O06IlXSsJAi1C
	hvUZQq+jPBGVsUJnUl/3YtDDVvHJtAe6Mrxu3AO+sbyqXgP5zq1kh8Ym
X-Gm-Gg: AYBFou0boklcOCa1lRA3Jy6JiYWcKWghQ1k63BBc5sPAMJQvWRdhstUtA4hVNLL3oFp
	lK9HoLI7OQdJtkdVw3jj4rmT2nQUNpuUzIufLfYEEfFVmEF403BzKU6WW4ESKmUPjeu9txFD00v
	AS85ovLcQdGkU0K+hVzgqlyrfbECbFS4y3LP55PouVaILdjNtXzQLTZTcU3eScafbRU86Exx0aX
	1ZFM3jwFgWwxAsR4UCdqjmxjD7Zuh28Xzu1CzHyLcikpEmSxdRcW4jpnDS7GiFepQ/BmW4EFRjU
	8tlTJ1MFppyZrxhHcN4QOs2Zzyh6mCoFLeEwXD+MeRgZT+E5PaBwDqXX1F3TabzvBWRPai/nsFK
	3PHJ04GGoWt785AXSjwrGcQEHf0uhz/qr/+p9YE3ZVGarAdxm+L3SQKMyXBBX+llR/z8fPC2axB
	P9CxuJB2tdT4dw2XjT1CCYAhxjhJU5fHtGRqbYSSmj55IhhMNFfJt5y8QHRs4+QK5zs/nJcFXCy
	Dud08DGAxvj
X-Received: by 2002:a05:6a00:1797:b0:857:72ba:ff12 with SMTP id d2e1a72fcca58-86f865b48c2mr6631339b3a.26.1789399720794;
        Mon, 14 Sep 2026 08:28:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a5c052csm4929479b3a.58.2026.09.14.08.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:28:39 -0700 (PDT)
Date: Mon, 14 Sep 2026 08:28:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v5 4/6] hwmon: (lm63) Add Sensylink CTF2301 support
Message-ID: <db900549-54be-456e-9fae-5f04c69e7d1f@roeck-us.net>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
 <20260914-ctl2301-v5-4-522def70acb4@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260914-ctl2301-v5-4-522def70acb4@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_082841_759644_33783B2A 
X-CRM114-Status: GOOD (  10.98  )
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

On Mon, Sep 14, 2026 at 04:18:04PM +0800, Troy Mitchell wrote:
> Add Sensylink CTF2301 support to the LM63 driver. CTF2301 follows
> the LM63-style temperature, tachometer, and PWM register layout,
> while using a 12-bit local temperature register and requiring the
> ALERT/TACH pin to be configured for tachometer input.
> 
> Register an optional thermal cooling device when the device tree
> node provides #cooling-cells, allowing thermal zones to control
> the fan through the existing PWM path without changing behavior
> for existing LM63-family users.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Applied.

Thanks,
Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
