Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF3FD15D90
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 13:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wf/lqJCnD0nDG+foNfP2Fsb0T0hvNaEwe0XnfIygQQ=; b=FLQ3QadpKrbyZJGEIL6dtvje6x
	4Do0tGJ+TunhTHcuAq/ts47TjCa7UJltEgiHQbNSH/yjEOeS3FaQLHm0LjpVybki4zZQma1zNlh4l
	gVRgXE04M47RAw8GgyeMFbVD0NOIrj8Mnqle+xbyrabjMLBkMTrjkPm5hgI0KFdjlbRNz/vjQAq2B
	GNZ5N8nAR07gF9bazMbxyAXhif9rb4YLwAruP1geCzCMcTiBoalIeLPx8zIoknkYXcHJj40ch6bry
	SALzG8oYGylzRgSXthafH0/6a7rr3JZ5QkvuMZMRze/RjiQnJAR7ETQvWrbezXAFOUJwQkCrKkrTR
	F66vsT4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sXk-00000007Qn4-1lEh;
	Mon, 21 Oct 2024 13:33:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sEy-00000007Nwg-0ZM8
	for linux-riscv@bombadil.infradead.org;
	Mon, 21 Oct 2024 13:14:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:To:From:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QnMZzJHz8MBj/x2phdEFmC0p3r7yI6w21gYxvmtZJMY=; b=m3nMb+DDb+cTe7y4QNlXhP9Lo4
	gOTbGxkerNT52KH59anfQKlzpJS84bhB5dpM2Iic76eIAjOpvwvKPjIcC7fomasfTpwbaexYFhNNr
	YHExs5mZobL5I/ALZe3Vhl0Ng7a6nRiXfZSPmZubK8UMkP4KaxRVviBRePja6oP4PV9urdu246I9c
	XQrWimCip4mItpl2ABf1Fi2JQ7spinTWODtevy1J14f3Rai7mcYYudNVt8yQeujcfr6w1Vvc3HxBA
	sMuHofERqAtQmICWEv1JUgDxqjnYeT5CxN9+BgJczEDrAA2wbllzVAUJ9C/iUPsilLCZBkxQrzRi4
	mITzYAYg==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sEv-00000007x4G-0tC3
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 13:14:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 14C8FA42638;
	Mon, 21 Oct 2024 13:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79886C4CEC3;
	Mon, 21 Oct 2024 13:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729516464;
	bh=OPT5AbxfJYRmwQf7O59ti/U6BN1gWoe3PBxjcsD4Oy8=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=mF5QUNjWAyemP13yIZEigUjZDcIaiI5NUuT9BJZruFdXivO7jvXVXWO7agFbF6RFJ
	 rQQK7CtjCfUwj38GJUU+V900DEyszmzR1UgexjDtiaEOKWjTi2U2BjkBSd8PQ6mB23
	 wrQzlhhV4c6+VcF2JDS0nrAEN6ZuLcHwTE3lKJRof57QqDUK4Z7AVvPfeTsNQBP723
	 ZDFTSeF0uPpwYy1rU4HGJUkV8pimDA2THaRbHtKLZTEo9bNiv+7NM14s+gKA6o/vdQ
	 p0qGd2jAO4y6Hbs7ST9aewCMth3kCSXlnH9ZDEsmcLFBh31VadoyqtvFdgI8XRRxLa
	 0CZfZfoHFY5lQ==
From: Puranjay Mohan <puranjay@kernel.org>
To: Helge Deller <deller@gmx.de>, Albert Ou <aou@eecs.berkeley.edu>, Alexei
 Starovoitov <ast@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org, Daniel Borkmann
 <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Eduard
 Zingerman <eddyz87@gmail.com>, Eric Dumazet <edumazet@google.com>, Hao Luo
 <haoluo@google.com>, Jakub Kicinski <kuba@kernel.org>, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Jiri Olsa
 <jolsa@kernel.org>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, Martin
 KaFai Lau <martin.lau@linux.dev>, Mykola Lysenko <mykolal@fb.com>,
 netdev@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paolo Abeni
 <pabeni@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, Shuah Khan
 <shuah@kernel.org>, Song Liu <song@kernel.org>, Stanislav Fomichev
 <sdf@fomichev.me>, Yonghong Song <yonghong.song@linux.dev>
Subject: Re: [PATCH bpf-next 3/5] selftests/bpf: don't mask result of
 bpf_csum_diff() in test_verifier
In-Reply-To: <31b8ea3b-f765-43c0-9cee-49bc13064f04@gmx.de>
References: <20241021122112.101513-1-puranjay@kernel.org>
 <20241021122112.101513-4-puranjay@kernel.org>
 <31b8ea3b-f765-43c0-9cee-49bc13064f04@gmx.de>
Date: Mon, 21 Oct 2024 13:14:04 +0000
Message-ID: <mb61p1q09d2eb.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_141429_541988_2F362EF3 
X-CRM114-Status: GOOD (  11.47  )
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
Content-Type: multipart/mixed; boundary="===============2992823816563701134=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2992823816563701134==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Helge Deller <deller@gmx.de> writes:

> On 10/21/24 14:21, Puranjay Mohan wrote:
>> The bpf_csum_diff() helper has been fixed to return a 16-bit value for
>> all archs, so now we don't need to mask the result.
>>
>> ...
>> --- a/tools/testing/selftests/bpf/progs/verifier_array_access.c
>> +++ b/tools/testing/selftests/bpf/progs/verifier_array_access.c
>> @@ -368,8 +368,7 @@ __naked void a_read_only_array_2_1(void)
>>   	r4 = 0;						\
>>   	r5 = 0;						\
>>   	call %[bpf_csum_diff];				\
>> -l0_%=:	r0 &= 0xffff;					\
>> -	exit;						\
>> +l0_%=:	exit;						\
>
> Instead of dropping the masking, would it make sense to
> check here if (r0 >> 16) == 0 ?

We define the expected value in R0 to be 65507(0xffe3) in the line at the top:
__success __retval(65507)

So, we should just not do anything to R0 and it should contain this value
after returning from bpf_csum_diff()

This masking hack was added in:

6185266c5a853 ("selftests/bpf: Mask bpf_csum_diff() return value to 16 bits in test_verifier")

because without the fix in patch 2 bpf_csum_diff() would return the
following for this test:

x86                    :    -29 : 0xffffffe3
generic (arm64, riscv) :  65507 : 0x0000ffe3


Thanks,
Puranjay

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIoEARYKADIWIQQ3wHGvVs/5bdl78BKwwPkjG3B2nQUCZxZTnRQccHVyYW5qYXlA
a2VybmVsLm9yZwAKCRCwwPkjG3B2ndk3AP0XXZde0lRtwFVwJrCkF/VkxqH1qoIW
YzgfJHIpSZzNAAEA0eN6ggg1/3zV3pUq6bqFbBaa+ah8TtqqUbVVefg8aAI=
=vDn9
-----END PGP SIGNATURE-----
--=-=-=--


--===============2992823816563701134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2992823816563701134==--

