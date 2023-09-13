Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7394ECA5514
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 08:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pkfnsbePqSbvp1qGwo29TBvheynvduxgyHNib577e3U=; b=2a/xO+ReBd7WVQ
	cm+7DRej0/iVMN/m30ipNthCFJC6r55F432eSmj2Ri6BL9kM/inYvzL4FBoahBioAsFFq1V9BMxOa
	0+M89tGaP6U25zH3Gc1FI6d7GTZLORFHugl7S80JNXQFQfPeaLooTmkAGM9pYmjr98FKNcRfh/CWl
	qoX3xg8612Egi4Tgv4QWTbcIN9DFNszf82JwcQQzno4nk0NsryHnfXtPFJVjhwhR3CfJ4YvffK47M
	MPRVCe1F/vmSakaDG/P+6hnKczfnywhN6YSrzl9gZMewitWa/7oxEHkGvR56JttMRoaUtkc6vPhKq
	wHBORe2QuLsszsKkPnuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLeo-005Csv-2T;
	Wed, 13 Sep 2023 08:55:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLel-005Crx-1Y
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 08:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694595330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7IDrq/ZjwAliy/cuqJYdam/hL0PUOvTA7Mi9bsbloig=;
	b=ENF7Sx49nQ4+fUS0NGTWV5t25uikGyGTL70wJbImCf00lsYQM4wQyD/GJUtAowq2ZEBYZO
	VNskOMU+9WvY+7j3/NMcxq8hZk490rwLyFZMgQy31M4tUq04djmWTEjoLzDiv/7JJoso+0
	bkXT9W4jx85gpNaRw3Dvjv8n0/bVtw4=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-_caM-cuiMzOWS21OPm77Ng-1; Wed, 13 Sep 2023 04:55:27 -0400
X-MC-Unique: _caM-cuiMzOWS21OPm77Ng-1
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3ab7fb11711so4836341b6e.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 01:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694595326; x=1695200126;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7IDrq/ZjwAliy/cuqJYdam/hL0PUOvTA7Mi9bsbloig=;
        b=KT1H6PuoxVLRdLSg4ZDC738H/8zH6PtQ/1k96xK0xiI83Cz4Z/iiimfTUKcGamv0lN
         DRXSK175vv3cJ/e7dN4OMjy+nuZGRJRZ6xcuaFfGPop8sc0yjjyMoQ6Vz6g0x64e1S+1
         amD0FOU0+XtOBK56qAW32nwukbbnAFtDdL7VBd0BElNnFmzRgYNc2h0eD89t1vynok4g
         8fTo6/7U7A8Jvjs36eRdz+DnN/PFkJCu5ib7xFAg+Y3QHyNZp3fjL05v3VYR5AOze+Xz
         MrHqiQ747aBijjNifld5kXKimXLHISCcIFkafF3pLexDI4w6NCfxRqAunppNx58XCzZH
         thQg==
X-Gm-Message-State: AOJu0YwvI0wdAD9fs950LmJNeqHh3GOs7HDihlQ7UC15rww0t+spfz6I
	yjZSN9UFj9EGou34Fkcs+mXfwBiLVCgxHb6beJ1pQB/KZCUfamvE2m3W0+hYN6FhqVR0E9QKfvW
	2HDNPa31pUszNvvYGmQb2kwb0t5wI
X-Received: by 2002:a05:6808:616:b0:3a8:83df:d5a4 with SMTP id y22-20020a056808061600b003a883dfd5a4mr1851062oih.59.1694595326802;
        Wed, 13 Sep 2023 01:55:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKPVssIlImig5nXmhpkcsDQ7KpqCHiahCisjz+0XwI28OTqJEh/HnL6zXhYAXW7+m311Y1Pw==
X-Received: by 2002:a05:6808:616:b0:3a8:83df:d5a4 with SMTP id y22-20020a056808061600b003a883dfd5a4mr1851051oih.59.1694595326594;
        Wed, 13 Sep 2023 01:55:26 -0700 (PDT)
Received: from redhat.com ([2804:1b3:a803:4ff9:7c29:fe41:6aa7:43df])
        by smtp.gmail.com with ESMTPSA id az19-20020a056830459300b006c21f11dcecsm647356otb.49.2023.09.13.01.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 01:55:26 -0700 (PDT)
