Return-Path: <SRS0=4uv/=QS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F071C169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 08:46:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4210C20823
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 08:46:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VjRnGWUa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="1V81f+hn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4210C20823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WYbQLtZrpIVCwHBrL7OsN2sxFfL1sZ6HK1nbniukk5c=; b=VjRnGWUa0ggebx
	MTcVjP3nJvOD6O9m5tEUhk4r0PA20zTOFvx/m9DY88j+O5R46mFZB+GyHmQAt4wajrvcgN2XMV1AA
	Nl7Cm/bmP7LoyZ/NTH3zs1bXNwxx3Q+7NwLKAtSSEY9gy/fRBQ4pJb6WyYN36kHblNbev7ucUNg0+
	pTfjQTh18nPHW124qHlJtG7xbxmNlGUfNqpRM3X2CEHwP+r0Blqcaiy43yQWbysD7bpETSHL4NoEJ
	p9By7Kf//C9zuGeGQCTQO/dHoZhF2z0tcIEmgmig3jQJ/OwRAvkfGwcrdv10naK6t8RmDbg76zjje
	GvAVi7V1CJOCxsXtmg1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gt7EC-000311-Qp; Mon, 11 Feb 2019 08:46:12 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gt7E9-0002zu-M0
 for linux-riscv@lists.infradead.org; Mon, 11 Feb 2019 08:46:11 +0000
Received: by mail-wm1-x344.google.com with SMTP id v26so15420969wmh.3
 for <linux-riscv@lists.infradead.org>; Mon, 11 Feb 2019 00:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EHuUf6PYP8aP/TZsy2xOmJlE/jJM1lIUSMwKI7xRMmo=;
 b=1V81f+hns6AElVsJ2GSgfWarHFzWO0X5OFyVnQa1ZDrg9QUJkUqt56s9+O2i3KHxjO
 Pdpd6+qjemRPoJs6fBtKNwIFDCTtDS8M1SYKQkQgCf3LIcYQ0mAZk38Ek2SL3K9ZJjom
 pydrgY0nUpSpK6tCclXu/S8u+YVYjqLlta2oin2deihBQABOKwvIh5amOftYklmoTH1T
 luKsC1LRjaeIsAKPt+PxVExcxl6EfhrQx9c3dx9TiHfeMucJuhCvVRs9Gxp8LyBj8CVU
 /LTxMCqLblitRTuvzSH8GsHAM8QlK/Tf6SE9MNBaoRlNhQdTzNuAeAxnaFi4pluUuGq7
 0QGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EHuUf6PYP8aP/TZsy2xOmJlE/jJM1lIUSMwKI7xRMmo=;
 b=SyojywyFjwrnoRt5RDf++zUTxJ/kvlw/7fomBUBvKOYCrH68D8HEubCo3Ngu8pfgh1
 /UCdiOrEo0Lvb4o+fKIlQJQhquGtIIGnb4V4CvP4lHs7TJP6a0cw98xTTvpVxy0ERxPj
 +k1lPA468CibcryMdTZUnUk4jZDoPy3vMDNNGWVYtooZKEEk/vJ5+a6vMala9GcL3kO8
 CvK8SgMK6rKdTQaDKbiV0zu7bL8KCPiyrGFs//TkoWoyVAKl7qjHrSXc580JVSmBjqWW
 fAj8DPakbNfWaqcEexJNRpIa7q2NYUbGKbM3gssfJRspgRyQ7UY+tldm9Kjc8wsrI2Qw
 kdTw==
X-Gm-Message-State: AHQUAubAGcX3+knLeHMWIhECDXavDht1VsVISb12aA7rt51MlR6LJ1xu
 473mrM4s5reQbf4rDQlT/idnQl0g3LDlBXuShIFrNQ==
X-Google-Smtp-Source: AHgI3IaWUOAhJcT0sDJUaRDy+SIzSLnzhNJZIyKiQC4n8HZp6+pxTlPpO7FegVzika5HeByV0HKxjGGPpNVtUMmzM4Y=
X-Received: by 2002:a5d:6b89:: with SMTP id n9mr23721862wrx.99.1549874767452; 
 Mon, 11 Feb 2019 00:46:07 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy3im4i0PJvKqDAfq2iDFvTA2O3ZsxjM6wSgdnFUU1eVcw@mail.gmail.com>
 <mhng-487587c1-cd66-40f3-86fc-aa2f034f5028@palmer-si-x1c4>
 <CAAhSdy2pBp10bp_jvCnApGYZa4Y2779ELrvH2DgcP4TRiKUzwg@mail.gmail.com>
 <20190211082506.GA13103@infradead.org>
In-Reply-To: <20190211082506.GA13103@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 Feb 2019 14:15:56 +0530
Message-ID: <CAAhSdy32P5Nn7yePyOHPNXZ5dS-RuxPK60UGebxWRbC8Y4QWRA@mail.gmail.com>
Subject: Re: kernel after 5.0-rc2 may not boot using BBL
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_004609_762117_86A103B7 
X-CRM114-Status: UNSURE (   8.10  )
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
Cc: Anup Patel <Anup.Patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 Andreas Schwab <schwab@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Feb 11, 2019 at 1:55 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Sat, Feb 09, 2019 at 09:00:27AM +0530, Anup Patel wrote:
> > IMHO, best solution would be to use mature open-source bootloader as
> > payload (i.e. U-Boot or similar) and always boot Linux from bootloader. Using
> > Linux as BBL/OpenSBI payload can still continue to exist but it can be more
> > of a developer usage.
>
> Yes, that is a good long term plan.  But in the meantime we should not
> gratiously break the precious setups people got working..

The kernel breakage totally unintentional. I had done all testing using BBL
and OpenSBI with Linux compiled using defconfig but never saw the issue.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
