Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F891606A33C
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 11:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IzRb6bdt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RkFkfoGS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Gun4jB78eojPh4G+PeG2uXvo3PqsPvm0MPkFc4UXWgE=; b=IzRb6bdtR+rEnBAvIGP1me8uEs
	4uTEJ5UCpBOJJDcVd0ZzL1WcEJmeYF2yA8clMB7JBxjQLeis4A9tK/2Vb2TCJgHPB0aXlk46XNVgd
	0cZZ7jlokYWnxt26qc4PB7d6j6icIVq9DOSEMmMrJw92jjAuaqURuCUn7ITmfutn3hYmuexghV2Em
	uGod2OtEi775wVv9NVgopHRIt8ZuRQm54pltjJAuQNoriiYINGmBcuXfwEwsCesl+Cs1qmnmQdWLy
	llDp10xzAfDisH3IcQoY/4L60finYudbC87RgP5EHZJFuzvPYbjiP2wWfGIKdagQZERnQGkiB2whV
	nLhGXF0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjva-00000003cAx-0VJ4;
	Tue, 10 Nov 2026 11:22:14 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjvX-00000003c9z-0H2P
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 11:22:12 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso853315a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 03:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794309730; x=1794914530; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w1281HNKMHRY/p1WTqMav+kPZ7qzyo5uCTwzSETBiXI=;
        b=RkFkfoGSlwdoKkzs40F+VIFHdiTm6JyBeQS0pz7UYH64X8hIWFM2rWUjHRK6fFY75m
         oGcuhitku0R8Rrsj2o6pv5TyEPevOx2oY7nui7jqpJTIzonCbULSyBxXw1I/JMe9tpLs
         nEkYsLp+RzRCaF6bRoxg0R4GMbaSz9T21Xq1OiODYFzfFME4gNBq02W7vlSxiTLdkD+B
         sk6fnwLRXtiTBs08bvoSDm6UKTO3+pyQyp0g/jKiJu90q6gxFA/wjEiQd1oY5CaRqCXu
         w27A4xQ6CyKLPVekYuS47E/hlNgqFyAEz2szlFchqObFsdBbw3pW2mCeYmob3SEonUOL
         6S1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309730; x=1794914530;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1281HNKMHRY/p1WTqMav+kPZ7qzyo5uCTwzSETBiXI=;
        b=S/yzWCiCmSs+UY3USSHxeYEOJ3yjQ4913WbKR2addLEOK9iU3evxiYpHzrxbsvEtKQ
         x1N/5NBsPpEV9mjR6ZoDKLaNaAbT7ihvZaL2sWH/mQ/Z8lIlmF6R/8eZez21BValPRGD
         s3jzB/p+sZdmLTrKZD7KaLWoKheB5oFG4MOD/m0oFdntbmCix+QK+CwJxTUyzkOLR5B1
         YJbg3on7+iPQu1tG9f3Bp1WZY9Sf3EryX6jOWuH03Q5yg5v4xurp2FjD9UibEUvo7smF
         xuU9MgX1QgdobZlg6c+vMDDsIjFIkw1VNs9rK65Vz+W2+LIDK973Z/7OtaDxUlvSJItz
         9leg==
X-Forwarded-Encrypted: i=1; AL+hErFxFgT8TqWg0zXXhmiSqEzLSInXaWh5sSyJ+6PMlGcpjRVgew20W2UNePaenngQYNlCGWQLizCWPn6h0A==@lists.infradead.org
X-Gm-Message-State: APuU4Z84oFhj14EdvudJOwIv/P6vOASdcQUfpsiUvoVjdmQ5ezG3gSfR
	Qp6MP7C7bgyl+guHThwe9NCOpBdUdEUBJhV/6ff5LoyhuQbsjKqHxdm4
X-Gm-Gg: AYBFou2eFHevWOD2gCVhL518dCD7kpV1LorcLIVpFuFLMX96ScbSh040AKoqKz2iWpd
	O882KuLS8GIXftRzv52SMLdw6aB+Z3jLhl1VUAOX85iZj7+gcVfmKnWAU6N59R+K41X2J+/tZIY
	IUx+ZLaGOHcskLuchWym/b9pZ6xIXZZ3FbTfSvgcxfku/FpOnQmE6I1f8l4Z3/EAmWiHEYZ9Ivf
	8D/yT+Fi9NPMfcYVhyVVUnqhH833TxdaLbEq+BxLYDktZc9H0zLlhELDAYQaX4UVg2fpuajPm0J
	NX9dFYQRHt8Ipmb+zicKg3L83OXQ8iLpzCN9a7TpEXdDyWBO3cyKuTyNYsK8VgS4N60tHTDUkjG
	fOCE0YznMO9FQqM+Sqzkdb8PqihQjbIOikGFKAjEhjeyY6OOTYGxcaS0Hg/9gD8OUXbat3Ig2iI
	fmip+MjqLF8rmfjOgwIM+Ai1RAIs71FUwS0nrDpwv3Jk7YNMtyu2vyG7UzvGKtc7vzcYKkkPNkH
	Y5GnTouv5VI4XL1RUeYodH4KaSExA9eC9VuvMC5DW4l8ZZFBXTXRdBlmM9LBfPcx1G+dW5yBXFZ
	cAdNxtB4BFpre+w1hRHLWarWibo=
X-Received: by 2002:a17:90b:1641:b0:3ab:c674:cad1 with SMTP id 98e67ed59e1d1-3b166ce8601mr2382151a91.50.1794309729892;
        Tue, 10 Nov 2026 03:22:09 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678d1c0csm3413913a91.6.2026.11.10.03.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:22:09 -0800 (PST)
Date: Tue, 10 Nov 2026 19:21:50 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Minas Harutyunyan <hminas@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Longbin Li <looong.bin@gmail.com>, 
	Dinh Nguyen <dinguyen@opensource.altera.com>, Paul Zimmerman <paulz@synopsys.com>, Felipe Balbi <balbi@ti.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH 4/4] riscv: dts: sophgo: Enable USB role switch on
 Huashan PI
Message-ID: <avL-KigWPepz-Z2A@inochi.infowork>
References: <20261110070627.217946-1-inochiama@gmail.com>
 <20261110070627.217946-5-inochiama@gmail.com>
 <2e878ad2-1a20-4ee7-8460-64e0d9774ff5@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2e878ad2-1a20-4ee7-8460-64e0d9774ff5@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_032211_116853_D7739E8C 
X-CRM114-Status: GOOD (  14.88  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 11:41:37AM +0100, Krzysztof Kozlowski wrote:
> On 10/11/2026 08:06, Inochi Amaoto wrote:
> > As current the DWC2 support role switch on CV18XX SoCs. Enable it
> > on Huashan PI.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> DTS cannot be combined in this patchset and must be split. Don't mix
> patches from independent subsystems when you send something explicitly
> targeting only one subsystem.
> See also: Documentation/devicetree/bindings/submitting-patches.rst
> 
> 
> Best regards,
> Krzysztof


Sorry for this mistake, I will spilt them in the next patch. Thanks.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
