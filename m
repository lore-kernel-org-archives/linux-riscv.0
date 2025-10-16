Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A900BCCD199
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 16:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LEbF1XE22l12i3koor+is8pf2WOrC9XWS9AineIoJ+Y=; b=mjVqkd5G0IdhlO
	daOGRSGsmXsdiK63mzJdTxmjcYygWfB3W0kqLnVy7juGFr9BOGOlciRtZYXmQqBe1nVMmqsa1u4Nu
	OfLjt1slkIfnchKwptX34U6SEktH7Xb9XD2emAPMGr/UWS9DfI9dvu+wH/st4Wa1KuP/WIVtXDz87
	WULlCKQAdH4KHPQmFyTOUcZ1c7JM/WcOKxfuObTDL0pQcRLF0gzW9CDNC9WPIy1UDyzNMNMnCwlds
	LVHYn28dsYFhniC4+JK63zsOOdlygtAUa6WImWcGOpgPlIx43i4pkScwui3OJlhCbTSgS5NU/mGDy
	MDpZ7qhDV995iNSVR8Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9RDX-00000005Tmy-2gSk;
	Thu, 16 Oct 2025 16:52:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9RDT-00000005TmK-3eAi
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 16:52:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760633558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s3G/38K/f4KvIWBGZQcPCv+KujPEoeANOPy5LdUWYVA=;
	b=eGud2NQle+/1kOFaeYUgEi+7ki58WN7gMNJ3o3lszuU5iF9QrHW1blhyVRw4DqZu5pbuo9
	qpr7q+EbXN6C8nK9PKtJIPfMSBDUpeF5Q+6F3r5xMOaFm2ejxlBFhsbmq45IX15l50XNpU
	UOOrzu1qs5hckKQIIItisc5JAn5S8H8=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-ZRgDxtU4PCOGLaZVBiaQSQ-1; Thu, 16 Oct 2025 12:52:35 -0400
X-MC-Unique: ZRgDxtU4PCOGLaZVBiaQSQ-1
X-Mimecast-MFC-AGG-ID: ZRgDxtU4PCOGLaZVBiaQSQ_1760633555
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5b736eca1c7so2015271137.0
        for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 09:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760633555; x=1761238355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s3G/38K/f4KvIWBGZQcPCv+KujPEoeANOPy5LdUWYVA=;
        b=XvyN3Z8AZ9kyxG4lW3lFiAJheHECB/U/hC7vuRYPvPHO7OHoL/9q6ZXs/CDFlTmhdO
         cPqI4VgpFjL83944dDl2Cc4nDIOIvsJzjg6kGG+56FEFZO5kjKmGNHybWPmS4Z2LI0Z2
         3DQ59c4l8Dc/yScIK9QwWCp+/A2POAtz5hBF8rmOXtLqhSp38VvLfvzWd9TLt/Nl1wiS
         Q4NjAo+TtPyyDOG7q2xR5u6hx69CXP+Dnol3+hY3S7Cb4uLA/CLsFvlNZf0qyzQQkAu8
         SFO5Xpf/IHB2VaWfOKxDo5KzeZqyfErlN8DtGZQFImpIH3z1PC4u/WV3aZ5a2NtJFr+a
         kDIg==
X-Forwarded-Encrypted: i=1; AJvYcCUd+wJCwm3TjDFzKahmzJd7Ckfy+YND0mYzOninrk7lAg+cW2XBlGMCwt8kkLdmNGLLZeONigNcBZ+a6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeHZRgCaTLMXqSGZ9vW/8dcDLTiy/g8Tjpd4DSOifBzU+/T60k
	AsLNvs6GKGzbBwMkYrySCI8mumekWipE7o4QCkp+Th/Lh+CziXdS9E3h6aE4lKhMnrdWpZoQwfF
	gVr3z66XmUsjDOyme7J7PYLDp5MkaljtrU154plZ64iD2y29WPQG6oZSIl8P/9lgUF1JOqSaU5q
	YY6gR2XCm9LHR1bjK1+Vhrh5F+kU8VxqZSgm0aba9yZVrZ
