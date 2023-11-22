Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B4FC61D92
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 07:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eyu/RA9qsF+RrvRbqrHhjDdrjjOXbkMeoc1ObL+1ANM=; b=QC+HXP+oYK2EMl
	XBGFoMhkKvwQpEhsgSbXyNEdxSdbdtawbmjUoSwTOIo7pCxBnclGPY38cxdbIXdCPmLZXHQmTyUDC
	dhHTTriaKUNdrvsngAaFMvMFKjj9mWWb5HS4C+MX1zmppVog7fByI+wlJHMQQnVVsn8SsF4H4a9JQ
	sLop47qJw/Y4CTwGV3xkuur+WJtGNksrCUZjCoRlRlK30Dv0whQjXfZyFHjKgYGKn96mLe2+gVaPH
	G5gPg7nekFWUSCyUi0C3+wVT1hWspbkVDq2Ua3YvvWBJknmk47QVS5G18DBfaJcotu/rgQvMmp2lP
	HnKz/8nomeME7R+GaZkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5i82-000yr0-2A;
	Wed, 22 Nov 2023 07:58:34 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5i7z-000yoL-2w
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 07:58:33 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6b20a48522fso5241575b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 23:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700639904; x=1701244704; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U68ghU0ezOrA/i0cZQ+g/GiyVqNUk3N4qLW4eoZrPv0=;
        b=aBChXOaq4q7r99P9/o0+YtMgC8DynrJ7tlMNANrtP6UFOxx11X0sLoJ7H6Wsw1QGrZ
         fjxG/FB1JAHTEmfW+rr3vbv1CC6UWhyGaUc9Or/3dYdPv9LkV2ZJDrIzDCC/bV++ZYa+
         g2pJ3ajEd9VXLTQ1b7xrJym0hUe5R4DgMtzExyWCeHDH+xB1Iqj/vEaNrXXeM4OnVZ16
         +ADNML5wSKRn1dNrSdwwux1D19IGf2hSMK9I3CPrslBVkc2cnP/S6K6Ga0vUdnDQubVc
         EqKA0pulH+VV4P6FyW4mlvJILPAR2iPpQbu/LpTpenKlycxSVFOaQ8yj04ENI0y4wSDy
         qd1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700639904; x=1701244704;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U68ghU0ezOrA/i0cZQ+g/GiyVqNUk3N4qLW4eoZrPv0=;
        b=nglHcEkdRpHQFpz3VH43sKemD9fgmahceYGQXyHl3gZ26C511ix9JwXW+2SvO2gJPF
         xky/D+fhWd0Mwm8fPzwwQGaCAFennI8g1z1D+RORH9sCIM+lUBl1QP5lQIyMh3yrukZp
         UVqeoFACcme+JogeyfAnkGPw09XmZHI0jtDdoxp3g0dzdwJaRx/435rFVjdy4aG5Fn6G
         w2cz8q20plUGpKaZ4AwGhV9tQdCgu+TAiR2P8+ixn58rOhpvN4aNPidBTIfj5wyUVQOH
         B5rQenpoYNogZ4jGLjFN+Vo4F5ycQPfiZVYzPxenwhcuQbtfzmPUKJFOIbfGXRj9qTN4
         8xvA==
X-Gm-Message-State: AOJu0YypZ+oNCdB4+nPQI3sPoyT4OjFgIOZ5pXsHMXyzzHpOfeYsVdGn
	10Xr4k8mqmCKS49+wlPnid9lsA==
X-Google-Smtp-Source: AGHT+IGzjpQdS7ieWXTU6K6f7J3jrGKOKi3ukJepvggI5WBLYH9xyJcPuMjf8QAA0/FAbbQn/nbkVw==
X-Received: by 2002:a05:6a21:6d8f:b0:186:1fa0:47b1 with SMTP id wl15-20020a056a216d8f00b001861fa047b1mr1663715pzb.36.1700639903824;
        Tue, 21 Nov 2023 23:58:23 -0800 (PST)
