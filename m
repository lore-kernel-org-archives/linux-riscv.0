Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6A0606A320
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2026 09:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PesCav8z;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YMpn4nlx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gPOJY6V9m8jP1gs4H4edXSDLzxAhXH88tO5BOkSiEC0=; b=PesCav8z7St5bxM4tfd+YSGyp+
	7iNCcytnsFJ78ETxWmzr6clPVGCm47GO2+IO6kudhBwFTuoZGo8S8AY+z+ORlSCpomNafjPak2N5K
	jHaMunZeyCwz4K1a9GzcmqP7H1aELNgFXOSz5hersle1bmxP8QBj/pumJmMTfGcBRXXxSXWqNm2Pt
	tPj/IROQtvCZq1bBOmQAaGH9DlC4HqMB202rV+P6MBhDusgfDEBHHqY8hFktoDfht3w7GyVjr/Z3r
	0nHey90CAXnBiodv91LAwNeAzbIshHTq+FpT71dDQ5//nWbGGSbXIv59DutOXAb3JaudNVAnGooxm
	iQ09Ifhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUhUK-0000000H0Du-1H5U;
	Sat, 21 Nov 2026 09:34:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUhUJ-0000000H0Do-1up1
	for linux-riscv@lists.infradead.org;
	Sat, 21 Nov 2026 09:34:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 607C16127D
	for <linux-riscv@lists.infradead.org>; Sat, 21 Nov 2026 09:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18BB31F000D1
	for <linux-riscv@lists.infradead.org>; Sat, 21 Nov 2026 09:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795253666;
	bh=9v8g6X3WDYfoIYNgraXq6dzuu3lA8FjW9iHHqy+DMxA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YMpn4nlx9yqW6GSDHuCv/vofPRpw5pSQsOb1xZNTG4j2BCqXQ5xhe73vu0kgQKsfJ
	 HQkDht/XJ6OehNVZoGOERQAaTs31SpUkXnt/066aDrH+GmyR4cFNdBFa0telPPQezI
	 ZfCnf1iDdk20ce5G2u2rpO9JFQbSa16uufEJBGRkG2NCUbPDjQ3Eu4u35hapUCeHJ4
	 y3XD+QIPcTBnzKLlA+SisFDqBzuYJvs3446TUh5nXnsYBCTFurU1H/Y6GuPtip09bF
	 JGkZVSQe92s6m3RU4NHlpdMo9FzhsM14gj9f9nnv90XVIWLXGGdYbNRr2fsL7lXrvf
	 O6lIAMdL9rfcA==
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so14475795e9.2
        for <linux-riscv@lists.infradead.org>; Sat, 21 Nov 2026 01:34:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGexrG3mpKKNs44IL7UWZLebUYx2nA44JkeGK/L2aNkFwScq6/kPHbSoh8TtGb6EKOecsn0eE7aqOo40A==@lists.infradead.org
X-Gm-Message-State: APuU4Z8sgyqE2Ds8CUaQ4WSnJHSrSxRi38svc0irspSZ8KvwS5OHWwbk
	d+uJwhxlzjQqImJEIMEhoXUqt2NS9r6fTA4ZfDQ5THBYmYbDv3a6YG/AKYl4tZujbP/n5sjevFn
	QSurP0HaGKZNiRt5JwpI7PuxmGloG4Tk=
X-Received: by 2002:a05:600c:468b:b0:4ab:cc03:7f60 with SMTP id
 5b1f17b1804b1-4bb8881b511mr128890735e9.18.1795253664679; Sat, 21 Nov 2026
 01:34:24 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118053926.845109-1-hj351016@gmail.com>
