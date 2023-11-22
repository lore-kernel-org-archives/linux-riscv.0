Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B63C61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 19:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yCQ9jn/FfoSvUm0naN02FuwuWyTEeHUhdOQiI7lVW0Q=; b=bPDtwY3tkUmdCx
	LIK8lP6pUEUUILjtWTuGi2PIeMQWn+Gdutu1rr1JH63fbhBY2bsw8Bjnvjwyjbxft5uWjsLINqMDt
	b1YfscW6kCr4m+1MExipUjkTl4Sqicbm2slNXECW4NXQhQYzdQPHVCyzH51KKJZCei5kL+/oEWaQ2
	6WNMR8x8Ibc9F6thCBhOC0oMKd5n1kJR95WY0lEj7nfaP8uVLw5WwsV1fLD4zahQeSD9Qsmk5EAQJ
	dj/UCoRrYymRHZxMjXH8LFLzsy/5p9x0uw3tUwFDkmowa/d5VAtLTiGk8MnYMx3Ljw+K6YjGKMWoJ
	Qpf7CZuhddp0rQ01YntQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5sXG-002tcd-2l;
	Wed, 22 Nov 2023 19:05:18 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5sXE-002tbl-0R
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 19:05:17 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3b83fc26e4cso95939b6e.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 11:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700679914; x=1701284714; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MuJGRVvO4OS7CQfe7JcJEn858y+yVTsL6CvDtncuukM=;
        b=DB7AhwAfqSz+ErBymgC9OFTG59Pxc5l8sAtrBRcs6hLewzZ2pFG8gyQJI9npO1DtfW
         41M1BHJ8xPCG67fK69Lwwy67HPHhBSzNXEGOGVcnOS+AO2IkjEC2InLL9WVegZEfn0Vk
         Etx9pQkYJNwgsSSPW+mvxb2VEjtglyoy72edT+u7UGU/wdP/aJkDIoccPyURo6qD2CcG
         XsaGhA2dCUCPDaSun1jNlNAvxm2vnR02ku40S5i57/DxgWon0BIuBrz6yo7QneNHktvZ
         T7p/dCAfpLNLGxj84C0fsiJGmJudUhTUCMdYcs2jph02sOPfWZyfA/01tRaF+1DHAFfd
         uNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700679914; x=1701284714;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MuJGRVvO4OS7CQfe7JcJEn858y+yVTsL6CvDtncuukM=;
        b=sLRlNcYlyN14JkenaoxhMw8tPYniEXcNhhy+d3TZVeaLngo+bFoT3vsgkrKiPEoIYW
         6I6h3QBlyOl7KYXbwBRnawFX85cT1dfWwV/E+o1dvG8WGxo9vfdFbK13Dg00o5TjhtG6
         U0ppWM1VSugiBCzJlNocMZ2R7sCaBvaEV0fwGlMeT0rXrwlLBVhCKnloYyiZ2KGQEGGM
         WCuOTx/D+BRMQIchlX9Hj5EfhnlJ9vswzI6NYl1hSwXc6md2e6E3K5FYCqWm7JWKw3rt
         pyTqKEY4LvRvI+4rTA2fcNVu28jJqGzOgNVjo7PL2eHqTtXXFoU28VtjTPMb3eIxpUot
         uZLQ==
X-Gm-Message-State: AOJu0YwqJoXeFclm/x4yAZGS2c+CIgOFhT1ka8PvkULAOjS56vx1C3nt
	VeJE8ccjl6nAN8iYT+TJ2gejlw==
X-Google-Smtp-Source: AGHT+IGruwK2GNXmEbQcHsSkn1Aod/UdP0wMp9Y99w3YdMkYQYsKJLfOyZllXsUogOKE0nzb8+4/vg==
X-Received: by 2002:a05:6808:10c6:b0:3a9:bb4f:9efd with SMTP id s6-20020a05680810c600b003a9bb4f9efdmr4439068ois.29.1700679914013;
        Wed, 22 Nov 2023 11:05:14 -0800 (PST)
