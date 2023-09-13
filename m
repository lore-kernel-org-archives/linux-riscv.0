Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11284CA5502
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 08:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kApI1IklLoyGDEgOTvpOwrhEbmqpETlCgCSdbBNCHlo=; b=XQSaW2SGtTADwq
	25EpesZ1oKgEdVAAoQghWuxP6yekxUs7cuDLwKQCgLb6pIFR9lq28TOrvrTD+vtCeo5q6Ax/srXSd
	5WJ9BT8A4P5BnC1TVk2fts0vfIGC94yKPi9HnJHyvilqQPysrTEOnKrKvUBsj1R50OCAGROnUpVwj
	tk0jwXLWnpVP2T+xZU7oj75/wzMh7KXiwMGS7QI6cPO9hqL1KoNdITKC/uGb59h7SGa2YyHiw7+Bz
	PM2e8suD7dQ2rVnyQkvmuZZHzu0+3hKMqNzQni6KybQj8NgoyGudMD9gOuJdtkbksMBptL7BtI+PA
	mfsMuDAIaS2L3lJvfLNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgKn3-0050bW-29;
	Wed, 13 Sep 2023 08:00:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgKn0-0050aU-2I
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 08:00:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694591997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qn+Rvi3KEsNuqH89FqpaJB3chCAou0VjBLqNOIj1NKA=;
	b=MgmmmOP3KtSOtw1A9zdE6L+/km+TIXWUGEYn+lljcL2XeLe7QPAAuRCaQup+JA3bTt1uTh
	yRH/7b8MtpVp0Tu/qAkyFjfwH/+Myagdo3LlrDUcPLpc4Ie1ZfHMY1fOEjjlVBEs4gZwfi
	BLXDntqRIqicFH0MCd7q8zCGz3JjZ+o=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-NfxIhld7MK-GJgj7nbcDXg-1; Wed, 13 Sep 2023 03:59:54 -0400
X-MC-Unique: NfxIhld7MK-GJgj7nbcDXg-1
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-576925c8921so3723003eaf.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 00:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694591994; x=1695196794;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qn+Rvi3KEsNuqH89FqpaJB3chCAou0VjBLqNOIj1NKA=;
        b=ny6vxXhXXduL/nfsUjPaX0w3n2PozownaZxcJj9rhzH65nNa+Ay5s/bjdzu+HVYjuv
         cCDxmunAqluoZo67cREA0DtJMWlwCRJu4nA0m4Tz5Deo6ybYN1mxMtiUGbboLk3bLsCN
         q46YKm9i1CFD7RGnHigpXwf/M1Hpyq6Pz76gFDLXnfE7nPfyhd4JfjZ89/Hj2pZSI8Pn
         jbe/VKn3YGFRzyFolQ6Z+VHN2aYrnGIM4z42y4GVeHSopJatpfAhPBIUxDFVy9TEMJI2
         NMvj5P3o0RdHmsReZd+VsT3dsA3wg313YsO9OTnTZiwrE4JHW7kaNdYFzK1AYw47VDGf
         XFDQ==
X-Gm-Message-State: AOJu0YwZaMDVQO19Im6ynysiwEdYVb9/uPvBxZxTUsfKEG8g2Ppbh8hh
	a6tL+RUFsL9xt9S4CWh+GlUDsZop2G2+bcMzUlsx9Sf6nSdiMcUQkCq5rwpCMi+oWgvANc6A9ik
	uh9MaFwaSyOmRidee++dXW4LWZtG/
X-Received: by 2002:a4a:9002:0:b0:571:28a7:bcca with SMTP id i2-20020a4a9002000000b0057128a7bccamr1816195oog.1.1694591994234;
        Wed, 13 Sep 2023 00:59:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLkEjNahfHYX7tZYhXT/ZX+4kZcuTHvxRjPc0v0vlixFaqqxwikb4fwJBCpdjiUauIx9LpUg==
