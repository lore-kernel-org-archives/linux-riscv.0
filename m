Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E77CD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 22:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJ8qZzKaHW9Y/fyTjT/MF+zff1QeFpiIxftDUO/rXxU=; b=FTN3qj0g2MxSlJVrhdQHt7lWxM
	AWDItuy51P8wD8L66zqYk7fjE/T2cTQvcXs7/DSZh/10VLi1IIoe8zUJcWZPVHdaZdKcuFKqYs7li
	d1FXSFWHESihAcGPmpx48O8mQe/TnB/ulCDSL7BPVtw/oyAU4RRy5qZ2CQR4BpsO8WJjfEPEyLfVJ
	AY1z+w76Bl2PF5kh6hC1ELOXFeM9jB7zpzHXdke7QJ7Bqz+OfQqjLEEgAkdhEN+SwKbYbioS6N1VB
	hu7TyOvPuwp2pKIcNaareZPSa69k6Jlzjs8Z6/hQXvPZ+EMqiGiaP65EG9j2zEEUy2shogfoM86tk
	EPRDdjGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rugUs-00000009FE0-3hKw;
	Wed, 10 Apr 2024 22:32:50 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rugUp-00000009FCc-2aZD
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 22:32:49 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-5aa2a74c238so2869534eaf.3
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 15:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712788363; x=1713393163; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8QwE0M/+UHCtJodiY6DO3J7/Qf3c8/oO3mN4e+iOAjs=;
        b=G7NlEKaUWnd6SeScZg6zIidFMNfJeh6e3uGW9cv/Ip1dRWS8RPQJkBmKnSC5A6O9+4
         x0/3pxsiJq61leoekAcFUbF1lJ3K8iUy+VHtlb00HS80XWpcyoXwW3SCAYxwNY60T3WR
         bXOsosGOIo2GRLw8kRDsDPzY+ycB631gAzEUjsCEKPdoJQQNItTbvqgLAoiuH4a0ImoH
         6ctQrAzbuVxZpdWO/5HyWzeG35Rni3WH92fc8AtxPzHq4bWRq2iffG4xcynke++bfqXC
         zMcOLBrTt3L2iiMsTNQovEN2Lzyc1rcfDiKrbc5d/wh00C8YFreg8BVjDMMxqLNq+Kqb
         4Ukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712788363; x=1713393163;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8QwE0M/+UHCtJodiY6DO3J7/Qf3c8/oO3mN4e+iOAjs=;
        b=gMze3+hUch555mFJjZZkvhXhPlxa4RYYyy+3PLIKV022CE72q4iCVKlpbWzGXmABJn
         b7ypU18XgacaN+tNoR3Q1kcXSYxawh6J9Z8J2WgGL6CyGBFW7q2cFsLu1jFf+PzQmcwt
         XNvihOFzIfF+KJorH0ohwNMJLDwRCBgBRUR7CK1x0QbhmbiCMQXDFZslAPGhWkfGkpSZ
         WZ4gZABkKhAKt5EDtVvn9bupLyx6YV6mN52LV9HMxwvOYNQW0sx+zcY6b2ylOkpuOxZz
         hJMNCJheD1DUKu7PLEc9IPAcYLOAfipWgyGQCsyJxa5iwAnE3GoXihO+ZXv/6sBi46RK
         RrHA==
X-Forwarded-Encrypted: i=1; AJvYcCVoVA5y7AWNGiE2Wwq9bZHX0TWHKc6tY8dT6boci1XeP47zwYHzxwOAl41IfiJQ1nO1558Bq/zyB5qS144maHJjwdxqjezCrFEsqSNf5f9A
X-Gm-Message-State: AOJu0YwHZ++XhwCks2eeDv0KVLwfwWJ2G8op5+WIcI87b25zRDZo9n7a
	+fD/nhrBdQ6LmWeqEgxNbCREF9TsKO+vf3/pOWf1xVv8H5SF+8ExR81Jadp63Yc=
