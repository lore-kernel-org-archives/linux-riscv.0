Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2951DD58E7D
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 08:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HZV5NZOUaiNJ5Za7AhnWck1fqDqDJiZtdOeYfLS6kvU=; b=3F1yHzc3PaOOor
	QEjh38h/9CRBFHFKeyeyjXRi9bF+NdKQWK7020rdq40MAv5IB6NW+gA1NVsNLaJaVzgW/UdwGAv6W
	LhIrNnGTm+514mOht68RzubJD4yFUgair+uxMYOujG6A3ZKPI40xJ+vqnSW7yyEwySdy5W+kCWwSf
	mkYGCdBNM1H4QxChmlEl+gUMI8xiuYbwL0XTXjUK8Iowd6KEt+FmjkyHOn8rsm9+pVXJrCIfKbDaT
	u4ec8XqpEHIRzF3DhEBFxB3ShJbjrYPtG5Lh92DkO+DeUKl6jsKLlyCTrblobHqoMe2Uipzm6lWwS
	QXD0W9GyuVS9biVDmStw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwyow-0000000CWxX-03NT;
	Mon, 02 Mar 2026 08:40:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwyos-0000000CWwo-3hTF
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 08:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772440801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vdiPWtYWuhb9fL37CazwRyCdnnWG5JaBkwTXBZF0Kdc=;
	b=GE3Ia4GYJ+2qkg7nSgngMTK9iN69C6rYyhC+FqMog9YFvhpnqOQRtNxrNvx/MJzBQkdRr8
	USm6KXI9O7zAJR4UGH4Tvm62JZBMx0l84mpOCIQs3R3mjOGNR2pfsT0kgvMUhCPn+OUrk6
	lpd9DuGrEeSuLRUVutSImy8qDeBC8Xw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-_IoNSrz5NZas7_QLLC9x_Q-1; Mon, 02 Mar 2026 03:37:54 -0500
X-MC-Unique: _IoNSrz5NZas7_QLLC9x_Q-1
X-Mimecast-MFC-AGG-ID: _IoNSrz5NZas7_QLLC9x_Q_1772440673
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-439b5346b6cso763977f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 00:37:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772440673; x=1773045473;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vdiPWtYWuhb9fL37CazwRyCdnnWG5JaBkwTXBZF0Kdc=;
        b=PCpeUQJwOwbMvPcFpb5wCT94T/nDk3QKIqZVdU/xeKttQVUKxqlT+YjzZ2DuCzRn8C
         EhiHJ1W38U6KOm6OdmjDWymtcOSgBJtfc7e8mzb8tTRvX5zuKZ7EK7m7O/2KrofVkWvl
         z9ga164RaBbSfWAUjcALVkZvFV4azX3M4/Qp1E57vQ2WU1kxSFpWm7bSK2bvy0I680pS
         VpyH88Rjl+6LNx/qRH32XCW1chjPqirtDHo2jD/kpM9fLY1ltINRFBVdFlAUlSH7RvrL
         pJW7kX11R9Ux5g2KMiLse6Oh9NaG1x1iRwo7zo9uOKkHnnlrc0zwPNuPOZ5e2mMxyWcV
         dL4w==
X-Forwarded-Encrypted: i=1; AJvYcCWCZEMij57HYVnsw3HRw5hOQGLCgqr2GageSDhsA52V4iS12rJAR7BJY5lhKBzEsWDYblpTQIEqcBv3+A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi+BeVkvqimZ6DCrtH+ZzQW3TaWDwSzYUUUkp/bmEfxOlYm+PL
	XMKZwKEtcMidOhSMXNJIiJwZt1KzdTN8I0CiSWVwBm8SCn/FIvpveMssU1BVtMStXxMuQRG6GMc
	DxXZNDmZVDMOwJGdoZbfVbkjoTWg5TuVLsBw5G4qU4ghRGs8oCHCLKPnGLBs1WBdM3ckNOQ==
X-Gm-Gg: ATEYQzzG++Ly5lBzp2Q9jw920g1ZdwmZ76PAqjqAUPIY4hVyc3QdUzgNkffkyzV/Ggw
	fOfT7X/6fUX/U3uQLIm+VU/Iei5ne6ldFHGbP1M/a/UiYhc5bQrlwJ4EwmYVLPgNIh5exZ7Ungj
	Tn9uhtVMpZIFZ1GkgP+xgucVchCU8ldaMjFLGOljVCvPwsDidtzh26amtoejNUPCjytguLmN5fR
	nLhpYKjz+SQfLFLasHgsuGBov+v3cU/+HZUn0BNVHRJ4I91AV99TJY4JY42HOJi7UqQ88lxC36z
	gDnj3tOxnJ5KUF+q3CYjH+PX8ckAZHgYGMZdP7d7ALnXhSWEQYorHxn59yhb9jMKatGxBWJAKr4
	PAhHNioadHDHxSKlPTVsMGM2NUImjDYzQ0t6AL/bMwhNyhg3X1+uMWHZrBaLZ0PJHejuPp+1Lru
	GfK3RW13X3t/FM
X-Received: by 2002:a05:600c:8b30:b0:483:afbb:a086 with SMTP id 5b1f17b1804b1-483c9c0e31amr187765705e9.29.1772440673345;
        Mon, 02 Mar 2026 00:37:53 -0800 (PST)
X-Received: by 2002:a05:600c:8b30:b0:483:afbb:a086 with SMTP id 5b1f17b1804b1-483c9c0e31amr187765305e9.29.1772440672920;
        Mon, 02 Mar 2026 00:37:52 -0800 (PST)
Received: from localhost (220.pool95-22-156.dynamic.orange.es. [95.22.156.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439abdf5430sm15077496f8f.5.2026.03.02.00.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 00:37:52 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
Subject: Re: [PATCH] riscv: dts: spacemit: adapt regulator node name to
 preferred form
In-Reply-To: <20260226-02-k1-regulator-names-v1-1-e87695d50159@kernel.org>
References: <20260226-02-k1-regulator-names-v1-1-e87695d50159@kernel.org>
Date: Mon, 02 Mar 2026 09:37:50 +0100
Message-ID: <87o6l6vd7l.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ydaSpn-iQG8T7fGBczOG0Cpwnci0OwBHk2Ksz7PvH4s_1772440673
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_004003_015140_5C252B30 
X-CRM114-Status: GOOD (  12.41  )
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

Yixun Lan <dlan@kernel.org> writes:

> The preferred node name for fixed-regulators has changed to pattern [1]:
>  '^regulator(-[0-9]+v[0-9]+|-[0-9a-z-]+)?$'
>
> Adjust all SpacemiT DT regulator node names to fix this.
>
> Link: https://lore.kernel.org/r/20240426215147.3138211-1-robh@kernel.org [1]
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
> In Review of adding DTS for OrangePi, Chukun mentioned fixed-regulator
> has preferred node names [1], so let's change it now.
>
> This isn't strictly a bug, so I've not added the Fixes tag.
>
> Link: https://lore.kernel.org/r/20260123145015.1926865-1-amadeus@jmu.edu.cn [1]
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 10 +++++-----
>  arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts |  4 ++--
>  2 files changed, 7 insertions(+), 7 deletions(-)
>

Looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
