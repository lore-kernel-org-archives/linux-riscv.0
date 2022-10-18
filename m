Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A90C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Oct 2022 15:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FTVNlRtKXeD+jcXFlr9DvogJsZBsh5ESZS7Rh+7Uqjc=; b=fnzSyClU9JNX3t
	GpaKmwPJ83J25ytv/hzQCZwwUnYNNweg7OEBWpnl97ori/SmHXynw1VnyIhlQL7J0JTbGbpSJAn44
	CR6ZrRqZpbXgpQfzan77dOuaGo/wpz3EJYVK5g1WPrW3ZModv7SLxwOPwlycN9DB/O9ElRyrL54N2
	K4EphN4OTFFmRzs+mCsjxSUHNWlmuhGcSf3QJ8GnPcC7cHKLgs6xSj03JHgQakW7MoQ1BWZeSUjgn
	dHYtIXWNUGxOZe0PAVB89ROCQ6FUeJnHm+Rs5K+E8P0cJ+SZBCs/YilNtqjYxS+A3rqgQ+Sxu0x9i
	dh6/KgcO2xmWm1daZP1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oko5r-007Q9W-Uj; Tue, 18 Oct 2022 15:01:23 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oko5p-007Q8n-KE
	for linux-riscv@lists.infradead.org; Tue, 18 Oct 2022 15:01:23 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7467E3F473
	for <linux-riscv@lists.infradead.org>; Tue, 18 Oct 2022 15:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1666105279;
	bh=eKS6yWmMyojFT+rt6lz+sSid3ThtmkubFc+40+Tp6k8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=KpX8NArBtzPlrldPvVZeF+Hj3zwwKLZbkh5yeWUhrCofOgkmEtqHgAyDMivttOm6l
	 rug0BMEiYsNzWMwWrEgZZtcDzKzcdyEoxClw7v7uCrIMXMBrmgNRfVV+JjYb8wfdHD
	 GFaBoxr9SzSVwYGXEAFkxKhQv1nIgfIY7Q4Yq600/J5BjHgyYeavbcUOvGh0kMtfIi
	 Ra/9pjEtHS8u9d1hUn1wNRZKrfT/v4pa9Q53dnfGrD/XkOaILoMtyPZH0S7DbENJPk
	 fRTzUiLIMeM1YllUJmrAkcqtvv4vJyai3/h/cXlEbeA6UmTVOk5zyiJkmqWH0//rIM
	 R3DoXKoWcwpPQ==
Received: by mail-qt1-f198.google.com with SMTP id s14-20020a05622a1a8e00b00397eacd9c1aso10932235qtc.21
        for <linux-riscv@lists.infradead.org>; Tue, 18 Oct 2022 08:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eKS6yWmMyojFT+rt6lz+sSid3ThtmkubFc+40+Tp6k8=;
        b=A6ivWwS7aMmbtvJ8wrN6H9oPvQa8IApIs3Z/dIbV1KAjfoE0nboClAn0xQLDaw3Syz
         n8xXug+CO76zEwPcfLoti/qLWnuBqheLCBD9WZAj1Un63UDW0zEtC4S0F2BVsCyzvnfW
         a+chTswiciV3+39x8Ol4vby36fuiRv7NFGCC1w00Sqjjxcqpp5ba/BAZXqjblupqT2Gj
         rgZdqhUeFCod/BSqiCpvrxs6xYb0Bqil4wA7Srr/ySL9O6rpcuWC7U4ceLUsFr4k9Ozr
         G4gTsCXvrseoeV1PE0NKuQBQOfSq8hG8N5k5mrHbvcyjuYRvoyvpuNlRRfYIilYlR7bR
         trjA==
X-Gm-Message-State: ACrzQf1IAoAFN4B54JmnzW3KXB4NWCWX64tSCoGC1BwuHGGVHOmCZfZL
	M4n7u6Bpc0DFmIyf2ww4TMxWcZ6O0uLwCf8dqN85l6e1RMzSkWoApbSstbXOyo7vqnUCYWRWOO+
	jkFBfkx7SHBb7uxQWQIPv3sxKUhudROXV7Lo5SNth7nxyQNXVGgIfCrWtMu/Kxg==
X-Received: by 2002:a05:6214:19c9:b0:4b2:fe6f:90f9 with SMTP id j9-20020a05621419c900b004b2fe6f90f9mr2662139qvc.66.1666105277516;
        Tue, 18 Oct 2022 08:01:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6xytzQByWh7C8hBLdqhpI6w72qMrcqLyc3YNybBSV1Prvl9EkgXA1/A4+HFlbrm8xhLrZSaR9MxAxAM7gJ4vA=
