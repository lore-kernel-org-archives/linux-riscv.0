Return-Path: <SRS0=cI7w=RZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D75C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 13:37:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2516120693
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 13:37:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ifccTCoK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="wgRz0YJA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2516120693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M2zqjClz7ug6lMJ2Xh36vLb0JbXPUIGtIAm6vi1wiV0=; b=ifccTCoKoOPEeV
	Rr5YI8gOHdG0yS6QcGfaeXkgjZ/zQ6Nn3PJF1yh93JekPhECcEenMd/EgCM8bjPkxSL+wMTk1Lin5
	d1nCQ7SxJ7loP93MqB5aHwVdVOFNAlzv8obaMyvmKKVO6Ka5FmBLBDfAPOfetYDClv547Ofp08hec
	AQNcJj7j9TxpK7bU12JOaMzGdbNAxaP8SbnRb0mrbUX++k5JaYRH8vUtomr29EcmSWKf5oUi36hV2
	vjXb3J+bu83MH2HSVjRbOcwtJaoJ0zUTbp2PXsAIWoONXIUv7OSoIjl/Srce5/9gvGJCkZbfCjNY4
	1XsJhQ5Vvwl1HMIfBpjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7KMm-0004io-43; Fri, 22 Mar 2019 13:37:48 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7KMg-0004ZQ-VX
 for linux-riscv@lists.infradead.org; Fri, 22 Mar 2019 13:37:46 +0000
Received: by mail-wr1-x444.google.com with SMTP id p1so2377438wrs.8
 for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2019 06:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a7PZ4oKQ0nbRSO480XQ2hrdQEVVWgg8hR9uoAMojIFI=;
 b=wgRz0YJAnu47A36ezzIjUucECDrgaYE4Rvm/JtIVZfx2w8IBxrv0rfApV/D5l1pT0M
 pLWCWsCGFpQD+Q8UVUDCWx1vKEg7EN/Cw4sHnrliKagHPomyE2pCPFm0DLQF69+Mt5w1
 QoBQVdECouM8pfS+KRqENgdd/TTwDTsuTBZ9KiE4WtBUR6x+jt1TKwUEuavKe3gdi6Vn
 0e3jnHgS8jAVfrVo/HwEOO1RImHPLVbVPtMZyZorDv+ycHZXtK9wN+KG5jbC7xxVNyBn
 Tb6AEkOyPytKvkZpjUslbaO/iLiO0+hl7lCO7UOw0Y/zWS06o32UcMOz+4XfwTx0H+S4
 eOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a7PZ4oKQ0nbRSO480XQ2hrdQEVVWgg8hR9uoAMojIFI=;
 b=Drew7I1n0OX2F+qySuoVKQbkAuM9qmieJd/20R4awt9wFzAJg4+GZStqZ6YGSPH17a
 QnFFvXrxkQQd6/LlAA8GI90N7D680pmasgV2eWO95jFIY5F7nze2r3jqz7Og8EXBQ58p
 sG292j25mv0JNJ08AECZzE3QyPG/mBIf07a2KmpePzMIE1hWta1knxd+j/gcOYbhEue6
 RzezVD5x+9O+GjME9UEyCjcWJ/5/3g1TNV0/+RbCkxn9RX7XyD2GVYRP/FG+vtQEbm6X
 2t4XdNc8iLaJ0QrmsUIlamiY9AvlnKC7kY3BWFQ72O+n/NBY5JrI9iURgCZckNPeIDIY
 n5Gw==
X-Gm-Message-State: APjAAAUwUv+UjvioJ8Wu3R1OB2ryjIw51raQHS6oECYMxvnM2P8CrYOk
 d4vDYDEFxO1P0jcodIgtGqY03G5V0TlxMmTvHkIFvw==
X-Google-Smtp-Source: APXvYqxKnGzuVNL/YBkNlIhhU5tXUh+NeJ0/AbYhZnG2cQGPKm/s8yv67UnjjyjQbafeR3bd8ZbW/U2kqoSnGF3jMrY=
X-Received: by 2002:adf:fe03:: with SMTP id n3mr1706666wrr.59.1553261860644;
 Fri, 22 Mar 2019 06:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy0mUboGJH_GJbsGFBwcukjttVQcTGfzwkaMFQb9ZVY4Mg@mail.gmail.com>
 <20190322104209.GB24367@rapoport-lnx> <20190322132556.GB19263@infradead.org>
In-Reply-To: <20190322132556.GB19263@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 22 Mar 2019 19:07:29 +0530
Message-ID: <CAAhSdy1VS8-3npcZUzjicnKGsjHcc6WH3Co6Hx2=GvttoatWcA@mail.gmail.com>
Subject: Re: 32bit kernel is broken for Linux-5.1-rc1 due to GCC cmodel=medlow
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190322_063743_405717_A4119D68 
X-CRM114-Status: GOOD (  14.75  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Anup Patel <anup.patel@wdc.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 22, 2019 at 6:55 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Fri, Mar 22, 2019 at 12:42:10PM +0200, Mike Rapoport wrote:
> > Hi,
> >
> > On Fri, Mar 22, 2019 at 11:46:24AM +0530, Anup Patel wrote:
> > > Hi Palmer,
> > >
> > > The 32bit kernel booting is broken for Linux-5.1-rc1 due to GCC cmodel=medlow
> > > affecting setup_vm() movement from kernel/setup.c to mm/init.c.
> > >
> > > There is no issue with 64bit kernel booting.
> > >
> > > The "[PATCH v2 2/5] RISC-V: Make setup_vm() independent of GCC code model"
> > > fixes this issue.
> > >
> > > https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1959102.html
> > >
> > > If possible please include above patch as Linux-5.1-rc1 fix.
> >
> > I'm not convinced that it's the best solution. Multiple __load_pa() and
> > __load_va() conversions make code unreadable.
> > Is there any reason swapper_pg_dir cannot be setup after 'relocate'? It'll
> > save a lot of churn for the current fix and for the addition of 4K mappings
>
> I think for 5.1-rc we should just revert the cleanup patch ASAP until
> we figure out what else we want to do.

I think reverting is not right way to go here because there is deeper issue
in using GCC cmodel=medlow with setup_vm() which is called from assembly
with MMU off.

Even if we keep setup_vm() in kernel/setup.c then still in-future it can break
for 32bit system as more code gets added to kernel/setup.c.

The setup_vm() should not be sensitive to which source file it is placed in.
The patch which breaks 32bit kernel just moves setup_vm() from
kernel/setup.c to mm/init.c.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
