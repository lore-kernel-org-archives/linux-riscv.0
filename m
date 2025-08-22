Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7409CA0FE1
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uu9SXiSk3qDm9ctePnAybvZliF4Xz7W1GPtriAIDuXk=; b=B/p8RNELJ9Za9n
	Q2RF87LnBmG6Wr14AuHyz4IrUPRtl4m0ZmDq1U3Em5fCH2S/JfxYzAGUFydUmKEhOwCo+zvUT49tS
	Gh25m+2n8rRteEgfnxIu+67F2JcQbM8Dat5yP3VAJMhreJdyi5n42noG1aY9QS7YdjyfcDzY2Dwk/
	26d50bxZQc/Q0CpEksqJR2se8sS5ztC16muCANILJB4KgtB0OY5hoxUQUkp76Ng8oD/BfkYgNJToM
	I/vB5gTKRGuNVgVBsK6jXc5OaEQfHq17oBft1E73o++Xn8AqR2rJY9uFkSzP33ZDRmnXmxFSAEPSQ
	VQ1ZudQSfjXQDzn9yHZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphx0-00000004E8n-3j0p;
	Sat, 23 Aug 2025 06:42:06 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upW1w-00000003HAn-38xW
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 17:58:25 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-89018e97232so792271241.0
        for <linux-riscv@lists.infradead.org>; Fri, 22 Aug 2025 10:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1755885503; x=1756490303; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QctlWqJYLmIg/E5LPhpjhg17ib5pNjMH7p/Hx4zus4I=;
        b=XPijDyRxjjB47f4SBMCaDL1bLzLH9hFhD9vmjIO3+mKT5wXO+676V6FvP9UDvuxzpb
         07j2pbVwz9ePrTE+ZepEHOLhNkj3p5u98U7v9DR4+/L8/mTABtGxEi6YSxLykHfp/4am
         6BzpMPTwzytoYtxF2ELj8yUM12rZYtViSrixJPcO4w4E7QTf22wBSy6TXc5qO5PS/1iG
         CC7cn8q+HqxM2Rd5vR6aYgIFqsG8LkQNPKLXv/FlZzK6QaW5yBgJxrNuKAoUGr+YZIqJ
         Y9jvLH/VLlGkjcQS78lGDpKdCHzux0mgbZqoizsPKDRFDeC6T5xhHqooZTojRZ87JiD2
         vqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755885503; x=1756490303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QctlWqJYLmIg/E5LPhpjhg17ib5pNjMH7p/Hx4zus4I=;
        b=ia0kEVRCMljTYXppn+uOEyDIEiOSu4gtpYO67PPBemv1hJ2StneEEFi6XzOp9MTClN
         +A5fWw2p22OkpUPkaCih+DTeCkr6JM/kyw9564dTK6uz9tJLQzCqI+mrvgyB5T++6DSh
         y5FozPtymIa658+8MAdknAvMcX8wleEE93T1kQezTxbms6pNVvfNuZXifMws9ElNZfsO
         Nq6Y8Zhyf2wR7bz5Cj/t2+TonapBTazu7QYHCjwEUlxodo2UaSVutq1AfxVmCoIfXwsn
         i5RZ/f9iQPhdCnMkiDDmRxXNdnj22LS8ZIRTrPXk5juURWcicvzAJHQPMMx14u+aWkAm
         7vkQ==
X-Gm-Message-State: AOJu0YxvaGNJkdPGdRCA0Iod2bPHUP+pjur9oj1QXzHdybGatsnPt5nL
	P8JN1w4tQhiTLi45OkKbwekzhH0WSUtC6S8poMpVZeaWl749RXRMQB5jyx318LOAeY+9GYQ18kq
	entWkhNEKkjNxgL8X1IRSh45+PfoKAri+GMRox0zm7Q==
