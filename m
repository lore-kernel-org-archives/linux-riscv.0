Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EE560A261D
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 19:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=env/q3oJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I9JjwJ6k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ek7wTERUjr24q3aQmmljuKcaygM5GB9rXEaUikeCI1g=; b=env/q3oJARmF7Lz5iOZofC+sy3
	UagV2Tgx7wBIumIILZe2HmrTo+NrGpPqASu7K0dqKPGz7ZA26SfdXufq+/P/27eYREFdtYg6cW1ix
	PeoFzFfrJUJ0wauTCZrHUOzKfSjQX25NJQrSeM9pco66sKJ1wC876scv7W969dpcL3BtNTz2XLFsQ
	35TAK6TiLK0n3ZobqqlfoecDWscc9uWGAdgDt7KhisL78x7OndJsZgqcN6QHF+QAfKRcBRToGMC2w
	kzIpG1OlH99AorV35uHeYlzCDH3Iv2EzQ3iHF8hViVfgm0Xdm8GQwnYYhMCTJRy/eFn7Ott2qTmnM
	gxqVwjeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrUu-00000004u6G-1267;
	Tue, 10 Nov 2026 19:27:12 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrUq-00000004u5N-3gIa
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 19:27:10 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-8b335ef6441so21928297b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 11:27:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794338827; cv=none;
        d=google.com; s=arc-20260327;
        b=B5tonaXhUvD83g45PUq2V9leggOXQdw2XePZmBpzVlSOQmAuZNqjH5ZtWtPE9zpWSi
         41VieeeU20hDRhguHg/Dor8yYID6AmiPWgIcZnpIFbZqTtCrWaX2or9wmB1AFViRRbo6
         yK4n2WIc3pyZrdexFaan6oW8P5fbjW1P8+v5HztGqyIWG5cI2KuMT3zVFc5Unaw+ek9f
         qXZSTjhJjLL3kWKZkvgvuoPrE1/akjljpBrQezL0hMbIvJAFAtRspnTM2c9QUpmeOikw
         oEz81ij0mkB7SNaQVioiO/ma7zVDWqkT66ETzhcqQpl5AOrMhJ5w/WBJMPoNRzAllUcS
         sfHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3BDn6wwNGszSOSWtixkkwMS4uvVtcI6x5Kvm71JPIW0=;
        fh=EFO3dwQz3AHAJQKs5jCFVlJUSgxKhViLokPwxquh1Ik=;
        b=Il+LOIzxpsoQRGJc2bjWnqJp0CtyL4RdkIfVfQbTg6ndcyQmTboaE5UNT6vk0UJPwa
         m3Ye097gWACS1X91nFV7G6Fd3qQDMaRqAId/ukgA7x+pKRJ+ZtA/TQ89Bzlh2PeeFHmu
         wsmT+r82qhFkT4ojaIIVI5/1UBzj+c3CAzVRXUZXwAKDTIa73M8Xit1MX0Ep6aQWVPey
         MgJaxDoL74P+AcfZtBnKDU52TgwNbfTuPpOxk4sNh3Ml7TFz4djvu4KWv2cxeZsjM00z
         YsBiBr3iaVbcUdoa+K3S9S/rd++ADeUHYdpTGG1vmRkYg9k3VJdTxVOgj+M7rrLcQ4HY
         COKA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794338827; x=1794943627; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3BDn6wwNGszSOSWtixkkwMS4uvVtcI6x5Kvm71JPIW0=;
        b=I9JjwJ6kwB8xxIiNptIRucAqRVoO5HI2jXG7GfXem0O2rFWBLd3k6TzI5xjXiQqiwu
         i2hzMHR3QWOYK1ntdaKtcqu0oDPKKDk/9W+SPR7bBIhZFF6zTxYUqJ6w+Sp/lOcJLO4d
         dmivYaNIixMnJti1co7CLNyuA+nfvR7NKlYiXSLMzPjGpd5tSfUBwrdjjniyj9aBkPdw
         sCvxG28puCKXGqTd5YE3w33q/aGvES97MIIG236P/DLv4B1DdIi72zduzOOotemkT/mA
         99jE8tw7WcEb/Sy/5oR9LTqPn2f2rVAYVr1Izmu7Fi9A5v9ODw/Kf5hdRIUHXXSzPE3M
         b7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794338827; x=1794943627;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3BDn6wwNGszSOSWtixkkwMS4uvVtcI6x5Kvm71JPIW0=;
        b=1rzsC+andrNjMFe4vSgnt3wxv0Te3wayBFZobP6z3uWWYgQEhUx0VTFdPcQwHP+HRx
         Gz8CnYORuYxPCr7O3jajSBQUcjYf75h0DCLe13/rEqy7FDPAhgW3+6lh/1B48ZomvPrT
         rcMMav2iQqorGHgA3d21yo0oWMDl28IcQKRMO6YibQzdzTqwxQePdIjn63NYa1oaxfg+
         esHBcCarKxaAmIb468nJLfSTxw1jvKZoh0AUhjdvFqstSppc+VWY2ylVc35X8cM1aKQm
         EJpZhK13ExN50ZppqCo5dV/5ttDAokkHWsHwDY1TzOYz7/xNiTVfibeloJq3bTiFTcfT
         27VA==
