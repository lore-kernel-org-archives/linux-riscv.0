Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0F1FF8867
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 20:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v4UUhjjYXy0NoWOoUZN7uldO1tPd+MK2rzjjfIcGAHw=; b=zAYFxYgfP6v1Wg
	tILtcKj+r9sZpO05x0mxZg/E9j9r1lOk3JZUMDTCoXENrEd63Nxbimtx9lfo+3T4NnPuuV0SEnm+G
	m3gIusMjza92FCsj6PfI4AtihUYIMi2HzEJD/zlcS3iEof/eGdSqshUvzs6QQyUZWqyneRrmGFQQQ
	3SrLWFLGbJw7WvKnUa7bqqwakqNIcXXnT6pCqW2uHIl73OOj0IPOp3NSJ2c2jrhd2fbELkc1s6T4I
	iV/bVhxmsO/2TYgh0c9A9NbSkx83IMI8m325+EzHcbU0xyP1IccC4N6rAw4l04ne/vmrRZd8+RxaW
	lv3j9JzzjXWaCV1nOThg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHSsB-000000008w6-43xg;
	Mon, 27 Apr 2026 20:48:07 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHSs9-000000008vI-1eSH
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 20:48:06 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-124a7216c9cso673174c88.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Apr 2026 13:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20251104.gappssmtp.com; s=20251104; t=1777322884; x=1777927684; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NrpFP9W06UpCIRfe1+NjkVUyD89PsmxrZiNRzVySX60=;
        b=AGZ0bIQjKjQAV6NiEDyCl1yjRhLFr2yBd1DnxnwmCW2G9HChbSjhc3BuqbL03mICXn
         dM10JDzgdefLfa8qNvv+ZW6LPlrCL3+JxGvKd6SzqUgNYYV7sErgV2cVlvpmWV2tE+n+
         XmzR5AUxq3luJ8TT3qitu5IgDuvCMROQ5tVZbOWYfE3F6j3koiOmtG895/ucnJi2qVhZ
         h7yby+0hNIUlKEeanmqRQ+tepfkEXwYzdOaiD4zXVe+pNrsn8gB2VyLT0/oXzR51aR/q
         TjplTS1wg0bV3JDwOiGYx8/BoHGincBSyoJjNcEus13lDHfhfOFMIKltD2t0Ka+/I2XG
         qLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777322884; x=1777927684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrpFP9W06UpCIRfe1+NjkVUyD89PsmxrZiNRzVySX60=;
        b=Q/fMc7cxuGQZDKKKeMtZlCcbeFpn06Dzqguj5xeE043XnnIeC6bUO7Qtehf4mleUBK
         h5pSiq00QpHKD6nb4kOIyQW7x4sX7Rt/Xvh61KKedAx63cXyN4f1YJquXrRYAYXSmxIC
         G18kD45K73K4L8a/sjSjwMLw3FAOXyg2fP0qrgJDpfQ/c6N3ovU28ew6xICYVIzalavQ
         ekfoD5/zxMNi96Se/BzPwoSFB1kJdgGQrTQjUzJiMQXUsNrdGlxEnM5gr37bOfVxSh3N
         TWsILqTD3jwz1Q0rS9nH9y9DP+u4CS6AuAfR7l7PXZ9iOJlmhO2sgb3ksZZR1V56w/Al
         QbZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8PGGvNZTx7FYdKqx4fAOeOagWcHjFCigYjKkzqpbVfrwX5KhEPX9chM0eMJ+5t35XRlD7Qt6Cvk/Q11g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUAYmho1TBCoPQiuLIaez+cR/ddufUa0E/ER8ZWeB9qwfREw3n
	vbKBuyJzBb2njdPsYho+EQR4Z5L9VCbFZL/7BxTUtpx4XqIuym7fEaYDz7apfCFmBHM=
