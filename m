Return-Path: <SRS0=zqna=AV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A64C433E5
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 17:30:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9111420725
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 17:30:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wfYii1hf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="BumlcOmR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9111420725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=3rsnHgSnDXdeooKCk+K2MmgDj/TIjlaVQz3fJprjFFE=; b=wfYii1hfNkLGZLI0ksCFhamPM
	s+vvbZ6Ady9vGoZu5dCqyFe4+olMJXswoJfR1ypc3sgc2F37tkgQ0Lj+tMbWmV0bS51cXe31T6aEP
	ehHOec+bg6oS22hhWrXnYsUH7EWwzepv9L2zjmBiBAXZ9zB847DS5/Ok2gaqPZFLIFmKSueG8BL1q
	V13gcpW1IoHeEsRb2FHWKrZx2ZhY/x04QkeLZlJZnJnLo7ca3F4HngUya4J5P8LjG2zV/xDjogyU/
	257mJOUp61LLF2JNM6q9geJS0sfPMLc+RNKkJz0mMGMzahyFQZpca6DHl6wblgKThR/t3GZwZcaGy
	YgPs2tKrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtwqw-0005UK-5L; Fri, 10 Jul 2020 17:30:26 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtwqt-0005Sk-40
 for linux-riscv@lists.infradead.org; Fri, 10 Jul 2020 17:30:23 +0000
Received: by mail-pl1-x644.google.com with SMTP id q17so2519027pls.9
 for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2020 10:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=NNOpX7zDJV4e6MqnpK0c1GKw6S05vm1dDD8qM9H4QAo=;
 b=BumlcOmRyWmV34V0WnslhAdIOlWLgH0M6des+BNHIMbocDgDL/sGvEV2F232x8Kez/
 txkLpRixttssRpjMpHHHLKlVjaxH4ADaQcwyS13x6TEb/7SkalWdmqb9fyASZ+11Ljg/
 WYsUOaZvojTJDC53BbPr6b1L0FykO7UoEjNrLiY22Aj47LE5SUB8MUk8U1FjOiKiVR8X
 rP45YEcqF4I5hE+JAB1wUGmRMmyN4LHcw2ILoPDj6mbAcFope0T5ttPMVQTYYM5Uo0ge
 uBQgV6WWgIQYjQbl0zGG9YmWmnv7ApKh60Jw2QHUbwEz+kbqL185pz4/qYbIFi9bZ7OD
 EU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=NNOpX7zDJV4e6MqnpK0c1GKw6S05vm1dDD8qM9H4QAo=;
 b=qQ4CAkX0BzCVbUWCmAjKVQco4osolZh70g8x0qkKVMrhJker5fe/MCZlocgeEXS1gT
 eyUmyoZ4aQkw6PvsA6GAakCFZDGcCTRHknfJi9dkH29l9ag2fiJCf8zBj4E6mARhfj/E
 0ssOL9vqK1feYi90nYwG+s/JbfWOcWkYNiJikhgAc2uRTo8CRLB/nywPvQv3zUHXvRAi
 GIJBPN18nyzNxMs2T8igHXQB35JDcEmnuO7ovi1TgiuCDjoDMjMOySXI+Pbo0MkCUOpD
 xff3ak56B9RVNeGiEmkJwTbmjXxb1JaNo0J2rNaFSOSbxthNJmH5SNA2Cknf1Gn4xBTy
 Wutg==
X-Gm-Message-State: AOAM53120/yWW/984+kn7A8kC0m3uL6u740sM501PI9mEEUvXt9lqvZM
 Qgr7TxJbaEw6hezCg9pEWNKOMQ==
X-Google-Smtp-Source: ABdhPJxSBaTuTeaxjBm4A5kHzDSTVrnLGZh3eB75FK+XRaeA3wzVkI7EZNAzLMTp7OVPZTe4x0fSBA==
X-Received: by 2002:a17:902:9683:: with SMTP id
 n3mr36897652plp.65.1594402220938; 
 Fri, 10 Jul 2020 10:30:20 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id s6sm6192968pfd.20.2020.07.10.10.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 10:30:20 -0700 (PDT)
Date: Fri, 10 Jul 2020 10:30:20 -0700 (PDT)
X-Google-Original-Date: Fri, 10 Jul 2020 10:30:10 PDT (-0700)
Subject: Re: [PATCH v2 0/2] riscv: Add context tracker suppor
In-Reply-To: <cover.1592989082.git.greentime.hu@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: greentime.hu@sifive.com
Message-ID: <mhng-39d66393-b510-4b88-a0a7-93075d014531@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_133023_202127_4ED8864F 
X-CRM114-Status: GOOD (  13.85  )
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
Cc: guoren@linux.alibaba.com, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, Paul Walmsley <paul.walmsley@sifive.com>,
 greentime.hu@sifive.com, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 24 Jun 2020 02:03:14 PDT (-0700), greentime.hu@sifive.com wrote:
> This patchset adds support for irq_work via self IPI and context tracking.
> It is tested in qemu-system-riscv64 and SiFive HiFive Unleashed board based
> on v5.8-rc2.
>
> ---
> Changes in v2
>  - Fix the compiling warning
>
> Greentime Hu (2):
>   riscv: Support irq_work via self IPIs
>   riscv: Enable context tracking
>
>  arch/riscv/Kconfig                |  1 +
>  arch/riscv/include/asm/irq_work.h | 10 ++++++++++
>  arch/riscv/kernel/entry.S         | 23 +++++++++++++++++++++++
>  arch/riscv/kernel/smp.c           | 15 +++++++++++++++
>  4 files changed, 49 insertions(+)
>  create mode 100644 arch/riscv/include/asm/irq_work.h

These are on for-next, with some merge conflicts fixed up.  Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
