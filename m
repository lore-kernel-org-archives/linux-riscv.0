Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E346C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 11:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Kuvn8elIWcmkAh+tU7Ki+6zjJQR9N+0gJgLQMt5zvs=; b=xOb35l0z4CPm+O
	11KCnWt4NHdiNdmn4qvIeexM+vaUXJH7A16Su55WTkiuSBJSaNq38QIHHFDA1bUVLZ8hinft1+4y7
	IJTZ85auEDvbGLsbZBjha2E/TwUNkkYB1Xt99/JB2fgczOfxTpN6AQJxyUZ//euMVIF+/y8JD705Q
	wrdO0qOnwcJYyAXYM8/fS+q5GWSBKRhZBjasZ5iSz2X065qS1NeDpmUVkxJHCIsHxMl0tvA6wUCo6
	264eE37iletk0lZbMRKanctG6ef9GIvgwKvaxt85YCdX8deT4bhph9Hmy/vAiSsyKM7h6P4SAlP5d
	Y6SH7FckRoMz/IL6AC4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxR0w-008DAl-IT; Tue, 22 Nov 2022 11:00:30 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxR0t-008D9J-Db
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 11:00:28 +0000
Received: by mail-ed1-x52b.google.com with SMTP id l11so20089088edb.4
        for <linux-riscv@lists.infradead.org>; Tue, 22 Nov 2022 03:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dx58DAv+1aiUMkVrUatdB4Y9xKdBD59doksYCTdqrn4=;
        b=jFw/kT0JTfKMbkPkL7R2d2PcP/Y8ySQk13xry3b+8Lyz1UomUUAyBWrbj/MYHuuNCs
         R9xJ4r02Q1hIfYekFQtr0G+O0jPxtlYqCcoZUIyL682YJhUEkW3qJ/6EFzyHjVoYcp9A
         udwrsSHUG7VFq3k6CSryIk3AbHw1Y4P/3aBhaajoNmyuzs1jKUolP+gemt3ajKMvfuwo
         gBqNvar4yAq00xYi3Eg/ohz7LcX/qhc5w5ZT2DpPb1RWljj80Uee9aYt945gL/I7/d7/
         L4EnM0yJJmL54qOTc++kRntvGrt54xYHJCK+XDCveil9uOhjjD4bPgqcahx6b2J8X6WW
         fmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dx58DAv+1aiUMkVrUatdB4Y9xKdBD59doksYCTdqrn4=;
        b=n/xHGKV/+9wf8dNFsPDVAVnqDoa7n6cmRcwo1siHKzoN90o+bUUfHaXU8h8nEIEzij
         Al2BkqmvvEoxQtItqOgHabRRH7NzpESipQRd3Dlyt/a+7fDuj0Ph4KHPFNfXNU/Fd0uC
         EVMCl1HEr5WZpcmf1vgG183S3f+wGsSK5kfSWrailq51xgOiclZQl29nFMIPneJ8h96O
         060gjjX8db91NFMPWJJvzog6N2lHLEACjyHS/vD8cIkE4vS+vWJ+y4TADi61Ii8eIYdh
         NbTRvNwzCdZ+biOwSSc+e5eV8CdlXcecEH0O3eGKWiSGHLb06mkWf3lBfkHa4OPsjXZ0
         4hig==
X-Gm-Message-State: ANoB5pl11wj8z5Prh+6zcEhf5CumkcvIgJAgXnhAHrWj8AhTNTjxTFym
	WjMAuhDN6hLBfYVflmTc30udAJTxrTBOYkVSOc2+X8vE676+sw==
X-Google-Smtp-Source: AA0mqf4Tju0YCYCuezCVDW/4HfBrJgLX6/AuX8alzZ8InSY50PNYzBgg6ZOX17rKd94Wjs5Sc8UNI5kbbDgck/IgoM4=
X-Received: by 2002:aa7:cc08:0:b0:461:8a43:e93 with SMTP id
 q8-20020aa7cc08000000b004618a430e93mr19676530edt.275.1669114823871; Tue, 22
 Nov 2022 03:00:23 -0800 (PST)
MIME-Version: 1.0
References: <20221110164924.529386-1-heiko@sntech.de> <CA+V-a8vSVY590SUkg81cC8Kq7FjzxdcJ5m2VG=94m0ntis7+8w@mail.gmail.com>
 <CA+V-a8sqEjLKdGm67Sm5YbYUVRuntAM0Wqw_Gk+V6i9x+b1Exg@mail.gmail.com> <14108757.uLZWGnKmhe@diego>
In-Reply-To: <14108757.uLZWGnKmhe@diego>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 22 Nov 2022 10:59:57 +0000
Message-ID: <CA+V-a8u=vrrvhWCo+W28kbogMYHULuO3B6qcDeAEPEgzp+sVWg@mail.gmail.com>
Subject: Re: [PATCH 5/7] RISC-V: fix auipc-jalr addresses in patched alternatives
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu, 
	ajones@ventanamicro.com, emil.renner.berthing@canonical.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_030027_490897_C5DC47A0 
X-CRM114-Status: GOOD (  10.15  )
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

SGkgSGVpa28sCgpPbiBNb24sIE5vdiAyMSwgMjAyMiBhdCAxMDoxNyBQTSBIZWlrbyBTdMO8Ym5l
ciA8aGVpa29Ac250ZWNoLmRlPiB3cm90ZToKPgo+IEFtIE1vbnRhZywgMjEuIE5vdmVtYmVyIDIw
MjIsIDIyOjMxOjM2IENFVCBzY2hyaWViIExhZCwgUHJhYmhha2FyOgo+ID4gSGkgSGVpa28sCj4g
Pgo8c25pcD4KPiBBcyBlaXRoZXIgbWFudWFsbHkgb3Igd2l0aCBhIGhlbHBlciBsaWtlCj4KPiAg
ICAgICAgIGh0dHBzOi8vbHVwbGFiLmdpdGxhYi5pby9ydmNvZGVjanMvI3E9MHhmNGMwODBlNwo+
Cj4geW91IGNhbiB0aGVuIGRlY29kZSB0aGUgYWN0dWFsIGluc3RydWN0aW9uIGFuZCBjb21wYXJl
Lgo+Cj4gSW4geW91ciBsb2cgdGhlIHR3byBqYWxyIGluc3RydWN0aW9ucyBkZWNvZGUgdG8gZGlm
ZmVyZW50IG9mZnNldHMsCj4gICAgICAgICBqYWxyIHgxLCB4MSwgLTE4MAo+IHZzCj4gICAgICAg
ICBqYWxyIHgxLCB4MSwgLTgzNAo+Cj4gQ2FuIHlvdSBjaGVjayB3aGF0IHRoZSBwYXRjaF9vZmZz
ZXQgdmFsdWUgaXMgaW4geW91ciBjYXNlPwo+CnBhdGNoX29mZnNldCBmb3IgdGhlIGFib3ZlIGNh
c2UgaXMgLTY1NC4KCkNoZWVycywKUHJhYmhha2FyCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
