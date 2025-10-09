Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1366CCD183
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 16:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v3+mVrxVPPqrtvNFOjdlM2yY4pTgmyXXk3OLMcXzgIQ=; b=OW0on6bUnLqhpK
	h1yus4F8s5ebPT79KGwAmEJ3aVH/cGG8btfOZjAUqLBE4RMfnXQlS7F8e82yVQso+frs6oM3XyBKU
	8D/k/siXalyouVTiZ5tpSqAxpPSXwJQn/s8OQ7gixFmKodDUbWJSglQRIo+UIlnyKhY/xRgvqMkCC
	iV+COOoauuEVyzOTgh5OEi1UPaVGG9ZFr8GudcnpR1COcSTPC/ihZNcR/8jP7Cdu6/+qSJRyBZSQD
	p9heShSpnXwdQWtkGZMDmTwy7alunCwsrQnDdBV7u/qrLxNKOzfEaSMzIL64CC4ZmrTya2SIRycr1
	DCrx35yLkVpVFrcmpnjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6t3b-00000006bZc-3gRJ;
	Thu, 09 Oct 2025 15:59:55 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6t3Y-00000006bU9-1Yzp
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 15:59:54 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-57a604fecb4so1408213e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Oct 2025 08:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760025590; x=1760630390; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQBxmURKiGaN3QIqBhTff7pEbZ70mJ9TllMgftPCUcQ=;
        b=cZyEhQhMSD7X3uXeVIKIPHao30plBnq+20CatvCysbsJla9gICClJVAukc93fqDAcf
         EgdiWLujWg2rzz/PqNQUJuZYnV6ecXrhyIBLCVAqLBI8Q5jfnsU1A9abnOIZVoDiq+S+
         nOB6Z/ybvXYNWb5vRoQpvPG4G7z9PYoOuRQiKrvc/bau21EOrvTHQsSfIZ4Oi3+XxM4J
         CW8yF+D9zYUBfS+qSioxRImqOtwafbUsPdFGd9XRZUvKe4FRDq8aXL+QutojSH6319IX
         2xzFAOEjPOfoyIoBfpKz0KjnwWtWh3095e1mS0zRUgjkEvpfVbjGgknfK5hPEa9nro4j
         loiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760025590; x=1760630390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQBxmURKiGaN3QIqBhTff7pEbZ70mJ9TllMgftPCUcQ=;
        b=dyNid9wp66xzUtO7ithHoMcGbvRp3HFv720s+E1yn2zWsnTphsDDtBar95ElXQQEZl
         g2Gqg5Llz1O8HJSiSwzs+HRWHu/MDq3BW1aRpbzAzC5D+s6eqcbOTxk39gy6cEUym7aX
         OXStvqyLZx/NjuqumIR0Li5AG0/EusMmwLs2+oithunn2e6IIQnZAY2Fac19+CgTl1lD
         ZgGEPhDgyRyUZToHBVxzYmEg/SyZtHNXCHztg9XIer8QMObdk2iDUsJ2fDbqzTMysAjM
         KxyapF9u79yRS9jA1NCgTBI4Y7PhjJsF7twUzIqpP+CHrDRZXGE/Pv0eAvapMCiGbBED
         NhFA==
X-Forwarded-Encrypted: i=1; AJvYcCWtAmOJCnGhNfzF/zhvpNajPlQREKPMYNnFzHfs/bKJeCtfFQefFHehkO8WMik0EcTNDcM+5OgXyRGS4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLNDaJ+zduDMRLIamsaqW0kbLVO7hG3/Fu26lBxsjhWggKBbMb
	oC+Rp0z+fV0m/S1HDxSIcImkBlALW4tmY6ocbAz05kyU4ZTmfSENVGm//RwlSpFIrbsPZteOVnI
	6NHcy3EObduqUClESfh0D7Jb2RMuVqMU=
X-Gm-Gg: ASbGncs7nYeEP2iEnQoxTklRP4b5rbcQm/nl/zxmaubNel+D4bpbcBeGNmK7dES3OeA
	KmUwS/v3cLVYRkh0LSAXDrne6tEQRAaob+N9VsAvpfQ3AdDhlJo28P15u50DZaJP3Ldd7z0bK3S
	in6xMPG/1RR2krTD4bgpobTGxaOPPyHjIOpU/Wg+/mwuktY/6+h3a+Rp38wz2PvQXOkd/Y+XuJD
	l+SVPQc3224XLhcxtO/EzdFiEGqnYQ4sjA3/oedNw==
