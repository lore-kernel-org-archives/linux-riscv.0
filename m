Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42F4FF4946
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 06:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=if0X1S0oLmtfQ++4yJpyRneqlevwlBTME3giFgYKCZE=; b=xLVJvArHq7jEMU
	LW6vM+ui5E5vKdMIYPXwc4I66CHJv3JWpEYJR2VjQ/UCgMCejX5IC7Q8U2eIoAwInqxxV7ik9xCrU
	xNlZ0mGxr+ose8VSgwxBT1lD6CanwH9mcSBQezqz1uLDFWZ74Cn/26G4lUi6kIclnNqFOtHYxn2dp
	T5zDOfeBsjipDIEVOJDtNYQUqHrdJLn8Lr9tlVwBduIlXnaO2Jgafj78UlZRFooWCbRPWN6Iqz8lD
	Px1HSEYpoLVlOeBlRioRLaZsM2Q8QScDE4Jho4q9HGGyvYZl8Vf0MEfk3swisz0bD3OdcTZsZlJNg
	FhYO6PoTp7RZ/cjlxFEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w764e-0000000AgOK-15bZ;
	Mon, 30 Mar 2026 06:26:08 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w764b-0000000AgNN-3mS6
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 06:26:07 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7d744d9acbeso1637884a34.1
        for <linux-riscv@lists.infradead.org>; Sun, 29 Mar 2026 23:26:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774851964; cv=none;
        d=google.com; s=arc-20240605;
        b=QoMOIaICW7eLjMe1qIXUlc8ClijjyJ/PbEfrnW2oYRrdaxdwaGQ0R2Gj7PCg0d+YgZ
         YmP6WLLRJC3yuHomvnkl5wxr9VnlDAFU5lMECJiDKEsSKaNyVK5ROo2vN7zzk2fyzoBB
         g1i77xWT026VqrdlTvQXnaEIoAoNfwCofvKrgKJc5uGyAKrPkQDoUlCdvAvhkqazJqkD
         X/QScO/rIAKEuuOAk5Gyb0r7NpS59g3AaVLmJwx2QgZXCRuxJluHRLBCsco2mZfyvGgv
         tZsERbKI0a2TjSUd3GOIijV4MBCYYPpD2fwxMRhNBL1pWL5m1a+2P0NDwUVfTOV1+cSf
         nMng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BJL4Mjb1KkwQXihagjZYCJrbQf8hr8cjcUo/ljk+BF0=;
        fh=7eWXUkBmWidzo5dTZb8YmfWuL3X4rAZnQqap3TdKaHk=;
        b=WodK5098meEuoj5OEz5GyhdjZwu9B4zq9IS05XHUwn1syk3z1oI9b7t/nPSQwEBj7D
         QVkpOYWCplvKRYIassg9KE4yDpYMxp6L1kjfLojZpsSbpdMX/VwMonzn9bwGlgzNS1le
         USAZWats2JkkhlucQHT7VsAK+GkCg2fSyh0jFeGCubBVfzAcKSFWEhkVnQf3fRsIguhQ
         sNEfnUowuOkQrzR2sucHPqkMSTsB0xLdToOwi0dcys0VE8Ha9P1qka27Vmh8WqezJOZa
         sNGmterNHdtVLyyXR+pnFerCEMHwrLN/zPJTgUp3+XOf2Y06miCfs0NicO5Wu3yaLe2A
         W8DQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1774851964; x=1775456764; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJL4Mjb1KkwQXihagjZYCJrbQf8hr8cjcUo/ljk+BF0=;
        b=p64zXO+ityeQPargcJ6KMrqSLeocaW3RhiZaalqKM13Rrkwe32dXwfpJGTgNk8v42d
         K8zOs8nw7VK6lhxY8+7r+CyG8KmxvHejubtb4PDH5W2Uv/s2QuiOw77VRL0YrhENLQi6
         +NhZQKHzQ7lMJgdqGkp4QMhC6SzZcWekGbeUb6XTHNTuor9defqq52H7nSzTEGfRZN+K
         PJ7LN7pT4KVcpqxHG5XMUauFCpsCnn5gDFzcAHf5MERlIW1hwDSfsNKMh/SXQFusJS6I
         zvx4lxMn6WZbbMhAL3QZfQv1C7muGFjzVOc+gFzdSZCDtSdlfb3E+k+HNJrv3bk0ynPC
         gliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774851964; x=1775456764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BJL4Mjb1KkwQXihagjZYCJrbQf8hr8cjcUo/ljk+BF0=;
        b=ZFdUnH8DhoWIt2Hy3TjYCTGp81+qC9howN5yy4dp+EKRU+tqkAsj01eTnxUsW8qqNa
         FYwIScEBXF8meHzmInDwSxjQXXKUjkzOFF1LulTgHATU10btzbaAqUna8QCRbHPGCMpK
         3SM4VVBvBKkCprVaErs4A4+F+3C2TYUVfPy3tbcjurPiVKZ2yzqNrST3yrN73GkdTfBb
         RginHDgmz4/PXTCS2Ybo0wBLIZ0/LwWdAmZrvGubUjYcou0gzWrWw7nRZgvqxjarKOFv
         Y1K/jubaZ1pjU22dK86PbX1Xx+eeLcudq82n+I9OrCnLZiaUaCoQcGbIF/fR7ZWLOLrK
         e58w==
