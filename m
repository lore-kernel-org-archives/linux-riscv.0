Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C13E7717D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 16:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=la/rUAP6FZEPvecCq3s62z/NzSqThHKeRTKwWjMFwVs=; b=HJScso4q6uytr8
	OS8m1BMVPFSSNceoV7H93sNflu+dL1XoNFQ0jOkBKVOdXPqsVRKQEMOVy5zwG959UnIn3YFyMk2IH
	hAmbkqbEezMwvQ+4KMGGoSKO2HJpNVndkWF/lCvLPf+21v/qrK8ok9FVq6DdY8L4TdHunPxKMQB7/
	iIjUObVcujxjlr5UWXcVKrsGnD6DzaDnPg831oR+jnRPY7BKytZz0/E6W8abzh3Rv3nE4iwu0fLSk
	eIuQy4ngYII4AiGnkI1W7JVl7HEb4Ua7FX9Mpnpq1tyzxrCZqAeUMf1miW1zR5mUTiBJQhKLERFmP
	VFj+vHzUnyiZLa2u8AyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPQn-0000000FQFL-3ucA;
	Wed, 11 Dec 2024 16:19:21 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPOk-0000000FPzp-0WgM
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 16:17:15 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-801986033f9so1003358a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Dec 2024 08:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733933833; x=1734538633; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jq/TCQwMHuOfCjEI0R/TuYzX3aKPM48YR1W82vm1fRE=;
        b=BcAZWN9TdlXlJ6cK8puuZ7ZcgRC2oQPOs5zgx5Gql3EM6RHds/G10bHhed41cw/nDU
         bbsgzy2ymoGVObGtdXX8ivO+ZlAHue+e7uTaDsGNeSw+BXGoS2t9hm4zkpPfoE8eHuHb
         sgLfH2YsOB+c+r4KKlZxUIirU7VXpUTrJEESC38c1Dk8yJmBReqI7lABdFjg+d70kJlE
         Z/bsOic6TK/pLrZcdF+CnXxTm3+uTLMTIfmH857E4oGy9nQxXXLzhNKfkKI6KkcBABZD
         8d4zLVDEDOwXiIQrd5o5WObvlFJ8CeLCsBjrUkyOuap8egms4fPYD7IXHXjttdtA19d5
         a05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733933833; x=1734538633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jq/TCQwMHuOfCjEI0R/TuYzX3aKPM48YR1W82vm1fRE=;
        b=o2kBZUCL9byWB7aekCdJSKmyVuH+n9WspX/zDhv4/pCFsZy2acrPsHmko2VF5ehVl3
         Zy+Z7rH1PA7tSrYBHeSuqc34MH7QzIgIO45A3t8+GcDczg3LhFufKPBiIuOkgtx2D7Bm
         B2bVZWHwtcljUhPnrazmPW6Ol9+l29IauvjOQqiZLuTTsA+6MV905Q5qYI2x3KBbS2dI
         /UEigVzlUH7qAUjE+JNNno27xNHxv9Y40FrAp/8utmiBi1uZRIPQQKdyQLVG1qia4LSd
         qDy2MJ0SRf0sO7ojf1JenG8UqB4ZIMODQ77mw4iX0EA54yUF7th/+0z/7Y1BkBnowAaS
         ghxw==
X-Forwarded-Encrypted: i=1; AJvYcCXgyGOb62levGV2kyOgCFClG/R26LBepTAWrQnuiVBNcF8tLuVgrkqslKxkKQrF3Ix8QxVBTkItMePCow==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5v9KHC0zSJSuW3mLy3zUV7uG+WlDEHd5dYKah8cs8c1meXUQP
	gje6oFOHaRQu7iAt7is8wQ9mvK9cyCtXoS1MkzYKi9NYa7FLfxAI0BGIr3WnH7qLOt9APchEkwy
	8iQzI/qopY9pWOxCoCcvbftrW+0o=
X-Gm-Gg: ASbGnculYnh6T4ccc2btesy55MmzysH23IYmZWYpHstmXnxrXCBYgdr8Exnml44JTJn
	1U4I4HOoh0mfFoep1tF4KkShmrRjfZgT0
X-Google-Smtp-Source: AGHT+IHYjDXPytNfTe0XKCQE1JXhVDpkYIM+eEQ3akL1ezpi8wWYQsifBttcnbEYMgIDsi/1wZ4tGjMZx4Q3s584ZSo=
X-Received: by 2002:a17:90b:268e:b0:2ee:c2b5:97a0 with SMTP id
 98e67ed59e1d1-2f13930a5eamr709823a91.25.1733933832672; Wed, 11 Dec 2024
 08:17:12 -0800 (PST)
