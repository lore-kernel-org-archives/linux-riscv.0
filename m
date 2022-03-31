Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F526C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 05:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=GKHl5Kj2GXTNndQ2p4KOewzpDVq0fhHkwI02hg1nHLc=; b=glCWonxjj7A3xiJy9117oiHJ81
	+csaeXHkCSd0g/aStYNWOYfSOUyLoldl45G2myx9mDnoyL/qvaTjRSZisYIXtzAABhWf6ZZmvUrdh
	5PSZZ5+TIWcMhLBs++2dmTNhCPEsWzDy0BjMZ0KzN66i2tqBRhu2w672+tv4xg9spTBjGar4gg7rG
	G+xr683nFuXF7r7gQxkDI+yR2G9SEf0H1Q9HF8b/tpWIIDnFftXyKk21yd6z++iD5lzYqfy0yFOy6
	ryvs9et+7+j/YBFoBIkEcJ8MOQdJKKagvAyyfvK4HWkBvFnmCnn0VxmsCP8ukR4yZ9qOxSErbcEkY
	THUueDfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZnjx-000lO9-3P; Thu, 31 Mar 2022 05:53:01 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZnjo-000lIq-IF
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 05:52:54 +0000
Received: by mail-pl1-x636.google.com with SMTP id i11so22497259plr.1
 for <linux-riscv@lists.infradead.org>; Wed, 30 Mar 2022 22:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=qwc+ykWjf+iOc40PMNj72quPthV5FEgbg6mED7ZE66w=;
 b=UPS1UlTV4WmVKshktrddl4bWG5eal7cXSmzWVRAP+zBr8uFfJYf1iT75S/JS0k3v4Z
 HNk4ll9ZsBzmQP4roEWDjiJIGFzTZ6UyZ4lspXWWQClIvB6YcYyuBEz4BcTbt1EEUCE5
 4s+xwVRMfHnzJEzie7JBvKKjkH6kduewN5powJR3qv0qbqZlX9x9CNOCsz/D9zA/3QsJ
 /NODWzL1IRoIN+5ArLaqYT6FFFb6Cd2UPYjbCEfjMbGmdCmUQWYJ5lnDRvQcbezklLdC
 rErBNWF67N8AHpSHb4gsYW0BBfN5fVoMQ2RxzzCjq4rJK4PQte0calQsVuc47m/3AGrD
 m3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=qwc+ykWjf+iOc40PMNj72quPthV5FEgbg6mED7ZE66w=;
 b=EkULLJL4v/0FylHUkvYLJVUexLTN5T+gFuYqvnV18+bZCWfgk4DhrC4mqnEo0yhs4K
 CVQfen/HraZEFMOr3Jai124JF30oj0w41Y/rwymHKfyZUkmke6I+kSg1h4WU/I+kaKmJ
 ACQv9AaL6zNXNKXUdc0od1CQGuNiN5wvqveEaef3JzR6+vzBjzGSa5Pvhek5OXI95bZg
 y8p+IhYOAM9f8cEbQ6SB2ZbbPAMLzeM76QOWMhW2xmrcIc5Hp/eZIL4vdsjKBM3x6F8w
 rmThQCPJacNQv9Yq/QUcTtSIy18SxoOJ66bRBaLSAmIkz/gcV1eKX0O4nYEc+DAcnOFz
 sVVw==
X-Gm-Message-State: AOAM530NlpXlqhq0eyWb5lT1jNZPMw22SDt5ad6z3j6c6DKruhO5kPfk
 Xa9CTzQ6yEzErAjaILcKpqDSGw==
X-Google-Smtp-Source: ABdhPJxmb/ukzZJdat5btChEkXUKMJORBk7P46VI6MFVLkn7D5Dn79mk3YtU1JF/xYNQpq9HytUiCw==
X-Received: by 2002:a17:902:e5cc:b0:154:57cf:e393 with SMTP id
 u12-20020a170902e5cc00b0015457cfe393mr3420091plf.24.1648705971745; 
 Wed, 30 Mar 2022 22:52:51 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 g3-20020a056a001a0300b004fa65cbbf4esm26661394pfv.63.2022.03.30.22.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 22:52:51 -0700 (PDT)
Date: Wed, 30 Mar 2022 22:52:51 -0700 (PDT)
X-Google-Original-Date: Wed, 30 Mar 2022 21:54:17 PDT (-0700)
Subject: Re: [PATCH] riscv: Increase stack size under KASAN
In-Reply-To: <20220314090652.1607915-1-dvyukov@google.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 alexandre.ghiti@canonical.com, dvyukov@google.com,
 syzbot+0600986d88e2d4d7ebb8@syzkaller.appspotmail.com, 
 linux-riscv@lists.infradead.org, kasan-dev@googlegroups.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: dvyukov@google.com
Message-ID: <mhng-2038307f-4225-46a3-b551-e1aebbea564f@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_225252_641696_2DC320F1 
X-CRM114-Status: GOOD (  15.11  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 14 Mar 2022 02:06:52 PDT (-0700), dvyukov@google.com wrote:
> KASAN requires more stack space because of compiler instrumentation.
> Increase stack size as other arches do.
>
> Signed-off-by: Dmitry Vyukov <dvyukov@google.com>
> Reported-by: syzbot+0600986d88e2d4d7ebb8@syzkaller.appspotmail.com
> Cc: linux-riscv@lists.infradead.org
> Cc: kasan-dev@googlegroups.com
> ---
>  arch/riscv/include/asm/thread_info.h | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> index 60da0dcacf145..74d888c8d631a 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -11,11 +11,17 @@
>  #include <asm/page.h>
>  #include <linux/const.h>
>
> +#ifdef CONFIG_KASAN
> +#define KASAN_STACK_ORDER 1
> +#else
> +#define KASAN_STACK_ORDER 0
> +#endif
> +
>  /* thread information allocation */
>  #ifdef CONFIG_64BIT
> -#define THREAD_SIZE_ORDER	(2)
> +#define THREAD_SIZE_ORDER	(2 + KASAN_STACK_ORDER)
>  #else
> -#define THREAD_SIZE_ORDER	(1)
> +#define THREAD_SIZE_ORDER	(1 + KASAN_STACK_ORDER)
>  #endif
>  #define THREAD_SIZE		(PAGE_SIZE << THREAD_SIZE_ORDER)
>
>
> base-commit: 0966d385830de3470b7131db8e86c0c5bc9c52dc

Thanks, this is on for-next (there's no fixes right now, I'm still 
collecting stuff for this merge window).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
