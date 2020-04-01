Return-Path: <SRS0=xVjr=5R=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE250C43331
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2020 17:55:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D05320719
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2020 17:55:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UglrwQOm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+QypHgu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D05320719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VPhXKydbZTzb7I+C+zryLnD0ATKx+Di6aiNrDJCaDhA=; b=UglrwQOmPP7KMwmaJciuy5ylo
	G6YSfB9pvW7aPslGwHgPnNo9wWt8apkql4FAvMPyBqI5LNeLZtfldiHeWE+rnZdCfzh9Z9qVGFal2
	0wCVGTF2BGwtPryYH2meNYTtXXGj5KQeypOQ/91Pc2QsZCxNzCsGtiU8jvtk5ZtGrH6MBgPOvbwtE
	tdwT6PUgsNBjkgP2cpNkZ3Q5Yn93FJapq+Pfxr+xSX+Jo8C9xYtzKdF6vLthua4nJiKt4ErZ+3TZQ
	P+Q6YXzgKWXa9Ieoo0ROS+XgWjyqtVoRzZBUY0NBLuwBXOh/+yWGXi7oBRfmUjzUkiJKFRJhjoWgZ
	u+RUx1m7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJhaA-0001wt-7G; Wed, 01 Apr 2020 17:55:18 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJhZy-00083F-4Z
 for linux-riscv@lists.infradead.org; Wed, 01 Apr 2020 17:55:08 +0000
Received: by mail-lj1-x243.google.com with SMTP id f20so451786ljm.0
 for <linux-riscv@lists.infradead.org>; Wed, 01 Apr 2020 10:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VPhXKydbZTzb7I+C+zryLnD0ATKx+Di6aiNrDJCaDhA=;
 b=M+QypHguEJ+ZMo+VHGYpLGxawGiHDBkco/puBCZqqPu/zhtRhenLN2QEQy2+51iwhW
 FUa5RF9BfBttveXSab6JiAT4VD3oa6TF1usIdiMhbKEOQnmuoBz4j27NAZUPwhCtgB86
 iWG8hEWzyo5PFSuKDMJ1HXA2WUD31oURwofYZygB5KhGIsqh02SvUdYgeXNjoBI191Z+
 TsyVnng4v5FYsb9Y9u8B6UgUY+59ocfyabr5sW07sFX+73/kI3BmXlY2LqK/bACMUgrE
 U2gs8+sEBqY9PkpcEPt+h0iaa8OvAVaCcDrMeSFY1PlCNiGbCeW0Jegv5FfEHLJi75jj
 ZKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VPhXKydbZTzb7I+C+zryLnD0ATKx+Di6aiNrDJCaDhA=;
 b=sO9OLiVwfUBD/j7bdW5ryCnAXGCi5h0EOu9z5EKJBHYPbwSpVGI9Ju5pFDDBHNGcse
 0NYyf5Jl20zYUOUW77znBykb5NEqcdr0Y6FQXchvDmPPtveuofxwDPGNsp2aw67TaAx4
 BMuSVAD5Ym7LCXMlP25+2COtE7y/aP6f4QpYYOnrG9gSVVIuLB0C1sFQ5cSIDNK1Cj01
 eo3+6E2rqs4MQYeOnaIAKMcQadL8WZ3xX4KGSiZIJtZ/pScKEJW3PMxR3HyULXQDd/oX
 PFA6N2DI8gF++esgaEaT/npn2spjR4Q4DQBmku4xAaHRSYnqNmRYpZL0sNzck51zTCOy
 9lHg==
X-Gm-Message-State: AGi0PubzvJ1WHHCqOkOUfor1oHY0/wkS6lO8GQ92G3k+b2MJXSs+d+K+
 hrDyJa0e1tgCnHNZgYZAOxplosd7iSFHsKMJrdg=
