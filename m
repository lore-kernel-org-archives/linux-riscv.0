Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CCBE66882
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 18:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+O5s1wOQGfIcwcCxzyURpXn+XMlGOYmnBo55fdQ6bOo=; b=0gJqHsYz17BbhI
	X8TCvyyXFLUOLGbLpEvcwWUumhhLjUj/l43GVTWCqmWaWl0zlla5yArwiZJ0Zexy73luFMDN4ilQR
	NK0TTACTcwJ1sJP+jCWnj4le7ym4gPdtTMftX+eru0uris/NO2iqk3AN1PpOFhg42EpU72eaY60q3
	qUfqTSfWY3XUmz3U+pfG0ykTdsJxl3Q+aL8qGFEh0rMKFw/ilBTTAi6u1jR7SDzIEgyDBJR8S4eyD
	Pu/K5e9xZO4rT+PERPlCY8d01uZ3enAMTdim8rNuUxSUdpXtREDapxssPhEIGH+0FuP6g+m3Br1mE
	/LDtzJy3g5Nyxkhjwtag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWfAt-0000000ApdJ-0SIk;
	Fri, 19 Dec 2025 18:25:59 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWfAq-0000000ApcS-35ji
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 18:25:58 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-34c1d84781bso2307227a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Dec 2025 10:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766168756; x=1766773556; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XhOF0P3TA0VgAlDrFuCfFc13aLzGhlFUkxGfezQClao=;
        b=een+PsPuOdmstbigNSjogiOGpbolky5Q5d4o6NiMFg2Amk7ZYQTmr2c/jgXb1OLSMY
         2nEd+1fEZ3THLHJVr8MOoaA17+gFlwZ4gM2f3pSJ7KppUKq1MPjQzL5irbu5t0W5VJoj
         tQOF5he337nl+ZNyxM5Z3ZcHGPstiTxRdh4xUxr4Hd7ulNIFSZbXQahSBTa61aMsPrex
         usWunTZFdG5ivhlgdrORuwcAdMYcw5pAlbucAB8wkAvrisbjVHmg2p4p7Ke9PE6Rf6vv
         8dXPE2FGwqna9GvK8kvpjcsUJHQdXJ5xCGindvzFH1ujaJhGvdQy8CV2JYON268Xtu6j
         4g+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766168756; x=1766773556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XhOF0P3TA0VgAlDrFuCfFc13aLzGhlFUkxGfezQClao=;
        b=Ut8KMn38KnSoGUYIoQjOTiHnHa743xK+ASCmrlSNDhc8BjpHcYgY+x7ZLGRpC/EnW6
         21o3Kq+sx/f6zrMAO45D1Sp1P0iY4VC/4cPmCnv6rvSWrZTuMhDj4TBD58SJqiocWy4P
         lwcWiEVgLCxQmgyeYtir/J4RknsP8oxkz3zYF0ALjgcKLeiwakBHHu6fTaKb7Ldw5H3e
         zEaEWBY7/+6un/XRrJZLkuo2bJCTzObeLoUn8gEwspVS463qQ7Y7EnLZkL+SbHhZ+gyp
         T8nWdReCo+e3Mv04awITuEKSJtTxZB5IJSKBm70PkRuy87kgq6D27h+aT40I/5ZPPq2t
         h67g==
X-Forwarded-Encrypted: i=1; AJvYcCVgcZUqqNC7M15buT2ymo42m02Hl8kQK9ppellv+zAaz8gyEOGGgnFt4JVhOxbwqnHCWBWoo2YcpGVqZA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4lxVMJCu+fnP7tYHG6nHifC40Dv/feiBNJyYIhl/cj9v2uCH2
	CXXWnvuBF2JLh5w9XmghZl1ZLRvh7IkyIU8gcwuRSLv3NQLQvvy0fT3HZnKgU6wTdVv+PPUUrx4
	GNTORBF0tCZ2QKSv/5ijcQIig57BE0kQ=
