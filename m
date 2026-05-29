Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF61CD6E4A
	for <linux-riscv@archiver.kernel.org>; Fri, 29 May 2026 13:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=431Jw1msGyUrn9qeas6NKsw387WEDY2JgznGrzFRYVI=; b=jolA9aZKOOVwMQ
	cSkE6ixG47t+Qul0LbIVxfoxcZhz1RGnRIpz/zDBPOiAXASvLWkPtS+3rpdoBadXII8SYZpL5DWhS
	L4yWgQHXjkYrqb5gDGddpUiZnHHUIriIxVXBbpWaOhlMlOu1DxEAItSE7sI24FxtenvKij11jooHu
	fhbX9MZJqT47dXF6GB+BU7cq4dPybkSS1rpJxqWnZ+F98ViE+/WaeeHby+3nCNgGT4V+SsTWsQgK+
	3yEq/bKQrmNCt0Luhzm/XB5ucjuaJpY5sZZwksP4blbLGsme7PY242lAQwEByJR8SAQ83tuZ2e4qo
	N8gv65X2mOvt1aRdS67Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxAs-00000007R5Y-17Fn;
	Fri, 29 May 2026 13:22:54 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxAp-00000007R4r-2RLz
	for linux-riscv@lists.infradead.org;
	Fri, 29 May 2026 13:22:53 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-7dc78af7371so22518727b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 29 May 2026 06:22:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780060970; cv=none;
        d=google.com; s=arc-20240605;
        b=ASOX0jYcOjFwIZz5XXLDrzYNG+cg3nI5lKOCbSsnqnCpgrTN6bUlMn9wXJEyrQL1rs
         YedpWvW+u9vyaa3ojYb1c0haLyjX+pts6TStHg8mowqUQ6czeR3fYd4J1wa05s3Vo6j3
         en0b/do8M4qbT46FNvNGrvw+TXsCbnXxKC7ZyQ1ajpd+N/S/lOerB0F9fapH+z835Nsv
         BtzNQcdTVys8v9cPyZ8C8sKRMntYQ10PExZBZ6jXpR5d3PpwAcVDfk0Nq71Tp3chwoy6
         z1TAXPA1Y/H1XWKJNuZlj46MRxM1JaNnSk4/hoq9BD/03Rl+EIcaHyjKDlaagG/HoWHt
         wjcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K/bBMAZzJL24oJclVZF8zBPsn8HZUbVy1gcl63SMoMQ=;
        fh=OuVNKnkHN/HNSK5yYzJ+CvAXs/btqFzWE7Eo9ERgVUw=;
        b=f8x8Ynwj7a1oh500ZzIvEjF8Mm7uwfXpqAnF8dqL5FjVa48TXaiq//Yh47Yzx3+9NB
         1fTNSZ4nzJRhy2PSOdBGonr4MBaPLD5iJVAYnNCX5OKa1bDDJ7+C3T27NkrpSZi5tnMU
         ljKD5LpLA6uKuhy+RXDRPgs3ZgI9W7P567Rg2jZ0AIleGUB/CECH7ZiaCdDSlUifIdnc
         mvwKAOKYdAwz8Kg7ABWbwrffNbKvJI/1J0NDjk1azTLemKAC80P1m7+m9y7UYbSbnlXG
         Tf13odFmir4cj2JFaH1zP1xplqAIQpir5/Zb6LgPrfbF9JGWrXKaGGaRf6J+kqtTPmM7
         +kfQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780060970; x=1780665770; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/bBMAZzJL24oJclVZF8zBPsn8HZUbVy1gcl63SMoMQ=;
        b=qn8qZkhmExCEFnHG2jzJjjqqOhA9vUqAYXr4HRT+DU9rFJZeFRrZkAEwjAa8lqGgRL
         /5a6Ns/DyKax+Kub3TJnTquUEuNBz1kvLGaOKi4JXInUGjBSZhhpokBLKB7IMM1d8/9u
         UGivIF3TwCH6PzWXWa8gHe00sx/q8sGKFJYnlWgBu8L91b4BAi37Bui15tKWinlN1kFl
         Bfat1KHGUT8sFCR7oWuZdMTi7ypHg+vICSVJFRJ9UAnBusQD6O9BAvwzbYJH82XAQ0D7
         v0bZ79/5TWdNUDb/HQ8ItQAL1OPL0uWFCzZkt0FhEzauBZcD2XOrP+szkllIZnG2fIuW
         hMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780060970; x=1780665770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K/bBMAZzJL24oJclVZF8zBPsn8HZUbVy1gcl63SMoMQ=;
        b=MYT6ji7kN2MbV5kWQgwyI90Dm8W8ExpEYPZRwlbowfXkjsr1tDzmw/FVGDUCvLARA8
         Jw1rOfu4dPhU2uqTXhi4EGWvbhg0MQumj12b9GFkX2npKKYDCy/vodO6KDgXY6KYAxLi
         xYYtl7XsYxs1dxDb/oJAY/br43QuD/PHaom1szMixqml5o0/FgsvFhBU2Oo+OXxW5eBD
         uj1dl3QXIz9XmBYb2VI9aqAs/R/8AJu1bulqvtXaeuCf1sxmg5b+zJarA5An+rdZkSW7
         lReD+3QhWaOxZPzFdd3tIq9N7WueSTAxRkqepyOaYx3rhThqFfyalHL9m8cpfs6sr6aB
         JfuQ==
