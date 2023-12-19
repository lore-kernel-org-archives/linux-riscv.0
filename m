Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AB2C41535
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 09:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lg+rRhI+HPn0D5/YFKZX1M5+3/I1nDv3VKeFyoXmVvo=; b=oP7nPxK63AbVDG
	fJ9+cainyjqxTJtrjhydOWXw4c5ub7Pw64SV4mFawGjw53y9mzKJJnbKasz6ZpwgUni/8lW7z7Sv0
	l4B5CUEFO+xuerZMOkxO24MiT8yVoPsYRSDN/K/dxDyprBNqkEzt7FN/WmK0ftthMUlqi46unIibu
	nsQcACdUnXILoKUucD/ZAW736DjVhB+LEgzhsDMXVdGQe5X7BgLRIi1VnyYErQh/Y38MCbrw+6V+Q
	a3oXqdLSn/C5XOnKX7CKKaMiiSrg+g7hvsBGvc6bFsrY+JM/VUZ0HH4nQGxSYemqt90uD5LwDhIjD
	bWuYwwsIgh4R7kWUwXhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFWsN-00DWKq-1h;
	Tue, 19 Dec 2023 09:58:59 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFWsK-00DWJk-2y
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 09:58:58 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50e270639d9so3949757e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 01:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702979935; x=1703584735; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Be5w6skDNdE5/lducA2Bgr0EeO2/DM+xwE7s1ZuJDWM=;
        b=LxP2jVlrmDHp0Uf/nynobiu1Sdwzih9XFAzhKdi0GxRbkP+M8EaEQhkEQUWsvE0HbX
         9CMc1KwNvykGX2viDxW0JZZn3cSEqQqh3obDodFy2yq7ckarlA9QBvmfvHiVoDeKh5Ef
         VjVDYMo+oqmZ3M8Ux3pUKPtHwihhp/NHKZ778sYBHhGf2EfSaTarp8dR4BQOZ1VT/ZOc
         QRKje1Um5vDoJZQBVKJD7yDNUgxf/gU2uFAFL3OOpL2wwCBlONYvMZP6NLhSsuZm1Rz/
         EISJQ3PTZMZYJz8Cug5zb/JzlfawudcMvfrQLmHkiSh2BgvlRhcGq7N/9Xuk9KJixuTl
         a5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702979935; x=1703584735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Be5w6skDNdE5/lducA2Bgr0EeO2/DM+xwE7s1ZuJDWM=;
        b=TRjzv1iH5c8WBBnWVL2QjfKaJ4Tn9IH8DRrIVh/PpRGvE2iALgBoWf1dOiXplOdq0G
         upJvmAppImZp5wh9afpvVl5BhudeYCkY/R3N3spfnDF5qtar0eewhA25meLIoati/HBp
         QDu+NnZYx6TrHNXPiuY19CNOQ6EA+SzglksqmneHhfEXsIBWLArihQjm0Uoj4nO9y3K6
         oyhnfRqTQIjyVh4a/RcoQC/NffieQeZOa1TKoKljD4RzbBR3SkpJ4PwtOaHIGLtM2lfw
         jQqW27ANa1PE1BgwvxB8Jv6IMqmS6CJ8ZLsaMRevH2wc3WcNjCjQNWJCwFD0VD/qbbo0
         wm9g==
X-Gm-Message-State: AOJu0YyVBYZbR0Y9NzpzS4CgDnG/JjFNL50vflu8cR24LqEOgABQHeDd
	7iOc2TbuKsue3p94lKEBDt+M1OQ8w1zpRc2SrIm1Dg==
X-Google-Smtp-Source: AGHT+IEvlhHARntFp0l59G+WahVWuKq+SmDpa24xurfIhDrYFtfAgxe6XQ+OTzUUzhxvDPJuDy0b1F8OpgiGcNcfjTs=
X-Received: by 2002:ac2:4ec4:0:b0:50e:3e3d:217c with SMTP id
 p4-20020ac24ec4000000b0050e3e3d217cmr973648lfr.84.1702979934825; Tue, 19 Dec
 2023 01:58:54 -0800 (PST)
MIME-Version: 1.0
References: <20231214155721.1753-1-andy.chiu@sifive.com> <20231214155721.1753-6-andy.chiu@sifive.com>
 <ZXvxbbBWXqIy/05b@ghost>
