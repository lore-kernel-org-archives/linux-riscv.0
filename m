Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75B7CCD1AB
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 08:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iLvAE0JrNN2ySAVW/VJm3BPEbLCK9LWSkgAjNJPOvOc=; b=iKbe7H4U/yHe2o
	+fPAQYEPLYt7hDsaiI9aGBL3fB0CLDFm5uSrYqadLX98L6DziboFy5VtqNoe4zaCEhHyfLnVSo00S
	vigox30fZiv+M2/yxTwRXxp8Zp81XncOYas1jlSiV4v2Oq247e3BFIwI/wHvIXQB5RpWvHfuhfWU2
	PkeUQeywsJUj5DY7dTHrI00M7P8XgD/7xDmT1wdq7CMSilpxxEpFNASpKqCu161u3/GXPbPgsER2Y
	0ZvsL0o5S1t5F8PNg6iwuOVFbVfRQnZEFRiKMxWFLmJSPe7CKKJEESnYnZC1sJZbexYgVmIJ2LsqZ
	QIE48/llxC+gt48OIyCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDGO-00000008j6H-33Xu;
	Fri, 24 Oct 2025 08:35:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDGI-00000008j0r-46xv
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 08:35:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761294901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wMiM7iwLyLoXC8XMxApEUes6hHrQXoxnQoRnHPw1Y6A=;
	b=g8OYVLkfwqEWybw/+Q4CUDSishLDBQ02IggVLYxf97il+TgPus1QF/903KkcDyBU+KqBkn
	K9sBZ4HLM26OHDPc2hVJOCHM9HVSbLvzanUMIvV6r8b8fNYTrRLMjRbT6U+azL8yWW3TAl
	mcEamtf3GSj5CHGWgTNgvDucW2KUYSo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-sPBhF0BwPY25NfAQFZAQeQ-1; Fri, 24 Oct 2025 04:34:59 -0400
X-MC-Unique: sPBhF0BwPY25NfAQFZAQeQ-1
X-Mimecast-MFC-AGG-ID: sPBhF0BwPY25NfAQFZAQeQ_1761294898
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3f7b5c27d41so1324942f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 01:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761294898; x=1761899698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wMiM7iwLyLoXC8XMxApEUes6hHrQXoxnQoRnHPw1Y6A=;
        b=doedtXmmS0YN9OkQY0p0rOKCTnd0C+ettoO1sXbewa0lmtKxCbkbidDBJUe02VTYZd
         0c4APx9BkfyXPZr9aTY9xB9Cg0pCadSco2SV/YCXOyYyDX3S9fxpqKajCImEqC9eNGQU
         V9U0wIM5Gq14Zw3f/y2v242VCx16JjffoL06LeZAvnUNGd8OHuft58g0gK4YGsvjxlnU
         T4Qo6iUKnAr8OPYUA8GDrM445vSbK0gjDF4yMGLU6HiiAqhv0RciRycQpFLKcYvVOaJ9
         pQtyPZVp4FHEJbqlImBcidRpsOUKLEKQtIfKN0IO4nVM5T9ssYM0qyv26KBMC/CtqfW9
         f+4g==
X-Forwarded-Encrypted: i=1; AJvYcCXj3BIpEiP5LBlDR0KRx21Fs1w50RZTe3sXb48VUZXZ8AAmdqonethKLW46661SHdnJ2iWUowyCFyvp/w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxrOyb9DrVFFpWRcQuF/1pSLIolHjPi22DlYHxnYGs2z/ww2vaM
	dgiysSlVEK/8jg/E8Ijr78j/biCAVKOC7wGatWWbZwn/8mlh7N00+lglcCFnoZ2r9CiRilgkroi
	jF1q8zGz5X4w+qxmXFnRy+f/x9l+RJPZU/0yF3KF31G0pE+5wIzRKkCNbFXWCa1AblBtMh0+V+e
	7w/Kam2cVYdWZFIWD32eB6jsfOkHVJAJeNhDlDAB8BfmL9
X-Gm-Gg: ASbGnctNFQszAT3nGt6/cWRJrUzgJAK+BtwDrHCIq8Kx9cs/RmcDbZ4AKNR+uxUnEDU
	9rpo6PFNOok7CW0XnmpUAJoTTJU7TjzZkS8kyKQQ0a1++svfz9dXjlXJmUokYk8o6y0EUPe2kdZ
	lpJYCcFsECFfRwNhhMx76xc1GN8oAU6cCmMgCAB1uQAtWcR5qEse4wRP0=
