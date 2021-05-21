Return-Path: <SRS0=oP9+=KQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12294C433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 12:53:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 749D36101B
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 12:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 749D36101B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VKSLEqQ9yN5AP1pjGFGDLUpNc26uK+aDT0w/LNkxSw=; b=fnyTCsSzda7J2EaOIdypX0otHS
	YULzpZToOfJLx1cpKqY+6Q8LqfDsIkXtKrJp3nPy3g35SUnOEda4/fIQqZWCsKL7BbIMmTQaQQPRH
	mRjcBAO3l6qhrH69BtuNYfuT6YekFCITE5TvZNLBHfGYxBgB/mBLCEdPGSISi4eRCwWU2X0t3QENr
	ZfFRJTihUEBfOG9b6c5YxCTrJdlmLhjidZioztbC9ylRWv415pmLQJ12HUZYd0z9dUlPiZSiGrDJM
	ZkBqwE3VKK3DnrcpWGmDjWcS5hQyu/LK6s4NVUzsPbGPvdxdpKAf5h/qhDYXDJv5Hq9jPujkGv4Ou
	1uZE7Yxg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk4e4-005NUA-MK; Fri, 21 May 2021 12:52:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk4e2-005NTv-R2
 for linux-riscv@desiato.infradead.org; Fri, 21 May 2021 12:52:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=LBz0N/H2AYuYTe99L8IN2L1BlOwoBdUWjJLDEKhnr/c=; b=hIOmZHIFqbSn8+5QYL5q8OOahs
 PXJ6M9mRVAfPbiNnTP1U7Rxmw24fqVLTtg9cfcgRJ0C3ghWTikNRIlO4c68Wx1a3dR5YbW7xtvYGD
 USfPLnKBEhd5MO74w0WJvKzvsWV8DGmXPJW3bEkxhETwA5JJ6wX0noCQAVEABJi9VI6GD4cHkBE6p
 2M0gwEZQkaFZutLWQlyueLcGK4BSqCEdjoAhtP3SZ/EzIcl18t/Rqky39SphGUisR2o1G6d7g83i/
 THCN1oc9hDZZVpOHWVFAA9xtu80gJFD0+biEFmAFgmM1hLo1tkGlcQnyUjBCt2Y/ghyCjtbQcdQHS
 UQIVJwow==;
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk4dz-00H6zo-Sa
 for linux-riscv@lists.infradead.org; Fri, 21 May 2021 12:52:49 +0000
Received: by mail-lf1-x130.google.com with SMTP id j6so26849890lfr.11
 for <linux-riscv@lists.infradead.org>; Fri, 21 May 2021 05:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LBz0N/H2AYuYTe99L8IN2L1BlOwoBdUWjJLDEKhnr/c=;
 b=T69z0LmTzeJXqaXwhcq8MJjVHKJXg9U71fbL/y7Ge+6wDLZz1pVZIXbwHFa6W1Efhb
 pXq5DGM4oK9ZwQpLcgd5ruvaTx4X9xrzjlWK7urFF+j1pjVHhXctaxXaoRyMEWGFq0wO
 eoNhHljM27F8zq6cXzucBN0qYlBKNa80Vxl0M0EtllYx/6PXZ2yufMu63S3xwB/MEFyJ
 +TmEnHfIz4DoOsm7R6qyL1EclVXT/VlQUWp5KadgT7sLGv7UNRBqSEBVXeJWy3ow2LrW
 iVWDRTIUWF8Kx0mM0ZZjNCDYMt/uiz7puubquehd6sfCdjrst/HOILtXG9yY42WHICDh
 /2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LBz0N/H2AYuYTe99L8IN2L1BlOwoBdUWjJLDEKhnr/c=;
 b=LiKhBXIH9hbkrDgGE8ZrRzMdPrjPHnVxWEUHec66j0zz/84FmBE9Dzcn/7qY3Ppm5H
 lPvhQ3rSk93qzSVt0/i5FE6P5fksVkSaF0jyHlm8+QPfYpJr75Hg/+BJ5v9ZMqpYbopl
 Tfuaptsv8wdkHcP6xIIpbVPJ1iJzzix7QyST/fjJI8HYxhv4D6FM4qLptEBSa1VPX1wi
 HLjINwGSyJ2Whytfc2VKgAoI2cFGjPqGHtYuIGJOzDw/aeQ9tVt6uivGQ0cVQ2f49Um/
 7pbGhwQCWSq+cBanPKKqLTKrWkQcRD3kS0QAT8q3TiChFqdEVGBXMeXdALzpCgvyZRMV
 Hs5w==