Received: from ?IPv6:2402:7500:4ce:5a5b:f475:8bd5:cf8d:cf6a? ([2402:7500:4ce:5a5b:f475:8bd5:cf8d:cf6a])
        by smtp.gmail.com with ESMTPSA id f8-20020a17090ace0800b002802d9d4e96sm756441pju.54.2023.11.21.23.58.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Nov 2023 23:58:23 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH v4 00/12] RISC-V: support some cryptography accelerations
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231121235109.GE2172@sol.localdomain>
Date: Wed, 22 Nov 2023 15:58:17 +0800
Cc: Charlie Jenkins <charlie@rivosinc.com>,
 Heiko Stuebner <heiko@sntech.de>,
 palmer@dabbelt.com,
 paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu,
 herbert@gondor.apana.org.au,
 davem@davemloft.net,
 conor.dooley@microchip.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org,
 christoph.muellner@vrull.eu,
 Heiko Stuebner <heiko.stuebner@vrull.eu>
Message-Id: <3416A95B-8687-44F6-9F77-D30AD6516094@sifive.com>
References: <20230711153743.1970625-1-heiko@sntech.de>
 <20230914001144.GA924@sol.localdomain> <ZQJdnCwf99Glggin@ghost>
 <3A0F6A71-C521-44A5-A56C-076AF3E13897@gmail.com>
 <DD3113B1-AB9F-4D6D-BD6E-8F75A83DA45D@sifive.com>
 <20231006194741.GA68531@google.com>
 <AB98E114-A8DE-492E-B078-7394EE4FA83E@sifive.com>
 <20231102040333.GC1498@sol.localdomain>
 <20231121235109.GE2172@sol.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_235831_949536_9C19ECFF 
X-CRM114-Status: GOOD (  22.08  )
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

On Nov 22, 2023, at 07:51, Eric Biggers <ebiggers@kernel.org> wrote:
> On Wed, Nov 01, 2023 at 09:03:33PM -0700, Eric Biggers wrote:
>> 
>> It would be nice to use a real assembler, so that people won't have to worry
>> about potential mistakes or inconsistencies in the perl-based "assembler".  Also
>> keep in mind that if we allow people to compile this code without the real
>> assembler support from the beginning, it might end up staying that way for quite
>> a while in order to avoid breaking the build for people.
>> 
>> Ultimately it's up to you though; I think that you and others who have been
>> working on RISC-V crypto can make the best decision about what to do here.  I
>> also don't want this patchset to be delayed waiting for other projects, so maybe
>> that indeed means the perl-based "assembler" needs to be used for now.
> 
> Just wanted to bump up this discussion again.  In binutils, the vector crypto
> v1.0.0 support was released 4 months ago in 2.41.  See the NEWS file at
> https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob_plain;f=binutils/NEWS;hb=refs/heads/binutils-2_41-branch
> 
>    * The RISC-V port now supports the following new standard extensions:
>      - Zicond (conditional zero instructions)
>      - Zfa (additional floating-point instructions)
>      - Zvbb, Zvbc, Zvkg, Zvkned, Zvknh[ab], Zvksed, Zvksh, Zvkn, Zvknc, Zvkng,
>        Zvks, Zvksc, Zvkg, Zvkt (vector crypto instructions)
> 
> That's every extension listed in the vector crypto v1.0.0 specification
> (https://github.com/riscv/riscv-crypto/releases/download/v1.0.0/riscv-crypto-spec-vector.pdf).

It doesn't fit all v1.0 spec.
The `Zvkb` is missed in binutils. It's the subset of `Zvbb`. We needs some extra
works if user just try to use `Zvkb`.
https://github.com/riscv/riscv-crypto/blob/main/doc/vector/riscv-crypto-vector-zvkb.adoc
Some crypto algorithms are already checking for `Zvkb` instead of `Zvbb`.

> LLVM still has the vector crypto extensions marked as "experimental" extensions.
> However, there is an open pull request to mark them non-experimental:
> https://github.com/llvm/llvm-project/pull/69000
> 
> Could we just go ahead and remove riscv.pm, develop with binutils for now, and
> prioritize getting the LLVM support finished?

Yes, we could.
But we need to handle the extensions checking for toolchains like:
https://github.com/torvalds/linux/commit/b6fcdb191e36f82336f9b5e126d51c02e7323480
I could do that, but I think I need some times to test the builds. And it will introduce
more dependency patch which is not related to actual crypto algorithms and the
gluing code in kernel. I will send another patch for toolchain part after the v2 patch.
And I am working for v2 patch with your new review comments. The v2 will still
use `perlasm`.
And we could move this discussion to this thread.
https://lore.kernel.org/all/20231025183644.8735-1-jerry.shih@sifive.com/

-Jerry
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
