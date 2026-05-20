Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C3ECD4F54
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 07:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2e4dbz5WhfoAtKwWM2QIq76Khscb0Pk8GONEYG7vClI=; b=Ynx/sjDcZf+iiz0U5BmWrUr5Z0
	imEVqmh2xyNBWP48ODH/V49H2MwObaWB/Nc+/0+etYgsev1YWlDqVdi2Xt4q+r4uM8CZ0nSxWCmuu
	QdSKpS8vb/wCaKSRfAuRU8644oMEvj/87kSrR/EaA6Pvm7FGjE95LbyniFxWIKiTb3lNvHNK+rFQk
	rge/2D5q+GRp5wxIZCzGAy+4BWNmQeBDMCMPHdCai+xdrfsJv+SpLQrXX3wtb9bDdsDYDvkFyhFQa
	+Iu3HjQaGvMKlsI79GTdh0Ero0CSZ8nmBMjaSzUXbPAKJh04UrFSdTYlMGtXxBRGGobzL+5FueyzS
	n4QqMftw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbkZ-00000003reS-3IXS;
	Wed, 20 May 2026 07:53:55 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbkX-00000003rdq-0riX
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 07:53:54 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso59892485e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 00:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779263631; x=1779868431; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sLZA4hvW9xs9FgysnR1c1k6UhOsTdTrM6VQ3/eZLexk=;
        b=mXOIySd4GqGwNkWsh99JHvEBlaaifdyIJJxmoD1r54uy8JAVHMiWlL+9HbIjfiEFii
         ZikviaE/FSbQ2FPj2CWv+S9B6fLuHD9B3QIe8e9tZPApoTZzV7zsl4qKzT57JUbTOAtP
         A2RPLDDYKIKsa1h2QRyOkk6l0MXXkzrJsRLzomBbE3gFDdCv1gXsJvZsi60n/LdHFi+0
         9Pp/F4Cph/QZNw1L59VvpFFoK0s6trs7HwAOsKh76ntGJngf7XCoU3oxVrHJWdRh4LUt
         RryC6Rx9Lz/RF/oyK4joxOgAcS01Ncahlfto4kZdckuBS/8f6CQ59qcIsdyTi1iBV0V8
         SmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779263631; x=1779868431;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLZA4hvW9xs9FgysnR1c1k6UhOsTdTrM6VQ3/eZLexk=;
        b=qZMmZMWPX044wmtBF3Z3iYgBNe4NKAP+NUHX9Yy4hv3sBHD/WT4Gtxw0BvxCDWhDOk
         GZbF9cdM5CTh7gwQ0Z7Gd/hzTux3rw9cc1fvJvFZZ6VVh0h66j9TWskLVWIcD0hIreCx
         8yBgmVqLAOJvwLhYPBMrCQg4Pg/LHkNsZ1bGQ4yVQ4XVivxl2r5l1dJUHm2SyqdvVuP4
         BxCX7AxX7QwcYU9ih1P5NaVfiF29wlo509IfPWt19+R9CXkwZrGSYQb3kkyoMEW8cH+z
         puRX6ZNGOOuAvAJvvhwlSOFPkZh93JUxg1HPwlpJyoc6wRAKHyAg9Ch8JnonpaNo7CCr
         hYOw==
X-Forwarded-Encrypted: i=1; AFNElJ9MX67bXuAl1lugZ7rXcdNOU3L8JLG2wUz6XhBBjGl2y57VTXFecY23Tl8NSuFykOVVKdsA9nqHM44Zrw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyX29epjqSHakfsS50EeItUd5gDicMSIn4SDCrrWSjdhuoq9Mm5
	BBcoNKpapRVl8wmwaPiJDrDSxYuZyDFlu3W3heytiSohioSghZ8Wj7pz
