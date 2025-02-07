Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF2DC0219C
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 17:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ocl/E3matfyg4yNL/fDosiH0wQosDVmLtaHfLlxYYBs=; b=gfsmuIvmTbgFRj
	FnxSmJYKGifSXeEcxFH9ewGo2uQY6nM99uXJY6Trn+Vn9qtrth5o3TqyXHJmcDd2wcnH/U4HfgEvO
	X8tVE0MdzHE7gNPAGBsQLwO/0L1TpPCk5t/iiEsas84k9kzxtqJZ5g9rgLP/ffDDxJvyDo5KDPMP6
	W10D+ZpMGI3oyllD91pi1yDMkXwyKEg/4i6Monr7GEbPpEvawEQnRNUtWO+ldEx1jR5MWRe60Cak0
	c3teguya3IpNDfvh+xhkX1JV9U4Kh6t9zfaHvsdoV9VvAIXm4BvQC6R6viDAt4T+/X6mcF5X39eUH
	8Qr/rOx4hLVDllj8+dLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSJV-0000000AWW3-3t9F;
	Fri, 07 Feb 2025 17:38:49 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRq9-0000000AQjD-3cm3
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 17:08:30 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43621d27adeso16088715e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 09:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738948108; x=1739552908; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hzFYQcWwH2Y5uIdZUjghbiPiPqpBNdu4abetnt9RgbA=;
        b=TUaNXv77AVtTgTd7U76RmzxXBZgX41XpFxEzw7FFpgjJUWUDinUfGRWTfgtk9NrLbc
         MW7xIuf7dq6DxnklAYvwxjFg+5ZZnSWlQWlkyxxeCxzC5SC/D4wLBQ3QIUkKI0iQGr7X
         GiHksuASgi7Ib6y2PJmzRtenTHXHD/Uln9cfF0RtLg0rkBRIpeedWtywJZN3GGdyMWoL
         pao/jVgsVt5esOxXgErzhbfiue2AesTrK+K8/eRY6XBHFGMj3kafNvy9q0Wr4/toLgjB
         hHsavjVf1AzC9DaJJMZmq5h4d1z2WuAUdb69X2ziD6lFKoIcVzypjjfU/RU9grRge6hN
         Y7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738948108; x=1739552908;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hzFYQcWwH2Y5uIdZUjghbiPiPqpBNdu4abetnt9RgbA=;
        b=MooYEEodCn4+UVIphCbaDxjuWPaN1aHye4jB462KCPxq0UpEihq/b3XoEDfHfZoKpw
         Bhd7QYgPxf/xhKDpa4KHD1c1ZgLcgT70dVBzOWDu3BEP4VC9om3k2scNS8nlyCbyQpyF
         azMw+/wjo8/7XgDbw0voO0wHSttb4lCN6kHqOn77fBv5+z2M1+DfKmYMJ2LVUP9jBh87
         jpxaTd4x40pvExccQC/8RHQv3cCVs/0t7/SzXIQxcLcwkH0rGSR8MiMomB8kEBEPtu/J
         XR8UpnNOVANIiP/9jDDzq9umO4KinLM1OklhndZEsBrwR20GFsdYthFuu7vOAiw6ehXp
         NGbQ==
X-Gm-Message-State: AOJu0Yz9AB8hFf/HcmDOqK2agU1k23p+dhFbTEhqfzaYCYfzTqNJHe++
	i/9WNzYrVQ6wGRUNOME5Q+LVUvSlWI9xN1rf+OXjEhg3t0q+PKp1/dU5i+bfmqI=
X-Gm-Gg: ASbGnculhVtZ3DnE+i2yucVngYK8Ok8L4r3bgo/FwgQoibIwakRUfLFm4HZ1zJMVcfG
	bon3vcrBBrg8ErjLRpbvt0jOcf4LfoRR5TNW6l5vX4mJNVRcC8Wz7sjQY47/0f5lixufHg4oleK
	z6hcgMHuKigqgLnZQBKHQBcvcCkN7NHZ04M+vrVzKBa5LtYmhEfUq7Z6e3bUTz8EN3qnXSdjPYm
	R7Blj8dyjXx6l+UrM1+rR9GpdGsJPkKtDAN/RIUSpKkkHoLsypNYdpOivSoLnZqAyRYy3/vU8Rz
	14jPQkAIP2P7N4jh/fD5
X-Google-Smtp-Source: AGHT+IEOQqTcT5a5Iq3DF4THEtYt1FSKEZXvl2qDY1SvH7aPo5nTk6ZuygmQqzsZsTb2UCMreC3zbA==
X-Received: by 2002:a05:600c:a0a:b0:434:a525:7257 with SMTP id 5b1f17b1804b1-439249abea0mr29321785e9.21.1738948107886;
        Fri, 07 Feb 2025 09:08:27 -0800 (PST)
Received: from localhost ([2a00:11b1:103b:18b0:943f:8e0:c299:6db0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfd802csm59164785e9.34.2025.02.07.09.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 09:08:26 -0800 (PST)
Date: Fri, 7 Feb 2025 18:08:22 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com, jesse@rivosinc.com, 
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 2/9] riscv: Fix riscv_online_cpu_vec
Message-ID: <20250207-f0e7e2b868ef3e9f2a174f29@orel>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-13-ajones@ventanamicro.com>
 <1a4de5bb-913d-489a-ac96-3f4dec48cb2d@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1a4de5bb-913d-489a-ac96-3f4dec48cb2d@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_090829_915081_51A6E710 
X-CRM114-Status: GOOD (  22.75  )
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

On Fri, Feb 07, 2025 at 05:47:28PM +0100, Cl=E9ment L=E9ger wrote:
> =

> =

> On 07/02/2025 17:19, Andrew Jones wrote:
> > We shouldn't probe when we already know vector is unsupported and
> > we should probe when we see we don't yet know whether it's supported.
> > Furthermore, we should ensure we've set the access type to
> > unsupported when we don't have vector at all.
> > =

> > Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwpr=
obe")
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/kernel/unaligned_access_speed.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > =

> > diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/ke=
rnel/unaligned_access_speed.c
> > index b7a8ff7ba6df..161964cf2abc 100644
> > --- a/arch/riscv/kernel/unaligned_access_speed.c
> > +++ b/arch/riscv/kernel/unaligned_access_speed.c
> > @@ -367,10 +367,12 @@ static void check_vector_unaligned_access(struct =
work_struct *work __always_unus
> >  =

> >  static int riscv_online_cpu_vec(unsigned int cpu)
> >  {
> > -	if (!has_vector())
> > +	if (!has_vector()) {
> > +		per_cpu(vector_misaligned_access, cpu) =3D RISCV_HWPROBE_MISALIGNED_=
VECTOR_UNSUPPORTED;
> >  		return 0;
> > +	}
> >  =

> > -	if (per_cpu(vector_misaligned_access, cpu) !=3D RISCV_HWPROBE_MISALIG=
NED_VECTOR_UNSUPPORTED)
> > +	if (per_cpu(vector_misaligned_access, cpu) !=3D RISCV_HWPROBE_MISALIG=
NED_VECTOR_UNKNOWN)
> >  		return 0;
> >  =

> >  	check_vector_unaligned_access_emulated(NULL);
> =

> Hi Andrew,
> =

> Wouldn't it be easier just not to register the hotplug callback in case
> !has_vector() ? In which case just set all possible cpus
> vector_misaligned_access to RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED
> at startup.

We could do that, but I have another use for the hotplug callback that
you'll see near the end of the series.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
