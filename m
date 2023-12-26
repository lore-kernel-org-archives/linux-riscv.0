Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F151FC46CD3
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Dec 2023 19:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BunPe480bhkOI3gwDwTjHSTJPisBs4Xtnb3SJA89ecI=; b=SfopgboqAXTUhK
	lyw1vee79JXE0vEZ9m21wH72ImY/nFki53BK0cgsPFV94AEdX8l1UmEVggH1YPdPA7wcq7V4CPK62
	7R4HqHXOXSFWjjnNOSTJXGkiIC92pmosFPBGbXnDvC5oz5jOQ1xJZmwH+SbuKV//Xt9LNbnRm8/q+
	o2rGKOXKv0kmJvj/J220TnYot8uH5BCqd1gYFAMZl6cBmBQ/6ELy5scDbKWB6d6MSLQs8V91odpn5
	RZT2wckc2sbeGvUnVIfBQw6hfqPiUDZi2dQN9qzacI7vhWfKiYyk2fVFztpj7xs3z0yU9nFGSAF7I
	Hf5fzheMXbT284x7MRaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rID3B-00DR2n-1O;
	Tue, 26 Dec 2023 19:25:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rID38-00DR1K-27
	for linux-riscv@lists.infradead.org;
	Tue, 26 Dec 2023 19:25:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703618709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2iXTdOONRHny7xEnEy9yWubjQEcQu4RJR3ICJLroNr8=;
	b=D/mobnnksQabxvz4SfP92dBqeVZWdDRhCv/PBYygMmPhARlYENlOYQChewHlKP+ycOA5aL
	+nJyRnKWoRaVe5jxlpj9Zf97dvaWiRYH7XKGbMl136ScQzEiBIyAwpLhUIgwSReoPivJxh
	C+Z04IwLsz8ovoqgdbneh9o5mZOOMYs=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-0cwzQDi_M3GdOyrpwxHTRA-1; Tue, 26 Dec 2023 14:25:07 -0500
X-MC-Unique: 0cwzQDi_M3GdOyrpwxHTRA-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-42784a3e560so96662491cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Dec 2023 11:25:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703618707; x=1704223507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2iXTdOONRHny7xEnEy9yWubjQEcQu4RJR3ICJLroNr8=;
        b=g5PDrWA0RobbIEeGQXTsFmTosQkDp/dJYwR0F3V2TXzcMBkHrxsClvTcUzXsnqLJFv
         0LyoBIVkmUEKC0+iqj8OyS7H0TZwJmnkm+2CQi+jhdP9WE7YpDlTbYimQepnOD8hvxEq
         y9sCVfYWa0kGCGbB/q1Ed2ZUbhIi993s36jGYBp9P5fFNwM9XZ6eUUfah9ExZQ3EPcZT
         Eq5sIpN2TeY+wXsZwCnJMdEhN8SWTZLHhZF5rK25Eall1GB8qX0c6Bs1R6OhZs5wN9It
         S8sby8zE0o3JiKX3aDREJ7phkcXvnbr+pDlsDqh8Jg+h+73Px+PcXHxJNlHr58sjL1DH
         fsqA==
X-Gm-Message-State: AOJu0YxSYvr2KPvzoR5nHLwcl36spOTi3JuxmbEpz6sPzNI0kAv1tyxb
	Co+kL1/fFiNvX/6MMLoNX9i8XlWwBGare4gaPtmSmbmr7DJT8UZBqji0+KEcGMPftZJTHJbObIo
	9If5AJTr38zZrq0ePBBtmORJHZ1AYEzwgxAAMaolJFbetnPw55koe
X-Received: by 2002:a05:622a:1015:b0:427:eae2:f02c with SMTP id d21-20020a05622a101500b00427eae2f02cmr263507qte.30.1703618706899;
        Tue, 26 Dec 2023 11:25:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnYA9PuTSPIQqJOWrMDj5PvnvtnxyVWGv1QzJxODCgLC8yTN1kgrGSrr2zGyVRhecB5rgBINIyT1bULYoxvTk=
X-Received: by 2002:a05:622a:1015:b0:427:eae2:f02c with SMTP id
 d21-20020a05622a101500b00427eae2f02cmr263487qte.30.1703618706670; Tue, 26 Dec
 2023 11:25:06 -0800 (PST)
MIME-Version: 1.0
References: <20231222074605.452452-1-leobras@redhat.com> <20231222074605.452452-4-leobras@redhat.com>
 <CABgGipXLe7MxP076CJ=BLAaChAQug5X7qkNxxm9eEnyy92nEJQ@mail.gmail.com>
