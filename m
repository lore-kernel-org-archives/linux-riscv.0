Return-Path: <SRS0=t+eB=NN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39934C32789
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 15:12:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 099752081F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 15:12:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WnDHU0Vq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZlehDFIH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 099752081F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hT8FOZmdZnCRfZj2KihUSbi2VbpqcawTMBFGOTvL7B4=; b=WnDHU0VqiFR4oP
	hHgGjAZZ2XN8CFGLiAppsaK1LzO4dGq4C4gyjuMeLWU1r5+NRL2VZJEFxyPv65Lwlk354vTaOXqU5
	P5DbSIb1hW2OzVAv4I+Y5swOjVHXJ5dYvhXC8tP9qpNzpXLjVgohk9s+oqURhJJS+zQgh4qdNOVZJ
	0Clz1nvIV6o2hoWqHuQqABSE7iDL+jPkcoOO0sAAzvJytwZvbVNxnAheXMvvYmppEWSdCRgeiUYZG
	n1ryvMV7gB5fGmoAJIM72JiSVc46a3p3lAInR5L/MDXyiHdnCDZJGLQq8GUNNE6LI04ff5ks8F/Ci
	bGOjrDZYyo7orE0fQdcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIb7F-0007qV-De; Fri, 02 Nov 2018 15:12:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIb7C-0007pT-EI
 for linux-riscv@lists.infradead.org; Fri, 02 Nov 2018 15:12:03 +0000
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 87DA820843
 for <linux-riscv@lists.infradead.org>; Fri,  2 Nov 2018 15:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1541171511;
 bh=PLLSRBxH2duP2huVUvic9ejnCt3PIwq3FNbz6pgJQ3Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZlehDFIH8S2yYSB2/oNyahRURIlvrwtQ8QmSaCIwCY/OptqQTCvV4MnjkrWPl64ki
 C/ympURNIinqkFlZnc1XlGUDtNRajnrf177t+03/Y1dOhs9dnietaVWwUgjTLFIucB
 cpbusQ2DV1ZSaf/U4w4PfDOYhgg4I004AYZ9m93s=
Received: by mail-qk1-f177.google.com with SMTP id r71so3509778qkr.10
 for <linux-riscv@lists.infradead.org>; Fri, 02 Nov 2018 08:11:51 -0700 (PDT)
X-Gm-Message-State: AGRZ1gIM+gTR3gRn2rhAVQWPZZvwyFeJuvQzM6XoFlUufBaz06YpSn1J
 g3LiJLme069CTUbJta5M3seae3cYgUfqnokgpQ==
X-Google-Smtp-Source: AJdET5cHO66c+SibzTkdcLkUK2Rl45VKgMq3pyIv10odKE7UWpDnLDk280BNDSRHKFYg91/7QBFTk9NpdE7J+gujPKU=
X-Received: by 2002:a0c:e2ca:: with SMTP id t10mr11100001qvl.77.1541171510679; 
 Fri, 02 Nov 2018 08:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
 <1541113468-22097-2-git-send-email-atish.patra@wdc.com>
 <CAL_Jsq+wProNynprMjQnrz1jmbZT9TmmA-_=vPUxCEED_8xONg@mail.gmail.com>
 <20181102133100.GA13130@e107155-lin>
In-Reply-To: <20181102133100.GA13130@e107155-lin>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 2 Nov 2018 10:11:38 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLO+cOcHkr41ebPtONwrzOWGhksH1ypph+tihsuOVDOug@mail.gmail.com>
Message-ID:
 <CAL_JsqLO+cOcHkr41ebPtONwrzOWGhksH1ypph+tihsuOVDOug@mail.gmail.com>
Subject: Re: [RFC 1/2] dt-bindings: topology: Add RISC-V cpu topology.
To: Sudeep Holla <sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181102_081202_498177_D4DA1C99 
X-CRM114-Status: GOOD (  15.02  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Damien.LeMoal@wdc.com, alankao@andestech.com, Zong Li <zong@andestech.com>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181102151138.9YM7WlbjhLgFf2nJmKgIXnCd4f877fCLd73vdxGg3BA@z>

On Fri, Nov 2, 2018 at 8:31 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Fri, Nov 02, 2018 at 08:09:39AM -0500, Rob Herring wrote:
> > On Thu, Nov 1, 2018 at 6:04 PM Atish Patra <atish.patra@wdc.com> wrote:
> > >
> > > Define a RISC-V cpu topology. This is based on cpu-map in ARM world.
> > > But it doesn't need a separate thread node for defining SMT systems.
> > > Multiple cpu phandle properties can be parsed to identify the sibling
> > > hardware threads. Moreover, we do not have cluster concept in RISC-V.
> > > So package is a better word choice than cluster for RISC-V.
> >
> > There was a proposal to add package info for ARM recently. Not sure
> > what happened to that, but we don't need 2 different ways.
> >
>
> We still need that, I can brush it up and post what Lorenzo had previously
> proposed[1]. We want to keep both DT and ACPI CPU topology story aligned.

Frankly, I don't care what the ACPI story is. I care whether each cpu
arch does its own thing in DT or not. If a package prop works for
RISC-V folks and that happens to align with ACPI, then okay. Though I
tend to prefer a package represented as a node rather than a property
as I think that's more consistent.

Any comments on the thread aspect (whether it has ever been used)?
Though I think thread as a node level is more consistent with each
topology level being a node (same with package).

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
