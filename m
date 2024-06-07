Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E567C27C55
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2024 07:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Ltg1smpzIMs4M8V8ogYPBAM+jg2UfOMKn/ksLMoTAE=; b=uHBEfQsSBnZBgA
	UTOGATxgeKDjZ8RYuBO1n89EBCYo/V/mDC7AQsqesResE1Jh1HKDZNuGWP0xNlzlvXTesQUGKQN3V
	mOgMc3Cq/wbIUD9uc2KEdpkxsMcOj6gNZTKMBDJ3U8Drr7k9Ud3Eg4VZwZhnDGLfFB9A3xBAb8hF4
	MZAj1UMgq3TL3UJa87s84I++2jRK7daOQ4qa6tBpbDytxydJ0h/26/prDwCM+MrGqPMby8D8WsOLY
	4WWIDVFskkFMKpwEGU3d4lAMrK929ewPuvU79BbEc5Fkw4ccQdjak3wLohrib4UiT6bKS0HR8mDG4
	1PGsOSObExLVHctpfo0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFTh2-0000000Coqv-0yox;
	Fri, 07 Jun 2024 07:07:21 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFTgw-0000000Con5-19tE
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jun 2024 07:07:17 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3737b250ef9so7393055ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Jun 2024 00:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1717744032; x=1718348832; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CLx8I7uIS4yN2qY8IP79uDVs9k1SwxKuZrHLU/16hk=;
        b=z6BrKMq8krD3ckuGxdq/N/hM3MI3qwcJ8+qEet7kE80qqvdY5KB2D/+E2CrSMk5vnf
         zAFggkXrUM2IVcohJRJUvHh21hVe/c7zQlnNUpfz3j/2C2fBMiwXPahMqKe3Qw2GoaUZ
         xdn89yFJ8681vvhz2VdwKH5zId9IADGc1PwI/XOqZKGIrPVOZKep2Ofcb1h9cmLkUvth
         N1Wm1Zu2mwB9bCDVtEzPp6M71boqqjAiKLhrcJv4iTpfGgoC592Syh3FiRxQCS7HC1dQ
         ID3u6tFX1UOp4u/ZLEpbW5eyJw8GA0ppZRk4j41gDAd5wQCPDe7s6L9G86kbjcVAq/Z4
         V6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717744032; x=1718348832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8CLx8I7uIS4yN2qY8IP79uDVs9k1SwxKuZrHLU/16hk=;
        b=RtZo/pFNEhs2o7ALuhBBjOp6f8CF9WuMNmkv3iM3RcwiitqBn0AbtLlJDOYQMSSPhq
         vXLgnNRZpwBYgW/X9DA0L6JO6KUMtJwrHVYEo5+tAsdcLFEM/+xtJylUZzL8Rh75MP2j
         bJnwciXB26WAnF7qejTos03cS+IPTPQ/JKWdvV2QniGYyA0B6ZcnzYdxEbVt9DhH4XNd
         u7OWhhjKoMP5WmtZwr01pNe5yaHr7PPXMiitu/KJZtsLLAwmlHEBtwEDmQKU+lcm6o2G
         EoLoJi0Erss+VLGlFSO4dQ7LZMeAXRykaDKSZBFtiv4ND0IzSXxCOPcRV+ZY7ggVpDRu
         NQAw==
X-Forwarded-Encrypted: i=1; AJvYcCW976G6zFEsjaojKCkgr3T537mOHNjBystO42FEJCaC7//Q/4QEhlQ96m4dXkgDIPHbRH+LZIh5LDU8I9Zv5U1USKvfDwiq/VL9xtt6jtut
X-Gm-Message-State: AOJu0Yz+ei7d5ja6tQT3DfH47INh5Em6ikNV/mUrx6CSAPASLfLCdqXY
	eryBLaC+tdpunTtFckH66o+YU6k2bIAMVCyGGGjz8WtV+k7/nWEOVuBxBoQCd35b3UawjxSrd7o
	vUlw2S19OuEuwK9CjmSgsllUmeY4a+HRdn27DJwZ/f6I9+lPWtc8=
X-Google-Smtp-Source: AGHT+IFE09PTLjj0080/0bN8m/3yMGgMYsDcLZaSLR2FjJm1yUQBETVhznGnzF1DLd7cgzFg+hOq9wxArotyxseBiWU=
X-Received: by 2002:a05:6e02:20e8:b0:374:9e82:7b51 with SMTP id
 e9e14a558f8ab-375802fcc9bmr22082355ab.9.1717744031764; Fri, 07 Jun 2024
 00:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240429092113.70695-1-betterman5240@gmail.com>
In-Reply-To: <20240429092113.70695-1-betterman5240@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 7 Jun 2024 12:37:01 +0530
Message-ID: <CAAhSdy3HPGS48TeG5LxiECAtNyzmzsJPzo+_eicgxL28nAgoHg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V:KVM: Add AMO load/store access fault traps to
 redirect to guest
To: Yu-Wei Hsu <betterman5240@gmail.com>
Cc: atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_000714_548688_9492C8F0 
X-CRM114-Status: GOOD (  16.32  )
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

