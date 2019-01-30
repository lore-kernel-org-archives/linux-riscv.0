Return-Path: <SRS0=j0kh=QG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB7C0C169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 30 Jan 2019 03:17:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88D7B2175B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 30 Jan 2019 03:17:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oCGdf1E6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lkcl.net header.i=@lkcl.net header.b="A5dIykkY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88D7B2175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lkcl.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=31EEysz8W8l9SvO43IbaQlMV2NXD+w1NbnDNl/rgoyQ=; b=oCGdf1E6uqYDQd
	E2TqsLSJLP3yeQyBchG5ePXGUhkqzm3UcM/g/CjUDdTlLHtncbkpXA4DOQoouzVc4SCRk9YKr06U5
	SUfQhv60mY2lMRh7enhXzQGPSizTZBfeoaKWK9gyictI1WnP6iRAmr8CK9qNsi3+T4PCgGP6fRlNr
	8Zpznw684qWujaQ70wAnXrGuR6ZDZnIDDzFYjhCIpBO9hw+llGYFRkdl3POts/IGJ82KdjwptZT7U
	ObwGsJZ3tVLU0Ug9JtOuzXx3LcI9bujaXW7M9kTPQZqbEQO1DiA3stdY2C8mzEF6g++gPETg0+JHe
	rf8edE35ZdyPiKbhpN9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gogNC-0000rS-I4; Wed, 30 Jan 2019 03:17:10 +0000
Received: from lkcl.net ([217.147.94.29])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gogMi-0000Uy-Tv
 for linux-riscv@lists.infradead.org; Wed, 30 Jan 2019 03:17:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lkcl.net;
 s=201607131; 
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
 bh=1vwml3YTgNReit5lZzmrEULwcbqFSJ91PlyRyram9ik=; 
 b=A5dIykkYEWGmHGdagwBd5WLm19xt2wJsPQqj5YbHOJJtTbeVd4cxGW70OmXEoTrOx8NNvEYJP63K7wS+ADUQGWoWw/iSKgm5Tx8oIjnJdK5T4o9kSu2DrQNx51ZFAtlf4kFgCbj3dPDcDja2+5yBpFK0Vmw1QqEMqSuYLamO+AI=;
Received: from mail-lj1-f169.google.com ([209.85.208.169])
 by lkcl.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <lkcl@lkcl.net>) id 1gogMf-0007wi-5T
 for linux-riscv@lists.infradead.org; Wed, 30 Jan 2019 03:16:37 +0000
Received: by mail-lj1-f169.google.com with SMTP id c19-v6so19409245lja.5
 for <linux-riscv@lists.infradead.org>; Tue, 29 Jan 2019 19:16:16 -0800 (PST)
X-Gm-Message-State: AJcUukfesXnDjcRP0r9zV0s4TMSPoLwYFXVNV2J2QdfQp/T20F2J82Hf
 MymslbQ7W1aFbCqm1BiLOcSve2ku0WlT6GL6CW8=
X-Google-Smtp-Source: ALg8bN5d/xCs+sjVNyl1w8dBJZ1esW+euHAHcNm2UhDO3eU4H/L+5gCS1s4xB1TOewagJzDpuIadA3tU7LTXWwqp+aQ=
X-Received: by 2002:a2e:9256:: with SMTP id
 v22-v6mr20691556ljg.178.1548818170699; 
 Tue, 29 Jan 2019 19:16:10 -0800 (PST)
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
 <CAP8PnuRkcPn_7j4FW+SKTKX0CxfPy089my29uZbUc+xSeJuV7g@mail.gmail.com>
In-Reply-To: <CAP8PnuRkcPn_7j4FW+SKTKX0CxfPy089my29uZbUc+xSeJuV7g@mail.gmail.com>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Date: Wed, 30 Jan 2019 03:15:58 +0000
X-Gmail-Original-Message-ID: <CAPweEDxoNLqHNiEZouBEzKoZM5-9u22yDUNW+v4ZTLjq4ZeCrg@mail.gmail.com>
Message-ID: <CAPweEDxoNLqHNiEZouBEzKoZM5-9u22yDUNW+v4ZTLjq4ZeCrg@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: Bruce Hoult <brucehoult@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_191641_220017_6517BBE3 
X-CRM114-Status: GOOD (  14.33  )
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

---
crowd-funded eco-conscious hardware: https://www.crowdsupply.com/eoma68

On Wed, Jan 30, 2019 at 12:50 AM Bruce Hoult <brucehoult@sifive.com> wrote:
>
> On Tue, Jan 29, 2019 at 4:06 PM Luke Kenneth Casson Leighton
> <lkcl@lkcl.net> wrote:
> >
> > ---
> > crowd-funded eco-conscious hardware: https://www.crowdsupply.com/eoma68
> >
> > On Tue, Jan 29, 2019 at 11:26 PM Palmer Dabbelt <palmer@sifive.com> wrote:
> >
> > > Yep, and the hope here is that we can build something that allows everyone to implement their systems within the same framework.  With any luck we'll be able to build a platform specification that allows both of these systems to exist -- essentially "boot Linux into M-mode" or "boot Linux into S-mode".  It'll be work to make sure the spec can work for everyone, but that's part of the way to get a good spec.
> >
> >  ... and how is that to be achieved if the RISC-V Foundation
> > pathologically insists on secretive closed-doors discussions when it
> > comes to RISC-V specifications?
> >
> >  it's time for the RISC-V Foundation to recognise that the ITU-style
> > closed doors practice is damaging the ecosystem by preventing people
> > from contributing.
>
> There needs to be some slight barrier to entry, some commitment
> needed, otherwise the process has a real danger of simply being
> flooded by concern-trolls and time-wasters and never completing.

 it's a legitimate concern, that i've witnessed from a couple of
"open" projects.  one of them was the mozilla "B2G" initiative, which
was flooded with top-postings of wannabe security "contributors" with
zero actual security experience, that drowned out legitimate security
analysis from "outsiders".

 it turned out in that particular case that it was well-known (for
over a decade) that there was a "core" team, who had absolutely no
intention whatsoever of listening to "outsider" constructive feedback,
regardless of consequences (including severe security design flaws).

 the "public discussion" was therefore preettty much pointless, and a
political sop.  it served a purpose of providing a bike-shed magnet so
that the "real" discussion by the "core team" could take place in
secret.

 ... guess what?  the project failed.

> Designing things by discussion and consensus rather than simply having
> a completed spec handed down from some expert is already
> time-consuming enough.

 it is... and that's just something that has to be accepted.  in open
(unregulated) discussions, what i find tends to happen is as follows:

 * time-wasters - those people not actually committed to the *genuine*
process of achieving the defined goal - tend to fall away through a
process of attrition.  over time, they simply don't get traction
(attention) and, through lack of long-term committment, they simply...
give up.

 * a *small* number of pathologically / psychologically disturbed
people, after a *long* and very very patient repetition of
non-confrontational hints from a large enough group, *eventually* get
the message and also give up.

which leaves behind a core of dedicated people who are *actually*
committed to the goal.  where it gets complicated is if the goal has
not been clearly defined, there is conflict and confusion,
proportional to the number of contributors.

the bottom line is: people have to be *really* dedicated to want to
contribute in this extremely technical field.  those people that are
not so motivated and not sufficiently technically competent become,
over time, quite easy to empirically identify.

l.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
