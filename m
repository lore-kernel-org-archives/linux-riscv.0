Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724B4606A693
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 15:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=POS9OXbg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=l40/8bx1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7k7aEZCeuKsmYzfcOzMwXN1Dk4TUG7XI/KQYBfcbPnA=; b=POS9OXbgT1YAsDL/zti+JWgrAF
	jNQg6v/JYkL9xBLf6+Bsdy+PMUFarDmgSjOZQBFLIdqDEvvSUDQIO5leesqL5CuiPg7OZ4IIJDqKA
	uK6e79HD7slpCdm89Th7VqCv7z30WHY5a0LHH/feIN+DWcauVBqCZQQ0tH7kapKEXjPgvu1Le8IeA
	3Toq+0WedR0zPCrrtKyHD4sdYg9tyu3cT5ORoK+B2GYesNStO6pelL6BA2+4KgfxH2xRKZn8VsLeT
	nPZTXUsWifLA/WR2UPjDuHcN8jOt6YwXO7lbt/KyxbVgfyQnq6pAy5bxH7fMq72aR4iwhkG8zjPvx
	YdFvl1oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF2b-0000000ANAY-0jlg;
	Wed, 25 Nov 2026 15:36:13 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF29-0000000AN4r-3hQA
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 15:35:56 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5be47aa555cso7446642e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 07:35:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795620943; cv=none;
        d=google.com; s=arc-20260327;
        b=XGFoovFp9Jm4n5y1E8nk7bSv4TlfFOuIitTZvFrX2jcZPFAxenZORssrYMyBCkj2YU
         fp8a7JBdrk/WLm9Dq6wCiSW7pFCnWO5txwcMLFIVVvPSCWrcFAN+yIC90hyED5+h35KL
         KTI5ss9TbkJhxLkLYnji289XtrLn0LFRe/kIgRp3FufpEkMuclLwrMjHhk4w2uOP/Qov
         UUJ3zusq+MJnfyO6gwzAf5w+RQ0lfhU0TXfI03vAJKVlZt6+d5L8otDHFjWfLBk9RPQP
         clqkK0EtGiWryXFyENmcyX31Gd4kvuM1GSD3x1FLCubXgto2y6vRkz2OH+HmbRrGsxUq
         wMbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eR/tiRX9GFewYsayqztCCACOfK3phuUQmHI7BlMOyHI=;
        fh=OEJGbJ3KPP3gpeM3g6Vw8t7BCgy4rjf45xePQhR6HTE=;
        b=c4hGJGI2tkt+z3ooMqW1ST99BZtlCLzjoH7Po1C9mkzVCY7DaidxSSndnC0ktfIARS
         Kb7PVNGXkAyOsmmyzzjBj+iXHUEDZp2y7q71pmDtK7bf1HWHBjHLX117KDcjLb69Z56a
         CV25LRuoG65PnAhc1WpBeKZjDrqSwJ9o5UMCxsPLmuPjVIpzLnosuLh1xiEv9B+LXg+0
         XvWdEl10zQ9hDI+eb/qqvqPJ86wmCSUOpSBFAQQdbktlDocrPrtyA/lkmPT/wmbh65Ms
         B990syFgeG2EGUCGmnwV3Vp8+4JbPkFn3/yL1jmI9LQ3OOS+V+3jSgV2RzIOOARXOjdE
         D/ng==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795620943; x=1796225743; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eR/tiRX9GFewYsayqztCCACOfK3phuUQmHI7BlMOyHI=;
        b=l40/8bx1BE5JLoqvEpt8O+EM6ffxIDv4R78xBI44ZFtx0tMBWKZjj6FNOgpw23aYKb
         7mAdFlQKm1irmHw7TWrJoYz132GMdMzGcSFwbYKbNOBRzeXcr1HHqz/kzUWRnN9dRi5i
         D3yBne9VXwQaFrTWgPxU7KQZsb07yZiMqq8vaPp9DVd1XAnrOI6UL+z2heC9RZV7kQKz
         +lyICFCMQIEnlPklyNT3NyRenqeYLrbaNV3F6ExNG1EBGHpO+jpKyaZwO0zkThaQoNFl
         iThPlJ3OElO7RdfTKW9sUe60cNM3wYyoHPKmSNfCdltBSPUP4UkNWcGIbrHHJEj+NAmO
         GGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620943; x=1796225743;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eR/tiRX9GFewYsayqztCCACOfK3phuUQmHI7BlMOyHI=;
        b=YCevbSCxjXFX7pAMx0iTWVM8wgr5guItFTWtCjiBH99i6HSsVGXvhjb2EPiOE3nrPy
         8AVh8G5Z3HHQILYQLphVDkN07a0XKQZflO0DnQZZ5GotYT1GKfkgU9F2lhkYTfFnYqNh
         LACQ2yUEtpxTq8Snht85QnwrPq8jXhL6Sov6762jBAN+UCexhdsgTcApWY0qQTdX12rv
         EgChYGVjbgQ8eTrLe5+ldYFUF7CSwP9fp0sBoLI1xFgueKFCAk3pQLc3Qguxb3U2+SYb
         sWtWbrz3gUeNwqPReGiEU9He6/ZufVfon9iGsrLaaFa4RIctmY3U8vI7jXjpPx5Gnbke
         zYXw==
