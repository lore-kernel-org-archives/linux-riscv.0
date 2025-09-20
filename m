Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A64CAC597
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 06:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x9S8Z9hVEnbM1WijBRdkCtcectkLwO9X1EahvsgY1+4=; b=bIB91at7vvIIjh
	p07nQaW2Jq59syPMsm+ZkY/i9IQ1O9otoZI0J5LI6R1Ypo35YoxxVmz6qvHaVYG2KgRzQTmjkZgwe
	k5GPZts5gjPhJgUh+xoAoLfXwDKxxgHawGGwM/S+6Wrs8NRjqoef3OaFl6Rg8hFXtBMieOMgS8w/O
	8vDhz2t000Ap8QKm2wfYq2c1vbB5M0Cv70B34SS3nnpYWHyiFeZlVNYt11XYXYfxA22M7PlwhYgmu
	jxTZI76PnkyYPPIPaz8qF0KmR36rRL9R1S16qKamkGHwPlEoaOUYZtusowCBkeJvOlOYchio818aU
	xdR9qVrdZXQvGGGz8p+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzqdo-00000004qpc-0AHu;
	Sat, 20 Sep 2025 06:00:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzqdn-00000004qpN-0pLK
	for linux-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 06:00:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5650660194
	for <linux-riscv@lists.infradead.org>; Sat, 20 Sep 2025 06:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB0E5C4CEF1
	for <linux-riscv@lists.infradead.org>; Sat, 20 Sep 2025 06:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758348010;
	bh=hVtNHfJwSNFGIfBeLBsVK4wWa6+5QGlREP4ggQs41xE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LtKc4BMc6bw7mV2L+4lBdinSApl7l6PlkIHq7rGyZ8Q7uwuQck+ehpdnIjBYkrYJ7
	 00ztBflA1qa+82OXJDZbdqM4MoGln/yuM/XFdWJ1kDbO2O+rXi8vP9Ej/r1Y9rp4uO
	 mXfcAOGcQtTsMG6tXSPpbXdb8Mpa/vLH0m4ic50Ixf7HdsSV8KDmhu2bJm4krhzfes
	 GR7Y60bu6gkSUbqs0pXVlaaIT8kEmze6n/rpBOWZcEFKizxle5Wbj7w8BgjSjRuXkx
	 5QAaD4KDsGI0IBmpwfH0bBUpZlJIsV4m9NyRYTjF6he/Maay88As713rz7mv99lYKs
	 LiKQmaODEixbg==
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45dd5e24d16so26529045e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 23:00:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUKnqpfWaqtZDJp1mtyMs0re4IQUcAPC6QuUBKkyjEpTtmEp98H93alNVbcaMNFGayB0m1Aru60ZLfqg==@lists.infradead.org
X-Gm-Message-State: AOJu0YztwGCuBzBeNvMFYW6j0f5YpxtOWp/B40J+7dvJE/X8Yvk22OpL
	/dqr4mS42jCxx4WR4/orPoZNu+kYjErpn86oq/fUhf+/nEbtpY9b7AggSDtNVmlnx7xMWgM3QBT
	fgVnxm04tyt7yMGc8TLS/JAWwN3TjwE8=
X-Google-Smtp-Source: AGHT+IFyJP166p60BtFnlLt5+NsmTblIm8XMHGMCgm5M6+8c5BhNRkh3BVGKN6xz3Bv9bUS2dpxlRmgerLQCcFFxnNU=
X-Received: by 2002:a05:6000:4024:b0:3ec:d80d:e59b with SMTP id
 ffacd0b85a97d-3ee7bad121emr5519041f8f.10.1758348008426; Fri, 19 Sep 2025
 23:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250902042432.78960-1-luxu.kernel@bytedance.com>
 <aLciY2putG8g2P9F@andrea> <aMoyntAydNMtcl+3@gmail.com> <aMw3504EwlnDOJI0@gmail.com>
 <aMx4mS0K8f_aDV_q@andrea>
In-Reply-To: <aMx4mS0K8f_aDV_q@andrea>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 20 Sep 2025 13:59:56 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSELHo6mSUB9ODvrOkDOtbT85waC9O7T7DUoF3MVZEseQ@mail.gmail.com>
X-Gm-Features: AS18NWDTKwMZzzONVJiFtjB5mojteYAsvxvGQeOAEukpl-IbwwpPq-YvEBjnFOk
Message-ID: <CAJF2gTSELHo6mSUB9ODvrOkDOtbT85waC9O7T7DUoF3MVZEseQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] riscv: Add Zalasr ISA extension support
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Xu Lu <luxu.kernel@bytedance.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, ajones@ventanamicro.com, 
	brs@rivosinc.com, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, apw@canonical.com, joe@perches.com
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

