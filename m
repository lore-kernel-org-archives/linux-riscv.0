Return-Path: <SRS0=z0PQ=CJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A90FC433E2
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2020 06:23:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDBB620738
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2020 06:23:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BDo39PnE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="bW3Lj8rP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDBB620738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FVF9hFCmdypqb/HIu21NOSaxtcdsAQookGfhFN1tPP4=; b=BDo39PnEyOKXVcJrqerlAAdR4
	9JjR3MucrnjOiH9up1rrBF8grKRsjyM9yhOUSaFik35EPA++SFUyAHgZOqzOCTPPqkkQW4kl0jtTi
	PWxMvuqI7v/LCCrhz5URu6Hr/4j3+DJHnlSS/OODpOLVbbDnjJUlpJmYvgSb4C8jtCoZr2PHbJ61o
	R4eCTW9iG3d8RPp6nYn4KdQxIaAPnrHyRx2wkmRAf8+gM8ZXd6w/wEfpuM+NSQq+Qsn4d1Hyn7DSP
	xuXWwPBZWtKss+4XJo6mrgmjXxX14SH+dF21qUNyuJzEe3sFBSik13BcS428B5CNHN1E3U3LVs1f5
	r8t0bSi4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCdDs-0004Lh-8z; Mon, 31 Aug 2020 06:23:20 +0000
Received: from mail-oo1-xc43.google.com ([2607:f8b0:4864:20::c43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCdDn-0004Ky-60
 for linux-riscv@lists.infradead.org; Mon, 31 Aug 2020 06:23:19 +0000
Received: by mail-oo1-xc43.google.com with SMTP id k13so883633oor.2
 for <linux-riscv@lists.infradead.org>; Sun, 30 Aug 2020 23:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FbJ5Hs8Go54qaX9o9nvt0zalvbQlaohZX3ktFtQIhJM=;
 b=bW3Lj8rPY+hgDSKzDnkZKzb2rzVSHvKAzvm/CUdjCUU1alxrKCmRILRRcMXNrKeQ4d
 q5KfMa2DaXOaUWi8IbZfJvVdi/fPxTGsL6DTFGxkhXkQWL02MVDQeQOfpnt/optrVk8A
 D0trqwu6j4z/Dg6VpPTMSV4lM3INHDGgfB3TKyN72M51PbRFchxXomFItvMaXI00RpgF
 fHm0eIBJWbJuWQu3JrRUWpL6+gRwZe1WbglizSDOll4XHwVHREUyAEDjQvQUpKuIy+8d
 2O5AKxB7eqQ2yiFVE3B3kuROaPRz+FOPHStlb75fOkANWQI/6MFCir8/caG2tUtk/bex
 1MAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FbJ5Hs8Go54qaX9o9nvt0zalvbQlaohZX3ktFtQIhJM=;
 b=BvEgMIAVD96KXMeQL/7xaUYkfrWBiLo4AWLqi7Gw6umRL5JPBxb5I/s0vakENscIKb
 1/bava6IuxQS5LWYd05HvjPXHudoXtDq9ansU8LHPRgzndr6uieaVyWrYljGw6AGyeoE
 ROU/lQECwsXdOagsNrVkQQhChKy4WTfidpzVWoucqb2zMqrJlFd0igL9QEJ15HeVsP4/
 G1ZMT78sb+n7BpP0R+1krkbkBBegHmbhfxtzapq2a3gjkjLX0MNIFy9+/zGlrKsJRPiJ
 N7JeFq+MvXU55FZWHvLl5XIcaWt372y6XSaKPf+ryhGaPF/jb8C2qPO2xoysKp/R6cGx
 gSMg==
X-Gm-Message-State: AOAM532Mvzi/vSnyIQHLx84o1HQaYg4jipsWO9VNd5L3zNU/nKHbIqnE
 d/XZKOSJTTbZXt9k6oeWRD8P3NnxnsJ7se1eZ6P2YA==
X-Google-Smtp-Source: ABdhPJyvSwceRQnFolO9a+Wkc3jWzFwQGFT+dAzvh8Jj1LUOLOC5Dp1WbUOgl+Gcntu5sqgfWij2gq0kShYLolnXcmU=
X-Received: by 2002:a4a:dc03:: with SMTP id p3mr6991429oov.63.1598854993144;
 Sun, 30 Aug 2020 23:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598598459.git.zong.li@sifive.com>
 <ee6a18d118b65cca0602e32bbb8be092f63ae8b6.1598598459.git.zong.li@sifive.com>
 <CAOJsxLHuX-nXFS6Dp+X=_hOrbT=-FUvWF_oM+6q508r=MNnFrQ@mail.gmail.com>
In-Reply-To: <CAOJsxLHuX-nXFS6Dp+X=_hOrbT=-FUvWF_oM+6q508r=MNnFrQ@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 31 Aug 2020 14:23:02 +0800
Message-ID: <CANXhq0paq5a3A02gg=UJFKgDO71jprPKSSpjued2DavNTJEn4A@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] riscv: Add cache information in AUX vector
To: Pekka Enberg <penberg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_022317_820598_38139307 
X-CRM114-Status: GOOD (  10.23  )
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
 Palmer Dabbelt <palmerdabbelt@google.com>, LKML <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Aug 30, 2020 at 4:01 PM Pekka Enberg <penberg@gmail.com> wrote:
>
> On Fri, Aug 28, 2020 at 10:09 AM Zong Li <zong.li@sifive.com> wrote:
> > +uintptr_t get_cache_geometry(u32 level, enum cache_type type)
> > +{
> > +       struct cacheinfo *this_leaf = get_cacheinfo(level, type);
> > +       uintptr_t ret = (this_leaf->ways_of_associativity << 16 |
> > +                        this_leaf->coherency_line_size);
>
> You are dereferencing "this_leaf" without checking if it's NULL here.
>

oh yeah, it should check the pointer first here. Fix it in the next
version, thanks.

> > +
> > +       return this_leaf ? ret : 0;
> > +}
>
> - Pekka

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