X-Gm-Gg: ASbGncv17DqdHZRsYEHRuw+zqtE7yHUok/N1Yflmu/z+mxw1Xcvl94Gd437VCMkC0Sy
	P1shItTX23JvDAsoDPdzSMvAGv7pujHZi8x76NOYiOO0fqKjoi7zIoQ5ZuLiBod2itzJP6xpNCh
	qDR7rHqcpGwE1ABozRNYgcPXk7NWRT+9TSEOh5n79eB7n/rjtp+/LQ5NQ8
X-Received: by 2002:a05:6102:510c:b0:524:c767:f541 with SMTP id ada2fe7eead31-5d7dd6a440cmr495881137.35.1760633554636;
        Thu, 16 Oct 2025 09:52:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHD5WG63fxuNfl/7xxXAKVY2shuG2V6JHbtY86SZeR5UI/cxt6xfRaVkEChSU6aorSQmSIXD4dsjkpgYhIzU+E=
X-Received: by 2002:a05:6102:510c:b0:524:c767:f541 with SMTP id
 ada2fe7eead31-5d7dd6a440cmr495868137.35.1760633554224; Thu, 16 Oct 2025
 09:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <20251016084301.27670-1-lzampier@redhat.com> <20251016084301.27670-4-lzampier@redhat.com>
 <87plan0yvd.ffs@tglx> <CABe3_aGj68qM1bNZ3LExbexO=9FO4RzJxhUy2T+HKK1qZfBmtw@mail.gmail.com>
 <87ms5q25cm.ffs@tglx>
In-Reply-To: <87ms5q25cm.ffs@tglx>
From: Charles Mirabile <cmirabil@redhat.com>
Date: Thu, 16 Oct 2025 12:52:22 -0400
X-Gm-Features: AS18NWAJZGulCtwHsjeP4T38yEVHSOQmEhV7m0unjSLxlvw7p4A-SpEylNDrO3o
Message-ID: <CABe3_aH3YE9wWonH1j09-eCarhzhhRReNAOwmEMs5YjkOvvoiQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] irqchip/plic: add support for UltraRISC DP1000 PLIC
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Lucas Zampieri <lzampier@redhat.com>, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <dramforever@live.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Zhang Xincheng <zhangxincheng@ultrarisc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zDxE_32X5pzEL3nBW9yVfO535oA-JNFnj2CsdllXAW8_1760633555
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_095239_981447_352C0E2B 
X-CRM114-Status: GOOD (  47.38  )
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

