Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD48C282C4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 12:05:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3956E2075D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 12:05:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pHGHEsZI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="RZzZVIKv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3956E2075D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DbEHNpft9MnH7mWek7dg5Lgni0OT9JS0QIomSsQkkGc=; b=pHGHEsZINbd2VC
	eKP8Ze6nwMwbmDkG4WPP8BjBvg0Fy5ifKPmKzvDdjlMq9zghzAjZ06u9dmGJzh52xCCCK4mElup7M
	J8d3+KI2CAlj5tSlwBhmc/aa/xnDtSiM1gjVNrsmVfukFcXXWpsDh+0D7BOonc6RClughbgMsthmT
	BSWIkLJFmigM7/jcA/l+Hy10JS2qWyd60GKFPZmHRJroVMGbSqqLAGq1Sez1OJBN5ZuY+hF94ajgu
	QeFDsS7ETRwI+jcSJ5UvjWcw1p2B3E07v0LwSEz0ATs9SAj3t/NDDRQ0G/gD15eXY7Db+VfVC74/C
	FQgv1d72iuMuv2xZDDWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtWoy-0003pm-4Z; Tue, 12 Feb 2019 12:05:52 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtWov-0003or-FU
 for linux-riscv@lists.infradead.org; Tue, 12 Feb 2019 12:05:50 +0000
Received: by mail-wm1-x342.google.com with SMTP id r17so2627740wmh.5
 for <linux-riscv@lists.infradead.org>; Tue, 12 Feb 2019 04:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IcHEmmZgff9rH6vurQUWXdw/7vg+Ums9TMd+fjY7zHU=;
 b=RZzZVIKvpawTjPi44K80byEQQMIvdOQ/s4HtSUN7bf5Nkr4fr9LvJGkPedg7sk+oZi
 DYYSQas+4eAMFiT2JaqeJB+uBe15j3vnGHWW33g8ZKZ6GvwXlDEzlN+RtDIVjfCizsZu
 SMoBK+x2odVuxDOUyQUkKok+4f/sKhPhzckCYE3OQKd7Npaw0TKMrV7P6Uw3zuzp/30f
 BrTJ93MAHjO02e9Nm6Sg/IbZLRSABS+dcTX4xDIp8KDBoz20MTSmKUgGhYHlNXW1q4Jm
 VjMzE++bZ21M+v3xIjAXphVV3zQ+uVUYwNIn/SOq29b52gCP1wOtUbaQJ0PEWLpdgeho
 VEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IcHEmmZgff9rH6vurQUWXdw/7vg+Ums9TMd+fjY7zHU=;
 b=dBH6oGo053UHeWjo/Chi67vyvXBLv4o3vZhIEnUf5VAKrAdk0yofjDmO3/wALj3X8S
 MgAzdw2sqiKzOQBw1ijCPOP47uMd+f5wbN7+SjcS1BkXcNpuNt+EP9u7RHnaHagOTxCe
 pBWKvskFcxHNo4CpgGHiePr22DeVJE2boUqeQuaaRnEmCFLhEuY9VRBHT37XG1gDICOM
 2c7VtzxIHSSQHwjWVSLS17mXN6BI13/2XUs3hxYEhPDMBzmTDiblAtN8kCjH6rYBQ1bd
 Q8g4Dfux7ItQy91lyFjPQLdX66CXfkfm2s7i5HYt/61lzxL4yO1oi5Ys1+5oRDBHzX6B
 JQOQ==
X-Gm-Message-State: AHQUAua96MiidV25zVO6YZt3r2wF8xvvZuT5Ga2S6n5Sw5Y/LfNbMPHs
 VYqosPb+LhfRRmaEGcagqHaR6/5xvlfnbUnxZzcMpQ==
X-Google-Smtp-Source: AHgI3IbqfVuyPXUNL0LIGcN9Tr6PTyAPqGgDXffCCuQk2u1Nkc7xW05tzQoBHALyJZbbqXV8Searpd9tXKf6TBpW06I=
X-Received: by 2002:a1c:48f:: with SMTP id 137mr1892636wme.21.1549973144409;
 Tue, 12 Feb 2019 04:05:44 -0800 (PST)
MIME-Version: 1.0
References: <20190119055625.100054-1-anup@brainfault.org>
 <20190119055625.100054-3-anup@brainfault.org>
 <20190212070925.GE26747@infradead.org>
In-Reply-To: <20190212070925.GE26747@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 12 Feb 2019 17:35:32 +0530
Message-ID: <CAAhSdy310ninVL5PLHhqbv0-WSj9npjMzauQTiRvE-E==XT=Rg@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] irqchip: sifive-plic: Don't inline plic_toggle()
 and plic_irq_toggle()
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_040549_583686_6BB6F060 
X-CRM114-Status: GOOD (  10.24  )
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
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 12, 2019 at 12:39 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Sat, Jan 19, 2019 at 11:26:22AM +0530, Anup Patel wrote:
> > The plic_toggle() uses raw_spin_lock() and plic_irq_toggle has a
> > for loop so both these functions are not suitable for being inline
> > hence this patch removes the inline keyword.
>
> I still very much disagree.  Very strongly with the above rationale,
> but also (less strongly) with the decision not to inline here.

No issues. I will drop this patch since you "very much disagree".

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
