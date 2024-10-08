Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F430CEF175
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 13:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Date:References:In-Reply-To:Subject:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCvKjTtsDFO7/HA9uR94RdCb4IxpnuJfEE0bbeiG5oM=; b=yX8hikbbw7Yd6Ly5LUtc3Tf9Er
	b6dqsZjQZe8ce8IBmyGTwn0GBFfJrSOd80LUiu6DFmb8EiKhHUrrxr7irkjl9tKZ64A6s33jC5P5m
	soUYw0ab7tgTmDiPiBpZCd7BGZiXiPfXri8ZwBt1s92PYHVLWlkP+46stXWFT8WYLGR51+XRfebA/
	Q7gae6ik6wDR+6GAUETQpOgr+Hh0iYAgJ5GA4f+OG6K8PJzsJEunOIE2/Q7jzxWq7YFPGvFvVRZp1
	dfvDmsRT6GL+vLBM9HhG831bKfVCk9n824R82quZw0+Hx6mlzjC14P1EgRUyHZe+kAihh4MljpKHb
	FD8M+eSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syAUn-000000062it-0RgY;
	Tue, 08 Oct 2024 13:43:25 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syAQE-000000061Sf-0keY
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 13:38:43 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-42cd74c0d16so57983425e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2024 06:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728394720; x=1728999520; darn=lists.infradead.org;
        h=mime-version:date:references:organization:in-reply-to:subject:cc:to
         :from:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1wZp2tHXRVj599n6jKilEGvmOpN8GImObZN9K6SfAbU=;
        b=ZUz8+AJu/A5spP6wPMQXRlVFpfh1T/jqsFUpbi2mGhPSmoiOguiNwMPRQCFz/gBqRb
         Q2bKAttGP6bRc3o+TqCsBaeuFni+3dJ+0lLYQWOCCn0PiS4Dh6zCs5tHboLA8MgsDVW5
         3JgO5lTZsOtG6CbcE69aOFch6UEHFjShYN1ERchsM/QBwscibjbU9XOlPHhlZogRbXZg
         h5cLAUy8ojbNdPBf1VeVq4zouo8ent9y09K3utbEyaRjW1H9FDDhdes0v0h+jyNvgGD6
         rMT6An4AZGK0Il0YLocB2zBzQMGLJ/2aZEgeVyb+If5lA8jKMIKUzX6/KoeuQV88x6Xe
         N+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728394720; x=1728999520;
        h=mime-version:date:references:organization:in-reply-to:subject:cc:to
         :from:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wZp2tHXRVj599n6jKilEGvmOpN8GImObZN9K6SfAbU=;
        b=c+3ff/uR7den8zb4pygyYH0j86f1SaAvUvyvB76skaQag7KkmxQXVdtaVfT6ERxN5I
         bM97piTqag783Nek9bReVkmsm6gfWNclaecO/WthaK46rTYXEcciwB3rMsfJLSleWBcH
         cREM5Rp0gT9rRWD6yybSAQCRSmcIlsAvhgv5989kaQLh7tZDDeIvecgFQzuQ+2aYLAmr
         eSBRDgJggjQSNd8WmEDvlyT94RcohQ/AzX8G+iIvOoBmPWO5mn6yAAYDT3bvVxhDLB4q
         XZgzV08YBEZ1sZRzFGIjllrZGSx8t87zGoMHZ4JfrepQ8XfWpn6QmbTa1jBMgMOii6Je
         yQMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZnOXVT6p7tIjq04bWxQ+r6eq2RmrM5I9/Vh30RihpBqEFc7YgiVwUyJRQSpKJYZYxkxBw8jy/ai4YRw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyF15XTgq8j9HiMGm3q6LzBCpeLRdkQWG2fNmY1Ev2UDi7+cQAf
	BtbCGuqhfN+ZcOiTbcBpvXerdUWQ+N3ZOGQ2CwDWxz/STvSbwYpW
X-Google-Smtp-Source: AGHT+IE++4YsCN9P2R//nqGMop2IR/HKa2Sn4szClB5M0V4BBfQD2EJOaMhQG7nfvuwe1zbfVXyzxg==
X-Received: by 2002:a05:600c:1907:b0:42e:d463:3ea8 with SMTP id 5b1f17b1804b1-42f85aefaeamr139847595e9.34.1728394719619;
        Tue, 08 Oct 2024 06:38:39 -0700 (PDT)
