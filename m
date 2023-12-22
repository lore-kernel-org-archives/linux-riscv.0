Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A68C46CD3
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 01:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gGCBc2dmprHiVOv7pD2ONMJGBWM7YwfwsIVxwV2mfxA=; b=XLVslZgWh51/9h
	PgJeJaqzi9uPpuND/CQw4Mb/Q3ZrPfNWrtdskOY4cOJH43BAqQnaDvdr6aS3sNvXMCjwqXoT3qnOL
	PLZHnQujeQWu72cDyjbb6v24hlg15BNXAQ4+y5OImonYf4esHkgxTgMzWx2zGv8C6nazGw8r245fD
	5XsHjBQRRC2+oUtH9nBUDMlCLb5VTW+kTC00LYEdSagxyKeuPJlmLcp2RtgA+N9+aV3ipiGM2I3I3
	etfiL49mdon6S6vbIjiLL6ip3dCDCWv9LrsNe+sqamNjUvUYy5ChkM4vYq/0bdhCuiz9z+vTyy9qV
	xq9sP5gjfRVD4WD74tiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGUUM-004cZs-1i;
	Fri, 22 Dec 2023 01:38:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGUUL-004cZg-2f
	for linux-riscv@bombadil.infradead.org;
	Fri, 22 Dec 2023 01:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/pHml5C4iB2UVOdNccbY5NzIin1Pbsu1DFBGnQ9mBxA=; b=UmIPWstgC49btQO3XRS9mXfmUW
	txx2icwAZ0EQlf+bzmrZi0rK8rNPJ3jCF8omGsrj3XkXZx5fThOfNt9y5uBtH2x4cgZfabhwEVsfp
	em2TrjRLZB86PjldJo1jimi5m/IeeFOzglLacZJSY2izaj9Fk4Iza2x4OoBYUTSOOAt/+gyafENpx
	DDIhKFkspt/dzkxotEJIAethysLraBGIrmK5y0NycZBVgfztUVpCNanTQVEx+StiEOEfWFduIIfsR
	pZ3sz3X59lERqoIbS7wPx42m+SZXOdNb49AIfm1IKmpxAaoZCSNsGYSv9oDtSp9AbHJPvGhSZGdWH
	7Z22PP4Q==;
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGUUH-00F0CW-27
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 01:38:08 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-28b6ea19368so1154025a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 17:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703209074; x=1703813874; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/pHml5C4iB2UVOdNccbY5NzIin1Pbsu1DFBGnQ9mBxA=;
        b=qiOf4+axFn1Oot8o9mPhtlvl/ysQMOu6Xj54MShoHLBbYn5LuNm0vRTMsZxp0X0jnA
         uu+haJ0OBPY0rDhwl4ZeOn6CzI5HjFmoxY0TA5ZLSmhcRVjgFEEp8DPC+v9aB8BzKcZa
         SZdl0kARG5e4VT6KWwFsS1kBKQAoX/5CUVwFh6ORf6Mm3/Yq5eZKt/Vj2tzrvmh+JCqW
         oe2gu4+kRV3FkR6IMB+R10KJMl+uw/xp/elt2eRIsRAowY/1uVe2fJqXAlyAP+s4bvQX
         BFDwxlxPUhZN/EdCZOJi+5DVs22axXntU2c0gfMN8T6wvCBnQyaw+rkPQFkJo3PWkjCr
         NkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703209074; x=1703813874;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/pHml5C4iB2UVOdNccbY5NzIin1Pbsu1DFBGnQ9mBxA=;
        b=Ag4H9LlIdU/mO7xcLRlgi9dWbkgUAdS30RbQ9vL823dv+mM7OhARGtWJpj5rk8ZF5X
         mi3HDHJVtZgOBWp2R+sFlYTVvBVbw6QUiHiUis6J8gsqX1/uN9n3zuASCb9dWSr9VXyR
         +cqViKfG2JieVESFoINUSp86CKpH4lutUAzOyV6Q6MlTMI5PxG9Z8GnTjGDQ5CXTQsw2
         AYaGhzdrvA1nPv6kF2ht2hQo2oU8vJ1CZNML8FeeYz3peoaV9kaw5PBONYpPplD5ZtOU
         /7s0jBqUweP/E41FS9lafA9UIpX21mez0qEpXsTZJbQQ6Of625eh1/RA3iamtpFYar6L
         IYNA==
X-Gm-Message-State: AOJu0YwZA81GsmB12+qulnqSA3sc7hz0bfFihvVIcQRlTRle+tOf8bRo
	YfkKFTGIfn0sm//MTJ11Z26N6/LPsPM3Pw==
X-Google-Smtp-Source: AGHT+IHv22/ncKELWCuGh/tHAsgFvMxwYlO/s4McjHKY7KJFdAKT4sUqnIxQFPL3y5PE5Y0BnpMIPA==
X-Received: by 2002:a17:90a:6f43:b0:28b:9f7c:177 with SMTP id d61-20020a17090a6f4300b0028b9f7c0177mr513590pjk.18.1703209073698;
        Thu, 21 Dec 2023 17:37:53 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id si6-20020a17090b528600b0028b5812c477sm6343572pjb.35.2023.12.21.17.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 17:37:53 -0800 (PST)
