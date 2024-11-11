Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A97D41D41
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 00:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mFoedTWYGMvKu3rCrM9OpoAI39HFiT9/xMdmVLy4+30=; b=ktUUnf9uNrTJ49
	U5xNzHGcckCkQKL4j3kvuYm8fOgBPQ8V1GmJLtvkHdBTYwhMnygD4I9GPJpePJlLG1MyFhUueYEn1
	BdvI86E4og7Q/n4+KQAUKcIroCHgD6DHGrKIR1IKjV3zCYlgcPUhN+nBjunToiuSZcYPWFCZErjeI
	2cnHukC6R4JegR4/p1nzB9FxlBq6i23a7JbhWx+2FifnGhm+1PImPanjcKUsVPYSNQD0yPY6M/TNl
	eXw/n0TRYKNkpJwHNbm7XLu8R/rBO49TGyIO+ALkGC+8PyMmhy9XT8dU3+IVdTo0lnU63ts+jnKI2
	VsbOB5CaxT5UXSXKRAIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAf2Y-00000001m6C-1GxW;
	Tue, 12 Nov 2024 00:45:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAdzq-00000001dWH-1TlH
	for linux-riscv@bombadil.infradead.org;
	Mon, 11 Nov 2024 23:39:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=S8yRTg2gxlhT6ZNwbfYt7zd1cKOPlVMlYaS9QEirCAw=; b=KKInzcid/ajQo9BX6V2uICZ+DQ
	41w6b+8mn1ZgxJzIchcpBJ+suND77h0cPt1RVG5sVNgVe86NJgiBTtw0/IRzxiuRBk/cxdaBiUNDL
	05zP9VcmmUbflXpGUiirwmxJyK6oXqMOjto3UJB9nb8/RN1TayO1FeHxt92nL1+k0uPh6Ut9ORBLh
	IT4ui2Ecn+bU0JeiyXB89tfNyAtoG/ilOHh0kdAZMB7Et6VoTjQXpiAwM24FWkkia9yzoS2IQwk3d
	IJiAI2dw5iTBWWXvANl7Dau6DvQgm/vJfn7dpUymSOJ+xSHq1cJFbfoV/HAJ6eKPbs79xdNgfAgsq
	xl+sAYhw==;
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAdzn-0000000CxUk-0J38
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 23:39:01 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-71e953f4e7cso3851024b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 Nov 2024 15:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731368335; x=1731973135; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8yRTg2gxlhT6ZNwbfYt7zd1cKOPlVMlYaS9QEirCAw=;
        b=yCMWUuc5UI3cLiaaE1zhYhW9/0upc5JqmUhos7kndGaFac0mNZMnh1oNfgVDFz1WBp
         1C/qQpSmlKs8YwGV56qEhPj2nYHeWXnRlEBFZiUxRjIXRBQggnPgnYmzwQYMlWO+5Zt5
         EvUQrkod2k5V/xSL4Vp92eSzYCS4TruNHipMcOhRxvrHAWD97+tXni191fWEGkiuWqcv
         aDZYU0y3CZFprSVw3+Wg8y5Iry9e/2esHMOMOCzPUJ6zvpp//68wTnpMBFo5iZvSWZ5o
         goUbffD+S86Ex+hZslwkm/qRChOzfcJjsS+xJR/aIlCtVZgyY8qxFB7AIA8ERFYNuTXS
         DqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731368335; x=1731973135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8yRTg2gxlhT6ZNwbfYt7zd1cKOPlVMlYaS9QEirCAw=;
        b=ZN0H0BNYEzpfK0VlK/AajSeEXHPMlhSNlIm6Uzf96xy7oSGdVa31rjIS5uj6jwgR4+
         qkIV8xO84DUxrGt7QbfukO6wwrsEBOPvm4MNaiq5qdu5AeKpE7CLMuYQLw5fGyQC30Mn
         o5qOw/qYeVEFeRN5puvnITpULWc51HloH9s9Q7blUHPaSdpL0Ib/ZWTmk+WcyNqZQS2w
         RnB95VsV0XTW96913fdX0jn+5d6R+sr3BpY07gVCjctpquhhCPnjINpIusfRea6iwMXt
         qtZUK7dFVVmBlE9+kNANdiGlqiK3MQ68o8b5/A/t78pkxnjHMkqEXaaNnob/G3VZevyD
         ikug==
