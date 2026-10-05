Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B69CCA5FF5
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2026 23:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RkuBm8ZP8S4+PWMabw3bZmiPhhoQLrUCLrxdonfiQJM=; b=YvK3gm+t/NLT+b
	Mw0EA5xv3QvnZ4y2mFW7/9tiJ3fWOjFwsUJ3jnuM7W9BZtsx5Z5bveEZXsn9a3tuvcUnpy9JvfPeu
	lM25lZsPuX3LFa9WJKnGnoANc+QdAqIKzY10oE2vkI3/qpPpxvB8kPsNnLd3J7WLs7sZTBRVZ0UTX
	L6b8DYGMThB5X3oTmbIh5YINHs6VGVNcV1LlI6R8GyTEW6N9vEXznf6+AHKq5l1OSvyzxpa5P8iLF
	rWC+MA3ZJkIB76xECTK99Zc+wESbvW3W8gtYHYPR95mk/HiXMZ9jQuWxRCxXTV2i6HLhrxCw+u6PJ
	Wyw1kaYmAanxM4yxpzPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDsFc-0000000HL5b-0Zo3;
	Mon, 05 Oct 2026 23:37:44 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDsFX-0000000HL51-412D
	for linux-riscv@lists.infradead.org;
	Mon, 05 Oct 2026 23:37:42 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so24819085e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Oct 2026 16:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791243457; x=1791848257; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G/tHJXYEmrDPsmKmiT0kZDlKzYZtfAGjKXPf1jJKMEU=;
        b=KfeSCqJXXDy7du1uRzR80bJdiIdVTG4SdA3pyXyFHDldLZU7poFB1YwP9Zw7MBEYnj
         1PiMJs70zfs/HyPcMJKU6XfP1ffZUp+PAppxt8WZgkhkza+5Rgg7gZ9EEdDiCrFGW2hX
         j0G415dtQxjDNeSH6KnyZ1uL+iHdP+saSGHcUkDdU9I7BJrtvJ3NIpuHgUgwAiTnM+2z
         Add3bIGrxWGhTdIEJPCA2WUh+pOzYpIypdTcVX9VJQ8WhftAM+8M/DuJjhc3FfZir7TC
         09NZzyWOKL64maGeI611CvcWzr9LTWNEiYz8x38oygkfLhnGruOzF4N2Yuvk/kCpLOX3
         BznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791243457; x=1791848257;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/tHJXYEmrDPsmKmiT0kZDlKzYZtfAGjKXPf1jJKMEU=;
        b=US9L1eJr6FS+KFLOGf9RTHN6px761hcvJ8NJU65hgAeUxk4hqkNgujs03Kki8E1YBS
         PZvdrdDdq+X61fFP6GemfNLnpAKguZPpESn1OULqYt7W6Y3jr4fRd+hwmYX6tlfPcne/
         E7gLsC5BIdow0LyKNPqQLy+ibX6GU1qxZOp5tZINeTAYac+ITlfznnRsA8wbjSu6oYUM
         XtzCFP36Z8aiGSw9F085O/MK2ckFMlkQAamEmbDoG/2qWPoFS7GtZnDnrFLV9XlO/bCy
         jLT8APe0jMIAFQjJyZVcE01aR2zPt8J7X0TZ+J3BQx0A38Z1VT2+oQIfptQY3blFSCEr
         etPQ==
X-Forwarded-Encrypted: i=1; AKwUvByNXUsB4p91MxBPH9un8o0eoPBwGAbwgiXlJnSRMuIXHDVpV1QiE1fGlxdGqvKfkzHUiq4mUc+ONuBSbQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nmzGOaKZxqYIjj09VqcCOumlBymFExr5MpFA4gRj5NGNWrwrZS
	CqNlTPZEvoLgC84W08Hy4tagaq8xQRQksrYTQ9a+ghV/2LVniCQEWQxGXZwezdmMoKU=
