Return-Path: <SRS0=j0kh=QG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358B4C282C7
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 30 Jan 2019 00:06:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9BF52175B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 30 Jan 2019 00:06:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BmEGkxUa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lkcl.net header.i=@lkcl.net header.b="HQAIC68p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9BF52175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lkcl.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P6EI3ZNlWI7RmuyH5N7BhOlhwMSiynkvilpMPYOHw6o=; b=BmEGkxUaqaQeRm
	ZOxnjFeJam86BDS9HP+L52D64vNAf0uMKoOgLdc4WlWziyO/ivvUAavwYpPKiGv9aDcK/FVkfeZxg
	siDO/4/joQpNI6aRY+FlMKncOx6et0s5j8pB+NfYZW+IlJ+xNSOwV/Rn/sKx4TTePBrm/zy0nnbMv
	S6EgZ2k4FaveI4eGcs5/8oHA9lNKFeMRtzHn+xnvdMevZPcIJndbjy5I7zmbGqRlI8uYHymuJRKxt
	fTigOQBOl8RY0w7AsfLnPiVWhikYFtj+DuNs+I3H3EiQjJJT70w7WrPRVED/kRk7pIGGVGGv8kA1K
	gx6/IIOefQEtT5DWxJ1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1godP4-0007jr-Q1; Wed, 30 Jan 2019 00:06:54 +0000
Received: from lkcl.net ([217.147.94.29])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1godOr-0007TH-5C
 for linux-riscv@lists.infradead.org; Wed, 30 Jan 2019 00:06:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lkcl.net;
 s=201607131; 
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
 bh=YR4YLxE21CM7nTY5HOAWBr/aF88y9c1QbwpZ51AEP2s=; 
 b=HQAIC68pnhGlygNW8F5qVefroyIEMO4BOZfUGugUFAXNBSuDWS5nTMgUiIz/zas6qlaBWt698rwEsDLCEdUjqiwYjKPsivuDugasWia7N3/YebT9aCu6t9dyizfUDq7KfT+N2kaRyDMnDUuk/iON7fybyvixkSuRYG2VsGXsvPA=;
Received: from mail-lj1-f170.google.com ([209.85.208.170])
 by lkcl.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <lkcl@lkcl.net>) id 1godOY-0007pn-M7
 for linux-riscv@lists.infradead.org; Wed, 30 Jan 2019 00:06:22 +0000
Received: by mail-lj1-f170.google.com with SMTP id q2-v6so19131657lji.10
 for <linux-riscv@lists.infradead.org>; Tue, 29 Jan 2019 16:06:06 -0800 (PST)
X-Gm-Message-State: AJcUukclq5QU79BZaTMlI8Law2S9Fl56FkvVLuw0VKlwko4yr7YWXAFE
 pwtfuzW6cxpu+lxOlPg94lLq7ogv/w9XMHdTr74=
X-Google-Smtp-Source: AHgI3IZ/DH9oc7aEH7TH6dgou/pkT4CMgZS+XX/GWsjbLry+ZVA/y3mbJGxRgiGSWLHvvnPxhlmTcqbICvqH1BnZvGY=
X-Received: by 2002:a2e:5703:: with SMTP id
 l3-v6mr10924158ljb.106.1548806760434; 
 Tue, 29 Jan 2019 16:06:00 -0800 (PST)
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
In-Reply-To: <CANs6eMk4z-ZibLW_5o03onu8AQe23uMa2hSieceHFqKS7igLDQ@mail.gmail.com>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Date: Wed, 30 Jan 2019 00:05:46 +0000
X-Gmail-Original-Message-ID: <CAPweEDwAGgTco1bhNqXVj1xxNMFespjSkTxe2DgcACkbTivAoQ@mail.gmail.com>
Message-ID: <CAPweEDwAGgTco1bhNqXVj1xxNMFespjSkTxe2DgcACkbTivAoQ@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_160641_340314_C029DC38 
X-CRM114-Status: UNSURE (   6.78  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 Bruce Hoult <brucehoult@sifive.com>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Olof Johansson <olof.johansson@gmail.com>,
 "alankao@andestech.com" <alankao@andestech.com>,
 "abner.chang@hpe.com" <abner.chang@hpe.com>, Atish Patra <atish.patra@wdc.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexander Graf <agraf@suse.de>,
 "zong@andestech.com" <zong@andestech.com>, ron minnich <rminnich@gmail.com>,
 "sw-dev@groups.riscv.org" <sw-dev@groups.riscv.org>,
 Anup Patel <anup@brainfault.org>, "mick@ics.forth.gr" <mick@ics.forth.gr>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Christoph Hellwig <hch@infradead.org>, Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

---
crowd-funded eco-conscious hardware: https://www.crowdsupply.com/eoma68

On Tue, Jan 29, 2019 at 11:26 PM Palmer Dabbelt <palmer@sifive.com> wrote:

> Yep, and the hope here is that we can build something that allows everyone to implement their systems within the same framework.  With any luck we'll be able to build a platform specification that allows both of these systems to exist -- essentially "boot Linux into M-mode" or "boot Linux into S-mode".  It'll be work to make sure the spec can work for everyone, but that's part of the way to get a good spec.

 ... and how is that to be achieved if the RISC-V Foundation
pathologically insists on secretive closed-doors discussions when it
comes to RISC-V specifications?

 it's time for the RISC-V Foundation to recognise that the ITU-style
closed doors practice is damaging the ecosystem by preventing people
from contributing.

l.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
