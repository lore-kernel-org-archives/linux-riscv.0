Return-Path: <SRS0=xUWo=JJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D63E7C433ED
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 21:22:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 584D361206
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 21:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 584D361206
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kUQWxlHKgBbrhQZQgR6JeFLjVGNJQJP+ckPsCZtMEKg=; b=iwaHCdib58CcKfxRoi0lPunb1
	LfkQAeFYjFn+nEwLpax/py3P3yLITjUIOk9Vwk216n70DE7GVbbjTi79l6OQILGl2EYZUtXNd41pz
	imWBq6ymAZvqUbxWjDsVMkpdrLW/YdK7iYUlYIbNfcOXnqu/fe3kpHW72GJj/nKYLbEBBAJ5Ir192
	t8DUNrPyKZTEAxzf9P0xlhSOQLCWO/H6CXmEiXxLhaOn3mlWGHzSWqUARlGY7Y0l2luQ06liaX815
	jK7oyz7c8KslP+ftfJk1tspjMYyo5D1Gn3HNuPuoPtSL0z0sYZnrDdKFL38Lxhx5iuDQ96MblVTYl
	bWxy2vW8A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lW40b-007guf-6j; Mon, 12 Apr 2021 21:22:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lW40W-007guH-JU
 for linux-riscv@desiato.infradead.org; Mon, 12 Apr 2021 21:22:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=GlZ6fpp1sRl5oo/cSJn2gmwB5FdWA1BS8ZVLxQB9aUY=; b=br411djpDD/l2MQjRPxDOeplpp
 EhRBa0mK7KKTnnWH0LZ4AY4L4SZrFmw87joOyHoAzAFUOlF6Ti1qecTkN+7QIyM0q1sTppr49+Yll
 8Y3M+e9qZO6xQobGwLxO2hFX2dDU6iq+uOVHehBUeJsqTSPiIfFzZN6eScogeHN2fYa1w6mNWBbxJ
 zgSlg4hP0HUs23B0Jg3rsFR9UJN8SVtR9zNbkBjyYq/Dfq3NYbW8wutV9KKomomMe+Zm/zYdUOYWb
 UiPkA61WZJ/35GR6lHc/6Y7fK5jxjd45lIr9ZTru84/uFbuy2Tsnvp3f+Kj+SWn9ewAs4uikHUhrP
 v4UPpuGQ==;
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lW40T-006YmI-Lf
 for linux-riscv@lists.infradead.org; Mon, 12 Apr 2021 21:22:07 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id i2so3164818vka.13
 for <linux-riscv@lists.infradead.org>; Mon, 12 Apr 2021 14:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GlZ6fpp1sRl5oo/cSJn2gmwB5FdWA1BS8ZVLxQB9aUY=;
 b=Trel/2tBoFIUjmTO0Ab8vXU0ikbpVKZtwsEV7BI31Lb9HYqZZbQ2R/Jnxoupvn5VJc
 zIujh3gSk2zhDcIZ5+5pDsHfpTm79CLQ+co8d/4q7Uh7JztGXxYYdvi5x5QRZan+tpAV
 pM3PBjk9fdb0bXF95oQwgZhzGCBiCq3vIsgCEFVVh2XU8exunbxA9QMW5yf7u2cgHFmK
 Mz32fumdbdQPvqtHNiUfGhpcOQ481adbKW8xr57B3ezB1fUL2Z92612TPjnfrC5lrOBt
 xdvto+eaAfvuuiaSeZbcLOKNS1wmqU/ibQz/b2gmVw7dSskAdZ+A9ORfy/ZVqNcHooXm
 RxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GlZ6fpp1sRl5oo/cSJn2gmwB5FdWA1BS8ZVLxQB9aUY=;
 b=DIjwUXo7nUzAO8zS02qKwBe2YwQNo3qBzt2AZlO/bIXpO+Guct6Bu2PLCPGEQQ1vJH
 9kVng48yLllHTl+KjqUilfKuy9w4q4U9WlapkEqgBWyfA4s9Peufv9gqgBBFJgc3VTpM
 9f+J0X9OGTJ+soCdFSzZyYFKZvkx5X0nOS5MRhRdYdMoeHrdaCPA9cGIY2fQjhap0C3j
 tgaj2jL59e8otKbwsVYDI8gTuHPlLlbWRQSymis/Of+fKCXtPoCdoJ2UH5DTnHu+SMA9
 Kt/RVertPvcDq3zYX3WqRp5cC5ph0kkicHVJwnHJa8s4QEpH7PnHY6rTVTxv0E5lr/Hy
 3klw==