X-Gm-Message-State: AOAM531PW8RN9Hf4TbYDTQlZ+CsqrweU1CDx0cav/q1JIoHb6aqADxnF
 idki2KB2+8EZpglvdvnf8X8MLo3xqtYfI/oP/qOC6g==
X-Google-Smtp-Source: ABdhPJxJCEu3ybVS+4YwTXi9Tv690RJ4IER7AHDybYUJS0fNdZNOP5aGEAudYSxXd7RnRNi7iCN5Dn8fXIIQnydPELI=
X-Received: by 2002:ac2:53b2:: with SMTP id j18mr2135683lfh.127.1621601565829; 
 Fri, 21 May 2021 05:52:45 -0700 (PDT)
MIME-Version: 1.0
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
 <87tuob7n8g.fsf@igel.home>
 <CANXhq0rTC8grpRe_Q0vG6_52b-41OuN4vHum8RvouMbE6xiXpQ@mail.gmail.com>
 <CALecT5jQ7_-d7j+MXrG++Bnr_wYmbWgCK20Ju5Pgjbu9xmwQBA@mail.gmail.com>
 <CANXhq0q-ou6h_Qxjtq52RQ_V2ERu8JLNa7Vq77Rpv_+SFX4LNA@mail.gmail.com>
 <CAMuHMdWGakAT1LKg_sje=ZYTbLX1_BjjOsqOYP9KrzhMmMi6Ag@mail.gmail.com>
 <CANXhq0oa+Sbk0jgXAkOYfutGqx+W+ToD5LuTLSkNCRFOm_=WYQ@mail.gmail.com>
In-Reply-To: <CANXhq0oa+Sbk0jgXAkOYfutGqx+W+ToD5LuTLSkNCRFOm_=WYQ@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 21 May 2021 20:52:35 +0800
Message-ID: <CANXhq0pvR3pNaHPYJxy6zs03Sgd-viwUPidKjPz5792tAYoj-A@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] clk: add driver for the SiFive FU740
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yixun Lan <yixun.lan@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Stephen Boyd <sboyd@kernel.org>, Pragnesh Patel <pragnesh.patel@openfive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Michael Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_055247_948986_D63D1E0F 
X-CRM114-Status: GOOD (  47.69  )
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