X-Forwarded-Encrypted: i=1; AL+hErGceXtB3USFonT4dIm0N54aLCcFRgxdfMVErkc2Lz0jTfQJI+22oo6DpXgrDrnpZDQ7b+rkrmd1N8Nt1A==@lists.infradead.org
X-Gm-Message-State: APuU4Z/QzvAMWxsrUCJ7oAQBsqbo3lfmYSbrGb5FrA3Z6Wp4sKd0go6b
	gsT605dRSAkf6egPXtAwOLoz/E5/tuxxZ2Pq7ZoMh2Myp/Rln0f9wtvpTIU42aNSF5FdA+oTyMi
	rI8bcpGZvGQisRSjjSBjKvN2TNt/0F7A=
X-Gm-Gg: AYBFou3uPDMKhrCECKKdRqnQnOLi2l8FBTn8ttXRdbMcobodeshKnqqsuVSXY6b0XaV
	yLi71tMly5qdS6ijxsyp1WEH6UgGrEFAPz5APwEg47wVt/+CUvkP+Oof6hN/GLKwNXuTgJI45Yt
	6KisgxdPrkraH085z9yK8B6yOT07bxsRU7TT8JIPtcW1W8ge8cDKWofii8TonDy7wEQA2TKUpt0
	R6vuo53u0GfTsyoD6a+Gau0/l3bXJqYUCmHbXGHeA53GfXftlQLJ8hPO/AVTJU6ApoFH7sBrhP6
	1yLYcHr1gxABdfezNsJC6cZGuffh3kYonGDmM9NYsJ8U2UqRPfPcQyZTBJkewd2sdAwwBUeHF5K
	MWPyn+DVzEcND3zHJF72cYHYpPTq0f9U74TGz8A==
X-Received: by 2002:a05:690c:438c:b0:8a4:be24:f233 with SMTP id
 00721157ae682-8b3a80e6b9bmr1379417b3.46.1794338827449; Tue, 10 Nov 2026
 11:27:07 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261108-04-k3-pm-support-v3-0-b9dc0857039b@kernel.org>
 <20261108-04-k3-pm-support-v3-2-b9dc0857039b@kernel.org> <DMQHSDTR177I.1HWHAF4FWTFQ5@linux.spacemit.com>
 <20261110105658-GKA2005@kernel.org>