X-Gm-Message-State: AOAM531j4k05cUItqWucZuLSuArnOXjoANQh+SPNcTWHkdhgWIoviFEP
 I1Fmfce7JkgaJl8KMkeCPWGwbegeARmApEwF66Y=
X-Google-Smtp-Source: ABdhPJzfCUW/YY6jX6qnMxCs36AiTlEvtpqWbO8D5fJ/UamVl3opz/IIaFmryZqPV4oojB0xFVHidXHFxHy4u1FJdf4=
X-Received: by 2002:a1f:5682:: with SMTP id k124mr21070410vkb.20.1618262523924; 
 Mon, 12 Apr 2021 14:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy1JHLUFwu7RuCaQ+RUWRBks2KsDva7EpRt8--4ZfofSUQ@mail.gmail.com>
 <mhng-0bf68290-a014-43d7-b193-8ac839c5433a@palmerdabbelt-glaptop>
 <CAHB2gtS9J09VaY9ZxDJYVo2fTgS-u6p7e89aLCnwOHnYEOJR=g@mail.gmail.com>
 <YHRei8/8cIe6BNtE@hirez.programming.kicks-ass.net>
In-Reply-To: <YHRei8/8cIe6BNtE@hirez.programming.kicks-ass.net>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christophm30@gmail.com>
Date: Mon, 12 Apr 2021 23:21:52 +0200
Message-ID: <CAHB2gtT2+eFaMxtt9MP2r_5t=t9DeT9h4bOrkHPAFrJbGL1oZw@mail.gmail.com>
Subject: Re: [PATCH] riscv: locks: introduce ticket-based spinlock
 implementation
To: Peter Zijlstra <peterz@infradead.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Guo Ren <guoren@kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 catalin.marinas@arm.com, will.deacon@arm.com, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_142205_737174_5152B152 
X-CRM114-Status: GOOD (  47.01  )
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