T24gTW9uLCBBcHIgMjksIDIwMjQgYXQgMjo1MeKAr1BNIFl1LVdlaSBIc3UgPGJldHRlcm1hbjUy
NDBAZ21haWwuY29tPiB3cm90ZToKPgo+IFdoZW4gdW5oYW5kbGVkIEFNTyBsb2FkL3N0b3JlIGFj
Y2VzcyBmYXVsdCB0cmFwcyBhcmUgbm90IGRlbGVnYXRlZCB0bwo+IFZTIG1vZGUgKGhlZGVsZWcp
LCBNIG1vZGUgcmVkaXJlY3RzIHRoZW0gYmFjayB0byBTIG1vZGUuCj4gSG93ZXZlciwgdXBvbiBy
ZXR1cm5pbmcgZnJvbSBNIG1vZGUsdGhlIEtWTSBleGVjdXRlZCBpbiBIUyBtb2RlIHRlcm1pbmF0
ZXMKPiBWUyBtb2RlIHNvZnR3YXJlLgo+IEtWTSBzaG91bGQgcmVkaXJlY3QgdHJhcHMgYmFjayB0
byBWUyBtb2RlIGFuZCBsZXQgdGhlIFZTIG1vZGUgdHJhcCBoYW5kbGVyCj4gZGV0ZXJtaW5lIHRo
ZSBuZXh0IHN0ZXBzLgo+IFRoaXMgaXMgb25lIGFwcHJvYWNoIHRvIGhhbmRsaW5nIGFjY2VzcyBm
YXVsdCB0cmFwcyBpbiBLVk0sCj4gbm90IG9ubHkgcmVkaXJlY3RpbmcgdGhlbSB0byBWUyBtb2Rl
IG9yIHRlcm1pbmF0aW5nIGl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogWXUtV2VpIEhzdSA8YmV0dGVy
bWFuNTI0MEBnbWFpbC5jb20+CgpPdmVyYWxsIHRoaXMgcGF0Y2ggbG9va3MgZ29vZCB0byBtZSBi
dXQgdGhlIHBhdGNoIHN1YmplY3QgYW5kCmRlc2NyaXB0aW9uIGNhbiBmdXJ0aGVyIHNpbXBsaWZp
ZWQgYXMgZm9sbG93czoKCiAgICBSSVNDLVY6IEtWTTogUmVkaXJlY3QgQU1PIGxvYWQvc3RvcmUg
YWNjZXNzIGZhdWx0IHRyYXBzIHRvIGd1ZXN0CgogICAgVGhlIEtWTSBSSVNDLVYgZG9lcyBub3Qg
ZGVsZWdhdGUgQU1PIGxvYWQvc3RvcmUgYWNjZXNzIGZhdWx0IHRyYXBzIHRvCiAgICBWUy1tb2Rl
IChoZWRlbGVnKSBzbyB0eXBpY2FsbHkgTS1tb2RlIHRha2VzIHRoZXNlIHRyYXBzIGFuZCByZWRp
cmVjdHMKICAgIHRoZW0gYmFjayB0byBIUy1tb2RlLiBIb3dldmVyLCB1cG9uIHJldHVybmluZyBm
cm9tIE0tbW9kZSwgdGhlIEtWTQogICAgUklTQy1WIHJ1bm5pbmcgaW4gSFMtbW9kZSB0ZXJtaW5h
dGVzIFZTLW1vZGUgc29mdHdhcmUuCgogICAgVGhlIEtWTSBSSVNDLVYgc2hvdWxkIHJlZGlyZWN0
IEFNTyBsb2FkL3N0b3JlIGFjY2VzcyBmYXVsdCB0cmFwcyBiYWNrCiAgICB0byBWUy1tb2RlIGFu
ZCBsZXQgdGhlIFZTLW1vZGUgdHJhcCBoYW5kbGVyIGRldGVybWluZSB0aGUgbmV4dCBzdGVwcy4K
CkkgaGF2ZSB0YWtlbiBjYXJlIG9mIHRoZSBhYm92ZSBhdCB0aGUgdGltZSBvZiBxdWV1aW5nIHRo
aXMgcGF0Y2guCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4K
ClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC02LjExCgpUaGFua3MsCkFudXAKCj4gLS0tCj4g
IGFyY2gvcmlzY3Yva3ZtL3ZjcHVfZXhpdC5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMg
Yi9hcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYwo+IGluZGV4IDI0MTU3MjJjMDFiOC4uZWY4YzVl
M2VjOGEwIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfZXhpdC5jCj4gKysrIGIv
YXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMKPiBAQCAtMTg1LDYgKzE4NSw4IEBAIGludCBrdm1f
cmlzY3ZfdmNwdV9leGl0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9ydW4gKnJ1
biwKPiAgICAgICAgIGNhc2UgRVhDX0lOU1RfSUxMRUdBTDoKPiAgICAgICAgIGNhc2UgRVhDX0xP
QURfTUlTQUxJR05FRDoKPiAgICAgICAgIGNhc2UgRVhDX1NUT1JFX01JU0FMSUdORUQ6Cj4gKyAg
ICAgICBjYXNlIEVYQ19MT0FEX0FDQ0VTUzoKPiArICAgICAgIGNhc2UgRVhDX1NUT1JFX0FDQ0VT
UzoKPiAgICAgICAgICAgICAgICAgaWYgKHZjcHUtPmFyY2guZ3Vlc3RfY29udGV4dC5oc3RhdHVz
ICYgSFNUQVRVU19TUFYpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBrdm1fcmlzY3ZfdmNw
dV90cmFwX3JlZGlyZWN0KHZjcHUsIHRyYXApOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJl
dCA9IDE7Cj4gLS0KPiAyLjI1LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
