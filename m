Return-Path: <SRS0=LlRU=HV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9547DC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Feb 2021 07:15:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 298F364E90
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Feb 2021 07:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 298F364E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=iPssFqqklZFfKnDmNytHlH+TZz5nk3DK6Tp1kGoudlQ=; b=X+2sXNYPGGi1J83XT0e8MK8Ge
	zSO261CQfbOjY1fF7+t0EsNXHfcC3x7ZI+0r0eavccqcBl5qmhvBFpAwhrFIpceNjahjIYdrTZGwg
	XmopX/pdorhb2RcxoCM1YrH3PhCE4RTp8/FBLjRUY7HuxeOUgY5DKVG76LgM6QgP5IxT0KNKHwIQc
	gziU8+CA31w87hyaSdqXUjho5ZEgLcaZHG9peoqqqFoLA7qWqW5NECGxGXtjw7SJtfze+dP78oGQT
	NW4hQVnZqDP8v8SLzcjybsmnJ476bhXi/pMC5PfpjECt44PT43Dmex65x7uCGRQ9Zv9ZQnxG7enA1
	Hz8pKhVSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lD00p-00038A-LB; Fri, 19 Feb 2021 07:15:39 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lD00m-000371-N2
 for linux-riscv@lists.infradead.org; Fri, 19 Feb 2021 07:15:37 +0000
Received: by mail-pl1-x630.google.com with SMTP id e9so2874912plh.3
 for <linux-riscv@lists.infradead.org>; Thu, 18 Feb 2021 23:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=tTKkGL21rRe44hLE0DkyxGWrg7hSYwrtqpixgQsrYgk=;
 b=HOwmB2h5caYpAqlrW7jJPeXsa6mGCjFkD/DXy+oRj9E8TtOfAmNNt3SKah5H3se+ri
 aXFEzvOP8sDqvd7LuoexLsrY5ILXgkgftkYtLJU5JLGGCg8sB5CkMHmeOPUsttBhNRIx
 74jOsKGEw3CJBfwN3xL03CI063kajpx3C7rcp8Rpr4/ZZb9c1A1+r1wzmbSSF/TBwRau
 gBio78pXjOF0rIopZjdI/NGrbzsU6XTPEtiPdEB3JYZmFVtQ4JPkdH5iMMaMhDb3cVB+
 N3SqvkXIqmF89KFIVz31h3biYjKZvEFy7oVOHendWiZK2eAq1WO30zvvI/zAZA9HJGWp
 XcHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=tTKkGL21rRe44hLE0DkyxGWrg7hSYwrtqpixgQsrYgk=;
 b=Acnu3h9U+TC6s8gUkZnLU2fxNr+6G06zVrRJnbkTlhLS1Kb6mRtDgHW8QJhF66Uh9c
 XDnZ4yZz1rpcmY0XzoSigt5XA7Q/FP+fsZ2KMHoKGL9jKyzo+cJGB2+twcYI8unT02P7
 BkDw2yKiSL0y1ed7qbTIxkPfFXRio2YOcWJ0ozCRz960jSLFBuY/lm6LvJhgCcDwThjh
 deJivTLQbm5Nkxk+DSQXJs4VBtKM3DnWBm/GWHWzwzCdGjHCrL3Y093UGBZnZg8b/Sr+
 tTbZkrDOdtP6D9JbOtluR2fiCBqPA3On0kjLN2x5HEtS3GXZvTLIaVOtuybljJZ+FzxR
 9Gbw==
X-Gm-Message-State: AOAM532e5+ZYPFU2BZAAu7/Wx09x1/0QUjXqY+GRUzk2FYf4PGJKbymn
 cboAyCVeB+Z0bZmpR2k8udCMww==
X-Google-Smtp-Source: ABdhPJw1vJpM+aPCSyXWixk60i/NSt4WYsXaOrX7B3W7yINdHBKMPmf6RPXsd/1KgGiVxP/2783QNQ==
X-Received: by 2002:a17:90a:6844:: with SMTP id e4mr7807103pjm.9.1613718934817; 
 Thu, 18 Feb 2021 23:15:34 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id e21sm7558624pgv.74.2021.02.18.23.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 23:15:34 -0800 (PST)
Date: Thu, 18 Feb 2021 23:15:34 -0800 (PST)
X-Google-Original-Date: Thu, 18 Feb 2021 23:10:12 PST (-0800)
Subject: Re: [PATCH] riscv: Disable KSAN_SANITIZE for vDSO
In-Reply-To: <20210216173305.2500-1-tklauser@distanz.ch>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tklauser@distanz.ch
Message-ID: <mhng-f4076110-eb87-47b6-92fb-9170bbf39b7d@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210219_021536_823798_F2EC554F 
X-CRM114-Status: GOOD (  22.34  )
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
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu, dvyukov@google.com,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 16 Feb 2021 09:33:05 PST (-0800), tklauser@distanz.ch wrote:
> Dmitry Vyukov reports:
>> I've localized one issue with riscv/KASAN:
>> KASAN breaks VDSO and that's I think the root cause of weird faults I
>> saw earlier. The following patch fixes it.
>> Could somebody please upstream this fix? I don't know how to add/run
>> tests for this.
>
> Verified the fix on a kernel with KASAN enabled using vDSO selftests.
>
> Link: https://lore.kernel.org/lkml/CACT4Y+ZNJBnkKHXUf=tm_yuowvZvHwN=0rmJ=7J+xFd+9r_6pQ@mail.gmail.com/
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Tested-by: Tobias Klauser <tklauser@distanz.ch>
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> ---
>  arch/riscv/kernel/vdso/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index 0cfd6da784f8..71a315e73cbe 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -32,9 +32,10 @@ CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
>  # Disable -pg to prevent insert call site
>  CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os
>
> -# Disable gcov profiling for VDSO code
> +# Disable profiling and instrumentation for VDSO code
>  GCOV_PROFILE := n
>  KCOV_INSTRUMENT := n
> +KASAN_SANITIZE := n
>
>  # Force dependency
>  $(obj)/vdso.o: $(obj)/vdso.so

This seems reasonable.  Building the VDSO with asan results in a bunch of PLT
entries for the VDSO stubs.  I don't see a sane way to resolve those, and it
looks like this is what everyone else is doing.

That said, the commit text is a bit funny so I've written one of my own.  This
is on for-next, as it's still the merge window.  Let me know if the text
doesn't make sense.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
