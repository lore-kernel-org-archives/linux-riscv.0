Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1B010F9968
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 19:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5zwId4MXD8kUTMtUpQ2SSEzHKyYPB/541UABFtNQh4=; b=d2nlT4715pdJ44c696QFYtjZQ/
	Zu+rVGfryBxfiWlw+E7CoFTW/C8UGsgk5tX/IYnVIIx8LUPr6DjJ4JMyaKsvvGDq2TMtKyPRfNu2L
	aE+oobLNX/4JQcqaJZ7teE2flIXg+I05adugliabXCxR5z0W446hB6990Gj8jgw1ngw9PJlwOme6i
	E6eYOEj+ePXIQygtkiF7vtQYvwVWcmMY7Y0+XyiW4Ih+dEl8S4JKMxmqULx9/Iw4mWZFEl9Ga9BZL
	5ceJfkqpU248MrX+Jwf1RttDYZw/LTfjqozeAHYmbgDwM8xTt7CmRqZEme6Hzwtap1Iau1qi3Ta9b
	FS3K+C+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAYpA-00000009KlJ-0UMl;
	Wed, 08 Apr 2026 19:44:28 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAYp7-00000009Kjx-24t9
	for linux-riscv@lists.infradead.org;
	Wed, 08 Apr 2026 19:44:26 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4frYRR5Ddyz9tVR;
	Wed,  8 Apr 2026 21:44:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mssola.com; s=MBO0001;
	t=1775677459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qecm+tQ+Ywyd1ucb8nyib1pHP2cJ6XRw4E2UU704M40=;
	b=nN/Bi3Mh8onrJ7lQkVBymW89ZY7wj4OJ5zN2VKq7ZFHAc4iKVonYqEnXJs/JfXXu+JMjYC
	fzkojK3Sif9nH6JRjjY25weLM5N2rej4sZCwPbzGcmJT232pQC1m1q1C3/9vFt1nwBHVXA
	7ZUbOrsgvX+7mE13t2t5UFn9bmwjUR0SShw69RWHBUTaZ82hrGIF7juRzt44n43vzAP08v
	A2rMy8Cqc+cBvnl5Gu06J6cUdITpGWlqY2ZBl2g94Sh9vU48m7Bp0AWyQU+RiVoPSS3smG
	BbHN/s185HhaMqJAkmFmVb8W9V4FhLKCsQVFBn8pvknZnuLtl+rtcD8NQ7L6Eg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=softfail (outgoing_mbo_mout: 2001:67c:2050:b231:465::202 is neither permitted nor denied by domain of mssola@mssola.com) smtp.mailfrom=mssola@mssola.com
From: =?utf-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mssola@mssola.com>
To: pjw@kernel.org
Cc: palmer@dabbelt.com,  alex@ghiti.fr,  corbet@lwn.net,
  linux-riscv@lists.infradead.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: enable HAVE_CMPXCHG_{DOUBLE,LOCAL}
