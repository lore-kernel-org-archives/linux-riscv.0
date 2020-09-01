Return-Path: <SRS0=nmAS=CK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A91C433E2
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2020 14:14:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C273A206EB
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2020 14:14:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zUT/i6Db";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mab-labs.com header.i=@mab-labs.com header.b="G2xD2jLB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C273A206EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mab-labs.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G/88TQgsVEVupkwqKlNjHeKPtC3ballTuOSDW2+/S8g=; b=zUT/i6Db4P/NNGGXtHzzUk/cx
	sXXSem+vNjm+jREG+tu8K+Z9LYYSseE8pTmiBvHLKBEXuZN0EGPuCFkPwFKbLqyRcDUN7l/ERDYNw
	lZhHbtqinOMo1r/eBqy3ytA0pq5Lr+3ap0IrkeMbJf2T950Z8FAd7dMJwVxdNmdaAM+2ZDy2DbMx+
	+v1jhALQ9OCJdlydFeiBD0dPVy+iyXsPK1fyzm2rq2Sc9HLKCA0fBiG6424cMNaZDFCVhiwcBCZRv
	JzY4vObw+jo8wyZNMRChXC2s9xMviolznO4PdP4D4b3vIs8QLGZaZyf1qiQcmxABRor8pMvnYddul
	i+yTNCm0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD73T-0001me-9Q; Tue, 01 Sep 2020 14:14:35 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD73Q-0001lg-7Z
 for linux-riscv@lists.infradead.org; Tue, 01 Sep 2020 14:14:33 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 3so1289203oih.0
 for <linux-riscv@lists.infradead.org>; Tue, 01 Sep 2020 07:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mab-labs.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LkeXauw8L2x2v3VmggvytEr+R94TXhNg5tKrBbUdpFc=;
 b=G2xD2jLBGd3QvYC5Qr0tH08ElavUwCTxBGaCrpy1A5CFZVWjPUwBvdPFqmPkUp2OEK
 Q0X5qzWbYphwk4hjKoekP6D0rYmFZET6P3IpEJ8VFfByV+F69cj0Cm3run2IEfCcHrIz
 CALKrb08piWFaQkTzmup0W9dCSVbLbPN4G9UqZlQC4DmZYOdnl/k2pBuWhD6taBmy8tT
 d878gzJ6DvcvT1ddIDkdkjVtKyaTfXhanMnugxH6MylFs96NqRqtn+UFweyP5poNSSx5
 r5AggifBheBmCAWMAxm+2fdU5qIKiB/SpgGG0QNPXhw758Cg6KruDngXs84jfea5Fn0Z
 Xrhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LkeXauw8L2x2v3VmggvytEr+R94TXhNg5tKrBbUdpFc=;
 b=bvRnR3DnFs2Xgjun9YlOMBTUjnTm2Za8M5KULFCRZVy5ENcuURudHv7VIhYw/QVa/x
 SFA55BeyoLH9gEwM1URiewBiu8mwhCk+PyUFAwWWYecCqPP8DzpD6DolVd+mOMF2QWj0
 vz/6J0ogHDSBG0uIYoK5xDKexccDI03s6OwUEj8Tb9k1659uguURK7yAnfw34NNwkoAZ
 /DU81MfIl5FmLdZTQRaYm/AupWwpTE/mDKy6m6WgRr70XzkBWpe2lSjjLLDHUQH4A9aU
 hk1liYIQav7Hhf8J01NUK2uqxR3/3aRcYbjGTHgwBsnG0pnmgAZTvxTjAmK0rXPWCcDW
 Y1bQ==
X-Gm-Message-State: AOAM532BFTk6+WkQeO7pjFUieSP5x3LsMt9uVIyBlrMoWOipbxIANZhy
 5ZOHO76tW1J4L6FBvysmDPsnHz5Ln3AnWo6zDjfsYw==
X-Google-Smtp-Source: ABdhPJzKvszq3J1vRd+3OEpF8fQrw6d5+MI1Qbeh4tv4IxuvkCwhe5jNuv9fj5YTRwSy5YSpHdjYrRl2pAmVv7CT7iw=
X-Received: by 2002:aca:b48b:: with SMTP id d133mr1294040oif.47.1598969668576; 
 Tue, 01 Sep 2020 07:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <CALkjhPrHDHRsFDh9n864xvK4DKU2GW68_TcA-Tz17udsOWjbFg@mail.gmail.com>
 <883c0f38-e002-ce16-d196-933a8b700776@gmail.com>
In-Reply-To: <883c0f38-e002-ce16-d196-933a8b700776@gmail.com>
From: Mohammed Billoo <mab@mab-labs.com>
Date: Tue, 1 Sep 2020 10:14:15 -0400
Message-ID: <CALkjhPr-wXSROT_bB2DA4N1jJT9B64_g9Q9xOHvckmeZYWm5Ng@mail.gmail.com>
Subject: Re: RISC-V testing needs on HW?
To: Sean Anderson <seanga2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_101432_310329_B47B2E51 
X-CRM114-Status: GOOD (  15.66  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Sep 1, 2020 at 6:42 AM Sean Anderson <seanga2@gmail.com> wrote:
> Can you test what happens when accessing ai ram (0x40600000-0x407FFFFF
> and 0x80600000-0x807FFFFF)? I have two boards where this appears to lock
> up the bus, but I have also heard it reported that accessing this area
> of ram works fine. If it works for you, can you please also report what
> your clock and reset settings are? Those should be controlled by the
> syscon device at 0x50440000.
>
> The ai ram takes up 2M, which is a lot of memory on a board with 8M
> total. It would be great to be able to use it when the KPU is not in
> use, but I have been unable to access it correctly. I have been testing
> mostly with U-Boot, but I experience the same problems when booting
> Linux.
>
> --Sean

Sure, is this on the latest master or the 5.8 release?


-- 
Mohammed A Billoo
Founder
MAB Labs, LLC
www.mab-labs.com
201-338-2022

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
