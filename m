Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7F1C3ABBE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 18:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Mkg4Ec4Umfv+DzcIGWNjL6uE1p4A6QrZR3P7vp+iGQ=; b=ZKnITe/2EJB8w/
	tZhVi2C8fwgB6FFfGH12tZMOqUzRRQRsTxAx9Tzi5l7y2FHb4q5RvTwoacDTdmH1lu3qpKsuXh8JR
	+i9DufB5/tEg+if8BZn76aB4U0O1P7M7aezkavwBNwF7Qad7dLC6mJEKOCpeEg5Vu6jtbPlS1PT6R
	0buvhIZcYzS4IUUEJao5pBHdd+DQgLP8olP/AhKlhnlNkYy6gcU5Rq+HqnVqd+vyZrP0hhLjq/Jz6
	Cxpa+hfC/+t5DLRS0TkKGyWDfkWuSyTlpHipS9OtCiTB66pmjwL+nC/fR3jQn2mLYR+x0//JFTCrN
	EJdIOVJUovy6mlTcl8aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD5ub-00000001XGd-1uLG;
	Thu, 08 May 2025 18:24:01 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD5uX-00000001XGC-2iOE
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 18:23:59 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-22fa47d6578so12103635ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 11:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1746728636; x=1747333436; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T3GC3nd2QY3ZXudwqT4kCMNlEBnSWQ4/Y+mWvsZzVRU=;
        b=KAvV7H0RLu6IJswb1xYrS/0K50YAhHBmSUQvcTP4zlyjjefxK0EspcfEcgjW655VdV
         QkkIVWTJ2zAqdv5oMyFGok4busa6fRyDKv11mXHQ5eMUEGwVdg2URpBeyxWCmERhIADT
         olQiHXMQ47cg9Oz+24BaByhEuIeGrosqIUaXNVPbssMCfVnx8E54rwdPYLDTPBBs7K2z
         0ca+Jzklqgc62Nbkw1awgGXT1XP2/sZNmyZ/onRHzVVv6avZzRqC7x9b0iNtNavvme/R
         EJX2x0uk/5+jUDCo1sEYzSyD7VnscolUlmzu2PyI80KFxsejz50km2S1E9qmXZZSh98C
         7pcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746728636; x=1747333436;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T3GC3nd2QY3ZXudwqT4kCMNlEBnSWQ4/Y+mWvsZzVRU=;
        b=FYIJcYxafi2Lot3XIdTKrwwcz9mFvkHIfOXdrrCqRIEi+5gEKOvuWRyv9LRTjSKuQq
         RR5LSH5i8Q00ao1Adm4WliwvKIThSzT0oOVP4KBNtmsh9EjURhCF+iRhCkyg1+UhtWHP
         r2qNeS05zqEph98QI6Fz37fCGeZOX9Oj+jT+5ET78TuU80L7dy6e+5gzySmpm7y/uCAq
         SquV70HUlPaQOahSKFDni9sIUhDoVGReXz1AH1mTEXuIv7QrVXrwmh9Z0/bxkbO9DfbT
         OzQtyZEzUwWlXlyuWf3ITBQeM/UPYyHT5fm79gQS5+flHJKEUH2agS4XcFfpqZFNFh+J
         Paow==
X-Forwarded-Encrypted: i=1; AJvYcCWxYhlWWb9i2gM2daSfBSfJRjuPvSP5hT8alm0EIIpLuglfg9DnLlhWs9d1mei2e73KLihV1Ziu+usYyw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9JrQZQ9vWc0vlMxnuHxN7QFEiXjnbl2YtoQKuZT/YD+4tuQIN
	g3xU7Nds0ZL+sWFAAswzV4mThijIUUNLmtiRgnzUJIXIqZYMKjoCsXlKJT+8PkU=
X-Gm-Gg: ASbGncuwaYeXu0XvYI7pk+hZmixb3MtuHxLRDkeqpPE2UXag54xQN2Fz8mYc5F5DWvs
	pGbZ0s4R3fBisZbTfPgXI/tjSdV2U7yMV9q/CdZlatdRB9KLKBvZC2iK851XA9Z4M+X+Lnqn+EN
	tGKNQny2fRRbSxcesYSkMdXewkt2X7oHHjD3CU9btxt3t9SkhHFZaOnbfGoDmZlxkIr+b5iFjmr
	XSqLIgrxf5ywvr/fsSNeMgiZQfVkdvpQeI9RywA2l9Atux4tdIrdV0+3hzWbFAZwjT9YIOCyXWK
	p+mf91FlZjYETtOyZbKvj+ZdS0IfaNriMOkY1/qOEY1GnQI=
