Return-Path: <SRS0=HQJf=P3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D14C61CE8
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 10:43:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 713BE2086A
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 10:43:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mjRiAtm7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="ZhRvJ69/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 713BE2086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E8Inyy+KTtWO78/3K75AxS7hBVM0iQvUmvHvKEtKUBg=; b=mjRiAtm7vYwhgn
	G3RxEzTSBTVT/8H9I3YS4eV499xOQlflNO1y/GSqhSQ+JUV+1WEdwRIrOK/UDghWaD4V2mgFSKGSj
	wEh+k7SZvfZwPMrskS+ahX68OcRLlh/DTTpsnQjupkASTv7xyj0jAlMs33PykkqpH/1AFTAyozuuY
	55cNR7mys1mddQinT4bmf36zlk7ArOJpRI9TgoH/SP5tHBv9ixRQ9Brbfd34OZRjaxn90EpVzai7t
	zjhMohc/MWKQXh8SMK2/bdkFKZuxBZcoq99+YNMNPg0D9cOjczK0OXWSYOCYhv/RZwgTHA0PfRonf
	FSH+bRy9dPl/nxaSj/UQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gko65-0001nw-63; Sat, 19 Jan 2019 10:43:29 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gko62-0001nR-9q
 for linux-riscv@lists.infradead.org; Sat, 19 Jan 2019 10:43:27 +0000
Received: by mail-wm1-x342.google.com with SMTP id r24so2689630wmh.0
 for <linux-riscv@lists.infradead.org>; Sat, 19 Jan 2019 02:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GUPmCs7wpKU+X6c9dkGsOCov7VwDuMe9sT0P7uVU3Zo=;
 b=ZhRvJ69//p5qzIgaSp6Bb4vEGm/ItrPM/Jv5QzBO6VqbMOYJLqZvvBMllJrJ/DpAFx
 ZvoPpDPAnXHuS7UAiAlKTIPbIn6ZWKD90fRWsMK7TYa6baJ809uy6hH1sc7fBgceg0ZZ
 Y/gieu67AywuPGm5Ig7fDJ4U2w3THd65QKyBjsgTTf76KrgxdtQvEtG+wOehVZgn3dih
 m4Dp9yLvWnzD6IN2gznNWlBeWAeftjZFmGMQqmpyYYcfazRvM6Qer/blpr2IH+u/18QI
 0t5LBfD15uxsGg6LWU3IKUhYgOXdMEm3XS8YSXVkwr2fVKiDtJ9LM+TB57SOq6phFzWc
 H4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GUPmCs7wpKU+X6c9dkGsOCov7VwDuMe9sT0P7uVU3Zo=;
 b=N1k9x/XIET2xoGxBgsiSlK/KZN5iEs+EpH8MR73aaCUJ57sPIqcLY8Ghv08VjpS1LO
 ++nNj/XZPmTyIJ+VpXzHKU30eV4FMklTuSJRhp75Lpj+qcdWGnLgS0MxLoxnChtNNync
 Te87ZqtAlxLo40Jtq3mVTgZLMG+cmklt/agc1XVQxvukNJ5hfLIuz38acorEcYV36PXX
 VrcCqFMps/1BBQhyJmYkNv0Db1By+r1XlIY/D6Zguv8SflNymx7bhh7WcNW0TW28VDWx
 ESqPotjKRddcx82cvcho7TVXxvH7aO90Mav8iE7PbrDuG8pFVpEAA42vbtRXrr3owkl6
 pcCw==
X-Gm-Message-State: AJcUukcPrf9HjD3zOmD1d+pN1bDeIQrLSRHGW338P3U8oPqlbqIQ0O5V
 bOTG6gxkFz4yleG4jisLQd4VQJK8ePDgVpII09P1zQ==
X-Google-Smtp-Source: ALg8bN5WQzQtniq28bbHJ55Q0Jo+6hAfZTRLrcWyZ2hW/9fAym6FfL/nWXI1c+wW4PTZp3S8+cX1yNJyo8DShmV6Ih0=
X-Received: by 2002:a1c:1801:: with SMTP id 1mr19820326wmy.153.1547894604575; 
 Sat, 19 Jan 2019 02:43:24 -0800 (PST)
MIME-Version: 1.0
References: <20190107161047.10516-1-anup@brainfault.org>
 <20190107161047.10516-4-anup@brainfault.org>
 <20190115134453.GD13216@infradead.org>
In-Reply-To: <20190115134453.GD13216@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 19 Jan 2019 16:13:13 +0530
Message-ID: <CAAhSdy0DcjA_k-f_dLO1mPdTU=Y9_Ms-aPnQpFO+x7MOUFxFkg@mail.gmail.com>
Subject: Re: [PATCH 3/5] RISC-V: Move setup_bootmem() to mm/init.c
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190119_024326_338137_4B1939F9 
X-CRM114-Status: UNSURE (   9.12  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jan 15, 2019 at 7:14 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, Jan 07, 2019 at 09:40:45PM +0530, Anup Patel wrote:
> > From: Anup Patel <anup.patel@wdc.com>
> >
> > The setup_bootmem() mainly populates memblocks and does
> > early memory reservations. The right location for this
> > function is mm/init.c.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
>
> Looks fine:
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
>
> Btw, please use up the available 72 chars per line in your changelogs
> where possible.

Sure will do.

Thanks,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
