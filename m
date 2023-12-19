Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3709CC41535
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 16:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JgTJk/yb/Ef9qtXwF6VaAyeGuxOANayk65ly3wMEnmQ=; b=ig/nmcjErbCtGz
	4iXNjSpAfcB+Q1PjpAtDZOOzhMd6QBjsxpsWokG+llzcI0KwuI8itFNc5TVySDhyMcYNONM7XKJ1U
	iCW8mBuvbTxbcLE2lA84LbzK2sDtRo2dsmfnCi16l6llgS1GRU1KoD9R/2glyMTB+5/ri6Ucb1jva
	eBhGqUZeZR6PIzItER2oL8eipWoGkaB6OY4lW5OgU930YFzj0VgkNFo0k3Z9iAD11YbSvXq+f2YOD
	Q0Rr0Pl8ozzHaelyj8/bPgSc9bXOWQY4vlNGyv8ucXNjT4uIGX/bh3OQtOHukyLpFL1zyh6periRf
	9enZtAQGA03rBoVJaKHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFcyQ-00Eh8x-0N;
	Tue, 19 Dec 2023 16:29:38 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFcyM-00Eh5s-00
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 16:29:36 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d3e4637853so81225ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 08:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703003371; x=1703608171; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mixo7iUxV6o/jYjn2ndFmri3aSLyepPelmkXRCU4Bdk=;
        b=Fij2iS1XkzqlwRYK1OxnAey2iU69HAP3w2xC1zv0VL/JSr9FF8TsaJ2Iw5vKBtYJFR
         ZM9eKHvtxdfEAm4hw8KNJhdrKXSFztSJLp8uhrDqmjmwOwOjT2y03nQWIU1GyRIQk+ar
         vvS3w1OVaBgQblqbazAlZTaD9xoW9q8HQJ/uclJvYwae+eiwXs8RfHQXZKCZnPw5rndE
         H3ktwEuFPszJOoJqezPm5Sjgpb3rTQ315qxc0U91YAk+a9wqGFwI7GGKDl7E3x36FHx8
         +yLb5/+UD3qD/pKsyJdgg7HdttxMclLszXGJjErZKKiM7dgzZbFUjiIQ4FcMzsrFP+xB
         ztnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703003371; x=1703608171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mixo7iUxV6o/jYjn2ndFmri3aSLyepPelmkXRCU4Bdk=;
        b=mQh5sHKf2nx/82DvbaOLHWxjo6YC+3CC1V0dYv1QkjPBmQMkZqwMI+UqTtsJZPxYoU
         vVwRN/K5ZhDvKbAUB5ze87nIUQ05B/G0F8BVg92KwP7g0OQpnXCUXwQyR5mLp4psB4bJ
         S9StP922/uqFTpJ0wajVQQYN2vremWYx71YJZNCUB+Mexc7mcTCS6Bgj4LW+KTtLZy5E
         Xp6b8GV0YlvGEB8ypQnR7AZZrpgz0H3yqjNmJeFYhLG//OgqMXXRYG/IdM9Bouj3oUqX
         cQrkmImZPh9K0tVjSk1EcTg4fcedhYxnoqBreO28dgN65z49YQGkYjltMc+zXdRZ0Vuv
         1sOA==
X-Gm-Message-State: AOJu0YyZEX8n5KnZfSPfOoF3IL8M2oaoBgYUp0JnSw6sf5Q6XS7nDiD+
	9/EkEghdBokdX5e8VXMXtJgXljrt5gHX8yRlI1hmBFhD02eu
X-Google-Smtp-Source: AGHT+IHsUCKcb2E2CdUkTme7eOaB4IQH5pN/t3v8iJPHV1wyflbtqaQHKC/n6HfeqRwG5WgkpoxHQLlIZyM4Gm88XNg=
X-Received: by 2002:a17:902:e5cc:b0:1d3:7db1:388b with SMTP id
 u12-20020a170902e5cc00b001d37db1388bmr204446plf.11.1703003371391; Tue, 19 Dec
 2023 08:29:31 -0800 (PST)
