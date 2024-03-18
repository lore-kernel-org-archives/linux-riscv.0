Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC12BC54E5D
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 20:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1nFnsvwiAU6hv5psfegqBjiB/eGG4kZ/v+mggK+R9pI=; b=Gs5VwL8wZ5Yv4V
	+8r/fI+MI9bEBaRu6nPX4R3GLRebIppJL0/7mOEWs6QA8RcmPPaJv4E6clGk4gAeghIhxXF4or9dg
	es9VfcDz3a1lw8WYj8so+qFyY/bSG45az0VOVOrFDLeM/49+SHpsxqhj/7uQxg82qzE1p0wrwjhkk
	jHZ6006dM1daKzCHzWYB2WSRd8lFzFMhSrxZkWt47xwGOtOKHBgLgpFYZlQEDPmvayktDNWgMMD8e
	mIPTyifJcAGLjsbsXIsb1FvgDBKlYvDPB1939ZgK2d/YoAPmG79LTL0y1ntOrR/PnzeIbaAgtT2lU
	VHAStZ/Y2+YylNsw4kdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmJw7-0000000A5x5-3pFP;
	Mon, 18 Mar 2024 20:50:23 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmJw4-0000000A5v3-3sRG
	for linux-riscv@lists.infradead.org;
	Mon, 18 Mar 2024 20:50:22 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2d46c2e8dd7so61997961fa.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2024 13:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710795017; x=1711399817; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHRgE6/IgctR0Ep2SgF+2Hfez6Kkw0CgJoJ87vaI93w=;
        b=Ogn4bbTsgXQCjspypMc5HmEhN99aR8zrCU2p8pBVFZsExchD4refmmunQ6KXtixXDs
         9Qx/f+vUnT71DWgi9r0fY5W0nAuo9eAX34lv0wW7brVyw0Lp7a0faIUEadDub+cms1fX
         +S1MlzxgUwc0FGLPE6qlnFpDaKifhihR+6UzDZ7b6hWflLhXYkBuDJXUxCwgU2tsdY19
         xL773lOIxiYxs45iSZ2EvO9DL0Flk3plyO7dxFtQGXZFSIPc9++MdSnJA2i3kv+YHl1c
         SmIlEtozin2PkWVn3mLgU6u4+BAoqzrY/nv45svstZSZVtyYNfy/3DCsWjSEXzqBx6qv
         uLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710795017; x=1711399817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHRgE6/IgctR0Ep2SgF+2Hfez6Kkw0CgJoJ87vaI93w=;
        b=gQmuNpDxiiWaB1ujzueX/0FQzw5JY3MV4sWEkXkv5KpnTOYPnoBWBIO8LJ1uFg16If
         1hsiRVwb5OmRsS8N3BSjJLvLlh8MMYk7IRK4vZEjGi0ujrus8GVFHQfQIU34HQ+6qmXW
         naroiR8FDqf1tZnCQiuONfIDBmlycRXisrHnme+0yj7bF6zeTY0oof9FXBfgIgXiGuRw
         tUQffm3Woei0Z9WaglonoHa3Yjl8IPtVTKiSncMphH658ekeNz1IJJpbT0YQ2t4/TMg9
         16SZ22rGT9T95abhnG6VpARTkZ/Vg0UN6sMwxGQvhSKvCVn92/Gh4HPNi9Ge6X/GCEO3
         TnpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUy54kwrAhLRCFcWai7qRMoYWdpX5PUZHSa2zu3y6Bew2nKtmOitBaK11AGme3rfGKoey4XcK1p9buGsFrVzmBvXPLkDKsplIMZC6akdLv
X-Gm-Message-State: AOJu0YxtePlncHJxnlu/AqbAxYGkg2z9l54U7eVQn15saac9wmDwaOo1
	93sDB5KTd+4hah5xiYJaAdr/YazOaq3Nqtmi25L08e7IE3wU7prgo44PIyWzNyyjduZ62dsEB8A
	TKH2ka069DiDVKqQ0D4Woj+X979fWpZi4RdEogSsc57z9JfSzOSU=
X-Google-Smtp-Source: AGHT+IG4mZw/msBlmDYdTb/X+VBE0lSzurU7xQsnOumWDXXMy3rl8xZjx6ZQSxAzilNKkMA+kWJK9c4rb204HPimdiQ=
X-Received: by 2002:a05:651c:333:b0:2d4:5a99:8b73 with SMTP id
 b19-20020a05651c033300b002d45a998b73mr7544077ljp.38.1710795017252; Mon, 18
 Mar 2024 13:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240313180010.295747-1-samuel.holland@sifive.com>
In-Reply-To: <20240313180010.295747-1-samuel.holland@sifive.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 18 Mar 2024 21:50:06 +0100
Message-ID: <CAHVXubjLWZkjSapnsWJzimWg_2swEy7tQ-DQ6ri8yMk8-Qsc-A@mail.gmail.com>
Subject: Re: [PATCH] riscv: Define TASK_SIZE_MAX for __access_ok()
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	Charlie Jenkins <charlie@rivosinc.com>, Guo Ren <guoren@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Xiao Wang <xiao.w.wang@intel.com>, 
	Yangyu Chen <cyy@cyyself.name>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_135021_119627_AB729C75 
X-CRM114-Status: GOOD (  19.80  )
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

