Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE1EC6FD19
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Mar 2023 06:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tlFHmCOczITMFFkLPUKzs02bs6b8TzGzkXKA9AWehto=; b=IveVdhvw+snugW
	HavmwzaVjTjlImFVn9XCFmwEUN9rVG77JPEw7cPRaVP5M2LCOECzoXGUZzMKzwQeurKF9nucgRYhm
	s7XORNVkNqZ1U8C81QpnlApeNNYQMWplLaG8vfcZxiDNcNMm2cNeWw+pExjI1pnUaX7fXDXPkYMF1
	2CgO4LlBCIhfoM1kmzKfACKFZt0SFA10yvXXdBnU/GAJPHym2bHPtqR8ozeAv3X1/AunCMLpYGbR4
	DLeDaPxbDADQqofoKETspW48mCw3PCUqldxZfWgZlobAN0G7cxxDG6fkI13j3BIaktLwh3XpOXEeo
	3X/NpX4o4PiDmuzaCAcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbFBW-001s2d-1L; Sun, 12 Mar 2023 06:27:58 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbFBT-001s2J-CX
	for linux-riscv@lists.infradead.org; Sun, 12 Mar 2023 06:27:56 +0000
Received: by mail-wr1-x436.google.com with SMTP id l12so285406wrm.10
        for <linux-riscv@lists.infradead.org>; Sat, 11 Mar 2023 22:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678602473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtv29KZX+XREe9cWzAMxT6V39t/L1NQeIC8ivHVuqS4=;
        b=o0/NYospeBO1+8cuP+NfwBHbLPcnYfw49cgYl3XTC5Ix9P6eV9x6V1BRXB92AePhzQ
         Xda0Eq54Oegsxn//6fhRY9YjbX9yCJ7g6vef56+Zl7ua5XAV+e3b/aWVTtgZZik5bBEc
         MXON0IdN9LwL9sevao0AitDnR2cTNtRkdOqYwR42RhK1GZiqOF4ZqSL01Mv42QaWl0P0
         1ypy2zSoVNkALt0IXZOgIVRVklSOQxbgNlaVpqIypfh9HkMv2mz8gxas5DaNrXMPgmnR
         QpeCZRPN9apuoktC8SI4zqi4UO15X+smd7H9PBd23iPa9w4keLmPvSImc9cB4t5DJDVs
         UU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678602473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wtv29KZX+XREe9cWzAMxT6V39t/L1NQeIC8ivHVuqS4=;
        b=XVvCuBTauMCJAXwqVDI8IcgtKtogZH+joV8nV5id+TgqYXOyce1+awENODTck7yO3L
         kqevXkP0EnglQ1hhegZa4d1Py/06GV74naEHlL3sn/BjNvA8mw9fyiB4jA7JI1yJ785L
         /hMsv75vjs1mn/nkUoLD3df7HDJvnl0nMF2BgnIMe1E28mEzuGOSq+/Y5a9GqSKlJ8+5
         jCHjAA3qXwCvfScmC5xPd5mDIRXOuXUuZXYTFIj/kZv5xwCWp6Q9zjN5GvjsBXn6awo8
         gYgj44YkEvXTihb0OdHxQm3AabktN1PfjJTvjzWt7z09VAmVtq8tnX/cG1U7gF/ii04u
         PxSQ==
X-Gm-Message-State: AO0yUKV0xR1oXIWPsZOABifr9fNaOHK96ej59oCvnMulkaEOQfNIFUlr
	EaSq59IW7OozrlwsUrbAZPVBNq/6xtYSbZlsvDK6Iw==
X-Google-Smtp-Source: AK7set/W089nZRtqvQkaqo5MGXF43OWcIyaszLy3QrT1jn4BQxabvW3adNuV27z4WnO5yFKbt6/MdgsapvUuEkuPeEM=
X-Received: by 2002:adf:f189:0:b0:2ce:aaff:2a8c with SMTP id
 h9-20020adff189000000b002ceaaff2a8cmr151156wro.14.1678602473299; Sat, 11 Mar
 2023 22:27:53 -0800 (PST)