X-Received: by 2002:a05:6214:19c9:b0:4b2:fe6f:90f9 with SMTP id
 j9-20020a05621419c900b004b2fe6f90f9mr2662098qvc.66.1666105277170; Tue, 18 Oct
 2022 08:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221018091316.415685-1-emil.renner.berthing@canonical.com>
 <20221018132921.5fsbiz254npk2fci@pengutronix.de> <CAJM55Z_v069EJmnr_nLFx9CQV9HfAOc2vCFv95VSip59zLFvjA@mail.gmail.com>
In-Reply-To: <CAJM55Z_v069EJmnr_nLFx9CQV9HfAOc2vCFv95VSip59zLFvjA@mail.gmail.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Tue, 18 Oct 2022 17:01:01 +0200
Message-ID: <CAJM55Z8i7JiQgccZxxLrPCio=5rT43ruTnn=83x=n0Wz+xhebw@mail.gmail.com>
Subject: Re: [PATCH v1] pwm: sifive: Always let the first pwm_apply_state succeed
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@atishpatra.org>, 
	"Wesley W. Terpstra" <wesley@sifive.com>, linux-pwm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_080121_823437_C0E78B29 
X-CRM114-Status: GOOD (  39.44  )
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

T24gVHVlLCAxOCBPY3QgMjAyMiBhdCAxNjo1NiwgRW1pbCBSZW5uZXIgQmVydGhpbmcKPGVtaWwu
cmVubmVyLmJlcnRoaW5nQGNhbm9uaWNhbC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCAxOCBPY3Qg
MjAyMiBhdCAxNToyOSwgVXdlIEtsZWluZS1Lw7ZuaWcKPiA8dS5rbGVpbmUta29lbmlnQHBlbmd1
dHJvbml4LmRlPiB3cm90ZToKPiA+Cj4gPiBIZWxsbywKPiA+Cj4gPiBPbiBUdWUsIE9jdCAxOCwg
MjAyMiBhdCAxMToxMzoxNkFNICswMjAwLCBFbWlsIFJlbm5lciBCZXJ0aGluZyB3cm90ZToKPiA+
ID4gQ29tbWl0IDJjZmU5YmJlYzU2ZWE1NzkxMzVjZGQ5MjQwOWZmZjM3MTg0MTkwNGYgYWRkZWQg
c3VwcG9ydCBmb3IgdGhlCj4gPiA+IFJHQiBhbmQgZ3JlZW4gUFdNIGNvbnRyb2xsZWQgTEVEcyBv
biB0aGUgSGlGaXZlIFVubWF0Y2hlZCBib2FyZAo+ID4gPiBtYW5hZ2VkIGJ5IHRoZSBsZWRzLXB3
bS1tdWx0aWNvbG9yIGFuZCBsZWRzLXB3bSBkcml2ZXJzIHJlc3BlY3RpdmVseS4KPiA+ID4gQWxs
IHRocmVlIGNvbG91cnMgb2YgdGhlIFJHQiBMRUQgYW5kIHRoZSBncmVlbiBMRUQgcnVuIGZyb20g
ZGlmZmVyZW50Cj4gPiA+IGxpbmVzIG9mIHRoZSBzYW1lIFBXTSwgYnV0IHdpdGggdGhlIHNhbWUg
cGVyaW9kIHNvIHRoaXMgd29ya3MgZmluZSB3aGVuCj4gPiA+IHRoZSBMRUQgZHJpdmVycyBhcmUg
bG9hZGVkIG9uZSBhZnRlciB0aGUgb3RoZXIuCj4gPiA+Cj4gPiA+IFVuZm9ydHVuYXRlbHkgaXQg
ZG9lcyBleHBvc2UgYSByYWNlIGluIHRoZSBQV00gZHJpdmVyIHdoZW4gYm90aCBMRUQKPiA+ID4g
ZHJpdmVycyBhcmUgbG9hZGVkIGF0IHJvdWdobHkgdGhlIHNhbWUgdGltZS4gSGVyZSBpcyBhbiBl
eGFtcGxlOgo+ID4gPgo+ID4gPiAgIHwgICAgICAgICAgVGhyZWFkIEEgICAgICAgICAgIHwgICAg
ICAgICAgVGhyZWFkIEIgICAgICAgICAgIHwKPiA+ID4gICB8ICBsZWRfcHdtX21jX3Byb2JlICAg
ICAgICAgICB8ICBsZWRfcHdtX3Byb2JlICAgICAgICAgICAgICB8Cj4gPiA+ICAgfCAgICBkZXZt
X2Z3bm9kZV9wd21fZ2V0ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfAo+ID4g
PiAgIHwgICAgICBwd21fc2lmaXZlX3JlcXVlc3QgICAgIHwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwKPiA+ID4gICB8ICAgICAgICBkZGF0YS0+dXNlcl9jb3VudCsrICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8Cj4gPiA+ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgICBkZXZtX2Z3bm9kZV9wd21fZ2V0ICAgICAgfAo+ID4gPiAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAgICBwd21fc2lmaXZlX3JlcXVlc3QgICAgIHwKPiA+ID4gICB8
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICBkZGF0YS0+dXNlcl9jb3VudCsr
ICB8Cj4gPiA+ICAgfCAgICAgICAgIC4uLiAgICAgICAgICAgICAgICAgfCAgICAgICAgICAuLi4g
ICAgICAgICAgICAgICAgfAo+ID4gPiAgIHwgICAgcHdtX3N0YXRlX2FwcGx5ICAgICAgICAgIHwg
ICAgcHdtX3N0YXRlX2FwcGx5ICAgICAgICAgIHwKPiA+ID4gICB8ICAgICAgcHdtX3NpZml2ZV9h
cHBseSAgICAgICB8ICAgICAgcHdtX3NpZml2ZV9hcHBseSAgICAgICB8Cj4gPiA+Cj4gPiA+IE5v
dyBib3RoIGNhbGxzIHRvIHB3bV9zaWZpdmVfYXBwbHkgd2lsbCBzZWUgdGhhdCBkZGF0YS0+YXBw
cm94X3BlcmlvZCwKPiA+ID4gaW5pdGlhbGx5IDAsIGlzIGRpZmZlcmVudCBmcm9tIHRoZSByZXF1
ZXN0ZWQgcGVyaW9kIGFuZCB0aGUgY2xvY2sgbmVlZHMKPiA+ID4gdG8gYmUgdXBkYXRlZC4gQnV0
IHNpbmNlIGRkYXRhLT51c2VyX2NvdW50ID49IDIgYm90aCBjYWxscyB3aWxsIGZhaWwKPiA+ID4g
d2l0aCAtRUJVU1ksIHdoaWNoIHdpbGwgdGhlbiBjYXVzZSBib3RoIExFRCBkcml2ZXJzIHRvIGZh
aWwgdG8gcHJvYmUuCj4gPiA+Cj4gPiA+IEZpeCBpdCBieSBsZXR0aW5nIHRoZSBmaXJzdCBjYWxs
IHRvIHB3bV9zaWZpdmVfYXBwbHkgdXBkYXRlIHRoZSBjbG9jawo+ID4gPiBldmVuIHdoZW4gZGRh
dGEtPnVzZXJfY291bnQgIT0gMS4KPiA+ID4KPiA+ID4gRml4ZXM6IDllMzdhNTNlYjA1MSAoInB3
bTogc2lmaXZlOiBBZGQgYSBkcml2ZXIgZm9yIFNpRml2ZSBTb0MgUFdNIikKPiA+ID4gU2lnbmVk
LW9mZi1ieTogRW1pbCBSZW5uZXIgQmVydGhpbmcgPGVtaWwucmVubmVyLmJlcnRoaW5nQGNhbm9u
aWNhbC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jIHwgMiAr
LQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4g
PiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMgYi9kcml2ZXJz
L3B3bS9wd20tc2lmaXZlLmMKPiA+ID4gaW5kZXggMmQ0ZmE1ZTVmZGQ0Li5jY2RmOTIwNDVmMzQg
MTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYwo+ID4gPiArKysgYi9k
cml2ZXJzL3B3bS9wd20tc2lmaXZlLmMKPiA+ID4gQEAgLTE1OSw3ICsxNTksNyBAQCBzdGF0aWMg
aW50IHB3bV9zaWZpdmVfYXBwbHkoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2Rl
dmljZSAqcHdtLAo+ID4gPgo+ID4gPiAgICAgICBtdXRleF9sb2NrKCZkZGF0YS0+bG9jayk7Cj4g
PiA+ICAgICAgIGlmIChzdGF0ZS0+cGVyaW9kICE9IGRkYXRhLT5hcHByb3hfcGVyaW9kKSB7Cj4g
PiA+IC0gICAgICAgICAgICAgaWYgKGRkYXRhLT51c2VyX2NvdW50ICE9IDEpIHsKPiA+ID4gKyAg
ICAgICAgICAgICBpZiAoZGRhdGEtPnVzZXJfY291bnQgIT0gMSAmJiBkZGF0YS0+YXBwcm94X3Bl
cmlvZCkgewo+ID4KPiA+IElNSE8gdGhpcyBuZWVkcyBhIGNvZGUgY29tbWVudC4gSXQgc2hvdWxk
IGFtb25nIG90aGVycyBtZW50aW9uIHRoYXQKPiA+IGFwcHJveF9wZXJpb2QgaXMgb25seSB6ZXJv
IGlmIC5hcHBseSgpIHdhc24ndCBjYWxsZWQgYmVmb3JlLgo+Cj4gQWdyZWVkLiBJJ2xsIGFkZCBp
biB2Mi4KPgo+ID4gTGV0IG1lIG5vdGUgdGhpcyBpcyBpbmNvbnNpc3RlbnQuIEkgZGlkbid0IGNo
ZWNrIHRoZSBkZXRhaWxzLCBidXQgbGV0J3MKPiA+IGFzc3VtZSB0aGUgUFdNIGNhbiBpbXBsZW1l
bnQgLnBlcmlvZCA9IDUwMCBhbmQgLnBlcmlvZCA9IDUxNCBhbmQgbm90aGluZwo+ID4gaW4gYmV0
d2Vlbi4gU28gaWYgdGhlIHRoZSBmaXJzdCBQV00gcmVxdWVzdHMgNTEyIG5zIGl0IGdldHMgKEkg
aG9wZSkgNTAwCj4gPiBucy4gVGhlbiB3aGVuIHRoZSBzZWNvbmQgcmVxdWVzdHMgY29tZXMgaW4g
cmVxdWVzdGluZyA1MTEgaXQgZmFpbHMgYW5kCj4gPiBpZiBpdCByZXF1ZXN0cyA1MTIgaXMgc3Vj
Y2VlZHMgYWxzbyBnZXR0aW5nIDUwMCBucy4gSG1tLgo+Cj4gWWVzLCBpZiB0d28gZGlmZmVyZW50
IGNvbnN1bWVycyB3YW50cyBkaWZmZXJlbnQgcGVyaW9kcyB0aGVuIHdob2V2ZXIKPiBnZXRzIHRv
IHRha2UgdGhlIG11dGV4IGluIHB3bV9zaWZpdmVfYXBwbHkgZmlyc3QgZ2V0cyB0byBzZXQgdGhl
IGNsb2NrCj4gZm9yIGl0cyByZXF1ZXN0ZWQgcGVyaW9kIGFuZCB0aGUgb3RoZXIgY29uc3VtZXIg
d2lsbCBnZXQgLUVCVVNZLiBJCj4gZG9uJ3Qgc2VlIGhvdyB0aGlzIGxldHMgb25lIGNvbnN1bWVy
IGNhbGwgcHdtX3N0YXRlX2FwcGx5IHN1Y2Nlc3NmdWxseQo+IGJ1dCBzdGlsbCBnZXQgYSBkaWZm
ZXJlbnQgcGVyaW9kIHRob3VnaC4KClNvcnJ5IG5vdyBJIHNlZSB3aGF0IHlvdSBtZWFuLiBZb3Un
cmUgc2F5aW5nIHRoYXQgaWYgZGlmZmVyZW50CmNvbnN1bWVycyB3YW50IGRpZmZlcmVudCBwZXJp
b2RzLCBidXQgdGhleSByb3VuZCB0byB0aGUgc2FtZSwgdGhlbgp0aGF0IHNob3VsZG4ndCBmYWls
LCBidXQgbm93IGl0IGRvZXMuIEkgdGhpbmsgdGhhdCdzIGEgY29ybmVyIGNhc2UgSSdkCmhhcHBp
bHkgbGl2ZSB3aXRoLgoKPiA+IEJlc3QgcmVnYXJkcwo+ID4gVXdlCj4gPgo+ID4gLS0KPiA+IFBl
bmd1dHJvbml4IGUuSy4gICAgICAgICAgICAgICAgICAgICAgICAgICB8IFV3ZSBLbGVpbmUtS8O2
bmlnICAgICAgICAgICAgfAo+ID4gSW5kdXN0cmlhbCBMaW51eCBTb2x1dGlvbnMgICAgICAgICAg
ICAgICAgIHwgaHR0cHM6Ly93d3cucGVuZ3V0cm9uaXguZGUvIHwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
