Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987F0F417EE
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 14:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pRChgMUupAEIrF/0ki4HS0nHY+MKallTaT9A2bgBejQ=; b=X7litJe9IuubFf
	sfX04gTv7iIOY9DQFOl62sNMH3+f0M8yVN+tO0R9Mg3d5qBv59udsvjvjq+25g2NopsQaoYcFw1UC
	3C6htDTR86hzR8MCdJR6yhOCQojIy/FSXFBecbGbYZl9ONemPvw4Pqbs7LRLjxjDzdJPm8JwPxKAy
	UYfIxypI6oM9hFOp9UrS4RapaMlWNlaSvpJtsiRY+7giJLO24+bjxGhTlbF1kSDcMazNo09fEk2ju
	dL5G0MlB0PS87lBePmLtIsS7aVl1nDNEXuCt5jnah3+L7/yzpcd9x1/cm+wBT8HbuoY0zdJOkqW3n
	mrF/nFvm1NREKATxLUIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzc3g-00000007XJD-1Ffc;
	Mon, 09 Mar 2026 14:58:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzc3d-00000007XIF-1Bg2
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 14:58:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773068288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H1BNKFyRsZcHlEZIOZ9hlANGFti9fPCQQJkxNtYA6no=;
	b=hYCFxVR1yGzvrrBQ2T2lxRjwo8MsPpK4ijmD/YeGWElxTNFJWR62eudpIE15gxMD08Jdcb
	K+LICWu1e10CtoTnDboaiq81srJ5g/USPSQgToXXRSxDPOzPHcYSuyNgckxWM6D1T7I+km
	o7VncwsHQTWL1l1IYzcbSx05WeVRkJM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-qMyT6KzuPNKlzQZ_jfxjZA-1; Mon, 09 Mar 2026 10:58:07 -0400
X-MC-Unique: qMyT6KzuPNKlzQZ_jfxjZA-1
X-Mimecast-MFC-AGG-ID: qMyT6KzuPNKlzQZ_jfxjZA_1773068286
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509181cc6ebso4333991cf.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2026 07:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773068286; x=1773673086;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1BNKFyRsZcHlEZIOZ9hlANGFti9fPCQQJkxNtYA6no=;
        b=uVwWeXT9HOaSewOUgX1FHNdjOe/kiwc7w3tuL8aPMbTnZ4tQmBfATBxOdrM9VsRE6B
         L9Tt0ZiLK2eht+DEI3tILdY/kCcZ9UlVAHMXIsUF6XIur/saIZNlE1L3RWGrZqnUF7Sl
         cFk2b7A4CG+wX6RUKvK6OZn1gumGVB220CkPT2gy4y45w41BSnSET+ZSPaVhoToQ3QFR
         jVtbvlsLC4dfKMvl3PGHEgUdQTEqPi0MvSQmrRoa0/tdrXiSBWE4QGh9abZ8UQUS8VMs
         cjsCTgi/dixq+ktI/nAWI9bKVI/25Vf+ZEX0J9dLf3kpIH37ye57eoqMTN4eK8+eDQhp
         ShnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe+UfVKJqOnck1/bI2VGkBjCTRCgXYDzC/BlCRo0aNMpSRCmjPUpAq5NZZb3rztAexlcSbhqW7qEmXIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf7RvA9shbjOSXJ5IzB9ORVgrgb/j2ctIdadgDFpODUECC1NNB
	tggxAEchJJ6R0D86PvQinSqV0n0HjdMrinvgfVvV1GFvKfvrytv/Ww4+qCdlVdKpdI7j3IVTflw
	nAD4jb50tW9h0Grd28BASFSyNe5BOwqj+GBWxdMSdBKxJSFSK2oixhNhC8jTKYUJyJpw4UA==
X-Gm-Gg: ATEYQzyZqGP4rNdcuH7Azs458ZbgrubZ0PBJ1RLeLFIcNTwx//4BbVM4oeBJIinp7/H
	pqa4vM4VuH1b9c9iz1Hl3pB036+IgsUh7hB6JFQZXoHRi7nlvfh+l+RV3rK+k6fUhEIlODT9iuB
	TlPSDAm6u/tDqNDUoGsix0kUMgy/nJz8R6HM1uz0/uEKX11btiJ3LnVjmIQKXGZLwzwuuhwS+By
	xBHVfvX4UxzHGIccBzn/0cxr+vPqXKoZAk1kCMLwN0YQx6ItZFa5pCZbWW9hE5nQ8YzB0Zi4pun
	BrC5mQggV64y1d5sQpaifMHqEXdYDz04j9Bj4iRekLQriKyS1reQHadGu7pNYXztI2fTmrUEJEt
	0t8IuGsgJHMV1mqzLDe//D6H0uaG5DXDOSyDSYnV4J77Ql+y0WmpIQywZ
X-Received: by 2002:ac8:7dc1:0:b0:4f1:ba0b:90 with SMTP id d75a77b69052e-508f46e67d2mr142736281cf.8.1773068286411;
        Mon, 09 Mar 2026 07:58:06 -0700 (PDT)
X-Received: by 2002:ac8:7dc1:0:b0:4f1:ba0b:90 with SMTP id d75a77b69052e-508f46e67d2mr142735841cf.8.1773068285876;
        Mon, 09 Mar 2026 07:58:05 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-509009ad4basm50577251cf.11.2026.03.09.07.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:58:05 -0700 (PDT)
Date: Mon, 9 Mar 2026 10:58:03 -0400
From: Brian Masney <bmasney@redhat.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH v4 03/10] clk: fixed-factor: Rework initialization with
 parent clocks
Message-ID: <aa7f-yq6e4WpxNrU@redhat.com>
References: <20260304-clk-eyeq7-v4-0-9d6bd9d24bec@bootlin.com>
 <20260304-clk-eyeq7-v4-3-9d6bd9d24bec@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20260304-clk-eyeq7-v4-3-9d6bd9d24bec@bootlin.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TSLi9Tn8P_S3i32WUEidz5D8HRedqg_ClPBcjQnvKa8_1773068286
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_075809_390992_61EE8A12 
X-CRM114-Status: GOOD (  15.44  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 04, 2026 at 04:25:17PM +0100, Beno=EEt Monin wrote:
> Use the same sequence as clk-divider, clk-gate and other to set the
> parent_names, parent_hws and parent_data in the init struct when
> registering a fixed-factor clock. The number of parent clocks is now
> only set to one if a parent clock is provided.
> =

> Previously the number of parent clocks was always one, forcing callers
> of __clk_hw_register_fixed_factor() to provide a dummy parent_data
> struct with an invalid clock index in case they were not provided with
> a non-NULL parent_name or parent_hw. Drop this dummy parent_data as is
> not necessary anymore.
> =

> This change only has a small impact on mis-configured fixed-factor. Now a
> call to clk_hw_register_fixed_factor() with a NULL parent will register
> a fixed-factor with zero parent while previously it was registered with
> one invalid parent. In both cases the rate of the fixed-factor is 0Hz
> but it is no longer shown as orphaned.
> =

> This has no impact on properly configured fixed-factors clocks.
> =

> Signed-off-by: Beno=EEt Monin <benoit.monin@bootlin.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
