Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E6EC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 00:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wSFtGabz99m9HbXDm8rFP7ZMfof/l3uBYqGxCfw6bAE=; b=puJglimBVvIL7I
	EFpLe2KjP66GovUWBQkZS9YnWw0w+5tAaozb+9izBUxxapjdABpnibYOYkQJaM15/RV8kF51px0Zj
	6p86SvGTIojAWTdZpjutmBVIPneZvAo2y/YbraT+h7vj173H1OvrpfsbmzIZIJFyhQz51G58tUvMM
	pxpsDw/GUmO+87jDWf6msXtMPlcKUJUD5UP0yXh13kAHdYwFLMLRbngVj+400cbRExnkMKRD9EGM+
	YhpBvffIBdkUoZURy8ZipwVfE8MbczwCcz3JKhZeo6ABQCuUhvevRBgWdO/9P75UG0qOL4tR4hy1E
	r+2uRj5oR5Vv1c1uMIOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p89Ik-004sn9-UE; Thu, 22 Dec 2022 00:19:10 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p89Ii-004siz-2D
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 00:19:09 +0000
Received: by mail-pj1-x1033.google.com with SMTP id p4so254481pjk.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Dec 2022 16:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Io3Afroc8zFyKk/Hx34XQjyWndPNIt1uCFFePpDepyQ=;
        b=QbJfSkr09ebQmiSkPnF/l33Y6wWP4j4yd0ugpActN28xedWMn/qZFa7t8sAMUfNKVz
         6FtXWZqHYDZBUh2ieHI4Nm2iU4+ZuYfy5L6zi/6lvd6tZDOCfiVABqAlC6DiGPQ+KR8P
         lxDu71JRB8n3EaZVeU5OV6pAdpcbQECpK9l5l54anYWj/BdX/P2dXSK41RLzxvvD+fNl
         lBfTivpLdq9g5Rm5v4KACJVsR+7QQOPW1ZT9SKMv7Ihl7YC+r/N1weZ6PMSj/IOZILPS
         tEYAD3bhhUrSM88s8cIQ5YUApn3Xn6Rz1UJy6UmtOXut2VF+N5OqoytkSLlOvZ7kX4Zs
         MXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Io3Afroc8zFyKk/Hx34XQjyWndPNIt1uCFFePpDepyQ=;
        b=SJK+RAvZMWdYYMwd9nIbogX8/k4YgRaFuVg/4AVczdvsKEv6hBJWhnVFrMre7jxR/6
         do5ZpUvUe985gQdcPrVepkW74A+/UUEPX5/sYgMXpfZFoXRU3LyJg4BdnAsfuLsJhp9A
         9JrI0CF2YayKOXscvptU/UbOc6FT1O6viDYMv0+9jAY7onJQgTliPgT8FfAkar34R5eN
         TGQm3Sqwcnlhz7nKGSPG/fgp2T7tlwG5QkJG2n6a+RFrgM9ayeMEzX9TRw6/O6xaVjnX
         AgvzxREnURN4ynfVRBEFQ2RwMYn8w4elWtLgNJSuqhzXn7ZmL8tS7oFAXIVoyE4PFCbQ
         YiYg==
X-Gm-Message-State: AFqh2kpcFxMezKSNN86XqKJevz4xI1k57kX9N3m+KNRqnPy32Fl8fIWk
	QgMhNq9Qc8zoP4Nmkd9jwSQ=
X-Google-Smtp-Source: AMrXdXu/Qf48X8wXM9YBLEIbtcufrjby5XmXviCcNy7cB0FlXvOu/AUQd1BAFkEbGV+6T2TjH1FXhA==
X-Received: by 2002:a17:90a:dc12:b0:20d:bd62:97b0 with SMTP id i18-20020a17090adc1200b0020dbd6297b0mr4098101pjv.45.1671668344789;
        Wed, 21 Dec 2022 16:19:04 -0800 (PST)
Received: from mail.google.com ([103.135.102.144])
        by smtp.gmail.com with ESMTPSA id q2-20020a17090ad38200b00223ea04b3fdsm1934563pju.45.2022.12.21.16.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 16:19:03 -0800 (PST)
Date: Thu, 22 Dec 2022 08:19:02 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Guo Ren <guoren@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, palmer@dabbelt.com,
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	mhiramat@kernel.org, changbin.du@intel.com, zong.li@sifive.com,
	rostedt@goodmis.org, boqun.feng@gmail.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Changbin Du <changbin.du@gmail.com>
Subject: Re: [PATCH V2] riscv: patch: Fixup lockdep warning in stop_machine
Message-ID: <20221222001902.zcbwlvqaitvsfb33@mail.google.com>
References: <20221120101049.2078117-1-guoren@kernel.org>
 <Y3tPEDvM3aVJmVxF@wendy>
 <CAJF2gTS0FDgV3toa9wZxPhK2G+f4vCtrru7q3R4FXnMkxYmu-w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTS0FDgV3toa9wZxPhK2G+f4vCtrru7q3R4FXnMkxYmu-w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_161908_198332_3A315D75 
X-CRM114-Status: GOOD (  16.22  )
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

Hello,
Does this patch get merged into riscv tree now? This problem has been there for a long
time. (I suppose you have received my previous reponse.)

On Mon, Nov 21, 2022 at 07:09:45PM +0800, Guo Ren wrote:
> On Mon, Nov 21, 2022 at 6:13 PM Conor Dooley <conor.dooley@microchip.com> wrote:
> >
> > On Sun, Nov 20, 2022 at 05:10:49AM -0500, guoren@kernel.org wrote:
> > > From: Changbin Du <changbin.du@gmail.com>
> >
> > > Fixes: 0ff7c3b33127 ("riscv: Use text_mutex instead of patch_lock")
> > > Cc: Changbin Du <changbin.du@gmail.com>
> > > Co-developed-by: Guo Ren <guoren@kernel.org>
> > > Signed-off-by: Guo Ren <guoren@kernel.org>
> > > Cc: Zong Li <zong.li@sifive.com>
> > > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > > ---
> >
> > Hey Guo Ren,
> >
> > FYI you're missing a SoB from Chanbin on this patch. They gave one in
> > their v1 though so you should be able to re-use that?
> I'm waiting for his SoB. I don't think I could directly use his SoB in
> v1. I need him to confirm my rewritten commit log for lockdep
> analysis.
> 
> >
> > Thanks,
> > Conor.
> >
> > > Changes in v2:
> > >  - Rewrite commit log with lockdep explanation [Guo Ren]
> > >  - Rebase on v6.1 [Guo Ren]
> > >
> > > v1:
> > > https://lore.kernel.org/linux-riscv/20210417023532.354714-1-changbin.du@gmail.com/
> >
> 
> 
> -- 
> Best Regards
>  Guo Ren

-- 
Cheers,
Changbin Du

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