X-Forwarded-Encrypted: i=1; AJvYcCWr2hGWZ1fyx29dzebpP8aUYCSzz+t0CVe6EEzl+/CoWFev/OJk7QL8pEUItzqLwHSfVV1t67SxebdX3g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhQYsB2x+xHQi6IRB7zSregnnd+b1D7B6z0sSpMsCM0AuFLMny
	FElUYz9mSkeHw7WdbcR4sPRKtgElkwt8GKgvQI6j+xnboGNoqtNZ4mZE31oXoOSbNJRXM7/ouQj
	rp6KBjV1ubA4rULxIbvFyc7mGMQEtFvEaXjmBkeXDOw==
X-Gm-Gg: ATEYQzxs02Fu5M3H1hdZkIwzvvQfsfrc4VSXQoxfJvLho4SF26nF2ugKUdT+C3v36zo
	3pzV+rVXFRQJiURb8VYS492G/jl/DB09CFssZN1luSVZ/qZAsG/Ak1BEIHYE+J3M6u5bbPsUeQl
	w+g2+bddoxSfRTJmaoZOrYf2FeJD3MhPkjJfzMrj33f00Swpvm8rKlamdUy+mwn6liOnwl9E2hE
	LcX25qO8vilo6SB0uyYGb4boqRANoLaqsMFX1mAAUxS1uU1cmIVQjMY8BgwLBTvBtVsitXVuGbh
	BEh9CogjpPHsKWx9qd6jSniJSVl0cUF+/domvDPHAKEeTdO53qTHnv1T7imhxahByaX9arNEJCl
	t0jDaobvBdNGOcSi5Y23hex2Ybg==
X-Received: by 2002:a05:6820:1746:b0:67e:1259:ab08 with SMTP id
 006d021491bc7-67e185f02a4mr5516515eaf.5.1774851964222; Sun, 29 Mar 2026
 23:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260316141234007qSAOsesu2cSQsj-LA-qq3@zte.com.cn> <20260316141631543e3oVI3JGADhz5veSRD_eC@zte.com.cn>
In-Reply-To: <20260316141631543e3oVI3JGADhz5veSRD_eC@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 30 Mar 2026 11:55:52 +0530
X-Gm-Features: AQROBzDjrvHHyJxz8FHwAkL524ioyt0BKjQVXcYMmumnhJBSe00NB84q2suAzEk
Message-ID: <CAAhSdy0KBL1oTbsTVnqdcFmkcOBGs+kEyQWKmJ5iYj8MzJw0Jw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] RISC-V: KVM: Fix lost write protection on huge
 pages during dirty logging