X-Gm-Gg: ASbGnctz0Yf6kbUmw3pPIPhRg5ggyj+SIUUAhILAHQCKDIRoBC6bhYIpp3AlvHDDEAB
	IGf+Dntvoo0UR8715BZmcPGjLP0dZK2DihKOdHvG7ZWvGddmtzpcODdobkF3L0VxgbYWR+tJZy5
	QHgsKo/hzauQRt6t44thhLKXipvBCd/8AQdu0ts1jGT8vVYZ+Tly9XNuHFqadLdqQ0NDYH6qtnA
	d6/5Jy5
X-Google-Smtp-Source: AGHT+IFN//tAIOu8+R+uuhM96f7zV3pePtaUS87r3F/6litKfGF0/DndAdWIWiwCZ7w8YwN9/a0uzZqZes7ebIu5qsc=
X-Received: by 2002:a05:6102:579b:b0:4fc:f151:a644 with SMTP id
 ada2fe7eead31-51d0f1e3aebmr1186332137.27.1755885503401; Fri, 22 Aug 2025
 10:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250805193955.798277-1-jesse@rivosinc.com> <20250805193955.798277-9-jesse@rivosinc.com>
 <CACPK8Xd2QfL460LY2T0ia7Akb79fEXKF2+=B27M8q5j7jUoouQ@mail.gmail.com>
In-Reply-To: <CACPK8Xd2QfL460LY2T0ia7Akb79fEXKF2+=B27M8q5j7jUoouQ@mail.gmail.com>
From: Jesse Taube <jesse@rivosinc.com>
Date: Fri, 22 Aug 2025 10:58:12 -0700
X-Gm-Features: Ac12FXyOxEp8jMlrarfb8y3cqhZyCnGwLGrfNnesQRaBf_dB1MguAeHwG0yw4Oc
Message-ID: <CALSpo=bM8S2cKHRQ1Zn1ViDh9QfoKkWGVVeW50D1UQkXP_6rug@mail.gmail.com>
Subject: Re: [PATCH 8/8] selftests: riscv: Add test for hardware breakpoints
To: Joel Stanley <joel@jms.id.au>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_105824_788168_76421ECA 
X-CRM114-Status: GOOD (  24.72  )
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