X-Received: by 2002:a4a:9002:0:b0:571:28a7:bcca with SMTP id i2-20020a4a9002000000b0057128a7bccamr1816184oog.1.1694591993958;
        Wed, 13 Sep 2023 00:59:53 -0700 (PDT)
Received: from redhat.com ([2804:1b3:a803:4ff9:7c29:fe41:6aa7:43df])
        by smtp.gmail.com with ESMTPSA id s4-20020a4a5104000000b005658aed310bsm5159994ooa.15.2023.09.13.00.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 00:59:53 -0700 (PDT)
Date: Wed, 13 Sep 2023 04:59:44 -0300
From: Leonardo Bras <leobras@redhat.com>
To: Guo Ren <guoren@kernel.org>
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org,
	mingo@redhat.com, will@kernel.org, palmer@rivosinc.com,
	longman@redhat.com, boqun.feng@gmail.com, tglx@linutronix.de,
	paulmck@kernel.org, rostedt@goodmis.org, rdunlap@infradead.org,
	catalin.marinas@arm.com, conor.dooley@microchip.com,
	xiaoguang.xing@sophgo.com, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, keescook@chromium.org,
	greentime.hu@sifive.com, ajones@ventanamicro.com,
	jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn,
	linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V11 01/17] asm-generic: ticket-lock: Reuse
 arch_spinlock_t of qspinlock
Message-ID: <ZQFr8E-i8dB5Ofwm@redhat.com>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910082911.3378782-2-guoren@kernel.org>
 <5c082cb1fd306cb75abbcaa80229d791260f8756.camel@redhat.com>
 <CAJF2gTSynMnYy+ARhFb0JjbAGjEYrfgsiGa2ZWv4wB3HdheU2A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTSynMnYy+ARhFb0JjbAGjEYrfgsiGa2ZWv4wB3HdheU2A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_005958_825663_148CD300 
X-CRM114-Status: GOOD (  37.65  )
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

