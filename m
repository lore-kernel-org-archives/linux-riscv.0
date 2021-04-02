Return-Path: <SRS0=OQtk=I7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B28C433ED
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 04:17:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CC2161056
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 04:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CC2161056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CIQjxPlqUOYWWQiT+6V7Q0cAP3/NXhuxP7sWFO2agDc=; b=Ka78tt9fQ9sDXgdV59ENX5h6z
	X+6L6sg4WEYqzN4ILdD8+/lltaRm1c24Y8eVsIYjYDVxsxNz+BmazSQoc9iUPwSrWL+2zdgXUPawH
	bc36tQq5zKSRtFtMDErmrsFn8WWJgNRQEO4/7waoVec8uE/s2dxl+6z9yPFJ1fDjjkbCZCoC4u4yM
	19vD1eUkbIXZMVVHXJ7dEfTLnET7I7AG8kJaxgcahSllMAyrUABLwGYfSjr6NL3dvQxgvM2Eg7La+
	dd6F33fH3NUfluIhYpZc142NpQD8OpwlnOpgj1WpcqoJhLqe4YQiu2ZgxcQsSiZRGg9CoMWbtm2GQ
	EYOj+2vmQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSBEg-00BuMc-8f; Fri, 02 Apr 2021 04:16:42 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSBEa-00BuLy-W8
 for linux-riscv@lists.infradead.org; Fri, 02 Apr 2021 04:16:39 +0000
Received: by mail-wr1-x429.google.com with SMTP id c8so3660929wrq.11
 for <linux-riscv@lists.infradead.org>; Thu, 01 Apr 2021 21:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EF04ZQkeFciI3OPVClfJodus6PK+ab706FdkNzAwhhM=;
 b=YnksgUvTp/aj/gKETPzhozoW5W6T/U14dYMauYuYflKWD8oXsbKHIgk/5UM7FgMBXS
 +BTLAkLs2N7OW+GbQSMqXVZeVVqP3RuO39RaPprBCyTCKfTE3OZu1hT+q59bbwpxI4KV
 vp+HYS6aC3a4n48AgGFXM0pD0faBVwawGv6qZ0sYE6SWO/zhmt+G9RzM7VW40KhH5kog
 hFUAYZ/1uLJkT5oGyKtjgQqsWioshEX565M97SN0U0iYThjmna7XyXPBnH5rzPh9zWye
 0gQvDp+V8v4z+k/99thMEzz+vYpHcNrqBQt7c8a9fUot7/d5O5aqQRoHaFmdTxVxWZth
 a7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EF04ZQkeFciI3OPVClfJodus6PK+ab706FdkNzAwhhM=;
 b=OJBbJwlG+FluD7pa4HVmnBQXnmLhzEhT6UhzohlYCxlahhPT5Adg5VmzbaFqhuqFEB
 8DpFqgAfqZkQFjXukfxnKbikaiC5mT7+BmB8UrOO10ByUsHSxG/tN3pD5JQDgfVbmSZU
 n1WorNu8dXf4ePtNl83qNWVkq/FM31jiGfNV3uGIbXtZEB5K3DgYmyg7JvGlrAdhMZmC
 TqsfrAW/PTo4xfgMBfHktSf8ckpIztEQJp2w0GETrioAy26l2Yy7gYJEAHMBtcEE3SDz
 TSjDwwYEUaMpvosdp72NIyWCI9Jl7IXJuh1cFdYOtciS/XuvqTzx2ZhkrZ2IUgCbi9lH
 miyQ==
X-Gm-Message-State: AOAM533JOcUlCHsQKCKzz4m6kttqvZeFzEOIxqORSKS1PnTHXKiuVXdW
 8vahw04967OFBh/vXnsMZ0P+nON/odoy1+x5VGEnMQ==
X-Google-Smtp-Source: ABdhPJySKIt34vbErD7KKU1Rn4WmavlZWVD2kvyhosy94dmoSbf5MPEsuKtsD881aut0OM0oi/P2hKLMqfIIe8Im7ZU=
X-Received: by 2002:adf:9544:: with SMTP id 62mr12966999wrs.128.1617336995047; 
 Thu, 01 Apr 2021 21:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210401002442.2fe56b88@xhacker> <20210401002724.794b3bc4@xhacker>
In-Reply-To: <20210401002724.794b3bc4@xhacker>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Apr 2021 09:46:24 +0530
Message-ID: <CAAhSdy1qcNBy-o8NAho-bhJY1FOF_DCiQ37XX+FEiBbYqokxhA@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] riscv: kprobes: Implement alloc_insn_page()
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Song Liu <songliubraving@fb.com>,
 Yonghong Song <yhs@fb.com>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com, netdev@vger.kernel.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_051637_385194_2779A4E7 
X-CRM114-Status: GOOD (  15.15  )
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

On Wed, Mar 31, 2021 at 10:02 PM Jisheng Zhang
<jszhang3@mail.ustc.edu.cn> wrote:
>
> From: Jisheng Zhang <jszhang@kernel.org>
>
> Allocate PAGE_KERNEL_READ_EXEC(read only, executable) page for kprobes
> insn page. This is to prepare for STRICT_MODULE_RWX.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kernel/probes/kprobes.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
> index 7e2c78e2ca6b..8c1f7a30aeed 100644
> --- a/arch/riscv/kernel/probes/kprobes.c
> +++ b/arch/riscv/kernel/probes/kprobes.c
> @@ -84,6 +84,14 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
>         return 0;
>  }
>
> +void *alloc_insn_page(void)
> +{
> +       return  __vmalloc_node_range(PAGE_SIZE, 1, VMALLOC_START, VMALLOC_END,
> +                                    GFP_KERNEL, PAGE_KERNEL_READ_EXEC,
> +                                    VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
> +                                    __builtin_return_address(0));
> +}
> +
>  /* install breakpoint in text */
>  void __kprobes arch_arm_kprobe(struct kprobe *p)
>  {
> --
> 2.31.0
>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
