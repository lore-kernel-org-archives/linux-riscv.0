Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638D0CA9ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 17:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wKiDEi/NqpaJbDhV7TRvQu8ioEFL32O0dl6l88t/ok4=; b=kS1rgRLF7CTCvY
	/+y39WiuygzJ9aFbD0ufJ1tf3omYVt3ya71r6ZhiyHQOqBgFhM/s7wD2gVvlrsQvDU6QflpT9x5Ba
	2bwXJdnTFmnUxofm7MPV6meZQz7T7Amdqaq6dTGDlY37rJa/Wpw53V2B6r8Fr7MuPFHJ/K41/aHSK
	eNJNy8Ddjk5bR/PhAPZo9ow1+f+kx8BrIgz2O/SvL2/EeZ8xzN/vwQcekl+JyKlzV4iehaSqemdhk
	XH+e6hiqMIhub+Vj25Y/WB1llJuMF5eH02SNr30/cWOOSZJHCN0IsjBuwFZyllvkyIUu/hvreH4zI
	mRK1YBX4u86gnnJH2vew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJiG-0000000B4sb-3l9K;
	Mon, 12 Oct 2026 17:21:24 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJiD-0000000B4rW-307I
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 17:21:22 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-486e8faff03so903670f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 10:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791825680; x=1792430480; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XVOLHzyfqUmv7StJG1aPauWki6PAmKd3K90h79SeG0Q=;
        b=dXHgRgWKdDdFP4sSx6qshUgiMO75oD9n5D3ORzyrEan2QRZC9BufG4mNAIyzfZlojj
         LCsB9edFs9dbqRVANSNK8/+7qKWSgRXbBagguCu6SnJHQl/omhL+e9MVuLa0WQeYstnE
         UhcuuDj/WWjOoMZTIl/b52//bbIwH8mkW90vpqbtDlSO236aNXL+6nXW0xgHCNrPm+c1
         2iCQsRc7PZU4ODZkxj3LYlIcoMi1ob7kmLC+WZQEqdclTwkQkIP76oFAh6T6HeLz3KgC
         aLxOh65hlRFhzbse+tB2UA7h6JNo9gbewyJpCfr+OeJOazJbwo+2rJPW7JkfnBeLkO0Y
         Rmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791825680; x=1792430480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XVOLHzyfqUmv7StJG1aPauWki6PAmKd3K90h79SeG0Q=;
        b=D9FxBBBsI3SHuFbafaMYuCCEOUreVJ/XRBNa8kKkRC3P5VLHCe8inctjGXJACTwF4P
         P4QUgEPAM4LRbtcVtFKXgQeX5qiSLIueQgjoYVgWmJamESBFc1pXJ/yr/Stm9PbWAc/i
         Mrmd88++pZxfpe5cPzcC+mriATwW8Atq1h4E7AsMwWOaZQtRXCQAZUSn4rhtQoNI8nZL
         adhiMKXg+fxNWsiHXrXnXRLnfTUdwLSXoAHWtd07yDAHuK9s7kezuXYgxv7iB5cIda3k
         8+ZuGVuYQiUl4L1zW+2m+DAQ4bqQYf+zBA2r+QIGe7AISJsRcgqvWpGUy6PzdiK4Bq7S
         c3Aw==
X-Forwarded-Encrypted: i=1; AKwUvBx2Wb5PBT6cA8Y40b1IU21Zsi7aNdv0c/4RNTrG2DM5C3Dx4b0tbRzJAIBvNCTgA4SVd3xDSLjpD9BRIQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJiYIJG9UqZaSFvQPcdKc5xNgzvnRiRyKGMd2OteMR/99EWmgas
	M39U5Qgz61Kdwe9XinHDjxKqo5bE1XXwiR8lDGhMdhPDshLijH/MS8Sj
