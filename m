Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B53FEE0212
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 01:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lgjNDbabyABCaO9SHRl/olC9PqP9t3AEcwrWJuGhuOY=; b=FE3RaDxgFwiWIL
	sqajp+1XZPEqJjKOwdgzuMaHRbfudGSr/zrVgpd16WGN16D+eFNpwy33YhuRZfyvMKuWImJfHFbD5
	4+f+o09CsMQWjPh8NsI3L7AabwlTOW8coHkIerrucREM9wnHZaU9gkk5Nk+Imk9FaGi3hTWUPiL4K
	rpGikv28jreq2q1K/dHwdwTcLzK1C72Jb9WdN1cdtTBJLrJGQmUfxpxqg1Uwf27FArzBY+IvjY8rc
	3Ng9mZbQxktgMHVlSz+fM31eLrmUkv4jW6kVKifRyuswfrqphw3v0OGMWDmV2N3SW7WpHBE4kdyRn
	+QyEAm8iyPAUBp9rhufA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgasn-006ykG-2r;
	Thu, 14 Sep 2023 01:11:01 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgask-006yjW-1S
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 01:10:59 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c1ff5b741cso3588975ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 18:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694653857; x=1695258657; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=14DxahOjQVITg89U+rNjNpjXPaY0eKHfBvvG2rNIDbQ=;
        b=W8Aqx0IbMrMAR9h9aJowFhfx1TQT42xUmTmuIZBz9NQ8TnxTN6hBiF9p1KCuZSxehk
         bKmbv/uxLIhPgYeGgVEBL8pwg2shK/OH/2Z6K0mym3OVlAGtPtT1yHHfXXeKV+Umw091
         HztDvT0pcnQVh8iIToAPtCUYbxYDgURmFOvHQi1LdzEGnNGuMSzA7RzUVJERjdSNJ8Ts
         zKYCwiC2GUdaSHFnv9EQIiNwiN9zgBoqafYRo14Lp4tNbN1AjwoZ4VwB1o2WycA+l6uA
         VloT7P0RNHQrcxyGVOP0XD5i+5F6V91TI4eXqb/E6vo1LkSweEIpbUTBNCAHctDSOGYm
         PhtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694653857; x=1695258657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14DxahOjQVITg89U+rNjNpjXPaY0eKHfBvvG2rNIDbQ=;
        b=GLe+SK4KBWiaAMIxQDMkXWUaDim0DGGAU9Mn2khGqt4xOREeZkup4JOGF//Ih+p35C
         yrxLLDMRgpUP100O29CS0hCiN2Upjgz0vHzvryIVp2qw1s+IwGYlWe6UTTNSBuv33fvt
         5odoYuIseRJMNDfgrujmbDtI6MAyY1TRPCqJJpEpK3r15fJObbbAX7YZx0VhmX5qMDHA
         iboDCnUsi3sFQ9KEVfRSP6DEMP9ZFvvZST/pRRslUBAxED0vDJvV7wO/+WD8CVYUi3Li
         LmxJau1lqso8ZiJH3KnO0JwjiJdpzHTwgM1Kd+j3688k746aElksvNnboWvManzUnjFJ
         KLTA==
X-Gm-Message-State: AOJu0Yw2Ocaupm/4ZcIFh9KsEBMgBZJGN51HysLdyP/BG/hULZlHWo9z
	2ieQS0aglI+n8uKzerdomCCmyA==
X-Google-Smtp-Source: AGHT+IEY+/BKNCHPHuaKMXDV/8l1HaolfYgSVJTHDIJZEnBg1zJunOBNTfLVDJIkmH+IRBGj/Nwl5Q==
X-Received: by 2002:a17:902:bf03:b0:1b6:6e3a:77fb with SMTP id bi3-20020a170902bf0300b001b66e3a77fbmr3944820plb.2.1694653856720;
        Wed, 13 Sep 2023 18:10:56 -0700 (PDT)
Received: from ghost ([50.168.177.73])
        by smtp.gmail.com with ESMTPSA id a11-20020a170903100b00b001bdc664ecd3sm228824plb.307.2023.09.13.18.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 18:10:56 -0700 (PDT)
Date: Wed, 13 Sep 2023 21:10:52 -0400
From: Charlie Jenkins <charlie@rivosinc.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, palmer@dabbelt.com,
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	christoph.muellner@vrull.eu,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 00/12] RISC-V: support some cryptography accelerations
Message-ID: <ZQJdnCwf99Glggin@ghost>
References: <20230711153743.1970625-1-heiko@sntech.de>
 <20230914001144.GA924@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230914001144.GA924@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_181058_513200_75C76558 
X-CRM114-Status: GOOD (  21.32  )
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

On Wed, Sep 13, 2023 at 05:11:44PM -0700, Eric Biggers wrote:
> On Tue, Jul 11, 2023 at 05:37:31PM +0200, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > 
> > This series provides cryptographic implementations using the vector
> > crypto extensions.
> > 
> > v13 of the vector patchset dropped the patches for in-kernel usage of
> > vector instructions, I picked the ones from v12 over into this series
> > for now.
> > 
> > My basic goal was to not re-invent cryptographic code, so the heavy
> > lifting is done by those perl-asm scripts used in openssl and the perl
> > code used here-in stems from code that is targetted at openssl [0] and is
> > unmodified from there to limit needed review effort.
> > 
> > With a matching qemu (there are patches for vector-crypto flying around)
> > the in-kernel crypto-selftests (also the extended ones) are very happy
> > so far.
> 
> Hi Heiko!  Are you still working on this patchset?  And which of its
> prerequisites still haven't been merged upstream?
> 
> - Eric
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
It is my understanding that Heiko is taking a break from development, I
don't think he will be working on this soon.

- Charlie

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