X-Forwarded-Encrypted: i=1; AL+hErEadgROPJk/J8lgu0sicqREppBG85SGgcumDbpv7MgdD309aO2KwCrEeJiGykExAtGRtsT05maNT7AgWg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+rUlqNyDZhKFo43TLEMKXXdA8HkbUFogjN3VMPXGLB2deDbu/a
	KwZjcRjcWZ5Lb+4hRE647S+EVjfXiSUUuNvlkGrymSDga65DV4NSm6qrCytLX6gkMZWH/dq9ruh
	ZFnLJjxcaw9o7d7kCUoOt6MlgIgzX0MvDqQiLARK5cw==
X-Gm-Gg: AZFdTZf0CB0sfzmXZx4iDmnwxtm9mZzlCukQKbh3ImuJ41JjjVjMk8jpS93RHJPkGpD
	YkqLpqO0mLaP0okLEjGt8lAb3HZj2GbkEAiIJEk5kMEmF3z9U89na5pXEvYaL3RO43F4VgZ3wDw
	x0iwhkoJAoUKYdj7o0jUHvTa9bcF4pmpupJ92HhNh7193q5ez7JJTOAj2U05CtfCDn+hhU0eAXo
	7d7JVuz2+vx/mXacLvx4a9xuxzVA5thFgPT3x+PDjZsVCHZ+CnkDlpnOYLNEj+aUdGxSL9GjgDK
	G7lHNLTFptnhoBHlCLjS1XLYlpLsS/RRST8yfQYj9NNefu1/jmOY5g8MjMEvYcO1w+kKvr+s4iM
	3yvsfaDymhJEIU6dnmuktsLMucjYQ2JjrGxGfTH+BMo3H8DsnXGnv1PIvZsBD3xvLCoORyFPIVz
	maFn0orrw/zH60XuPjRQCpwjWtbE+g/xDrv+3L2MQ3NS+szs5joHj8
X-Received: by 2002:a05:6512:688b:20b0:5c0:a4e:5cf5 with SMTP id
 2adb3069b0e04-5c1bc7d10c3mr3567435e87.26.1795620943192; Wed, 25 Nov 2026
 07:35:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260924-free_bitmap_initialized-v1-1-4cfb73a0d04b@kernel.org>
In-Reply-To: <20260924-free_bitmap_initialized-v1-1-4cfb73a0d04b@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 25 Nov 2026 21:05:30 +0530
X-Gm-Features: Aa3M54oJBm-fP-yPqacXbdiaITq6or3sIYt9H8e38Vy7GvqmmY_G97lMunRikYo
Message-ID: <CAAhSdy0cfbfufYYhVCz6Tq0_1RrS0DEi5yfKyBJr=WhUnd+QZg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: AIA: Initialize per-CPU HGEI free_bitmap
 only once
To: "GUO Ren (XuanTie)" <guoren@kernel.org>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_073549_382673_A4488DB5 
X-CRM114-Status: GOOD (  19.09  )
X-Spam-Score: -2.1 (--)
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

