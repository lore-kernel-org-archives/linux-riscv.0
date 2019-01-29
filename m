Return-Path: <SRS0=xvkM=QF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC09C169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 29 Jan 2019 04:33:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD43B2175B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 29 Jan 2019 04:33:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AyKmJQFL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dsCKGCXd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD43B2175B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BAD/hoQSuBkuWDx/7C6M2Xhw+qztssgJpPKXB9TQCOU=; b=AyKmJQFLuV2Fx+
	oHdyTxoAJ89INDS5R7M5Dd+PvML+0V47fJ9qa8sexw1tPUG4hIkqQSP9n3AbgxXpuakBTbRaydWFb
	aeo0oAo+8OCAWllU5xxyYbuz2ekm/S3M7+4czQR+jA13cC0n30TW7fzR2paQLlFHRxeC/gKoQWblr
	La4VFrNN1FxjjlBDiwHn+13x3ueHsouAb0sZLe8yFLb0DmAhyH21JfuO7a4SaYXdAkyL+uOq9Jy7K
	0AHti6wv+uvgfsZsX6YiJsCAjcxdonabMaIVKKR+qA/ja9LJHom7Tn0nbI2mbiAu6Dt0OLgdYa3lm
	Bp8NbRT9sTrT2rr8pnKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goL5w-0003IB-3C; Tue, 29 Jan 2019 04:33:56 +0000
Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goL5H-0002uV-PB
 for linux-riscv@lists.infradead.org; Tue, 29 Jan 2019 04:33:33 +0000
Received: by mail-it1-x141.google.com with SMTP id h193so2087151ita.5
 for <linux-riscv@lists.infradead.org>; Mon, 28 Jan 2019 20:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JiacGnRmtpnkBNm9jy8wy8Xr9QhXLFk2xGOSD7e6CWw=;
 b=dsCKGCXdyOHpE/jK77RmvK5QfaJbddcvXT1Qv54XFCHbG6+jgfHIsW+6slYXYuvfd1
 CW/1RzFhY87Paj5ThIxUYi7iLPEot3Fj1hwGl5qocfJRunYCedrCRvKDh9QwCYRyBiJP
 0ZG+rD15rkAWw1w6buMp1CfH/Uv3iVWlD1qPRee5Me03g3EVbFj3v6KiB2dT78r6yJDh
 zSILHRbZbkUM+IJvGQMzn6oxIF/JXkYsXFUd64Q9OhQCldhBP57YCd1sIt/pJLaFaqHP
 lCPziS5dCcjq5K62pHM9wkK5uFV9aWMUCC4EzLXnYuzRsDu0za/dQn5NBmF+6g9fZhml
 D4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JiacGnRmtpnkBNm9jy8wy8Xr9QhXLFk2xGOSD7e6CWw=;
 b=qEYukGM/HPHhn1tGV5P4mTkaWpwEmgX8PqydZwyiw4MlsmwmQT6Ygj/boKxTHaz48r
 5lGNEntmBXDP0YbfL4bJJN2d4DoPmeiwYmAXtxMStGbWD5jx5Vh0ZkK9CEO3EH7xMIjy
 z6AuhpNk6dkrSP3OXvWilLv2fT787NHmQJhqumh/DuK/9+VFCRljYT1TwerTTWXF6nki
 Z9aqXprhT3KtEcO+Yyi6c4UZ7SeVao+e05XFOAcqDkiWcI1dwV4wT53Nx4QhUtffyAvG
 rarKOF0Sa6oiC+bxeODg/Mj/0jvuqEoxlbdP7cc1t3LvRzIZbFpZWYvlHsugqprmtxJ9
 FuuQ==
X-Gm-Message-State: AJcUuke4LG3GWHV2U4C56Z0v6W8MLLcJjHWzxTf5zkzXd6fNFeu8CDWi
 fqoGV4rx/Xy5eMTr4NOZ1ohgTPEpue8GwbLIvg0=
X-Google-Smtp-Source: ALg8bN7d62PV9itz7FRGHHmAXxi5N2oOVVbFSJIOue9VKpjZJcHdh8ggKSer/hgG0JPJp37UXDqgsnTEt773JHiEG+0=
X-Received: by 2002:a02:f42:: with SMTP id h63mr15206739jad.133.1548736394516; 
 Mon, 28 Jan 2019 20:33:14 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <7efecac7-17bd-5fc1-d0de-9fd498db4751@wdc.com>
 <d476c0e2b525fb0642b3155a247495cb1850c208.camel@kernel.crashing.org>
 <452be0d3-da8e-643e-9f91-c38f0af36ffd@suse.de>
 <CAPweEDwdByUTHnbKGS-LbwGzqsjjWciWOBnPOKkNqupY--vV2A@mail.gmail.com>
 <033872b8-49d5-2731-118f-967488f4763f@suse.de>
 <CAP6exYJRhw=nnhdrNQc7wOBUTYk0-LNaRQrhin7fqxeXMrEhkQ@mail.gmail.com>
 <09bede45-6ecf-4ded-8615-0be38aac33fc@groups.riscv.org>
In-Reply-To: <09bede45-6ecf-4ded-8615-0be38aac33fc@groups.riscv.org>
From: ron minnich <rminnich@gmail.com>
Date: Mon, 28 Jan 2019 20:33:02 -0800
Message-ID: <CAP6exYJ=iSuMqetqwEZJgOL4FSG99Zk-qJSJz0xovkemWFWYvQ@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: Paul Miranda <paulcmiranda@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_203316_699571_83680EEA 
X-CRM114-Status: UNSURE (   9.63  )
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
Cc: mark.rutland@arm.com, Christoph Hellwig <hch@infradead.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 Olof Johansson <olof.johansson@gmail.com>, alankao@andestech.com,
 abner.chang@hpe.com, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexander Graf <agraf@suse.de>,
 zong@andestech.com, Atish Patra <atish.patra@wdc.com>,
 RISC-V SW Dev <sw-dev@groups.riscv.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>,
 mick@ics.forth.gr, Alistair Francis <Alistair.Francis@wdc.com>,
 Luke Kenneth Casson Leighton <lkcl@lkcl.net>, linux-riscv@lists.infradead.org,
 Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 28, 2019 at 7:48 PM Paul Miranda <paulcmiranda@gmail.com> wrote:
>

> I don't know enough about the rest of this thread to comment intelligently, but I'm curious what you advocate with respect to PMP?
> I believe it has usefulness in allowing M mode code to protect it from itself. Is your only concern that it may be used by ROM code that is not replaceable?

The rule is that measures taken by firmware to protect itself tend to
degrade overall security. We have ample evidence of this effect.

If firmware can protect it itself from the kernel, it's already
running at a higher privilege, and the history of firmware security
shows that is a poor practice. The last two years have shown it quite
a bit.
If the kernel wishes to lock down firmware from the kernel there are
already lots of ways to do that.

Sure, we do lockdown bits. That does not mean they're a good idea as
currently practiced.

ron

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
