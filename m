Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AA1C54E68
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 12:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wOogaZ17ezK86JKQK4FwwZRwXTwjwVv7TLM9HCmAVhw=; b=GC8qZg5aV/Tjzh
	M6CuR8Pfn5y21FoyUl0HSeHacbinYEgimq1H9Up0PKeihoDWczfaqfJ6lcI7kYW/XSv5Z+72DaO8x
	22Nc/o2C1LPf0fVLz7ciDuShZSxTycLwUJqE6WGCBrYLA5uXg1/qVEuzfRCHLb522M2oP4l/BK0yc
	hPLmeb1HZeyb3WeEkwstqOZYJuVizCT92k7Zfj1MOw1Pyp2IEvdepM9xuhYaPNxQrFD0jYvuVPgvp
	qtbA35TmPJhOfu7PyGeIoBkih7x+YXdNQBKxPcPogs2taTjTBC545aNykDnPRIicsOwF+40ZstI2r
	Pj3N5NwVn62m5B0Adygg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnHJq-00000002vkU-0Ap8;
	Thu, 21 Mar 2024 12:14:50 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnHJm-00000002vk4-3zIc
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 12:14:48 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-5a4a14c52fcso440570eaf.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Mar 2024 05:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711023285; x=1711628085; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ra900FEfSjkKgVwjTNDl6M0Bbsf2vE/DC/P3iCnvtQ=;
        b=BFJSTzA6wNcCEDnao5B4xaJ5/yUjq7BBSua6a36ry2Z5VVmi/7cKOB09VBHSmUS2g+
         VfaRJyyNYtwa97E33FYrhNAJ89es7w0HPn+FFHsNBOxT5r+sbfFHk+cBpUOLZCnxen6A
         m6TUwVf6jlNF/SvNwSz2DX6k1o8foPkotHiqnbex+EfDTeVVpHFXiUPEPC6p+s/RBWCe
         4bquQh7F0ILVurso1U5Q0j64JNZ9wCGZdtFGm4VP3RgbTBpKIAR4CSszLmzzcOmxCZf7
         qaZiBBrpVrHD9eDJhBNlmWyRzkCstf1/BvFR0N3W0+QP25Qca4idpAlhDwAaKxx2TT5X
         5sVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711023285; x=1711628085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ra900FEfSjkKgVwjTNDl6M0Bbsf2vE/DC/P3iCnvtQ=;
        b=CGP/UME+a7To1dXoH4m/bbxpkRQhUxx1jvhfxonIw/E1RWaHNJBlLi2G/23ydLeb8D
         owpfbssO2WRB50cLYYUziJzobuNKfH8MBIYfcDDit8zyZen9FQY1UGZ3saGMonEw2p5C
         wqHChkpjAz/eFcoxZJCeC32tQIzp0ydpXyw9Yh155E1cfsTM5pcbkYGTBFn+thL348Tx
         KXHp6N6f4BFsUczyaJj8hWVezykR8E7PGep13QI4X5hV3w4DiPILJdAbs2H05EeVpfHu
         P99ZToBG+xzQWjYDP2ymKbjc4lZldMSPDincsAt0osRsYyDNuUInLdLbonqXld8cGUeo
         IMxw==
X-Gm-Message-State: AOJu0YwT6lgJ5TH5joR0DL6LU8zmJicIlACFs/mTJl9zle6MPE23oNjD
	8I0Ai0xy49WD6QLSTEUGcW+vaJWShQSynxusQunDizPmMvUZfiOxN0LSL5p9oeS+F8FnRZzlvnq
	/VrYNWb0cbGxqWCH29+irXjQ1/NMSr7jFSyOban5IVa8NHh6hSha0
X-Google-Smtp-Source: AGHT+IG4Ze+FpWKgPcK7KZbs4B5DjgGtXiTldQZOiFIL50PC3NWP+dCQUfvIt3fWOjBMkrZMyOfZK7KSY5MeI3ZCMgQ=
X-Received: by 2002:a4a:ec42:0:b0:5a4:ae86:118f with SMTP id
 q2-20020a4aec42000000b005a4ae86118fmr4895807ooj.8.1711023285077; Thu, 21 Mar
 2024 05:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240321115250.801731-1-woodrow.shen@sifive.com>
In-Reply-To: <20240321115250.801731-1-woodrow.shen@sifive.com>
From: Woodrow Shen <woodrow.shen@sifive.com>
Date: Thu, 21 Mar 2024 20:14:34 +0800
Message-ID: <CABquHATcBTUwfLpd9sPObBgNobqQKEAZ2yxk+TWSpyO5xvpXpg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: selftests: cbo: Use exported __cpu_to_le32() with
 uapi header
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_051447_020896_3B27CC50 
X-CRM114-Status: GOOD (  18.87  )
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

