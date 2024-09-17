Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF708CAC587
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 15:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=q3R1kmkJ5u6UfFyhNhi5enz9USB7C9v3OW5AeIahKSo=; b=Ce8kE0Ug0Ru9Fo32UPCG2bXzlk
	txxfrcka8f1V3+4TKP1YirTSjS0JKU0s4iMqRr82423YcCVbzHx9QabmkW0UgNbzQAHcutJWEVyc6
	mjjY+KIKUlqo9YQ7rBOXi3RVV6Hkqowp8FAUzbX3J4P087oGdqzd7B96kp3lxurOXKzsS7JW6ALCB
	80+I9PccRXnJBIp/ETdE2ZifR6KymCSvDP8PYr6sqAVx6B3qkhD/MAR9KR8qHpn5YeeR97zTQiXhH
	yuQOwhO8EKNiM4bTsf8687bhCEhHUZutqy0t3TOMwRimSs102mj92H6y/04EwMPvkCqWkX30s8VDL
	84QqWgrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqaKJ-00000006PHQ-01Nk;
	Tue, 17 Sep 2024 15:41:15 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqaKB-00000006PGk-1xGy
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 15:41:12 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1fc47abc040so45796125ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Sep 2024 08:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1726587666; x=1727192466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6cEhAcJt3HhcTHDpOxIvaAzXbYRd4H4Nq0SQeFTmVU=;
        b=Y9HaZOPn5fmB+5+s5Q4EJcAkf/63LBl4hG+P6HWDCZ9klySoaJ6YVrBIg7ZnR9brAt
         x49p7nB904FaDh6pDwxsLihyDNaY5OnPGyoxwqyYOvCPxsnCN6jlBmhfhMDGkstkV03Z
         tKyvJ8I51d5kaScPNfRoN1QjW2/lB9Wc5z2pzViPiO86w7PuopwXmmk6RZm23o9os+0Q
         yJahsvQUTN8Vd0djXqB4e6tSSdE8az1QmhhuMf9u75nsS2ePNeZce9JvH8bDILGyqpE6
         fh1j9tIxwgSCydSG438krVbwCKGT4sYHjQLtEhuO9glSEJMSCjF9xKizui34N8A2GSTr
         T68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726587666; x=1727192466;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6cEhAcJt3HhcTHDpOxIvaAzXbYRd4H4Nq0SQeFTmVU=;
        b=bBBAYimmtTw3EiKxLDUCpdAn2EOFm5GV92LKq6SJmcsQKflvzk5oWUo04GLfnd7f+1
         8sljDP1JFVzja0BysXf0anCoDedzIEoZBRQVD9Bsg8UsOKP0EeKfpco20ictgZUcQS8s
         L9YlE72fJfp0fNEGWsWRMum2pv/ZfCjtMQRqwz3s+FYcdb/lVd7c4c76w57Ko22fG1Vb
         BMspwqcqrDFnukqNwvqgJMCRsoh8AjnoVERe0g3zwaSJ1TmAgiJu6TjCZs65f60HdWl8
         q1NWZDGvlkAx51yitDIDrFWItjy2A51AZpzOHljbCeQ0BcdF7ZppKEeuYPQu0KpcuA/M
         OwUA==
X-Forwarded-Encrypted: i=1; AJvYcCUuRmIzKuS2Jxp0g9UKbarpDE/KYihvyHkBEmwgOmQsjkhhrnWo/QK5kd548QbDBx8bAlVqcOFHuzlqVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YylyEXiMOpAB1uGFZzbp2ASB54BREY13jfvYWhy6aBlVbsaWoT+
	eMbN0VFijMVIaXIEVNsvPaNjElcYob9laCYQxHse1QNld0s2Kx8uo/eRPZLGZ0o=
X-Google-Smtp-Source: AGHT+IH8BbHXUPz/AlzFd5EcNCywWECO/RcDJ1X5X6FPp6Pwu0T7DzZHVs7nzUw1h1hhW4jS6pFF3g==
X-Received: by 2002:a17:902:f547:b0:205:8407:631d with SMTP id d9443c01a7336-2076e3511c7mr238055635ad.13.1726587666169;
        Tue, 17 Sep 2024 08:41:06 -0700 (PDT)
Received: from localhost ([213.208.157.38])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2079473634esm51620645ad.262.2024.09.17.08.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 08:41:05 -0700 (PDT)
Date: Tue, 17 Sep 2024 08:41:05 -0700 (PDT)
X-Google-Original-Date: Tue, 17 Sep 2024 08:40:59 PDT (-0700)
Subject: Re: [PATCH v2 1/2] riscv: vdso: Prevent gcc from inserting calls to memset()
In-Reply-To: <20240705060902.113294-2-alexghiti@rivosinc.com>
CC: vladimir.isaev@syntacore.com, roman.artemev@syntacore.com, guoren@kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, alexghiti@rivosinc.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexghiti@rivosinc.com
Message-ID: <mhng-b17acfa9-03e8-4ef7-a24f-a133b2dbf31a@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_084107_818572_262A120C 
X-CRM114-Status: GOOD (  17.18  )
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

On Thu, 04 Jul 2024 23:09:01 PDT (-0700), alexghiti@rivosinc.com wrote:
> gcc is smart enough to insert a call to memset() in
> riscv_vdso_get_cpus(), which generates a dynamic relocation.
>
> So prevent gcc from doing that by using the
> -fno-tree-loop-distribute-patterns option.

This option doesn't exist on LLVM (at least on whatever version I'm 
using), and I'm not getting any memset()s generated locally so I'm not 
sure what to look for over there.

From poking around GCC it looks like we might want -fno-tree-ccp too?  
That seems to be able to convert assignments into builtins as well...

> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/kernel/vdso/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index f7ef8ad9b550..c7e40bf36371 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -18,6 +18,7 @@ obj-vdso = $(patsubst %, %.o, $(vdso-syms)) note.o
>
>  ccflags-y := -fno-stack-protector
>  ccflags-y += -DDISABLE_BRANCH_PROFILING
> +ccflags-y += -fno-tree-loop-distribute-patterns
>
>  ifneq ($(c-gettimeofday-y),)
>    CFLAGS_vgettimeofday.o += -fPIC -include $(c-gettimeofday-y)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
