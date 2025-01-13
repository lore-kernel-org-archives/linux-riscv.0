Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2573EE7719F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 11:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9sww+9Y+9ZtTtfv1XhAZhWevu5ES0avJF01gydcnqkU=; b=Wy3RdXv3Lhi6qb
	hIkn1d59KvfLas/ZEe9LYm7Uo9jUjKgRi8rhelJqKaoJXqf2ZInKsd90lqY4s0JAad/orYba7RkSm
	GZ6uyZPQD+eQC9eUPCKaUlYj/TMsKqFJ6MU8IEEZi7Q9Y0B5T1Pf0OUd7iwfQsjcOUQd94c/QleE+
	q5WrZwCYzjgXvGuILqHR3yM1m+m0f0Z/6aiCG8g2Omx91pEWsuZAzciY5fiIyNOfMNV3rmXipPfnn
	62gN5Q/0DAmyqNvcCOZfYV3Ba286REovymfpXn1RoDZDGpz0NLQm66ML8dn6yz2Cb7ZwM9lUjM6hU
	yfEMOpxMWXVS67+snHEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJ5b-000000050z4-3xBt;
	Mon, 13 Jan 2025 11:58:39 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIx5-00000004zJ3-2MUk
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 11:49:52 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-29ff5c75c21so2707648fac.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 03:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736768990; x=1737373790; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nxXIufJfQT/+2LRcjv+0GN2VkekSXywM2L5DVApxZo=;
        b=GzoriZnbq/sMzTFQ5kcQhl3cqyb4ucPa5W5vSmeIqJLawkPZYWNyZgMs0rKEM131ZR
         7vqEZwGZskwFcIeMuGT+JmuHrsqwXZesHOOibrUcvgfVwE0QWkNABNxXgHEW0idGvPH7
         SQR/IdIYVOl0w/nELYycvwHNvO92E9gAjDqsySK+HYOcnpiwGM5S5eeb6wmnQrHj+0j/
         yepT967E8cYcFGT1Xp4kkFAaFb48/fCliKQ5a5JK0Y8xqNi6gVW4I/tpf3CPazHLsA9Y
         +V30wFdQqtPkYCQ6aoViMOYpLUGGE53GmyQe0NwThlGEnnfd6Eyg0jLB4g+zU1ckTYHq
         vyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736768990; x=1737373790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1nxXIufJfQT/+2LRcjv+0GN2VkekSXywM2L5DVApxZo=;
        b=lRvYivxTB0US7NBjmwHlsm04NkyZNoHakArQ653tpJKj4xAiRksmV87uoenrQ6F1kU
         Ip7JdDzA2xatX7dK/Df+fpjk/MEdtUvW1uHit9Y8IS7JLPp6A1uwlcO0joKZEZUB1MYn
         1sGETV0YUkhm0hr/SR7foA5x+OJ9O0cjDaIZwldXJpEZ1VjrPx9K1O2uz64K87mamNaU
         7cOHWf26EorAgd9pTwamOoivmFkdoTO5JOdBzoAGawCdY1AQhUyIJ9qd25o/1y7ytX/p
         zopft75ZGb1JmSS1Zlv5gT0aiAWKitbQe7aUvJRrksQAeKQgu/FJqQMthDiH+RWqyW0i
         4kWg==
X-Forwarded-Encrypted: i=1; AJvYcCUOZIyTryLyoVPx6fQcLS417qVUp99tahVh6cO/5zI4hBkJV/bGFW8DtTLQsraXld4kuxD4jmj/LkS5qg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa64WcmV0+ORMjV0+b5qlRQxSE+6aay0cnZDNgbtgqXQqY+DtB
	+7qDtgUFlBIXsyM/peSzAyO4hVLe4xcgiJ4V8Mo7TQMO/c1e+H49gzQiH/m52twVep6BWe5RpvO
	mARzBJOZExUFnfOK2LxCJWhefk/3EyM+OyAqAzw==
X-Gm-Gg: ASbGnctiyta5hrXRAJegbSATKordqTq8WA17usbycbIi8Y0pV440X8iLcDIOoRrmfDx
	ZRTTvM98s3B/IARqj+Gn4V76rW1Y8CJ34TbCRV3Ot
