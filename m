Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19A7606A321
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 13:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yBqWubmp;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pKviyMu4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8E+/Efm9uWoI4zxlf0dERmOeZqcyWmWH0eTx1cT7Tdo=; b=yBqWubmpDIDliuyN5A2LOzH7we
	K696VMQm6yw+RBTHjNnVkt1DuUQAAlw8qkVbuRo6oRaZwbx/nvPggry3ktfx6jWNs3OBRY8h1MqJN
	4+LloFq1ERXpFCSfJfopJmZzJkVFQI27AhNY4LXBgPAfnHMhQ5k8cyLxb07jE+OZLvdQrhALtFnzm
	w+AcUapo2JafIMGaiJMV1k6Bc50VOXB41jqG311X1+zQkIvxP37XwCOH9W+kI8jc5tBGQ4FKK0n9J
	vcJdn/3cvLiwVFuk+G1bAIbM+eRar8BBD/oZY7vAq416IZuScgbHa6NpZa0nTFw0MGUhi9WyCgJMy
	S7sprJ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUWU-00000003fqR-2ZGU;
	Mon, 23 Nov 2026 13:55:58 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUWR-00000003fpy-0fu5
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 13:55:56 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso38401125e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2026 05:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795442153; x=1796046953; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aDhEOsQ4kFs3m5ViT1erT7rUy2o/jOwOkZo0YQ+jEws=;
        b=pKviyMu4AIibjA+RyjZPaypBVX2I50ejlBn+z/Kqjbpgf2MM+BwKAZL/nnMj04JZGl
         j3hEVqpLcNC5gjQ4JKk7DuOgT+lx6uNH2xdOYwkRcYMKqz2bl1CYewO4H26uQA/si6Dz
         c1gLaEiYyhryrrZcDcDScy15SOmRlLTp7Tb4/UCyabp9tSJU+5as1mr7yPEN5sj3OBtH
         N68EYjpHBeXLL42MDN/OubZz/58eVhNLtSEkelLAEhxlpFj7WaxmSpCJkvvVhhsKAASq
         I9DOXKh6SN0klxQ+micDLz5LjXOyTelSQ8pWQ3DSp5LW9umtlCyNkculGqoMG215n0YZ
         jprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442153; x=1796046953;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aDhEOsQ4kFs3m5ViT1erT7rUy2o/jOwOkZo0YQ+jEws=;
        b=bnl7ry48lcCtdEnFJjUerz4vHylrJaKhVtk59QFaSdahwrZpb/SV0SLaXqB5E8VKAt
         PPknUT3GSBZHNt146t60ghjYphFrhvPS0o32AR8uhVmWncxJodZF4MCWBpwvyBg6zEgh
         cfBj7rdf+u8mKWNys44UDidKu8lUGLyA4xTmM1exco5rH+nDN0/+NBNHLRu5saNFpHTp
         2Ah8iXvBvTy0TcVXJUHcD94hyZQ8FrPSADSiKCAO1/F4b9tSROdRAXr9rs1yw/rQTNen
         lgSrh9cCfJ4NKdkCMc3AWS+qRj7K633RGPWzX5p9VfK/JZM3QglRuKKzAdP2RXriU0dJ
         wE/Q==
X-Forwarded-Encrypted: i=1; AL+hErG/wnoD4fEvFHKtMAJARpfQlUKuvi+1BDEZbm0G4SzIhllDj2siAI6aelahHrQpQAcoe/B0Ejmbk6HTiA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+UsBCccayZGW3j3svRWXiZCfGIk3jbYiRQtVhtrw+eWXSLLKAZ
	rMv3GkVHtlBXu8LED58GxOJfvd1HzUq41cJgqo/ZrEGXZb6+/7isbXHRagNur5InbTQ=
X-Gm-Gg: AZFdTZdUgSPEublvtGKv5mOrDASzsI79OObtEgwn/yjqlLMlCK9xEWrmGbDFUU5YFet
	UWINacp4/zMO/TJBi6N/6tqGz/d6Xt1iRYqqvgpsVWBtM7fEaAQW6iONVjJJwP7zO4Q+1+hp3VN
	x5cgt+RBx+TmeA4CBYcsYw/8Tw6gc+Qyqd4S50r3sxxAObrbtRtdhn3cjoH7En3r2v8XHQ82Vpr
	rr7m8BBJksrfthEJuDWfzrqxVzef8/kMBKzU4CvcH9Yb7uSr9XoJjKPInlQBQGDpjL/Kx426tlN
	aXc8Wkqy/4REaUhcT212P6DalGMJspcqirAhPzvZN8zeNwzFlgpe1X4avvtctnBarJ42c2B1NPj
	88twD43Z0/yiCBgF7jaEl0TTOFlrAeWJzT/f1S2N9zAcJ2E2krhdqjr9pvfL1unIvTnXIWykA6z
	FDC1A49FbHGkJ1hcIXhdzn6cLNTMwGQNr7h7p3UH7u0DZtGTnLP6lBC+nIhpV9i1bitSS4tmGf6
	gK5veL+6Z0ERA8fYVVPJ95vtcg77GIAyai7Emi/IU/7tvAM58rUT6ZQJ8DBSdFw/9psvE0d68/d
	zDyvata5T2ZU0ajQo6D/mcNxM0YS3t3yhe00NQknKD2rSPlQtTCJ33YAXLzJXvuTeOr8VJxmk5v
	8dKiZ6og=