SGkgVGhvbWFz4oCUCgpPbiBUaHUsIE9jdCAxNiwgMjAyNSBhdCAxMjoxMuKAr1BNIFRob21hcyBH
bGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIFRodSwgT2N0IDE2IDIw
MjUgYXQgMTE6NTQsIENoYXJsZXMgTWlyYWJpbGUgd3JvdGU6Cj4gPiBPbiBUaHUsIE9jdCAxNiwg
MjAyNSBhdCA5OjE34oCvQU0gVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+IHdy
b3RlOgo+ID4+ID4gK3N0YXRpYyBpcnFfaHdfbnVtYmVyX3QgY3AxMDBfZ2V0X2h3aXJxKHN0cnVj
dCBwbGljX2hhbmRsZXIgKmhhbmRsZXIsCj4gPj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHZvaWQgX19pb21lbSAqY2xhaW0pCj4gPj4gPiArewo+ID4+ID4gKyAgICAg
aW50IG5yX2lycV9ncm91cHMgPSBESVZfUk9VTkRfVVAoaGFuZGxlci0+cHJpdi0+bnJfaXJxcywg
MzIpOwo+ID4+ID4gKyAgICAgdm9pZCBfX2lvbWVtICpwZW5kaW5nID0gaGFuZGxlci0+cHJpdi0+
cmVncyArIFBFTkRJTkdfQkFTRTsKPiA+PiA+ICsgICAgIHZvaWQgX19pb21lbSAqZW5hYmxlID0g
aGFuZGxlci0+ZW5hYmxlX2Jhc2U7Cj4gPj4gPiArICAgICBpcnFfaHdfbnVtYmVyX3QgaHdpcnEg
PSAwOwo+ID4+ID4gKyAgICAgaW50IGk7Cj4gPj4gPiArCj4gPj4gPiArICAgICBndWFyZChyYXdf
c3BpbmxvY2spKCZoYW5kbGVyLT5lbmFibGVfbG9jayk7Cj4gPj4gPiArCj4gPj4gPiArICAgICAv
KiBTYXZlIGN1cnJlbnQgaW50ZXJydXB0IGVuYWJsZSBzdGF0ZSAqLwo+ID4+ID4gKyAgICAgZm9y
IChpID0gMDsgaSA8IG5yX2lycV9ncm91cHM7IGkrKykKPiA+PiA+ICsgICAgICAgICAgICAgaGFu
ZGxlci0+ZW5hYmxlX3NhdmVbaV0gPSByZWFkbF9yZWxheGVkKGVuYWJsZSArIGkgKiBzaXplb2Yo
dTMyKSk7Cj4gPj4KPiA+PiBUaGlzIGlzIHRydWx5IHRoZSBtb3N0IGluZWZmaWNpZW50IHdheSB0
byBzb2x2ZSB0aGF0IHByb2JsZW0uIFRoZSBlbmFibGUKPiA+PiByZWdpc3RlcnMgYXJlIG1vZGlm
aWVkIHdpdGggZW5hYmxlZF9sb2NrIGhlbGQsIHNvIHlvdSBjYW4ganVzdCBjYWNoZSB0aGUKPiA+
PiB2YWx1ZSBpbiBwbGljX2hhbmRsZXI6OmVuYWJsZWRfc2F2ZSBhbmQgYXZvaWQgdGhpcyByZWFk
IGxvb3AgY29tcGxldGVseS4KPiA+PiBBZnRlciBjbGFpbWluZyB0aGUgaW50ZXJydXB0IHlvdSBy
ZXN0b3JlIGZyb20gdGhhdCBjYWNoZSwgbm8/Cj4gPgo+ID4gWW91IG1lYW4gdG91Y2ggdGhlIG90
aGVyIGZ1bmN0aW9ucyB3aGVyZSB0aGUgZW5hYmxlIGJpdHMgYXJlIG1vZGlmaWVkCj4gPiB0byBr
ZWVwIHRoZSBjYWNoZSBpbiBzeW5jIHNvIHRoYXQgd2UgZG9uJ3QgbmVlZCB0byBkbyB0aGlzIHJl
YWQgbG9vcAo+ID4gYW5kIGNhbiBoYXZlIGEgcHJvcGVyIHNldCBvZiB2YWx1ZXMgY2FjaGVkPwo+
ID4KPiA+IE15IGNvbmNlcm4gaXMgdGhhdCB0aGlzIG9idmlvdXNseSBoYXMgYW4gaW1wYWN0IG9u
IG90aGVyIHBsYXRmb3Jtcwo+ID4gd2hpY2ggZG8gbm90IGhhdmUgdGhpcyBxdWlyayBzaW5jZSBr
ZWVwaW5nIHRoZSBjYWNoZSBpbiBzeW5jIHdvdWxkIGdldAo+ID4gcHVzaGVkIGFsbCB0aHJvdWdo
b3V0IHRoZSBkcml2ZXIuCj4KPiBUaGUgaXJxX2VuYWJsZSgpL2Rpc2FibGUoKSBjYWxsYmFja3Mg
YXJlIG5vdCByZWFsbHkgaG90cGF0aCBhbmQgY2FjaGluZwo+IHRoZSBiaXQgaW4gcGxpY190b2dn
bGUoKSBvciBzdWNoIGlzIGp1c3Qgbm90IG1lYXN1cmFibGUgb3ZlcmhlYWQKPiBjb21wYXJlZCB0
byB0aGUgcmVnaXN0ZXIgYWNjZXNzLgoKRmFpciBlbm91Z2gsIGlmIHlvdSBpbnNpc3QuIFRoaXMg
d2lsbCBwcm9iYWJseSByZXF1aXJlIGEgc2Vjb25kIHBhdGNoCnJlZmFjdG9yaW5nIGEgZGVjZW50
IGFtb3VudCBvZiBjb2RlIChzaW5jZSB0aGUgc3VzcGVuZCAvIHJlc3VtZSBwYXRoCmZvciB3aGlj
aCB0aGlzIGVuYWJsZSBhcnJheSB3YXMgYWRkZWQgYmVjb21lcyBzaW1wbGVyKS4KCj4KPiA+PiBO
b3cgZm9yIHRoZSBzZWFyY2ggYW5kIGRpc2FibGUgbWVjaGFuaXNtLiBPZiBjb3Vyc2UgeW91IG5l
ZWQgdG8gc2VhcmNoCj4gPj4gZm9yIHRoIHBlbmRpbmcgaW50ZXJydXB0IGZpcnN0LCBidXQgdGhl
biB5b3UgY2FuIG1ha2UgdGhhdCBtYXNraW5nIGxvb3AKPiA+PiB2ZXJ5IHNpbXBsZSBieSBoYXZp
bmcgYSBwbGljX2hhbmRsZXI6OmVuYWJsZWRfY2xlYXJbXSBhcnJheSB3aGljaCBpcwo+ID4+IHpl
cm9lZCBvbiBpbml0aWFsaXphdGlvbjoKPiA+Pgo+ID4+ICAgICAgICAgdW5zaWduZWQgbG9uZyBw
ZW5kaW5nID0gMDsKPiA+Pgo+ID4+ICAgICAgICAgZm9yIChncm91cCA9IDA7ICFwZW5kaW5nICYm
IGdyb3VwIDwgbnJfaXJxX2dyb3VwczsgZ3JvdXArKykgewo+ID4+ICAgICAgICAgICAgICAgICBw
ZW5kaW5nID0gaGFuZGxlci0+ZW5hYmxlZF9zYXZlW2ldOwo+ID4+ICAgICAgICAgICAgICAgICBw
ZW5kaW5nID0mIHJlYWRsX3JlbGF4ZWQocGVuZGluZyArIGdyb3VwICogc2l6ZW9mKHUzMikpOwo+
ID4+ICAgICAgICAgfQo+ID4+ICAgICAgICAgaWYgKCFwZW5kaW5nKQo+ID4+ICAgICAgICAgICAg
ICAgICByZXR1cm4gZmFsc2U7Cj4gPj4KPiA+PiAgICAgICAgIGJpdCA9IGZmcyhwZW5kaW5nKSAt
IDE7Cj4gPj4gICAgICAgICBoYW5kbGVyLT5lbmFibGVkX2NsZWFyW2dyb3VwXSB8PSBCSVQoYml0
KTsKPiA+PiAgICAgICAgIGZvciAoaW50IGkgPSAwOyBpIDwgbnJfaXJxX2dyb3VwczsgaSsrKQo+
ID4+ICAgICAgICAgICAgICAgICB3cml0ZWxfcmVsYXhlZChoYW5kbGVyLT5lbmFibGVkX2NsZWFy
W2ldLCBlbmFibGUgKyBpICogc2l6ZW9mKHUzMikpOwo+ID4+ICAgICAgICAgaGFuZGxlci0+ZW5h
YmxlZF9jbGVhcltncm91cF0gPSAwOwo+ID4+Cj4gPj4gTm8/Cj4gPgo+ID4gU3VyZSB0aGF0IHdv
dWxkIGFsc28gd29yaywgYnV0IHdoeSBhcmUgd2UgdXNpbmcgZmZzIChzbG93KSBvbmx5IHRvCj4g
PiBzaGlmdCB0aGUgcmVzdWx0IGJhY2sgdG8gbWFrZSBhIG5ldyBtYXNrIHdoZW4gKHggJiAteCkg
aXMgZmFzdGVyIGFuZAo+ID4gc2tpcHMgdGhlIGludGVybWVkaWF0ZSBzdGVwIGRlbGl2ZXJpbmcg
aW1tZWRpYXRlbHkgdGhlIG1hc2sgb2YgdGhlCj4gPiBsb3dlc3QgYml0Lgo+Cj4gQmVjYXVzZSBJ
IGRpZCBub3Qgc3BlbmQgdGltZSB0aGlua2luZyBhYm91dCBpdC4KClNvcnJ5LCBkaWQgeW91IG1l
YW4gImJlY2F1c2UgSSBoYWQgbm90IGNvbnNpZGVyZWQgdGhlIG9yaWdpbmFsCmFwcHJvYWNoIGNh
cmVmdWxseSBlbm91Z2giIG9yICJiZWNhdXNlIHRoaXMgb3RoZXIgYXBwcm9hY2gsIHdoaWxlCnNs
b3dlciwgaXMgbW9yZSBzZWxmIGV2aWRlbnRseSBjb3JyZWN0LiIKCklmIHlvdSBtZWFudCB0aGUg
bGF0dGVyLCBJIHN0aWxsIHdhbnQgdG8gYXJndWUgZm9yIHRoZSBiaXQgdHdpZGRsaW5nCmFwcHJv
YWNoLiBJIHZlcmlmaWVkIHRoYXQgY2xhbmcgYW5kIGdjYyBhcmUgYm90aCBub3Qgc21hcnQgZW5v
dWdoIHRvCnJlY29nbml6ZSB0aGUgcGF0dGVybiBvZiBmZnMgZm9sbG93ZWQgYnkgc2hpZnQgYW5k
IG9wdGltaXplIHRvIHggJiAteAooZXZlbiBvbiAtTzMgWzFdKSwgc28gdXNpbmcgZmZzIGlzIGRl
ZmluaXRlbHkgc2xvd2VyIGFuZCByZWxpZXMgb24gYQpidW5jaCBvZiBtYWNoaW5lcnkgKGFsdGVy
bmF0aXZlcyBiZWNhdXNlIHJpc2MtdiBkb2VzIG5vdCBpbmNsdWRlIGEKZGVkaWNhdGVkIGNvdW50
IHRyYWlsaW5nIHplcm9zIGluc3RydWN0aW9uIGluIHRoZSBiYXNlIGlzYSkuIFRvIG1lCmFueXdh
eXMsIHRoZSBsb2dpYyBvZiB4ICYgLXggaXMgcHJldHR5IG9idmlvdXMsIGFuZCBldmVuIG1vcmUg
c28gd2l0aAphIGNvbW1lbnQsIGFuZCB0aGlzIGlzIGFjdHVhbGx5IGluIHRoZSBob3QgcGF0aC4K
Cj4KPiA+IEFzIGZvciBtYWtpbmcgYW5vdGhlciBjYWNoaW5nIGFycmF5LCBJIGd1ZXNzLCBidXQg
YWdhaW4gdGhhdCBpcyBqdXN0IGEKPiA+IHRpbWUgdnMgc3BhY2UgdHJhZGUgb2ZmIHdpdGggaXRz
IG93biBpbnZhcmlhbnRzIHRvIG1haW50YWluIHRoYXQgd291bGQKPiA+IGFsc28gaW1wYWN0IG90
aGVyIHBsYXRmb3Jtcy4KPgo+IEl0J3MgYSBwb2ludGVyIGluIHN0cnVjdCBwbGljX2hhbmRsZXIg
KG9yIHdoYXRldmVyIGl0J3MgbmFtZWQpIGFuZCB5b3UKPiBjYW4gYWxsb2NhdGUgaXQgd2hlbiB0
aGUgcXVpcmsgaXMgcmVxdWlyZWQuIFRoZSBwb2ludGVyIGlzIGRlZmluaXRlbHkKPiBub3QgYSBi
dXJkZW4gZm9yIGFueW9uZSBlbHNlLgoKVGhpcyBJIHN0aWxsIGRvbid0IHVuZGVyc3RhbmQgaG93
IHRoaXMgaXMgcGFydGljdWFybHkgaGVscGZ1bC4gU2luY2UKd2UgYXJlIGRvaW5nIG1taW8sIHRo
aXMgaXMgZ29pbmcgdG8gYmUgYW4gZXhwbGljaXQgbG9vcCBhbmQgbm90IGEKbWVtY3B5LiBUaGUg
Y29kZSBpcyBicmFuY2hsZXNzIGluIGVpdGhlciBjYXNlIChzZXQgZXF1YWwgZm9yIHRoZSBjaGVj
awpvZiBpIGFnYWluc3QgaiBuZWdhdGUgYW5kIGFuZCB3aXRoIG1hc2sgYmVmb3JlIGxvYWRpbmcg
aW50byB0aGUgbW1pbykuCgoKPgo+ID4+IElzIHRoZSBkZXZpY2UgQiBpbnRlcnJ1cHQgcHJlc2Vy
dmVkIGluIHRoZSBpbnRlcnJ1cHQgY2hpcCBhbmQgYWN0dWFsbHkKPiA+PiByYWlzZWQgd2hlbiB0
aGUgaW50ZXJydXB0IGVuYWJsZSBiaXQgaXMgcmVzdG9yZWQgb3IgaXMgaXQgbG9zdD8KPiA+Cj4g
PiBJIGFtIG5vdCBzdXJlIGhvdyB0byB2ZXJpZnkgdGhpcyBvdGhlciB0aGFuIHRvIHRlbGwgeW91
IHRoYXQgd2l0aG91dAo+ID4gdGhpcyBxdWlyayAoaS5lLiB0cnlpbmcgdG8gdXNlIG5vcm1hbCBw
bGljIGJlaGF2aW9yKSB0aGUgZGV2aWNlIGRvZXMKPiA+IG5vdCB3b3JrLCBidXQgd2l0aCB0aGlz
IHF1aXJrIEkgY2FuIGJvb3QgdG8gYSBkZXNrdG9wIHdpdGggYSBwY2llCj4gPiBncmFwaGljcyBj
YXJkIGFuZCBzdG9yYWdlLCB1c2UgbmV0d29ya2luZyBldGMgdGhhdCBhbGwgb2J2aW91c2x5Cj4g
PiBkZXBlbmQgb24gdGhlIGNvcnJlY3QgZnVuY3Rpb25pbmcgb2YgdGhlIGludGVycnVwdCBjb250
cm9sbGVyLgo+ID4KPiA+IE15IHJlYWRpbmcgb2YgdGhlIHNwZWMgZm9yIFBMSUMgYWxzbyBzdWdn
ZXN0cyAoYnV0IGRvZXMgbm90IGV4cGxpY2l0bHkKPiA+IGNvbmZpcm0pIHRoYXQgdGhlIHBlbmRp
bmcgYml0cyBmdW5jdGlvbiBpcnJlc3BlY3RpdmUgb2YgdGhlIHN0YXRlIG9mCj4gPiB0aGUgY29y
cmVzcG9uZGluZyBlbmFibGUgYml0OiAiQSBwZW5kaW5nIGJpdCBpbiB0aGUgUExJQyBjb3JlIGNh
biBiZQo+ID4gY2xlYXJlZCBieSBzZXR0aW5nIHRoZSBhc3NvY2lhdGVkIGVuYWJsZSBiaXQgdGhl
biBwZXJmb3JtaW5nIGEgY2xhaW0uIgo+ID4gKHBhZ2UgMTQgcGxpYyBzcGVjIDEuMC4wIFsxXSku
Cj4gPgo+ID4gVGhpcyBzZW50ZW5jZSBpbXBsaWVzIHRvIG1lIHRoYXQgaXQgaXMgcG9zc2libGUg
Zm9yIGEgcGVuZGluZyBiaXQgdG8KPiA+IGJlIHNldCBldmVuIHRob3VnaCB0aGUgY29ycmVzcG9u
ZGluZyBlbmFibGUgYml0IGlzIG5vdCwgd2hpY2ggbGVuZHMKPiA+IGNyZWRlbmNlIHRvIHRoZSBp
ZGVhIHRoYXQgdGhlIHBlbmRpbmcgYml0cyBvcGVyYXRlIGluZGVwZW5kZW50bHkuCj4KPiBMb29r
cyBsaWtlIHRoYXQuIFBsZWFzZSBhZGQgYSBjb21tZW50IHRvIHRoYXQgZWZmZWN0IHRoZW4uCgpX
aWxsIGRvLgoKPgo+IFRoYW5rcywKPgo+ICAgICAgICAgdGdseAo+CgpbMV0gaHR0cHM6Ly9nb2Ri
b2x0Lm9yZy96L2VvZm96WWpQbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