X-Google-Smtp-Source: AGHT+IHmlmecRpISNnwwnnczbKA8ckxNfHWQKxqB4E2q31ud7Q7wae29cIOROv0c/K2MlktScWO0mWGN0FqFgN/EAhM=
X-Received: by 2002:a05:6870:9c8d:b0:29e:7629:1466 with SMTP id
 586e51a60fabf-2aacdbc936amr9625679fac.7.1736768990431; Mon, 13 Jan 2025
 03:49:50 -0800 (PST)
MIME-Version: 1.0
References: <20250113083635.73826-1-cuiyunhui@bytedance.com>
 <20250113083635.73826-3-cuiyunhui@bytedance.com> <20250113-cb08bcb35bc8b6213fe89ecd@orel>
In-Reply-To: <20250113-cb08bcb35bc8b6213fe89ecd@orel>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 13 Jan 2025 19:49:39 +0800
X-Gm-Features: AbW1kvbReMKJie7bhFXKtPxqu5CFzhTpUn7lkusFoZnCr9Uq-zowmKp2XnelTqU
Message-ID: <CAEEQ3wmOVKiy1FVdB+LggdX-7a_JMh+2A-bjG0XGF7nY0Goo2w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 3/3] RISC-V: selftests: Add TEST_ZICBOM
 into CBO tests
To: Andrew Jones <ajones@ventanamicro.com>
Cc: alexghiti@rivosinc.com, andybnac@gmail.com, aou@eecs.berkeley.edu, 
	charlie@rivosinc.com, cleger@rivosinc.com, conor.dooley@microchip.com, 
	conor@kernel.org, corbet@lwn.net, evan@rivosinc.com, jesse@rivosinc.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, samuel.holland@sifive.com, 
	shuah@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_034951_606607_FCD4D029 
X-CRM114-Status: GOOD (  26.02  )
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

