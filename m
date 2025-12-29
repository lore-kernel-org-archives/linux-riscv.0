Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694B1E784BE
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 01:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eN3d1duIoxnZfQtYrB0q1WrP/wSPXI71kgzS7WT+CqQ=; b=bMooT8KzvygiGH
	XQne8oxNXNaTDcoXR5ipcUndbnaD7442x95Nww8cdpCNXf6z0Tz+z9bTRGO++tK4cqHFn5WisqNYz
	PtmEPycsXrSkTwTJqhrioOziy2kqgsc4yDfVJtDW8tzlprVNxzax7KBVXMZUkKvb9FwUle/bID0ol
	7M9SxPCFzGO4NIw3Ho1zGU52ky/DQqLyxM8W19tdJBN+Q9ktEgCXGVjTHgQye/SrJR1Id3JK553pe
	OHpj32PVROJFiHApfAoNvPHTf9vlpfn/zBajt8v82Xg7mqdfb+jSzXUg8Lx1qPrtZDu/IVU3jTJnx
	X5gVegJCOhkGXKNvfWFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va1kb-00000003AmI-3pnM;
	Mon, 29 Dec 2025 01:08:45 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va1kZ-00000003Alp-0Xnr
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 01:08:44 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-787da30c53dso81638017b3.0
        for <linux-riscv@lists.infradead.org>; Sun, 28 Dec 2025 17:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766970521; x=1767575321; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1UE85kVGf+q8GmraHlXZAv1blLIu7cHa4ZcemBTV+hE=;
        b=ird2x9zUns44mJAd0vGt7JNZY7q3WceChnJMGrHnbFitaDn+Va1Yb/TPCxIpJ6u16W
         56BJR8Lc4BGmGASU6v6DyVixyihEp8Q0vLjNpfbC1ihW5bWrU5ueyGk0HEoWYcHH3Par
         rOwzD6hUdrMsdzmgh+P/jSBrm0bLAvs9odtQOxXKC3Pg5HjnzpcyAxSHPWaIOFfNgMff
         1QYqSN6UHpzlW1R5sMd6cxrXQ/OAIzoBuLnUIYzm8HMhO4YJqK5hd/VFvcneSCTh+pY6
         BN12Ca2mwE5XCcwll4IOO5dM+CYUoa6NhLZqaEACf+LGUJnqwrCYLQNFO7acnUOgDjGD
         tn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766970521; x=1767575321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1UE85kVGf+q8GmraHlXZAv1blLIu7cHa4ZcemBTV+hE=;
        b=Wc8mUiFtdXh3Ghf99v2OkqZXP4UzCaOUVVp0lY4/Fqn88PKEtZT/wgk41uoUULvVri
         Kzv7k2TAL3XV/MIs/Aqf/Vt0nTGwEafTwjn35dMYMVtRyWlsP42XLOyGF9C8p1B1DslG
         SgOO7vVUXGtZbBFdnHanHI6k258aH0Pd331kYzvu68LK0TMeKc0AjqIitjQmdCjpJ5Tg
         r/oNFCCgK45+v+9RAzHmQtzKnScrRzfXR954lLCbAXvbOxu7+ew7zk/2i/G27ilfviWs
         03uzKoUF8tH6YJE9UHvsYTqg4g6yJUjRoLjAd5DJHD/aWbt1l3esIS4YnO5JYRJQcMgL
         F7Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXAmJtchW7OJhw/vhWXY+FJm1irMxBqTSGjQ9QsUgOliu2f2TY/FHD7NQfwxjgQbwZhL9rlegK2lXMDjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwECSyJEDAXQ/66LO1wdtEai50Nru+h2DDhcn8eqKYto2f7dRIN
	dAYWJnp3yo941h3NbfDbKNM0isUBUtJ5paVcn811nOK2s5iw1M+YvtZ1dRiw2ajQS5LAUkxBnJ+
	NfQsQVqMZu2dmnqhY90fkoSSsMvMRFazuzQolY+WyPg==
X-Gm-Gg: AY/fxX6kj/onFGEeN1AiuId9Cq6ULN1PMAnBAm5+D2+nkGNoQ46VTuDBGDCHGDzmCCH
	BNT1NRDFK9hs7cEH0ONvefOE2lCDuj7J57oh7VWMKmIuhYn3Y6cJY6jKonb/yGSoi9lffV9w9k4
	GlFeH2g18LS6HdHxmN2+IZtiuDUKORBsaJzoRbftAexx2X1ZZqx1YSpj1pxFWcq7O60VzN5vviC
	/iG3AzuybQ0iSy66RgWtWjFWbjJmIJINlpV4tPYd/adN+3rN+5xefeHMv9gQ34KNeGbjAzDHMY5
	VMctpVpz1woDcetYbLeBtHxzlF4UM14Azy+mi155WW3f