X-Gm-Gg: AeBDietRjuUHRQuC8GuQMmME56eqb4Pr9EvDxTGxu5L5aJj0kRxYJjQA7DgbNQ5GJcI
	CL/uMwtpHo3UVBrKmDfOKrJ6AWwJS4QVsV3Bah8DqtLb74eWxngGkjI5vE0CzWnUUW1DKNgTCe1
	UJ7XQzCk+Rkb1SqKCyq2YsU4KlulgDiaio0oRKbYeyhnWw7O6i7NvgEznLqnq8SwkCtJewfLMC6
	P1vBNVi98SaR6Cl/FN5d3BkWMBhBsKWje4dd/182jx5H35EeFCX7K8VbPBK4KwaCGb/8YuK+AhR
	8/cOWam9LgHNCYJyhUe4eIP7ZSRY5MX1xXOCr3x1fjqNKJzIi/DZu2YfpjigUKuCtKQzaMOfjvo
	mz0kSlVirT9jqgwhIMa9cHLBX/3WtvXw3MCRruFzBABCT838lKxdxC/Q3PDi4wIL1OR1XIjhJsY
	4mR29bGXn2ceMBfJdjdAYGYFqG3B9eFyLPR9VbIPZTqFVvI7QElA==
X-Received: by 2002:a05:7300:72c9:b0:2e5:faa9:ca76 with SMTP id 5a478bee46e88-2ed09c3094dmr115570eec.7.1777322883807;
        Mon, 27 Apr 2026 13:48:03 -0700 (PDT)
Received: from telecaster ([2620:10d:c090:500::3:9e14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a10650esm474976eec.22.2026.04.27.13.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 13:48:03 -0700 (PDT)
Date: Mon, 27 Apr 2026 13:48:01 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: linux-debuggers@vger.kernel.org, kernel-team@fb.com
Subject: Re: [PATCH] riscv: fix vmemmap and vmalloc offsets in /proc/kcore
Message-ID: <ae_LgT-xmJ8YOMHr@telecaster>
References: <5273041dacfde780bbc917660537783c354e0598.1770323325.git.osandov@fb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5273041dacfde780bbc917660537783c354e0598.1770323325.git.osandov@fb.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_134805_595131_49A0FD4C 
X-CRM114-Status: GOOD (  16.91  )
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

On Thu, Feb 05, 2026 at 12:31:20PM -0800, Omar Sandoval wrote:
> From: Omar Sandoval <osandov@fb.com>
> 
> kc_vaddr_to_offset() maps a kernel virtual address to its file offset in
> /proc/kcore. The default definition is (address - PAGE_OFFSET). However, on
> RISC-V, the vmemmap and vmalloc regions are below PAGE_OFFSET, so the computed
> offsets for those regions are negative and wrap around to a large u64:
> 
>   # readelf -l /proc/kcore
>   ...
>   Program Headers:
>     Type           Offset             VirtAddr           PhysAddr
>                    FileSiz            MemSiz              Flags  Align
>   ...
>     LOAD           0xffc0000000002000 0xff20000000000000 0xffffffffffffffff
>                    0x0040000000000000 0x0040000000000000  RWE    0x1000
>   ...
> 
> When userspace applications like drgn attempt to read from that offset, it
> overflows an loff_t and results in EINVAL.
> 
> Fix it by defining an alternate kc_vaddr_to_offset() that masks off the
> high bits, which is what x86-64 does, too.
> 
> Fixes: 07037db5d479 ("RISC-V: Paging and MMU")
> Cc: stable@vger.kernel.org
> Signed-off-by: Omar Sandoval <osandov@fb.com>
> ---
> Based on Linus' tree as of 8fdb05de0e2db89d8f56144c60ab784812e8c3b7.
> 
> This method doesn't work for riscv32 since VA_BITS == BITS_PER_LONG
> there. But, I think riscv32 can get away with the wrapped 32-bit
> integers as long as userspace is using _FILE_OFFSET_BITS=64. I don't
> have a riscv32 userspace environment available to test it.

Ping. I've been carrying this patch for my test builds for a few
releases with no problems. It'd be great to get it resolved.

Thanks,
Omar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