X-Forwarded-Encrypted: i=1; AJvYcCUS0lgy1m4/GgXFzUeA9rTk+HEIZo4ie3ZMH57QOk12qaonimCXs8Xo0M/rIdxW1tVqogDawD98H3AYOA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCILWSKaTvhiDoJVaTZzallWVjSoq6nsSVaKwgLFWoTURkQ/tF
	udisJJhac041+rCAAlKIfq74qlMgbe2eGmiMuXpYL5ng1aiGkwej39oOytvK6EiJcipBygLfaty
	6LJBv26el6TcFFg+kiWE+hjRgVZ31Y5nTjMtdww==
X-Google-Smtp-Source: AGHT+IE7Fl9EIALn9TNMMttpcoLk+6DrI6/tnerMLnKoCya+sFZ3cL8WdxplP2tFW3MXI3WJLzJVeJrxjnhCy963cl4=
X-Received: by 2002:a05:6a00:3925:b0:71d:f15e:d026 with SMTP id
 d2e1a72fcca58-7241326dd7emr19203123b3a.3.1731368335086; Mon, 11 Nov 2024
 15:38:55 -0800 (PST)
MIME-Version: 1.0
References: <20241026121758.143259-1-irogers@google.com> <CAP-5=fXf9HtqKZyvfXNbKLTB-dL_Ax5Hd0_Gn1J-y0T1SE9wLQ@mail.gmail.com>
 <78eb729c-7594-460f-9d79-97fb683d8b5e@linaro.org> <CAHBxVyFXWpczMmWJbpWoLUjQ4nfNC2_h1yZqSd7kSr6N8Rvm5Q@mail.gmail.com>
 <d9bfd75a-003a-4f65-abba-b8bcaad13682@linaro.org> <CAP-5=fUHjxL5QbsyQQU-3EYiVhiO6wt=F5MfSfDcAffKP7WWAg@mail.gmail.com>
In-Reply-To: <CAP-5=fUHjxL5QbsyQQU-3EYiVhiO6wt=F5MfSfDcAffKP7WWAg@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 11 Nov 2024 15:38:44 -0800
Message-ID: <CAHBxVyFVsKy+PKvyffOfOw6fU7BGa9+cm6d3uYzSG-8GY2jhxA@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] Prefer sysfs/JSON events also when no PMU is provided
To: Ian Rogers <irogers@google.com>
Cc: James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ben Gainey <ben.gainey@arm.com>, 
	Junhao He <hejunhao3@huawei.com>, linux-riscv@lists.infradead.org, beeman@rivosinc.com, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Ze Gao <zegao2021@gmail.com>, Weilin Wang <weilin.wang@intel.com>, 
	Dominique Martinet <asmadeus@codewreck.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_233859_476022_954F19AE 
X-CRM114-Status: GOOD (  59.14  )
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

