Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FC5C3ABAC
	for <linux-riscv@archiver.kernel.org>; Tue,  6 May 2025 09:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Date:References:In-Reply-To:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VjXQw9jUONmBaSu2qE/sCIC1K9K+EzRNkkUDSgHdJXo=; b=RLhZ0xAgPIEvlebAu5AfjMpgq6
	NsQcgF1HkOnkgiW4DVheLkjSyZn+M96mmOybqrCXdXLiMF1IRyJS5yNjUlzww/kr9LBJZa8XxoTsF
	vybNYOOBToHvmGqsCXAwFpTZXgDiSLR5sx7hKVzA0nan39iwKPNLniDQwkjGaEo8WElrpJCmrQ411
	u0fFdSVLL8bKoBVRuMR4DwKpB9pYr58hAwei+BWylYMFuAaMkntZNlSnqns+xLOniV94LSenQb55S
	lt8oUH8rt1KwR7I9jPADVUKt3o8duFoKdpdOu2s3S+VK7fXaIsc20UQaEgXDixEcbD1OCnJOV/Opy
	AH91Y9gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCET6-0000000BKvS-1OlQ;
	Tue, 06 May 2025 09:20:04 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCDpT-0000000BC78-1fCS
	for linux-riscv@lists.infradead.org;
	Tue, 06 May 2025 08:39:08 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so8758172a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 06 May 2025 01:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746520745; x=1747125545; darn=lists.infradead.org;
        h=mime-version:date:user-agent:references:organization:in-reply-to
         :subject:cc:to:from:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4KBUvhxsXBTO2k7dRSYGlK/Srd5NXERecRKbU4v4RqA=;
        b=SVGm/miTXJUK3yIbc6NFsiAhHsC8JTNFDkbsi2bvVJa4u+jghr8BBEitspLQNLzTth
         glIuBrv3FoeCzodvycWu7TORJOjedhXPmYkT4eLn+JvYhtbIletsOrJ1xK9cdOY0/+w7
         NmMfUWZJ7bpyGeyHtq782lh+QeqcUoeQrRkl7jmCdJZWmbLXQ2sDFA48XgVVPXestt0n
         14T+e4rVAQipJ/xW9OS+sxuj83r8nsjUrPr80n55vlA0QQD4LwOdTNN7LX6Sgx10mHgd
         nO9d3jJ4YKpeePXHMa//JoDzgR/e0Esr5MBtaN3B+ha75UOZwEWrhrkfMEy+9xqWdZZc
         MPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746520745; x=1747125545;
        h=mime-version:date:user-agent:references:organization:in-reply-to
         :subject:cc:to:from:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4KBUvhxsXBTO2k7dRSYGlK/Srd5NXERecRKbU4v4RqA=;
        b=UiTJ3019RsOBQ6FBSgzw16eTzOTrnVm/KohUHIKu+T18q556oxjBajleOW2RRmNay1
         XawEZzJo3y09i3Jkx65PldbZ5S36uxbgDfpsGYb5uC+0YClyH4bL32EoU/OL89JT4HkC
         IgZeHkfxJcd/BJS0lhmZyoCOLYGRn523SQT5T2Wh6VkWpKIGXpIEWIWGJUy5xjUK7+u+
         R25mIlyk1DLP1Iz46VYB7hQhsMEvOTdESL8Muq8cbryHB24Ox389EbBsjZUUiley5TcP
         K+ezk6wrdYb/KwZVZ/goCUsySeDCKSIABlcVBuMhkxIjuDOpx+Tsx8qwYLdsT/rGy1L7
         XtjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnuwTik4PlsozBsCDtc/LIQXuxnUscwIKVeCJh6iCaIoK5uVAk+ze3XdanJgsaeGtnIMrvE8ZuQgC6Ug==@lists.infradead.org
X-Gm-Message-State: AOJu0YzG8DdBK8BryjHwGW6FbTF1TJKBmfqgxbZTbl01Yb4JxIf0YVnT
	npAOQg3ok2yeSpJIcKBAATeCjMgMncwCYKycEzXaOJoDE6umRVLL
X-Gm-Gg: ASbGncs47QB9MwSFv+dKOVBAz1THWonkxB7dPGBIftDsRoxHufk6CviMytkThpQk3Nk
	SHS8Lxq0gNowO8kD7iRQQXE+lT+GoL6z15OmScTTZ+ypI2R4u1VK4u0DMJMMIPATwT28bRsTS6I
	av3AYA6KTpQs4mdznG9Dl4wBbhoP4/XNKcK6rc+wvsgV1KpHXqDPuqYumnUqrmkkn8x1FVF87Ns
	Hu+kZsJHZ7u2Y0hIxi4/Xq9fqOg3+in1dQhSEM+d6rIOCQ9qk3Gdcq4PeLBoHCe+iqHqwPvtQKu
	0xpVt0fUZRsLE1aNtYUjSIYXyL65eNwAPA==
X-Google-Smtp-Source: AGHT+IEh5pX7uIDIZLZYjnGeH5gEqXeedK818+958xSMEg3kwVwipJmaknLmFX93B9zyn1p90/OZ9Q==
X-Received: by 2002:a05:6402:35cc:b0:5f8:e955:241d with SMTP id 4fb4d7f45d1cf-5fab0574bf9mr8498986a12.8.1746520744874;
        Tue, 06 May 2025 01:39:04 -0700 (PDT)
