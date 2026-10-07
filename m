Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA76CA5FF1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 11:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DcB/TTcUGSJ+vFbnepi58CpBPZGuusyOz+I9Q5deLyg=; b=qoAfF9Z4s4dRAE
	AkGzsR50rSD1gxjFx23+oCmcO8q7lt4eiEda8q5XBi93FOyHncSYj/bVAw8aiVEkSkXPFOKRVxHVh
	uBTifcLW+DISj4Hfz4pdyC2toLm6T15WwtbQmS7StXjpcCT+ZEl5QgVgrdFHcXpAgcfYae58jC5lv
	DdsCG4q+x9LQyuedkUC6X66nmz8OLpArGuYuv8UTrnueBBskvR5uXhDGGmxj9jVT8ys2T8mHpzgk5
	t0UTCcIRACd0HjLfdZ2xl/OD6f5U70As0j+Pk6wy2DhhTXFWi0xLtw9gBJelr9p3aDdAqxDtDWTdX
	WYOO6pIpSEoL2oV7zmqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPyo-00000002LV2-3HsQ;
	Wed, 07 Oct 2026 11:38:38 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPym-00000002LU6-37IG
	for linux-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 11:38:37 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-8a83d2706fdso32953337b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2026 04:38:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791373115; cv=none;
        d=google.com; s=arc-20260327;
        b=l6I/rcoAGMHLUM2s21+PBNq8bxo2EfmdHkaDSV0D9bDSo8SLlQJwuX0reG5k6ShEEM
         QucZrLI5ddxVTcPio8xaXZuPzADO1NiStgw8rhnB/cEuwVJ9d1E1+LKe41F7+Q1GuhZy
         hb1fQWFXv4yaojo3DphPNfhBP6GsUDVR/qz5uPblyyJ3GJ1+UvPmmDU8itg3eB9oDPNG
         v1nqkhh66ixRQEAlGfhzxXXA1F8lArXR70ZS6rRQoWqi1rPX+GU/B9wftoY01NYOq85N
         ixGc5/DHsRPzYsTrkF0awGcGaL/ySSAMxrpAkUzvsHwbFwjnRXraOp95GvQ8sawHSnRQ
         8NYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d3UIWCgjiXY8/W55tMRQAIy4f58BTBTGRa+5ZyzE+yk=;
        fh=qpSBwjglGj+5VqAtFn1jtVk7vc/CFn6k8aUwLA0Myzw=;
        b=eeVSqzXM1rXXM5fM7Tv2z/yhOgczLEmRG3NbaVaHB653wRPwrfPLl+4FZk7epkDigH
         2GlRHDnIiWs3xNYG5wWnn3O+dONwVlulS9QPRlj/2aCp6KI1BmiMgSe6mqtL++8iXk8A
         ea/cT91SpjvLP5wkX8QIhIVyDM7hh6aSl0FTBYDQ8z7A1U6IHax/Ei38xzSwgZFBo14E
         EFcJ1x0TEpyCTwmiTLnmDNwns+86Yxv9pwGVLVReKw8hvJpq3Ti/qC+NQ/1FiC5VmKvx
         daSFTbfUZXpHjd0CmsL5jZP/zh5rEGmBWMup4NN3PLRxa0+eR6W+YC8Gz/xoQ94XgnA6
         F2iw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791373115; x=1791977915; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d3UIWCgjiXY8/W55tMRQAIy4f58BTBTGRa+5ZyzE+yk=;
        b=qsyC7qk2jKLah5DTvVxnKf+4SmU6BcXW3nOmytQhnlqTnQVjWVr7IMaOSu3s18SWdo
         EPYazrxOgEwF6wvek1UHtROmFvZklcyWyMFyh1Wfz+jECE7+n7GJdyMqYVTU0TfksENB
         08wzp3JUg0Hhxm6/xpfWTF2HW/BKvhw/lR1SveyzTzciPwNz0qacQ4wja2pCJ8rzK993
         1dCtKpBfAmUl43hvrXN+dmAI5Fn8dOMQ8fFGjX7MX/yZOwugrfvXiBVvPn+OlnWzkiZN
         Msm1oKsukRKgLGqV5G2cW6BQSkFCFjiciUrgkmAAB0ynPnu18qFyUmER/q4dhEkdJz0M
         TX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373115; x=1791977915;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d3UIWCgjiXY8/W55tMRQAIy4f58BTBTGRa+5ZyzE+yk=;
        b=gBH1TOqCXtQP0GwXT8LvTNfs9H135hPbyGln4ybqhU7w6TGtNwUXeYqv/BHsdIGA/y
         tTOuFEhzC8jWE0oKxhvPwGXdPBzo2VoaED+gi7rnQpiYfLDwMKjcMGSva+AtNnuRBWgl
         MyJSIfthkQageMYw6hY1gmgj1XZWzmX9UbYIf+FqsmlYPkWYeQlaCgxofR1QHXXyTnMs
         /j8Ow1FAPzFllrR8uxHXtIW28vHcuxEr4/G0ePpU3/nmW7QRdyq2N+AuaCPQNtGZ9FKD
         WKC5aqjdRJ12CrbopsKXpGdHtCuTl806DkGsThRn0l4SsdvonrhEHHZywfo1jdP+Z5cm
         BybA==
