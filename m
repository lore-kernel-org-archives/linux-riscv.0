Return-Path: <SRS0=iP4V=U3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01546C4321A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2019 10:39:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C959020656
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2019 10:39:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hgL4JpTn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WohVFiPO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C959020656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SD376dFKLmeiXkfZ8P2p6v3V3akpZYuDwwIKm+LD3Ug=; b=hgL4JpTn8n7RdK
	b3M4VMh+CeZTmi0wcW+Za5e8a1Rt4lxFEWObj5aJxoAawQdv0gEvuMVxGxT9p08zx9ukS/O95CM14
	uFiR1Rj0sMB+yyKQ5PW/tKMkUVO2ySGP/yf1RkqLJ9XZ8hcvA0/Jxi6jpxj3v6p3Bubj90pyqilod
	RFMVEI3qecMak7Sl7zS+Q5f6DsCBifjyY+undsmQG9PjjeVSiJX64eVYZKQIjXkEMoxPX07kwQnT/
	thQXZJP7+Cz70FrZXYlWrRbX4ESbkPKzjKbN+9HCvMR6B3i3+FiSWsZJj5+If73T6nFnQ9fU6dzVj
	UzRKseqHnxRSS92aSN5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgoHg-0008VF-6I; Fri, 28 Jun 2019 10:39:12 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgoHd-0008Uf-4Y
 for linux-riscv@lists.infradead.org; Fri, 28 Jun 2019 10:39:10 +0000
Received: by mail-pl1-x643.google.com with SMTP id w24so3031258plp.2
 for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2019 03:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tgEqF2bnqWy2Fsid2GbtembDhw1JV0xgyOOPqrD49iA=;
 b=WohVFiPOWbQrq06+VKfup+u/q0zo61/bGNSSoYMJnEmBDSq5u+O0aOCJe79YTV8HIZ
 HJmPyAQi2kG+0GNlZxl3Xk5IEh6wtxjFKMYytDnyo6fV+fRCLCO2OgU0ws/rmmEPCSif
 1DXfg9oht+acP12H4VE837vUT+93u4aLpmpnUiOWWo8leQqS4tUy0X0ytVT7NEUBGkGe
 FoAOZGhKMHPxxciSgxgTjx/i8J5GXB92H2MSp4trQXqjzJ/rEVhnJH+wmcRJ4t5PLwpF
 Kxbv5hiVhFLY8qgU2Q5K96MkjsDNTRaJ72sJkgjNsqYGhvijvYz71mnrNyuMxvaRub1H
 oHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tgEqF2bnqWy2Fsid2GbtembDhw1JV0xgyOOPqrD49iA=;
 b=PeygUneez43vvn15fsKRvn8cH49BWic98ymkM9M53zWES1oZyuI+8pBa6M5efBvCwn
 GpMupdRVml1a+j1Bur5cNhNE6LShE5E0Usve/TA/gOB9Aev5ukzaTyweI/0LZxrk2mfM
 H/b+ZSI6np6SP+IY+bqddUeik889RP9EGeD0CCAOqwtEjtAi6WtUnNcJLmCAlhWftwWg
 WgEvW7G7fds/LSVE+8aLETcRu9z3dfe7s0atVfkhIoXjAqN4ARanc+Q1UtY7TLqE9vch
 jrZAbx8hVQaUXwsNzOtiOgaUm9EGCMXvRKyrzODgFCgTHAT9H2YOnXAApHOmYUugppwN
 UrJw==
X-Gm-Message-State: APjAAAXrVHpBwRBks7a+IfdcVzjQDWrAdCczz5rKHbUbEQoSIGQP/dth
 33N/um8958XDHsM1SnJ3tKaingqMSa3x3wneFU8=
X-Google-Smtp-Source: APXvYqx67h3vkPt+CadlOmEKzGJa7HGxOvBHMcU3OZWTIGAbLg0a2w4BSzB7X3ZtVom9teo4lVlke7ylwJ79pHYNtnQ=
X-Received: by 2002:a17:902:8207:: with SMTP id
 x7mr10753634pln.63.1561718347083; 
 Fri, 28 Jun 2019 03:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAHOvCC7EtFcYQDAQoenP7RdwW-4FQEex4FG5jLR2W0m+Q8t__Q@mail.gmail.com>
 <20190523095214.GD23850@rapoport-lnx>
 <CAHOvCC72URVWs8RswjqeewKn0rnoik2OespWkt+d+RNhdTHOAg@mail.gmail.com>
 <alpine.DEB.2.21.9999.1906272304180.3867@viisi.sifive.com>
 <20190628061138.GB9834@infradead.org>
 <CAAhSdy21+qPp5NGrAsxEV_pzA65qe4ER=rQZfz2RNQrs6piG5Q@mail.gmail.com>
In-Reply-To: <CAAhSdy21+qPp5NGrAsxEV_pzA65qe4ER=rQZfz2RNQrs6piG5Q@mail.gmail.com>
From: JaeJoon Jung <rgbi3307@gmail.com>
Date: Fri, 28 Jun 2019 19:38:55 +0900
Message-ID: <CAHOvCC6LR2ApbUECqUB0aEKTCJh=0ubku0zXkpdjTMXERcOWeQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: using page table index in setup_vm()
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190628_033909_206769_11CBC43F 
X-CRM114-Status: GOOD (  10.95  )
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
Cc: Christoph Hellwig <hch@infradead.org>, linux-riscv@lists.infradead.org,
 Mike Rapoport <rppt@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Yes, it does conflict with Anups bigger rework of the area.
I'd like that my patch belong to Anups.
Thanks Christoph and Anup for checking.
Regards,
JaeJoon Jung

On Fri, 28 Jun 2019 at 17:11, Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, Jun 28, 2019 at 11:41 AM Christoph Hellwig <hch@infradead.org> wrote:
> >
> > On Thu, Jun 27, 2019 at 11:04:56PM -0700, Paul Walmsley wrote:
> > > Hi
> > >
> > > On Thu, 23 May 2019, JaeJoon Jung wrote:
> > >
> > > > Thanks for your professional advice.
> > > > I'd like to take your appropriate suggestion.
> > >
> > > Are you planning to repost this patch with the new patch description?
> >
> > Note that this is going to confict with Anups bigger rework of the
> > area.
>
> Yes, it does conflict. Thanks for catching.
>
> Refer,
> https://patchwork.kernel.org/patch/10980791/
>
> Regards,
> Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
