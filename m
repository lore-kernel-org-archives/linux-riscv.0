Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FE2D3ABF4
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 23:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ly5JfKUOMa7TEJ45S9SD3WclddwSK7ZMgUKKHnQ7ZQ8=; b=Wc0sf1a14R1Bds
	Qgg+eiRk61Hq2T0eaVSyBk4l43JGxHeayRVgzouHxg7t/7UUOXLNnuMfPalHXb4H4w+4YL9VcaBvF
	uMsE85KKpSqS5TTJp9mGR4N2qsxX5GOT+rHELtaU6Cz6OjW8G7pRDAF9DZyTD16v4MAApvoeZ6iWE
	wKPV/gJxndgBm+dEaAfCP9L3F8G0BGAqZAC4lJ9thN5pihfSxKAvuGmtygw6JF9AxGmj6XfWg7kM8
	fRjJr0DcdrmthSptKWco53LIT/6+S6uOMFvInhuSRdh6LRe0TXU9Sum1eZ7Ah34MQHGvFAC/av3fR
	1AgGGTvFxLdBAmFohQUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAdks-00000001cCc-1HSH;
	Mon, 11 Nov 2024 23:23:34 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAdko-00000001cBd-2YOr
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 23:23:32 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-720b2d8bb8dso3582654b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 Nov 2024 15:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731367409; x=1731972209; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfkKwHEqEKuvC0xVezU0FnOzboDm7id7i17WV79t3rw=;
        b=dqk85FHy/6Mmc9drwx4QpvALTjkX14OrwWnVlxo3Yk9J0ECgBrgQGgB6+033hOCPxr
         AUwg2EMO41pzrKvgC4nnKx0FZ5H1RUGbUWrd+L4fK5USP6369mS6zdhEju8cFsXMcRI5
         +dj86FASTEDNucq9XPOGY9EMXblfaPv5rRhef3gvjQvhDw8NB/ghzm5Y0Pj9ujW23oAA
         FGuym6dcHr/gQqckEJMHSv2RRLle+c5rlSa90lHnDZVmmhMbBjmE1shaTaraDSpOL/CO
         4zpsOxqSxMDu+dNlYMWoHvshGwAnfPt03XycVUSLjtfSwJHIDRDC63qqO11GlVqOKqko
         ROYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731367409; x=1731972209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hfkKwHEqEKuvC0xVezU0FnOzboDm7id7i17WV79t3rw=;
        b=GJVWz6EKwTz4uTHcnSY8HhahnorhZG/etzGnc4ysGfmvN1uSiGzjUkJUZaNjX0G0FV
         Wdu5k2rfmMSSsIaErWpjkWA39I9q8XCw34Acy1C2iCcyuiVK7i6dcj+Pr8pJkQmZclbu
         fSZKzhd9Zlkj+pK/CTz2SvGZp2ZpBH2D8+W7YWIHgk0aP/WpZ37ixZtM3DUWEHyB+PbM
         uIJQbjLa0tWsMoxmY8C7GfeKn8DAG+rBK/72sODrcgm+8VKviNWRKj0sTItc/7bqK20A
         0cIxkzjMdnNIciqVrWYm1IUFKQJFN4YhnTVoDiaoafJeXuQ+9lkGhURfAyTYzF9Yc95G
         xrSw==
X-Gm-Message-State: AOJu0YxCk/Wq2NITy9qejbZiCROOLpi7VN/derRvwsyPvfjyVQSYWQmr
	AswTc1xLIcRfmZfZCknCXplQjdYA3klZS5pBHHRioANbve9hXjMaz3YYBBzJKgYJyTVJGG+uPoI
	wScu294YqLJep7j9FzdGSgO+x5r2jl2OLE9JSLeL+F6bOH0cSgc0=
X-Google-Smtp-Source: AGHT+IFB+aENPfYJcxrY/B/QgxvxxyBcebWQTXtdrGQMviuRc2OeVXcpmuwNdw+GfRFld6Cwnlx4fxFV61+mb2R453c=
X-Received: by 2002:a05:6a00:14d3:b0:71e:659:f2e7 with SMTP id
 d2e1a72fcca58-724132a1a87mr19143630b3a.8.1731367408901; Mon, 11 Nov 2024
 15:23:28 -0800 (PST)
