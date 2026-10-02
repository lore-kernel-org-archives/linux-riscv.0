Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4371CA5FD4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 06:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8OSpzHp5H372fOvWLcY65MmPBw28Evl+vvxU5ss7HaM=; b=C6DdzAf+qeI48e
	op88YN6YFBdKxjw7cvF5V03DoqFdVLI0hTSDua/187xl7kkY+4RzyHLbeMMxVurxS55/WLVNIvG4o
	njXAI6ZfWksSmX8cISdCOsRzIjMRoVSFMmCusp89fyRKaLGebJ0xYkfePKQvSvRh+C4KVqCRLLnaR
	bVWZpdB+FU9xPL+IICNGLVuC5I5o0AT+Ts1e79gvUA+U4AZEMkAy7FZ6xBc0xL/gas9dYT51ryTGz
	8NbXV8lZrPEd+WpkHA23w2k2WbJbUEFkV3HUIhMpzi/BdzKLmwrZkOriaWSpdGA1Dp2H/dPuQzcZl
	lyZCF8juT1R0/hiaASWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCX9A-0000000Akby-2Qz0;
	Fri, 02 Oct 2026 06:53:32 +0000
Received: from mail-lr2-x0e.google.com ([2a00:1450:4864:38::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCX97-0000000Akau-3PCt
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 06:53:31 +0000
Received: by mail-lr2-x0e.google.com with SMTP id 38308e7fff4ca-3a783ec301dso13086791fa.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 23:53:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790924008; cv=none;
        d=google.com; s=arc-20260327;
        b=qgLAL0SisuHBFrdH6r4QiwRa5zIE6Dswh6Ua0nMXUqgdaPKIdQ3omYMpyIraB7CD8O
         8Epz7b0p8PCqENVpbEedHIXztUZhDiS7FMLbeNZKd3oS7PXLI3u5ve7SmzlXr9zqAH5H
         zepr/iMIr70cjKuhjMpWCWP9sg3pX34f8TTWQhtlkF5q/mVXZl6sIKZkEzDydq8m5zXt
         SJFxr5xEhoWnKWwpGfHFX5o7ghHmfNX5Sw3h7dAHpL+rtCpedLD2AmngCYn4RfadvxP2
         fooP8bpqb0om+f+IV4t3ZbK4m+qW3k3R/VmDrOHunhGon7efyZGOapMdWGKW/k/uPwAI
         J8wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pB/qGu4pK5apMENgJwNFrZAZpWxtcAn8jGhRKIo64Ro=;
        fh=FUcrxc8b85iL0FE8ES4ALXKS127xTC64uXuVRNGcDHs=;
        b=hBaajqkwxTCQB1tkqUfjLwLduomkRQ6R5gdylDbY6t1/xR+95mlPtv95Z8zKqbtDhJ
         pbjUa8HRi6hSUDfxFDK1e59AHvf3UXZAuxZ/DW8lGSPYOe+DUyTLHCZ8uiBywvVNnbqU
         0qyKgUtDiMZmkOPNMalw1mnqVphBPYYLZe6ftG8ZWVMNdNpTCu1nG2YkJjYqElGP48Qt
         Nf2vFjaUjVe/t4LYQfWmC+p7LHxkKO4hK3e+ozAJztnY3Gmfg3neVmUhIXKNvIDvYDFG
         KairfQjY0iLfaIg0Ycbo7f0gzc7D9il2qknf809IEOhDAXeoLRVdTilvnq3/byIydHVP
         8LPg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1790924008; x=1791528808; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pB/qGu4pK5apMENgJwNFrZAZpWxtcAn8jGhRKIo64Ro=;
        b=elxTXOoslmG6Y66gy23pEoZ0hvw3DFNKbEBfZWsbuCqTvwcWLgvJEAA9WuZnnIbaKl
         eW12oakQXQIhgsQwybtJ7smaTxLsncqebenaWIS7z026eFaNZ6HMpWgUpp2h7TAfGmqc
         sT2W/nzywYbyi4+uWXAsgzp2gVTliY36xVInCfws0KORO0CRzmcnqYR5htCEjqImWwgO
         BGhMdZXkRjELbC823DHlt4DtaOuR4RDOY2sa28w10TqUNP3pNZIkem/Cjy8HCyFCjT2K
         MbZqUy7YvZ58jXjjTM13qi5ptgFzqyHZ6IjMsH8FI65+WOKqdJDMTqueOwb5hJFaymQd
         HfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790924008; x=1791528808;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pB/qGu4pK5apMENgJwNFrZAZpWxtcAn8jGhRKIo64Ro=;
        b=Zr4nmYrGfOP0yj3y3DCAQyLpGppZjGeZVG7i+LsNr77KobluOcEV4qg5xl7ny16m1+
         yne1H5QkimjMvU4Se2GPVG5epIB+tqfxbaFXbZ5IBz6n1VWOV4miDZCRSRLX9qRefh1W
         Q2C5VNN1AXFRlWD7jyjM+5s9XBToYSD5h0EI5prtYA2T8DYGkmdmdmpbVdQjPWm0AoZu
         h7f+ZUSIdl6Kd7b2T+m0vWIDgw4c2beoW6Or1Pa6sBVHuAFGU+rWz74Fr16l0D9Gs7FU
         9wvr1IvTL5aClAI20GEd1xH5I0Dime61qQKh0WizEEY8s7/g2oASxEy4bveT75qrdiiX
         kjpw==
X-Forwarded-Encrypted: i=1; AKwUvBy9U+viFr0vWo8avefJqqnL38ylTeqBOOMKoAOlFWPUpyjTFEXqL1ebpxgQBgnCm4+2nOrPSZXdVv2dFg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ0sQY9Y4ObGqXCS8tHJTiZaghe1zOBCVq3Z/8PsKgKSPLVGB5C
	nGd72r4hXjM0MZ/2aKdxmjCXroc5iQZ5hCugH5ENA28H6ibX9XqGgGUiDdVFY8uUm6IirU8tSMm
	MngSCQRRGTTfBz0P/ECpK0BXGQyABtUVIBEzpvoN6YQ==
X-Gm-Gg: AYBFou2aRnLZ4gQcTwnAJrIMKAEb6ExMx+hS3HmEChO/WVdzb7cZ/4nyaI486Yqq3o1
	RRlvbcRFcDs9UnpCM1M8Ys35QPbBqf23NsY62f+++cORxPjL1SIVl2xGAXItRU9XSuOCANdYTQH
	CqKoC+/cpJzcu6K4htI4ucvIGNX2LH/ySnEH0zIh3wIFyMJ4kQXtkADc74gMQiSzK6l7XhQA5dr
	r1YkNBdqmab6VHq6JYTgbaA3RrWlhy5PYC3BOpLXLwj//mPD0RCt8oG/zQjCHE9+twqn44qN0b4
	GEMvYgTTXbt6VefQh3dbljrBlI3fZSCoSYPBxhkbz7zbEpFeJJ3vausVVPZs98HZxgWoPw/6M/c
	xRFtSBRygYSKJ8qGPRRYUKgvhvaUBnJ4ef7DgnumsSCpR+cyRhzdCxv/z+Z8l1eT8zibbSPN44j
	I=
X-Received: by 2002:a2e:a802:0:b0:3a6:6f81:1027 with SMTP id
 38308e7fff4ca-3a88781b897mr3633851fa.24.1790924007662; Thu, 01 Oct 2026
 23:53:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260730093614.983508-1-xiangwencheng@lanxincomputing.com>
In-Reply-To: <20260730093614.983508-1-xiangwencheng@lanxincomputing.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Oct 2026 12:23:14 +0530
X-Gm-Features: AclHuK_kRPavXtWsReKC9CryYELBy8XCMd0E391B5VzjdtS0vtPoxj_Th0S8j2Y
Message-ID: <CAAhSdy0UgBGd2M=Zq3XiaTY-Y5uTrAcOtFF=haKgmFBRB1=ggw@mail.gmail.com>
Subject: Re: [PATCH] riscv: KVM: Add hart-to-vCPU mapping for faster MSI injection
To: BillXiang <xiangwencheng@lanxincomputing.com>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_235330_224351_22F5A4D2 
X-CRM114-Status: GOOD (  23.34  )
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

T24gVGh1LCBKdWwgMzAsIDIwMjYgYXQgMzowNuKAr1BNIEJpbGxYaWFuZwo8eGlhbmd3ZW5jaGVu
Z0BsYW54aW5jb21wdXRpbmcuY29tPiB3cm90ZToKPgo+IFJlcGxhY2UgbGluZWFyIHNlYXJjaGVz
IG92ZXIgYWxsIHZDUFVzIGluIE1TSSBpbmplY3Rpb24gcGF0aHMgd2l0aCBhCj4gZGlyZWN0IGhh
cnRfaW5kZXggLT4gdkNQVSBsb29rdXAgdGFibGUuIFRoaXMgYXZvaWRzIE8obikgc2NhbnMgb24K
PiBldmVyeSBpbmplY3RlZCBpbnRlcnJ1cHQgYW5kIGltcHJvdmVzIHBlcmZvcm1hbmNlIHdoZW4g
dGhlIG51bWJlciBvZgo+IHZDUFVzIGlzIGxhcmdlLgo+Cj4gQm90aCBrdm1fcmlzY3ZfYWlhX2lu
amVjdF9tc2lfYnlfaWQoKSBhbmQga3ZtX3Jpc2N2X2FpYV9pbmplY3RfbXNpKCkKPiBub3cgdXNl
IHRoZSB0YWJsZSBpbnN0ZWFkIG9mIGl0ZXJhdGluZyBvdmVyIHRoZSB2Q1BVIGxpc3QuCgpUaGUg
QUlBIGhhcnRfaW5kZXggYml0cyBmb3IgVkNQVXMgYXJlIGJhc2VkIG9uIHRoZSBJTVNJQyBhZGRy
ZXNzCnNldCBieSB0aGUgS1ZNIHVzZXItc3BhY2UgYW5kIGFyZSBub3QgcmVxdWlyZWQgdG8gYmUg
Y29udGlndW91cyBoZW5jZQp0aGlzIHBhdGNoIGlzIGFscmVhZHkgYnJva2VuLgoKTkFDSyBmcm9t
IG15IHNpZGUuCgpSZWdhcmRzLApBbnVwCgo+Cj4gU2lnbmVkLW9mZi1ieTogQmlsbFhpYW5nIDx4
aWFuZ3dlbmNoZW5nQGxhbnhpbmNvbXB1dGluZy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20va3ZtX2FpYS5oIHwgIDIgKwo+ICBhcmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMg
ICAgICB8IDY3ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tCj4gIDIgZmlsZXMgY2hh
bmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fYWlhLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2t2bV9haWEuaAo+IGluZGV4IGM2N2VjNWFjMC4uNzEyNDBiMGEyIDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2FpYS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9rdm1fYWlhLmgKPiBAQCAtNDcsNiArNDcsOCBAQCBzdHJ1Y3Qga3ZtX2FpYSB7Cj4KPiAg
ICAgICAgIC8qIEludGVybmFsIHN0YXRlIG9mIEFQTElDICovCj4gICAgICAgICB2b2lkICAgICAg
ICAgICAgKmFwbGljX3N0YXRlOwo+ICsKPiArICAgICAgIHN0cnVjdCBrdm1fdmNwdSAqKmhhcnRf
dG9fdmNwdTsKPiAgfTsKPgo+ICBzdHJ1Y3Qga3ZtX3ZjcHVfYWlhX2NzciB7Cj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9kZXZp
Y2UuYwo+IGluZGV4IGJlODNjMmQ1Zi4uNTk1NTUzODE3IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3Yva3ZtL2FpYV9kZXZpY2UuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYwo+
IEBAIC0yNTMsNiArMjUzLDE0IEBAIHN0YXRpYyBpbnQgYWlhX2luaXQoc3RydWN0IGt2bSAqa3Zt
KQo+ICAgICAgICAgaWYgKHJldCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPgo+ICsg
ICAgICAgYWlhLT5oYXJ0X3RvX3ZjcHUgPSBrY2FsbG9jKGt2bS0+Y3JlYXRlZF92Y3B1cywKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKHN0cnVjdCBrdm1f
dmNwdSopLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHRlBfS0VS
TkVMKTsKPiArICAgICAgIGlmICghYWlhLT5oYXJ0X3RvX3ZjcHUpIHsKPiArICAgICAgICAgICAg
ICAgcmV0ID0gLUVOT01FTTsKPiArICAgICAgICAgICAgICAgZ290byBmYWlsX2NsZWFudXBfYXBs
aWM7Cj4gKyAgICAgICB9Cj4gKwo+ICAgICAgICAgLyogSXRlcmF0ZSBvdmVyIGVhY2ggVkNQVSAq
Lwo+ICAgICAgICAga3ZtX2Zvcl9lYWNoX3ZjcHUoaWR4LCB2Y3B1LCBrdm0pIHsKPiAgICAgICAg
ICAgICAgICAgdmFpYSA9ICZ2Y3B1LT5hcmNoLmFpYV9jb250ZXh0Owo+IEBAIC0yNzQsNiArMjgy
LDEyIEBAIHN0YXRpYyBpbnQgYWlhX2luaXQoc3RydWN0IGt2bSAqa3ZtKQo+ICAgICAgICAgICAg
ICAgICAvKiBVcGRhdGUgSEFSVCBpbmRleCBvZiB0aGUgSU1TSUMgYmFzZWQgb24gSU1TSUMgYmFz
ZSAqLwo+ICAgICAgICAgICAgICAgICB2YWlhLT5oYXJ0X2luZGV4ID0gYWlhX2ltc2ljX2hhcnRf
aW5kZXgoYWlhLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdmFpYS0+aW1zaWNfYWRkcik7Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAo
YWlhLT5oYXJ0X3RvX3ZjcHVbdmFpYS0+aGFydF9pbmRleF0pIHsKPiArICAgICAgICAgICAgICAg
ICAgICAgICByZXQgPSAtRUlOVkFMOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZmFp
bF9jbGVhbnVwX2ltc2ljczsKPiArICAgICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICAgICBh
aWEtPmhhcnRfdG9fdmNwdVt2YWlhLT5oYXJ0X2luZGV4XSA9IHZjcHU7Cj4KPiAgICAgICAgICAg
ICAgICAgLyogSW5pdGlhbGl6ZSBJTVNJQyBmb3IgdGhpcyBWQ1BVICovCj4gICAgICAgICAgICAg
ICAgIHJldCA9IGt2bV9yaXNjdl92Y3B1X2FpYV9pbXNpY19pbml0KHZjcHUpOwo+IEBAIC0yOTMs
NiArMzA3LDkgQEAgc3RhdGljIGludCBhaWFfaW5pdChzdHJ1Y3Qga3ZtICprdm0pCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gICAgICAgICAgICAgICAgIGt2bV9yaXNjdl92
Y3B1X2FpYV9pbXNpY19jbGVhbnVwKHZjcHUpOwo+ICAgICAgICAgfQo+ICsgICAgICAga2ZyZWUo
YWlhLT5oYXJ0X3RvX3ZjcHUpOwo+ICsgICAgICAgYWlhLT5oYXJ0X3RvX3ZjcHUgPSBOVUxMOwo+
ICtmYWlsX2NsZWFudXBfYXBsaWM6Cj4gICAgICAgICBrdm1fcmlzY3ZfYWlhX2FwbGljX2NsZWFu
dXAoa3ZtKTsKPiAgICAgICAgIHJldHVybiByZXQ7Cj4gIH0KPiBAQCAtNTUxLDMwICs1NjgsMjgg
QEAgdm9pZCBrdm1fcmlzY3ZfdmNwdV9haWFfZGVpbml0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkK
PiAgaW50IGt2bV9yaXNjdl9haWFfaW5qZWN0X21zaV9ieV9pZChzdHJ1Y3Qga3ZtICprdm0sIHUz
MiBoYXJ0X2luZGV4LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMyIGd1
ZXN0X2luZGV4LCB1MzIgaWlkKQo+ICB7Cj4gLSAgICAgICB1bnNpZ25lZCBsb25nIGlkeDsKPiAg
ICAgICAgIHN0cnVjdCBrdm1fdmNwdSAqdmNwdTsKPiArICAgICAgIHN0cnVjdCBrdm1fYWlhICph
aWEgPSAma3ZtLT5hcmNoLmFpYTsKPgo+ICAgICAgICAgLyogUHJvY2VlZCBvbmx5IGlmIEFJQSB3
YXMgaW5pdGlhbGl6ZWQgc3VjY2Vzc2Z1bGx5ICovCj4gICAgICAgICBpZiAoIWt2bV9yaXNjdl9h
aWFfaW5pdGlhbGl6ZWQoa3ZtKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FQlVTWTsKPgo+
IC0gICAgICAgLyogSW5qZWN0IE1TSSB0byBtYXRjaGluZyBWQ1BVICovCj4gLSAgICAgICBrdm1f
Zm9yX2VhY2hfdmNwdShpZHgsIHZjcHUsIGt2bSkgewo+IC0gICAgICAgICAgICAgICBpZiAodmNw
dS0+YXJjaC5haWFfY29udGV4dC5oYXJ0X2luZGV4ID09IGhhcnRfaW5kZXgpCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgcmV0dXJuIGt2bV9yaXNjdl92Y3B1X2FpYV9pbXNpY19pbmplY3QodmNw
dSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBndWVzdF9pbmRleCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwLCBpaWQpOwo+IC0gICAgICAgfQo+ICsg
ICAgICAgaWYgKCFhaWEtPmhhcnRfdG9fdmNwdSB8fCBoYXJ0X2luZGV4ID49IGt2bS0+Y3JlYXRl
ZF92Y3B1cykKPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4KPiAtICAgICAgIHJldHVybiAw
Owo+ICsgICAgICAgdmNwdSA9IGFpYS0+aGFydF90b192Y3B1W2hhcnRfaW5kZXhdOwo+ICsgICAg
ICAgaWYgKCF2Y3B1KQo+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPiArCj4gKyAgICAgICBy
ZXR1cm4ga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX2luamVjdCh2Y3B1LCBndWVzdF9pbmRleCwg
MCwgaWlkKTsKPiAgfQo+Cj4gIGludCBrdm1fcmlzY3ZfYWlhX2luamVjdF9tc2koc3RydWN0IGt2
bSAqa3ZtLCBzdHJ1Y3Qga3ZtX21zaSAqbXNpKQo+ICB7Cj4gICAgICAgICBncGFfdCB0cHBuLCBp
cHBuOwo+IC0gICAgICAgdW5zaWduZWQgbG9uZyBpZHg7Cj4gICAgICAgICBzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHU7Cj4gLSAgICAgICB1MzIgZywgdG9mZiwgaWlkID0gbXNpLT5kYXRhOwo+ICsgICAg
ICAgdTMyIGcsIHRvZmYsIGlpZCA9IG1zaS0+ZGF0YSwgaGFydF9pbmRleDsKPiAgICAgICAgIHN0
cnVjdCBrdm1fYWlhICphaWEgPSAma3ZtLT5hcmNoLmFpYTsKPiAgICAgICAgIGdwYV90IHRhcmdl
dCA9ICgoKGdwYV90KW1zaS0+YWRkcmVzc19oaSkgPDwgMzIpIHwgbXNpLT5hZGRyZXNzX2xvOwo+
Cj4gQEAgLTU4OSwxOCArNjA0LDIyIEBAIGludCBrdm1fcmlzY3ZfYWlhX2luamVjdF9tc2koc3Ry
dWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX21zaSAqbXNpKQo+ICAgICAgICAgZyA9IHRwcG4gJiAo
QklUKGFpYS0+bnJfZ3Vlc3RfYml0cykgLSAxKTsKPiAgICAgICAgIHRwcG4gJj0gfigoZ3BhX3Qp
KEJJVChhaWEtPm5yX2d1ZXN0X2JpdHMpIC0gMSkpOwo+Cj4gLSAgICAgICAvKiBJbmplY3QgTVNJ
IHRvIG1hdGNoaW5nIFZDUFUgKi8KPiAtICAgICAgIGt2bV9mb3JfZWFjaF92Y3B1KGlkeCwgdmNw
dSwga3ZtKSB7Cj4gLSAgICAgICAgICAgICAgIGlwcG4gPSB2Y3B1LT5hcmNoLmFpYV9jb250ZXh0
Lmltc2ljX2FkZHIgPj4KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
SU1TSUNfTU1JT19QQUdFX1NISUZUOwo+IC0gICAgICAgICAgICAgICBpZiAoaXBwbiA9PSB0cHBu
KSB7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgdG9mZiA9IHRhcmdldCAmIChJTVNJQ19NTUlP
X1BBR0VfU1ogLSAxKTsKPiAtICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4ga3ZtX3Jpc2N2
X3ZjcHVfYWlhX2ltc2ljX2luamVjdCh2Y3B1LCBnLAo+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRvZmYsIGlpZCk7Cj4gLSAg
ICAgICAgICAgICAgIH0KPiAtICAgICAgIH0KPiArICAgICAgIGlmICghYWlhLT5oYXJ0X3RvX3Zj
cHUpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOwo+Cj4gLSAgICAgICByZXR1cm4gMDsKPiAr
ICAgICAgIGhhcnRfaW5kZXggPSBhaWFfaW1zaWNfaGFydF9pbmRleChhaWEsIHRhcmdldCk7Cj4g
KyAgICAgICBpZihoYXJ0X2luZGV4ID49IGt2bS0+Y3JlYXRlZF92Y3B1cykKPiArICAgICAgICAg
ICAgICAgcmV0dXJuIDA7Cj4gKwo+ICsgICAgICAgdmNwdSA9IGFpYS0+aGFydF90b192Y3B1W2hh
cnRfaW5kZXhdOwo+ICsgICAgICAgaWYgKCF2Y3B1KQo+ICsgICAgICAgICAgICAgICByZXR1cm4g
MDsKPiArCj4gKyAgICAgICBpcHBuID0gdmNwdS0+YXJjaC5haWFfY29udGV4dC5pbXNpY19hZGRy
ID4+IElNU0lDX01NSU9fUEFHRV9TSElGVDsKPiArICAgICAgIGlmIChpcHBuICE9IHRwcG4pCj4g
KyAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICsgICAgICAgdG9mZiA9IHRhcmdldCAmIChJTVNJ
Q19NTUlPX1BBR0VfU1ogLSAxKTsKPiArICAgICAgIHJldHVybiBrdm1fcmlzY3ZfdmNwdV9haWFf
aW1zaWNfaW5qZWN0KHZjcHUsIGcsIHRvZmYsIGlpZCk7Cj4gIH0KPgo+ICBpbnQga3ZtX3Jpc2N2
X2FpYV9pbmplY3RfaXJxKHN0cnVjdCBrdm0gKmt2bSwgdW5zaWduZWQgaW50IGlycSwgYm9vbCBs
ZXZlbCkKPiBAQCAtNjQxLDEwICs2NjAsMTQgQEAgdm9pZCBrdm1fcmlzY3ZfYWlhX2luaXRfdm0o
c3RydWN0IGt2bSAqa3ZtKQo+Cj4gIHZvaWQga3ZtX3Jpc2N2X2FpYV9kZXN0cm95X3ZtKHN0cnVj
dCBrdm0gKmt2bSkKPiAgewo+ICsgICAgICAgc3RydWN0IGt2bV9haWEgKmFpYSA9ICZrdm0tPmFy
Y2guYWlhOwo+ICAgICAgICAgLyogUHJvY2VlZCBvbmx5IGlmIEFJQSB3YXMgaW5pdGlhbGl6ZWQg
c3VjY2Vzc2Z1bGx5ICovCj4gICAgICAgICBpZiAoIWt2bV9yaXNjdl9haWFfaW5pdGlhbGl6ZWQo
a3ZtKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+Cj4gKyAgICAgICBrZnJlZShhaWEtPmhh
cnRfdG9fdmNwdSk7Cj4gKyAgICAgICBhaWEtPmhhcnRfdG9fdmNwdSA9IE5VTEw7Cj4gKwo+ICAg
ICAgICAgLyogQ2xlYW51cCBBUExJQyBjb250ZXh0ICovCj4gICAgICAgICBrdm1fcmlzY3ZfYWlh
X2FwbGljX2NsZWFudXAoa3ZtKTsKPiAgfQo+IC0tCj4gMi41My4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
