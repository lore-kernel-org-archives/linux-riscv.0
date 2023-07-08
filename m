Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D13EB64DA
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Jul 2023 03:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWs67SBfDAz17KF+BfO3QFpUlFEqZAG9DZSNFzaLEcw=; b=BbRc3dl42OkT0C
	HPdVybZLHT4ZAm0UviMvgrvTiJNTiM+zQrwQEY3ajmWdVSjn1TKfKQqvm2KkTADUMmv+qM1mrFQYb
	Axdh0vSlblrg+7HYHSM+tRHhLGIOhI/0F3rU/L6z4oWZrvK1ByVFMJrchCTzJwHfKDQRHmO+gnf99
	dWoCuQpxKHbvMF1yyqh+xdh27W+mHLYUDM0Fo6xgt/066Pl75NOXgTKtJtKIbqtJ5ki72RQlY8TvO
	BLueV4HXYHowsUtSK/WgqqB/EiVoU2zFjAmzS/pxqxjv9KcaA2xVgqCIQl8SImet+5k2ThSsy0c9l
	qzPG1FnhBGXwCBKUvoRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHyFG-006OxZ-22;
	Sat, 08 Jul 2023 03:04:26 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHyFD-006Owo-30
	for linux-riscv@lists.infradead.org;
	Sat, 08 Jul 2023 03:04:25 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbc0981755so28206145e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 07 Jul 2023 20:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1688785457; x=1691377457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FsK2X5Mi4VaOfX4KhvaFuW1M9mUzdFAp+0gGgg3mXQM=;
        b=RpH0HZmWgIVcQSeBvJXl/PSJNrQ8wdXr2kDeU3tw8ebfDYoia/IqFvIBFbVeb9y8IJ
         Zcy806Hmxrt/RrSTcB8IwUlt5rebFkh+u3jFtKlmmc9L5S0Vfhto5Mao+6iar90tHb/v
         Y1Gsm2ZJQhPJfJZ8sXMdqoN/6fYwYbPuT7K7+/9qKkZRM026OaHO0AHPNxJvLESJBafd
         Egj9bhWJJnfKUCsDDG3cb1RecceS8WNhKWeWVlOuPAuFOQf3WkyyOH8fyfPSxCvYwtoK
         YbYd1dRRzVcQ+1YJoNFQvjjZukVmV2+SSr/yn7bIxmaj8f5i2NVq85LJixfNy1jHe7XL
         6k8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688785457; x=1691377457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FsK2X5Mi4VaOfX4KhvaFuW1M9mUzdFAp+0gGgg3mXQM=;
        b=g3mcGobIePDkGHRRVbyindQFKoZsKyP5lr9luOUu/P3sme3JTPwyTlPnQV/Gq/YFQq
         1a/8YC8qZaZ1m/nResSSB+uAOuWOM3lzrhenYjdpW4Ld7Knv9CUIhZZwxPjNBjdcKkHh
         yYjW9ACs6ujy2QIoGDznhN2QqKRjgP47nOilf5/ppqdQoumMeg0V8p9Lq9hWDfSW+zCl
         rEI9apVTLQwRY1pioCGlxnw4c8aMyooFhA3OdAiQtMMnCnz7+UgH/l/mYyqQy55YZiZL
         eaE+9niF8P2QvZQU3FKiBGuzD2tmx61FZ4jgMzEGGZIzjoSJjxqCMwVG5hIKoP5R2b6i
         2zMg==
X-Gm-Message-State: ABy/qLZSMdgS3Ci24UlgsEpO0O4bDhmAQ7wVErC106ynlIl+v8W6yNWK
	Da2H1wiBaOtmerxB9Ue3rqDsKv+RUgLqhqbX1KYGsw==
