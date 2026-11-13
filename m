Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1025606A890
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 11:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HAHII+dt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Uha8B8Kn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=oiNxnLQA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JWX7fydLUj6kAzJZdmiX0t639dMSm+7McIeb4YsFOiE=; b=HAHII+dt30YErac6xU+Vm8pzdt
	P70TbLF+VpY7Wd7K4RcmJhHo0M+/IZuuNLFBIzt1ISXfZ3PIFMLmBG82waMdhNgNi8x527RQEEf+g
	UwqXvVq6OH/uUrwTfy7byCkkfC7K0USvtenetOjd/fYwf+anCTiGdXwVu5mZEWAx/32sdjDoXwJQC
	lAXaB8LrNVrPWUCJKi+837XDStPSTPCmZv2aqZnunAj7ODxNk+Ohco/nNy6/CGAiY67T+tHF294DV
	FnZ5poOgTR8PIRpIg37iibrB0ozLfDrliBOze5Sa8aDzY3uOfRXlYmxKFXBqcCsVSrJxMCprQ6S7q
	BhQcCpwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpke-0000000CZjI-0vUY;
	Fri, 13 Nov 2026 11:47:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpkd-0000000CZip-1OqM
	for linux-riscv@bombadil.infradead.org;
	Fri, 13 Nov 2026 11:47:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1bKaGn+sVsulirD+PpfXt80s+OYQQHNZq3eHTFDXAqY=; b=Uha8B8KnTCDIKMHQVnsn3IMb+w
	GQn4j77X6uUSAlQswKPSkj8wiEKlsZWz0bm0vj7D/TBdbJGmXDRE/AUqfo/lU3v9f3cxmr/K4A0E1
	fPraU8Dl1kxMqPm7Ta3pHeq4acu+cdhFv9NUjvxOb4niWWViyJkeJNVFyI0XMfd05DoLeBqhjRLff
	n8UVDbmG8FLls48EyWBeQ0FU14ZcFHl2b44+O2CR7tgm0gzf1BcPZ2R04Aa24mJ7r7dYqlPkoInOC
	wDvwZOaHJ+R53nFn0iUgenyNkXlhnZU7/6fTaar5hObwvE4BeIVX4tI6Pv8i09yXTS4zxMmTzmCtV
	N8ua8puw==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpka-0000000BByh-2uWe
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 11:47:26 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso15091165e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 03:47:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794570442; cv=none;
        d=google.com; s=arc-20260327;
        b=PcWf77yaPB5KeRkIZdV0WZ1oRl9xlm9pEEZPZoEN/i3iePrZlzckXe2/muRqeM8H/z
         FNxi5ZDX9Y5BFSoFaC9rwiTKG3QgW8ZLoe6ubJTVQhHYMAqlcBh7xh3Q25j+cPkG04a2
         mqQCnKssiz66c5qH9O7D4L0L7TtoJ5IDFL6fjBA5kOwWOn+aGr6n/ihNcj5EyCluKw4l
         wZ4lSNTOUAZTNlaVwb69qyTjw/lHPJXST+WVetUxWPZH+LZqPdNOL+EKRg4HyKVb05Ua
         W2Fk0lRXqcT139XgkSqY3H/HHjX3IbFwzMJbTnA6V5ynaUgD8thEBVx1MDOEwaR6Glk3
         +MZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1bKaGn+sVsulirD+PpfXt80s+OYQQHNZq3eHTFDXAqY=;
        fh=qzU9x8xPV9W7oU0sm6VN669Lj93EAEv90o/az7IrxW0=;
        b=KAO6sDrU7wGIKreeJkdcjobZlwOjvSMeavUekaOtzhP3Q2GP02yZuhzgsB1TPpm0dO
         Y+/z7AvM3TwFrVZgMMPZu+sb8inziB35lp4frC5FXyEyNJyVdY/ts8PTYGBGfv+rllEE
         A9fC9/YqwYpTm0qpRGZWuagKAXoH8wwWHyeRJk5LWPDrHAkY0zkBhu5Fi3rODJ631hP0
         oQVQ6jkPNm+3YS44DvwQxhTuRFbXrUKWannx3lW5W0/UwtkTaWq4CUTJ1LhkHb9Udwxe
         /ZS0ZwqfaPM6pD6FMKTp3UsxTzybG0JjR5TA05IXIG3JJRJNf3ePltziyi5T168vvX4M
         TRwA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794570442; x=1795175242; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1bKaGn+sVsulirD+PpfXt80s+OYQQHNZq3eHTFDXAqY=;
        b=oiNxnLQAq8YXwRomW8sthgMMHyrOLgSRp0nKehyGNTiPeRCyEsB5LV8uUxCI612w27
         1rsHrrAYNvpe6VIIgqAzlB0y2WWOSkg5n6ZvRALeY0bhpsdT3FmqZihki4XLeG3HWMA4
         Ly9FPddf5auZh38laIimZs0ellHse+7RvhFMH5t5wYD4cB2aUzRK9mTrdiRZnOjrGg1p
         vvD3Xfr06HcUrMNHOJI2W2Ogac9q0XD6miYjZVlAh+F7zRlXgFOK8k0o24DgrCv3dD+I
         QP8KhSJdgALjLCH8OHQGrIQtYOHYrePqQ8tX9lJe8Nwk96l3U3e3iZvKXlGcf2LGgDPr
         moCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794570442; x=1795175242;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1bKaGn+sVsulirD+PpfXt80s+OYQQHNZq3eHTFDXAqY=;
        b=VHLPj5+GevLYsypF3vwxRFLfJ6Zu/priuEMwQvz2kRMO0qModbvjWxyEsv3S9qeBwV
         tUAEzXMd51VerP2m24+L1ledHo9pWNQxer+rvIWkNKwTe+r950FXnSFnO3Y15H6PCwZs
         Zxt4rS9Itmy2fgoUz6qGEPS1lOXa7hr6KQwBNmP8QbKQ6i3OBsRG0dBndhaDeyc3cxFk
         IQTvE5zDV/WDqCR2uT8U9bLoz92oHebX3SYPD9Hy5cjVee7jktigUmQHaFSdm6L6HHtl
         kSGSejpSI0hnWhWKnH/Sm5P7Tc3bunbhRH30d6Pz5zATVr2DcYHX0R+ssEe2DLOL65Mz
         h7OA==
