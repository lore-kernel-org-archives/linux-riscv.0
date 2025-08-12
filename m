Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8994EC87FCB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 16:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQh1G/GxNZW1gP5Ht3Kx1tOHEUWMthrOZ/Pus1spe64=; b=QVcqrvjbgexyRZ
	sdwkmVKIoSQBCvo7W/cUKw1lLf57X0xgZeXMN2Ju2j9rmfgx8Bz5bxy9NQ/LuFJRGedgFK+5G22Uu
	/6RKnEwi36Bxij6dV8YrCBraF4L8ojFsvUZdD4b3BQGFXtmxHW6VWubATCIFHRcUojn9e4jaU7LTK
	8ecChDaPUP0aKqZzX8piPPSGOb+EXJAvY4DAwP+kyQTN91sUr0fm6FCvwQbF9F7RQxqjvoJ5A/IUh
	8Wb7Ce8ZWnzswYQHb5fhLLevr9BDPuwssIRGepcFCc7wzKo6mfLmvOndAxdoT3fAC7uVj3p/Xvtv3
	1WmjrkFZag6yqiO6wi/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uls3n-0000000BS32-0H3t;
	Tue, 12 Aug 2025 16:41:15 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulp72-0000000AvyX-1fW0
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 13:32:25 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-433f599d5b9so3534003b6e.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 Aug 2025 06:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1755005542; x=1755610342; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKMJP6DIKNaNb9e/aM/CY6qYW/+/BiIO2tSY1DOCRC0=;
        b=Pl2qP2V+iOPaXO97XurkItVs+ogxMMGL4baf9L2FzW3qH4SOyRx4ufAmPFaZYQo7wI
         iBg7TcJq+WXigbfjZ4TEBCfxNNDDJFvUugEmq9a6X0iRTUR9MO8GNmTJQXdNr4ci3Oyb
         VgHUBJAbsh2xsPgCE8H894PKGVz3gNlRRstq/BSK2IWJHhKMLWM6uYoqiGTph8rvGC4h
         0VCtTlpiEHhz95HkivDY7TXGdhWRyS7J/s1iAC5V8fEiDIfYNglVi0Z67d7OAp12XLfP
         1J+q29+N06OorGhPdMnOKa915j5efLf0kvidNbzE0ljiADbnnbYNcIZLU9WCfiKUyBGn
         ETlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755005542; x=1755610342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKMJP6DIKNaNb9e/aM/CY6qYW/+/BiIO2tSY1DOCRC0=;
        b=TsHXx2KIDRTPh0Q9AXRwwHHmTjPq/rsO3yMztpIWCb9bkMQrZIYGzUcyj+hOzZCs3u
         4XTK/22AeKk023Ioe08bp2BQEjQ/g2ZBwwvr8YOLM+eb7zZsS355OchR1QEOwcwhf1Xj
         YWdluHxDwcc9leCrSU73BJM/dwvGXzv9RjHjF7iu6EAKLtmhNRfdZAwepESVYt3bkzXH
         SCm6sVmj3Xci6+bfsKA9A1Xlykgd3ZSGDG1iAEkg6c+WAHTscPI9Kr4pPuix1PzuFtLI
         RlWRTm0rmd0VzmleL8eWTkdVmsRW9gT6+B+5CFt6H4OmHdjLHjBlDW/vh+fDt8hRY6oq
         mM8w==
X-Forwarded-Encrypted: i=1; AJvYcCXRC+TaEAkmn+oFqi7opWjA0IC5Hf3B0mThwUbv97Oxou8oQ4JC3pJPtcp8YRle9V8+eAOzyfQdJ3pEAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsBMA/bZWGGGRXBebAXGG0BW4/uFnctM7toBTrVev30Z1XNdWg
	zOPQQOBlgSl7YdhMRasETyMPk28tvd5s7NjsThiPhcjd8vOBauJwoAY9aGBD8z/v2USw/Lg6Hkm
	vzY0Eza24zVc26u9q1q20IQ9XD0HYLUb+H2tn3c8BpA==
X-Gm-Gg: ASbGncuffsHctYa+BUTl8nIm9MN5XLbFlCO9q/G2Mpyfe8u8SrroCt1paeKj3D7BKs6
	49kov7YE75IEDpwfhnLLcCHCMTXQlpymoSNIKpg8qO2N7pKamQsmqFdHXawKW+U9GFBEEZnC4Pg
	tPqk3fltdmTzJQedaepst46AW8tCwWvotoj5RvIOn6SaARIUfz28IzCFK3GbbcvfPr44gVoOnCJ
	j/BsbLogKFYpZmRb1pd
