Return-Path: <SRS0=ShlG=SM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4001C10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 10:22:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAF02206B7
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 10:22:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dnb5o5K+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="W2J9txOg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAF02206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Btbg9hV9OhsIOM51j7R7z+i2elW+AmIpaiZXYtoJmUk=; b=Dnb5o5K+tQlg3O
	fXd7q67LhxobnuAeVQqyAkG4RZkiG59Lghsv0SJj7BlQJWSK1wmV4X6hqPbmUi/3oCzJ2b4c3JhCL
	+IdpY4RsiP0WQ5nREnWZhK6OaLdECcqtJ+nb7GnBTwxGwDbFu/gWFrL72eXFOjijHOE+8rZ9vxJea
	TRgSaEowVwn9U9vd5jFntsjf7wnxjOgdbDqNpfqBIK1ul4xu4FGbPUQZsZ5CjhTIsPn2otLdw+u3r
	eSV8ItvKw+zdBUhFwDwIHm/8Rvk0EdknIF3IMS/qxGHYq/d3+fzAmiDi1lk836KsxwT8gsYoebv0M
	MM0kfMjX+TcSIHWaLNDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEAMz-00050S-MC; Wed, 10 Apr 2019 10:22:17 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEAMv-0004zH-Th
 for linux-riscv@lists.infradead.org; Wed, 10 Apr 2019 10:22:15 +0000
Received: by mail-wm1-x343.google.com with SMTP id r186so4420373wmf.1
 for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2019 03:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hC3yJErFuiNdOYRVIL9NRuVBsVz7Rji/lapbq2QO4gI=;
 b=W2J9txOgf2S4u4z4LLzlg/hsw1WKtxESaq7+9EwCm/ENp/6lQEqfXefN4UO+5vF79X
 NHsvFQmtHLzEBqLH2DLVpO8GAicO/Gc+9x3mnY7IrnPVZBYZDKe2U7CQ+Z1qm5jS+vzQ
 kB9l4H3RkHrvwCLn7PM4Sp3QOp33is70MPV5ag5fPY7ldTWD8+eBX63rF4YfdwOYfR6Y
 doE5ffVftuGxcaO4RKnW/tD48x99aoTcnvWkCobVha7cS7KYQfEz1hq9WzTySfS/c/3n
 CjjjA+cDIQZKkqVprKnaq/+3dEX7cLifvLNHpx3q1SvLO3YneTM0GQh30AT4oK7fFJCK
 8GIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hC3yJErFuiNdOYRVIL9NRuVBsVz7Rji/lapbq2QO4gI=;
 b=okH96JY6w+QkQEOLRHCmCe87ClbCQVIdIbo2uN64OwgxXKtWAzQmcQDaKFqGvKiInm
 aGxcWSktocFW4+kHQx6pPqRJjveljbn4F8Na7fXt1U1MccUIL5JcuYWj4tIXgoAqdimU
 fogtsqmfr2qBwNzvp/CGyVGN8GCgnXMFwkse07QFJCFs41Qc035c5WLTm3in05NIMo7j
 rsGKM950LQmVvSVrXEEG3tQgzYBZ8JmfE5Obr1qEfSmdz25ewAekdqfw2T7TJQtP4igg
 FySS1xWbVtvif67JlL4T2E0E5gGhqWVnPPbmAOjMXLbGPdhYHtZFX1ibJO2rtQ9yd/U1
 sXow==
X-Gm-Message-State: APjAAAXOV7IAEXJphYKkHKno/wdQVSQKrxukfYafCG5gt0UWvTp9RQii
 PaIyuP8aA08UfSdPgvEoDtpj6uvUhfX07YGmQdK6ww==
X-Google-Smtp-Source: APXvYqxsKtFDTFBPJ3o0Zf73O5BLoFSaq9jj+4xs5hOupIeglP/qGuBhmaqYCk5W1hdTmzpOAIPGiAxhsG5cKwVDBXY=
X-Received: by 2002:a1c:1f08:: with SMTP id f8mr2066600wmf.97.1554891732001;
 Wed, 10 Apr 2019 03:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1553647082.git.gary@garyguo.net>
 <20190410070446.GA18678@infradead.org>
 <CAAhSdy36Ukh-rCZPnyQh9y8iUi730wBuY_qGO+ctK1_L=sCU1g@mail.gmail.com>
 <20190410101141.GA29411@infradead.org>
In-Reply-To: <20190410101141.GA29411@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 10 Apr 2019 15:52:00 +0530
Message-ID: <CAAhSdy3rnHBbc7EO7apnLr549ohQwTFk86GL=uMFiHex2_pEhA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] TLB/I$ flush cleanups and improvements
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_032214_303073_8A556FA5 
X-CRM114-Status: GOOD (  12.51  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Gary Guo <gary@garyguo.net>,
 Anup Patel <Anup.Patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, opensbi@lists.infradead.org,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 10, 2019 at 3:41 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Wed, Apr 10, 2019 at 02:31:04PM +0530, Anup Patel wrote:
> > > Can you clarify the races?  I know Anup had some FIFO-order commits
> > > in opensbi about a week ago, did they address you concerns?
> > >
> > > Anup, do you have performance numbers for the old opensbi vs your
> > > implementation of the optimized TLB flushing vs this patch?
> >
> > Atish had posted performance numbers on his GitHub PR at:
> > https://github.com/riscv/opensbi/pull/111
> >
> > These performance numbers are as follows.....
> >
> > Benchmark used: A microbenchmark that mmap a ramdisk (1G) and
> > multiple threads access 50MB of memory randomly.
> >
> > https://github.com/westerndigitalcorporation/hmmap/blob/master/userspace/hmmap_uspace_common.c
> >
> > The result is averaged over 25 iterations for 8 threads on HiFive
> > Unleashed board. In both cases around ~1M remote tlb flushes are triggered.
> >
> >                                  IPI               SBI            Gain
> > Average Write Time             2.53183        2.43263           +4.34%
> > Average Read Time             1.32198         1.24643           +6.09%
> > Total Time                    97.7589         92.859            +5.01%
>
> So what does this mean?  I assume the codebases are latest(-ish)
> opensbi and latest(-ish) kernel with the patches from Gary, and
> IPI is with the lernel based code enabled, and SBI is with the SBI
> calls?

Yes, this is measured using Gary's v4 patches.The IPI numbers are
with in-kernel remote TLB flush whereas SBI numbers are with
SBI-based remote TLB flush.

Atish's changes for remote TLB flushes are available in latest OpenSBI.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