X-Forwarded-Encrypted: i=1; AKwUvBwkaGhEp6Za7DgVZBaCw63WNiKwnpG6SvzG1Kw8eH39vUMVnIjABs+m6bjlgo0n1N4N3Tzw31bStOAz0Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYLnlmgAKemact4c027slVxLnqa/UPFzknAf+KTWFhe+CJzu3zCf
	Jcii5vWHIz3vjffkTMYRz3+cGMUacEU73YRxb61/ceh+1PJ13ghOPSTNAWE2ZiPZvqpYh90FNqR
	xEpKiqXYVbTttKqLNPS4E83CAw8YQy6uCao1tbqQvQg==
X-Gm-Gg: AYBFou3vtaAo1SZTEB2/0M38xzLwJYkFq7l/mK27a8CQ4hDot9s+M34YFzNc8q12D8t
	vx4uLnO8aVi/PKnVjPgva7LP4WCvOxKktICCBGosB9WUJ2uLUsibU1YJHQHtUP/cgDe69fokJII
	DmvRUBFrO0oGsnbweTyNxCZtfGjG2/FOmCa2khuc8K3aR7c1YdPGmrPRVPr1HkEv+tqTDJeRtNp
	SJpKUgRux/7ijlj7e/N3ayH8exPQI8lZG9HdszGDqsV8QgFMIz3+vqHCQ0fq5ZqunVGMYGlrASd
	LC7929zLwZ1zwzSZ9nIXbUqFhcLeLjtQLcOlGgLU6c1D8BxXy0XAToII
X-Received: by 2002:a05:690c:39a:b0:8aa:dc82:36ad with SMTP id
 00721157ae682-8b05b191e87mr14205787b3.94.1791373115311; Wed, 07 Oct 2026
 04:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260924110054.1553880-1-lgs201920130244@gmail.com>
 <CAN4SLj2Rf2jT3tkQNexBueqLy4DMEppqj0V+BPTw02D6vzeyKg@mail.gmail.com> <20261002-useable-progeny-f984e157d19f@spud>
In-Reply-To: <20261002-useable-progeny-f984e157d19f@spud>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 7 Oct 2026 19:38:24 +0800
X-Gm-Features: AclHuK9q7oSZ1h7T5G-3sRuCxbGIEULoECKe9lDq4uTM-LPtzVRcKeJup-HGblI
Message-ID: <CANUHTR_P5eBi=jhS1akdTfg97OXzP1yJnmsUqg=1ewFW10gckA@mail.gmail.com>
Subject: Re: [PATCH] soc: mpfs: use kref cleanup on probe failure
To: Conor Dooley <conor@kernel.org>
Cc: Felix Gu <ustc.gu@gmail.com>, conor.dooley@microchip.com, 
	daire.mcnamara@microchip.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_043836_828748_09AA0CAA 
X-CRM114-Status: GOOD (  26.20  )
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

