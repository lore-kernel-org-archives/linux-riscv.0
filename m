Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E8FECAAD3
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 11:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:Subject:References:Cc:To:MIME-Version:Date:Message-ID:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0oAWrfXl5QJOb7FWxHi9Bc+Q7xQVvGwN16dde7thh4o=; b=l68xIVnwfa0++HWsRw++iVaayK
	zrl6vHohXJhRzTZ8LefjLHtXWMRBt2ezlkx0jeSEs0Wv7SS9dd1O3lnBOJjqsE6EUzH7ZmuecFQPg
	97OsDTHIBZuA8wXujL2kBQR/pm2LGGRY5EZ16V0QNqwqbjavl1wtmnKzSZxKvasqvFcaVrir6PXhc
	dte/grCSDnmjidBuGx7SEsCaxq6qka21FMKAyuPJHnXHon6x9fbV2LSk1Z6OHeawNXQ6+92jDTugr
	zLIMy6194Np0rJezznb5sZllE1m70cvsy+tvbEJeeLMMYhV0Ftqy+4oTeJq1Nl5kJHA32b887TkiO
	3tKBGgVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWcOr-00FnV2-V1; Fri, 09 Sep 2022 11:42:22 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWcOo-00FnU6-VC
	for linux-riscv@lists.infradead.org; Fri, 09 Sep 2022 11:42:20 +0000
Received: by mail-pj1-x1042.google.com with SMTP id n65-20020a17090a5ac700b001fbb4fad865so1292534pji.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Sep 2022 04:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:subject:references:cc:to:content-language:user-agent
         :mime-version:date:message-id:from:from:to:cc:subject:date;
        bh=fWA0ymNH92N5Nr+aLCHdStt64cX+dcodm1s3xTWSOt0=;
        b=qoccLKvYd0R2ozypqOBKl1ySeGVRFOULwlkGNy8SQr0cxVsvC5fp4oiR64uEQgOHhW
         rzL+P26pUGb60XhUGVO7trtmB6q65cfnJ+3F55AIdbOKQdNnwE0uMQdER3uCWOJ0XQk5
         m34TzQVNk32jaNU3zQjo4E3WAHTXmAYNSv4PKYmlYYbpk0lwA2Yt9yFd1cTd9/nySFmF
         I7vjkOxKOxFCqBQcP06F8ggho9Zq69xnL8N3X3O6nWcQqTzbCcnHEoWAaB0Xrqo0JZJC
         SLBzAfrWRo878NKB5wcvNncNOqi3eEFUN0kzKCTNKW5NKsDAHUXHpgPV40c1rL/1qyd2
         /Ndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:subject:references:cc:to:content-language:user-agent
         :mime-version:date:message-id:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=fWA0ymNH92N5Nr+aLCHdStt64cX+dcodm1s3xTWSOt0=;
        b=kVRvtWjS8eJwlqQ5fcwh84eC1kYVDaf+zMqs1OuDZeGzdFVUB8SMldEZswp0mDpv1I
         SRUDTmgj86wzhgDZF0uCfkDcrNtMFcRXE16IEGT1NUMv/386lh/LQaRGxG+kElRX3Xv3
         Qnpk2zn7m89gpyLv1oJKoI+rZKUlPgxX9M3broWk+FjoUYl07/i/AQq3940EVPrPWkVL
         lGMt6Q1emBA3jEspUby446rn9QDP9sFd1+Me0m2Cm1gUI/cxceR7D5rR0PYl+udvl6pV
         GIQPVR3ctAcalQo79wZ95vcmsLD8exOXrXNZu/VIlMY+zrHkts/ZjNt4OQISVUkWCLye
         z2nQ==
X-Gm-Message-State: ACgBeo2eliiJx0Db84dlQ3bH80kQ9O/UaU5eM536bRpIRlW0NZTzJ0RV
	0hv8JfBn3iiXPMkFUiD/KqI=
X-Google-Smtp-Source: AA6agR72jUnKRKUgN/H0mawutkH+94T+Y8gBlodnCyN7Z7vY1Yj5Q1giN5rtOhWVVtYvKmwl+IGFfA==
X-Received: by 2002:a17:90a:1786:b0:202:856e:29bf with SMTP id q6-20020a17090a178600b00202856e29bfmr3874520pja.134.1662723738092;
        Fri, 09 Sep 2022 04:42:18 -0700 (PDT)
