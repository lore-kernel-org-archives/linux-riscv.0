Return-Path: <SRS0=YX5X=SH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B72AC4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2019 04:14:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C91621850
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2019 04:14:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k9oVEzsm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="Tx+GE/ky"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C91621850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NeHIFLSpCaz/r4jMBchravK3ca08M06fY9lpPBRfS+4=; b=k9oVEzsmsmjQlP
	0a+GxAXlIxDZs0gsYBnpxi84M9ayV1wUdxuvEk5idkxe9FqJ/baJbN0apxfY8WFZV97fYCXV3AiPT
	IA6xncWIXA59tXv/GLfo96hlHPqPTlulqWcuxLl1Iej5xsADUTk/B6WAQZ7Ky0FQEQU0tVNQ+anDX
	iGiOlqxA+pzRxhsAGwQHI3YxXQIf8t0DfETRmrhfMo6b2qHs11eknS6AeFCKAbqGa1uYWfaKBVjny
	yavKxaP5nSeH6IOrLCHF2Ame2Ka+ut+CQ5yMhPFTCrlDBhe0Br1uNp25PZa0X9oMWIE3TPv9H/jEI
	7CR08hn2ZIPGZ6ADIKGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCGF9-0004hw-PK; Fri, 05 Apr 2019 04:14:19 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCGF6-0004hF-73
 for linux-riscv@lists.infradead.org; Fri, 05 Apr 2019 04:14:17 +0000
Received: by mail-wm1-x343.google.com with SMTP id w15so5636559wmc.3
 for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2019 21:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mBHVrWRKGZevbfTKeXKRxI9gf6sJ5d1z7tzrVixC8Jk=;
 b=Tx+GE/kyMVuyulYFD856bWPolojQWzZWKuGBYAyKjK0wSk4YRKTXZo6o4ZTOpJgsos
 XQLvCcklGLmb66PPfiTWzUIWKIvNAVr6bC4EK1694Bit61uQlb1nNs67L+xwuxdl+PdX
 h4ivnwEstWB2XAVo/kCN4+ygPl9oCOa/pI2nucctjYQjixoE9p2B2NieLcCvq/smEOzv
 TWdJ2OrpLVzl1UGmcl93EOStMTOnOap/+WLoODhnByD6uG4l10NgxaH2EN6fKYZwp6i0
 DCLg5XXKc7J3QjtjAUdqw6/870X0w+b8BWvDHsIQYMwDs6d1as/suV81ZZ8FMq7MVqoA
 PVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mBHVrWRKGZevbfTKeXKRxI9gf6sJ5d1z7tzrVixC8Jk=;
 b=VyLNT2+v/KNux+9MhiTUYxOMc/5LtpYSn5kmWiMq7zWohe7q51KrYEuSJKsglW+ccT
 D6QCjIDEKwAWsUWmRrWxHPbRAiRolbdtl8afTHZZDLcs4/0ZXh1Qb5mNBhv9ifjDuDj2
 QqjwVp1NExUGuO8MbcJ1oTNPhCtab+JzLqo9oUOtrLb+f0g7aGe53TemAwMtogJ0OYIw
 0ctaLbISk6rf7bgv/jkMasXKe7QTgs0TsvGVSbjlup8REgqxCoCJw2jN6yEES1LSpv8S
 fFzvH9wUQ8nWdKP16dhCCYvnt37gWIUO72qr/Q68fYRG0l1stKR/bRKhrLKOJcsWi+3S
 kyRg==
X-Gm-Message-State: APjAAAV+Ylj6xtaQoVN2VeFZqwhHzG/bbxfMatM5rt7Wq1P6QfKq4CTJ
 V8gIyGxURDxhIhtFn4hIGXNlQzwPPqI4fhXAGsiyPg==
X-Google-Smtp-Source: APXvYqwPwBhxwnnbbp3Ou8kLLLXWzsVJNsanwq1En96de4XmSJmraw5HwQdVPcemwbBdE1cB9aXLGHM13X9Zf6iRDW8=
X-Received: by 2002:a1c:1f08:: with SMTP id f8mr5700645wmf.97.1554437653482;
 Thu, 04 Apr 2019 21:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190403141627.11664-1-steven.price@arm.com>
 <20190403141627.11664-7-steven.price@arm.com>
In-Reply-To: <20190403141627.11664-7-steven.price@arm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Apr 2019 09:44:02 +0530
Message-ID: <CAAhSdy0Hz25LYwA6U0byRfbbmgorjiTUhyHs8sQ81=qvhPANrw@mail.gmail.com>
Subject: Re: [PATCH v8 06/20] riscv: mm: Add p?d_large() definitions
To: Steven Price <steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_211416_401470_331305D4 
X-CRM114-Status: GOOD (  15.73  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <Mark.Rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will.deacon@arm.com>,
 linux-mm@kvack.org, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, "Liang, Kan" <kan.liang@linux.intel.com>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 3, 2019 at 7:47 PM Steven Price <steven.price@arm.com> wrote:
>
> walk_page_range() is going to be allowed to walk page tables other than
> those of user space. For this it needs to know when it has reached a
> 'leaf' entry in the page tables. This information is provided by the
> p?d_large() functions/macros.
>
> For riscv a page is large when it has a read, write or execute bit
> set on it.
>
> CC: Palmer Dabbelt <palmer@sifive.com>
> CC: Albert Ou <aou@eecs.berkeley.edu>
> CC: linux-riscv@lists.infradead.org
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>  arch/riscv/include/asm/pgtable-64.h | 7 +++++++
>  arch/riscv/include/asm/pgtable.h    | 7 +++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> index 7aa0ea9bd8bb..73747d9d7c66 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -51,6 +51,13 @@ static inline int pud_bad(pud_t pud)
>         return !pud_present(pud);
>  }
>
> +#define pud_large      pud_large
> +static inline int pud_large(pud_t pud)
> +{
> +       return pud_present(pud)
> +               && (pud_val(pud) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC));
> +}
> +
>  static inline void set_pud(pud_t *pudp, pud_t pud)
>  {
>         *pudp = pud;
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 1141364d990e..9570883c79e7 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -111,6 +111,13 @@ static inline int pmd_bad(pmd_t pmd)
>         return !pmd_present(pmd);
>  }
>
> +#define pmd_large      pmd_large
> +static inline int pmd_large(pmd_t pmd)
> +{
> +       return pmd_present(pmd)
> +               && (pmd_val(pmd) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC));
> +}
> +
>  static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
>  {
>         *pmdp = pmd;
> --
> 2.20.1
>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
