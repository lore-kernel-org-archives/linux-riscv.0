Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DD4C4707C
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 14:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=X47KFDyu6SeP5U3IlDVoniElbuqRkybK6NW8qJz6YtY=; b=P3cSrRbEl0YKO2wRB1aZ8j+rRi
	lnsLucSd9FDQTxw8OtUOZi4mvvUqWTA46Lk3bMIQTKTZXa1Ev/NpQd/Z2Q4PcTPS/T/tk+p1wnMGX
	xBSIDOUTUY1pL5li9FLcif0/71dYk2RkHI57gWnj6bWFj4mH00MdLI/IjjtNY96+iidJEX9pWe1IJ
	ZW4aNdhQaaQWnikDn9c9GrWO5/bApEG10ka0ab7ntQsawRtUKOzSKs1l7mnemy/N675cxlkP1sb90
	4b7vbrBfDi1Rh4xfvtOEUVOaTfUCCbVWchATrIKgJcYkALjcNOAGUm4jWjf8LuwjVXOzz/rOeFRS/
	SyUPAAPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZwi-00CQ7M-0M;
	Wed, 10 Jan 2024 14:52:44 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZwf-00CQ3I-0E
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 14:52:42 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3608402ab93so17130085ab.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jan 2024 06:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1704898354; x=1705503154; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pVtS8rM9wqn1PqYUXWdr8pk/hBP2Hc85AVIVtCVRz8Y=;
        b=TJ7gDTHX5QOk978DJ0WORuIEUPtD9I0SCsDSWW2sBwTcOEvrRiGLne0NS8GZUrWa7e
         9dJvLyKnmwATol7Rg9QaAdl4bxjxv4DVHB4zv5xOLUhXp932bZDpIn6RVvX/Ia8ARwSY
         yU/7f15/LWqH3VzkvsEBoY8cTWVsWgXGJfZvtZNHZdB9fdJO41fgzNK7h+3QQG4BXvCH
         gYwK2HK+UZtXAgTCzYKNQqvB4PbXh6cio2rDWE3YBUaMe/Gu0/gna3XJKawRFdCaOSY9
         Qm9SlvzJ/8PuXMPk1LSm+3vj7mkF4OYiIUHsaDfPDLHy941EOW5C0pPWdu5N5AKn2/It
         jeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704898354; x=1705503154;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVtS8rM9wqn1PqYUXWdr8pk/hBP2Hc85AVIVtCVRz8Y=;
        b=PmBfn5oQnJDvlyLN26sZCY3TLpFI1KsBrDzjBkmJVlP2/R4EMqTpCzj0ho+Am7P2WQ
         c0oEXsctRerHqzNMdGVkBhkkwN5TwruFkPK5+zMX+8JKSV5TS+inE/mKcXt44JRntwBS
         aGV/NmtA95gtJVnZ9Gil9FipsRMWxkQYRsYRrpM8C3Vk8NHvm0l3Vumww4+26tin71ZV
         LQrekLgtuaOySWQDOWtB0GuVjw1X8ZorCjwR4jnDpmkE5TuVklbOJdrwDzCvcZ5NZ9si
         gp5+egCZeyGUbdSiJtol2e4GjtG0PQccbbeQ93MYVrbqipcKOrW0rc46Zc8hdmOLbFBI
         2unw==
X-Gm-Message-State: AOJu0YxZ0oaz8z887q4S1rnENnobgNdTvvlB2yK0zUF55Dm+sFp0xtup
	LMxivB0jtudbZ6czHCxveKGsBluH4ICRpQ==
X-Google-Smtp-Source: AGHT+IFvaD94WRGIWckQ9Hv3P7P0TvTdYRGacf1iIOKv8qIUaj9Zvtv4eSDrKd5J5ma8n/u1tTQeFQ==
X-Received: by 2002:a05:6e02:34a0:b0:360:90c2:f7ca with SMTP id bp32-20020a056e0234a000b0036090c2f7camr1673156ilb.40.1704898354434;
        Wed, 10 Jan 2024 06:52:34 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id bc25-20020a056e02009900b0035fabab7985sm1278883ilb.21.2024.01.10.06.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 06:52:33 -0800 (PST)