X-Forwarded-Encrypted: i=1; AFNElJ9joIKdR/BC2UHPdPSE1kj59ZHWiXHxALaUnZHAc4918vRyJ7uUlcdJaFwZCv7pY2iOdUTAyLBXEj4pJg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwy6ZZfJieOhqSQAFOZRRwRmFO5feoXAJoxnjZtfqVZUP6lSai
	/N3jWUIZnLKK2vkXzQd3D91fc9dcZ9GN/3Ud5wBoXTHSekXbzIaLAG8pK8MtwkNwwHstLkcmckd
	SLS6S8u8UthAsNhDsFan997xe+EtfubdVnG+8kyEZLg==
X-Gm-Gg: Acq92OHlAW0xk+cKOCjIJBeKLVEWNt0Urrw10mwuukU251aez8tgCr3YFt3uId+r5rv
	7SLIOGyzn3agOP/fc+9EpR5qJpT2KO2oaJIrerO9Ok7vL/GNObicvOyTSBWPnhvjPSe+huWPu9+
	DXP9D/+2QDE2l0E4+PeepTcuT0CZ1Pz2ZCWGXbkjUSI6Mipsiewpm+T/2gW53z9yWP/UAFXP9gw
	KZCzw0V0LfKSW5MfWuNyZERJyVolBIhZZEq4ykJGKaUsWOnzU5xz7SdTePd1dsXh/yxGjF1DKP8
	cgW4JEDJhI5DZqxQSJExaenHgVtoVZMOk6MOhIb/K4Lj8R8OaLJCUoYMJZoqaNS+Gju1WgU/pdo
	kXA==
X-Received: by 2002:a05:690c:670a:b0:7bd:69b8:f2e5 with SMTP id
 00721157ae682-7de44db875amr23947297b3.3.1780060968349; Fri, 29 May 2026
 06:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260526-k3-ziccrse-v1-1-c759792ca3a3@riscstar.com>
 <CAH1PCMa_RJ0NVNyxkqsXPfrF4tz_69ZbWeqkh8xRCu7bLDkr-A@mail.gmail.com> <20260529062159-GKE3748271@kernel.org>
In-Reply-To: <20260529062159-GKE3748271@kernel.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 29 May 2026 21:22:37 +0800
X-Gm-Features: AVHnY4Iab8wgmxmC75EDPrBfu1KDkBxpc0a7EJvkUE8WSVNftvwon2aew66vIo8
Message-ID: <CAH1PCMbNv3pGNvjhr02fiibRS3mt929+C3jwreWePN-3O5eLOw@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: Add Ziccrse extension for X100 cores
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Guodong Xu <docularxu@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_062251_876622_20DCE9B3 
X-CRM114-Status: GOOD (  16.81  )
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

