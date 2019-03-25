Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78EC2C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 03:20:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4960D20828
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 03:20:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XFbzgJLp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="ymR9rmTA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4960D20828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kZYfrkmGhM7J8IvY5uQnYyTnWEB9mWT1v87HBaGQX+c=; b=XFbzgJLpvtJTON
	5MM21wWPuEAnmij9aScMCplSsE0fYDAcBLFns5uSDNvmEeda7pUWe7MD1kg6GA9BMC6iD2fITVjf/
	eep27Rg/kWp7//MeFbes74V7hgLZAYAHdlNapzykBdBiTYO31oFpiFZF0H0ojd0/+zn3Q2fvnLrAo
	YJcXGjncXVA14x2x8Y6li6ZXtplIm1WsJnp0mrj0gRWjPMeYW0UcmrudV0Jw1KopIVJ0Yxde4EfUU
	n1XaFFrJjJf7C55NUOIzaAgvJeIQ5wZzh9bOyAv9LayA1R/LnuPdKmpx/m3XkjC2Wt06TFyMnI1gV
	R3FT3VIqYfTwoL9Nziuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8G9d-0006k1-Fe; Mon, 25 Mar 2019 03:20:05 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8G9b-000687-E4
 for linux-riscv@lists.infradead.org; Mon, 25 Mar 2019 03:20:04 +0000
Received: by mail-wr1-x442.google.com with SMTP id w1so8382666wrp.2
 for <linux-riscv@lists.infradead.org>; Sun, 24 Mar 2019 20:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4frdgXGH7cSsbNOuZ25SduNt9T/mHeqrTc80EFiJ7tg=;
 b=ymR9rmTAlBzO/iMnBt39G4DKcBy6CxEfVN0QDSapbkjDhcb9rJ1SFFcd+9RXj1O81B
 /VyGDoZ8q7iuzZtixA6UY1vvj9VaI19YR+YoGsayqHBnvjKlcqCmA3qa/z6rAR3kuXA/
 Fb9+ThDaxEiLN3/hZMcoTffcFNZeI4RyLjSOq8v5kt3CpdnloqF5Ri32RNaiyvZE0S6I
 vOg2NUHgMH0jijBEFMemnZ0w8i0RuVduhJP4DveKzdZkIsJ9Ipj8gOqynQtVJi5qqR4Y
 OyxGJ3Pe4s8ILQSXuFmg2yNRgISNHQgQ550Cr49AQaaeg4DAz8eV1ZyUkMXsziRHx5Av
 E5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4frdgXGH7cSsbNOuZ25SduNt9T/mHeqrTc80EFiJ7tg=;
 b=alUPa8zK0fHufyzkyLGhU1neTnPoJ6PQwVYvWMOU0dS6n+enZFslE3TdHnoAQCug9C
 r9pT8g3Ii75DNE6Cwi4n+0ocn+RZn2lRkChZokHVOs/HBcE7EgTjwQtSQri/CaKJnKZF
 Q5e2Xkg+0B68Ug4KQ0n25uOvZx/pUOZOvoNKtDWkrk/KbD0YCn3+pWWpjFUTaeUKTfqy
 58XcGVrIaEWgptVndrBQa9AN0AUETgCQ4TGkpvEYFxYbhhd0xNTilA7nVZ44fSAPPSBz
 q20UJX539a8IKEMHtmkr32v4LED1/b3EyZXfqe+n/zwedd5Iuk/uaOEa/DTJ+xtURfAb
 t57A==
X-Gm-Message-State: APjAAAXY+DKFBv0uDGXzez43FWBSLukSuvBiIHCqmHai7rzByG8llHvU
 EE69X2iSkW9gzbFawOZN+3LPqp+4E4tCNumaasO4/g==
X-Google-Smtp-Source: APXvYqzVuVFW+JYOd73puecteXHdHSWmZReIZrIc+m3xk8Wkz8sbpPU8+81litdzQ/4KJ2i9WfhHqFWhFFe3SJvNVe4=
X-Received: by 2002:a5d:4087:: with SMTP id o7mr2277794wrp.9.1553484001453;
 Sun, 24 Mar 2019 20:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190324110804.68555-1-anup.patel@wdc.com>
 <20190324145708.GA3355@lst.de>
In-Reply-To: <20190324145708.GA3355@lst.de>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 25 Mar 2019 08:49:50 +0530
Message-ID: <CAAhSdy1PRXpn-mgB0p4N-9q87xtWTwNPKJsUaGc6nTyz0ZsJug@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Always compile mm/init.c with cmodel=medany
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_202003_487426_CFB7C496 
X-CRM114-Status: UNSURE (   9.42  )
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
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Mar 24, 2019 at 8:27 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Sun, Mar 24, 2019 at 11:08:29AM +0000, Anup Patel wrote:
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
>
> Huh?  I don't think this is from Mike and me.
>
> > +unsigned long va_pa_offset;
> > +EXPORT_SYMBOL(va_pa_offset);
> > +unsigned long pfn_base;
> > +EXPORT_SYMBOL(pfn_base);
>
> Can you move va_pa_offset and pfn_base next to the swapper_pg_dir
> declaration?  Thats where I move them in my current nommu patchset,
> as that allows to just have a single CONFIG_NOMMU in mm/init.c.
>
> Otherwise this looks fine to me.

Sure, no problem. I will send update and send v2.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
