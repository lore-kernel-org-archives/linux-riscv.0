Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727CAEB8FAF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 12:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ehI4rnryoC/lMU+RHEKhoEEXY21KTM4rocTAvgwQebA=; b=GoO5lKfm8LtmCp
	bKrFQyYaGN+nSEMECXldUzUvCxc74xBeVek4rR8byBDUmPoalK5LnEqXHYVZPfPJC/YIfW1hqoVZ8
	9rlCo0Tx/zdza8cYQZVoFeUPE2gZW49Veo2q6aikaS2ubyLyrcvTkLc3fFB1ChagPi81FnDSQpVaV
	j8A3X5tGnH7tPAvccsV0ASENixKBgIETI6yQ7BQDfXFhIydRQGCn8ORkL0nyy0atsZ56xAZYI1hQI
	Wf62Bm1CyyOr5hKPzkPWIHJDgQNmEg2is1H3M2My0OfNnAGbUK74B9JjHO3FlGZEnEASmP0P9L96a
	V3ZqynKwSKb0mLJ383HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdrUj-009IdT-0C;
	Wed, 06 Sep 2023 12:18:53 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdrUg-009IYh-31
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 12:18:52 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-402be83929eso35160005e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 06 Sep 2023 05:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694002727; x=1694607527; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCatPaNtALkNNK4KsoXQ8WAXqz9RrcLBBDmwLPI3Vw0=;
        b=Ke68RQsIVUnj6UeRJ9yNbkqdv5WamZYI2TRdSRNUpHbEscat9eihtkGXvWlqCXPEcL
         dY176Q814kQfWTNbS8Dmb24mrdR6d0+Repi0bGFoXaFeeJ6yAjjQbVW8T0OqIlZ0UL0X
         elw5ylAjI1pPVupVSHqJeq5ZalQDkkZJ+wAawBGE5vNQpggIw5EO3cq394GHzUJ6+n8J
         uu5bxcsZoVgBtROA/sHQB08ld+l0kj4AZMoqPnn4pNY1hjIdtk2KI+OvzuzjzhZ17/4P
         LoelXjrJOFvDY3cZaXWv9Ptq/dhAI7y0iVCwQqKtJFjdZ7U7QV9Qs3hFduHtfm8Ll0lZ
         B/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694002727; x=1694607527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uCatPaNtALkNNK4KsoXQ8WAXqz9RrcLBBDmwLPI3Vw0=;
        b=SEEXAmb1yQUBMJgbNsuADzgcTTyX1Gp2LC17Dx4ApzzT98g7PY8vBHyEiD3k0sI2jk
         IqWzhuJakraYwCBg1zGpRbEmoEMhuv+2uPLcJGdYekZaqBMDsNztkoXtySXr1VaOtv5P
         QZCMv1QAXZsO+wz1268GvuyPbia+DmaUBNc0n43P6L4khI/Uxbc5I5HlB7wh8+0q0aXe
         QHMXR1UWcbPG6eaPCmEgVIqVGCib9l7A0aun+Rp01d/soqF3GuBMOh93PVEkbAnvx6ZY
         WxOdUGem8I/TpHwx3f/kN6qvBKRKy8mCSKsfcRwq18SIpi7GZfHcLHxg0I69bEFKhiIz
         C44w==
X-Gm-Message-State: AOJu0Yz7et1qhUqeJdgQQzwyHCl7lSa25cxE/qfL3o+MZ6/hCKXamYV7
	xxgD09AoBlIbjGURCQYjWOmc6C+i8+5FIk2xEfzwVvUOFmjN6FF4
X-Google-Smtp-Source: AGHT+IHr5EDmAZjNEiPKlcvR7awkoi1CNbTcJGcicRFsNZbpcWizj4wm9k/5LZIJTpywY2sKGNbDzYOdptyCzoRBUHk=
X-Received: by 2002:adf:f011:0:b0:31c:8257:2c78 with SMTP id
 j17-20020adff011000000b0031c82572c78mr2105408wro.52.1694002726940; Wed, 06
 Sep 2023 05:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230801085402.1168351-1-alexghiti@rivosinc.com>
 <20230801085402.1168351-5-alexghiti@rivosinc.com> <CA+V-a8t56xDqMTQfoKcsvPF8errkTMydaDz5V6nejLvVfJrW3g@mail.gmail.com>
 <CAHVXubiENHt36LrcSBoNU0rAMQ8EoT6tde9M8vLP3Hw2nwMm8g@mail.gmail.com> <CA+V-a8vJJFCKy3pCL2Qp1NogL-K5s9moGDbv3tTvx+z1FeKarw@mail.gmail.com>
In-Reply-To: <CA+V-a8vJJFCKy3pCL2Qp1NogL-K5s9moGDbv3tTvx+z1FeKarw@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 6 Sep 2023 14:18:35 +0200
Message-ID: <CAHVXubhLB9Pw51C1ed1Youp9k0qTJKrokUAqf=Xnr+m3BoN5=g@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] riscv: Improve flush_tlb_kernel_range()
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Vincent Chen <vincent.chen@sifive.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_051850_987668_81848397 
X-CRM114-Status: GOOD (  28.28  )
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