SGkgQ29ub3IsCgpUaGFua3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0LgoKT24gU2F0LCAzIE9jdCAy
MDI2IGF0IDAxOjIyLCBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4g
T24gRnJpLCBTZXAgMjUsIDIwMjYgYXQgMTI6MDQ6MTZBTSArMDgwMCwgRmVsaXggR3Ugd3JvdGU6
Cj4gPiBIaSBHdWFuZ3NodW8sCj4gPgo+ID4gT24gVGh1LCBTZXAgMjQsIDIwMjYgYXQgNzowMeKA
r1BNIEd1YW5nc2h1byBMaSA8bGdzMjAxOTIwMTMwMjQ0QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+
Cj4gPiA+IEFmdGVyIGtyZWZfaW5pdCgpLCB0aGUgZGV2aWNlX2dldF9tYXRjaF9kYXRhKCkgZmFp
bHVyZSBwYXRoIGp1bXBzIHRvCj4gPiA+IG91dF9mcmVlX2NoYW5uZWwuIFRoYXQgcGF0aCBmcmVl
cyB0aGUgbWFpbGJveCBjaGFubmVsIGFuZCB0aGVuIGZhbGxzCj4gPiA+IHRocm91Z2ggdG8ga2Zy
ZWUoKSwgYnlwYXNzaW5nIG1wZnNfc3lzX2NvbnRyb2xsZXJfcHV0KCkgZm9yIHRoZSBpbml0aWFs
Cj4gPiA+IHJlZmVyZW5jZS4KPiA+ID4KPiA+ID4gQ2FsbCBtcGZzX3N5c19jb250cm9sbGVyX3B1
dCgpIG9uIHRoYXQgcGF0aCBhbmQgcmV0dXJuIGltbWVkaWF0ZWx5LiBUaGUKPiA+ID4gZXhpc3Rp
bmcga3JlZiByZWxlYXNlIGNhbGxiYWNrIHRoZW4gcGVyZm9ybXMgdGhlIG1hdGNoaW5nIGNsZWFu
dXAsIGFuZAo+ID4gPiB0aGUgcmV0dXJuIHByZXZlbnRzIGEgc2Vjb25kIGZyZWUgdGhyb3VnaCBv
dXRfZnJlZS4gVGhpcyBpcyB0aGUgbWluaW1hbAo+ID4gPiBjaGFuZ2UgbmVlZGVkIHRvIGtlZXAg
dGhlIGluaXRpYWxpemVkIGxpZmV0aW1lIGJhbGFuY2VkLgo+ID4gPgo+ID4KPiA+IEkgZG9uJ3Qg
dGhpbmsgdGhpcyBpcyBhIGZpeC4gIG1wZnNfc3lzX2NvbnRyb2xsZXJfcHV0KCkgZG9lcyB0aGUg
c2FtZQo+ID4gbWJveF9mcmVlX2NoYW5uZWwoKSArIGtmcmVlKCkgdGhlIGN1cnJlbnQgcGF0aCBh
bHJlYWR5IGRvZXMuCj4KPiBXaHkgd291bGQgaXQgbm90IGJlIGEgZml4PyBNYXliZSB5b3UgbWl4
ZWQgdXAgdGhlIGRlbGV0ZSBhbmQgcHV0Pwo+Cj4gc3RhdGljIHZvaWQgbXBmc19zeXNfY29udHJv
bGxlcl9kZWxldGUoc3RydWN0IGtyZWYgKmtyZWYpCj4gewo+ICAgICAgICAgc3RydWN0IG1wZnNf
c3lzX2NvbnRyb2xsZXIgKnN5c19jb250cm9sbGVyID0KPiAgICAgICAgICAgICAgICAgY29udGFp
bmVyX29mKGtyZWYsIHN0cnVjdCBtcGZzX3N5c19jb250cm9sbGVyLCBjb25zdW1lcnMpOwo+Cj4g
ICAgICAgICBtYm94X2ZyZWVfY2hhbm5lbChzeXNfY29udHJvbGxlci0+Y2hhbik7Cj4gICAgICAg
ICBrZnJlZShzeXNfY29udHJvbGxlcik7Cj4gfQo+Cj4gc3RhdGljIHZvaWQgbXBmc19zeXNfY29u
dHJvbGxlcl9wdXQodm9pZCAqZGF0YSkKPiB7Cj4gICAgICAgICBzdHJ1Y3QgbXBmc19zeXNfY29u
dHJvbGxlciAqc3lzX2NvbnRyb2xsZXIgPSBkYXRhOwo+Cj4gICAgICAgICBrcmVmX3B1dCgmc3lz
X2NvbnRyb2xsZXItPmNvbnN1bWVycywgbXBmc19zeXNfY29udHJvbGxlcl9kZWxldGUpOwo+IH0K
Pgo+IHRoZSBrcmVmX3B1dCgpIHRoYXQgd3JhcHMgbXBmc19zeXNfY29udHJvbGxlcl9kZWxldGUo
KSBkZWNyZWFzZXMgdGhlCj4gcmVmY291bnQgYW5kIGlzIHRoZSBtYXRjaGluZyBhY3Rpb24gZm9y
IHRoZSBrcmVmX2luaXQoKSBkdXJpbmcgcHJvYmUuCj4KPgo+ID4gPiBGaXhlczogNzVlZjIzMzk3
NTU4ICgic29jOiBtaWNyb2NoaXA6IG1wZnMtc3lzLWNvbnRyb2xsZXI6IGZpeCByZXNvdXJjZSBs
ZWFrIG9uIHByb2JlIGVycm9yIikKPgo+IFVuZm9ydHVuYXRlbHksIHdpdGhvdXQgYSBzaWdub2Zm
LCBJIGNhbm5vdCBhcHBseSB0aGlzLgo+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9zb2MvbWlj
cm9jaGlwL21wZnMtc3lzLWNvbnRyb2xsZXIuYyB8IDMgKystCj4gPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3NvYy9taWNyb2NoaXAvbXBmcy1zeXMtY29udHJvbGxlci5jIGIvZHJpdmVycy9z
b2MvbWljcm9jaGlwL21wZnMtc3lzLWNvbnRyb2xsZXIuYwo+ID4gPiBpbmRleCAwNDAwYTAxYjIz
MzguLjM3OWU0ZjY0OWZhYSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9zb2MvbWljcm9jaGlw
L21wZnMtc3lzLWNvbnRyb2xsZXIuYwo+ID4gPiArKysgYi9kcml2ZXJzL3NvYy9taWNyb2NoaXAv
bXBmcy1zeXMtY29udHJvbGxlci5jCj4gPiA+IEBAIC0xNzQsNyArMTc0LDggQEAgc3RhdGljIGlu
dCBtcGZzX3N5c19jb250cm9sbGVyX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
Cj4gPiA+ICAgICAgICAgcmV0dXJuIDA7Cj4gPiA+Cj4gPiA+ICBvdXRfZnJlZV9jaGFubmVsOgo+
ID4gPiAtICAgICAgIG1ib3hfZnJlZV9jaGFubmVsKHN5c19jb250cm9sbGVyLT5jaGFuKTsKPiA+
ID4gKyAgICAgICBtcGZzX3N5c19jb250cm9sbGVyX3B1dChzeXNfY29udHJvbGxlcik7Cj4gPiA+
ICsgICAgICAgcmV0dXJuIHJldDsKPiA+Cj4gPiBJZiB5b3UgZG8ga2VlcCB0aGlzLCB0aGUgb3V0
X2ZyZWVfY2hhbm5lbCBsYWJlbCBubyBsb25nZXIgZml0cy4KPgo+IFRydWUuCj4KClRoZSBtaXNz
aW5nIFNpZ25lZC1vZmYtYnkgdGFnIHdhcyBvdXIgbWlzdGFrZS4gSSB3aWxsIGFkZCBpdCBhbmQg
c2VuZAphIHYyLCB0b2dldGhlciB3aXRoIHRoZSBlcnJvciBsYWJlbCByZW5hbWUgc3VnZ2VzdGVk
IGJ5IEZlbGl4LgoKU29ycnkgZm9yIHRoZSBvdmVyc2lnaHQsIGFuZCB0aGFua3MgZm9yIHRoZSBy
ZXZpZXcuCgpCZXN0IHJlZ2FyZHMsCkd1YW5nc2h1bwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