X-Gm-Gg: AY/fxX5ADleGjOwa6Dm4y/KlAnWIsB1DaHrVcupIzDjapF5MHUiS34D7QD3vzsxSoWH
	8XRpIt0ei39/UwSZ7E9fmDSM3G4zACEiRs6avcknseq1x2skGeSVZHxwJxJZqE+Fj+IOvST7PS0
	ZPS1USHRwg92OOeMO1Fk+h2ARTBmwh6OR4Zx4L0E6Hlvji5AxL4VE86RM40RnP+b4ubmO3lo0nz
	09mwGfHfzE4A16IdPj7EDgeEPsGPlaVL6hEAkw6DnPpO1xvaG8CT7ddkQ+pX+c88Xf/+Ec=
X-Google-Smtp-Source: AGHT+IFuZfvNJXvZZS1HlXgeccWILgULSwglw3eIa/khx/+P2XVIx6KJc41o3vOxdOWREz5fU9uuGgyPMLJj08pU8Cg=
X-Received: by 2002:a17:90b:2246:b0:32e:4924:6902 with SMTP id
 98e67ed59e1d1-34e921137a3mr3620243a91.3.1766168755839; Fri, 19 Dec 2025
 10:25:55 -0800 (PST)
MIME-Version: 1.0
References: <20251219124748.81133-1-dongml2@chinatelecom.cn> <CAEf4BzZBoHvB0yY740zyZWYKAgCeTXjLvfJUebq5FRWmq=WBZA@mail.gmail.com>
In-Reply-To: <CAEf4BzZBoHvB0yY740zyZWYKAgCeTXjLvfJUebq5FRWmq=WBZA@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 19 Dec 2025 10:25:44 -0800
X-Gm-Features: AQt7F2pTD0PSroW9LtfM60H5vTK6kRKR-Lv2ixQmUmiXylMqKmxZFDM9yicG5Vg
Message-ID: <CAEf4BzYzenxqVUty4RL15fVBR_bNLLgMAWHeMUyDkAeWWqbYug@mail.gmail.com>
Subject: Re: [PATCH bpf] riscv, bpf: fix incorrect usage of BPF_TRAMP_F_ORIG_STACK
To: Menglong Dong <menglong8.dong@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, bjorn@kernel.org, 
	pulehui@huawei.com, puranjay@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, jiang.biao@linux.dev, 
	bpf@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_102556_775573_E11F9835 
X-CRM114-Status: GOOD (  19.96  )
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

