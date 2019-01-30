Return-Path: <SRS0=j0kh=QG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC15C169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 30 Jan 2019 00:50:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28A1921473
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 30 Jan 2019 00:50:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oiKYUhxi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="iopA0oRV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28A1921473
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yj+zz4+gqg82kmWiWMip0VBXXPAzsZl22l/0h59YgeQ=; b=oiKYUhxi+dnXzC
	JbxnRoBamg/DPL7SWOuwaBRgFnuwC5rCKeWg+9fijEj4t2HOAS3Oc+QTikZpNd1Cm/Yc5RGCwhQgZ
	3rBG60pCadGZc8i0tHn+2NuptKRG3fyt7YQgDeA3b1wDsN/Jeto85wBKCvI9EbArb7wjVxk458IEF
	M83Jt1gUpnX+ghTUrC6wLhenNTIkhELLfRvBSVGpmtczG815QZ3h7ElxU87QWuwgymPWHSCkHAam+
	tPMi4p3DVBcP2x3wVvf0aSl5QI5D8BgOT1pNIjP/6uG6IMTynM87oyICstD+oKg8yFzIYtG/pf1Qi
	EA304uHKWsUKsFb9WOJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goe52-0006Dh-8P; Wed, 30 Jan 2019 00:50:16 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goe4y-00061l-0X
 for linux-riscv@lists.infradead.org; Wed, 30 Jan 2019 00:50:13 +0000
Received: by mail-wr1-x436.google.com with SMTP id t6so24143847wrr.12
 for <linux-riscv@lists.infradead.org>; Tue, 29 Jan 2019 16:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4Xaw4nSea17f7RcUYqMc/CPYUrJt7XcXfUepI+Ls9DQ=;
 b=iopA0oRVme7wcLyOSOPijzmUdH7Dkyg8f8PNp0Ux7J7FlU0+YIJsbJbP9nlvpEkyY9
 NJ/iFnNcKS8UmLJCSrvC2iVYkQkT30HH3Z5vYaj5N8GCEuuq19afsg2VvnVvz5IvvxF+
 Ki5o0+su8DkztqfLKzT9lw8/eG1PeZR0jTCPkFe/ndHsTCz+NWmz9fw3QrJhq5DRHX0N
 VWXB9dBznsG+Upb7h2Z9t5D+X4hJg4KRXFGHhm0DNPku1gXVLDni5viEaauFV2CLEwyE
 vOkogGFXT6mwohY7B3W2v72eKeHl9wPTFTB150XA2wjX6LNWptTnxtz38cdWUvPNVusk
 mPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4Xaw4nSea17f7RcUYqMc/CPYUrJt7XcXfUepI+Ls9DQ=;
 b=Qtcgrj2fs9zXDh5/p6swqLuJdeHDbvu1LjoKOVGqKobNNvWw/lCHbbhtRN+pRKnmTC
 4xyL71U7xjm/yFY3qDCx1u4sYZriigneea0EXrPrdgl8I7NckQJJPMAYrAVwJHp6FvHf
 22QZiSa5yc8bVATf/ulPX+C/qGbWsR/54QDQqh5sZm07dtBgaFBPt9eui2YdziTUM/vD
 g+gr3/GAH/Gej3bEUFef1MRN9kfGhLhupXro9Ax7uHf7zTnzZ7GKxHejgGuek6YU3Hsm
 5IqMI8nDIxserCAxoAAfVjBCSsDufhJL4l8AklfHTBZRn2Z/nAuibT0+psmiDEj7xgFT
 GwLQ==
X-Gm-Message-State: AJcUukfbn7pQriwQj0RyhgEhkt1DE1/QeWItbfZKCp3gDL5jQEEAoZzq
 kyQEw1H+yTAiwFdG3KYXCogND0fJ7/nqjvYVP901fA==
X-Google-Smtp-Source: ALg8bN4nOBzgFoyZ8sonKNE1h8ozuFMYmHwDIH0ndyBAieHAdGrihTPUCk3Ps+ZGVfyR4eDMC3b79+jUcCX4x2ul/QQ=
X-Received: by 2002:a5d:558a:: with SMTP id i10mr26926693wrv.287.1548809409441; 
 Tue, 29 Jan 2019 16:50:09 -0800 (PST)
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
From: Bruce Hoult <brucehoult@sifive.com>
Date: Tue, 29 Jan 2019 16:49:58 -0800
Message-ID: <CAP8PnuRkcPn_7j4FW+SKTKX0CxfPy089my29uZbUc+xSeJuV7g@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_165012_118963_125913B1 
X-CRM114-Status: GOOD (  10.07  )
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
 Christoph Hellwig <hch@infradead.org>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Olof Johansson <olof.johansson@gmail.com>,
 "alankao@andestech.com" <alankao@andestech.com>,
 "abner.chang@hpe.com" <abner.chang@hpe.com>, Atish Patra <atish.patra@wdc.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexander Graf <agraf@suse.de>,
 "zong@andestech.com" <zong@andestech.com>, ron minnich <rminnich@gmail.com>,
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

There needs to be some slight barrier to entry, some commitment
needed, otherwise the process has a real danger of simply being
flooded by concern-trolls and time-wasters and never completing.
Designing things by discussion and consensus rather than simply having
a completed spec handed down from some expert is already
time-consuming enough.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