X-Received: by 2002:a05:6000:2283:b0:3e7:6424:1b47 with SMTP id ffacd0b85a97d-4298f51e6c7mr1615351f8f.6.1761294898406;
        Fri, 24 Oct 2025 01:34:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHneq26JtjC7v0qH5eo9W4vFieyRgtLB+lIw8JjnfPG0eDTw3SOftuEUINlVQTBND/drYvIkk+yrtxFaM/VtJ4=
X-Received: by 2002:a05:6000:2283:b0:3e7:6424:1b47 with SMTP id
 ffacd0b85a97d-4298f51e6c7mr1615312f8f.6.1761294897890; Fri, 24 Oct 2025
 01:34:57 -0700 (PDT)
MIME-Version: 1.0
References: <87zf9hwh5j.ffs@tglx> <20251023201721.549563-1-cmirabil@redhat.com>
In-Reply-To: <20251023201721.549563-1-cmirabil@redhat.com>
From: Lucas Zampieri <lzampier@redhat.com>
Date: Fri, 24 Oct 2025 09:34:47 +0100
X-Gm-Features: AWmQ_bkjLCK7rYokvdeJT5wSgmJ0C1bDhIh6rvdCrhkYGtz_4gZYQEXFLd46qyU
Message-ID: <CAOOg__AcRVPRXsDdPPe3QkJybiTYSRCLLHR59qVnH2burfRaNw@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] Add UltraRISC DP1000 PLIC support
To: Charles Mirabile <cmirabil@redhat.com>
Cc: tglx@linutronix.de, alex@ghiti.fr, aou@eecs.berkeley.edu, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, dramforever@live.com, 
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	robh@kernel.org, samuel.holland@sifive.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ltaNQVoNv4CeMTkpkOqpjYL1EwLPoSAzQfapZAQPY_E_1761294898
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_013503_325080_078D9573 
X-CRM114-Status: GOOD (  34.10  )
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

