Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728A4C25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 16 May 2024 14:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ynPMxmFkpZC8kPwPeG4sI1UNrbNAxPrLKFYcne4vlR4=; b=07kGttmQisx5cN
	PyjupR1YfCmBnbwk6ED8D2BTaK1BN8VbnL3xfA9U0rSdNvThpsVRNSCaiFEky1k6caj41ZUY+XWtm
	Ba7VPC/7Lnnzlzln1HcpSiaTGC3udbZhPOtH9g06t6wcOXMbMaspC7rmXcMJoLQs7qNvYg00vnzKG
	I1IYRRx25vkepiBnllvqb8F4ZYLo7iz7OWJVD/vAI8YTKesSjMy4rgg1E7MM5+pVFwkJ5eU6S+cy5
	zvZnebemW7wZ9KI6UDWn74BAjiVDGfpoZ+xGmuswayeeXxHky3NKI+/OvQl1w2YAGoAX7nGk0+o7G
	aYP+fwJGqEi21ZOIdx0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7bep-000000055ai-31G3;
	Thu, 16 May 2024 14:00:31 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7bek-000000055Z1-44aX
	for linux-riscv@lists.infradead.org;
	Thu, 16 May 2024 14:00:28 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-622ce869e9bso63321497b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 16 May 2024 07:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715868024; x=1716472824; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cD8EYomjv0kIIk3OrzTD6Ca/3+CIlst2MLQc78I7jZU=;
        b=J5ggJHGXmaD1fIl4yTBYYgqqZmCopWVSFa/TV6D1GkINd47unJrNzY07HQAMCnWQ5L
         zdnTa4gepTiqrn7mIwxhXpbuj4QrQD/0uQjM6iQ9Cb18Rmsf9Pp3ewFm0fYzOqj2rO0t
         qKhDwkd02ahD5j8eTapL6PcSCM8RCUJv3zW1Z2HKdnbmQTRoqCGZdZzlOKTTxLsTBjJa
         GdXE4k6S7Fo5HNnxEfnE+Cl0ND9U1uoi3tUXd9K2ofj73Licer9kitlaO4tUneaLj1mX
         jNL50pMUQ9PrAfrJLM449ReRlVoHA89yxLZnyyOhc8Ro8e9OPFA0Wzx6KE33w4BLpW/w
         2mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715868024; x=1716472824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cD8EYomjv0kIIk3OrzTD6Ca/3+CIlst2MLQc78I7jZU=;
        b=FMWiKYL7tw1ajfSiGbKPyInRvmmTy4zmZCkKKwjXpVh4KXfiSSFTuFM4hvWfi3qZMR
         uMD0i5V5Fom5K8j6IiA2zakgV9aJypsaLydfU4FX/Bv+9eA3XDodFyek7yLt2UxdezOS
         ReBURt/zWmOMMALJcJlwEfG7YcfPCL8dTXnS89uHV4uooPvy/GXa6mx45tmQAmilhZI7
         0Beqxo9GSZmJMzq/O+gO2d9whQUfzmHoK6NJZHWdla3irT4wByEfRLqg2iJYU/a2tR/Z
         +QxBDpgOwz1WvU2v9uYwtGLes45jHZFQNYw2o+sGC2Mj1CxdTx9lme4kEH4thyv1cbJ7
         RNlg==
X-Forwarded-Encrypted: i=1; AJvYcCWqk4mqUyoaryxpJDLEBYvTWWwunA4/cTrFgiTeuWL/SuIJ0AXDmrhQFtGBHPPVphiBRlbX9WidKyjvEnM9nIVxNt/hX2czARZcOmWoGgo9
X-Gm-Message-State: AOJu0YzLHoOLrt0BZM/eqqm6HLrMSOQKBzthkj7OFt4bX4WZt+wUgudI
	zbI8NQ5osepZqE0gmqGk0ccAaCNgTQdSGzA3SS/WFZVBjwobBym4Q2t3Hzu3w7EyMQrYWn/fvnE
	qcFxpaqipK2Je7iok47pOl0gUDx4AKLM+091dbA==
