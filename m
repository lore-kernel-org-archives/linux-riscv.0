Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B52606A31A
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 13:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Usepa1No;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=OQFvN9yY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jUKFp0zX1Q8UeuaufEThWFlCRMUhxeHmNxbFL5swEy8=; b=Usepa1NoT51IGGB7P2aceBo3zy
	4QY1Rd0eQNbWP4aqsI43Te2pAOSn9i57dT9ZP37c9+pmCYRGgk60LsJQkeCwwT4LNMs/wE+w4WkFL
	1+xt5anEzhjAgV6u1MQqlqlIAmg9y+0s6xWqCPI+7L8zpDHvcWWcR06Wk6lmgDdY0g15g4yEYnUpf
	+lotYUdltM8H5EYYb1UlCLJF813OgLaQ4JHwmUYNJx6stocfpPQ1Dh6c44vNYOnwWFVk9M9Nv57wF
	HjjM2sy3oe8g65xkbP/lD5EyRx8HB0zJkPgu06RgfzifAp/oi+2qA8MbXbuWrmVhW+kLTcZNm/XTh
	Vge1+xJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKTO-00000002Zdi-2Noi;
	Mon, 26 Oct 2026 13:10:46 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKTM-00000002Zce-1N47
	for linux-riscv@lists.infradead.org;
	Mon, 26 Oct 2026 13:10:45 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-1846bc43c28so2971505c88.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Oct 2026 06:10:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793020243; cv=none;
        d=google.com; s=arc-20260327;
        b=N5JuhmHpqQvOsVrhnIrHriIVSfLl7pTqV7WjrBKhaHRrqDcxP4zU/mHTLa5ImK65tU
         sj2Q2pjrve24R5wruMh6kRgxrDfCrprqKUu3u3UCZDENL/u2HEPYjUcfn0V+HpGFc4Zh
         Ly9o+RrlE+D9HWmfRjy4dkVds7eEoSGy73VFNkvAU7AnN1ZSM9yFctX5KkzZeFY9X8xs
         0qbkLj0mUttwm5KVjHvOKpIrPd7nnNlRxESC2287pqzomg5UzTgJwvMl7U5ksbGqeJyo
         o01sv4YYCmZ9HzE+xGI2E0gcYDKVmdyVWkxZsRAVmv/NxkaQy9CiQAGutyHU+yHpQ9PG
         qh1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QTkhF8AZkeGXg887W3q7liojKnQudM6PWhmi3F33YG8=;
        fh=LUDHmikUSPaNILo3BCrydcecKrmuzOl0tIDVSmOx61I=;
        b=YCMXM5CfkvCTmv93U5aOk4YkDqVkWWbBRoHijt6o+hsjS1jOxm54XIk0+o90iUdCWj
         VETbKkTKnNF952LXh5auqQbQqw3TH35QV3z7gzKDrvFwyv9u1brMpq354atlWyQ74ZVp
         204oqoEpymp0FU/P5YiCUnZ4MjRaeWqDya0GLDCcvvdB6pwdq1IINfWngkPqYK9lYONn
         mfhveEX5M3/VLngNbUljl52G907ZWcBX1SVxLkQC7Qslnbda7XfycgcS5qI7gzLOMEF/
         rnhn6WPVh683/PHIiPRqPm5dg7TWZx5CfHikQ1kKMz4n98wlWzCzcF/9sEGDm1iOhr1I
         cNsQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793020243; x=1793625043; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QTkhF8AZkeGXg887W3q7liojKnQudM6PWhmi3F33YG8=;
        b=OQFvN9yY95ifr23NwXFUEb7LoSd3YZnMxktx+Sr73tbfpY66ZPZUlk+NtnJJReTs+0
         cIPK8NG13r4WLeCAnIswAxwjD4OcYckyRZNWkpohBb7Z0BmfrLLZRIXTIURh1iWCjpEe
         5TQ5jgw1/ALiZq4ZaYC73l+LF4A6whgWfDm+gA+24ZdXFXP+hKYm/RAoVlMRlkT0tHPN
         Tw9eEjYNsz95W+0jodw1GN0LHJwjEyX47gzwYl/pT4zYW7ME7/Qc8a8r7UgrcDNuqXSQ
         BHFTvBDNdKCf+yK9G6677/NFTVCVCTZYDDviiK4pwpwuhMo4HK8cvsDzpjHqSq+gI3cO
         dFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020243; x=1793625043;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QTkhF8AZkeGXg887W3q7liojKnQudM6PWhmi3F33YG8=;
        b=BX6NfkMwVLp/XLS/hH3RX7kEiJmrF22cdDUPjOTw4LjYl1KqiCDS4IseH3cnhZ7R27
         Jzjl4W5TMbi0QqenoHkSuQZuxdE6LvMycADDEWON57z8g+/P8hFpqoGQFNytSB8yocJ/
         GsjfdCO46LvIfZ00EH/o7Br7LoC+oKbPeGW5laW0jc0ucIcVpy9gIK2pFYxaXVNRcRfO
         jYX+cSE72D3s8I+1Fkum/q0ShkzVEN+LI8qxceXUfOzpktNPrgBww77cFRkRVwPCyh2f
         rqgkefdRCTvP/Nd0dDYm4z4KC86ZbPETxYFAe1Xu46j0IxdyuoCnQFLEVBQNaYQWTKl8
         QJQA==
