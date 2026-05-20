Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61704CD4F54
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 06:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WmNijC6P9TE9P+j39yPZ03itY6yxYAL5gt9iDwW5XwQ=; b=nx+UZfqXRdF7aM
	nJJxr8dbcJJcI8lH6yyDQKiqeLO8sCbV+2YKMRNKS31ZChrRvbd7rKYaUtY1n0pOGgA00cuLgFLcb
	UbBnpkm/zDjLD+gOcB/zXTBNpZtE6BCkvNOO/HSu74SEPtY8Oy4LMf50KLTJGKWKKrai61hdaWEux
	rCZbHQ7FFMab4VhUR7X4neC4zipzWM3kc0fMJ40knbzjLIov08stWlBfR53beNjMry3UPJ2QdTd1m
	bHKlBcdvVf7KLpd7cd6VGSj1aaclKyqIXS+G//jmSag6WeZ+lEyOPhbDeDHrh74bUwc43dwyKUMbb
	m2zhIofhiHnippT426NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPZyK-00000003c7x-0LI1;
	Wed, 20 May 2026 06:00:00 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPZyH-00000003c7G-1Jy4
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 05:59:58 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-bd4f8260e4eso911958966b.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 May 2026 22:59:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779256795; cv=none;
        d=google.com; s=arc-20240605;
        b=R/ES9hlLHPBD0k/JZRqcME4Sbm5JqDioEfu8ZgDyCABLg4Oe7O3xFp5ZAVjKB9dWtx
         j8jrrXyn1Ds8cC/kKIMnmhbg/UaRFh23TK/gbN5siIaRzZMuKnu32L4b7MYh/G+er6Cd
         0yB0wZDJrTej7IJfhzDfVoMB+/PzFbxo43/Hc4QQJLW7/mTpZl8FeJLCAoDdCzJdbxYX
         1cjztjl23tSBdYwR2ZuDKmGcKex2SkUEyLjg8qGyGbf/P+sxgZZNOGmEEZpUwAjaAPWF
         c0x6mvAVJlLzp200DERU+om1RGnvPST0s8+rufWDx6Gy+HDsquYtchX9wwYsQmNzn/EN
         o/sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DAR8iI8vGQ3LRIZoO2PYV0dfXn6htz282dIf//zvfN4=;
        fh=pFlfKPXGwUcgpxotaeC+iutJV9LD61xe/xryWorrM2Y=;
        b=GQvd6ro9kRWk85C9uZbBxGzH6tH2Ooou1RnIOe9yfmU2HRTqBBq/RsVgN+V3DsZe75
         ShRybyLDXZeSKiPXrqKxj50fSFsa3lS04rZk4b/jkUe07sQ3NgiA6iVUkxOX8ttVwkt4
         E3r+IA6Slpsv7IG3SgFeD9LV4G/ps8ZWBswoUS/TwT8sOmMPqUi98gaAHQn7M2yavqoz
         8jqQSNAP3vH8myoE9ZLJ6ske2ATsQzBuj9YkoahawT8W7bSdF1z/Vq4B3ycKDdkjiRvN
         faxC2FhzaSczxFKUYaX1UsK2lPcrFAfajbjW1V25crTLvAf1XnpykX51aKyYhtxJ17d7
         DcIw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1779256795; x=1779861595; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DAR8iI8vGQ3LRIZoO2PYV0dfXn6htz282dIf//zvfN4=;
        b=csNg1vB6P+7iEVtGyDTR44UIgHylNBZ+r562hlagIXehI8j+UNzxzM/ffmRCgcUbCc
         0KXw3ve8FMI3gMkIojJ8zkbieIlhUJd49xjuPyNn00MtgwEqD+BZ6rb7pvoIYE57ptmq
         wkRYNTBMG3Dr30nx1o6+XJaWvTt8CFfpzPiXyIEftkWN7/HnHmViBy6xLp2UifS8/QXC
         Lqm/+5d4ZDkpVGF55snbPInH69x9l3X+hJB4vs20aG+Tjs5UUqO7aU6vlpWzewRItgCJ
         u4U3nDzUQCh6pK9f6yfsAfEdGlp2ApE9HvtVpKUec3YPy/WljTyZErkEAczMBV+MIm99
         Jdlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779256795; x=1779861595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DAR8iI8vGQ3LRIZoO2PYV0dfXn6htz282dIf//zvfN4=;
        b=YhiGayh8Knw2VIMbs+nMhzmfBjKn9aiqyauNZy6KE4/jtuTjDp3eiahy0o9bglBbYk
         SXNr3LB+mb7HQ3flOqMrV58JTV68KPWHGP/7750X0hix7K/y6f3j80FZL3tageh1xCB7
         hBXPSZxvV0+T9Gmos5wvKbbRt406RRSoW5MslRFVi7ayYJifyx4tvzgk0E3GsU3h8vB4
         MjGupAnSpuLYaPeRo4k97CLLbCdOqROgum2CjQaA+fErMxvc5QaWzX3/y/8Ct8mJ1elq
         wa1OHtBiOXGxU2W23Spv2R3B/kCFY75Vf73mtknE+dE9YsTTEz0hEY9t6CZ6fAmdWY5H
         Jprw==