SGksIFlpeHVuCgpPbiBGcmksIE1heSAyOSwgMjAyNiBhdCAyOjIy4oCvUE0gWWl4dW4gTGFuIDxk
bGFuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGkgR3VvZG9uZywKPgo+IE9uIDEzOjE4IFRodSAy
OCBNYXkgICAgICwgR3VvZG9uZyBYdSB3cm90ZToKPiA+IE9uIFR1ZSwgTWF5IDI2LCAyMDI2IGF0
IDM6MjPigK9QTSBHdW9kb25nIFh1IDxndW9kb25nQHJpc2NzdGFyLmNvbT4gd3JvdGU6Cj4gPiA+
Cj4gPiA+IEFkZCB0aGUgWmljY3JzZSBJU0EgZXh0ZW5zaW9uIHRvIGFsbCBlaWdodCBYMTAwIGNv
cmVzLiBaaWNjcnNlCj4gPiA+IHByb3ZpZGVzIGEgZm9yd2FyZCBwcm9ncmVzcyBndWFyYW50ZWUg
b24gTFIvU0Mgc2VxdWVuY2VzIGluIG1haW4KPiA+ID4gbWVtb3J5IHJlZ2lvbnMgd2l0aCBjYWNo
ZWFiaWxpdHkgYW5kIGNvaGVyZW5jZSBQTUFzLgo+ID4gPgo+ID4gPiBUaGUgU3BhY2VtaVQgWDEw
MCBjb3JlIHN1cHBvcnRzIGl0IHBlciB0aGUgU3BhY2VtaVQgSzMgaGFyZHdhcmUKPiA+ID4gc3Bl
Y2lmaWNhdGlvbi4KPiA+Cj4gPiBGb3IgdGhlIHJlY29yZCwgSSBoYXZlIHRlc3RlZCB0aGlzIGNo
YW5nZSBvbiBTcGFjZW1pVCBLMyBQaWNvLUlUWC4KPiA+Cj4gPiBUaGUgc3RyZXNzIHRlc3QgaXMg
cnVuIGJ5IGVuYWJsaW5nIENPTkZJR19MT0NLX1RPUlRVUkVfVEVTVD15IHRoZW4KPiA+IGJvb3Rz
IHRoZSBrZXJuZWwgd2l0aDoKPiA+Cj4gPiAgIGxvY2t0b3J0dXJlLnRvcnR1cmVfdHlwZT1zcGlu
X2xvY2sgbG9ja3RvcnR1cmUubndyaXRlcnNfc3RyZXNzPTE2Cj4gPgo+ID4gZHJpdmluZyBhbGwg
OCBoYXJ0cy4gSXQgc3Vydml2ZWQgc3VzdGFpbmVkIHRvcnR1cmUgW3JhbiBmb3IgfjEwIG1pbnV0
ZXNdCj4gPiB3aXRoIDAgRmFpbC4KPiA+Cj4gPiAuLi4gLi4uCj4gPiBbICA3MzUuNTg4OTQ3XSB0
b3J0dXJlX3NwaW5fbG9ja193cml0ZV9kZWxheTogZGVsYXkgPSAyNSBqaWZmaWVzLgo+ID4gWyAg
NzM4LjAxNTA5Nl0gdG9ydHVyZV9zcGluX2xvY2tfd3JpdGVfZGVsYXk6IGRlbGF5ID0gMjUgamlm
Zmllcy4KPiA+IFsgIDczOS4yMDQ3MTNdIHRvcnR1cmVfc3Bpbl9sb2NrX3dyaXRlX2RlbGF5OiBk
ZWxheSA9IDI1IGppZmZpZXMuCj4gPiBbICA3NDEuMTk1MjExXSBXcml0ZXM6ICBUb3RhbDogNzE0
MzE5NDIwICBNYXgvTWluOiA0NTk0NjU5OS80MzY3OTg3NiAgIEZhaWw6IDAKPiA+Cj4gSSBhcHBy
ZWNpYXRlIHlvdSBnaXZlIG1vcmUgaW5mbyBhYm91dCB0aGUgdGVzdCwganVzdCB3YW50IHRvIG1h
a2Ugc3VyZSwKPiBmb3IgdGhlIGtlcm5lbCBjb25maWcsIHRoZSBDT05GSUdfUklTQ1ZfVElDS0VU
X1NQSU5MT0NLUyBpcyBub3QgZW5hYmxlZD8KPiBzbyBpdCB3aWxsIGZhbGwgYmFjayB0byB1c2Ug
emljY3JzZSBpbXBsZW1lbnRhdGlvbi4uCgpDb3JyZWN0LiBUaGFua3MgZm9yIGRvdWJsZS1jaGVj
a2luZy4KCkluIHRoZSBhYm92ZSB0ZXN0LCBDT05GSUdfUklTQ1ZfVElDS0VUX1NQSU5MT0NLUyB3
YXMgbm90IGVuYWJsZWQuCkFuZCBzaW5jZSBYMTAwIGhhcyBuZWl0aGVyIFphYmhhIG5vciBaYWNh
cywgdGhlIHJ1bnRpbWUgc2VsZWN0aW9uIGluCnJpc2N2X3NwaW5sb2NrX2luaXQoKSBmYWxscyB0
aHJvdWdoIHRvIHRoZSBaaWNjcnNlIGJyYW5jaC4KCkJSLApHdW9kb25nIFh1CmRvY3VsYXJ4dUBv
dXRsb29rLmNvbQoKPiAtLQo+IFlpeHVuIExhbiAoZGxhbikKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
