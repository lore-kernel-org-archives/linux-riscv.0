Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADBBC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 11:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=36fD2Eeviz2eSEohAZkk6iY8C8Gn0szbi5eM/+zueTk=; b=ESBaDLBRLw5hx6
	lf6tFsoptqO9Q5CAnTaOViA/tE2yS4LIi8HBieNq57m2ZJzq7cl+I6xYFxJuUHooqdY0BR2a39hhX
	GUcLHzfh8DZWiroWRlnrdKN0XodIBqIn0KJJKBXurFrZEnSlLk9+GYTSFxLBe6FZDinIu5krBeeNK
	5VK2EDeozurMBD11ou+MnmhaqDJCmBcFNPcjl1goAlWvexYalO3teVxVRMoDHNb+2xVVk8WXoJc5n
	3Nqjs+4oVTT/d302zaU4Oro44Po+251IBr+qVawpsq4V5S4k7VppTqB5bvdCmaX87hn7S8a+gUQbd
	9GJsOkTf7YH2SywcWVCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox4im-00Cpzw-MT; Mon, 21 Nov 2022 11:12:16 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox4gc-00Con9-ON
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 11:10:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 01845CE116D
	for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 11:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A225AC43148
	for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 11:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669028998;
	bh=SrnoE2ZwKMFebu9vJWEZ+n28lkE0/B5i1gCPufLzeR4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UcjU7Cm1TKWDiiorJEj+aOA12ktOV1UNiOGeqrq6GCAxfFEr9NwuekUhbOTrRTdGm
	 UgU7HRT4Z5KXL/BQ1bHVABkwR1gjEWVSq6vmKwpcXeDMrNNZAvXM9D8CC562TUCRWW
	 tfuOtpOe2qi4Z+SaaosZKdeZxx3ikCj99w2y855LOry+DDYlsYebPc+LxKVpS970ds
	 Z28EfkrPlqQ9TCyaYesIi076ye2luMetISph/zcfPYfM85190shKwEyxJdXR9HZEej
	 iLEGr6u0/Qdc7WnU0EAcQl5QkdParo3YqJXAVumEg2wYl4BZGw38oJmq2PxG6wn9zG
	 8JxdoRG37mYlA==
Received: by mail-ej1-f42.google.com with SMTP id bj12so27585859ejb.13
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 03:09:58 -0800 (PST)
X-Gm-Message-State: ANoB5pnKW9g4C3kY+ZXmIidW3aNGdzXLqk7vTzyMcmr5sSbY4PnJPXym
	TfeffH5jn1c1qcHn3LweXf5UX9+yF73WQ+jllSg=
X-Google-Smtp-Source: AA0mqf7PWo/LXdMWM/qVMzfD6xXZltpTRX4XN8uDfabhE0uSKX3rmuH6/A0Wd1z0JVyxGzoC+SvQcoEZSyTztwNaEFI=
X-Received: by 2002:a17:906:6a8e:b0:78d:a136:7332 with SMTP id
 p14-20020a1709066a8e00b0078da1367332mr14856897ejr.355.1669028996847; Mon, 21
 Nov 2022 03:09:56 -0800 (PST)
MIME-Version: 1.0
References: <20221120101049.2078117-1-guoren@kernel.org> <Y3tPEDvM3aVJmVxF@wendy>
In-Reply-To: <Y3tPEDvM3aVJmVxF@wendy>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 21 Nov 2022 19:09:45 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS0FDgV3toa9wZxPhK2G+f4vCtrru7q3R4FXnMkxYmu-w@mail.gmail.com>
Message-ID: <CAJF2gTS0FDgV3toa9wZxPhK2G+f4vCtrru7q3R4FXnMkxYmu-w@mail.gmail.com>
Subject: Re: [PATCH V2] riscv: patch: Fixup lockdep warning in stop_machine
To: Conor Dooley <conor.dooley@microchip.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	mhiramat@kernel.org, changbin.du@intel.com, zong.li@sifive.com, 
	rostedt@goodmis.org, boqun.feng@gmail.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Changbin Du <changbin.du@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_031003_003081_726625A8 
X-CRM114-Status: GOOD (  15.53  )
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

On Mon, Nov 21, 2022 at 6:13 PM Conor Dooley <conor.dooley@microchip.com> wrote:
>
> On Sun, Nov 20, 2022 at 05:10:49AM -0500, guoren@kernel.org wrote:
> > From: Changbin Du <changbin.du@gmail.com>
>
> > Fixes: 0ff7c3b33127 ("riscv: Use text_mutex instead of patch_lock")
> > Cc: Changbin Du <changbin.du@gmail.com>
> > Co-developed-by: Guo Ren <guoren@kernel.org>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Cc: Zong Li <zong.li@sifive.com>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > ---
>
> Hey Guo Ren,
>
> FYI you're missing a SoB from Chanbin on this patch. They gave one in
> their v1 though so you should be able to re-use that?
I'm waiting for his SoB. I don't think I could directly use his SoB in
v1. I need him to confirm my rewritten commit log for lockdep
analysis.

>
> Thanks,
> Conor.
>
> > Changes in v2:
> >  - Rewrite commit log with lockdep explanation [Guo Ren]
> >  - Rebase on v6.1 [Guo Ren]
> >
> > v1:
> > https://lore.kernel.org/linux-riscv/20210417023532.354714-1-changbin.du@gmail.com/
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
