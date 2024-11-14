Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5068D65C46
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 06:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Date:References:In-Reply-To:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQpTaty5qHa5lG/M5CGkkqBIYrOS1USBr5Cyw2zyZ/g=; b=ZenI7XnEki4DBmY7wF25nza4vW
	sW2FsroxY8fMJmk65kCgNHfIecRKWBOnVTH5rvXMhk1SujGaXdN5XCnhV7+72Kh3cVex4nj3Uugvp
	XyBT5BNWsnPFYzFVHeHl+odhC9W1XwB0dU7FtIvoRAN5GMCMZMaCZg4rzW2c3kQdJXycJXvsAuXjO
	UyMx+QHKny6s6ZnYtxFbXatN74NXTiKXJTWgrHofXF6xdlBxVy09uJ2aKWJlhBin6epMAqTxRZbrM
	kh5d8avz3zs5D7cIMNbeAuTIxrOT4wm2bHbGoUJAJli5NY8u28+0NQjKMCv3VC31cJfMmlA5Y95r1
	vos3nUgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBTTt-00000008yLp-0ghi;
	Thu, 14 Nov 2024 06:37:29 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBTTq-00000008yKg-04Wr
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 06:37:27 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4316f3d3c21so2431325e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2024 22:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731566243; x=1732171043; darn=lists.infradead.org;
        h=mime-version:date:user-agent:references:organization:in-reply-to
         :subject:cc:to:from:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OzA2oQZMAdaKXqd5iiIFp8MvCWhHHpRVX4RNggE14po=;
        b=Fas6edM+0Rg44qQ194hH8p5ELcxrKrEEMlmsepQXHx/CvOtXV5UlQoHis7RDOscTJP
         POw3vMszS8S3h2ydUy1Fc/I7/mK4xg/wd7UIXZ+JFAYiWnXUOGPMEDVd1MT0W82se8Qn
         vLJ0iCA7HGks7ufDFLczDrZsye4h8c+x3h2Cwq38d8FnONO8qs7tjlN+HZsL8AQBGa5U
         ojkYisnZlGQnXAu+AmnN4Xkoi5xknR42gk9H3jvbZboH3IElCC8sIJ081xNxjy05/eq5
         yyurakBROU38mA/uCt7pwNSVM7VkhiNYgkqnqJrc4K2GfU8IXtRP6o0Wy3dQdDY3waJ/
         usqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731566243; x=1732171043;
        h=mime-version:date:user-agent:references:organization:in-reply-to
         :subject:cc:to:from:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OzA2oQZMAdaKXqd5iiIFp8MvCWhHHpRVX4RNggE14po=;
        b=GGXeUI4amcVj+KrWh+idBTOYDfM7oiFEGS8zKUvVbr8HvbNm5Mmghu17rh1gsdVFha
         251tZh+7NH5oIvZAO0UsxsMmVLhXnAaX2PpzNoSN8f0XhdPapynRrBZ+zKIxW5Z+V4c7
         LIP1ZQ5KQQdOupweL379vzBLrAjigQqJHjCLzmz0yMD9NxRUEFLSVBNCxA4j/0pUXgXl
         ZUtQBWnLvC9uwaxCFetnaaFhw05/yrstx1oEgncKSdSJr2R36a9sN6J3NnqrX7yIwVFD
         O2PcBmJVlUSDz9qbkr3KaQRo24nflZ7TlRPnIMNJgdhSQSLR62GiZnbMnpdgc7rtTm3P
         p9Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWO9AZzid67nIGk/U12Jb8szZqU3gffKj56wi8J9Gxw0DXjQSDB/H6lG5ffQecifu8BhcC0CCq2D2NjOw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzN3WKb6auE+xAgaGZPPwdYNttK/uAD/fMZYAfD8yQuxMJxQhal
	aThFH+U8vqmfVmRt+4S50Wh1tCrbj3Ro9r1h5hVjmqopvgQjk7j3
