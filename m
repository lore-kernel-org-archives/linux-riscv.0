Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856B8C6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 02:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r7lztq1Xe6M71nn3W61ZE6MVysZSqAvU8aTkrtCnf+U=; b=SUoMyfYyZ+2bDy
	O3b++2wU/Rlbej4unsXS//w8WPHEE78nlDO5J3UNKDEUoAghV/cK5nOf79U9wxWqZlxP7/yikuiiU
	GHCm8Q/37pc/LhtnR/wJbc7wrB7jr3zhmIgQN4JIjbKb5ey8JeN7QPxkb81jB9RKnB0AMnM2jRn5D
	bBbkHyeO9XiIhn7SambCxQGPjH0wk4gcK6MhIIMJMVdMyZzmJENFo9MfqWPSyAI5939frWBayqBRK
	uupIsQbSL/PShcz3Ze390pb91bUH5jln8bApJ1/ka08ej3ixDHLLfdcjJLpGY+P2xRn2pJEb7H7jc
	JQUVW5zF1Dalwo85/KnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbuJZ-008gxd-NP; Tue, 14 Mar 2023 02:23:01 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbuJW-008gwV-Bu
	for linux-riscv@lists.infradead.org; Tue, 14 Mar 2023 02:22:59 +0000
Received: by mail-lj1-x22f.google.com with SMTP id by8so14569784ljb.7
        for <linux-riscv@lists.infradead.org>; Mon, 13 Mar 2023 19:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678760575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmn/Tu9QQEldkcaMm6xr7JzrPZg/DPh7ApsKSJ8t7Qc=;
        b=G7XKJBWKNqGO2hwc+M0jlRTo8RuBBEZVbhOZ8ULGqDyMVGrUCGjPnMgQZYzi6wj1ds
         4rnbvyD24vh4pHTYlQjVGHQ6cHhYXPCoBLn+AtHVZf17e90lBjw/jiCax65M7ACKH+MJ
         YmnCXzUtaoaQVgbTils/S9KEndgnxKtziyHjDucXr4SOBM5JYu6sues2IGgxLSS7ITd+
         K8aaMflg1XQBmAZe7bLfTjoAER94IpHHJ64BqHqZDe2G42H34WL3RcrxV4yVwehnemAs
         XqDBtdZvhsJF20uxeUhpuHyQC8FOVisYMVgusSawUeKxKA4/zepDZ/MQME0qOFUJfVsk
         w1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678760575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xmn/Tu9QQEldkcaMm6xr7JzrPZg/DPh7ApsKSJ8t7Qc=;
        b=I9cCssltnWoyTMu6jSkqci47VUcplABHACIfEJlk1fAoQWbdaiffnGvJazFHoC8cwF
         lvydo9g+ytjBrAg7pWw6XDm22s7x9y0vu0Nffr9CJKRMGWkoM3THQ2nIj+UbrnScVeNs
         YBiizEDyvWNK2tQhZJQAsLGYJNeQ8HBSEvfpdUeId9WDWZWEAfg7W2wIay/HwKcbOkmH
         9EKcc+KrWF5QJMPGv3j5wJ1P5XEwjDQVCk5QTrMSDez3dMi6YgjI8SJPEEJJdp9mvOc/
         iTnQzrOeuguOjryQYyy9Zkl038p3LJiWDwSLc2NNGNIwHqNgYyAq3OYymANZoFmDqcbz
         TWWg==
X-Gm-Message-State: AO0yUKV9E5PYZwdgDc01NyJR9BWYc3F9iwpskfTK3NB41pMKGe2wQaOG
	HZE5xYRdWnFJLJ3p6ObvP/p0synsy1fQ9xYGacI=
X-Google-Smtp-Source: AK7set8WsFCh8Mez4xozjfkSav06kp61NeO4s2czeZwHPbXa6/9XNImnQnan8FE3EIIw6B9FMGDCqPj8lcxVuZWIwaU=
X-Received: by 2002:a05:651c:336:b0:295:d632:ba25 with SMTP id
 b22-20020a05651c033600b00295d632ba25mr11181025ljp.5.1678760575431; Mon, 13
 Mar 2023 19:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230313034906.2401730-1-dylan@andestech.com>
In-Reply-To: <20230313034906.2401730-1-dylan@andestech.com>
From: Zong Li <zongbox@gmail.com>
Date: Tue, 14 Mar 2023 10:22:43 +0800
Message-ID: <CA+ZOyahmpKXq2K-VqKkfN8t5aLDwU-OvL46oj9nNpdm6ZU3qNQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: mm: Fix incorrect ASID argument when flushing TLB
To: Dylan Jhong <dylan@andestech.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	guoren@kernel.org, sergey.matyukevich@syntacore.com, aou@eecs.berkeley.edu, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, x5710999x@gmail.com, 
	tim609@andestech.com, peterlin@andestech.com, ycliang@andestech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_192258_433147_B67E65CA 
X-CRM114-Status: GOOD (  19.52  )
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

