Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC83CCD185
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 03:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kuWgJ750+IaWGF7eMMzJHxPGCRXeuy8T9Lb21trdvYs=; b=0I3XXmd6nmatIC
	ABzPttx+myqyj45Bo0QVUjE7BaClCgTUWf6s/pv2vilRgn5fkewbrBVXCPSGvxZmAhoZw4jn9f+QS
	pFZh0yOEvQovoY3PqSoEX7jNIgA9FhQ/niggv1pKmJhcHs9qIRLEM1+OgT+oMSggo2YSfEI/bRh4w
	EbV3ynZpaz5lGJ9qiDOeGD3kQIoD8fZCQ7tgpw+yR1uf18+HOwvC0is01RZ92wFEDEnymAjTkFeXL
	6CYaTnz0XSbAJ3sVBqBvsldcnIAUTAV1w6oVN7NSAMlOgmbMUHc6QspVNgBQ8ar3A29RO25+YmfSU
	tXZ9e6VJ8BNaB414Ch/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v89T9-0000000CAcD-2H2q;
	Mon, 13 Oct 2025 03:43:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v89T8-0000000CAc5-2dPp
	for linux-riscv@bombadil.infradead.org;
	Mon, 13 Oct 2025 03:43:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=24h7Itp/dXPzmSzIwKkei5mOBek1A1O1faMcM0/pAdU=; b=glQ9NgGH8Sy86o2nI/Txo9gM+Q
	K055THwOoPRr5CKN1Xle6Pr9EdQZcsQ2H/Ji92jpLli9vddlLxeEIsq/tzhURqdW2DAeAnwIAXwYd
	FDUzTqC+J+mnm4QExdpNysFCaP6egb8Cj5004km6SE44FZY+Dw5miLPX8GDfDyIOXuGa/XgljYN8H
	wVgY1EUf2RXBrgPVzfEB3Om30bInc5epZczEJq/JqK4iSOFsYu+TwES/DlURMKK3p4ikb4/Uaq3Zb
	TDo721fhUfVzmWSHi6UEIM9j+74LkHRgzSrxEuBL6UpPsG/4Ovff4XwsjCHe2cuquM/0OVOzrssoz
	p8p3VmZw==;
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v89Sy-000000044cw-3aDk
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 03:43:28 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-58afb2f42e3so4458973e87.2
        for <linux-riscv@lists.infradead.org>; Sun, 12 Oct 2025 20:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760326996; x=1760931796; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24h7Itp/dXPzmSzIwKkei5mOBek1A1O1faMcM0/pAdU=;
        b=fMTStg1m1UD2jeZG0733NTMxgm/ABCFZxLrIUmamGPAseUr1pzVI11OSiYpdUadSnd
         Alq5/aWUmt36x6tpaCcikAGNKnStM46VS5P5nIsrY79OvEXkG6a/nQerWiyWaORpHw0l
         uIU/ecrLRsSEHO3IaxHYcXD8ej+OOHaY681BiEPO7RPYrLS5jyUnrysBB9HG6iT3moZM
         3+nPHod9BRHWc2nrI9v3CTJtdQgfg7V9wmtxrVodTihorK/AlD7v+2bSkgae2VMx3eHS
         8jHgflEoJOvDQEs4+3ASvsWJvcaSIa4VBahKkZUQDUY1jlePq1y4cNxSOrBxuAPPOt7B
         XX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760326996; x=1760931796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=24h7Itp/dXPzmSzIwKkei5mOBek1A1O1faMcM0/pAdU=;
        b=ntaQmdgTVnIBDn9IvO5JWEqu5HVLZaZgxzMxLDkt3b73Sf362YOZgpGfJ7hdequNVY
         Z5nuh0DjKj+/I9sn0rYoGzlmxUyr0J+Z80LR6O+fwGWVp0DHm0u+qkunVUwxG/2RBONk
         5Q7uHPnF9yPzb0elPG3KLNJc6PMh4yla8WRBFsKwTegh5qyrx/U6rezm0JZWrkjoB9Jt
         EQqN6+JrzIe8sdROGWGZ9NX4CrIlKENGRReroqkhb4XYYwM5of8aBDLjCCgyCm4vIpvq
         Aynr489ncIICxQMCqqRJ43VwJldNm/a0DK15Uc5JUX0varB3jpffmoCOojiC300KlGCu
         gANg==