To: wang.yechao255@zte.com.cn
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, nutty.liu@hotmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_232606_195455_3ED81436 
X-CRM114-Status: GOOD (  19.57  )
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

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgMTE6NDbigK9BTSA8d2FuZy55ZWNoYW8yNTVAenRlLmNv
bS5jbj4gd3JvdGU6Cj4KPiBGcm9tOiBXYW5nIFllY2hhbyA8d2FuZy55ZWNoYW8yNTVAenRlLmNv
bS5jbj4KPgo+IFdoZW4gZW5hYmxpbmcgZGlydHkgbG9nIGluIHNtYWxsIGNodW5rcyAoZS5nLiwg
UUVNVSBkZWZhdWx0IGNodW5rCj4gc2l6ZSBvZiAyNTZLKSwgdGhlIGNodW5rIHNpemUgaXMgYWx3
YXlzIHNtYWxsZXIgdGhhbiB0aGUgcGFnZSBzaXplCj4gb2YgaHVnZSBwYWdlcyAoMUcgb3IgMk0p
IHVzZWQgaW4gdGhlIGdzdGFnZSBwYWdlIHRhYmxlcy4gVGhpcyBjYXVzZWQKPiB0aGUgd3JpdGUg
cHJvdGVjdGlvbiB0byBiZSBpbmNvcnJlY3RseSBza2lwcGVkIGZvciBodWdlIFBURXMgYmVjYXVz
ZQo+IHRoZSBjb25kaXRpb24gYChlbmQgLSBhZGRyKSA+PSBwYWdlX3NpemVgIHdhcyBub3Qgc2F0
aXNmaWVkLgo+Cj4gUmVtb3ZlIHRoZSBzaXplIGNoZWNrIGluIGBrdm1fcmlzY3ZfZ3N0YWdlX3dw
X3JhbmdlKClgIHRvIGVuc3VyZSBodWdlCj4gUFRFcyBhcmUgYWx3YXlzIHdyaXRlLXByb3RlY3Rl
ZCByZWdhcmRsZXNzIG9mIHRoZSBjaHVuayBzaXplLiBBZGRpdGlvbmFsbHksCj4gZXhwbGljaXRs
eSBhbGlnbiB0aGUgYWRkcmVzcyBkb3duIHRvIHRoZSBwYWdlIHNpemUgYmVmb3JlIGludm9raW5n
Cj4gYGt2bV9yaXNjdl9nc3RhZ2Vfb3BfcHRlKClgIHRvIGd1YXJhbnRlZSB0aGF0IHRoZSBhZGRy
ZXNzIHBhc3NlZCB0byB0aGUKPiBvcGVyYXRpb24gZnVuY3Rpb24gaXMgcGFnZS1hbGlnbmVkLgo+
Cj4gVGhpcyBmaXhlcyB0aGUgaXNzdWUgd2hlcmUgZGlydHkgcGFnZXMgbWlnaHQgbm90IGJlIHRy
YWNrZWQgY29ycmVjdGx5Cj4gd2hlbiB1c2luZyBodWdlIHBhZ2VzLgo+Cj4gRml4ZXM6IDlkMDVj
MWZlZTgzNyAoIlJJU0MtVjogS1ZNOiBJbXBsZW1lbnQgc3RhZ2UyIHBhZ2UgdGFibGUgcHJvZ3Jh
bW1pbmciKQo+IFNpZ25lZC1vZmYtYnk6IFdhbmcgWWVjaGFvIDx3YW5nLnllY2hhbzI1NUB6dGUu
Y29tLmNuPgo+IFJldmlld2VkLWJ5OiBOdXR0eSBMaXUgPG51dHR5LmxpdUBob3RtYWlsLmNvbT4K
CkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJl
Z2FyZHMsCkFudXAKCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYyB8IDcgKysrLS0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jIGIvYXJjaC9yaXNjdi9rdm0vZ3N0
YWdlLmMKPiBpbmRleCBiNjdkNjBkNzIyYzIuLmQyMDAxZDUwODA0NiAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jCj4g
QEAgLTMwNCwxMCArMzA0LDkgQEAgdm9pZCBrdm1fcmlzY3ZfZ3N0YWdlX3dwX3JhbmdlKHN0cnVj
dCBrdm1fZ3N0YWdlICpnc3RhZ2UsIGdwYV90IHN0YXJ0LCBncGFfdCBlbmQKPiAgICAgICAgICAg
ICAgICAgaWYgKCFmb3VuZF9sZWFmKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gbmV4
dDsKPgo+IC0gICAgICAgICAgICAgICBpZiAoIShhZGRyICYgKHBhZ2Vfc2l6ZSAtIDEpKSAmJiAo
KGVuZCAtIGFkZHIpID49IHBhZ2Vfc2l6ZSkpCj4gLSAgICAgICAgICAgICAgICAgICAgICAga3Zt
X3Jpc2N2X2dzdGFnZV9vcF9wdGUoZ3N0YWdlLCBhZGRyLCBwdGVwLAo+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHB0ZXBfbGV2ZWwsIEdTVEFHRV9PUF9X
UCk7Cj4gLQo+ICsgICAgICAgICAgICAgICBhZGRyID0gQUxJR05fRE9XTihhZGRyLCBwYWdlX3Np
emUpOwo+ICsgICAgICAgICAgICAgICBrdm1fcmlzY3ZfZ3N0YWdlX29wX3B0ZShnc3RhZ2UsIGFk
ZHIsIHB0ZXAsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHB0ZXBf
bGV2ZWwsIEdTVEFHRV9PUF9XUCk7Cj4gIG5leHQ6Cj4gICAgICAgICAgICAgICAgIGFkZHIgKz0g
cGFnZV9zaXplOwo+ICAgICAgICAgfQo+IC0tCj4gMi4yNy4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
