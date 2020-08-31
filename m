Return-Path: <SRS0=z0PQ=CJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B0AC433E2
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2020 07:00:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BC662072D
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2020 07:00:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JQ6j0Gqo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+8263WA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BC662072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VoQnPp87U1kSCbN2k56PTgV1JGbN2G/pnx4qPgjt0Ss=; b=JQ6j0GqoXEVNMhvvmROkPTDN/
	UeHMnlJiI2xxKKWZn0+IuReHYAJBoN6NO1qqGKe960U9E8hIX2n0mslk+5LRglUfnOXnrmMkzF+nm
	MomsOcCK3eSKkwWFBI0U0WPSSW8Eh3ZCO+mQzh7XoJ7Gq4FxFcPS4X54txLnhseMjcHYaW2tAEuVq
	PFlrC5GMWdFEZk5NIi9CITWvQg6I541HbliT7FG91A7oWyJFhgmz6q6XAirlJkU7fjw7Kn82iUj6+
	7ERBCtj5bA+Jnfv1rpyTOwNf9kVVl9cAAnnAjtFrLSOxMcJpPvDRkmEN+gxJljg0y/+bKjKZvnffW
	P+/YxqLqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCdnz-0005uE-NC; Mon, 31 Aug 2020 07:00:39 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCdnw-0005sj-Hc
 for linux-riscv@lists.infradead.org; Mon, 31 Aug 2020 07:00:37 +0000
Received: by mail-ed1-x543.google.com with SMTP id l63so4380499edl.9
 for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2020 00:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7mp1wlP+yLNID1XAoJHzsrmrZXmS2a5Y+F074V8aUs8=;
 b=c+8263WAZSAa+mnQUymnZ5Ed/xslJmBQIkVyLWBNzPdMVDm1QLhDTL6GZ9Rly2uBAf
 h2C1sU16fiMYqh8Es0WgnCsgHXjdT+yZk9F1cvUlfg1O4nftt8EYKcPxIOQuHaNIB/n9
 Sn5iQTqdzEyLcyfv50jUp5ZO9hHyTFLqmn5IcVMZGUGuZEACcU6ZFgnze5OjW8dtgAPO
 AmQiyWeOgC8z4wl9wveTH7ES3qcrmSL+nk82Qn3H0SOZbuqVCGSX7ON0oLXgPrY4OomY
 45FekjyQta98eYdktPlxyxra3m1CDNzDoPO35KU3H+pD7g1pjFMt1Ay5ODtJsGDCqvKk
 qnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7mp1wlP+yLNID1XAoJHzsrmrZXmS2a5Y+F074V8aUs8=;
 b=UiQ8HMxODhsI/QbqDG6f47qlBj65vd0+QoBg3UIqitR0+qJ9Gin/tGb+RepoHlTuaj
 Ul5BEtek60WThgFZBdUA5f5E31VW04ZBm7hClwQsqPsw8rLa1OU3em/RVOgGuxrsXiQa
 yo12gL1MiT+ucx5a7BqcBbPrPSi8XILzJ/ZkKKUrvRWhoZsnPrG9VyUSgiuiepzk1YIb
 +hVZdpPdr/fSpH6DcRj1Br84L9dF3pqoJhdB36ndWV5K/FT9VQTEQBubIyyh94Xhi3EU
 rYXI+VLMGoAXC9nhIniisMyyqqkgPzUW8h790gNVh/MbIHb0i+TbshjSefuurriXFrTa
 icKg==
X-Gm-Message-State: AOAM530zWh+oaptp0z863y2z/J2mugg9HhrdT+bt9uTYSOO0IsZqdP9j
 8DcIbm70CMoj3vJV4Bho2nK22ATgJzj88vmm8ICn1ieS65Q=
X-Google-Smtp-Source: ABdhPJxa9Pe+DZMtyiPcubMEiscjLjno1TEmJY/7bsvBWAM24vdzfr8/NI4fn4I7njlkYuuyVMiFKLF+uBl1wQdUFDk=
X-Received: by 2002:aa7:d3c2:: with SMTP id o2mr10316061edr.11.1598857233478; 
 Mon, 31 Aug 2020 00:00:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598598459.git.zong.li@sifive.com>
 <3f1f693147f0b62f19f4a44b8e8ef3d5bde23352.1598598459.git.zong.li@sifive.com>
 <CAOJsxLHOvvt8WGQUynGkLxZCA4OQQ+KgxxJJD7s_iP8Pxf-Omg@mail.gmail.com>
 <CANXhq0r2jg_fVZJE0shquGc25QNgenL+Qq6HRUBXEYPSf=QcFQ@mail.gmail.com>
In-Reply-To: <CANXhq0r2jg_fVZJE0shquGc25QNgenL+Qq6HRUBXEYPSf=QcFQ@mail.gmail.com>
From: Pekka Enberg <penberg@gmail.com>
Date: Mon, 31 Aug 2020 10:00:17 +0300
Message-ID: <CAOJsxLF_+0eg6zU=CFwnN+pc75jF4aqvUqog5z18wfG4WOKoDQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] riscv: Set more data to cacheinfo
To: Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_030036_967866_7B07A9A9 
X-CRM114-Status: GOOD (  10.20  )
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
Cc: David Abdurachmanov <david.abdurachmanov@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, LKML <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, Aug 31, 2020 at 9:15 AM Zong Li <zong.li@sifive.com> wrote:
> If the sets is one, it means that the cache is fully associative, then
> we don't need to fill the ways number, just keep way number as zero,
> so here we want to find the fully associative case first and make the
> if expression fail at the beginning. We might also rewrite it as
> follow:

[snip]

Thanks for the explanation! The rewritten version is much easier to
read, at least to me.

- Pekka

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
