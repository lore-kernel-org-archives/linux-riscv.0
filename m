Return-Path: <SRS0=fYgv=SR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA353C10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 07:29:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 886B420874
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 07:29:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IAZhm2m2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="e9tZMp82"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 886B420874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vca2IkMetdtBE+4zHjiGcOliYEroMNefy/sadcPeCA0=; b=IAZhm2m2cv2Fub
	rDtMjbVAEoGaRoD/+Dz/YG8dZR7o/ivHSRqe8ZEUT127Afe5W3lm3SYh+CTScFfSGVTYZ5szxxJxn
	WG6MUZhRHaoWw+gCuFPLMQrq0Q88hV4IV2AxIJFvtF1czGfXc8Mc6a5RwPY8uNAdxwfNrXdjjoUqt
	Yq2RSbrHkMdmcd/ehtBSoBbuYAWS5U7IiD2W4wBEY/qBifc9d83Y2IKi2cxzJHk37hDuI16d4uY3x
	iJTppuv6ihXE7TCNvzmKgq3Dj+GjFpNKP+nrN1DZ+togscJo5oyAyRGpVrdf/bx36tSKwYHg3Q8U5
	rFyiV6O23f9fmgEL9CFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFw3q-0005jr-Jv; Mon, 15 Apr 2019 07:29:50 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFw3o-0005j1-9i
 for linux-riscv@lists.infradead.org; Mon, 15 Apr 2019 07:29:49 +0000
Received: by mail-wm1-x344.google.com with SMTP id q16so19230904wmj.3
 for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2019 00:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ivIVXuZ5JKkuM5ppYwTsuuwYicPT88VzrKEjWRVhs2s=;
 b=e9tZMp825I78uwxh6o9KBmyQB4Ndl0aUXW2SYVr90HonLdnlv8VVuEEP3H9Srj7oxU
 bBTGxgvps20X5brAYRwvDMRIVUq8j8maXtnGrm19+fXQ+USOYVPQFw3n0Ix4TWcSCTGE
 AMuqHwNkT8zXGAyUcKmLQeBVe4PUGGhKHJX2bpZIJTE6WZ6xs9n9jPr93niAXNkiOAi6
 QNWj+2FFWw3M5jKt03p04i3CCdpsz6krAgSmZ0vZYMIulw9PNPkCZtb+HaxMAJRCHcGE
 YEqA5nuCK2ILUxZfbez4P9wZmSWwNVDhzlKAmthQlalPXVTNOQtOs3OQZNf0t3CnTE1N
 CGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ivIVXuZ5JKkuM5ppYwTsuuwYicPT88VzrKEjWRVhs2s=;
 b=Kcq33kDwb+Oflid12ltqBl9ROKtM/MQy8XlTr16ifGpzpQ06mHJ1IQxk878I7iXFsu
 1v2m3Mjf/MdvYoXDQczYk6yPD83FGMuCogjIQMzxSeEXwDqNNIynwSMxe1cdK/8ustaM
 e/DurhlIOu2gF92op9vBm6vzInB/1w56IQOybc3yb7FsJr7B24hBEidtB3Uk97eCrGrM
 60TgJex64CJALRA/E18qEITBSBselDhXdq4fS2/9+xpVvQm81Pwe6m+Lf0NCX2kV5oJI
 tmQFuMHzMY8X6ekvS2Vo9vT1Kb473xZPr2o4mH9es1+HxnEPyzNC2dyObe7otkbwCjsi
 btAQ==
X-Gm-Message-State: APjAAAXpGA1ts+nyCmNFOzTI5mhmMGH3RcPQBAzPZyy+YbiSSN069syJ
 V3JWFezdbqQmIZC8U2574ntBPaBxfukHLrIUeTLujQ==
X-Google-Smtp-Source: APXvYqzMwM6jim76mVHi8HYN0XBfCBJY4neXemYe2YujsAkXLixF10Rv04VEr5xG6muqTde888krC3tY5phghSWBhSU=
X-Received: by 2002:a1c:1f08:: with SMTP id f8mr19209628wmf.97.1555313382718; 
 Mon, 15 Apr 2019 00:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190413153807.116227-1-anup.patel@wdc.com>
 <20190413153807.116227-2-anup.patel@wdc.com>
 <20190415054949.GA9279@infradead.org>
In-Reply-To: <20190415054949.GA9279@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 15 Apr 2019 12:59:31 +0530
Message-ID: <CAAhSdy36A9-A4YiGuQptzbUL-VVnfJtRU_5jfC+nD4-fq+M8-Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] RISC-V: Add separate asm/encoding.h for spec
 related defines
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_002948_357290_831FB607 
X-CRM114-Status: GOOD (  14.14  )
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
 Atish Patra <Atish.Patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Apr 15, 2019 at 11:19 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Sat, Apr 13, 2019 at 03:38:35PM +0000, Anup Patel wrote:
> > It's better to have all RISC-V spec related defines in one place
> > so this patch adds separate asm/encoding.h for such defines which
> > can be included in assembly as well as C code.
>
> As per the discussion of version 1 on Saturday I disagree with this
> move.  There is both a philosophical and a practical reason for that:
>
>  a) in RISC-V CSR access is really nicely split out into a separate
>     number space, just accessed through a few special instructions.
>     It has no overlap with the rest of instruction encoding
>  b) <asm/csr.h> is pulled into just about every file build in the kernel
>     though <asm/irqflags.h>, <asm/switch_to.h> and <asm/thread_info.h>
>
> So even if you want to later add a new <asm/encoding.h> for instruction
> encoding details later, I'd rather prefer to keep CSR access separate
> from it.

Sure, no problem. I will add asm/encoding.h for instructions later.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