Date: Wed, 13 Sep 2023 05:55:16 -0300
From: Leonardo Bras <leobras@redhat.com>
To: Guo Ren <guoren@kernel.org>
Cc: Waiman Long <longman@redhat.com>, paul.walmsley@sifive.com,
	anup@brainfault.org, peterz@infradead.org, mingo@redhat.com,
	will@kernel.org, palmer@rivosinc.com, boqun.feng@gmail.com,
	tglx@linutronix.de, paulmck@kernel.org, rostedt@goodmis.org,
	rdunlap@infradead.org, catalin.marinas@arm.com,
	conor.dooley@microchip.com, xiaoguang.xing@sophgo.com,
	bjorn@rivosinc.com, alexghiti@rivosinc.com, keescook@chromium.org,
	greentime.hu@sifive.com, ajones@ventanamicro.com,
	jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn,
	linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V11 04/17] locking/qspinlock: Improve xchg_tail for
 number of cpus >= 16k
Message-ID: <ZQF49GIZoFceUGYH@redhat.com>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910082911.3378782-5-guoren@kernel.org>
 <f091ead0-99b9-b30a-a295-730ce321ac60@redhat.com>
 <CAJF2gTSbUUdLhN8PFdFzQd0M1T2MVOL1cdZn46WKq1S8MuQYHw@mail.gmail.com>
 <06714da1-d566-766f-7a13-a3c93b5953c4@redhat.com>
 <CAJF2gTQ3Q7f+FGorVTR66c6TGWsSeeKVvLF+LH1_m3kSHrm0yA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTQ3Q7f+FGorVTR66c6TGWsSeeKVvLF+LH1_m3kSHrm0yA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_015531_592104_B9DA054F 
X-CRM114-Status: GOOD (  33.32  )
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