X-Google-Smtp-Source: APBJJlHyrMBQ4oDOG1/I261/e9nCarKyLKdj6vxCkIjkby4/wtevtnk/4rpSHeC4yLj7JdHbyO85En3DatZNntn/8yw=
X-Received: by 2002:a1c:7416:0:b0:3fb:b3aa:1c88 with SMTP id
 p22-20020a1c7416000000b003fbb3aa1c88mr774777wmc.26.1688785456793; Fri, 07 Jul
 2023 20:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230705114251.661-1-cuiyunhui@bytedance.com> <20230705114251.661-5-cuiyunhui@bytedance.com>
 <20230707-brigade-myth-86ee252b2e4a@spud> <CAN3iYbP_dQOOJKLjAf+pVeYUZRBqwZBG7eq6=pR0upsjT2GpOA@mail.gmail.com>
In-Reply-To: <CAN3iYbP_dQOOJKLjAf+pVeYUZRBqwZBG7eq6=pR0upsjT2GpOA@mail.gmail.com>
From: =?UTF-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>
Date: Sat, 8 Jul 2023 11:04:05 +0800
Message-ID: <CAEEQ3wkgxagOPYrg3g8apLHHDOcAR3hFKpHA3ZQDm9PKvO1xUg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 4/4] dt-bindings: firmware: Document
 ffitbl binding