In-Reply-To: <20261118053926.845109-1-hj351016@gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 21 Nov 2026 17:34:12 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQMLzX7ANcPtM-5yokRW-17C2cpbBOOx4ip1qpxnhTuCw@mail.gmail.com>
X-Gm-Features: Aa3M54p_k23V3n3S-vJbFZ6t12-Zbu1Qx524on7iW-P5egmHQu9WaiGNlcA1_fg
Message-ID: <CAJF2gTQMLzX7ANcPtM-5yokRW-17C2cpbBOOx4ip1qpxnhTuCw@mail.gmail.com>
Subject: Re: [PATCH] riscv: ptrace: Initialize cregs before copyin in compat_riscv_gpr_set()
To: Hyunjung Ko <hj351016@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMTgsIDIwMjYgYXQgMTozOeKAr1BNIEh5dW5qdW5nIEtvIDxoajM1MTAxNkBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gdXNlcl9yZWdzZXRfY29weWluKCkgb25seSBjb3BpZXMgYGNv
dW50YCBieXRlcywgc28gYSBQVFJBQ0VfU0VUUkVHU0VUCj4gcmVxdWVzdCB3aXRoIGEgc2hvcnQg
KG9yIHplcm8pIGlvdl9sZW4gbGVhdmVzIHRoZSByZXN0IG9mIHRoZSBvbi1zdGFjawo+IGNyZWdz
IHVuaW5pdGlhbGl6ZWQuIGNyZWdzX3RvX3JlZ3MoKSB0aGVuIGNvcGllcyBhbGwgb2YgaXQgaW50
byB0aGUKPiB0cmFjZWUncyBwdF9yZWdzLCB3aGVyZSB0aGUgdHJhY2VyIGNhbiByZWFkIGl0IGJh
Y2sgd2l0aAo+IFBUUkFDRV9HRVRSRUdTRVQuCj4KPiBGaWxsIGNyZWdzIGZyb20gdGhlIGN1cnJl
bnQgcmVnaXN0ZXIgc3RhdGUgZmlyc3QsIHNvIHRoYXQgYSBwYXJ0aWFsCj4gd3JpdGUgb25seSB1
cGRhdGVzIHRoZSByZWdpc3RlcnMgaXQgY292ZXJzLCBhcyByaXNjdl9ncHJfc2V0KCkgZG9lcy4K
Pgo+IEZpeGVzOiA0NjA4YzE1OTU5NGYgKCJyaXNjdjogY29tcGF0OiBwdHJhY2U6IEFkZCBjb21w
YXRfYXJjaF9wdHJhY2UgaW1wbGVtZW50IikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+
IFNpZ25lZC1vZmYtYnk6IEh5dW5qdW5nIEtvIDxoajM1MTAxNkBnbWFpbC5jb20+Cj4gLS0tCj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvcHRyYWNlLmMKPiBpbmRleCBhMDA1NTc0Li4zMjIyN2I3IDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL3B0cmFjZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHRyYWNlLmMK
PiBAQCAtNTg0LDYgKzU4NCw4IEBAIHN0YXRpYyBpbnQgY29tcGF0X3Jpc2N2X2dwcl9zZXQoc3Ry
dWN0IHRhc2tfc3RydWN0ICp0YXJnZXQsCj4gICAgICAgICBpbnQgcmV0Owo+ICAgICAgICAgc3Ry
dWN0IGNvbXBhdF91c2VyX3JlZ3Nfc3RydWN0IGNyZWdzOwo+Cj4gKyAgICAgICByZWdzX3RvX2Ny
ZWdzKCZjcmVncywgdGFza19wdF9yZWdzKHRhcmdldCkpOwo+ICsKPiAgICAgICAgIHJldCA9IHVz
ZXJfcmVnc2V0X2NvcHlpbigmcG9zLCAmY291bnQsICZrYnVmLCAmdWJ1ZiwgJmNyZWdzLCAwLCAt
MSk7Cj4gICAgICAgICBpZiAoIXJldCkKPiAgICAgICAgICAgICAgICAgY3JlZ3NfdG9fcmVncygm
Y3JlZ3MsIHRhc2tfcHRfcmVncyh0YXJnZXQpKTsKWWVzLCB3ZSBuZWVkIHRvIGluaXRpYWxpemUg
Y3JlZ3MgZnJvbSB0aGUgdGFyZ2V0J3MgY3VycmVudCByZWdpc3RlcgpzdGF0ZSBzbyB0aGF0IHBh
cnRpYWwgd3JpdGVzIHByZXNlcnZlIHRoZSB1bnRvdWNoZWQgcmVnaXN0ZXJzLgoKUmV2aWV3ZWQt
Ynk6IEdVTyBSZW4gKFh1YW5UaWUpIDxndW9yZW5Aa2VybmVsLm9yZz4KCi0tIApCZXN0IFJlZ2Fy
ZHMKIEdVTyBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