X-Forwarded-Encrypted: i=1; AKwUvByUSt3pVpi+pU3y7c2ro1RtasGPViyAwYOb04y66s81I8rSMlygHdvmwXrZ176S6+ZFuVJkkrueUKPMEQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIxUJh99NHJBxBIdv2Gu/y/kJYq0e/YYMinDZKGALpfP7A4m9X5
	+k20AdKZkBV+La76FJ3OpNbZhqBFXLGbpfvBRRljoJ+YdQrBEiy2a5soTnCutfD0qePCHR+lVgB
	fUZ/9s3qsDh6HV/f7buEtfBcGadqnFpGqZDKSFzB2
X-Gm-Gg: AYBFou1Mbbp/QtMmfcV6NWRIeo1QQTZtOisEKc0oGHKSZ6LlHIGTdbUW/lRK07R2o2h
	IFv2JzC75TYBJX75//34FDkSe1OXuBATmX6OaANrp5Stg32IlVmUykLHArBlNgwlqMwGAZjkLZm
	yFmA8tTfUMjDIcUAEv8zlkDHGxFfSOdYBT1+fd6SOGX3PX90oFio8NmxJx6YieBp+BKIYa69KuU
	I3fQrntqT06j6sXRiX/EjNbW+vUf8ysf/dlmUaJkpJKGUonEGLNDWtNsZuaB+tq38ttDWtgq9g3
	72quAcpV4tpsNb/JbqO95wuBCc5CVvJJRsyo9eZWA1mBoZxITrkLAy+bggRivtBHz6PIqg46mgL
	vTAnSL9cAkP0rvDuft5SNWJB+tetMRj2gqOCww2ASfCu8rFD0wXX8s2BwbMj9EGMQfOveEB09sZ
	So3tI3DPIXf4zE
X-Received: by 2002:a05:701b:2719:b0:14c:c947:6afb with SMTP id
 a92af1059eb24-1993505eb6fmr9755750c88.15.1793020242405; Mon, 26 Oct 2026
 06:10:42 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793017073.git.liuyun01@kylinos.cn> <16dd0366222031d0f5fe398926b16edd6e956e0f.1793017074.git.liuyun01@kylinos.cn>
In-Reply-To: <16dd0366222031d0f5fe398926b16edd6e956e0f.1793017074.git.liuyun01@kylinos.cn>
From: Marco Elver <elver@google.com>
Date: Mon, 26 Oct 2026 14:10:04 +0100
X-Gm-Features: AclHuK-qQC9TSp6y1w0jYuZwekrixl0YqhoKCZ6MwBRL0eAUB01yK6AwzJ3fce0
Message-ID: <CANpmjNOr-d-HA7SUZgyP8Yz_tNyq=_fcg9NMKw0jTYEmV+B+HQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] kfence: clear the pool pointer before freeing pages
To: Jackie Liu <liu.yun@linux.dev>
Cc: glider@google.com, dvyukov@google.com, pjw@kernel.org, alex@ghiti.fr, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, linux-mm@kvack.org, 
	kasan-dev@googlegroups.com, muchun.song@linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_061044_375816_0EAEA8B7 
X-CRM114-Status: GOOD (  16.14  )
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 26 Oct 2026 at 13:23, Jackie Liu <liu.yun@linux.dev> wrote:
>
> From: Jackie Liu <liuyun01@kylinos.cn>
>
> Late initialization frees a failed pool before clearing __kfence_pool.
> Slab allocations can reuse those pages in between and be mistaken for
> KFENCE objects by is_kfence_address(), even though KFENCE is not enabled.
>
> Clear __kfence_pool before freeing the pages, and use the saved address
> for cleanup.
>
> Fixes: b33f778bba5e ("kfence: alloc kfence_pool after system startup")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>

Reviewed-by: Marco Elver <elver@google.com>

> ---
>  mm/kfence/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/mm/kfence/core.c b/mm/kfence/core.c
> index 6e3d01bccdf1..434df6cef7f2 100644
> --- a/mm/kfence/core.c
> +++ b/mm/kfence/core.c
> @@ -1052,16 +1052,17 @@ static int kfence_init_late(void)
>         free_contig_range(page_to_pfn(virt_to_page((void *)kfence_metadata_init)),
>                           nr_pages_meta);
>  free_pool:
> +       WRITE_ONCE(__kfence_pool, NULL);
>         free_contig_range(page_to_pfn(virt_to_page((void *)addr)),
>                           free_size / PAGE_SIZE);
>  #else
>         free_pages_exact((void *)kfence_metadata_init, KFENCE_METADATA_SIZE);
>  free_pool:
> +       WRITE_ONCE(__kfence_pool, NULL);
>         free_pages_exact((void *)addr, free_size);
>  #endif
>
>         kfence_metadata_init = NULL;
> -       __kfence_pool = NULL;
>         return err;
>  }
>
> --
> 2.56.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
