Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C66DC531FA
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 08:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AkBCIvLy6ZVjuR2XsdEz05GR3GAXJQpkBILjE2OBe2g=; b=JoTgc98Y1bSDZ3
	miMNddAj3tQxKkq8p94EcFTguO0LPcyZboWPXlB5rKYu4L++BRr5nUOKPv02Namv7gcPmAhd17fvT
	GB7kJbLoKKPt4DwTZg44jB/ya9Dbd9VaHRChopzBhtkUK/rjh5IXDaNBz8k1AQQl0R1Rt9gAh4sh5
	Ym18NnvAq5TZd3WLgsQqrNQ3Qp5zGwA2YQAxlMP/DKKZ8lk/t+JgNDO4vGNn4t7pt3Drwdd44p8yq
	ph69Gw+CLYz8fzvedElJtW8LSEASWeRRAwAEdtb9jxWRlIRxqP2PIuJn9GZFey7eIW9kmoD/kkhUY
	QK1kvyTbkxxROKZBe4gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBAF-0000000Fo1d-0flN;
	Fri, 24 Jul 2026 08:21:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBAC-0000000Fo0u-2KfY
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 08:21:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784881306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R6w2iaDqIpFP8RzG62DRjCZ0o1bpE8b3mkLq3700xaI=;
	b=Swwy5Pt14CIf36VnHMwiGaVka0QGot9n+4/FbwFwf+iM6PnycCYJPknACQemhbEOUZeume
	2KD6XiGK7OuATAlHuyh6OH0KsJnQ0qeDBAs1hWcD1AF9T//Uh2g8mjHqPGrdbUwOjFtEbl
	iHAY7ad2cTtFDBGDQwDuCVkoYR835cg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-ApEvPVOgMI2yOZQNCRvJ2g-1; Fri, 24 Jul 2026 04:21:44 -0400
X-MC-Unique: ApEvPVOgMI2yOZQNCRvJ2g-1
X-Mimecast-MFC-AGG-ID: ApEvPVOgMI2yOZQNCRvJ2g_1784881304
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a23afcbso1384391cf.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 01:21:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784881304; x=1785486104;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R6w2iaDqIpFP8RzG62DRjCZ0o1bpE8b3mkLq3700xaI=;
        b=lvdmFiw5dkxHj7gXnpXuGcIigvPxFtXaXCos61ApMhLReSdEQ8m1+fAI6PZpdqc62z
         PiyWfloXebQjycsr37CTrFP0KBGLQCEIGkcjJC2Fs3Pzeze48Q1AY6YCzT1Q66EkRBtx
         xwkwU7kYRmyZu7QXnyGNdNB4yw+87HJPXETgP42pDUbJBKMgx4jmAIe8PHr5B94wz4Q/
         cJob/hniR8tnQ9+GMAB143RC5CnyzSoKvobvz8P4JYwqsiRnvnMMBSP//tsP4DuY5CJ/
         Wpiv3Z4hyeYeZ4HTl+5j5FPUuXp7hb//bs1wcFI7O/R7CrSZ4F2isLxYSATorw25Bj5L
         AsuA==
X-Forwarded-Encrypted: i=1; AHgh+RqXsCJzj0FCFNqMrSGx96V22bvyGbB4evL5cKSfpibySiZb/08FptX449AqtUA1exRk6kPlBga7OGBVjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4em//t9f9dlrjo+hPoxkBV/txGLGGxXhvfOdqR61TlTOsmRkI
	m15/GSIP71QOlUL9jTgu6L/MQVimOPQ1snhhEht/109tVnbUYk+W9ufYD1JiOZnocBcxnm4HkUB
	sNJVfLxDJdtDlaGsxMqQSwZf7oun80eIJ6Zs9f/xI0YPXJITZTyoheLvLhypS7A+Tu7wZRzK6Hl
	Wfyx+84SJ3TbFFlbmrTS7zJBrEbZhDcl39kXHrxBaGLcdZ
X-Gm-Gg: AR+sD12JV5y9PKOf+wiSRac2s9Xq37GEP8cMTQa8xJ9ZinjcYRpGHduDYMJEdx4ADKV
	ki5Wd7sV3vnqSXtzUQoue9VoI2NEyepBF7yJy06zf+C9+yeLVe/15wLFhvtUXhye63nJldV9Qle
	hMir75htK5cLrN6jDEoZUbDx50zJPSw4Y48cGj3u8RreF9MIXeM6S10+J9
