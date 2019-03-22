Return-Path: <SRS0=cI7w=RZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57738C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 13:41:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 181B220835
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 13:41:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lKIyJlKr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="OSfT1aqP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 181B220835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TH/RWZhl4KIiFxLXBK5OKXFdi4eguVVub+mK7drmeP4=; b=lKIyJlKrJxnsJJ
	Ock115LyW8UBokbKUo5yyDqJjYG8ChOmIBRZoih4ReeSaLPhEb/U+Nu9RojbON1uxVHgiNd6r5irW
	12br1vvJFfsU/zPsx/joRVQr10OE5ogmEzlAewKLTEv5hMQ1FhLoVPHnYVL+KnsJ5al51oB4SKohW
	1ZJppNsyhO788WQPTvicRVoOr5d9LY3d1KLP4kgq7BCO+elQIVsN8d9Ta4MsKhJSuTgc4izzNVD8Z
	xu1lE81CGZ71vJ2xNtxNCJWY0+Um62eXLVZe9lRxusqNDKIwOzS5oFwz1b8AxI0dwWs1rpvqlxA4M
	nULAi7OkNs13WDuplVtw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7KQZ-0007vX-Ee; Fri, 22 Mar 2019 13:41:43 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7KPV-0006U4-9R
 for linux-riscv@lists.infradead.org; Fri, 22 Mar 2019 13:40:42 +0000
Received: by mail-wm1-x343.google.com with SMTP id y197so2238332wmd.0
 for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2019 06:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rAXsKLINYQnWHnO2xINsKg8DYXMFqMDw9bmGrw6VwMc=;
 b=OSfT1aqPaD7krmSpzE7vIezLOBPwWlnYeYcQ5JKMCAqsxgjCL3Olb6OIQDqiNYREWm
 Ky3eigtLSy7y9JphOOa7ktvLfuT5GrrDkYYfAAsfffbt8R7eOZSdtyqwZKUb5g7X3/wL
 3TFvb0oPm2OzWWIrqdvYRDwcOgz3UpsFeeDQnvHcc7qJS7J5+6i3QO0ZHHdsOKXN2Uzv
 DZpCMZVQPX+7+5ViuFlc6j75QUBydmMWxDBb7/XK6sesPV8jJNDt/ktGcBT3hCAskNVo
 0+hSY5QmurDUqtcEBfps30LGpS2eCGf4N7DeY6DLTOiFFR/4M3UC8ro8XVNaHRdfKAmw
 nyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rAXsKLINYQnWHnO2xINsKg8DYXMFqMDw9bmGrw6VwMc=;
 b=TMhgdpk2UZlxJOxympDAAVi6zROXLRodQLcirLolHuaO+6arlwMwoMmk0rYDQrTaZN
 w8AaERIQKZxPj1qsz7dtClRb2xZT9t7Y6Akb2bV6YO9pxe/00yKq2xh3TEmcze9R3T7e
 B+jDobRv635zQDBqFkrqci1BGnvOKSuO42Lp9K2aRmQSOPski2/HN72RV0v6RpGYPRz2
 r6bLuOWCZbbQVlC9GlxCrMMBaBn35hrBOL7gOz4gSsi/6a/2we4N63bwH/vFcF4LXpb7
 8HM6IrEq3hImsjPVe8sEg+2MhzUVnuzBi2BrEmW2PyPJK8kxVQ2xNGL44Q7V5g/nZNod
 7lng==
X-Gm-Message-State: APjAAAXuSi3d77yi43gSTY8f1hdK4WNbI0xHZi2C3OqdyNeJXsJt7rUE
 AjhlEQJarchciDcaBqA5Hq19Ybuxl3NHvWYF8DxiSg==
X-Google-Smtp-Source: APXvYqxWFySmTB/zNfod71hfyww4/mgf6ZWgGJsJpNqgE6ons1K1YLUmhnhTa++fSTCuxFbPTN3NicaxdgplgSgPHTU=
X-Received: by 2002:a1c:e185:: with SMTP id y127mr3328829wmg.76.1553262034639; 
 Fri, 22 Mar 2019 06:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190322100414.32221-1-anup.patel@wdc.com>
 <20190322132509.GA19263@infradead.org>
In-Reply-To: <20190322132509.GA19263@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 22 Mar 2019 19:10:23 +0530
Message-ID: <CAAhSdy1dtRtkO=hriiG48U2JF4WRPzvg6JB1X64AEVAWM3nNcA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Fix FIXMAP_TOP to avoid overlap with VMALLOC area
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190322_064037_671319_96D93C15 
X-CRM114-Status: UNSURE (   6.72  )
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
 Mike Rapoport <rppt@linux.ibm.com>, Atish Patra <Atish.Patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 22, 2019 at 6:55 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> Looks good,
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
>
> Btw, what is the 32-bit test vehicle of choice?  qemu with the
> virt machine?

Yes, for now QEMU seems to be only the option.

I am not aware of any board we can purchase for RV32.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