T24gRnJpLCBEZWMgMTksIDIwMjUgYXQgMTA6MDbigK9BTSBBbmRyaWkgTmFrcnlpa28KPGFuZHJp
aS5uYWtyeWlrb0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBEZWMgMTksIDIwMjUgYXQg
Njo0M+KAr0FNIE1lbmdsb25nIERvbmcgPG1lbmdsb25nOC5kb25nQGdtYWlsLmNvbT4gd3JvdGU6
Cj4gPgo+ID4gVGhlIHVzYWdlIG9mIEJQRl9UUkFNUF9GX09SSUdfU1RBQ0sgaW4gX19hcmNoX3By
ZXBhcmVfYnBmX3RyYW1wb2xpbmUoKSBpcwo+ID4gd3JvbmcsIGFuZCBpdCBzaG91bGQgYmUgQlBG
X1RSQU1QX0ZfQ0FMTF9PUklHLCB3aGljaCBjYXVzZWQgY3Jhc2ggYXMKPiA+IEFuZHJlYXMgcmVw
b3J0ZWQ6Cj4gPgo+ID4gICBJbnN1ZmZpY2llbnQgc3RhY2sgc3BhY2UgdG8gaGFuZGxlIGV4Y2Vw
dGlvbiEKPiA+ICAgVGFzayBzdGFjazogICAgIFsweGZmMjAwMDAwMDAwMTAwMDAuLjB4ZmYyMDAw
MDAwMDAxNDAwMF0KPiA+ICAgT3ZlcmZsb3cgc3RhY2s6IFsweGZmNjAwMDAwZmZkYWQwNzAuLjB4
ZmY2MDAwMDBmZmRhZTA3MF0KPiA+ICAgQ1BVOiAxIFVJRDogMCBQSUQ6IDEgQ29tbTogc3lzdGVt
ZCBOb3QgdGFpbnRlZCA2LjE4LjAtcmM1KyAjMTUgUFJFRU1QVCh2b2x1bnRhcnkpCj4gPiAgIEhh
cmR3YXJlIG5hbWU6IHJpc2N2LXZpcnRpbyBxZW11L3FlbXUsIEJJT1MgMjAyNS4xMCAxMC8wMS8y
MDI1Cj4gPiAgIGVwYyA6IGNvcHlfZnJvbV9rZXJuZWxfbm9mYXVsdCsweGEvMHgxOTgKPiA+ICAg
IHJhIDogYnBmX3Byb2JlX3JlYWRfa2VybmVsKzB4MjAvMHg2MAo+ID4gICBlcGMgOiBmZmZmZmZm
ZjgwMmI3MzJhIHJhIDogZmZmZmZmZmY4MDFlNjA3MCBzcCA6IGZmMjAwMDAwMDAwMGZmZTAKPiA+
ICAgIGdwIDogZmZmZmZmZmY4MjI2MmVkMCB0cCA6IDAwMDAwMDAwMDAwMDAwMDAgdDAgOiBmZmZm
ZmZmZjgwMDIyMzIwCj4gPiAgICB0MSA6IGZmZmZmZmZmODAxZTYwNTYgdDIgOiAwMDAwMDAwMDAw
MDAwMDAwIHMwIDogZmYyMDAwMDAwMDAxMDA0MAo+ID4gICAgczEgOiAwMDAwMDAwMDAwMDAwMDA4
IGEwIDogZmYyMDAwMDAwMDAxMDA1MCBhMSA6IGZmNjAwMDAwODNiM2QzMjAKPiA+ICAgIGEyIDog
MDAwMDAwMDAwMDAwMDAwOCBhMyA6IDAwMDAwMDAwMDAwMDAwOTcgYTQgOiAwMDAwMDAwMDAwMDAw
MDAwCj4gPiAgICBhNSA6IDAwMDAwMDAwMDAwMDAwMDAgYTYgOiAwMDAwMDAwMDAwMDAwMDIxIGE3
IDogMDAwMDAwMDAwMDAwMDAwMwo+ID4gICAgczIgOiBmZjIwMDAwMDAwMDEwMDUwIHMzIDogZmY2
MDAwMDA4NDU5ZmMxOCBzNCA6IGZmNjAwMDAwODNiM2QzNDAKPiA+ICAgIHM1IDogZmYyMDAwMDAw
MDAxMDA2MCBzNiA6IDAwMDAwMDAwMDAwMDAwMDAgczcgOiBmZjIwMDAwMDAwMDEzYWE4Cj4gPiAg
ICBzOCA6IDAwMDAwMDAwMDAwMDAwMDAgczkgOiAwMDAwMDAwMDAwMDA4MDAwIHMxMDogMDAwMDAw
MDAwMDU4ZGNiMAo+ID4gICAgczExOiAwMDAwMDAwMDAwNThkY2E3IHQzIDogMDAwMDAwMDA2OTI1
MTE2ZCB0NCA6IGZmNjAwMDAwODA5MGYwMjYKPiA+ICAgIHQ1IDogMDAwMDdmZmY5YjBjYmFhOCB0
NiA6IDAwMDAwMDAwMDAwMDAwMTYKPiA+ICAgc3RhdHVzOiAwMDAwMDAwMjAwMDAwMTIwIGJhZGFk
ZHI6IDAwMDAwMDAwMDAwMDAwMDAgY2F1c2U6IDgwMDAwMDAwMDAwMDAwMDUKPiA+ICAgS2VybmVs
IHBhbmljIC0gbm90IHN5bmNpbmc6IEtlcm5lbCBzdGFjayBvdmVyZmxvdwo+ID4gICBDUFU6IDEg
VUlEOiAwIFBJRDogMSBDb21tOiBzeXN0ZW1kIE5vdCB0YWludGVkIDYuMTguMC1yYzUrICMxNSBQ
UkVFTVBUKHZvbHVudGFyeSkKPiA+ICAgSGFyZHdhcmUgbmFtZTogcmlzY3YtdmlydGlvIHFlbXUv
cWVtdSwgQklPUyAyMDI1LjEwIDEwLzAxLzIwMjUKPiA+ICAgQ2FsbCBUcmFjZToKPiA+ICAgWzxm
ZmZmZmZmZjgwMDFhMWY4Pl0gZHVtcF9iYWNrdHJhY2UrMHgyOC8weDM4Cj4gPiAgIFs8ZmZmZmZm
ZmY4MDAwMjUwMj5dIHNob3dfc3RhY2srMHgzYS8weDUwCj4gPiAgIFs8ZmZmZmZmZmY4MDAxMjJi
ZT5dIGR1bXBfc3RhY2tfbHZsKzB4NTYvMHg4MAo+ID4gICBbPGZmZmZmZmZmODAwMTIzMDA+XSBk
dW1wX3N0YWNrKzB4MTgvMHgyMgo+ID4gICBbPGZmZmZmZmZmODAwMDJhYmU+XSB2cGFuaWMrMHhm
Ni8weDMyOAo+ID4gICBbPGZmZmZmZmZmODAwMDJkMmU+XSBwYW5pYysweDNlLzB4NDAKPiA+ICAg
WzxmZmZmZmZmZjgwMDE5ZWYwPl0gaGFuZGxlX2JhZF9zdGFjaysweDk4LzB4YTAKPiA+ICAgWzxm
ZmZmZmZmZjgwMWU2MDcwPl0gYnBmX3Byb2JlX3JlYWRfa2VybmVsKzB4MjAvMHg2MAo+ID4KPiA+
IEp1c3QgZml4IGl0Lgo+ID4KPiA+IEZpeGVzOiA0N2M5MjE0ZGNiZWEgKCJicGY6IGZpeCB0aGUg
dXNhZ2Ugb2YgQlBGX1RSQU1QX0ZfU0tJUF9GUkFNRSIpCj4gPiBSZXBvcnRlZC1ieTogQW5kcmVh
cyBTY2h3YWIgPHNjaHdhYkBsaW51eC1tNjhrLm9yZz4KPiA+IENsb3NlczogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYnBmLzg3NGlwbmtmdnQuZnNmQGlnZWwuaG9tZS8KPiA+IFNpZ25lZC1vZmYt
Ynk6IE1lbmdsb25nIERvbmcgPGRvbmdtbDJAY2hpbmF0ZWxlY29tLmNuPgo+ID4gLS0tCj4gPiAg
YXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29t
cDY0LmMKPiA+IGluZGV4IDVmOTQ1N2U5MTBlOC4uMDliNzBiZjM2MmQzIDEwMDY0NAo+ID4gLS0t
IGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9u
ZXQvYnBmX2ppdF9jb21wNjQuYwo+ID4gQEAgLTExMzQsNyArMTEzNCw3IEBAIHN0YXRpYyBpbnQg
X19hcmNoX3ByZXBhcmVfYnBmX3RyYW1wb2xpbmUoc3RydWN0IGJwZl90cmFtcF9pbWFnZSAqaW0s
Cj4gPiAgICAgICAgIHN0b3JlX2FyZ3MobnJfYXJnX3Nsb3RzLCBhcmdzX29mZiwgY3R4KTsKPiA+
Cj4gPiAgICAgICAgIC8qIHNraXAgdG8gYWN0dWFsIGJvZHkgb2YgdHJhY2VkIGZ1bmN0aW9uICov
Cj4gPiAtICAgICAgIGlmIChmbGFncyAmIEJQRl9UUkFNUF9GX09SSUdfU1RBQ0spCj4gPiArICAg
ICAgIGlmIChmbGFncyAmIEJQRl9UUkFNUF9GX0NBTExfT1JJRykKPiA+ICAgICAgICAgICAgICAg
ICBvcmlnX2NhbGwgKz0gUlZfRkVOVFJZX05JTlNOUyAqIDQ7Cj4gPgo+ID4gICAgICAgICBpZiAo
ZmxhZ3MgJiBCUEZfVFJBTVBfRl9DQUxMX09SSUcpIHsKPgo+IG1vdmUgb3JpZ19jYWxsIGhlcmUs
IGl0J3MgdGhlIHNhbWUgZmxhZ3MgJiBCUEZfVFJBTVBfRl9DQUxMX09SSUcgY2hlY2ssIG5vPwo+
CgphaCwgbmV2ZXIgbWluZCwgSSBzZWUgeW91IHNlbmQgdjIgYWRqdXN0aW5nIHRoaXMKCj4gPiAt
LQo+ID4gMi41Mi4wCj4gPgo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
