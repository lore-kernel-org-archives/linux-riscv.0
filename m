Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E1AC47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 10:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q1kyxiIaVhj7Q4NQarU84Y1KmZs2R4rJDExHa+vNn5M=; b=Wb50RxE20Dk89F
	ELQU+kIvxAQDww8cS124onffR8+hXoWbF3iCKLoCgwEjsdT+gjEWFSmECFzVDyz8XXNx0r1ew2rHE
	5HZ6EihxBzf1itF+Ac2E3qzzS08jk/jWgP9vjrHfO8XRhkb29hg0YDjuZYYB0tJhbxR2P6Zl4RJiJ
	RLOQ1OeAL3mf4iH3mToeDZP7Uvfn6QKsUSHwoqNnX3Qq6p4JKX3f01oszSnPwgUyCrYpVj6OvnKcr
	0HvdDTlhtYcP2MOvIsEsWJm20GsNa/XSXm9fL4dfeyc0Yfp31B+fxeApfSVQF+v6CfNd5sx+0LZBh
	qCN2hio0zSk8C7PpWAWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLKtD-00DVLX-1n;
	Thu, 04 Jan 2024 10:23:51 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLKtA-00DVKo-0g
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 10:23:50 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1d3f3ee00a2so1759585ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 02:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704363827; x=1704968627; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzj3uOoh7PY5cR2xiJEt6lV6u8Aid8p6M7e8NclCE5I=;
        b=bdCKyLoumTk9L9N7FqHb8WPl7PDUZyqZxeksQCg9KJCdOr6oSNM8OHRcd48mFM1445
         y/OVh85GZtu5H37jLfLqUU0pq8tAHoPbz8HShqFaL1VdCjV+Hs8g39M4TueV+JMPDNqa
         ixTRp9c0yix1owku/VDyRNxRbTOnuaW8VuMyV61S/fgwEDTdGLWSN/NuPPZaSjxC5Tyl
         ue94axFT9Pv5ovuL2mg7DmMI9dmp3CepKnrzCGAmI1wePtZPuAk22Ezwb4xL5dqdvp0K
         FQ2V5olg3RlPJPKWOwTvNrp0vxjawPdXQNKpZsTjM1MQLIvk5Dd09/HT7T/uw5fCaSqA
         On6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704363827; x=1704968627;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pzj3uOoh7PY5cR2xiJEt6lV6u8Aid8p6M7e8NclCE5I=;
        b=qsY8IFQMZ/ExbHoQHoP0vVUMw+ZhazdWL+k63uCb07qh9Tle05nwYp8qF0o11NFaAk
         CeEwH+B40nmzRAFqSuJPx3p5w/CHQrLnyKIiUvtUJa3y11Nf2C8EScjfSQFe+xPwIGLO
         kH7lUW5rORjZmdf1qc9HDAwWkJMtteFRaFv6A91dPyAO/eX5nxGwwr9fTQ4NsT/0ttpt
         UBFiS+lIGh44j69spgQydqTWRrfwhducV/hXz/Ol1PVfX5Eqif0PMq/J6UAbkUEhhzae
         pFAxpx4GnhqNTkuV4Zsj9jOtK+NKQCKBpalSr0PMzyKxC7IqCE6Ia9BbMSm+Me3bYicF
         PwGw==
X-Gm-Message-State: AOJu0YxIqpmNVOHJQ1SuXi0XUI1/MVmKSw+aEZWcgzyx8isvIKX7Hl76
	xMVpQF4qo+Laxmh4rECB1RCXDhhF5YbL7Q==
X-Google-Smtp-Source: AGHT+IE+t/XnCgDoBmaNVOzJvr5a20jeY5tCq+x0APnt3WaHMTvvUZamnKncxOPcQZIME1UjYVniQw==
X-Received: by 2002:a17:902:a3cc:b0:1d3:9287:a1a9 with SMTP id q12-20020a170902a3cc00b001d39287a1a9mr277038plb.57.1704363826793;
        Thu, 04 Jan 2024 02:23:46 -0800 (PST)
Received: from ?IPv6:2402:7500:5d5:7102:b5d6:a469:295a:6de5? ([2402:7500:5d5:7102:b5d6:a469:295a:6de5])
        by smtp.gmail.com with ESMTPSA id h4-20020a170902f7c400b001bbb8d5166bsm25489720plw.123.2024.01.04.02.23.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jan 2024 02:23:46 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [RFC PATCH 00/13] RISC-V crypto with reworked asm files
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20240103143557.GA773@quark.localdomain>
Date: Thu, 4 Jan 2024 18:23:42 +0800
Cc: Ard Biesheuvel <ardb@kernel.org>,
 linux-crypto@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>,
 Phoebe Chen <phoebe.chen@sifive.com>,
 hongrong.hsu@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Andy Chiu <andy.chiu@sifive.com>
