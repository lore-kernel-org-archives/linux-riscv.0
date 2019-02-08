Return-Path: <SRS0=OMI1=QP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72EADC169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 17:43:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44E9120863
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 17:43:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PGUR5Tjg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XvN+Xk5H";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjaRcpg4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44E9120863
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nK+oj4ntrp4+2f8+8CepYo8WQA65zA7QbU4ItPcngUw=; b=PGUR5Tjg/eTJfi
	InE2fb/W1ZBis4m/F3X8PQ/8XW17wYhbVFaUqkZLoDOlyigtCceyFgaCixRYX4ts6iunONBZHIe2n
	5A0AvJy5K1DGURw/94P3kzYkloB9bRxIQ3p3LJ+I83VcfCJ0MRRBE/4rTT/Een6BDuEwRq02xe6Gn
	vN3MoSksMOlIsv/3FmYC0ju+nyciT/P8pFm9JNAH6kVXV3J5QajwX0ynAcYHDV9W/ZkMrCXj4PIhy
	gRxUp6jK9bngPxRwRiu1evi9WBqCwEzg9++Z+yyUczxsShbTC2PWUCBPd4xc7X5DJoq3aw4P8pjWR
	HMG+FMIQjswXitAYkgzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsABP-0007QT-0E; Fri, 08 Feb 2019 17:43:23 +0000
Received: from merlin.infradead.org ([205.233.59.134])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsA4q-0008U3-AX
 for linux-riscv@bombadil.infradead.org; Fri, 08 Feb 2019 17:36:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8EvxsBX8G2BLZG6RME83sgEGJxBWmJ/miPkZ/PArDMg=; b=XvN+Xk5H4s6ykZMkIrsBzPyqW
 WGbb608QKJy5xaIMYzTwUzyTmNnTVXKVKWOHxvTB5qLLcCP8frAtrqxe3gYHQs54P9bN/cp75+DLL
 8FLEPSLd1qKDmZ3ANZOmUVYQ64001JHz96AbbMH+T54CXETDtOccrQmlv9pmbwnmXCZ/JkFBl7dOC
 zTL7BK1ahqU+M+oiSsT0R6UJunIZh7KFjHAUVT4ajUDBt4lxcxOEtblTrFkN1ww0tzrdMbJVio1fN
 HjIekYkpXHo108tsxNvrF+/dlIJZ1Dmz+JeNzIa9CuYvKQ+v2tYvc1KBGd98cNxMPhuNM6wfQo5rJ
 2UddstFeQ==;
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsA4o-0005td-SJ
 for linux-riscv@lists.infradead.org; Fri, 08 Feb 2019 17:36:35 +0000
Received: by mail-ot1-x344.google.com with SMTP id e12so7153947otl.5
 for <linux-riscv@lists.infradead.org>; Fri, 08 Feb 2019 09:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8EvxsBX8G2BLZG6RME83sgEGJxBWmJ/miPkZ/PArDMg=;
 b=XjaRcpg4CsUEHOGGsYNWkqCeRMHdLqz+6ltcvUYU+CrQpQRXa+WO3T0dVaKTSKG7Ql
 hnto0HfmGGam39RXXNaBaqz6uWLAImgptViIS2O87fb1uCJLbScIDIRNBqo+T/EqLwB+
 IVcZi2azeYJ1D4fVQHFWW+tOe4icEke2+ZP+XuQVcVlxmTlzRgFwEkKtnXs6fW5yOxSI
 Wp184CpB1AW/Omc9wMcrWueybIC47X2vy1JGW2sZ3ieHfvlSiGBwZ9kO0dWqzyXW5HZ4
 lZWsO5Iku57RyWvLdMmsjf73kA2/Ce957Nt6yKWiOpkEAbvGS00bIyOg145HwLREQslA
 AtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8EvxsBX8G2BLZG6RME83sgEGJxBWmJ/miPkZ/PArDMg=;
 b=Pb3SzEVebehkkUU2PN2Lral561amKgsN/F8/HDjeVTtnC4Uh5f5bu7hVt01GcPcYQR
 9U0c2Fmxs1RNlp1KpQrb6Th8/CHgQi5Xjx6qOJLcKl4RfRa6ZBssFOJkcJL4+2QFu+v0
 p4sX2lIV/rGcGlGhYrKSYHiOi3gKdGc/oNvRKmeAiZkashWhcmlY0fomnrwiD9+Cxe4K
 cpHEWq30CEJRJRvvDb0R/LE3Olj+GesKMpcPXhysG4PbhEDCEa5Qyki8MntW1zSieqxM
 4WmkrdAhRnFLHhTlaPCjCUI0CuCe56ZNl+FcIbGc+/BOR+D2DLwU+Ptm/bTfaM1Yitqg
 D1UA==
X-Gm-Message-State: AHQUAubzDNtbzTlC44Y97NgpXbkJg4GgJ48YHJIU56aX7b0SVDIqME/B
 nc0hOLsqVXPk/km6z6rsBUHEtBEj7KnwbpsZvG4=
X-Google-Smtp-Source: AHgI3IbaJGWIdMqE7m7/91xPLIkgk2XjmNeO7v5TBRxk8JQfu6cJ+nggdELjdyqJ44r1mV3XttyOhUrUa/7NsOa/oAY=
X-Received: by 2002:a9d:8e4:: with SMTP id 91mr13700479otf.169.1549647390678; 
 Fri, 08 Feb 2019 09:36:30 -0800 (PST)
MIME-Version: 1.0
References: <1544983416-32532-1-git-send-email-sorear2@gmail.com>
 <20181217183741.GB23353@infradead.org>
In-Reply-To: <20181217183741.GB23353@infradead.org>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Fri, 8 Feb 2019 18:36:19 +0100
Message-ID: <CAEn-LTqAZVzhcfvW7aB=JoUvdmf1pZ=fsuD1qsDdFSqqY2Fu6g@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add pte bit to distinguish swap from invalid
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_123634_955568_28B08AE3 
X-CRM114-Status: GOOD (  11.41  )
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
Cc: Stefan O'Rear <sorear2@gmail.com>, schwab@suse.de,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Palmer, could you review/consider this patch for next rcX or next merge window?

david

On Mon, Dec 17, 2018 at 7:37 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Sun, Dec 16, 2018 at 01:03:36PM -0500, Stefan O'Rear wrote:
> > Previously, invalid PTEs and swap PTEs had the same binary
> > representation, causing errors when attempting to unmap PROT_NONE
> > mappings, including implicit unmap on exit.
> >
> > Typical error:
> >
> > swap_info_get: Bad swap file entry 40000000007a9879
> > BUG: Bad page map in process a.out  pte:3d4c3cc0 pmd:3e521401
> >
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Stefan O'Rear <sorear2@gmail.com>
>
> Looks fine:
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