Received: from ?IPv6:2402:7500:4ce:5a5b:a845:b3e1:8307:922c? ([2402:7500:4ce:5a5b:a845:b3e1:8307:922c])
        by smtp.gmail.com with ESMTPSA id b20-20020a63d314000000b005c215baacc1sm28175pgg.70.2023.11.22.11.05.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Nov 2023 11:05:13 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH 12/12] RISC-V: crypto: add Zvkb accelerated ChaCha20
 implementation
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231122-bulldog-deceased-7e3dadf3a833@spud>
Date: Thu, 23 Nov 2023 03:05:08 +0800
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Eric Biggers <ebiggers@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 palmer@dabbelt.com,
 Albert Ou <aou@eecs.berkeley.edu>,
 herbert@gondor.apana.org.au,
 davem@davemloft.net,
 andy.chiu@sifive.com,
 greentime.hu@sifive.com,
 guoren@kernel.org,
 bjorn@rivosinc.com,
 heiko@sntech.de,
 ardb@kernel.org,
 phoebe.chen@sifive.com,
 hongrong.hsu@sifive.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Message-Id: <EBBC558E-C9FE-4912-BB68-E94624AFD006@sifive.com>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
 <20231025183644.8735-13-jerry.shih@sifive.com>
 <20231102054327.GH1498@sol.localdomain>
 <90E2B1B4-ACC1-4316-81CD-E919D3BD03BA@sifive.com>
 <20231120191856.GA964@sol.localdomain>
 <9724E3A5-F43C-4239-9031-2B33B72C4EF4@sifive.com>
 <20231121-knelt-resource-5d71c9246015@wendy>
 <3BDE7B86-0078-4C77-A383-1C83C88E44DA@sifive.com>
 <20231122-bulldog-deceased-7e3dadf3a833@spud>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_110516_217710_CAFC925F 
X-CRM114-Status: GOOD (  24.85  )
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

On Nov 23, 2023, at 02:20, Conor Dooley <conor@kernel.org> wrote:
> On Thu, Nov 23, 2023 at 01:37:33AM +0800, Jerry Shih wrote:
>> On Nov 21, 2023, at 21:14, Conor Dooley <conor.dooley@microchip.com> wrote:
>>> On Tue, Nov 21, 2023 at 06:55:07PM +0800, Jerry Shih wrote:
>>>> Sorry, I just use my `internal` qemu with vector-crypto and rva22 patches.
>>>> 
>>>> The public qemu haven't supported rva22 profiles. Here is the qemu patch[1] for
>>>> that. But here is the discussion why the qemu doesn't export these
>>>> `named extensions`(e.g. Zicclsm).
>>>> I try to add Zicclsm in DT in the v2 patch set. Maybe we will have more discussion
>>>> about the rva22 profiles in kernel DT.
>>> 
>>> Please do, that'll be fun! Please take some time to read what the
>>> profiles spec actually defines Zicclsm fore before you send those patches
>>> though. I think you might come to find you have misunderstood what it
>>> means - certainly I did the first time I saw it!
>> 
>> From the rva22 profile:
> 
> "rva22" is not a profile. As I pointed out to Eric, this is defined in
> the RVA22U64 profile (and the RVA20U64 one, but that is effectively a
> moot point). The profile descriptions for these only specify "the ISA
> features available to user-mode execution environments", so it is not
> suitable for use in any other context.

I missed that important part: it's for user space.
Thx.

>>  This requires misaligned support for all regular load and store instructions (including
>>  scalar and ``vector``)
>> 
>> The spec includes the explicit `vector` keyword.
>> So, I still think we could use Zicclsm checking for these vector-crypto implementations.
> 
> In userspace, if Zicclsm was exported somewhere, that would be a valid
> argument. Even for userspace, the hwprobe flags probably provide more
> information though, since the firmware emulation is insanely slow.

I agree. It will be more useful to have the flag like `VECTOR_MISALIGNED_FAST`
instead.

>> My proposed patch is just a simple patch which only update the DT document and
>> update the isa string parser for Zicclsm.
> 
> Zicclsm has no meaning outside of user mode, so it's not suitable for
> use in that context. Other "features" defined in the profiles spec might
> be suitable for inclusion, but it'll be a case-by-case basis.

I will skip the Zicclsm part in my v2 patch.

>> If it's still not recommend to use Zicclsm
>> checking, I will turn to use `RISCV_HWPROBE_MISALIGNED_*` instead.
> 
> Palmer has commented on the rest, so no need for me :)

All crypto algorithms will assume that the vector supports misaligned access in next
v2 patch.
And the algorithms will also not check for `RISCV_HWPROBE_MISALIGNED_*` since
it's related to scalar accesses.
Once we have the vector performance related flag, we could go back here to use it.

-Jerry


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
