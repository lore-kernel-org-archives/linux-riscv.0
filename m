Return-Path: <SRS0=fXqm=NY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EAF2C43610
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 01:52:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2C3E22360
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 01:52:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cUfBPzcl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="RaCphhxU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2C3E22360
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=QfEvRVQzW5F0+tB4MhUE05/f5/GjOuG3G65755xJiQI=; b=cUfBPzcl8qjYXqg4nYoGm8HW9
	Lds03fG4n2eh5kv7KPTkvwTU+AIoC4PQku23pc+A7D8W3xGTooeIw6VgoEIKAjI//qt9A0rkIwpJT
	sIf8s1jPANGNVnbQ0AmLGTDnzOdRHhAwUUyA3gjC/zwGKrXSGuBRl0QmIs9EjUVYznVe802HW+wJj
	UkkO6/msk/4ZUf3QTYtobJoueGNQTnj+X/6DSikWsSnUsgWyg2YdzumXJWqJWFDql6T2eRqxduZmr
	KDj6LOE3pNkaMlXmLiXFYJI7ZX7K1Rii8cqBPyj8UEFrYKLsinhLKvtUAnzBFOHHo6ZwQBwWfv6Ew
	V5zO9TR+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gMNsd-0001Lg-H3; Tue, 13 Nov 2018 01:52:39 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMNsa-0001Fa-Kh
 for linux-riscv@lists.infradead.org; Tue, 13 Nov 2018 01:52:37 +0000
Received: by mail-pf1-x442.google.com with SMTP id b81-v6so4698291pfe.11
 for <linux-riscv@lists.infradead.org>; Mon, 12 Nov 2018 17:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=2oSmhKmuYz22VsiIbL0Er1kOPvtZ16z8NsPX4MyzuSs=;
 b=RaCphhxUi1tjoWc4FuQQy0WBICkIfi8u0t1PWgfraQwhdaJKJUC42ySd/dE/yrqPBM
 adEjurjXSr62Ns3WVuUUAbO0BxKG6dDNBtqvhjXkKVdrjD9Px9LMNPXZkGLxcEC0mpNT
 zTqC9yBZlJJzUfaq84gTlxBUPQ5rIw7cUQXCcLTd4aogGyY2slA6XZO43KrmylvP6iLp
 qLAlZpNzyL/M1mWSmigeKdyyfOqghMqGSrDyHwMxokvfBeqjZNlpHs8Yfx/icv1X0wF6
 y73evpajyAV6ACbAj6vL3SZ+3g9qPFgGGCMjmkuO0nL1UCBKdIiJ4TbNsHpSsEjyoom/
 Ygnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=2oSmhKmuYz22VsiIbL0Er1kOPvtZ16z8NsPX4MyzuSs=;
 b=br6K0kLxjosKS1a49aCpbbUwS7ujRTv64MKQpvcrIpvXarnRMlovE/0pjUfvi5a7G3
 EKv6HI/+ZnxG2bvgXKwgq/6trNuKxtK3Ecx5icAoAKn+zGnWEydM5mEF3HOkB7zkUaQb
 gttw7k9YpH5NDlUcCqcf5imMi1lLgYBuqiHTiqEyzLG+mBbVKcOav6C1OF0+DctoXBJt
 OoOC3FOOMz+fRJuK9nlJIrRtyBGx/3Q5nKKsWthbV4+bD9CGxoOGCO2AIEbX5J0COMOX
 GWSEe2JkXDg1CCGfb+i4j2f7fj63IzampFNGv+kmXsLRKjUfx2Zo8qLQ9MKCXt2Z0apI
 yO2g==
X-Gm-Message-State: AGRZ1gJJeLS3BCuk36+0Xjx7hfFEtty88GV14s4Vu/IZ8x5Gy/NkzsIU
 dgOrYDYZ3lU+BJTwKh3+TsDjKw==
X-Google-Smtp-Source: AJdET5cq80jR0vlCEJExucld2HbSDNcPWHPMfYOIEvCIsPfi4J5EgTzmh+YhHpjeeYMfmtCvqkg7qw==
X-Received: by 2002:a63:f241:: with SMTP id d1mr2999087pgk.2.1542073945852;
 Mon, 12 Nov 2018 17:52:25 -0800 (PST)
Received: from localhost ([216.9.110.13])
 by smtp.gmail.com with ESMTPSA id 80-v6sm20941686pfv.154.2018.11.12.17.52.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Nov 2018 17:52:25 -0800 (PST)
Date: Mon, 12 Nov 2018 17:52:25 -0800 (PST)
X-Google-Original-Date: Mon, 12 Nov 2018 17:46:44 PST (-0800)
Subject: Re: [PATCH 0/2] riscv: add ARCH_HAS_SG_CHAIN to Kconfig
In-Reply-To: <20181030100107.4590-1-david.abdurachmanov@gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: david.abdurachmanov@gmail.com
Message-ID: <mhng-8aec482b-66bf-4190-8d73-e8c06bcac316@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181112_175236_673601_CD4FC81E 
X-CRM114-Status: GOOD (  13.36  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, david.abdurachmanov@gmail.com,
 linux-kernel@vger.kernel.org, green.hu@gmail.com,
 linux-riscv@lists.infradead.org, deanbo422@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181113015225.NeWrT8cL7sL3vvR6avGc1ldG79sjmlmDv76b06edyO4@z>

On Tue, 30 Oct 2018 03:01:05 PDT (-0700), david.abdurachmanov@gmail.com wrote:
> This should improve virtio-gpu support for riscv.
>
> David Abdurachmanov (2):
>   riscv: add ARCH_HAS_SG_CHAIN
>   doc: re-run features-refresh.sh
>
>  Documentation/features/io/sg-chain/arch-support.txt           | 4 ++--
>  .../features/locking/queued-spinlocks/arch-support.txt        | 2 +-
>  Documentation/features/perf/kprobes-event/arch-support.txt    | 2 +-
>  Documentation/features/vm/pte_special/arch-support.txt        | 2 +-
>  arch/riscv/Kconfig                                            | 1 +
>  5 files changed, 6 insertions(+), 5 deletions(-)

I'm not opposed to this, but I have no idea what it does or why it's in 
arch/*/Kconfig.  I've added the first patch to next-sg_chain, but I'm going to 
re-do the second one as it looks like it batches up a bunch of updates.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
