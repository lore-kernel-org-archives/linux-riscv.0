Return-Path: <SRS0=YNzb=3U=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C7DFC33CB7
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 31 Jan 2020 13:32:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5247E20707
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 31 Jan 2020 13:32:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F+SWvkyN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2UhCrDz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5247E20707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n4gKppYrW/TIGuqoqZvZOvX8zw/sgdgBBIsUcFpXry8=; b=F+SWvkyN7Lv8PpOmmTuq2dxCM
	SryySjjMBqXky0uIfZ2C2bwbCfmqu0OVoS8JE0Y665bK9qBdtiyFgQdLUqe6Yg4dMueX6AAFHKFRf
	dM/L5/6RdcVJ27MdkTqUkeieI504dMQUW95h5JVDQDzCmyiI99WqIQD6jE9Cssw2evnojaTF96iNT
	ZDKpjm8p5w68A+0ZqFqTMw/6uzEN52SRLPHun+PIaKcAVMkgGa/YwFUlIJp2LNmpe6QScOplIuYgq
	YnSdZ7U+ZrfqyWugF+c+YlI+jOL26XODUYo/S1kTZv2juNV8TffGuuY1UDUeza1cw2O9hortSwJ+t
	9NZ2ch9bA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixWPf-0006HS-Ay; Fri, 31 Jan 2020 13:32:47 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixWPc-0006Gk-6m
 for linux-riscv@lists.infradead.org; Fri, 31 Jan 2020 13:32:45 +0000
Received: by mail-wr1-x441.google.com with SMTP id w15so8639246wru.4
 for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2020 05:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n4gKppYrW/TIGuqoqZvZOvX8zw/sgdgBBIsUcFpXry8=;
 b=J2UhCrDzDanfHQ8EWNU/Y1aXGY/YiH3yBfUuIxKtKk1t5jo9aduCu0bgNkMBhG1a6K
 aGRXX9K9Lc+aInLpaJdQGkl9pMgYsNflAOLFKJDNU2pyRaDnYc5SdUtEl6Pl4h3XUDuT
 86ao8VLJl+9IHk8HUbkbOyxkecHAJf0kbE8GndDOCmXUzEwEZ6JdQpqGgQQcAXXtdmUl
 9x44LUM1/3JY4ckyeEzi8yQ6OZoEUnNmyjrgpePbq9XMwGpvi+ZVLD5IJ2zvNcYxICZB
 zSR/qRys1ZmynU9oZysKyey126KcIubMAJzFAoxb8pY+eYI9Bw0OSceTAjXu+hV96PvD
 xV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n4gKppYrW/TIGuqoqZvZOvX8zw/sgdgBBIsUcFpXry8=;
 b=rCvq8P80NmVngJWD97GxU74CH7khhRD2rfXR4l9/sFMHc/qnhRVvujYUx9RWqg8rdm
 jbvwjzVxmRopDBD8xpUAHudI4x4zCC9UIDEwbRMKWh4fCNGfFDtZp2uToZR/1QihL5K3
 K/ZcsKKnDIqMvEZe+j+H8Mus2O23043Jj0KMrqmmxHLUR+TIkMOP8FZQObZe19XOJu6V
 7iqmcJYWwnEU9JUInB0qwmiW5m23x0Fp7ZBfr8CZhzUSu8Juot/2z6MtAzG//shCsH3+
 l0k4QpKkhAogJBM8bwSJ/exGcZ0Gvy7ZX+OzXA5kWVAcvUYHPJ7ZoJE0NSujoAR8HS2p
 NwJg==
X-Gm-Message-State: APjAAAUCkalZ73W637Ltgr4TAacIogXtl76rcqtC1nsQCSE6z5YYy9eV
 LblYWNIjeXFf52mvX77cPgqRN1/QQjRcGOotifjKDwAs0cg=
X-Google-Smtp-Source: APXvYqztc1Tg2sR7Jh0uUsu9OHBXxYfCrDkImvK/mbBJfAMjuGJsX0oDWW/bDanZIjHTboqMOsrIXa3IO9WAAtaOTJk=
X-Received: by 2002:a5d:6a0f:: with SMTP id m15mr12818873wru.40.1580477562311; 
 Fri, 31 Jan 2020 05:32:42 -0800 (PST)
MIME-Version: 1.0
References: <CADnnUqfDnkvCJVqBkDw+gV7_zs5Q_Mb3anQTu+UujjJ8bBk+ng@mail.gmail.com>
In-Reply-To: <CADnnUqfDnkvCJVqBkDw+gV7_zs5Q_Mb3anQTu+UujjJ8bBk+ng@mail.gmail.com>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Fri, 31 Jan 2020 14:32:05 +0100
Message-ID: <CAEn-LTrSXHdfp9OPGRSoJCfi8D8Cg8FqS=_-JYpDatAT0X5C0w@mail.gmail.com>
Subject: Re: Errors and segmentation fault while building Golang on Kernel
 after v5.4-rc3