MIME-Version: 1.0
References: <20231219075538.414708-1-peterx@redhat.com> <20231219075538.414708-10-peterx@redhat.com>
In-Reply-To: <20231219075538.414708-10-peterx@redhat.com>
From: James Houghton <jthoughton@google.com>
Date: Tue, 19 Dec 2023 11:28:54 -0500
Message-ID: <CADrL8HVu8=-DdAwXN_pO91g1A1+F7bKfBRpm6jYfYMk1QZcRFA@mail.gmail.com>
Subject: Re: [PATCH 09/13] mm/gup: Cache *pudp in follow_pud_mask()
To: peterx@redhat.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Matthew Wilcox <willy@infradead.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Lorenzo Stoakes <lstoakes@gmail.com>, David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Kravetz <mike.kravetz@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
	Christoph Hellwig <hch@infradead.org>, John Hubbard <jhubbard@nvidia.com>, 
	Andrew Jones <andrew.jones@linux.dev>, linux-arm-kernel@lists.infradead.org, 
	Michael Ellerman <mpe@ellerman.id.au>, "Kirill A . Shutemov" <kirill@shutemov.name>, linuxppc-dev@lists.ozlabs.org, 
	Rik van Riel <riel@surriel.com>, linux-riscv@lists.infradead.org, 
	Yang Shi <shy828301@gmail.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Andrea Arcangeli <aarcange@redhat.com>, Axel Rasmussen <axelrasmussen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_082934_036124_98204C36 
X-CRM114-Status: GOOD (  19.75  )
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

