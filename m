Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1DC1C10F03
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 07:17:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DB2A2077C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 07:17:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jqyp6tng";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="14TjjWey"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DB2A2077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gLuxicRFFOT61GnNL01UEBA5tAJLpXKld1Sk+Rlf55k=; b=jqyp6tngP28poe
	Smd17OlERm5md0/3WivRCN0gaBrUnQPYSTJqvaaCcIBJCkTpcaQxcQs08g+fYpstbHRkEqkzptlw5
	co2a7cNZ6mHrQelB3Y0rhNZgjXS0EiXTquML+TVlmRpLQrOoBnu4MvOpI28l7lleknoOEgb/SGI0Q
	uk6tPG/GGUq4+dhyRrD3+nzgkd5yJCzux/GyCqER2DfpMQjKviIPx8Np7XZUOHWQFO+CoIt5T4OqP
	8qv7JJx6k//fmAIhKpCOvTCk4ZxHNDHYLtm319pYGnh6vzMTplbpa/KDHwwv1ho2t/Cvi45nryfCg
	dnPH0lALSkJMY09xc5Lw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJYd3-0003au-IS; Thu, 25 Apr 2019 07:17:09 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJYd0-0003a9-QZ
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 07:17:08 +0000
Received: by mail-wm1-x342.google.com with SMTP id h11so2119892wmb.5
 for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2019 00:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y/BUPD6d+UtQII/yZuGbxt7S/zR1HCXjPhQ5wZe2CYQ=;
 b=14TjjWeyO/+ZcGiUgm+nysR7uM0YIFldzaounkys1ZvpchAKEeBY3LpuiTZsBZ61vb
 siXfUnNUmUoA6cb4iZYESWz1Kg2cK4y+b3hxG7jD8Q2KI7wNBGMgTK5GfsFfY7+1lNqA
 WH5TTVe24dMgp2Jp+e/L2tdeSgMYnlIm4nI1MbBU4C2jf4by0pwr9LF955Cn417Vq1zW
 MpLE8AnaB44adbYXviK2SH7rb94DFzDBiPd8X6pQ3v8sIrmXK8X9cuw0qAemCgb5pS/V
 qGXFoWr78/vxeuW4ePOKaNiy+UfwxcCWItis6tzBNDAF1DxaPhNtEf1CwU5HhuRP+geJ
 yphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y/BUPD6d+UtQII/yZuGbxt7S/zR1HCXjPhQ5wZe2CYQ=;
 b=p/lWhgVyHu+yR8fGKGQfj099bsIrMY1XDbIyVDpmyt56koYmXBV+NNma3/9YP7wy6c
 FRYL2l54RvGkXgK0hrYnM9PD9ExGe/dkewlTrk4sXE2uCBOV4/t3pZ4sQJNO8fFBAfNh
 f7zIZI5tMJWVaXjuuBX4legIv+2VXcwlA5L0ZAax0jN54lngJyNFdMyfVBN+DOT+2fJT
 GvipK7TqhxNHLLTj1nfUZYP/SFVIb3mkVY4Yndzhc92gc6AlthjNEr+556562nuPcU9Y
 rlTpKQklJERE1ncdhP9RlgzCFIgj7htA/4CcGbmIyWVTVsDf8XOQN2rk5kL8rMlatcyd
 J8XQ==
X-Gm-Message-State: APjAAAXT5oPfdBI+G8wAwPQhHHYXNg0ZIndXfVjBrk6R4q9/5HwqzTJL
 t1CCRqp6OHgQu6RPPRtObGRjazZFOqsx5w4XgRGzZA==
X-Google-Smtp-Source: APXvYqyWmug1EZPZRrn81ikjGJ5Rr25YGmfW86k2Vc7/+guwtfM4kUSh659R0i1DWNkuUcy8Oqzqi5XYFEpMl7JE7O4=
X-Received: by 2002:a1c:a907:: with SMTP id s7mr2404626wme.153.1556176624209; 
 Thu, 25 Apr 2019 00:17:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190425055015.45487-1-anup.patel@wdc.com>
 <20190425055015.45487-3-anup.patel@wdc.com>
 <20190425055757.GA30545@infradead.org>
In-Reply-To: <20190425055757.GA30545@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 25 Apr 2019 12:46:52 +0530
Message-ID: <CAAhSdy36q1R8HQRG3kXDqj5JoJbO_drignvO7wCHJ3-6wkE5rw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] RISC-V: Add interrupt related SCAUSE defines in
 asm/csr.h
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_001707_000288_7CC5EF07 
X-CRM114-Status: UNSURE (   6.42  )
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
 Atish Patra <Atish.Patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 25, 2019 at 11:28 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> > +#ifdef CONFIG_64BIT
> > +#define SCAUSE_IRQ_FLAG              _AC(0x8000000000000000, UL)
> > +#else
> > +#define SCAUSE_IRQ_FLAG              _AC(0x80000000, UL)
> > +#endif
>
> Please keep the existing defintion that doesn't need an ifdef..

Sure, will do.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
