Return-Path: <SRS0=ovIN=HY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576A7C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Feb 2021 20:23:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD6A464E07
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Feb 2021 20:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD6A464E07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R55bCUlOFkc3unH4VbPnOOxNkklIcdYloh1eys2NWFM=; b=LIYVWOP2qYZrgQZJ3+aCK2eFG
	viE6391bK7QbY3a3IVnPWkf+cpmLxY8sbWNlSDphgsrBo8G/+eYBQdGSoSuem39V8+DgQt3kdS6fz
	NWYK5s9ZMXmtzjVw+S0j4PzCou2Zor5SRCtyv4wUaAGCEgewxd/dMLoenzc6878EN5T18+m96YONa
	EsNh0Xq1fK2lApfYEvSTxPCOHoL+V1rwgOm0B0ISwTG5SMrXQL7cniI56TyYI1s+3UsxoVZbgnYgN
	pRIm0v8cBuZuttbBQlL0PbdWsxsvPMcSqQ/picKWuLUnqJKh9UI6kvXgypaC6z3tNA9zJGV3qMoRW
	i2wpLIq2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEHjF-0007rF-5J; Mon, 22 Feb 2021 20:22:49 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEHjB-0007pf-DZ
 for linux-riscv@lists.infradead.org; Mon, 22 Feb 2021 20:22:46 +0000
Received: by mail-oi1-x234.google.com with SMTP id 12so12560161oij.6
 for <linux-riscv@lists.infradead.org>; Mon, 22 Feb 2021 12:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/zUxZgcnCvVVMkZxer/qPy4+yli90D8nt9Ux36SsgZs=;
 b=RWQBFkXyeMNOQjeD1Kc3RRJXVGMl+74YDUp15mHVrPVrFqPIzO5GHeGTQltOzbV63o
 ZIZwc381bzxr+hOfu7xK0ZpTJS+QEcA36DpQIJJp9zNGxH2jAJiHXyphz6abXKbbqAY9
 Ag9sTLSRayloTm2xtfgbS/Fumoq+OI5m0VCNwjDCkGwXvhpMdRiWX5hB2XTzZXgy+0Fo
 /WivJH383We+IVL4jo5lybgXDiVoEHGqQEjeYriyAy9JzIdTIi0RW0nRlBo/Pe2fZiNg
 E6AS+9QZ4kfxoL9LqQ5wec6FHBNp1/Ac8+9kYxnkBk/dvKL+esnye86WXfIA+xaD+N4J
 4aRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=/zUxZgcnCvVVMkZxer/qPy4+yli90D8nt9Ux36SsgZs=;
 b=mVLrvDSn5DIcWHvUXf87+lUFoCJ6NyME1qOPnKamVVxtlfJdgV+4VkTYyQsTPS13+Q
 T86L0CJUk9SA5kvQnr/igt9lEPwv1Cp3SBxV8OA0lInoQPKUf9gNY0GIVnuhIj7rpIMU
 0ELW9tcyXiYud1IJgTccD7zk5PxNKeEcKu4gxJSLW7ebmWYlrb4HhWqaQOwkeGMyBb0u
 3/PEESKHKrQNb8OY6EEWtpBEyTYrH82u33L+K79EQqorBp6B/JZQdxNTkdxId+ESBspG
 sEOyB4W57uKgFWEJ/rDV6Q9X4LLQefi1ckGzqZ/5gWlkxGx4eOmq36QbrGo2w8wY5uEt
 3YpA==
X-Gm-Message-State: AOAM530IhjtXyNa2VkYK2g2I72wRGcM6TVa6ZIGQ5AK7Z8LT0XKooyNM
 FgsevY8t+gZHr/zNGqnP7YM=
X-Google-Smtp-Source: ABdhPJyxynC/qUkfM9m2BbNUu+GDqexEdkig67h42a2PSQnnYl4vRIFk9jQHpyhBm0haU5y+2ztEUA==
X-Received: by 2002:aca:3507:: with SMTP id c7mr7877911oia.26.1614025363323;
 Mon, 22 Feb 2021 12:22:43 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id q132sm2393106oif.32.2021.02.22.12.22.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 22 Feb 2021 12:22:42 -0800 (PST)
Date: Mon, 22 Feb 2021 12:22:41 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH] RISC-V: Add a non-void return for sbi v02 functions
Message-ID: <20210222202241.GA82802@roeck-us.net>
References: <20210204052643.1608586-1-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204052643.1608586-1-atish.patra@wdc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_152245_590492_305CFB64 
X-CRM114-Status: GOOD (  15.29  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup.patel@wdc.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 03, 2021 at 09:26:43PM -0800, Atish Patra wrote:
> SBI v0.2 functions can return an error code from SBI implementation.
> We are already processing the SBI error code and coverts it to the Linux
> error code.
> 
> Propagate to the error code to the caller as well. As of now, kvm is the
> only user of these error codes.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
...
>  #else /* CONFIG_RISCV_SBI */
> -static inline void sbi_remote_fence_i(const unsigned long *hart_mask) {}
> +static inline int sbi_remote_fence_i(const unsigned long *hart_mask) {}

Error log:
In file included from arch/riscv/kernel/setup.c:29:
arch/riscv/include/asm/sbi.h: In function 'sbi_remote_fence_i':
arch/riscv/include/asm/sbi.h:150:1: error: no return statement in function returning non-void

Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
