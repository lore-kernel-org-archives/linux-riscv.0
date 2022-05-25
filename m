Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213CAC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 21:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=g73A6zvo4gkJwgbKUnv5bx4jrB2G16gU062Rly75oGw=; b=Yxn2vw+2TVo79DFMjOo1SOwelY
	h0zuSjZBCARI574dUhO7tcm04Xl1EUrPxxxB61kqJauU8Sqow4TBdZiC+7aOfj/Mn0O6sl3xmUfsw
	mwkdFLUgHf+VARAT26R8wuqVTEp0suWkvBMRhl0o0FlDbJat2GyZ0MnP84Ggvyq/IqV5pc93UaOWk
	D2P8xJfGU0h7Wba6J8npRQpmZR5WuTy8EOPh2a58pbqdwyQXZlrw4OTROU0Le2g0hlHjviFPhGV3b
	BasHDxq/5fBDLUgIz3dN3FfC/AKPiuH3r9vtEXEMZO9jnzC/Ce6eNYIHuUhSKsJoHnmih0wwfwcnT
	mLyTUs2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntyeN-00CkYh-32; Wed, 25 May 2022 21:34:39 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntyeJ-00CkXY-KU
	for linux-riscv@lists.infradead.org; Wed, 25 May 2022 21:34:37 +0000
Received: by mail-pj1-x102d.google.com with SMTP id cv10so63579pjb.4
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 14:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=kPNpHNPesicxzaCcEtEsWOLOzkBCoEdcbvtndvUitaI=;
        b=GZJ6r6hGPK0878azss/NiKgNXXS1INfpKbEe6Femzd30Ooi7j1VXIikHfRMVoq6p9R
         yeYCIaiFCxQ0kKm8dHub+AExEfHt1M2nb04Ve3Xe6lGjXDkvbfXRZqitEjfneyLGVx+b
         PZXY8LkVwv3/T85hUnODR7FpzQ+8176jKYbaJ7RRQ5CGtFKsyb1uJOl6IJWJ9cSjZATr
         +tAI3PuK3PShNHQLKy0TPikyysz0ahP6i1X6ezZhKXSEa4Tu3lAVBvy9aWdAHkNmPt6Z
         jMTLgNI+io3vgJsQqikiK/HULD37O+TiNF19fb7DRwZA8H5MrrAuZB6435xh4UBLXHTo
         Xl8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=kPNpHNPesicxzaCcEtEsWOLOzkBCoEdcbvtndvUitaI=;
        b=0pYhAM7fsR4yNKq5UkzA10gyLeh46UbZiW5oTtP6NyDBxsSh2lV/zrovDQHdJy4fZR
         wvMUamgo1T+j3A5dJjwUvwYO4OfbaggQFtHThN7A/Yo3TT9WPufJ6spgrYY8LPOOjZn5
         VD0JExTj4VhUUrm9GvnTRAglA3o4mw2+h+x5IwOE2Q8w8hSs0DrolIJk89V8c7SgwW/K
         G5JeTLeV7hTr/nzwu8w/+T9QpM05THfk8sW2vOYYzZ7JRPYGxGLpA7gHs7JpGULENOKz
         E+bIGi1Xp8LNfc/iMZy/JTLdNfzzUCaDQ9gTslY1Y6spfeXrkYvrh7ge3rzzTfInLo9N
         PESA==
X-Gm-Message-State: AOAM532ZDKsKJD4yXdwsudW2xlUKn8Wl0ZitB29Xf0k9SrBxJ2J1Xr/6
	UmS9SbYPWu6a9wH1nffSj2nojQ==
X-Google-Smtp-Source: ABdhPJz/LdGkcESESmnRNERZMScRzqZEi9Ypwrp2YHAI9fkbGLI/uwQgRWDQXU/lIlswtxfVlWycTw==
X-Received: by 2002:a17:90b:1b42:b0:1df:f6bb:aa2b with SMTP id nv2-20020a17090b1b4200b001dff6bbaa2bmr12798436pjb.99.1653514470426;
        Wed, 25 May 2022 14:34:30 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id n24-20020a170902969800b0015e8d4eb2e0sm9799934plp.298.2022.05.25.14.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 14:34:29 -0700 (PDT)
Date: Wed, 25 May 2022 14:34:29 -0700 (PDT)
X-Google-Original-Date: Wed, 25 May 2022 14:34:28 PDT (-0700)
Subject: Re: [PATCH] riscv: compat: Using seperated vdso_maps for compat_vdso_info
In-Reply-To: <a0bffec3-cf43-417e-3804-9248325266c3@roeck-us.net>
CC: guoren@kernel.org, Arnd Bergmann <arnd@arndb.de>, heiko@sntech.de,
  linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
  guoren@linux.alibaba.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux@roeck-us.net
