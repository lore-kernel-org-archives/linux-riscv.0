Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8AE606A31D
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 14:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xpvk/4Cx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BsTgeaAx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=TsKtKKMYepAydJQIj7lTSd6dm25ODEf4za1D7qm765o=; b=xpvk/4CxMMdmgJ7BhEr4TYfm41
	hWJEql6LBdEYaUIGxM0C2Vl/Dn54UX3+vWlFSqWP+cQqghkJH/aipj+Qw+kxsGKTLMdmg/UviqJwm
	lQXzAG2//RWRBXGadMW2N9yi5Gf22XgRyhHFJGvU3CFmORWuytfKX83OFOvwQaNCpZJabarV9AScJ
	IMb1v8v2z9BVFm1LKcH5LJu8KhP6q2ipf/QfoYJpYC0jPaUOvwlQxIRKTOomcz+FByvXzzClTRTCn
	HHly1n7Cxg+7LF63mgS38oBzT529vYFUgOn7SY3PsmlcBqVVY8PcC+RIl1yTfZUbz84yTnVJq3sjw
	M7YGdfJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtrS-0000000EJ9x-0x35;
	Thu, 22 Oct 2026 14:33:42 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtrO-0000000EJ94-2NIt
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 14:33:40 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-66fbdb0a5a7so315409d50.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Oct 2026 07:33:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792679617; cv=none;
        d=google.com; s=arc-20260327;
        b=KZBeoPOh0jK6PNLGCInuNVLHOAdqO3IncEnpFF99FxVQCS88oedA2cIaiLrZdVkhKz
         bn0EH6M7xbCy8yaDRY9xB375Ig3ECWm1UPBQzQqtXQc6UfZDvmOVSQO5FwWTQJkve0rL
         R+zQomnn69IU7G80sSZPA+Y8R9USq7IF7y48Hus/W/GghYQMFTuLoVDuibMUZBOMNU4g
         U3p2BsErEFXNHWyCEqokGYVeCBJQrDib5SMhem+rfEo8inImeC8d30ULcdtD4l3I8kuY
         KiKaNYoc/3/vFXiXNIjoNm72pCRopyIcLvHfTKsRXDCaznzSyN4L64vwH8HvZm1b1Jlf
         B+aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=y/nVz+Qmk+Tq2vmwCZBWANvE9dUy6Fp4Dxh9VLxLk90=;
        fh=ifY4U+PJMxU6ePAjeuugIOglzTlwycGOON/9KmD4IAk=;
        b=itPqD1uVWg/aO1EgRwsdD03Y/bT2bq3JAyyczdyRmXp2n9S+QnGbaz8A9KjR4mwC6C
         wgbyMgxgffTPgnFgvLTIPm9PS1oxWXYD40PefDDA9I7seKEpLFuIeeueJ+5dZzQfoNh4
         CM120QrDFSjdcNkcLE7sn+++v/lcc0hNBy2e/LBzBvhq+Q45ms1qtCfgveJzUW+xe5fy
         5Ger7znUuJiAoxjjxpZMPfPqHtORZFK18/4PTmgAvqyQhTB0v0+svqeF7GexejEx2fRz
         unECF4k+Ta6g0xah/TNHGSS6+6Ef3SKCZsG8EsF9kf0OYNdGnk+QLxA5Ic/ynz30GsDF
         5shg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792679617; x=1793284417; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/nVz+Qmk+Tq2vmwCZBWANvE9dUy6Fp4Dxh9VLxLk90=;
        b=BsTgeaAx0nBm2qTPNag2R3M+TslaHLxPTiBv1T9etAKzGb9jXVZg1xDUbhU7nIgCrA
         eHrsrpGhsgJQBEUPEe/NLR0LdcPDpqXH28+2NMBKkCfcZD7d86kD+hds8bGaiBEcB58c
         EhhVXgnrm7gN1XlKEbjWzOkQvx9AwvVx//VcvODJlqZwViBvqNRIcHI5tPcVmmr4wfax
         VjcObLWusT/URg3DxbxeGCxhWLSc15y4rZeMwpfxH8MKv1Gh4HMymfMvcjlMoBLuT7cB
         o/FqNJiXGhqovMLCXdqcl8/SOq8GWZPZTC1ScDyUJ/nD86TLKP6FvxXL/wK0OkQKvWR3
         K5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792679617; x=1793284417;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y/nVz+Qmk+Tq2vmwCZBWANvE9dUy6Fp4Dxh9VLxLk90=;
        b=qvrIrQgWRZSSh50bM+cnNTGTQGlitSDyGp4Kl/OnCrQeuxGITOeLv7QZKcIZ0l44kG
         FufFgSo4eskfPDKzBoClph9EiEbFIdMbwzMD5VUjRczI2PBRi/XvNg45CG0bGJ1Oumzz
         /9gUlmaMQ+hObFuPPvPUIfW1QN0wpexetSlbTTEPHv6ikfAbTBc424uF/c4/fw8nrnfl
         wNLo3iYVZfBC5EigmaMwcyfr7I/JeJQh5a2WtyYRtBRfrAYW8N3YcmW6he/u8TtN1an/
         SVN8KigDTlR0LuXusR6HQHn3DMw5bRsW8iqbgKiNGQNP7bUSVTW6lZwD7fb2Zczk42gB
         P1Bg==