X-Received: by 2002:a05:600c:e553:b0:4bb:9457:3c93 with SMTP id 5b1f17b1804b1-4bb94573c9amr82975115e9.2.1795442153256;
        Mon, 23 Nov 2026 05:55:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e50:3860::642d:5bda? ([2a01:e0a:e50:3860::642d:5bda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906e4ce6sm176803775e9.4.2026.11.23.05.55.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 05:55:52 -0800 (PST)
Message-ID: <5278036d-c939-4726-a591-91c7dbedd431@baylibre.com>
Date: Mon, 23 Nov 2026 14:55:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/imagination: drop redundant zeroing of new GEM
 objects
To: Gyeyoung Baek <gye976@gmail.com>
Cc: Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20261111-pvr-gem-drop-zeroing-v1-1-2dc725857053@baylibre.com>
 <CAKbEznssOrO84z_msOZ0tYjVYkaQ8P+f8uma3PhOF6+zp32Hvw@mail.gmail.com>
Content-Language: fr
From: Guillaume La Roque <glaroque@baylibre.com>
In-Reply-To: <CAKbEznssOrO84z_msOZ0tYjVYkaQ8P+f8uma3PhOF6+zp32Hvw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_055555_215188_2F09CF65 
X-CRM114-Status: GOOD (  18.63  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgR3lleW91bmcsCgp0aGFua3MgZm9yIHRoZSByZXZpZXcuCgpMZSAyMi8xMS8yMDI2IMOgIDA4
OjU1LCBHeWV5b3VuZyBCYWVrIGEgw6ljcml0wqA6Cj4gSGkgR3VpbGxhdW1lLAo+Cj4gT24gV2Vk
LCBOb3YgMTEsIDIwMjYgYXQgNjo0M+KAr1BNIEd1aWxsYXVtZSBMYSBSb3F1ZQo+IDxnbGFyb3F1
ZUBiYXlsaWJyZS5jb20+IHdyb3RlOgo+PiBwdnJfZ2VtX29iamVjdF9jcmVhdGUoKSBjbGVhcnMg
ZXZlcnkgbmV3IG9iamVjdCB0aHJvdWdoIGEgQ1BVIG1hcHBpbmcKPj4gc28gdGhhdCB1c2Vyc3Bh
Y2UgbmV2ZXIgc2VlcyBkYXRhIGxlZnQgYnkgYSBwcmV2aW91cyBvd25lciBvZiB0aGUKPj4gcGFn
ZXMgWzFdLiBzaG1lbSBhbHJlYWR5IGd1YXJhbnRlZXMgdGhhdDogaXQgY2xlYXJzIGVhY2ggcGFn
ZSBpdAo+PiBhbGxvY2F0ZXMsIGFuZCB0aGUgZG1hX3N5bmNfc2d0YWJsZV9mb3JfZGV2aWNlKCkg
Y2FsbCB0aGF0IGZvbGxvd3MKPj4gbWFrZXMgdGhvc2UgemVyb2VzIHZpc2libGUgdG8gdGhlIEdQ
VS4gVGhlIHNlY29uZCBwYXNzLCB3cml0ZS1jb21iaW5lZAo+PiBvbiBub24tY29oZXJlbnQgZGV2
aWNlcywgb25seSBhZGRzIGxhdGVuY3kuCj4gSSdtIG5vdCB2ZXJ5IGZhbWlsaWFyIHdpdGggc2ht
ZW0sIHNvIEknZCBsaWtlIHRvIGFzazogaXMgdGhpcyB6ZXJvaW5nCj4gc29tZXRoaW5nIHNobWVt
IGd1YXJhbnRlZXMsIG9yIGp1c3QgYSBjdXJyZW50IGltcGxlbWVudGF0aW9uIGRldGFpbD8KIEZy
b20gd2hhdCBJIHNlZSBpbiB0aGUgY29kZSwgaXQgaXMgZ3VhcmFudGVlZCBieSBzaG1lbSwgbm90
IGp1c3QgYW4KaW1wbGVtZW50YXRpb24gZGV0YWlsLiBUaGUgemVyb2luZyBpcyBkb25lIGluIHNo
bWVtX2dldF9mb2xpb19nZnAoKToKCiDCoCDCoCDCoCDCoCDCoCBpZiAoc2dwICE9IFNHUF9XUklU
RSAmJiAhZm9saW9fdGVzdF91cHRvZGF0ZShmb2xpbykpIHsKIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIGxvbmcgaSwgbiA9IGZvbGlvX25yX3BhZ2VzKGZvbGlvKTsKCiDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBmb3IgKGkgPSAwOyBpIDwgbjsgaSsrKQogwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgY2xlYXJfaGlnaHBhZ2UoZm9saW9fcGFnZShmb2xpbywgaSkp
OwogwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZmx1c2hfZGNhY2hlX2ZvbGlvKGZvbGlvKTsK
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGZvbGlvX21hcmtfdXB0b2RhdGUoZm9saW8pOwog
wqAgwqAgwqAgwqAgwqAgfQoKcHZyIG9iamVjdHMgZ2V0IHRoZWlyIHBhZ2VzIHRocm91Z2ggZHJt
X2dlbV9zaG1lbV9nZXRfcGFnZXNfc2d0KCkgLT4KZHJtX2dlbV9nZXRfcGFnZXMoKSAtPiBzaG1l
bV9yZWFkX2ZvbGlvX2dmcCgpLCB3aGljaCB1c2VzIFNHUF9DQUNIRS4KRWFjaCBvYmplY3QgaXMg
YSBuZXcgc2htZW0gZmlsZSwgc28gYWxsIGl0cyBmb2xpb3MgYXJlIG5ld2x5IGFsbG9jYXRlZAph
bmQgbm90IHVwdG9kYXRlLCBhbmQgdGhleSBhcmUgYWx3YXlzIGNsZWFyZWQgaGVyZS4KCnBhbmZy
b3N0IGFuZCBwYW50aG9yIGFscmVhZHkgcmVseSBvbiB0aGlzIHRvbywgdGhleSBuZXZlciBjbGVh
ciBuZXcKb2JqZWN0cy4gVGhlcmUgaXMgZXZlbiBhIGNvbW1lbnQgYWJvdXQgaXQgaW4gc2hvdWxk
X21hcF93YygpIGluIGJvdGgKZHJpdmVyczoKCiDCoCDCoCAvKiBXZSBjYW4ndCBkbyB1bmNhY2hl
ZCBtYXBwaW5ncyBpZiB0aGUgZGV2aWNlIGlzIGNvaGVyZW50LAogwqAgwqAgKiBiZWNhdXNlIHRo
ZSB6ZXJvaW5nIGRvbmUgYnkgdGhlIHNobWVtIGxheWVyIGF0IHBhZ2UgYWxsb2NhdGlvbgogwqAg
wqAgKiB0aW1lIGhhcHBlbnMgb24gYSBjYWNoZWQgbWFwcGluZyB3aGljaCBpc24ndCBDUFUtZmx1
c2hlZCAuLi4KCkZvciBwdnIgdGhlcmUgaXMgbm8gcHJvYmxlbSB3aXRoIHRoYXQ6IGNvaGVyZW50
IGRldmljZXMgYWx3YXlzIGdldApQVlJfQk9fQ1BVX0NBQ0hFRCwgYW5kIG9uIG5vbi1jb2hlcmVu
dCBvbmVzIHRoZSB6ZXJvZXMgYXJlIGZsdXNoZWQgYnkKZG1hX21hcF9zZ3RhYmxlKCkgYW5kIGJ5
IHRoZSBkbWFfc3luY19zZ3RhYmxlX2Zvcl9kZXZpY2UoKSBhbHJlYWR5IGRvbmUKaW4gcHZyX2dl
bV9vYmplY3RfY3JlYXRlKCkuCgo+IFNpbmNlIHRoZSBkcml2ZXIgd291bGQgbm93IHJlbHkgb24g
aXQsIGNvdWxkIHlvdSBzcGVsbCBvdXQgaW4gdGhlCj4gY29tbWl0IG1lc3NhZ2Ugd2hlcmUgdGhl
IHplcm9pbmcgaGFwcGVucyBhbmQgd2h5IGl0IGNhbiBiZSByZWxpZWQgb24/Cj4KaSB3aWxsIGFk
ZCB0aGVzZSBkZXRhaWwgaW4gY29tbWl0IG1lc3NhZ2UgaW4gdjIgaWYgaXQgbG9vayBvayBmb3Ig
eW91LgoKUmVnYXJkcwpHdWlsbGF1bWUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