In-Reply-To: <CABgGipXLe7MxP076CJ=BLAaChAQug5X7qkNxxm9eEnyy92nEJQ@mail.gmail.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Tue, 26 Dec 2023 16:24:55 -0300
Message-ID: <CAJ6HWG4Pe0co91-tRpV-gKoVUJkobB=uz8J-pjTvyX=Ed49u_w@mail.gmail.com>
Subject: Re: [RFC PATCH 3/4] riscv: Introduce is_compat_thread() into compat.h
To: Andy Chiu <andy.chiu@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Eric Biederman <ebiederm@xmission.com>, 
	Kees Cook <keescook@chromium.org>, Oleg Nesterov <oleg@redhat.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Greg Ungerer <gerg@kernel.org>, 
	Vincent Chen <vincent.chen@sifive.com>, Xiao Wang <xiao.w.wang@intel.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	David Hildenbrand <david@redhat.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Qinglin Pan <panqinglin2020@iscas.ac.cn>, Greentime Hu <greentime.hu@sifive.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231226_112510_768253_1F2C60EC 
X-CRM114-Status: GOOD (  25.95  )
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

T24gU2F0LCBEZWMgMjMsIDIwMjMgYXQgMToyNuKAr0FNIEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNp
Zml2ZS5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMzo0NuKAr1BNIExl
b25hcmRvIEJyYXMgPGxlb2JyYXNAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gdGFza191c2Vy
X3JlZ3NldF92aWV3KCkgbWFrZXMgdXNlIG9mIGEgZnVuY3Rpb24gdmVyeSBzaW1pbGFyIHRvCj4g
PiBpc19jb21wYXRfdGFzaygpLCBidXQgcG9pbnRpbmcgdG8gYSBhbnkgdGhyZWFkLgo+ID4KPiA+
IEluIGFybTY0IGFzbS9jb21wYXQuaCB0aGVyZSBpcyBhIGZ1bmN0aW9uIHZlcnkgc2ltaWxhciB0
byB0aGF0Ogo+ID4gaXNfY29tcGF0X3RocmVhZChzdHJ1Y3QgdGhyZWFkX2luZm8gKnRocmVhZCkK
PiA+Cj4gPiBDb3B5IHRoaXMgZnVuY3Rpb24gdG8gcmlzY3YgYXNtL2NvbXBhdC5oIGFuZCBtYWtl
IHVzZSBvZiBpdCBpbnRvCj4gPiB0YXNrX3VzZXJfcmVnc2V0X3ZpZXcoKS4KPiA+Cj4gPiBBbHNv
LCBpbnRyb2R1Y2UgYSBjb21waWxlLXRpbWUgdGVzdCBmb3IgQ09ORklHX0NPTVBBVCBhbmQgc2lt
cGxpZnkgdGhlCj4gPiBmdW5jdGlvbiBjb2RlIGJ5IHJlbW92aW5nIHRoZSAjaWZkZWYuCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogTGVvbmFyZG8gQnJhcyA8bGVvYnJhc0ByZWRoYXQuY29tPgo+ID4g
LS0tCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jb21wYXQuaCB8IDggKysrKysrKysKPiA+
ICBhcmNoL3Jpc2N2L2tlcm5lbC9wdHJhY2UuYyAgICAgIHwgNiArKystLS0KPiA+ICAyIGZpbGVz
IGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY29tcGF0LmggYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2NvbXBhdC5oCj4gPiBpbmRleCA5MTUxN2I1MWI4ZTI3Li5kYTRiMjhjZDAxYTk1IDEw
MDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jb21wYXQuaAo+ID4gKysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jb21wYXQuaAo+ID4gQEAgLTIwLDYgKzIwLDE0IEBAIHN0
YXRpYyBpbmxpbmUgaW50IGlzX2NvbXBhdF90YXNrKHZvaWQpCj4gPiAgICAgICAgIHJldHVybiB0
ZXN0X3RocmVhZF9mbGFnKFRJRl8zMkJJVCk7Cj4gPiAgfQo+ID4KPiA+ICtzdGF0aWMgaW5saW5l
IGludCBpc19jb21wYXRfdGhyZWFkKHN0cnVjdCB0aHJlYWRfaW5mbyAqdGhyZWFkKQo+ID4gK3sK
PiA+ICsgICAgICAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19DT01QQVQpKQo+ID4gKyAgICAgICAg
ICAgICAgIHJldHVybiAwOwo+ID4gKwo+ID4gKyAgICAgICByZXR1cm4gdGVzdF90aV90aHJlYWRf
ZmxhZyh0aHJlYWQsIFRJRl8zMkJJVCk7Cj4gPiArfQo+ID4gKwo+Cj4gRG9lcyBpdCBtYWtlIHNl
bnNlIHRvIHVzZSBhICNpZmRlZiBDT05GSUdfQ09NUEFUIGNsYXVzZSB0byBncm91cAo+IGlzX2Nv
bXBhdF90aHJlYWQoKSBhbmQgaXNfY29tcGF0X2ZsYWcoKT8gRm9yIGV4YW1wbGUsCgpIZWxsbyBB
bmR5LAoKU3VyZSwgaXQgZG9lcyBtYWtlIHNlbnNlLgoKQnV0IEkgaG9uZXN0bHkgdGhpbmsgdGhh
dCB1c2luZyBJU19FTkFCTEVEKCkgaW5zdGVhZCBvZiAjaWZkZWYgKwptdWx0aXBsZSBzYW1lLW5h
bWVkIGZ1bmN0aW9ucyB3b3JrcyBiZXR0ZXIgZm9yIGNvZGUgcmVhZGluZywgYXQgbGVhc3QKZm9y
IHNtYWxsIGZ1bmN0aW9ucyBzdWNoIGFzIHRoZXNlLgoKRG9lcyB0aGlzIG1ha2Ugc2Vuc2U/CgpU
aGFua3MgZm9yIHJldmlld2luZyEKTGVvCgoKPgo+ICNpZmRlZiBDT05GSUdfQ09NUEFUCj4gc3Rh
dGljIGlubGluZSBpbnQgaXNfY29tcGF0X3RocmVhZChzdHJ1Y3QgdGhyZWFkX2luZm8gKnRocmVh
ZCkKPiB7Cj4gIHJldHVybiB0ZXN0X3RpX3RocmVhZF9mbGFnKHRocmVhZCwgVElGXzMyQklUKTsK
PiB9Cj4gc3RhdGljIGlubGluZSBpbnQgaXNfY29tcGF0X3Rhc2sodm9pZCkKPiB7Cj4gIHJldHVy
biBpc19jb21wYXRfdGhyZWFkKGN1cnJlbnQpOwo+IH0KPiAjZWxzZQo+IHN0YXRpYyBpbmxpbmUg
aW50IGlzX2NvbXBhdF90aHJlYWQoc3RydWN0IHRocmVhZF9pbmZvICp0aHJlYWQpIHsgcmV0dXJu
IDA7IH0KPiBzdGF0aWMgaW5saW5lIGludCBpc19jb21wYXRfdGFzayh2b2lkKSB7IHJldHVybiAw
OyB9Cj4gI2VuZGlmCj4KPiA+ICBzdHJ1Y3QgY29tcGF0X3VzZXJfcmVnc19zdHJ1Y3Qgewo+ID4g
ICAgICAgICBjb21wYXRfdWxvbmdfdCBwYzsKPiA+ICAgICAgICAgY29tcGF0X3Vsb25nX3QgcmE7
Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHRyYWNlLmMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9wdHJhY2UuYwo+ID4gaW5kZXggMmFmZTQ2MGRlMTZhNi4uZjM2MjgzMjEyMzYxNiAx
MDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jCj4gPiArKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9wdHJhY2UuYwo+ID4gQEAgLTM3NCwxNCArMzc0LDE0IEBAIGxvbmcgY29t
cGF0X2FyY2hfcHRyYWNlKHN0cnVjdCB0YXNrX3N0cnVjdCAqY2hpbGQsIGNvbXBhdF9sb25nX3Qg
cmVxdWVzdCwKPiA+Cj4gPiAgICAgICAgIHJldHVybiByZXQ7Cj4gPiAgfQo+ID4gKyNlbHNlCj4g
PiArc3RhdGljIGNvbnN0IHN0cnVjdCB1c2VyX3JlZ3NldF92aWV3IGNvbXBhdF9yaXNjdl91c2Vy
X25hdGl2ZV92aWV3ID0ge307Cj4gPiAgI2VuZGlmIC8qIENPTkZJR19DT01QQVQgKi8KPiA+Cj4g
PiAgY29uc3Qgc3RydWN0IHVzZXJfcmVnc2V0X3ZpZXcgKnRhc2tfdXNlcl9yZWdzZXRfdmlldyhz
dHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2spCj4gPiAgewo+ID4gLSNpZmRlZiBDT05GSUdfQ09NUEFU
Cj4gPiAtICAgICAgIGlmICh0ZXN0X3Rza190aHJlYWRfZmxhZyh0YXNrLCBUSUZfMzJCSVQpKQo+
ID4gKyAgICAgICBpZiAoaXNfY29tcGF0X3RocmVhZCgmdGFzay0+dGhyZWFkX2luZm8pKQo+ID4g
ICAgICAgICAgICAgICAgIHJldHVybiAmY29tcGF0X3Jpc2N2X3VzZXJfbmF0aXZlX3ZpZXc7Cj4g
PiAgICAgICAgIGVsc2UKPiA+IC0jZW5kaWYKPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gJnJp
c2N2X3VzZXJfbmF0aXZlX3ZpZXc7Cj4gPiAgfQo+ID4gLS0KPiA+IDIuNDMuMAo+ID4KPgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
