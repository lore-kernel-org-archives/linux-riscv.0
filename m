Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D03FC369AB
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Apr 2025 01:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VfrVbFCnlGyq+FIH/a/dD/7ux430s2ep9/OIUV2ucrQ=; b=wPbI7YtGurUoVN
	XVKmFDBqQbV5hp/5ojX1VXfMCg7HHmMY4C36NH8Mnfqz+ZhgkNlNIsDPriwwMN/VnLFDFfMIS6m/4
	4Mqho55LhQTA++PQ2BZQ/WDLoXwFOo/o4jWCSbqKy2weaSsdmUYqN53J+Yru1AEMpV89QMrQ/WCBn
	PNEztM1cZTpMT4QrwNm/O6uTChwQYG9pVzA5BeYEyHgWq2DuGSw6MPtuaaWx1zKXPwzp8hHH5rkt2
	UMCHCxf9o4NmytiBW0bNvvn0+p9W7j3t9qRFyljenR+yVJV5WzBGM12tILng8HlsIQNvReBQntqHi
	teHqAt+jGUqTauykHa9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5wak-00000000dA3-1YnC;
	Sat, 19 Apr 2025 01:01:58 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5wai-00000000d9f-0s8w
	for linux-riscv@lists.infradead.org;
	Sat, 19 Apr 2025 01:01:57 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7376dd56f60so1748171b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 18 Apr 2025 18:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745024515; x=1745629315; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ujUghSXI3lvU/j4kBychDVllaVMcrvSdA1dMJsQgYzU=;
        b=QRpSxm4EzO2GjSFX8o3W9dqzcIIEP8kDmj3rT75V+q/FpvsalnyWIgXF/YzixnOD90
         1sk7t4jCD67PCUdQoTcuyKsY2D7ejIoZaqDgxBL0z3PCrV8PvJaF06/Gj0HieYta7YvU
         LEmdeB8TKCklHeQe87HsJwLbYU6O+8qMY1Ev+YAJPErBVAPqDK0T4aF4UoUvXqqCKptE
         KoqzGeMan45D8m0v7S/7BSNAmeC1u08GVtRkwYrcTEC3Vn31tw475to5T7us2WgN4myM
         IfJz0STpkMP2cndAcBXBdaUyhtH/lU5q9V7WTc99KRVU10UmpDtye/ZYvkS++9ttxvkY
         AXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745024515; x=1745629315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujUghSXI3lvU/j4kBychDVllaVMcrvSdA1dMJsQgYzU=;
        b=XpjqY0EjmqS2HDVkHXUbIhC1Wo1t5M5fWSFv8Zv13LrwMW7tH/lttEfxMtH+36KaRq
         Kv+8mnFlZMQ4LpUpAbfh6vb9xRtuJBptV2rL8fd+F7oX8RS0pvj7hverOcJCZjChMfPp
         R41NChlrVR3R1qrmVlALbBOAOI820/xrzkBT0yhR0Szeprrel/tLtCFvj0gZ4k6Ci8I0
         9BRvQhywztiCpL1heZDjpcI6LrWyGxvctGwqQsXWu6cK1DYR3mD6zJ0ex+LaP+IsUOEj
         uDby5+mFbkPW0V90mUr2EkKQrvkSTMj/z/hw8j/ByUmlHkvR6y0Vi2Ez+06aXWtISgZw
         zTYw==
X-Forwarded-Encrypted: i=1; AJvYcCUAY/vMF/G4Qy+k//baK6DQ2bgjd4gQtXNC/62pS2L3LnlOHjccoAvVeYgqs350Zi4Hwjo7zxv3DjtX1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYFsJmL7FITnaEMQH7vaoTrn+O/vfV2CIA4iQQ8i+asYANpysJ
	wvhxzn8eb6OnBUF5h61Yc0hAfHB3rfRQUt+s9Eo8dmm9/P2Kt4IK
X-Gm-Gg: ASbGnctj07/dnP79D34y5W3BYw35DMG8u8UHAchiuQzL9Qob5suA2/uvb+6tA1Y5SSw
	rsAxST3wV9kBZia1gYHBGU7AHgTlF9ClwmSKjWnbhWOToZ2RWtiGtKfT+bZzA0u6UrRb5pXVeWy
	jiVyQGgo/KxGXjXaG2iJQoM1FYWByp50843fNCH/1sxW65fLNzLai0HQ8ua61wL745HZzo9i3ux
	WRdWYNy9fu7mkxmUYD4NySZO3vdIkSamZuYkJC2Y5nbrulid4yToKKx94ZYJqNYxoiOgAaFA167
	KsSLIZTNN8Ybai9wBGpAL5cFtO6WKODnMGvK5CuniA==
X-Google-Smtp-Source: AGHT+IGQtEfItXobFcuGDvqDRwlUvs2hCkTSpl7TA3j+71VHIPX2W4+6Y8A6gmR3Z+xQLeYoCXICrA==
X-Received: by 2002:a05:6a00:4acc:b0:736:b9f5:47c6 with SMTP id d2e1a72fcca58-73dc1566938mr5879716b3a.16.1745024515391;
        Fri, 18 Apr 2025 18:01:55 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-73dbf8e3d4asm2248487b3a.70.2025.04.18.18.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 18:01:54 -0700 (PDT)
Date: Sat, 19 Apr 2025 09:01:52 +0800
From: Longbin Li <looong.bin@gmail.com>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [External] : [PATCH v2 3/3] pwm: sophgo: add driver for SG2044
Message-ID: <telzh74wfpenbhtpnkd74hfoqt3fens35xvftgng3agvaj3xoa@geocy2uc5nfs>
References: <20250418022948.22853-1-looong.bin@gmail.com>
 <20250418022948.22853-4-looong.bin@gmail.com>
 <a0d63c0d-7f17-459a-9ba1-6532a986c8db@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a0d63c0d-7f17-459a-9ba1-6532a986c8db@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_180156_262674_6F909355 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
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

On Fri, Apr 18, 2025 at 08:41:04PM +0530, ALOK TIWARI wrote:
> 
> 
> On 18-04-2025 07:59, Longbin Li wrote:
> > +#define SG2044_REG_POLARITY		0x40
> > +#define SG2044_REG_PWMSTART		0x44
> > +#define SG2044_REG_PWM_OE		0xD0
> > +
> 
> please use lowercase 0xd0
>

I will correct it, thanks.
 
> >   #define SG2042_PWM_HLPERIOD(chan) ((chan) * 8 + 0)
> >   #define SG2042_PWM_PERIOD(chan) ((chan) * 8 + 4)
> 
> Thanks,
> Alok
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