Message-ID: <mhng-b37ccc06-67ad-4fd8-bcdb-0e5c9e5a4750@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_143435_709476_851D1C47 
X-CRM114-Status: GOOD (  16.52  )
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

T24gV2VkLCAyNSBNYXkgMjAyMiAxNDoxNTowMyBQRFQgKC0wNzAwKSwgbGludXhAcm9lY2stdXMu
bmV0IHdyb3RlOgo+IE9uIDUvMjUvMjIgMDk6MDQsIGd1b3JlbkBrZXJuZWwub3JnIHdyb3RlOgo+
PiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4+Cj4+IFRoaXMgaXMg
YSBmaXh1cCBmb3IgdmRzbyBpbXBsZW1lbnRhdGlvbiB3aGljaCBjYXVzZWQgbXVzbCB0bwo+PiBm
YWlsLgo+Pgo+PiBbICAgMTEuNjAwMDgyXSBSdW4gL3NiaW4vaW5pdCBhcyBpbml0IHByb2Nlc3MK
Pj4gWyAgIDExLjYyODU2MV0gaW5pdFsxXTogdW5oYW5kbGVkIHNpZ25hbCAxMSBjb2RlIDB4MSBh
dAo+PiAweDAwMDAwMDAwMDAwMDAwMDAgaW4gbGliYy5zb1tmZmZmZmY4YWQzOTAwMCthNDAwMF0K
Pj4gWyAgIDExLjYyOTM5OF0gQ1BVOiAwIFBJRDogMSBDb21tOiBpbml0IE5vdCB0YWludGVkCj4+
IDUuMTguMC1yYzctbmV4dC0yMDIyMDUyMCAjMQo+PiBbICAgMTEuNjI5NDYyXSBIYXJkd2FyZSBu
YW1lOiByaXNjdi12aXJ0aW8scWVtdSAoRFQpCj4+IFsgICAxMS42Mjk1NDZdIGVwYyA6IDAwZmZm
ZmZmOGFkYTExMDAgcmEgOiAwMGZmZmZmZjhhZGExM2M4IHNwIDoKPj4gMDBmZmZmZmZjNTgxOTlm
MAo+PiBbICAgMTEuNjI5NTg2XSAgZ3AgOiAwMGZmZmZmZjhhZDM5MDAwIHRwIDogMDBmZmZmZmY4
YWRlMDk5OCB0MCA6Cj4+IGZmZmZmZmZmZmZmZmZmZmYKPj4gWyAgIDExLjYyOTU5OF0gIHQxIDog
MDBmZmZmZmZjNTgxOWZkMCB0MiA6IDAwMDAwMDAwMDAwMDAwMDAgczAgOgo+PiAwMGZmZmZmZjhh
ZGUwY2MwCj4+IFsgICAxMS42Mjk2MTBdICBzMSA6IDAwZmZmZmZmOGFkZTBjYzAgYTAgOiAwMDAw
MDAwMDAwMDAwMDAwIGExIDoKPj4gMDBmZmZmZmZjNTgxOWEwMAo+PiBbICAgMTEuNjI5NjIyXSAg
YTIgOiAwMDAwMDAwMDAwMDAwMDAxIGEzIDogMDAwMDAwMDAwMDAwMDAxZSBhNCA6Cj4+IDAwZmZm
ZmZmYzU4MTliMDAKPj4gWyAgIDExLjYyOTYzNF0gIGE1IDogMDBmZmZmZmZjNTgxOWIwMCBhNiA6
IDAwMDAwMDAwMDAwMDAwMDAgYTcgOgo+PiAwMDAwMDAwMDAwMDAwMDAwCj4+IFsgICAxMS42Mjk2
NDVdICBzMiA6IDAwZmZmZmZmOGFkZTBhYzggczMgOiAwMGZmZmZmZjhhZGUwZWM4IHM0IDoKPj4g
MDBmZmZmZmY4YWRlMDcyOAo+PiBbICAgMTEuNjI5NjU2XSAgczUgOiAwMGZmZmZmZjhhZGUwYTkw
IHM2IDogMDAwMDAwMDAwMDAwMDAwMCBzNyA6Cj4+IDAwZmZmZmZmYzU4MTllNDAKPj4gWyAgIDEx
LjYyOTY2N10gIHM4IDogMDBmZmZmZmY4YWRlMGNhMCBzOSA6IDAwZmZmZmZmOGFkZGJhNTAgczEw
Ogo+PiAwMDAwMDAwMDAwMDAwMDAwCj4+IFsgICAxMS42Mjk2NzhdICBzMTE6IDAwMDAwMDAwMDAw
MDAwMDAgdDMgOiAwMDAwMDAwMDAwMDAwMDAyIHQ0IDoKPj4gMDAwMDAwMDAwMDAwMDAwMQo+PiBb
ICAgMTEuNjI5Njg4XSAgdDUgOiAwMDAwMDAwMDAwMDIwMDAwIHQ2IDogZmZmZmZmZmZmZmZmZmZm
Zgo+PiBbICAgMTEuNjI5Njk5XSBzdGF0dXM6IDAwMDAwMDAwMDAwMDQwMjAgYmFkYWRkcjogMDAw
MDAwMDAwMDAwMDAwMAo+PiBjYXVzZTogMDAwMDAwMDAwMDAwMDAwZAo+Pgo+PiBUaGUgbGFzdCBf
X3Zkc29faW5pdCgmY29tcGF0X3Zkc29faW5mbykgcmVwbGFjZXMgdGhlIGRhdGEgaW4gbm9ybWFs
Cj4+IHZkc29faW5mby4gVGhpcyBpcyBhbiBvYnZpb3VzIGJ1Zy4KPj4KPj4gUmVwb3J0ZWQtYnk6
IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4KPj4gU2lnbmVkLW9mZi1ieTogR3Vv
IFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVu
IDxndW9yZW5Aa2VybmVsLm9yZz4KPj4gQ2M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVs
dC5jb20+Cj4+IENjOiBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250ZWNoLmRlPgo+Cj4gVGVzdGVk
LWJ5OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+CgpTb3JyeSBJJ20gYSBiaXQg
YnVyaWVkIHJpZ2h0IG5vdywgdGhpcyBpcyBmaXhpbmcgdGhlIGlzc3VlIHlvdSBwb2ludGVkIApv
dXQgZWFybGllcj8KCj4KPj4gLS0tCj4+ICAgYXJjaC9yaXNjdi9rZXJuZWwvdmRzby5jIHwgMTUg
KysrKysrKysrKysrKy0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvLmMg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvLmMKPj4gaW5kZXggNTBmZTRjODc3NjAzLi42OWIwNWI2
YzE4MWIgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28uYwo+PiArKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC92ZHNvLmMKPj4gQEAgLTIwNiwxMiArMjA2LDIzIEBAIHN0YXRpYyBz
dHJ1Y3QgX192ZHNvX2luZm8gdmRzb19pbmZvIF9fcm9fYWZ0ZXJfaW5pdCA9IHsKPj4gICB9Owo+
Pgo+PiAgICNpZmRlZiBDT05GSUdfQ09NUEFUCj4+ICtzdGF0aWMgc3RydWN0IHZtX3NwZWNpYWxf
bWFwcGluZyBydl9jb21wYXRfdmRzb19tYXBzW10gX19yb19hZnRlcl9pbml0ID0gewo+PiArCVtS
Vl9WRFNPX01BUF9WVkFSXSA9IHsKPj4gKwkJLm5hbWUgICA9ICJbdnZhcl0iLAo+PiArCQkuZmF1
bHQgPSB2dmFyX2ZhdWx0LAo+PiArCX0sCj4+ICsJW1JWX1ZEU09fTUFQX1ZEU09dID0gewo+PiAr
CQkubmFtZSAgID0gIlt2ZHNvXSIsCj4+ICsJCS5tcmVtYXAgPSB2ZHNvX21yZW1hcCwKPj4gKwl9
LAo+PiArfTsKPj4gKwo+PiAgIHN0YXRpYyBzdHJ1Y3QgX192ZHNvX2luZm8gY29tcGF0X3Zkc29f
aW5mbyBfX3JvX2FmdGVyX2luaXQgPSB7Cj4+ICAgCS5uYW1lID0gImNvbXBhdF92ZHNvIiwKPj4g
ICAJLnZkc29fY29kZV9zdGFydCA9IGNvbXBhdF92ZHNvX3N0YXJ0LAo+PiAgIAkudmRzb19jb2Rl
X2VuZCA9IGNvbXBhdF92ZHNvX2VuZCwKPj4gLQkuZG0gPSAmcnZfdmRzb19tYXBzW1JWX1ZEU09f
TUFQX1ZWQVJdLAo+PiAtCS5jbSA9ICZydl92ZHNvX21hcHNbUlZfVkRTT19NQVBfVkRTT10sCj4+
ICsJLmRtID0gJnJ2X2NvbXBhdF92ZHNvX21hcHNbUlZfVkRTT19NQVBfVlZBUl0sCj4+ICsJLmNt
ID0gJnJ2X2NvbXBhdF92ZHNvX21hcHNbUlZfVkRTT19NQVBfVkRTT10sCj4+ICAgfTsKPj4gICAj
ZW5kaWYKPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