X-Gm-Gg: AYBFou1y3zm6lTLBxhHkWH2Whw1utgma+4CUPzfCfl0Gtd5U7IP6B5J6JY9Ok5Mqnkb
	J60vTFPBA43oL85SiF6w/MG7PitzxEwMUFTUAbhJ5o5K33NwVON+H8BWqPuF89Dm6od/TryOdDU
	90/xV3yzl0VqcljlGa7cWrcPKONa4i79+LMTj9lBtt0gTsXMy2rYAAJYOdjG6xh5OZXp4e6sMQ/
	+KKX9N+LE0PVhxsW7in5OpH6wFrlmI9EJ+GodjumQrpX1t9qcf0ylnxQw7UjN+Z0ek/o6T5S0kP
	WFn7Z+uWlLNRJKeYWIkB4PX1RapefI83NcLLwKoU+42rfPQQGhuccePoA8YdR4OAtNBx5KDDoN1
	zuzAFN7TffRsIn4EgTIBJOO7cjQX1w4q3tHQyJj9DOIzWXmnjPWDi/iptu6YBS1lu2Jxsiva0PW
	BeADU/x7sNs0XSLYj2IV5FlzDAUpwOtkwjDYUezSEl2W+n6DdMw91T6Wlsa3QuNrQDqQ==
X-Received: by 2002:a05:6000:2990:10b0:48d:de7b:9caf with SMTP id ffacd0b85a97d-48dde7b9d70mr2473124f8f.8.1791825679711;
        Mon, 12 Oct 2026 10:21:19 -0700 (PDT)
Received: from [192.168.1.18] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaa21sm583094f8f.9.2026.10.12.10.21.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 10:21:18 -0700 (PDT)
Message-ID: <3ab63358-8bbe-4457-b21c-bb81bca804cc@gmail.com>
Date: Mon, 12 Oct 2026 19:21:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] mm: fix missing page-table destructor in
 pagetable_free()
To: Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <songmuchun@bytedance.com>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Dave Hansen <dave.hansen@intel.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261010112457.49485-1-songmuchun@bytedance.com>
 <20261010112457.49485-2-songmuchun@bytedance.com>
 <asy-b7_C3SjnmSaS@gmail.com> <145CD5DC-6457-4E1E-8B9D-AE7D1EDB0AB8@linux.dev>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <145CD5DC-6457-4E1E-8B9D-AE7D1EDB0AB8@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_102121_773429_303F8E56 
X-CRM114-Status: GOOD (  15.00  )
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