Received: from [127.0.0.1] ([38.94.111.114])
        by smtp.gmail.com with ESMTPSA id c20-20020aa79534000000b00540c24ba181sm332137pfp.120.2022.09.09.04.42.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 04:42:17 -0700 (PDT)
From: Coelacanthus <coelacanthushex@gmail.com>
X-Google-Original-From: Coelacanthus <CoelacanthusHex@gmail.com>
Message-ID: <dfd6cfd9-5985-030f-4c77-f9037dcebe90@gmail.com>
Date: Fri, 9 Sep 2022 19:42:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
To: Andrew Bresticker <abrestic@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Atish Patra <atishp@atishpatra.org>, dram <dramforever@live.com>,
 Ruizhe Pan <c141028@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220908170133.1159747-1-abrestic@rivosinc.com>
 <20220908185006.1212126-1-abrestic@rivosinc.com>
 <2f5059f6-b024-1ee8-b961-5aa0b4e4c116@gmail.com>
Subject: Re: [PATCH v2] riscv: Make mmap() with PROT_WRITE imply PROT_READ
In-Reply-To: <2f5059f6-b024-1ee8-b961-5aa0b4e4c116@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_044219_047124_B5D783BB 
X-CRM114-Status: GOOD (  28.75  )
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
Content-Type: multipart/mixed; boundary="===============0621767665468826538=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0621767665468826538==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SUZee3Kw6KRsiMl5TnpHeQrR"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SUZee3Kw6KRsiMl5TnpHeQrR
Content-Type: multipart/mixed; boundary="------------aFKfD0lQyZ0JWGrVJSW1h58q";
 protected-headers="v1"
From: Coelacanthus <CoelacanthusHex@gmail.com>
To: Andrew Bresticker <abrestic@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Atish Patra <atishp@atishpatra.org>, dram <dramforever@live.com>,
 Ruizhe Pan <c141028@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-ID: <dfd6cfd9-5985-030f-4c77-f9037dcebe90@gmail.com>
Subject: Re: [PATCH v2] riscv: Make mmap() with PROT_WRITE imply PROT_READ
References: <20220908170133.1159747-1-abrestic@rivosinc.com>
 <20220908185006.1212126-1-abrestic@rivosinc.com>
 <2f5059f6-b024-1ee8-b961-5aa0b4e4c116@gmail.com>
In-Reply-To: <2f5059f6-b024-1ee8-b961-5aa0b4e4c116@gmail.com>

--------------aFKfD0lQyZ0JWGrVJSW1h58q
Content-Type: multipart/mixed; boundary="------------bwSAN7SOMWQSxhlWJjUcH4Q0"

