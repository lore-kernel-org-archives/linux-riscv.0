Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D42C7113C
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 12:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oYg/d38/VbsE5OKwraxt39cjL14i92sOw5xUGJ6DpQc=; b=cpPWl5G6k0f96h
	QX8F7nGNhtbX/NZvMdXx5SGdHyS8u92dL6CRzSXuJwxYqUbrSeypXg96aFnmvyzrfClWGsNbfnjcx
	ZSiZFjG8yG4NgGD8VSX5c1P80M1iuRU+Llawn7ZLug5wXewtP1KJUTlVqB5QL2y7V7TyXxlX67D1i
	SUz1HvnYu0HriLaGuMrM+Q4E6YeWcT2mvilBWCaqTpJ+cLoZjwSKin+DHenEb6p6UwZ+BeHL2+JV/
	oO0vOb8N7qDUueE4YeW1eqTt0un/uQg78vwm/5bTVvX2TC2pBLvvTsI7+kZS+yy8fqJiyKU8f0fPN
	s/Q0iCxQ9LLm4YM61yvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWyDX-0091Yn-1s;
	Fri, 18 Aug 2023 12:04:39 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWyDU-0091Sq-1M
	for linux-riscv@lists.infradead.org;
	Fri, 18 Aug 2023 12:04:37 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-31956020336so524288f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 18 Aug 2023 05:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1692360268; x=1692965068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZdQfOSfjb7jYvSj08bFptXj69b81GU/KGqpyvuaZ5w=;
        b=iDsrk9/cifcSjXR+nr+gTAPzO+df+W0llBMvPiBUMarijotRiy2Am70KIeL5imF6Kx
         m5133LT8vky4Od4sX1UwDrhvkYpf7h9mJWCPl4D1NVuFx6veBut1QaFGDMTQ8gDazyez
         UBgNJPsHeDx07e6xmg5kdAFibsl4hSS+sCR3FPlpHgsS0yd80Xs9fVO3b2OzvM6lFl71
         dNjrnpelzhALDCXHYbCLgnH0lX4dp802k3maSlKHrh2Yo970U/5TbtsA9VSRRgfqlnzb
         P0ndWMga1p8lEARrJmhRa3H5VwShenvVI8kfRx2U3xLxmsX2YMmCJ44/ZIeawj0uW2nN
         JKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692360268; x=1692965068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZZdQfOSfjb7jYvSj08bFptXj69b81GU/KGqpyvuaZ5w=;
        b=fNrjzr16dLgg0rIQEKfXXfJ4F9uMy7lKqJmsU34Bg7Uo6b6K+QxlBOCQCi7XQl3Lmo
         xYnXCbWZUXWn2CBe0muLLV5R8fa+6nFu9WrLVBm7VBpkYoBCA0S32G7+qCw7odbXV+TG
         /o28Y1dI1oAVuZGmN9SU8W1QnmjLuvCJjUCBwOSJT5iv5jKHmHnZ3pseLivH5UPk2tQa
         /Cx65pydTerbBmW7iu+N+XWoD5//cL3p7iHtcFQWYMmkLS4HgPWr2OXM0Ue7WjQkDkmC
         wVVsTzj7atCgKeVQiMvUtqI0vlVub0cmhBFiCw/ELI0pSswq/RGPWOawAQ2sSmgRiZ61
         AgCQ==
X-Gm-Message-State: AOJu0YyiZPcTb+W10kzPYVrmvkcACiSOcLOf/x6G/cECKQM6fGdARuxX
	Cyj+KnkCRV7yS7DA46PrIOXd1M3j5h2aovGT09ETTA==
X-Google-Smtp-Source: AGHT+IEkfjwtc76KHGFOS61DemLriDUYPGx1HD/1+fhhgM0utSuzqb3nhbuUGfwJ7daMooYnhiIRVXybkfCzmjvKChI=
X-Received: by 2002:a05:6000:1106:b0:317:dcdd:3fa2 with SMTP id
 z6-20020a056000110600b00317dcdd3fa2mr1456519wrw.31.1692360268611; Fri, 18 Aug
 2023 05:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230817114130.24662-1-cuiyunhui@bytedance.com> <87msyphk99.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87msyphk99.fsf@all.your.base.are.belong.to.us>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 18 Aug 2023 20:04:17 +0800
Message-ID: <CAEEQ3wn13-etJ=3OHA7yR2GtYYWkKNb6G0DiDjVwqfxGvZOLfw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3] riscv: add userland instruction dump to
 RISC-V splats
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	guoren@kernel.org, bjorn@rivosinc.com, conor.dooley@microchip.com, 
	jszhang@kernel.org, andy.chiu@sifive.com, dave.hansen@linux.intel.com, 
	elver@google.com, glider@google.com, cyphar@cyphar.com, 
	kirill.shutemov@linux.intel.com, keescook@chromium.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_050436_469141_1FC5E52A 