X-Google-Smtp-Source: AGHT+IFiOw5ablsLgUKfCaNuQJri4wcztl+zI4ly3LRjrgaXjzgOnqWcpR8ZMzuTHWFg5QDe7h9JoAEutSyQKhvfT4w=
X-Received: by 2002:a05:6512:1291:b0:57d:ffa4:56f4 with SMTP id
 2adb3069b0e04-5906dae5904mr2393608e87.41.1760025589415; Thu, 09 Oct 2025
 08:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250810125746.1105476-1-snovitoll@gmail.com> <20250810125746.1105476-2-snovitoll@gmail.com>
 <87ldmv6p5n.ritesh.list@gmail.com>
In-Reply-To: <87ldmv6p5n.ritesh.list@gmail.com>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Thu, 9 Oct 2025 20:59:32 +0500
X-Gm-Features: AS18NWAnJdcYDP3fsUmpv8ZuZnvVnkv1zMHsU4QWH3X3orZoE8748Ur0FWZohd0
Message-ID: <CACzwLxia6xMcQ=vsYG7SE+pUO8=4DiRWD_Omq3wzRyuhDjGcPQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] kasan: introduce ARCH_DEFER_KASAN and unify static
 key across modes
To: Ritesh Harjani <ritesh.list@gmail.com>
Cc: ryabinin.a.a@gmail.com, christophe.leroy@csgroup.eu, bhe@redhat.com, 
	hca@linux.ibm.com, andreyknvl@gmail.com, akpm@linux-foundation.org, 
	zhangqing@loongson.cn, chenhuacai@loongson.cn, davidgow@google.com, 
	glider@google.com, dvyukov@google.com, alexghiti@rivosinc.com, alex@ghiti.fr, 
	agordeev@linux.ibm.com, vincenzo.frascino@arm.com, elver@google.com, 
	kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_085952_433624_BC295340 
X-CRM114-Status: GOOD (  15.68  )
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

