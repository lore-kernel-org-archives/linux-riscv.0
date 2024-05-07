Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B07DC25B4F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 15:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mg3g8nAoOrENDQhjo/e4XC2DEvQSUpd6fBTLg6oDkO4=; b=rcwdNAl9I83x16
	6N5HEroLWo8aHcwNSYdh4DCraYrvdQI/S8BvWghHruyQ5Jt2ZjRYi5byfnML1qzrMkB/4N0oafYbR
	YTfk8BOGoru/4YwaFlvRtKbJ88KIy2ecJ6Cshct/NH8GsB9/W8Ma9GgyWKK6x7zjgSjXO43jp3wOS
	RjJ1KF8L6K632E4e3tzdrKsCnbpPxitHqzOIdM0jCnBqik4bpwB36KLzIpA2c5Cu2pbjQ+R07pqjP
	5+PufDH+Q+EoLLAiE/F9mtk+E4uA57E5h3cLC5jUW33fQOqXmP/8+BbGQd8ObriSvFZeA7dhuL8ra
	t0cQTghvEaAMhKIUOj4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Mqs-0000000BlNT-2VwP;
	Tue, 07 May 2024 15:35:34 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Mqp-0000000BlMT-2nE5
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 15:35:33 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7e18ee491dbso7751339f.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 08:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715096128; x=1715700928; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fZeIxGU7jDZbp8MIAMXuP3cI2fycrTuvDnx0IrbFAQ=;
        b=cry1XuOFef3vwLEowJ7G3qqbz4ogRy747Ku4fMtf3K7mrpobVpSGZa/utDTGLnUeBf
         +RKEgh01pwE+lCtHOSr+wysrlkMnkSLwA0PP+Gojc7jMA2hOsoqjKjKrIq6vz/DJBvTG
         gzc9oVHE7/rtvFMzTm4054hEm8H6ePzeDscNFTbuniAfgv5Kx3yKV4Zz+8KbHCA/Kw5o
         9EQKSC3cM/VgcnzDHbX9lPNuxJsNiYqrs6IapPVT509cXBYDUkJTqDtgIHgtmrlEPo9S
         wnulhNOtsSnyyoBESlUUSItlMUY6Pj0fMpqGWV7ujfPuPv2ZClCrZb1GrfGS3G9/Pra0
         jFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715096128; x=1715700928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fZeIxGU7jDZbp8MIAMXuP3cI2fycrTuvDnx0IrbFAQ=;
        b=NUO8u+hMspmfmmMxtwphMuU4Q7o6gutvMVtv75AYTmgAobAZfXXrxBuBz+GnZ9SEiQ
         9ZMYl/0RJfIl1CzpNZgFTTQJBIfrh/V3f2mjzevNMsxsj6xsNhty8b/Su1HYJxPR2vcp
         a9h08nD8FhRp0L317E+AQlEAYZjMA5pgBjV69RsuZI2fe6v3Thkyfh3+xQq3Xuj4AMqh
         IFqreolM7EPOOE5fwr9fwByAfjT71AKvXI5DJ6Bq6nH2ebI98okJLiEtfHfF4zlDvBhD
         F2D18x9Zkm1SxR6qtCsh+GuX0GBiRaMZs8SrQRgXrYzdk1BLKDfI+TiT92tvUxVrGYYJ
         LLjA==
X-Forwarded-Encrypted: i=1; AJvYcCXhDcqRYxXh3tAobq1hiv0HaaliVv7N8nyuZf+ZWaTHAm4pPGgoxoGVKFyV3mNMkUm7TXthvMdGFfTNO48cmagsn5oxd+VQwytdnGWrPukn
X-Gm-Message-State: AOJu0YyW1kXRmXa3635Dx542zmTNnKgeUl8dsi2oKt28T+vHnkvrikxC
	j1AZ8rfkLuP7nFzVlAk9NnKqlgwmJeWo275vH2avyGGgAwJ6+cQBUrcJHl+lyRTbIomjYsZNZ8V
	lYafmVv13mo6l5MFx2lDASnPTVW3oOAMX30mVDw==
