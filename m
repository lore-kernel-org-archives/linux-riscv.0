Return-Path: <SRS0=VJSH=77=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB3BC433DF
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2020 21:43:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A24AA208C3
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2020 21:43:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O6Z+YBz5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="V8mp4jvy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A24AA208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=MCieKSv/d/exPmPAc7GwarGBCkAH7xKxzBmQYr15/Mk=; b=O6Z+YBz55/2Mxw
	G9hluNuSGBJgwc0yS8BoDw6Wwu8iyPoPzN09ddQtXdltpUAb/TLmxsQmCyiIPRZWwvX0xlwohyeik
	T5aNZyYu2wz4TEZwH4I2xBTGjvFR7OFHNpUZMiz8PFU1GeNWVu1GoMrklKBo/sGbGiJ5BfKfuaafu
	IKkEdG9RkLmksKm4dxYMo0lZNYG5eNnUjHHG94aZ15N476vJJbMQXQhG9mtXkPpIYPu8XG1uKPg9D
	ko4PDboSKnT4MD7UAsK0sspzlSeJARa1UopaUOOZbmci13Yck7K+20RWTUoOeI7nDDAjBcll/CY+Q
	KNFSX/CXwuHaElpksYCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jm2Ji-0002Kd-06; Thu, 18 Jun 2020 21:43:26 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jm2Je-0002KA-V7
 for linux-riscv@lists.infradead.org; Thu, 18 Jun 2020 21:43:25 +0000
Received: by mail-pf1-x441.google.com with SMTP id j1so3438141pfe.4
 for <linux-riscv@lists.infradead.org>; Thu, 18 Jun 2020 14:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=MCieKSv/d/exPmPAc7GwarGBCkAH7xKxzBmQYr15/Mk=;
 b=V8mp4jvyFG4zJvLAWNOdhumVntlmDxZZq/AwM7zrUUDHvFbBYuqdahXr5Xl5RsZWNP
 McQV2xYz0a9JAYqNmaocKtBwdWZkbyzhiJcDskBhX1oigc/Nhe124z2aEuZFPanpjJvo
 uN/PbKkX7EYUYrXf3KbIFgnd7EyavDQFCPgFNgavAaRi/qGhjqXqN7hJoWpGRlXqzyWe
 52Rrov6055Z9UJFAQ4uk9ABRJ3YtRHTx3rduIoJ13/F3hBTUWLrXQObKwlHcKW0yopVu
 lG2tCyXQxN6KrrnIfNPF/0HpuVO/XRBsRHl5G21GqkCraQ0fxibpGPWsR3P/0f4QNC21
 gY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=MCieKSv/d/exPmPAc7GwarGBCkAH7xKxzBmQYr15/Mk=;
 b=rIn2ZrEf+pjz3As2aMEIx9L6jZrwgbpL/rRlQIM3f7iB/QVQLokuR19850RGi73fMJ
 Yj0iEJDbIvZ4THh5X1L+PvwBdk5KLEjDjXk6tAO10smllsZiYiL2T9a05An1ToqB0Wfj
 eTnLCWiN46+ydVXWLDFw1mQSb+W5rXh8jzHnB7T9kmHE1GpLvVXxSrs8DwPoomToH9RR
 W4fRza+CkCme7fxNsaX98h8gpDBRiejp0fvxMFgtaI8jBIWhTckXnIgtZ06KvX5DW0CY
 1ubhBtU1X0XUaHWddgoKatGRCz83Ml+q0SK6y59vz3mW2BI4mp5bgBukMBrDACbNWMI+
 QbPw==
X-Gm-Message-State: AOAM530dxu7UXU07rmrDCUQgL+55z/ZdvocbIEFczM50dLfTMQ8LY/mC
 rZCj4VTf9Zq7IDm+kn1cQct3GezQueAwmA==
X-Google-Smtp-Source: ABdhPJwweIQW+LbWu+cyDIJEt3TduPx5LkFVOSuIXAzVaGFHv07HldXcFv0276BewwTjHxXw6vfmvw==
X-Received: by 2002:aa7:9abc:: with SMTP id x28mr5293452pfi.39.1592516601272; 
 Thu, 18 Jun 2020 14:43:21 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 130sm3695771pfw.176.2020.06.18.14.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 14:43:20 -0700 (PDT)
Date: Thu, 18 Jun 2020 14:43:20 -0700 (PDT)
X-Google-Original-Date: Thu, 18 Jun 2020 14:43:16 PDT (-0700)
Subject: Re: [PATCH] riscv/atomic: Fix sign extension for RV64I
In-Reply-To: <20200611183235.37508-1-nhuck@google.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: nhuck@google.com
Message-ID: <mhng-daf9e66b-0b4a-42ee-92ef-e2a08101a362@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_144323_026657_F53CE64E 
X-CRM114-Status: GOOD (  16.97  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, nhuck@google.com,
 clang-built-linux@googlegroups.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 11 Jun 2020 11:32:35 PDT (-0700), nhuck@google.com wrote:
> The argument passed to cmpxchg is not guaranteed to be sign
> extended, but lr.w sign extends on RV64I. This makes cmpxchg
> fail on clang built kernels when __old is negative.
>
> To fix this, we just cast __old to long which sign extends on
> RV64I. With this fix, clang built RISC-V kernels now boot.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/867
> Cc: clang-built-linux@googlegroups.com
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>
> ---
>  arch/riscv/include/asm/cmpxchg.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index d969bab4a26b..262e5bbb2776 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -179,7 +179,7 @@
>  			"	bnez %1, 0b\n"				\
>  			"1:\n"						\
>  			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
> -			: "rJ" (__old), "rJ" (__new)			\
> +			: "rJ" ((long)__old), "rJ" (__new)		\
>  			: "memory");					\
>  		break;							\
>  	case 8:								\
> @@ -224,7 +224,7 @@
>  			RISCV_ACQUIRE_BARRIER				\
>  			"1:\n"						\
>  			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
> -			: "rJ" (__old), "rJ" (__new)			\
> +			: "rJ" ((long)__old), "rJ" (__new)		\
>  			: "memory");					\
>  		break;							\
>  	case 8:								\
> @@ -270,7 +270,7 @@
>  			"	bnez %1, 0b\n"				\
>  			"1:\n"						\
>  			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
> -			: "rJ" (__old), "rJ" (__new)			\
> +			: "rJ" ((long)__old), "rJ" (__new)		\
>  			: "memory");					\
>  		break;							\
>  	case 8:								\
> @@ -316,7 +316,7 @@
>  			"	fence rw, rw\n"				\
>  			"1:\n"						\
>  			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
> -			: "rJ" (__old), "rJ" (__new)			\
> +			: "rJ" ((long)__old), "rJ" (__new)		\
>  			: "memory");					\
>  		break;							\
>  	case 8:								\

So we talked about this earlier, but just so everyone's one the same page: I
think this should be a compiler bug, but the spec doesn't define any of this
stuff well enough that it actually is.  I'm sort of inclined to make it a
compiler bug, but I'm not sure if that's still possible and it requires a lot
more work.  I'm writing up a bigger email, but it's been floating around for a
few days and I don't want to delay this on sorting out what our inline assembly
actually does.

I've put this on fixes.

Thanks!