X-Google-Smtp-Source: AGHT+IGx5/hd/E8Yp0sczgMFtCMtxA7z52W92PBZElrVxV9jPGQj2rV/u6V+YaWfxr37Nv+l4bXzlQ==
X-Received: by 2002:a05:6358:b5c1:b0:186:2ac7:316c with SMTP id wb1-20020a056358b5c100b001862ac7316cmr5042482rwc.20.1712788363600;
        Wed, 10 Apr 2024 15:32:43 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id o65-20020a634144000000b005dc36761ad1sm55196pga.33.2024.04.10.15.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 15:32:43 -0700 (PDT)
Date: Wed, 10 Apr 2024 15:32:41 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 07/10] riscv: add ISA extension parsing for Zcmop
Message-ID: <ZhcTiakvfbjb2hon@debug.ba.rivosinc.com>
References: <20240410091106.749233-1-cleger@rivosinc.com>
 <20240410091106.749233-8-cleger@rivosinc.com>
 <ZhcFeVYUQJmBAKuv@debug.ba.rivosinc.com>
 <20240410-jawless-cavalry-a3eaf9c562a4@spud>
 <20240410-judgingly-appease-5df493852b70@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240410-judgingly-appease-5df493852b70@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_153247_900882_5C93E620 
X-CRM114-Status: GOOD (  16.95  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 10, 2024 at 11:27:16PM +0100, Conor Dooley wrote:
>On Wed, Apr 10, 2024 at 11:16:11PM +0100, Conor Dooley wrote:
>> On Wed, Apr 10, 2024 at 02:32:41PM -0700, Deepak Gupta wrote:
>> > On Wed, Apr 10, 2024 at 11:11:00AM +0200, Cl=E9ment L=E9ger wrote:
>> > > Add parsing for Zcmop ISA extension which was ratified in commit
>> > > b854a709c00 ("Zcmop is ratified/1.0") of the riscv-isa-manual.
>> > >
>> > > Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
>> > > ---
>> > > arch/riscv/include/asm/hwcap.h | 1 +
>> > > arch/riscv/kernel/cpufeature.c | 1 +
>> > > 2 files changed, 2 insertions(+)
>> > >
>> > > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm=
/hwcap.h
>> > > index b7551bad341b..cff7660de268 100644
>> > > --- a/arch/riscv/include/asm/hwcap.h
>> > > +++ b/arch/riscv/include/asm/hwcap.h
>> > > @@ -86,6 +86,7 @@
>> > > #define RISCV_ISA_EXT_ZCB		77
>> > > #define RISCV_ISA_EXT_ZCD		78
>> > > #define RISCV_ISA_EXT_ZCF		79
>> > > +#define RISCV_ISA_EXT_ZCMOP		80
>> > >
>> > > #define RISCV_ISA_EXT_XLINUXENVCFG	127
>> > >
>> > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpuf=
eature.c
>> > > index 09dee071274d..f1450cd7231e 100644
>> > > --- a/arch/riscv/kernel/cpufeature.c
>> > > +++ b/arch/riscv/kernel/cpufeature.c
>> > > @@ -265,6 +265,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =
=3D {
>> > > 	__RISCV_ISA_EXT_DATA(zcb, RISCV_ISA_EXT_ZCB),
>> > > 	__RISCV_ISA_EXT_DATA(zcd, RISCV_ISA_EXT_ZCD),
>> > > 	__RISCV_ISA_EXT_DATA(zcf, RISCV_ISA_EXT_ZCF),
>> > > +	__RISCV_ISA_EXT_DATA(zcmop, RISCV_ISA_EXT_ZCMOP),
>> >
>> > As per spec zcmop is dependent on zca. So perhaps below ?
>> >
>> > __RISCV_ISA_EXT_SUPERSET(zicboz, RISCV_ISA_EXT_ZCMOP, RISCV_ISA_EXT_ZC=
A)
>>
>> What's zicboz got to do with it, copy-pasto I guess?

Yes, copy-pasta :-)

>> If we're gonna imply stuff like this though I think we need some
>> comments explaining why it's okay.
>
>Also, I'm inclined to call that out specifically in the binding, I've
>not yet checked if dependencies actually work for elements of a string
>array like the do for individual properties. I'll todo list that..

Earlier examples of specifying dependency on envcfg actually had functional
use case.
So you are right, I am not sure if its actually needed in this particular c=
ase.

And yes definitley, dependency should be mentioned in binding.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
