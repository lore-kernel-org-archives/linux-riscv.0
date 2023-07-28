Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4B2C001E0
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 09:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kr2eLWnC/MpO4lSjx0AwTsMwzo9Yu6tvLlV5A+jQH3o=; b=YHI/lxVYEDq7Aq
	DF9liAkDjd3QpXVBMlTH7TOXuZXU4nC9HaBOMBTBAS08GZckEN/emzxAGUHHifXufAA/Xdmd1MDQf
	GaWrSVCp4vAk4BDtZl3YczLlQ98KZ+3gcrYoIOsO219AWkTF03NzRdxJX20V4sncLlzl9N0rzwcmf
	QCpq7HaFm8yrM+j1xhgVX8hqaUai6tQrSs4GgORJ2HGMa/BCaJlYbyt2/05i8mjEZ5vqO8KplnPo6
	Nd/JY333iSyffJxzkA6JRua4M/YKbD45nD5xkxaFs5HvYyTvBK5B0dmkdUolyzO2R3NqSfcqRy9jq
	6Wt3boD0q4WNc1chTmwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJOs-002Zlk-0u;
	Fri, 28 Jul 2023 09:04:42 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJOo-002ZkL-0N
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 09:04:40 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b9c0391749so28757671fa.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 02:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1690535074; x=1691139874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoUjJ9zL9e663eyjUh3+yZMV+gsB92P640Sm3159mYQ=;
        b=GWE2v5GO0nR84rzpqfnEgejBzGhN8kmeIhUex9shslMfLPk8x4dv8QTreZX6Xth0FC
         SJeQBMwslj3Hg8jppS7yNQ41Jg+5J0l6/aJ5iPM0raqiZN+GpksIu2nXTlyYkCXNNw4S
         VPHZWoR4IgMDrMmwkp3ms++fNSTf/MykV8Ugh41L+duzNuhm2XvaRObJa9FOZgr7uI6y
         amAEVguzKhWS8ui7CoNHnTNhIjJFZohoStgGhN7io2g3TVUDTHvkeyYhINgDBQYrEDZe
         mW0R3+Yg0QnEfTlQbNFhmxx90NlZjF7MX3YyJypumLONO3cERP2TLnj3r0TibU9nN/um
         MpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690535074; x=1691139874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QoUjJ9zL9e663eyjUh3+yZMV+gsB92P640Sm3159mYQ=;
        b=NFlZuLIIokvazxYNelaLSKZDTb4YOxSQ1AUgkV//avcv1eV8JPfPz33HvdhZcAs0zv
         7dTY+sAPhNN3bchYw02+gqLfWB28hH5vLFFJ1+5GtAC4Nv6fYpJEzJNMhhzfqfx1UewS
         UNMdj/nbpG5C0Hh5+mlXNLHkcJwlHYca6xBAEOSRrmTI2/LwWuU2+DaEmoEfozd7/AOI
         Go94poOba8O4QnWN8ZNCgzoYVdSnGZQuj7awgjXBkzFfJ5C2zi7RmBY5lmWQuvoZvVlc
         q9m3G/aXioeM31qv8J9Diy54GsrWHkJUDrcQw+PA4+n6oZ284GIZEjL0bHe8TamTZ7w5
         BB7g==
X-Gm-Message-State: ABy/qLbj71iv2nQWcDJpracW/q556NlpiJ4tI396gvnAOfJ3WMbPBpCt
	hmxgzrZJky7aX3LJRSVKXu2KlVed10M3YGkzmsrrFQ==
X-Google-Smtp-Source: APBJJlE2xC/ePHFkPLVLV9/WTr37CR88KoeWLBzMv1tBu7gB0t5QjfHg6H1TPAqSzSN+blmCxSh5RZhbRETHKEBz5Gs=
X-Received: by 2002:a2e:97d7:0:b0:2b6:fa60:85a1 with SMTP id
 m23-20020a2e97d7000000b002b6fa6085a1mr1301429ljj.21.1690535074159; Fri, 28
 Jul 2023 02:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230720135125.21240-1-eric.lin@sifive.com> <20230720135125.21240-2-eric.lin@sifive.com>
 <cbf0a8fd-3479-1684-fe90-81f2159804ef@linaro.org> <CAPqJEFr5h+5+F4TdNuRMaWsrmeedbfGgbgd9wh8sUUQsj2Pw-A@mail.gmail.com>
 <be748338-987b-d474-d040-82af7cfb5f01@linaro.org>