X-Google-Smtp-Source: AGHT+IEiXLNHmQcW5RA/wgj6ioJ1XAjnfrpiTrNjDqI8fGRd+D3gGsZcnD/VKszGvYjANziq7R0rmzEGrccihxPdLyI=
X-Received: by 2002:a81:480f:0:b0:61a:dfd6:fd6d with SMTP id
 00721157ae682-622aff831a4mr186279727b3.25.1715868023507; Thu, 16 May 2024
 07:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
 <20240503-dev-charlie-support_thead_vector_6_9-v6-3-cb7624e65d82@rivosinc.com>
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-3-cb7624e65d82@rivosinc.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 16 May 2024 22:00:12 +0800
Message-ID: <CABgGipXg68VEGt=oZZSENmbqs4-g3PB=CBobNwgqQjLHfxo+VQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/17] riscv: vector: Use vlenb from DT
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_070027_238053_9F94260D 
X-CRM114-Status: GOOD (  31.65  )
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

U29ycnkgQ2hhcmxpZSwgSSBmb3Jnb3QgdG8gaW5jbHVkZSB0aGUgbWFpbGluZyBsaXN0LiBIZXJl
IGlzIHRoZSBzYW1lIGFzCndoYXQgSSBzZW50IGluIHRoZSBwcml2YXRlIG1lc3NhZ2UuCgpPbiBT
YXQsIE1heSA0LCAyMDI0IGF0IDI6MjHigK9BTSBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IElmIHZsZW5iIGlzIHByb3ZpZGVkIGluIHRoZSBkZXZpY2Ug
dHJlZSwgcHJlZmVyIHRoYXQgb3ZlciByZWFkaW5nIHRoZQo+IHZsZW5iIGNzci4KPgo+IFNpZ25l
ZC1vZmYtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Cj4gLS0tCj4g
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oIHwgIDIgKysKPiAgYXJjaC9yaXNj
di9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAgfCA0NyArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4gIGFyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jICAgICAgICAgIHwgMTIg
KysrKysrKysrLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDYwIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUu
aCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCj4gaW5kZXggMzQ3ODA1NDQ2
MTUxLi4wYzRmMDg1NzcwMTUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9j
cHVmZWF0dXJlLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAo+
IEBAIC0zMSw2ICszMSw4IEBAIERFQ0xBUkVfUEVSX0NQVShzdHJ1Y3QgcmlzY3ZfY3B1aW5mbywg
cmlzY3ZfY3B1aW5mbyk7Cj4gIC8qIFBlci1jcHUgSVNBIGV4dGVuc2lvbnMuICovCj4gIGV4dGVy
biBzdHJ1Y3QgcmlzY3ZfaXNhaW5mbyBoYXJ0X2lzYVtOUl9DUFVTXTsKPgo+ICtleHRlcm4gdTMy
IHJpc2N2X3ZsZW5iX29mOwo+ICsKPiAgdm9pZCByaXNjdl91c2VyX2lzYV9lbmFibGUodm9pZCk7
Cj4KPiAgI2lmIGRlZmluZWQoQ09ORklHX1JJU0NWX01JU0FMSUdORUQpCj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZl
YXR1cmUuYwo+IGluZGV4IDNlZDIzNTllYWUzNS4uNmMxNDNlYTk1OTJiIDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVs
L2NwdWZlYXR1cmUuYwo+IEBAIC0zNSw2ICszNSw4IEBAIHN0YXRpYyBERUNMQVJFX0JJVE1BUChy
aXNjdl9pc2EsIFJJU0NWX0lTQV9FWFRfTUFYKSBfX3JlYWRfbW9zdGx5Owo+ICAvKiBQZXItY3B1
IElTQSBleHRlbnNpb25zLiAqLwo+ICBzdHJ1Y3QgcmlzY3ZfaXNhaW5mbyBoYXJ0X2lzYVtOUl9D
UFVTXTsKPgo+ICt1MzIgcmlzY3ZfdmxlbmJfb2Y7Cj4gKwo+ICAvKioKPiAgICogcmlzY3ZfaXNh
X2V4dGVuc2lvbl9iYXNlKCkgLSBHZXQgYmFzZSBleHRlbnNpb24gd29yZAo+ICAgKgo+IEBAIC02
NDgsNiArNjUwLDQ2IEBAIHN0YXRpYyBpbnQgX19pbml0IHJpc2N2X2lzYV9mYWxsYmFja19zZXR1
cChjaGFyICpfX3VudXNlZCkKPiAgZWFybHlfcGFyYW0oInJpc2N2X2lzYV9mYWxsYmFjayIsIHJp
c2N2X2lzYV9mYWxsYmFja19zZXR1cCk7Cj4gICNlbmRpZgo+Cj4gK3N0YXRpYyBpbnQgaGFzX3Jp
c2N2X2hvbW9nZW5lb3VzX3ZsZW5iKHZvaWQpCj4gK3sKPiArICAgICAgIGludCBjcHU7Cj4gKyAg
ICAgICB1MzIgcHJldl92bGVuYiA9IDA7Cj4gKyAgICAgICB1MzIgdmxlbmI7Cj4gKwo+ICsgICAg
ICAgLyogSWdub3JlIHZsZW5iIGlmIHZlY3RvciBpcyBub3QgZW5hYmxlZCBpbiB0aGUga2VybmVs
ICovCj4gKyAgICAgICBpZiAoIUlTX0VOQUJMRUQoQ09ORklHX1JJU0NWX0lTQV9WKSkKPiArICAg
ICAgICAgICAgICAgcmV0dXJuIDA7Cj4gKwo+ICsgICAgICAgZm9yX2VhY2hfcG9zc2libGVfY3B1
KGNwdSkgewo+ICsgICAgICAgICAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKmNwdV9ub2RlOwo+
ICsKPiArICAgICAgICAgICAgICAgY3B1X25vZGUgPSBvZl9jcHVfZGV2aWNlX25vZGVfZ2V0KGNw
dSk7Cj4gKyAgICAgICAgICAgICAgIGlmICghY3B1X25vZGUpIHsKPiArICAgICAgICAgICAgICAg
ICAgICAgICBwcl93YXJuKCJVbmFibGUgdG8gZmluZCBjcHUgbm9kZVxuIik7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7Cj4gKyAgICAgICAgICAgICAgIH0KPiArCj4g
KyAgICAgICAgICAgICAgIGlmIChvZl9wcm9wZXJ0eV9yZWFkX3UzMihjcHVfbm9kZSwgInJpc2N2
LHZsZW5iIiwgJnZsZW5iKSkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIG9mX25vZGVfcHV0
KGNwdV9ub2RlKTsKPiArCj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKHByZXZfdmxlbmIp
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT0VOVDsKPiArICAg
ICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiArICAgICAgICAgICAgICAgfQo+ICsKPiAr
ICAgICAgICAgICAgICAgaWYgKHByZXZfdmxlbmIgJiYgdmxlbmIgIT0gcHJldl92bGVuYikgewo+
ICsgICAgICAgICAgICAgICAgICAgICAgIG9mX25vZGVfcHV0KGNwdV9ub2RlKTsKPiArICAgICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT0VOVDsKPiArICAgICAgICAgICAgICAgfQo+ICsK
PiArICAgICAgICAgICAgICAgcHJldl92bGVuYiA9IHZsZW5iOwo+ICsgICAgICAgICAgICAgICBv
Zl9ub2RlX3B1dChjcHVfbm9kZSk7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgcmlzY3Zfdmxl
bmJfb2YgPSB2bGVuYjsKPiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+ICB2b2lkIF9faW5p
dCByaXNjdl9maWxsX2h3Y2FwKHZvaWQpCj4gIHsKPiAgICAgICAgIGNoYXIgcHJpbnRfc3RyW05V
TV9BTFBIQV9FWFRTICsgMV07Cj4gQEAgLTY3MSw2ICs3MTMsMTEgQEAgdm9pZCBfX2luaXQgcmlz
Y3ZfZmlsbF9od2NhcCh2b2lkKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHByX2luZm8oIkZh
bGxpbmcgYmFjayB0byBkZXByZWNhdGVkIFwicmlzY3YsaXNhXCJcbiIpOwo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIHJpc2N2X2ZpbGxfaHdjYXBfZnJvbV9pc2Ffc3RyaW5nKGlzYTJod2NhcCk7
Cj4gICAgICAgICAgICAgICAgIH0KPiArCj4gKyAgICAgICAgICAgICAgIGlmIChlbGZfaHdjYXAg
JiBDT01QQVRfSFdDQVBfSVNBX1YgJiYgaGFzX3Jpc2N2X2hvbW9nZW5lb3VzX3ZsZW5iKCkgPCAw
KSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcHJfd2FybigiVW5zdXBwb3J0ZWQgaGV0ZXJv
Z2VuZW91cyB2bGVuIGRldGVjdGVkLCB2ZWN0b3IgZXh0ZW5zaW9uIGRpc2FibGVkLlw+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGVsZl9od2NhcCAmPSB+Q09NUEFUX0hXQ0FQX0lTQV9WOwo+ICsg
ICAgICAgICAgICAgICB9CgpXZSBvbmx5IHRvdWNoIENPTVBBVF9IV0NBUF9JU0FfViBhbmQgdGhl
IGZhaWxlZCBjYXNlIG9ubHkgdHVybnMgb2ZmIHRoZQpyZWN0aWZpZWQgVi4gU28gaGVyZSB3ZSBo
YXZlIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgWHRoZWFkdmVjdG9yLgoKSG93ZXZlciwgSSBhbSBz
dGlsbCBjb25mdXNlZCBiZWNhdXNlIEkgdGhpbmsgWHRoZWFkdmVjdG9yIHdvdWxkIGFsc28KbmVl
ZCB0byBjYWxsIGludG8gdGhpcyBjaGVjaywgc28gYXMgdG8gc2V0dXAgdmxlbmIuCgpBcGFydCBm
cm9tIHRoYXQsIGl0IHNlZW1zIGxpa2Ugc29tZSB2ZW5kb3Igc3RhdGluZyBYdGhlYWR2ZWN0b3Ig
aXMKYWN0dWFsbHkgdmVjdG9yLTAuNy4gUGxlYXNlIGNvcnJlY3QgbWUgaWYgSSBzcGVhayBhbnl0
aGluZyB3cm9uZy4gT25lCnRoaW5nIEkgbm90aWNlZCBpcyB0aGF0IFh0aGVhZHZlY3RvciB3b3Vs
ZG4ndCB0cmFwIG9uIHJlYWRpbmcKdGgudmxlbmIgYnV0IHZlY3Rvci0wLjcgd291bGQuIElmIHRo
YXQgaXMgdGhlIGNhc2UsIHNob3VsZCB3ZSByZXF1aXJlClh0aGVhZHZlY3RvciB0byBzcGVjaWZ5
IGByaXNjdix2bGVuYmAgb24gdGhlIGRldmljZSB0cmVlPwoKPiAgICAgICAgIH0KPgo+ICAgICAg
ICAgLyoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgYi9hcmNoL3Jp
c2N2L2tlcm5lbC92ZWN0b3IuYwo+IGluZGV4IDY3MjdkMWQzYjhmMi4uZTA0NTg2Y2RiN2YwIDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jCj4gKysrIGIvYXJjaC9yaXNj
di9rZXJuZWwvdmVjdG9yLmMKPiBAQCAtMzMsNyArMzMsMTcgQEAgaW50IHJpc2N2X3Zfc2V0dXBf
dnNpemUodm9pZCkKPiAgewo+ICAgICAgICAgdW5zaWduZWQgbG9uZyB0aGlzX3ZzaXplOwo+Cj4g
LSAgICAgICAvKiBUaGVyZSBhcmUgMzIgdmVjdG9yIHJlZ2lzdGVycyB3aXRoIHZsZW5iIGxlbmd0
aC4gKi8KPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBUaGVyZSBhcmUgMzIgdmVjdG9yIHJlZ2lz
dGVycyB3aXRoIHZsZW5iIGxlbmd0aC4KPiArICAgICAgICAqCj4gKyAgICAgICAgKiBJZiB0aGUg
cmlzY3YsdmxlbmIgcHJvcGVydHkgd2FzIHByb3ZpZGVkIGJ5IHRoZSBmaXJtd2FyZSwgdXNlIHRo
YXQKPiArICAgICAgICAqIGluc3RlYWQgb2YgcHJvYmluZyB0aGUgQ1NScy4KPiArICAgICAgICAq
Lwo+ICsgICAgICAgaWYgKHJpc2N2X3ZsZW5iX29mKSB7Cj4gKyAgICAgICAgICAgICAgIHRoaXNf
dnNpemUgPSByaXNjdl92bGVuYl9vZiAqIDMyOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsK
PiArICAgICAgIH0KPiArCj4gICAgICAgICByaXNjdl92X2VuYWJsZSgpOwo+ICAgICAgICAgdGhp
c192c2l6ZSA9IGNzcl9yZWFkKENTUl9WTEVOQikgKiAzMjsKPiAgICAgICAgIHJpc2N2X3ZfZGlz
YWJsZSgpOwo+Cj4gLS0KPiAyLjQ0LjAKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKVGhhbmtzLApBbmR5CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
