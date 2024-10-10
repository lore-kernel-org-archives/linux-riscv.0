Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D5FCF11F9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 14:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Date:References:In-Reply-To:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+t+hzksee4FDSKSEFf48Hd0m8rSDbHu/cF1lsUSG6g=; b=X6FjqyPvAIBq0h45pu5KNybxL1
	XY4YmvKdU2KFGd2x5SfPbTZz/7fqtxUMyHhBBMEvP+msB1FoyziKvocftd/b51UC23GM0uFqeDbqb
	NdE3lcBwLzOm1Ko6gl5d0ujTERq+wb+i8WQONB9E84YjAny71JLFa/GcVEaqywJI0ys8u4egxeC/C
	sSZpJzAXIhYZDRibvItpQFG2nf9x3Duha62h1nw2DYx+qFCoeFH+FZQpzV+TxGhJT9J2UHT9DxdfL
	hR+Rdf6jeuwNI+3OFk+LeHIfL1wAAH7XcpUpWP24xjaxE8X/rjyMLTon2Eg4CmVvgNuca1h8Pa88y
	aGqX8/AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syuZY-0000000DDXv-33Cn;
	Thu, 10 Oct 2024 14:55:24 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syuDC-0000000D7Fo-0d7B
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 14:32:19 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-37d41894a32so655498f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 07:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728570736; x=1729175536; darn=lists.infradead.org;
        h=mime-version:date:references:organization:in-reply-to:subject:cc:to
         :from:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5BqFF1kShnLdfIkmmhnA62yxXMrCInucJIhLb6IgEoU=;
        b=ZMpohwlVSkq5b/teG/muz+OO+AFMkP8yVJmaGTibwwNx9Ka3jCxuKoR2xIXT00azMl
         p6GRk8trRQMdstBsT8SIXVt00hMSssIc7crGkXY7fkaYGn/1Wrl/+hWgcWnh7LiRKRTO
         QY7EWjYsEbKDWNb+PjuIViSILxvaJrEFDYD1ARrVJuAOPn/MOJz0pbDNad6B++2qNmE9
         u6V5nzAH/za/JuqRR/W6cii7Td0z2fJxHZgaUfaioZWstCI0etATCuEPB7ZyHQG1YZJU
         uaeJfsW6dGUXMaIOYTS2WWRUlbPrIvqsvA6gMiE/I59btGa+QLGttMmc5s86DvePYcy7
         M48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728570736; x=1729175536;
        h=mime-version:date:references:organization:in-reply-to:subject:cc:to
         :from:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BqFF1kShnLdfIkmmhnA62yxXMrCInucJIhLb6IgEoU=;
        b=COIAYjkfn4sRhSbFXTLeRW1Ce3CYIJQTAIhp18+yWaMtfcpk9RgTy7fbx/bq9jeHre
         s9nNggpJ78p7Wo1/e4WfqX11yAd4XINWf2wHnD4q1X+0r1uqWMFR7chIoEvXHCSo3+G2
         0nmdVupTIHoERWT6ytRWpptjEN3jt9G8BLdFG8taMvXzR9zOoAteskSn35/lOk7sh5C3
         HlGN8MJdaGShZOAhN5Re+9m+JAzEWVziTEePzF6fZR1DcrbIDHIMwjmw8eYP66xwCWof
         SRj4PSpWCKU6HsCKpVX2cbacU+vjMkj6Vj5xpZwHlQc74c5WFeSQD/0AgJ7L/TRNOpsO
         w6+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEw5TF1Q6iKQIZDCI3WezeLK/xLS9p8Teo63SPLxXoHnvqLirrh3dq60LlkX/nMFNif2F061PINjfmqA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRKBG7iRYrIHJxmg2fgO+J2HFQ2HgZApiQniwRbnhOTY2d1U6l
	M2de69GKuOF73eRvqIoMRs7i0RaLpyNO/aNafyg6M6uZcl5edhq1
