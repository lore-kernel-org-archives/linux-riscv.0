Return-Path: <SRS0=Etk4=R7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD49C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 06:48:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A13420700
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 06:48:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kcVNhWTv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="qKFl/8Cb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A13420700
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=34QKvJWegXJYwZT+B0gDeKBIEEvKVGMmoFhpwZ4fAak=; b=kcVNhWTvuDio6q
	QCp9+9n7iCOrgZLP4WqaBOv+O7q6tzdS06KZIbB5EodV5CSAIXhmAGk76+yqqpdAnsY2A5gQNcxq3
	67hWIdqE1DKcSeLVVpTCHgWlQeH9oMlI374C1+iOof6qoO6yYfvkEIYmBZJbZnEjHvpVYH65aQEaG
	kMLA0zOVKj3OoUckwJgWned6RCUwg6kbBM7vSoFvE/URUEhAncqigbbzd/F2J2B7+rGniXP6tKAFC
	VwZ8s3gQez9QB1vwED6kLcQ2unse1yaWte0GFP7bzGXAwhv3xk6uH5jxUlh4U7sHjGEkQScQjwJGT
	4Rr+DhUtF2XxdBi8Ldjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9OpT-0000rQ-Cw; Thu, 28 Mar 2019 06:47:59 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9OpQ-0000qw-Kv
 for linux-riscv@lists.infradead.org; Thu, 28 Mar 2019 06:47:58 +0000
Received: by mail-wr1-x443.google.com with SMTP id q1so21405746wrp.0
 for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2019 23:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Afs/QpavNGwi7QjUJ9axczQO8cVMkxqw12kAIWCmoUM=;
 b=qKFl/8Cb1T1xnkYyt8WECDPuyOSADibeLnk9qhRpETnrqu2sp6qxo6nbIkfveWtYqm
 oUL3S+GeqVnOXE160Z4apnepwo8neAF3Oinuikq9k5U6f2WZtSiZ3x/aXrHxLo5Mql8X
 7GNKSp9+BzKp0/usH/x7DvoV3POuWXs39I89pU5S2+UGaSzbK9JKklkI/z0MzNcnKdWr
 KKQkPQlM6KEV1OzjEgfElyDnLifkRzRVTypv0MnPi9s2561JGjID1XL5059WKTW/bQSU
 sXlu3dQXv3xw8COmtHRB30/OVkxYgYtCo4FvgSXvcBh4tFtomF9bWjNQiyXd3/6CPIpX
 FrHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Afs/QpavNGwi7QjUJ9axczQO8cVMkxqw12kAIWCmoUM=;
 b=q/Z7/EW3FGYNHiLbAi2yr+XokATFtqWbyNwKNVEspGKrZiyUoPMa1//LIjlkM7PVa3
 gwsbJ3W/XlFFb7MTi1i9mQEWj7NQkjcZVlbDQFLXkeQVkeE3VPYFJNeZMEkBc9iUP4cS
 YJkP9jq2orD6Yh1zHEKw/XWKwXpRaP7c6NprRNLdMhkJ7wS67cQsK8aemf+0pWX11L70
 ERz+w7hmZaJh8M3qEvjfcyW04cIi4SLtRYijplp9SzDzdYtUPQupjMK7K3k+Q1U7Oe2l
 sZKAxCmSkH3teq8PXSX7IVUWw8XYuw2pS514RWD03qW7mpCvpIcFGkBT5lXIQIGBhEGi
 xwrw==
X-Gm-Message-State: APjAAAV92Fj7TEI3oCa+BLo8mG6MelYPCHn5GMquyIXQdNSGaRjeK7+i
 UN38bVOwtitCgo64P2YPcBI5e+cQz7M/IfnNURVmuA==
X-Google-Smtp-Source: APXvYqxUolKWsOaz7l3FC+B8z0aQEcrcORmdUput/s0f4sHB6bXJEbxaWm9xkGllGJoxpoxRTwiX0P65NDdRCiHTS1s=
X-Received: by 2002:a5d:4087:: with SMTP id o7mr14878612wrp.9.1553755674849;
 Wed, 27 Mar 2019 23:47:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1553647082.git.gary@garyguo.net>
 <cdcce7a6e327c4b8b1949a1eb287f72a2d4fba9b.1553647082.git.gary@garyguo.net>
