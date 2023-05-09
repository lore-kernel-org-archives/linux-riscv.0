Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338B5C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 16:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2SlfeE3vCC1LXn6+GinutPDZHRZ42Bqo5k76YfOFC4E=; b=cM5lIwUYjJ8VgE
	M0YpeBEVbqvN0+1cpiscfVZe1Y7Lxd+wjp/VDMifRXphRaVqIyA7Kpdzw2d8WpEPLDCVq7X2cAtKd
	MjuXEye55M1ip3eRVH8TQEQxnizYbmxNIkIMcsI508/nb9mB2U73m7qqWuODyoiHQYWm+tetZ2y4j
	XMZT4RRfd9TbXazv9bWepcJxm969lEoNwUBBSwW9jcLx0C48sN3/bM3U93IhGCOWD9+XeqY98SFVZ
	cwg0WiHsov9yeoYpEACbmdP0lmxb2+yAN7bAPGYLZd3kZ67kQW7l6JhAvuXwIw3/irK63O35q386H
	YXSOuCRCxub49d0qhKsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwPpF-003lB1-0Z;
	Tue, 09 May 2023 16:04:29 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwPpC-003l9h-1H
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 16:04:27 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f1411e8111so6796712e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 09:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1683648264; x=1686240264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5eI2yzNCfdr9SsLOpnjF/NfxrXE0SJgMXU078Kgt/I=;
        b=J0pEnRua2uyGW9LomKvzRZcRaZoMbGkoXEwVtzd/6euViySYeB9iFTNBXV0uuWPBCF
         vskxrrYyS2phpkjiJ3gMDe8j3zdvUHtszIbazvGuWdXKPVUwdCqGTa2Q0oISrb5rpFfJ
         Y2j62+v2Rq4VqYRg1FyQR1cUC0pddLk3LLrKMtHVNlQxuOj5XazbiUO6YlyY3H9CJdyK
         m7hlbAHkWcpLNeMxhjfWVu57Me7r6PHsVoqxz7eNR2V3NwYPCnIbYTijf3lHNMwdq88V
         d5K9nZ/mvV1e3rFmF5FH+AnPmxpc3CGPYodVaD2g6jeGiQNgB6Rmz4P7Jelmn6aohkHG
         Hg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683648264; x=1686240264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P5eI2yzNCfdr9SsLOpnjF/NfxrXE0SJgMXU078Kgt/I=;
        b=ilyR4fbFtIVx3hJSt/m7h/EE4syG07vGronlqDGby0QglQhLh0CW19x/utqlfEhzT1
         xzDwi491/LNizyD+UbZNw2rGTprouSW/4owFCyX7lZ/NIeTzqkPhTYFft1Ah+8+/EOmi
         cGgTs30JMxT5VY1mOiBpRH376vrQQFl44FwBr7zQaogISjIswc5DC0V8gcdrfwssFnEF
         EUDT3a+GJ4496ShVqhfmyVrUUPQuOxnaoXH4eHk7dtYuSasmCsYndelfavVeT2jP3a49
         zcvs3v//SvfIbphphs0MIZ97/fNQxVNJHJqoSBrB8ljjd8kvwjd9zmqgpMdsPQbHfstb
         xS6g==
X-Gm-Message-State: AC+VfDy2r2ww8T+ZYxOmVoUv1FaZV/3HOFGOPVpMC8ydFNWEn5NPO+cE
	a5l+cpFz6g/aBzVVv9tu9IGpWRfYIbIpAP5tFpOeug==
X-Google-Smtp-Source: ACHHUZ5ny9OYUO8ttAEKM8lx+rDZbiwo4O5HMSbiqxwuUjYxEq/NRzUx+9FkFZuIuyZAI6xXQ2pLEnMwlpjaOWp2y2s=
X-Received: by 2002:ac2:593a:0:b0:4eb:44c2:ab6c with SMTP id
 v26-20020ac2593a000000b004eb44c2ab6cmr845205lfi.2.1683648263872; Tue, 09 May
 2023 09:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230509103033.11285-1-andy.chiu@sifive.com> <20230509103033.11285-24-andy.chiu@sifive.com>
 <20230509-resilient-lagoon-265e851e5bf8@wendy>
In-Reply-To: <20230509-resilient-lagoon-265e851e5bf8@wendy>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 10 May 2023 00:04:12 +0800
Message-ID: <CABgGipXvVw8GWeVLTuTJT9Hus-pEPUcgRhO3oovKYOAZK3fAEg@mail.gmail.com>
Subject: Re: [PATCH -next v19 23/24] riscv: Enable Vector code to be built
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org, 
	atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_090426_567177_36099AA3 
X-CRM114-Status: GOOD (  30.63  )
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