T24gVHVlLCBTZXAgMTIsIDIwMjMgYXQgMDk6MTA6MDhBTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBNb24sIFNlcCAxMSwgMjAyMyBhdCA5OjAz4oCvUE0gV2FpbWFuIExvbmcgPGxvbmdtYW5A
cmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gOS8xMC8yMyAyMzowOSwgR3VvIFJlbiB3cm90
ZToKPiA+ID4gT24gTW9uLCBTZXAgMTEsIDIwMjMgYXQgMTA6MzXigK9BTSBXYWltYW4gTG9uZyA8
bG9uZ21hbkByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4+Cj4gPiA+PiBPbiA5LzEwLzIzIDA0OjI4
LCBndW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPiA+ID4+PiBGcm9tOiBHdW8gUmVuIDxndW9yZW5A
bGludXguYWxpYmFiYS5jb20+Cj4gPiA+Pj4KPiA+ID4+PiBUaGUgdGFyZ2V0IG9mIHhjaGdfdGFp
bCBpcyB0byB3cml0ZSB0aGUgdGFpbCB0byB0aGUgbG9jayB2YWx1ZSwgc28KPiA+ID4+PiBhZGRp
bmcgcHJlZmV0Y2h3IGNvdWxkIGhlbHAgdGhlIG5leHQgY21weGNoZyBzdGVwLCB3aGljaCBtYXkK
PiA+ID4+PiBkZWNyZWFzZSB0aGUgY21weGNoZyByZXRyeSBsb29wcyBvZiB4Y2hnX3RhaWwuIFNv
bWUgcHJvY2Vzc29ycyBtYXkKPiA+ID4+PiB1dGlsaXplIHRoaXMgZmVhdHVyZSB0byBnaXZlIGEg
Zm9yd2FyZCBndWFyYW50ZWUsIGUuZy4sIFJJU0MtVgo+ID4gPj4+IFh1YW5UaWUgcHJvY2Vzc29y
cyB3b3VsZCBibG9jayB0aGUgc25vb3AgY2hhbm5lbCAmIGlycSBmb3Igc2V2ZXJhbAo+ID4gPj4+
IGN5Y2xlcyB3aGVuIHByZWZldGNoLncgaW5zdHJ1Y3Rpb24gKGZyb20gWmljYm9wIGV4dGVuc2lv
bikgcmV0aXJlZCwKPiA+ID4+PiB3aGljaCBndWFyYW50ZWVzIHRoZSBuZXh0IGNtcHhjaGcgc3Vj
Y2VlZHMuCj4gPiA+Pj4KPiA+ID4+PiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGlu
dXguYWxpYmFiYS5jb20+Cj4gPiA+Pj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtl
cm5lbC5vcmc+Cj4gPiA+Pj4gLS0tCj4gPiA+Pj4gICAga2VybmVsL2xvY2tpbmcvcXNwaW5sb2Nr
LmMgfCA1ICsrKystCj4gPiA+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+ID4gPj4+Cj4gPiA+Pj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9sb2NraW5n
L3FzcGlubG9jay5jIGIva2VybmVsL2xvY2tpbmcvcXNwaW5sb2NrLmMKPiA+ID4+PiBpbmRleCBk
M2Y5OTA2MGI2MGYuLjk2YjU0ZTJhZGU4NiAxMDA2NDQKPiA+ID4+PiAtLS0gYS9rZXJuZWwvbG9j
a2luZy9xc3BpbmxvY2suYwo+ID4gPj4+ICsrKyBiL2tlcm5lbC9sb2NraW5nL3FzcGlubG9jay5j
Cj4gPiA+Pj4gQEAgLTIyMyw3ICsyMjMsMTAgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lk
IGNsZWFyX3BlbmRpbmdfc2V0X2xvY2tlZChzdHJ1Y3QgcXNwaW5sb2NrICpsb2NrKQo+ID4gPj4+
ICAgICAqLwo+ID4gPj4+ICAgIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdTMyIHhjaGdfdGFpbChz
dHJ1Y3QgcXNwaW5sb2NrICpsb2NrLCB1MzIgdGFpbCkKPiA+ID4+PiAgICB7Cj4gPiA+Pj4gLSAg
ICAgdTMyIG9sZCwgbmV3LCB2YWwgPSBhdG9taWNfcmVhZCgmbG9jay0+dmFsKTsKPiA+ID4+PiAr
ICAgICB1MzIgb2xkLCBuZXcsIHZhbDsKPiA+ID4+PiArCj4gPiA+Pj4gKyAgICAgcHJlZmV0Y2h3
KCZsb2NrLT52YWwpOwo+ID4gPj4+ICsgICAgIHZhbCA9IGF0b21pY19yZWFkKCZsb2NrLT52YWwp
Owo+ID4gPj4+Cj4gPiA+Pj4gICAgICAgIGZvciAoOzspIHsKPiA+ID4+PiAgICAgICAgICAgICAg
ICBuZXcgPSAodmFsICYgX1FfTE9DS0VEX1BFTkRJTkdfTUFTSykgfCB0YWlsOwo+ID4gPj4gVGhh
dCBsb29rcyBhIGJpdCB3ZWlyZC4gWW91IHByZS1mZXRjaCBhbmQgdGhlbiBpbW1lZGlhdGVseSBy
ZWFkIGl0LiBIb3cKPiA+ID4+IG11Y2ggcGVyZm9ybWFuY2UgZ2FpbiB5b3UgZ2V0IGJ5IHRoaXMg
Y2hhbmdlIGFsb25lPwo+ID4gPj4KPiA+ID4+IE1heWJlIHlvdSBjYW4gZGVmaW5lIGFuIGFyY2gg
c3BlY2lmaWMgcHJpbWl0aXZlIHRoYXQgZGVmYXVsdCBiYWNrIHRvCj4gPiA+PiBhdG9taWNfcmVh
ZCgpIGlmIG5vdCBkZWZpbmVkLgo+ID4gPiBUaHggZm9yIHRoZSByZXBseS4gVGhpcyBpcyBhIGdl
bmVyaWMgb3B0aW1pemF0aW9uIHBvaW50IEkgd291bGQgbGlrZQo+ID4gPiB0byB0YWxrIGFib3V0
IHdpdGggeW91Lgo+ID4gPgo+ID4gPiBGaXJzdCwgcHJlZmV0Y2h3KCkgbWFrZXMgY2FjaGVsaW5l
IGFuIGV4Y2x1c2l2ZSBzdGF0ZSBhbmQgc2VydmVzIGZvcgo+ID4gPiB0aGUgbmV4dCBjbXB4Y2hn
IGxvb3Agc2VtYW50aWMsIHdoaWNoIHdyaXRlcyB0aGUgaWR4X3RhaWwgcGFydCBvZgo+ID4gPiBh
cmNoX3NwaW5fbG9jay4gVGhlIGF0b21pY19yZWFkIG9ubHkgbWFrZXMgY2FjaGVsaW5lIGluIHRo
ZSBzaGFyZWQKPiA+ID4gc3RhdGUsIHdoaWNoIGNvdWxkbid0IGdpdmUgYW55IGd1YXJhbnRlZSBm
b3IgdGhlIG5leHQgY21weGNoZyBsb29wCj4gPiA+IHNlbWFudGljLiBNaWNyby1hcmNoaXRlY3R1
cmUgY291bGQgdXRpbGl6ZSBwcmVmZXRjaHcoKSB0byBwcm92aWRlIGEKPiA+ID4gc3Ryb25nIGZv
cndhcmQgcHJvZ3Jlc3MgZ3VhcmFudGVlIGZvciB0aGUgeGNoZ190YWlsLCBlLmcuLCB0aGUgVC1I
RUFECj4gPiA+IFh1YW5UaWUgcHJvY2Vzc29yIHdvdWxkIGhvbGQgdGhlIGV4Y2x1c2l2ZSBjYWNo
ZWxpbmUgc3RhdGUgdW50aWwgdGhlCj4gPiA+IG5leHQgY21weGNoZyB3cml0ZSBzdWNjZXNzLgo+
ID4gPgo+ID4gPiBJbiB0aGUgZW5kLCBMZXQncyBnbyBiYWNrIHRvIHRoZSBwcmluY2lwbGU6IHRo
ZSB4Y2hnX3RhaWwgaXMgYW4gYXRvbWljCj4gPiA+IHN3YXAgb3BlcmF0aW9uIHRoYXQgY29udGFp
bnMgd3JpdGUgZXZlbnR1YWxseSwgc28gZ2l2aW5nIGEgcHJlZmV0Y2h3KCkKPiA+ID4gYXQgdGhl
IGJlZ2lubmluZyBpcyBhY2NlcHRhYmxlIGZvciBhbGwgYXJjaGl0ZWN0dXJlcy4uCj4gPiA+IOKA
ouKAouKAouKAouKAouKAouKAouKAouKAouKAouKAouKAogo+ID4KPiA+IEkgZGlkIHJlYWxpemUg
YWZ0ZXJ3YXJkIHRoYXQgcHJlZmV0Y2h3IGdldHMgdGhlIGNhY2hlbGluZSBpbiBleGNsdXNpdmUK
PiA+IHN0YXRlLiBJIHdpbGwgc3VnZ2VzdCB5b3UgbWVudGlvbiB0aGF0IGluIHlvdXIgY29tbWl0
IGxvZyBhcyB3ZWxsIGFzCj4gPiBhZGRpbmcgYSBjb21tZW50IGFib3V0IGl0cyBwdXJwb3NlIGlu
IHRoZSBjb2RlLgo+IE9rYXksIEkgd291bGQgZG8gdGhhdCBpbiB2MTIsIHRoeC4KCkkgd291bGQg
c3VnZ2VzdCBhZGRpbmcgYSBzbmlwcGV0IGZyb20gdGhlIElTQSBFeHRlbnN0aW9uIGRvYzoKCiJB
IHByZWZldGNoLncgaW5zdHJ1Y3Rpb24gaW5kaWNhdGVzIHRvIGhhcmR3YXJlIHRoYXQgdGhlIGNh
Y2hlIGJsb2NrIHdob3NlIAplZmZlY3RpdmUgYWRkcmVzcyBpcyB0aGUgc3VtIG9mIHRoZSBiYXNl
IGFkZHJlc3Mgc3BlY2lmaWVkIGluIHJzMSBhbmQgdGhlICAKc2lnbi1leHRlbmRlZCBvZmZzZXQg
ZW5jb2RlZCBpbiBpbW1bMTE6MF0sIHdoZXJlIGltbVs0OjBdIGVxdWFscyAwYjAwMDAwLCAKaXMg
bGlrZWx5IHRvIGJlIGFjY2Vzc2VkIGJ5IGEgZGF0YSB3cml0ZSAoaS5lLiBzdG9yZSkgaW4gdGhl
IG5lYXIgZnV0dXJlLiIKCk90aGVyIHRoYW4gdGhhdCwKUmV2aWV3ZWQtYnk6IExlb25hcmRvIEJy
YXMgPGxlb2JyYXNAcmVkaGF0LmNvbT4KCgo+IAo+ID4KPiA+IFRoYW5rcywKPiA+IExvbmdtYW4K
PiA+Cj4gPiA+PiBDaGVlcnMsCj4gPiA+PiBMb25nbWFuCj4gPiA+Pgo+ID4gPgo+ID4KPiAKPiAK
PiAtLSAKPiBCZXN0IFJlZ2FyZHMKPiAgR3VvIFJlbgo+IAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
