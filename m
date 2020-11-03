Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E25C2D0A3
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 15:57:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56E2720870
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 15:57:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EH1Y6O8a";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="siZjn0R+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56E2720870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1zNwtZQVZn/hq6AXKE6NHO2HT5NtcCHPzf0Vq2b5NUM=; b=EH1Y6O8aw3S1kbYoR/VGFBKal
	wbDQTksFcbJoOJWbblQWlwERuZgzfqQEH02Sv614BnunGzjqzaQgigDsUxzBM+MnuCWwvsSxWz/1k
	VELOYGndzd8S/Y295qcg5qMCgd0M9q0q04M5yJXeVAe3AywXYiplzpT/6sUZiRr6f1fgWUbtMI1Mx
	eRTGO34ySM6jB29qPcXxc1CO8eSJbtNOWLR//KVvbYh3WwvUxy14481alo3Gyh+MqdxAvyyHyD5eh
	/h0gii22CqevuOchInK5UjClYpGF3TGdg774YjWBQu8s+rqAodrPJAWQa0rFcBeTWHbY+LOlcm+7y
	KTtONd8PA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZygI-0002hh-TU; Tue, 03 Nov 2020 15:57:10 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZygF-0002gS-Kz
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 15:57:08 +0000
Received: by mail-il1-x142.google.com with SMTP id p10so16551288ile.3
 for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2020 07:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RjPIB5IX6SvSQdZn6h80+1EUUn7BxPA0xL87IrfE9hk=;
 b=siZjn0R+rO6yH59qffOQczGiA2rsk6qia5gwjKf+4/udOcRlXLcnqyoPdRMUoIfxs3
 dNrhC6XgB3vSIy3rdooz1yQHfULEza8O7KSYd1EoG4oiFMnX48W7yIk8l+kaLDxP2N7z
 sdTeglckIm5WvAPEMnis+FI4GDzkduShceJr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RjPIB5IX6SvSQdZn6h80+1EUUn7BxPA0xL87IrfE9hk=;
 b=RldWwAt7L3n10ZxNXneRkB1dFZjWrJ4I7pmQjptLxOcnJ/7/u21eMwKNDL/MIkXACv
 HFD2BsOnlLxUSA21mMAlVL0a1z50bMgcjiJvcmjnANNivI1giXqrUP8pkTQCaw/cJjyg
 CzpC9ZrAez7zZf6YAFelL326/Po59bMuvWluXtasvmJbxs6QSvr9rIXOgbHWGpAtT0yo
 mjVmIcD44SF+o8VXWzPRDfC4+qvRePq/1pZGyg53OshwlBGusHUHAezZh6N4IA48uv8L
 6Cm27rd0G7tRdYkm+2aGUr9lhRlfsMMXwNYyOPJdf4xQ8LZDRdg5lIMDYShdS5o0tQ/E
 ecqg==
X-Gm-Message-State: AOAM532oMyzDLs614nDBsG6XEfG+cSJHpY1WMfCgEWw9HRyfGeIZ3FiA
 enQA5rAVSYS9vX/ovoABKlAd1dH5JEWuVZKatE1H
X-Google-Smtp-Source: ABdhPJxll79Gy/R/Rk38vMKnt7d0sbI+S72dqiMMqijrw60YTdaSA73hucO9kQTBy1UcXHZ/CT1ArqxtTPpYtY/zcNc=
X-Received: by 2002:a92:6410:: with SMTP id y16mr14467540ilb.126.1604419025462; 
 Tue, 03 Nov 2020 07:57:05 -0800 (PST)
MIME-Version: 1.0
References: <20201102040357.118400-1-wangkefeng.wang@huawei.com>
 <20201102040357.118400-3-wangkefeng.wang@huawei.com>
 <35efc7af-dd90-a1b5-b363-9dbb8d7ce4a8@huawei.com>
In-Reply-To: <35efc7af-dd90-a1b5-b363-9dbb8d7ce4a8@huawei.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 3 Nov 2020 07:56:54 -0800
Message-ID: <CAOnJCUKLqG-wZgGgUwaKM8OXaWjPikwVBQJ6DvNLMfLPNAeVGA@mail.gmail.com>
Subject: Re: [PATCH 3/3] riscv: Ignore all compressed Image formats
To: Kefeng Wang <wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_105707_730006_196F8B4A 
X-CRM114-Status: GOOD (  15.56  )
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
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Nov 1, 2020 at 11:27 PM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
>
> On 2020/11/2 12:03, Kefeng Wang wrote:
> > Do not track all compressed Image formats.
> should add all loader.* too, eg loader.bin,  will resend after all
> patches reviewed.
> >

But not loader.S & loader.lds.S

> > Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> > ---
> >   arch/riscv/boot/.gitignore | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/boot/.gitignore b/arch/riscv/boot/.gitignore
> > index 574c10f8ff68..2a31a61ca382 100644
> > --- a/arch/riscv/boot/.gitignore
> > +++ b/arch/riscv/boot/.gitignore
> > @@ -1,5 +1,5 @@
> >   # SPDX-License-Identifier: GPL-2.0-only
> >   Image
> > -Image.gz
> > +Image.*
> >   loader
> >   loader.lds
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