T24gV2VkLCBTZXAgMTMsIDIwMjMgYXQgMDk6NTU6MzFBTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBUdWUsIFNlcCAxMiwgMjAyMyBhdCAzOjA14oCvQU0gTGVvbmFyZG8gQnLDoXMgPGxlb2Jy
YXNAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gU3VuLCAyMDIzLTA5LTEwIGF0IDA0OjI4
IC0wNDAwLCBndW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPiA+ID4gRnJvbTogR3VvIFJlbiA8Z3Vv
cmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPgo+ID4gPiBUaGUgYXJjaF9zcGlubG9ja190IG9m
IHFzcGlubG9jayBoYXMgY29udGFpbmVkIHRoZSBhdG9taWNfdCB2YWwsIHdoaWNoCj4gPiA+IHNh
dGlzZmllcyB0aGUgdGlja2V0LWxvY2sgcmVxdWlyZW1lbnQuIFRodXMsIHVuaWZ5IHRoZSBhcmNo
X3NwaW5sb2NrX3QKPiA+ID4gaW50byBxc3BpbmxvY2tfdHlwZXMuaC4gVGhpcyBpcyB0aGUgcHJl
cGFyYXRpb24gZm9yIHRoZSBuZXh0IGNvbWJvCj4gPiA+IHNwaW5sb2NrLgo+ID4gPgo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+ID4gU2lnbmVkLW9m
Zi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPiAtLS0KPiA+ID4g
IGluY2x1ZGUvYXNtLWdlbmVyaWMvc3BpbmxvY2suaCAgICAgICB8IDE0ICsrKysrKystLS0tLS0t
Cj4gPiA+ICBpbmNsdWRlL2FzbS1nZW5lcmljL3NwaW5sb2NrX3R5cGVzLmggfCAxMiArKy0tLS0t
LS0tLS0KPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlv
bnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvc3Bpbmxv
Y2suaCBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvc3BpbmxvY2suaAo+ID4gPiBpbmRleCA5MDgwM2E4
MjZiYTAuLjQ3NzMzMzRlZTYzOCAxMDA2NDQKPiA+ID4gLS0tIGEvaW5jbHVkZS9hc20tZ2VuZXJp
Yy9zcGlubG9jay5oCj4gPiA+ICsrKyBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvc3BpbmxvY2suaAo+
ID4gPiBAQCAtMzIsNyArMzIsNyBAQAo+ID4gPgo+ID4gPiAgc3RhdGljIF9fYWx3YXlzX2lubGlu
ZSB2b2lkIGFyY2hfc3Bpbl9sb2NrKGFyY2hfc3BpbmxvY2tfdCAqbG9jaykKPiA+ID4gIHsKPiA+
ID4gLSAgICAgdTMyIHZhbCA9IGF0b21pY19mZXRjaF9hZGQoMTw8MTYsIGxvY2spOwo+ID4gPiAr
ICAgICB1MzIgdmFsID0gYXRvbWljX2ZldGNoX2FkZCgxPDwxNiwgJmxvY2stPnZhbCk7Cj4gPiA+
ICAgICAgIHUxNiB0aWNrZXQgPSB2YWwgPj4gMTY7Cj4gPiA+Cj4gPiA+ICAgICAgIGlmICh0aWNr
ZXQgPT0gKHUxNil2YWwpCj4gPiA+IEBAIC00NiwzMSArNDYsMzEgQEAgc3RhdGljIF9fYWx3YXlz
X2lubGluZSB2b2lkIGFyY2hfc3Bpbl9sb2NrKGFyY2hfc3BpbmxvY2tfdCAqbG9jaykKPiA+ID4g
ICAgICAgICogaGF2ZSBubyBvdXRzdGFuZGluZyB3cml0ZXMgZHVlIHRvIHRoZSBhdG9taWNfZmV0
Y2hfYWRkKCkgdGhlIGV4dHJhCj4gPiA+ICAgICAgICAqIG9yZGVyaW5ncyBhcmUgZnJlZS4KPiA+
ID4gICAgICAgICovCj4gPiA+IC0gICAgIGF0b21pY19jb25kX3JlYWRfYWNxdWlyZShsb2NrLCB0
aWNrZXQgPT0gKHUxNilWQUwpOwo+ID4gPiArICAgICBhdG9taWNfY29uZF9yZWFkX2FjcXVpcmUo
JmxvY2stPnZhbCwgdGlja2V0ID09ICh1MTYpVkFMKTsKPiA+ID4gICAgICAgc21wX21iKCk7Cj4g
PiA+ICB9Cj4gPiA+Cj4gPiA+ICBzdGF0aWMgX19hbHdheXNfaW5saW5lIGJvb2wgYXJjaF9zcGlu
X3RyeWxvY2soYXJjaF9zcGlubG9ja190ICpsb2NrKQo+ID4gPiAgewo+ID4gPiAtICAgICB1MzIg
b2xkID0gYXRvbWljX3JlYWQobG9jayk7Cj4gPiA+ICsgICAgIHUzMiBvbGQgPSBhdG9taWNfcmVh
ZCgmbG9jay0+dmFsKTsKPiA+ID4KPiA+ID4gICAgICAgaWYgKChvbGQgPj4gMTYpICE9IChvbGQg
JiAweGZmZmYpKQo+ID4gPiAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+ID4KPiA+ID4g
LSAgICAgcmV0dXJuIGF0b21pY190cnlfY21weGNoZyhsb2NrLCAmb2xkLCBvbGQgKyAoMTw8MTYp
KTsgLyogU0MsIGZvciBSQ3NjICovCj4gPiA+ICsgICAgIHJldHVybiBhdG9taWNfdHJ5X2NtcHhj
aGcoJmxvY2stPnZhbCwgJm9sZCwgb2xkICsgKDE8PDE2KSk7IC8qIFNDLCBmb3IgUkNzYyAqLwo+
ID4gPiAgfQo+ID4gPgo+ID4gPiAgc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIGFyY2hfc3Bp
bl91bmxvY2soYXJjaF9zcGlubG9ja190ICpsb2NrKQo+ID4gPiAgewo+ID4gPiAgICAgICB1MTYg
KnB0ciA9ICh1MTYgKilsb2NrICsgSVNfRU5BQkxFRChDT05GSUdfQ1BVX0JJR19FTkRJQU4pOwo+
ID4gPiAtICAgICB1MzIgdmFsID0gYXRvbWljX3JlYWQobG9jayk7Cj4gPiA+ICsgICAgIHUzMiB2
YWwgPSBhdG9taWNfcmVhZCgmbG9jay0+dmFsKTsKPiA+ID4KPiA+ID4gICAgICAgc21wX3N0b3Jl
X3JlbGVhc2UocHRyLCAodTE2KXZhbCArIDEpOwo+ID4gPiAgfQo+ID4gPgo+ID4gPiAgc3RhdGlj
IF9fYWx3YXlzX2lubGluZSBpbnQgYXJjaF9zcGluX3ZhbHVlX3VubG9ja2VkKGFyY2hfc3Bpbmxv
Y2tfdCBsb2NrKQo+ID4gPiAgewo+ID4gPiAtICAgICB1MzIgdmFsID0gbG9jay5jb3VudGVyOwo+
ID4gPiArICAgICB1MzIgdmFsID0gbG9jay52YWwuY291bnRlcjsKPiA+ID4KPiA+ID4gICAgICAg
cmV0dXJuICgodmFsID4+IDE2KSA9PSAodmFsICYgMHhmZmZmKSk7Cj4gPiA+ICB9Cj4gPgo+ID4g
VGhpcyBvbmUgc2VlbXMgdG8gYmUgZGlmZmVyZW50IGluIHRvcnZhbGRzL21hc3RlciwgYnV0IEkg
c3VwcG9zZSBpdCdzIGJlY2F1c2Ugb2YKPiA+IHRoZSByZXF1aXJlbWVudCBwYXRjaGVzIEkgaGF2
ZSBub3QgbWVyZ2VkLgo+ID4KPiA+ID4gQEAgLTg0LDcgKzg0LDcgQEAgc3RhdGljIF9fYWx3YXlz
X2lubGluZSBpbnQgYXJjaF9zcGluX2lzX2xvY2tlZChhcmNoX3NwaW5sb2NrX3QgKmxvY2spCj4g
PiA+Cj4gPiA+ICBzdGF0aWMgX19hbHdheXNfaW5saW5lIGludCBhcmNoX3NwaW5faXNfY29udGVu
ZGVkKGFyY2hfc3BpbmxvY2tfdCAqbG9jaykKPiA+ID4gIHsKPiA+ID4gLSAgICAgdTMyIHZhbCA9
IGF0b21pY19yZWFkKGxvY2spOwo+ID4gPiArICAgICB1MzIgdmFsID0gYXRvbWljX3JlYWQoJmxv
Y2stPnZhbCk7Cj4gPiA+Cj4gPiA+ICAgICAgIHJldHVybiAoczE2KSgodmFsID4+IDE2KSAtICh2
YWwgJiAweGZmZmYpKSA+IDE7Cj4gPiA+ICB9Cj4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2Fz
bS1nZW5lcmljL3NwaW5sb2NrX3R5cGVzLmggYi9pbmNsdWRlL2FzbS1nZW5lcmljL3NwaW5sb2Nr
X3R5cGVzLmgKPiA+ID4gaW5kZXggODk2MmJiNzMwOTQ1Li5mNTM0YWE1ZGUzOTQgMTAwNjQ0Cj4g
PiA+IC0tLSBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvc3BpbmxvY2tfdHlwZXMuaAo+ID4gPiArKysg
Yi9pbmNsdWRlL2FzbS1nZW5lcmljL3NwaW5sb2NrX3R5cGVzLmgKPiA+ID4gQEAgLTMsMTUgKzMs
NyBAQAo+ID4gPiAgI2lmbmRlZiBfX0FTTV9HRU5FUklDX1NQSU5MT0NLX1RZUEVTX0gKPiA+ID4g
ICNkZWZpbmUgX19BU01fR0VORVJJQ19TUElOTE9DS19UWVBFU19ICj4gPiA+Cj4gPiA+IC0jaW5j
bHVkZSA8bGludXgvdHlwZXMuaD4KPiA+ID4gLXR5cGVkZWYgYXRvbWljX3QgYXJjaF9zcGlubG9j
a190Owo+ID4gPiAtCj4gPiA+IC0vKgo+ID4gPiAtICogcXJ3bG9ja190eXBlcyBkZXBlbmRzIG9u
IGFyY2hfc3BpbmxvY2tfdCwgc28gd2UgbXVzdCB0eXBlZGVmIHRoYXQgYmVmb3JlIHRoZQo+ID4g
PiAtICogaW5jbHVkZS4KPiA+ID4gLSAqLwo+ID4gPiAtI2luY2x1ZGUgPGFzbS9xcndsb2NrX3R5
cGVzLmg+Cj4gPiA+IC0KPiA+ID4gLSNkZWZpbmUgX19BUkNIX1NQSU5fTE9DS19VTkxPQ0tFRCAg
ICBBVE9NSUNfSU5JVCgwKQo+ID4gPiArI2luY2x1ZGUgPGFzbS1nZW5lcmljL3FzcGlubG9ja190
eXBlcy5oPgo+ID4gPiArI2luY2x1ZGUgPGFzbS1nZW5lcmljL3Fyd2xvY2tfdHlwZXMuaD4KPiA+
ID4KPiA+ID4gICNlbmRpZiAvKiBfX0FTTV9HRU5FUklDX1NQSU5MT0NLX1RZUEVTX0ggKi8KPiA+
Cj4gPiBGV0lXLCBMR1RNOgo+ID4KPiA+IFJldmlld2VkLWJ5OiBMZW9uYXJkbyBCcmFzIDxsZW9i
cmFzQHJlZGhhdC5jb20+Cj4gPgo+ID4KPiA+IEp1c3QgYSBzdWdnZXN0aW9uOiBJbiB0aGlzIHBh
dGNoIEkgY291bGQgc2VlIGEgbG90IG9mIHVzYWdlIGNoYW5nZXMgdG8KPiA+IGFyY2hfc3Bpbmxv
Y2tfdCwgYW5kIG9ubHkgYXQgdGhlIGVuZCBJIGNvdWxkIHNlZSB0aGUgYWN0dWFsIGNoYW5nZSBp
biB0aGUgLmgKPiA+IGZpbGUuCj4gIGluY2x1ZGUvYXNtLWdlbmVyaWMvc3BpbmxvY2suaCAgICAg
ICB8IDE0ICsrKysrKystLS0tLS0tCj4gIGluY2x1ZGUvYXNtLWdlbmVyaWMvc3BpbmxvY2tfdHlw
ZXMuaCB8IDEyICsrLS0tLS0tLS0tLQo+IAo+IEFsbCBhcmUgLmggZmlsZXMuIFNvLCBob3cgdG8g
dXNlIGdpdC5vcmRlcmZpbGU/CgpZZWFwLCB5b3UgYXJlIHJpZ2h0LgoKRm9yIHNvbWUgcmVhc29u
IEkgZ290IGNvbmZ1c2VkIGFib3V0IHNlZWluZyBmdW5jdGlvbnMgYmVmb3JlIHR5cGUgZGVmaW5p
dGlvbi4KCkJ1dCBpbiBhbnkgd2F5LCB3ZSBjYW4gZ2V0IHRoZSBzYW1lIHJlc3VsdCB3aXRoOgoK
KnR5cGVzLmgKKi5oCiouYwoKTWVhbmluZyAnc3BpbmxvY2tfdHlwZXMuaCcgd2lsbCBhcHBlYXIg
YmVmb3JlICdzcGlubG9jay5oJy4KCkFmdGVyIGZpcnN0IHN1Z2dlc3RpbmcgdGhpcywgSSBhbHNv
IHNlbnQgYSBwYXRjaCBwcm92aWRpbmcgYSBkZWZhdWx0Cm9yZGVyRmlsZSBmb3IgdGhlIGtlcm5l
bCwgYW5kIEkgYWxzbyBhZGRlZCB0aGlzIHRvIHRoZSBsYXRlc3QgdmVyc2lvbjoKCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDkxMzA3NTU1MC45MDkzNC0yLWxlb2JyYXNAcmVkaGF0
LmNvbS8KCj4gCj4gPgo+ID4gSW4gY2FzZXMgbGlrZSB0aGlzLCBpdCBsb29rcyBuaWNlciB0byBz
ZWUgdGhlIC5oIGZpbGUgZmlyc3QuCj4gPgo+ID4gSSByZWNlbnRseSBmb3VuZCBvdXQgYWJvdXQg
dGhpcyBnaXQgZGlmZi5vcmRlckZpbGUgb3B0aW9uLCB3aGljaCBoZWxwcyB0bwo+ID4gYWNoaWV2
ZSBleGFjdGx5IHRoaXMuCj4gPgo+ID4gSSB1c2UgdGhlIGZvbGxvd2luZyBnaXQub3JkZXJmaWxl
LCBhZGFwdGVkIGZyb20gcWVtdToKPiA+Cj4gPiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gPiAjCj4g
PiAjIG9yZGVyIGZpbGUgZm9yIGdpdCwgdG8gcHJvZHVjZSBwYXRjaGVzIHdoaWNoIGFyZSBlYXNp
ZXIgdG8gcmV2aWV3Cj4gPiAjIGJ5IGRpZmZpbmcgdGhlIGltcG9ydGFudCBzdHVmZiBsaWtlIGlu
dGVyZmFjZSBjaGFuZ2VzIGZpcnN0Lgo+ID4gIwo+ID4gIyBvbmUtb2ZmIHVzYWdlOgo+ID4gIyAg
IGdpdCBkaWZmIC1PIHNjcmlwdHMvZ2l0Lm9yZGVyZmlsZSAuLi4KPiA+ICMKPiA+ICMgYWRkIHRv
IGdpdCBjb25maWc6Cj4gPiAjICAgZ2l0IGNvbmZpZyBkaWZmLm9yZGVyRmlsZSBzY3JpcHRzL2dp
dC5vcmRlcmZpbGUKPiA+ICMKPiA+Cj4gPiBNQUlOVEFJTkVSUwo+ID4KPiA+ICMgRG9jdW1lbnRh
dGlvbgo+ID4gRG9jdW1lbnRhdGlvbi8qCj4gPiAqLnJzdAo+ID4gKi5yc3QuaW5jCj4gPgo+ID4g
IyBidWlsZCBzeXN0ZW0KPiA+IEtidWlsZAo+ID4gTWFrZWZpbGUqCj4gPiAqLm1hawo+ID4KPiA+
ICMgc2VtYW50aWMgcGF0Y2hlcwo+ID4gKi5jb2NjaQo+ID4KPiA+ICMgaGVhZGVycwo+ID4gKi5o
Cj4gPiAqLmguaW5jCj4gPgo+ID4gIyBjb2RlCj4gPiAqLmMKPiA+ICouYy5pbmMKPiA+Cj4gPgo+
IAo+IAo+IC0tIAo+IEJlc3QgUmVnYXJkcwo+ICBHdW8gUmVuCj4gCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
