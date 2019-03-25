Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5859C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 03:19:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8388420828
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 03:19:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SvmV27aJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="o/FaLzux"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8388420828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EL9aS+MTGgWVSfFwCCJgpRKv2siGjJq5GtO7E0DPlS8=; b=SvmV27aJplFC2w
	4PP6B4KEvKTnyQcQHoSlKMnAEsG/vXILREvAma1+Gp47YDgS+zKNQsbaUpQrwevIohNBlYSgVVoot
	qZ15E41weq46+AZYYCicMIBg2Zqd2ZGozzZYaadHQVWWBJ/eW8ABVLol8+AyZ3jGP12W2wO4nYx63
	s/mYRLrD8G1HhOchMVrc6PiHXtvRBzmTdvoSPs97Bq/H0jqxYLNwDNcALX6KlhOmR3J9wxw+cGSaB
	8SpLifu+7IRF4R1r0hbpaQYbM8/UB/mt1bG35+wU+X6dQqIhGTBwfpjsb3DDrgHqHbbcPz2i8O6g3
	dXxk5DJYqsDTEOnchOCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8G9C-0005ZQ-Uj; Mon, 25 Mar 2019 03:19:38 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8G99-0005Yc-Vz
 for linux-riscv@lists.infradead.org; Mon, 25 Mar 2019 03:19:37 +0000
Received: by mail-wm1-x343.google.com with SMTP id a184so7296989wma.2
 for <linux-riscv@lists.infradead.org>; Sun, 24 Mar 2019 20:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m+KBawshO2ac9odd0aZdpxY21SVc/hnJhTxHZNDsCqc=;
 b=o/FaLzuxCRSMDHvwZjCd2TG7JRIPfsq9KAJlNaJFIAILPPO3XvEIWHv5iMaJm4l575
 I67VCbrEGCvRn8v9cBjY0DCkrYcvp5SfpxF6dwWr2zIeXn/sLjoJkjJ4aCZ7RbIz+FCg
 k0aa2i++UENBkDf5vM71io2Yn0i2a1KtQOz4Y4N+ygpcOgb7DKHKrFjzdKUoUlBSVMWs
 o21wxSpMfFkkINk4pyoPWWs7qpLN8wkxjgyx1xTpqGa3/tXCH6jxTe+3bUeNIma2ey2v
 e9iasmi3Y5LCP0JqRJtF8835HM1g9+fFyIifhDNkyyDjshYlbvG+Pnunrmyq0pXRTV8d
 UdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m+KBawshO2ac9odd0aZdpxY21SVc/hnJhTxHZNDsCqc=;
 b=W71J9HWg+sJLcDQdHNV5zMJdJcd8vBVOhOfrYIefc1ffQqcNwixs9bpBlxfZBgUrmy
 u2oCpq+rEuVuk0MIFzNKz2zzWAvU2DEsuYnwAA8TAYXv3IrQv/mDf4cnpLKXgl6Z7bp/
 RIa0sg5NygxwAQ9tWIdQGfz8DpCIaBimnVGklBWOhPNI1GuRlNvKWM1NvmSlxRi5PKTi
 oCZHWpICkws7MOQHo85gb54eMgSXlhqHnsi1VagwZSACz8dovssM6D/MvcQp0fu9xUn1
 rnLfDjIOa8OkzAfDrjC4rNHUK0+HDwX3one6GaWIXtY9p5ZSakMaXDJ4591fCOvs68oT
 AtCg==
X-Gm-Message-State: APjAAAUDvaMdabWd8O9hUawfl7bwlk1SGvLxKu5IhxVvQYIEtX52Vrht
 pQYSi/xDJ3A5JqmoDexcPIUuXiDpnOfxWII7NJFqyg==
X-Google-Smtp-Source: APXvYqwQ7z8znKmubuBIgR31+9p1eg7UMtNPW9S5EYCpJTKszx56IPpvbJ6XpTXteGOx38q7pSwx96CpB+nLFYXSbYE=
X-Received: by 2002:a1c:9c14:: with SMTP id f20mr3917693wme.16.1553483970223; 
 Sun, 24 Mar 2019 20:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190324110804.68555-1-anup.patel@wdc.com>
 <20190324145708.GA3355@lst.de> <20190324164316.GA2925@rapoport-lnx>
In-Reply-To: <20190324164316.GA2925@rapoport-lnx>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 25 Mar 2019 08:49:19 +0530
Message-ID: <CAAhSdy1JcvFtzwcUpd5xHbeUiCBoTCy+AnEiW+nQAs2KHez44Q@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Always compile mm/init.c with cmodel=medany
To: Mike Rapoport <rppt@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_201936_039264_B66B8731 
X-CRM114-Status: UNSURE (   7.85  )
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
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Mar 24, 2019 at 10:13 PM Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> On Sun, Mar 24, 2019 at 03:57:08PM +0100, Christoph Hellwig wrote:
> > On Sun, Mar 24, 2019 at 11:08:29AM +0000, Anup Patel wrote:
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> >
> > Huh?  I don't think this is from Mike and me.
>
> Suggested-by: would me more appropriate indeed :)

Sure, I will use Suggested-by: here.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