T24gRnJpLCBTZXAgMTksIDIwMjUgYXQgNToyNOKAr0FNIEFuZHJlYSBQYXJyaSA8cGFycmkuYW5k
cmVhQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBbbWVyZ2luZyByZXBsaWVzXQo+Cj4gPiA+IEkgcHJl
ZmVyIG9wdGlvbiBjKSBhdCBmaXJzdCwgaXQgaGFzIGZld2VyIG1vZGlmaWNhdGlvbiBhbmQgaW5m
bHVlbmNlLgo+ID4gQW5vdGhlciByZWFzb24gaXMgdGhhdCBzdG9yZS1yZWxlYXNlLXRvLWxvYWQt
YWNxdWlyZSB3b3VsZCBnaXZlIG91dCBhCj4gPiBGRU5DRSBydywgcncgYWNjb3JkaW5nIHRvIFJW
V01PIFBQTyA3dGggcnVsZSBpbnN0ZWFkIG9mIEZFTkNFLlRTTywgd2hpY2gKPiA+IGlzIHN0cmlj
dGVyIHRoYW4gdGhlIExpbnV4IHJlcXVpcmVtZW50IHlvdSd2ZSBtZW50aW9uZWQuCj4KPiBJIG1l
YW4sIGlmICJmZXdlciBtb2RpZmljYXRpb24iIGFuZCAibm90LWEtZnVsbC1mZW5jZSIgd2VyZSB0
aGUgb25seQo+IGFyZ3VtZW50cywgd2Ugd291bGQgcHJvYmFibHkganVzdCBzdGljayB3aXRoIHRo
ZSBjdXJyZW50IHNjaGVtZSAoYiksCj4gcmlnaHQ/ICBXaGF0IG90aGVyIGFyZ3VtZW50cyBhcmUg
YXZhaWxhYmxlPyAgRG9uJ3QgZ2V0IG1lIHdyb25nOiBubyBhCj4gcHJpb3JpIG9iamVjdGlvbiBm
cm9tIG15IGVuZDsgSSB3YXMgcmVhbGx5IGp1c3Qgd29uZGVyaW5nIGFib3V0IHRoZQo+IHZhcmlv
dXMgaW50ZXJlc3RzL3JhdGlvbmFsZXMgaW4gdGhlIFJJU0MtViBrZXJuZWwgY29tbXVuaXR5LiAg
KEl0IG1heQo+IHN1cnByaXNlIHlvdSwgYnV0IHNvbWUgY29tbXVuaXRpZXMgZGlkIGNvbnNpZGVy
IHRoYXQgIlVOTE9DSytMT0NLIGlzCj4gbm90IGEgZnVsbCBtZW1vcnkgYmFycmllciIgYSBkaXNh
ZHZhbnRhZ2UsIGJlY2F1c2UgYnJpZWZseSAibG9ja2luZwo+IHNob3VsZCBwcm92aWRlIHN0cm9u
ZyBvcmRlcmluZyBndWFyYW50ZWVzIGFuZCBiZSBlYXN5IHRvIHJlYXNvbiBhYm91dCI7Cj4gaW4g
ZmFjdCwgbm90IGp1c3QgImxvY2tpbmciIGlmIHdlIGNvbnNpZGVyIHg4NiBvciBhcm02NC4uLikK
ClRoZSBsZC5hcSBpcyByZWFsbHkgZmFzdGVyIHRoYW4gdGhlICJsZCArIGZlbmNlIHIsIHJ3IiBp
biBtaWNyb2FyY2guIEkKZG9uJ3QgY2FyZSBhYm91dCB0aGUgcGVyZm9ybWFuY2Ugb2YgdGhlICJV
TkxPQ0srTE9DSyIgc2NlbmFyaW8uCgo+Cj4KPiA+ID4gYXNtIHZvbGF0aWxlKEFMVEVSTkFUSVZF
KCJmZW5jZSBydywgdztcdFxuc2IgJTAsIDAoJTEpXHRcbiIsICAgICAgICBcCj4gPiA+IC0gICAg
ICAgICAgICAgICAgICAgICBTQl9STCglMCwgJTEpICJcdFxubm9wXHRcbiIsICAgICAgICAgIFwK
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIFNCX1JMKCUwLCAlMSkgIlx0XG4gZmVuY2UudHNv
O1x0XG4iLCAgXAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgMCwgUklTQ1ZfSVNBX0VYVF9a
QUxBU1IsIDEpICAgICAgICAgICBcCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICA6IDogInIi
ICh2KSwgInIiIChwKSA6ICJtZW1vcnkiKTsgICAgIFwKPgo+IG5pdDogV2h5IHBsYWNpbmcgdGhl
IGZlbmNlIGFmdGVyIHRoZSBzdG9yZT8gIEkgaW1hZ2luZSB0aGF0IEZFTkNFLlRTTwo+IGNvdWxk
IHByZWNlZGUgdGhlIHN0b3JlLCB0aGlzIHdheSwgdGhlIHN0b3JlIHdvdWxkIGFjdHVhbGx5IG5v
dCBuZWVkCj4gdG8gaGF2ZSB0aGF0IC5STCBhbm5vdGF0aW9uLiAgTW9yZSBpbXBvcnRhbnRseSwK
WWVzLCBmZW5jZS50c28gaXMgc3RyaWN0ZXIgdGhhbiBmZW5jZSBydywgdywgaXQgZ2l2ZXMgYW4g
YWRkaXRpb25hbApmZW5jZSByLCByIGJhcnJpZXIuCgo+Cj4gVGhhdCBmb3IgKHBhcnQgb2YpIHNt
cF9zdG9yZV9yZWxlYXNlKCkuICBMZXQgbWUgc3RyZXNzIHRoYXQgbXkgb3B0aW9uCj4gKGMpIHdh
cyBtZWFudCB0byBpbmNsdWRlIHNpbWlsYXIgY2hhbmdlcyBmb3IgX2V2ZXJ5IHJlbGVhc2VzICh0
aGF0IGlzLAo+IGNtcHhjaGdfcmVsZWFzZSgpLCBhdG9taWNfaW5jX3JldHVybl9yZWxlYXNlKCks
IGFuZCBtYW55IG90aGVyKSwgZXZlbgo+IGlmIG1vc3Qgb2Ygc3VjaCByZWxlYXNlcyBkbyBub3Qg
Y3VycmVudGx5IGNyZWF0ZSAicHJvYmxlbWF0aWMgcGFpcnMiCj4gd2l0aCBhIGNvcnJlc3BvbmRp
bmcgYWNxdWlyZTogdGhlIGNvbmNlcm4gaXMgdGhhdCBmdXR1cmUgY2hhbmdlcyBpbiB0aGUKPiBS
SVNDLVYgYXRvbWljcyBpbXBsZW1lbnRhdGlvbiBvciBpbiBnZW5lcmljIGxvY2tpbmcgY29kZSB3
aWxsIGludHJvZHVjZQo+IHBhaXJzIG9mIHRoZSBmb3JtIEZFTkNFIFJXLFcgKyAuQVEgb3IgLlJM
ICsgRkVOQ0UgUixSVyB3aXRob3V0IGFueW9uZQo+IG5vdGljaW5nLi4uICBJbiBvdGhlciB3b3Jk
cywgSSB3YXMgc3VnZ2VzdGluZyB0aGF0IFJJU0MtViBfY29udGludWVzCj4gdG8gbWVldCB0aGUg
b3JkZXJpbmcgcHJvcGVydHkgdW5kZXIgZGlzY3Vzc2lvbiAiYnkgZGVzaWduIiByYXRoZXIgdGhh
bgo+ICJieSBBbmRyZWEgb3Igd2hvZXZlcidzIGNvZGUgYXVkaXRpbmcvcmV2aWV3IiAoYXNzdW1p
bmcgaXQncyBmZWFzaWJsZSwKPiBpLmUuIHRoYXQgaXQgZG9lc24ndCBjbGFzaCB3aXRoIG90aGVy
IHBlb3BsZSdzIGFyZ3VtZW50cz8pOyBvcHRpb25zIChhKQo+IGFuZCAoYikgd2VyZSBhbHNvICJk
ZXNpZ25lZCIgZm9sbG93aW5nIHRoaXMgc2FtZSBjcml0ZXJpb24uCj4KPiAgIEFuZHJlYQotLQpC
ZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