Received: from localhost ([37.72.3.43])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5fa778188acsm7050363a12.35.2025.05.06.01.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 01:39:04 -0700 (PDT)
Message-ID: <6819caa8.a70a0220.771e1.2b4b@mx.google.com>
X-Google-Original-Message-ID: <87o6w65e1l.fsf@>
From: =?utf-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mikisabate@gmail.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: paul.walmsley@sifive.com,  palmer@dabbelt.com,
  linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Improve Kconfig help for RISCV_ISA_V_PREEMPTIVE
In-Reply-To: <ceccc081-2dd5-4828-8eaf-148b48e05eda@ghiti.fr> (Alexandre
	Ghiti's message of "Tue, 6 May 2025 10:33:24 +0200")
Organization: Linux Private Site
References: <20250501130309.14803-1-mikisabate@gmail.com>
	<ceccc081-2dd5-4828-8eaf-148b48e05eda@ghiti.fr>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 06 May 2025 10:39:02 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_013907_431642_16CEFE71 
X-CRM114-Status: GOOD (  16.17  )
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
Content-Type: multipart/mixed; boundary="===============1018215739552952040=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1018215739552952040==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On dt., de maig 06 2025, Alexandre Ghiti wrote:

> Hi Miquel,
>
> Your patch title should be prefixed with "riscv" or "RISC-V", but no need=
 to
> resend, I'll fix it when I merge your patch.

Yikes! I'll keep this in mind next time. Thanks!

>
> On 01/05/2025 15:03, mikisabate@gmail.com wrote:
>> From: Miquel Sabat=C3=A9 Sol=C3=A0 <mikisabate@gmail.com>
>>
>> Fix a couple of spelling issues plus some minor details on the grammar.
>>
>> Signed-off-by: Miquel Sabat=C3=A9 Sol=C3=A0 <mikisabate@gmail.com>
>> ---
>>   arch/riscv/Kconfig | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 1fd197afd2f7..3f40e33bc115 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -664,12 +664,12 @@ config RISCV_ISA_V_PREEMPTIVE
>>   	default y
>>   	help
>>   	  Usually, in-kernel SIMD routines are run with preemption disabled.
>> -	  Functions which envoke long running SIMD thus must yield core's
>> +	  Functions which invoke long running SIMD thus must yield the core's
>>   	  vector unit to prevent blocking other tasks for too long.
>>   -	  This config allows kernel to run SIMD without explicitly disable
>> -	  preemption. Enabling this config will result in higher memory
>> -	  consumption due to the allocation of per-task's kernel Vector contex=
t.
>> +	  This config allows the kernel to run SIMD without explicitly disabli=
ng
>> +	  preemption. Enabling this config will result in higher memory consum=
ption
>> +	  due to the allocation of per-task's kernel Vector context.
>>     config RISCV_ISA_ZAWRS
>>   	bool "Zawrs extension support for more efficient busy waiting"
>
>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>
> Thanks,
>
> Alex

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJJBAEBCgAzFiEEG6U8esk9yirP39qXlr6Mb9idZWUFAmgZyqYVHG1pa2lzYWJh
dGVAZ21haWwuY29tAAoJEJa+jG/YnWVlXmAP/j7qS8GoNAoFN73khsWuHSpSP7xG
ueY9TZuygiLwriu11LRda2vGZACHpZW8fxrvoAw4ayEiWLcF0MHegVy4+nueQx5/
ADrOBXeHCUxVVYeDDG0yu7S2DOQ8VZkpSLz2ABuZFgj2ebQkHJmD7Tl4YVkdC+z2
Zb8gJt2x8qRfg7IzyC6G5FWD6t/i+LdJSnGCTDY+8Wn8Vz8ndU4f31q5IangOj8m
aCVe7TVNYiVsm22OYb8RH9K3mPIZQ1N5059EfnaGmAKRy9u+3MUrG3SKw88dco8E
ZMqraYWEm86cjpHWzU5dSCGgiLSVb6KcPBI6QyDp6Fg1TVwFBVS63r7T9aiWzg3j
9lQX61wJPoStZ7/eOnwgUo+2xH3fzc6lN88pBHhYDoIC7nnU5rnHVqZijyQiRu1Z
I36gjldjFvbPYE8Aj47NKwSV7VvwkFxynijvO+wMX7JqrL6pOBsfon9IBIXIobDP
qrgR//GPNGCOWmSGYUUo9LGoHtrOy20GZbAvhXr8AoUD5uOmaP1dAx7FZATHZl6O
3W4aeNl4qkmOAw94uEZkjS5mCsZXN9P7wUQtP3+WR9vhyh9IDBbQBtjjIZteZVwh
hpGH+sUr5MHWhP+qGG+eOfHjgDHXOfdHWIUtecwElQx48IL3s2JFL+jyIb/4Uwj7
rlTtXA6qA7Y/zFot
=DGgC
-----END PGP SIGNATURE-----
--=-=-=--


--===============1018215739552952040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1018215739552952040==--

