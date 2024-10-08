Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47651CEF150
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 11:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m2tihOu7E4D6YCVWj/NgZzrB6YBVf8yj3PjrMtSb2VE=; b=CUukD/znAJGL39
	/YdtUaCjMy7A6MWaH3ZCJNK4Mzf/L58wNwhD+tN7BKqVfOBlT2xz+s8nzl+qSGKB3r6of311yytzO
	PZ7/obMD/NHBv+dCFeJ5pKNh5ehsbFcD9PANrgbiDSW/ClzFiGVgmxB0SE8h3BMQ2jDseVntjKder
	R1kFDHJcu+qh1XyE3pwHxSN+KygqlEdaR3oyVxeOMZ7rvcR6FQlFAF6iSRMCWtNqsarQQY7snTO2Z
	W+RJTrhaQNHHQdhxCPjajTQeK3g7q8S4yEoORas+jkxusoMcdPIiEWTFkJKjpVUjgmkuUP6QBQSgV
	dAtUUh24nlv4UqS1jPEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy7xE-00000005XG2-3CON;
	Tue, 08 Oct 2024 11:00:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy6nm-00000005MeM-3ade
	for linux-riscv@bombadil.infradead.org;
	Tue, 08 Oct 2024 09:46:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lNjY8hqWTpyy020a522dYm1Sd9nWVxcQw89ASfjmWC0=; b=BsxSrmgMwc3b11nzdKjYTRnIGm
	jJIEzkr2adDseNKA8Z+kCTf+M0Kesw3CNLVGTeUh3yg248ayOd7w44q51bJ3e/j6bdZxCjcCBFVk6
	7RNwvI2OLy3hJmipy4n0L/taVxusktlcMJgBNifIcJBsxsUmE6h87Y92ORVu4QUsmTSt9Onxn9Fu7
	1xddIkRnOSry0naPFtKQzY+KFbG/18L6/ZqtqIQflbDeXwRgKmzF1/T4lncWJFpSO6eHWNvx+Gxgx
	as3MQM0v+k4Cimvc15o7CLw9jmSnvcruoxUfG8QzgX2flHI4TAAYGRKJuX3XVl4jwZlOg3enQK3kE
	JtEJI41A==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy6nj-00000004avR-2OuW
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 09:46:45 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-71dfccba177so1833471b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2024 02:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728380800; x=1728985600; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lNjY8hqWTpyy020a522dYm1Sd9nWVxcQw89ASfjmWC0=;
        b=ZhKyqElWWZn39B5t9XQ7ftAP2/BEf00l8zgf3JbK3teUoJhXX6/KpaC2pvBudxBFcd
         NeUWipu4/HZdrI5Oi8bi2AR3N0AQlyJ1g/GMx0d47g4wRi2OhR6as0sq19JWbx6/vOtW
         dgqRtln/Dg0lx6wGUuDO4d8kmTq5EoCIHnANaEjajrXkU02OVbu1cML8yjSTpGic6c9V
         Ujl0ivLU7mWAH7cMIKX2O5Fp7e8VDcmIiQ1YfGwF1dLcvb+gigBjL48E1VHjIeCeON++
         v1+jSKzl1lW0BlhWTcMW8VbX6RIebx6PZ12aMdWDGkgkuy2IocPbLy3/0u9aXTpZRjLH
         zTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728380800; x=1728985600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNjY8hqWTpyy020a522dYm1Sd9nWVxcQw89ASfjmWC0=;
        b=rHUOyQodOEr/1oI5PWJObTA39MgvS7t9t9PrjciU6umCRWWFy3VO3STnBVh3YkB+k+
         3hBW1lSjvuWicR9Kkkb9rTUqhNywIZ6juBJvl53JcxyYKNw3fv73GM6j8PX1eYj4lGLA
         rvju6cZAWpPpc/iQ0HeAwnk1qOItaGHML3NjtkgzfErdIzqPoIBLOUtB3eN1hdfmV8K/
         PN+vMIoyi83y/MIM8FGsIwx3ShoH8srDlr6/iahvMrXZxF/ekUTJSk3hsvY2BCkPhw8x
         J5UhMeeiAM/eCUvLEOnpMoa87pxsVur5Na2q/V5A+aJVvc9yBB/AVynZYpeDidQZXVBc
         02kQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlPjRk1f3T1eVb8BtYkIsRZ3HIfmuDcx+Q9baBhhnCtZbba/ZWrGSJljSfoC9uOigzb4hCDHwBm0CRbA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWjXIQ+KAzuTY7oVBPYqLzC7Pa8/SW8x/6I2DT1KzA7cZAPp/8
	H0S5eucNOgtC/6zIqndIjLkM21nm2dMkwz8jVvjflGQXpUMGRCIi
