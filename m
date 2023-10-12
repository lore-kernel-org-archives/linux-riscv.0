Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DFDCDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 12:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YpRUCcsE3PDMZ92PbcsMRvx9WOlaOJuqIX9sseKBF3E=; b=ohn7dvNrAwLLpY
	9/AZnObx+uxStRK9d+moz/BfQUBj93onghHHUB2+TF9DfGj4Ov2UsJhX3wUgf0qvrfzKDEsYE3kDQ
	nxUpHkWUNHgZBEtIY+LoAvmqbaL4iR3ApyIoF1Whq0o7abmRzAD4I9a0uQCWn4SphJnwttVtk529I
	fpfjZuW3gh6D+FR9+B4T30V2GuxBsdb1Nj8Pr9Kof2Ydk1ou8M+x9z+0ElQO/Rehl1VeIRQbviUXm
	DBENCOicwZZHD86KzrGWhfm/ljEK0pS4atvobUuV3KuwmSIVIk6BU5kuU1ljCO8ffqp889356hMhi
	UvqRs7y45L1QylN3PokQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqubQ-000wZX-2I;
	Thu, 12 Oct 2023 12:15:44 +0000
Received: from mail-yw1-f170.google.com ([209.85.128.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqubO-000wY0-03
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 12:15:43 +0000
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5a7dafb659cso11218867b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Oct 2023 05:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697112934; x=1697717734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wl3I/2bXbjqN636hLulYiW7jhp7Ro5bp+FnjB/CpQr8=;
        b=Jt1UtcVC/jTD436XbqS7zlRMVrrfQEfdSjJ+zuV851jIdFssYlsJHCisv/KUb3G1Co
         ZID1JNWYHjzzwbv7v+So1Ls4FPR+VDdBnZF6uyAC7JDxaYfVzX8z2n5bT+yObZKnmdnJ
         EsuyqOa8sSTBZbC1gXqb/NP4z43xC8TsEBa0SfOUR00sQq0jgaDd3CaJ01xoFgOc1U+z
         NRmF10uRs0RU7QDpXMdXnY8DZO/dwti3+Q7F+DvKHi6ujrlD/PvfZ0SsjxDNHlb2ILRt
         HU8fPGibzU8U+ngRwivRtXzI3gxN0Q6jZlDkkPTUh2La3IOdQLcQv0Nwevy3zl+cKeFc
         drVg==
X-Gm-Message-State: AOJu0YyA77fKnoVSsrdge0STlNIaK0m9961OqfM3mwl8kFZjmz2oEpUm
	YoOJ3lOODHMGa8fMwPRoGFUElI7Mxdkqvw==
X-Google-Smtp-Source: AGHT+IEDwRRzMcFxgxqyJ6DDheOyc7K3+4AYaJrlj+ZlCO/TNRJYGRsnUzrl/xvkOfe+AeEG2TKYnw==
X-Received: by 2002:a0d:ea90:0:b0:5a1:db12:d782 with SMTP id t138-20020a0dea90000000b005a1db12d782mr24611837ywe.44.1697112934675;
        Thu, 12 Oct 2023 05:15:34 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id r70-20020a0de849000000b00570253fc3e5sm1285772ywe.105.2023.10.12.05.15.33
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 05:15:33 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5a7af52ee31so10871207b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Oct 2023 05:15:33 -0700 (PDT)
X-Received: by 2002:a0d:d40f:0:b0:59b:fe46:82de with SMTP id
 w15-20020a0dd40f000000b0059bfe4682demr24538814ywd.18.1697112932799; Thu, 12
 Oct 2023 05:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <20231012-pouch-parkway-7d26c04b3300@spud>
In-Reply-To: <20231012-pouch-parkway-7d26c04b3300@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Oct 2023 14:15:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWRzoBgxxkF6kpxr4tpUM4BzHnMUmW3vDR_BrrXiKae5Q@mail.gmail.com>
Message-ID: <CAMuHMdWRzoBgxxkF6kpxr4tpUM4BzHnMUmW3vDR_BrrXiKae5Q@mail.gmail.com>
Subject: Re: [PATCH v2] soc: renesas: make ARCH_R9A07G043 depend on required options
To: Conor Dooley <conor@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, soc@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_051542_052172_FFADD657 
X-CRM114-Status: GOOD (  26.44  )
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

SGkgQ29ub3IsCgpPbiBUaHUsIE9jdCAxMiwgMjAyMyBhdCAxOjEx4oCvUE0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRv
b2xleUBtaWNyb2NoaXAuY29tPgo+Cj4gUmFuZHkgcmVwb3J0ZWQgYSByYW5kY29uZmlnIGJ1aWxk
IGlzc3VlIGFnYWluc3QgbGludXgtbmV4dDoKPiBXQVJOSU5HOiB1bm1ldCBkaXJlY3QgZGVwZW5k
ZW5jaWVzIGRldGVjdGVkIGZvciBFUlJBVEFfQU5ERVMKPiAgIERlcGVuZHMgb24gW25dOiBSSVND
Vl9BTFRFUk5BVElWRSBbPW5dICYmIFJJU0NWX1NCSSBbPXldCj4gICBTZWxlY3RlZCBieSBbeV06
Cj4gICAtIEFSQ0hfUjlBMDdHMDQzIFs9eV0gJiYgU09DX1JFTkVTQVMgWz15XSAmJiBSSVNDViBb
PXldICYmIE5PTlBPUlRBQkxFIFs9eV0gJiYgUklTQ1ZfU0JJIFs9eV0KPgo+IC4uL2FyY2gvcmlz
Y3YvZXJyYXRhL2FuZGVzL2VycmF0YS5jOjU5OjU0OiB3YXJuaW5nOiAnc3RydWN0IGFsdF9lbnRy
eScgZGVjbGFyZWQgaW5zaWRlIHBhcmFtZXRlciBsaXN0IHdpbGwgbm90IGJlIHZpc2libGUgb3V0
c2lkZSBvZiB0aGlzIGRlZmluaXRpb24gb3IgZGVjbGFyYXRpb24KPiAgICA1OSB8IHZvaWQgX19p
bml0X29yX21vZHVsZSBhbmRlc19lcnJhdGFfcGF0Y2hfZnVuYyhzdHJ1Y3QgYWx0X2VudHJ5ICpi
ZWdpbiwgc3RydWN0IGFsdF9lbnRyeSAqZW5kLAo+Cj4gT24gUklTQy1WLCBhbHRlcm5hdGl2ZXMg
YXJlIG5vdCB1c2FibGUgaW4gWElQIGtlcm5lbHMsIHdoaWNoIHRoaXMKPiByYW5kY29uZmlnIGhh
cHBlbmVkIHRvIHNlbGVjdC4gUmF0aGVyIHRoYW4gYWRkIGEgY2hlY2sgZm9yIHdoZXRoZXIKPiBh
bHRlcm5hdGl2ZXMgYXJlIGF2YWlsYWJsZSBiZWZvcmUgc2VsZWN0aW5nIHRoZSBFUlJBVEFfQU5E
RVMgY29uZmlnCj4gb3B0aW9uLCByZXdvcmsgdGhlIFI5QTA3RzA0MyBLY29uZmlnIGVudHJ5IHRv
IGRlcGVuZCBvbiB0aGUKPiBjb25maWd1cmF0aW9uIG9wdGlvbnMgcmVxdWlyZWQgdG8gc3VwcG9y
dCBpdHMgbm9uLXN0YW5kYXJkIGNhY2hlCj4gY29oZXJlbmN5IGltcGxlbWVudGF0aW9uLgo+Cj4g
V2l0aG91dCB0aGVzZSBvcHRpb25zIGVuYWJsZWQsIHRoZSBTb0MgaXMgZWZmZWN0aXZlbHkgbm9u
LWZ1bmN0aW9uYWwgdG8KPiBiZWdpbiB3aXRoLCBzbyB0aGVyZSdzIGFuIGV4dHJhIGJlbmVmaXQg
aW4gcHJldmVudGluZyB0aGUgY3JlYXRpb24gb2YKPiBub24tZnVuY3Rpb25hbCBrZXJuZWxzLgo+
Cj4gVGhlICJpZiBSSVNDVl9ETUFfTk9OQ09IRVJFTlQiIGNhbiBiZSBkcm9wcGVkLCBhcyBFUlJB
VEFfQU5ERVNfQ01PIHdpbGwKPiBzZWxlY3QgaXQuCj4KPiBSZXBvcnRlZC1ieTogUmFuZHkgRHVu
bGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+Cj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMDlhNmIwZjAtNzZhMS00NWUzLWFiNTItMzI5YzQ3MzkzZDFkQGluZnJhZGVhZC5v
cmcvCj4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlw
LmNvbT4KPiAtLS0KPgo+IEkgZHJvcHBlZCBSYW5keSdzIHQtYiBldGMgc2luY2UgdGhpcyBwYXRj
aCBpcyBxdWl0ZSBkaWZmZXJlbnQuCj4KPiB2MjogZHJvcCB0aGUgZXh0cmEgY29uZGl0aW9uIG9u
IHRoZSBzZWxlY3Qgb2YgRVJSQVRBX0FOREVTLCBtb3ZlIGluc3RlYWQKPiB0byBkZXBlbmRpbmcg
b24gcmVxdWlyZWQgb3B0aW9ucy4KClRoYW5rcyBmb3IgdGhlIHVwZGF0ZSEKClJldmlld2VkLWJ5
OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgppLmUuIHdpbGwg
cXVldWUgaW4gcmVuZXNhcy1maXhlcyBmb3IgdjYuNi4KCj4gLS0tIGEvZHJpdmVycy9zb2MvcmVu
ZXNhcy9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9zb2MvcmVuZXNhcy9LY29uZmlnCj4gQEAgLTM0
MCwxMCArMzQwLDEyIEBAIGlmIFJJU0NWCj4gIGNvbmZpZyBBUkNIX1I5QTA3RzA0Mwo+ICAgICAg
ICAgYm9vbCAiUklTQy1WIFBsYXRmb3JtIHN1cHBvcnQgZm9yIFJaL0ZpdmUiCj4gICAgICAgICBk
ZXBlbmRzIG9uIE5PTlBPUlRBQkxFCj4gKyAgICAgICBkZXBlbmRzIG9uIFJJU0NWX0FMVEVSTkFU
SVZFCj4gKyAgICAgICBkZXBlbmRzIG9uIFJJU0NWX1NCSQo+ICAgICAgICAgc2VsZWN0IEFSQ0hf
UlpHMkwKPiAtICAgICAgIHNlbGVjdCBBWDQ1TVBfTDJfQ0FDSEUgaWYgUklTQ1ZfRE1BX05PTkNP
SEVSRU5UCj4gKyAgICAgICBzZWxlY3QgQVg0NU1QX0wyX0NBQ0hFCj4gICAgICAgICBzZWxlY3Qg
RE1BX0dMT0JBTF9QT09MCj4gLSAgICAgICBzZWxlY3QgRVJSQVRBX0FOREVTIGlmIFJJU0NWX1NC
SQo+ICsgICAgICAgc2VsZWN0IEVSUkFUQV9BTkRFUwo+ICAgICAgICAgc2VsZWN0IEVSUkFUQV9B
TkRFU19DTU8gaWYgRVJSQVRBX0FOREVTCgpBcyBFUlJBVEFfQU5ERVMgaXMgbm93IHNlbGVjdGVk
IHVuY29uZGl0aW9uYWxseSwgdGhlIHRlc3QKZm9yIGl0IGNhbiBiZSByZW1vdmVkLiAgSSBjYW4g
ZG8gdGhhdCB3aGlsZSBhcHBseWluZy4KCj4gICAgICAgICBoZWxwCj4gICAgICAgICAgIFRoaXMg
ZW5hYmxlcyBzdXBwb3J0IGZvciB0aGUgUmVuZXNhcyBSWi9GaXZlIFNvQy4KCkdye29ldGplLGVl
dGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJo
b2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4
LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3Bs
ZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5h
bGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