X-Forwarded-Encrypted: i=1; AL+hErGMzlx/us1Mcp1Hls9HsFjNpIqqQ0cHgE2wrQZnDf/u8pYnw0pEPextKZ5OAVxJbmKHLAnSfGllIZ8qnQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/2jlKB97aVQdR1z6ICQn8bSQeztVFX4SCPZZ4bvQKyKepIEqq2
	sRudw6bPvALcf4kNCOCsaGJzQv3sdsl6yb9mLke8IaDFfqO9ySBREXPaSz5C7t4ndOqCHJ5maIo
	BAmC7t64ki3eXQS/VcLgsKIkVL9UNQmP0CZBX04yv0Q==
X-Gm-Gg: AYBFou1hV0ErnEA5KAk5JV/9JvGL+7jcU1SWTfZto8/wnsdXPGBj1lPUXC0NJj3YmK+
	Jrmd/GgDql37fT1YYbsjRhwo3lK1mdsgtoUKb2N11qkr/gEfaWDU9Mhsr+Js2HqFgT4EPaG+u+s
	nD84Ee7Jq2aOU1E/sgXGJk2gIDRjv3TlR3zrhxhOEwEauzsyem9a1ysT9y3YST6hXt68Y/bCA/q
	x7ZfRexO1fyoWKu2oR35c7lmb+mBzQLo32OUddtOv5L4Q4ZDw5pDPKAUT3C0e8IFmylZ1LvZntb
	biZw9jy5FXVSWXv87cSQzaFNz9L5tPR6mTBuN4HDTHPGOtd6PubFJsB4uSpHZgc1X82rOVIel8X
	gxsCvp4puSW0RQdmzvZxtpr8YwP1Pjm4o2luSfsi3dk9vvIBXA9pA0Jx0klq/mpCCzKv+LIGsku
	sgSNgeafwpVitzdHEK0ThBZTSl4QgCpT1snu8qjsW4ybKxHZR7AMN26hM=
