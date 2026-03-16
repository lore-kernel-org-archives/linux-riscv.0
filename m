Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A364F53D67
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 15:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Nwi9J2yhF2bx9GIoZ1FM7tawN+P98XHH+BO1lRrW7o=; b=LAeWsSqDYKwxs7
	r5KFEsu+zVMQwG3HJCcaSpmCg2UTIvOfbvJzuGmygSHw6P9fSAOY8Qcm9vGKkgL17nRL+ggTcGXCr
	AdRd6p6hnMZTxjC0Kd69Uhe6Ua7KJEMO/bnQw2I+i4SfSmGGh2KiUaWL5w6I72yRSBhgqiLfVLqfz
	DXEQQvexsKIj+sUF7KcLSLqfknr9rJWRkZGL6T++Bw5HQR161fVgDQTHujrk2r4tCVG6XvuA/ZqRU
	C4KWEtgiW9yrvkxg6KZcdVbaFnFZ1gIsa8HHayVc1E/9UQGIqxP5VdZoccfNvZNlH6ZtZkr1dVowu
	unyz7PgP1E0MA1NycZaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29VU-00000004HsD-2ZiK;
	Mon, 16 Mar 2026 15:05:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29VT-00000004Hs2-0w7Y
	for linux-riscv@bombadil.infradead.org;
	Mon, 16 Mar 2026 15:05:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Gqco5SPEd6UaXLI10tvcOr9r7x/pSR9Rg9OAhUkP36s=; b=aFvZpvj7nR5cba1xERW24Egjb8
	tRm4l3GG9HpRaF6MWFw8blxAlRm17hQdBCpOTpk4dcC5N2/Zj97u71RbT2gTwbGdqf2g4ghBbXjPq
	jSf5iSZ1n4pEwJPrU21+Ye/c2nybvaMb6EWnv4wOQW7Cb1P8aZhQhuas6XIwPoZj9JBClipYj0G1z
	LaT5QKlKujs03D+6yXXk+jlt+pCbZ3dGSP/Sy0vTpkPuFaPkgH2YjNZXrWUsn71plyfC2baOgCjVf
	yd8DTdGacNMnHcGpuoYDniyF3mfIwMEDdfQ+UrhzYQq+vZ+rt5mBiTIm9t1snWNqh80t9w98jBfVn
	ctMCMw0Q==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29VP-000000071t9-3ncG
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 15:05:21 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48540355459so44186335e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 08:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773673518; x=1774278318; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gqco5SPEd6UaXLI10tvcOr9r7x/pSR9Rg9OAhUkP36s=;
        b=JUjxKl2c23gIIl1E8xkEIwv0SpZIdm8YNOd58JVxQR5qGqi3SSAA1JbP6e6pduax0v
         xJpP2/0FUJG55JiF7X37Frpl4Hj6B5sTDnk8UJD0cSUlYOukrruC7Nwnq1d/FgFXOy2V
         cMRj6YKf0hUpmQFLqeQs1VhMxqOIed8iFBilUHK623mxicl6EWazYEIh/AlSny0+VMeV
         3VXTNFu88gpXXMp/EQ4AEDgobNLkBaLX0K0C0BAIzd7J6UNqLP4DH4Q2I3m2U77eztPY
         E2xZKTbCJ6QrrJsmE+WK9ZlVXFRWDbaEU1AP3m7aod74uJwRQ8VbG/zNtclkj3cNc2Sl
         hVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773673518; x=1774278318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gqco5SPEd6UaXLI10tvcOr9r7x/pSR9Rg9OAhUkP36s=;
        b=B3kYw0gygeEvBE++XwIhRupela2NXKF2vQcfw0aaEGaGEwQX4WnzpmK/pXgty43EaX
         gRDQqKKgvfCJHJtn7A2XiFdntLWRSgJ58pY5KcA3FS9I1PFi5Yg8XG4D8XffbKjLa56d
         fOZQD84HuceEXU+umZRT98iZcIynp2SBVFT69FWeLyfDLW6QTCcY+0Rh2+b/jHvmLrt8
         mlxksF3RtYONgfDIusqWu7EhJA3OI76s9Cywx8Iu24vcNsWR8uRoo/YUI6qZZLg/p0bD
         meGRHy1jLxQAsOeBj2u9x4iORpJc7ywfGKzzIh6ED7P8DrhXhy0ME2Fc3VyD21UDyzGN
         D0PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKyoMRGznnmW+wR3hyapiale4ZdDeL0aIcaGCUHXEl1KSteQfz+I6DHMD5u9GZ8e6bxGA9obms5PF/9w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhN0Hmm5VKVx7n9A4CiT1UmxFOj6+wKqNb578Q+sKtviPAW3GO
	zMWPUsjChvkVPNxwofxxy+9db7+8TDZektWTulOLQBKqHjuiokL02w4m
