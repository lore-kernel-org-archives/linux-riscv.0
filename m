Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94A7D64072
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Nov 2024 18:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Up8SSO2w84Oqv26pmn8bo71zewzx5OIgVNBU01gVEHM=; b=BDTLj6jNGxv+eF
	dWwxQTJ1WGC3r7wXLpSTz3LfsqKIVuz/xbXmImcRq57KzzSKtCYAf11M6HWqko9QWDtU8I4bR5Fnn
	gincRCllnP482/JpLqCIWqXE14Q8vM0oHanTh8keejJjl4jUh9eZTe3ScZtROeJeEg1X3V0q37tE6
	OREia8WpiVc1lEVKv/n/BsVIPj22qistT6OzulazzBmTHArnzgcDZDZ60FRMUyciUnjIDFXsUPDkb
	dkVwBOezs0jMywsiFwfRoTxduvtNsvGzvRkhXWQLfljRLA7WRq8VwAvj4EcLmII4kevJRIv/lm3t2
	SVOmMOnuGLf7tRk/+xzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Tv0-0000000Bcae-3Id1;
	Fri, 08 Nov 2024 18:41:14 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Try-0000000BcEL-3LTl
	for linux-riscv@lists.infradead.org;
	Fri, 08 Nov 2024 18:38:08 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-71e70c32cd7so2060653b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 08 Nov 2024 10:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731091085; x=1731695885; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LyOTZ1GggUHCU1ByvHlta8qwu/Ygb8GuRAPYEnEC6J4=;
        b=NjX18JDOLEdIWmm3tDPXk7TvQAhXgstZv5BREAlXQ5MfcEpBb27KQV/R+uiblK2IKy
         AXplhk4Cv957dAAyswSP7WQtjSqWFpRdldnP0K6yqvlTOqmzJTq3ri/ELrY9awuRIdX6
         lWTOpAezCWxctGvLPG+jUb8TNZsag2VeTkhOCvc8XFors8QgYeRqhfpMDTQBMX1IOOhz
         FXC67J/lEbu1Xhm1J2CV549JRQWzELst+XiWbn7A8N0jRuBWLUHpjbCI0cmpGttrMovA
         V2hE+wQzJ7csXfp9fSUWRUYrSXF9oKBEwOZiKXyoJ0o4/+v8EAMWYdMGdtO8JFhnKhdf
         c6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731091085; x=1731695885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LyOTZ1GggUHCU1ByvHlta8qwu/Ygb8GuRAPYEnEC6J4=;
        b=ENMRK1Wbhf9XQ7VeRyF+byGdbsjEAaqpCFbsBvEWEQht9w0+IcHU5krgG0IINsp17X
         IP7uDVQFHReK4Twg5IENOe+fPGZAAE6Jp4u/cacDi1l3/afJdq4MFHn32lTnpoouwZs5
         Axma3NwWxdxMBpxb+9C2oElweNKvtgLz+K5LltjQ5or4RY+PzfoS2RogmnxlPnmNpZzR
         inZdQXv0xVoxah9Yf/bTman2lGIi9QEM7irylsr9j6cJgPd3FfRTcNi6s01kk/WUfw7C
         xFsTJi5Z/NUziWUoSTy+yPsxlANfdrVSrWhhjGwjJRnF0OpUEDCG74vVKfF52T3DDVj9
         H1+A==
X-Forwarded-Encrypted: i=1; AJvYcCUvqDS7xSKMGTcR2hX5rKbzPmsUWD+3lFefke7kv0AKVqlq0j+8H9q1MS+kcbAga+KlzdHZpGwgX2sX+w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwoNoa6UK7IhmOYWot/Xo/k6gcvXrb+fLx/YYdiEKANOVpRVzxD
	suMJK/IZaAKGox7ebRi+RrlD4nbcFQmo25vqojdeM3Xb5CYoBxjao61M+orec0qWuZYCtPhNrxB
	vqW3eT6V4nt4CRj04wgnu3NQ0boYoLxE3SE/vHw==
X-Google-Smtp-Source: AGHT+IH0s7DgmXQEo7Are9T9yPXkX2O4l0efcpeae4hw3hEDAPmYOoll+kPm/WGYjK7WE6OS8LyvyIpyIKe7l4MkR9g=
X-Received: by 2002:a05:6a00:180f:b0:71e:7af9:2d0f with SMTP id
 d2e1a72fcca58-7241334a2f3mr4882482b3a.18.1731091085491; Fri, 08 Nov 2024
 10:38:05 -0800 (PST)