T24gRnJpLCBNYXkgMjEsIDIwMjEgYXQgNjozNCBQTSBab25nIExpIDx6b25nLmxpQHNpZml2ZS5j
b20+IHdyb3RlOgo+Cj4gT24gVGh1LCBNYXkgMjAsIDIwMjEgYXQgMjoxNyBBTSBHZWVydCBVeXR0
ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPiA+Cj4gPiBIaSBab25nLAo+
ID4KPiA+IE9uIFdlZCwgTWF5IDE5LCAyMDIxIGF0IDU6NTUgUE0gWm9uZyBMaSA8em9uZy5saUBz
aWZpdmUuY29tPiB3cm90ZToKPiA+ID4gT24gVHVlLCBNYXkgMTEsIDIwMjEgYXQgNDo1NyBQTSBZ
aXh1biBMYW4gPHlpeHVuLmxhbkBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+IE9uIFdlZCwgQXBy
IDE0LCAyMDIxIGF0IDI6MjUgUE0gWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPiB3cm90ZToK
PiA+ID4gPiA+IE9uIE1vbiwgQXByIDEyLCAyMDIxIGF0IDc6MzEgUE0gQW5kcmVhcyBTY2h3YWIg
PHNjaHdhYkBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIE3DpHIgMzEgMjAy
MSwgWm9uZyBMaSB3cm90ZToKPiA+ID4gPiA+ID4gPiBJIGZvdW5kIHRoYXQgdGhlIGdlbWd4bHBs
bCB3YXMgZGlzYWJsZWQgaW1tZWRpYXRlbHkgYnkgcG93ZXIKPiA+ID4gPiA+ID4gPiBtYW5hZ2Vt
ZW50IGFmdGVyIG1hY2IgZHJpdmVyIGluc3RhbGwuIFRoZSBtYWlubGluZSdzIGRlZmNvbmZpZyBk
b2Vzbid0Cj4gPiA+ID4gPiA+ID4gZW5hYmxlIENPTkZJR19QTSwgc28gdGhlIG5ldHdvcmsgaXMg
ZmluZSBvbiBpdC4gVGhlIG9wZW5zdXNlIGRlZmNvbmZpZwo+ID4gPiA+ID4gPiA+IGVuYWJsZXMg
Q09ORklHX1BNLCBhbmQgdGhlIHBhdGNoCj4gPiA+ID4gPiA+ID4gNzMyMzc0YTBiNDQwZDlhNzlj
ODQxMmYzMThhMjVjZDM3YmE2ZjRlMiBhZGRlZCB0aGUgZW5hYmxlL2Rpc2FibGUKPiA+ID4gPiA+
ID4gPiBjYWxsYmFjayBmdW5jdGlvbnMsIHNvIHRoZSBnZW1neGxwbGwgUExMLCBJIGhhdmUgbm8g
aWRlYSB3aHkgcG93ZXIKPiA+ID4gPiA+ID4gPiBtYW5hZ2VtZW50IGRpc2FibGUgaXQsIEkgd291
bGQga2VlcCB0cmFjZSBpdC4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gRG9lcyB0aGF0IG1lYW4g
dGhhdCBDT05GSUdfUE0gYWxzbyBhZmZlY3RzIHRoZSBGVTc0MD8KPiA+ID4gPiA+Cj4gPiA+ID4g
PiBZZXMsIHdlIGdvdCB0aGUgc2FtZSBwcm9ibGVtIG9uIHRoZSBGVTc0MC4gV2UgYXJlIGNoZWNr
aW5nIHRoZSBpc3N1ZS4KPiA+ID4gPiA+Cj4gPiA+ID4gSnVzdCBhIG1pbGQgcGluZywgYW55IHBy
b2dyZXNzIHJlZ2FyZGluZyB0aGlzIGlzc3VlPwo+ID4gPgo+ID4gPiBDdXJyZW50bHksIGlmIHJ1
bnRpbWUgcG93ZXIgbWFuYWdlbWVudCBpcyBlbmFibGVkLCBtYWNiIGRyaXZlciB3b3VsZAo+ID4g
PiBnbyB0byBzbGVlcCBhdCB0aGUgZW5kIG9mIG1hY2JfcHJvYmUsIHRoZW4gdGhlIGdpZ2FiaXQg
ZXRoZXJuZXQgUExMCj4gPiA+IHdvdWxkIGJlIGRpc2FibGVkLiAgRHVyaW5nIHRoaXMgcGVyaW9k
IG9mIHRpbWUsIHRoZSBzeXN0ZW0gd291bGQgaGFuZwo+ID4gPiB1cCBpZiB3ZSB0cnkgdG8gYWNj
ZXNzIEdFTUdYTCBjb250cm9sIHJlZ2lzdGVycywgaXQgbWVhbnMgdGhhdCB3ZQo+ID4gPiBjYW4n
dCBhY2Nlc3MgR0VNR1hMIGNvbnRyb2wgcmVnaXN0ZXJzIGJlZm9yZSB0aGUgZ2lnYWJpdCBldGhl
cm5ldCBQTEwKPiA+ID4gaXMgcmVzdW1lZCBhZ2Fpbi4gVGhlcmUgYXJlIHNvbWUgY2FzZXMsIGZv
ciBleGFtcGxlLCBpZiB3ZSBleGVjdXRlIHRoZQo+ID4KPiA+IFNvdW5kcyBmYW1pbGlhci4KPiA+
Cj4gPiA+ICdpZmNvbmZpZycgY29tbWFuZCwgaXQgd291bGQgZXZlbnR1YWxseSBnbyB0byB0aGUg
bWFjYl9nZXRfc3RhdHVzIHRvCj4gPgo+ID4gRG8geW91IG1lYW4gbWFjX2dldF9zdGF0cygpPyBt
YWNiX2dldF9zdGF0dXMoKSBkb2VzIG5vdCBleGlzdC4KPgo+IFNvcnJ5IGZvciB0aGUgdHlwbywg
aXQgc2hvdWxkIGJlIG1hY2JfZ2V0X3N0YXRzLgo+Cj4gPgo+ID4gPiBhY2Nlc3MgR0VNR1hMIGNv
bnRyb2wgcmVnaXN0ZXJzIGFuZCBjYXVzZSB0aGUgc3lzdGVtIHRvIGhhbmcgdXAuIEdpdmUKPiA+
ID4gbW9yZSBleGFtcGxlIGhlcmUsIGlmIHdlIGV4ZWN1dGUgJ2lwIGxpbmsgc2V0IGxvIHVwICYg
aXAgYWRkciBhZGQKPiA+ID4gMTI3LjAuMC4xLzggZGV2IGxvJywgaXQgd291bGQgY2F1c2UgdGhl
IHN5c3RlbSB0byBoYW5nIHVwLCBiZWNhdXNlCj4gPiA+IHRoZXNlIGNvbW1hbmRzIHdvdWxkIHRy
eSB0byBxdWVyeSB0aGUgaW50ZXJmYWNlcyBhbmQgZXZlbnR1YWxseSBnbyB0bwo+ID4gPiBtYWNi
X2dldF9zdGF0dXMgYXMgd2VsbC4gSG93ZXZlciwgaWYgd2UgY2FuIHJlc3VtZSB0aGUgZ2lnYWJp
dAo+ID4gPiBldGhlcm5ldCBQTEwgZmlyc3QsIHN1Y2ggYXMgJ2lwIGxpbmsgc2V0IGV0aDAgdXAn
IG9yICd1ZGhjcGMnLCB0aGVuCj4gPiA+IGV2ZXJ5dGhpbmcgZ29lcyB3ZWxsLiBJJ20gdHJ5aW5n
IHRvIGZpZ3VyZSBvdXQgaWYgdGhlcmUgYXJlIHNvbWUgaG9va3MKPiA+ID4gdGhhdCB3ZSBjYW4g
Y2hlY2sgdGhlIFBMTCBzdGF0dXMgaW4gdGhlIG1hY2IgZHJpdmVyIGJlZm9yZSBpdCBhY3R1YWxs
eQo+ID4gPiB0b3VjaGVzIHRoZSBjb250cm9sIHJlZ2lzdGVycy4gSWYgYW55b25lIGhhcyBhbiBp
ZGVhIGFib3V0IHRoYXQsCj4gPiA+IHBsZWFzZSBmZWVsIGZyZWUgdG8gcG9pbnQgaXQgb3V0IHRv
IG1lLCB0aGFua3MuCj4gPgo+ID4gQW5kIHlvdSBjYW5ub3QgY2FsbCBwbV9ydW50aW1lX2dldF9z
eW5jKCksIGFzIHRoaXMgaXMgY2FsbGVkIGZyb20KPiA+IGF0b21pYyBjb250ZWN0LiBPdGhlciBk
cml2ZXJzIGF2b2lkIGFjY2Vzc2luZyB0aGUgcmVnaXN0ZXJzIHdoaWxlCj4gPiB0aGUgZGV2aWNl
IGlzIG5vdCB1cCwgY2ZyLiBlLmcuIGNvbW1pdCA3ZmEyOTU1ZmY3MGNlNDUzICgic2hfZXRoOgo+
ID4gRml4IHNsZWVwaW5nIGZ1bmN0aW9uIGNhbGxlZCBmcm9tIGludmFsaWQgY29udGV4dCIpLgo+
ID4KPgo+IFRoYW5rcyBmb3IgeW91ciBoZWxwLiBJIGhhdmUgZG9uZSB0aGUgc2ltaWxhciBtb2Rp
ZmljYXRpb24gYnkKPiBmb2xsb3dpbmcgdGhlIHBhdGNoIHlvdSBwcm92aWRlZC4gSSBhbHNvIHZl
cmlmaWVkIHRoZSBidWcgdGhhdCB3ZSB1c2UKPiBwbV9ydW50aW1lX2dldF9zeW5jIHRoZXJlLiBJ
J20gZ29pbmcgdG8gcG9zdCB0aGUgZml4IHBhdGNoIGJ5IGFkZGluZwo+IHRoZSBpc19vcGVuZWQg
ZmxhZy4KPgo+IFRoYW5rcyBhZ2Fpbi4KCkkgaGF2ZSBwb3N0ZWQgYSBwYXRjaCB0byBmaXggdGhp
cyBwcm9ibGVtLiBNYW55IHRoYW5rcyB0byBhbGwgaW4gdGhpcyB0aHJlYWQuCgpodHRwczovL2xv
cmUua2VybmVsLm9yZy9uZXRkZXYvMjAyMTA1MjExMjQ4NTkuMTAxMDEyLTEtem9uZy5saUBzaWZp
dmUuY29tL1QvI3UKCj4KPiA+IEdye29ldGplLGVldGluZ31zLAo+ID4KPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgIEdlZXJ0Cj4gPgo+ID4gLS0KPiA+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBU
aGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcK
PiA+Cj4gPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwg
SSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0Cj4gPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJu
YWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