X-Gm-Gg: ATEYQzxtaCgZ5BuKXgvMIpg3P2r1Dn1d7s/092hmoSoV3L5atMZlzUmrXVxvkc4OW2i
	RhNFLSfX2ok8uLVFFMYElDq/znoOkakbx0j79VbwrjtGIvrE73rpAKlOqqivu9qB/xYcvM1BYrw
	tJpq8vt2w7XOLyKRdsLmIJTJmJDIspZp9+F0t/gZ3uj7AtEprKhug251VHL6dUqdwdpy+wp5MGU
	WuraPd3NB4rR8o0BM6ZSyy1YSN39/qX4CGNnDAEuNWZPmJaBJ3O34lHKWQY4PXym2cn+JV1nTqh
	284aYZYCEUCD0q7uERo9wTBGXZRhSzsYW5drB6e6WTFfpPI2a5yfvacbASheioUsPC1VIcoEAZJ
	zjCCLpVU+saoVeF53CVtP5yl1dcdkdT09CUthzq6eVEzEyac0oYXJIAZArdVYmgKOkGDisdDD8i
	oKEDnSScoN3iyWkcJRXVC+tJFouGQCNtPEgjp2lM86kV5JQZeNW7k7kvDcAjBx4ra2T8k2clJs8
	PXr5EgrD+KpSNBaBtNJUMvxmrO6Bd+YsZ+5ACHRfnwbdAhXZdOspHR8Mtcqyxnz/GLruqsUTtxh
	6c/3+9uCt5M=
X-Received: by 2002:a05:600c:8b2c:b0:485:4bd1:4c7e with SMTP id 5b1f17b1804b1-485567148e8mr223653815e9.33.1773673517657;
        Mon, 16 Mar 2026 08:05:17 -0700 (PDT)