X-Forwarded-Encrypted: i=1; AFNElJ/WBkLZEDasGHHbhhl4gnpy6PvZ8oVi2PC/vEwTdouXaG3Fd/feuYMHeJIX4qHEsxvoWWPg9bS7qk9v8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWdTFeQebIrjGgNHy7jmWs8a1Qpi2BCP5z96uqxxr4NNqaJp9c
	NGaxzqpSKx1MqwVS6qq9TqHVU+6larsMzoHFUeF8NWSwVJGQic9SLlLDDMorDaigAzbZrVyaxWW
	WGy6QK4LMKYh/J8Im1NqTTHY61CeQVNusEwAwdFGp2w==
X-Gm-Gg: Acq92OHMfoA9H7e5ry8IkUdlzwhZFAlDzP19nY8IDvYo7BOTEWy+WQEOv7slOI7pvc2
	zKw5NLAo/PvUEB4ye9cxTmnzVUeSuaxbr7Om2ofi4MEDIv90DVvltv9zPlIdMJQAP5/cxqBtosD
	AAlMAbz0k8sHXIg821O4YJk8n0ZJD/TdKNyGQuhRldBQyhKFUUiLnRSplVpSIeKPJyX0rW/UKfM
	paxQPY8aBGDUNYns+c6L65S+ZsngD7Rj+mp2wuUX0fFiyNO9HawaA9ydENv7+hXW+fJ+Tjc/XtE
	kMIICUg191HeKY2qll3X
X-Received: by 2002:a17:906:d503:b0:ba6:5728:39f7 with SMTP id
 a640c23a62f3a-bd5178fa622mr899244666b.27.1779256795389; Tue, 19 May 2026
 22:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260519071809.3823470-1-zong.li@sifive.com> <ccfe25b8-df25-49b6-a40e-d86630cbc407@w6rz.net>
 <CANXhq0rH+_FN+HcqK1_PwkgYfhN5KmcTRnk7pt8GzEhfiT4fpQ@mail.gmail.com>
In-Reply-To: <CANXhq0rH+_FN+HcqK1_PwkgYfhN5KmcTRnk7pt8GzEhfiT4fpQ@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 20 May 2026 13:59:44 +0800
X-Gm-Features: AVHnY4Lya-6-vY3lQwGl6X5w4z2J9Neg4u_Eyx00nJn_Wtlsu0AcdzFlABPd92c
Message-ID: <CANXhq0r2ieA-53d=GTvLU4o2qzVTPc7pcxC_Y_pX=a=CiAB=wA@mail.gmail.com>
Subject: Re: [PATCH v5] riscv: cif: reduce shadow stack size limit from 4GB to 512MB
To: Ron Economos <re@w6rz.net>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	debug@rivosinc.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_225957_404340_8D764F00 
X-CRM114-Status: GOOD (  34.84  )
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

