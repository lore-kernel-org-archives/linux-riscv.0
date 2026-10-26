Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18661606A31A
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 13:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M5eMIr5q;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=tHaMRUpt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OlKvajl8KviSXcdaoxM8LpIrgpwzcm8st4FronIHWOA=; b=M5eMIr5qIz911+Qo8NBtQfPauw
	qc/aGw7Sb0IBaCRz8eua8tH8lBIyJVny83cGHGB9a3B0aGyfEseWo3zLGl8c1eorylVRttbjydIui
	8i779t0i7Kg1uNjBvuKv8058AZgoHpJLt4oYorXlqtehSM3mwEls9TJbW7SP3N/Y02LUczNhCvk2B
	O9leS75Rug6Zb0uIY838+B8kn96CcKUwWJV9K9JY8YoGFYuX7BLZ+MazKe4O9+jzsl1r5JcBcDIA7
	stIqtav1T1KYg08Xz2feFtSBszBQTqQqoBqYpqjufw5Ad6WkHQ6/WS9+9AO0cuv5hYAZGa3YE1OK5
	QYwZbXSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKSG-00000002ZUH-1iIa;
	Mon, 26 Oct 2026 13:09:36 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKSE-00000002ZTi-35PV
	for linux-riscv@lists.infradead.org;
	Mon, 26 Oct 2026 13:09:35 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-156cbe59524so2130413c88.1
        for <linux-riscv@lists.infradead.org>; Mon, 26 Oct 2026 06:09:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793020173; cv=none;
        d=google.com; s=arc-20260327;
        b=Gw+pDoMvPbzAFqCWCyjU7dwNGmYaHfkbyIwVLAg1Od8Onj8j9ZI1FQNugh0pYh73bO
         OltTJcp072cr2hRyLet5NY27PjjSFB7D8c+3c8UYSIOhwBJTz1Mp0yWWvsGB+zc/SBDm
         YwfaQFECphJrkT++4qnQSpLrq8Z5VvutjMNd5P9D5r0kSD/G8w8Zg9s7nCE7qxYuZanh
         o7opmmhX9E5E64gQTDQVtfIdqcVeBNECNVvFxQ33vHFohuqnqDFQQ0u2QFfBZWPfCE0u
         sBNJIWrWZrdRJPuS3tfCoRegcBJHD4QsWXQOFvmlO8Zp4JT9aKXJaWq7lMRWm4A74iu1
         4TvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LUx8uAJnT3d0+7yF1GQKbPBg3JzB/yB9ew9x+QwGKJI=;
        fh=y7CMPru8GXfV0Ac/qI7oUFylmOa6VhGEHS2zaIyAEXI=;
        b=aZRsZIDYpMg/+vMu27JMy1S5KJx9U6m0N0uV+Z7ccKDEgT7QPDLgJO8GZhx9KCiY1R
         91n5PaLK4micmCiADUvEz5LYKL9+1cH63GEwIsY6EFx4gA9n7Vo9kf9PtEGpaIgwRDrA
         6glEr00a6rjGJQDOkRfSlzZROFE2kz1GeM7xCC+hQmjqKRSAZRDIR+hTqg0V7Q8XbN8J
         YCh+I2TIJHWmEVuHbcjc9F1rnBRqfTiD0qD+dWL57lLoJP+S1rNVMXOmysxj57jYzSSU
         vjUKoMsIwpSRn1cQ5VRQj8yRjEbbJtCvcNUF3+fHI/I0CdEBp/QJPXGU1pgZQFsUC3XR
         TV/w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793020173; x=1793624973; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LUx8uAJnT3d0+7yF1GQKbPBg3JzB/yB9ew9x+QwGKJI=;
        b=tHaMRUptlgC5QrELlgljuF/AFp0gIUyD6wknRaSsjJmaQ7JtX7WkdgruTygnB5mV63
         Jsy7Wof7ybhxiK78mAvG3/JIpf4c6Ts106ZuZDSR0pGVqpvpHNy8bzqmijG4mYkfzzRF
         0MW5n86APpfm1+5cMuleJZRgA00oNLdWfij29ozKoOrnKsecL4/dQ5ow5HCkmumBNF0n
         zhI1pCUZAygNqeJ5XjOmpqhOcw3m7+zxYP2MhBHSDDzZhXKu588h6/Qsur/a14+SF46s
         2k20nLbrig1wz1ha7aERhW12A25rneVkmHWRMZd6BlwE+HxZ7sqNXSzZrwbItKB4sqMu
         WKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020173; x=1793624973;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LUx8uAJnT3d0+7yF1GQKbPBg3JzB/yB9ew9x+QwGKJI=;
        b=eVVIebKT8nsAfdlg77cE5lhww7QxvW0tsyb372yxIUndKAdVCteZ4o2PSFDz2Mkr8G
         C9c8D2/jMK6RnvBS+Z3vjGFYACm6r9lgBIRdmitE30Wz+fsxMQzek6qkTyOcMSnL7ycH
         yozlGpFYOenYNlkGghW0QHlM/DHxPNaqEAADQ3LnWZdPvLW3Jm7esXULcFOLyBecM3Ls
         EQgwe+lx+AOZxEe2Ir8xYC7ydPt7CfgA88m/mkjmydU8EG79HqkSLhzX76uljUlrcgrb
         zPDcwQ3dBhiB8d43iDYwx64yXegNZjcX5M+U1fPPOvGGymV5h9Ms7A4NgStXDf3yjoEV
         uZ8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwQDw81eU7Wo3M+4DIq9a7atWhM/Pm6ykMI5aIn28NFsINfAi5nsVJAVHjxFEcCb5gyaoCJBUukB/fayA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLFd4ynnA6H51hIBKK5BwDJTjYbldKJOzoPBkoc+B9QKyiK61iX
	avedRA4w43t3MdreP8xufORS42aOn8zwVSY2juzRlB4kTmqFGJD8o5rwS+WDKCouC3hPdTZYodX
	bE5Msyh3gyUZDIhNWOOKHA02o8SQOQ1C5ZSDO/Acq