SGkgZHJldywKCk9uIE1vbiwgSmFuIDEzLCAyMDI1IGF0IDU6MTjigK9QTSBBbmRyZXcgSm9uZXMg
PGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgSmFuIDEzLCAyMDI1
IGF0IDA0OjM2OjM1UE0gKzA4MDAsIFl1bmh1aSBDdWkgd3JvdGU6Cj4gPiBBZGQgdGVzdCBmb3Ig
WmljYm9tIGFuZCBpdHMgYmxvY2sgc2l6ZSBpbnRvIENCTyB0ZXN0cywgd2hlbgo+ID4gWmljYm9t
IGlzIHByZXNlbnQsIHRlc3QgdGhhdCBjYm8uY2xlYW4vZmx1c2ggbWF5IGJlIGlzc3VlZCBhbmQg
d29ya3MuCj4gPiBBcyB0aGUgc29mdHdhcmUgY2FuJ3QgdmVyaWZ5IHRoZSBjbGVhbi9mbHVzaCBm
dW5jdGlvbnMsIHdlIGp1c3QganVkZ2VkCj4gPiB0aGF0IGNiby5jbGVhbi9mbHVzaCBpc24ndCBl
eGVjdXRlZCBpbGxlZ2FsbHkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3Vp
eXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4gPiAtLS0KPiA+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9yaXNjdi9od3Byb2JlL2Niby5jIHwgNDkgKysrKysrKysrKysrKysrKysrLS0tCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2h3cHJvYmUvY2JvLmMgYi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9od3Byb2JlL2Niby5jCj4gPiBpbmRleCBhNDA1
NDFiYjdjN2QuLmI2M2UyM2Y5NWUwOCAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL3Jpc2N2L2h3cHJvYmUvY2JvLmMKPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL3Jpc2N2L2h3cHJvYmUvY2JvLmMKPiA+IEBAIC04MSw2ICs4MSwzMCBAQCBzdGF0aWMgYm9v
bCBpc19wb3dlcl9vZl8yKF9fdTY0IG4pCj4gPiAgICAgICByZXR1cm4gbiAhPSAwICYmIChuICYg
KG4gLSAxKSkgPT0gMDsKPiA+ICB9Cj4gPgo+ID4gK3N0YXRpYyB2b2lkIHRlc3RfemljYm9tKHZv
aWQgKmFyZykKPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSBwYWlyID0gewo+
ID4gKyAgICAgICAgICAgICAua2V5ID0gUklTQ1ZfSFdQUk9CRV9LRVlfWklDQk9NX0JMT0NLX1NJ
WkUsCj4gPiArICAgICB9Owo+ID4gKyAgICAgY3B1X3NldF90ICpjcHVzID0gKGNwdV9zZXRfdCAq
KWFyZzsKPiA+ICsgICAgIF9fdTY0IGJsb2NrX3NpemU7Cj4gPiArICAgICBsb25nIHJjOwo+ID4g
Kwo+ID4gKyAgICAgcmMgPSByaXNjdl9od3Byb2JlKCZwYWlyLCAxLCBzaXplb2YoY3B1X3NldF90
KSwgKHVuc2lnbmVkIGxvbmcgKiljcHVzLCAwKTsKPiA+ICsgICAgIGJsb2NrX3NpemUgPSBwYWly
LnZhbHVlOwo+ID4gKyAgICAga3NmdF90ZXN0X3Jlc3VsdChyYyA9PSAwICYmIHBhaXIua2V5ID09
IFJJU0NWX0hXUFJPQkVfS0VZX1pJQ0JPTV9CTE9DS19TSVpFICYmCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgIGlzX3Bvd2VyX29mXzIoYmxvY2tfc2l6ZSksICJaaWNib20gYmxvY2sgc2l6ZVxu
Iik7Cj4gPiArICAgICBrc2Z0X3ByaW50X21zZygiWmljYm9tIGJsb2NrIHNpemU6ICVsbHVcbiIs
IGJsb2NrX3NpemUpOwo+ID4gKwo+ID4gKyAgICAgaWxsZWdhbF9pbnNuID0gZmFsc2U7Cj4gPiAr
ICAgICBjYm9fY2xlYW4oJm1lbVtibG9ja19zaXplXSk7Cj4gPiArICAgICBrc2Z0X3Rlc3RfcmVz
dWx0KCFpbGxlZ2FsX2luc24sICJjYm8uY2xlYW5cbiIpOwo+ID4gKwo+ID4gKyAgICAgaWxsZWdh
bF9pbnNuID0gZmFsc2U7Cj4gPiArICAgICBjYm9fZmx1c2goJm1lbVtibG9ja19zaXplXSk7Cj4g
PiArICAgICBrc2Z0X3Rlc3RfcmVzdWx0KCFpbGxlZ2FsX2luc24sICJjYm8uZmx1c2hcbiIpOwo+
ID4gK30KPiA+ICsKPiA+ICBzdGF0aWMgdm9pZCB0ZXN0X3ppY2Jveih2b2lkICphcmcpCj4gPiAg
ewo+ID4gICAgICAgc3RydWN0IHJpc2N2X2h3cHJvYmUgcGFpciA9IHsKPiA+IEBAIC0xMjksNyAr
MTUzLDcgQEAgc3RhdGljIHZvaWQgdGVzdF96aWNib3oodm9pZCAqYXJnKQo+ID4gICAgICAga3Nm
dF90ZXN0X3Jlc3VsdF9wYXNzKCJjYm8uemVybyBjaGVja1xuIik7Cj4gPiAgfQo+ID4KPiA+IC1z
dGF0aWMgdm9pZCBjaGVja19ub196aWNib3pfY3B1cyhjcHVfc2V0X3QgKmNwdXMpCj4gPiArc3Rh
dGljIHZvaWQgY2hlY2tfbm9femljYm9fY3B1cyhjcHVfc2V0X3QgKmNwdXMsIF9fdTY0IGNibykK
PiA+ICB7Cj4gPiAgICAgICBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSBwYWlyID0gewo+ID4gICAgICAg
ICAgICAgICAua2V5ID0gUklTQ1ZfSFdQUk9CRV9LRVlfSU1BX0VYVF8wLAo+ID4gQEAgLTEzNyw2
ICsxNjEsNyBAQCBzdGF0aWMgdm9pZCBjaGVja19ub196aWNib3pfY3B1cyhjcHVfc2V0X3QgKmNw
dXMpCj4gPiAgICAgICBjcHVfc2V0X3Qgb25lX2NwdTsKPiA+ICAgICAgIGludCBpID0gMCwgYyA9
IDA7Cj4gPiAgICAgICBsb25nIHJjOwo+ID4gKyAgICAgY2hhciAqY2Jvc3RyOwo+ID4KPiA+ICAg
ICAgIHdoaWxlIChpKysgPCBDUFVfQ09VTlQoY3B1cykpIHsKPiA+ICAgICAgICAgICAgICAgd2hp
bGUgKCFDUFVfSVNTRVQoYywgY3B1cykpCj4gPiBAQCAtMTQ4LDEwICsxNzMsMTMgQEAgc3RhdGlj
IHZvaWQgY2hlY2tfbm9femljYm96X2NwdXMoY3B1X3NldF90ICpjcHVzKQo+ID4gICAgICAgICAg
ICAgICByYyA9IHJpc2N2X2h3cHJvYmUoJnBhaXIsIDEsIHNpemVvZihjcHVfc2V0X3QpLCAodW5z
aWduZWQgbG9uZyAqKSZvbmVfY3B1LCAwKTsKPiA+ICAgICAgICAgICAgICAgYXNzZXJ0KHJjID09
IDAgJiYgcGFpci5rZXkgPT0gUklTQ1ZfSFdQUk9CRV9LRVlfSU1BX0VYVF8wKTsKPiA+Cj4gPiAt
ICAgICAgICAgICAgIGlmIChwYWlyLnZhbHVlICYgUklTQ1ZfSFdQUk9CRV9FWFRfWklDQk9aKQo+
ID4gLSAgICAgICAgICAgICAgICAgICAgIGtzZnRfZXhpdF9mYWlsX21zZygiWmljYm96IGlzIG9u
bHkgcHJlc2VudCBvbiBhIHN1YnNldCBvZiBoYXJ0cy5cbiIKPiA+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIlVzZSB0YXNrc2V0IHRvIHNlbGVjdCBhIHNldCBvZiBo
YXJ0cyB3aGVyZSBaaWNib3pcbiIKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgInByZXNlbmNlIChwcmVzZW50IG9yIG5vdCkgaXMgY29uc2lzdGVudCBmb3IgZWFj
aCBoYXJ0XG4iKTsKPiA+ICsgICAgICAgICAgICAgY2Jvc3RyID0gY2JvID09IFJJU0NWX0hXUFJP
QkVfRVhUX1pJQ0JPWiA/ICJaaWNib3oiIDogIlppY2JvbSI7Cj4gPiArCj4gPiArICAgICAgICAg
ICAgIGlmIChwYWlyLnZhbHVlICYgY2JvKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGtzZnRf
ZXhpdF9mYWlsX21zZygiJXMgaXMgb25seSBwcmVzZW50IG9uIGEgc3Vic2V0IG9mIGhhcnRzLlxu
Igo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiVXNlIHRhc2tz
ZXQgdG8gc2VsZWN0IGEgc2V0IG9mIGhhcnRzIHdoZXJlICVzXG4iCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICJwcmVzZW5jZSAocHJlc2VudCBvciBub3QpIGlz
IGNvbnNpc3RlbnQgZm9yIGVhY2ggaGFydFxuIiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY2Jvc3RyLCBjYm9zdHIpOwo+ID4gICAgICAgICAgICAgICArK2M7
Cj4gPiAgICAgICB9Cj4gPiAgfQo+ID4gQEAgLTE1OSw2ICsxODcsNyBAQCBzdGF0aWMgdm9pZCBj
aGVja19ub196aWNib3pfY3B1cyhjcHVfc2V0X3QgKmNwdXMpCj4gPiAgZW51bSB7Cj4gPiAgICAg
ICBURVNUX1pJQ0JPWiwKPiA+ICAgICAgIFRFU1RfTk9fWklDQk9aLAo+ID4gKyAgICAgVEVTVF9a
SUNCT00sCj4gPiAgICAgICBURVNUX05PX1pJQ0JPTSwKPiA+ICB9Owo+ID4KPiA+IEBAIC0xNjks
NiArMTk4LDcgQEAgc3RhdGljIHN0cnVjdCB0ZXN0X2luZm8gewo+ID4gIH0gdGVzdHNbXSA9IHsK
PiA+ICAgICAgIFtURVNUX1pJQ0JPWl0gICAgICAgICAgID0geyAubnJfdGVzdHMgPSAzLCB0ZXN0
X3ppY2JveiB9LAo+ID4gICAgICAgW1RFU1RfTk9fWklDQk9aXSAgICAgICAgPSB7IC5ucl90ZXN0
cyA9IDEsIHRlc3Rfbm9femljYm96IH0sCj4gPiArICAgICBbVEVTVF9aSUNCT01dICAgICAgICAg
ICA9IHsgLm5yX3Rlc3RzID0gMywgdGVzdF96aWNib20gfSwKPiA+ICAgICAgIFtURVNUX05PX1pJ
Q0JPTV0gICAgICAgID0geyAubnJfdGVzdHMgPSAzLCB0ZXN0X25vX3ppY2JvbSB9LAo+ID4gIH07
Cj4gPgo+ID4gQEAgLTIwNiw3ICsyMzYsMTQgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiph
cmd2KQo+ID4gICAgICAgICAgICAgICB0ZXN0c1tURVNUX1pJQ0JPWl0uZW5hYmxlZCA9IHRydWU7
Cj4gPiAgICAgICAgICAgICAgIHRlc3RzW1RFU1RfTk9fWklDQk9aXS5lbmFibGVkID0gZmFsc2U7
Cj4gPiAgICAgICB9IGVsc2Ugewo+ID4gLSAgICAgICAgICAgICBjaGVja19ub196aWNib3pfY3B1
cygmY3B1cyk7Cj4gPiArICAgICAgICAgICAgIGNoZWNrX25vX3ppY2JvX2NwdXMoJmNwdXMsIFJJ
U0NWX0hXUFJPQkVfRVhUX1pJQ0JPWik7Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAgICBpZiAo
cGFpci52YWx1ZSAmIFJJU0NWX0hXUFJPQkVfRVhUX1pJQ0JPTSkgewo+ID4gKyAgICAgICAgICAg
ICB0ZXN0c1tURVNUX1pJQ0JPTV0uZW5hYmxlZCA9IHRydWU7Cj4gPiArICAgICAgICAgICAgIHRl
c3RzW1RFU1RfTk9fWklDQk9NXS5lbmFibGVkID0gZmFsc2U7Cj4gPiArICAgICB9IGVsc2Ugewo+
ID4gKyAgICAgICAgICAgICBjaGVja19ub196aWNib19jcHVzKCZjcHVzLCBSSVNDVl9IV1BST0JF
X0VYVF9aSUNCT00pOwo+ID4gICAgICAgfQo+ID4KPiA+ICAgICAgIGZvciAoaSA9IDA7IGkgPCBB
UlJBWV9TSVpFKHRlc3RzKTsgKytpKQo+ID4gLS0KPiA+IDIuMzkuMgo+ID4KPgo+IFRoZSB0ZXN0
X25vX3ppY2JvbSgpIHRlc3QgbmVlZHMgdG8gaGF2ZSB0aGUgaWxsZWdhbCBpbnN0cnVjdGlvbiBT
SUdJTEwKPiB0ZXN0IGZvciBjYm8uaW52YWwgbW92ZWQgb3V0IGludG8gaXRzIG93biB0ZXN0LiBT
bywgZXZlbiB3aGVuIHdlIGhhdmUKPiB6aWNib20gd2Ugc3RpbGwgdGVzdCB0aGF0IGNiby5pbnZh
bCBnZW5lcmF0ZXMgYSBTSUdJTEwuCgpEbyB5b3UgbWVhbiBtb3ZpbmcgY2JvX2ludmFsKCkgaW50
byB0ZXN0X3ppY2JvbSgpPyBUaGVuIGRvZXMKY2JvX2ludmFsKCZtZW1bMF0pIGFsc28gbmVlZCB0
byBiZSB0ZXN0ZWQgaW4gdGVzdF9ub196aWNib20oKT8KCgoKPiBUaGFua3MsCj4gZHJldwoKVGhh
bmtzLApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