T24gTW9uLCBOb3YgMTEsIDIwMjQgYXQgOToxOeKAr0FNIElhbiBSb2dlcnMgPGlyb2dlcnNAZ29v
Z2xlLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIE5vdiAxMSwgMjAyNCBhdCAyOjQ14oCvQU0gSmFt
ZXMgQ2xhcmsgPGphbWVzLmNsYXJrQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4KPiA+Cj4gPgo+ID4g
T24gMDgvMTEvMjAyNCA2OjM3IHBtLCBBdGlzaCBLdW1hciBQYXRyYSB3cm90ZToKPiA+ID4gT24g
RnJpLCBOb3YgOCwgMjAyNCBhdCA0OjE24oCvQU0gSmFtZXMgQ2xhcmsgPGphbWVzLmNsYXJrQGxp
bmFyby5vcmc+IHdyb3RlOgo+ID4gPj4KPiA+ID4+Cj4gPiA+Pgo+ID4gPj4gT24gMDcvMTEvMjAy
NCAxODo1MSwgSWFuIFJvZ2VycyB3cm90ZToKPiA+ID4+PiBPbiBTYXQsIE9jdCAyNiwgMjAyNCBh
dCA1OjE44oCvQU0gSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPiB3cm90ZToKPiA+ID4+
Pj4KPiA+ID4+Pj4gQXQgdGhlIFJJU0MtViBzdW1taXQgdGhlIHRvcGljIG9mIGF2b2lkaW5nIGV2
ZW50IGRhdGEgYmVpbmcgaW4gdGhlCj4gPiA+Pj4+IFJJU0MtViBQTVUga2VybmVsIGRyaXZlciBj
YW1lIHVwLiBUaGVyZSBpcyBhIHByZWZlcmVuY2UgZm9yIHN5c2ZzL0pTT04KPiA+ID4+Pj4gZXZl
bnRzIGJlaW5nIHRoZSBwcmlvcml0eSB3aGVuIG5vIFBNVSBpcyBwcm92aWRlZCBzbyB0aGF0IGxl
Z2FjeQo+ID4gPj4+PiBldmVudHMgbWF5YmUgc3VwcG9ydGVkIHZpYSBqc29uLiBPcmlnaW5hbGx5
IE1hcmsgUnV0bGFuZCBhbHNvCj4gPiA+Pj4+IGV4cHJlc3NlZCBhdCBMUEMgMjAyMyB0aGF0IGRv
aW5nIHRoaXMgd291bGQgcmVzb2x2ZSBidWdzIG9uIEFSTSBBcHBsZQo+ID4gPj4+PiBNPyBwcm9j
ZXNzb3JzLCBidXQgSmFtZXMgQ2xhcmsgbW9yZSByZWNlbnRseSB0ZXN0ZWQgdGhpcyBhbmQgYmVs
aWV2ZXMKPiA+ID4+Pj4gdGhlIGRyaXZlciBpc3N1ZXMgdGhlcmUgbWF5IG5vdCBoYXZlIGV4aXN0
ZWQgb3IgaGF2ZSBiZWVuIHJlc29sdmVkLiBJbgo+ID4gPj4+PiBhbnkgY2FzZSwgaXQgaXMgaW5j
b25zaXN0ZW50IHRoYXQgd2l0aCBhIFBNVSBldmVudCBuYW1lcyBhdm9pZCBsZWdhY3kKPiA+ID4+
Pj4gZW5jb2RpbmdzLCBidXQgd2hlbiB3aWxkY2FyZGluZyBQTVVzIChpZSB3aXRob3V0IGEgUE1V
IHdpdGggdGhlIGV2ZW50Cj4gPiA+Pj4+IG5hbWUpIHRoZSBsZWdhY3kgZW5jb2RpbmdzIGhhdmUg
cHJpb3JpdHkuCj4gPiA+Pj4+Cj4gPiA+Pj4+IFRoZSBwYXRjaCBkb2luZyB0aGlzIHdvcmsgd2Fz
IHJldmVydGVkIGluIGEgdjYuMTAgcmVsZWFzZSBjYW5kaWRhdGUKPiA+ID4+Pj4gYXMsIGV2ZW4g
dGhvdWdoIHRoZSBwYXRjaCB3YXMgcG9zdGVkIGZvciB3ZWVrcyBhbmQgaGFkIGJlZW4gb24KPiA+
ID4+Pj4gbGludXgtbmV4dCBmb3Igd2Vla3Mgd2l0aG91dCBpc3N1ZSwgTGludXMgd2FzIGluIHRo
ZSBoYWJpdCBvZiB1c2luZwo+ID4gPj4+PiBleHBsaWNpdCBsZWdhY3kgZXZlbnRzIHdpdGggdW5z
dXBwb3J0ZWQgcHJlY2lzaW9uIG9wdGlvbnMgb24gaGlzCj4gPiA+Pj4+IE5lb3ZlcnNlLU4xLiBU
aGlzIG1hY2hpbmUgaGFzIFNMQyBQTVUgZXZlbnRzIGZvciBidXMgYW5kIENQVSBjeWNsZXMKPiA+
ID4+Pj4gd2hlcmUgQVJNIGRlY2lkZWQgdG8gY2FsbCB0aGUgZXZlbnRzIGJ1c19jeWNsZXMgYW5k
IGN5Y2xlcywgdGhlIGxhdHRlcgo+ID4gPj4+PiBiZWluZyBhbHNvIGEgbGVnYWN5IGV2ZW50IG5h
bWUuIEFSTSBoYXZlbid0IHJlbmFtZWQgdGhlIGN5Y2xlcyBldmVudAo+ID4gPj4+PiB0byBhIG1v
cmUgY29uc2lzdGVudCBjcHVfY3ljbGVzIGFuZCBhdm9pZGVkIHRoZSBwcm9ibGVtLiBXaXRoIHRo
ZXNlCj4gPiA+Pj4+IGNoYW5nZXMgdGhlIHByb2JsZW1hdGljIGV2ZW50IHdpbGwgbm93IGJlIHNr
aXBwZWQsIGEgbGFyZ2Ugd2FybmluZwo+ID4gPj4+PiBwcm9kdWNlZCwgYW5kIHBlcmYgcmVjb3Jk
IHdpbGwgY29udGludWUgZm9yIHRoZSBvdGhlciBQTVUgZXZlbnRzLiBUaGlzCj4gPiA+Pj4+IHNv
bHV0aW9uIHdhcyBwcm9wb3NlZCBieSBBcm5hbGRvLgo+ID4gPj4+Pgo+ID4gPj4+PiBUd28gbWlu
b3IgY2hhbmdlcyBoYXZlIGJlZW4gYWRkZWQgdG8gaGVscCB3aXRoIHRoZSBlcnJvciBtZXNzYWdl
IGFuZAo+ID4gPj4+PiB0byB3b3JrIGFyb3VuZCBpc3N1ZXMgb2NjdXJyaW5nIHdpdGggInBlcmYg
c3RhdCBtZXRyaWNzIChzaGFkb3cgc3RhdCkKPiA+ID4+Pj4gdGVzdCIuCj4gPiA+Pj4+Cj4gPiA+
Pj4+IFRoZSBwYXRjaGVzIGhhdmUgb25seSBiZWVuIHRlc3RlZCBvbiBteSB4ODYgbm9uLWh5YnJp
ZCBsYXB0b3AuCj4gPiA+Pj4KPiA+ID4+PiBIaSBBdGlzaCBhbmQgSmFtZXMsCj4gPiA+Pj4KPiA+
ID4+PiBDb3VsZCBJIGdldCB5b3VyIHRhZ3MgZm9yIHRoaXMgc2VyaWVzPwo+ID4gPj4+Cj4gPiA+
Cj4gPiA+IEhpIElhbiwKPiA+ID4gVGhhbmtzIGZvciB5b3VyIHBhdGNoZXMuIEl0IGRlZmluaXRl
bHkgaGVscHMgdG8gaGF2ZSBhIGNsZWFuIHNsYXRlCj4gPiA+IGltcGxlbWVudGF0aW9uCj4gPiA+
IGZvciB0aGUgcGVyZiB0b29sLiBIb3dldmVyLCBJIGhhdmUgc29tZSBvcGVuIHF1ZXN0aW9ucyBh
Ym91dCBvdGhlciB1c2UgY2FzZXMKPiA+ID4gdGhhdCB3ZSBkaXNjdXNzZWQgZHVyaW5nIHRoZSBS
VkkgU3VtbWl0Lgo+ID4gPgo+ID4gPj4+IFRoZSBwYXRjaGVzIHdlcmUgb3JpZ2luYWxseSBtb3Rp
dmF0ZWQgYnkgd2FudGluZyB0byBtYWtlIHRoZSBiZWhhdmlvcgo+ID4gPj4+IG9mIGV2ZW50cyBw
YXJzZWQgbGlrZSAiY3ljbGVzIiBtYXRjaCB0aGF0IG9mICJjcHUvY3ljbGVzLyIsIHRoZSBQTVUg
aXMKPiA+ID4+PiB3aWxkY2FyZGVkIHRvICJjcHUiIGluIHRoZSBmaXJzdCBjYXNlLiBUaGlzIHdh
cyBkaXZlcmdlbnQgYmVjYXVzZSBvZgo+ID4gPj4+IEFSTSB3ZSBzd2l0Y2hlZCBmcm9tIHByZWZl
cnJpbmcgbGVnYWN5ICh0eXBlID0gUEVSRl9UWVBFX0hBUkRXQVJFLAo+ID4gPj4+IGNvbmZpZyA9
IFBFUkZfQ09VTlRfSFdfQ1BVX0NZQ0xFUykgdG8gc3lzZnMvanNvbiAodHlwZT08Y29yZSBQTVUn
cwo+ID4gPj4+IHR5cGU+LCBjb25maWc9PGVuY29kaW5nIGZyb20gZXZlbnQ+KSB3aGVuIGEgUE1V
IG5hbWUgd2FzIGdpdmVuLiBUaGlzCj4gPiA+Pj4gYWxpZ25zIHdpdGggUklTQy1WIHdhbnRpbmcg
dG8gdXNlIGpzb24gZW5jb2RpbmdzIHRvIGF2b2lkIGNvbXBsZXhpdHkKPiA+ID4+PiBpbiB0aGUg
UE1VIGRyaXZlci4KPiA+ID4+Pgo+ID4gPj4KPiA+ID4+IEkgY291bGRuJ3QgZmluZCB0aGUgdGhy
ZWFkLCBidXQgSSByZW1lbWJlciBmYWlybHkgcmVjZW50bHkgaXQgd2FzCj4gPiA+PiBtZW50aW9u
ZWQgdGhhdCBSSVNDLVYgd291bGQgYmUgc3VwcG9ydGluZyB0aGUgbGVnYWN5IGV2ZW50cyBhZnRl
ciBhbGwsCj4gPiA+PiBtYXliZSBpdCB3YXMgYSBjb21tZW50IGZyb20gQXRpc2g/IEknbSBub3Qg
c3VyZSBpZiB0aGF0IGNoYW5nZXMgdGhlCj4gPiA+PiByZXF1aXJlbWVudHMgZm9yIHRoaXMgb3Ig
bm90Pwo+ID4gPj4KPiA+ID4+IEkgc3RpbGwgY2FuJ3QgcmVhbGx5IGltYWdpbmUgaG93IHRvb2xp
bmcgd291bGQgd29yayBpZiBldmVyeSB0b29sIGhhcyB0bwo+ID4gPj4gbWFpbnRhaW4gdGhlIG1h
cHBpbmdzIG9mIGJhc2ljIGV2ZW50cyBsaWtlIGluc3RydWN0aW9ucyBhbmQgYnJhbmNoZXMuCj4g
PiA+PiBGb3IgZXhhbXBsZSBhbGwgdGhlIHBlcmZfZXZlbnRfb3BlbiB0ZXN0cyBpbiBsdHAgdXNl
IHRoZSBsZWdhY3kgZXZlbnRzLgo+ID4gPj4KPiA+ID4KPiA+ID4gTm8gaXQgaGFzIG5vdCBjaGFu
Z2VkLiBXaGlsZSB0aGlzIHNlcmllcyBoZWxwcyB0byBhdm9pZCBjbHVua3kgdmVuZG9yCj4gPiA+
IHNwZWNpZmljIGVuY29kaW5ncwo+ID4gPiBpbiB0aGUgZHJpdmVyIGZvciBwZXJmIHRvb2wsIEkg
YW0gc3RpbGwgdW5zdXJlIGhvdyB3ZSB3aWxsIG1hbmFnZQo+ID4gPiBvdGhlciBhcHBsaWNhdGlv
bnMKPiA+ID4gKGRpcmVjdGx5IHBhc3NpbmcgbGVnYWN5IGV2ZW50cyB0aHJvdWdoIHBlcmZfZXZl
bnRfb3BlbiBvcgo+ID4gPiBwZXJmX2V2bGlzdF9fb3Blbikgd2lsbCB3b3JrLgo+ID4gPgo+ID4g
PiBJIGhhdmUgb25seSBhbmVjZG90YWwgZGF0YSBhYm91dCBmb2xrcyByZWx5aW5nIHBlcmYgbGVn
YWN5IGV2ZW50cwo+ID4gPiBkaXJlY3RseSB0byBwcm9maWxlCj4gPiA+IHRoZWlyIGFwcGxpY2F0
aW9uLiBBbGwgb2YgdGhlbSB1c2UgbW9zdGx5IGN5Y2xlL2luc3RydWN0aW9uIGV2ZW50cyB0aG91
Z2guCj4gPiA+IEFyZSB0aGVyZSBhbnkgdXNlcnMgd2hvIHVzZSBvdGhlciBsZWdhY3kgZXZlbnRz
IGRpcmVjdGx5IHdpdGhvdXQgcGVyZiB0b29sID8KPiA+ID4KPiA+ID4gSWYgbm90LCB3ZSBtYXkg
aGF2ZSBvbmx5IGN5Y2xlL2luc3RydWN0aW9uIG1hcHBpbmcgaW4gdGhlIGRyaXZlciBhbmQKPiA+
ID4gcmVseSBvbiBqc29uIGZvciBldmVyeXRoaW5nIGVsc2UuCj4gPiA+IFRoZSBvdGhlciB1c2Ug
Y2FzZSBpcyB2aXJ0dWFsaXphdGlvbi4gSSBoYXZlIGJlZW4gcGxheWluZyB3aXRoIHRoZXNlCj4g
PiA+IHBhdGNoZXMgdG8gZmluZCBhIGNsZWFuIHNvbHV0aW9uIHRvCj4gPiA+IGVuYWJsZSBhbGwg
dGhlIHVzZSBjYXNlcy4gSWYgeW91IGhhdmUgYW55IG90aGVyIGlkZWFzLCBwbGVhc2UgbGV0IG1l
IGtub3cuCj4gPiA+Cj4gPgo+ID4gWWVhaCBJIHdvdWxkIGV4cGVjdCBpdCdzIG1vc3RseSBjeWNs
ZXMgYW5kIGluc3RydWN0aW9ucy4gSSBzZWFyY2hlZCBhCj4gPiBiaXQgZm9yIFBFUkZfQ09VTlRf
SFdfQlJBTkNIX01JU1NFUyBhbmQgb25seSBmb3VuZCB0b29sL2RldmVsb3BlciB0eXBlCj4gPiB1
c2FnZXMsIHdoaWNoIEkgc3VwcG9zZSB3ZSBjb3VsZCBleHBlY3QgdG8gaGF2ZSB0byBoYW5kbGUg
dGhlIG1hcHBpbmdzCj4gPiBsaWtlIHBlcmYuIEFsdGhvdWdoIGl0J3Mgbm90IHRoZSBlYXNpZXN0
IHRoaW5nIHRvIHNlYXJjaCBmb3IgYW5kCj4gPiBvYnZpb3VzbHkgdGhhdCBvbmx5IGluY2x1ZGVz
IG9wZW4gc291cmNlLgo+ID4KPiA+IFVzYWdlcyBkbyBleGlzdCB0aG91Z2gsIHRoZXJlIGFyZSBw
ZW9wbGUgcG9zdGluZyBvbiBzdGFjayBvdmVyZmxvdyB1c2luZwo+ID4gaXQsIGFuZCBvdGhlciB2
YXJpb3VzIGJ1ZyB0cmFja2VyIGxpc3RpbmdzLiBTbyB5b3Ugd291bGQgZXhwZWN0IHRob3NlCj4g
PiBzYW1lIHVzZXJzIHRvIGhhdmUgdG8gdXNlIHJhdyBldmVudCBjb2RlcyBhbmQgc29tZSBzd2l0
Y2ggc3RhdGVtZW50IHRvCj4gPiBwaWNrIHRoZSByaWdodCBvbmUgZm9yIHRoZWlyIGhhcmR3YXJl
LCBvciB1c2UgUGVyZi4KPgo+IEkgZG9uJ3QgaGF2ZSBhbnkgbWFnaWMgdG8gc29sdmUgdGhpcy4g
TXkgdGhvdWdodHM6Cj4KPiAxKSBJIHRob3VnaHQgbGVnYWN5IGV2ZW50cyB3ZXJlIGp1c3QgZ29p
bmcgdG8gaGFuZyBhcm91bmQgZm9yZXZlciwKPiBhbHRob3VnaCB0aGUgbmFtZSBoaW50aW5nIHRo
ZXknZCBraW5kIG9mIGJlZW4gZGVwcmVjYXRlZC4gQXQgTFBDICcyMwo+IEF0aXNoIGFuZCBNYXJr
IFJ1dGxhbmQgb3JpZ2luYWxseSBhc2tlZCBmb3IgdGhlIHN5c2ZzL2pzb24gdG8gYmUgdGhlCj4g
cHJlZmVyZW5jZS4gSSB0aG91Z2h0IEthbiB3YXMgZ29pbmcgdG8gcHVzaCBiYWNrIGdpdmVuIHRo
ZSB1cGhlYXZhbCwKPiBlc3BlY2lhbGx5IHVwZGF0aW5nIGV2ZXJ5IHRlc3QgZXhwZWN0YXRpb24u
IEl0IHdlbnQgdGhyb3VnaCBidXQgd2UncmUKPiBpbiB0aGlzIHdlaXJkIHN0YXRlIHdoZXJlIHdp
bGRjYXJkIGV2ZW50cyBhcmUgZW5jb2RlZCB1c2luZyBsZWdhY3kgYW5kCj4gUE1VIHNwZWNpZnlp
bmcgZXZlbnRzIGFyZW4ndC4gV2hhdCB0aGlzIHNlcmllcyBob3BlcyB0byBzb2x2ZS4KPgo+IDIp
IEkgdGhpbmsgaXQgaXMgaW1wb3J0YW50IHRoYXQgcGVyZiB0b29sIGJlIGEgcmVmZXJlbmNlCj4g
aW1wbGVtZW50YXRpb24gd2hlcmUgb3RoZXJzIGNhbiBsb29rIChzdHJhY2UsIGV0Yy4pIHRvIGJh
c2UgdGhlaXIKPiBpbXBsZW1lbnRhdGlvbi4gTW92aW5nIHBlcmYgdG8gc3lzZnMvanNvbiBpcyAx
IHN0ZXAgY2xvc2VyIHRvIGxlZ2FjeQo+IGV2ZW50IGRlcHJlY2F0aW9uLiBQbGVhc2UgeWVsbCBp
ZiBkZXByZWNhdGlvbiBpc24ndCB3aGF0IGlzIHdhbnRlZCBhcwo+IHBlcnNvbmFsbHkgb3RoZXIg
dGhhbiBjbGVhbmxpbmVzcyBJIGRvbid0IG1pbmQuIElmIHdlIGRvIGRlY2lkZSBub3QgdG8KPiBo
YXZlIHN5c2ZzL2pzb24gYmUgdGhlIHByaW9yaXR5IHRoZW4gSSB0aGluayBpdCBzZW5zaWJsZSB0
byByZXZlcnQgdGhlCj4gY2hhbmdlcyBtYWtpbmcgaXQgdGhlIHByaW9yaXR5IGZvciBldmVudHMg
dGhhdCBzcGVjaWZ5IGEgUE1VLiBJJ2QgbGlrZQo+IHNvbWUgbGV2ZWwgb2YgY29uc2lzdGVuY3ku
Cj4KPiAzKSBJJ2QgbGlrZSBldmVudCBwYXJzaW5nIHRvIGJlIGEgbGlicmFyeSB0aGF0IGlzIGFz
IGVhc3kgdG8gbGluawo+IGFnYWluc3QgYXMgbGliYnBmIChpLmUuIG5vdCBhIHZpcmFsIGxpY2Vu
c2UpLiBFdmVudCBwYXJzaW5nIGlzIHJlYWxseQo+IGp1c3QgbWFwcGluZyBhbiBldmVudCBuYW1l
IHRvIDEgb3IgbW9yZSBwZXJmX2V2ZW50X2F0dHIuIFRoZSBQTVUKPiBhYnN0cmFjdGlvbiBpcyB0
aWVkIGludG8gdGhlIGV2ZW50IHBhcnNpbmcsIGJ1dCB0aGlzIGhhcyBvbmx5IGJlZW4KPiBtb3Jl
IHRydWUgcmVjZW50bHkuIFRoZSBldnNlbC9ldmxpc3QgaXMgdGllZCBpbnRvIGV2ZW50IHBhcnNp
bmcgYnV0Cj4gdGhhdCBmZWVscyBzZXBhcmFibGUuIEFzIG1vc3QganNvbiBpc24ndCBkaXN0cmli
dXRlZCB1bmRlciBhIHZpcmFsCj4gbGljZW5zZSB0aGlzIGZlZWxzIGFjaGlldmFibGUsIHRoZW4g
SSBzdXNwZWN0IG1vc3QgdG9vbHMgY2FuIHVzZSB0aGlzCj4gbGlicmFyeSByYXRoZXIgdGhhbiBo
YXZlIHRvIHJlaW52ZW50IGEgd2hlZWwuCgpUaGF0IHdvdWxkIGJlIHRoZSBpZGVhbCBzb2x1dGlv
biBJTUhPIGZvciBhbnkgb3RoZXIgdG9vbHMuCgpGb3IgdmlydHVhbGl6YXRpb24sIHRoZSBndWVz
dCBPUyB3b3VsZCBwYXNzIHRoZSBldmVudCBhdHRyaWJ1dGUgYXMgUkFXCmlmIHRoZSBtYXRjaGlu
ZyBqc29uCmZpbGUgaXMgcHJlc2VudC4gVGhlIGh5cGVydmlzb3Igd291bGQgc2ltcGx5IHByb2dy
YW0gdGhhdCBpbiBtaHBtZXZlbnQgQ1NSLgoKSW4gYWJzZW5jZSBvZiB0aGUganNvbiBmaWxlLCBn
dWVzdCBPUyB3b3VsZCBwYXNzIHRoZSBsZWdhY3kgZXZlbnQKZW5jb2Rpbmcgd2hpY2ggbXVzdCBi
ZQptYXBwZWQgdG8gYSB2ZW5kb3Igc3BlY2lmaWMgZW5jb2RpbmcgcHJlc2VudCBpbiB0aGUgZHJp
dmVyLiBIb3BlZnVsbHksCnRoaXMgY2FuIGJlIHJlbW92ZWQKaW4gdGhlIGZ1dHVyZSBvbmNlIGxl
Z2FjeSBldmVudHMgYXJlIGRlcHJlY2F0ZWQuICBUaG91Z2h0cyA/Cgo+Cj4gU3RpbGwgbG9va2lu
ZyBmb3IgdGFncyA6LSkKPgoKRG9uZS4gU29ycnkgZm9yIHRoZSBkZWxheS4gSnVzdCB3YW50ZWQg
dG8gZW5zdXJlIHRoYXQgdGhpcyBzb2x1dGlvbnMKd29ya3MgcHJvcGVybHkKZm9yIGFsbCB0aGUg
YWJvdmUgY2FzZXMgSSBtZW50aW9uZWQuCgo+IFRoYW5rcywKPiBJYW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
