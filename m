Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D1DEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 10:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uqmvtx10yjSLVIsBfeBuS+NK8skjVZxk3Meo8CLRsJo=; b=FL781Jpr1ySR3z
	vPZVdJnBQJ9VHw1xrAG0WvMsCY8fR+oRr9aAZGc3mFqejwwRYKM/m6n/A3aRo0vGEsLile2gzViXl
	G9jVyZNEXNZAPc26dhsqwEDAvp0sSi5Xb0Oj5Y25k9OETfJWwuXYMMFfY9Dtq1uf8J3OoJBjYWiJJ
	oQAgE9hUbzBqweoF1IkhvSRUyTp01iJIzlt1acS42HvPsKIlBBrJZUfLeiP0vEuBmr6XkzepWgtam
	o16EdLNkDUrcE7nd5eOCfSzjFVhnJea5wOGqd2ASxokticejAlmcBuBgOilhxbYNhx06uCtVpGXXJ
	LS5h6eI32A8OaT/VLgFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGzcD-00FUQf-2Y;
	Wed, 05 Jul 2023 10:20:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGzcC-00FUPu-1u
	for linux-riscv@bombadil.infradead.org;
	Wed, 05 Jul 2023 10:20:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3u7+5Xqy66HQP6SQUF7U4sC21GcgKDOqOTXMNFMXNXA=; b=Dwo3EhJU8sfMCjDnbGZkQBA3Is
	xA2u28wAUvKQPxhQ4k9CInWDdtFBxPUZMqRzHn8btitWKK3IkvyhCjHUuQGg9JrhLroTmRhDXWcEM
	hByi2SKk9gilQDqExdQtK7tGZzsGUzftqlCVWKawkN0FHVIyVzB9R6ICv+PBVN01uljPINzbJA3+S
	d9I1oq80GUZBw2IAufTZc5mR5juu0zA6snpwv4HynXtTQfSWtVH67iQZWB1pbZNecDp5iB+U8sHZ0
	jgulHwJ4EeFQlF1TDezvmDqi3QMtoeG+7BwY6Vqm+9iMgq55xqjAmh06JFb/w0v4NbCQRR6FK/OHj
	dF/1UTXw==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGzc7-00C5gp-2G
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 10:20:02 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1b7f68f1c9eso52203815ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 03:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688552395; x=1691144395;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3u7+5Xqy66HQP6SQUF7U4sC21GcgKDOqOTXMNFMXNXA=;
        b=rPJPIfq/R6OfaG/YEW6Yp+yH3ApXrithvu7h+TjIopWJTbDTlq9JiGu/+38Nj3lViT
         wgn8vySnMiJWgLRaBS69ec3yC24zcrqBWhjMWcBzVcB5cgQhUVMEGNr2cURwoXhMM/uk
         +W6md+t5FMV0Skctm7On6nGznnQ9WYyj9IClRs09KMKBGU6ZrVvZ5DBz4PSRszHpemqD
         va5sKn4kbXL/McNsgVQ27pd2wo5osf7Lx0kq7n5m+kVSwku7O5xVcwfJ3HKsrvxdgeqb
         yi1eDhXE2k4NW9CEBxhMyv8qfP/9yBTxGZNIt9AU8Gk/b9mwAwqolIiCmND6lXXyE54H
         WVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688552395; x=1691144395;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3u7+5Xqy66HQP6SQUF7U4sC21GcgKDOqOTXMNFMXNXA=;
        b=URk7EBp+DgJ5/uqLeNZFMFN4hdTR0GQKoZPxCGDGYknLIiALapOfsKY/DQFtySNiB1
         xQk6oq7NJ0GGfOwnqU+ZujL/dzAOHes/kMep7ZE0CsV9Wx+SVtzF1DU8gW7CaX+t/ROu
         iEbB2vIwL5+CyekAgv3JgEfFBZmGGQLL/z3PSHBhA51770Pkg4mAPqQ63ADf49YaJImW
         sf5a6tZshjPB8WQfWh3kpScwHkdIJHDTkVFUDkN2zOfEiRn4jwuImoYkRcfr1ryKBhPK
         BSeX4yOG/0YuJKBc5ie72dbRRAxQS2jwrjPOLM3A0txLBVqXtA5zoK3lvnkkoPHIKibu
         MnoA==