X-Google-Smtp-Source: AGHT+IEsxgb6xpj/TfNH2Jats/rW7/6lQIZRnNAaVkD3rlO2gB/eCZLowl4BgQ20sS07u8Lsi9VRPA==
X-Received: by 2002:a17:902:cf06:b0:223:517c:bfa1 with SMTP id d9443c01a7336-22fc9185e59mr5399955ad.38.1746728636019;
        Thu, 08 May 2025 11:23:56 -0700 (PDT)
Received: from x1 (97-120-122-6.ptld.qwest.net. [97.120.122.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc828b37asm2411005ad.187.2025.05.08.11.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 11:23:55 -0700 (PDT)
Date: Thu, 8 May 2025 11:23:53 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Stephen Boyd <sboyd@kernel.org>, mturquette@baylibre.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	jszhang@kernel.org, p.zabel@pengutronix.de,
	m.szyprowski@samsung.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 3/3] riscv: dts: thead: Add device tree VO clock
 controller
Message-ID: <aBz2uePXAtY6c6jD@x1>
References: <20250403094425.876981-1-m.wilczynski@samsung.com>
 <CGME20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319@eucas1p2.samsung.com>
 <20250403094425.876981-4-m.wilczynski@samsung.com>
 <Z/BoQIXKEhL3/q50@x1>
 <17d69810-9d1c-4dd9-bf8a-408196668d7b@samsung.com>
 <9ce45e7c1769a25ea1abfaeac9aefcfb@kernel.org>
 <475c9a27-e1e8-4245-9ca0-74c9ed663920@samsung.com>
 <c46de621e098b7873a00c1af4ca550a1@kernel.org>
 <91ecca14-2102-4c29-9252-025ce6b6a07f@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <91ecca14-2102-4c29-9252-025ce6b6a07f@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_112357_922724_277034FE 
X-CRM114-Status: GOOD (  35.44  )
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

T24gV2VkLCBNYXkgMDcsIDIwMjUgYXQgMTI6MDQ6MDFQTSArMDIwMCwgTWljaGFsIFdpbGN6eW5z
a2kgd3JvdGU6Cj4gCj4gCj4gT24gNS82LzI1IDIzOjMwLCBTdGVwaGVuIEJveWQgd3JvdGU6Cj4g
PiBRdW90aW5nIE1pY2hhbCBXaWxjenluc2tpICgyMDI1LTA0LTMwIDAwOjUyOjI5KQo+ID4+Cj4g
Pj4gSW4gdGhlIHYyIHZlcnNpb24gb2YgdGhlIHBhdGNoc2V0LCB0aGVyZSB3YXMgbm8gcmVzZXQg
Y29udHJvbGxlciB5ZXQsIHNvCj4gPj4gSSB0aG91Z2h0IHlvdXIgY29tbWVudCB3YXMgbWFkZSBy
ZWZlcnJpbmcgdG8gdGhhdCBlYXJsaWVyIHZlcnNpb24uCj4gPj4gVGhpcyByZXByZXNlbnRhdGlv
biBjbGVhcmx5IGRlc2NyaWJlcyB0aGUgaGFyZHdhcmUgY29ycmVjdGx5LCB3aGljaCBpcwo+ID4+
IHRoZSByZXF1aXJlbWVudCBmb3IgdGhlIERldmljZSBUcmVlLgo+ID4+Cj4gPj4gVGhlIG1hbnVh
bCwgaW4gc2VjdGlvbiA1LjQuMS42IFZPX1NVQlNZUywgZGVzY3JpYmVzIHRoZSByZXNldCByZWdp
c3RlcnMKPiA+PiBzdGFydGluZyBhdCAweEZGX0VGNTJfODAwMDoKPiA+Pgo+ID4+IEdQVV9SU1Rf
Q0ZHICAgICAgICAgICAgIDB4MDAKPiA+PiBEUFVfUlNUX0NGRyAgICAgICAgICAgICAweDA0Cj4g
Pj4gTUlQSV9EU0kwX1JTVF9DRkcgICAgICAgMHg4Cj4gPj4gTUlQSV9EU0kxX1JTVF9DRkcgICAg
ICAgMHhjCj4gPj4gSERNSV9SU1RfQ0ZHICAgICAgICAgICAgMHgxNAo+ID4+IEFYSTRfVk9fRFdf
QVhJICAgICAgICAgIDB4MTgKPiA+PiBYMkhfWDRfVk9TWVNfRFdfQVhJX1gySCAweDIwCj4gPj4K
PiA+PiBBbmQgdGhlIGNsb2NrIHJlZ2lzdGVycyBmb3IgVk9fU1VCU1lTLCBtYW51YWwgc2VjdGlv
biA0LjQuMS42IHN0YXJ0IGF0IG9mZnNldCAweDUwOgo+ID4+IFZPU1lTX0NMS19HQVRFICAgICAg
ICAgIDB4NTAKPiA+PiBWT1NZU19DTEtfR0FURTEgICAgICAgICAweDU0Cj4gPj4gVk9TWVNfRFBV
X0NDTEtfQ0ZHMCAgICAgMHg2NAo+ID4+IFRFU1RfQ0xLX0ZSRVFfU1RBVCAgICAgIDB4YzQKPiA+
PiBURVNUX0NMS19DRkcgICAgICAgICAgICAweGM4Cj4gPj4KPiA+PiBTbyBJIGNvbnNpZGVyZWQg
dGhpcyBiYWNrIHRoZW4gYW5kIHRob3VnaHQgaXQgd2FzIGFwcHJvcHJpYXRlIHRvIGRpdmlkZQo+
ID4+IGl0IGludG8gdHdvIG5vZGVzLCBhcyB0aGUgcmVzZXQgbm9kZSB3YXNuJ3QgYmVpbmcgY29u
c2lkZXJlZCBhdCB0aGF0Cj4gPj4gdGltZS4KPiA+Pgo+ID4+IFdoZW4gbG9va2luZyBmb3IgdGhl
IHJlZmVyZW5jZSBbMV0sIEkgZGlkbid0IG5vdGljZSBpZiB5b3UgY29ycmVjdGVkCj4gPj4geW91
cnNlbGYgbGF0ZXIsIGJ1dCBJIGRvIHJlbWVtYmVyIGNvbnNpZGVyaW5nIHRoZSBzaW5nbGUtbm9k
ZSBhcHByb2FjaAo+ID4+IGF0IHRoZSB0aW1lLgo+ID4+Cj4gPiAKPiA+IElmIHRoZSB0d28gcmVn
aXN0ZXIgcmFuZ2VzIGRvbid0IG92ZXJsYXAgdGhlbiB0aGlzIGlzIHByb2JhYmx5IE9LLiBJCj4g
PiBpbWFnaW5lIHRoaXMgaXMgb25lIGRldmljZSBzaGlwcGVkIGJ5IHRoZSBoYXJkd2FyZSBlbmdp
bmVlciwgVk9fU1VCU1lTLAo+ID4gd2hpY2ggaGFwcGVucyB0byBiZSBhIGNsb2NrIGFuZCByZXNl
dCBjb250cm9sbGVyLiBUaGlzIGlzIHF1aXRlIGNvbW1vbiwKPiA+IGFuZCB3ZSB1c3VhbGx5IGhh
dmUgb25lIG5vZGUgd2l0aCBib3RoICNjbG9jay1jZWxscyBhbmQgI3Jlc2V0LWNlbGxzIGluCj4g
PiBpdC4gVGhlbiB3ZSB1c2UgdGhlIGF1eGlsaWFyeSBidXMgdG8gY3JlYXRlIHRoZSByZXNldCBk
ZXZpY2UgZnJvbSB0aGUKPiA+IGNsayBkcml2ZXIgd2l0aCB0aGUgc2FtZSBub2RlLiBUaGlzIGhl
bHBzIG1hdGNoIHRoZSBkZXZpY2UgaW4gdGhlCj4gPiBkYXRhc2hlZXQgdG8gdGhlIG5vZGUgYW5k
IGNvbXBhdGlibGUgaW4gRFQgd2l0aG91dCBtYWtpbmcgdGhlIGNvbXBhdGlibGUKPiA+IHByb3Zp
ZGVyIHNwZWNpZmljIChjbGsgb3IgcmVzZXQgcG9zdGZpeCkuCj4gPiAKPiA+IFRoYXQncyBhbm90
aGVyIHJlYXNvbiB3aHkgd2UgdXN1YWxseSBoYXZlIG9uZSBub2RlLiBEVCBkb2Vzbid0IGRlc2Ny
aWJlCj4gPiBzb2Z0d2FyZSwgaS5lLiB0aGUgc3BsaXQgYmV0d2VlbiBjbGsgYW5kIHJlc2V0IGZy
YW1ld29ya3MgbWF5IG5vdCBleGlzdAo+ID4gaW4gb3RoZXIgb3BlcmF0aW5nIHN5c3RlbXMuIFdl
IGRvbid0IHdhbnQgdG8gcHV0IHRoZSBzb2Z0d2FyZSBkZXNpZ24KPiA+IGRlY2lzaW9ucyBpbnRv
IHRoZSBEVC4KPiA+IAo+ID4gSXQgbWF5IGFsc28gYmUgdGhhdCBhIGRldmljZSBsaWtlIHRoaXMg
Y29uc3VtZXMgc2hhcmVkIHBvd2VyIHJlc291cmNlcwo+ID4gbGlrZSBjbGtzIG9yIHJlZ3VsYXRv
cnMgdGhhdCBuZWVkIHRvIGJlIGVuYWJsZWQgdG8gZHJpdmUgdGhlIGRldmljZSwgb3IKPiA+IGFu
IElPTU1VIGlzIHVzZWQgdG8gdHJhbnNsYXRlIHRoZSByZWdpc3RlciBtYXBwaW5ncy4gV2Ugd291
bGRuJ3Qgd2FudCB0bwo+ID4gc3BsaXQgdGhlIGRldmljZSBpbiBEVCBpbiB0aGF0IGNhc2Ugc28g
d2UgY2FuIGVhc2lseSBtYW5hZ2UgdGhlIHBvd2VyCj4gPiByZXNvdXJjZXMgb3IgbWVtb3J5IG1h
cHBpbmdzIGZvciB0aGUgZGV2aWNlLgo+ID4gCj4gPiBUTDtEUjogVGhpcyBpcyBwcm9iYWJseSBP
SywgYnV0IEknZCBiZSBjYXJlZnVsIHRvIG5vdCBtYWtlIGl0IGEgdGhpbmcuCj4gCj4gVGhhbmsg
eW91IHZlcnkgbXVjaCBmb3IgdGhlIGNvbXByZWhlbnNpdmUgZXhwbGFuYXRpb24uIEJlY2F1c2Ug
dGhlCj4gcmVnaXN0ZXJzIGRvbuKAmXQgb3ZlcmxhcCwgaXTigJlzIGZpbmUgaW4gdGhpcyBjYXNl
LiBTaW5jZSBEcmV3IGFsc28gc2VlbSB0bwo+IGFncmVlLCB3ZSBjYW4gcHJvYmFibHkgcHVzaCB0
aGVzZSBwYXRjaGVzIGZvcndhcmQsIHdoaWxlIGtlZXBpbmcgaW4gbWluZAo+IHRoYXQgZm9yIGZ1
dHVyZSBTb0NzIGl0IHdvdWxkIGJlIGJldHRlciB0byB1c2UgYSBzaW5nbGUgbm9kZS4KClllcywg
SSB0aGluayBpbiB0aGlzIGluc3RhbmNlIGl0IG1ha2VzIHNlbnNlIHRvIGdvIGFoZWFkLiBJIHNl
bnQgYSBwdWxsCnJlcXVlc3QgWzFdIHRvIFN0ZXBoZW4gZm9yIG15IHRoZWFkIGNsayBmb3ItbmV4
dCB0cmVlIHdpdGggdGhpcyBzZXJpZXMKYXBwbGllZC4KClRoYW5rcywKRHJldwoKWzFdIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC9hQnVzK1ljN2tmJTJGSDJIRTVAeDEvCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