X-Forwarded-Encrypted: i=1; AKwUvBzEyRY9Dz29hfJtMwsK+FFKM1YXdMCAzm29zfA3jBBHUMBiFjCoqmR/ht1sDDdXwRwuKB0utI0uLeYyYw==@lists.infradead.org
X-Gm-Message-State: AFq9FYISm67J88QarK9wXFFtbLySU8BWplkO9HGKIsqYlRQbcetYWYOX
	KG3tLfeB9NTYubseQKu+mZZwjcU2j+/9JQOqUcROfRV+sEDVfua6emF6nikd1xI5APZCgsQUhsY
	/JxEOfe812UUP/uoK8u5/01/SFs6H4r0=
X-Gm-Gg: AYBFou1U0543TQexTXHnmV5ViS2rgL62R5hsH6Ob4JGG6ivYtXHVdTs4n7uxCsepxY3
	E1TZPG3dyIrHPxp17B81LC3sinq22ni6NyyYznGhjpAzOhWAP/CFagfOsZXqKBTGuO1MMClpocy
	ybtrvXRe9CUXQIkzxi+r8PIsXLtNDYwDD7lO5uOrET8oOvcN49fAqCNZfn0w1AQgwhj1zp97D0+
	Dmt732h7j6ZAmpacMfVJ8L0mH50/imSNmf/BwlRFBhNZICGQQw4h+e3cb1h2nRDptOhxRYxP6YR
	OB16uA+q/GkBUA87RsERcmzKYETrUr4byfWAVxUAJY4edVDdTr5+JcY4KTsbOIpYQfAT1e+86R4
	Fy9FVJFfJjvPvxBtj9uT9tFoWSbzenBhzbkI=
X-Received: by 2002:a05:690e:4504:20b0:679:9e25:316c with SMTP id
 956f58d0204a3-67a0e4f7118mr3858513d50.5.1792679616649; Thu, 22 Oct 2026
 07:33:36 -0700 (PDT)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 22 Oct 2026 07:33:35 -0700
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 22 Oct 2026 07:33:35 -0700
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20261022021820.1789083-1-odys.yuan@gmail.com>
References: <20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com>
 <20261019-bug-word-at-a-time-zeropad-kasan-v1-1-f21a3ed6a477@gmail.com>
 <CAPAsAGyrH1quaLuyui6Qm5sokid8=yjNbAM3cOunynfPNQtfgg@mail.gmail.com> <20261022021820.1789083-1-odys.yuan@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 22 Oct 2026 07:33:35 -0700
X-Gm-Features: AclHuK9KZnLcDmcb3UzjebEw_JXnOgl4qhgoWZHIOId6L7KU5VJDln5TqsxLBMU
Message-ID: <CAPAsAGyA=WG=z6a==N3O6oan6WVmZS-VrxEA7SrxRQs5d+Dsfg@mail.gmail.com>
Subject: Re: [PATCH 1/2] word-at-a-time: check the first byte in load_unaligned_zeropad()
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Marco Elver <elver@google.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, Peter Collingbourne <peter@pcc.me.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_073338_632021_084F252C 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Qiliang Yuan <odys.yuan@gmail.com> writes:

> On Tue, 20 Oct 2026 12:58:54 -0400, Andrey Ryabinin wrote:
>>> +	/* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */
>>
>> Why it's open-coded ?
>
> For the same reason as read_word_at_a_time(): commit ece69af2ede1
> ("rwonce: handle KCSAN like KASAN in read_word_at_a_time()") open-coded
> it "to avoid having to pull the entire instrumented.h header into
> rwonce.h". I kept the six asm/word-at-a-time.h headers to the same two
> small headers, kasan-checks.h and kcsan-checks.h, rather than pulling in
> instrumented.h with linux/bug.h and kmsan-checks.h.
>

That concern is specific to rwonce.h being included from very low-level header
like compiler.h It doesn't cary over to word-at-a-time.h

> Thanks,
> Qiliang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