To: Carlos Eduardo de Paula <me@carlosedp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200131_053244_252267_D425BEE6 
X-CRM114-Status: GOOD (  22.74  )
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
Cc: David Abdurachmanov <david.abdurachmanov@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Joel Sing <joel@sing.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jan 31, 2020 at 2:14 PM Carlos Eduardo de Paula
<me@carlosedp.com> wrote:
>
> Golang has been recently upstreamed and I've been building multiple
> versions on my Unleashed board successfully with kernel 5.3-rc4 and
> previous.
>
> I noticed that after I updated my Kernel from v5.3-rc4 to v5.5-rc5,
> Golang doesn't build anymore failing on multiple points and
> segfaulting as well.

Could you also mention what version of OpenSBI you use?
Does it also fail on QEMU (avoid 4.2.0) or only on Unleashed?

>
> I've captured a few logs with the error building here:
>
> I've bisected the versions between v5.4-rc3 and v5.4 and it pointed
> out that the commit below is the starting point.
>
> eb93685847a9055283d05951c1b205e737f38533 is the first bad commit
> commit eb93685847a9055283d05951c1b205e737f38533
> Author: Paul Walmsley <paul.walmsley@sifive.com>
> Date: Wed Aug 7 19:07:34 2019 -0700
>
> riscv: fix flush_tlb_range() end address for flush_tlb_page()
>
> The RISC-V kernel implementation of flush_tlb_page() when CONFIG_SMP
> is set is wrong. It passes zero to flush_tlb_range() as the final
> address to flush, but it should be at least 'addr'.
>
> Some other Linux architecture ports use the beginning address to
> flush, plus PAGE_SIZE, as the final address to flush. This might
> flush slightly more than what's needed, but it seems unlikely that
> being more clever would improve anything. So let's just take that
> implementation for now.
>
> While here, convert the macro into a static inline function, primarily
> to avoid unintentional multiple evaluations of 'addr'.
>
> This second version of the patch fixes a coding style issue found by
> Christoph Hellwig <hch@lst.de>.
>
> Reported-by: Andreas Schwab <schwab@suse.de>
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
>
> :040000 040000 1a4ee20b3614c93de2a925bba2df6f2e1518f227
> 6b4ffd3e1a2245912cf734a8a3f61db7eb0ccd67 M arch
>
> > git bisect visualize
> eb93685 N 6 months ago Paul ..riscv: fix flush_tlb_range() end address
> for flush_tlb_page() HEAD, refs/bisect/bad
>
>
> > git diff eb93685^!
>
> ```diff
> diff --git a/arch/riscv/include/asm/tlbflush.h
> b/arch/riscv/include/asm/tlbflush.h
> index 687dd19..4d9bbe8 100644
> --- a/arch/riscv/include/asm/tlbflush.h
> +++ b/arch/riscv/include/asm/tlbflush.h
> @@ -53,10 +53,17 @@ static inline void remote_sfence_vma(struct
> cpumask *cmask, unsigned long start,
> }
>
> #define flush_tlb_all() sbi_remote_sfence_vma(NULL, 0, -1)
> -#define flush_tlb_page(vma, addr) flush_tlb_range(vma, addr, 0)
> +
> #define flush_tlb_range(vma, start, end) \
> remote_sfence_vma(mm_cpumask((vma)->vm_mm), start, (end) - (start))
> -#define flush_tlb_mm(mm) \
> +
> +static inline void flush_tlb_page(struct vm_area_struct *vma,
> + unsigned long addr)
> +{
> + flush_tlb_range(vma, addr, addr + PAGE_SIZE);
> +}
> +
> +#define flush_tlb_mm(mm) \
> remote_sfence_vma(mm_cpumask(mm), 0, -1)
>
> #endif /* CONFIG_SMP */
> ```
>
> I was not able to revert this change from recent v5.5.0 so I don't
> know if this is the problem or some close commits:
>
> > git log 2b245b8b..2f478b60 |grep riscv
> 2f478b6 N 6 months ago Linus..Merge tag 'riscv/for-v5.3-rc5' of
> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux
> 69703eb N 6 months ago Vince..riscv: Make __fstate_clean() work correctly.
> 8ac71d7 N 6 months ago Vince..riscv: Correct the initialized flow of FP register
> eb93685 N 6 months ago Paul ..riscv: fix flush_tlb_range() end address
> for flush_tlb_page()
>
> Carlos
> --
> ________________________________________
> Carlos Eduardo de Paula
> me@carlosedp.com
> http://carlosedp.com
> http://twitter.com/carlosedp
> Linkedin
> ________________________________________
>

