Return-Path: <SRS0=xUWo=JJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4926CC433ED
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 11:32:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9B0B61206
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 11:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9B0B61206
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w06a6aIooJJr9GezVDqeZZnLSZV8DNhWO89KPkmVMP0=; b=CoNVJLcPuDzGNcevz1YN0IMXf
	ec2z3k2k3Z9OYMDgHPPa5AJz1SaHXvNSWVmibVZ+whSKkoy0Xrqw8K13i6cISdpmLrFM3QAQIPn1X
	9oNOoPBwNpSkUqmabetr0gNcOKexDWoXUpVHNO4pgRkwomdeooHcI59R09wdnFo3b6raDIK5KdTz/
	LL5M/CBwp6OMJI7YXmP22I1FLjLfIwDZFlILGOfOfK3vqy9Sbs42NE+lraDMm5oA41FnV8uMA0HUw
	xLy1gGY1MV2khEN1kSAlPiTgOwIh0etrba0b6X/EgAjFX7iUHXVwtvFzWIAL2IvPzKjh25BRTByt9
	PK94Bfgjw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVunR-006ZMA-Of; Mon, 12 Apr 2021 11:32:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVunN-006ZLk-MB
 for linux-riscv@desiato.infradead.org; Mon, 12 Apr 2021 11:31:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=nfD66Fq9DSP4Ln8d4D5cvVpwRwgj8YOd8Hv1PChoO0I=; b=44lYhhraQpXdfb6kiM9FI6DS13
 5jID/vlwIAxOi1aJ1jhzJp+3Y+De/Cdu8QnMd+V2wkqly5DuVV0NLB0bN1lGQqJ2I2rScK3oJS/yv
 4IPIvvw/pqjp+1/Bh4t89M0xV4POPR+eXVl3B4qQ7Ixpdp0QIWoXD4bmepZjkl03KsBM+L6rgZVl7
 jyoshzG3JUWYVYKa4pwpxY0545DuwSYjM7kptOInPe3Jtxb/0GssKauYLVNIp0Blg8DpcYNuGzZm+
 S+HofIsliuT8YjUuMiz0jQKbgCItBPSKbCBTIn6W7M/RzCUpImf3U6lOU7N4y8bgU+ZrSQDpxarbe
 BU5YlezQ==;
Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVunK-006BHX-Q2
 for linux-riscv@lists.infradead.org; Mon, 12 Apr 2021 11:31:56 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4FJmm10FGFz1s3pb;
 Mon, 12 Apr 2021 13:31:45 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4FJmm0627zz1r1MK;
 Mon, 12 Apr 2021 13:31:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id EglLZHD-29yn; Mon, 12 Apr 2021 13:31:43 +0200 (CEST)
X-Auth-Info: Ck3cUIHyMwTSrvrWjSo1RAiYHd/m6J6UJHJ+UhZhLBByE9hnwtEAV9Tz9dURqEKH
Received: from igel.home (ppp-46-244-166-146.dynamic.mnet-online.de
 [46.244.166.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 12 Apr 2021 13:31:43 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 63F852C3644; Mon, 12 Apr 2021 13:31:43 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Zong Li <zong.li@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Stephen Boyd <sboyd@kernel.org>,  Pragnesh Patel
 <pragnesh.patel@openfive.com>,  Albert Ou <aou@eecs.berkeley.edu>,
 Michael Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org,  linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v7 0/5] clk: add driver for the SiFive FU740
References: <20201209094916.17383-1-zong.li@sifive.com>
 <87v99qyjaz.fsf@igel.home>
 <CANXhq0oLxFK1431WmTj5HRO5k_omYkQZCBTG+HORTk9=W_XyNg@mail.gmail.com>
 <CANXhq0p90Cgha_zLzxamK9mxmVPn3effh_cZq_CTLrcAkKZg2Q@mail.gmail.com>
 <87lfaj7cki.fsf@igel.home> <871rc4on36.fsf@igel.home>
 <CANXhq0pDge0BPgAjoLrX7Y2qtofb3dhV1_CPHBaCg0o4cEMrbQ@mail.gmail.com>
 <87a6qrk2pw.fsf@igel.home>
 <CANXhq0rOeAWnRYHAYKJfDeY4kYz6+5mU_dJSqU67+2p9u0STHQ@mail.gmail.com>
 <874kgyfetu.fsf@igel.home>
 <CANXhq0rE-ZcPBp02Pvozpk_s-j6NhxHUmso75uz6ji9bejO8gA@mail.gmail.com>
 <87h7kukzy4.fsf@igel.home>
 <CANXhq0r5_xhFu3W9mUFkp_7BYUVBzvHZE1A6jpBDcL_KwTc1cA@mail.gmail.com>
X-Yow: LOOK!!  Sullen American teens wearing MADRAS shorts and
 ``Flock of Seagulls'' HAIRCUTS!
Date: Mon, 12 Apr 2021 13:31:43 +0200
In-Reply-To: <CANXhq0r5_xhFu3W9mUFkp_7BYUVBzvHZE1A6jpBDcL_KwTc1cA@mail.gmail.com>
 (Zong Li's message of "Wed, 31 Mar 2021 16:11:20 +0800")
Message-ID: <87tuob7n8g.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_043155_016237_2BE9AD83 
X-CRM114-Status: GOOD (  13.06  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTcOkciAzMSAyMDIxLCBab25nIExpIHdyb3RlOgoKPiBJIGZvdW5kIHRoYXQgdGhlIGdlbWd4
bHBsbCB3YXMgZGlzYWJsZWQgaW1tZWRpYXRlbHkgYnkgcG93ZXIKPiBtYW5hZ2VtZW50IGFmdGVy
IG1hY2IgZHJpdmVyIGluc3RhbGwuIFRoZSBtYWlubGluZSdzIGRlZmNvbmZpZyBkb2Vzbid0Cj4g
ZW5hYmxlIENPTkZJR19QTSwgc28gdGhlIG5ldHdvcmsgaXMgZmluZSBvbiBpdC4gVGhlIG9wZW5z
dXNlIGRlZmNvbmZpZwo+IGVuYWJsZXMgQ09ORklHX1BNLCBhbmQgdGhlIHBhdGNoCj4gNzMyMzc0
YTBiNDQwZDlhNzljODQxMmYzMThhMjVjZDM3YmE2ZjRlMiBhZGRlZCB0aGUgZW5hYmxlL2Rpc2Fi
bGUKPiBjYWxsYmFjayBmdW5jdGlvbnMsIHNvIHRoZSBnZW1neGxwbGwgUExMLCBJIGhhdmUgbm8g
aWRlYSB3aHkgcG93ZXIKPiBtYW5hZ2VtZW50IGRpc2FibGUgaXQsIEkgd291bGQga2VlcCB0cmFj
ZSBpdC4KCkRvZXMgdGhhdCBtZWFuIHRoYXQgQ09ORklHX1BNIGFsc28gYWZmZWN0cyB0aGUgRlU3
NDA/CgpBbmRyZWFzLgoKLS0gCkFuZHJlYXMgU2Nod2FiLCBzY2h3YWJAbGludXgtbTY4ay5vcmcK
R1BHIEtleSBmaW5nZXJwcmludCA9IDc1NzggRUI0NyBENEU1IDRENjkgMjUxMCAgMjU1MiBERjcz
IEU3ODAgQTlEQSBBRUMxCiJBbmQgbm93IGZvciBzb21ldGhpbmcgY29tcGxldGVseSBkaWZmZXJl
bnQuIgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