RHlsYW4gSmhvbmcgPGR5bGFuQGFuZGVzdGVjaC5jb20+IOaWvCAyMDIz5bm0M+aciDEz5pelIOmA
seS4gCDkuIvljYgxMjoyOeWvq+mBk++8mgo+Cj4gQ3VycmVudGx5LCB3ZSBwYXNzIHRoZSBDT05U
RVhUSUQgaW5zdGVhZCBvZiB0aGUgQVNJRCB0byB0aGUgVExCIGZsdXNoCj4gZnVuY3Rpb24uIFdl
IHNob3VsZCBvbmx5IHRha2UgdGhlIEFTSUQgZmllbGQgdG8gcHJldmVudCBmcm9tIHRvdWNoaW5n
Cj4gdGhlIHJlc2VydmVkIGJpdCBmaWVsZC4KPgo+IEZpeGVzOiAzZjFlNzgyOTk4Y2QgKCJyaXNj
djogYWRkIEFTSUQtYmFzZWQgdGxiZmx1c2hpbmcgbWV0aG9kcyIpCj4gU2lnbmVkLW9mZi1ieTog
RHlsYW4gSmhvbmcgPGR5bGFuQGFuZGVzdGVjaC5jb20+Cj4gLS0tCgpIaSBEeWxhbiwKVGhhbmtz
IGZvciB5b3VyIHBhdGNoLCBpZiBJIHJlbWVtYmVyIGNvcnJlY3RseSwgdGhlcmUgd2FzIGEgcGF0
Y2ggZnJvbQpBbGlzdGFpciBGcmFuY2lzIGRpZCB0aGUgc2ltaWxhciBmaXguIFBlcmhhcHMgd2Ug
c2hvdWxkIHRyYWNrIHRoYXQKcGF0Y2ggdG8gc2VlIHdoeSBpdCBkb2Vzbid0IGJlIG1lcmdlZC4g
VGhhbmtzLgoKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LXJpc2N2
LzIwMjItTWFyY2gvMDEzNTU4Lmh0bWwKCj4gQ2hhbmdlcyBmcm9tIHYyOgo+IC0gUmVtb3ZlIHVu
c3VlZCBFWFBPUlRfU1lNQk9MKCkKPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJm
bHVzaC5oIHwgMiArKwo+ICBhcmNoL3Jpc2N2L21tL2NvbnRleHQuYyAgICAgICAgICAgfCAyICst
Cj4gIGFyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyAgICAgICAgICB8IDIgKy0KPiAgMyBmaWxlcyBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS90bGJmbHVzaC5oCj4gaW5kZXggOTA3YjllZmQzOWE4Li41OTdkNmQ4YWVjMjggMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4gKysrIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4gQEAgLTEyLDYgKzEyLDggQEAKPiAgI2luY2x1ZGUg
PGFzbS9lcnJhdGFfbGlzdC5oPgo+Cj4gICNpZmRlZiBDT05GSUdfTU1VCj4gK2V4dGVybiB1bnNp
Z25lZCBsb25nIGFzaWRfbWFzazsKPiArCj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBsb2NhbF9mbHVz
aF90bGJfYWxsKHZvaWQpCj4gIHsKPiAgICAgICAgIF9fYXNtX18gX192b2xhdGlsZV9fICgic2Zl
bmNlLnZtYSIgOiA6IDogIm1lbW9yeSIpOwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2Nv
bnRleHQuYyBiL2FyY2gvcmlzY3YvbW0vY29udGV4dC5jCj4gaW5kZXggODBjZTljYWJhOGQyLi42
ZDFhZWIwNjNlODEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9tbS9jb250ZXh0LmMKPiArKysg
Yi9hcmNoL3Jpc2N2L21tL2NvbnRleHQuYwo+IEBAIC0yMiw3ICsyMiw3IEBAIERFRklORV9TVEFU
SUNfS0VZX0ZBTFNFKHVzZV9hc2lkX2FsbG9jYXRvcik7Cj4KPiAgc3RhdGljIHVuc2lnbmVkIGxv
bmcgYXNpZF9iaXRzOwo+ICBzdGF0aWMgdW5zaWduZWQgbG9uZyBudW1fYXNpZHM7Cj4gLXN0YXRp
YyB1bnNpZ25lZCBsb25nIGFzaWRfbWFzazsKPiArdW5zaWduZWQgbG9uZyBhc2lkX21hc2s7Cj4K
PiAgc3RhdGljIGF0b21pY19sb25nX3QgY3VycmVudF92ZXJzaW9uOwo+Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyBiL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+IGlu
ZGV4IGNlN2RmYzgxYmIzZi4uYmE0YzI3MTg3Yzk1IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
bW0vdGxiZmx1c2guYwo+ICsrKyBiL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+IEBAIC0yNyw3
ICsyNyw3IEBAIHN0YXRpYyB2b2lkIF9fc2JpX3RsYl9mbHVzaF9yYW5nZShzdHJ1Y3QgbW1fc3Ry
dWN0ICptbSwgdW5zaWduZWQgbG9uZyBzdGFydCwKPiAgICAgICAgIC8qIGNoZWNrIGlmIHRoZSB0
bGJmbHVzaCBuZWVkcyB0byBiZSBzZW50IHRvIG90aGVyIENQVXMgKi8KPiAgICAgICAgIGJyb2Fk
Y2FzdCA9IGNwdW1hc2tfYW55X2J1dChjbWFzaywgY3B1aWQpIDwgbnJfY3B1X2lkczsKPiAgICAg
ICAgIGlmIChzdGF0aWNfYnJhbmNoX3VubGlrZWx5KCZ1c2VfYXNpZF9hbGxvY2F0b3IpKSB7Cj4g
LSAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYXNpZCA9IGF0b21pY19sb25nX3JlYWQoJm1t
LT5jb250ZXh0LmlkKTsKPiArICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhc2lkID0gYXRv
bWljX2xvbmdfcmVhZCgmbW0tPmNvbnRleHQuaWQpICYgYXNpZF9tYXNrOwo+Cj4gICAgICAgICAg
ICAgICAgIC8qCj4gICAgICAgICAgICAgICAgICAqIFRMQiB3aWxsIGJlIGltbWVkaWF0ZWx5IGZs
dXNoZWQgb24gaGFydHMgY29uY3VycmVudGx5Cj4gLS0KPiAyLjM0LjEKPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