T24gTW9uLCBBcHIgMTIsIDIwMjEgYXQgNDo1MiBQTSBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4KPiBQbGVhc2UgZml4IHlvdXIgbWFpbGVyIHRvIHByb3Bl
cmx5IGZsb3cgdGV4dC4gUmVmbG93ZWQgaXQgZm9yIHlvdS4KPgo+IE9uIE1vbiwgQXByIDEyLCAy
MDIxIGF0IDAzOjMyOjI3UE0gKzAyMDAsIENocmlzdG9waCBNw7xsbG5lciB3cm90ZToKPgo+ID4g
VGhpcyBkaXNjdXNzaW9uIGNhbWUgdXAgYWdhaW4gYSBmZXcgd2Vla3MgYWdvIGJlY2F1c2UgSSd2
ZSBiZWVuCj4gPiBzdHVtYmxpbmcgb3ZlciB0aGUgdGVzdC1hbmQtc2V0IGltcGxlbWVudGF0aW9u
IGFuZCB3YXMgd29uZGVyaW5nIGlmCj4gPiBub2JvZHkgY2FyZWQgdG8gaW1wcm92ZSB0aGF0IHll
dC4KPgo+ID4gVGhlbiBJIHNhdywgdGhhdCB0aGVyZSBoYXZlIGJlZW4gYSBmZXcgYXR0ZW1wdHMg
c28gZmFyLCBidXQgdGhleSBkaWQKPiA+IG5vdCBsYW5kLiAgU28gSSBicm91Z2h0IHRoaXMgdXAg
aW4gUlZJJ3MgcGxhdGZvcm0gZ3JvdXAgbWVldGluZyBhbmQKPiA+IHRoZSBhdHRlbmRlZXMgc2hv
d2VkIGJpZyBpbnRlcmVzdCB0byBnZXQgYXQgbGVhc3QgZmFpcm5lc3MuIEkgYXNzdW1lCj4gPiBH
dW8gc2VudCBvdXQgaGlzIG5ldyBwYXRjaHNldCBhcyBhIHJlYWN0aW9uIHRvIHRoaXMgY2FsbCAo
MSBvciAyIGRheXMKPiA+IGxhdGVyKS4KPiA+Cj4gPiBXZSBoYXZlIHRoZSBzYW1lIHNpdHVhdGlv
biBvbiBPcGVuU0JJLCB3aGVyZSB3ZSd2ZSBhZ3JlZWQgKHdpdGggQW51cCkKPiA+IHRvIGdvIGZv
ciBhIHRpY2tldCBsb2NrIGltcGxlbWVudGF0aW9uLiAgQSBzZXJpZXMgZm9yIHRoYXQgY2FuIGJl
Cj4gPiBmb3VuZCBoZXJlICh0aGUgaW1wbGVtZW50YXRpb24gd2FzIHRlc3RlZCBpbiB0aGUga2Vy
bmVsKToKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9vcGVuc2JpLzIw
MjEtQXByaWwvMDAwNzg5Lmh0bWwKPiA+Cj4gPiBJbiB0aGUgbWVudGlvbmVkIFJWSSBjYWxsLCBJ
J3ZlIGFza2VkIHRoZSBxdWVzdGlvbiBpZiB0aWNrZXQgbG9ja3Mgb3IKPiA+IE1DRiBsb2NrcyBh
cmUgcHJlZmVycmVkLiAgQW5kIHRoZSBmZWVkYmFjayB3YXMgdG8gZ28gZm9yCj4gPiBxc3Bpbmxv
Y2svcXJ3bG9jay4gT25lIGdvb2QgYXJndW1lbnQgdG8gZG8gc28gd291bGQgYmUsIHRvIG5vdCBo
YXZlIHRvCj4gPiBtYWludGFpbiBhbiBSVi1zcGVjaWZpYyBpbXBsZW1lbnRhdGlvbiwgYnV0IHRv
IHVzZSBhIHdlbGwtdGVzdGVkCj4gPiBpbi1rZXJuZWwgbWVjaGFuaXNtLgo+Cj4gcXJ3bG9jayBk
b2VzIG5vdCBkZXBlbmQgb24gcXNwaW5sb2NrOyBhbnkgZmFpciBzcGlubG9jayBpbXBsZW1lbnRh
dGlvbgo+IHdvcmtzLCBpbmNsdWRpbmcgdGlja2V0Lgo+Cj4gPiBUaGUgZmVlZGJhY2sgaW4gdGhl
IGNhbGwgaXMgYWxzbyBhbGlnbmVkIHdpdGggdGhlIHByZXZpb3VzIGF0dGVtcHRzIHRvCj4gPiBl
bmFibGUgTUNGLWxvY2tzIG9uIFJWLiAgSG93ZXZlciwgdGhlIGtlcm5lbCdzIGltcGxlbWVudGF0
aW9uIHJlcXVpcmVzCj4gPiBzdWItd29yZCBhdG9taWNzLiBBbmQgaGVyZSBpcywgd2hlcmUgd2Ug
YXJlLiAgVGhlIGRpc2N1c3Npb24gbGFzdCB3ZWVrCj4gPiB3YXMgYWJvdXQgY2hhbmdpbmcgdGhl
IGdlbmVyaWMga2VybmVsIGNvZGUgdG8gbG9vc2VuIGl0cyByZXF1aXJlbWVudHMKPiA+IChub3Qg
YWNjZXB0ZWQgYmVjYXVzZSBvZiBwZXJmb3JtYW5jZSByZWdyZXNzaW9ucyBvbiBlLmcuIHg4Nikg
YW5kIGlmCj4gPiBSViBhY3R1YWxseSBjYW4gcHJvdmlkZSBzdWItd29yZCBhdG9taWNzIGluIGZv
cm0gb2YgTEwvU0MgbG9vcHMgKHllcywKPiA+IHRoYXQncyBwb3NzaWJsZSkuCj4KPiBTbyBxc3Bp
bmxvY2sgaXMgYSBjb21wbGV4IGFuZCBmaWNrbGUgYmVhc3QuIFllcyBpdCB3b3JrcyBvbiB4ODYg
YW5kCj4gYXJtNjQgKFdpbGwgYW5kIENhdGFsaW4gcHV0IGEgX2xvdF8gb2YgZWZmb3J0IGludG8g
dGhhdCksIGJ1dCBJTU8gdXNpbmcKPiBzdWNoIGEgY29tcGxleCB0aGluZyBuZWVkcyB0byBiZSBw
cm92YWJseSBiZXR0ZXIgdGhhbiB0aGUgdHJpdmlhbCBhbmQKPiBzaW1wbGUgdGhpbmcgKHRpY2tl
dHMsIHRlc3QtYW5kLXNldCkuCj4KPiBQYXJ0IG9mIHRoYXQgaXMgZndkIHByb2dyZXNzLCBpZiB5
b3UgZG9uJ3QgaGF2ZSB0aGF0LCBzdGF5IHdpdGgKPiB0ZXN0LWFuZC1zZXQuIFdpbGwgZml4ZWQg
YSBudW1iZXIgb2YgaXNzdWVzIHRoZXJlLCBhbmQgLVJUIGFjdHVhbGx5IGhpdAo+IGF0IGxlYXN0
IG9uZS4KPgo+IERlYnVnZ2luZyBub24tZGV0ZXJtaW5pc3RpYyBsb2NrIGJlaGF2aW91ciBpcyBu
b3Qgb24gdGhlIGZ1biBsaXN0Lgo+IEhhdmluZyBzb21ldGhpbmcgc2ltcGxlICh0aWNrZXQpIHRv
IGZhbGwgYmFjayB0byB0byBwcm92ZSBpdCdzIHlvdXIgbG9jawo+IGdvaW5nICdmdW5uZWgnIGlz
IHZlcnkgdXNlZnVsLgo+Cj4gPiBQcm92aWRpbmcgc3ViLXdvcmQgeGNoZygpIGNhbiBiZSBkb25l
IHdpdGhpbiBhIGNvdXBsZSBvZiBob3VycyAoc29tZQo+ID4gc29sdXRpb25zIGFyZSBhbHJlYWR5
IG9uIHRoZSBsaXN0KSwgYnV0IHRoYXQgd2FzIG5vdCBlbm91Z2ggZnJvbSB0aGUKPiA+IGluaXRp
YWwgcGF0Y2hzZXQgZnJvbSBNaWNoYWVsIG9uIChlLmcuIENocmlzdG9waCBIZWxsd2lnIGFza2Vk
IGJhY2sKPiA+IHRoZW4gZm9yIG1vdmluZyBhcmNoLWluZGVwZW5kZW50IHBhcnRzIGludG8gbGli
LCB3aGljaCBpcyBhIGdvb2QgaWRlYQo+ID4gZ2l2ZW4gb3RoZXIgYXJjaHMgZG8gdGhlIHNhbWUp
LiAgU28gSSBleHBlY3QgdGhpcyBtaWdodCByZXF1aXJlIHNvbWUKPiA+IG1vcmUgdGltZSB1bnRp
bCB0aGVyZSBpcyBhIHNvbHV0aW9uLCB0aGF0J3MgYWNjZXB0ZWQgYnkgYSBicm9hZCByYW5nZQo+
ID4gb2YgbWFpbnRhaW5lcnMuCj4KPiBVc2luZyBhIGxpYi8gY21weGNoZyBiYXNlZCB4Y2hnMTYg
aXMgZGFmdC4gUGVyIHRoZSB2ZXJ5IHNhbWUgYXJndW1lbnRzIEkKPiBtYWRlIGVsc2V3aGVyZSBp
biB0aGUgdGhyZWFkLiBjbXB4Y2hnKCkgYmFzZWQgbG9vcHMgaGF2ZSB2ZXJ5IGRpZmZpY3VsdAo+
IGZ3ZCBwcm9ncmVzcyBndWFyYW50ZWVzLCBlc3AuIHNvIG9uIExML1NDIGFyY2hpdGVjdHVyZXMu
Cj4KPiBXaGF0IEkgd291bGQgZG8gaXMgY3JlYXRlIGEgY29tbW9uIGlubGluZSBoZWxwZXIgdG8g
Y29tcHV0ZSB0aGF0IHthZGRyLAo+IG1hc2ssIHZhbH0gc2V0dXAgd2l0aCBhIGNvbW1lbnQgb24g
aG93IHRvIHVzZSBpdC4KPgo+IChBcyBpcywgd2UgaGF2ZSBhdCBsZWFzdCAyIGRpZmZlcmVudCB3
YXlzIG9mIGRlYWxpbmcgd2l0aCBFTkRJQU4tbmVzcykKCldlbGwsIHRoYXQncyB3aGF0IEkgaGF2
ZSBoZXJlOgpodHRwczovL2dpdGh1Yi5jb20vY211ZWxsbmVyL2xpbnV4L2NvbW1pdC85ZDJmNjQ0
OWRkODQ4YjU3MjMzMjZhZThiZTM0YTNkMmQ0MWRjZmYxCgo+ID4gSSd2ZSBiZWVuIHdvcmtpbmcg
b24gYSBuZXcgTUNGLWxvY2sgc2VyaWVzIGxhc3Qgd2Vlay4gIEl0IGlzIHdvcmtpbmcsCj4gPiBi
dXQgSSBkaWQgbm90IHB1Ymxpc2ggaXQgeWV0LCBiZWNhdXNlIEkgd2FudGVkIHRvIGdvIHRocm91
Z2ggdGhlIDEzMCsKPiA+IGVtYWlscyBvbiB0aGUgcmlzY3YtbGludXggbGlzdCBhbmQgY2hlY2sg
Zm9yIG92ZXJzZWVuIHJldmlldyBjb21tZW50cwo+ID4gYW5kIHZhbGlkYXRlIHRoZSBwYXRjaCBh
dXRob3JzLgo+Cj4gPiBZb3UgY2FuIGZpbmQgdGhlIGN1cnJlbnQgc3RhdGUgaGVyZToKPiA+IGh0
dHBzOi8vZ2l0aHViLmNvbS9jbXVlbGxuZXIvbGludXgvcHVsbC9uZXcvcmlzY3Ytc3BpbmxvY2tz
Cj4KPiBUaGF0J3Mgbm90IHB1YmxpYy4gQnV0IGlmIHRoYXQncyBub3QgcXNwaW5sb2NrLCBob3cg
YXJlIHlvdSBqdXN0aWZ5aW5nIGEKPiBjb21wbGV4IHNwaW5sb2NrIGltcGxlbWVudGF0aW9uPyBE
b2VzIGl0IHBlcmZvcm0gYmV0dGVyIHRoYW4gdGlja2V0PwoKSSBwYXN0ZWQgdGhlIHdyb25nIGxp
bmsuIEhlcmUgaXMgYSB3b3JraW5nIG9uZToKaHR0cHM6Ly9naXRodWIuY29tL2NtdWVsbG5lci9s
aW51eC90cmVlL3Jpc2N2LXNwaW5sb2NrcwpJdCBpcyBiYXNpY2FsbHkgR3VvJ3MgdjQgd2l0aCBt
YXNrLWFuZC1zZXQgd2l0aGluIGEgTEwvU0MgbG9vcCwKY29tbWl0cyBzcGxpdCB1cCwKbm9uLXJp
c2N2IGNvbW1pdHMgZHJvcHBlZCwgYW5kIGNvbW1pdCBtZXNzYWdlcyByZXdyaXR0ZW4uCgpJIGZ1
bGx5IHVuZGVyc3RhbmQgeW91ciByZXNlcnZhdGlvbnMgYWdhaW5zdCB1c2luZyBNQ0YgbG9ja3Mu
CkkgYWxzbyBhZ3JlZSwgdGhhdCBkZWJ1Z2dpbmcgbG9ja2luZyBpc3N1ZXMgaXMgbm90IGZ1bm55
LgoKRldJVzoKSSd2ZSBiZWVuIGRlYnVnZ2luZyBxdWl0ZSBzb21lIGVtYmVkZGVkIExpbnV4IGJv
YXJkcyB0aGUgbGFzdCB5ZWFycywKd2hlcmUgZXNzZW50aWFsIGJhc2ljIGJ1aWxkaW5nIGJsb2Nr
cyBzaG93ZWQgdW5yZWxpYWJsZS9lcnJhdGljIGJlaGF2aW9yCihjYXVzZWQgZS5nLiBieSBhbiB1
bnN0YWJsZSB2b2x0YWdlIHN1cHBseSkgYW5kIGV2ZXJ5IGF0dGVtcHQgdG8gbW9uaXRvcgp0aGUg
YnVnIGNhdXNlcyBpdCB0byBkaXNhcHBlYXIuCgpUaWNrZXQgbG9ja3MgYXJlIGFsc28gZmluZSBm
b3IgbWUuIFN0aWxsLCBpdCB3b3VsZCBiZSBuaWNlIHRvIGdldCB0aGUKMTYtYml0IHhjaGcoKQpt
ZXJnZWQsIHNvIGFkdmFuY2VkIHVzZXJzIGNhbiB0cnkgcXNwaW5sb2NrcyB3aXRob3V0IG11Y2gg
ZWZmb3J0LgpPdGhlcndpc2UsIHdlIGp1c3Qgc3VzcGVuZCB0aGUgZGlzY3Vzc2lvbiBub3cgYW5k
IHJlc3RhcnQgaXQgZnJvbSB0aGUgYmVnaW5uaW5nCmluIGEgeWVhciAoYXMgaXMgaGFwcGVuaW5n
IHJpZ2h0IG5vdykuCgo+ID4gU28sIGlmIHlvdSBpbnNpc3Qgb24gdGlja2V0IGxvY2tzLCB0aGVu
IGxldCdzIGNvb3JkaW5hdGUgd2hvIHdpbGwgZG8KPiA+IHRoYXQgYW5kIGhvdyBpdCB3aWxsIGJl
IHRlc3RlZCAoUlYzMi9SVjY0LCBxZW11IHZzIHJlYWwgaHcpLgo+Cj4gUmVhbCBoYXJkd2FyZSBp
cyBhbGwgdGhhdCBjb3VudHMgOi0pCgpGdWxseSBhZ3JlZSwgdGhlcmVmb3JlIEkgaGF2ZSB3cml0
dGVuIHRoYXQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
