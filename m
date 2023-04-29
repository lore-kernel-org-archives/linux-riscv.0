Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3D1C77B60
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 19:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E0li3fx+y6kRdmge5G2PAFjWOS/G8CnDgevHjItfx50=; b=MOJKtbsFLZH2cM
	hqYBvZrGFSv6MjT5hJCvNCm90HsGCOQwQSeMF/ZP4RqCtmch+ALiBQLIpf2QSniuMlhXKQ1jRYO1O
	cY2nXjkvFJJI7GTnoEbtRgTxW3b1gpxb3n+Z31O7WwNh05aBOYfyAVL7F2zGp7T2FJOWKLxq4lMN7
	i+W1hUGUUTsivpy4vm1DJ//lJsdFJPkZQ5wgoT9gAUckJpUCanTWd9e3sDCkAVmjootNk2xA0U7C5
	wY6Xc6IBH8iVUbRP/q1KqiByIudnh6WsyQANM17Ma+WQ5et56cxgcxq4/OJA7QvLtPPw1UVcZqJ4a
	NhCGOOnt8iUTwEeGBVFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pspuP-00D2s3-2d;
	Sat, 29 Apr 2023 19:07:01 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pspuN-00D2rG-0q
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 19:07:00 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2a8b1b51dbdso9404181fa.0
        for <linux-riscv@lists.infradead.org>; Sat, 29 Apr 2023 12:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682795215; x=1685387215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZQprsIFxkb6uN+gB/WxK+KPOh1VYzqWl9rnM0y+44U=;
        b=pqAoyNDvckoNrFVRFtTSPp+aKQgzq2t1zKzWv8Gf+uwfWoU1EacoHb/KSumyadsmTN
         ligsXTgRi7NgYGtXbNjWLhdLhquagRrcLsIgUQnDzkW21cWhRXl+A8A3cREW+DdR5wf3
         i+VgJ7sAe68KrIJF8voahlUHYa+aZ7FkDRIipStSGZkMsRksQ9xOo1HFhxJrrN5WjVPE
         6AsrJtEEteOfTbqyP6CxKcT7Yth5kfU1n9tTzj3uMBAzDBg/0eSecVMy3u9zOYd4huZw
         XVtHo4uQr++T6PPrl2Fzeuj0XMZ31Hld5PAnyepyMOi9zDzKIuWhVHf7RWrR2XsaSps+
         IZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682795215; x=1685387215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZQprsIFxkb6uN+gB/WxK+KPOh1VYzqWl9rnM0y+44U=;
        b=QOGoXa05IpluBo1/MGEMioCay4SFxEMTsie52IDplQHEU+blD53GMiHn1PlAlR78LO
         ExfLC6dMgiWM6Hj5pZKc2jP/tdASvkuYLLRDDvCqX85k/fPOtUldICWQS5GQWyeFHl1O
         Bnsg3VT1jaZnrGXqSvtjgYZATABg6kBHirrLZ1OT1GN2/hIdacJUFH3dyKzF8NItLkYK
         +6txtyzHqgCuB9d/Ewxp+1usWDLBsCSGNDAa99My5baKknCv9LG2H3gLFzfnUHKgfJHS
         LwEJaOh0XPnkq6zlujE2Zl6Szimf5k+GGip9EDgIuAmVUx9oD1j7hVNb60fmd6HkbdSy
         aIbQ==
X-Gm-Message-State: AC+VfDynm1kQXd7xkWG7D2ExEwobuowvPNwlggbxICVrtQc5uOQ8iw1b
	TsyYrCs1lcAgNQo50+a4ejgvnEBj/0hjFvlGbX/YMw==