Date: Wed, 10 Jan 2024 06:52:33 -0800 (PST)
X-Google-Original-Date: Wed, 10 Jan 2024 06:52:32 PST (-0800)
Subject: Re: [PATCH 1/4] riscv: tlb: fix __p*d_free_tlb()
In-Reply-To: <36166acf-aa32-40b6-806a-ade59bc645ad@ghiti.fr>
CC: jszhang@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Will Deacon <will@kernel.org>, aneesh.kumar@linux.ibm.com,
  akpm@linux-foundation.org, npiggin@gmail.com, peterz@infradead.org,
  Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  linux-arch@vger.kernel.org, linux-mm@kvack.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-53f8ef0e-67ee-4a85-ba8a-84124df534ce@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_065241_121693_CE0DC0C2 
X-CRM114-Status: GOOD (  24.80  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAwNCBKYW4gMjAyNCAwMjo1NTo0MCBQU1QgKC0wODAwKSwgYWxleEBnaGl0aS5mciB3
cm90ZToKPiBPbiAxOS8xMi8yMDIzIDE4OjUwLCBKaXNoZW5nIFpoYW5nIHdyb3RlOgo+PiBJZiBu
b24tbGVhZiBQVEVzIEkuRSBwbWQsIHB1ZCBvciBwNGQgaXMgbW9kaWZpZWQsIGEgc2ZlbmNlLnZt
YSBpcwo+PiBhIG11c3QgZm9yIHNhZmUsIGltYWdpbmUgaWYgYW4gaW1wbGVtZW50YXRpb24gY2Fj
aGVzIHRoZSBub24tbGVhZgo+PiB0cmFuc2xhdGlvbiBpbiBUTEIsIGFsdGhvdWdoIEkgZGlkbid0
IG1lZXQgdGhpcyBIVyBzbyBmYXIsIGJ1dCBpdCdzCj4+IHBvc3NpYmxlIGluIHRoZW9yeS4KPgo+
Cj4gQW5kIHNpbmNlIHRoaXMgaXMgYSBmaXgsIGl0IHdvdWxkIGJlIHdvcnRoIHRyeWluZyB0byBh
ZGQgYSBGaXhlcyB0YWcKPiBoZXJlLiBOb3QgZWFzeSBJIGFncmVlIGJlY2F1c2UgaXQgZml4ZXMg
c2V2ZXJhbCBjb21taXRzIChJIGhhdmUKPiAwNzAzN2RiNWQ0NzlmLMKgIGU4YTYyY2MyNmRkZjUs
IGQxMGVmYTIxYTkzNzQgYW5kIGM1ZTliMmMyYWU4MjIgaWYgeW91Cj4gaW1wbGVtZW50IHRsYl9m
bHVzaCgpIGFzIEkgc3VnZ2VzdGVkKS4KPgo+IFNvIEkgd291bGQgYWRkIHRoZSBsYXRlc3QgY29t
bWl0IGFzIHRoZSBGaXhlcyBjb21taXQgKHdoaWNoIHdvdWxkIGJlCj4gYzVlOWIyYzJhZTgyMiks
IGFuZCB0aGVuIEknZCBzZW5kIGEgcGF0Y2ggdG8gc3RhYmxlIGZvciBlYWNoIGNvbW1pdCB3aXRo
Cj4gdGhlIHJpZ2h0IEZpeGVzIHRhZy4uLkBDb25vcjogbGV0IG1lIGtub3cgaWYgeW91IGhhdmUg
YSBzaW1wbGVyIGlkZWEgb3IKPiBpZiB0aGlzIGlzIHdyb25nLgoKSSBqdXN0IHdlbnQgd2l0aAoK
Rml4ZXM6IGM1ZTliMmMyYWU4MiAoInJpc2N2OiBJbXByb3ZlIHRsYl9mbHVzaCgpIikKQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcKCmhvcGVmdWxseSB0aGF0J3MgZmluZS4gIEl0J3Mgc3RpbGwg
Z2V0dGluZyB0ZXN0ZWQsIGl0J3MgYmF0Y2hlZCB1cCB3aXRoIApzb21lIG90aGVyIHN0dWZmIGFu
ZCBJIG1hbmFnZWQgdG8gZmluZCBhIGJhZCBtZXJnZSBzbyBpdCBtaWdodCB0YWtlIGEgCmJpdC4u
LgoKPgo+IFRoYW5rcywKPgo+IEFsZXgKPgo+Cj4+IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhh
bmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPj4gLS0tCj4+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wZ2FsbG9jLmggfCAyMCArKysrKysrKysrKysrKysrKy0tLQo+PiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9wZ2FsbG9jLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Bn
YWxsb2MuaAo+PiBpbmRleCBkMTY5YTRmNDFhMmUuLmExMmZiODNmYTFmNSAxMDA2NDQKPj4gLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ2FsbG9jLmgKPj4gKysrIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9wZ2FsbG9jLmgKPj4gQEAgLTk1LDcgKzk1LDEzIEBAIHN0YXRpYyBpbmxpbmUg
dm9pZCBwdWRfZnJlZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgcHVkX3QgKnB1ZCkKPj4gICAJCV9f
cHVkX2ZyZWUobW0sIHB1ZCk7Cj4+ICAgfQo+Pgo+PiAtI2RlZmluZSBfX3B1ZF9mcmVlX3RsYih0
bGIsIHB1ZCwgYWRkcikgIHB1ZF9mcmVlKCh0bGIpLT5tbSwgcHVkKQo+PiArI2RlZmluZSBfX3B1
ZF9mcmVlX3RsYih0bGIsIHB1ZCwgYWRkcikJCQkJCVwKPj4gK2RvIHsJCQkJCQkJCQlcCj4+ICsJ
aWYgKHBndGFibGVfbDRfZW5hYmxlZCkgewkJCQkJXAo+PiArCQlwYWdldGFibGVfcHVkX2R0b3Io
dmlydF90b19wdGRlc2MocHVkKSk7CQlcCj4+ICsJCXRsYl9yZW1vdmVfcGFnZV9wdGRlc2MoKHRs
YiksIHZpcnRfdG9fcHRkZXNjKHB1ZCkpOwlcCj4+ICsJfQkJCQkJCQkJXAo+PiArfSB3aGlsZSAo
MCkKPj4KPj4gICAjZGVmaW5lIHA0ZF9hbGxvY19vbmUgcDRkX2FsbG9jX29uZQo+PiAgIHN0YXRp
YyBpbmxpbmUgcDRkX3QgKnA0ZF9hbGxvY19vbmUoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2ln
bmVkIGxvbmcgYWRkcikKPj4gQEAgLTEyNCw3ICsxMzAsMTEgQEAgc3RhdGljIGlubGluZSB2b2lk
IHA0ZF9mcmVlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCBwNGRfdCAqcDRkKQo+PiAgIAkJX19wNGRf
ZnJlZShtbSwgcDRkKTsKPj4gICB9Cj4+Cj4+IC0jZGVmaW5lIF9fcDRkX2ZyZWVfdGxiKHRsYiwg
cDRkLCBhZGRyKSAgcDRkX2ZyZWUoKHRsYiktPm1tLCBwNGQpCj4+ICsjZGVmaW5lIF9fcDRkX2Zy
ZWVfdGxiKHRsYiwgcDRkLCBhZGRyKQkJCQkJXAo+PiArZG8gewkJCQkJCQkJCVwKPj4gKwlpZiAo
cGd0YWJsZV9sNV9lbmFibGVkKQkJCQkJCVwKPj4gKwkJdGxiX3JlbW92ZV9wYWdlX3B0ZGVzYygo
dGxiKSwgdmlydF90b19wdGRlc2MocDRkKSk7CVwKPj4gK30gd2hpbGUgKDApCj4+ICAgI2VuZGlm
IC8qIF9fUEFHRVRBQkxFX1BNRF9GT0xERUQgKi8KPj4KPj4gICBzdGF0aWMgaW5saW5lIHZvaWQg
c3luY19rZXJuZWxfbWFwcGluZ3MocGdkX3QgKnBnZCkKPj4gQEAgLTE0OSw3ICsxNTksMTEgQEAg
c3RhdGljIGlubGluZSBwZ2RfdCAqcGdkX2FsbG9jKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+Pgo+
PiAgICNpZm5kZWYgX19QQUdFVEFCTEVfUE1EX0ZPTERFRAo+Pgo+PiAtI2RlZmluZSBfX3BtZF9m
cmVlX3RsYih0bGIsIHBtZCwgYWRkcikgIHBtZF9mcmVlKCh0bGIpLT5tbSwgcG1kKQo+PiArI2Rl
ZmluZSBfX3BtZF9mcmVlX3RsYih0bGIsIHBtZCwgYWRkcikJCQkJXAo+PiArZG8gewkJCQkJCQkJ
XAo+PiArCXBhZ2V0YWJsZV9wbWRfZHRvcih2aXJ0X3RvX3B0ZGVzYyhwbWQpKTsJCVwKPj4gKwl0
bGJfcmVtb3ZlX3BhZ2VfcHRkZXNjKCh0bGIpLCB2aXJ0X3RvX3B0ZGVzYyhwbWQpKTsJXAo+PiAr
fSB3aGlsZSAoMCkKPj4KPj4gICAjZW5kaWYgLyogX19QQUdFVEFCTEVfUE1EX0ZPTERFRCAqLwo+
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
