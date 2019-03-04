Return-Path: <SRS0=iqkr=RH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F26AC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2019 19:31:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B87A206BA
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2019 19:31:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TEDl4LQO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="dhM+5EvK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B87A206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=ed0cSVFdx/PjhBEZFxDhEYKSwzICWd+3GQokEbH/VNE=; b=TEDl4LQO9ehIKGgTHy8FIXpdm
	EBG+iF0afb0yflJNAm9gumKFS0j5L+qvzjC7Z5O8ewJlYwRp+YRkO7yAIHccEunQ2o120NHDf8TFU
	xwU6dSvH0VbFbhceIbyJQcRwgHdUWaD6IgDZ4SRN41Fd45OYUwp/FZAX3/qCoBg6w6RPemU2/MwZM
	3E7KhvA0Ulzf/555tP/ha2aNOArrCOz5RZyf5wWTihRjXDtR5bN5AAbo4Ys09lIIR05CbWquap/u1
	OQ+55vSsiqFJMzHjkgdwUTpCGSCNyLUY6Hp94+Fr0iMu8R7/uuCYGKWvcNeygncgC5O7+Zk7ZtscR
	Fu3vxpAEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0tJ1-0005Oi-IW; Mon, 04 Mar 2019 19:31:19 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0tIy-0005OO-Mq
 for linux-riscv@lists.infradead.org; Mon, 04 Mar 2019 19:31:18 +0000
Received: by mail-pf1-x441.google.com with SMTP id i19so3736477pfd.0
 for <linux-riscv@lists.infradead.org>; Mon, 04 Mar 2019 11:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=oz6fsptATACjIgbQf4ElRoieNFmuYm2PdTyWZtrBp6U=;
 b=dhM+5EvKkVVtBKCoM2hfXbwqGGuSYDsK9fO40dSwg7QXhJxgju2SiheXM0gDQwV8Ta
 E6c0AGgAtfwmThF6QTupCgjTV0Tpd9vBWtsHqboLilMYgygUYPeb9CXerop7NRpZS5od
 uwMcqBeRL3pPM5QeRHq/yhLnnQltpPmJ2yslBwjGlrjTdiuWl1odO1dAwBYW03+m1Pak
 WazylwcCzJ2ZTYSAGDl3NSRyL/tZAVAvzAP6tEA4tToXz2BGfFxV2Vo2osXAM4cPUtVj
 ogrZ0qPpBNhxMyY8Ruqu9PSgyJL7bBuZ4w+5V2URFXlz4yawS5Nn6a9/lZTyySC64dS9
 2Z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=oz6fsptATACjIgbQf4ElRoieNFmuYm2PdTyWZtrBp6U=;
 b=TZF6EWcbiyzgy/Iqw/PT0jw7sz4oROkM5uignokv+gV8kdkkw7ITYODFj/kDyv986+
 heGGyz96zCNxZ83VUWtVQ+iE5oYm7bYd3cwl1e5j5MVGaMeYtky6Rn6Vfz80hCdf+aQJ
 SddbEYK1ZcjxAY6KXmPmwsRKQstifoiGD0Q/cngV1E+rw7jHi9oQZAsomp1/0z7j4usF
 +HhKeE9KYWm5r3RyeCLLvQ1eMifV6U/FqQc/R9N6W90CopKH9mOhTC9SsNVKQZXXuxqp
 4w9oOWx5/AlwbLJzRFu1H5P/QqSvP69oc48DQ9KhXqvr6p6fK6LTrVN1EvnTIzoFdTeZ
 Hnpg==
X-Gm-Message-State: APjAAAXRqpjHhZWWmwc8kllwEaL8y4N3VpE2y8ditgUFFqFhhaHdLXLB
 DZHuU7GQaQgVr+ADa7cEmkr5miREV7s=
X-Google-Smtp-Source: APXvYqxHZOnQPoDZeKyTSG7Zfg+p6WI3qjykcki8bn8i4/ZIblLb1HTzeGGrhig3X2T8S73b7OUq1w==
X-Received: by 2002:a17:902:e486:: with SMTP id
 cj6mr21802649plb.86.1551727875856; 
 Mon, 04 Mar 2019 11:31:15 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id x23sm21986591pfe.0.2019.03.04.11.31.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Mar 2019 11:31:15 -0800 (PST)
Date: Mon, 04 Mar 2019 11:31:15 -0800 (PST)
X-Google-Original-Date: Mon, 04 Mar 2019 11:31:06 PST (-0800)
Subject: Re: [GIT PULL] Fixmap support and MM cleanups
In-Reply-To: <20190214082606.23268-1-anup.patel@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-af9b888c-c585-4598-a59f-1255441ba3fb@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_113116_750901_93646B61 
X-CRM114-Status: GOOD (  13.72  )
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
Cc: linux-riscv@lists.infradead.org, Anup Patel <Anup.Patel@wdc.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 14 Feb 2019 00:26:33 PST (-0800), Anup Patel wrote:
> The following changes since commit d13937116f1e82bf508a6325111b322c30c85eb9:
>
>   Linux 5.0-rc6 (2019-02-10 14:42:20 -0800)
>
> are available in the Git repository at:
>
>   https://github.com/avpatel/linux.git tags/riscv-fixmap-for-palmer-linux-5.0-rc6
>
> for you to fetch changes up to 49f4f73f51bed5b840ea4f944cfb7f4fbc78a86a:
>
>   RISC-V: Free-up initrd in free_initrd_mem() (2019-02-14 13:32:25 +0530)
>
> ----------------------------------------------------------------
> This tag contains RISC-V fixmap patches.
>
> ----------------------------------------------------------------
> Anup Patel (5):
>       RISC-V: Setup init_mm before parse_early_param()
>       RISC-V: Move setup_bootmem() to mm/init.c
>       RISC-V: Move setup_vm() to mm/init.c
>       RISC-V: Implement compile-time fixed mappings
>       RISC-V: Free-up initrd in free_initrd_mem()
>
>  arch/riscv/Kconfig               |   3 +
>  arch/riscv/include/asm/fixmap.h  |  44 +++++++++++
>  arch/riscv/include/asm/pgtable.h |   1 +
>  arch/riscv/kernel/setup.c        | 130 +-------------------------------
>  arch/riscv/mm/init.c             | 156 ++++++++++++++++++++++++++++++++++++++-
>  5 files changed, 207 insertions(+), 127 deletions(-)
>  create mode 100644 arch/riscv/include/asm/fixmap.h

I can't seem to find this tag.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