Received: from mail.gmail.com (2a01cb0889497e0077fb9a9968087a66.ipv6.abo.wanadoo.fr. [2a01:cb08:8949:7e00:77fb:9a99:6808:7a66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5f6c24sm398807025e9.5.2026.03.16.08.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:05:16 -0700 (PDT)
Date: Mon, 16 Mar 2026 16:05:14 +0100
From: Paul Chaignon <paul.chaignon@gmail.com>
To: rsworktech@outlook.com
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Amery Hung <ameryhung@gmail.com>, linux-riscv@lists.infradead.org,
	stable@vger.kernel.org, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH bpf v3] bpf: do not use kmalloc_nolock when
 !HAVE_CMPXCHG_DOUBLE
Message-ID: <abgcKvuSQc2ZYKw4@mail.gmail.com>
References: <20260315-bpf-kmalloc-nolock-v3-1-91c72bf91902@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260315-bpf-kmalloc-nolock-v3-1-91c72bf91902@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_150520_032482_F046F4DB 
X-CRM114-Status: GOOD (  23.23  )
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

On Sun, Mar 15, 2026 at 12:02:48AM +0800, Levi Zim via B4 Relay wrote:
> From: Levi Zim <rsworktech@outlook.com>
> 
> kmalloc_nolock always fails for architectures that lack cmpxchg16b.
> For example, this causes bpf_task_storage_get with flag
> BPF_LOCAL_STORAGE_GET_F_CREATE to fails on riscv64 6.19 kernel.
> 
> Fix it by enabling use_kmalloc_nolock only when HAVE_CMPXCHG_DOUBLE.
> But leave the PREEMPT_RT case as is because it requires kmalloc_nolock
> for correctness. Add a comment about this limitation that architecture's
> lack of CMPXCHG_DOUBLE combined with PREEMPT_RT could make
> bpf_local_storage_alloc always fail.
> 
> Fixes: f484f4a3e058 ("bpf: Replace bpf memory allocator with kmalloc_nolock() in local storage")
> Cc: stable@vger.kernel.org
> Signed-off-by: Levi Zim <rsworktech@outlook.com>
> ---

Note there may be something broken with your setup as lore is reporting
that you sent this v3 email three times. Not sure if it could be an
issue.

[...]

> diff --git a/include/linux/bpf_local_storage.h b/include/linux/bpf_local_storage.h
> index 8157e8da61d40..d8f2c5d63a80e 100644
> --- a/include/linux/bpf_local_storage.h
> +++ b/include/linux/bpf_local_storage.h
> @@ -18,6 +18,7 @@
>  #include <asm/rqspinlock.h>
>  
>  #define BPF_LOCAL_STORAGE_CACHE_SIZE	16
> +#define KMALLOC_NOLOCK_SUPPORTED IS_ENABLED(CONFIG_HAVE_CMPXCHG_DOUBLE)
>  
>  struct bpf_local_storage_map_bucket {
>  	struct hlist_head list;
> diff --git a/kernel/bpf/bpf_cgrp_storage.c b/kernel/bpf/bpf_cgrp_storage.c
> index c2a2ead1f466d..cd18193c44058 100644
> --- a/kernel/bpf/bpf_cgrp_storage.c
> +++ b/kernel/bpf/bpf_cgrp_storage.c
> @@ -114,7 +114,8 @@ static int notsupp_get_next_key(struct bpf_map *map, void *key, void *next_key)
>  
>  static struct bpf_map *cgroup_storage_map_alloc(union bpf_attr *attr)
>  {
> -	return bpf_local_storage_map_alloc(attr, &cgroup_cache, true);
> +	return bpf_local_storage_map_alloc(attr, &cgroup_cache,
> +					   KMALLOC_NOLOCK_SUPPORTED);
>  }
>  
>  static void cgroup_storage_map_free(struct bpf_map *map)
> diff --git a/kernel/bpf/bpf_local_storage.c b/kernel/bpf/bpf_local_storage.c
> index 9c96a4477f81a..a6c240da87668 100644
> --- a/kernel/bpf/bpf_local_storage.c
> +++ b/kernel/bpf/bpf_local_storage.c
> @@ -893,6 +893,10 @@ bpf_local_storage_map_alloc(union bpf_attr *attr,
>  	/* In PREEMPT_RT, kmalloc(GFP_ATOMIC) is still not safe in non
>  	 * preemptible context. Thus, enforce all storages to use
>  	 * kmalloc_nolock() when CONFIG_PREEMPT_RT is enabled.
> +	 *
> +	 * However, kmalloc_nolock would fail on architectures that do not
> +	 * have CMPXCHG_DOUBLE. On such architectures with PREEMPT_RT,
> +	 * bpf_local_storage_alloc would always fail.
>  	 */
>  	smap->use_kmalloc_nolock = IS_ENABLED(CONFIG_PREEMPT_RT) ? true : use_kmalloc_nolock;
>  
> diff --git a/kernel/bpf/bpf_task_storage.c b/kernel/bpf/bpf_task_storage.c
> index 605506792b5b4..6e8597edea314 100644
> --- a/kernel/bpf/bpf_task_storage.c
> +++ b/kernel/bpf/bpf_task_storage.c
> @@ -212,7 +212,8 @@ static int notsupp_get_next_key(struct bpf_map *map, void *key, void *next_key)
>  
>  static struct bpf_map *task_storage_map_alloc(union bpf_attr *attr)
>  {
> -	return bpf_local_storage_map_alloc(attr, &task_cache, true);
> +	return bpf_local_storage_map_alloc(attr, &task_cache,
> +					   KMALLOC_NOLOCK_SUPPORTED);

I can confirm that this does fix one selftest using
BPF_LOCAL_STORAGE_GET_F_CREATE on riscv64: test_ls_map_kptr_ref1 in
map_kptr. Other tests using BPF_LOCAL_STORAGE_GET_F_CREATE are still
failing so I guess they have other issues.

Tested-by: Paul Chaignon <paul.chaignon@gmail.com>

>  }
>  
>  static void task_storage_map_free(struct bpf_map *map)
> 
> ---
> base-commit: e06e6b8001233241eb5b2e2791162f0585f50f4b
> change-id: 20260314-bpf-kmalloc-nolock-60da80e613de
> 
> Best regards,
> -- 
> Levi Zim <rsworktech@outlook.com>
> 
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
