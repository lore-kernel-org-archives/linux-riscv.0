Return-Path: <SRS0=QYSg=PL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E77FC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  3 Jan 2019 03:51:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E473B2073D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  3 Jan 2019 03:51:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FYcgp6J1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JN5L7H2s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E473B2073D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+7fbSuqt/39FHFMAFeQXp2o4aFJhh7I1XfE0giDktYI=; b=FYcgp6J1edilMbVz5k1V6QMRi
	CGKqqHjIUDF/8QqlHSnECtNzOIU2EMyh5n238qOTVpHzm3FYTHs7opu1UKoNt0QWahOoK599HzEnv
	Vh9g5s91wq9Kn3j2lPvtyetoQUqt91RObWvk8YlBxP1Dg45ZbGTMGyANdKcHkCMGFUaLfpOptFJ5S
	ek/zjne6h378x7stCVGrhN5aIiDWsIHFJcwOw+1W387lZ4AnULIRfbN0WkcceChf3UKM+2hbaEqtw
	nUK5FRG3xg2FdlIE3AH/UQxNZgoYrSwuzMnxuGKQVpBHJ44zLgNrpXD9xAsSHPkSpHlCaOASubhho
	GEFwolPnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1geu31-0002Gh-Do; Thu, 03 Jan 2019 03:51:55 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1geu2y-0002GM-Fq
 for linux-riscv@lists.infradead.org; Thu, 03 Jan 2019 03:51:54 +0000
Received: by mail-pg1-x541.google.com with SMTP id y4so15409313pgc.12
 for <linux-riscv@lists.infradead.org>; Wed, 02 Jan 2019 19:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/iXBDsKqAl85oIRTOFxWND+01sZ6ulS8hxqlV9QvcPA=;
 b=JN5L7H2sXvdsse8+HanF7vX5qja2wv5kHWJTqeUAU01zfnBrYl0qRXAsxiQ/Z1m4DL
 BLMt5OVkJiVojL9OG4+POSwDHO3ZILS5zyWbO7HRnvZ71KDOx9s8DxUWoMa14oPUOqTz
 fGIUOmoofvVsPSE8zq/ey248QM6YhONUPG4OxX4+H3g4zsBXTN0etJHY0W/I6wqfWrkz
 fhMD4n7IPSWKalqXhqt/CrCEsVu9p12S16oujBsTHO+CFmPFoZVGymg1ic8YsOH15nJ0
 vPOk9oTiJwHwAXkMHKpXxLJXbhz2YkVAwKeGHOu7Be8kRIFqKlUlShwp7ribmL6YwE9w
 shcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/iXBDsKqAl85oIRTOFxWND+01sZ6ulS8hxqlV9QvcPA=;
 b=Plhuodrr9ovHFJz3zmiC2sEaMXgt0ci72OE/nCBzZ56OzfCIy7YGWvtAeQ1PxXQWSO
 EYVADbAUYthBkMZzVhGZCFYdijwJcHc6/2lllP310o77KCpUf+u4aGt5Vz+FMufXMyPv
 5f0dP62Yr9I4u2rOY9Jqlv8q7sLmgEUxUIqu1CqTYObaYjy4eSs2zq5mSk8mfr4bC4Tf
 b8dkJPLGqXJKiwuuh7oyv6tBhJsUsz2CZ3bhXQAqFFgYqAR16HkYrfF7LbfKll2PDE5W
 xStVCi1gFCkR6HuMJc72TMZ6dfRDpIBCIQalc6Sv9c/koctuN+KcXh2vQvjMmZFFSk+p
 fpFg==
X-Gm-Message-State: AJcUukfcVfCdGv//xyhs28evs84v9zO2ljS/iZOlqIt9JdKuDrTDMhke
 AeH9o44QEc2hEOjXI3ElQEw=
X-Google-Smtp-Source: ALg8bN5pEEbc3+M8xHpbuU+jIWzXyUp4Kf6iEVyQqaG7gwnyt95Qpbh/Q5j2b5fyq0BE7pxZPz4RKQ==
X-Received: by 2002:a63:85c6:: with SMTP id
 u189mr15214517pgd.156.1546487511020; 
 Wed, 02 Jan 2019 19:51:51 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 q1sm89929289pgs.14.2019.01.02.19.51.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Jan 2019 19:51:50 -0800 (PST)