--------------bwSAN7SOMWQSxhlWJjUcH4Q0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2022/9/9 11:01, Celeste Liu wrote:
> On 2022/9/9 02:50, Andrew Bresticker wrote:
>> Commit 2139619bcad7 ("riscv: mmap with PROT_WRITE but no PROT_READ is
>> invalid") made mmap() return EINVAL if PROT_WRITE was set wihtout
>> PROT_READ with the justification that a write-only PTE is considered a=

>> reserved PTE permission bit pattern in the privileged spec. This check=

>> is unnecessary since RISC-V defines its protection_map such that PROT_=
WRITE
>> maps to the same PTE permissions as PROT_WRITE|PROT_READ, and it is
>> inconsistent with other architectures that don't support write-only PT=
Es,
>> creating a potential software portability issue. Just remove the check=

>> altogether and let PROT_WRITE imply PROT_READ as is the case on other
>> architectures.
>>
>> Note that this also allows PROT_WRITE|PROT_EXEC mappings which were
>> disallowed prior to the aforementioned commit; PROT_READ is implied in=

>> such mappings as well.
>>
>> Fixes: 2139619bcad7 ("riscv: mmap with PROT_WRITE but no PROT_READ is =
invalid")
>> Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
>> ---
>> v1 -> v2: Update access_error() to account for write-implies-read
>> ---
>>  arch/riscv/kernel/sys_riscv.c | 3 ---
>>  arch/riscv/mm/fault.c         | 3 ++-
>>  2 files changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_ris=
cv.c
>> index 571556bb9261..5d3f2fbeb33c 100644
>> --- a/arch/riscv/kernel/sys_riscv.c
>> +++ b/arch/riscv/kernel/sys_riscv.c
>> @@ -18,9 +18,6 @@ static long riscv_sys_mmap(unsigned long addr, unsig=
ned long len,
>>  	if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))
>>  		return -EINVAL;
>> =20
>> -	if (unlikely((prot & PROT_WRITE) && !(prot & PROT_READ)))
>> -		return -EINVAL;
>> -
>>  	return ksys_mmap_pgoff(addr, len, prot, flags, fd,
>>  			       offset >> (PAGE_SHIFT - page_shift_offset));
>>  }
>> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
>> index f2fbd1400b7c..d86f7cebd4a7 100644
>> --- a/arch/riscv/mm/fault.c
>> +++ b/arch/riscv/mm/fault.c
>> @@ -184,7 +184,8 @@ static inline bool access_error(unsigned long caus=
e, struct vm_area_struct *vma)
>>  		}
>>  		break;
>>  	case EXC_LOAD_PAGE_FAULT:
>> -		if (!(vma->vm_flags & VM_READ)) {
>> +		/* Write implies read */
>> +		if (!(vma->vm_flags & (VM_READ | VM_WRITE))) {
>>  			return true;
>>  		}
>>  		break;
>=20
> Hi, this did solve the problem and achieved consistency between
> architectures, but I have a question.
>=20
> Such a change specifies behavior for a state that should not exist,
> and if, in the future, RISC-V spec specifies a different behavior
> for that state (I mean, RVI itself has a history of not caring about
> downstream, like Zicsr and Zifencei), it will create inconsistencies,
> which is bad.
>=20
> If we reject the "write but not read" state, the user gets the most dir=
ect
> response: the state is not allowed so that they do not and cannot rely
> on the behavior of the state. This will bring better time consistency
> to the application if the spec specifies the behavior in the future.
> But it lost architecture consistency.
>=20
> How do you think this situation should be handled properly?
>=20
> Yours,
> Celeste Liu

Oops!

I found a mistake in my previous understanding: PTE permission!=3Dvma per=
mission.
So your modification makes sense, no matter how we handle the mapping of =
input
permissions to PTEs, as long as we don't use the reserved permission comb=
inations,
the behavior is reasonable and also independent of the architecture's def=
inition
of PTEs.

But I think this mapping relationship should be well documented. If we ha=
ve
such a mapping behavior in all architectures, then we should change this =
line in
the mmap documentation
    On some hardware architectures (e.g., i386), PROT_WRITE implies PROT_=
READ.
to apply all architectures. According to my read about code, all the vm_g=
et_page_prot
will do the protection_map mapping to have this feature.

Yours,
Celeste Liu
--------------bwSAN7SOMWQSxhlWJjUcH4Q0
Content-Type: application/pgp-keys; name="OpenPGP_0x15F4180E73787863.asc"
Content-Disposition: attachment; filename="OpenPGP_0x15F4180E73787863.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
4+0QY+GF62K5ofedhvF1PzmNGwywD7GHgAQq/w0=3D
=3D16WL
-----END PGP PUBLIC KEY BLOCK-----

--------------bwSAN7SOMWQSxhlWJjUcH4Q0--

--------------aFKfD0lQyZ0JWGrVJSW1h58q--

--------------SUZee3Kw6KRsiMl5TnpHeQrR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQQWueXrpnXi8KYNNJjjXInkWGeuNQUCYxsmigAKCRDjXInkWGeu
NQoiAP4/yrFmP3bRukPlpNPd7PeWerHxk45jZwi9PYsaCaq4MwD/Xnp0WGLqm4Ie
fk3goebHslm7dZEbj/rw+WxUjeQRTgE=
=cNdq
-----END PGP SIGNATURE-----

--------------SUZee3Kw6KRsiMl5TnpHeQrR--


--===============0621767665468826538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0621767665468826538==--