X-Received: by 2002:a05:622a:13d3:b0:51a:8c99:1f0d with SMTP id d75a77b69052e-5283df3e6acmr56348081cf.60.1784881303643;
        Fri, 24 Jul 2026 01:21:43 -0700 (PDT)
X-Received: by 2002:a05:622a:13d3:b0:51a:8c99:1f0d with SMTP id
 d75a77b69052e-5283df3e6acmr56347861cf.60.1784881303160; Fri, 24 Jul 2026
 01:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260622211430.4008899-1-pnina.feder@mobileye.com>
 <akybBoCAm-kJbfHL@kernel.org> <20260720091927.GA1736709@horms.kernel.org>
 <al4X300UObXawEIJ@kernel.org> <al4yeHrkDHFoo6A0@MiWiFi-R3L-srv>
 <al5cbYMD18UbKe-6@telecaster> <al9gnbT5S0ALDieg@MiWiFi-R3L-srv> <MRWPR09MB802232B51C8299CF750B14978FC02@MRWPR09MB8022.eurprd09.prod.outlook.com>
In-Reply-To: <MRWPR09MB802232B51C8299CF750B14978FC02@MRWPR09MB8022.eurprd09.prod.outlook.com>
From: Tao Liu <ltao@redhat.com>
Date: Fri, 24 Jul 2026 20:21:06 +1200
X-Gm-Features: AUfX_mzM2Esm_vgIK4dSyGCOmrk37RuBTaquqJpKja8Y0Uar-Vj9nUEWBeZ2VbY
Message-ID: <CAO7dBbVoygCT245OvjZNDeg9b0qCZ5NZd_MNSAiELAZNEDf8-Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] vmcore-tasks: export per-task metadata to vmcoreinfo
To: Pnina Feder <PNINA.FEDER@mobileye.com>
Cc: Baoquan He <baoquan.he@linux.dev>, Omar Sandoval <osandov@osandov.com>, 
	Mike Rapoport <rppt@kernel.org>, Simon Horman <horms@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Dave Young <ruirui.yang@linux.dev>, Jonathan Corbet <corbet@lwn.net>, Alexandre Ghiti <alex@ghiti.fr>, 
	"kexec@lists.infradead.org" <kexec@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-debuggers@vger.kernel.org" <linux-debuggers@vger.kernel.org>, 
	Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>, 
	Gregory Greenman <Gregory.Greenman@mobileye.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RLLqPdTUmYvZjwQ9B1W_5LphdlGjIc2hkngJv6AcW0c_1784881304
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_012148_682462_697CDBAA 
X-CRM114-Status: GOOD (  50.16  )
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