T24gVGh1LCBTZXAgMjQsIDIwMjYgYXQgMTE6MzTigK9BTSBHVU8gUmVuIChYdWFuVGllKSA8Z3Vv
cmVuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4ga3ZtX3Jpc2N2X2FpYV9lbmFibGUoKSBtYXkgcnVu
IG1vcmUgdGhhbiBvbmNlIG9uIHRoZSBzYW1lIENQVS4gIFRoZQo+IHBlci1DUFUgZnJlZV9iaXRt
YXAgb25seSBuZWVkcyB0byBiZSBpbml0aWFsaXplZCBvbmNlLCBmcm9tIHRoZSBIR0VJRQo+IHdp
ZHRoIGRpc2NvdmVyZWQgb24gdGhhdCBDUFUuICBQZXJmb3JtIHRoZSBIR0VJRSBwcm9iZSBhbmQg
Yml0bWFwCj4gc2V0dXAgb25seSBvbiB0aGUgZmlyc3QgY2FsbCwgYW5kIHNldCBmcmVlX2JpdG1h
cF9pbml0aWFsaXplZCBhZnRlcgo+IHRoZSBiaXRtYXAgaGFzIGJlZW4gcG9wdWxhdGVkLgoKVGhl
IHBlci1DUFUgZnJlZV9iaXRtYXAgZm9yIEhHRUkgbGluZXMgb25seSBvbmUgdW5zaWduZWQgbG9u
ZyBzbwpJIGFtIG5vdCBzdXJlIHdoYXQgeW91IGFyZSB0cnlpbmcgdG8gc2F2ZSBieSBza2lwcGlu
ZyBvbmUgdW5zaWduZWQgbG9uZy4KClJlZ2FyZHMsCkFudXAKCj4KPiBTaWduZWQtb2ZmLWJ5OiBH
VU8gUmVuIChYdWFuVGllKSA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yv
a3ZtL2FpYS5jIHwgMTAgKysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2FpYS5j
IGIvYXJjaC9yaXNjdi9rdm0vYWlhLmMKPiBpbmRleCBiM2I0NjZlNGRiMzMuLmE2NTc0ODMyMWY3
ZCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9haWEuYwo+ICsrKyBiL2FyY2gvcmlzY3Yv
a3ZtL2FpYS5jCj4gQEAgLTYxMCw2ICs2MTAsOSBAQCB2b2lkIGt2bV9yaXNjdl9haWFfZW5hYmxl
KHZvaWQpCj4gICAgICAgICBsYyA9IChnYykgPyB0aGlzX2NwdV9wdHIoZ2MtPmxvY2FsKSA6IE5V
TEw7Cj4gICAgICAgICBoZ2N0cmwgPSB0aGlzX2NwdV9wdHIoJmFpYV9oZ2VpKTsKPgo+ICsgICAg
ICAgaWYgKGhnY3RybC0+ZnJlZV9iaXRtYXBfaW5pdGlhbGl6ZWQpCj4gKyAgICAgICAgICAgICAg
IGdvdG8gc2tpcF9oZ2N0cmxfaW5pdDsKPiArCj4gICAgICAgICAvKiBGaWd1cmUtb3V0IG51bWJl
ciBvZiBiaXRzIGluIEhHRUlFICovCj4gICAgICAgICBjc3Jfd3JpdGUoQ1NSX0hHRUlFLCAtMVVM
KTsKPiAgICAgICAgIGhnY3RybC0+bnJfaGdlaSA9IGZsc19sb25nKGNzcl9yZWFkKENTUl9IR0VJ
RSkpOwo+IEBAIC02MzQsMTIgKzYzNywxMSBAQCB2b2lkIGt2bV9yaXNjdl9haWFfZW5hYmxlKHZv
aWQpCj4gICAgICAgICB9IHdoaWxlICghYXRvbWljX3RyeV9jbXB4Y2hnKCZrdm1fcmlzY3ZfYWlh
X25yX2hnZWksICZhaWFfbnJfaGdlaSwgaGdjdHJsLT5ucl9oZ2VpKSk7Cj4KPiAgICAgICAgIHJh
d19zcGluX2xvY2tfaXJxc2F2ZSgmaGdjdHJsLT5sb2NrLCBmbGFncyk7Cj4gLSAgICAgICBpZiAo
IWhnY3RybC0+ZnJlZV9iaXRtYXBfaW5pdGlhbGl6ZWQpIHsKPiAtICAgICAgICAgICAgICAgaGdj
dHJsLT5mcmVlX2JpdG1hcCA9IChoZ2N0cmwtPm5yX2hnZWkpID8gR0VOTUFTS19VTEwoaGdjdHJs
LT5ucl9oZ2VpLCAxKSA6IDA7Cj4gLSAgICAgICAgICAgICAgIGhnY3RybC0+ZnJlZV9iaXRtYXBf
aW5pdGlhbGl6ZWQgPSB0cnVlOwo+IC0gICAgICAgfQo+ICsgICAgICAgaGdjdHJsLT5mcmVlX2Jp
dG1hcCA9IChoZ2N0cmwtPm5yX2hnZWkpID8gR0VOTUFTS19VTEwoaGdjdHJsLT5ucl9oZ2VpLCAx
KSA6IDA7Cj4gKyAgICAgICBoZ2N0cmwtPmZyZWVfYml0bWFwX2luaXRpYWxpemVkID0gdHJ1ZTsK
PiAgICAgICAgIHJhd19zcGluX3VubG9ja19pcnFyZXN0b3JlKCZoZ2N0cmwtPmxvY2ssIGZsYWdz
KTsKPgo+ICtza2lwX2hnY3RybF9pbml0Ogo+ICAgICAgICAgY3NyX3dyaXRlKENTUl9IVklDVEws
IGFpYV9odmljdGxfdmFsdWUoZmFsc2UpKTsKPiAgICAgICAgIGNzcl93cml0ZShDU1JfSFZJUFJJ
TzEsIDB4MCk7Cj4gICAgICAgICBjc3Jfd3JpdGUoQ1NSX0hWSVBSSU8yLCAweDApOwo+Cj4gLS0t
Cj4gYmFzZS1jb21taXQ6IDkzZjUxNTc5ZTdkZjI0ODc4MDIxNDA5NDQxOGYyMDUyNTMzODNjYzUK
PiBjaGFuZ2UtaWQ6IDIwMjYwOTI0LWZyZWVfYml0bWFwX2luaXRpYWxpemVkLWFiZGM5NGE1Mjhm
Ygo+Cj4gQmVzdCByZWdhcmRzLAo+IC0tCj4gR1VPIFJlbiAoWHVhblRpZSkgPGd1b3JlbkBrZXJu
ZWwub3JnPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