X-Google-Smtp-Source: AGHT+IF2q3VqNO6Ts4z+fwKPab8GgAycbFF5/LX6gjOIErWMjr82/KJwaZJbaL4+i+amj2qWDxcl7Q==
X-Received: by 2002:a05:600c:3b93:b0:431:2460:5574 with SMTP id 5b1f17b1804b1-432cd47d785mr74090465e9.27.1731566243334;
        Wed, 13 Nov 2024 22:37:23 -0800 (PST)
Received: from localhost ([37.72.3.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da28b76fsm12031765e9.28.2024.11.13.22.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 22:37:22 -0800 (PST)
Message-ID: <67359aa2.050a0220.cc412.2c60@mx.google.com>
X-Google-Original-Message-ID: <87y11m5nj3.fsf@>
From: =?utf-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mikisabate@gmail.com>
To: paul.walmsley@sifive.com
Cc: palmer@dabbelt.com,  aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org,  Jesse
 Taube <jesse@rivosinc.com>,  Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [RESEND PATCH v2] riscv: hwprobe: export Zicntr and Zihpm
 extensions
In-Reply-To: <66f1cc93.050a0220.bf7a0.30f3@mx.google.com> ("Miquel
 =?utf-8?Q?Sabat=C3=A9=09Sol=C3=A0=22's?= message of "Mon, 23 Sep 2024
 22:16:17 +0200")
Organization: Linux Private Site
References: <20240913051324.8176-1-mikisabate@gmail.com>
	<66f1cc93.050a0220.bf7a0.30f3@mx.google.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 14 Nov 2024 07:37:20 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_223726_082020_C89A39ED 
X-CRM114-Status: GOOD (  17.76  )
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
Content-Type: multipart/mixed; boundary="===============0667992736098116979=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0667992736098116979==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On dl., de set. 23 2024, Miquel Sabat=C3=A9 Sol=C3=A0 wrote:

> On dv., de set. 13 2024, Miquel Sabat=C3=A9 Sol=C3=A0 wrote:
>
>> Export Zicntr and Zihpm ISA extensions through the hwprobe syscall.
>>
>> Signed-off-by: Miquel Sabat=C3=A9 Sol=C3=A0 <mikisabate@gmail.com>
>> Acked-by: Jesse Taube <jesse@rivosinc.com>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>> This is a resend because I sent v2 as a reply to the original thread and
>> it most probably was lost by most people. Fortunately Conor picked it up
>> and gave it a review.
>>
>> I am resending this so it can be properly applied. Thank you for your ti=
me and
>> sorry for the inconvenience.
>>
>> Changes since v1 [1]: the EXT_KEY instructions have been written in orde=
r.
>>
>> [1] https://lore.kernel.org/linux-riscv/20240817075629.262318-1-mikisaba=
te@gmail.com/
>>
>>  Documentation/arch/riscv/hwprobe.rst  | 6 ++++++
>>  arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
>>  arch/riscv/kernel/sys_hwprobe.c       | 2 ++
>>  3 files changed, 10 insertions(+)
>>
>> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/r=
iscv/hwprobe.rst
>> index 3db60a0911df..cfd2929d0562 100644
>> --- a/Documentation/arch/riscv/hwprobe.rst
>> +++ b/Documentation/arch/riscv/hwprobe.rst
>> @@ -183,6 +183,9 @@ The following keys are defined:
>>         defined in the Atomic Compare-and-Swap (CAS) instructions manual=
 starting
>>         from commit 5059e0ca641c ("update to ratified").
>>
>> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICNTR`: The Zicntr extension version 2=
.0
>> +       is supported as defined in the RISC-V ISA manual.
>> +
>>    * :c:macro:`RISCV_HWPROBE_EXT_ZICOND`: The Zicond extension is suppor=
ted as
>>         defined in the RISC-V Integer Conditional (Zicond) operations ex=
tension
>>         manual starting from commit 95cf1f9 ("Add changes requested by V=
ed
>> @@ -192,6 +195,9 @@ The following keys are defined:
>>         supported as defined in the RISC-V ISA manual starting from comm=
it
>>         d8ab5c78c207 ("Zihintpause is ratified").
>>
>> +  * :c:macro:`RISCV_HWPROBE_EXT_ZIHPM`: The Zihpm extension version 2.0
>> +       is supported as defined in the RISC-V ISA manual.
>> +
>>    * :c:macro:`RISCV_HWPROBE_EXT_ZVE32X`: The Vector sub-extension Zve32=
x is
>>      supported, as defined by version 1.0 of the RISC-V Vector extension=
 manual.
>>
>> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/=
uapi/asm/hwprobe.h
>> index b706c8e47b02..098a815b3fd4 100644
>> --- a/arch/riscv/include/uapi/asm/hwprobe.h
>> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
>> @@ -72,6 +72,8 @@ struct riscv_hwprobe {
>>  #define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
>>  #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
>>  #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
>> +#define		RISCV_HWPROBE_EXT_ZICNTR	(1ULL << 49)
>> +#define		RISCV_HWPROBE_EXT_ZIHPM		(1ULL << 50)
>>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
>> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwp=
robe.c
>> index 8d1b5c35d2a7..910b41b6a7ab 100644
>> --- a/arch/riscv/kernel/sys_hwprobe.c
>> +++ b/arch/riscv/kernel/sys_hwprobe.c
>> @@ -107,9 +107,11 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *=
pair,
>>  		EXT_KEY(ZCB);
>>  		EXT_KEY(ZCMOP);
>>  		EXT_KEY(ZICBOZ);
>> +		EXT_KEY(ZICNTR);
>>  		EXT_KEY(ZICOND);
>>  		EXT_KEY(ZIHINTNTL);
>>  		EXT_KEY(ZIHINTPAUSE);
>> +		EXT_KEY(ZIHPM);
>>  		EXT_KEY(ZIMOP);
>>  		EXT_KEY(ZKND);
>>  		EXT_KEY(ZKNE);
>
> Hello,
>
> Gently ping :) Can we get this merged for 6.12?
>
> Thanks!
> Miquel

Hello,

Gently ping :)

This will certainly not be included for 6.12, but is there a chance to
get it for 6.13?

Thanks,
Miquel

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJJBAEBCgAzFiEEG6U8esk9yirP39qXlr6Mb9idZWUFAmc1mqAVHG1pa2lzYWJh
dGVAZ21haWwuY29tAAoJEJa+jG/YnWVlV4wP/j4y+PeqDrmHtMXHGYzlooujiz2X
JtyKFhrkaPEhQMfTtA8DCoCWIVEsM66UL/waok64NO0/K8fCRRXzAcfJCiweSj4r
mb5T0YqqFdUEKmaxJBPnEW7yTcTspBI+zj1A4iE7MMqR+3OKTnI0bhSKBjobLyTj
HYSZj5RiLcdl/hAxiQ7j3L32l2OrIO32aXzte3zy5IRmt/y875OJgThdrlG8fFC7
AcyyxatezTcmcZW3j2xybWlkEh6/uOqUJeVbYT1XEa+gkUTNJyqrw/jVo3GYzmYL
OZP5BiWqdt93eAs55r7uCTQf1lO8dWUOEdx1Ebti33vjj2LSfRHq6XYSmdtTFgSU
qlz6UTSSrYepyHf5N9KzEXbBdZKzUFxq+Nql3tgIh2r1H0q/Un6F33Xfjjyuu/21
cTyD/wRSHt0D6za+/7heAZTOMVFD2OhpcUhONmxZ8l8RB3a1JYiLXiZkJ2PebKVb
Ls6ZG4XSVYeqMiQhjdYsT9Y0fnTuO2bSu2rYHHwjXSI9rx9w2CHT9b/tKrb6/o9G
FV9qj7rPZd2NBeRiOtTxqEXrcfKaB4tm7OnUcXWhoEgtuEgowKGyo+rMHjgcPBQv
shdBDyp07hm459wWGOV/Xza38P/QROfvwhrGZU++smBruoMQT4ZlNMcduXs72tej
/uQblIPKbMoQuaBE
=s9HY
-----END PGP SIGNATURE-----
--=-=-=--


--===============0667992736098116979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0667992736098116979==--