T24gRnJpLCBKdWwgMjQsIDIwMjYgYXQgMTowNeKAr0FNIFBuaW5hIEZlZGVyIDxQTklOQS5GRURF
UkBtb2JpbGV5ZS5jb20+IHdyb3RlOgo+Cj4gPiBPbiAwNy8yMC8yNiBhdCAxMDozNWFtLCBPbWFy
IFNhbmRvdmFsIHdyb3RlOgo+ID4gPiBPbiBNb24sIEp1bCAyMCwgMjAyNiBhdCAxMDo0MDo0M1BN
ICswODAwLCBCYW9xdWFuIEhlIHdyb3RlOgo+ID4gPiA+IE9uIDA3LzIwLzI2IGF0IDAzOjQzcG0s
IE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gPiA+ID4gPiBIaSBTaW1vbiwKPiA+ID4gPiA+Cj4gPiA+
ID4gPiBPbiBNb24sIEp1bCAyMCwgMjAyNiBhdCAxMDoxOToyN0FNICswMTAwLCBTaW1vbiBIb3Jt
YW4gd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIFR1ZSwgSnVsIDA3LCAyMDI2IGF0IDA5OjIxOjU4QU0g
KzAzMDAsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gT24gVHVlLCBKdW4gMjMs
IDIwMjYgYXQgMTI6MTQ6MjZBTSArMDMwMCwgUG5pbmEgRmVkZXIgd3JvdGU6Cj4gPiA+ID4gPiA+
ID4gPiBUaGlzIHNlcmllcyBleHRlbmRzIHZtY29yZWluZm8gd2l0aCBzdHJ1Y3Qgb2Zmc2V0cyBh
bmQgc2l6ZXMKPiA+ID4gPiA+ID4gPiA+IG5lZWRlZCBieSB0aGUgdm1jb3JlLXRhc2tzIHVzZXJz
cGFjZSB0b29sIHRvIGV4dHJhY3QKPiA+ID4gPiA+ID4gPiA+IHBlci10YXNrIHN0YXRlIGZyb20g
YSB2bWNvcmUgZHVtcCB3aXRob3V0IHJlcXVpcmluZyBrZXJuZWwgZGVidWcgc3ltYm9scyAoRFdB
UkYvQlRGKS4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBUaGUgdm1jb3JlLXRhc2tz
IHRvb2wgcmVhZHMgL3Byb2Mvdm1jb3JlIChvciBhIHNhdmVkIHZtY29yZQo+ID4gPiA+ID4gPiA+
ID4gZmlsZSkgYW5kIHJlY29uc3RydWN0cywgZm9yIGVhY2ggdGFzazoKPiA+ID4gPiA+ID4gPiA+
ICAgLSB0YXNrIG5hbWUsIHBpZCwgc3RhdGUsIGZsYWdzCj4gPiA+ID4gPiA+ID4gPiAgIC0gVk1B
IGxpc3QgKHN0YXJ0LCBlbmQsIGZsYWdzLCBiYWNraW5nIGZpbGUpCj4gPiA+ID4gPiA+ID4gPiAg
IC0gdXNlciByZWdpc3RlciBzdGF0ZSAoc2F2ZWQgb24gdGhlIGtlcm5lbCBzdGFjayBhdCBrZXJu
ZWwgZW50cnkpCj4gPiA+ID4gPiA+ID4gPiAgIC0gdXNlci1zcGFjZSBiYWNrdHJhY2Ugd2l0aCBW
TUEvZmlsZW5hbWUgbWFwcGluZwo+ID4gPiA+ID4gPiA+ID4gICAtIGtlcm5lbCBkbWVzZyBidWZm
ZXIKPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBUaGlzIHByb3ZpZGVzIGEgbGlnaHR3
ZWlnaHQgcG9zdC1tb3J0ZW0gY3Jhc2ggYW5hbHlzaXMKPiA+ID4gPiA+ID4gPiA+IGNhcGFiaWxp
dHkgZm9yIHByb2R1Y3Rpb24gZW52aXJvbm1lbnRzIHdoZXJlIGZ1bGwgZGVidWcgaW5mbwo+ID4g
PiA+ID4gPiA+ID4gKERXQVJGL0JURikgaXMgbm90IGF2YWlsYWJsZS4KPiA+ID4gPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+ID4gPiBUaGUgY29tcGFuaW9uIHVzZXJzcGFjZSB0b29sIGlzIHN1Ym1pdHRl
ZCB0byBrZXhlYy10b29sczoKPiA+ID4gPiA+ID4gPiA+ICAgU3VzcGljaW91cyBMaW5rIC0gUmVt
b3ZlZAo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gU29ycnkgZm9yIHRoZSBkZWxheSwgdGhp
cyBmZWxsIGJldHdlZW4gdGhlIGNyYWNrcyBzb21laG93Lgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+ID4gVGhlIGtlcm5lbCBzaWRlIGxvb2tzIGZpbmUgb3ZlcmFsbCwgYnV0IHRvIG1lcmdlIGl0
IHRoZXJlCj4gPiA+ID4gPiA+ID4gc2hvdWxkIGJlIGFuIGFncmVlbWVudCBmcm9tIHRoZSB1c2Vy
c3BhY2Ugc2lkZSBtYWludGFpbmVycwo+ID4gPiA+ID4gPiA+IHRoYXQgdm1jb3JlLXRhc2tzIGlz
IHNvbWV0aGluZyB0aGV5IGFyZSB3aXNoaW5nIHRvIGFjY2VwdC4KPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gSGkgTWlrZSwgYWxsLAo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBTb3JyeSBmb3IgdGhl
IGV4dGVuZGVkIGRlbGF5Lgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJIHdpbGwgc2VuZCBzb21l
IG1pbm9yIGZlZWRiYWNrIHRvIHRoZSB1c2VyLXNwYWNlIHRvb2wgcGF0Y2hzZXQKPiA+ID4gPiA+
ID4gYnV0IG92ZXJhbGwsIHllcywgdGhpcyBpcyBzb21ldGhpbmcgSSB3b3VsZCBiZSBoYXBweSB0
byBhY2NlcHQuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEkgZG9uJ3Qgd2FudCB0byBjcmVhdGUg
YSBjaGlja2VuLWFuZC1lZ2cgdHlwZSBwcm9ibGVtIGhlcmUuCj4gPiA+ID4gPiA+IEJ1dCBpdCdz
IHByb2JhYmx5IHdvcnRoIG1lbnRpb25pbmcgdGhhdCB1c3VhbGx5IGZlYXR1cmVzIGhpdCB0aGUK
PiA+ID4gPiA+ID4ga2VybmVsIGJlZm9yZSB0aGUgY29ycmVzcG9uZGluZyBjb2RlIGlzIGFjY2Vw
dGVkIGludG8KPiA+ID4gPiA+ID4ga2V4ZWMtdG9vbHMuCj4gPiA+ID4gPgo+ID4gPiA+ID4gU29y
cnkgaWYgSSB3YXNuJ3QgY2xlYXIuCj4gPiA+ID4gPgo+ID4gPiA+ID4gSSBkaWRuJ3QgbWVhbiB0
aGF0IHRoZSBmZWF0dXJlIHNob3VsZCBiZSBtZXJnZWQgaW50byBrZXhlYy10b29scwo+ID4gPiA+
ID4gYmVmb3JlIG1lcmdpbmcgdGhlIGtlcm5lbCBiaXRzLiBJIGp1c3Qgd2FudGVkIHRvIG1ha2Ug
c3VyZSB0aGVyZSdzCj4gPiA+ID4gPiBubyBmdW5kYW1lbnRhbCBpc3N1ZSBmcm9tIGtleGVjLXRv
b2xzIHBlcnNwZWN0aXZlLgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4gTGV0IG1lIGtub3cgaG93IHlv
dSB3b3VsZCBsaWtlIHRvIHByb2NlZWQuCj4gPiA+ID4gPgo+ID4gPiA+ID4gSSdtIGdvaW5nIHRv
IHdhaXQgZm9yIEJhb3F1YW4ncyByZXZpZXcgYW5kIG9uY2UgdGhhdCdzIGRvbmUgSSdsbAo+ID4g
PiA+ID4gcGljayB1cCB0aGUga2VybmVsIGJpdHMuCj4gPiA+ID4KPiA+ID4gPiBPaCwgc29ycnks
IEkganVzdCBub3RpY2VkIHRoaXMgc2VyaWVzLCBidXQgYSBxdWljayBsb29rIGdpdmUgbWUgYQo+
ID4gPiA+IGhpbnQgb2YgJ05vLCBJIGRvbid0IGxpa2UgaXQuJyBXZSBoYXZlIGhhZCBDcmFzaCB1
dGlsaXR5LCBEcmduLCBub3cKPiA+ID4gPiBhIG5ldyBvbmUgY29tZXMgdXAuIEkgaGF2ZSBzb21l
IGNvbmNlcm5zIHRvIFBuaW5hOgo+ID4gPiA+Cj4gPiA+ID4gMS4gRXhwb3J0aW5nIG1hcGxlIHRy
ZWUgaW50ZXJuYWxzIChtYXBsZV9ub2RlLCBtYXBsZV9yYW5nZV82NCwKPiA+ID4gPiAgICBtYXBs
ZV9hcmFuZ2VfNjQsIG1hcGxlX21ldGFkYXRhKSBhcyB2bWNvcmVpbmZvIEFCSSBpcyBwcm9ibGVt
YXRpYy4KPiA+ID4gPiAgICBUaGVzZSBhcmUgcHJpdmF0ZSBpbXBsZW1lbnRhdGlvbiBkZXRhaWxz
LCBub3Qgc3RhYmxlIHN0cnVjdHVyZXMgbGlrZQo+ID4gPiA+ICAgIHRhc2tfc3RydWN0LiBBbnkg
cmVmYWN0b3Jpbmcgb2YgdGhlIG1hcGxlIHRyZWUgd2lsbCBzaWxlbnRseSBicmVhawo+ID4gPiA+
ICAgIHRoZSB1c2Vyc3BhY2UgdG9vbC4KPiA+ID4gPgo+ID4gPiA+IDIuIFdpdGhvdXQgRFdBUkYv
QlRGLCB0aGUgZGVidWdnaW5nIHNjb3BlIGlzIGluaGVyZW50bHkgbGltaXRlZCDigJQgbm8KPiA+
ID4gPiAgICBrZXJuZWwgc3RhY2sgYmFja3RyYWNlLCBubyBzeW1ib2wgcmVzb2x1dGlvbiwgbm8g
dmFyaWFibGUgYWNjZXNzLgo+ID4gPiA+ICAgIFRoYXQncyBlc3NlbnRpYWxseSAicHMgKyAvcHJv
Yy9QSUQvbWFwcyIgZnJvbSBhIHZtY29yZS4gSGF2ZSB5b3UKPiA+ID4gPiAgICBjb25zaWRlcmVk
IGVuYWJsaW5nIENPTkZJR19ERUJVR19JTkZPX0JURiBvbiB5b3VyIHBsYXRmb3JtcyBpbnN0ZWFk
Pwo+ID4gPiA+ICAgIEJURiBpcyBjb21wYWN0ICh0eXBpY2FsbHkgPCAxIE1CKSBhbmQgd291bGQg
Z2l2ZSBkcmduIGZ1bGwgYWNjZXNzCj4gPiA+ID4gICAgd2l0aG91dCBuZWVkaW5nIHZtbGludXgg
ZGVidWcgcGFja2FnZXMuIFRoYXQgc2VlbXMgbGlrZSBhIGJldHRlcgo+ID4gPiA+ICAgIHJldHVy
bi1vbi1pbnZlc3RtZW50IHRoYW4gbWFpbnRhaW5pbmcgfjQwIG5ldyB2bWNvcmVpbmZvIGV4cG9y
dHMuCj4gPiA+ID4KPiA+ID4gPiAzLiBCZXlvbmQgdGhlIHRlY2huaWNhbCBjb25jZXJucywgSSB3
b25kZXIgYWJvdXQgYWRvcHRpb24uIHZtY29yZS10YXNrcwo+ID4gPiA+ICAgIHRhcmdldHMgYSBm
YWlybHkgbmFycm93IHVzZSBjYXNlIOKAlCBwbGF0Zm9ybXMgd2l0aG91dCBEV0FSRi9CVEYsIHdo
ZXJlCj4gPiA+ID4gICAgeW91IHN0aWxsIGhhdmUgdm1jb3JlIGJ1dCBjYW4ndCBzaGlwIHZtbGlu
dXguIElzIE1vYmlsZXllIGN1cnJlbnRseQo+ID4gPiA+ICAgIHRoZSBvbmx5IGNvbnN1bWVyPyBB
cmUgeW91IGd1eXMgYWxyZWFkeSB1c2luZyBpdCB3aWRlbHkgYW5kIGZ1bGx5Pwo+ID4gPiA+ICAg
IElmIHRoaXMgbGFuZHMgYnV0IGRvZXNuJ3Qgc2VlIGJyb2FkZXIgdXB0YWtlLCB0aGUgfjQwIGV4
cG9ydHMgcmlzawo+ID4gPiA+ICAgIGJlY29taW5nIGRlYWQgd2VpZ2h0IGluIHZtY29yZWluZm8g
4oCUIG5vYm9keSBhY3RpdmVseSB1c2VzIHRoZW0sIGJ1dAo+ID4gPiA+ICAgIGtlcm5lbCBjaGFu
Z2VzIHN0aWxsIG5lZWQgdG8ga2VlcCB0aGVtIGNvbnNpc3RlbnQsIG9yIHRoZXkgc2lsZW50bHkK
PiA+ID4gPiAgICByb3QgYW5kIGdpdmUgdXNlcnMgd3JvbmcgcmVzdWx0cy4KPiA+ID4gPgo+ID4g
PiA+IFJlZ2FyZHMsCj4gPiA+ID4gQmFvcXVhbgo+ID4gPgo+ID4gPiAoQWRkaW5nIGxpbnV4LWRl
YnVnZ2VycyBtYWlsaW5nIGxpc3QpLgo+ID4gPgo+ID4gPiBJIGFncmVlIHdpdGggYWxsIG9mIEJh
b3F1YW4ncyBwb2ludHMgaGVyZSwgd2l0aCBhIGNvdXBsZSBvZiBub3RlczoKPiA+ID4KPiA+ID4g
MS4gZHJnbidzIEJURiBzdXBwb3J0IGlzIGN1cnJlbnRseSBhIHdvcmsgaW4gcHJvZ3Jlc3MsIGJ1
dCBpdCdzIHNoYXBpbmcKPiA+ID4gICAgdXAgd2VsbDogaHR0cHM6Ly9naXRodWIuY29tL29zYW5k
b3YvZHJnbi9wdWxsLzYyNS4KPiA+ID4gMi4gbWFrZWR1bXBmaWxlIGlzIGFsc28gZ2FpbmluZyBC
VEYgZXh0ZW5zaW9uIHN1cHBvcnQ6Cj4gPiA+ICAgIFN1c3BpY2lvdXMgTGluayAtIFJlbW92ZWQK
PiA+ID4gICAgSXQncyBsaWdodGVyLXdlaWdodCB0aGFuIGRyZ24gd2hpbGUgc3RpbGwgYmVpbmcg
bXVjaCBtb3JlIGdlbmVyYWwKPiA+ID4gICAgdGhhbiB0aGlzIHNlcmllcy4KPiA+Cj4gPiBUaGFu
a3MgZm9yIGFkZGluZyB0aGUgaW5mb3JtYXRpb24sIHZlcnkgaGVscGZ1bC4KPgo+IEhpLAo+Cj4g
VGhhbmtzIGV2ZXJ5b25lIGZvciB0aGUgZmVlZGJhY2sgYW5kIHRoZSBzdWdnZXN0aW9ucy4KPgo+
IEknbGwgdGFrZSBhIGxvb2sgYXQgdXNpbmcgQlRGIHdpdGggdm1jb3JlLXRhc2tzIGFuZCBldmFs
dWF0ZSB3aGV0aGVyIGl0IGNhbiByZXBsYWNlIG1vc3Qgb2YgdGhlIHZtY29yZWluZm8gZXhwb3J0
cy4KPgo+IE91ciB1c2UgY2FzZSByZXF1aXJlcyBhbmFseXppbmcgdGhlIHZtY29yZSBvbiB0aGUg
Y3Jhc2gga2VybmVsIGl0c2VsZiwgd2l0aCB2ZXJ5IGxpbWl0ZWQgc3RvcmFnZSBhdmFpbGFibGUs
IHNvIHVzaW5nIGRyZ24gdG9nZXRoZXIgd2l0aCBhIGZ1bGwgdm1saW51eCBpcyBub3QgcHJhY3Rp
Y2FsIGZvciB1cy4KCkkgZ3Vlc3MgeW91IGNhbiBzaGlwIGEgbWFrZWR1bXBmaWxlIGFuZCBhIGZl
dyBleHRlbnNpb25zIHRvIHlvdXIKc3lzdGVtLCB3aGljaCBzaG91bGRuJ3QgYmUgdG9vIGxhcmdl
LiBZb3UgY2FuIGNvZGUgYSBtYWtlZHVtcGZpbGUKZXh0ZW5zaW9uIHRvIHV0aWxpemUgQlRGIGlu
Zm8oSWYgeW91ciBrZXJuZWwgYWxyZWFkeSBlbmFibGVkIGl0KSB0bwppdGVyYXRlIHRhc2tzIGFu
ZCBkdW1wIHRoZSBuZWVkZWQgaW5mb3JtYXRpb24gb3V0LCBwbGVhc2Ugc2VlIFsxXSwKdGhvdWdo
IGl0IGlzIHVzZWQgZm9yIGVhc2Ugc29tZSBkYXRhIGZyb20gdm1jb3JlLCBidXQgZW5vdWdoIGZv
ciBwcmludAphbnkgaW5mb3JtYXRpb24uCgpbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9tYWtlZHVt
cGZpbGUvbWFrZWR1bXBmaWxlL2Jsb2IvbWFzdGVyL2V4dGVuc2lvbnMvZXJhc2Vfc2FtcGxlLmMK
ClRoYW5rcywKVGFvIExpdQo+Cj4gVGhhbmtzLAo+IFBuaW5hCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