X-Google-Smtp-Source: AGHT+IGlhu2CzzIyPT/4Xs4SuTdCSDyVQF/LBTPCx5u8EgG/qGO3ektOwcMaY7F0RocF4UkJ/Asz5Nn328g1rSwFXmQ=
X-Received: by 2002:a05:690c:6186:b0:78f:a615:2739 with SMTP id
 00721157ae682-78fb418785cmr210976517b3.55.1766970521358; Sun, 28 Dec 2025
 17:08:41 -0800 (PST)
MIME-Version: 1.0
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-7-3af3f3cd0f8a@riscstar.com> <20251222-stitch-preachy-3fab87fd6f0f@spud>
 <CAH1PCMZ7ywZ3unLy0yHYK+fFHk0y=q2cEtPnRi=qSpf=fc75rw@mail.gmail.com>
 <66c0676a-7920-4825-b916-3c00b1648a08@riscstar.com> <CAH1PCMbBURb=DpChf+Y-DjYjzpXG-pKgoaHAu=TUuG4oVC56cg@mail.gmail.com>
 <5979c8ef-b0fa-40c8-944d-96e226fbcbe8@riscstar.com>
In-Reply-To: <5979c8ef-b0fa-40c8-944d-96e226fbcbe8@riscstar.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 29 Dec 2025 09:08:30 +0800
X-Gm-Features: AQt7F2pCBTgDDH1FNzfMutsdekE-nmpYuROoap71sR-N9Z3O3k31kEU3EyBRcKQ
Message-ID: <CAH1PCMZkQ11-Uk5GnyetLkNLOuO3gs2o0WPWHrFMWVH9R6s8mQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] dt-bindings: riscv: Add B ISA extension description
To: Alex Elder <elder@riscstar.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Andrew Jones <ajones@ventanamicro.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-serial@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_170843_180155_30B427A4 
X-CRM114-Status: GOOD (  18.93  )
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

