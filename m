Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AD9C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 06:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LGwr6I5ewk1gr0i+wP7QHGcwvV5vF1OR7TSOizcpe9E=; b=Jt4JBazBPz8ACG
	G4yjWUK2IBOnQ103SRi/iEEdnlFlhNEWqb5CJlQrJKCxeXrR/op/GMeRhqzfie6RTmvb8YreiuzRT
	hIoz7ru5fsZk9t6/+yO3qINiiWx2te3FUWeRsKOZSnqIWYzut1LuG/PJjXgoRQpyEcXd/VIFXtPH7
	/OGYBFXFpKTTb/UljqW/oBBNJq/lkSwkSguYhTTR4Pygit1nyuhmKNIJjJ2tWjNfevb0+wMxKX6Oh
	iZCztsTKyscwiUD2SNYMMi1Ntq+HEI7VuZ3ETaXkWoSaR6D4MVMKdxSXVyNc+BhOV0Hv5PvPoKa2g
	AWATCMovoPJwHhgEVG+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHHTP-0000000BGTn-307j;
	Wed, 12 Jun 2024 06:28:43 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHHTM-0000000BGSm-2zlu
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 06:28:42 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a6f1cf00b3aso87985066b.0
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jun 2024 23:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718173717; x=1718778517; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9oHRS/6fbMlz5Nc/pRAypu+9kB8YgLFrFHMqAN2klms=;
        b=mrzVUIZFRgKl37gglxtsAZ1S/1lJugvaX+on8TomN89yuoxo5PXED0fKr+mj6yH9Oc
         5V/mjDcTweuDBVSHhKphWgK37YSUQ5qCXeKoNUTcrByK0oHHCUBptc0jN+8yLQtok1T/
         7NyFUVauATNtfF20fcVcl/lcqaf9lgtIPctIWmZQ6N/MMH+nIckl0cWdNC+9e7LVRbuw
         M6yJuy3qUmVDpLWZL+A5ui9Nz6Yb3hi51q0xhUwqOuYHxQJDg8MPkmjhWRXnetovl+xK
         9XrJHoxrR5XPp0yb9uaQ0CUfoVj2Zp3kF1DPA3Ud1qM/kzx7jLgCfua2hKG8uXlhYEMH
         hnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718173717; x=1718778517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9oHRS/6fbMlz5Nc/pRAypu+9kB8YgLFrFHMqAN2klms=;
        b=SgVyEZhmKublkxwvPn5f0S0555TmS7g24RlFbLpRswumDuSv2yj6FpBCRNn/LX0TMm
         iBboVH6aM4dayFVEsb9UUiV31qj94NFJ7BwKwojpiNxBICh6SOTdn92ZrGuys3Q38B9f
         sfnNLtPyhQBturyWA+E6A7bUSZsD64b3NM6o5AcuszoNsMEt8KNccVs5gkHQVV/y4RYV
         q+cmfeDqF6SAx+g+KhUyzycgrB9PAkrQxL1DY6SFQAOcPQMjcXx5IpiLUg467dBlDPBO
         JtdIrJJqtqevm5FkxZ96lrz40ZSwgSdY9XFTkh+E2u93QJNYvgdqbpv6zvGhPhn2a2s7
         RZlQ==
X-Gm-Message-State: AOJu0YxJrXhJUjMGWHe6Dol6psCXW1FOPwxIOac+KKfQwws345nyj/C3
	gJ45phmhxnWNj9eYHibvjj3Q5mtWUV78lvvc1tBCLsPNulcFLWzI
X-Google-Smtp-Source: AGHT+IGI/oqkZwMwyUVDqo4ctemWaeIxP1af1zQk55eXFO/5r1OGyyJu7z6VsLk4Uj0wqWwkVg9X2g==
X-Received: by 2002:a17:906:689a:b0:a6f:4232:4370 with SMTP id a640c23a62f3a-a6f42324412mr120440366b.5.1718173716367;
        Tue, 11 Jun 2024 23:28:36 -0700 (PDT)