In-Reply-To: <ZXvxbbBWXqIy/05b@ghost>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 19 Dec 2023 17:58:43 +0800
Message-ID: <CABgGipU7a1oAMaXcb6VwkMAwVnLngks5CZ3CX3=Ew3X7H=z5tA@mail.gmail.com>
Subject: Re: [v5, 5/6] riscv: lib: vectorize copy_to_user/copy_from_user
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	greentime.hu@sifive.com, guoren@linux.alibaba.com, bjorn@kernel.org, 
	ardb@kernel.org, arnd@arndb.de, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Han-Kuan Chen <hankuan.chen@sifive.com>, 
	Heiko Stuebner <heiko@sntech.de>, Aurelien Jarno <aurelien@aurel32.net>, Bo YU <tsu.yubo@gmail.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_015857_043328_3F16EF5E 
X-CRM114-Status: GOOD (  21.17  )
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

T24gRnJpLCBEZWMgMTUsIDIwMjMgYXQgMjoyNeKAr1BNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+IE9uIFRodSwgRGVjIDE0LCAyMDIzIGF0IDAzOjU3OjIw
UE0gKzAwMDAsIEFuZHkgQ2hpdSB3cm90ZToKPiA+ICsgICAgIGxhICAgICAgdDAsIHJpc2N2X3Zf
dXNlcmNvcHlfdGhyZXMKPiA+ICsgICAgIFJFR19MICAgdDAsICh0MCkKPgo+IFRoZSBhc3NlbWJs
ZXIgZG9lcyBzb21ldGhpbmcgcmVhbGx5IHNpbGx5IGhlcmUgaXQgc2VlbXMuIFdpdGggYm90aAo+
IGJpbnV0aWxzIDIuNDEgYW5kIGNsYW5nIDE4IHRoZSBmb2xsb3dpbmcgaXMgZ2VuZXJhdGVkOgo+
Cj4gNjogICAwMDAwMDI5NyAgICAgICAgICAgICAgICBhdWlwYyAgIHQwLDB4MAo+IGE6ICAgMDAw
MjgyOTMgICAgICAgICAgICAgICAgbXYgICAgICB0MCx0MAo+IGU6ICAgMDAwMmIyODMgICAgICAg
ICAgICAgICAgbGQgICAgICB0MCwwKHQwKSAjIDYgPF9fYXNtX2NvcHlfZnJvbV91c2VyKzB4ND4K
Pgo+IEhvd2V2ZXIsIHRoaXMgbGEgaXMgbm90IG5lZWRlZC4gWW91IGNhbiByZXBsYWNlIHRoZSBs
YSArIFJFR19MIHdpdGgganVzdAo+IGEgUkVHX0wgYXMgZm9sbG93czoKPgo+IFJFR19MICAgdDAs
IHJpc2N2X3ZfdXNlcmNvcHlfdGhyZXMKPgo+IFRoaXMgdGhlbiBnZW5lcmF0ZXMgdGhlIGZvbGxv
d2luZyBjb2RlOgo+Cj4gNjogICAwMDAwMDI5NyAgICAgICAgICAgICAgICBhdWlwYyAgIHQwLDB4
MAo+IGE6ICAgMDAwMmIyODMgICAgICAgICAgICAgICAgbGQgICAgICB0MCwwKHQwKSAjIDYgPF9f
YXNtX2NvcHlfZnJvbV91c2VyKzB4ND4KPgoKVGhhbmtzLCB0aGlzIHdpbGwgYmUgZml4ZWQgaW4g
djUKCj4gPiArICAgICBibHR1ICAgIGEyLCB0MCwgZmFsbGJhY2tfc2NhbGFyX3VzZXJjb3B5Cj4g
PiArICAgICB0YWlsIGVudGVyX3ZlY3Rvcl91c2VyY29weQo+ID4gKyNlbmRpZgo+ID4gK1NZTV9G
VU5DX1NUQVJUKGZhbGxiYWNrX3NjYWxhcl91c2VyY29weSkKPiA+Cj4gPiAgICAgICAvKiBFbmFi
bGUgYWNjZXNzIHRvIHVzZXIgbWVtb3J5ICovCj4gPiAgICAgICBsaSB0NiwgU1JfU1VNCj4gPiBA
QCAtMTgxLDYgKzE5MSw3IEBAIFNZTV9GVU5DX1NUQVJUKF9fYXNtX2NvcHlfdG9fdXNlcikKPiA+
ICAgICAgIHN1YiBhMCwgdDUsIGEwCj4gPiAgICAgICByZXQKPiA+ICBTWU1fRlVOQ19FTkQoX19h
c21fY29weV90b191c2VyKQo+ID4gK1NZTV9GVU5DX0VORChmYWxsYmFja19zY2FsYXJfdXNlcmNv
cHkpCj4gPiAgRVhQT1JUX1NZTUJPTChfX2FzbV9jb3B5X3RvX3VzZXIpCj4gPiAgU1lNX0ZVTkNf
QUxJQVMoX19hc21fY29weV9mcm9tX3VzZXIsIF9fYXNtX2NvcHlfdG9fdXNlcikKPiA+ICBFWFBP
UlRfU1lNQk9MKF9fYXNtX2NvcHlfZnJvbV91c2VyKQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvbGliL3VhY2Nlc3NfdmVjdG9yLlMgYi9hcmNoL3Jpc2N2L2xpYi91YWNjZXNzX3ZlY3Rvci5T
Cj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi41YmViY2Ix
Mjc2YTIKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2FyY2gvcmlzY3YvbGliL3VhY2Nlc3Nf
dmVjdG9yLlMKPiA+IEBAIC0wLDAgKzEsNTUgQEAKPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMC1vbmx5ICovCj4gPiArCj4gPiArI2luY2x1ZGUgPGxpbnV4L2xpbmthZ2Uu
aD4KPiA+ICsjaW5jbHVkZSA8YXNtLWdlbmVyaWMvZXhwb3J0Lmg+Cj4gPiArI2luY2x1ZGUgPGFz
bS9hc20uaD4KPiA+ICsjaW5jbHVkZSA8YXNtL2FzbS1leHRhYmxlLmg+Cj4gPiArI2luY2x1ZGUg
PGFzbS9jc3IuaD4KPiA+ICsKPiA+ICsjZGVmaW5lIHBEc3QgYTAKPiA+ICsjZGVmaW5lIHBTcmMg
YTEKPiA+ICsjZGVmaW5lIGlOdW0gYTIKPiA+ICsKPiA+ICsjZGVmaW5lIGlWTCBhMwo+ID4gKyNk
ZWZpbmUgcERzdFB0ciBhNAo+ID4gKwo+ID4gKyNkZWZpbmUgRUxFTV9MTVVMX1NFVFRJTkcgbTgK
PiA+ICsjZGVmaW5lIHZEYXRhIHYwCj4gPiArCj4gPiArICAgICAubWFjcm8gZml4dXAgb3AgcmVn
IGFkZHIgbGJsCj4gPiArMTAwOgo+ID4gKyAgICAgXG9wIFxyZWcsIFxhZGRyCj4gPiArICAgICBf
YXNtX2V4dGFibGUgICAgMTAwYiwgXGxibAo+ID4gKyAgICAgLmVuZG0KPiA+ICsKPiA+ICtTWU1f
RlVOQ19TVEFSVChfX2FzbV92ZWN0b3JfdXNlcmNvcHkpCj4gPiArICAgICAvKiBFbmFibGUgYWNj
ZXNzIHRvIHVzZXIgbWVtb3J5ICovCj4gPiArICAgICBsaSB0NiwgU1JfU1VNCj4gPiArICAgICBj
c3JzIENTUl9TVEFUVVMsIHQ2Cj4gPiArCj4gPiArICAgICAvKiBTYXZlIGZvciByZXR1cm4gdmFs
dWUgKi8KPiA+ICsgICAgIG12ICAgICAgdDUsIGEyCj4KPiBXaGF0J3MgdGhlIHBvaW50IG9mIHRo
aXM/CgpPb3BzLCBJIHdpbGwgcmVtb3ZlIGl0Cgo+Cj4gPiArCj4gPiArICAgICBtdiBwRHN0UHRy
LCBwRHN0Cj4KPiBXaHkgZG8gdGhpcyBtb3ZlPyBwRHN0IGlzbid0IHVzZWQgYW55d2hlcmUgZWxz
ZSBzbyB5b3UgY2FuIHNhZmVseQo+IGNvbnRpbnVlIHRvIHVzZSBwRHN0IGV2ZXJ5d2hlcmUgdGhh
dCBwRHN0UHRyIGlzIHVzZWQuCgpZZXMsIGl0IG1ha2VzIG1vcmUgc2Vuc2UgdG8gcmVtb3ZlIHBE
c3RQdHIgYW5kIHVzZSBqdXN0IHBEc3QuCgpUaGFua3MsCkFuZHkKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