In-Reply-To: <87sea63hmh.fsf@> ("Miquel =?utf-8?Q?Sabat=C3=A9_Sol=C3=A0=22?=
 =?utf-8?Q?'s?= message of "Wed, 11 Mar
	2026 09:17:10 +0100")
References: <20260220074449.8526-1-mssola@mssola.com>
Date: Wed, 08 Apr 2026 21:44:16 +0200
Message-ID: <87fr55qltb.fsf@>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4frYRR5Ddyz9tVR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_124425_757386_7437A837 
X-CRM114-Status: GOOD (  14.45  )
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
Content-Type: multipart/mixed; boundary="===============6773967390268952984=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6773967390268952984==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Miquel Sabat=C3=A9 Sol=C3=A0 @ 2026-03-11 09:17 +01:

> Miquel Sabat=C3=A9 Sol=C3=A0 @ 2026-02-20 08:44 +01:
>
>> Support for atomic Compare-And-Swap instructions has been in the RISC-V
>> port of the Linux kernel for a long time. That being said, we apparently
>> never bothered to set HAVE_CMPXCHG_DOUBLE and HAVE_CMPXCHG_LOCAL in the
>> Kconfig, despite having all the framework to support them.
>>
>> Signed-off-by: Miquel Sabat=C3=A9 Sol=C3=A0 <mssola@mssola.com>
>> ---
>> I have built this patch with multiple configurations and ran it with KVM
>> (the VisionFive2 board that I have lacks the needed extensions). All see=
ms
>> to work, but I do wonder if we did not enable these for a reason or this
>> just slipped through. So far in the code I believe everything is in plac=
e,
>> and I haven't seen any commit in the git log stating otherwise.
>>
>>  Documentation/features/locking/cmpxchg-local/arch-support.txt | 2 +-
>>  arch/riscv/Kconfig                                            | 2 ++
>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/features/locking/cmpxchg-local/arch-support.t=
xt b/Documentation/features/locking/cmpxchg-local/arch-support.txt
>> index 2c3a4b91f16d..28d5fa8c3b4f 100644
>> --- a/Documentation/features/locking/cmpxchg-local/arch-support.txt
>> +++ b/Documentation/features/locking/cmpxchg-local/arch-support.txt
>> @@ -20,7 +20,7 @@
>>      |    openrisc: | TODO |
>>      |      parisc: | TODO |
>>      |     powerpc: | TODO |
>> -    |       riscv: | TODO |
>> +    |       riscv: |  ok  |
>>      |        s390: |  ok  |
>>      |          sh: | TODO |
>>      |       sparc: | TODO |
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 7e76b6316425..7c6726a8d738 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -151,6 +151,8 @@ config RISCV
>>  	select HAVE_ARCH_USERFAULTFD_WP if 64BIT && MMU && USERFAULTFD && RISC=
V_ISA_SVRSW60T59B
>>  	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
>>  	select HAVE_ASM_MODVERSIONS
>> +	select HAVE_CMPXCHG_DOUBLE if RISCV_ISA_ZACAS && RISCV_ISA_ZABHA
>> +	select HAVE_CMPXCHG_LOCAL if RISCV_ISA_ZACAS && RISCV_ISA_ZABHA
>>  	select HAVE_CONTEXT_TRACKING_USER
>>  	select HAVE_DEBUG_KMEMLEAK
>>  	select HAVE_DMA_CONTIGUOUS if MMU
>
> Gentle ping :)

Another gentle ping :)

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJiBAEBCgBMFiEEG6U8esk9yirP39qXlr6Mb9idZWUFAmnWsBAbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyEhxtc3NvbGFAbXNzb2xhLmNvbQAKCRCWvoxv2J1l
ZcMAEACq7VYX1N8XChDr1rwM2yAKvKqM5RQEgy8GLu56W41XUjX9bJ6kHjONkc4r
IbduYPCCPwqfGsowCo6k7FW2OVdDApHwEzQht0NvV4xFv1MdByWtGKgbV/9L0jA9
/EFHWt4iKHnpRtVUNP6hy/M4lufeNiVJO13YPTuhhSQqhOfgZPIAf45T8XHWD3Bk
OnkkCr1iWmxVgXP8UWWkNlLbRvPig+DDBZabCpcI00O0s1KsirvIkmRZ4TvjzYCP
rIkq1ayLItClo0jthJgUV9NcF0X4kvpFSw2Zg3Xet6O2aWKep3zz1nkT6vW6UGzv
BqUtPn9O6pu10MAPnP7alqQze2Gf/DjsbXN96J1Ekq6oSpeh7fbrNUDo5KLzgrx/
etoXNzH0JXLXowV+3aD3+xgxtOUkbgC8xvgsl7Or4p488bpXwL7X+jZ5ezj6Gd3i
5do+RKK81xKaYe2Zshe7chgHu4Gbuv4l3C+S4vTxGnX9gGdxWT5B24s73uZMnkWE
x1U34D59cGJhSuqt2WM39Ehb6OmOpnL1BEh5Y0nBn34XtLtvzD9JKg4YC2YdyEOq
jgE29oxzCP7ToVACe+xKg943/+HUN7MsML4ZIjR3XC/GMhN3TcFoV2TXlHYOhba5
7z7qsem+tstMGgDm2j64PvCFnMDkr38LRhxdnhdbldM11pOpDg==
=1w/r
-----END PGP SIGNATURE-----
--=-=-=--


--===============6773967390268952984==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6773967390268952984==--

