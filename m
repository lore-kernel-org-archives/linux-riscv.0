Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5F8606A31E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 03:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cPTHbTks;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q/oxsYCg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=byfQqGU9EfaF0ha0yWKABpA1Aki6Nxn4wwzXDtWmhKw=; b=cPTHbTks0vUYE27HnNNcqpoLCw
	6lIXXj0cCYJo+3634YeyXJkif9IN1EzJ6vFhWp4pTWou3BqRI0eG3m3EWpGQwtA8VXCh2sF+mDtq8
	pImRSILVBQBIGe/gwaQh46Z/fR39TzZt1RvVF+hDea9AvuQvsea5capgevblAprFPFJrjLJzJtvEn
	pS7lEsJnzY4dlVSDwSTsN8VarxW8vwG/K6OrPl9BBZFgrcMpD352iArhDNGuvnfqj7WkDkELhWy/4
	nUV+X9udf/ahDF2rcLTa45twuuJ1ACPoVpujJvF4+SdYRsWfsPlFZAv3QZ8V0Hnk2kLqdL09Fij3h
	VM4/V7fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVgsG-00000005Ps7-3Szb;
	Tue, 24 Nov 2026 03:07:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVgsE-00000005Pry-3QFK
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 03:07:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 19ECC44DE3
	for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 03:07:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E10F31F000E0
	for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 03:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795489633;
	bh=f3G7P8EX6lzel8M4murbJ/ClS/XnnVW3EBSz7Xxerm0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Q/oxsYCgid34xy+gjplJh6fDMssmb6kksArIkf0elUB7YfQyGJAyfJqPmjrOI0EF3
	 PsCNSWFw/RCcez8AHQTpNpMGL0yr6ETRr0HsJTkFNBP2ebj+xcBHoFTx13YRVgfJq4
	 YsusU1+BluywsEElXMlvOzD9JxRZ4xIrcpl+ntXXuJB+wuUuTTb0KUFyUj0S0BZh7J
	 WGXvxJz9WztsHeV1IrzQVsC0z9fX8pGlQpGBgKq2Y5YLpi/x/TGqb+gR7Hzrv0U6uP
	 yNqdDTOa99hBmlz+ngFhQC0BUEVmdX+ISRseyGvrTaB/BwfCk8TLygpkMMxZL4nsgl
	 Kfe4Di3796qHg==
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso38608335e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2026 19:07:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEvR1AatNdEi5N3ib0sc0JSloPuGVHlIQ4N5JD6VIvMDlgMxq53w8MhvU7Or2haNzG30THvPv1fpTl6Rw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9q3Zl3OEYY2obDzDH6YetSUTb0s6P9BbQ1vbnuw4+PdozoPQph
	XqO9xI38Y6aFqONMUgg6r9/XcViGePZS/7VwEiWESWf2Q3FZV2YdAwPFZPV6ETwZcbVGwA6Rg2g
	Nsifa8VmRtACCiiScOK+jakRrtSO4noE=
X-Received: by 2002:a05:600c:5308:b0:4bb:76d6:1f5d with SMTP id
 5b1f17b1804b1-4bb887ca192mr282484095e9.2.1795489632406; Mon, 23 Nov 2026
 19:07:12 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261124-riscv-vdso-build-vdso-v1-1-c52b0b3592dc@iscas.ac.cn>
In-Reply-To: <20261124-riscv-vdso-build-vdso-v1-1-c52b0b3592dc@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 24 Nov 2026 11:07:00 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRxR42+vfhSZkKnJ8D1BjDBO0MtW3eJ5FayeMVuWEaTdQ@mail.gmail.com>
X-Gm-Features: Aa3M54oQjNWkBQrZ_zxXhlkqAwKIdWJTZjWnIQiYXF9Pb9UKL3pW2cnEgdggPKk
Message-ID: <CAJF2gTRxR42+vfhSZkKnJ8D1BjDBO0MtW3eJ5FayeMVuWEaTdQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: vdso: Define BUILD_VDSO
To: gaohan@iscas.ac.cn
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Drew Fustini <fustini@kernel.org>, 
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org
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

T24gVHVlLCBOb3YgMjQsIDIwMjYgYXQgMjo0NeKAr0FNIEhhbiBHYW8gdmlhIEI0IFJlbGF5Cjxk
ZXZudWxsK2dhb2hhbi5pc2Nhcy5hYy5jbkBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEZyb206IEhh
biBHYW8gPGdhb2hhbkBpc2Nhcy5hYy5jbj4KPgo+IFVubGlrZSBhcm02NCwgcG93ZXJwYyBhbmQg
b3RoZXJzLCByaXNjdiBkb2VzIG5vdCBkZWZpbmUgQlVJTERfVkRTTwo+IGZvciBpdHMgdkRTTyBi
dWlsZCwgc28gaGVhZGVyIGNoZWNrcyBvbiBpdCBuZXZlciBhcHBseSBoZXJlLgo+Cj4gVGhlIFQt
SGVhZCBXUklURV9PTkNFIGVycmF0YSBuZWVkcyBpdCB0byBrZWVwIGl0cyBhbHRlcm5hdGl2ZSBv
dXQgb2YKPiB0aGUgdkRTTy4gT3RoZXJ3aXNlIGJvb3Rpbmcgd2l0aCBDT05GSUdfREVCVUdfVklS
VFVBTD15IGhpdHMKPiBWSVJUVUFMX0JVR19PTigpIGluIHZtYWxsb2NfdG9fcGFnZSgpLgo+Cj4g
TGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvQ0FKRjJnVFErY09ZZlFY
PUpzSzZUNkFpajc5RlU5Ukd1eXhBQW91eUw5NTh6OEFCcW5nQG1haWwuZ21haWwuY29tLwo+IFNp
Z25lZC1vZmYtYnk6IEhhbiBHYW8gPGdhb2hhbkBpc2Nhcy5hYy5jbj4KPiAtLS0KPiBUZXN0ZWQg
d2l0aCB0aGUgV1JJVEVfT05DRSBlcnJhdGEgVjYgaW4gcWVtdSAtY3B1IHRoZWFkLWM5MDYuCj4g
LS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUgfCAxICsKPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwv
dmRzby9NYWtlZmlsZSBiL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUKPiBpbmRleCBj
MDIzMDQ2YTNmZDc1YTk1OTQ2YmFiYjk2YjNmOTAxOWVlMmRlYzRhLi5iOTk2NDU2NzI2MzQ4NTJk
ZjgxNGU5ZDE3Yzc2OGJmODIyOTcwNzliIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L3Zkc28vTWFrZWZpbGUKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlCj4g
QEAgLTM1LDYgKzM1LDcgQEAgZW5kaWYKPgo+ICBjY2ZsYWdzLXkgOj0gLWZuby1zdGFjay1wcm90
ZWN0b3IKPiAgY2NmbGFncy15ICs9IC1ERElTQUJMRV9CUkFOQ0hfUFJPRklMSU5HCj4gK2NjZmxh
Z3MteSArPSAtREJVSUxEX1ZEU08KVGhpcyBkb2Vzbid0IG5lZWQgdG8gYmUgc2VwYXJhdGUgZnJv
bSB0aGUgb3JpZ2luYWwgcGF0Y2jigJRJJ2xsIGZvbGQgaXQKaW50byB0aGUgbmV3IHZlcnNpb24u
CgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