X-CRM114-Status: GOOD (  22.61  )
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

SGkgQmrDtnJu77yMCgpPbiBUaHUsIEF1ZyAxNywgMjAyMyBhdCA5OjI34oCvUE0gQmrDtnJuIFTD
tnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBZdW5odWkgQ3VpIDxjdWl5dW5odWlA
Ynl0ZWRhbmNlLmNvbT4gd3JpdGVzOgo+Cj4gPiBBZGRlZCB1c2VybGFuZCBpbnN0cnVjdGlvbiBk
dW1wIGluIGR1bXBfa2VybmVsX2luc3RyKCkuCj4gPgo+ID4gQW4gZXhhbXBsZToKPiA+IFsgICAg
MC44MjI0MzldIEZyZWVpbmcgdW51c2VkIGtlcm5lbCBpbWFnZSAoaW5pdG1lbSkgbWVtb3J5OiA2
OTE2Swo+ID4gWyAgICAwLjgyMzgxN10gUnVuIC9pbml0IGFzIGluaXQgcHJvY2Vzcwo+ID4gWyAg
ICAwLjgzOTQxMV0gaW5pdFsxXTogdW5oYW5kbGVkIHNpZ25hbCA0IGNvZGUgMHgxIGF0IDB4MDAw
MDAwMDAwMDA1YmUxOCBpbiBiYlsxMDAwMCs1ZmIwMDBdCj4gPiBbICAgIDAuODQwNzUxXSBDUFU6
IDAgUElEOiAxIENvbW06IGluaXQgTm90IHRhaW50ZWQgNS4xNC4wLXJjNC0wMDA0OS1nYmQ2NDQy
OTBhYTcyLWRpcnR5ICMxODcKPiA+IFsgICAgMC44NDEzNzNdIEhhcmR3YXJlIG5hbWU6ICAsIEJJ
T1MKPiA+IFsgICAgMC44NDE3NDNdIGVwYyA6IDAwMDAwMDAwMDAwNWJlMTggcmEgOiAwMDAwMDAw
MDAwMDc5ZTc0IHNwIDogMDAwMDAwM2ZmZmNhZmRhMAo+ID4gWyAgICAwLjg0MjI3MV0gIGdwIDog
ZmZmZmZmZmY4MTZlOWRjOCB0cCA6IDAwMDAwMDAwMDAwMDAwMDAgdDAgOiAwMDAwMDAwMDAwMDAw
MDAwCj4gPiBbICAgIDAuODQyOTQ3XSAgdDEgOiAwMDAwMDAzZmZmYzlmZGYwIHQyIDogMDAwMDAw
MDAwMDAwMDAwMCBzMCA6IDAwMDAwMDAwMDAwMDAwMDAKPiA+IFsgICAgMC44NDM0MzRdICBzMSA6
IDAwMDAwMDAwMDAwMDAwMDAgYTAgOiAwMDAwMDAzZmZmY2EwMTkwIGExIDogMDAwMDAwM2ZmZmNh
ZmUxOAo+ID4gWyAgICAwLjg0Mzg5MV0gIGEyIDogMDAwMDAwMDAwMDAwMDAwMCBhMyA6IDAwMDAw
MDAwMDAwMDAwMDAgYTQgOiAwMDAwMDAwMDAwMDAwMDAwCj4gPiBbICAgIDAuODQ0MzU3XSAgYTUg
OiAwMDAwMDAwMDAwMDAwMDAwIGE2IDogMDAwMDAwMDAwMDAwMDAwMCBhNyA6IDAwMDAwMDAwMDAw
MDAwMDAKPiA+IFsgICAgMC44NDQ4MDNdICBzMiA6IDAwMDAwMDAwMDAwMDAwMDAgczMgOiAwMDAw
MDAwMDAwMDAwMDAwIHM0IDogMDAwMDAwMDAwMDAwMDAwMAo+ID4gWyAgICAwLjg0NTI1M10gIHM1
IDogMDAwMDAwMDAwMDAwMDAwMCBzNiA6IDAwMDAwMDAwMDAwMDAwMDAgczcgOiAwMDAwMDAwMDAw
MDAwMDAwCj4gPiBbICAgIDAuODQ1NzIyXSAgczggOiAwMDAwMDAwMDAwMDAwMDAwIHM5IDogMDAw
MDAwMDAwMDAwMDAwMCBzMTA6IDAwMDAwMDAwMDAwMDAwMDAKPiA+IFsgICAgMC44NDYxODBdICBz
MTE6IDAwMDAwMDAwMDBkMTQ0ZTAgdDMgOiAwMDAwMDAwMDAwMDAwMDAwIHQ0IDogMDAwMDAwMDAw
MDAwMDAwMAo+ID4gWyAgICAwLjg0NjYxNl0gIHQ1IDogMDAwMDAwMDAwMDAwMDAwMCB0NiA6IDAw
MDAwMDAwMDAwMDAwMDAKPiA+IFsgICAgMC44NDcyMDRdIHN0YXR1czogMDAwMDAwMDIwMDAwMDAy
MCBiYWRhZGRyOiAwMDAwMDAwMGYwMDI4MDUzIGNhdXNlOiAwMDAwMDAwMDAwMDAwMDAyCj4gPiBb
ICAgIDAuODQ4MjE5XSBDb2RlOiBmMDZmIGZmNWYgMzgyMyBmYTExIDAxMTMgZmIwMSAyZTIzIDAy
MDEgMDI5MyAwMDAwICg4MDUzKSBmMDAyCj4gPiBbICAgIDAuODUxMDE2XSBLZXJuZWwgcGFuaWMg
LSBub3Qgc3luY2luZzogQXR0ZW1wdGVkIHRvIGtpbGwgaW5pdCEgZXhpdGNvZGU9MHgwMDAwMDAw
NAo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2Uu
Y29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyB8IDEwICsrKysrKyst
LS0KPiA+ICBpbmNsdWRlL2xpbnV4L3VhY2Nlc3MuaCAgIHwgIDUgKysrKysKPiA+ICAyIGZpbGVz
IGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFw
cy5jCj4gPiBpbmRleCBmOTEwZGZjY2JmNWQuLmE2YTg1MGU0MmQ1OSAxMDA2NDQKPiA+IC0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Ry
YXBzLmMKPiA+IEBAIC0zMyw3ICszMyw3IEBAIGludCBzaG93X3VuaGFuZGxlZF9zaWduYWxzID0g
MTsKPiA+Cj4gPiAgc3RhdGljIERFRklORV9TUElOTE9DSyhkaWVfbG9jayk7Cj4gPgo+ID4gLXN0
YXRpYyB2b2lkIGR1bXBfa2VybmVsX2luc3RyKGNvbnN0IGNoYXIgKmxvZ2x2bCwgc3RydWN0IHB0
X3JlZ3MgKnJlZ3MpCj4gPiArc3RhdGljIHZvaWQgZHVtcF9pbnN0cihjb25zdCBjaGFyICpsb2ds
dmwsIHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ID4gIHsKPiA+ICAgICAgIGNoYXIgc3RyW3NpemVv
ZigiMDAwMCAiKSAqIDEyICsgMiArIDFdLCAqcCA9IHN0cjsKPiA+ICAgICAgIGNvbnN0IHUxNiAq
aW5zbnMgPSAodTE2ICopaW5zdHJ1Y3Rpb25fcG9pbnRlcihyZWdzKTsKPiA+IEBAIC00Miw3ICs0
MiwxMCBAQCBzdGF0aWMgdm9pZCBkdW1wX2tlcm5lbF9pbnN0cihjb25zdCBjaGFyICpsb2dsdmws
IHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ID4gICAgICAgaW50IGk7Cj4gPgo+ID4gICAgICAgZm9y
IChpID0gLTEwOyBpIDwgMjsgaSsrKSB7Cj4gPiAtICAgICAgICAgICAgIGJhZCA9IGdldF9rZXJu
ZWxfbm9mYXVsdCh2YWwsICZpbnNuc1tpXSk7Cj4gPiArICAgICAgICAgICAgIGlmICh1c2VyX21v
ZGUocmVncykpCj4gPiArICAgICAgICAgICAgICAgICAgICAgYmFkID0gZ2V0X3VzZXJfbm9mYXVs
dCh2YWwsICZpbnNuc1tpXSk7Cj4gPiArICAgICAgICAgICAgIGVsc2UKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICBiYWQgPSBnZXRfa2VybmVsX25vZmF1bHQodmFsLCAmaW5zbnNbaV0pOwo+ID4g
ICAgICAgICAgICAgICBpZiAoIWJhZCkgewo+ID4gICAgICAgICAgICAgICAgICAgICAgIHAgKz0g
c3ByaW50ZihwLCBpID09IDAgPyAiKCUwNGh4KSAiIDogIiUwNGh4ICIsIHZhbCk7Cj4gPiAgICAg
ICAgICAgICAgIH0gZWxzZSB7Cj4gPiBAQCAtNzEsNyArNzQsNyBAQCB2b2lkIGRpZShzdHJ1Y3Qg
cHRfcmVncyAqcmVncywgY29uc3QgY2hhciAqc3RyKQo+ID4gICAgICAgcHJpbnRfbW9kdWxlcygp
Owo+ID4gICAgICAgaWYgKHJlZ3MpIHsKPiA+ICAgICAgICAgICAgICAgc2hvd19yZWdzKHJlZ3Mp
Owo+ID4gLSAgICAgICAgICAgICBkdW1wX2tlcm5lbF9pbnN0cihLRVJOX0VNRVJHLCByZWdzKTsK
PiA+ICsgICAgICAgICAgICAgZHVtcF9pbnN0cihLRVJOX0VNRVJHLCByZWdzKTsKPiA+ICAgICAg
IH0KPiA+Cj4gPiAgICAgICBjYXVzZSA9IHJlZ3MgPyByZWdzLT5jYXVzZSA6IC0xOwo+ID4gQEAg
LTEwNCw2ICsxMDcsNyBAQCB2b2lkIGRvX3RyYXAoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIGludCBz
aWdubywgaW50IGNvZGUsIHVuc2lnbmVkIGxvbmcgYWRkcikKPiA+ICAgICAgICAgICAgICAgcHJp
bnRfdm1hX2FkZHIoS0VSTl9DT05UICIgaW4gIiwgaW5zdHJ1Y3Rpb25fcG9pbnRlcihyZWdzKSk7
Cj4gPiAgICAgICAgICAgICAgIHByX2NvbnQoIlxuIik7Cj4gPiAgICAgICAgICAgICAgIF9fc2hv
d19yZWdzKHJlZ3MpOwo+ID4gKyAgICAgICAgICAgICBkdW1wX2luc3RyKEtFUk5fRU1FUkcsIHJl
Z3MpOwo+ID4gICAgICAgfQo+ID4KPiA+ICAgICAgIGZvcmNlX3NpZ19mYXVsdChzaWdubywgY29k
ZSwgKHZvaWQgX191c2VyICopYWRkcik7Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC91
YWNjZXNzLmggYi9pbmNsdWRlL2xpbnV4L3VhY2Nlc3MuaAo+ID4gaW5kZXggMzA2NDMxNGY0ODMy
Li5iYThjYjM3YTcyNDEgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3VhY2Nlc3MuaAo+
ID4gKysrIGIvaW5jbHVkZS9saW51eC91YWNjZXNzLmgKPiA+IEBAIC0zODUsNiArMzg1LDExIEBA
IGxvbmcgc3RybmNweV9mcm9tX3VzZXJfbm9mYXVsdChjaGFyICpkc3QsIGNvbnN0IHZvaWQgX191
c2VyICp1bnNhZmVfYWRkciwKPiA+ICAgICAgICAgICAgICAgbG9uZyBjb3VudCk7Cj4gPiAgbG9u
ZyBzdHJubGVuX3VzZXJfbm9mYXVsdChjb25zdCB2b2lkIF9fdXNlciAqdW5zYWZlX2FkZHIsIGxv
bmcgY291bnQpOwo+ID4KPiA+ICsjZGVmaW5lIGdldF91c2VyX25vZmF1bHQodmFsLCBwdHIpICh7
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICBjb25zdCB0eXBlb2Yo
dmFsKSAqX19na19wdHIgPSAocHRyKTsgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgIGNv
cHlfZnJvbV91c2VyX25vZmF1bHQoJih2YWwpLCBfX2drX3B0ciwgc2l6ZW9mKHZhbCkpO1wKPiA+
ICt9KQo+ID4gKwo+Cj4gWW91ciBwcmV2aW91cyB2ZXJzaW9uIGhhZCBhIGNoZWNrOgo+ICAgfCAg
ICAgICAgIC8qIFRoZSB1c2VyIHNwYWNlIGNvZGUgZnJvbSBvdGhlciB0YXNrcyBjYW5ub3QgYmUg
YWNjZXNzZWQuICovCj4gICB8ICAgICAgICAgaWYgKHJlZ3MgIT0gdGFza19wdF9yZWdzKGN1cnJl
bnQpKQo+ICAgfCAgICAgICAgICAgICAgICAgcmV0dXJuIC1FUEVSTTsKPgo+IFdoeSB3YXMgdGhh
dCBsZWZ0IG91dD8gSXMgaXQgbm90IG5lZWRlZD8KPgo+IFlvdXIgZ2V0X3VzZXJfbm9mYXVsdCBp
cyBvbmx5IHVzZWQgaW4gdGhpcyBmaWxlLCBzbyBtYXliZSBpdCdzIGJldHRlciB0bwo+IGRvIHdo
YXQgeDg2IGRvZXMsIGFuZCBpbnRyb2R1Y2UgYSBzdGF0aWMgImNvcHlfY29kZSgpIiB0aGF0IGRl
YWxzIHdpdGgKPiB0aGUgdXNlci9rZXJuZWwgY2hlY2tzL2NvcHk/Ck9rYXnvvIwgaeKAmGxsIHVw
ZGF0ZSBpdCB0byB2NC4KClRoYW5rc++8jApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