T24gMTAvMTIvMjYgMjo1NSBQTSwgTXVjaHVuIFNvbmcgd3JvdGU6Cj4gCj4gCj4+IE9uIE9jdCAx
MiwgMjAyNiwgYXQgMTk6MTUsIEpvc2UgQS4gUGVyZXogZGUgQXpwaWxsYWdhIDxhenBpanJAZ21h
aWwuY29tPiB3cm90ZToKPj4KPj4gT24gU2F0LCBPY3QgMTAsIDIwMjYgYXQgMDc6MjQ6NTRQTSAr
MDgwMCwgTXVjaHVuIFNvbmcgd3JvdGU6Cj4+PiBTaW5jZSBjb21taXQgNDlmNTk5NjY2NDIwICgi
bW06IGNhbGwgY3Rvci9kdG9yIGZvciBrZXJuZWwgUFRFcyIpLAo+Pj4gcHRlX2FsbG9jX29uZV9r
ZXJuZWwoKSBydW5zIHRoZSBwYWdlLXRhYmxlIGNvbnN0cnVjdG9yIGZvciBrZXJuZWwgUFRFCj4+
PiB0YWJsZXMuCj4+Pgo+Pj4gSFZPIChIdWdlVExCIFZtZW1tYXAgT3B0aW1pemF0aW9uKSB1c2Vz
IHB0ZV9hbGxvY19vbmVfa2VybmVsKCkgd2hlbgo+Pj4gc3BsaXR0aW5nIGEgUE1ELiBSZXN0b3Jp
bmcgdGhlIHZtZW1tYXAgYmFja2luZyBwYWdlcyBkb2VzIG5vdCBjb2xsYXBzZQo+Pj4gdGhlIFBU
RSB0YWJsZSwgc28gYSBsYXRlciBtZW1vcnkgaG90LXJlbW92ZSBldmVudHVhbGx5IGZyZWVzIGl0
IHRocm91Z2gKPj4+IHBhZ2V0YWJsZV9mcmVlKCkgb24geDg2LTY0LiBUaGF0IHJlbGVhc2VzIHRo
ZSBwYWdlIHdpdGhvdXQgcnVubmluZyB0aGUKPj4+IG1hdGNoaW5nIGRlc3RydWN0b3IgYW5kIGxl
YXZlcyBOUl9QQUdFVEFCTEUgZWxldmF0ZWQuCj4+Pgo+Pj4gTWFrZSBwYWdldGFibGVfZnJlZSgp
IGRldGVjdCBjb25zdHJ1Y3Rvci1iYWNrZWQgcGFnZXMgYW5kIHJ1biB0aGUKPj4+IGRlc3RydWN0
b3IgYmVmb3JlIHJlbGVhc2luZyB0aGVpciBtZW1vcnkgdG8gZml4IHRoZSBwcm9ibGVtLgo+Pj4K
Pj4+IEZpeGVzOiA0OWY1OTk2NjY0MjAgKCJtbTogY2FsbCBjdG9yL2R0b3IgZm9yIGtlcm5lbCBQ
VEVzIikKPj4+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4+Cj4+IGlzIHRoZSB4ODYgY2Fz
ZSBjb3ZlcmVkIGZvciA2LjE2LTYuMTg/IGFzIGZhciBhcyBJIGNhbiBzZWUsIHg4Ngo+PiBmcmVl
X3BhZ2V0YWJsZSgpIG9ubHkgdXNlcyBwYWdldGFibGVfZnJlZSgpIHNpbmNlIGJmOWU0ZTMwZjM1
Mwo+PiAoIng4Ni9tbTogdXNlIHBhZ2V0YWJsZV9mcmVlKCkiKSBpbiB2Ni4xOSwgc28gdGhlIGJh
Y2twb3J0IHdvdWxkbid0Cj4+IGNoYW5nZSBhbnl0aGluZyB0aGVyZS4gb3IgYW0gSSBtaXNzaW5n
IHNvbWV0aGluZz8KPiAKPiBZZXMsIHlvdSBhcmUgYWJzb2x1dGVseSByaWdodCDigJQgdGhhbmtz
IGZvciBjYXRjaGluZyB0aGlzLgo+IAo+IEkgZG91YmxlLWNoZWNrZWQgYW5kIGluZGVlZCB4ODYn
cyBmcmVlX3BhZ2V0YWJsZSgpIG9ubHkgc3RhcnRzIHVzaW5nCj4gcGFnZXRhYmxlX2ZyZWUoKSBz
aW5jZSBiZjllNGUzMGYzNTMgKCJ4ODYvbW06IHVzZSBwYWdldGFibGVfZnJlZSgpIiksCj4gd2hp
Y2ggbGFuZGVkIGluIHY2LjE5LiBTbyBmb3IgNi4xNi02LjE4IHRoZSBwcmVyZXF1aXNpdGUgaXMg
bm90IHByZXNlbnQKPiBhbmQgdGhlIGJhY2twb3J0IHdvdWxkIGJlIGEgbm8tb3AgdGhlcmUuCj4g
Cj4gVGhlIGNvcnJlY3QgdHJhaWxlciBpczoKPiAKPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmc+ICMgNi4xNi02LjE4OiBiZjllNGUzMGYzNTM6IHg4Ni9tbTogdXNlIHBhZ2V0YWJsZV9mcmVl
KCkKCmFsc28sIGJmOWU0ZTMwZjM1MyBhbG9uZSBsZWFrcyBQTUQtc2l6ZWQgdm1lbW1hcCBwYWdl
cyBvbiB0aG9zZSB0cmVlcywKaXQgbmVlZHMgMzk0MDZjMDVmOGYxICgieDg2L21tOiBGaXggZnJl
ZWluZyBvZiBQTUQtc2l6ZWQgdm1lbW1hcCBwYWdlcyIpCmFzIHdlbGwgOikKClJldmlld2VkLWJ5
OiBKb3NlIEEuIFBlcmV6IGRlIEF6cGlsbGFnYSA8YXpwaWpyQGdtYWlsLmNvbT4KCi0tIApjaGVl
cnMsCmpvc2UgYS4gcC1hCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