X-Received: by 2002:a05:6000:2006:b0:490:6e0f:a024 with SMTP id
 ffacd0b85a97d-49c70b051bbmr5548639f8f.13.1794570442359; Fri, 13 Nov 2026
 03:47:22 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027062602.323691-1-qingwei.hu@bytedance.com>
In-Reply-To: <20261027062602.323691-1-qingwei.hu@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 13 Nov 2026 17:17:10 +0530
X-Gm-Features: AclHuK9uFGSNKoGCuQtKwYDOZuyVTnpTYaV59-nL9mz1TmdnUXZYOT-rcssss70
Message-ID: <CAAhSdy0bSJQ8mhWDu+zYW8dWowtcV-mDGHKyp4LSmvnbLWEimw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Validate PMU counter info using available counters
To: Qingwei Hu <qingwei.hu@bytedance.com>
Cc: Atish Patra <atish.patra@linux.dev>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_114724_637077_8CF3312B 
X-CRM114-Status: GOOD (  17.51  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBPY3QgMjcsIDIwMjYgYXQgMTE6NTbigK9BTSBRaW5nd2VpIEh1IDxxaW5nd2VpLmh1
QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gQ09VTlRFUl9HRVRfSU5GTyB2YWxpZGF0ZXMgdGhl
IGNvdW50ZXIgaW5kZXggdXNpbmcgdGhlIHBtY1tdIHN0b3JhZ2UKPiBjYXBhY2l0eSByYXRoZXIg
dGhhbiB0aGUgbnVtYmVyIG9mIGNvdW50ZXJzIGFkdmVydGlzZWQgYnkgTlVNX0NPVU5URVJTLgo+
IFdoZW4gZmV3ZXIgY291bnRlcnMgYXJlIGF2YWlsYWJsZSwgYSBndWVzdCBjYW4gcXVlcnkgYW4g
aW5kZXggb3V0c2lkZQo+IHRoZSBhZHZlcnRpc2VkIHJhbmdlIGFuZCByZWNlaXZlIHN1Y2Nlc3Mu
Cj4KPiBWYWxpZGF0ZSB0aGUgaW5kZXggdXNpbmcga3ZtX3BtdV9udW1fY291bnRlcnMoKSwgbWF0
Y2hpbmcgdGhlIGNvdW50ZXIKPiBpbml0aWFsaXphdGlvbiBhbmQgcmVhZCBwYXRocy4KPgo+IEZp
eGVzOiA4ZjAxNTNlY2QzYmYgKCJSSVNDLVY6IEtWTTogQWRkIHNrZWxldG9uIHN1cHBvcnQgZm9y
IHBlcmYiKQo+IFNpZ25lZC1vZmYtYnk6IFFpbmd3ZWkgSHUgPHFpbmd3ZWkuaHVAYnl0ZWRhbmNl
LmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz4KClF1ZXVlZCB0aGlzIHBhdGNoIGFzIGEgZml4IGZvciBMaW51eC03LjQtcmNYCgpUaGFua3Ms
CkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMgfCAyICstCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jCj4g
aW5kZXggZTA5NWQxZmY0MzlmLi5lYTc4ODYxOTA5MWEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9rdm0vdmNwdV9wbXUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMKPiBAQCAt
NTYwLDcgKzU2MCw3IEBAIGludCBrdm1fcmlzY3ZfdmNwdV9wbXVfY3RyX2luZm8oc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIGNpZHgsCj4gIHsKPiAgICAgICAgIHN0cnVjdCBr
dm1fcG11ICprdnBtdSA9IHZjcHVfdG9fcG11KHZjcHUpOwo+Cj4gLSAgICAgICBpZiAoY2lkeCA+
PSBSSVNDVl9LVk1fTUFYX0NPVU5URVJTIHx8IGNpZHggPT0gMSkgewo+ICsgICAgICAgaWYgKGNp
ZHggPj0ga3ZtX3BtdV9udW1fY291bnRlcnMoa3ZwbXUpIHx8IGNpZHggPT0gMSkgewo+ICAgICAg
ICAgICAgICAgICByZXRkYXRhLT5lcnJfdmFsID0gU0JJX0VSUl9JTlZBTElEX1BBUkFNOwo+ICAg
ICAgICAgICAgICAgICByZXR1cm4gMDsKPiAgICAgICAgIH0KPiAtLQo+IDIuMzkuNQo+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