X-Google-Smtp-Source: AGHT+IF75Opbei0pOtMtFSYOAxsp8zj+N82lGQSRfSLagQ6UXFksL0Qth/N+YhLBTfQy9h6H44nrbm/bU7sjHpb/61c=
X-Received: by 2002:a05:6808:4f2b:b0:435:73d6:a3c5 with SMTP id
 5614622812f47-435c91d0663mr2191038b6e.28.1755005542352; Tue, 12 Aug 2025
 06:32:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250515094301.40016-1-cuiyunhui@bytedance.com>
 <CAEEQ3w=XqoKmVu1kvc5XUbGbQJsHVkRx=T65tXvYEYo0HCTcnQ@mail.gmail.com> <aJs-aPH32OxpzR3G@sunil-laptop>
In-Reply-To: <aJs-aPH32OxpzR3G@sunil-laptop>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 12 Aug 2025 21:32:10 +0800
X-Gm-Features: Ac12FXzZDx2qdp0GWoD-x1Xk1VxI9-W9Mj81VMSYnU8MQ8i6GLOZDnFvumFdIFA
Message-ID: <CAEEQ3wnHFPBPC0U59rDBJaZYxJ24uJzJ7NDQO0gfmVqoiQwNOw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] ACPI: RISC-V: CPPC: Add CSR_CYCLE for CPPC FFH
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: rafael@kernel.org, lenb@kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>, 
	Rahul Pathak <rpathak@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_063224_588159_CDC39AB9 
X-CRM114-Status: GOOD (  28.29  )
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