X-Gm-Message-State: ABy/qLZo5EA5d9qLWL74ZTdWH+LXtbSirD41rwWqD+VfK7eK/6ewbVDW
	J24XR5tTDydlfn6FQ1k6e40=
X-Google-Smtp-Source: APBJJlFtq8pH3qACwgrVuzhtaF6Tf1EaeFvnte7cgLrY+EcS1al3gR2FZfJH7jks15BP5NnNrlkZNw==
X-Received: by 2002:a17:903:1c5:b0:1b5:219a:cbbd with SMTP id e5-20020a17090301c500b001b5219acbbdmr19318373plh.3.1688552394645;
        Wed, 05 Jul 2023 03:19:54 -0700 (PDT)
Received: from [0.0.0.0] ([5.180.77.117])
        by smtp.gmail.com with ESMTPSA id t10-20020a170902b20a00b001b872c17535sm8947975plr.13.2023.07.05.03.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 03:19:54 -0700 (PDT)
Message-ID: <741ac150-5913-7011-31c2-15292df8061c@gmail.com>
Date: Wed, 5 Jul 2023 18:19:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] riscv: Start of DRAM should at least be aligned on PMD
 size for the direct mapping
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230704121837.248976-1-alexghiti@rivosinc.com>
 <20230704-emblem-rubble-e4a3a87cb98e@wendy>
 <CAHVXubikF36Tc19vv9osVz3ZvEyKXk-+74YBpPAZQpSt+vFkQw@mail.gmail.com>