X-Google-Smtp-Source: APiQypIpgms5ea8R9NiilNYlyp4N+c7045zV7nm6sgzoRVphN287Fch6MhCQurEOr65YijyBeyXpBR00mxUsZHWSeCI=
X-Received: by 2002:a2e:854e:: with SMTP id u14mr13089773ljj.182.1585763702432; 
 Wed, 01 Apr 2020 10:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <48e10b3d-12f3-a65c-8017-99c780c63040@gmail.com>
 <BYAPR04MB581671F46D3FE67FD3C8B2B7E7140@BYAPR04MB5816.namprd04.prod.outlook.com>
 <bd74c841-2447-2f11-f924-a501230b3927@gmail.com>
 <BYAPR04MB5816ED294439828E562EB085E7140@BYAPR04MB5816.namprd04.prod.outlook.com>
 <CADnnUqe3AbTStJg9LS4qupH-OnBDGjuEFbnX8EXW8MUr4kwoGQ@mail.gmail.com>
 <19e78a77-4b7f-a057-eb6e-7384f3fc67c1@gmail.com>
 <CADnnUqfSq5sNXMQLktU0R_XLvYrf00nqMG5UPkTwaeL-Cy1m_A@mail.gmail.com>
 <8108cb8e-a909-24b0-f1c4-24a5bebf4e65@gmail.com>
 <CADnnUqenadntSrngNGjnu40inxZWK1Nm3T64BnyY114hEwC_Og@mail.gmail.com>
 <20200219090612.7onbaoygy6waumnw@aurora.visucore.com>
 <20200222190731.27vulbrqj37obeq6@aurora.visucore.com>
In-Reply-To: <20200222190731.27vulbrqj37obeq6@aurora.visucore.com>
From: Drew Fustini <pdp7pdp7@gmail.com>
Date: Wed, 1 Apr 2020 19:55:31 +0200
Message-ID: <CAEf4M_BSCjAkUUWERP6ak7nzseqae0ZdWDA0_hY5wwhCfFFKFA@mail.gmail.com>
Subject: Re: [PATCH 08/10] riscv: Add Kendryte K210 device tree
To: "Wladimir J. van der Laan" <laanwj@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200401_105506_282995_8E7CCB21 
X-CRM114-Status: GOOD (  18.16  )
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
Cc: Carlos Eduardo de Paula <me@carlosedp.com>, Anup Patel <Anup.Patel@wdc.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, Sean Anderson <seanga2@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Feb 22, 2020 at 8:07 PM Wladimir J. van der Laan
<laanwj@gmail.com> wrote:
> > > > So the LCD connector is supposed to be for a ST7789V controller, but
> > > > there doesn't appear to be a driver in Linux for it. I don't have an
> > > > appropriate LCD screen, so I will not be able to write a driver.
> > > >
> > >
> > > Actually there is a driver and config DRM_PANEL_SITRONIX_ST7789V, in
> > > gpu/drm/panel/panel-sitronix-st7789v.c and also FB_TFT_ST7789V and
> > > CONFIG_FB_TFT_ST7789V with the driver a in
> > > staging/fbtft/fb_st7789v.c. Might be easier :)
> > >
> > > Weird that the Kendryte SDK refers to the LCD as NT35310
> > > (https://github.com/kendryte/kendryte-standalone-demo/tree/develop/lcd).
> >
> > I remember checking the datasheet for both a while ago and NT35310 and ST7789V
> > seem to be more or less compatible, with only register differences
> > for more obscure functionality.
>
> I just stumbled on this:
> https://forum.kendryte.com/topic/68/a-guide-to-adapt-kendryte-kd233-kpu-demo-to-sipeed-m1
> under "LCD Driver".
>
> So it looks like the K233 uses a nt35310, while Sipeed M1 uses st7789. This is
> a likely explanation for them mentioning both chips in the SDKs.

Hello all,

I have the Sipeed MAiX Go and was wondering if any has made anymore
progress with the LCD.

Is it reasonable to try to use a tinydrm driver to put basic
framebuffer on the LCD?

(so we could see the adorable Tux at boot, etc)

thanks,
drew