MIME-Version: 1.0
References: <20241026121758.143259-1-irogers@google.com> <CAP-5=fXf9HtqKZyvfXNbKLTB-dL_Ax5Hd0_Gn1J-y0T1SE9wLQ@mail.gmail.com>
 <78eb729c-7594-460f-9d79-97fb683d8b5e@linaro.org>
In-Reply-To: <78eb729c-7594-460f-9d79-97fb683d8b5e@linaro.org>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Fri, 8 Nov 2024 10:37:54 -0800
Message-ID: <CAHBxVyFXWpczMmWJbpWoLUjQ4nfNC2_h1yZqSd7kSr6N8Rvm5Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] Prefer sysfs/JSON events also when no PMU is provided
To: James Clark <james.clark@linaro.org>
Cc: Ian Rogers <irogers@google.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ben Gainey <ben.gainey@arm.com>, 
	Junhao He <hejunhao3@huawei.com>, linux-riscv@lists.infradead.org, beeman@rivosinc.com, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Ze Gao <zegao2021@gmail.com>, Weilin Wang <weilin.wang@intel.com>, 
	Dominique Martinet <asmadeus@codewreck.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_103807_141006_05C837A5 
X-CRM114-Status: GOOD (  47.78  )
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

T24gRnJpLCBOb3YgOCwgMjAyNCBhdCA0OjE24oCvQU0gSmFtZXMgQ2xhcmsgPGphbWVzLmNsYXJr
QGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4KPgo+IE9uIDA3LzExLzIwMjQgMTg6NTEsIElhbiBSb2dl
cnMgd3JvdGU6Cj4gPiBPbiBTYXQsIE9jdCAyNiwgMjAyNCBhdCA1OjE44oCvQU0gSWFuIFJvZ2Vy
cyA8aXJvZ2Vyc0Bnb29nbGUuY29tPiB3cm90ZToKPiA+Pgo+ID4+IEF0IHRoZSBSSVNDLVYgc3Vt
bWl0IHRoZSB0b3BpYyBvZiBhdm9pZGluZyBldmVudCBkYXRhIGJlaW5nIGluIHRoZQo+ID4+IFJJ
U0MtViBQTVUga2VybmVsIGRyaXZlciBjYW1lIHVwLiBUaGVyZSBpcyBhIHByZWZlcmVuY2UgZm9y
IHN5c2ZzL0pTT04KPiA+PiBldmVudHMgYmVpbmcgdGhlIHByaW9yaXR5IHdoZW4gbm8gUE1VIGlz
IHByb3ZpZGVkIHNvIHRoYXQgbGVnYWN5Cj4gPj4gZXZlbnRzIG1heWJlIHN1cHBvcnRlZCB2aWEg
anNvbi4gT3JpZ2luYWxseSBNYXJrIFJ1dGxhbmQgYWxzbwo+ID4+IGV4cHJlc3NlZCBhdCBMUEMg
MjAyMyB0aGF0IGRvaW5nIHRoaXMgd291bGQgcmVzb2x2ZSBidWdzIG9uIEFSTSBBcHBsZQo+ID4+
IE0/IHByb2Nlc3NvcnMsIGJ1dCBKYW1lcyBDbGFyayBtb3JlIHJlY2VudGx5IHRlc3RlZCB0aGlz
IGFuZCBiZWxpZXZlcwo+ID4+IHRoZSBkcml2ZXIgaXNzdWVzIHRoZXJlIG1heSBub3QgaGF2ZSBl
eGlzdGVkIG9yIGhhdmUgYmVlbiByZXNvbHZlZC4gSW4KPiA+PiBhbnkgY2FzZSwgaXQgaXMgaW5j
b25zaXN0ZW50IHRoYXQgd2l0aCBhIFBNVSBldmVudCBuYW1lcyBhdm9pZCBsZWdhY3kKPiA+PiBl
bmNvZGluZ3MsIGJ1dCB3aGVuIHdpbGRjYXJkaW5nIFBNVXMgKGllIHdpdGhvdXQgYSBQTVUgd2l0
aCB0aGUgZXZlbnQKPiA+PiBuYW1lKSB0aGUgbGVnYWN5IGVuY29kaW5ncyBoYXZlIHByaW9yaXR5
Lgo+ID4+Cj4gPj4gVGhlIHBhdGNoIGRvaW5nIHRoaXMgd29yayB3YXMgcmV2ZXJ0ZWQgaW4gYSB2
Ni4xMCByZWxlYXNlIGNhbmRpZGF0ZQo+ID4+IGFzLCBldmVuIHRob3VnaCB0aGUgcGF0Y2ggd2Fz
IHBvc3RlZCBmb3Igd2Vla3MgYW5kIGhhZCBiZWVuIG9uCj4gPj4gbGludXgtbmV4dCBmb3Igd2Vl
a3Mgd2l0aG91dCBpc3N1ZSwgTGludXMgd2FzIGluIHRoZSBoYWJpdCBvZiB1c2luZwo+ID4+IGV4
cGxpY2l0IGxlZ2FjeSBldmVudHMgd2l0aCB1bnN1cHBvcnRlZCBwcmVjaXNpb24gb3B0aW9ucyBv
biBoaXMKPiA+PiBOZW92ZXJzZS1OMS4gVGhpcyBtYWNoaW5lIGhhcyBTTEMgUE1VIGV2ZW50cyBm
b3IgYnVzIGFuZCBDUFUgY3ljbGVzCj4gPj4gd2hlcmUgQVJNIGRlY2lkZWQgdG8gY2FsbCB0aGUg
ZXZlbnRzIGJ1c19jeWNsZXMgYW5kIGN5Y2xlcywgdGhlIGxhdHRlcgo+ID4+IGJlaW5nIGFsc28g
YSBsZWdhY3kgZXZlbnQgbmFtZS4gQVJNIGhhdmVuJ3QgcmVuYW1lZCB0aGUgY3ljbGVzIGV2ZW50
Cj4gPj4gdG8gYSBtb3JlIGNvbnNpc3RlbnQgY3B1X2N5Y2xlcyBhbmQgYXZvaWRlZCB0aGUgcHJv
YmxlbS4gV2l0aCB0aGVzZQo+ID4+IGNoYW5nZXMgdGhlIHByb2JsZW1hdGljIGV2ZW50IHdpbGwg
bm93IGJlIHNraXBwZWQsIGEgbGFyZ2Ugd2FybmluZwo+ID4+IHByb2R1Y2VkLCBhbmQgcGVyZiBy
ZWNvcmQgd2lsbCBjb250aW51ZSBmb3IgdGhlIG90aGVyIFBNVSBldmVudHMuIFRoaXMKPiA+PiBz
b2x1dGlvbiB3YXMgcHJvcG9zZWQgYnkgQXJuYWxkby4KPiA+Pgo+ID4+IFR3byBtaW5vciBjaGFu
Z2VzIGhhdmUgYmVlbiBhZGRlZCB0byBoZWxwIHdpdGggdGhlIGVycm9yIG1lc3NhZ2UgYW5kCj4g
Pj4gdG8gd29yayBhcm91bmQgaXNzdWVzIG9jY3VycmluZyB3aXRoICJwZXJmIHN0YXQgbWV0cmlj
cyAoc2hhZG93IHN0YXQpCj4gPj4gdGVzdCIuCj4gPj4KPiA+PiBUaGUgcGF0Y2hlcyBoYXZlIG9u
bHkgYmVlbiB0ZXN0ZWQgb24gbXkgeDg2IG5vbi1oeWJyaWQgbGFwdG9wLgo+ID4KPiA+IEhpIEF0
aXNoIGFuZCBKYW1lcywKPiA+Cj4gPiBDb3VsZCBJIGdldCB5b3VyIHRhZ3MgZm9yIHRoaXMgc2Vy
aWVzPwo+ID4KCkhpIElhbiwKVGhhbmtzIGZvciB5b3VyIHBhdGNoZXMuIEl0IGRlZmluaXRlbHkg
aGVscHMgdG8gaGF2ZSBhIGNsZWFuIHNsYXRlCmltcGxlbWVudGF0aW9uCmZvciB0aGUgcGVyZiB0
b29sLiBIb3dldmVyLCBJIGhhdmUgc29tZSBvcGVuIHF1ZXN0aW9ucyBhYm91dCBvdGhlciB1c2Ug
Y2FzZXMKdGhhdCB3ZSBkaXNjdXNzZWQgZHVyaW5nIHRoZSBSVkkgU3VtbWl0LgoKPiA+IFRoZSBw
YXRjaGVzIHdlcmUgb3JpZ2luYWxseSBtb3RpdmF0ZWQgYnkgd2FudGluZyB0byBtYWtlIHRoZSBi
ZWhhdmlvcgo+ID4gb2YgZXZlbnRzIHBhcnNlZCBsaWtlICJjeWNsZXMiIG1hdGNoIHRoYXQgb2Yg
ImNwdS9jeWNsZXMvIiwgdGhlIFBNVSBpcwo+ID4gd2lsZGNhcmRlZCB0byAiY3B1IiBpbiB0aGUg
Zmlyc3QgY2FzZS4gVGhpcyB3YXMgZGl2ZXJnZW50IGJlY2F1c2Ugb2YKPiA+IEFSTSB3ZSBzd2l0
Y2hlZCBmcm9tIHByZWZlcnJpbmcgbGVnYWN5ICh0eXBlID0gUEVSRl9UWVBFX0hBUkRXQVJFLAo+
ID4gY29uZmlnID0gUEVSRl9DT1VOVF9IV19DUFVfQ1lDTEVTKSB0byBzeXNmcy9qc29uICh0eXBl
PTxjb3JlIFBNVSdzCj4gPiB0eXBlPiwgY29uZmlnPTxlbmNvZGluZyBmcm9tIGV2ZW50Pikgd2hl
biBhIFBNVSBuYW1lIHdhcyBnaXZlbi4gVGhpcwo+ID4gYWxpZ25zIHdpdGggUklTQy1WIHdhbnRp
bmcgdG8gdXNlIGpzb24gZW5jb2RpbmdzIHRvIGF2b2lkIGNvbXBsZXhpdHkKPiA+IGluIHRoZSBQ
TVUgZHJpdmVyLgo+ID4KPgo+IEkgY291bGRuJ3QgZmluZCB0aGUgdGhyZWFkLCBidXQgSSByZW1l
bWJlciBmYWlybHkgcmVjZW50bHkgaXQgd2FzCj4gbWVudGlvbmVkIHRoYXQgUklTQy1WIHdvdWxk
IGJlIHN1cHBvcnRpbmcgdGhlIGxlZ2FjeSBldmVudHMgYWZ0ZXIgYWxsLAo+IG1heWJlIGl0IHdh
cyBhIGNvbW1lbnQgZnJvbSBBdGlzaD8gSSdtIG5vdCBzdXJlIGlmIHRoYXQgY2hhbmdlcyB0aGUK
PiByZXF1aXJlbWVudHMgZm9yIHRoaXMgb3Igbm90Pwo+Cj4gSSBzdGlsbCBjYW4ndCByZWFsbHkg
aW1hZ2luZSBob3cgdG9vbGluZyB3b3VsZCB3b3JrIGlmIGV2ZXJ5IHRvb2wgaGFzIHRvCj4gbWFp
bnRhaW4gdGhlIG1hcHBpbmdzIG9mIGJhc2ljIGV2ZW50cyBsaWtlIGluc3RydWN0aW9ucyBhbmQg
YnJhbmNoZXMuCj4gRm9yIGV4YW1wbGUgYWxsIHRoZSBwZXJmX2V2ZW50X29wZW4gdGVzdHMgaW4g
bHRwIHVzZSB0aGUgbGVnYWN5IGV2ZW50cy4KPgoKTm8gaXQgaGFzIG5vdCBjaGFuZ2VkLiBXaGls
ZSB0aGlzIHNlcmllcyBoZWxwcyB0byBhdm9pZCBjbHVua3kgdmVuZG9yCnNwZWNpZmljIGVuY29k
aW5ncwppbiB0aGUgZHJpdmVyIGZvciBwZXJmIHRvb2wsIEkgYW0gc3RpbGwgdW5zdXJlIGhvdyB3
ZSB3aWxsIG1hbmFnZQpvdGhlciBhcHBsaWNhdGlvbnMKKGRpcmVjdGx5IHBhc3NpbmcgbGVnYWN5
IGV2ZW50cyB0aHJvdWdoIHBlcmZfZXZlbnRfb3BlbiBvcgpwZXJmX2V2bGlzdF9fb3Blbikgd2ls
bCB3b3JrLgoKSSBoYXZlIG9ubHkgYW5lY2RvdGFsIGRhdGEgYWJvdXQgZm9sa3MgcmVseWluZyBw
ZXJmIGxlZ2FjeSBldmVudHMKZGlyZWN0bHkgdG8gcHJvZmlsZQp0aGVpciBhcHBsaWNhdGlvbi4g
QWxsIG9mIHRoZW0gdXNlIG1vc3RseSBjeWNsZS9pbnN0cnVjdGlvbiBldmVudHMgdGhvdWdoLgpB
cmUgdGhlcmUgYW55IHVzZXJzIHdobyB1c2Ugb3RoZXIgbGVnYWN5IGV2ZW50cyBkaXJlY3RseSB3
aXRob3V0IHBlcmYgdG9vbCA/CgpJZiBub3QsIHdlIG1heSBoYXZlIG9ubHkgY3ljbGUvaW5zdHJ1
Y3Rpb24gbWFwcGluZyBpbiB0aGUgZHJpdmVyIGFuZApyZWx5IG9uIGpzb24gZm9yIGV2ZXJ5dGhp
bmcgZWxzZS4KVGhlIG90aGVyIHVzZSBjYXNlIGlzIHZpcnR1YWxpemF0aW9uLiBJIGhhdmUgYmVl
biBwbGF5aW5nIHdpdGggdGhlc2UKcGF0Y2hlcyB0byBmaW5kIGEgY2xlYW4gc29sdXRpb24gdG8K
ZW5hYmxlIGFsbCB0aGUgdXNlIGNhc2VzLiBJZiB5b3UgaGF2ZSBhbnkgb3RoZXIgaWRlYXMsIHBs
ZWFzZSBsZXQgbWUga25vdy4KCj4gQW5kIHdvdWxkbid0IHBvcnRpbmcgZXhpc3Rpbmcgc29mdHdh
cmUgdG8gUklTQy1WIHdvdWxkIGJlIGFuIGlzc3VlIGlmIGl0Cj4gZG9lc24ndCBiZWhhdmUgaW4g
YSBzaW1pbGFyIHdheSB0byB3aGF0J3MgdGhlcmUgYWxyZWFkeT8KPgo+ID4gSmFtZXMsIGNvdWxk
IHlvdSBzaG93IHRoZSBuZW92ZXJzZSB3aXRoIHRoZSBjbW4gUE1VIGJlaGF2aW9yIGZvciBwZXJm
Cj4gPiByZWNvcmQgb2YgImN5Y2xlczpwcCIgZHVlIHRvIHNlbnNpdGl2aXRpZXMgdGhlcmUuCj4g
Pgo+Cj4gWWVwIEkgY2FuIGNoZWNrIHRoaXMgb24gTW9uZGF5Lgo+Cj4gPiBUaGFua3MsCj4gPiBJ
YW4KPiA+Cj4KPgo+ID4KPiA+Cj4gPgo+ID4+IElhbiBSb2dlcnMgKDQpOgo+ID4+ICAgIHBlcmYg
ZXZzZWw6IEFkZCBwbXVfbmFtZSBoZWxwZXIKPiA+PiAgICBwZXJmIHN0YXQ6IEZpeCBmaW5kX3N0
YXQgZm9yIG1peGVkIGxlZ2FjeS9ub24tbGVnYWN5IGV2ZW50cwo+ID4+ICAgIHBlcmYgcmVjb3Jk
OiBTa2lwIGRvbid0IGZhaWwgZm9yIGV2ZW50cyB0aGF0IGRvbid0IG9wZW4KPiA+PiAgICBwZXJm
IHBhcnNlLWV2ZW50czogUmVhcHBseSAiUHJlZmVyIHN5c2ZzL0pTT04gaGFyZHdhcmUgZXZlbnRz
IG92ZXIKPiA+PiAgICAgIGxlZ2FjeSIKPiA+Pgo+ID4+ICAgdG9vbHMvcGVyZi9idWlsdGluLXJl
Y29yZC5jICAgIHwgMjIgKysrKysrKy0tLQo+ID4+ICAgdG9vbHMvcGVyZi91dGlsL2V2c2VsLmMg
ICAgICAgIHwgMTAgKysrKysKPiA+PiAgIHRvb2xzL3BlcmYvdXRpbC9ldnNlbC5oICAgICAgICB8
ICAxICsKPiA+PiAgIHRvb2xzL3BlcmYvdXRpbC9wYXJzZS1ldmVudHMuYyB8IDI2ICsrKysrKysr
Ky0tLQo+ID4+ICAgdG9vbHMvcGVyZi91dGlsL3BhcnNlLWV2ZW50cy5sIHwgNzYgKysrKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0tLS0tLQo+ID4+ICAgdG9vbHMvcGVyZi91dGlsL3BhcnNlLWV2
ZW50cy55IHwgNjAgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCj4gPj4gICB0b29scy9wZXJm
L3V0aWwvcG11cy5jICAgICAgICAgfCAyMCArKysrKysrLS0KPiA+PiAgIHRvb2xzL3BlcmYvdXRp
bC9zdGF0LXNoYWRvdy5jICB8ICAzICstCj4gPj4gICA4IGZpbGVzIGNoYW5nZWQsIDE0NSBpbnNl
cnRpb25zKCspLCA3MyBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+IC0tCj4gPj4gMi40Ny4wLjE2My5n
MTIyNmY2ZDhmYS1nb29nCj4gPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