MIME-Version: 1.0
References: <20241026121758.143259-1-irogers@google.com>
In-Reply-To: <20241026121758.143259-1-irogers@google.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 11 Nov 2024 15:23:18 -0800
Message-ID: <CAHBxVyF5c4CW7kdPoBENv7o7mObo=yaHdf7peATY+Jq6Aug=Bw@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] Prefer sysfs/JSON events also when no PMU is provided
To: Ian Rogers <irogers@google.com>
Cc: linux-riscv@lists.infradead.org, beeman@rivosinc.com, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	James Clark <james.clark@linaro.org>, Ze Gao <zegao2021@gmail.com>, 
	Weilin Wang <weilin.wang@intel.com>, Ben Gainey <ben.gainey@arm.com>, 
	Dominique Martinet <asmadeus@codewreck.org>, Junhao He <hejunhao3@huawei.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_152330_940063_CB5F8E03 
X-CRM114-Status: GOOD (  27.52  )
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

T24gU2F0LCBPY3QgMjYsIDIwMjQgYXQgNToxOOKAr0FNIElhbiBSb2dlcnMgPGlyb2dlcnNAZ29v
Z2xlLmNvbT4gd3JvdGU6Cj4KPiBBdCB0aGUgUklTQy1WIHN1bW1pdCB0aGUgdG9waWMgb2YgYXZv
aWRpbmcgZXZlbnQgZGF0YSBiZWluZyBpbiB0aGUKPiBSSVNDLVYgUE1VIGtlcm5lbCBkcml2ZXIg
Y2FtZSB1cC4gVGhlcmUgaXMgYSBwcmVmZXJlbmNlIGZvciBzeXNmcy9KU09OCj4gZXZlbnRzIGJl
aW5nIHRoZSBwcmlvcml0eSB3aGVuIG5vIFBNVSBpcyBwcm92aWRlZCBzbyB0aGF0IGxlZ2FjeQo+
IGV2ZW50cyBtYXliZSBzdXBwb3J0ZWQgdmlhIGpzb24uIE9yaWdpbmFsbHkgTWFyayBSdXRsYW5k
IGFsc28KPiBleHByZXNzZWQgYXQgTFBDIDIwMjMgdGhhdCBkb2luZyB0aGlzIHdvdWxkIHJlc29s
dmUgYnVncyBvbiBBUk0gQXBwbGUKPiBNPyBwcm9jZXNzb3JzLCBidXQgSmFtZXMgQ2xhcmsgbW9y
ZSByZWNlbnRseSB0ZXN0ZWQgdGhpcyBhbmQgYmVsaWV2ZXMKPiB0aGUgZHJpdmVyIGlzc3VlcyB0
aGVyZSBtYXkgbm90IGhhdmUgZXhpc3RlZCBvciBoYXZlIGJlZW4gcmVzb2x2ZWQuIEluCj4gYW55
IGNhc2UsIGl0IGlzIGluY29uc2lzdGVudCB0aGF0IHdpdGggYSBQTVUgZXZlbnQgbmFtZXMgYXZv
aWQgbGVnYWN5Cj4gZW5jb2RpbmdzLCBidXQgd2hlbiB3aWxkY2FyZGluZyBQTVVzIChpZSB3aXRo
b3V0IGEgUE1VIHdpdGggdGhlIGV2ZW50Cj4gbmFtZSkgdGhlIGxlZ2FjeSBlbmNvZGluZ3MgaGF2
ZSBwcmlvcml0eS4KPgo+IFRoZSBwYXRjaCBkb2luZyB0aGlzIHdvcmsgd2FzIHJldmVydGVkIGlu
IGEgdjYuMTAgcmVsZWFzZSBjYW5kaWRhdGUKPiBhcywgZXZlbiB0aG91Z2ggdGhlIHBhdGNoIHdh
cyBwb3N0ZWQgZm9yIHdlZWtzIGFuZCBoYWQgYmVlbiBvbgo+IGxpbnV4LW5leHQgZm9yIHdlZWtz
IHdpdGhvdXQgaXNzdWUsIExpbnVzIHdhcyBpbiB0aGUgaGFiaXQgb2YgdXNpbmcKPiBleHBsaWNp
dCBsZWdhY3kgZXZlbnRzIHdpdGggdW5zdXBwb3J0ZWQgcHJlY2lzaW9uIG9wdGlvbnMgb24gaGlz
Cj4gTmVvdmVyc2UtTjEuIFRoaXMgbWFjaGluZSBoYXMgU0xDIFBNVSBldmVudHMgZm9yIGJ1cyBh
bmQgQ1BVIGN5Y2xlcwo+IHdoZXJlIEFSTSBkZWNpZGVkIHRvIGNhbGwgdGhlIGV2ZW50cyBidXNf
Y3ljbGVzIGFuZCBjeWNsZXMsIHRoZSBsYXR0ZXIKPiBiZWluZyBhbHNvIGEgbGVnYWN5IGV2ZW50
IG5hbWUuIEFSTSBoYXZlbid0IHJlbmFtZWQgdGhlIGN5Y2xlcyBldmVudAo+IHRvIGEgbW9yZSBj
b25zaXN0ZW50IGNwdV9jeWNsZXMgYW5kIGF2b2lkZWQgdGhlIHByb2JsZW0uIFdpdGggdGhlc2UK
PiBjaGFuZ2VzIHRoZSBwcm9ibGVtYXRpYyBldmVudCB3aWxsIG5vdyBiZSBza2lwcGVkLCBhIGxh
cmdlIHdhcm5pbmcKPiBwcm9kdWNlZCwgYW5kIHBlcmYgcmVjb3JkIHdpbGwgY29udGludWUgZm9y
IHRoZSBvdGhlciBQTVUgZXZlbnRzLiBUaGlzCj4gc29sdXRpb24gd2FzIHByb3Bvc2VkIGJ5IEFy
bmFsZG8uCj4KPiBUd28gbWlub3IgY2hhbmdlcyBoYXZlIGJlZW4gYWRkZWQgdG8gaGVscCB3aXRo
IHRoZSBlcnJvciBtZXNzYWdlIGFuZAo+IHRvIHdvcmsgYXJvdW5kIGlzc3VlcyBvY2N1cnJpbmcg
d2l0aCAicGVyZiBzdGF0IG1ldHJpY3MgKHNoYWRvdyBzdGF0KQo+IHRlc3QiLgo+Cj4gVGhlIHBh
dGNoZXMgaGF2ZSBvbmx5IGJlZW4gdGVzdGVkIG9uIG15IHg4NiBub24taHlicmlkIGxhcHRvcC4K
Pgo+IElhbiBSb2dlcnMgKDQpOgo+ICAgcGVyZiBldnNlbDogQWRkIHBtdV9uYW1lIGhlbHBlcgo+
ICAgcGVyZiBzdGF0OiBGaXggZmluZF9zdGF0IGZvciBtaXhlZCBsZWdhY3kvbm9uLWxlZ2FjeSBl
dmVudHMKPiAgIHBlcmYgcmVjb3JkOiBTa2lwIGRvbid0IGZhaWwgZm9yIGV2ZW50cyB0aGF0IGRv
bid0IG9wZW4KPiAgIHBlcmYgcGFyc2UtZXZlbnRzOiBSZWFwcGx5ICJQcmVmZXIgc3lzZnMvSlNP
TiBoYXJkd2FyZSBldmVudHMgb3Zlcgo+ICAgICBsZWdhY3kiCj4KPiAgdG9vbHMvcGVyZi9idWls
dGluLXJlY29yZC5jICAgIHwgMjIgKysrKysrKy0tLQo+ICB0b29scy9wZXJmL3V0aWwvZXZzZWwu
YyAgICAgICAgfCAxMCArKysrKwo+ICB0b29scy9wZXJmL3V0aWwvZXZzZWwuaCAgICAgICAgfCAg
MSArCj4gIHRvb2xzL3BlcmYvdXRpbC9wYXJzZS1ldmVudHMuYyB8IDI2ICsrKysrKysrKy0tLQo+
ICB0b29scy9wZXJmL3V0aWwvcGFyc2UtZXZlbnRzLmwgfCA3NiArKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0tCj4gIHRvb2xzL3BlcmYvdXRpbC9wYXJzZS1ldmVudHMueSB8IDYwICsr
KysrKysrKysrKysrKysrKy0tLS0tLS0tLQo+ICB0b29scy9wZXJmL3V0aWwvcG11cy5jICAgICAg
ICAgfCAyMCArKysrKysrLS0KPiAgdG9vbHMvcGVyZi91dGlsL3N0YXQtc2hhZG93LmMgIHwgIDMg
Ky0KPiAgOCBmaWxlcyBjaGFuZ2VkLCAxNDUgaW5zZXJ0aW9ucygrKSwgNzMgZGVsZXRpb25zKC0p
Cj4KClRoYW5rcyBmb3IgdGhlIHNlcmllcy4gVGVzdGVkIG9uIFJJU0MtViBxZW11IHdpdGggY291
bnRlciBkZWxlZ2F0aW9uIGVuYWJsZWQuCkkgYW0gYWJsZSB0byBnZXQgdGhlIGV2ZW50IGVuY29k
aW5ncyBzcGVjaWZpZWQgaW4gdGhlIGpzb24gZmlsZQppbnN0ZWFkIG9mIGxlZ2FjeSBldmVudCBl
bmNvZGluZ3MuCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpyb290QGRlYmlhbjp+
L2hvc3QjIC4vcGVyZiBzdGF0IC1lIGN5Y2xlcyAtZSBpbnN0cnVjdGlvbnMgLXZ2diBscwpDb250
cm9sIGRlc2NyaXB0b3IgaXMgbm90IGluaXRpYWxpemVkCk9wZW5pbmc6IGN5Y2xlcwotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KcGVy
Zl9ldmVudF9hdHRyOgogIHR5cGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDQgKGNwdSkK
ICBzaXplICAgICAgICAgICAgICAgICAgICAgICAgICAgICAxMzYKICBjb25maWcgICAgICAgICAg
ICAgICAgICAgICAgICAgICAweDEgKGN5Y2xlcykKICBzYW1wbGVfdHlwZSAgICAgICAgICAgICAg
ICAgICAgICBJREVOVElGSUVSCiAgcmVhZF9mb3JtYXQgICAgICAgICAgICAgICAgICAgICAgVE9U
QUxfVElNRV9FTkFCTEVEfFRPVEFMX1RJTUVfUlVOTklORwogIGRpc2FibGVkICAgICAgICAgICAg
ICAgICAgICAgICAgIDEKICBpbmhlcml0ICAgICAgICAgICAgICAgICAgICAgICAgICAxCiAgZW5h
YmxlX29uX2V4ZWMgICAgICAgICAgICAgICAgICAgMQogIHsgYnBfbGVuLCBjb25maWcyIH0gICAg
ICAgICAgICAgIDB4N2Y5Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQpzeXNfcGVyZl9ldmVudF9vcGVuOiBwaWQgNDI0ICBjcHUgLTEg
IGdyb3VwX2ZkIC0xICBmbGFncyAweDggPSAzCk9wZW5pbmc6IGluc3RydWN0aW9ucwotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KcGVy
Zl9ldmVudF9hdHRyOgogIHR5cGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDQgKGNwdSkK
ICBzaXplICAgICAgICAgICAgICAgICAgICAgICAgICAgICAxMzYKICBjb25maWcgICAgICAgICAg
ICAgICAgICAgICAgICAgICAweDIgKGluc3RydWN0aW9ucykKICBzYW1wbGVfdHlwZSAgICAgICAg
ICAgICAgICAgICAgICBJREVOVElGSUVSCiAgcmVhZF9mb3JtYXQgICAgICAgICAgICAgICAgICAg
ICAgVE9UQUxfVElNRV9FTkFCTEVEfFRPVEFMX1RJTUVfUlVOTklORwogIGRpc2FibGVkICAgICAg
ICAgICAgICAgICAgICAgICAgIDEKICBpbmhlcml0ICAgICAgICAgICAgICAgICAgICAgICAgICAx
CiAgZW5hYmxlX29uX2V4ZWMgICAgICAgICAgICAgICAgICAgMQogIHsgYnBfbGVuLCBjb25maWcy
IH0gICAgICAgICAgICAgIDB4N2ZjCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzeXNfcGVyZl9ldmVudF9vcGVuOiBwaWQgNDI0ICBj
cHUgLTEgIGdyb3VwX2ZkIC0xICBmbGFncyAweDggPSA0Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCgpIb3dldmVyLCB3ZSBtYXkgc3RpbGwgaGF2ZSB0byBwcm92aWRlIHRoZSBlbmNvZGluZ3Mg
aW4gdGhlIGRyaXZlciBmb3IKdmVuZG9ycyBkdWUgdG8gdGhlIHJlYXNvbnMgZGVzY3JpYmVkIGlu
IHRoZQp0aHJlYWQuIEhvcGVmdWxseSwgd2UgY2FuIGdldCByaWQgb2YgbGVnYWN5IFBNVSBldmVu
dHMgb25lIGRheSB3aGljaAp3aWxsIGFsbG93IHVzIHRvIHJlbW92ZSB0aG9zZSBkcml2ZXIgYmlu
ZGluZ3MgaW4gdGhlIGZ1dHVyZS4KClRlc3RlZC1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZv
c2luYy5jb20+Cgo+IC0tCj4gMi40Ny4wLjE2My5nMTIyNmY2ZDhmYS1nb29nCj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