X-Google-Smtp-Source: AGHT+IHqhr+YVZAu1ZOtkTbNqavDX8MQUCsFnE/WXIvw3MsduOLxL3dNlYhKHRcJc+TT/v2hNtcpr3nZKzMPIQcSz3I=
X-Received: by 2002:a05:6602:6d12:b0:7e1:7a0b:3091 with SMTP id
 im18-20020a0566026d1200b007e17a0b3091mr5247906iob.15.1715096127791; Tue, 07
 May 2024 08:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240507142600.23844-1-zong.li@sifive.com> <20240507142600.23844-7-zong.li@sifive.com>
 <20240507150829.GJ901876@ziepe.ca>
In-Reply-To: <20240507150829.GJ901876@ziepe.ca>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 7 May 2024 23:35:16 +0800
Message-ID: <CANXhq0rnWUT4ia-cUoTbSyEQUeCcmC9bC7HHru6Se-1K-PZRDQ@mail.gmail.com>
Subject: Re: [PATCH RFC RESEND 6/6] iommu/riscv: support nested iommu for
 flushing cache
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	tjeznach@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, kevin.tian@intel.com, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_083531_781672_F4A9C3B1 
X-CRM114-Status: GOOD (  23.14  )
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

T24gVHVlLCBNYXkgNywgMjAyNCBhdCAxMTowOOKAr1BNIEphc29uIEd1bnRob3JwZSA8amdnQHpp
ZXBlLmNhPiB3cm90ZToKPgo+IE9uIFR1ZSwgTWF5IDA3LCAyMDI0IGF0IDEwOjI2OjAwUE0gKzA4
MDAsIFpvbmcgTGkgd3JvdGU6Cj4gPiBUaGlzIHBhdGNoIGltcGxlbWVudHMgY2FjaGVfaW52YWxp
ZGF0ZV91c2VyIG9wZXJhdGlvbiBmb3IgdGhlIHVzZXJzcGFjZQo+ID4gdG8gZmx1c2ggdGhlIGhh
cmR3YXJlIGNhY2hlcyBmb3IgYSBuZXN0ZWQgZG9tYWluIHRocm91Z2ggaW9tbXVmZC4KPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gPiAtLS0KPiA+
ICBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMgIHwgOTEgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4gPiAgaW5jbHVkZS91YXBpL2xpbnV4L2lvbW11ZmQuaCB8ICA5ICsr
KysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEwMCBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYyBiL2RyaXZlcnMvaW9tbXUvcmlzY3Yv
aW9tbXUuYwo+ID4gaW5kZXggN2VkYTg1MGRmNDc1Li40ZGQ1OGZlMjI0MmQgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMKPiA+ICsrKyBiL2RyaXZlcnMvaW9tbXUv
cmlzY3YvaW9tbXUuYwo+ID4gQEAgLTE1MjIsOSArMTUyMiwxMDAgQEAgc3RhdGljIHZvaWQgcmlz
Y3ZfaW9tbXVfZG9tYWluX2ZyZWVfbmVzdGVkKHN0cnVjdCBpb21tdV9kb21haW4gKmRvbWFpbikK
PiA+ICAgICAgIGtmcmVlKHJpc2N2X2RvbWFpbik7Cj4gPiAgfQo+ID4KPiA+ICtzdGF0aWMgaW50
IHJpc2N2X2lvbW11X2ZpeF91c2VyX2NtZChzdHJ1Y3QgcmlzY3ZfaW9tbXVfY29tbWFuZCAqY21k
LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBwc2Np
ZCwgdW5zaWduZWQgaW50IGdzY2lkKQo+ID4gK3sKPiA+ICsgICAgIHUzMiBvcGNvZGUgPSBGSUVM
RF9HRVQoUklTQ1ZfSU9NTVVfQ01EX09QQ09ERSwgY21kLT5kd29yZDApOwo+ID4gKwo+ID4gKyAg
ICAgc3dpdGNoIChvcGNvZGUpIHsKPiA+ICsgICAgIGNhc2UgUklTQ1ZfSU9NTVVfQ01EX0lPVElO
VkFMX09QQ09ERToKPiA+ICsgICAgICAgICAgICAgdTMyIGZ1bmMgPSBGSUVMRF9HRVQoUklTQ1Zf
SU9NTVVfQ01EX0ZVTkMsIGNtZC0+ZHdvcmQwKTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgaWYg
KGZ1bmMgIT0gUklTQ1ZfSU9NTVVfQ01EX0lPVElOVkFMX0ZVTkNfR1ZNQSAmJgo+ID4gKyAgICAg
ICAgICAgICAgICAgZnVuYyAhPSBSSVNDVl9JT01NVV9DTURfSU9USU5WQUxfRlVOQ19WTUEpIHsK
PiA+ICsgICAgICAgICAgICAgICAgICAgICBwcl93YXJuKCJUaGUgSU9USU5WQUwgZnVuY3Rpb246
IDB4JXggaXMgbm90IHN1cHBvcnRlZFxuIiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGZ1bmMpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsK
PiA+ICsgICAgICAgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICAgICAgICBpZiAoZnVuYyA9PSBS
SVNDVl9JT01NVV9DTURfSU9USU5WQUxfRlVOQ19HVk1BKSB7Cj4gPiArICAgICAgICAgICAgICAg
ICAgICAgY21kLT5kd29yZDAgJj0gflJJU0NWX0lPTU1VX0NNRF9GVU5DOwo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIGNtZC0+ZHdvcmQwIHw9IEZJRUxEX1BSRVAoUklTQ1ZfSU9NTVVfQ01EX0ZV
TkMsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBS
SVNDVl9JT01NVV9DTURfSU9USU5WQUxfRlVOQ19WTUEpOwo+ID4gKyAgICAgICAgICAgICB9Cj4g
PiArCj4gPiArICAgICAgICAgICAgIGNtZC0+ZHdvcmQwICY9IH4oUklTQ1ZfSU9NTVVfQ01EX0lP
VElOVkFMX1BTQ0lEIHwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBSSVNDVl9J
T01NVV9DTURfSU9USU5WQUxfR1NDSUQpOwo+ID4gKyAgICAgICAgICAgICByaXNjdl9pb21tdV9j
bWRfaW52YWxfc2V0X3BzY2lkKGNtZCwgcHNjaWQpOwo+ID4gKyAgICAgICAgICAgICByaXNjdl9p
b21tdV9jbWRfaW52YWxfc2V0X2dzY2lkKGNtZCwgZ3NjaWQpOwo+ID4gKyAgICAgICAgICAgICBi
cmVhazsKPiA+ICsgICAgIGNhc2UgUklTQ1ZfSU9NTVVfQ01EX0lPRElSX09QQ09ERToKPiA+ICsg
ICAgICAgICAgICAgLyoKPiA+ICsgICAgICAgICAgICAgICogRW5zdXJlIHRoZSBkZXZpY2UgSUQg
aXMgcmlnaHQuIFdlIGV4cGVjdCB0aGF0IFZNTSBoYXMKPiA+ICsgICAgICAgICAgICAgICogdHJh
bnNmZXJyZWQgdGhlIGRldmljZSBJRCB0byBob3N0J3MgZnJvbSBndWVzdCdzLgo+ID4gKyAgICAg
ICAgICAgICAgKi8KPiA+ICsgICAgICAgICAgICAgYnJlYWs7Cj4gPiArICAgICBkZWZhdWx0Ogo+
ID4gKyAgICAgICAgICAgICBwcl93YXJuKCJUaGUgdXNlciBjb21tYW5kOiAweCV4IGlzIG5vdCBz
dXBwb3J0ZWRcbiIsIG9wY29kZSk7Cj4gPiArICAgICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQ
UDsKPgo+IE5vIHVzZXJzcGFjZSB0cmlnZ2VyYWJsZSB3YXJuaW5ncy4KCkkgZG9uJ3QgY29tcGxl
dGUgdW5kZXJzdGFuZCBhYm91dCB0aGlzLiBDb3VsZCBJIGtub3cgd2hldGhlciB3ZSBzaG91bGQK
c3VwcHJlc3MgdGhlIG1lc3NhZ2UgYW5kIHJldHVybiB0aGUgZXJyb3IgZGlyZWN0bHksIG9yIGlm
IHdlIHNob3VsZApjb252ZXJ0IHRoZSB3YXJuaW5nIHRvIGFuIGVycm9yIChpLmUuIHByX2Vycik/
Cgo+Cj4gPiArc3RhdGljIGludCByaXNjdl9pb21tdV9jYWNoZV9pbnZhbGlkYXRlX3VzZXIoc3Ry
dWN0IGlvbW11X2RvbWFpbiAqZG9tYWluLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCBpb21tdV91c2VyX2RhdGFfYXJyYXkgKmFycmF5KQo+ID4g
K3sKPiA+ICsgICAgIHN0cnVjdCByaXNjdl9pb21tdV9kb21haW4gKnJpc2N2X2RvbWFpbiA9IGlv
bW11X2RvbWFpbl90b19yaXNjdihkb21haW4pOwo+ID4gKyAgICAgc3RydWN0IHJpc2N2X2lvbW11
X2RldmljZSAqaW9tbXU7Cj4gPiArICAgICBzdHJ1Y3QgcmlzY3ZfaW9tbXVfYm9uZCAqYm9uZDsK
PiA+ICsgICAgIHN0cnVjdCByaXNjdl9pb21tdV9jb21tYW5kIGNtZDsKPiA+ICsgICAgIHN0cnVj
dCBpb21tdV9od3B0X3Jpc2N2X2lvbW11X2ludmFsaWRhdGUgaW52X2luZm87Cj4gPiArICAgICBp
bnQgcmV0LCBpbmRleDsKPiA+ICsKPiA+ICsgICAgIGlmICghcmlzY3ZfZG9tYWluKQo+ID4gKyAg
ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ICsKPiA+ICsgICAgIC8qIEFzc3VtZSBhdHRh
Y2hlZCBkZXZpY2VzIGluIHRoZSBkb21haW4gZ28gdGhyb3VnaCB0aGUgc2FtZSBJT01NVSBkZXZp
Y2UgKi8KPgo+IE5vLCB5b3UgY2FuJ3QgYXNzdW1lIHRoYXQuCgpEbyB5b3UgdGhpbmsgdGhhdCBp
dCBtYWtlcyBzZW5zZSB0byBhZGQgYSByaXNjdl9pb21tdV9kZXZpY2Ugc3RydWN0dXJlCmluIHJp
c2N2X2lvbW11X2RvbWFpbj8gT3Igd2UgbWlnaHQgbmVlZCB0byBhZGQgc29tZSBkYXRhIHN0cnVj
dHVyZSB0bwpidWlsZCB0aGUgbWFwcGluZyBvZiB0aGUgcmlzY3ZfaW9tbXVfZGV2aWNlIGFuZCBy
aXNjdl9pb21tdV9kb21haW4sCnRoZW4gd2UgY2FuIGdldCB0aGUgY29ycmVzcG9uZGluZyByaXNj
dl9pb21tdV9kZXZpY2UgYnkKcmlzY3ZfaW9tbXVfZG9tYWluPwpUaGFua3MKCj4KPiBKYXNvbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