In-Reply-To: <cdcce7a6e327c4b8b1949a1eb287f72a2d4fba9b.1553647082.git.gary@garyguo.net>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 28 Mar 2019 12:17:43 +0530
Message-ID: <CAAhSdy0nTvbdyvoUwL4SgufYpfZAAR_D26Ybn-DbZVjbJAeUjA@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] riscv: fix sbi_remote_sfence_vma{,_asid}.
To: Gary Guo <gary@garyguo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_234756_681749_3DCA5276 
X-CRM114-Status: GOOD (  14.11  )
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
Cc: Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 27, 2019 at 6:11 AM Gary Guo <gary@garyguo.net> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> Currently sbi_remote_sfence_vma{,_asid} does not pass their arguments
> to SBI at all, which is semantically incorrect.
>
> Neither BBL nor OpenSBI is using these arguments at the moment, and
> they just do a global flush instead. However we still need to provide
> correct arguments.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  arch/riscv/include/asm/sbi.h | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index b6bb10b92fe2..19f231615510 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -26,22 +26,27 @@
>  #define SBI_REMOTE_SFENCE_VMA_ASID 7
>  #define SBI_SHUTDOWN 8
>
> -#define SBI_CALL(which, arg0, arg1, arg2) ({                   \
> +#define SBI_CALL(which, arg0, arg1, arg2, arg3) ({             \
>         register uintptr_t a0 asm ("a0") = (uintptr_t)(arg0);   \
>         register uintptr_t a1 asm ("a1") = (uintptr_t)(arg1);   \
>         register uintptr_t a2 asm ("a2") = (uintptr_t)(arg2);   \
> +       register uintptr_t a3 asm ("a3") = (uintptr_t)(arg3);   \
>         register uintptr_t a7 asm ("a7") = (uintptr_t)(which);  \
>         asm volatile ("ecall"                                   \
>                       : "+r" (a0)                               \
> -                     : "r" (a1), "r" (a2), "r" (a7)            \
> +                     : "r" (a1), "r" (a2), "r" (a3), "r" (a7)  \
>                       : "memory");                              \
>         a0;                                                     \
>  })
>
>  /* Lazy implementations until SBI is finalized */
> -#define SBI_CALL_0(which) SBI_CALL(which, 0, 0, 0)
> -#define SBI_CALL_1(which, arg0) SBI_CALL(which, arg0, 0, 0)
> -#define SBI_CALL_2(which, arg0, arg1) SBI_CALL(which, arg0, arg1, 0)
> +#define SBI_CALL_0(which) SBI_CALL(which, 0, 0, 0, 0)
> +#define SBI_CALL_1(which, arg0) SBI_CALL(which, arg0, 0, 0, 0)
> +#define SBI_CALL_2(which, arg0, arg1) SBI_CALL(which, arg0, arg1, 0, 0)
> +#define SBI_CALL_3(which, arg0, arg1, arg2) \
> +               SBI_CALL(which, arg0, arg1, arg2, 0)
> +#define SBI_CALL_4(which, arg0, arg1, arg2, arg3) \
> +               SBI_CALL(which, arg0, arg1, arg2, arg3)
>
>  static inline void sbi_console_putchar(int ch)
>  {
> @@ -86,7 +91,7 @@ static inline void sbi_remote_sfence_vma(const unsigned long *hart_mask,
>                                          unsigned long start,
>                                          unsigned long size)
>  {
> -       SBI_CALL_1(SBI_REMOTE_SFENCE_VMA, hart_mask);
> +       SBI_CALL_3(SBI_REMOTE_SFENCE_VMA, hart_mask, start, size);
>  }
>
>  static inline void sbi_remote_sfence_vma_asid(const unsigned long *hart_mask,
> @@ -94,7 +99,7 @@ static inline void sbi_remote_sfence_vma_asid(const unsigned long *hart_mask,
>                                               unsigned long size,
>                                               unsigned long asid)
>  {
> -       SBI_CALL_1(SBI_REMOTE_SFENCE_VMA_ASID, hart_mask);
> +       SBI_CALL_4(SBI_REMOTE_SFENCE_VMA_ASID, hart_mask, start, size, asid);
>  }
>
>  #endif
> --
> 2.17.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