X-Google-Smtp-Source: AGHT+IFjCN7XMO8Qmt6W3DFGtzJZJ6QcZGFDSdosEG4Z+7DkJm/t4YcaTpuYGVnGjkZ2NRhvAH4Pww==
X-Received: by 2002:a5d:5c85:0:b0:374:adf1:9232 with SMTP id ffacd0b85a97d-37d4818f6e1mr2576759f8f.19.1728570735416;
        Thu, 10 Oct 2024 07:32:15 -0700 (PDT)
Received: from localhost ([37.72.3.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a87bbsm1713289f8f.4.2024.10.10.07.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 07:32:14 -0700 (PDT)
Message-ID: <6707e56e.050a0220.140074.4dfc@mx.google.com>
X-Google-Original-Message-ID: <87cyk89ggi.fsf@>
From: =?utf-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mikisabate@gmail.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: paul.walmsley@sifive.com,  aou@eecs.berkeley.edu,
  linux-kernel@vger.kernel.org,  jeremy.linton@arm.com,
  palmer@dabbelt.com,  cuiyunhui@bytedance.com,  sudeep.holla@arm.com,
  linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: Prevent a bad reference count on CPU nodes
In-Reply-To: <dfe6a69e-03e6-44ca-a801-9fcdfe4efb70@ghiti.fr> (Alexandre
	Ghiti's message of "Thu, 10 Oct 2024 14:29:39 +0200")
Organization: Linux Private Site
References: <20240913080053.36636-1-mikisabate@gmail.com>
	<66fa9afe.5d0a0220.323a97.bfb6@mx.google.com>
	<670535de.7b0a0220.311e0d.f680@mx.google.com>
	<dfe6a69e-03e6-44ca-a801-9fcdfe4efb70@ghiti.fr>
Date: Thu, 10 Oct 2024 16:32:13 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_073218_224190_2128998E 
X-CRM114-Status: GOOD (  29.67  )
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
Content-Type: multipart/mixed; boundary="===============5670749564470791487=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5670749564470791487==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On dj., d=E2=80=99oct. 10 2024, Alexandre Ghiti wrote:

> Hi Miquel,
>
> On 08/10/2024 15:38, Miquel Sabat=C3=A9 Sol=C3=A0 wrote:
>> On dl., de set. 30 2024, Miquel Sabat=C3=A9 Sol=C3=A0 wrote:
>>
>>> On dv., de set. 13 2024, Miquel Sabat=C3=A9 Sol=C3=A0 wrote:
>>>
>>>> When populating cache leaves we previously fetched the CPU device node
>>>> at the very beginning. But when ACPI is enabled we go through a
>>>> specific branch which returns early and does not call 'of_node_put' for
>>>> the node that was acquired.
>>>>
>>>> Since we are not using a CPU device node for the ACPI code anyways, we
>>>> can simply move the initialization of it just passed the ACPI block, a=
nd
>>>> we are guaranteed to have an 'of_node_put' call for the acquired node.
>>>> This prevents a bad reference count of the CPU device node.
>>>>
>>>> Moreover, the previous function did not check for errors when acquiring
>>>> the device node, so a return -ENOENT has been added for that case.
>>>>
>>>> Signed-off-by: Miquel Sabat=C3=A9 Sol=C3=A0 <mikisabate@gmail.com>
>>>> ---
>>>> I was wondering if this should also be sent to stable, but  I have not=
 seen
>>>> a report on it, and this is not responsible for an oops or anything li=
ke that.
>>>> So in the end I decided not to, but maybe you consider otherwise.
>>>>
>>>>   arch/riscv/kernel/cacheinfo.c | 7 +++++--
>>>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cachein=
fo.c
>>>> index d6c108c50cba..d32dfdba083e 100644
>>>> --- a/arch/riscv/kernel/cacheinfo.c
>>>> +++ b/arch/riscv/kernel/cacheinfo.c
>>>> @@ -75,8 +75,7 @@ int populate_cache_leaves(unsigned int cpu)
>>>>   {
>>>>   	struct cpu_cacheinfo *this_cpu_ci =3D get_cpu_cacheinfo(cpu);
>>>>   	struct cacheinfo *this_leaf =3D this_cpu_ci->info_list;
>>>> -	struct device_node *np =3D of_cpu_device_node_get(cpu);
>>>> -	struct device_node *prev =3D NULL;
>>>> +	struct device_node *np, *prev;
>>>>   	int levels =3D 1, level =3D 1;
>>>>
>>>>   	if (!acpi_disabled) {
>>>> @@ -100,6 +99,10 @@ int populate_cache_leaves(unsigned int cpu)
>>>>   		return 0;
>>>>   	}
>>>>
>>>> +	np =3D of_cpu_device_node_get(cpu);
>>>> +	if (!np)
>>>> +		return -ENOENT;
>>>> +
>>>>   	if (of_property_read_bool(np, "cache-size"))
>>>>   		ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
>>>>   	if (of_property_read_bool(np, "i-cache-size"))
>>> Gently ping :)
>>>
>>> Could you take a look at this fix?
>>>
>>> Thanks,
>>> Miquel
>> Hello,
>>
>> Would it make sense to have this fix for rc3?
>
>
> Sorry for the late response. It probably won't make it to rc3 but I'll ma=
ke sure
> it will in rc4 :)
>
> First:
>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>
> And it needs the following Fixes tag (but no need to send a new version, =
b4 will
> pick it up):
>
> Fixes: 604f32ea6909 ("riscv: cacheinfo: initialize cacheinfo's level and =
type
> from ACPI PPTT")
>
> And about ccing stable, I'm not sure what could be the impact of this bad
> reference count (some warnings could appear, etc...) so as it is a small =
patch,
> I think it's worth backporting to stable.
>
> Thanks,
>
> Alex
>
>
>>
>> Thanks,
>> Miquel
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

Nice, thank you!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJJBAEBCgAzFiEEG6U8esk9yirP39qXlr6Mb9idZWUFAmcH5W0VHG1pa2lzYWJh
dGVAZ21haWwuY29tAAoJEJa+jG/YnWVlxsgP/2MRJSAk0VX/i/9zIUWrYaAcS7jX
5pZRu4AgvEwQZNSAROxwl93Q2rchJ2wsvElMfhF71Yd2olLdlODvpkgi+l3xnF03
GxiV1Z6TuTy7mii2/5SPOq58DWq8UxSv6bHBRxDcLBKl2LFd4L/nkCECbDwXaW7w
zeqiGZ9pgAWi8GiC1UZSzcupt58jyHonuuFZy43b0JHEZyV7/gZCPefvVsv26bZh
ndhygpfuk6JxQaJ2CQXyCz88uO7ultRnb0NDPhT3pTAaiBuFyHdpqNYjPSRyN+tf
BO0X8pJJqOD1MUu7Xw8cpfMYslMs9jo3rLeq1+3n0H2OMlnySwHMkbgwFjWoR/8g
Ur/mlXOyuydTH67IfBdfxO/b+2utFfH64a08z5z9oD44E7W15IEq9bw5HXdPeIk/
b1bwNhG1R533Ys1seO2ZYDmXHKveo0s+tg1PR1CBx1EloqUrSdQwzXfiEIweeijI
YzMB17bsisRnAvCtAbNd+v0v89YMS/aBMNjr/YdGgFZg3qoMSWmRt9m0lyyLo5jg
AyLlyOcJiqD0B6o49RNGql5Qu/XgMThqQmhK+gm3YaiM1DWG/sRh6SULf2B4o+ld
RHLADEJyZWN5YBoy8MCs4PcRvhI0vquwUnTL6Mi5FFKLfTHraBfYwYqDp8Wfvrw8
rd9r+kMYU245MCh1
=dXUu
-----END PGP SIGNATURE-----
--=-=-=--


--===============5670749564470791487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5670749564470791487==--

