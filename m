Return-Path: <SRS0=oP9+=KQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 700C9C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 10:34:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2BCA613BD
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 10:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2BCA613BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dIZh2n1ynYzr+tagFGQ1ldVToKqEA3nypAursg1xc8c=; b=Mk7L6F4k8o5D20qQP7+b2dXqr2
	1uLs0RcQn4WgTofGbFdePrDzbAkuqk4utUUxBhQ8/zPf38OetKKmoXtK+FmJXrc1w1CAjjhmsg3s3
	zzw4LsxmdKBCvGjJ3MbyXTdmt9uL2JIlZeQYWoAK+b1RIzIajDv1f5kQP9Pma5Wr6PlEyup2/X6tM
	r4tJ4FziVDjBRdYqBibE1IDa6pohJrEEKWWdhrS8AoUxEKNIaDkdrTUMe6i+5DIziZW7ouUBUJKVw
	mFhwkB6E1epAvAUihGKwniYwhu2zwcvwpB5Gm7Q65PQOv9QOzWpMNP4hyIFJr/RN5PjGNWY3jnOLH
	+bg2+mCw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk2UT-004x8T-MF; Fri, 21 May 2021 10:34:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk2UP-004x7s-R3
 for linux-riscv@desiato.infradead.org; Fri, 21 May 2021 10:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=kK6AgO7HXHFP2fUm42xaKIkwVFtfr7s4UEqCfpCwl+E=; b=UK32/uWeKxqQk0qgEOwKVzdyWW
 C6mG1TYDRrY0u9LlZd2EH1Hhc3vitXv/ozyBhQ0np3qOCgEn/ncyNMaDv2/aiIezxpeVEoeuLD7Pq
 /ZWyX/exllzpirKXqvUH1DdJlXhKtlfaVZxrGJ6ThkVjXNTeiiJjGwGwWE27HSEba+IXdwdCLUDhu
 dW8DGPkct88fYwwwYPKGWxcDahnlgbosIxesCvDeU267rTWAiMi0V4U32h2pNBLZJqujZ4jLDmH8t
 j6RY49emUz7bDmFTIk5R+LeatI91ZqR5T2XgWf7pVc5QsGH9OH6cIAdr/TE8fHQV7gmXNZsj4LP9h
 X4Yl4i4Q==;
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk2UM-00H2cW-PG
 for linux-riscv@lists.infradead.org; Fri, 21 May 2021 10:34:44 +0000
Received: by mail-lf1-x136.google.com with SMTP id q7so27621550lfr.6
 for <linux-riscv@lists.infradead.org>; Fri, 21 May 2021 03:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kK6AgO7HXHFP2fUm42xaKIkwVFtfr7s4UEqCfpCwl+E=;
 b=KLXsG/m7VYE4A5kFfihQ0nvrjjtWr64VfJ9MIsUDEDaoUyzf2ksfVsY/hmHWk438jS
 gLj5ArZ5pG1grRrw5FkQnoUQqQE+U7K5HcAHszoNLaxEkUxhOrVwF4qrvota1Kw2P2fe
 pWOQPAwZuwM86fZcM9Qamfdw6W8EZbZhEVbaHAxlS4c92PbRxLfLOk7VUZXk7wezpPQD
 Jvbi6GwEMC7NQBO8wtaqJIXJ/xzYIVlWYtwWcXOwtsrIdV0U6Ggiug4zcNbKq6f6svKx
 fRTRkXhcnT6KVbQFcDaqdUxDGlslzVyddWeW13BVjEfs5MEZsJKGOJhaXYTHvvNv+Wpr
 BuXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kK6AgO7HXHFP2fUm42xaKIkwVFtfr7s4UEqCfpCwl+E=;
 b=UspgwU/UpEkiNBmu/Q6qLymNKBxeYvkBYPcZZ3ko/nwF6HdDsBleoyk0ecGRjHMzNi
 rXTZFnT1QzV3GZQHkUNGolbCNIdafEumCUIzX1NNV1Zxcp3tw8XPqtDSU7bDUDeoVkn+
 agGbNmX94p3icT4cEZ89WWpYlELkZtvdAL1bbCcd/TP49EC46gWPIP0ZKpbio9nepZDC
 oJrmXJ7os7PzusgAoV98D+qj++IpQSvhjqYz//WStYKX9FLWyxLjm8EvpQzeHSXXahHd
 BvUmQjy9S4hRvP/4Xf70/mgPVjPzfeAJPh7WqYgl9ZthcV4KwBqf62rgL7frxyFdqRIU
 7B9w==
