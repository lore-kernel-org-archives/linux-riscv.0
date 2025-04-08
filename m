Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704C0C36010
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 02:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=064fZxf8zABpXooTH1o0T7zuW9wF51BvKe1FFuzrf/U=; b=wpMf1jiGwFfL9K
	RcQygfYqAF9wePWb7pZHM/ulTcFqCJrW9AYLX60uepk4eJcK4yweGMzN4iYHrGR/TmSrz56fDLoIN
	Z8H7rycU2rX5Xro2RPrxGF8s83K9h0jHwA8PEtmCwoovoeGb0PHlMI3ifEKPOdBmCZN3TCMjAu0Mw
	Q+6FevVf+chw9jOa9Z8ueK7VJVL5KnrrEZ8+Ks3BN9kskhLj48TMrWb+UFiTtIiHGdEKNqfXECCsN
	K38Cm5jxnX91mNGIkvoxKGnR3ASVmwxXWlX41O+6RKFEYTrDItcELc4Azxt9OtHT5yusUyYGd4/rD
	mX8yDUX2aMvyQBmEC5OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1yo5-00000002X2c-1evG;
	Tue, 08 Apr 2025 02:35:21 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ymw-00000002Wu6-0vyI
	for linux-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 02:34:11 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7c5e39d1db2so294907085a.3
        for <linux-riscv@lists.infradead.org>; Mon, 07 Apr 2025 19:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744079649; x=1744684449; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=waaMzRcEYQgRpRjT/cb8agAmmDWkveY+/Tn+x5v2WbI=;
        b=Kf8JOItsYPyoC8g8dUCJCA75OYLu6vglMegg7abE7Hl8VtzfLB/Z6SCb2JfWp3IokT
         TCN9kgVO3CIFaHjUAAvhDejmfI3dqCaLD7javFNda9ZBBnhNCw3JnjSlza5dhPq0tKTM
         AMr1vtmWr1S9gF8t8NozkTYyTP/iRbl4Jt5dHXqVIqt3+W0zTWahcH13y8p9M0FBNAlN
         89k/Xj1mm60M4NyATz1ATaq2ziGwIwwzPpTBoAuXmgmtmG2g6zAO6GiAfskA649KrCdi
         VfRAHSGinJ7aO3W00drPhxfxN4+mokQktJ7AS0ZAM5FDxgG3aZsSKYWhEQ8YR4VB7N7R
         CaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744079649; x=1744684449;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=waaMzRcEYQgRpRjT/cb8agAmmDWkveY+/Tn+x5v2WbI=;
        b=SWXbKaoSor/m8tW9jc6k3VUdqMOgSQMeVDCnp02gemBPWDUGhdD0aR916kdSFY8yoa
         69hnebcRFAKnsGTy2UVQGEhKpWO7M33gLC+W1dsZ2ZTavmLhg09I/ADkuRi7DHV8gBfb
         qoJO07ngECuf8lHObTca6sHMPYnxj42OvP3b+lcayC9YRnoK67mFt/xaeOBNGp8GQgPZ
         UYlnBzH2Gb/BKHDcS8ZI3mlCkNq33jGnPB/DP1DejksEqCZNrlmy3PIXm8prYiWqTQIb
         qja00g1kZ6OVaKd0L2M9TtIFrfqEh4INhIePGWqDS3xklFXnnyN/VRsuPHCLW5FvPStc
         j2hw==
X-Forwarded-Encrypted: i=1; AJvYcCV1e2SIlOib/D4A5ajuaClpRmEIVUELgr8tHwKe26huYn2eqEAs1kh/JXaOWtoQ7wJ5Zgkjgq03rWuzkw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDSrJicpDBH/3AdpiONaa1LEY29RhdLjE68/hEcGtYt3Mh2GJb
	nz+l0hl8WH5ggDZwPYWqAhhLYA8coKtArNOCo7GL4Dxm6xTyHExs
X-Gm-Gg: ASbGncur3bbZSqmXtGc3EZq8Zfe2dDzZSGLn8CL2uWGJj9fQ6ESLvBGTvBtJ0lwl6Ds
	Y3uVOy+NuOTmh4oyddbsLIhtHOsKhDbfzkoKuFcjYcVnP0o1rozuGjlp9E4ALYvX0aPKY40I1uU
	NIK2edny6uTr3C2PtZtv8UPAUSpm9pPyTxORGWCZEEXQdnBKlcWCA4iCCfp3joEsKtWqNvz9Z7l
	0F3thNCn7cFdWRk8IGBWXfWyBk3hZDqS8JJhh6T83GlkS0BkMHYrJW+axFhvEErCf/vgpOeqO7d
	tMn6esSBrgL1KF0xX/Nq
X-Google-Smtp-Source: AGHT+IHa2pjYh5qtU2xFWFpFRw710b9YzXGj/CQhpz4LU55IzIv/AkIca8T95g1vDXO/do3EzvlTyA==
X-Received: by 2002:a05:620a:372c:b0:7c5:a5a2:eea3 with SMTP id af79cd13be357-7c775a3a33bmr1702022885a.34.1744079648872;
        Mon, 07 Apr 2025 19:34:08 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f14d2a7sm67012176d6.107.2025.04.07.19.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 19:34:08 -0700 (PDT)
Date: Tue, 8 Apr 2025 10:33:32 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Longbin Li <looong.bin@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, ghost <2990955050@qq.com>, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: pwm: sophgo: add pwm controller for
 SG2044
Message-ID: <3y4nm5ievsfyomyzm35b3moj2buunwmisjowmvovhbglcjwnhi@gaj7wz4sm7tj>
References: <20250407072056.8629-1-looong.bin@gmail.com>
 <20250407072056.8629-2-looong.bin@gmail.com>
 <jq55x7uhftvejninh56tzk32jtmmwa5wxzna5uxbkk5woi7zi5@6wrg2ctmyg7b>
 <20250407141119.GA2192351-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407141119.GA2192351-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_193410_260787_7133F411 
X-CRM114-Status: GOOD (  17.99  )
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

On Mon, Apr 07, 2025 at 09:11:19AM -0500, Rob Herring wrote:
> On Mon, Apr 07, 2025 at 02:31:24PM +0200, Uwe Kleine-K=F6nig wrote:
> > Hello,
> > =

> > On Mon, Apr 07, 2025 at 03:20:38PM +0800, Longbin Li wrote:
> > > diff --git a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.=
yaml b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
> > > index bbb6326d47d7..e0e91aa237ec 100644
> > > --- a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
> > > +++ b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
> > > @@ -17,7 +17,9 @@ allOf:
> > > =

> > >  properties:
> > >    compatible:
> > > -    const: sophgo,sg2042-pwm
> > > +    enum:
> > > +      - sophgo,sg2042-pwm
> > > +      - sophgo,sg2044-pwm
> > =

> > Given that the sg2044 has more registers (to e.g. implement different
> > polarity), but the sg2042 registers are identical, I wonder if the 2044
> > device should use:
> > =

> > 	compatible =3D "sophgo,sg2044-pwm", "sophgo,sg2042-pwm";
> > =

> > Note, I'm unsure here, only providing input to people who are more
> > knowledgeable in DT that I am.
> =

> Depends if s/w only understanding "sophgo,sg2042-pwm" will work on the =

> 2044. IOW, will a kernel without the driver change here work?
> =


No luck, the logic for SG2042 is broken on SG2044. In fact, it seems
to be more familiar to the pwm ip on CV1800 than it on SG2042.

Regards,
Inochi =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