Date: Thu, 21 Dec 2023 17:37:51 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	David Laight <David.Laight@aculab.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Evan Green <evan@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v13 2/5] riscv: Add static key for misaligned accesses
Message-ID: <ZYTobxPZVNct4toQ@ghost>
References: <20231220-optimize_checksum-v13-0-a73547e1cad8@rivosinc.com>
 <20231220-optimize_checksum-v13-2-a73547e1cad8@rivosinc.com>
 <CAJF2gTR9ZxLZwEs=TMeih+vEEuuxNHRkgLsG2ShjXPEZ-G44_w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTR9ZxLZwEs=TMeih+vEEuuxNHRkgLsG2ShjXPEZ-G44_w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_013805_884981_1675F766 
X-CRM114-Status: GOOD (  28.97  )
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

T24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMDg6MzM6MThBTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBUaHUsIERlYyAyMSwgMjAyMyBhdCA3OjM44oCvQU0gQ2hhcmxpZSBKZW5raW5zIDxjaGFy
bGllQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPgo+ID4gU3VwcG9ydCBzdGF0aWMgYnJhbmNoZXMg
ZGVwZW5kaW5nIG9uIHRoZSB2YWx1ZSBvZiBtaXNhbGlnbmVkIGFjY2Vzc2VzLgo+ID4gVGhpcyB3
aWxsIGJlIHVzZWQgYnkgYSBsYXRlciBwYXRjaCBpbiB0aGUgc2VyaWVzLiBBbGwgY3B1cyBtdXN0
IGJlCj4gPiBjb25zaWRlcmVkICJmYXN0IiBmb3IgdGhpcyBzdGF0aWMgYnJhbmNoIHRvIGJlIGZs
aXBwZWQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJp
dm9zaW5jLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVy
ZS5oIHwgIDIgKysKPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgICAgICB8IDMw
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMzIg
aW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2NwdWZlYXR1cmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCj4gPiBp
bmRleCBhNDE4YzMxMTJjZDYuLjdiMTI5ZTVlMmYwNyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2NwdWZlYXR1cmUuaAo+ID4gQEAgLTEzMyw0ICsxMzMsNiBAQCBzdGF0aWMgX19hbHdheXNf
aW5saW5lIGJvb2wgcmlzY3ZfY3B1X2hhc19leHRlbnNpb25fdW5saWtlbHkoaW50IGNwdSwgY29u
c3QgdW5zaQo+ID4gICAgICAgICByZXR1cm4gX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJs
ZShoYXJ0X2lzYVtjcHVdLmlzYSwgZXh0KTsKPiA+ICB9Cj4gPgo+ID4gK0RFQ0xBUkVfU1RBVElD
X0tFWV9GQUxTRShmYXN0X21pc2FsaWduZWRfYWNjZXNzX3NwZWVkX2tleSk7Cj4gPiArCj4gPiAg
I2VuZGlmCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIv
YXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gPiBpbmRleCBiMzc4NWZmYzE1NzAuLjA5
NWViNmViZGNhYSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUu
Ywo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gPiBAQCAtMTAsNiAr
MTAsNyBAQAo+ID4gICNpbmNsdWRlIDxsaW51eC9iaXRtYXAuaD4KPiA+ICAjaW5jbHVkZSA8bGlu
dXgvY3B1aG90cGx1Zy5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9jdHlwZS5oPgo+ID4gKyNpbmNs
dWRlIDxsaW51eC9qdW1wX2xhYmVsLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2xvZzIuaD4KPiA+
ICAjaW5jbHVkZSA8bGludXgvbWVtb3J5Lmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5o
Pgo+ID4gQEAgLTcyOCw2ICs3MjksMzUgQEAgdm9pZCByaXNjdl91c2VyX2lzYV9lbmFibGUodm9p
ZCkKPiA+ICAgICAgICAgICAgICAgICBjc3Jfc2V0KENTUl9TRU5WQ0ZHLCBFTlZDRkdfQ0JaRSk7
Cj4gPiAgfQo+ID4KPiA+ICtERUZJTkVfU1RBVElDX0tFWV9GQUxTRShmYXN0X21pc2FsaWduZWRf
YWNjZXNzX3NwZWVkX2tleSk7Cj4gPiArCj4gPiArc3RhdGljIGludCBzZXRfdW5hbGlnbmVkX2Fj
Y2Vzc19zdGF0aWNfYnJhbmNoZXModm9pZCkKPiA+ICt7Cj4gPiArICAgICAgIC8qCj4gPiArICAg
ICAgICAqIFRoaXMgd2lsbCBiZSBjYWxsZWQgYWZ0ZXIgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19h
bGxfY3B1cyBzbyB0aGUKPiA+ICsgICAgICAgICogcmVzdWx0IG9mIHVuYWxpZ25lZCBhY2Nlc3Mg
c3BlZWQgZm9yIGFsbCBjcHVzIHdpbGwgYmUgYXZhaWxhYmxlLgo+ID4gKyAgICAgICAgKi8KPiA+
ICsKPiA+ICsgICAgICAgaW50IGNwdTsKPiA+ICsgICAgICAgYm9vbCBmYXN0X21pc2FsaWduZWRf
YWNjZXNzX3NwZWVkID0gdHJ1ZTsKPiA+ICsKPiA+ICsgICAgICAgZm9yX2VhY2hfb25saW5lX2Nw
dShjcHUpIHsKPiBFYWNoIG9ubGluZV9jcHU/IElzIHRoZXJlIGFueSBvZmZsaW5lX2NwdSB0aGF0
IGlzIG5vCj4gZmFzdF9taXNhbGlnbmVkX2FjY2Vzc19zcGVlZD8KCkkgdGhpbmsgaW5zdGVhZCBv
ZiBjaGVja2luZyBvZmZsaW5lIGNwdXMsIGl0IHdvdWxkIG1ha2UgbW9yZSBzZW5zZSB0bwphZGp1
c3QgdGhlIHN0YXRpYyBicmFuY2ggd2hlbiBvZmZsaW5lIGNwdXMgY29tZSBvbmxpbmUuIFNpbmNl
CnJpc2N2X29ubGluZV9jcHUgaXMgY2FsbGVkIHdoZW4gYSBuZXcgQ1BVIGNvbWVzIG9ubGluZSwg
SSBjYW4gdXBkYXRlIHRoZQpzdGF0aWMgYnJhbmNoIGluc2lkZSBvZiB0aGF0IGZ1bmN0aW9uLgoK
PiAKPiBNb3ZlIGludG8geW91ciByaXNjdl9vbmxpbmVfY3B1IGZvciBlYWNoIENQVSwgYW5kIHVz
ZSBzdG9wX21hY2hpbmUgZm9yCj4gc3luY2hyb25pemF0aW9uLgo+IAoKSSBkbyBub3QgdW5kZXJz
dGFuZCB3aGF0IHlvdSBtZWFuIGJ5ICJNb3ZlIGludG8geW91ciByaXNjdl9vbmxpbmVfY3B1CmZv
ciBlYWNoIENQVSIsIGJ1dCBJIGFtIGFzc3VtaW5nIHlvdSBhcmUgcmVmZXJyaW5nIHRvIHVwZGF0
aW5nIHRoZQpzdGF0aWMgYnJhbmNoIGluc2lkZSBvZiByaXNjdl9vbmxpbmVfY3B1LgoKSSBiZWxp
ZXZlIGFueSByYWNlIGNvbmRpdGlvbiB0aGF0IGNvdWxkIGJlIHNvbHZlZCBieSBzdG9wX21hY2hp
bmUgd2lsbApiZWNvbWUgaXJyZWxldmVudCBieSBlbnN1cmluZyB0aGF0IHRoZSBzdGF0aWMgYnJh
bmNoIGlzIHVwZGF0ZWQgd2hlbiBhCm5ldyBjcHUgY29tZXMgb25saW5lLiAKCi0gQ2hhcmxpZQoK
PiA+ICsgICAgICAgICAgICAgICBpbnQgdGhpc19wZXJmID0gcGVyX2NwdShtaXNhbGlnbmVkX2Fj
Y2Vzc19zcGVlZCwgY3B1KTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICBpZiAodGhpc19wZXJm
ICE9IFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9GQVNUKSB7Cj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICBmYXN0X21pc2FsaWduZWRfYWNjZXNzX3NwZWVkID0gZmFsc2U7Cj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICBicmVhazsKPiA+ICsgICAgICAgICAgICAgICB9Cj4gPiArICAgICAg
IH0KPiA+ICsKPiA+ICsgICAgICAgaWYgKGZhc3RfbWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQpCj4g
PiArICAgICAgICAgICAgICAgc3RhdGljX2JyYW5jaF9lbmFibGUoJmZhc3RfbWlzYWxpZ25lZF9h
Y2Nlc3Nfc3BlZWRfa2V5KTsKPiA+ICsKPiA+ICsgICAgICAgcmV0dXJuIDA7Cj4gPiArfQo+ID4g
Kwo+ID4gK2FyY2hfaW5pdGNhbGxfc3luYyhzZXRfdW5hbGlnbmVkX2FjY2Vzc19zdGF0aWNfYnJh
bmNoZXMpOwo+ID4gKwo+ID4gICNpZmRlZiBDT05GSUdfUklTQ1ZfQUxURVJOQVRJVkUKPiA+ICAv
Kgo+ID4gICAqIEFsdGVybmF0aXZlIHBhdGNoIHNpdGVzIGNvbnNpZGVyIDQ4IGJpdHMgd2hlbiBk
ZXRlcm1pbmluZyB3aGVuIHRvIHBhdGNoCj4gPgo+ID4gLS0KPiA+IDIuNDMuMAo+ID4KPiA+Cj4g
Cj4gCj4gLS0gCj4gQmVzdCBSZWdhcmRzCj4gIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