Received: from localhost ([37.72.3.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86b1d7aasm126435085e9.27.2024.10.08.06.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 06:38:38 -0700 (PDT)
Message-ID: <670535de.7b0a0220.311e0d.f680@mx.google.com>
X-Google-Original-Message-ID: <875xq2af4y.fsf@>
From: =?utf-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mikisabate@gmail.com>
To: paul.walmsley@sifive.com
Subject: Re: [PATCH] riscv: Prevent a bad reference count on CPU nodes
In-Reply-To: <66fa9afe.5d0a0220.323a97.bfb6@mx.google.com> ("Miquel
 =?utf-8?Q?Sabat=C3=A9=09Sol=C3=A0=22's?= message of "Mon, 30 Sep 2024
 14:35:05 +0200")
Organization: Linux Private Site
References: <20240913080053.36636-1-mikisabate@gmail.com>
	<66fa9afe.5d0a0220.323a97.bfb6@mx.google.com>
Date: Tue, 08 Oct 2024 15:38:37 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_063842_244644_1DD0EF12 
X-CRM114-Status: GOOD (  25.09  )
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
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, jeremy.linton@arm.com, palmer@dabbelt.com, cuiyunhui@bytedance.com, sudeep.holla@arm.com, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0243175115071880031=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0243175115071880031==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On dl., de set. 30 2024, Miquel Sabat=C3=A9 Sol=C3=A0 wrote:

> On dv., de set. 13 2024, Miquel Sabat=C3=A9 Sol=C3=A0 wrote:
>
>> When populating cache leaves we previously fetched the CPU device node
>> at the very beginning. But when ACPI is enabled we go through a
>> specific branch which returns early and does not call 'of_node_put' for
>> the node that was acquired.
>>
>> Since we are not using a CPU device node for the ACPI code anyways, we
>> can simply move the initialization of it just passed the ACPI block, and
>> we are guaranteed to have an 'of_node_put' call for the acquired node.
>> This prevents a bad reference count of the CPU device node.
>>
>> Moreover, the previous function did not check for errors when acquiring
>> the device node, so a return -ENOENT has been added for that case.
>>
>> Signed-off-by: Miquel Sabat=C3=A9 Sol=C3=A0 <mikisabate@gmail.com>
>> ---
>> I was wondering if this should also be sent to stable, but  I have not s=
een
>> a report on it, and this is not responsible for an oops or anything like=
 that.
>> So in the end I decided not to, but maybe you consider otherwise.
>>
>>  arch/riscv/kernel/cacheinfo.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo=
.c
>> index d6c108c50cba..d32dfdba083e 100644
>> --- a/arch/riscv/kernel/cacheinfo.c
>> +++ b/arch/riscv/kernel/cacheinfo.c
>> @@ -75,8 +75,7 @@ int populate_cache_leaves(unsigned int cpu)
>>  {
>>  	struct cpu_cacheinfo *this_cpu_ci =3D get_cpu_cacheinfo(cpu);
>>  	struct cacheinfo *this_leaf =3D this_cpu_ci->info_list;
>> -	struct device_node *np =3D of_cpu_device_node_get(cpu);
>> -	struct device_node *prev =3D NULL;
>> +	struct device_node *np, *prev;
>>  	int levels =3D 1, level =3D 1;
>>
>>  	if (!acpi_disabled) {
>> @@ -100,6 +99,10 @@ int populate_cache_leaves(unsigned int cpu)
>>  		return 0;
>>  	}
>>
>> +	np =3D of_cpu_device_node_get(cpu);
>> +	if (!np)
>> +		return -ENOENT;
>> +
>>  	if (of_property_read_bool(np, "cache-size"))
>>  		ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
>>  	if (of_property_read_bool(np, "i-cache-size"))
>
> Gently ping :)
>
> Could you take a look at this fix?
>
> Thanks,
> Miquel

Hello,

Would it make sense to have this fix for rc3?

Thanks,
Miquel

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJJBAEBCgAzFiEEG6U8esk9yirP39qXlr6Mb9idZWUFAmcFNd0VHG1pa2lzYWJh
dGVAZ21haWwuY29tAAoJEJa+jG/YnWVlViIP/iA9tLidyLAf2yzky8Evu0OzkyBC
UKkB23+kmV4FXcFJdqSXfoe2kcoE71WABu8YouvkqULVppZ9L0SqAfREkPK1OX4b
i2EF0Yo8yv7Ws8nLDskp9waIhqOkNL7pZUw+bSkkd4Gt13sob6tR6AMCgG3AzkzJ
StAXxOtNy2+CCc7SUxFiaZJ/bSfTC8onZCSyqP8DmIOY0k5vkux+Lb9Cu2IINDAl
fp5rmg7vSAzgxOSmRJTMgklO58ty5U3oyp9JphIILT7IB76hmhKlMtRzqej++DP3
3H0b47S6xoYWfNrSzzi91Qz/VM0VxXHWh/GBsiA25uVtKnbGPBMUOC4dQucO+ItJ
Fle5BkGV1UE/ewNaZOtGP0VuvdTJkFy1S2HAoAK7WIkelxxYrLji20tHty7EO++/
GphVSFccmW9NTz6c9ViSDIg0dFxPUpwXIEqvtllfsOl+yLN4pvyIzSTQU3+Uc7CH
AqqIg7C2XqunZHQK/R+qN3eSbbQDoPdosSqsU1PIXAVF2Ct3pALpqOmadDXX9uw5
mH2Ap6daxU7/0P8XGOsgNc6EN/i70VN3ykRwCpMePyeJZmFnAlf+tv7zaqMaKsuR
9StTYIi3Purg5AjBk1AJFaWWUMIOrl0inMGBMBebeYEYtf3Dd0Yjcn4Y0+T0ofTY
Xh455iygLvLieuL3
=5wnw
-----END PGP SIGNATURE-----
--=-=-=--


--===============0243175115071880031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0243175115071880031==--

