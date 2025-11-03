Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45578CCF9F8
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Nov 2025 17:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4LuS8iSUcaRQsyYymTbNNB8yZU8ke+88HUS+r2DFK7k=; b=1S8xPy8KQRoLnJ
	DEn7RaweJopCKI0QArk8zhLo3QK2szXi+21hpDu3Q3UbZkZBHUCMidmoZuMC259c5xUQAQzGbuCu8
	YM7UDnF3BygQsG920xeTCCRnC5CnV7L3I/o9jO/MycYg1tKJ08m0iIING9JcCgk36VT6MCVZ/rN98
	OzU/a7N2cUk8P4v8X436eMP9b6PQQTkdsEB3AfJer7AuJgh887pSn9T1HDsAF8m4Dn3zXVQ8XRNRr
	Jcm8YFQHvgdVcQTysL2C1hDH9xa7YD5K+1EVK4HE4nBrhH8wZPKcyDFuichhfdvDWFCbNBTZK6VXz
	d/EvlwYqPxAiXxXpg4nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyHo-0000000APce-1hNi;
	Mon, 03 Nov 2025 17:24:08 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyHm-0000000APbj-2egA
	for linux-riscv@lists.infradead.org;
	Mon, 03 Nov 2025 17:24:07 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-47103531eeeso3254105e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Nov 2025 09:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1762190644; x=1762795444; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqqBVuJmR63IDNhhp80d35gpuVaRjLT+Q9SYsgYK1NQ=;
        b=m35bNM9Lz1ANUgFjNvZ+RsLORqiLXEqqvMGICQ+wkwophdCmZkO9GxrBsgkD6NJgPL
         2BT4Yno9oUZMkwHvd/tS+6XMRnFWYmYGTNJYhS/sEZC38QEtEeNoKbxBJTKCOAH6ee0f
         ujLXTlkCXO01telC4/YIGiEqTQZ8k9xJdZ4iS5WGj0jAfNZcoP51vHcJU7p44urg0oBY
         n/I0cY4M9ctwXvs6p7zl9WoLQcCgv83GQw4EF2/Li3LWQp7T8OZrGyqN2JCEAzGaO2L1
         4sxgh5mwgdKg/F8Xa6dn/7ox/Kxu482fFEdM1YYTVpMnZb3DrqqOg9pqvOql9gZpq9R9
         BoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762190644; x=1762795444;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mqqBVuJmR63IDNhhp80d35gpuVaRjLT+Q9SYsgYK1NQ=;
        b=JbqIAW34N184Pv8RPbgFbTwQB5pypPO1J+6IJMTh+XZNFH2iIms2MXT+GEevvSwpig
         sZErU3YiwwByJMfrsUsdcVbqYuRSGklKZ8iPckzKq7dAN/p0GEjKniVnZF1c11XA4nXs
         cnLcg205BHTiYzuEoQShFXB3VuQSS6d1LogVizVvmIuxVwPAeKI0CM7+2edrWYgWCKUk
         6dzgJMARVZCxgS13LlVoooJvDcJuzR+7nB2287mhOmmGO6z6Z8HFy5tVI3movJvvkOb4
         AG5K4bEAUp9i7o1gWLRKIulElSfiGH8iwB+jpd8D7uw64icaWCPZkltxL99R81HdNL31
         YrWw==
X-Forwarded-Encrypted: i=1; AJvYcCUt2aSJRegVRbDdQ9zQIlE8ncgwqNdrHrGwXC6zI3RFdr7WP33/pcSzRKRE8LvgYscEmN49Hyx1waSCyA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2fkGi1+67VwUlmyu+a6kiduF382ieFQ0uqxcu7oSzsKrYHavo
	ck5U3ypaXgUN3vZAoMV9S4/aRcjNDaAllm/HkKn2RxQXTewEv7r7L1ZSHZcPj4GD6d4=
X-Gm-Gg: ASbGncsv7yAW8kEYl5kGWHwG5hmrbgfE4btm1YWrM5g9hwbF2VaUmnNz51f8iAGYcmM
	UWZxt51bIUX5NU2UOr6kS1S4I4XY5VaCN/dkoOPfApX/kZwOh8uhWKUGeRCip70TLmnfypvBgAu
	ABfb83rQLX0qJQvjqIICAENE04CtY3qvbwGiiCPNdCnLdhqQApaaDsxVAXm4uiEvkg/9INEAvcy
	rwsMjUM/fAs1XJBb5iQW7HuHbo2wxOkRUvwt87NQVZHy/ewP4e51yS8unLnx+9ei4NBnVAn1JYg
	JbVcwfcfroFavLpOi0tna5/hPYS/mKMa1dxSJxEqQghc5rt1QLik/T2NNV2jDcUJXYGIms6x1R1
	Smlkh7oY0HQRdpdr4pdUj/PEt/s3aBGGc5ssVr0idtOrE5URE9M4ANVYrhE9y6yG7TJLQ7csYle
	I=
