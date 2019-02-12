Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E44C282C4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 13:54:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA3E220821
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 13:54:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gp6VE/nQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="zJPZlLLa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA3E220821
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yUQMm+Iy1P6LdG6KvXClVb6clh773UctjSA2XAPoNDs=; b=gp6VE/nQ6r2cEu
	9uuYzfxqD5wdjw8yom5rtLV7ewU+/QPB8MfPgdD9tGe8RqQQzMoAIJRl+a/GvKds4Zpr95/otXFwQ
	stj5CZTHPHmcqJqTmXwhWCgtSXynYW7BK0ak5O/QnECYqh42G+gSFkMYN0ONxi3XcVHNre1XsGSUz
	WKbkBJplPnmseoQ77Z0TXgu5VvbfbRayUxMO1ihmOdmU0Yd4PcN4Nxmikfr6LZsdtI2vdv8BlyLlZ
	ehR9eyFGE8pcCQaqJ3o1hDGh+bYWFr45U3vIx5wYuwFCNhYCcyCUbXahrdcIVTLLK18m3MtZcaGhJ
	/ehE3+0DU1SZcGPhWOTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtYW3-0007s1-Mz; Tue, 12 Feb 2019 13:54:27 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtYVU-0007Md-G9
 for linux-riscv@lists.infradead.org; Tue, 12 Feb 2019 13:54:13 +0000
Received: by mail-wr1-x441.google.com with SMTP id v13so2777165wrw.5
 for <linux-riscv@lists.infradead.org>; Tue, 12 Feb 2019 05:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2fAzFVaNm7OJtS5aDroeiESsjP1l4vLR7UJTSAfYUsA=;
 b=zJPZlLLaMODyPsEg/eBjo/Vii4eMNcOD3Fu3Umiq1CtLl5wxAVK9pyqOZU0F6m1psg
 K500LEfpe6V/z/LduD2d6uNvrrQpHhaD+0nYc956H8Ytmt9pch5sLEvcgdnE63IssVrv
 xHq50a7mH02L8NKmzymb4oRuMoAjp0lQ3pxVwKDkJ0vp4L+7t1lmwC3d2ogQr+u7Pomz
 NWusYl53YBPbDdnenX9vV+iCOR2pk8tVg0KdB7uhMe7QXBin9PfrUzIudiwc6P84zgnw
 a+/5Q4MzD0SuMB7LauExYSxy5++e6wcG5NjauLbguy7hbjxMfoetKQXz3/xz8iAiEbQe
 vDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2fAzFVaNm7OJtS5aDroeiESsjP1l4vLR7UJTSAfYUsA=;
 b=HCuecabnq4o1SNjl6ajym72JJdwN6vHFZWQ1b0cXp3D5qfj3d+Duj58CyL7sMMClPb
 YoIOW9nLu+loo3SzJF0DY+cdJse2zlI96OmBTQF1JCWxL4EDqXQ0C0IAUSj+66SLKezL
 kup/2YOAqYXHW6vJpXynOTJ1ojVuNY4IPSC86u6nJ0uCoxq2n2YBNnPPIDgPkANpf3Vx
 O0ob01uo7llREimK6MAlZUV2ffZgUci1vaI9QFb5AIrOM+AcnKUxtSDJBaj+HcfOjosh
 vEYYShf0HEJpDAtjACbNAgJR8a4s2LWVPiW301xXuHqAtxSwW9p+pg3cnPqN5yGInfUP
 5DmA==
X-Gm-Message-State: AHQUAubExDhGFLl4xP6BIzjPi318x3e4wXvx8VbGFgPLgOYZyG7staRT
 JjKna4DvK3FCbGo7r3D5ejDbJMfewist1I1tmHTHZ/XkWFg=
X-Google-Smtp-Source: AHgI3IbTH16QcO2a10MwGokFzCSFdNHeCd6CBG1hv3XZiS2O1Gv9fxdStdAG0QRSQ+ZyqeYu7Ecno6DokKozGAB514Q=
X-Received: by 2002:adf:ee07:: with SMTP id y7mr3083043wrn.187.1549979630360; 
 Tue, 12 Feb 2019 05:53:50 -0800 (PST)
MIME-Version: 1.0
References: <20190119132650.9978-1-anup.patel@wdc.com>
 <20190119132650.9978-7-anup.patel@wdc.com>
 <20190212070807.GD26747@infradead.org>
 <CAAhSdy1NED22YyYrAJDqPkDqT1c2ms2QC9OjHP0qLwHT+o2zvg@mail.gmail.com>
 <mvmva1ps369.fsf@suse.de>
In-Reply-To: <mvmva1ps369.fsf@suse.de>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 12 Feb 2019 19:23:39 +0530
Message-ID: <CAAhSdy3HKnOs=aE75+Unor-wg-mELC-Oua7WdyDavpUgJmGAng@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] RISC-V: Implement keepinitrd kernel parameter
To: Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_055353_043404_6DC42614 
X-CRM114-Status: UNSURE (   8.39  )
X-CRM114-Notice: Please train this message.
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 12, 2019 at 4:07 PM Andreas Schwab <schwab@suse.de> wrote:
>
> On Feb 12 2019, Anup Patel <anup@brainfault.org> wrote:
>
> > So in case of initrd we might not want to free-up the RAM but
> > we can certainly free-up in case of initramfs.
>
> But the default should be keepinitrd=0, shoudn't it?

Actually, it is keepinitrd=0 by default but the commit description
is reverse. I will fix the commit description.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