X-Gm-Gg: Acq92OENIOH8fUCJPrOubRnoQxybgcdRUuqqB6kUBmVcVufb9mLZgyWQwL+bLfD6YVv
	l4dvGWYaqfoAT73pYOw8hK35HwycPI7A9AY0+vSAE0CzukV929PQ6Cnqaz58PJLQTWrUctMtKf4
	SZ1Cgp3y8wL7qXOt3bOvR0biMb4cNR/6XkZzfbRov7KxGIdLbiZckvohiqMAfjBCPYdFtxIAYzI
	YyAaKsQTgfBmVF2e5xxET14b/PuiuuAq8oYBSbnwx/vJpLfDFDEmYBT3mLn3H7oLun/CO5jrAZX
	0K8kE5IiivSIl8zyPHtU05IZ5UWg9ebxFd25CDcziYimWfCQ0XPZT8isfhtEOmDWi1EZE5YOn2g
	Xb1UCxYiI5QccTmOsUf7rjt/cUW6t8/uRt7w0PcCvoTQQvxaJIMeG5dp2BzAaRtZa6BIHPKW012
	sjFF/hdQNPLdB5+RcMHcmkY1p2BLk7F4dA19r18sYMhkdICxJRilzH5H2IY4Bv7g/o3VQZcs8Dt
	nlc
X-Received: by 2002:a05:600c:a309:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-48fe61f20a7mr291977335e9.15.1779263630727;
        Wed, 20 May 2026 00:53:50 -0700 (PDT)