In-Reply-To: <20261110105658-GKA2005@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 10 Nov 2026 20:27:00 +0100
X-Gm-Features: AclHuK9GBj1g-yv_7rKhtj60GYCKBcJP3tjfjvEauHRa7ZWcjceK1ew77-uBX4s
Message-ID: <CABdCQ=OGejVS-r2Cuod+0EZf148g_-2Y8=tkLqbK-QRn8UH+4A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] pmdomain: spacemit: Add power domain driver
To: Yixun Lan <dlan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_112708_928939_504AA2A9 
X-CRM114-Status: GOOD (  29.10  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Ulf Hansson <ulfh@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, spacemit@lists.linux.dev, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciBhZGRyZXNzaW5nIHRoZSBmZWVkYmFjay4gVGhlIHNlcmllcyBsb29rcyBn
b29kIG5vdy4KClJldmlld2VkLWJ5OiBJa2VyIFBlZHJvc2EgPGlrZXJwZWRyb3NhbUBnbWFpbC5j
b20+CgpFbCBtYXIsIDEwIG5vdiAyMDI2IGEgbGFzIDExOjU3LCBZaXh1biBMYW4gKDxkbGFuQGtl
cm5lbC5vcmc+KSBlc2NyaWJpw7M6Cj4KPiBIaSBUcm95LAo+Cj4gT24gMDc6MTIgTW9uIDA5IE5v
diAgICAgLCBUcm95IE1pdGNoZWxsIHdyb3RlOgo+ID4gSGkgWWl4dW4sCj4gPgo+ID4gT24gU3Vu
LCAwOCBOb3YgMjAyNiAxMDozNjowMiArMDAwMCwgWWl4dW4gTGFuIHdyb3RlOgo+ID4gPiArY29u
ZmlnIFNQQUNFTUlUX1BNX0RPTUFJTlMKPiA+ID4gKyAgIHRyaXN0YXRlICJQTSBEb21haW4gZHJp
dmVyIGZvciBTcGFjZW1pVCBTb0MiCj4gPiBbLi4uXQo+ID4gPiArICAgICBTYXkgeSB0byBlbmFi
bGUgZGV2aWNlIHBvd2VyIG1hbmFnZW1lbnQgdGhyb3VnaCBQTSBkb21haW5zLgo+ID4gVGhpcyBp
cyB0cmlzdGF0ZSBub3csIHNvICJTYXkgWSBvciBNIi4KPiA+Cj4gT2ssIHdpbGwgdXBkYXRlCj4K
PiA+IFsuLi5dCj4gPiA+ICsjaW5jbHVkZSA8bGludXgvaW8uaD4KPiA+ID4gKyNpbmNsdWRlIDxs
aW51eC9lcnIuaD4KPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiA+
ID4gKyNpbmNsdWRlIDxsaW51eC9wbV9kb21haW4uaD4KPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9y
ZWdtYXAuaD4KPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9hdXhpbGlhcnlfYnVzLmg+Cj4gPiBpby5o
LCBlcnIuaCBhbmQgcGxhdGZvcm1fZGV2aWNlLmggYXJlIG5vdCB1c2VkIHJpZ2h0IG5vdy4KPiA+
Cj4gT2ssIHdpbGwgZHJvcCB0aGVtCj4KPiA+IFsuLi5dCj4gPiA+ICtzdGF0aWMgaW50IHNwYWNl
bWl0X3BkX3Bvd2VyX29mZihzdHJ1Y3QgZ2VuZXJpY19wbV9kb21haW4gKmRvbWFpbikKPiA+IFsu
Li5dCj4gPiA+ICsgICBpZiAocmV0KSB7Cj4gPiA+ICsgICAgICAgICAgIGRldl9lcnIoJmRvbWFp
bi0+ZGV2LCAiZmFpbGVkIHRvIHBvd2VyIG9mZiBkb21haW4gJXM6ICVkXG4iLAo+ID4gPiArICAg
ICAgICAgICAgICAgICAgIHAtPm5hbWUsIHBkLT5wbV9pbmRleCk7Cj4gPiA+ICsgICAgICAgICAg
IHJldHVybiAtRUJVU1k7Cj4gPiA+ICsgICB9Cj4gPgo+ID4gLUVCVVNZIGRyb3BzIHRoZSAtRVRJ
TUVET1VUIHJldHVybmVkIGJ5IHJlZ21hcF9yZWFkX3BvbGxfdGltZW91dCgpOwo+ID4gd2h5IG5v
dCBwcmludCByZXQgYW5kIHJldHVybiBpdD8gU2FtZSBpbiBzcGFjZW1pdF9wZF9wb3dlcl9vbigp
Lgo+ID4KPiBZZXMsIEkgdGhpbmsgaXQncyBvayB0byBwcm9wb2dhdGUgdGhlIGVycgo+Cj4gPiBb
Li4uXQo+ID4gPiArc3RhdGljIGJvb2wgc3BhY2VtaXRfcG1faXNfb2ZmX3N0YXRlKHN0cnVjdCBz
cGFjZW1pdF9wbXUgKnBtdSwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RydWN0IHNwYWNlbWl0X3BtX2RvbWFpbiAqcGQpCj4gPiBbLi4uXQo+ID4gPiArICAgcmV0dXJu
IChyZWcgJiBiaXQpID8gZmFsc2UgOiB0cnVlOwo+ID4gcmV0dXJuICEocmVnICYgYml0KTsKPiA+
Cj4gQWN0dWFsbHksIHRoZXJlIGlzbid0IG11Y2ggZGlmZmVyZW5jZSwgeW91ciB2ZXJzaW9uIGlz
IHNsaWdodGx5IHNob3J0Cj4KPiA+IFsuLi5dCj4gPiA+ICtzdGF0aWMgdm9pZCBzcGFjZW1pdF9w
bV9kb21haW5fY2xlYW51cChzdHJ1Y3Qgc3BhY2VtaXRfcG11ICpwbXUpCj4gPiA+ICt7Cj4gPiA+
ICsgICBzdHJ1Y3Qgc3BhY2VtaXRfcG1fZG9tYWluICpwZDsKPiA+ID4gKyAgIGludCBpLCByZXQ7
Cj4gPiA+ICsKPiA+ID4gKyAgIGZvciAoaSA9IDA7IGkgPCBwbXUtPmdlbnBkX2RhdGEubnVtX2Rv
bWFpbnM7IGkrKykgewo+ID4gPiArICAgICAgICAgICBpZiAoIXBtdS0+ZG9tYWluc1tpXSkKPiA+
ID4gKyAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+ID4gKwo+ID4gPiArICAgICAgICAg
ICBwZCA9IHRvX3NwYWNlbWl0X3BkKHBtdS0+ZG9tYWluc1tpXSk7Cj4gPiA+ICsgICAgICAgICAg
IHJldCA9IHBtX2dlbnBkX3JlbW92ZShwbXUtPmRvbWFpbnNbaV0pOwo+ID4gPiArICAgICAgICAg
ICBpZiAocmV0KQo+ID4gPiArICAgICAgICAgICAgICAgICAgIGRldl9lcnIocG11LT5kZXYsICJm
YWlsZWQgdG8gcmVtb3ZlIGRvbWFpbiAlczogJWQgLSBzdGF0ZSBtYXkgYmUgaW5jb25zaXN0ZW50
XG4iLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgcGQtPnBhcmFtLT5uYW1lLCBy
ZXQpOwo+ID4gPiArICAgfQo+ID4gPiArfQo+ID4gWy4uLl0KPiA+ID4gK3N0YXRpYyB2b2lkIHNw
YWNlbWl0X3BtX2RvbWFpbl9yZW1vdmUoc3RydWN0IGF1eGlsaWFyeV9kZXZpY2UgKmFkZXYpCj4g
PiA+ICt7Cj4gPiA+ICsgICBzdHJ1Y3Qgc3BhY2VtaXRfcG11ICpwbXUgPSBhdXhpbGlhcnlfZ2V0
X2RydmRhdGEoYWRldik7Cj4gPiA+ICsgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmYWRldi0+ZGV2
Owo+ID4gPiArCj4gPiA+ICsgICBvZl9nZW5wZF9kZWxfcHJvdmlkZXIoZGV2LT5vZl9ub2RlKTsK
PiA+ID4gKyAgIHNwYWNlbWl0X3BtX2RvbWFpbl9jbGVhbnVwKHBtdSk7Cj4gPiA+ICt9Cj4gPiBw
bV9nZW5wZF9yZW1vdmUoKSBmYWlscyB3aXRoIC1FQlVTWSB3aGlsZSBhIGNvbnN1bWVyIGlzIHN0
aWxsIGF0dGFjaGVkLAo+ID4gYnV0IHBkIGlzIGZyZWVkIGJ5IGRldnJlcyBhbnl3YXkuIFNldCBz
dXBwcmVzc19iaW5kX2F0dHJzIGxpa2UgbW9zdAo+ID4gcG1kb21haW4gZHJpdmVycz8KPiA+Cj4K
PiBObywgSSB3b24ndCBhZGQgc3VwcHJlc3NfYmluZF9hdHRycwo+Cj4gQXMgSSdtIGFsc28gYXdh
cmUgb2YgdGhpcyBwcm9ibGVtLCBidXQgaW50ZW5kIHRvIGFkZHJlc3MgaXQgaW4gYSBkaWZmZXJl
bnQKPiB3YXksIGFuZCBzaG91bGQgc2VuZCBhIHBhdGNoIGluIGFub3RoZXIgc2VwYXJhdGUgdGhy
ZWFkLi4KPgo+IEluIG15IG9waW5pb24sIEFkZGluZyAic3VwcHJlc3NfYmluZF9hdHRycyA9IHRy
dWUiIHdpbGwgb25seSBtaXRpZ2F0ZQo+IHRoZSBwcm9ibGVtLCBpbiB0aGUgY2FzZSBvZiB0aGlz
IGRyaXZlciwgaXQgd2lsbCBzdGlsbCB0cmlnZ2VyIGEgcHJvYmxlbQo+IHdoaWxlIHVubG9hZGlu
ZyB0aGUgZHJpdmVyIHdpdGggcm1tb2QgY29tbWFuZCBpZiBidWlsdCBhcyBrZXJuZWwgbW9kdWxl
LAo+IGNvbnN1bWVyIHNpZGUgd29uJ3QgZ2V0IG5vdGlmaWNhdGlvbiB3aXRoIHRoZSBldmVudC4g
SWRlYWxseSB0aGUgZGV2aWNlIGxpbmsKPiBtYWNoYW5pc20gc2hvdWxkIHNvbHZlIHRoaXMsIGN1
cnJlbnRseSBJJ20gd29ya2luZyBvbiBhIHBhdGNoIGZvciB0aGlzLi4KPgo+IC0tCj4gWWl4dW4g
TGFuIChkbGFuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