X-Gm-Gg: AYBFou3a6zk+5tq59s7YM5YUMPPH0hgZdSuK2JC9Et2NNZmqzoFtHLyS5uQjRkpYCub
	HOUB3ibTyS2dZJTOcpg6eRw4APkPrwHFm0HQPuciuQo41O96YdHNT7ZPMN7Sh81AbLE+gVvbLhb
	ba8ajGPY9mwSPju5NEwMu7nna5hb+sAY5FI+++ZBuemJo7U93r5YcDHDUPMzNm0wfeCu6EYJ05L
	7zZEg3huuKR1SY5cGPyGnAzTYk9RUHNu50ul6DT2dpSqoaHo0whfTkuWFkcqN0PcLkjmU1AJz/F
	Lc6M9kmAedV9J4Y2jDW+qlZmYLlQfJTPL565bRckBhiqKGZBUBzdKInXTqLmzbDtEKyRzVjRta5
	OejiiP5UiThZmwapB0pGXelDtaiu5IYDFT8K31+y7EVOWtd4M8EQY7GQAEipO+r4wfdqmSWcWtl
	z5su1Nxz0z6iknEhdPca6G4yL4Zx2uZklfMpF+dal5yN1KNWczwNgkv3blbIKsBpP5IAPMubpbe
	Q6q1j9KInqK1mG09gZMR6I=
X-Received: by 2002:a05:600c:3b01:b0:49c:ffab:551f with SMTP id 5b1f17b1804b1-4a1680ed179mr129727315e9.22.1791243456729;
        Mon, 05 Oct 2026 16:37:36 -0700 (PDT)
Received: from [100.64.0.1] ([147.161.130.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178db0929sm24701835e9.12.2026.10.05.16.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 16:37:36 -0700 (PDT)
Message-ID: <a25d01cd-e21d-4e51-9d24-6cc41589c041@sifive.com>
Date: Tue, 6 Oct 2026 01:37:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: futex: untag the user pointer before the atomic
 access
To: Ziyi Guo <guoziyi114@gmail.com>, palmer@dabbelt.com, pjw@kernel.org,
 aou@eecs.berkeley.edu, alex@ghiti.fr
Cc: thecharlesjenkins@gmail.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261001184355.2395068-1-guoziyi114@gmail.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20261001184355.2395068-1-guoziyi114@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_163740_647582_3A55F2CD 
X-CRM114-Status: GOOD (  22.06  )
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

On 2026-10-01 8:43 PM, Ziyi Guo wrote:
> access_ok() checks untagged_addr(uaddr), but arch_futex_atomic_op_inuser()
> and futex_atomic_cmpxchg_inatomic() hand the raw uaddr to the inline asm
> amoswap/amoadd/.../lr.w+sc.w through the "+m" (*uaddr) operand.  When the
> tagged address ABI is enabled (CONFIG_RISCV_ISA_SUPM, prctl
> PR_SET_TAGGED_ADDR_CTRL with PMLEN != 0), those two addresses differ: a
> user pointer whose top PMLEN bits hold a tag passes access_ok() after
> untagging, but the atomic is then performed on the still-tagged raw
> address.
> 
> Supervisor-mode data accesses are not subject to the U-mode pointer
> masking (that is governed by menvcfg.PMM, which the kernel does not set),
> so hardware does not strip the tag for the kernel's own access.  With
> Sv57 and PMLEN=16 the tag bits overlap the canonical-address bits, so a
> tagged pointer can name a canonical kernel virtual address (e.g. in the
> linear map) whose untagged form is a valid user address.  An unprivileged

Thankfully, the combination Sv57 + PMLEN=16 is unlikely to be in use because the
address bit overlap tends to create performance problems.

> process can thus make FUTEX_WAKE_OP perform an atomic read-modify-write on
> an arbitrary kernel address, with the matching FUTEX_OP_CMP_* result
> serving as a read oracle.
> 
> get_user()/put_user()/raw_copy_{to,from}_user() already untag the pointer
> after the access_ok() check; do the same in the futex helpers so the
> atomic operates on the address that was actually validated.

> Fixes: 2e1743085887 ("riscv: Add support for the tagged address ABI")
> Signed-off-by: Ziyi Guo <guoziyi114@gmail.com>
> ---
>  arch/riscv/include/asm/futex.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
> index 90c86b115e00..8d80e580eec5 100644
> --- a/arch/riscv/include/asm/futex.h
> +++ b/arch/riscv/include/asm/futex.h
> @@ -40,6 +40,7 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
>  
>  	if (!access_ok(uaddr, sizeof(u32)))
>  		return -EFAULT;
> +	uaddr = untagged_addr(uaddr);   /* FIX: operate on the checked address */
>  
>  	switch (op) {
>  	case FUTEX_OP_SET:
> @@ -82,6 +83,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
>  
>  	if (!access_ok(uaddr, sizeof(u32)))
>  		return -EFAULT;
> +	uaddr = untagged_addr(uaddr);   /* FIX: operate on the checked address */

The comments are not necessary. The reason for the change is in the commit log.
With them removed:

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

>  
>  	__enable_user_access();
>  	__asm__ __volatile__ (


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