T24gVHVlLCBNYXkgMTksIDIwMjYgYXQgNToyMOKAr1BNIFpvbmcgTGkgPHpvbmcubGlAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1heSAxOSwgMjAyNiBhdCA0OjI44oCvUE0gUm9uIEVj
b25vbW9zIDxyZUB3NnJ6Lm5ldD4gd3JvdGU6Cj4gPgo+ID4gT24gNS8xOS8yNiAwMDoxOCwgWm9u
ZyBMaSB3cm90ZToKPiA+ID4gUmF0aW9uYWxlOgo+ID4gPgo+ID4gPiAxLiBTaGFkb3cgc3RhY2tz
IG9ubHkgc3RvcmUgcmV0dXJuIGFkZHJlc3NlcyAoOCBieXRlcyBwZXIgZW50cnkpLCBub3QKPiA+
ID4gICAgIGxvY2FsIHZhcmlhYmxlcywgZnVuY3Rpb24gcGFyYW1ldGVycywgb3Igc2F2ZWQgcmVn
aXN0ZXJzLiBBIDUxMk1CCj4gPiA+ICAgICBzaGFkb3cgc3RhY2sgaXMgZmFyIG1vcmUgdGhhbiBz
dWZmaWNpZW50IGZvciBhbnkgcHJhY3RpY2FsCj4gPiA+ICAgICBhcHBsaWNhdGlvbiwgZXZlbiB3
aXRoIGV4dHJlbWVseSBkZWVwIHJlY3Vyc2lvbi4gVGhpcyBzaXplCj4gPiA+ICAgICBtYWludGFp
bnMgYWRlcXVhdGUgd2hpbGUgYmVpbmcgbW9yZSByZXNvdXJjZS1lZmZpY2llbnQgbWFyZ2luCj4g
PiA+Cj4gPiA+IDIuIE9uIG1lbW9yeS1jb25zdHJhaW5lZCBzeXN0ZW1zIChlLmcuLCBwbGF0Zm9y
bXMgd2l0aCBvbmx5IDRHQiBvZgo+ID4gPiAgICAgcGh5c2ljYWwgbWVtb3J5LCB3aGljaCBpcyBh
IGNvbW1vbiBjb25maWd1cmF0aW9uKSwgYWxsb2NhdGluZyA0R0IKPiA+ID4gICAgIG9mIHZpcnR1
YWwgYWRkcmVzcyBzcGFjZSBmb3Igc2hhZG93IHN0YWNrIHBlciBwcm9jZXNzL3RocmVhZCBjYW4K
PiA+ID4gICAgIGxlYWQgdG8gdmlydHVhbCBtZW1vcnkgYWxsb2NhdGlvbiBmYWlsdXJlcyB3aGVu
IHRoZSBvdmVyY29tbWl0IG1vZGUKPiA+ID4gICAgIGlzIHNldCB0byBPVkVSQ09NTUlUX0dVRVNT
IG9yIE9WRVJDT01NSVRfTkVWRVI6Cj4gPiA+ICAgICBFcnJvcjogIl9fdm1fZW5vdWdoX21lbW9y
eTogbm90IGVub3VnaCBtZW1vcnkgZm9yIHRoZSBhbGxvY2F0aW9uIgo+ID4gPgo+ID4gPiBTdWdn
ZXN0ZWQtYnk6IERhdmlkIExhaWdodCA8ZGF2aWQubGFpZ2h0LmxpbnV4QGdtYWlsLmNvbT4KPiA+
ID4gU2lnbmVkLW9mZi1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgo+ID4gPiAtLS0K
PiA+ID4KPiA+ID4gQ2hhbmdlZCBpbiB2NDoKPiA+ID4gLSBGaXggd3Jvbmcgc3ViamVjdC4gSXQg
aXMgNTEyTUIgaW5zdGVhZCBvZiAyR0IKPiA+ID4KPiA+ID4gQ2hhbmdlZCBpbiB2MzoKPiA+ID4g
LSBSZW1vdmUgbWF4KCkuIFBBR0VfQUxJR04oKSBhbHJlYWR5IHJvdW5kcyB1cAo+ID4gPiAtIENo
YW5nZSBzdGFjayBzaXplIHRvIFJMSU1JVF9TVEFDSy84IHdpdGggU1pfNTEyTSBjYXAuIFN1Z2dl
c3RlZCBieSBEYXZpZCBMYWlnaHQKPiA+ID4KPiA+ID4gQ2hhbmdlZCBpbiB2MjoKPiA+ID4gLSBB
ZGQgbWF4KCkgaW4gY2FzZSBSTElNSVRfU1RBQ0sgaXMgc21hbGxlciB0aGFuIFBBR0VfU0laRS4g
U3VnZ2VzdGVkIGJ5Cj4gPiA+ICAgIFBhdWwgV2FsbXNsZXkgYW5kIFNhc2hpa28KPiA+ID4KPiA+
ID4gQ2hhbmdlZCBpbiB2MToKPiA+ID4gLSBVc2UgbWluKCkgaW5zdGVhZCBvZiBtaW5fdCgpLiBT
dWdnZXN0ZWQgYnkgRGF2aWQgTGFpZ2h0Cj4gPiA+Cj4gPiA+ICAgYXJjaC9yaXNjdi9rZXJuZWwv
dXNlcmNmaS5jIHwgNiArKystLS0KPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvdXNlcmNmaS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdXNlcmNmaS5jCj4gPiA+IGluZGV4
IDZlYWEwZDk0ZmRmZS4uMjAzNjkxOGE3N2RiIDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2
L2tlcm5lbC91c2VyY2ZpLmMKPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdXNlcmNmaS5j
Cj4gPiA+IEBAIC0xMDksMTUgKzEwOSwxNSBAQCB2b2lkIHNldF9pbmRpcl9scF9sb2NrKHN0cnVj
dCB0YXNrX3N0cnVjdCAqdGFzaywgYm9vbCBsb2NrKQo+ID4gPiAgICAgICB0YXNrLT50aHJlYWRf
aW5mby51c2VyX2NmaV9zdGF0ZS51ZmNmaV9sb2NrZWQgPSBsb2NrOwo+ID4gPiAgIH0KPiA+ID4g
ICAvKgo+ID4gPiAtICogSWYgc2l6ZSBpcyAwLCB0aGVuIHRvIGJlIGNvbXBhdGlibGUgd2l0aCBy
ZWd1bGFyIHN0YWNrIHdlIHdhbnQgaXQgdG8gYmUgYXMgYmlnIGFzCj4gPiA+IC0gKiByZWd1bGFy
IHN0YWNrLiBFbHNlIFBBR0VfQUxJR04gaXQgYW5kIHJldHVybiBiYWNrCj4gPiA+ICsgKiBUaGUg
c2hhZG93IHN0YWNrIG9ubHkgc3RvcmVzIHRoZSByZXR1cm4gYWRkcmVzcyBhbmQgbm90IGFueSB2
YXJpYWJsZXMKPiA+ID4gKyAqIDUxMk0gc2hvdWxkIGJlIG1vcmUgdGhhbiBzdWZmaWNpZW50IGZv
ciBtb3N0IGFwcGxpY2F0aW9ucy4KPiA+ID4gICAgKi8KPiA+ID4gICBzdGF0aWMgdW5zaWduZWQg
bG9uZyBjYWxjX3Noc3RrX3NpemUodW5zaWduZWQgbG9uZyBzaXplKQo+ID4gPiAgIHsKPiA+ID4g
ICAgICAgaWYgKHNpemUpCj4gPiA+ICAgICAgICAgICAgICAgcmV0dXJuIFBBR0VfQUxJR04oc2l6
ZSk7Cj4gPiA+Cj4gPiA+IC0gICAgIHJldHVybiBQQUdFX0FMSUdOKG1pbl90KHVuc2lnbmVkIGxv
bmcgbG9uZywgcmxpbWl0KFJMSU1JVF9TVEFDSyksIFNaXzRHKSk7Cj4gPiA+ICsgICAgIHJldHVy
biBQQUdFX0FMSUdOKG1pbihybGltaXQoUkxJTUlUX1NUQUNLKSAvIDgsIFNaXzUxMk0pKTsKPiA+
ID4gICB9Cj4gPiA+Cj4gPiA+ICAgLyoKPiA+Cj4gPiBKdXN0IEZZSSwgeW91ciBWMiB2ZXJzaW9u
IG9mIHRoaXMgcGF0Y2ggd2FzIG1lcmdlZCBpbiBMaW51eCA3LjEtcmM0IChjb21taXQgNmM3Njc0
YjViN2FlNTEzY2VjYWUyMmFhOWRjZGNmNTMzODYyY2Y1YykuIFlvdSBuZWVkIHRvCj4gPiByZWJh
c2UsIG90aGVyd2lzZSB0aGlzIHBhdGNoIHdvbid0IGFwcGx5Lgo+CgpIaSBEYXZpZCwKU2luY2Ug
dGhlIG9yaWdpbmFsIHBhdGNoIGhhcyBiZWVuIG1lcmdlZCwgd291bGQgeW91IGxpa2UgdG8gc2Vu
ZCBhIG5ldwpwYXRjaCBmcm9tIHlvdXIgc2lkZSB0byBhZGp1c3QgdGhlIHNpemU/IE9yIGRvIHlv
dSBwcmVmZXIgdGhhdCBJIGRvCnRoYXQgZm9yIHlvdT8gUGxlYXNlIGxldCBtZSBrbm93IHlvdXIg
dGhvdWdodHMuIFRoYW5rcwoKPiBUaGFuayB5b3UgZm9yIHBvaW50aW5nIHRoaXMgb3V0LiBQZXJo
YXBzIGxldCdzIGRyb3AgdGhpcyBzZXJpZXMgYW5kCj4gc2VuZCBhIG5ldyBvbmUgdG8gZXhwbGFp
biB3aHkgd2Ugd2FudCB0byByZWR1Y2UgdGhlIHNpemUgdG8gNTEyTUIKPgo+ID4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