SGkgU2FtdWVsLAoKT24gV2VkLCBNYXIgMTMsIDIwMjQgYXQgNzowMOKAr1BNIFNhbXVlbCBIb2xs
YW5kCjxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IFRBU0tfU0laRV9NQVgg
c2hvdWxkIGJlIHNldCB0byB0aGUgbGFyZ2VzdCB1c2Vyc3BhY2UgYWRkcmVzcyB1bmRlciBhbnkK
PiBydW50aW1lIGNvbmZpZ3VyYXRpb24uIFRoaXMgb3B0aW1pemVzIHRoZSBjaGVjayBpbiBfX2Fj
Y2Vzc19vaygpLCB3aGljaAo+IG5vIGxvbmdlciBuZWVkcyB0byBjb21wdXRlIHRoZSBjdXJyZW50
IHZhbHVlIG9mIFRBU0tfU0laRS4gSXQgaXMgc3RpbGwKPiBzYWZlIGJlY2F1c2UgYWRkcmVzc2Vz
IGJldHdlZW4gVEFTS19TSVpFIGFuZCBUQVNLX1NJWkVfTUFYIGFyZSBpbnZhbGlkCj4gYXQgdGhl
IGhhcmR3YXJlIGxldmVsLgo+Cj4gVGhpcyByZW1vdmVzIGFib3V0IGhhbGYgb2YgdGhlIHJlZmVy
ZW5jZXMgdG8gcGd0YWJsZV9sWzQ1XV9lbmFibGVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2FtdWVs
IEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4gLS0tCj4KPiAgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9wZ3RhYmxlLTY0LmggfCAxICsKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wZ3RhYmxlLmggICAgfCAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykK
Pgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUtNjQuaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS02NC5oCj4gaW5kZXggYjk5YmQ2NjEwN2E2Li5h
Njc3ZWYzYzBmZTIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxl
LTY0LmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUtNjQuaAo+IEBAIC0x
Nyw2ICsxNyw3IEBAIGV4dGVybiBib29sIHBndGFibGVfbDVfZW5hYmxlZDsKPiAgI2RlZmluZSBQ
R0RJUl9TSElGVF9MNCAgMzkKPiAgI2RlZmluZSBQR0RJUl9TSElGVF9MNSAgNDgKPiAgI2RlZmlu
ZSBQR0RJUl9TSVpFX0wzICAgKF9BQygxLCBVTCkgPDwgUEdESVJfU0hJRlRfTDMpCj4gKyNkZWZp
bmUgUEdESVJfU0laRV9MNSAgIChfQUMoMSwgVUwpIDw8IFBHRElSX1NISUZUX0w1KQo+Cj4gICNk
ZWZpbmUgUEdESVJfU0hJRlQgICAgIChwZ3RhYmxlX2w1X2VuYWJsZWQgPyBQR0RJUl9TSElGVF9M
NSA6IFwKPiAgICAgICAgICAgICAgICAgKHBndGFibGVfbDRfZW5hYmxlZCA/IFBHRElSX1NISUZU
X0w0IDogUEdESVJfU0hJRlRfTDMpKQo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3BndGFibGUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gaW5kZXgg
NjA2NjgyMmU3Mzk2Li4yMDMyZjhhYzVmYzUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9wZ3RhYmxlLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUu
aAo+IEBAIC04NjcsNiArODY3LDcgQEAgc3RhdGljIGlubGluZSBwdGVfdCBwdGVfc3dwX2NsZWFy
X2V4Y2x1c2l2ZShwdGVfdCBwdGUpCj4gICNpZmRlZiBDT05GSUdfNjRCSVQKPiAgI2RlZmluZSBU
QVNLX1NJWkVfNjQgICAoUEdESVJfU0laRSAqIFBUUlNfUEVSX1BHRCAvIDIpCj4gICNkZWZpbmUg
VEFTS19TSVpFX01JTiAgKFBHRElSX1NJWkVfTDMgKiBQVFJTX1BFUl9QR0QgLyAyKQo+ICsjZGVm
aW5lIFRBU0tfU0laRV9NQVggIChQR0RJUl9TSVpFX0w1ICogUFRSU19QRVJfUEdEIC8gMikKPgo+
ICAjaWZkZWYgQ09ORklHX0NPTVBBVAo+ICAjZGVmaW5lIFRBU0tfU0laRV8zMiAgIChfQUMoMHg4
MDAwMDAwMCwgVUwpKQo+IC0tCj4gMi40My4xCj4KCkkgdGhpbmsgeW91IGFsc28gbmVlZCB0byBj
aGFuZ2UgdGhlIGNoZWNrIGluIGhhbmRsZV9wYWdlX2ZhdWx0KCkgYnkKdXNpbmcgVEFTS19TSVpF
X01BWCBpbnN0ZWFkIG9mIFRBU0tfU0laRSwgb3RoZXJ3aXNlIHRoZSBmaXh1cCBjYW4ndApoYXBw
ZW4gKGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvYXJjaC9y
aXNjdi9tbS9mYXVsdC5jI0wyNzMpLgoKT3IgSSB3YXMgd29uZGVyaW5nIGlmIGl0IHdvdWxkIG5v
dCBiZSBiZXR0ZXIgdG8gZG8gbGlrZSB4ODYgYW5kIHVzZSBhbgphbHRlcm5hdGl2ZSwgaXQgd291
bGQgYmUgbW9yZSBjb3JyZWN0IChldmVuIHRob3VnaCBJIGJlbGlldmUgeW91cgpzb2x1dGlvbiB3
b3JrcykKaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9hcmNo
L3g4Ni9pbmNsdWRlL2FzbS9wYWdlXzY0LmgjTDgyLgoKVGhhbmtzLAoKQWxleAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