In-Reply-To: <be748338-987b-d474-d040-82af7cfb5f01@linaro.org>
From: Eric Lin <eric.lin@sifive.com>
Date: Fri, 28 Jul 2023 17:04:23 +0800
Message-ID: <CAPqJEFpYOgaEiSJ4HJwxMtpu1MZeUg9=tARTWa7hwTkjsQ3UAA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: sifive: Add SiFive Private L2
 cache controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, zong.li@sifive.com, greentime.hu@sifive.com, 
	vincent.chen@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_020438_155521_F7AFCA84 
X-CRM114-Status: GOOD (  20.27  )
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

T24gRnJpLCBKdWwgMjgsIDIwMjMgYXQgMjo1OOKAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiAyOC8wNy8yMDIzIDA4
OjAxLCBFcmljIExpbiB3cm90ZToKPiA+IEhpIEtyenlzenRvZiwKPiA+Cj4gPiBPbiBGcmksIEp1
bCAyMSwgMjAyMyBhdCA0OjM14oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraQo+ID4gPGtyenlzenRv
Zi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPj4KPiA+PiBPbiAyMC8wNy8yMDIzIDE1
OjUxLCBFcmljIExpbiB3cm90ZToKPiA+Pj4gVGhpcyBhZGQgWUFNTCBEVCBiaW5kaW5nIGRvY3Vt
ZW50YXRpb24gZm9yIFNpRml2ZSBQcml2YXRlIEwyCj4gPj4+IGNhY2hlIGNvbnRyb2xsZXIKPiA+
Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogRXJpYyBMaW4gPGVyaWMubGluQHNpZml2ZS5jb20+Cj4g
Pj4+IFJldmlld2VkLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gPj4+IFJldmll
d2VkLWJ5OiBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+Cj4gPj4KPiA+Pgo+ID4+IC4uLgo+
ID4+Cj4gPj4+ICtwcm9wZXJ0aWVzOgo+ID4+PiArICBjb21wYXRpYmxlOgo+ID4+PiArICAgIGl0
ZW1zOgo+ID4+PiArICAgICAgLSBjb25zdDogc2lmaXZlLHBsMmNhY2hlMQo+ID4+Cj4gPj4gSSBz
dGlsbCBoYXZlIGRvdWJ0cyB0aGF0IGl0IGlzIG5vdCB1c2VkIGluIGFueSBTb0MuIFRoaXMgaXMg
d2hhdCB5b3UKPiA+PiBzYWlkIGxhc3QgdGltZTogImlzIG5vdCBwYXJ0IG9mIGFueSBTb0MuIgo+
ID4+IElmIG5vdCBwYXJ0IG9mIGFueSBTb0MsIHRoZW4gd2hlcmUgaXMgaXQ/IFdoeSBhcmUgeW91
IGFkZGluZyBpdCB0byB0aGUKPiA+PiBrZXJuZWw/Cj4gPj4KPiA+Cj4gPiBTb3JyeSBmb3IgdGhl
IGxhdGUgcmVwbHkuIEkgZGlkbid0IGRlc2NyaWJlIGl0IGNsZWFybHkgbGFzdCB0aW1lLgo+ID4g
Q3VycmVudGx5LCB3ZSBoYXZlIHR3byBoYXJkd2FyZSB2ZXJzaW9ucyBvZiBwbDJjYWNoZTogcGwy
Y2FjaGUwIGFuZCBwbDJjYWNoZTEuCj4gPiBUaGUgcGwyY2FjaGUwIGlzIHVzZWQgaW4gdW5tYXRj
aGVkIGJvYXJkIFNvQy4gVGhlIHBsMmNhY2hlMSBpcwo+ID4gdXRpbGl6ZWQgaW4gb3VyIGludGVy
bmFsIEZQR0EgcGxhdGZvcm0gZm9yIGV2YWx1YXRpb247IGl0J3Mgb3VyIGNvcmUKPiA+IElQLgo+
Cj4gQW5kIHdoeSBkbyB5b3UgYWRkIGJpbmRpbmdzIGZvciBzb21lIGludGVybmFsIEZQR0EgSVAg
YmxvY2sgd2hpY2ggZG9lcwo+IG5vdCBpbnRlcmZhY2Ugd2l0aCBhbnkgU1c/Cj4KCkhpIEtyenlz
enRvZiwKVGhlIHBsMmNhY2hlIGhhcyBtbWlvIGludGVyZmFjZSBmb3IgU1cuIFRoYW5rcy4KCkJl
c3QgcmVnYXJkcywKRXJpYyBMaW4KCj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgo+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