X-Google-Smtp-Source: ACHHUZ6YEnTDHMPe1uXVXbjjrDwRb8mKocGJYkJfVMTo4Cs4HcMhIoy/gBJIb0fiPeJlM3NlbXL7zkgVBDBT5Nrme3A=
X-Received: by 2002:a2e:9d47:0:b0:2a7:6e12:f75a with SMTP id
 y7-20020a2e9d47000000b002a76e12f75amr2226666ljj.53.1682795215108; Sat, 29 Apr
 2023 12:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230429155247.12131-1-rdunlap@infradead.org> <CALs-HsuG3EFBs60sgiMcPHoE1dF7mhi3GKt=AWvRPaUHAfA88Q@mail.gmail.com>
 <20230429-outboard-hypocrite-983e977103d2@spud> <CALs-HstrR3Cm3jQKt6dmfYiRRVkAVibAZDtFo0wmXz4LEvRf_A@mail.gmail.com>
 <37e6b325-44e4-8e65-68e3-eab2943018ac@infradead.org>
In-Reply-To: <37e6b325-44e4-8e65-68e3-eab2943018ac@infradead.org>
From: Evan Green <evan@rivosinc.com>
Date: Sat, 29 Apr 2023 12:06:19 -0700
Message-ID: <CALs-Hss3b86zAqohK9NYEkzn+pnLeMB37qaj1EA6f6bRkFWwCg@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: fix sifive and thead section mismatches in errata
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
	Heiko Stuebner <heiko@sntech.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_120659_298288_74FFFABE 
X-CRM114-Status: GOOD (  18.22  )
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