X-Gm-Message-State: AOAM5314PZVo3+xSYSzveMly4PFmS1+Pf6gB41imR7xVcbYGClZrVBKe
 Y7lvHcy+5KWVwN4f34TWcGCCT32sWRgwyhEye9UBEw==
X-Google-Smtp-Source: ABdhPJxr8ksjnYYXAwQIU7SpRtn3uwwJcFL9tmSo9bdWPAP79uBcFzKF+7mYOD4NtS1AzPmeD2LebBnkFx9Z60j91qk=
X-Received: by 2002:a05:6512:471:: with SMTP id
 x17mr1771096lfd.553.1621593279771; 
 Fri, 21 May 2021 03:34:39 -0700 (PDT)
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
In-Reply-To: <CAMuHMdWGakAT1LKg_sje=ZYTbLX1_BjjOsqOYP9KrzhMmMi6Ag@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 21 May 2021 18:34:28 +0800
Message-ID: <CANXhq0oa+Sbk0jgXAkOYfutGqx+W+ToD5LuTLSkNCRFOm_=WYQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210521_033442_900658_847B8571 
X-CRM114-Status: GOOD (  43.37  )
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

T24gVGh1LCBNYXkgMjAsIDIwMjEgYXQgMjoxNyBBTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPgo+IEhpIFpvbmcsCj4KPiBPbiBXZWQsIE1heSAxOSwg
MjAyMSBhdCA1OjU1IFBNIFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gPiBP
biBUdWUsIE1heSAxMSwgMjAyMSBhdCA0OjU3IFBNIFlpeHVuIExhbiA8eWl4dW4ubGFuQGdtYWls
LmNvbT4gd3JvdGU6Cj4gPiA+IE9uIFdlZCwgQXByIDE0LCAyMDIxIGF0IDI6MjUgUE0gWm9uZyBM
aSA8em9uZy5saUBzaWZpdmUuY29tPiB3cm90ZToKPiA+ID4gPiBPbiBNb24sIEFwciAxMiwgMjAy
MSBhdCA3OjMxIFBNIEFuZHJlYXMgU2Nod2FiIDxzY2h3YWJAbGludXgtbTY4ay5vcmc+IHdyb3Rl
Ogo+ID4gPiA+ID4gT24gTcOkciAzMSAyMDIxLCBab25nIExpIHdyb3RlOgo+ID4gPiA+ID4gPiBJ
IGZvdW5kIHRoYXQgdGhlIGdlbWd4bHBsbCB3YXMgZGlzYWJsZWQgaW1tZWRpYXRlbHkgYnkgcG93
ZXIKPiA+ID4gPiA+ID4gbWFuYWdlbWVudCBhZnRlciBtYWNiIGRyaXZlciBpbnN0YWxsLiBUaGUg
bWFpbmxpbmUncyBkZWZjb25maWcgZG9lc24ndAo+ID4gPiA+ID4gPiBlbmFibGUgQ09ORklHX1BN
LCBzbyB0aGUgbmV0d29yayBpcyBmaW5lIG9uIGl0LiBUaGUgb3BlbnN1c2UgZGVmY29uZmlnCj4g
PiA+ID4gPiA+IGVuYWJsZXMgQ09ORklHX1BNLCBhbmQgdGhlIHBhdGNoCj4gPiA+ID4gPiA+IDcz
MjM3NGEwYjQ0MGQ5YTc5Yzg0MTJmMzE4YTI1Y2QzN2JhNmY0ZTIgYWRkZWQgdGhlIGVuYWJsZS9k
aXNhYmxlCj4gPiA+ID4gPiA+IGNhbGxiYWNrIGZ1bmN0aW9ucywgc28gdGhlIGdlbWd4bHBsbCBQ
TEwsIEkgaGF2ZSBubyBpZGVhIHdoeSBwb3dlcgo+ID4gPiA+ID4gPiBtYW5hZ2VtZW50IGRpc2Fi
bGUgaXQsIEkgd291bGQga2VlcCB0cmFjZSBpdC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBEb2VzIHRo
YXQgbWVhbiB0aGF0IENPTkZJR19QTSBhbHNvIGFmZmVjdHMgdGhlIEZVNzQwPwo+ID4gPiA+Cj4g
PiA+ID4gWWVzLCB3ZSBnb3QgdGhlIHNhbWUgcHJvYmxlbSBvbiB0aGUgRlU3NDAuIFdlIGFyZSBj
aGVja2luZyB0aGUgaXNzdWUuCj4gPiA+ID4KPiA+ID4gSnVzdCBhIG1pbGQgcGluZywgYW55IHBy
b2dyZXNzIHJlZ2FyZGluZyB0aGlzIGlzc3VlPwo+ID4KPiA+IEN1cnJlbnRseSwgaWYgcnVudGlt
ZSBwb3dlciBtYW5hZ2VtZW50IGlzIGVuYWJsZWQsIG1hY2IgZHJpdmVyIHdvdWxkCj4gPiBnbyB0
byBzbGVlcCBhdCB0aGUgZW5kIG9mIG1hY2JfcHJvYmUsIHRoZW4gdGhlIGdpZ2FiaXQgZXRoZXJu
ZXQgUExMCj4gPiB3b3VsZCBiZSBkaXNhYmxlZC4gIER1cmluZyB0aGlzIHBlcmlvZCBvZiB0aW1l
LCB0aGUgc3lzdGVtIHdvdWxkIGhhbmcKPiA+IHVwIGlmIHdlIHRyeSB0byBhY2Nlc3MgR0VNR1hM
IGNvbnRyb2wgcmVnaXN0ZXJzLCBpdCBtZWFucyB0aGF0IHdlCj4gPiBjYW4ndCBhY2Nlc3MgR0VN
R1hMIGNvbnRyb2wgcmVnaXN0ZXJzIGJlZm9yZSB0aGUgZ2lnYWJpdCBldGhlcm5ldCBQTEwKPiA+
IGlzIHJlc3VtZWQgYWdhaW4uIFRoZXJlIGFyZSBzb21lIGNhc2VzLCBmb3IgZXhhbXBsZSwgaWYg
d2UgZXhlY3V0ZSB0aGUKPgo+IFNvdW5kcyBmYW1pbGlhci4KPgo+ID4gJ2lmY29uZmlnJyBjb21t
YW5kLCBpdCB3b3VsZCBldmVudHVhbGx5IGdvIHRvIHRoZSBtYWNiX2dldF9zdGF0dXMgdG8KPgo+
IERvIHlvdSBtZWFuIG1hY19nZXRfc3RhdHMoKT8gbWFjYl9nZXRfc3RhdHVzKCkgZG9lcyBub3Qg
ZXhpc3QuCgpTb3JyeSBmb3IgdGhlIHR5cG8sIGl0IHNob3VsZCBiZSBtYWNiX2dldF9zdGF0cy4K
Cj4KPiA+IGFjY2VzcyBHRU1HWEwgY29udHJvbCByZWdpc3RlcnMgYW5kIGNhdXNlIHRoZSBzeXN0
ZW0gdG8gaGFuZyB1cC4gR2l2ZQo+ID4gbW9yZSBleGFtcGxlIGhlcmUsIGlmIHdlIGV4ZWN1dGUg
J2lwIGxpbmsgc2V0IGxvIHVwICYgaXAgYWRkciBhZGQKPiA+IDEyNy4wLjAuMS84IGRldiBsbycs
IGl0IHdvdWxkIGNhdXNlIHRoZSBzeXN0ZW0gdG8gaGFuZyB1cCwgYmVjYXVzZQo+ID4gdGhlc2Ug
Y29tbWFuZHMgd291bGQgdHJ5IHRvIHF1ZXJ5IHRoZSBpbnRlcmZhY2VzIGFuZCBldmVudHVhbGx5
IGdvIHRvCj4gPiBtYWNiX2dldF9zdGF0dXMgYXMgd2VsbC4gSG93ZXZlciwgaWYgd2UgY2FuIHJl
c3VtZSB0aGUgZ2lnYWJpdAo+ID4gZXRoZXJuZXQgUExMIGZpcnN0LCBzdWNoIGFzICdpcCBsaW5r
IHNldCBldGgwIHVwJyBvciAndWRoY3BjJywgdGhlbgo+ID4gZXZlcnl0aGluZyBnb2VzIHdlbGwu
IEknbSB0cnlpbmcgdG8gZmlndXJlIG91dCBpZiB0aGVyZSBhcmUgc29tZSBob29rcwo+ID4gdGhh
dCB3ZSBjYW4gY2hlY2sgdGhlIFBMTCBzdGF0dXMgaW4gdGhlIG1hY2IgZHJpdmVyIGJlZm9yZSBp
dCBhY3R1YWxseQo+ID4gdG91Y2hlcyB0aGUgY29udHJvbCByZWdpc3RlcnMuIElmIGFueW9uZSBo
YXMgYW4gaWRlYSBhYm91dCB0aGF0LAo+ID4gcGxlYXNlIGZlZWwgZnJlZSB0byBwb2ludCBpdCBv
dXQgdG8gbWUsIHRoYW5rcy4KPgo+IEFuZCB5b3UgY2Fubm90IGNhbGwgcG1fcnVudGltZV9nZXRf
c3luYygpLCBhcyB0aGlzIGlzIGNhbGxlZCBmcm9tCj4gYXRvbWljIGNvbnRlY3QuIE90aGVyIGRy
aXZlcnMgYXZvaWQgYWNjZXNzaW5nIHRoZSByZWdpc3RlcnMgd2hpbGUKPiB0aGUgZGV2aWNlIGlz
IG5vdCB1cCwgY2ZyLiBlLmcuIGNvbW1pdCA3ZmEyOTU1ZmY3MGNlNDUzICgic2hfZXRoOgo+IEZp
eCBzbGVlcGluZyBmdW5jdGlvbiBjYWxsZWQgZnJvbSBpbnZhbGlkIGNvbnRleHQiKS4KPgoKVGhh
bmtzIGZvciB5b3VyIGhlbHAuIEkgaGF2ZSBkb25lIHRoZSBzaW1pbGFyIG1vZGlmaWNhdGlvbiBi
eQpmb2xsb3dpbmcgdGhlIHBhdGNoIHlvdSBwcm92aWRlZC4gSSBhbHNvIHZlcmlmaWVkIHRoZSBi
dWcgdGhhdCB3ZSB1c2UKcG1fcnVudGltZV9nZXRfc3luYyB0aGVyZS4gSSdtIGdvaW5nIHRvIHBv
c3QgdGhlIGZpeCBwYXRjaCBieSBhZGRpbmcKdGhlIGlzX29wZW5lZCBmbGFnLgoKVGhhbmtzIGFn
YWluLgoKPiBHcntvZXRqZSxlZXRpbmd9cywKPgo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdl
ZXJ0Cj4KPiAtLQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXgg
YmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKPgo+IEluIHBlcnNvbmFsIGNvbnZl
cnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBC
dXQKPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1t
ZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
