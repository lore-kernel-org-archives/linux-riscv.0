Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2635C021A0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 12:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1tiId/j86W+5kneEmjw7bPRDuXHGR7PHvrHmh/vqpy4=; b=JQxre9I+Kv2Zap
	6hPqBWxWY3ct4FQb+OpHTn423thOH0vWDRWrR06DL7KeKB/MytbtLu/7khMxmK/DFnItezd6F3Szo
	mvXQh6Nve6h0ePVYCTnBPHnNrDjoOQs4EQ+oo62eu9aJpGY2y7bwSmD51T1Me2kk141Sy1UGE303A
	YvqGdmIEzc5VmpHl/xDs4vvNqqCwlgPGlJ07q5Xh8Et68XGCZ+2BSXhIB9676WbsiSo3fV7B1Ctia
	BkEmud5PihaKloKG+8iQ+cYL7npVGrwtnHpx0lfhPyCymVNVBjQrJA+r8bZqWvEjwDCVANQRd5uDo
	3rmETUW0/QZ5pjzp9MwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYWr-0000000B26A-2sUy;
	Thu, 13 Feb 2025 12:41:17 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXTF-0000000AsJp-3vHZ
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 11:33:31 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7c07c83b388so48607285a.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 03:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739446408; x=1740051208; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jCjzjrsnGB8UX9TppDQ1Fq6klVuQu117zKu3PlITgVk=;
        b=jcyD9cBQkcHEAZHN25saxEZVQ6MnVImwgRV4usiqmb1aAkH6SLk7gbNKh7mKognkYp
         6W9SvrwgVYnXb8qQWh1tcdux2ijTJFe/jw0fwmcwYhSL6zUPH8p25F4Y0LQJCHTHz0ld
         Ko2kxAUc3PycNNUeN5c16njfie7dlaNYSBE+qNK1Upaeo0VxchX35ocseZxSCiD31Hlg
         3arjwv7VsDVgX83r4l0xYsl2WQW+g339ZN/N4DdW/W8CpISw8X0Vp9DdjAQsIyBz6kZ6
         PrM/q86zCzdHtr5tp8FNyq+uUY4Dt7o6zoIri19sxmeDMIRQjopBSD9R+Z/dDWMvJ01j
         3HVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739446408; x=1740051208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCjzjrsnGB8UX9TppDQ1Fq6klVuQu117zKu3PlITgVk=;
        b=NDuOlBukNunR0fORsUWaje6Gh2B0SBPpGcYhh0qwmgrS9PMu2Y9bI5wZl1URlRdVT5
         xYbdmBnIVT/87CxTAPOBPE3T3nW5Bm6NosBp2pI4jH9Hjf865J1kt45Px1AlzZzohFcw
         N2U9zU+3qTzUXnfJ30cESXZkGSqOyMyoB4clXxeIiQxOrBtWGPg1jN7mgf3gh6Kqr8vQ
         uVIR3m+bS9KirHlUqfPZZOEBrrWjMe6O3M1rNDX0X1Qg1hjVyNObM6enNQB780yxEie1
         U8X/cbxWwfEURaoYBWWTFF1VTgLRr+pSIOL5sX6XxpnsOrOrtRnPIcCdZVrS/ijwGkLw
         xoTw==
X-Forwarded-Encrypted: i=1; AJvYcCVDxyTaM6bE0+mqooz51TQV5rBx3zqbewqp6tFMvGNhAGCA7QDte2N7WTWYpDf1ztPqVG/pq4KY0Viaww==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUMCKTO9m+VaemwookuraZhkfWeeMVxXs/YSILmvqHyyjX+Obo
	9bp/3f21NznIMMbq2nal7PpXL6qmd0V7E+k59wPKOXzlqO0xXBQR
X-Gm-Gg: ASbGncuPMiJ6SL+BtpL9zlqOfqC1s+MVjw/wwA6iLhXDPVyeWVn82M2pD8KZpSUYd44
	AH+9hRBkGbaKnLWpKDxy/wOkXVPrQxdY3XfkJJl9kOn6kTMYCT0g5eF+lZJDXuA0jc3sDmEhl5b
	hzhwiT0xJRmOCD/9O+srLpAY2rIi355Ac5goW3dHhmScfi7pE/O7IBCNE80CfTRlUEcFH0XvwCH
	TUPBJddQj2yZmSmTVyQ96obRa98MUW9VXx7Q4+tyO24GZR/ywfdo4+/Htvg6H5hXr8=
X-Google-Smtp-Source: AGHT+IFXo9NdWsRyyruApIs1cjKDwDnPHq25hEtzH65MpQ5viX9oTBCdwL1YIhjUn707bQRGVi/hdQ==
X-Received: by 2002:a05:620a:3c92:b0:7c0:7a75:4fc8 with SMTP id af79cd13be357-7c07a75526cmr310011285a.24.1739446408565;
        Thu, 13 Feb 2025 03:33:28 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c07c8611e1sm74722385a.81.2025.02.13.03.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 03:33:28 -0800 (PST)
Date: Thu, 13 Feb 2025 19:33:19 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
	Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 0/4] reset: introduct generic bit reset controller
Message-ID: <yfhta3vfct73udltmz6ri2dsas6wx4g6hww3drdcumreqbi4gu@c6zxqz7fbh7j>
References: <20250213020900.745551-1-inochiama@gmail.com>
 <42e8f0e0f065b10fa8731d26acc856e5776fe2de.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <42e8f0e0f065b10fa8731d26acc856e5776fe2de.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_033329_972591_03CB89E3 
X-CRM114-Status: GOOD (  12.92  )
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

On Thu, Feb 13, 2025 at 11:08:03AM +0100, Philipp Zabel wrote:
> On Do, 2025-02-13 at 10:08 +0800, Inochi Amaoto wrote:
> > Many SoC have a simple reset controller with toggling bit to perform
> > assert/deassert. It is annoyed to add compatiable for each device when
> > coming a new SoC. It is necessary to introduct a generic device to
> > simplify these things.
> 
> You'll still have to add a compatible to reset-simple.yaml for each new
> SoC, see patch 3.
> 
> regards
> Philipp

Yeah, the binding is can not avoided, but it can avoided adding new
compatible in the driver. I will update the description.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
