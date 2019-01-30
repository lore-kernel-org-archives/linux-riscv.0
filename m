Return-Path: <SRS0=j0kh=QG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE0EC169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 30 Jan 2019 00:17:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 625882082E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 30 Jan 2019 00:17:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xz1xA+i0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FY5xxmU/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 625882082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MWCd/IfSu5XrTsRZ34b0BwHceCeVp8dPUrD2uQ1tenM=; b=Xz1xA+i01pA56x
	pnVb8RQyLitC0KECBQ6n+jpuTAGTpdl8NGh9y6jVtFLEeWSaOgayqnS7SZkexDITiW6m8W8zNdlDi
	e7vaEPRbq3kvRTfSolXjMMzkjrDUNxTnhaKrOdZL0UCAkJVYi2qy+7w/xhGMd9r9AbakPz+xJNz3E
	SMQ/GH0rDdOlpjudZid5MLSbI/NAu2TVHoVwkFxQxFQxPfpJp5ofH80+9Cllw0DTxYPSn0t2dnhHh
	FSlP45ZIgJW6Hkz98JXNXoTmKoG2TQWcrQY2+C74jKtktVtm6IugZb5HjnzJCTSa2EfmJgLcFl7yo
	RDtp/zBn7cKAB32jlTow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1godZT-0002yZ-3O; Wed, 30 Jan 2019 00:17:39 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1godZP-0002y2-DG
 for linux-riscv@lists.infradead.org; Wed, 30 Jan 2019 00:17:37 +0000
Received: by mail-io1-xd44.google.com with SMTP id t24so17946659ioi.0
 for <linux-riscv@lists.infradead.org>; Tue, 29 Jan 2019 16:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MzhVtJnMMoMG6p3B8rRrmgU9GXe+XQgi0BUbV5B141c=;
 b=FY5xxmU/qRKvkqug18ymi48A2mtoc+hwu6jazTPQ58PsyG1fX2xTiRVBIxgP8kRT7o
 PieaIC0HP8eLtoFNyJqKSEgrzp7I82NGvpbuotvy2A20R6KrQ2b64mv2K4tNhKoU3+Lb
 fQliIDpXaWuZtMMVOgyfgRGCtkA0mbhMw3+sKT5acsoCFH3wDkJAwBWOOxIX1s7YJM2j
 g3O8+2Sxnp/aoJSoD2s/PEuq+MzsNXxSpuYnwHGn0AUgFPg8bZnsb0I/ScwCauv6hN6s
 IeijK5D2tUKTMfyt5a0m/OE8LzPhjaBwXjjDt1KgrJMTI/98uma8UJPOrlbW2welGPlb
 kjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MzhVtJnMMoMG6p3B8rRrmgU9GXe+XQgi0BUbV5B141c=;
 b=Z/N9Ac7cOQmJxtcbCwpkLMxzojK3rJjtNC1Xow+5xUQONPnhgwH9ZGvS64xmgQ4JbQ
 VMRLSc8EplMpHGVwvn1KY+o2jCfCALvzfJGo4WXVH9AaDlcbewWE0LG1M+ldn3xP7vf0
 2Yv7X8VuV8BdQDEKuPCarbPZK4oBhEiJULSmTk7B9iT6UjNTElOgtsSIgbKhT45EXBeI
 RalZvKTq7ToNPPWuT8JfQSj78wTwgFj2YzgZganr4tXzYKaz07xdj4aItnTyOsthybP7
 D5vnRIUiuhZsLjP0KxuhUX+CEqe6TBggdMfFCVBAzJA1Vsr9MGfg5+EfaZajDVg+XgT/
 6d1Q==
X-Gm-Message-State: AHQUAuZEx4QL9V2bk7Xt+O+k+lDc2UHKkkw8yPhSg7dwsDf2cf9RtCwV
 cCyEZFMges9mAYj6AgkPBRfI/KlirzWFFTM8W4E=