SGkgVGhvbWFzIGFuZCBDaGFybGVzLAoKWWVzLCBtaXNzZWQgdGhlIGNjIGxpc3QgdG8gb24gdGhh
dCBvbmUsIHNlbmRpbmcgdGhlIHY2IHNlcmllcyBhZ2Fpbgp3aXRoIHRoZSBjb3JyZWN0IGhlYWRl
cnMuClNvcnJ5IGFib3V0IHRoYXQuCgpMdWNhcyBaYW1waWVyaQpQbGF0Zm9ybSBFbmFibGVtZW50
IFRlYW0KCk9uIFRodSwgT2N0IDIzLCAyMDI1IGF0IDk6MTfigK9QTSBDaGFybGVzIE1pcmFiaWxl
IDxjbWlyYWJpbEByZWRoYXQuY29tPiB3cm90ZToKPgo+IEhpIFRob21hc+KAlAo+Cj4gT24gVGh1
LCBPY3QgMjMsIDIwMjUgYXQgMDk6Mjk6NDRQTSArMDIwMCwgVGhvbWFzIEdsZWl4bmVyIHdyb3Rl
Ogo+ID4gT24gVGh1LCBPY3QgMjMgMjAyNSBhdCAxNTowMCwgTHVjYXMgWmFtcGllcmkgd3JvdGU6
Cj4gPiA+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdGhlIFBMSUMgaW1wbGVtZW50YXRp
b24gaW4gdGhlIFVsdHJhUklTQwo+ID4gPiBEUDEwMDAgU29DLiBUaGUgVVItQ1AxMDAgY29yZXMg
dXNlZCBpbiB0aGUgRFAxMDAwIGhhdmUgYSBoYXJkd2FyZSBidWcgaW4KPiA+ID4gdGhlaXIgUExJ
QyBjbGFpbSByZWdpc3RlciB3aGVyZSByZWFkaW5nIGl0IHdoaWxlIG11bHRpcGxlIGludGVycnVw
dHMgYXJlCj4gPiA+IHBlbmRpbmcgY2FuIHJldHVybiB0aGUgd3JvbmcgaW50ZXJydXB0IElELiBU
aGUgd29ya2Fyb3VuZCB0ZW1wb3JhcmlseQo+ID4gPiBkaXNhYmxlcyBhbGwgaW50ZXJydXB0cyBl
eGNlcHQgdGhlIGZpcnN0IHBlbmRpbmcgb25lIGJlZm9yZSByZWFkaW5nIHRoZQo+ID4gPiBjbGFp
bSByZWdpc3RlciwgdGhlbiByZXN0b3JlcyB0aGUgcHJldmlvdXMgc3RhdGUuCj4gPiA+Cj4gPiA+
IFRoZSBkcml2ZXIgbWF0Y2hlcyBvbiAidWx0cmFyaXNjLGNwMTAwLXBsaWMiIChDUFUgY29yZSBj
b21wYXRpYmxlKSwgYWxsb3dpbmcKPiA+ID4gdGhlIHF1aXJrIHRvIGFwcGx5IHRvIGFsbCBTb0Nz
IHVzaW5nIFVSLUNQMTAwIGNvcmVzIChjdXJyZW50bHkgRFAxMDAwLAo+ID4gPiBwb3RlbnRpYWxs
eSBmdXR1cmUgU29DcykuCj4gPiA+Cj4gPiA+IENoYXJsZXMgTWlyYWJpbGUgKDMpOgo+ID4gPiAg
IGR0LWJpbmRpbmdzOiBpbnRlcnJ1cHQtY29udHJvbGxlcjogYWRkIFVsdHJhUklTQyBEUDEwMDAg
UExJQwo+ID4gPiAgIGlycWNoaXAvcGxpYzogZW5hYmxlIG9wdGltaXphdGlvbiBvZiBpbnRlcnJ1
cHQgZW5hYmxlIHN0YXRlCj4gPgo+ID4gICAgIFRoYXQgb25lIG5ldmVyIHNob3dlZCB1cC4gTmVp
dGhlciBpbiBteSBpbmJveCBub3Igb24gbG9yZQo+Cj4gTG9va3MgbGlrZSB0aGUgQ0MgbGlzdCB3
YXMgbWlzc2luZyBzb21laG93IGZyb20gdGhhdCBwYXRjaOKAlEkgZGlkbid0IG5vdGljZSBiZWNh
dXNlIEkgZ290IGl0IGluIG15IGluYm94IGJlY2F1c2Ugb2YgbXkgU2lnbmVkLW9mZi1ieS4KPgo+
IFRoZSBpbmRleGluZyBvbiB0aGUgcGF0Y2hlcyB3YXMgc2xpZ2h0bHkgd3JvbmcgYW55d2F5cywg
c28gd2Ugd2lsbCByZXNlbmQgdG9tb3Jyb3cuIFNvcnJ5IGZvciB0aGUgbm9pc2UuCj4KPiBJIGhh
dmUgYXR0YWNoZWQgaXQgaGVyZSBpbiBjYXNlIHlvdSB3YW50IHRvIHRha2UgYSBsb29rLgo+Cj4g
Pgo+IC0tID44IC0tCj4gRnJvbTogQ2hhcmxlcyBNaXJhYmlsZSA8Y21pcmFiaWxAcmVkaGF0LmNv
bT4KPiBTdWJqZWN0OiBbUEFUQ0ggdjYgMy80XSBpcnFjaGlwL3BsaWM6IGVuYWJsZSBvcHRpbWl6
YXRpb24gb2YgaW50ZXJydXB0IGVuYWJsZSBzdGF0ZQo+Cj4gT3B0aW1pemUgdGhlIFBMSUMgZHJp
dmVyIGJ5IG1haW50YWluaW5nIHRoZSBpbnRlcnJ1cHQgZW5hYmxlIHN0YXRlIGluCj4gdGhlIGhh
bmRsZXIncyBlbmFibGVfc2F2ZSBhcnJheSBkdXJpbmcgbm9ybWFsIG9wZXJhdGlvbiByYXRoZXIg
dGhhbiBvbmx5Cj4gZHVyaW5nIHN1c3BlbmQvcmVzdW1lLiBUaGlzIGVsaW1pbmF0ZXMgdGhlIG5l
ZWQgdG8gcmVhZCBlbmFibGUgcmVnaXN0ZXJzCj4gZHVyaW5nIHN1c3BlbmQgYW5kIG1ha2VzIHRo
ZSBlbmFibGUgc3RhdGUgaW1tZWRpYXRlbHkgYXZhaWxhYmxlIGZvcgo+IG90aGVyIG9wdGltaXph
dGlvbnMuCj4KPiBNb2RpZnkgX19wbGljX3RvZ2dsZSgpIHRvIHRha2UgYSBoYW5kbGVyIHBvaW50
ZXIgaW5zdGVhZCBvZiBlbmFibGVfYmFzZSwKPiBhbGxvd2luZyBpdCB0byB1cGRhdGUgYm90aCB0
aGUgaGFyZHdhcmUgcmVnaXN0ZXJzIGFuZCB0aGUgY2FjaGVkCj4gZW5hYmxlX3NhdmUgc3RhdGUg
YXRvbWljYWxseSB3aXRoaW4gdGhlIGV4aXN0aW5nIGVuYWJsZV9sb2NrIHByb3RlY3Rpb24uCj4K
PiBSZW1vdmUgdGhlIHN1c3BlbmQtdGltZSBlbmFibGUgcmVnaXN0ZXIgcmVhZGluZyBzaW5jZSBl
bmFibGVfc2F2ZSBub3cKPiBhbHdheXMgcmVmbGVjdHMgdGhlIGN1cnJlbnQgc3RhdGUuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBDaGFybGVzIE1pcmFiaWxlIDxjbWlyYWJpbEByZWRoYXQuY29tPgo+Cj4g
LS0tCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtc2lmaXZlLXBsaWMuYyB8IDM2ICsrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyks
IDIzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtc2lm
aXZlLXBsaWMuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtc2lmaXZlLXBsaWMuYwo+IGluZGV4IGNi
ZDc2OTdiYzE0ODEuLmQ1MThhOGI0Njg3NDIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pcnFjaGlw
L2lycS1zaWZpdmUtcGxpYy5jCj4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxp
Yy5jCj4gQEAgLTk0LDE1ICs5NCwyMiBAQCBzdGF0aWMgREVGSU5FX1BFUl9DUFUoc3RydWN0IHBs
aWNfaGFuZGxlciwgcGxpY19oYW5kbGVycyk7Cj4KPiAgc3RhdGljIGludCBwbGljX2lycV9zZXRf
dHlwZShzdHJ1Y3QgaXJxX2RhdGEgKmQsIHVuc2lnbmVkIGludCB0eXBlKTsKPgo+IC1zdGF0aWMg
dm9pZCBfX3BsaWNfdG9nZ2xlKHZvaWQgX19pb21lbSAqZW5hYmxlX2Jhc2UsIGludCBod2lycSwg
aW50IGVuYWJsZSkKPiArc3RhdGljIHZvaWQgX19wbGljX3RvZ2dsZShzdHJ1Y3QgcGxpY19oYW5k
bGVyICpoYW5kbGVyLCBpbnQgaHdpcnEsIGludCBlbmFibGUpCj4gIHsKPiAtICAgICAgIHUzMiBf
X2lvbWVtICpyZWcgPSBlbmFibGVfYmFzZSArIChod2lycSAvIDMyKSAqIHNpemVvZih1MzIpOwo+
ICsgICAgICAgdTMyIF9faW9tZW0gKmJhc2UgPSBoYW5kbGVyLT5lbmFibGVfYmFzZTsKPiAgICAg
ICAgIHUzMiBod2lycV9tYXNrID0gMSA8PCAoaHdpcnEgJSAzMik7Cj4gKyAgICAgICBpbnQgZ3Jv
dXAgPSBod2lycSAvIDMyOwo+ICsgICAgICAgdTMyIHZhbHVlOwo+ICsKPiArICAgICAgIHZhbHVl
ID0gcmVhZGwoYmFzZSArIGdyb3VwKTsKPgo+ICAgICAgICAgaWYgKGVuYWJsZSkKPiAtICAgICAg
ICAgICAgICAgd3JpdGVsKHJlYWRsKHJlZykgfCBod2lycV9tYXNrLCByZWcpOwo+ICsgICAgICAg
ICAgICAgICB2YWx1ZSB8PSBod2lycV9tYXNrOwo+ICAgICAgICAgZWxzZQo+IC0gICAgICAgICAg
ICAgICB3cml0ZWwocmVhZGwocmVnKSAmIH5od2lycV9tYXNrLCByZWcpOwo+ICsgICAgICAgICAg
ICAgICB2YWx1ZSAmPSB+aHdpcnFfbWFzazsKPiArCj4gKyAgICAgICBoYW5kbGVyLT5lbmFibGVf
c2F2ZVtncm91cF0gPSB2YWx1ZTsKPiArICAgICAgIHdyaXRlbCh2YWx1ZSwgYmFzZSArIGdyb3Vw
KTsKPiAgfQo+Cj4gIHN0YXRpYyB2b2lkIHBsaWNfdG9nZ2xlKHN0cnVjdCBwbGljX2hhbmRsZXIg
KmhhbmRsZXIsIGludCBod2lycSwgaW50IGVuYWJsZSkKPiBAQCAtMTEwLDcgKzExNyw3IEBAIHN0
YXRpYyB2b2lkIHBsaWNfdG9nZ2xlKHN0cnVjdCBwbGljX2hhbmRsZXIgKmhhbmRsZXIsIGludCBo
d2lycSwgaW50IGVuYWJsZSkKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4KPiAgICAg
ICAgIHJhd19zcGluX2xvY2tfaXJxc2F2ZSgmaGFuZGxlci0+ZW5hYmxlX2xvY2ssIGZsYWdzKTsK
PiAtICAgICAgIF9fcGxpY190b2dnbGUoaGFuZGxlci0+ZW5hYmxlX2Jhc2UsIGh3aXJxLCBlbmFi
bGUpOwo+ICsgICAgICAgX19wbGljX3RvZ2dsZShoYW5kbGVyLCBod2lycSwgZW5hYmxlKTsKPiAg
ICAgICAgIHJhd19zcGluX3VubG9ja19pcnFyZXN0b3JlKCZoYW5kbGVyLT5lbmFibGVfbG9jaywg
ZmxhZ3MpOwo+ICB9Cj4KPiBAQCAtMjQ3LDMzICsyNTQsMTYgQEAgc3RhdGljIGludCBwbGljX2ly
cV9zZXRfdHlwZShzdHJ1Y3QgaXJxX2RhdGEgKmQsIHVuc2lnbmVkIGludCB0eXBlKQo+Cj4gIHN0
YXRpYyBpbnQgcGxpY19pcnFfc3VzcGVuZCh2b2lkKQo+ICB7Cj4gLSAgICAgICB1bnNpZ25lZCBp
bnQgaSwgY3B1Owo+IC0gICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPiAtICAgICAgIHUzMiBf
X2lvbWVtICpyZWc7Cj4gICAgICAgICBzdHJ1Y3QgcGxpY19wcml2ICpwcml2Owo+Cj4gICAgICAg
ICBwcml2ID0gcGVyX2NwdV9wdHIoJnBsaWNfaGFuZGxlcnMsIHNtcF9wcm9jZXNzb3JfaWQoKSkt
PnByaXY7Cj4KPiAgICAgICAgIC8qIGlycSBJRCAwIGlzIHJlc2VydmVkICovCj4gLSAgICAgICBm
b3IgKGkgPSAxOyBpIDwgcHJpdi0+bnJfaXJxczsgaSsrKSB7Cj4gKyAgICAgICBmb3IgKHVuc2ln
bmVkIGludCBpID0gMTsgaSA8IHByaXYtPm5yX2lycXM7IGkrKykgewo+ICAgICAgICAgICAgICAg
ICBfX2Fzc2lnbl9iaXQoaSwgcHJpdi0+cHJpb19zYXZlLAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcmVhZGwocHJpdi0+cmVncyArIFBSSU9SSVRZX0JBU0UgKyBpICogUFJJT1JJVFlf
UEVSX0lEKSk7Cj4gICAgICAgICB9Cj4KPiAtICAgICAgIGZvcl9lYWNoX3ByZXNlbnRfY3B1KGNw
dSkgewo+IC0gICAgICAgICAgICAgICBzdHJ1Y3QgcGxpY19oYW5kbGVyICpoYW5kbGVyID0gcGVy
X2NwdV9wdHIoJnBsaWNfaGFuZGxlcnMsIGNwdSk7Cj4gLQo+IC0gICAgICAgICAgICAgICBpZiAo
IWhhbmRsZXItPnByZXNlbnQpCj4gLSAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4g
LQo+IC0gICAgICAgICAgICAgICByYXdfc3Bpbl9sb2NrX2lycXNhdmUoJmhhbmRsZXItPmVuYWJs
ZV9sb2NrLCBmbGFncyk7Cj4gLSAgICAgICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBESVZfUk9V
TkRfVVAocHJpdi0+bnJfaXJxcywgMzIpOyBpKyspIHsKPiAtICAgICAgICAgICAgICAgICAgICAg
ICByZWcgPSBoYW5kbGVyLT5lbmFibGVfYmFzZSArIGkgKiBzaXplb2YodTMyKTsKPiAtICAgICAg
ICAgICAgICAgICAgICAgICBoYW5kbGVyLT5lbmFibGVfc2F2ZVtpXSA9IHJlYWRsKHJlZyk7Cj4g
LSAgICAgICAgICAgICAgIH0KPiAtICAgICAgICAgICAgICAgcmF3X3NwaW5fdW5sb2NrX2lycXJl
c3RvcmUoJmhhbmRsZXItPmVuYWJsZV9sb2NrLCBmbGFncyk7Cj4gLSAgICAgICB9Cj4gLQo+ICAg
ICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+IC0tCj4gMi41MS4wCj4KPgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