T24gVGh1LCBTZXAgNCwgMjAyNSBhdCA1OjM44oCvQU0gUml0ZXNoIEhhcmphbmkgPHJpdGVzaC5s
aXN0QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPgo+IE9ubHkgYm9vazNzNjQgbmVlZHMgc3RhdGljIGtl
eXMgaGVyZSBiZWNhdXNlIG9mIHJhZGl4IHYvcyBoYXNoIG1vZGUKPiBzZWxlY3Rpb24gZHVyaW5n
IHJ1bnRpbWUuIFRoZSBjaGFuZ2VzIGluIGFib3ZlIGZvciBwb3dlcnBjIGxvb2tzIGdvb2QgdG8K
PiBtZS4gSXQncyBhIG5pY2UgY2xlYW51cCB0b28uCj4KCkhlbGxvLApUaGFua3MgZm9yIHRoZSBy
ZXZpZXcgYW5kIHNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseS4gVGhpcyBoYXMgYWxyZWFkeQpiZWVu
IG1lcmdlZC4KQUZBSVUsIGluIGFyY2gvcG93ZXJwYy9LY29uZmlnCgpjb25maWcgUFBDCi4uLgog
ICAgICAgIHNlbGVjdCBBUkNIX05FRURTX0RFRkVSX0tBU0FOIGlmIFBQQ19SQURJWF9NTVUKCmFu
ZCBpbiBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL0tjb25maWcuY3B1dHlwZToKCmNvbmZpZyBQUENf
UkFESVhfTU1VCiAgICAgICAgYm9vbCAiUmFkaXggTU1VIFN1cHBvcnQiCiAgICAgICAgZGVwZW5k
cyBvbiBQUENfQk9PSzNTXzY0CiAgICAgICAgc2VsZWN0IEFSQ0hfSEFTX0dJR0FOVElDX1BBR0UK
ICAgICAgICBkZWZhdWx0IHkKClNvIHRoZSBLQVNBTiBzdGF0aWMga2V5IGlzIGVuYWJsZWQgb25s
eSBmb3IgUFBDX0JPT0szU182NCBieSB0aGlzCktjb25maWcgc2VsZWN0aW9uLgpJbiBvdGhlciBn
aXQgY2hhbmdlcyBsaWtlOgphcmNoL3Bvd2VycGMvbW0va2FzYW4vaW5pdF8zMi5jCmFyY2gvcG93
ZXJwYy9tbS9rYXNhbi9pbml0X2Jvb2szZV82NC5jCgosIHdoZXJlIHdlIGNhbGwga2FzYW5faW5p
dF9nZW5lcmljKCkgLT4ga2FzYW5fZW5hYmxlKCkgZG9lcyBub3RoaW5nIGJlY2F1c2UKQ09ORklH
X0FSQ0hfREVGRVJfS0FTQU4gaXMgbm90IHNlbGVjdGVkLgoKPiBTbyBmZWVsIGZyZWUgdG8gdGFr
ZToKPiBSZXZpZXdlZC1ieTogUml0ZXNoIEhhcmphbmkgKElCTSkgPHJpdGVzaC5saXN0QGdtYWls
LmNvbT4gI3Bvd2VycGMKPgo+IEhvd2V2ZXIgSSBoYXZlIGZldyBjb21tZW50cyBiZWxvdy4uLgo+
Cj4gPiBAQCAtMjQ2LDcgKzI1NSw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBwb2lzb25fc2xhYl9v
YmplY3Qoc3RydWN0IGttZW1fY2FjaGUgKmNhY2hlLCB2b2lkICpvYmplY3QsCj4gPiAgYm9vbCBf
X2thc2FuX3NsYWJfcHJlX2ZyZWUoc3RydWN0IGttZW1fY2FjaGUgKmNhY2hlLCB2b2lkICpvYmpl
Y3QsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGlwKQo+
ID4gIHsKPiA+IC0gICAgIGlmICgha2FzYW5fYXJjaF9pc19yZWFkeSgpIHx8IGlzX2tmZW5jZV9h
ZGRyZXNzKG9iamVjdCkpCj4gPiArICAgICBpZiAoaXNfa2ZlbmNlX2FkZHJlc3Mob2JqZWN0KSkK
Pgo+IEZvciBjaGFuZ2VzIGluIG1tL2thc2FuL2NvbW1vbi5jLi4geW91IGhhdmUgcmVtb3ZlZCAh
a2FzYW5fZW5hYmxlZCgpCj4gY2hlY2sgYXQgZmV3IHBsYWNlcy4gVGhpcyBzZWVtcyB0byBiZSBw
YXJ0aWFsIHJldmVydCBvZiBjb21taXQgWzFdOgo+Cj4gICBiM2MzNDI0NTc1NmFkYSAia2FzYW46
IGNhdGNoIGludmFsaWQgZnJlZSBiZWZvcmUgU0xVQiByZWluaXRpYWxpemVzIHRoZSBvYmplY3Qi
Cj4KPiBDYW4geW91IHBsZWFzZSBleHBsYWluIHdoeSB0aGlzIG5lZWRzIHRvIGJlIHJlbW92ZWQ/
CgprYXNhbl9hcmNoX2lzX3JlYWR5KCkgd2FzIHJlbW92ZWQgaGVyZSBiZWNhdXNlIGluCmNvbW1p
dCAxZTMzOGY0ZDk5ZTYoImthc2FuOiBpbnRyb2R1Y2UgQVJDSF9ERUZFUl9LQVNBTiBhbmQgdW5p
ZnkKc3RhdGljIGtleSBhY3Jvc3MgbW9kZXMiKQpJJ3ZlIHVuaWZpZWQgdGhlIGNoZWNrIHdpdGgg
a2FzYW5fZW5hYmxlZCgpIHdoaWNoIGlzIGFscmVhZHkgY2FsbGVkIGluCnRoZSBfX3dyYXBwZXIK
X19rYXNhbl9zbGFiX3ByZV9mcmVlIGluIGluY2x1ZGUvbGludXgva2FzYW4uaAoKPiBBbHNvIHRo
ZSBleHBsYWluYXRpb24gb2YgdGhlIHNhbWUgc2hvdWxkIGJlIGFkZGVkIGluIHRoZSBjb21taXQg
bXNnIHRvby4KPgo+IFsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwODA5LWth
c2FuLXRzYnJjdS12OC0xLWFlZjQ1OTNmOTUzMkBnb29nbGUuY29tLwo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