T24gU2F0LCBBcHIgMjksIDIwMjMgYXQgMTA6NTjigK9BTSBSYW5keSBEdW5sYXAgPHJkdW5sYXBA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPgo+Cj4gT24gNC8yOS8yMyAxMDo0OCwgRXZhbiBHcmVl
biB3cm90ZToKPiA+IE9uIFNhdCwgQXByIDI5LCAyMDIzIGF0IDEwOjI04oCvQU0gQ29ub3IgRG9v
bGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPiA+Pgo+ID4+IE9uIFNhdCwgQXByIDI5LCAy
MDIzIGF0IDEwOjIxOjM5QU0gLTA3MDAsIEV2YW4gR3JlZW4gd3JvdGU6Cj4gPj4+IE9uIFNhdCwg
QXByIDI5LCAyMDIzIGF0IDg6NTLigK9BTSBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFk
Lm9yZz4gd3JvdGU6Cj4gPj4+Pgo+ID4+Pj4gV2hlbiBDT05GSUdfTU9EVUxFUyBpcyBzZXQsIF9f
aW5pdF9vcl9tb2R1bGUgYmVjb21lcyA8ZW1wdHk+LCBidXQgd2hlbgo+ID4+Pj4gQ09ORklHX01P
RFVMRVMgaXMgbm90IHNldCwgX19pbml0X29yX21vZHVsZSBiZWNvbWVzIF9faW5pdC4KPiA+Pj4+
IEluIHRoZSBsYXR0ZXIgY2FzZSwgaXQgY2F1c2VzIHNlY3Rpb24gbWlzbWF0Y2ggd2FybmluZ3M6
Cj4gPj4+Pgo+ID4+Pj4gV0FSTklORzogbW9kcG9zdDogdm1saW51eC5vOiBzZWN0aW9uIG1pc21h
dGNoIGluIHJlZmVyZW5jZTogcmlzY3ZfZmlsbF9jcHVfbWZyX2luZm8gKHNlY3Rpb246IC50ZXh0
KSAtPiBzaWZpdmVfZXJyYXRhX3BhdGNoX2Z1bmMgKHNlY3Rpb246IC5pbml0LnRleHQpCj4gPj4+
PiBXQVJOSU5HOiBtb2Rwb3N0OiB2bWxpbnV4Lm86IHNlY3Rpb24gbWlzbWF0Y2ggaW4gcmVmZXJl
bmNlOiByaXNjdl9maWxsX2NwdV9tZnJfaW5mbyAoc2VjdGlvbjogLnRleHQpIC0+IHRoZWFkX2Vy
cmF0YV9wYXRjaF9mdW5jIChzZWN0aW9uOiAuaW5pdC50ZXh0KQo+ID4+Pj4KPiA+Pj4+IEZpeGVz
OiBiYjNmODk0ODdmZDkgKCJSSVNDLVY6IGh3cHJvYmU6IFJlbW92ZSBfX2luaXQgb24gcHJvYmVf
dmVuZG9yX2ZlYXR1cmVzKCkiKQo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogUmFuZHkgRHVubGFwIDxy
ZHVubGFwQGluZnJhZGVhZC5vcmc+Cj4gPj4+PiBDYzogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNu
dGVjaC5kZT4KPiA+Pj4+IENjOiBQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5j
b20+Cj4gPj4+PiBDYzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KPiA+Pj4+
IENjOiBBbGJlcnQgT3UgPGFvdUBlZWNzLmJlcmtlbGV5LmVkdT4KPiA+Pj4+IENjOiBsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPj4+PiBDYzogQ29ub3IgRG9vbGV5IDxjb25vckBr
ZXJuZWwub3JnPgo+ID4+Pj4gQ2M6IEV2YW4gR3JlZW4gPGV2YW5Acml2b3NpbmMuY29tPgo+ID4+
Pj4gLS0tCj4gPj4+Cj4gPj4+IFRoYW5rcywgUmFuZHkuIEknbSBjb25mdXNlZCBhdCBob3cgSSBk
aWRuJ3Qgc2VlIHRoYXQgd2hlbiBJIG1hZGUgdGhlCj4gPj4+IG9yaWdpbmFsIGZpeC4gSSBmZWVs
IGxpa2UgcmVwcm8gb2YgdGhlc2Ugc2VjdGlvbiBtaXNtYXRjaCBlcnJvcnMKPiA+Pj4gZGVwZW5k
IG9uIHNvbWUgb3RoZXIgZmFjdG9yIEknbSBub3QgdW5kZXJzdGFuZGluZy4gSW4gYW55IGNhc2U6
Cj4gPj4KPiA+PiBQZXJoYXBzIHlvdSBoYWQgYSBjdXQtZG93biBjb25maWcgdGhhdCBkaWQgbm90
IGVuYWJsZSBlaXRoZXIgb2YgdGhlCj4gPj4gcmVsZXZhbnQgQVJDSF8gb3B0aW9ucyB0byBnZXQg
dGhvc2UgZXJyYXRhIGNvbXBpbGVkPwo+ID4KPiA+IEl0IHdhcyB3ZWlyZCwgbXkgb3JpZ2luYWwg
ImZpeCIgKHRoZSBvbmUgbGlzdGVkIGluIHRoaXMgRml4ZXMgdGFnKSB3YXMKPiA+IG5lZWRlZCBi
ZWNhdXNlIHdoaWxlIHRoZSBod3Byb2JlIHNlcmllcyB3YXMgY2xlYW4gb24gUGFsbWVyJ3MgYnJh
bmNoLAo+ID4gaXQgZ2VuZXJhdGVkIGEgInNlY3Rpb24gbWlzbWF0Y2giIG9uIGxpbnV4LW5leHQu
IEFzIG5vdGVkIGhlcmUsIGl0IHdhcwo+ID4gb25seSB3aXRoICFDT05GSUdfTU9EVUxFUywgc28g
SSBleHBsaWNpdGx5IHJlbWVtYmVyIGdlbmVyYXRpbmcgdGhhdAo+ID4gY29uZmlnIGFuZCBjaGVj
a2luZyBpdCBvbiBsaW51eC1uZXh0IHRvIGdlbmVyYXRlIHRoaXMgImZpeCIsIGFuZCBpdAo+ID4g
Y2FtZSBvdXQgY2xlYW4uIEl0J3MgbGlrZSB0aGUgcm9ib3RzIGFyZSBnZXR0aW5nIHNtYXJ0ZXIu
Cj4gPiAtRXZhbgo+Cj4gSSBvYnNlcnZlZCB0aGUgcHJvYmxlbSBpbiA4IG91dCBvZiAyMCByYW5k
Y29uZmlnIGJ1aWxkcywKPiB1c2luZyBsaW51eC1uZXh0IDIwMjMwNDI3LgoKT2ggaW50ZXJlc3Rp
bmcsIHNvIG5vdCB0aGUgc3RvY2sgazIxMF9ub21tdSBkZWZjb25maWcuIFRoYXQgbWFrZXMgbWUK
ZmVlbCBhIGxpdHRsZSBiZXR0ZXIgYXQgbGVhc3QuCi1FdmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