X-Google-Smtp-Source: ALg8bN7q+XNHtmiMnaUSeKtAXuQm+4XcIc0zlU98daDR6/lwpsB6Jx0dXoRLgSFqcNsLB8t5k+Abn1eLfBqQtXTZ8Tg=
X-Received: by 2002:a6b:cb08:: with SMTP id b8mr15591703iog.200.1548807451878; 
 Tue, 29 Jan 2019 16:17:31 -0800 (PST)
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
 <CAP8PnuS4vE-w07dENEpJWx_nu-yx3fsyM3nu3kUQoVFW5nzJcQ@mail.gmail.com>
 <CAP6exYJD0Qrnni+yCUBdNWv0tmR=3vYzLwJTy+oOnQEb83ja1g@mail.gmail.com>
 <CANs6eMk4z-ZibLW_5o03onu8AQe23uMa2hSieceHFqKS7igLDQ@mail.gmail.com>
 <CAPweEDwAGgTco1bhNqXVj1xxNMFespjSkTxe2DgcACkbTivAoQ@mail.gmail.com>
In-Reply-To: <CAPweEDwAGgTco1bhNqXVj1xxNMFespjSkTxe2DgcACkbTivAoQ@mail.gmail.com>
From: ron minnich <rminnich@gmail.com>
Date: Tue, 29 Jan 2019 16:17:20 -0800
Message-ID: <CAP6exYJT4dqz6uG=RnLh0UhoE9JULE2me9Abjpv2En41r75B0g@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_161735_472126_60CDB349 
X-CRM114-Status: GOOD (  13.08  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 Bruce Hoult <brucehoult@sifive.com>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Olof Johansson <olof.johansson@gmail.com>,
 "alankao@andestech.com" <alankao@andestech.com>,
 "abner.chang@hpe.com" <abner.chang@hpe.com>,
 Christoph Hellwig <hch@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexander Graf <agraf@suse.de>,
 "zong@andestech.com" <zong@andestech.com>, Atish Patra <atish.patra@wdc.com>,
 "sw-dev@groups.riscv.org" <sw-dev@groups.riscv.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>,
 "mick@ics.forth.gr" <mick@ics.forth.gr>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

btw, w.r.t. carrying sbi with the kernel image.

When you get to a big enough world, and you get enough machines,
updating flash to update firmware runtime services is not guaranteed
to end well.
Flash just isn't that great and the less you depend on it the better.

So the idea of being able to fix an SBI problem by kexec'ing a kernel
that carries its own SBI is a very attractive idea. Anything that
reduces the role of persistent memory
for startup is a very attractive idea.

And this is why I believe an M mode that is changeable by the kernel
is a feature, not a bug: it let us do something we could not do
before.

That doesn't mean it is for every possible use; but the fact that you
can do it is great. You can't do that stuff on x86, for example, and
it's been a problem for 25 years now.
This is why I find riscv so attractive, it can free us from old thinking.


On Tue, Jan 29, 2019 at 4:06 PM Luke Kenneth Casson Leighton
<lkcl@lkcl.net> wrote:
>
> ---
> crowd-funded eco-conscious hardware: https://www.crowdsupply.com/eoma68
>
> On Tue, Jan 29, 2019 at 11:26 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> > Yep, and the hope here is that we can build something that allows everyone to implement their systems within the same framework.  With any luck we'll be able to build a platform specification that allows both of these systems to exist -- essentially "boot Linux into M-mode" or "boot Linux into S-mode".  It'll be work to make sure the spec can work for everyone, but that's part of the way to get a good spec.
>
>  ... and how is that to be achieved if the RISC-V Foundation
> pathologically insists on secretive closed-doors discussions when it
> comes to RISC-V specifications?
>
>  it's time for the RISC-V Foundation to recognise that the ITU-style
> closed doors practice is damaging the ecosystem by preventing people
> from contributing.
>
> l.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