Subject: Re: [PATCH] RISC-V: Add CONFIG_PREEMPT=y to defconfig
To: Vincent Chen <deanbo422@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
References: <20181226032350.GA27044@roeck-us.net>
 <mhng-856d9dbc-a4f1-47c3-a71c-d1f7ae82184b@palmer-si-x1c4>
 <CAJsyPhyA_u2Syoq1tN73qx=sgddb1KS9DY7Tn98jetoCU+R8ug@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <122457cb-bf56-0d47-3f30-2e2beecccd7f@roeck-us.net>
Date: Wed, 2 Jan 2019 19:51:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAJsyPhyA_u2Syoq1tN73qx=sgddb1KS9DY7Tn98jetoCU+R8ug@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190102_195152_527067_C190993B 
X-CRM114-Status: GOOD (  21.29  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMS8yLzE5IDY6NTkgUE0sIFZpbmNlbnQgQ2hlbiB3cm90ZToKPiBQYWxtZXIgRGFiYmVsdCA8
cGFsbWVyQHNpZml2ZS5jb20+IOaWvCAyMDE45bm0MTLmnIgyN+aXpSDpgLHlm5sg5LiK5Y2IMTox
OeWvq+mBk++8mgo+Pgo+PiBPbiBUdWUsIDI1IERlYyAyMDE4IDE5OjIzOjUwIFBTVCAoLTA4MDAp
LCBsaW51eEByb2Vjay11cy5uZXQgd3JvdGU6Cj4+PiBPbiBXZWQsIERlYyAxOSwgMjAxOCBhdCAw
OToyNToyMVBNIC0wODAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+Pj4+IE9uIFdlZCwgRGVjIDE5
LCAyMDE4IGF0IDA1OjQ1OjExUE0gLTA4MDAsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6Cj4+Pj4+IE9u
IFdlZCwgTm92IDIxLCAyMDE4IGF0IDEwOjU4OjA1QU0gLTA4MDAsIFBhbG1lciBEYWJiZWx0IHdy
b3RlOgo+Pj4+Pj4gSSBkb24ndCByZW1lbWJlciB3aG8gc3VnZ2VzdGVkIHRoaXMsIGJ1dCBJIHdh
cyB0YWxraW5nIHRvIHNvbWVvbmUgYXQKPj4+Pj4+IFBsdW1iZXJzIGFib3V0IGFsbCB0aGUgaG9y
cmlibGUgYnVncyB3ZSd2ZSBoYWQgbHVya2luZyBhcm91bmQgaW4gb3VyCj4+Pj4+PiBwb3J0IGRl
c3BpdGUgaXQgc3RpbGwgZ2V0dGluZyB0byB1c2Vyc3BhY2UgYW5kIHRoZXkgc3VnZ2VzdGVkIHRo
YXQgSQo+Pj4+Pj4gZW5hYmxlIENPTkZJR19QUkVFTVBUIGluIG91ciBkZWZjb25maWcgYXMgaXQn
bGwgaGVscCBzaGFrZSBvdXQgbW9yZQo+Pj4+Pj4gaXNzdWVzLgo+Pj4+Pj4KPj4+Pj4+IFRoaXMg
cGF0Y2ggZW5hYmxlcyBDT05GSUdfUFJFRU1QVCBpbiB0aGUgc2luZ2xlIFJJU0MtViBkZWZjb25m
aWcuICBJdAo+Pj4+Pj4gc3RpbGwgcGFzc2VzIG15IHRlc3RzIChpZSwgYm9vdGluZyBGZWRvcmEg
b24gUUVNVSkuICBNYXliZSBJJ20gdG9vCj4+Pj4+PiBwYXJhbm9pZCwgYnV0IEkgc3RpbGwgZG9u
J3QgdHJ1c3Qgb3VyIHBvcnQgZW5vdWdoIHRvIGp1c3QgcHVsbCB0aGUKPj4+Pj4+IHRyaWdnZXIg
b24gdGhpcyB3aXRob3V0IGF0IGxlYXN0IGFjY3VtdWxhdGluZyBzb21lICJUZXN0ZWQtYnkicyBv
biBpdC4KPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVy
QHNpZml2ZS5jb20+Cj4+Pj4+Cj4+Pj4+IEkgY2FuIG9ubHkgZ2l2ZSB5b3UgYQo+Pj4+Pgo+Pj4+
PiBGYWlscy1taXNlcmFibHktZm9yOiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+
Cj4+Pj4+Cj4+Pj4+IE5vdCB0aGUgbmV3IGRlZmNvbmZpZyBpdHNlbGYsIGJ1dCB0aGUgbmV3IGRl
ZmNvbmZpZyBwbHVzIGEgdmFyaWV0eSBvZgo+Pj4+PiBzZWxmdGVzdCBvcHRpb25zLiBJIGRvbid0
IGtub3cgd2hhdCBleGFjdGx5IGlzIGZhaWxpbmcsIGJ1dCBoZXJlIGlzCj4+Pj4+IG15IGxpc3Qg
b2YgZW5hYmxlZCBzZWxmdGVzdHMgb24gdG9wIG9mIGRlZmNvbmZpZzoKPj4+Pj4KPj4+Pj4gQ09O
RklHX0NSWVBUT19NQU5BR0VSX0RJU0FCTEVfVEVTVFM9eQo+Pj4+PiBDT05GSUdfQ1JDMzJfU0VM
RlRFU1Q9eQo+Pj4+PiBDT05GSUdfREVCVUdfTE9DS0lOR19BUElfU0VMRlRFU1RTPXkKPj4+Pj4g
Q09ORklHX0RFQlVHX05NSV9TRUxGVEVTVD15Cj4+Pj4+IENPTkZJR19ERUJVR19ST0RBVEFfVEVT
VD15Cj4+Pj4+IENPTkZJR19ERUJVR19UTEJGTFVTSD15Cj4+Pj4+IENPTkZJR19ETUFURVNUPXkK
Pj4+Pj4gQ09ORklHX0dMT0JfU0VMRlRFU1Q9eQo+Pj4+PiBDT05GSUdfT0ZfVU5JVFRFU1Q9eQo+
Pj4+PiBDT05GSUdfUENJX0VQRl9URVNUPXkKPj4+Pj4gQ09ORklHX1BDSV9FTkRQT0lOVF9URVNU
PXkKPj4+Pj4gQ09ORklHX1BST1ZFX0xPQ0tJTkc9eQo+Pj4+PiBDT05GSUdfUFJPVkVfUkNVPXkK
Pj4+Pj4gQ09ORklHX1JDVV9FUVNfREVCVUc9eQo+Pj4+PiBDT05GSUdfU1RBVElDX0tFWVNfU0VM
RlRFU1Q9eQo+Pj4+PiBDT05GSUdfU1RSSU5HX1NFTEZURVNUPXkKPj4+Pj4gQ09ORklHX1RFU1Rf
QklUTUFQPXkKPj4+Pj4gQ09ORklHX1RFU1RfRklSTVdBUkU9eQo+Pj4+PiBDT05GSUdfVEVTVF9T
T1JUPXkKPj4+Pj4gQ09ORklHX1RFU1RfU1lTQ1RMPXkKPj4+Pj4gQ09ORklHX1RFU1RfVVVJRD15
Cj4+Pj4+IENPTkZJR19VU0JfVEVTVD15Cj4+Pj4+IENPTkZJR19VU0JfRUhTRVRfVEVTVF9GSVhU
VVJFPXkKPj4+Pj4gQ09ORklHX1VTQl9MSU5LX0xBWUVSX1RFU1Q9eQo+Pj4+PiBDT05GSUdfV1df
TVVURVhfU0VMRlRFU1Q9eQo+Pj4+PiBDT05GSUdfVE9SVFVSRV9URVNUPXkKPj4+Pj4gQ09ORklH
X0xPQ0tfVE9SVFVSRV9URVNUPXkKPj4+Pj4gQ09ORklHX1JDVV9UT1JUVVJFX1RFU1Q9eQo+Pj4+
PiBDT05GSUdfUkJUUkVFX1RFU1Q9eQo+Pj4+PiBDT05GSUdfSU5URVJWQUxfVFJFRV9URVNUPXkK
Pj4+Pj4KPj4+Pgo+Pj4+IFVwZGF0ZTogZGVmY29uZmlnK0NPTkZJR19MT0NLX1RPUlRVUkVfVEVT
VD15IGNhdXNlcyB0aGUgaGFuZwo+Pj4+IGlmIENPTkZJR19QUkVFTVBUPXkuCj4+Pj4KPj4+Cj4+
PiBBbm90aGVyIHVwZGF0ZS4gQ09ORklHX1JDVV9UT1JUVVJFX1RFU1Q9eSBvciBDT05GSUdfV1df
TVVURVhfU0VMRlRFU1Q9eQo+Pj4gYWxzbyByZXN1bHQgaW4gaGFuZ3MsIG9ubHkgYSBiaXQgbGF0
ZXIuIEkgaGF2ZSBub3cgZGlzYWJsZWQgYWxsIHRocmVlIHRlc3QKPj4+IG9wdGlvbnMgaW4gbXkg
cmlzY3YgYm9vdCB0ZXN0cyBpZiBDT05GSUdfUFJFRU1QVD15LiBUaGUgbGFjayBvZiBlcnJvcgo+
Pj4gcmVwb3J0cyBpbiB0aGUgZnV0dXJlIGRvZXMgX25vdF8gbWVhbiB0aGF0IHRoZSBwcm9ibGVt
IGhhcyBtYWdpY2FsbHkKPj4+IGRpc2FwcGVhcmVkLiBJIGp1c3QgZmluZCBpdCBwb2ludGxlc3Mg
dG8ga2VlcCB0ZXN0aW5nIGEga25vd24gYnJva2VuCj4+PiBjb25maWd1cmF0aW9uLCBldmVuIG1v
cmUgc28gc2luY2UgZG9pbmcgc28gd291bGQgaGlkZSBvdGhlciBwb3RlbnRpYWwKPj4+IHByb2Js
ZW1zLgo+Pgo+PiBUaGFua3MuICBJIGFncmVlIGl0J3MgcG9pbnRsZXNzIHRvIHRlc3QgbW9yZSwg
YXMgdGhlcmUgYXBwZWFyIHRvIGJlIGxvdHMgb2YKPj4gYnVncyB0byBmaXggYWxyZWFkeSBhbmQg
dGhpcyB3aWxsIGp1c3QgbWFzayBvdGhlciBidWdzLgo+Pgo+IAo+IExhc3Qgd2VlaywgSSBlbmNv
dW50ZXJlZCBzb21lIGxvY2tpbmcgaXNzdWVzIGluIHRoZSBrZXJuZWwsIHNvIEkgdHJpZWQKPiB0
byB0ZXN0IHRoZQo+IGtlcm5lbCB3aXRoIHNvbWUgcmVsYXRpdmUgc2VsZnRlc3RzLiBTaW5jZSBJ
IGhhZCBhbHJlYWR5IHNldCBDT05GSUdfUFJFRU1QVD15LAo+IEkgZW5jb3VudGVyZWQgdGhlIHNh
bWUgcmVzdWx0cyBpbiBSQ1VfVE9SVFVSRV9URVNUIGFuZAo+IExPQ0tfVE9SVFVSRV9URVNULiBJ
IHRyaWVkIHRvIGRlYnVnIGl0IGFuZCBmb3VuZCB0aGUgaGFuZyB3YXMgZHVlIHRvCj4gdGhlIGxh
Y2sgb2YgX1RJRl9ORUVEX1JFU0NIRUQgY2hlY2sgZm9yIGtlcm5lbCB0aHJlYWRzIGluIGVudHJ5
LlMuIEkgd2lsbCBzZW5kIGEKPiBwYXRjaCB0byBzb2x2ZSB0aGlzIHByb2JsZW0gYW5kIEkgaG9w
ZSB5b3UgY2FuIGdpdmUgbWUgc29tZSBjb21tZW50cwo+IGlmIHlvdSBmaW5kIHNvbWUKPiBtaXN0
YWtlcy4KPiAKCkknbGwgYmUgaGFwcHkgdG8gcnVuIGEgc2V0IG9mIHRlc3RzIGlmIHlvdSBDYzog
bWUgb24gdGhlIHBhdGNoLgoKR3VlbnRlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