X-Google-Smtp-Source: AGHT+IH8SUlODHNS7u6OTUXw57n29tXocbjwTvu8e3spDVsip8NoE9wR82cZ2MJR9n3VuQdaP6nEKw==
X-Received: by 2002:a05:600c:4eca:b0:471:1387:377e with SMTP id 5b1f17b1804b1-477308ef9f2mr74631625e9.6.1762190644383;
        Mon, 03 Nov 2025 09:24:04 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::3052])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4773c383b75sm206919615e9.11.2025.11.03.09.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 09:24:03 -0800 (PST)
Mime-Version: 1.0
Date: Mon, 03 Nov 2025 18:23:52 +0100
Message-Id: <DDZ8G0K2921V.8B66OPQY2GXG@ventanamicro.com>
Cc: "Conor Dooley" <conor@kernel.org>, <paul.walmsley@sifive.com>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
 <luxu.kernel@bytedance.com>, <atishp@rivosinc.com>, <cleger@rivosinc.com>,
 <ajones@ventanamicro.com>, <apatel@ventanamicro.com>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <songshuaishuai@tinylab.org>, <bjorn@rivosinc.com>, <charlie@rivosinc.com>,
 <masahiroy@kernel.org>, <valentina.fernandezalanis@microchip.com>,
 <jassisinghbrar@gmail.com>, <conor.dooley@microchip.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "yunhui cui" <cuiyunhui@bytedance.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [External] Re: [PATCH 3/3] riscv: crash: use NMI to stop the
 CPU
References: <20251027133431.15321-1-cuiyunhui@bytedance.com>
 <20251027133431.15321-4-cuiyunhui@bytedance.com>
 <20251028-scallion-list-c8aa5f350286@spud>
 <DDTYKLFUE3M0.17GD0S4OSQG16@ventanamicro.com>
 <CAEEQ3wk8w1q8Ujpq+6fyRPP+zqTy6_q22K-g681VZyVXstPaDg@mail.gmail.com>
In-Reply-To: <CAEEQ3wk8w1q8Ujpq+6fyRPP+zqTy6_q22K-g681VZyVXstPaDg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_092406_699559_EA699134 
X-CRM114-Status: GOOD (  18.10  )
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

