Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E79C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 19 May 2022 18:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QUvrZ/56uRa5OLi2D84nh6LrbmPC27pl2p701Dtlx38=; b=q4TVnKU39gUYNJ
	RYVcOwxhrdd4YiI57guSKlWE/qCRa7dbEoqS4+CnMXbImq5nsTpiidu+xRIAcJSLN360zXGuy5sxo
	y5NfkFwYFneYIPR9MdVhHKvr7csudmqvA/a349S5ea//P40jMLWUDo0vy4qNaEyPLJmQ9yqkwC1gX
	szH1LpcttIKm06degl7SKYT3eghHP/26oqf2d0louVfhqP2Z+lHE3QDdG2L9YMLNPf8BxAkdhS4wR
	K5VXKAegYi6TnAbUPxTmUmv0R62+r2k1omBr2iiF071Vty952UA02fmMczyBg2ZivqA8bZeJ2Zy8B
	60iySlO6+ZVvNS7S2YaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrkcK-008oW5-LU; Thu, 19 May 2022 18:11:20 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrkc8-008oSz-Ob; Thu, 19 May 2022 18:11:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C2AB6B8277E;
 Thu, 19 May 2022 18:11:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FB1C34114;
 Thu, 19 May 2022 18:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652983865;
 bh=qfrsVSac5p7s4s3/tao5faBYDdKOQTeF9rcknBTAI6s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=n5xa3krTyCU/0LFHvaxl9nV72wSAN+wptxohSNu1LJGjOf3eBWJQXM29fe8CWWt9/
 8/iEsYee40+jrC2083NGxEDv72DIHUPaZaU4MDrXgGAw6uK/lCd1O6Ui9NJtKq8ri0
 l8/5lLS4127Dz6GeUaNclEZtLLhn0q3N54eBfxuE4l8T7qyIvIiqtudmyGTqPbcXC4
 CwoNkPgHoCr961+/V+m261Xj+DwDjGO9/NviZlQ3iI/iqxxvzmci/tNkwADe6xQYG0
 kRK92Gz0z2/9oGeobimhLWUSwaZb7/JU+Nv8dDYp4brmBzv1zQgU//uZTg0SFWa48B
 XfRJmKVuJM0iQ==
Received: by mail-ed1-f52.google.com with SMTP id en5so7999647edb.1;
 Thu, 19 May 2022 11:11:05 -0700 (PDT)
X-Gm-Message-State: AOAM53132HYGQNY2m9nh+nn1j2pf2z6bahMCbhSvSBFGlzjsduoX9NuS
 V3pM0hYwifdFH2sNb/TSCJ8H5dJQUn70gv+QQw==
X-Google-Smtp-Source: ABdhPJxhP1Wba2opQ/Qs/q0Ub3BI7HdxkNRvDPWLuPYkNRluZEnIc5Y6vMACPPBUzeTAGTwweZnHRj217yThqyWAB3k=
X-Received: by 2002:a05:6402:5388:b0:42a:ba77:7669 with SMTP id
 ew8-20020a056402538800b0042aba777669mr6676016edb.89.1652983863801; Thu, 19
 May 2022 11:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220518093325.2070336-1-sudeep.holla@arm.com>
 <20220518093325.2070336-9-sudeep.holla@arm.com>
In-Reply-To: <20220518093325.2070336-9-sudeep.holla@arm.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 19 May 2022 13:10:51 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKig8U4hQEtHW8ct1Pd0a29ZtoTp1HuWQv389yb+SuW_A@mail.gmail.com>
Message-ID: <CAL_JsqKig8U4hQEtHW8ct1Pd0a29ZtoTp1HuWQv389yb+SuW_A@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] arch_topology: Add support to build llc_sibling on
 DT platforms
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Atish Patra <atishp@atishpatra.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@rivosinc.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Qing Wang <wangqing@vivo.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_111108_979649_17FA3809 
X-CRM114-Status: GOOD (  16.13  )
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

On Wed, May 18, 2022 at 4:34 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> ACPI PPTT provides cache identifiers and especially the last level cache
> identifier is used in obtaining last level cache siblings amongst CPUs.
>
> While we have the cpu map representing all the CPUs sharing last level
> cache in the cacheinfo driver, it is populated quite late in the boot
> while the information is needed to build scheduler domains quite early.

Late is because it's a device_initcall() rather than late in the cpu
hotplug state machine, right? The late aspect is for sysfs presumably,
but I think we could decouple that. Do all the firmware cache parsing
early and then populate the sysfs parts later. It's not a unique
problem as the DT unflattening and init code has to do the same thing.
I'd assume the hotplug and cpu sysfs devices have to deal with the
same thing.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