To: =?UTF-8?B?6JGb5aOr5bu6?= <geshijian@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_200424_157964_4D6488E3 
X-CRM114-Status: GOOD (  26.39  )
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
Cc: mark.rutland@arm.com, jdelvare@suse.com, aou@eecs.berkeley.edu, weidong.wd@bytedance.com, allen-kh.cheng@mediatek.com, rafael@kernel.org, lpieralisi@kernel.org, yc.hung@mediatek.com, pierre-louis.bossart@linux.intel.com, Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, rminnich@gmail.com, palmer@dabbelt.com, paul.walmsley@sifive.com, tinghan.shen@mediatek.com, linux-riscv@lists.infradead.org, angelogioacchino.delregno@collabora.com, linux-acpi@vger.kernel.org, ardb@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQ29ub3IsCgpPbiBTYXQsIEp1bCA4LCAyMDIzIGF0IDEyOjUz4oCvQU0g6JGb5aOr5bu6IDxn
ZXNoaWppYW5AYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPgo+Cj4KPiBPbiBTYXQsIEp1bCA4LCAy
MDIzIGF0IDEyOjE24oCvQU0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToK
Pj4KPj4gSGV5LAo+Pgo+PiBPbiBXZWQsIEp1bCAwNSwgMjAyMyBhdCAwNzo0Mjo1MVBNICswODAw
LCBZdW5odWkgQ3VpIHdyb3RlOgo+PiA+IEFkZCB0aGUgZGVzY3JpcHRpb24gZm9yIGZmaXRibCBz
dWJub2RlLgo+PiA+Cj4+ID4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5
dGVkYW5jZS5jb20+Cj4+ID4gLS0tCj4+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Zpcm13
YXJlL2ZmaXRibC50eHQgICB8IDI3ICsrKysrKysrKysrKysrKysrKysKPj4gPiAgTUFJTlRBSU5F
UlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+PiA+ICAyIGZpbGVz
IGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKykKPj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9maXJtd2FyZS9mZml0YmwudHh0Cj4+ID4KPj4g
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Zpcm13YXJl
L2ZmaXRibC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZmlybXdhcmUv
ZmZpdGJsLnR4dAo+PiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+ID4gaW5kZXggMDAwMDAwMDAw
MDAwLi5jNDIzNjg2MjYxOTkKPj4gPiAtLS0gL2Rldi9udWxsCj4+ID4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Zpcm13YXJlL2ZmaXRibC50eHQKPj4gPiBAQCAtMCww
ICsxLDI3IEBACj4+ID4gK0ZGSShGRFQgRklSTVdBUkUgSU5URVJGQUNFKSBkcml2ZXIKPj4gPiAr
Cj4+ID4gK1JlcXVpcmVkIHByb3BlcnRpZXM6Cj4+ID4gKyAtIGVudHJ5ICAgICAgICAgICAgIDog
YWNwaSBvciBzbWJpb3Mgcm9vdCBwb2ludGVyLCB1NjQKPj4gPiArIC0gcmVnICAgICAgICAgICAg
ICAgICAgICAgICA6IGFjcGkgb3Igc21iaW9zIHZlcnNpb24sIHUzMgo+PiA+ICsKPj4gPiArU29t
ZSBib290bG9hZGVycywgc3VjaCBhcyBDb3JlYm9vdCBkbyBub3Qgc3VwcG9ydCBFRkksCj4+ID4g
K29ubHkgZGV2aWNldHJlZSBhbmQgc29tZSBhcmNoZXMgZG8gbm90IGhhdmUgYSByZXNlcnZlZAo+
PiA+ICthZGRyZXNzIHNlZ21lbnQuIEFkZCAiZmZpdGJsIiBzdWJub2RlIHRvIG9idGFpbiBBQ1BJ
IFJTRFAKPj4gPiArYW5kIFNNQklPUyBlbnRyeS4KPj4KPj4gU2luY2UgdGhlIGNvbnZlcnNhdGlv
biBvbiB0aGlzIHN0dWZmIGFsbCBzZWVtcyB0byBiZSBnb2luZyBhYnNvbHV0ZWx5Cj4+IG5vd2hl
cmUsIHRoZSBBQ1BJIHBvcnRpb24gb2YgdGhpcyBpcyBpbnRlbmRlZCBmb3IgdXNlIG9uIFJJU0Mt
ViBpbgo+PiB2aW9sYXRpb24gb2YgdGhlIFJJU0MtViBBQ1BJIHNwZWNzLiBJdCBhbHNvIGdvZXMg
YWdhaW5zdCB0aGUKPj4gcmVxdWlyZW1lbnRzIG9mIHRoZSBwbGF0Zm9ybSBzcGVjLiBRdW90aW5n
IGZyb20gWzFdOgo+Pgo+PiB8ID4gSnVzdCBzbyB3ZSdyZSBhbGwgb24gdGhlIHNhbWUgcGFnZSwg
SSBqdXN0IG5vdyBhc2tlZCBNYXJrIEhpbWVsc3RlaW4KPj4gfCA+IG9mIFJJU0MtViBJbnRlcm5h
dGlvbmFsIGlmIHRoZXJlIGlzIGFueXRoaW5nIGluIFJJU0MtViBzdGFuZGFyZHMgdGhhdAo+PiB8
ID4gcmVxdWlyZXMgVUVGSSwgYW5kIHRoZSBhbnN3ZXIgaXMgYSBzb2xpZCAibm8uIgo+PiB8Cj4+
IHwgSHVoPyBGaXJzdGx5LCBydW5uaW5nIG9mZiB0byBpbnZva2UgUlZJIGlzIG5vdCBwcm9kdWN0
aXZlIC0gdGhleSBkb24ndAo+PiB8IG1haW50YWluIHRoZSB2YXJpb3VzIG9wZXJhdGluZyBzeXN0
ZW0ga2VybmVscyBldGMuCj4+IHwgU2Vjb25kbHksIHRoYXQgZG9lcyBub3Qgc2VlbSB0byBiZSB0
cnVlLiBUaGUgcGxhdGZvcm0gc3BlYyBtYW5kYXRlcyBVRUZJCj4+IHwgZm9yIHRoZSBPUy1BIHNl
cnZlciBwbGF0Zm9ybSwgYWxvbmdzaWRlIEFDUEk6Cj4+IHwgaHR0cHM6Ly9naXRodWIuY29tL3Jp
c2N2L3Jpc2N2LXBsYXRmb3JtLXNwZWNzL2Jsb2IvbWFpbi9yaXNjdi1wbGF0Zm9ybS1zcGVjLmFk
b2MjMzItYm9vdC1wcm9jZXNzCj4+IHwgYW5kIHRoZSBPUy1BIGVtYmVkZGVkIHBsYXRmb3JtIG5l
ZWRzIHRvIGNvbXBseSB3aXRoIEVCQlIgJiB1c2UgRFQ6Cj4+IHwgaHR0cHM6Ly9naXRodWIuY29t
L3Jpc2N2L3Jpc2N2LXBsYXRmb3JtLXNwZWNzL2Jsb2IvbWFpbi9yaXNjdi1wbGF0Zm9ybS1zcGVj
LmFkb2MjMzItYm9vdC1wcm9jZXNzCj4+IHwKPj4gfCBFQkJSIGRvZXMgc2F5IHRoYXQgc3lzdGVt
cyBtdXN0IG5vdCBwcm92aWRlIGJvdGggQUNQSSBhbmQgRFQgdG8gdGhlIE9TCj4+IHwgbG9hZGVy
LCBidXQgSSBhbSBmYXIgZnJvbSBhbiBleHBlcnQgb24gdGhlc2Uga2luZCBvZiB0aGluZ3MgJiBh
bSBub3QKPj4gfCBzdXJlIHdoZXJlIHNvbWV0aGluZyBsaWtlIHRoaXMgd2hlcmUgdGhlIERUICJj
b250YWlucyIgQUNQSSB3b3VsZCBzdGFuZC4KPj4gfAo+PiB8IFRoZSBSSVNDLVYgQUNQSSBzcGVj
IGFsc28gc2F5cyAiVUVGSSBmaXJtd2FyZSBpcyBtYW5kYXRvcnkgdG8gc3VwcG9ydAo+PiB8IEFD
UEkiOgo+PiB8IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LWFjcGkvYmxv
Yi9tYXN0ZXIvcmlzY3YtYWNwaS1ndWlkYW5jZS5hZG9jCj4KPiAgVUVGSSBmaXJtd2FyZSBpcyBt
YW5kYXRvcnkgdG8gc3VwcG9ydCBBQ1BJIGFuZCBjb3JlYm9vdCBpcyBhbiBvcHRpb24gdG8gc3Vw
cG9ydCBBQ1BJIGFzIHdlbGwuIGkgdGhpbmsgaXQgd29ya3Mgd2VsbCBmb3IgYm90aCwgSSBkb24n
dCB0aGluayBVRUZJIGFuZCBBQ1BJIG5lZWQgdG8gYmUgYmluZGluZyB0b2dldGhlciwgZWFjaCBV
RUZJIGFuZCBBQ1BJIGFsc28gd29ya3Mgd2VsbCB3aXRoIG90aGVyIHNvbHV0aW9ucy4KClRoYW5r
cyBmb3Igc2hpamlhbihOaWxsKSdzIHN1Z2dlc3Rpb25zLgoKSGkgQ29ub3IsClRoYW5rIHlvdSB2
ZXJ5IG11Y2ggZm9yIHlvdXIgdmFsdWFibGUgY29tbWVudHMgb24gdGhpcyBzZXQgb2YgcGF0Y2gK
Y29kZXMsIHdoaWNoIGFyZSB2ZXJ5IGhlbHBmdWwuCgpKdWRnaW5nIGZyb20gdGhlIGN1cnJlbnQg
c3BlY2lmaWNhdGlvbnMsIG1heWJlIHllcywgeW91IGNhbiBOQUNLLCBidXQKaXQncyBiZXR0ZXIg
bm90IHRvIHJ1c2ggdG8gY29uY2x1c2lvbnMuClRoZSBzby1jYWxsZWQgc3BlY2lmaWNhdGlvbnMg
cmVwcmVzZW50IHRoZSBpZGVhcyBvZiBGRkkgb3Bwb25lbnRzLgpXaGF0IHdlIGhhdmUgdG8gZG8g
aXMgdG8gZGlzY3VzcyB3aXRoIHRoZW0gYW5kIGdldCBhbiBlZmZlY3RpdmUKY29uc2Vuc3VzLCBz
byBhcyB0byBhY2hpZXZlIHRoZSBwdXJwb3NlIG9mIHVwZGF0aW5nIHRoZSBzcGVjaWZpY2F0aW9u
LgoKPj4KPj4KPj4KPj4gTkFLZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3Jv
Y2hpcC5jb20+Cj4+Cj4+IENoZWVycywKPj4gQ29ub3IuCj4+Cj4+IFsxXSAtIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjMwNzA3LWF0dGFjaC1jb25qdXJvci0zMDZkOTY3
MzQ3Y2VAd2VuZHkvCgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