X-Forwarded-Encrypted: i=1; AJvYcCWxAgQg4c3xRNrfw2sgcbYZ87T5CwjUbXucgHSy5ED1k//iHUS2tanFhoO78Cl434YscbwVeOSHG2v3yQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYjiFP/CXY4mYKHg9hK3n7Q+EfZNJj2urE1ol92P/LnRVHWwBD
	ozR8Md5o6rR6T43PtyVHkXkWAGM4pRGeESaZ73HWqJYh4rp261c4pVNfiD/C6Aa8USp4Qd35mHT
	7ojsrls3OSWxRpB0nwYsDUB2R0azvGWUrlQfzljg+vg==
X-Gm-Gg: ASbGnctqbzTBYFHgk45KR30xe76V0ecQGd3LQmp3ig3Z8g1lzB0E/bOFgd+EvVDqk9C
	BL3D9dQEthZhX8JXiGabwQprnj7FSJtDRajnZRDE4wAKfg0HlOBmXa1WsrBXq3Ay7q7QPBmYURA
	UhNn+Yl6hdgNiDyUtPSSr8X6q6caILUfSIxtxJs0oYr9T6EQg3hDMPxsv9mT8uHVSHyv0j962tO
	aSSL4uH8kbZgNeHJ1QyYmV6lqAkgJOGUsKy
X-Google-Smtp-Source: AGHT+IFLqPt8lp2H0oOk51fM7RvIbA2F2cktgwpcZz8FTkw5EO3QcLCoIP5IHjV7wl0Kp6w858X4FeLBGSsd7rTYW5k=
X-Received: by 2002:a05:6512:238d:b0:579:f273:190 with SMTP id
 2adb3069b0e04-5906dd5472bmr4972531e87.33.1760326996352; Sun, 12 Oct 2025
 20:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20251002060732.100213-1-apatel@ventanamicro.com>
 <20251002060732.100213-5-apatel@ventanamicro.com> <20edc3a9-2efe-4431-b198-f00b3940777c@gmail.com>
In-Reply-To: <20edc3a9-2efe-4431-b198-f00b3940777c@gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 13 Oct 2025 09:13:02 +0530
X-Gm-Features: AS18NWCkpL-Tj809xBCjmV9NdJPyzSgVvYHUUVV9e4EHlC9UmnJAO9LfIK-j1SY
Message-ID: <CAK9=C2U+H5xZaK6g5qcytESyC9H8gkU_jEUDJanEs1qzcGgYCQ@mail.gmail.com>
Subject: Re: [PATCH 04/11] rvtrace: Add functions to start/stop tracing on a
 component path