MIME-Version: 1.0
References: <20230311112122.28894-1-p4ranlee@gmail.com>
In-Reply-To: <20230311112122.28894-1-p4ranlee@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Sat, 11 Mar 2023 22:27:41 -0800
Message-ID: <CAP-5=fWkAqX+Uy_XhXHjEx6sj-wpOJ+WQf=vMtRzRBS-0Kj32Q@mail.gmail.com>
Subject: Re: [PATCH] perf tools riscv: Add support for riscv lookup_binutils_path
To: paranlee <p4ranlee@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, Ananth N Mavinakayanahalli <ananth@in.ibm.com>, Anton Blanchard <anton@ozlabs.org>, 
	Daniel Axtens <dja@axtens.net>, Michael Ellerman <mpe@ellerman.id.au>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_222755_469401_6015D91C 
X-CRM114-Status: GOOD (  19.07  )
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

T24gU2F0LCBNYXIgMTEsIDIwMjMgYXQgMzoyMuKAr0FNIHBhcmFubGVlIDxwNHJhbmxlZUBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gQWRkIHRvIGtub3cgUklTQy1WIGJpbnV0aWxzIHBhdGguCj4gU2Vj
b25kYXJpbHksIGVkaXQgdGhlIGNvZGUgYmxvY2sgd2l0aCBhbHBoYWJldGljYWwgb3JkZXIuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBQYXJhbiBMZWUgPHA0cmFubGVlQGdtYWlsLmNvbT4KPiAtLS0KPiAg
dG9vbHMvcGVyZi9hcmNoL2NvbW1vbi5jIHwgNTEgKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgMTYgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi9hcmNoL2NvbW1vbi5jIGIvdG9v
bHMvcGVyZi9hcmNoL2NvbW1vbi5jCj4gaW5kZXggNTlkZDg3NWZkNWU0Li4wNTg1MjdlZGVkZGQg
MTAwNjQ0Cj4gLS0tIGEvdG9vbHMvcGVyZi9hcmNoL2NvbW1vbi5jCj4gKysrIGIvdG9vbHMvcGVy
Zi9hcmNoL2NvbW1vbi5jCj4gQEAgLTI5LDExICsyOSwyMyBAQCBjb25zdCBjaGFyICpjb25zdCBh
cm1fdHJpcGxldHNbXSA9IHsKPiAgfTsKPgo+ICBjb25zdCBjaGFyICpjb25zdCBhcm02NF90cmlw
bGV0c1tdID0gewo+ICsgICAgICAgImFhcmNoNjQtdW5rbm93bi1saW51eC0iLAoKTW9kaWZ5aW5n
IEFSTTY0IGJlaGF2aW9yIHNob3VsZCBiZSBhIHNlcGFyYXRlIGNoYW5nZS4KCj4gICAgICAgICAi
YWFyY2g2NC1saW51eC1hbmRyb2lkLSIsCj4gICAgICAgICAiYWFyY2g2NC1saW51eC1nbnUtIiwK
PiAgICAgICAgIE5VTEwKPiAgfTsKPgo+ICtjb25zdCBjaGFyICpjb25zdCBtaXBzX3RyaXBsZXRz
W10gPSB7Cj4gKyAgICAgICAibWlwcy11bmtub3duLWxpbnV4LWdudS0iLAo+ICsgICAgICAgIm1p
cHNlbC1saW51eC1hbmRyb2lkLSIsCj4gKyAgICAgICAibWlwcy1saW51eC1nbnUtIiwKPiArICAg
ICAgICJtaXBzNjQtbGludXgtZ251LSIsCj4gKyAgICAgICAibWlwczY0ZWwtbGludXgtZ251YWJp
NjQtIiwKPiArICAgICAgICJtaXBzNjQtbGludXgtZ251YWJpNjQtIiwKPiArICAgICAgICJtaXBz
ZWwtbGludXgtZ251LSIsCj4gKyAgICAgICBOVUxMCj4gK307Cj4gKwoKVGhpcyB3aWxsIGFmZmVj
dCB0aGUgYmxhbWUgaGlzdG9yeS4gSXQgc2hvdWxkIHByb2JhYmx5IGJlIGl0cyBvd24gY2hhbmdl
IHRvby4KCj4gIGNvbnN0IGNoYXIgKmNvbnN0IHBvd2VycGNfdHJpcGxldHNbXSA9IHsKPiAgICAg
ICAgICJwb3dlcnBjLXVua25vd24tbGludXgtZ251LSIsCj4gICAgICAgICAicG93ZXJwYy1saW51
eC1nbnUtIiwKPiBAQCAtNDMsNiArNTUsMjAgQEAgY29uc3QgY2hhciAqY29uc3QgcG93ZXJwY190
cmlwbGV0c1tdID0gewo+ICAgICAgICAgTlVMTAo+ICB9Owo+Cj4gK2NvbnN0IGNoYXIgKmNvbnN0
IHJpc2N2MzJfdHJpcGxldHNbXSA9IHsKPiArICAgICAgICJyaXNjdjMyLXVua25vd24tbGludXgt
Z251LSIsCj4gKyAgICAgICAicmlzY3YzMi1saW51eC1hbmRyb2lkLSIsCj4gKyAgICAgICAicmlz
Y3YzMi1saW51eC1nbnUtIiwKPiArICAgICAgIE5VTEwKPiArfTsKPiArCj4gK2NvbnN0IGNoYXIg
KmNvbnN0IHJpc2N2NjRfdHJpcGxldHNbXSA9IHsKPiArICAgICAgICJyaXNjdjY0LXVua25vd24t
bGludXgtZ251LSIsCj4gKyAgICAgICAicmlzY3Y2NC1saW51eC1hbmRyb2lkLSIsCj4gKyAgICAg
ICAicmlzY3Y2NC1saW51eC1nbnUtIiwKPiArICAgICAgIE5VTEwKPiArfTsKPiArCj4gIGNvbnN0
IGNoYXIgKmNvbnN0IHMzOTBfdHJpcGxldHNbXSA9IHsKPiAgICAgICAgICJzMzkwLWlibS1saW51
eC0iLAo+ICAgICAgICAgInMzOTB4LWxpbnV4LWdudS0iLAo+IEBAIC03OCwxNyArMTA0LDYgQEAg
Y29uc3QgY2hhciAqY29uc3QgeDg2X3RyaXBsZXRzW10gPSB7Cj4gICAgICAgICBOVUxMCj4gIH07
Cj4KPiAtY29uc3QgY2hhciAqY29uc3QgbWlwc190cmlwbGV0c1tdID0gewo+IC0gICAgICAgIm1p
cHMtdW5rbm93bi1saW51eC1nbnUtIiwKPiAtICAgICAgICJtaXBzZWwtbGludXgtYW5kcm9pZC0i
LAo+IC0gICAgICAgIm1pcHMtbGludXgtZ251LSIsCj4gLSAgICAgICAibWlwczY0LWxpbnV4LWdu
dS0iLAo+IC0gICAgICAgIm1pcHM2NGVsLWxpbnV4LWdudWFiaTY0LSIsCj4gLSAgICAgICAibWlw
czY0LWxpbnV4LWdudWFiaTY0LSIsCj4gLSAgICAgICAibWlwc2VsLWxpbnV4LWdudS0iLAo+IC0g
ICAgICAgTlVMTAo+IC19Owo+IC0KPiAgc3RhdGljIGJvb2wgbG9va3VwX3BhdGgoY2hhciAqbmFt
ZSkKPiAgewo+ICAgICAgICAgYm9vbCBmb3VuZCA9IGZhbHNlOwo+IEBAIC0xNjQsMTggKzE3OSwy
MiBAQCBzdGF0aWMgaW50IHBlcmZfZW52X19sb29rdXBfYmludXRpbHNfcGF0aChzdHJ1Y3QgcGVy
Zl9lbnYgKmVudiwKPiAgICAgICAgICAgICAgICAgcGF0aF9saXN0ID0gYXJtX3RyaXBsZXRzOwo+
ICAgICAgICAgZWxzZSBpZiAoIXN0cmNtcChhcmNoLCAiYXJtNjQiKSkKPiAgICAgICAgICAgICAg
ICAgcGF0aF9saXN0ID0gYXJtNjRfdHJpcGxldHM7Cj4gKyAgICAgICBlbHNlIGlmICghc3RyY21w
KGFyY2gsICJtaXBzIikpCj4gKyAgICAgICAgICAgICAgIHBhdGhfbGlzdCA9IG1pcHNfdHJpcGxl
dHM7Cj4gICAgICAgICBlbHNlIGlmICghc3RyY21wKGFyY2gsICJwb3dlcnBjIikpCj4gICAgICAg
ICAgICAgICAgIHBhdGhfbGlzdCA9IHBvd2VycGNfdHJpcGxldHM7Cj4gLSAgICAgICBlbHNlIGlm
ICghc3RyY21wKGFyY2gsICJzaCIpKQo+IC0gICAgICAgICAgICAgICBwYXRoX2xpc3QgPSBzaF90
cmlwbGV0czsKPiArICAgICAgIGVsc2UgaWYgKCFzdHJjbXAoYXJjaCwgInJpc2N2MzIiKSkKPiAr
ICAgICAgICAgICAgICAgcGF0aF9saXN0ID0gcmlzY3YzMl90cmlwbGV0czsKPiArICAgICAgIGVs
c2UgaWYgKCFzdHJjbXAoYXJjaCwgInJpc2N2NjQiKSkKPiArICAgICAgICAgICAgICAgcGF0aF9s
aXN0ID0gcmlzY3Y2NF90cmlwbGV0czsKPiAgICAgICAgIGVsc2UgaWYgKCFzdHJjbXAoYXJjaCwg
InMzOTAiKSkKPiAtICAgICAgICAgICAgICAgcGF0aF9saXN0ID0gczM5MF90cmlwbGV0czsKPiAr
ICAgICAgICAgICAgICAgcGF0aF9saXN0ID0gczM5MF90cmlwbGV0czsKCndoaXRlc3BhY2UgaXNz
dWU/Cgo+ICsgICAgICAgZWxzZSBpZiAoIXN0cmNtcChhcmNoLCAic2giKSkKPiArICAgICAgICAg
ICAgICAgcGF0aF9saXN0ID0gc2hfdHJpcGxldHM7Cj4gICAgICAgICBlbHNlIGlmICghc3RyY21w
KGFyY2gsICJzcGFyYyIpKQo+ICAgICAgICAgICAgICAgICBwYXRoX2xpc3QgPSBzcGFyY190cmlw
bGV0czsKPiAgICAgICAgIGVsc2UgaWYgKCFzdHJjbXAoYXJjaCwgIng4NiIpKQo+ICAgICAgICAg
ICAgICAgICBwYXRoX2xpc3QgPSB4ODZfdHJpcGxldHM7Cj4gLSAgICAgICBlbHNlIGlmICghc3Ry
Y21wKGFyY2gsICJtaXBzIikpCj4gLSAgICAgICAgICAgICAgIHBhdGhfbGlzdCA9IG1pcHNfdHJp
cGxldHM7Cj4gICAgICAgICBlbHNlIHsKPiAgICAgICAgICAgICAgICAgdWlfX2Vycm9yKCJiaW51
dGlscyBmb3IgJXMgbm90IHN1cHBvcnRlZC5cbiIsIGFyY2gpOwo+ICAgICAgICAgICAgICAgICBn
b3RvIG91dF9lcnJvcjsKCkkgdGhpbmsgaW4gZ2VuZXJhbCB3ZSBuZWVkIHRvIHJldmFtcCB0aGlz
IGNvZGUuIFR3byB0aGluZ3MgdGhhdCBJIHNlZQp0aGF0IGFyZSBtaXNzaW5nIGFyZSAoMSkgc3Vw
cG9ydCBmb3IgcGVyZiBjb25maWcgYW5kICgyKSBhZGRyMmxpbmUKc2hvdWxkIGJlIGNvbmZpZ3Vy
YWJsZSwgeW91IG1heSB3YW50IGxsdm0tYWRkcjJsaW5lLiBBZGRpbmcgUklTQy1WIGlzCm9mIGNv
dXJzZSBpbXBvcnRhbnQgdG9vIDotKQoKVGhhbmtzLApJYW4KCj4gLS0KPiAyLjM0LjEKPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
