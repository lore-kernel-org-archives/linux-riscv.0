Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F938C53200
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 17:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/pr0S7lSRCn/xx+dnEyTyhRPYfCUE8yYWP0XeWOMY+Y=; b=Fsz281HnRA+F/k
	Uage1D1bJtLf2kT68oQAND+wXn2mSJm8gPgnyDsSj5bpF7FMRbqkulMBM/B50UzruuVA8SOhVjM3U
	9glNrZbZlTxJQ0CrdKSxoQok3VD8J9ZahrOgv76VepK1IqoG6puHZbPgWjslATzEEyVn6hhv38wt0
	8OZlpViFz7j+LVklkyu7GwjHcgvJxOXmQZnEqkSSoVvnbypGDymvA0Vvvdpqh3uFDFzaaerhamMzJ
	AjgJJr9Cc4cP+DubTKfxOomwd4YnwFp137bUJXulBZh2w7sAiDCgH1td0MBOUZ9KJ/ZuNjGfEfz4i
	7XT2uvTxm528uSN4Bf7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp87d-00000008i0B-3eML;
	Wed, 29 Jul 2026 17:31:13 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp87b-00000008hz3-2KyK
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 17:31:12 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-6688acd1a51so1625572d50.3
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 10:31:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785346270; cv=none;
        d=google.com; s=arc-20260327;
        b=Yn8CBZi0P7jQHnxHYgpNT7bAQdfVojXqFXQtTr9r5jo20YxHdasOk6m7HoN/y3W3oG
         xfMCFcK9ao/CO6hvmOCFOhor/IYzKPAkY9ftOFkB0yW9m8tZSrwr1h3m6HmwneiUjPRa
         5a6NORMM8nyNYusYC7dkQi5fFLJlF77Mvoeiz3Nge5X/mM6rQd8ATAO/Jc/fli8DNn0u
         WSzUt+AZ8WT7/bUFPxZS/PAN02ApwIqkR/LAkYlmRC9B1quGudo5T0F7Wv5BYS3zdeXO
         GIdG2eqtGkLUkkQnv0RbCXe7vbvfidB7p1SJleji3F7NVuoXa2db1PpWgU5vcZkQZ0ro
         xIzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1ZyoeR94DikQIleWs7ga6RzBSuw/fjCSUVVWK4uLamY=;
        fh=QC73+FHUhqlgYqoFNhHwY2tcVSowSA6zPVE0hP52tpI=;
        b=cSaVBCj2YM3lZNc6yJVtiWYpM7DZ0fdtKqk4AiL3S8GFdCqM1X7H8nGWp9jiAskWUX
         d6HdDmQ4y13r93f/8FJHl3rLkA63d0csolva/2mmZ55L7bJApjUc3oGhcKzq81n4E5NE
         +fVAETZbij2UnYd/jQxEEj/OflU0ULxxbfQ4s/P0b8HznO/hgS/O8dIRSD0dObwueb3b
         h+3huYIi36Iytj0a9L/UCYnyYJC0OwYzKaHQIsc7kfW+fiKwwEfYeQzaU4RBhXo4k4vs
         5kQkGFpEeMxPMyW0Dn/ADbdsiKYQ3dN5qlK9D5qcUEr8qKpgmhXH9vNkNfAZonCXRaqe
         h6vw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1785346270; x=1785951070; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1ZyoeR94DikQIleWs7ga6RzBSuw/fjCSUVVWK4uLamY=;
        b=QfXHuJZvWO2jglNwpXm/6m10AIVBiBaQl0XOthiXJx7n/JTfMApwjKyqlH+TJEhNRm
         tdyLMa2yuoQsR9ZuCD6oJc5E6cZ+6AQSdW+0KoPVebVXS5RYO2AL66hvTi2F52TdYtgI
         azI8x4X4r1rsUQK+wchTxWitM89IOqMDTPr159OcdYbecfEPVAsWXOrMyuCbV9OMIHMm
         i1xdlNqaxIH6NzyeUGmcEk+sXZlMUQulBnT3El4FypfDHo4SRBlZwX9iHFpEO1BSCCQW
         VcvNtNp/5LDU3LYUv2Tm8M+kbllacer4gkRm1JXMlzAdBsSIBNddlHxfwpJ+uWATGmZW
         Bp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785346270; x=1785951070;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ZyoeR94DikQIleWs7ga6RzBSuw/fjCSUVVWK4uLamY=;
        b=cEWA9pJsgZa2rAl58dC9T1jWO69XLbGNqF57qgk1Ya3CDpoSGRPL7W6rbW3x3uUBUl
         THkMaAf2ZFbSCF9gYV9b3NueypGHmNLKCdweZKcOCNBvtFp6CRPjHNa+PwFL2j2dsMg3
         D+1qXyltJhx3H7GcdUiaVuXA1EOYx0OLMeNXx3wyzRSHFJUkLFN2HAiaV7bz2Qu1m19g
         Z/auu6wb2xyxslre4+QzhKOsSRZtA7qRaMjVjMD/Sxy6BzdZFag/boxxQi3lTLVcvchB
         gRGiZsBC1cnStZJ4mUT1fZaYaiYufKtZcNGB7OdY+bMgAkRyAKPfiD4U87tCQKbzt54e
         MwtQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrtugl0Ruj3nWNFZt5rQKK9mgFekpw8QAYuBb3bFC7PJ/romzLpmvAoKctWBLKtLcmebzNHiC5COX+Uow==@lists.infradead.org