T24gV2VkLCBTZXAgNiwgMjAyMyBhdCAyOjA54oCvUE0gTGFkLCBQcmFiaGFrYXIKPHByYWJoYWth
ci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPgo+IEhpIEFsZXhhbmRyZSwKPgo+IE9uIFdlZCwg
U2VwIDYsIDIwMjMgYXQgMTowMeKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9z
aW5jLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgUHJhYmhha2FyLAo+ID4KPiA+IE9uIFdlZCwgU2Vw
IDYsIDIwMjMgYXQgMTo0OeKAr1BNIExhZCwgUHJhYmhha2FyCj4gPiA8cHJhYmhha2FyLmNzZW5n
Z0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBIaSBBbGV4YW5kcmUsCj4gPiA+Cj4gPiA+
IE9uIFR1ZSwgQXVnIDEsIDIwMjMgYXQgOTo1OOKAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBUaGlzIGZ1bmN0aW9uIHVz
ZWQgdG8gc2ltcGx5IGZsdXNoIHRoZSB3aG9sZSB0bGIgb2YgYWxsIGhhcnRzLCBiZSBtb3JlCj4g
PiA+ID4gc3VidGlsZSBhbmQgdHJ5IHRvIG9ubHkgZmx1c2ggdGhlIHJhbmdlLgo+ID4gPiA+Cj4g
PiA+ID4gVGhlIHByb2JsZW0gaXMgdGhhdCB3ZSBjYW4gb25seSB1c2UgUEFHRV9TSVpFIGFzIHN0
cmlkZSBzaW5jZSB3ZSBkb24ndCBrbm93Cj4gPiA+ID4gdGhlIHNpemUgb2YgdGhlIHVuZGVybHlp
bmcgbWFwcGluZyBhbmQgdGhlbiB0aGlzIGZ1bmN0aW9uIHdpbGwgYmUgaW1wcm92ZWQKPiA+ID4g
PiBvbmx5IGlmIHRoZSBzaXplIG9mIHRoZSByZWdpb24gdG8gZmx1c2ggaXMgPCB0aHJlc2hvbGQg
KiBQQUdFX1NJWkUuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hp
dGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gPiA+ID4gUmV2aWV3ZWQtYnk6IEFuZHJldyBK
b25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaCB8IDExICsrKysrLS0tLS0KPiA+ID4gPiAgYXJj
aC9yaXNjdi9tbS90bGJmbHVzaC5jICAgICAgICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLQo+ID4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDE0
IGRlbGV0aW9ucygtKQo+ID4gPiA+Cj4gPiA+IEFmdGVyIGFwcGx5aW5nIHRoaXMgcGF0Y2gsIEkg
YW0gc2VlaW5nIG1vZHVsZSBsb2FkIGlzc3VlcyBvbiBSWi9GaXZlCj4gPiA+IChjb21wbGV0ZSBs
b2cgWzBdKS4gSSBhbSB0ZXN0aW5nIGRlZmNvbmZpZyArIFsxXSAocnovZml2ZSByZWxhdGVkCj4g
PiA+IGNvbmZpZ3MpLgo+ID4gPgo+ID4gPiBBbnkgcG9pbnRlcnMgb24gd2hhdCBjb3VsZCBiZSBh
biBpc3N1ZSBoZXJlPwo+ID4KPiA+IENhbiB5b3UgZ2l2ZSBtZSB0aGUgZXhhY3QgdmVyc2lvbiBv
ZiB0aGUga2VybmVsIHlvdSB1c2U/IFRoZSB0cmFwCj4gPiBhZGRyZXNzZXMgYXJlIHZtYWxsb2Mg
YWRkcmVzc2VzLCBhbmQgYSBmaXggZm9yIHRob3NlIGxhbmRlZCB2ZXJ5IGxhdGUKPiA+IGluIHRo
ZSByZWxlYXNlIGN5Y2xlLgo+ID4KPiBJIGFtIHVzaW5nIG5leHQtMjAyMzA5MDYsIEl2ZSBwdXNo
ZWQgYSBicmFuY2ggWzFdIGZvciB5b3UgdG8gaGF2ZSBhIGxvb2suCj4KPiBbMF0gaHR0cHM6Ly9n
aXRodWIuY29tL3ByYWJoYWthcmxhZC9saW51eC90cmVlL3J6Zml2ZS1kZWJ1ZwoKR3JlYXQsIHRo
YW5rcywgSSBoYWQgdG8gZ2V0IHJpZCBvZiB0aGlzIHBvc3NpYmlsaXR5IDopCgpBcy1pcywgSSBo
YXZlIG5vIGlkZWEsIGNhbiB5b3UgdHJ5IHRvICJiaXNlY3QiIHRoZSBwcm9ibGVtPyBJIG1lYW4K
d2hpY2ggcGF0Y2ggaW4gdGhlIHNlcmllcyBsZWFkcyB0byB0aG9zZSB0cmFwcz8KClRoYW5rcyEK
CkFsZXgKCj4KPiBDaGVlcnMsCj4gUHJhYmhha2FyCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