Message-Id: <20EF7A6D-19AE-49C0-982F-8FE7733E375A@sifive.com>
References: <20240102064743.220490-1-ebiggers@kernel.org>
 <CAMj1kXEAqxCZ_PNM9a=CyciSHUzDU_yqemKh51oncHyLbYUKtA@mail.gmail.com>
 <20240103143557.GA773@quark.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_022348_345919_DCEAC4A6 
X-CRM114-Status: GOOD (  31.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Jan 3, 2024, at 22:35, Eric Biggers <ebiggers@kernel.org> wrote:
> On Wed, Jan 03, 2024 at 03:00:29PM +0100, Ard Biesheuvel wrote:
>> On Tue, 2 Jan 2024 at 07:50, Eric Biggers <ebiggers@kernel.org> wrote:
>>> 
>>> As discussed previously, the proposed use of the so-called perlasm for
>>> the RISC-V crypto assembly files makes them difficult to read, and these
>>> files have some other issues such extensively duplicating source code
>>> for the different AES key lengths and for the unrolled hash functions.
>>> There is/was a desire to share code with OpenSSL, but many of the files
>>> have already diverged significantly; also, for most of the algorithms
>>> the source code can be quite short anyway, due to the native support for
>>> them in the RISC-V vector crypto extensions combined with the way the
>>> RISC-V vector extension naturally scales to arbitrary vector lengths.
>>> 
>>> Since we're still waiting for prerequisite patches to be merged anyway,
>>> we have a bit more time to get this cleaned up properly.  So I've had a
>>> go at cleaning up the patchset to use standard .S files, with the code
>>> duplication fixed.  I also made some tweaks to make the different
>>> algorithms consistent with each other and with what exists in the kernel

Do you mean the xts gluing part only? Do we have the different algorithms
for the actual implementation in .S? 

>>> already for other architectures, and tried to improve comments.

The improved comments are better. Thanks.

>>> The result is this series, which passes all tests and is about 2400
>>> lines shorter than the latest version with the perlasm
>>> (https://lore.kernel.org/linux-crypto/20231231152743.6304-1-jerry.shih@sifive.com/).

For the unrolled hash functions case(sha256/512), the .S implementation uses
macro instead. But I think the macro expanded code will be the same. Do we
care about the source code size instead of the final binary code size?

For the AES variants part, the .S uses branches inside the inner loop. Does the
branch inside the inner loop better than the bigger code size?

>>> All the same functionality and general optimizations are still included,
>>> except for some minor optimizations in XTS that I dropped since it's not
>>> clear they are worth the complexity.  (Note that almost all users of XTS
>>> in the kernel only use it with block-aligned messages, so it's not very
>>> important to optimize the ciphertext stealing case.)

The aesni/neon are SIMD, so I think the rvv version could have the different
design. And I think my implementation is very similar to x86-xts except the
tail block numbers for ciphertext stealing case.
The x86-xts-like implementation uses the fixed 2 block for the ciphertext
stealing case.

+		int xts_blocks = DIV_ROUND_UP(req->cryptlen,
+					      AES_BLOCK_SIZE) - 2;

>>> I'd appreciate people's thoughts on this series.  Jerry, I hope I'm not
>>> stepping on your toes too much here, but I think there are some big
>>> improvements here.
>>> 
>> 
>> As I have indicated before, I fully agree with Eric here that avoiding
>> perlasm is preferable: sharing code with OpenSSL is great if we can
>> simply adopt the exact same code (and track OpenSSL as its upstream)
>> but this never really worked that well for skciphers, due to API
>> differences. (The SHA transforms can be reused a bit more easily)

In my opinion, I would prefer the perlasm with the usage of asm mnemonics.
I could see the expanded asm source from perlsm. I don't know how to dump the
expanded asm source when we use asm `.macro` directives. I use objdump to
see the final asm.
And we could use function to modularize the asm implementations. The macro
might do the same things, but it's more clear for me for the argument passing
and more powerful string manipulation.
And I could have scope for the register name binding. It's more clear to me
comparing with a long list of `#define xxx`.

If the pure .S is still more preferable in kernel, let's do that.

-Jerry

>> I will also note that perlasm is not as useful for RISC-V as it is for
>> other architectures: in OpenSSL, perlasm is also used to abstract
>> differences in calling conventions between, e.g., x86_64 on Linux vs
>> Windows, or to support building with outdated [proprietary]
>> toolchains.
>> 
>> I do wonder if we could also use .req directives for register aliases
>> instead of CPP defines? It shouldn't matter for working code, but the
>> diagnostics tend to be a bit more useful if the aliases are visible to
>> the assembler.
> 
> .req unfortunately isn't an option since it is specific to AArch64 and ARM
> assembly.  So we have to use #defines like x86 does.  Ultimately, the effect is
> about the same.
> 
> - Eric


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