MjAyNS0xMS0wM1QyMjoxMDoyNSswODowMCwgeXVuaHVpIGN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5j
ZS5jb20+Ogo+IEhpIFJhZGltLAo+Cj4gT24gVHVlLCBPY3QgMjgsIDIwMjUgYXQgODozNuKAr1BN
IFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPj4KPj4g
MjAyNS0xMC0yOFQxMDo0MjoxMiswMDowMCwgQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3Jn
PjoKPj4gPiBPbiBNb24sIE9jdCAyNywgMjAyNSBhdCAwOTozNDozMVBNICswODAwLCBZdW5odWkg
Q3VpIHdyb3RlOgo+PiA+PiBOTUkgaXMgbW9yZSByb2J1c3QgdGhhbiBJUEkgZm9yIHN0b3BwaW5n
IENQVXMgZHVyaW5nIGNyYXNoZXMsCj4+ID4+IGVzcGVjaWFsbHkgd2l0aCBpbnRlcnJ1cHRzIGRp
c2FibGVkLiBBZGQgU0JJX1NTRV9FVkVOVF9MT0NBTF9DUkFTSF9OTUkKPj4gPj4gZXZlbnRpZCB0
byBpbXBsZW1lbnQgTk1JIGZvciBzdG9wcGluZyBDUFVzLgo+PiA+Pgo+PiA+PiBTaWduZWQtb2Zm
LWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KPj4gPj4gLS0tCj4+ID4+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9zYmkuaAo+PiA+PiBAQCAtNDg3LDYgKzQ4Nyw3IEBAIGVudW0gc2JpX3NzZV9h
dHRyX2lkIHsKPj4gPj4gICNkZWZpbmUgU0JJX1NTRV9FVkVOVF9HTE9CQUxfTE9XX1BSSU9fUkFT
ICAgMHgwMDEwODAwMAo+PiA+PiAgI2RlZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX1NPRlRXQVJF
X0lOSkVDVEVEICAgICAgIDB4ZmZmZjAwMDAKPj4gPj4gICNkZWZpbmUgU0JJX1NTRV9FVkVOVF9M
T0NBTF9VTktOT1dOX05NSSAgICAgICAgICAgICAweGZmZmYwMDAxCj4+ID4+ICsjZGVmaW5lIFNC
SV9TU0VfRVZFTlRfTE9DQUxfQ1JBU0hfTk1JICAgICAgICAgICAgICAgMHhmZmZmMDAwMgo+Pgo+
PiBUaGlzIGV2ZW50IGlzbid0IGRlZmluZWQgaW4gdGhlIFNCSSBwdWxsIHJlcXVlc3QuCj4+Cj4+
IEkgYXNzdW1lIGl0J3MgYSBwdXJlIHNvZnR3YXJlIGV2ZW50IHRoYXQgdGhlIHBsYXRmb3JtIHNo
b3VsZG4ndCBpbmplY3QuCj4+IElmIHdlIHdhbnQgdG8gcmVzZXJ2ZSBtb3JlIGV2ZW50cyBmb3Ig
c29mdHdhcmUgdXNlLCB3aHkgbm90IG1ha2UgdGhlbQo+PiBnZW5lcmljLCBsaWtlIFNCSV9TU0Vf
RVZFTlRfTE9DQUxfU09GVFdBUkVfSU5KRUNURUQ/Cj4KPiBJbiBmYWN0LCBpdCdzIG5vdCBqdXN0
IGNyYXNoIE5NSSwgYnV0IGFsc28gc3RvcCBOTUksIGtnZGIgTk1JLCBldGMuIEFuCj4gZXZlbnQg
Y2FuIG9ubHkgcmVnaXN0ZXIgb25lIFNTRSBoYW5kbGVyLiBJZiBhbGwgdXNlCj4gU0JJX1NTRV9F
VkVOVF9MT0NBTF9TT0ZUV0FSRV9JTkpFQ1RFRCwgd2UnbGwgaGF2ZSB0byBleGVjdXRlIGVhY2gK
PiBkaWZmZXJlbnQgTk1JIGhhbmRsZXIgaW4gc2VxdWVuY2Ugd2l0aGluIHRoZSBTU0UgaGFuZGxl
ciwgd2l0aCBlYWNoCj4gTk1JIGhhbmRsZXIgY2hlY2tpbmcgZm9yIGl0c2VsZiBpZiB0aGVyZSBh
cmUgTk1JcyBvZiBpdHMgdHlwZSB0bwo+IHByb2Nlc3MuCj4gSXMgdGhhdCB3aGF0IHlvdSBtZWFu
IHRvbz8KCk15IG1haW4gcG9pbnQgaXMgdGhhdCBhIHBsYXRmb3JtIGRvZXNuJ3Qgc2VlbSB0byBj
YXJlIHdoYXQgMHhmZmZmMDAwMiBpcwp1c2VkIGZvciwgc28gU0JJIGNvdWxkIGp1c3QgYXNzaWdu
IGEgcmFuZ2Ugb2YgU1NFIGV2ZW50IHZlY3RvcnMgZm9yCnNvZnR3YXJlIHVzZSwgd2l0aG91dCB0
cnlpbmcgdG8gYmUgb3Zlcmx5IHNwZWNpZmljIGFib3V0IHRoZSBwdXJwb3NlLgooSSBkb24ndCBz
ZWUgYSBtZWFuaW5nZnVsIGRpZmZlcmVuY2UgYmV0d2VlbiAweGZmZmYwMDAwIGFuZCAweGZmZmYw
MDAyLikKCkRlbXVsdGlwbGV4aW5nIGEgc2luZ2xlIFNTRSBldmVudCB2ZWN0b3IgaXMgcG9zc2li
bGUgaWYgZXZlbnQgaGFuZGxlcnMKZG9uJ3QgaGF2ZSB0byAob3Igc2hvdWxkbid0KSBwcmVlbXB0
IGVhY2ggb3RoZXIuCkkgYXNzdW1lIHRoYXQgd2UgZG8gbmVlZCBhdCBsZWFzdCB0d28gc29mdHdh
cmUgU1NFIGV2ZW50IHZlY3RvcnMsIHNpbmNlCndlIHNob3VsZCBiZSBhYmxlIHRvIGludGVycnVw
dCBvdGhlciBTU0UgaGFuZGxlcnMgdG8gZXhlY3V0ZSB0aGUgU1NFCmNyYXNoIGhhbmRsZXIuCkRv
IHlvdSB0aGluayB0aGF0IHR3byBzb2Z0d2FyZSBTU0UgZXZlbnRzIGFyZSBzdWZmaWNpZW50LCBv
ciBzaG91bGQgd2UKYWltIHRvIHJlc2VydmUgbW9yZSBpbiBTQkk/CgpUaGFua3MuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
