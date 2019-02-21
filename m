Return-Path: <SRS0=eaTI=Q4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE17C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Feb 2019 18:45:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D1002084D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Feb 2019 18:45:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iiwBPhk/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huer4L0v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D1002084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cOCj5mvCxQ6TwR7KkbFHB4oAAVJ3jfHrc3fpVH2tqC0=; b=iiwBPhk/Zew3PE
	y7dMma5Qe1fvKPKvUMzez4TH/a5zkvgsgGkqaMPVIDUyLYbwQF48ZvH7RoYMPutGnHUPn3BD834kx
	V7s+U5BspqL4EAsWpQmeqRheMcFl639ea3YXv9IL+/eG1farofrKGbgtLGdQLK28CdcWm9Ebk/bCg
	+tgYvDNbwxIZYPIejSZugeWTvhb5fvRXrPIFnhIBTKxJxcf+jJeiWYDiNfNzt/356+ciFKKjIIAor
	sEJZr6irbKB0KVQ+jyn0oQZjIUGgC1oQiH7+gAvoyl7CRHbssmrVx3EfhEZKeJYA05nZkIIDESdLq
	i1z1wAzSzp6CW/Fc3OYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwtLG-0001cQ-UB; Thu, 21 Feb 2019 18:45:06 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwtLE-0000sS-6P
 for linux-riscv@lists.infradead.org; Thu, 21 Feb 2019 18:45:05 +0000
Received: by mail-lj1-x22d.google.com with SMTP id g80so24896857ljg.6
 for <linux-riscv@lists.infradead.org>; Thu, 21 Feb 2019 10:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=erb/ZZVVUXu0jVRC08dI9qBTtYZ3RazMaV0KrqTNQaw=;
 b=huer4L0vNJMuDKadrotY2ax3Sy3CtTdmZqKEfVtjfgeenLVyOP5p4tNUhQnEhIbak+
 QBFwoIhb+HL3cN1DfOH6QJ4jbD7xce8Mc600Z2jOPYLJou1Wyu+YIn3cnhqa3sssT78V
 KWKy/6VJ/NNfekHa1IJGydaFMQEXi7QywZAPqC2GV/CJ/DQF5SPCoo3WOLCscOI4sjan
 lmAUCxMA6m1qjPt7Xjxwjm6dtoaoldmj7Pq4PazDlPZKc/BdYbAwZk6tsadD2/Nb2vvr
 5Q78QmjLoKDSLrUEC67LnG5eawXGZM0arCF39dSz5GcHeC3ljXOTlxZadPbgfstQXxTN
 6rug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=erb/ZZVVUXu0jVRC08dI9qBTtYZ3RazMaV0KrqTNQaw=;
 b=m4GzJRRT2Hbo6/Gq65j/X+A6tN8hx/i3bhV0urm4g2c/3+UlgGeLJCqXj5x6a7uMhP
 FrqhWkUyZZdRR4HzOl4zJroV0hbKSE8YVoLdlbHTa8PYKETL1ypziU1xVXULoF2lhOw8
 vFiftspnPIeKC23wUiWUzvS3nXOdVqZpexhT9eXmru8vqLp0tRjgKPGjJRc8EC6upE/K
 9hTBC09MIUYdgJ7m0TOY9iTPS2zCw04P682mSNSdLKGDzpYVGuCAD3A4CiWObxoi7+HW
 hBTLMZze6D99yjlVOrxeavz1ffPRHZP7yr45drPBKRZ1zcvCX1+X6xtfj8AazOkNJvUN
 fA9A==
X-Gm-Message-State: AHQUAubTugm5KzajpBak8yCKoZLJ0lecw5MUdQ9OWw7f0QdwG5G20goF
 5e7pRgfum8XV3/X1Nd7CtCow1Dg8dg1OWfPKkn8=
X-Google-Smtp-Source: AHgI3IbeNoCSi9Ayo4PhYvXuoa26tT8STzkK47TKjTPSADbaV+ZtaA+dDuRNSTO0F3PcPKYftaofRBocYabE59B6hNs=
X-Received: by 2002:a2e:b014:: with SMTP id y20mr13754403ljk.116.1550774697513; 
 Thu, 21 Feb 2019 10:44:57 -0800 (PST)
MIME-Version: 1.0
References: <20190221003231.31625-1-alistair.francis@wdc.com>
 <20190221115227.ipwjpn3xm4q7jfg2@sirius.home.kraxel.org>
In-Reply-To: <20190221115227.ipwjpn3xm4q7jfg2@sirius.home.kraxel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Feb 2019 10:44:06 -0800
Message-ID: <CAKmqyKM_pb-riJ+jO65eT0SsVDxrstPOgurPuDf92Fd4C8k1Ug@mail.gmail.com>
Subject: Re: [PATCH] drm/bochs: Fix the ID mismatch error
To: "kraxel@redhat.com" <kraxel@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_104504_239569_27FEF868 
X-CRM114-Status: UNSURE (   9.85  )
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
Cc: "david.abdurachmanov@gmail.com" <david.abdurachmanov@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 21, 2019 at 3:52 AM kraxel@redhat.com <kraxel@redhat.com> wrote:
>
> On Thu, Feb 21, 2019 at 12:33:03AM +0000, Alistair Francis wrote:
> > When running RISC-V QEMU with the Bochs device attached via PCIe the
> > probe of the Bochs device fails with:
> >     [drm:bochs_hw_init] *ERROR* ID mismatch
> >
> > This was introduced by this commit:
> >     7780eb9ce8 bochs: convert to drm_dev_register
> >
> > To fix the error we ensure that pci_enable_device() is called before
> > bochs_load().
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > Reported-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
>
> Pushed to drm-misc-fixes.

Thanks. Any chance this will make it into 5.0?

Alistair

>
> thanks,
>   Gerd
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