From: Song Shuai <suagrfillet@gmail.com>
In-Reply-To: <CAHVXubikF36Tc19vv9osVz3ZvEyKXk-+74YBpPAZQpSt+vFkQw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_112000_182573_28619A23 
X-CRM114-Status: GOOD (  21.46  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgrlnKggMjAyMy83LzQgMjE6MTYsIEFsZXhhbmRyZSBHaGl0aSDlhpnpgZM6Cj4gT24gVHVlLCBK
dWwgNCwgMjAyMyBhdCAyOjI24oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9j
aGlwLmNvbT4gd3JvdGU6Cj4+Cj4+IEhleSBBbGV4LAo+Pgo+PiBPbiBUdWUsIEp1bCAwNCwgMjAy
MyBhdCAwMjoxODozN1BNICswMjAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4+PiBTbyB0aGF0
IHdlIGRvIG5vdCBlbmQgdXAgbWFwcGluZyB0aGUgd2hvbGUgbGluZWFyIG1hcHBpbmcgdXNpbmcg
NEsKPj4+IHBhZ2VzLCB3aGljaCBpcyBzbG93IGF0IGJvb3QgdGltZSwgYW5kIGFsc28gdmVyeSBs
aWtlbHkgYXQgcnVudGltZS4KPj4+Cj4+PiBTbyBtYWtlIHN1cmUgd2UgYWxpZ24gdGhlIHN0YXJ0
IG9mIERSQU0gb24gYSBQTUQgYm91bmRhcnkuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQWxleGFu
ZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+Pgo+PiBPYnZpb3VzbHkgY29ycmVj
dCBtZSBpZiBJIGFtIHdyb25nIGhlcmUsIGJ1dCB3YXMgdGhpcyBub3QgcmVwb3J0ZWQgYnkKPj4g
U29uZyBTaHVhaSBhcyBhIHJlZ3Jlc3Npb24/Cj4+IEFjY29yZGluZ2x5LCBzaG91bGQgdGhpcyBu
b3QgaGF2ZSBSZXBvcnRlZC1ieSwgQ2xvc2VzL0xpbmsgJiBGaXhlcyB0YWdzPwo+IAo+IFN1cmUg
d2Ugc2hvdWxkIGFkZCB0aGUgcmVwb3J0ZWQgYnkgZnJvbSBTb25nIGFzIGhlIGRpZCB0aGUgcHJv
cGVyIHJlcG9ydCA6KQo+IAo+IFJlcG9ydGVkLWJ5OiBTb25nIFNodWFpIDxzdWFncmZpbGxldEBn
bWFpbC5jb20+Cj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8y
MDIzMDYyNTE0MDkzMS4xMjY2MjE2LTEtc29uZ3NodWFpc2h1YWlAdGlueWxhYi5vcmcvCj4gCj4g
QW5kIHllcyBzb3JyeSwgSSB0aG91Z2h0IGl0IHdhcyB0aGVyZSBiZWZvcmUsIGJ1dCBpdCB3YXMg
YWN0dWFsbHkgd2hlbgo+IEkgcmV0cmlldmVkIHRoZSBmaXJzdCAyTUIgdGhhdCB0aGUgcHJvYmxl
bSBhcHBlYXJlZCwgc286Cj4gCj4gRml4ZXM6IDMzMzUwNjhmODcyMSAoInJpc2N2OiBVc2UgUFVE
L1A0RC9QR0QgcGFnZXMgZm9yIHRoZSBsaW5lYXIgbWFwcGluZyIpCj4gCj4gVGhhbmtzIQpBbmQg
eW91IGNhbiBhZGQgbXkgdGVzdGVkLWJ5OgoKVGVzdGVkLWJ5OiBTb25nIFNodWFpIDxzdWFncmZp
bGxldEBnbWFpbC5jb20+Cj4gCj4+Cj4+IENoZWVycywKPj4gQ29ub3IuCj4+Cj4+PiAtLS0KPj4+
ICAgYXJjaC9yaXNjdi9tbS9pbml0LmMgfCA3ICsrKysrKy0KPj4+ICAgMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L21tL2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4+PiBpbmRleCA0ZmE0MjBm
YWE3ODAuLjRhNDNlYzI3NWM2ZCAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5j
Cj4+PiArKysgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+Pj4gQEAgLTIxNCw4ICsyMTQsMTMgQEAg
c3RhdGljIHZvaWQgX19pbml0IHNldHVwX2Jvb3RtZW0odm9pZCkKPj4+ICAgICAgICBtZW1ibG9j
a19yZXNlcnZlKHZtbGludXhfc3RhcnQsIHZtbGludXhfZW5kIC0gdm1saW51eF9zdGFydCk7Cj4+
Pgo+Pj4gICAgICAgIHBoeXNfcmFtX2VuZCA9IG1lbWJsb2NrX2VuZF9vZl9EUkFNKCk7Cj4+PiAr
Cj4+PiArICAgICAvKgo+Pj4gKyAgICAgICogTWFrZSBzdXJlIHdlIGFsaWduIHRoZSBzdGFydCBv
ZiB0aGUgbWVtb3J5IG9uIGEgUE1EIGJvdW5kYXJ5IHNvIHRoYXQKPj4+ICsgICAgICAqIGF0IHdv
cnN0LCB3ZSBtYXAgdGhlIGxpbmVhciBtYXBwaW5nIHdpdGggUE1EIG1hcHBpbmdzLgo+Pj4gKyAg
ICAgICovCj4+PiAgICAgICAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19YSVBfS0VSTkVMKSkKPj4+
IC0gICAgICAgICAgICAgcGh5c19yYW1fYmFzZSA9IG1lbWJsb2NrX3N0YXJ0X29mX0RSQU0oKTsK
Pj4+ICsgICAgICAgICAgICAgcGh5c19yYW1fYmFzZSA9IG1lbWJsb2NrX3N0YXJ0X29mX0RSQU0o
KSAmIFBNRF9NQVNLOwo+Pj4KPj4+ICAgICAgICAvKgo+Pj4gICAgICAgICAqIEluIDY0LWJpdCwg
YW55IHVzZSBvZiBfX3ZhL19fcGEgYmVmb3JlIHRoaXMgcG9pbnQgaXMgd3JvbmcgYXMgd2UKPj4+
IC0tCj4+PiAyLjM5LjIKPj4+CgotLSAKVGhhbmtzClNvbmcgU2h1YWkKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