Received: from andrea ([151.76.32.59])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f1c99d8f1sm384201566b.175.2024.06.11.23.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 23:28:36 -0700 (PDT)
Date: Wed, 12 Jun 2024 08:28:31 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Li Zetao <lizetao1@huawei.com>
Cc: linux-riscv@lists.infradead.org, dvyukov@google.com,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	linux-kernel@vger.kernel.org,
	Patrick O'Neill <patrick@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: riscv: link error when supporting KCSAN
Message-ID: <ZmlADwdvCHCNqg6E@andrea>
References: <c740ef8f-1bb4-0c4a-4b88-77dab19f3e31@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c740ef8f-1bb4-0c4a-4b88-77dab19f3e31@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_232840_778962_BF88B206 
X-CRM114-Status: GOOD (  12.85  )
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

On Wed, Jun 12, 2024 at 11:02:32AM +0800, Li Zetao wrote:
> Hi all,
> 
> I'm developing support for KCSAN on riscv but getting the following link
> error:
> 
> riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L996':
> core.c:(.text+0x2b62): undefined reference to `__atomic_exchange_1'
> riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1015':
> core.c:(.text+0x2c40): undefined reference to `__atomic_fetch_add_1'
> riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1034':
> core.c:(.text+0x2d1e): undefined reference to `__atomic_fetch_sub_1'
> riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1053':
> core.c:(.text+0x2dfc): undefined reference to `__atomic_fetch_and_1'
> riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1071':
> core.c:(.text+0x2eda): undefined reference to `__atomic_fetch_or_1'
> riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1090':
> core.c:(.text+0x2fb8): undefined reference to `__atomic_fetch_xor_1'
> riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1109':
> core.c:(.text+0x3096): undefined reference to `__atomic_fetch_nand_1'
> riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1128':
> core.c:(.text+0x3182): undefined reference to `__atomic_compare_exchange_1'
> riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1147':
> core.c:(.text+0x3274): undefined reference to `__atomic_compare_exchange_1'
> riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1166':
> core.c:(.text+0x3366): undefined reference to `__atomic_compare_exchange_1'
> riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1220':
> core.c:(.text+0x35ec): undefined reference to `__atomic_exchange_2'
> riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1239':
> core.c:(.text+0x36ce): undefined reference to `__atomic_fetch_add_2'
> riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1258':
> core.c:(.text+0x37b0): undefined reference to `__atomic_fetch_sub_2'
> riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1277':
> core.c:(.text+0x3892): undefined reference to `__atomic_fetch_and_2'
> riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1296':
> core.c:(.text+0x3974): undefined reference to `__atomic_fetch_or_2'
> riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1315':
> core.c:(.text+0x3a56): undefined reference to `__atomic_fetch_xor_2'
> riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1334':
> core.c:(.text+0x3b38): undefined reference to `__atomic_fetch_nand_2'
> riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1353':
> core.c:(.text+0x3c28): undefined reference to `__atomic_compare_exchange_2'
> riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1372':
> core.c:(.text+0x3d1e): undefined reference to `__atomic_compare_exchange_2'
> riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1391':
> core.c:(.text+0x3e14): undefined reference to `__atomic_compare_exchange_2'
> make[2]: *** [scripts/Makefile.vmlinux:34: vmlinux] Error 1
> make[1]: *** [/home/l00517538/PrIntFuzz/third_party/linux/Makefile:1171:
> vmlinux] Error 2
> 
> The reason for the error is that riscv only supports 32-bit or 64-bit atomic
> operations.As far as I know, this error is solved through the
> no-outline-atomics option on arm64. How can I solve this problem on riscv?

IIRC, support for inline subword atomic ops has been added to riscv/gcc
with

  https://gcc.gnu.org/pipermail/gcc-patches/2023-April/616807.html

(-minline-atomics becoming the default behavior with the above changes).

It appears as if your compiler does not include these changes and might
have to be upgraded?

+ Patrick and Palmer, FYI.

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
