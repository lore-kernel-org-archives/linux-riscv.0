Return-Path: <SRS0=7m3b=GP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E27C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jan 2021 08:18:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A95C422D2C
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jan 2021 08:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A95C422D2C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HK0gW4ETyjo6gtsKku6wtr//e1DI5rsGVNauVbI55dk=; b=UD1J3kQ0oqFI28PDxspABKNqJ
	AXdEOIi5EPjq4JzT6wnv+ST6WBJdN4FCK1Z0vwBcwP9wR9A6qa+GqQi/M/QEnlX+Prlz1Wk7eESdD
	+ObZx+2uVpGF3udczUsft834MAfArGIT3Cm9c8INlsc18adzFqUyoYXYPLz15doJsCSnHkZD2Qxc7
	uCsC3Lm5ErJjfdm/PEO4qJrAf6Y7eGFji6ZA0t6LzkOKRSoaMjEckuUH3enrsXVddilQeXG75At56
	limdxD5QD9XNTD7yJRBPUL/MPLlWGBrQnr66QpupdYTj4aZoEkJFV6NLMCRt1/z7cOPPEaIcK7Ku5
	/LsIaYHVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzEsW-0000IU-VL; Tue, 12 Jan 2021 08:18:13 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzEsS-0000G0-7h
 for linux-riscv@lists.infradead.org; Tue, 12 Jan 2021 08:18:09 +0000
Received: by mail-io1-xd2b.google.com with SMTP id u17so2284362iow.1
 for <linux-riscv@lists.infradead.org>; Tue, 12 Jan 2021 00:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LbpidrRYCyxn/Boo+Mnw7fCYz2z4a2W9yfy+reOhTtI=;
 b=irh1MNudW5++QFQkK9wYg3b4JSFoPpJuSa96vD8+3KArO1qwg/nvqPAo3puDqLcnOL
 Qt8zQxyopi8QR49rCc10xPEiWWJW/qVkawMVrSc19dhjK6VIXFla/GRYfjBV+VLs3J/j
 PCEOkNx58uCzYZbphmnTSSzzUf18vyL0SIdkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LbpidrRYCyxn/Boo+Mnw7fCYz2z4a2W9yfy+reOhTtI=;
 b=SVz+ImnVQDcmEU4fB5l+G65iqjBFjpfrx3TxM82Mg0q0+n277fy8WZg1J4sD4mSUG1
 80mch2PKR7APNvRN8L8wV8GE8bP1QDc62Bcjg8wNHyLoTBg3ejLP0SpioWdhBymtdHfD
 6wR75DeVuYQl1skXEicBnI14Hi+BjXCMN34obugR5LJj/9V1MBk6OMrpHS/eNUbShOeQ
 0AB63idWznxwmkZMhge6MPJOSjfokFcIIVKspqCtOW8fsIkDm0gQ+IgOgOolv+g9zKqB
 gXKTGFJLrU0nOix4dAtcDH75D0zUnQ4Rulp4s1yhFLZ29I0R4gzDvWM/DfYqeHZPO7mX
 DELA==
X-Gm-Message-State: AOAM533Vk224KFbVtbKILyMhXTQNhzLt2R93L0lfxvG6YRyULRFA7Swh
 jhfzSNsb+NDPpl97M8mwoQJX4vUCuClaIpzPthaT
X-Google-Smtp-Source: ABdhPJyTfOUQm2SQX5x8heSHTT4WGxDATytLmMi3Xt03IMwgr+v5SF1qMvKgbhiOoDcK8/6NoVk7SGsiFEW/I8iQlgc=
X-Received: by 2002:a6b:b74e:: with SMTP id h75mr2453290iof.0.1610439486459;
 Tue, 12 Jan 2021 00:18:06 -0800 (PST)
MIME-Version: 1.0
References: <20210112023534.117354-1-guoren@kernel.org>
In-Reply-To: <20210112023534.117354-1-guoren@kernel.org>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 12 Jan 2021 00:17:55 -0800
Message-ID: <CAOnJCUK89rwjfnpMtavbaf-pwBndnS-=kVwsdP2yJnJAwJi-kg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Remove duplicate definition in pagtable.h
To: Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_031808_340887_6FE3E877 
X-CRM114-Status: GOOD (  14.98  )
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
Cc: Guo Ren <guoren@linux.alibaba.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Pekka Enberg <penberg@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 11, 2021 at 6:38 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> PAGE_KERNEL_EXEC has been defined above.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Pekka Enberg <penberg@kernel.org>
> ---
>  arch/riscv/include/asm/pgtable.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 41a72861987c..dff51a84e52e 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -101,7 +101,6 @@
>  #define PAGE_KERNEL            __pgprot(_PAGE_KERNEL)
>  #define PAGE_KERNEL_EXEC       __pgprot(_PAGE_KERNEL | _PAGE_EXEC)
>  #define PAGE_KERNEL_READ       __pgprot(_PAGE_KERNEL & ~_PAGE_WRITE)
> -#define PAGE_KERNEL_EXEC       __pgprot(_PAGE_KERNEL | _PAGE_EXEC)
>  #define PAGE_KERNEL_READ_EXEC  __pgprot((_PAGE_KERNEL & ~_PAGE_WRITE) \
>                                          | _PAGE_EXEC)
>
> --
> 2.17.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

It's already on the fixes.

http://lists.infradead.org/pipermail/linux-riscv/2021-January/004134.html


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
