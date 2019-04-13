Return-Path: <SRS0=1PsB=SP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42510C10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2019 08:15:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 104312075B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2019 08:15:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cBr3qbfb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="zsgFh4ii"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 104312075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ErchWQjdaxEvw9c4QysmkY7kUSYLPr5msM+DaWTawCk=; b=cBr3qbfbxJQr3I
	MzFuILDZlbFXr11rz1mqf8/FCsKyc3tdhu81lJO6fDxs7TXOxUZksfENzBQ5Q1qbLwqz+oR/Xlb8r
	tj+1XrFtDcf9tTN2XIEesByThVqw/SZs0OpV2XN90VU3JvKOQMFDrjlyrUUgELGzlALVPmU+7Tm45
	dScsTLpPV7/NCXxXZdkvH4YgzKTw4ARIN2RJHi9BaIcgbiqKthKxHxKxXXftRFqxSo9mdtnzaRQ31
	Q0/+soyivvCyzJoTISaLMYy9wzjgCjlgIUi+5mNKZLNyEIbk1pZHd3yHqlOV0FmMUiUC7H3p4rE9l
	3cJpR6+8UHsGTME3cVNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFDoq-0007CQ-Er; Sat, 13 Apr 2019 08:15:24 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFDon-0007Bq-Nu
 for linux-riscv@lists.infradead.org; Sat, 13 Apr 2019 08:15:22 +0000
Received: by mail-wm1-x342.google.com with SMTP id z11so14046685wmi.0
 for <linux-riscv@lists.infradead.org>; Sat, 13 Apr 2019 01:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sGAqxRlimZcOm/Xnh2p9ngnwXcLC61Kd6elJxjX23VM=;
 b=zsgFh4iiVEwsELbHacinBUU3Cnmzy1mXBMRvQJPYvIInH4pi4yjZ+WtapkeRGZcYws
 oTVMNZNBiz0c9aRuaHcPOmJ2lToCZGL8GD3dHk2IdY1hB5DUa6qqk+j8ajt/dc7p0wqP
 k2/0FTtqFuak7qUrPpcJcrb/r9jJSyvpLOqxd4UJD/Sb/YxaKJNUyN9j4kc6EYgb6pAJ
 0Pq2nuzH3dc+q74dGuq2t/ZnNhAoUb6+q0m3ZmIxxySKhH0N06gP5yznnfaLb3zEDnZc
 7zBKMJAqMbojJDRwVu9TC4CCiy0XeViK6j1F9PyX1u3f8r5WG3rjqXRzR2+X9AiA47BV
 9Idg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sGAqxRlimZcOm/Xnh2p9ngnwXcLC61Kd6elJxjX23VM=;
 b=p0KcQ6TSglYW5Q9iZxQA2cjwYHCGInRRdDeN3874nLt5Nnj8Xal1URy63+S6Y3CAXI
 T52tpAHD9i/3AAgGi0DlAOjfOgf/4aINKbRhLDIazs4yCPde/3NU2RULGGl5dh3ixWW7
 5JAAHFtBWStuiw3IbJVPJcpiBPfHWLFKlUNYw4ZdKZNvOv2PfbMzoHxF/mo8mzsXmM5q
 9QBqatPpe1ss1B3I2z0TU4Bh7kFyR6gk8pj4JIbJbvBMs3nhcG5hXfFDxPPO2LFxCe4y
 r+SUCV4QyeNlCkmejf9qOqFgN3QBD0cyT0NpLmbFfsYnh+W26WXIXaRI+8ZUYO08CW3x
 w7QQ==
X-Gm-Message-State: APjAAAXm6pS7rd3ixab5bfPleu+8/Kkts1JVO1yEc4rhpmRyhB8Ouwt9
 wJpegB78TuJq/kCq9PiI5ttJQ+yyVNRIfQ+wzcVwDg==
X-Google-Smtp-Source: APXvYqzxTOptLpLvIZ+s4YBYwiUgW/U2Oo9cQPEaaI40BOJY/WK61fjvQvyk45Z6tkeCofkvMQzRf+3HRccRPa5FUDg=
X-Received: by 2002:a1c:544f:: with SMTP id p15mr13683726wmi.65.1555143318269; 
 Sat, 13 Apr 2019 01:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190413073906.53676-1-anup.patel@wdc.com>
 <20190413073906.53676-4-anup.patel@wdc.com>
 <20190413075548.GC30428@infradead.org>
In-Reply-To: <20190413075548.GC30428@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 13 Apr 2019 13:45:07 +0530
Message-ID: <CAAhSdy2MJVOLQ_nTTf6FvSOPbyaCxL-J-eT2PfGMubptBL+rnw@mail.gmail.com>
Subject: Re: [PATCH 3/3] RISC-V: Access CSRs using CSR numbers
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_011521_787248_C0BC5226 
X-CRM114-Status: UNSURE (   8.43  )
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

On Sat, Apr 13, 2019 at 1:25 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Sat, Apr 13, 2019 at 07:39:44AM +0000, Anup Patel wrote:
> > We should prefer accessing CSRs using their CSR numbers because:
> > 1. It compiles fine with older toolchains.
> > 2. We can use latest CSR names in #define macro names of CSR numbers
> >    as-per RISC-V spec.
> > 3. We can access newly added CSRs even if toolchain does not recognize
> >    newly addes CSRs by name.
>
> This looks mostly fine, but also please remove all the comments
> regarding using sptbr instead of satp now that they are not true
> anymore.

Sure, will do.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
