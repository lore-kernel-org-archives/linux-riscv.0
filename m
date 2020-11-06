Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56142C2D0A3
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 06:52:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB3E3208FE
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 06:52:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N8+zvi8J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="crgTZXSk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB3E3208FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oyQyGm0NNaeDYwOu20um20Pwk3GLa01TcoU0LVNaUa0=; b=N8+zvi8JFVzdZgfsZ3Zs8+QwS
	ymM0DU+lva7LN7jtdjY7clB0F8l1AxyjSUyoHM5ud+untuGv9SIxc3hO/wd2eM4lbkFxr4lfKrWST
	hQ/PxcDp45l0TuXmE++0oyJ6IFys9RXxUVQofFdnM5UVrSlzwpRqEMm6P0qHOhHY01AlrLDPm+X6q
	1kYnCNAX8wCp0hh5KYT9lJpcZAGefqfRTE0vdUPfCAwNr05w1hE3R9YQ6QXrG/kuVkxUK93FWIx3W
	KQRYDWXPXRtfWTcq2V2l7/ivrw2hncr2Q++eVCuLBdF+TpRa8D5gaM6orXweC95qWYO9YznTLzU5p
	rNae74Jiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kavbX-00005Q-LE; Fri, 06 Nov 2020 06:52:11 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kavbV-0008WS-CD
 for linux-riscv@lists.infradead.org; Fri, 06 Nov 2020 06:52:10 +0000
Received: by mail-wr1-x442.google.com with SMTP id c17so131666wrc.11
 for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2020 22:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q3f9Pa023kq6nDLJQQNpO49x4systkFNrJf/4ta2NQU=;
 b=crgTZXSkON6Ldq2Mi5vOY6+SDVkFbigcyoKW4Ko57LfLXxyRjoSGqaaw+inQCog26J
 HP3nKhTooJi1kTgDi0DdvoP1dVBtblDXupJL7iSdPendjz5YX+XUyv2Ol9GN3E+Ohcw7
 +wzDrDJa3efME21bmHeecMbrtdtrO8PNAdHNVD6624MT6DbEI46z2TB9oRLxMWnFqZil
 xX+jEFO8zJMrU6Q8K05a8NydPTyNhXjRSRelkuShFDeCoNfUILw4UjJg2yOOlMhHsl89
 N3acSXvwZS9OwWEXr1pOtyOBxI1Le2G7IPPLMnz0W+Fmv9tdVtgl9t5noVAf+Pi6GdDD
 GH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q3f9Pa023kq6nDLJQQNpO49x4systkFNrJf/4ta2NQU=;
 b=HgCR30LL0BuPEKNJqxRabbNXYpETg0KeITguDvUXm/fQku+77vNgY/zRwY4p0uXXHB
 0WtNhxVKpOJBaAL3wsRaEsTq58OhEnYDPCgPDNbCzbGaiFFrmZnnLHs+7iHslXQBxWep
 QId2NHhbpV8Gp+4L4A2vYpM60LasvCT3/sHjGd+SpIuHKMwXTx2Cs2q+NII3MSdrxQnc
 MwkV1SAcsW/dzUCYgslZIYJsoDOD0kvyG5LmmUCv+rVAQSxj7EHAFm5ZSvUXTG5+F8js
 g++W8DuVEVaB21OM/XJQbJsV9kAPCQ9c3UfmakB/bqw7ecarUYIJyw+PKPe9D0bxxu+3
 zNEQ==
X-Gm-Message-State: AOAM53186wPl5n4z1FzK4fsC6BMJj1fz70IA3Sh1aTZyugXNvVtd5efr
 7isYuy/kdJuwmuPu7wmOUKzhzyRsCMPn2L24f4V70w==
X-Google-Smtp-Source: ABdhPJzZm4YL9DpLTGxAwJRmfLGYPkjw0QWgiOEd+3cjNtmIWWOXF/NBBhiUrWGaVMGF06WfCBZpebumPfBq1YS4BuE=
X-Received: by 2002:adf:eec2:: with SMTP id a2mr969252wrp.128.1604645526458;
 Thu, 05 Nov 2020 22:52:06 -0800 (PST)
MIME-Version: 1.0
References: <20201102073052.199638-1-changbin.du@gmail.com>
In-Reply-To: <20201102073052.199638-1-changbin.du@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 Nov 2020 12:21:52 +0530
Message-ID: <CAAhSdy12JRy5uF5t-e=bw=K1Gk5PKuTErg0kmKOxBKBn4MnhJw@mail.gmail.com>
Subject: Re: [PATCH] riscv: uaccess: fix __put_kernel_nofault()
To: Changbin Du <changbin.du@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_015209_572806_AB40CBCC 
X-CRM114-Status: GOOD (  17.05  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 2, 2020 at 1:01 PM Changbin Du <changbin.du@gmail.com> wrote:
>
> The copy_from_kernel_nofault() is broken on riscv because the 'dst' and
> 'src' are mistakenly reversed in __put_kernel_nofault() macro.
>
> copy_to_kernel_nofault:
> ...
> 0xffffffe0003159b8 <+30>:    sd      a4,0(a1) # a1 aka 'src'
>
> Fixes: d464118cdc ("riscv: implement __get_kernel_nofault and __put_user_nofault")
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> Cc: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/include/asm/uaccess.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index c47e6b35c551..824b2c9da75b 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -476,7 +476,7 @@ do {                                                                        \
>  do {                                                                   \
>         long __kr_err;                                                  \
>                                                                         \
> -       __put_user_nocheck(*((type *)(dst)), (type *)(src), __kr_err);  \
> +       __put_user_nocheck(*((type *)(src)), (type *)(dst), __kr_err);  \
>         if (unlikely(__kr_err))                                         \
>                 goto err_label;                                         \
>  } while (0)
> --
> 2.17.1
>
>

Looks good to me.

Tested-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Anup Patel <anup@brainfault.org>

@Palmer Dabbelt , This patch fixes jump label implementation in
Linux-5.10-rc2. In general, this patch fixes all kernel instruction
patching related features. Can you take this for Linux-5.10-rcX ??

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