SGkgU3VuaWwsCgoKT24gVHVlLCBBdWcgMTIsIDIwMjUgYXQgOToxNeKAr1BNIFN1bmlsIFYgTCA8
c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgQXVnIDEyLCAyMDI1
IGF0IDA3OjI1OjQ0UE0gKzA4MDAsIHl1bmh1aSBjdWkgd3JvdGU6Cj4gPiBIaSBTdW5pbCwKPiA+
Cj4gPiBPbiBUaHUsIE1heSAxNSwgMjAyNSBhdCA1OjQ04oCvUE0gWXVuaHVpIEN1aSA8Y3VpeXVu
aHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBBZGQgdGhlIHJlYWQgb2YgQ1NS
X0NZQ0xFIHRvIGNwcGNfZmZoX2Nzcl9yZWFkKCkgdG8gZml4IHRoZQo+ID4gPiB3YXJuaW5nIG1l
c3NhZ2U6ICJDUFBDIENwdWZyZXE6IGNwcGNfc2NhbGVfZnJlcV93b2tyZm46IGZhaWxlZAo+ID4g
PiB0byByZWFkIHBlcmYgY291bnRlcnMiLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZdW5o
dWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJz
L2FjcGkvcmlzY3YvY3BwYy5jIHwgNSArKysrLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9hY3BpL3Jpc2N2L2NwcGMuYyBiL2RyaXZlcnMvYWNwaS9yaXNjdi9jcHBjLmMKPiA+ID4gaW5k
ZXggNGNkZmYzODdkZWZmNi4uYzFhY2FlYjE4ZWFjMyAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVy
cy9hY3BpL3Jpc2N2L2NwcGMuYwo+ID4gPiArKysgYi9kcml2ZXJzL2FjcGkvcmlzY3YvY3BwYy5j
Cj4gPiA+IEBAIC02OSwxMSArNjksMTQgQEAgc3RhdGljIHZvaWQgY3BwY19mZmhfY3NyX3JlYWQo
dm9pZCAqcmVhZF9kYXRhKQo+ID4gPiAgICAgICAgIHN0cnVjdCBzYmlfY3BwY19kYXRhICpkYXRh
ID0gKHN0cnVjdCBzYmlfY3BwY19kYXRhICopcmVhZF9kYXRhOwo+ID4gPgo+ID4gPiAgICAgICAg
IHN3aXRjaCAoZGF0YS0+cmVnKSB7Cj4gPiA+IC0gICAgICAgLyogU3VwcG9ydCBvbmx5IFRJTUUg
Q1NSIGZvciBub3cgKi8KPiA+ID4gICAgICAgICBjYXNlIENTUl9USU1FOgo+ID4gPiAgICAgICAg
ICAgICAgICAgZGF0YS0+cmV0LnZhbHVlID0gY3NyX3JlYWQoQ1NSX1RJTUUpOwo+ID4gPiAgICAg
ICAgICAgICAgICAgZGF0YS0+cmV0LmVycm9yID0gMDsKPiA+ID4gICAgICAgICAgICAgICAgIGJy
ZWFrOwo+ID4gPiArICAgICAgIGNhc2UgQ1NSX0NZQ0xFOgo+ID4gPiArICAgICAgICAgICAgICAg
ZGF0YS0+cmV0LnZhbHVlID0gY3NyX3JlYWQoQ1NSX0NZQ0xFKTsKPiA+ID4gKyAgICAgICAgICAg
ICAgIGRhdGEtPnJldC5lcnJvciA9IDA7Cj4gPiA+ICsgICAgICAgICAgICAgICBicmVhazsKPiA+
ID4gICAgICAgICBkZWZhdWx0Ogo+ID4gPiAgICAgICAgICAgICAgICAgZGF0YS0+cmV0LmVycm9y
ID0gLUVJTlZBTDsKPiA+ID4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiAtLQo+ID4gPiAy
LjM5LjIKPiA+ID4KPiA+Cj4gPiBUaGUgcHVycG9zZSBvZiBjcHBjX2ZmaF9jc3JfcmVhZCgpIGlz
IHRvIGNhbGN1bGF0ZSB0aGUgYWN0dWFsCj4gPiBmcmVxdWVuY3kgb2YgdGhlIENQVSwgd2hpY2gg
aXMgZGVsdGFfQ1NSX0NZQ0xFL2RlbHRhX0NTUl9YWFguCj4gPgo+ID4gQ1NSX1hYWCBzaG91bGQg
YmUgYSByZWZlcmVuY2UgY2xvY2sgYW5kIGRvZXMgbm90IGNvdW50IGR1cmluZyBXRkkKPiA+IChX
YWl0IEZvciBJbnRlcnJ1cHQpLgo+ID4KPiA+IFNpbWlsYXIgc29sdXRpb25zIGluY2x1ZGU6IHg4
NidzIGFwZXJmL21wZXJmLCBhbmQgQVJNNjQncyBBTVUgd2l0aAo+ID4gcmVnaXN0ZXJzIFNZU19B
TUVWQ05UUjBfQ09SRV9FTDAvU1lTX0FNRVZDTlRSMF9DT05TVF9FTDAuCj4gPgo+ID4gSG93ZXZl
ciwgd2Uga25vdyB0aGF0IENTUl9USU1FIGluIHRoZSBjdXJyZW50IGNvZGUgZG9lcyBjb3VudCBk
dXJpbmcKPiA+IFdGSS4gU28sIGlzIHRoaXMgZGVzaWduIHVucmVhc29uYWJsZT8KPiA+Cj4gPiBT
aG91bGQgd2UgY29uc2lkZXIgcHJvcG9zaW5nIGFuIGV4dGVuc2lvbiB0byBzdXBwb3J0IHN1Y2gg
YSBkZWRpY2F0ZWQKPiA+IGNvdW50ZXIgKGEgcmVmZXJlbmNlIGNsb2NrIHRoYXQgZG9lcyBub3Qg
Y291bnQgZHVyaW5nIFdGSSk/IFRoaXMgd2F5LAo+ID4gdGhlIHZhbHVlIGNhbiBiZSBvYnRhaW5l
ZCBkaXJlY3RseSBpbiBTLW1vZGUgd2l0aG91dCB0cmFwcGluZyB0bwo+ID4gTS1tb2RlLCBlc3Bl
Y2lhbGx5IHNpbmNlIHJlYWRpbmcgdGhpcyBjb3VudGVyIGlzIHZlcnkgZnJlcXVlbnQuCj4gPgo+
IEhpIFl1bmh1aSwKPgo+IFllcywgYnV0IHdlIGFudGljaXBhdGVkIHRoYXQgdmVuZG9ycyBtaWdo
dCBkZWZpbmUgdGhlaXIgb3duIGN1c3RvbSBDU1JzLgo+IFNvLCB3ZSBpbnRyb2R1Y2VkIEZGSCBl
bmNvZGluZyB0byBhY2NvbW1vZGF0ZSBzdWNoIGNhc2VzLgo+Cj4gVGhhbmtzLAo+IFN1bmlsCgpB
cyBtZW50aW9uZWQgZWFybGllciwgaXQgaXMgYmVzdCB0byBkaXJlY3RseSByZWFkIENTUl9YWFgg
KGEgcmVmZXJlbmNlCmNsb2NrIHRoYXQgZG9lcyBub3QgY291bnQgZHVyaW5nIFdGSSkgYW5kIENT
Ul9DWUNMRSBpbiBTLW1vZGUsIHJhdGhlcgp0aGFuIHRyYXBwaW5nIHRvIFNCSS4KCmRyaXZlcnMv
YWNwaS9yaXNjdi9jcHBjLmMgaXMgYSBnZW5lcmljIGRyaXZlciB0aGF0IGlzIG5vdCBzcGVjaWZp
YyB0bwphbnkgdmVuZG9yLiBDdXJyZW50bHksIHRoZSB1cHN0cmVhbSBjb2RlIGFscmVhZHkgdXNl
cyBDU1JfVElNRSwgYW5kCnRoZSBsb2dpYyBvZiBDU1JfVElNRSBpcyBpbmNvcnJlY3QuCgpJdCB3
b3VsZCBiZSBiZXN0IHRvIHByb21vdGUgYSBzcGVjaWZpY2F0aW9uIHRvIHN1cHBvcnQgQ1NSX1hY
WCwganVzdApsaWtlIHdoYXQgaGFzIGJlZW4gZG9uZSBmb3IgeDg2IGFuZCBhcm02NC4gV2hhdCBk
byB5b3UgdGhpbms/CgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
