Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978B0C433E1
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 07:13:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 627232070E
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 07:13:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WLsQ7Bib";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NybH1tGV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 627232070E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w7sNyOQQlUo5QyN0u2vQWchxXIJ2Y5Ojz6LXZCsPbK8=; b=WLsQ7BibV517hkO2Dm4UZEYUr
	iUmR+5GyD2uXtK6WMxKPdVyODjs6pTnSG17tjnKdgezqrdhW864ggl7OgLdiO/ySIevs9j/bUydMx
	x/lJwpopLk0o/aCM8ClEVUjMXfj/xgPOrm10soBP86+jHE6MbiiSmUFo7zoDjxD2f2dkbdSaV3BGV
	tfUEdMlVSUcXeGzL4Jk/vbVmXN/TxKtSNhOmRm4TsbPps55CjKWxdeYARDP9OfL6/JkZIzGv5fPGg
	qXizdwSO2b3hLp6GzK/qdi6fvw4q2vQ3HZRuFl4e6yfnFMWYmSSCrps+Cys/kwbFHfIpPVkCQdzWQ
	Z51e1Zdng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvy5X-0005jg-OS; Thu, 16 Jul 2020 07:13:51 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvy5W-0005jL-Gt
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 07:13:51 +0000
Received: by mail-qk1-x741.google.com with SMTP id l6so4614988qkc.6
 for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2020 00:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zs7Gt4Eki014d88NMjqfrKZvUy4DLds4tQXu4hWnuKk=;
 b=NybH1tGVVKFf52NpJtonWtmx9Ghwj5V3m9qc/kA3NZvKVcjzT44e7AUAaEy3IFlCnA
 UHxMGWaXx+JcfyBceYg4xCzNylxgzNmN1wNgEuXZwOqKRd+UY89DaCNkEbL7kln4/JMv
 RjE4esZa+kgTY3689+NMRU9KFX90c18GJX1oyly8WmLRvDlno656Mo/cq9sFLSZEwxpc
 ROaMxTKI31bgVxquQsGTnNzw0DC8r9PrVJNjYPmYL58bO/D+BPcrh3B0Af/1TnIG/8fZ
 Kk6vZZr/Z64Pn6RekoSzgDYNqc2XhOHdHyysRZ88ARQuxHXM8ANh59PFo+5nA3IKF5x0
 s/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zs7Gt4Eki014d88NMjqfrKZvUy4DLds4tQXu4hWnuKk=;
 b=WyiiAxLc3UHIhW/vuma7aOFOFGkA69zNSlWRQ141Y7W6dHVg6EXI1xMNVur+hu9QML
 TBFSU7+VeLjbc2OJhKz6AqjsXajH/v+plnHP5SQcZrbyMa5FFf5eYKKbqGCoJUO8ZBYE
 0hm1ySyWduzSOqg5PKOwcTTV2sbINlpKV0MeX4jzujR5sggUYDRaU+O67KKo8zIt0A5C
 RF9kPVUb3z7ykqLu+VD0iCUJxmG4C6ECWEvNY2wrT6ma/PPEGAGiLiZXtvPQLAAK6gcl
 mLHaRJlbh40uZx1lxcsgI7UX5uR2WUGt2PFqDrcNeMIiE47BjCfexgSQl/9YGxydwAxD
 kxdw==
X-Gm-Message-State: AOAM531gzVCp81Y2ubx7G2q56ly8hKCI6Y/R7UyfxIWLWQzY+qxaYCnX
 Ng238eRxlJIOyoAXXLJU6wcqyCq0SgD6OcMtTjE=
X-Google-Smtp-Source: ABdhPJz/RGyY7dKIjxqHpS5FW02kHlOUUab894JANmN0pOvxbCQzDnvIpC8zgWRfIas5E721z9IpZNqFD/FCcGBYGXE=
X-Received: by 2002:a37:a68a:: with SMTP id p132mr2689649qke.184.1594883629102; 
 Thu, 16 Jul 2020 00:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1594880014.git.zong.li@sifive.com>
 <28365b581b04d0237e127363a63c1ad72dbea683.1594880014.git.zong.li@sifive.com>
 <CAOJsxLGHNd1DcStOALkQkcg8u25zj8Hpf0uF1kMj+uO127q+yQ@mail.gmail.com>
In-Reply-To: <CAOJsxLGHNd1DcStOALkQkcg8u25zj8Hpf0uF1kMj+uO127q+yQ@mail.gmail.com>
From: Pekka Enberg <penberg@gmail.com>
Date: Thu, 16 Jul 2020 10:13:32 +0300
Message-ID: <CAOJsxLGfKzGfmA6kGds=n54SORq_=E+SgCoOPzMcsBJnVFeZRw@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: fix build warning of mm/pageattr
To: Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_031350_615140_19EC827C 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, LKML <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jul 16, 2020 at 10:11 AM Pekka Enberg <penberg@gmail.com> wrote:
>
> On Thu, Jul 16, 2020 at 9:16 AM Zong Li <zong.li@sifive.com> wrote:
> >
> > Add hearder for missing prototype. Also, static keyword should be at
> > beginning of declaration.
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
>
> Which prototype is missing?

Aah, never mind, you mention them in the cover letter. I think patch
description would be a better place to ensure they end up in git logs.

For both patches:

Reviewed-by: Pekka Enberg <penberg@kernel.org>

- Pekka

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
