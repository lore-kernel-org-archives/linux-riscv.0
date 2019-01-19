Return-Path: <SRS0=HQJf=P3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F7BFC61CE4
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 10:42:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E298D2086A
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 10:42:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WQpd1JMh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="PSy4ti8V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E298D2086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O92Dx1jNEiJIUXOw3ZJV/iWQCJFcRD2vrUE7jdHNs/E=; b=WQpd1JMhQwoEFh
	xEbjcH4e1vUZxmChD/wvzJCBEJErm6CD+LLA4Y0d9r9QlnPDozrGK9lwskpJlBPLPVE2d18XME2xW
	4KJ5YITRdFUQMmU/OW9m2O/cznWKqyfD42UxRHUnwgZHAvjgrM7piYYzUG2akRi7IXrl3OCcKRFWT
	mF7SkKIzUWgm3EF5lO32kYM/IjMjA9VneGQzhTQAEeOgpy78Ugp0bFy+CTEErX4vehSY6XvsFecBd
	D0PWJ0Kgn6s6VYFMAk7Y+SzI1gb1/Vwn9ZRDiAvuwNR8pxBON/7XFxIH7uBHTg/D/CoklRUv8CBEG
	U9n3/RZIx9kmtTbyyl/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gko5G-0001kM-Ky; Sat, 19 Jan 2019 10:42:38 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gko5E-0001jn-7U
 for linux-riscv@lists.infradead.org; Sat, 19 Jan 2019 10:42:37 +0000
Received: by mail-wm1-x342.google.com with SMTP id d15so6710500wmb.3
 for <linux-riscv@lists.infradead.org>; Sat, 19 Jan 2019 02:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UEd4cxki9+m4DdvXxjUhMu6h0iHxu0fTOzTyJl5I/AI=;
 b=PSy4ti8VZpNjpHRPHzkf1+JxjlEBG3aYkYrU3Z9ZH8m9k+qlqh/4URa1Q/hk3PhpNB
 0wrofvdIUoMzxIKtJkjo/tXPl89IR6k9KwsG9OEeqq0wUlEuGqHlrbONbjpp4dBvJ5Ps
 8Fad5rKc4/sEro9GhouyzXMRQ1TkGsPmnlr3Mgbs5gfFYAkreTJRUwZo2H7QXvWd6Z68
 oWMUPmDOH1a/eMKF2sLonGxdHCLBYM4lylzxgtP8FeeZjE7j7Z26T+DbonslB4iS98xR
 FXm/dJnImfooepGSmT1rfZeFnRV+UJpJTj1K73aQmRrpnpXrPXnioo6ZWo2M+nsstmvc
 TBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UEd4cxki9+m4DdvXxjUhMu6h0iHxu0fTOzTyJl5I/AI=;
 b=PsB0xI6z1R0m0pmZRJQcwOi9hCfIIFEQF7+YPEgQByFjpa8Ew3HbtvX6XmyiGsCbfR
 LYQLZDzSCvZ4Aj4VqA3M0OH1GEl7fg7GXJ+ja/tzcyJANEx7ZNlhPhgNHcJMfGkFdaXM
 b8DECn3whX4f+r8ySyaHoWGK8KF7VBB5aUH67eOipcGSk+MNshnyWFHAhqxxH/70ycka
 dw2OGxEoKSnoqpdtrE8g14U0yDL2YAFZ2xPL4oOGNA3qrc7XaTh2xFkRi820wl5V/D4m
 WSf0YyczwRpEAq1RBxlAl5HRz6UBSbmqUy8u8Ql61/seYbcVChS9dSfjPBFumgfzQvye
 cSDg==
X-Gm-Message-State: AJcUukeuF2e4UN/8/X3N3TAs0iChZivo+p9I7xm17dzemf7WttpX572C
 +XIcbAtcw2JPvv54ZM2eVMn012CRwCpDcfRq+tJrFA==
X-Google-Smtp-Source: ALg8bN5Viv/FnJkD+dxMigBx/5i2ECzC22YPB2Y24b1H6MQooVFiVfucZtcsn26Oj2cve88oQkQd3Mc+tIUz7sCSOgw=
X-Received: by 2002:a1c:f509:: with SMTP id t9mr19506057wmh.76.1547894553425; 
 Sat, 19 Jan 2019 02:42:33 -0800 (PST)
MIME-Version: 1.0
References: <20190107161047.10516-1-anup@brainfault.org>
 <20190107161047.10516-3-anup@brainfault.org>
 <20190115134410.GC13216@infradead.org>
In-Reply-To: <20190115134410.GC13216@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 19 Jan 2019 16:12:22 +0530
Message-ID: <CAAhSdy1uOVg6R24Wx-g0Z-ejunMfbE9R7yhu8fEGfLzmqE1Bhg@mail.gmail.com>
Subject: Re: [PATCH 2/5] RISC-V: Setup init_mm before parse_early_param()
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190119_024236_271792_92F23423 
X-CRM114-Status: UNSURE (   9.69  )
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
> On Mon, Jan 07, 2019 at 09:40:44PM +0530, Anup Patel wrote:
> > From: Anup Patel <anup.patel@wdc.com>
> >
> > We should setup init_mm before doing parse_early_param()
> > in setup_arch() to be consistent with setup_arch() of
> > other architectures such as x86, ARM, and ARM64.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
>
> Is there any good inherent reason why the order matters?  Not that I
> really care either way..

The parse_early_param() calls param callbacks in variety
of subsystems including MM. Doing init_mm setup before
parse_early_param() ensures that initial MM state is
available when MM param callbacks are called.

My intention was mainly to make boot-up flow similar
to x86, ARM and ARM64 so that it is easy to add
features already present in these arch ports.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