X-Gm-Message-State: AOJu0YzgTHMuZNN/xP+z16AN46qUfROptsbweCi1ROZhvG+1ey1GIxyt
	iDrgY4kqxhBXz79iXzjtfTnbi/NhmSLl/YldXiyzbIutC+El59GESMviXMuf1kZuTE6DkS+Yn91
	/cV2v1QWxm2xbvdLirDeTFgxyaRhNVOwZ791dYHPDYA==
X-Gm-Gg: AR+sD1005elarjp/Ily+3b4xnAS1ZbJf8LGEJ422uz0/SfC/Re3YKhUlCZ4WmIF6eT/
	5uE1U+BOlMEgZHCo1XKwLoucyJRjljlIn/LtG8TjC2KOUgzBLahpm/0Ej223tosxYlWcXDNaCqM
	+ZZ+dGX5KZW7l8ndcybrLVpCRUB/ve1h3xkp4a4g0BOlLTNf+10RcVRPHZ5ah6kh/t53CgEAqCl
	cfQ1FtIJ4UCeaT7KFCkD/Ivm6BhrZVTyJ382YQ8PpKR5ys/EN8KMk8Sxw0Vt+OUNltWlbbdMCOA
	VdpDJdcno9VahQ2FGQVSxCHaSXPCyULSPdPr9TCZzc2TsW0VNN6cZ4fl8rgK5vgqpHpZ1DRZYzw
	=
X-Received: by 2002:a05:690e:d85:b0:668:9b2a:3fb with SMTP id
 956f58d0204a3-669057243bemr3566424d50.47.1785346269797; Wed, 29 Jul 2026
 10:31:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260729172450.1660418-1-aurelien@aurel32.net> <20260729172450.1660418-2-aurelien@aurel32.net>
In-Reply-To: <20260729172450.1660418-2-aurelien@aurel32.net>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Wed, 29 Jul 2026 12:30:59 -0500
X-Gm-Features: AUfX_mxEe619zbavk9yHhcP2nj_Tv53cCCT1YHnlKo3_ADD7Fd7GkWxxvKRuwoc
Message-ID: <CAEev2e-_jW8OYoJofrT3VATyZg87DHUEM1qHNpdnPAJ-SwOjcw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] riscv: defconfig: enable RFKILL and RFKILL_GPIO
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_103111_619115_460D5AF1 
X-CRM114-Status: GOOD (  12.88  )
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

SGkgQXVyZWxpZW4sCgpPbiBXZWQsIEp1bCAyOSwgMjAyNiBhdCAxMjoyNOKAr1BNIEF1cmVsaWVu
IEphcm5vIDxhdXJlbGllbkBhdXJlbDMyLm5ldD4gd3JvdGU6Cj4KPiBUaGUgU3BhY2VtaVQgSzMg
UGljby1JVFggcmVxdWlyZXMgUkZLSUxMX0dQSU8gdG8gZW5hYmxlIGJsdWV0b290aCBhbmQKPiB3
bGFuLgo+Cj4gVGVzdGVkLWJ5OiBBbmlydWRoIFNyaW5pdmFzYW4gPGFzcmluaXZhc2FuQG9zcy50
ZW5zdG9ycmVudC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQXVyZWxpZW4gSmFybm8gPGF1cmVsaWVu
QGF1cmVsMzIubmV0Pgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2NvbmZpZ3MvZGVmY29uZmlnIHwgMiAr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZyBiL2FyY2gvcmlzY3YvY29uZmlncy9kZWZjb25maWcK
PiBpbmRleCA3NGJhNWFjYzEyYTQwLi44NjY4YWEzMWU3OWFhIDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3YvY29uZmlncy9kZWZjb25maWcKPiArKysgYi9hcmNoL3Jpc2N2L2NvbmZpZ3MvZGVmY29u
ZmlnCj4gQEAgLTk5LDYgKzk5LDggQEAgQ09ORklHX05FVF9DTFNfQ0dST1VQPW0KPiAgQ09ORklH
X05FVExJTktfRElBRz15Cj4gIENPTkZJR19DR1JPVVBfTkVUX1BSSU89eQo+ICBDT05GSUdfQ0FO
PW0KPiArQ09ORklHX1JGS0lMTD1tCj4gK0NPTkZJR19SRktJTExfR1BJTz1tCj4gIENPTkZJR19O
RVRfOVA9eQo+ICBDT05GSUdfTkVUXzlQX1ZJUlRJTz15Cj4gIENPTkZJR19QQ0k9eQoKVGhlIHJp
c2N2IGRlZmNvbmZpZyBkb2Vzbid0IGhhdmUgQ09ORklHX1JUVzg5PW0gYW5kCkNPTkZJR19SVFc4
OV84ODUyQkUgaW4gaXQuIERvIHdlIG5lZWQgdG8gYWRkIGl0PwoKSSB3YXMgdGVzdGluZyB3aXRo
IGEgZGlzdHJvIGRlZmNvbmZpZywgc28gZGlkbid0IG5lZWQgdG8gYWRkIGl0Cm1hbnVhbGx5LiBJ
IHNob3VsZCBoYXZlIHJlYWxpemVkIHRoaXMgc29vbmVyLgoKPiAtLQo+IDIuNTMuMAo+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
