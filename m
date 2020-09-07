Return-Path: <SRS0=+z5f=CQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F3CC43461
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 14:59:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9C57207DE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 14:59:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2fLvVcGu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9C57207DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0NTFQl5b2QeORYgVDZ1Q9aE26SoTgo3mLQfPWbcPo1Y=; b=2fLvVcGu6ZDo+1dX9yIaUXEVI
	A8jto4kOadGYLBctm6Dalg6E1MQSzAqVGdC/EjyPa9DvrnZJE2phu/C8Snd0w+DUwOFtZoNIvOjJj
	Ynw4jPnnyb36a88rWUIycpySzbjcgqQro2ghwlh5HTds8JnCNCJoAbiMmisli8H01vdBId85WZZLm
	EwPFmHgnhsz+R6wl6s3ZGaIlOUo3wLqxso2cUVTgkXDPqi635x1oOklp1LREHLW91aA39Nnka93g3
	r6cLP9en2RIe0x2REw1ulFGy/2zx9UEwMG6Epf1cs7AD9R6zVixShpYSgh3CW7gXw/78bsVTVvgAc
	iYdAks1GQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFIcB-0002zF-MT; Mon, 07 Sep 2020 14:59:27 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFIc9-0002yl-2v
 for linux-riscv@lists.infradead.org; Mon, 07 Sep 2020 14:59:26 +0000
Received: from mail-qv1-f47.google.com ([209.85.219.47]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MS4ab-1k8NeY185T-00TSpg for <linux-riscv@lists.infradead.org>; Mon, 07
 Sep 2020 16:59:17 +0200
Received: by mail-qv1-f47.google.com with SMTP id b13so6480990qvl.2
 for <linux-riscv@lists.infradead.org>; Mon, 07 Sep 2020 07:59:14 -0700 (PDT)
X-Gm-Message-State: AOAM532PQTQndUOLpYS+zqgHVEMa0OzrUU2ra9F1/Krlbhx4VecoU+EC
 8M9VV/Up/+s7JGtv0PjOnwWQo4RmQHNYZ7gRv7Q=
X-Google-Smtp-Source: ABdhPJxK1PtMWzEME0I00NTfpJLnk7HuwRPMEDH7xtuIg967ceNyZJazvdlwZ8DAo/8dECMPk3V86IWyRilTpXPzPg8=
X-Received: by 2002:a0c:e892:: with SMTP id b18mr18804075qvo.4.1599490753860; 
 Mon, 07 Sep 2020 07:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200904165216.1799796-1-hch@lst.de>
 <CAK8P3a3t8a0gD2HsoPsMi7whtNb7BdzPN6-oo6ABnqkbQJoBfA@mail.gmail.com>
 <20200905071735.GB13228@lst.de>
 <CAK8P3a3BN-Afy4Gj+mGjxiKODUBZwjh+XRbXqQKV-uEhyhOTfA@mail.gmail.com>
 <20200907060356.GA18655@lst.de>
In-Reply-To: <20200907060356.GA18655@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 7 Sep 2020 16:58:57 +0200
X-Gmail-Original-Message-ID: <CAK8P3a22X84VVX=WwrQoqgThuhs55P9z+rYoG=kzbJCmJLJb8Q@mail.gmail.com>
Message-ID: <CAK8P3a22X84VVX=WwrQoqgThuhs55P9z+rYoG=kzbJCmJLJb8Q@mail.gmail.com>
Subject: Re: remove set_fs for riscv
To: Christoph Hellwig <hch@lst.de>
X-Provags-ID: V03:K1:C9g5yIQTGF4y/uvFgygq8AfUBHim+sjkixHUgqcDfPWiTvOqv2Z
 Is/Er11wQ9dbZ6ErmnM9yYvyUeAEfKdd23/YH7rZNAKRx7iQr7ARA+JdTMKtfWRQ32+UlXc
 2hz02oJiKd4tM+TqnWPzeD1O5E/7gPIHlexW0HxEz1gQb6lEqMYgztlXdsShdbYwyMVxkT9
 7GOgIzODXuwJ48ts0QPdQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rwOGFJmmirw=:TdLYGP1KaP8JK54QAtGRNt
 tAiIzuCPkdHu/QGGnX0r6xPjfhCzuc+g3f0xaZaiYmlo9iwREXCuuzThk/k1N8Tuwnl+31KHp
 ku59I8P+eVoPsSvUuxFkYG8m8TdPQM+u9cEJ+JlAW0S2u0p6GDRY8ylBBtkE7r6ozQ4S5SUsi
 v337bGkiPI8it5vt/wTpuAHT4U1RuTGUMZx2Co8Dzbq9y+dM/RPEM1u+TQZlOm6BHeh2MKVH4
 AShrbEYSXHA7jq/WlecPdOvsmH9X2HBvNNtNMwOFsFhhdGGn1lvYY1YcHpCFZD+NwMKKDnjNw
 DQnx42PihHvwd6kHR7P+gDuOVqHv7CnIT/9muhF37HFUl0Q6jLQPtk2VMMD9bjwjs2XxWIm8R
 pqqQIceUH+ApLNDTlvGkL9QFLZYnDTalVLfMUKTCIiBThRPj138R6ZqVUxDbOPlQqbgFmVVNa
 rdt636DNGbknaj2dIsgh7aBFbx6hwMDgjPSLA3AG53S9nxC68WC59l/aaP9BIA/GReHS5/HUH
 VQ5glf4KKzuWcHck/t3W58KO3sCj9TT7yBCKsIuZI51uJuW0preiXs+asO749zIUq63XbS+JK
 sqV8KGIFn28AFORF9vQD4FOEu2rmEYKXR+H3khjsVAa+dNvSJBqgHTalssePbF2CQj5RTXVXu
 BZqT9ISTN6jIJsanRoPTJBPoJFEldnVVL23Qw9wdddtagVwHky4TZXQ4trZrHt7UNXqdk9nHL
 JNPxcqQFtYgijBI5Hw81zIsBtk1hFULVflP1O6vlFxLZrkySnHP6QJhYkhebu4VKhnF5uXSRg
 +bjliIRbz36jlr70NzwBeMQGTuXMRhGVupdEuoLH8I9n+/qhIoY26K7z4Qx4UCS2JINjgO/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_105925_353574_840A6C9C 
X-CRM114-Status: GOOD (  22.13  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Russell King <rmk@arm.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Sep 7, 2020 at 8:03 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Sep 07, 2020 at 12:14:59AM +0200, Arnd Bergmann wrote:
> > I've had a first pass at this now, see
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=arm-kill-set_fs
> >
> > There are a couple of things in there that ended up uglier than I was
> > hoping for, and it's completely untested beyond compilation. Is this
> > roughly what you had in mind? I can do some testing then and post
> > it to the Arm mailing list.
>
> Looks sensible.  The OABI hacks a are a little ugly, but so would be
> every other alternative.

Ok, thanks for taking a look. I've now managed to run the patched
kernel with OABI user space and tested the modified syscalls with
LTP. The 0-day bot found a regression that I have fixed.

I'll send out the series for review next.

> Note that you don't need to add a TASK_SIZE_MAX definition to arm if you
> base it on my series as that provides a default one.

I've rebased on that patch now and taken out those definitions.

> I also think with these changes arm/nommu should be able to use
> UACCESS_MEMCPY.

Probably yes, but I'd leave the current version for now. The Arm
implementation already supports combinations of range check
and domain settings, with the NOMMU targets using neither, but
sharing the same implementation as the others.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