Received: from [192.168.0.40] (a89-182-137-241.net-htp.de. [89.182.137.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48ffed60c8esm91723435e9.10.2026.05.20.00.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 00:53:50 -0700 (PDT)
Message-ID: <6b945153-5a7b-415e-904a-1c350b7d52ee@gmail.com>
Date: Wed, 20 May 2026 09:53:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v10 0/4] riscv: spacemit: enable SD card support
 with UHS modes for OrangePi RV2
To: Trevor Gamblin <tgamblin@baylibre.com>, Yixun Lan <dlan@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Ulf Hansson <ulfh@kernel.org>, Iker Pedrosa <ikerpedrosam@gmail.com>
References: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
 <177889984452.2298656.1074391459031404894.b4-ty@b4>
 <7e68e745-0d70-46db-9475-38d3dd5b9cf4@baylibre.com>
From: Andre Heider <a.heider@gmail.com>
Content-Language: de-DE
In-Reply-To: <7e68e745-0d70-46db-9475-38d3dd5b9cf4@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_005353_260838_8E3ABED2 
X-CRM114-Status: GOOD (  13.59  )
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
Cc: devicetree@vger.kernel.org, Margherita Milani <margherita.milani@amarulasolutions.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, Troy Mitchell <troy.mitchell@linux.dev>, linux-mmc@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org, Vincent Legoll <legoll@online.fr>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Aurelien Jarno <aurelien@aurel32.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgVHJldm9yLAoKT24gMTYuMDUuMjYgMjozNSBQTSwgVHJldm9yIEdhbWJsaW4gd3JvdGU6Cj4g
Cj4gT24gMjAyNi0wNS0xNSAyMjo1NywgWWl4dW4gTGFuIHdyb3RlOgo+PiBPbiBGcmksIDE1IE1h
eSAyMDI2IDEyOjQ4OjU4ICswMjAwLCBJa2VyIFBlZHJvc2Egd3JvdGU6Cj4+PiBUaGlzIHNlcmll
cyBlbmFibGVzIGNvbXBsZXRlIFNEIGNhcmQgc3VwcG9ydCBmb3IgdGhlIFNwYWNlbWl0IEsxLWJh
c2VkCj4+PiBPcmFuZ2VQaSBSVjIgYm9hcmQsIGluY2x1ZGluZyBVSFMgKFVsdHJhIEhpZ2ggU3Bl
ZWQpIG1vZGVzIGZvcgo+Pj4gaGlnaC1wZXJmb3JtYW5jZSBTRCBjYXJkIG9wZXJhdGlvbi4KPj4+
Cj4+PiBCYWNrZ3JvdW5kCj4+Pgo+Pj4gVGhlIFNwYWNlbWl0IEsxIFNvQyBpbmNsdWRlcyBhbiBT
REhDSSBjb250cm9sbGVyIGNhcGFibGUgb2Ygc3VwcG9ydGluZwo+Pj4gU0QgY2FyZHMgdXAgdG8g
VUhTLUkgc3BlZWRzIChTRFIxMDQgYXQgMjA4TUh6KS4gSG93ZXZlciwgbWFpbmxpbmUKPj4+IGN1
cnJlbnRseSBsYWNrcyBiYXNpYyBTRCBjb250cm9sbGVyIGNvbmZpZ3VyYXRpb24sIFNESENJIGRy
aXZlcgo+Pj4gZW5oYW5jZW1lbnRzIGZvciB2b2x0YWdlIHN3aXRjaGluZyBhbmQgdHVuaW5nLCBh
bmQgcG93ZXIgbWFuYWdlbWVudAo+Pj4gaW5mcmFzdHJ1Y3R1cmUuCj4+Pgo+Pj4gWy4uLl0KPj4g
SGkgSWtlciwKPj4gSSd2ZSBwaWNrZWQgcGF0Y2ggMS0zLCBmb3IgWzQvNF0gSSB0aGluayBpdCBz
aG91bGQgYmUgbWVyZ2VkIGFmdGVyCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2
MDUxMzA3MTk1OC4yOTU3NC0xLWEuaGVpZGVyQGdtYWlsLmNvbS8KPiAKPiBIaSBZaXh1biwKPiAK
PiBUaGF0IG1ha2VzIHNlbnNlLiBJbiByZXNwb25zZSB0byB5b3VyIGVhcmxpZXIgZmVlZGJhY2sg
SSBoYWQgZHJhZnRlZCBhIG1vcmUKPiBjb21wbGV0ZSBkdHMgYWZ0ZXIgYW5vdGhlciBzY2hlbWF0
aWMgY29tcGFyaXNvbiwgYnV0IElrZXIgYW5kIEkgZGlzY3Vzc2VkIGl0Cj4gYW5kIG9wdGVkIHRv
IGF2b2lkIGNoYW5naW5nIHNjb3BlIHRvbyBtdWNoLiBBbmRyZSdzIHNlcmllcyBpbmNsdWRlcyB0
aGUgYml0cyBJCj4gd2FudGVkIHRvIGFkZCBhbmQgbW9yZSwgc28gdGhhdCB3b3JrcyBvdXQuCgpJ
IGhhdmUgNC80IHJlYmFzZWQgb24gbXkgc2VyaWVzIGFueXdheSwgZG8geW91IHdhbnQgbWUgdG8g
c2VuZCBpdD8KClRoYW5rcywKQW5kcmUKCj4gCj4gVGhhbmtzIQo+IAo+IFRyZXZvcgo+IAo+Pgo+
PiBBcHBsaWVkLCB0aGFua3MhCj4+Cj4+IFsxLzRdIHJpc2N2OiBkdHM6IHNwYWNlbWl0OiBrMTog
YWRkIFNEIGNhcmQgY29udHJvbGxlciBhbmQgcGluY3RybCBzdXBwb3J0Cj4+IMKgwqDCoMKgwqDC
oCBodHRwczovL2dpdGh1Yi5jb20vc3BhY2VtaXQtY29tL2xpbnV4L2NvbW1pdC8yZDc3ZTU3NzEw
OTk2N2VmNjVmMjY5YzFmYzFkNmE2NTlkNDI2MGZiCj4+IFsyLzRdIHJpc2N2OiBkdHM6IHNwYWNl
bWl0OiBrMS1vcmFuZ2VwaS1ydjI6IGFkZCBTRCBjYXJkIHN1cHBvcnQgd2l0aCBVSFMgbW9kZXMK
Pj4gwqDCoMKgwqDCoMKgIGh0dHBzOi8vZ2l0aHViLmNvbS9zcGFjZW1pdC1jb20vbGludXgvY29t
bWl0LzI1ODVjNjBjZTJmOTc3YjEzZjE0YTY3ZDFlM2VkOWM3M2ZkN2YzODEKPj4gWzMvNF0gcmlz
Y3Y6IGR0czogc3BhY2VtaXQ6IGsxLWJhbmFuYXBpLWYzOiBhZGQgU0QgY2FyZCBzdXBwb3J0IHdp
dGggVUhTIG1vZGVzCj4+IMKgwqDCoMKgwqDCoCBodHRwczovL2dpdGh1Yi5jb20vc3BhY2VtaXQt
Y29tL2xpbnV4L2NvbW1pdC9jNzZlMmYwNThjYmNhYjg0ZTRhNzAzZjI2ODU3YTU4YmRmNmEwMDQy
Cj4+Cj4+IEJlc3QgcmVnYXJkcywKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