To: Bo Gan <ganboing@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_044325_085597_F9A4A4C7 
X-CRM114-Status: GOOD (  23.35  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Atish Patra <atish.patra@linux.dev>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-kernel@vger.kernel.org, Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, Liang Kan <kan.liang@linux.intel.com>, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Mayuresh Chitale <mchitale@gmail.com>, Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@redhat.com>, Greg KH <gregkh@linuxfoundation.org>, Adrian Hunter <adrian.hunter@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jiri Olsa <jolsa@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBPY3QgOCwgMjAyNSBhdCAyOjQ14oCvUE0gQm8gR2FuIDxnYW5ib2luZ0BnbWFpbC5j
b20+IHdyb3RlOgo+Cj4gT24gMTAvMS8yNSAyMzowNywgQW51cCBQYXRlbCB3cm90ZToKPiA+IEZy
b206IE1heXVyZXNoIENoaXRhbGUgPG1jaGl0YWxlQHZlbnRhbmFtaWNyby5jb20+Cj4gPgo+ID4g
VGhlIHBlcmYgZHJpdmVyIGZyYW1ld29yayBuZWVkcyB0byBiZSBhYmxlIHRvIHN0YXJ0IC8gc3Rv
cCBhbGwgY29tcG9uZW50cwo+ID4gaW4gYSB0cmFjZSBjb21wb25lbnQgcGF0aCBkdXJpbmcgaXRz
IG9wZXJhdGlvbi4gQWRkIHJ2dHJhY2VfcGF0aF9zdGFydCgpCj4gPiBhbmQgcnZ0cmFjZV9wYXRo
X3N0b3AoKSBmdW5jdGlvbnMgZm9yIHRoaXMgcHVycG9zZS4KPiA+Cj4gPiBDby1kZXZlbG9wZWQt
Ynk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gU2lnbmVkLW9mZi1i
eTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBNYXl1cmVzaCBDaGl0YWxlIDxtY2hpdGFsZUB2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0tCj4g
PiAgIGRyaXZlcnMvaHd0cmFjaW5nL3J2dHJhY2UvcnZ0cmFjZS1jb3JlLmMgfCA0NCArKysrKysr
KysrKysrKysrKysrKysrKysKPiA+ICAgaW5jbHVkZS9saW51eC9ydnRyYWNlLmggICAgICAgICAg
ICAgICAgICB8ICA2ICsrKysKPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCsp
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHd0cmFjaW5nL3J2dHJhY2UvcnZ0cmFjZS1j
b3JlLmMgYi9kcml2ZXJzL2h3dHJhY2luZy9ydnRyYWNlL3J2dHJhY2UtY29yZS5jCj4gPiBpbmRl
eCA3MDEzZDUwY2E1NjkuLjEwOWJlNDBkNGIyNCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvaHd0
cmFjaW5nL3J2dHJhY2UvcnZ0cmFjZS1jb3JlLmMKPiA+ICsrKyBiL2RyaXZlcnMvaHd0cmFjaW5n
L3J2dHJhY2UvcnZ0cmFjZS1jb3JlLmMKPiA+IEBAIC02MTQsNiArNjE0LDUwIEBAIHN0YXRpYyB2
b2lkIHJ2dHJhY2VfcmVsZWFzZV9wYXRoX25vZGVzKHN0cnVjdCBydnRyYWNlX3BhdGggKnBhdGgp
Cj4gPiAgICAgICB9Cj4gPiAgIH0KPiA+Cj4gPiAraW50IHJ2dHJhY2VfcGF0aF9zdGFydChzdHJ1
Y3QgcnZ0cmFjZV9wYXRoICpwYXRoKQo+ID4gK3sKPiA+ICsgICAgIGNvbnN0IHN0cnVjdCBydnRy
YWNlX2RyaXZlciAqcnRkcnY7Cj4gPiArICAgICBzdHJ1Y3QgcnZ0cmFjZV9jb21wb25lbnQgKmNv
bXA7Cj4gPiArICAgICBzdHJ1Y3QgcnZ0cmFjZV9wYXRoX25vZGUgKm5vZGU7Cj4gPiArICAgICBp
bnQgcmV0Owo+ID4gKwo+ID4gKyAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeShub2RlLCAmcGF0aC0+
Y29tcF9saXN0LCBoZWFkKSB7Cj4gPiArICAgICAgICAgICAgIGNvbXAgPSBub2RlLT5jb21wOwo+
ID4gKyAgICAgICAgICAgICBydGRydiA9IHRvX3J2dHJhY2VfZHJpdmVyKGNvbXAtPmRldi5kcml2
ZXIpOwo+ID4gKyAgICAgICAgICAgICBpZiAoIXJ0ZHJ2LT5zdGFydCkKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICBjb250aW51ZTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgcmV0ID0gcnRkcnYt
PnN0YXJ0KGNvbXApOwo+ID4gKyAgICAgICAgICAgICBpZiAocmV0KQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAgICByZXR1cm4g
MDsKPiA+ICt9Cj4gPiArRVhQT1JUX1NZTUJPTF9HUEwocnZ0cmFjZV9wYXRoX3N0YXJ0KTsKPiA+
ICsKPiA+ICtpbnQgcnZ0cmFjZV9wYXRoX3N0b3Aoc3RydWN0IHJ2dHJhY2VfcGF0aCAqcGF0aCkK
PiA+ICt7Cj4gPiArICAgICBjb25zdCBzdHJ1Y3QgcnZ0cmFjZV9kcml2ZXIgKnJ0ZHJ2Owo+ID4g
KyAgICAgc3RydWN0IHJ2dHJhY2VfY29tcG9uZW50ICpjb21wOwo+ID4gKyAgICAgc3RydWN0IHJ2
dHJhY2VfcGF0aF9ub2RlICpub2RlOwo+ID4gKyAgICAgaW50IHJldDsKPiA+ICsKPiA+ICsgICAg
IGxpc3RfZm9yX2VhY2hfZW50cnkobm9kZSwgJnBhdGgtPmNvbXBfbGlzdCwgaGVhZCkgewo+ID4g
KyAgICAgICAgICAgICBjb21wID0gbm9kZS0+Y29tcDsKPiA+ICsgICAgICAgICAgICAgcnRkcnYg
PSB0b19ydnRyYWNlX2RyaXZlcihjb21wLT5kZXYuZHJpdmVyKTsKPiA+ICsgICAgICAgICAgICAg
aWYgKCFydGRydi0+c3RvcCkKPiA+ICsgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+
ICsKPiA+ICsgICAgICAgICAgICAgcmV0ID0gcnRkcnYtPnN0b3AoY29tcCk7Cj4gPiArICAgICAg
ICAgICAgIGlmIChyZXQpCj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+
ICsgICAgIH0KPiA+ICsKPiA+ICsgICAgIHJldHVybiAwOwo+ID4gK30KPiA+ICtFWFBPUlRfU1lN
Qk9MX0dQTChydnRyYWNlX3BhdGhfc3RvcCk7Cj4gPiArCj4gPiAgIHN0cnVjdCBydnRyYWNlX3Bh
dGggKnJ2dHJhY2VfY3JlYXRlX3BhdGgoc3RydWN0IHJ2dHJhY2VfY29tcG9uZW50ICpzb3VyY2Us
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcnZ0cmFj
ZV9jb21wb25lbnQgKnNpbmssCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBlbnVtIHJ2dHJhY2VfY29tcG9uZW50X21vZGUgbW9kZSkKPiA+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L3J2dHJhY2UuaCBiL2luY2x1ZGUvbGludXgvcnZ0cmFjZS5oCj4gPiBpbmRl
eCBmMjE3NGY0NjNhNjkuLmU3YmQzMzVkMzg4ZiAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvbGlu
dXgvcnZ0cmFjZS5oCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L3J2dHJhY2UuaAo+ID4gQEAgLTI3
MywxMCArMjczLDE0IEBAIHN0cnVjdCBydnRyYWNlX3BhdGggKnJ2dHJhY2VfY3JlYXRlX3BhdGgo
c3RydWN0IHJ2dHJhY2VfY29tcG9uZW50ICpzb3VyY2UsCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcnZ0cmFjZV9jb21wb25lbnQgKnNpbmssCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIHJ2dHJhY2VfY29tcG9u
ZW50X21vZGUgbW9kZSk7Cj4gPiAgIHZvaWQgcnZ0cmFjZV9kZXN0cm95X3BhdGgoc3RydWN0IHJ2
dHJhY2VfcGF0aCAqcGF0aCk7Cj4gPiAraW50IHJ2dHJhY2VfcGF0aF9zdGFydChzdHJ1Y3QgcnZ0
cmFjZV9wYXRoICpwYXRoKTsKPiA+ICtpbnQgcnZ0cmFjZV9wYXRoX3N0b3Aoc3RydWN0IHJ2dHJh
Y2VfcGF0aCAqcGF0aCk7Cj4gPgo+ID4gICAvKioKPiA+ICAgICogc3RydWN0IHJ2dHJhY2VfZHJp
dmVyIC0gUmVwcmVzZW50YXRpb24gb2YgYSBSSVNDLVYgdHJhY2UgZHJpdmVyCj4gPiAgICAqIGlk
X3RhYmxlOiBUYWJsZSB0byBtYXRjaCBjb21wb25lbnRzIGhhbmRsZWQgYnkgdGhlIGRyaXZlcgo+
ID4gKyAqIHN0YXJ0OiAgICAgICAgQ2FsbGJhY2sgdG8gc3RhcnQgdHJhY2luZwo+ID4gKyAqIHN0
b3A6ICAgICAgICAgQ2FsbGJhY2sgdG8gc3RvcCB0cmFjaW5nCj4gPiAgICAqIHByb2JlOiAgICAg
ICAgRHJpdmVyIHByb2JlKCkgZnVuY3Rpb24KPiA+ICAgICogcmVtb3ZlOiAgICAgICBEcml2ZXIg
cmVtb3ZlKCkgZnVuY3Rpb24KPiA+ICAgICogZ2V0X3RyYWNlX2lkOiBHZXQvYWxsb2NhdGUgYSB0
cmFjZSBJRAo+ID4gQEAgLTI4NSw2ICsyODksOCBAQCB2b2lkIHJ2dHJhY2VfZGVzdHJveV9wYXRo
KHN0cnVjdCBydnRyYWNlX3BhdGggKnBhdGgpOwo+ID4gICAgKi8KPiA+ICAgc3RydWN0IHJ2dHJh
Y2VfZHJpdmVyIHsKPiA+ICAgICAgIGNvbnN0IHN0cnVjdCBydnRyYWNlX2NvbXBvbmVudF9pZCAq
aWRfdGFibGU7Cj4gPiArICAgICBpbnQgICAgICAgICAgICAgICAgICAgICAoKnN0YXJ0KShzdHJ1
Y3QgcnZ0cmFjZV9jb21wb25lbnQgKmNvbXApOwo+ID4gKyAgICAgaW50ICAgICAgICAgICAgICAg
ICAgICAgKCpzdG9wKShzdHJ1Y3QgcnZ0cmFjZV9jb21wb25lbnQgKmNvbXApOwo+ID4gICAgICAg
aW50ICAgICAgICAgICAgICAgICAgICAgKCpwcm9iZSkoc3RydWN0IHJ2dHJhY2VfY29tcG9uZW50
ICpjb21wKTsKPiA+ICAgICAgIHZvaWQgICAgICAgICAgICAgICAgICAgICgqcmVtb3ZlKShzdHJ1
Y3QgcnZ0cmFjZV9jb21wb25lbnQgKmNvbXApOwo+ID4gICAgICAgaW50ICAgICAgICAgICAgICAg
ICAgICAgKCpnZXRfdHJhY2VfaWQpKHN0cnVjdCBydnRyYWNlX2NvbXBvbmVudCAqY29tcCwKPgo+
IEknZCBzdWdnZXN0IGFkZCBhbm90aGVyIGZ1bmN0aW9uICgqcXVpZXNjZSkgb3Igc29tZXRoaW5n
IGxpa2UgdGhhdC4gVHJhY2UKPiBjb21wb25lbnRzIGhhdmUgYSB0cj8/RW1wdHkgYml0IHRoYXQg
aW5kaWNhdGVzIHRyYWNlIGhhcyBiZWVuIGFsbCBmbHVzaGVkCj4gb3V0LiBBbHNvIGFsb25nIHRo
ZSBwYXRoIHdoZW4geW91IGRvIHJ2dHJhY2VfcGF0aF9zdG9wLCB5b3UgbmVlZCB0byBlbnN1cmUK
PiB0aGUgc291cmNlIGhhcyBzdG9wcGVkIGFuZCBxdWllc2NlbnQgYmVmb3JlIGJlZ2lubmluZyB0
byBzdG9wIHRoZSBzaW5rLgo+IE90aGVyd2lzZSB5b3UnbGwgZ2V0IHBhcnRpYWwgb3IgY29ycnVw
dGVkIHRyYWNlLiBJbiBlc3NlbmNlLCBmb2xsb3cgQ29udHJvbAo+IEludGVyZmFjZSBTcGVjIDEx
LjMgRW5hYmxpbmcgYW5kIERpc2FibGluZy4gRllJOiBteSB1c2Vyc3BhY2UgZHJpdmVyOgo+IGh0
dHBzOi8vZ2l0aHViLmNvbS9nYW5ib2luZy9yaXNjdi10cmFjZS11bWQvYmxvYi9tYXN0ZXIvcnZ0
cmFjZS9mdW5uZWwucHkjTDIyMwoKSXQncyBiZXR0ZXIgdG8gYWRkIGZ1bmN0aW9ucyBvbiBhIG5l
ZWQgYmFzaXMgcmF0aGVyIHRoYW4gYWRkaW5nCml0IG5vdyB3aXRob3V0IGFueSBwb3RlbnRpYWwg
dXNlci4KClJlZ2FyZHMsCkFudQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