T24gVHVlLCBEZWMgMTksIDIwMjMgYXQgMjo1N+KAr0FNIDxwZXRlcnhAcmVkaGF0LmNvbT4gd3Jv
dGU6Cj4KPiBGcm9tOiBQZXRlciBYdSA8cGV0ZXJ4QHJlZGhhdC5jb20+Cj4KPiBJbnRyb2R1Y2Ug
InB1ZF90IHB1ZCIgaW4gdGhlIGZ1bmN0aW9uLCBzbyB0aGUgY29kZSB3b24ndCBkZXJlZmVyZW5j
ZSAqcHVkcAo+IG11bHRpcGxlIHRpbWUuICBOb3Qgb25seSBiZWNhdXNlIHRoYXQgbG9va3MgbGVz
cyBzdHJhaWdodGZvcndhcmQsIGJ1dCBhbHNvCj4gYmVjYXVzZSBpZiB0aGUgZGVyZWZlcmVuY2Ug
cmVhbGx5IGhhcHBlbmVkLCBpdCdzIG5vdCBjbGVhciB3aGV0aGVyIHRoZXJlCj4gY2FuIGJlIHJh
Y2UgdG8gc2VlIGRpZmZlcmVudCAqcHVkcCB2YWx1ZXMgaWYgaXQncyBiZWluZyBtb2RpZmllZCBh
dCB0aGUKPiBzYW1lIHRpbWUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBYdSA8cGV0ZXJ4QHJl
ZGhhdC5jb20+Cj4gLS0tCj4gIG1tL2d1cC5jIHwgMTcgKysrKysrKysrLS0tLS0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9tbS9ndXAuYyBiL21tL2d1cC5jCj4gaW5kZXggNmMwZDgyZmE4Y2M3Li45N2U4N2I3YTE1
YzMgMTAwNjQ0Cj4gLS0tIGEvbW0vZ3VwLmMKPiArKysgYi9tbS9ndXAuYwo+IEBAIC03NTMsMjYg
Kzc1MywyNyBAQCBzdGF0aWMgc3RydWN0IHBhZ2UgKmZvbGxvd19wdWRfbWFzayhzdHJ1Y3Qgdm1f
YXJlYV9zdHJ1Y3QgKnZtYSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBpbnQgZmxhZ3MsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RydWN0IGZvbGxvd19wYWdlX2NvbnRleHQgKmN0eCkKPiAgewo+IC0gICAgICAgcHVkX3QgKnB1
ZDsKPiArICAgICAgIHB1ZF90ICpwdWRwLCBwdWQ7Cj4gICAgICAgICBzcGlubG9ja190ICpwdGw7
Cj4gICAgICAgICBzdHJ1Y3QgcGFnZSAqcGFnZTsKPiAgICAgICAgIHN0cnVjdCBtbV9zdHJ1Y3Qg
Km1tID0gdm1hLT52bV9tbTsKPgo+IC0gICAgICAgcHVkID0gcHVkX29mZnNldChwNGRwLCBhZGRy
ZXNzKTsKPiAtICAgICAgIGlmIChwdWRfbm9uZSgqcHVkKSkKPiArICAgICAgIHB1ZHAgPSBwdWRf
b2Zmc2V0KHA0ZHAsIGFkZHJlc3MpOwo+ICsgICAgICAgcHVkID0gKnB1ZHA7CgpJIHRoaW5rIHlv
dSBtaWdodCB3YW50IGEgUkVBRF9PTkNFKCkgb24gdGhpcyBzbyB0aGF0IHRoZSBjb21waWxlcgpk
b2Vzbid0IGFjdHVhbGx5IHJlYWQgdGhlIHB1ZCBtdWx0aXBsZSB0aW1lcy4KCj4gKyAgICAgICBp
ZiAocHVkX25vbmUocHVkKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIG5vX3BhZ2VfdGFibGUo
dm1hLCBmbGFncywgYWRkcmVzcyk7Cj4gLSAgICAgICBpZiAocHVkX2Rldm1hcCgqcHVkKSkgewo+
IC0gICAgICAgICAgICAgICBwdGwgPSBwdWRfbG9jayhtbSwgcHVkKTsKPiAtICAgICAgICAgICAg
ICAgcGFnZSA9IGZvbGxvd19kZXZtYXBfcHVkKHZtYSwgYWRkcmVzcywgcHVkLCBmbGFncywgJmN0
eC0+cGdtYXApOwo+ICsgICAgICAgaWYgKHB1ZF9kZXZtYXAocHVkKSkgewo+ICsgICAgICAgICAg
ICAgICBwdGwgPSBwdWRfbG9jayhtbSwgcHVkcCk7Cj4gKyAgICAgICAgICAgICAgIHBhZ2UgPSBm
b2xsb3dfZGV2bWFwX3B1ZCh2bWEsIGFkZHJlc3MsIHB1ZHAsIGZsYWdzLCAmY3R4LT5wZ21hcCk7
Cj4gICAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrKHB0bCk7Cj4gICAgICAgICAgICAgICAgIGlm
IChwYWdlKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBwYWdlOwo+ICAgICAgICAg
ICAgICAgICByZXR1cm4gbm9fcGFnZV90YWJsZSh2bWEsIGZsYWdzLCBhZGRyZXNzKTsKPiAgICAg
ICAgIH0KPiAtICAgICAgIGlmICh1bmxpa2VseShwdWRfYmFkKCpwdWQpKSkKPiArICAgICAgIGlm
ICh1bmxpa2VseShwdWRfYmFkKHB1ZCkpKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gbm9fcGFn
ZV90YWJsZSh2bWEsIGZsYWdzLCBhZGRyZXNzKTsKCk5vdCB5b3VyIGNoYW5nZSwgYnV0IHJlYWRp
bmcgdGhpcywgaXQncyBub3QgY2xlYXIgdG8gbWUgdGhhdApgcHVkX3ByZXNlbnQoKnB1ZHApYCAo
YW5kIG5vbi1sZWFmKSB3b3VsZCBuZWNlc3NhcmlseSBiZSB0cnVlIGF0IHRoaXMKcG9pbnQgLS0g
bGlrZSwgSSB3b3VsZCBwcmVmZXIgdG8gc2VlIGAhcHVkX3ByZXNlbnQocHVkKWAgaW5zdGVhZCBv
ZgpgcHVkX2JhZCgpYC4gVGhhbmsgeW91IGZvciBhZGRpbmcgdGhhdCBpbiB0aGUgbmV4dCBwYXRj
aC4gOikKCkZlZWwgZnJlZSB0byBhZGQ6CgpBY2tlZC1ieTogSmFtZXMgSG91Z2h0b24gPGp0aG91
Z2h0b25AZ29vZ2xlLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