T24gVHVlLCBNYXkgOSwgMjAyMyBhdCA4OjM14oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vci5kb29s
ZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4KPiBIZXkgQW5keSwKPgo+IE9uIFR1ZSwgTWF5IDA5
LCAyMDIzIGF0IDEwOjMwOjMyQU0gKzAwMDAsIEFuZHkgQ2hpdSB3cm90ZToKPiA+IEZyb206IEd1
byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+Cj4gPiBUaGlzIHBhdGNoIGFkZHMg
YSBjb25maWcgd2hpY2ggZW5hYmxlcyB2ZWN0b3IgZmVhdHVyZSBmcm9tIHRoZSBrZXJuZWwKPiA+
IHNwYWNlLgo+Cj4gVGhpcyBjb21taXQgbWVzc2FnZSBwcm9iYWJseSBuZWVkcyB0byBjaGFuZ2Us
IGl0J3Mgbm90IGV4YWN0bHkgZG9pbmcKPiB0aGF0IGFueW1vcmUhCgpZZXMsIEkgdG90YWxseSBt
aXNzZWQgdGhhdCBwYXJ0LiBJIHdpbGwgZ2V0IGNvbW1pdCBtZXNzYWdlcyB1cGRhdGVkCndoZW4g
aXQncyB0aW1lIGZvciB0aGUgbmV4dCByZXZpc2lvbi4KCj4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1
byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+IENvLWRldmVsb3BlZC1ieTogR3Jl
ZW50aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEdy
ZWVudGltZSBIdSA8Z3JlZW50aW1lLmh1QHNpZml2ZS5jb20+Cj4KPiA+IFN1Z2dlc3RlZC1ieTog
VmluZWV0IEd1cHRhIDx2aW5lZXRnQHJpdm9zaW5jLmNvbT4KPiA+IFN1Z2dlc3RlZC1ieTogQXRp
c2ggUGF0cmEgPGF0aXNocEBhdGlzaHBhdHJhLm9yZz4KPgo+IEFuZCBJIHN1c3BlY3QgdGhhdCB0
aGVzZSB0d28gYXJlIGFsc28gbGlrZWx5IGluYWNjdXJhdGUgYXQgdGhpcyBwb2ludCwKPiBidXQg
SURDLgoKQWdyZWUuIEkgYW0gZ29pbmcgdG8gZHJvcCB0aGVzZS4KCj4KPiA+IENvLWRldmVsb3Bl
ZC1ieTogQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6
IEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNpZml2ZS5jb20+Cj4gPiAtLS0KPiA+IENoYW5nZWxvZyBW
MTk6Cj4gPiAgLSBBZGQgUklTQ1ZfVl9ESVNBQkxFIHRvIHNldCBjb21waWxlLXRpbWUgZGVmYXVs
dC4KPiA+Cj4gPiAgYXJjaC9yaXNjdi9LY29uZmlnICB8IDMxICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPiA+ICBhcmNoL3Jpc2N2L01ha2VmaWxlIHwgIDYgKysrKystCj4gPiAgMiBm
aWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gaW5k
ZXggMTAxOWI1MTlkNTkwLi5mYTI1NmYyZTIzYzEgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2
L0tjb25maWcKPiA+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gQEAgLTQ2Niw2ICs0NjYs
MzcgQEAgY29uZmlnIFJJU0NWX0lTQV9TVlBCTVQKPiA+Cj4gPiAgICAgICAgICBJZiB5b3UgZG9u
J3Qga25vdyB3aGF0IHRvIGRvIGhlcmUsIHNheSBZLgo+ID4KPiA+ICtjb25maWcgVE9PTENIQUlO
X0hBU19WCj4gPiArICAgICBib29sCj4gPiArICAgICBkZWZhdWx0IHkKPiA+ICsgICAgIGRlcGVu
ZHMgb24gITY0QklUIHx8ICQoY2Mtb3B0aW9uLC1tYWJpPWxwNjQgLW1hcmNoPXJ2NjRpdikKPiA+
ICsgICAgIGRlcGVuZHMgb24gITMyQklUIHx8ICQoY2Mtb3B0aW9uLC1tYWJpPWlscDMyIC1tYXJj
aD1ydjMyaXYpCj4gPiArICAgICBkZXBlbmRzIG9uIExMRF9WRVJTSU9OID49IDE0MDAwMCB8fCBM
RF9WRVJTSU9OID49IDIzODAwCj4gPiArICAgICBkZXBlbmRzIG9uIEFTX0hBU19PUFRJT05fQVJD
SAo+ID4gKwo+ID4gK2NvbmZpZyBSSVNDVl9JU0FfVgo+ID4gKyAgICAgYm9vbCAiVkVDVE9SIGV4
dGVuc2lvbiBzdXBwb3J0Igo+ID4gKyAgICAgZGVwZW5kcyBvbiBUT09MQ0hBSU5fSEFTX1YKPiA+
ICsgICAgIGRlcGVuZHMgb24gRlBVCj4gPiArICAgICBzZWxlY3QgRFlOQU1JQ19TSUdGUkFNRQo+
ID4gKyAgICAgZGVmYXVsdCB5Cj4gPiArICAgICBoZWxwCj4gPiArICAgICAgIFNheSBOIGhlcmUg
aWYgeW91IHdhbnQgdG8gZGlzYWJsZSBhbGwgdmVjdG9yIHJlbGF0ZWQgcHJvY2VkdXJlCj4gPiAr
ICAgICAgIGluIHRoZSBrZXJuZWwuCj4gPiArCj4gPiArICAgICAgIElmIHlvdSBkb24ndCBrbm93
IHdoYXQgdG8gZG8gaGVyZSwgc2F5IFkuCj4gPiArCj4gPiArY29uZmlnIFJJU0NWX1ZfRElTQUJM
RQo+ID4gKyAgICAgYm9vbCAiRGlzYWJsZSB1c2Vyc3BhY2UgVmVjdG9yIGJ5IGRlZmF1bHQiCj4g
PiArICAgICBkZXBlbmRzIG9uIFJJU0NWX0lTQV9WCj4gPiArICAgICBkZWZhdWx0IG4KPiA+ICsg
ICAgIGhlbHAKPiA+ICsgICAgICAgU2F5IFkgaGVyZSBpZiB5b3Ugd2FudCB0byBkaXNhYmxlIGRl
ZmF1bHQgZW5hYmxlbWVudCBzdGF0ZSBvZiBWZWN0b3IKPiA+ICsgICAgICAgaW4gdS1tb2RlLiBU
aGlzIHdheSB1c2Vyc3BhY2UgaGFzIHRvIG1ha2UgZXhwbGljaXQgcHJjdGwoKSBjYWxsIHRvCj4g
PiArICAgICAgIGVuYWJsZSBWZWN0b3IsIG9yIGVuYWJsZSBpdCB2aWEgc3lzY3RsIGludGVyZmFj
ZS4KPgo+IElmIHdlIGFyZSB3b3JyaWVkIGFib3V0IGJyZWFraW5nIHVzZXJzcGFjZSwgd2h5IGlz
IHRoZSBkZWZhdWx0IGZvciB0aGlzCj4gb3B0aW9uIG5vdCB5PyBPciBmdXJ0aGVyLAo+Cj4gY29u
ZmlnIFJJU0NWX0lTQV9WX0RFRkFVTFRfRU5BQkxFCj4gICAgICAgICBib29sICJFbmFibGUgdXNl
cnNwYWNlIFZlY3RvciBieSBkZWZhdWx0Igo+ICAgICAgICAgZGVwZW5kcyBvbiBSSVNDVl9JU0Ff
Vgo+ICAgICAgICAgaGVscAo+ICAgICAgICAgICBTYXkgWSBoZXJlIHRvIGFsbG93IHVzZSBvZiBW
ZWN0b3IgaW4gdXNlcnNwYWNlIGJ5IGRlZmF1bHQuCj4gICAgICAgICAgIE90aGVyd2lzZSwgdXNl
cnNwYWNlIGhhcyB0byBtYWtlIGFuIGV4cGxpY2l0IHByY3RsKCkgY2FsbCB0bwo+ICAgICAgICAg
ICBlbmFibGUgVmVjdG9yLCBvciBlbmFibGUgaXQgdmlhIHRoZSBzeXNjdGwgaW50ZXJmYWNlLgo+
Cj4gICAgICAgICAgIElmIHlvdSBkb24ndCBrbm93IHdoYXQgdG8gZG8gaGVyZSwgc2F5IE4uCj4K
ClllcywgZXhwcmVzc2luZyB0aGUgb3B0aW9uLCB3aGVyZSBZIG1lYW5zICJvbiIsIGlzIG1vcmUg
ZGlyZWN0LiBCdXQgSQpoYXZlIGEgbGl0dGxlIGNvbmNlcm4gaWYgd2UgbWFrZSB0aGUgZGVmYXVs
dCBhcyAib2ZmIi4gWWVzLCB3ZSBjcmVhdGUKdGhpcyBvcHRpb24gaW4gdGhlIHdvcnJpZXMgb2Yg
YnJlYWtpbmcgdXNlcnNwYWNlLiBCdXQgZ2l2ZW4gdGhhdCB0aGUKYnJlYWsgY2FzZSBtaWdodCBi
ZSByYXJlLCBpcyBpdCB3b3J0aCBtYWtpbmcgdXNlcnNwYWNlIFZlY3RvciBoYXJkZXIKdG8gdXNl
IGJ5IGRvaW5nIHRoaXM/IEkgYXNzdW1lIGluIGFuIGlkZWFsIHdvcmxkIHRoYXQgbm90aGluZyB3
b3VsZApicmVhayBhbmQgcHJvZ3JhbXMgY291bGQganVzdCB1c2UgViB3aXRob3V0IGJvdGhlcmlu
ZyB3aXRoIHByY3RsKCksIG9yCnN5c2N0bC4gQnV0IG9uIHRoZSBvdGhlciBoYW5kLCB0byBtYWtl
IGEgcHJvZ3JhbSByb2J1c3QgZW5vdWdoLCB3ZQptdXN0IGNoZWNrIHRoZSBzdGF0dXMgd2l0aCB0
aGUgcHJjdGwoKSBhbnl3YXkuIFNvIEkgaGF2ZSBubyBhbnN3ZXIKaGVyZS4KCj4gVGhhbmtzLAo+
IENvbm9yLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