U2hvcnQgYmFja2dyb3VuZDogd2hpbGUgSSdtIGJ1aWxkaW5nIHRoZSByaXNjdi9od3Byb2JlIHRl
c3RzLCBpdCBzZWVtcwpJIGFsd2F5cyBoaXQgdGhlICJlcnJvcjogaW1wb3NzaWJsZSBjb25zdHJh
aW50IGluICdhc20nIiBldmVuIHRob3VnaAp0aGUgY29tbWl0IGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Jpc2N2L2xpbnV4LmdpdC9jb21taXQvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvaHdwcm9iZS9jYm8uYz9pZD0wZGU2NTI4OGQ3NWZmOTZj
MzBlMjE2NTU3ZDk3OWZiOTM0MmM0MzIzCmlzIGFwcGxpZWQuIEknbSBub3Qgc3VyZSBpZiB0aGlz
IG9ubHkgaGFwcGVucyB0byBtZSBhcyBJIHRyaWVkIHRvCmJ1aWxkIHRoZW0gb24gYSBjbGVhbiBk
ZWJpYW4gY2hyb290LiBUbyBhcHBseSB0aGlzIHBhdGNoIG1ha2VzIHRoZQpidWlsZCBoYXBweSwg
YnV0IGlmIHRoZXJlIGlzIG5vIG5lZWQgdG8gY2hhbmdlLCBwbGVhc2UgaWdub3JlIHRoaXMKcGF0
Y2guCgpBbmQgc29ycnkgdG8gZm9yZ2V0IGNjIG1vcmUgbWFpbnRhaW5lcnMgZm9yIHJldmlld2lu
Zy4KCkNoZWVycywKV29vZHJvdwoKCk9uIFRodSwgTWFyIDIxLCAyMDI0IGF0IDc6NTLigK9QTSA8
d29vZHJvdy5zaGVuQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogSHNpZWgtVHNlbmcgU2hl
biA8d29vZHJvdy5zaGVuQHNpZml2ZS5jb20+Cj4KPiBjcHVfdG9fbGUzMiBpcyBub3QgZGVmaW5l
ZCBpbiB1YXBpIGhlYWRlcnMsIGFuZCBpdCBjb3VsZCBjYXVzZSBhbiBlcnJvcgo+IG9mIGltcG9z
c2libGUgY29uc3RyYWludCBpbiAnYXNtJyBkdXJpbmcgY29tcGlsYXRpb24uIEhvd2V2ZXIsCj4g
dGhlIHJlYXNvbiBpcyBkdWUgdG8gdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBjcHVfdG9fbGUzMi4K
PiBfX2NwdV90b19sZTMyKCkgZGVmaW5lZCBmcm9tIGJ5dGVvcmRlci5oIHNob3VsZCBiZSB1c2Vk
IGluc3RlYWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBIc2llaC1Uc2VuZyBTaGVuIDx3b29kcm93LnNo
ZW5Ac2lmaXZlLmNvbT4KPiAtLS0KPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvaHdw
cm9iZS9jYm8uYyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNj
di9od3Byb2JlL2Niby5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvaHdwcm9iZS9j
Ym8uYwo+IGluZGV4IGM1MzdkNTJmYWZjNS4uYjJkZDE4YjNlMzYwIDEwMDY0NAo+IC0tLSBhL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2h3cHJvYmUvY2JvLmMKPiArKysgYi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9od3Byb2JlL2Niby5jCj4gQEAgLTE1LDExICsxNSwxMiBA
QAo+ICAjaW5jbHVkZSA8bGludXgvY29tcGlsZXIuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2tlcm5l
bC5oPgo+ICAjaW5jbHVkZSA8YXNtL3Vjb250ZXh0Lmg+Cj4gKyNpbmNsdWRlIDxhc20vYnl0ZW9y
ZGVyLmg+Cj4KPiAgI2luY2x1ZGUgImh3cHJvYmUuaCIKPiAgI2luY2x1ZGUgIi4uLy4uL2tzZWxm
dGVzdC5oIgo+Cj4gLSNkZWZpbmUgTUtfQ0JPKGZuKSBjcHVfdG9fbGUzMigoZm4pIDw8IDIwIHwg
MTAgPDwgMTUgfCAyIDw8IDEyIHwgMCA8PCA3IHwgMTUpCj4gKyNkZWZpbmUgTUtfQ0JPKGZuKSBf
X2NwdV90b19sZTMyKChmbikgPDwgMjAgfCAxMCA8PCAxNSB8IDIgPDwgMTIgfCAwIDw8IDcgfCAx
NSkKPgo+ICBzdGF0aWMgY2hhciBtZW1bNDA5Nl0gX19hbGlnbmVkKDQwOTYpID0geyBbMCAuLi4g
NDA5NV0gPSAweGE1IH07Cj4KPiAtLQo+IDIuMzQuMQo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