MIME-Version: 1.0
References: <20241210142353.6457-1-yongxuan.wang@sifive.com> <20241210142353.6457-3-yongxuan.wang@sifive.com>
In-Reply-To: <20241210142353.6457-3-yongxuan.wang@sifive.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Thu, 12 Dec 2024 00:17:01 +0800
Message-ID: <CAFTtA3NTcHAm4YRMQr5N8TkQnLS5tXhw7LihiR8=9D+3HXT7Gg@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: signal: fix signal_minsigstksz
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Zong Li <zong.li@sifive.com>, 
	Conor Dooley <conor.dooley@microchip.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Zhongqiu Han <quic_zhonhan@quicinc.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_081714_162469_EFDA9A6C 
X-CRM114-Status: GOOD (  22.81  )
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

SGkgWW9uZy1YdWFuLAoKWW9uZy1YdWFuIFdhbmcgPHlvbmd4dWFuLndhbmdAc2lmaXZlLmNvbT4g
5pa8IDIwMjTlubQxMuaciDEw5pelIOmAseS6jCDkuIvljYgxMDoyNOWvq+mBk++8mgo+Cj4gVGhl
IGluaXRfcnRfc2lnbmFsX2VudigpIGZ1bmNpdG9uIGlzIGNhbGxlZCBiZWZvcmUgdGhlIGFsdGVy
bmF0aXZlIHBhdGNoCj4gaXMgYXBwbGllZCwgc28gdXNpbmcgdGhlIGFsdGVybmF0aXZlLXJlbGF0
ZWQgQVBJIHRvIGNoZWNrIHRoZSBhdmFpbGFiaWxpdHkKPiBvZiBhbiBleHRlbnNpb24gd2l0aGlu
IHRoaXMgZnVuY3Rpb24gZG9lc24ndCBoYXZlIHRoZSBpbnRlbmRlZCBlZmZlY3QuCj4gSW5zdGVh
ZCwgdGhlIHJpc2N2X2lzYSBiaXRtYXAgc2hvdWxkIGJlIHVzZWQgdG8gcHJvcGVybHkgY2hlY2sg
d2hldGhlcgo+IGdpdmVuIGV4dGVuc2lvbiBpcyBhdmFpbGFibGUuIFRoaXMgcGF0Y2ggYWxzbyBy
ZWZhY3RvcnMgdGhlIGVzdGltYXRpb24gb2YKPiBzaWduYWxfbWluc2lnc3Rrc3ogYnkgZXh0cmFj
dGluZyBpdCBmcm9tIHRoZSBnZXRfcnRfZnJhbWVfc2l6ZSgpIGZ1bmNpdG9uLgo+Cj4gRml4ZXM6
IGU5MmY0NjliMDc3MSAoInJpc2N2OiBzaWduYWw6IFJlcG9ydCBzaWduYWwgZnJhbWUgc2l6ZSB0
byB1c2Vyc3BhY2UgdmlhIGF1eHYiKQo+IFNpZ25lZC1vZmYtYnk6IFlvbmctWHVhbiBXYW5nIDx5
b25neHVhbi53YW5nQHNpZml2ZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IFpvbmcgTGkgPHpvbmcubGlA
c2lmaXZlLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvc2lnbmFsLmMgfCA0MCArKysr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjUg
aW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvc2lnbmFsLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zaWduYWwuYwo+IGluZGV4IGMz
YzUxN2I5ZWVlNS4uODVlYWM4NDcxOWU5IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L3NpZ25hbC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2lnbmFsLmMKPiBAQCAtMjAzLDIy
ICsyMDMsMTggQEAgc3RhdGljIGxvbmcgcmVzdG9yZV9zaWdjb250ZXh0KHN0cnVjdCBwdF9yZWdz
ICpyZWdzLAo+ICAgICAgICAgcmV0dXJuIGVycjsKPiAgfQo+Cj4gLXN0YXRpYyBzaXplX3QgZ2V0
X3J0X2ZyYW1lX3NpemUoYm9vbCBjYWxfYWxsKQo+ICtzdGF0aWMgc2l6ZV90IGdldF9ydF9mcmFt
ZV9zaXplKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgcnRfc2ln
ZnJhbWUgX191c2VyICpmcmFtZTsKPiAtICAgICAgIHNpemVfdCBmcmFtZV9zaXplOwo+ICsgICAg
ICAgc2l6ZV90IGZyYW1lX3NpemUgPSBzaXplb2YoKmZyYW1lKTsKPiAgICAgICAgIHNpemVfdCB0
b3RhbF9jb250ZXh0X3NpemUgPSAwOwo+Cj4gLSAgICAgICBmcmFtZV9zaXplID0gc2l6ZW9mKCpm
cmFtZSk7Cj4gLQo+IC0gICAgICAgaWYgKGhhc192ZWN0b3IoKSkgewo+IC0gICAgICAgICAgICAg
ICBpZiAoY2FsX2FsbCB8fCByaXNjdl92X3ZzdGF0ZV9xdWVyeSh0YXNrX3B0X3JlZ3MoY3VycmVu
dCkpKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHRvdGFsX2NvbnRleHRfc2l6ZSArPSByaXNj
dl92X3NjX3NpemU7Cj4gLSAgICAgICB9Cj4gKyAgICAgICBpZiAoaGFzX3ZlY3RvcigpICYmIHJp
c2N2X3ZfdnN0YXRlX3F1ZXJ5KHJlZ3MpKQo+ICsgICAgICAgICAgICAgICB0b3RhbF9jb250ZXh0
X3NpemUgKz0gcmlzY3Zfdl9zY19zaXplOwo+Cj4gICAgICAgICBmcmFtZV9zaXplICs9IHRvdGFs
X2NvbnRleHRfc2l6ZTsKPiAtCj4gICAgICAgICBmcmFtZV9zaXplID0gcm91bmRfdXAoZnJhbWVf
c2l6ZSwgMTYpOwo+ICsKPiAgICAgICAgIHJldHVybiBmcmFtZV9zaXplOwo+ICB9Cj4KPiBAQCAt
MjI4LDcgKzIyNCw3IEBAIFNZU0NBTExfREVGSU5FMChydF9zaWdyZXR1cm4pCj4gICAgICAgICBz
dHJ1Y3QgcnRfc2lnZnJhbWUgX191c2VyICpmcmFtZTsKPiAgICAgICAgIHN0cnVjdCB0YXNrX3N0
cnVjdCAqdGFzazsKPiAgICAgICAgIHNpZ3NldF90IHNldDsKPiAtICAgICAgIHNpemVfdCBmcmFt
ZV9zaXplID0gZ2V0X3J0X2ZyYW1lX3NpemUoZmFsc2UpOwo+ICsgICAgICAgc2l6ZV90IGZyYW1l
X3NpemUgPSBnZXRfcnRfZnJhbWVfc2l6ZShyZWdzKTsKPgo+ICAgICAgICAgLyogQWx3YXlzIG1h
a2UgYW55IHBlbmRpbmcgcmVzdGFydGVkIHN5c3RlbSBjYWxscyByZXR1cm4gLUVJTlRSICovCj4g
ICAgICAgICBjdXJyZW50LT5yZXN0YXJ0X2Jsb2NrLmZuID0gZG9fbm9fcmVzdGFydF9zeXNjYWxs
Owo+IEBAIC0zMTgsNyArMzE0LDcgQEAgc3RhdGljIGludCBzZXR1cF9ydF9mcmFtZShzdHJ1Y3Qg
a3NpZ25hbCAqa3NpZywgc2lnc2V0X3QgKnNldCwKPiAgICAgICAgIHN0cnVjdCBydF9zaWdmcmFt
ZSBfX3VzZXIgKmZyYW1lOwo+ICAgICAgICAgbG9uZyBlcnIgPSAwOwo+ICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBfX21heWJlX3VudXNlZCBhZGRyOwo+IC0gICAgICAgc2l6ZV90IGZyYW1lX3NpemUg
PSBnZXRfcnRfZnJhbWVfc2l6ZShmYWxzZSk7Cj4gKyAgICAgICBzaXplX3QgZnJhbWVfc2l6ZSA9
IGdldF9ydF9mcmFtZV9zaXplKHJlZ3MpOwo+Cj4gICAgICAgICBmcmFtZSA9IGdldF9zaWdmcmFt
ZShrc2lnLCByZWdzLCBmcmFtZV9zaXplKTsKPiAgICAgICAgIGlmICghYWNjZXNzX29rKGZyYW1l
LCBmcmFtZV9zaXplKSkKPiBAQCAtNDY1LDE5ICs0NjEsMzMgQEAgdm9pZCBhcmNoX2RvX3NpZ25h
bF9vcl9yZXN0YXJ0KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ICB2b2lkIGluaXRfcnRfc2lnbmFs
X2Vudih2b2lkKTsKPiAgdm9pZCBfX2luaXQgaW5pdF9ydF9zaWduYWxfZW52KHZvaWQpCj4gIHsK
PiAtICAgICAgIHJpc2N2X3Zfc2Nfc2l6ZSA9IHNpemVvZihzdHJ1Y3QgX19yaXNjdl9jdHhfaGRy
KSArCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2Yoc3RydWN0IF9fc2NfcmlzY3Zf
dl9zdGF0ZSkgKyByaXNjdl92X3ZzaXplOwo+ICsgICAgICAgc3RydWN0IHJ0X3NpZ2ZyYW1lIF9f
dXNlciAqZnJhbWU7Cj4gKyAgICAgICBzaXplX3QgZnJhbWVfc2l6ZSA9IHNpemVvZigqZnJhbWUp
Owo+ICsKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBpbml0X3J0X3NpZ25hbF9lbnYoKSBpcyBj
YWxsZWQgYmVmb3JlIGFwcGx5aW5nIGFsdGVybmF0aXZlIHBhdGNoLiBEbyBub3QgdXNlCj4gKyAg
ICAgICAgKiBfX3Jpc2N2X2hhc19leHRlbnNpb25fbGlrZWx5KCkvX19yaXNjdl9oYXNfZXh0ZW5z
aW9uX3VubGlrZWx5KCkgdG8gY2hlY2sgdGhlCj4gKyAgICAgICAgKiBhdmFpbGlhYmxpdHkgb2Yg
YW4gZXh0ZW5zaW9uIGluIHRoaXMgZnVuY3Rpb24uCj4gKyAgICAgICAgKi8KPiArICAgICAgIGlm
IChfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKE5VTEwsIFJJU0NWX0lTQV9FWFRfdikp
IHsKClRoaXMgc2hvdWxkIGFsc28gY2hlY2sgZm9yIElTX0VOQUJMRUQoQ09ORklHX1JJU0NWX0lT
QV9WKS4gQW5vdGhlciB3YXkKdG8gZG8gdGhpcyBpcyB0byBjYWxsIGluaXRfcnRfc2lnbmFsX2Vu
digpIGFmdGVyCmFwcGx5X2Jvb3RfYWx0ZXJuYXRpdmUoKS4gVGhpcyBjYW4gbWFrZSBhc3N1bXB0
aW9ucyBvbiBkaWZmZXJlbnQgcGllY2UKb2YgY29kZSBtb3JlIGNvaGVyZW50LiBXaGF0IGRvIHlv
dSB0aGluaz8KCgo+ICsgICAgICAgICAgICAgICByaXNjdl92X3NjX3NpemUgPSBzaXplb2Yoc3Ry
dWN0IF9fcmlzY3ZfY3R4X2hkcikgKwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzaXplb2Yoc3RydWN0IF9fc2NfcmlzY3Zfdl9zdGF0ZSkgKyByaXNjdl92X3ZzaXplOwo+ICsg
ICAgICAgICAgICAgICBmcmFtZV9zaXplICs9IHJpc2N2X3Zfc2Nfc2l6ZTsKPiArICAgICAgIH0K
PiArCj4gKyAgICAgICBmcmFtZV9zaXplID0gcm91bmRfdXAoZnJhbWVfc2l6ZSwgMTYpOwo+ICsK
PiAgICAgICAgIC8qCj4gICAgICAgICAgKiBEZXRlcm1pbmUgdGhlIHN0YWNrIHNwYWNlIHJlcXVp
cmVkIGZvciBndWFyYW50ZWVkIHNpZ25hbCBkZWxpdmVyeS4KPiAgICAgICAgICAqIFRoZSBzaWdu
YWxfbWluc2lnc3Rrc3ogd2lsbCBiZSBwb3B1bGF0ZWQgaW50byB0aGUgQVRfTUlOU0lHU1RLU1og
ZW50cnkKPiAgICAgICAgICAqIGluIHRoZSBhdXhpbGlhcnkgYXJyYXkgYXQgcHJvY2VzcyBzdGFy
dHVwLgo+ICAgICAgICAgICovCj4gLSAgICAgICBzaWduYWxfbWluc2lnc3Rrc3ogPSBnZXRfcnRf
ZnJhbWVfc2l6ZSh0cnVlKTsKPiArICAgICAgIHNpZ25hbF9taW5zaWdzdGtzeiA9IGZyYW1lX3Np
emU7Cj4gIH0KPgo+ICAjaWZkZWYgQ09ORklHX0RZTkFNSUNfU0lHRlJBTUUKPiAgYm9vbCBzaWdh
bHRzdGFja19zaXplX3ZhbGlkKHNpemVfdCBzc19zaXplKQo+ICB7Cj4gLSAgICAgICByZXR1cm4g
c3Nfc2l6ZSA+IGdldF9ydF9mcmFtZV9zaXplKGZhbHNlKTsKPiArICAgICAgIHJldHVybiBzc19z
aXplID4gZ2V0X3J0X2ZyYW1lX3NpemUoY3VycmVudF9wdF9yZWdzKCkpOwo+ICB9Cj4gICNlbmRp
ZiAvKiBDT05GSUdfRFlOQU1JQ19TSUdGUkFNRSAqLwo+IC0tCj4gMi4xNy4xCj4KClRoYW5rcywK
QW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