T24gTW9uLCBEZWMgMjksIDIwMjUgYXQgNzo1MOKAr0FNIEFsZXggRWxkZXIgPGVsZGVyQHJpc2Nz
dGFyLmNvbT4gd3JvdGU6Cj4KPiBPbiAxMi8yNy8yNSA4OjUxIFBNLCBHdW9kb25nIFh1IHdyb3Rl
Ogo+ID4+IFRoYXQncyB3aGF0IEkgdW5kZXJzdGFuZCBpdCB0byBtZWFuLCBhbnl3YXkuCj4gPj4g
ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1iCj4gPj4KPiA+PiBUaGVyZSdzIG5v
IHBvaW50IGluIHN1cHBvcnRpbmcgImIiIGluIGRldmljZXRyZWUgdG8gcmVwcmVzZW50Cj4gPj4g
dGhlIG90aGVycyBpZiBpdCBhbHNvIHJlcXVpcmVzIHRoZSBvdGhlcnMgdG8gYmUgcHJlc2VudC4K
PiA+Pgo+ID4+IEkgdGhpbmsgdGhhdCwgaW5zdGVhZCwgImIiLCAiemJhIiwgInpiYiIsIGFuZCAi
emJzIiBzaG91bGQgYWxsCj4gPj4gYmUgYWxsb3dlZC4KPiA+Pgo+ID4+IEkgbWlnaHQgZXZlbiBn
byBmdXJ0aGVyIGFuZCBoYXJkZW4gdGhlIHJlcXVpcmVtZW50LCBzYXlpbmcgdGhhdAo+ID4+IGlm
IHlvdSBzcGVjaWZ5ICJiIiB5b3Ugc2hvdWxkKm5vdCogc3BlY2lmeSAiemJhIiwgInpiYiIsIG9y
ICJ6YnMiLgo+ID4gSGlzdG9yaWNhbCByZWFzb25zIGhlcmUuICJiIiBjYW1lIHRvbyBsYXRlLiBU
aGUgY2hpcCB2ZW5kb3JzIGhhdmUgcHVibGlzaGVkCj4gPiBjb3JlcyB3aXRoICJ6YmEiLCAiemJi
IiwgYW5kICJ6YnMiYWxyZWFkeS4KPiA+Cj4gPiBUaGF0J3MgYSBtaWdyYXRpb24gYnJpZGdlIHRv
IHJlcXVpcmUgImIiIG11c3QgYmUgbGlzdGVkCj4gPiB0b2dldGhlciB3aXRoIHRoZSBvdGhlciB0
aHJlZS4KPgo+IEFyZSB5b3Ugc2F5aW5nICJiIiBoYXMgYWxyZWFkeSBiZWVuIGluY2x1ZGVkIHdp
dGggInpiYSIsICJ6YmIiLCBhbmQKPiAiemJzIiBpbiBhbiBleGlzdGluZyBEVFMgZmlsZT8KCgpU
aGUgcmlzYy12IHJhdGlmaWNhdGlvbiB0aW1lbGluZSBpczoKImIiIHdhcyByYXRpZmllZCBpbiBB
cHIvMjAyNCwgd2hpY2ggaXMgYWJvdXQgMiB5ZWFycyBsYXRlciB0aGFuIGl0cwpjb21wb25lbnRz
IHpiYS96YmIvemJzICh0aGVzZSB3ZXJlIHJhdGlmaWVkIGluIEp1bi8yMDIxKS4KCkkgY2FuIGRv
IHRoaXMgaW4gbGludXgga2VybmVsLCB3cml0aW5nIGEgZHRzIGZpbGUgd2hpY2ggY29udGFpbnMg
b25seSAiYiIsCmJ1dCBubyB6YmEvemJiL3picy4gVGhlIGxpbnV4IGtlcm5lbCBjYW4gY29ycmVj
dGx5IGV4dGVuZCAiYiIgdG8gemJhL3piYi96YnMuCnBzOiBhZnRlciBJIG9yIHNvbWVib2R5IGFk
ZHMgdGhlIGxvZ2ljIGludG8gY3B1ZmVhdHVyZS5jLgoKSG93ZXZlciwgdGhlIHByb2JsZW0gaXMg
d2l0aCB0aGUgb2xkZXIgc29mdHdhcmUgd2hvIHJldXNlIGtlcm5lbCdzIERUUyBmaWxlcywKYW5k
IHJlY29nbml6ZXMgb25seSAnemJhL3piYi96YnMnLiAoSWYgeW91IHNlYXJjaCBpbiB0aGUgcmlz
Y3YvYm9vdC9kdHMsCnlvdSB3aWxsIG5vdGljZSBhIGxvdCBwbGF0Zm9ybXMgc3VwcG9ydHMgemJh
L3piYi96YnMuKQoKV2hlbiB0aGVyZSBpcyBvbmx5ICJiIiwgdGhlc2Ugb2xkZXIgc29mdHdhcmUg
bWF5IGp1c3QgZGlzYWJsZSB0aGUgZmVhdHVyZXMKcmVsYXRlZCB0byAnemJhL3piYi96YnMnLCBi
ZWNhdXNlIHdoZW4gdGhleSBkZXZlbG9wZWQgdGhlaXIgZmVhdHVyZSwKImIiIGRvZXNuJ3QgZXhp
c3QgeWV0LgoKSG9wZWZ1bGx5IEkgZXhwbGFpbmVkIHRoZSBsb2dpYyBjbGVhciB0aGlzIHRpbWUu
CgpCUiwKR3VvZG9uZwoKPgo+IFdoYXQgSSdtIHN1Z2dlc3RpbmcgaXMgdGhhdCAodW5sZXNzIHNv
bWVvbmUgaGFzIGFscmVhZHkgZG9uZSB0aGlzIGluCj4gYSBEVFMgZmlsZSksIHRoZXJlIGlzIG5v
IHJlYXNvbiB0byByZXF1aXJlICJiIiAqYW5kKiB0aGUgb3RoZXIgdGhyZWUuCj4gWW91IHNob3Vs
ZCBhbGxvdyBlaXRoZXIgImIiICpvciogYWxsIG9mIHRoZSBvdGhlciB0aHJlZSwgbm90IGJvdGgu
Cj4gVGhhdCB3b3VsZCBzdXBwb3J0IG9sZGVyIHBsYXRmb3JtcyBhcyB3ZWxsIGFzIG5ld2VyIG9u
ZXMgdGhhdCB1c2UKPiB0aGUgbW9yZSBjb25jaXNlICJiIiBvbmx5Lgo+Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIC1BbGV4CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