T24gVGh1LCBBdWcgMTQsIDIwMjUgYXQgMTA6NDLigK9QTSBKb2VsIFN0YW5sZXkgPGpvZWxAam1z
LmlkLmF1PiB3cm90ZToKPgo+IEhpIEplc3NlLAo+Cj4gV2UgaGFkIGEgcHJldHR5IGh1Z2UgY2Mg
bGlzdCBvbiB0aGUgdGhyZWFkLCBJJ3ZlIHRyaW1tZWQgaXQgcmlnaHQKPiBiYWNrLiBGZWVsIGZy
ZWUgdG8gYWRkIHNvbWUgcGVvcGxlIGJhY2sgYnV0IGtlZXAgaXQgZm9jdXNlZC4KPgo+IE9uIFdl
ZCwgNiBBdWcgMjAyNSBhdCAwNTo0MiwgSmVzc2UgVGF1YmUgPGplc3NlQHJpdm9zaW5jLmNvbT4g
d3JvdGU6Cj4gPgo+ID4gQWRkIHJpc2N2IHNwZWNpZmljIHNlbGZ0ZXN0IGZvciBoYXJkaGFyZHdh
cmUgYnJlYWtwb2ludHMuCj4KPiBuaXQ6IGRvdWJsZSBoYXJkd2FyZQo+Cj4gPiBUaGVzZSB0ZXN0
cyBhcmUgYmFzZWQgb246Cj4gPiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icmVha3BvaW50cy9i
cmVha3BvaW50X3Rlc3RfYXJtNjQuYwo+Cj4gVGhlIHNlZmx0ZXN0IGRpZG4ndCBidWlsZCBmb3Ig
bWUuIFRoZXJlJ3MgYSBmZXcgc3VnZ2VzdGVkIGZpeGVzIGJlbG93Lgo+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBKZXNzZSBUYXViZSA8amVzc2VAcml2b3NpbmMuY29tPgo+ID4gLS0tCj4gPiBUaGUgc2Vs
ZnRlc3QgZmFpbHMgYXMgcmVnaXN0ZXJfdXNlcl9od19icmVha3BvaW50IHNlZW1pbmdseSBkb2Vz
IG5vdAo+ID4gY2FsbCBhcmNoX2luc3RhbGxfaHdfYnJlYWtwb2ludC4gVGhlIHRlc3QgYWxzbyBz
ZWVtcyB0byBmYWlsIG9uIGFybTY0Cj4gPiBpbiB0aGUgc2FtZSB3YXkgd2hlbiBJIHRlc3RlZCBp
dC4KPgo+IElzIHRoaXMgc3RpbGwgYSBwcm9ibGVtIHdpdGggeW91ciBwYXRjaHNldD8KClllcwoK
Pgo+IERvIHlvdSB0ZXN0IGluIHFlbXU/IENhbiB5b3Ugc2hhcmUgeW91ciB2ZXJzaW9uLCBjb21t
YW5kIGxpbmUsIGV0Yz8KClllcy4gSSB1c2VkIGJ1aWxkcm9vdCdzIGBxZW11X2FhcmNoNjRfdmly
dF9kZWZjb25maWdgIGNvbmZpZyBhbmQgc2V0CmBCUjJfUEFDS0FHRV9MSU5VWF9UT09MU19TRUxG
VEVTVFNgIGFuZCB0ZXN0ZWQgd2l0aCB0aGUgZXhhbXBsZQpjb21tYW5kIGZyb20gdGhlIGJvYXJk
cyByZWFkbWUuCgo+Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9yaXNjdi9icmVha3BvaW50cy9NYWtlZmlsZQo+ID4gQEAgLTAsMCArMSwxMiBAQAo+
ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiA+ICsjIENvcHlyaWdodCAo
QykgMjAyMSBBUk0gTGltaXRlZAo+ID4gKyMgT3JpZ2luYWxseSB0b29scy90ZXN0aW5nL2FybTY0
L2FiaS9NYWtlZmlsZQo+Cj4gQ0ZMQUdTICs9ICQoS0hEUl9JTkNMVURFUykKPgo+IFRoaXMgYWRk
cyAtaXN5c3RlbSB0byBpbmNsdWRlIGxvY2FsIGhlYWRlcnMgZm9yIHRoZSB1cCB0byBkYXRlCj4g
cHRyYWNlLmggYW5kIGVsZi5oIGRlZmluaXRpb25zLgo+Cj4gICQgbWFrZSBoZWFkZXJzCgpvaCB0
aGF0J3Mgd2h5IGl0IHdhc24ndCBidWlsZGluZyEKClRoYW5rcywKSmVzc2UgVGF1YmUKPiAgJCBt
YWtlIC1DIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzIENST1NTX0NPTVBJTEU9cmlzY3Y2NC1saW51
eC1nbnUtCj4gQVJDSD1yaXNjdiBUQVJHRVRTPXJpc2N2L2JyZWFrcG9pbnRzCj4gICAgICBtYWtl
OiBFbnRlcmluZyBkaXJlY3RvcnkgJ3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzJwo+ICAgICAgcmlz
Y3Y2NC1saW51eC1nbnUtZ2NjIC1zdGF0aWMKPiAtb3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jp
c2N2L2JyZWFrcG9pbnRzL2JyZWFrcG9pbnRfdGVzdAo+ICAgICAgLWlzeXN0ZW0gdXNyL2luY2x1
ZGUgLUl0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy8uLi8uLi8uLi90b29scy9pbmNsdWRlCj4gICAg
ICAtRF9HTlVfU09VUkNFPSAgIGJyZWFrcG9pbnRfdGVzdC5jCj4KPiA+ICsKPiA+ICtDRkxBR1Mg
Kz0gLUkkKHRvcF9zcmNkaXIpL3Rvb2xzL2luY2x1ZGUKPiA+ICsKPiA+ICtURVNUX0dFTl9QUk9H
UyA6PSBicmVha3BvaW50X3Rlc3QKPiA+ICsKPiA+ICtpbmNsdWRlIC4uLy4uL2xpYi5tawo+ID4g
Kwo+ID4gKyQoT1VUUFVUKS9icmVha3BvaW50X3Rlc3Q6IGJyZWFrcG9pbnRfdGVzdC5jCj4gPiAr
ICAgICAgICQoQ0MpIC1zdGF0aWMgLW8kQCAkKENGTEFHUykgJChMREZMQUdTKSAkXgo+ID4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2JyZWFrcG9pbnRzL2JyZWFr
cG9pbnRfdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvYnJlYWtwb2ludHMv
YnJlYWtwb2ludF90ZXN0LmMKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAw
MDAwMDAwMDAuLmZhZWVjYzcyZGExMgo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvYnJlYWtwb2ludHMvYnJlYWtwb2ludF90ZXN0LmMKPiA+
IEBAIC0wLDAgKzEsMjQ2IEBACj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjAtb25seQo+ID4gKy8qCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDE2IEdvb2dsZSwgSW5jLgo+
ID4gKyAqCj4gPiArICogT3JpZ2luYWwgQ29kZSBieSBQYXZlbCBMYWJhdGggPGxhYmF0aEBnb29n
bGUuY29tPgo+ID4gKyAqCj4gPiArICogQ29kZSBtb2RpZmllZCBieSBQcmF0eXVzaCBBbmFuZCA8
cGFuYW5kQHJlZGhhdC5jb20+Cj4gPiArICogZm9yIHRlc3RpbmcgZGlmZmVyZW50IGJ5dGUgc2Vs
ZWN0IGZvciBlYWNoIGFjY2VzcyBzaXplLgo+ID4gKyAqIE9yaWdpbmFsbHkgdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvYnJlYWtwb2ludHMvYnJlYWtwb2ludF90ZXN0X2FybTY0LmMKPiA+ICsgKi8K
PiA+ICsKPiA+ICsjZGVmaW5lIF9HTlVfU09VUkNFCj4gPiArCj4gPiArI2luY2x1ZGUgPGFzbS9w
dHJhY2UuaD4KPiA+ICsjaW5jbHVkZSA8c3lzL3R5cGVzLmg+Cj4gPiArI2luY2x1ZGUgPHN5cy93
YWl0Lmg+Cj4gPiArI2luY2x1ZGUgPHN5cy9wdHJhY2UuaD4KPiA+ICsjaW5jbHVkZSA8c3lzL3Bh
cmFtLmg+Cj4gPiArI2luY2x1ZGUgPHN5cy91aW8uaD4KPiA+ICsjaW5jbHVkZSA8c3RkaW50Lmg+
Cj4gPiArI2luY2x1ZGUgPHN0ZGJvb2wuaD4KPiA+ICsjaW5jbHVkZSA8c3RkZGVmLmg+Cj4gPiAr
I2luY2x1ZGUgPHN0cmluZy5oPgo+ID4gKyNpbmNsdWRlIDxzdGRpby5oPgo+ID4gKyNpbmNsdWRl
IDx1bmlzdGQuaD4KPiA+ICsjaW5jbHVkZSA8ZWxmLmg+Cj4KPiBUaGlzIGlzIHRoZSB3cm9uZyBl
bGYuaCwgd2Ugd2FudCB0aGUgb25lIHdpdGggTlRfUklTQ1ZfSFdfQlJFQUsuCj4KPiAtI2luY2x1
ZGUgPGVsZi5oPgo+ICsjaW5jbHVkZSA8bGludXgvZWxmLmg+Cj4KPgo+ID4gKyNpbmNsdWRlIDxl
cnJuby5oPgo+ID4gKyNpbmNsdWRlIDxzaWduYWwuaD4KPiA+ICsKPiA+ICsjaW5jbHVkZSAiLi4v
Li4va3NlbGZ0ZXN0LmgiCj4gPiArCj4gPiArI2RlZmluZSBNQVhfQlBfU0laRSA4Cj4gPiArCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