X-Google-Smtp-Source: AGHT+IEYzDN+bbU9zhSyXok1B0c1RLGC/G8QduRflQ1P15+Go65nt7wy4b8QhCP2svMd+Lb+MCPL4w==
X-Received: by 2002:a05:6a20:a99a:b0:1d7:e62:ea94 with SMTP id adf61e73a8af0-1d70e62ffc7mr1686415637.14.1728380800131;
        Tue, 08 Oct 2024 02:46:40 -0700 (PDT)
Received: from inochi.infowork ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e9f680d8ddsm6449315a12.4.2024.10.08.02.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 02:46:39 -0700 (PDT)
Date: Tue, 8 Oct 2024 17:46:30 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu, 
	unicorn_wang@outlook.com, conor+dt@kernel.org, guoren@kernel.org, inochiama@outlook.com, 
	krzk+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, robh@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	chao.wei@sophgo.com, haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, 
	chunzhi.lin@sophgo.com
Subject: Re: [PATCH 1/1] riscv: sophgo: dts: add power key for pioneer box
Message-ID: <klah6aevo4tr2lgrtsn6e3yoay6qjr2hpfmepjz22alsthd3no@p5r5tj3k6xx4>
References: <cover.1728350655.git.unicorn_wang@outlook.com>
 <12e65a99f1b52c52b7372e900a203063b30c74b5.1728350655.git.unicorn_wang@outlook.com>
 <aixuis25v56xwnc6zd2ost5yhho5soznpa2pf6fya6orvwwke4@6n3nhzrd7kio>
 <0cad37dd-772e-4dc2-9943-a473bf21d55a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0cad37dd-772e-4dc2-9943-a473bf21d55a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_104643_689169_81F520C1 
X-CRM114-Status: GOOD (  17.89  )
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

On Tue, Oct 08, 2024 at 11:28:24AM +0200, Krzysztof Kozlowski wrote:
> On 08/10/2024 07:18, Inochi Amaoto wrote:
> > On Tue, Oct 08, 2024 at 09:43:52AM +0800, Chen Wang wrote:
> >> From: Chen Wang <unicorn_wang@outlook.com>
> >>
> >> There is a power button on the front panel of the pioneer box.
> >> Short pressing the button will trigger the onboard MCU to
> >> notify SG2042 through GPIO22 to enter the power-off process.
> >>
> >> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> >> ---
> >>  .../boot/dts/sophgo/sg2042-milkv-pioneer.dts      | 15 +++++++++++++++
> >>  1 file changed, 15 insertions(+)
> >>
> >> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> >> index a3f9d6f22566..be596d01ff8d 100644
> >> --- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> >> +++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> >> @@ -5,6 +5,9 @@
> >>  
> >>  #include "sg2042.dtsi"
> >>  
> >> +#include <dt-bindings/gpio/gpio.h>
> > 
> > Just move this include into sg204.dtsi. It seems you forgot to
> 
> sg204.dtsi does not use this header, so why it should be there?
> 
> DTS does not differ here from C. You include only what is being directly
> used.
> 

OK, it is my misunderstanding, I thought this header is binded 
to the GPIO device. Let's drop my advice.

Regard,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