X-Gm-Gg: AYBFou0ud0Z6uvWH8EG28qo6ebJX88k4KIYvBTDdFeVA/Kadd35xlTqGEkPIE/sI7wQ
	8QNW25ILa60h7N2/elLThj+OZE5Ns3XbS3cLpNKWtdZpLWAwnLeO41P1+2OPoAQiiUcp96QHVba
	ApbG0+wjAbJR8bnf7oTsepTcDivrypSyNUPXf2jZgs0l3AqnPp81B9ilZwGPd3GEBSftMK8ibZv
	rHOKseCkgdopj8tm1v5xlz4bApyAZJanniKV/ET/tf5yfcNdSeeLQPqhTbWXxpsQmjm3h559KY3
	o3v9wxbrwzQHU7epLbPmVdOsABW2uUXCcu1dT4N8TYnPZrbp56HexgDdrUX6JIWGOz+mVOBKjNu
	Am7yOwfd6+VAwxeFhdEMlATyNRpUYTCV6DhXBThwSQvG9lL1Q4JaToTq+vaxQf90JaHM=
X-Received: by 2002:a05:7022:5f0c:b0:14d:c53a:f6a0 with SMTP id
 a92af1059eb24-1993580f7fcmr9793864c88.13.1793020172106; Mon, 26 Oct 2026
 06:09:32 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793017073.git.liuyun01@kylinos.cn> <f6a6154134fd14c21070f280739acbeb5881df65.1793017074.git.liuyun01@kylinos.cn>
In-Reply-To: <f6a6154134fd14c21070f280739acbeb5881df65.1793017074.git.liuyun01@kylinos.cn>
From: Marco Elver <elver@google.com>
Date: Mon, 26 Oct 2026 14:08:54 +0100
X-Gm-Features: AclHuK9z186pdDjCz6AJnSToOjcvhVoN5e8gTK-5h4m3u7h5mXFXUG7CMtD-ppc
Message-ID: <CANpmjNMo6z0AtvxwpTCwgqvVdribB7L+WkOxQ++AH4sMegycMw@mail.gmail.com>
Subject: Re: [PATCH 1/3] kfence: fix pool cleanup on metadata allocation failure
To: Jackie Liu <liu.yun@linux.dev>
Cc: glider@google.com, dvyukov@google.com, pjw@kernel.org, alex@ghiti.fr, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, linux-mm@kvack.org, 
	kasan-dev@googlegroups.com, muchun.song@linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_060934_782811_91A86F35 
X-CRM114-Status: GOOD (  17.33  )
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
> kfence_init_late() saves __kfence_pool in addr before allocating the pool,
> so addr is still NULL if metadata allocation fails. The error path then
> tries to free pages using that address.
>
> Set addr after pool allocation so cleanup frees the allocated pool.
>
> Fixes: cabdf74e6b31 ("mm: kfence: allocate kfence_metadata at runtime")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>

Reviewed-by: Marco Elver <elver@google.com>

> ---
>  mm/kfence/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/mm/kfence/core.c b/mm/kfence/core.c
> index 90925c646c4c..6e3d01bccdf1 100644
> --- a/mm/kfence/core.c
> +++ b/mm/kfence/core.c
> @@ -999,7 +999,7 @@ static int kfence_init_late(void)
>  {
>         const unsigned long nr_pages_pool = KFENCE_POOL_SIZE / PAGE_SIZE;
>         const unsigned long nr_pages_meta = KFENCE_METADATA_SIZE / PAGE_SIZE;
> -       unsigned long addr = (unsigned long)__kfence_pool;
> +       unsigned long addr;
>         unsigned long free_size = KFENCE_POOL_SIZE;
>         int err = -ENOMEM;
>
> @@ -1032,6 +1032,7 @@ static int kfence_init_late(void)
>                                                  GFP_KERNEL | __GFP_SKIP_KASAN);
>  #endif
>
> +       addr = (unsigned long)__kfence_pool;
>         if (!kfence_metadata_init)
>                 goto free_pool;
>
> --
> 2.56.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
