Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24907C678D4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Mar 2023 10:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y4bJgpp/FiHdvGFj4IjI6RBU2Zc8MgOsN/u1i69Y8vQ=; b=FuexmucN0nhnZg
	w1ci7VLqCZOfOsFLKOFxX19Dodg49A+iVTNAb0cEL40w1m+gyqQmiH/ryqWaAuNsG2j4CDfYoZxee
	/aRxWvmA3UkwoB5TDS6TQvn6ruEH95SF4v8pvLO3SBE6efYlRv6n63lQJZANTb+5M3KbUCM958BKb
	cjDiFF0lqD0FWPVG324JHeHIMlO5eLKs17yFh1iiOwl3B8yPY+TKl6cmaTwR1/R9cBtGPA2s+6hJg
	akVI427SAAc0yR38rHexz3IeXa3ABMFBrQypKrKMnIx8zfIAKC8xDWa2lu28y0s6LNBnoZZauaMER
	2+qdPrcx6dwZnmuLNhJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXg9P-001fn2-20; Thu, 02 Mar 2023 10:27:03 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXg9M-001fmL-37
	for linux-riscv@lists.infradead.org; Thu, 02 Mar 2023 10:27:01 +0000
Received: by mail-qv1-xf34.google.com with SMTP id y3so11310830qvn.4
        for <linux-riscv@lists.infradead.org>; Thu, 02 Mar 2023 02:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PtmjHcZkI3zGShXGHZey08Yzvo+1616KPZSuz8p9lIA=;
        b=qywYp9vMKL4fcXPw0U06L9HLhJIlb0znoW+lrCJJmaH8g/+T+6v1t6sb6XglX6ivQj
         aWUw8YbAdwW+gVlAAJkqEJtvc1duBaPwRhGXxn3WK0miCMLylXwK9gul0PqHQDeZw4Fp
         sBJblA5XYugDN5ees8eDK9JqCk+6rcdcDhwNfI/s8G5uUb2olDKCRp5F/MEtvS2XyoGW
         NPZMOSjjkjOFbCP1GZm1RhnqceyaLc/zXN5A3+4npgLm7yj+ScI2SLWpGEUf0RjbmCCr
         ux5V7f8bjmYlYMhIzxFwdXV1jMDnSYY6EIDzUOflWdRkdbymTdZkT2Pj5uwr8xvYyxfF
         UegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PtmjHcZkI3zGShXGHZey08Yzvo+1616KPZSuz8p9lIA=;
        b=DdTod1eC3na4C0i6/YMtDlnQLs8bpO5sxePc/aKiPTlLd+0oXOQrYnyhDjNfR2pT1M
         one+u8DloX+iTNP+ExZu0E5fTeAO1xnAp8xh2kd7Rf2Hx1FWKv/vBRTcWhbGkpox3oIY
         1RQtQAlo8lOQmcMZ5B2wkfCtvdlYbFo1YURwYpxy4r54+3E5VjfQISTsqGJl1McnhNx+
         zAi+mFBunVFtZOg5347y7rZdnGDSzEB6BJZIlUjGfPNsV62+8HwrsViPmE7PGXplcF0W
         3105hwDMkXZuUcqKERkiN+W0CKPVn4SY4+Gt14eESwfsbiCHFOXhiBYGynHZOOiqjFal
         Lcpw==
X-Gm-Message-State: AO0yUKXMgJfcE6M32yN6xzfWL7rx+SwR6/v2NDAD8hMy4s0PapLFtXUP
	d5OannbT/RReZtWS4LE4qKFTapS4pIiAxtUB9zQ=
X-Google-Smtp-Source: AK7set8Ffa6WifsSCkQSgZyy+Aj+4eMjZgmW3eHvQ+JiAL2jx5xzl8OdWHWr29OBcIDaeDJ+R+Ct/IFUhD+qCBujHo4=
X-Received: by 2002:a05:6214:4a4d:b0:56f:18ed:316f with SMTP id
 ph13-20020a0562144a4d00b0056f18ed316fmr2575689qvb.1.1677752817075; Thu, 02
 Mar 2023 02:26:57 -0800 (PST)
MIME-Version: 1.0
References: <20230302071934.254111-1-bjorn@kernel.org>
In-Reply-To: <20230302071934.254111-1-bjorn@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 2 Mar 2023 12:26:21 +0200
Message-ID: <CAHp75Vej41uWK9hUOuU=p2D3BwgznhjBzSLbFgRcdY8_X=brpQ@mail.gmail.com>
Subject: Re: [PATCH v3] lib/test_string.c: Add strncmp() tests
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_022700_190719_B3B72174 
X-CRM114-Status: GOOD (  23.39  )
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

T24gVGh1LCBNYXIgMiwgMjAyMyBhdCA5OjE54oCvQU0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5j
LmNvbT4KPgo+IFRoZSBSSVNDLVYgc3RybmNtcCgpIGZhaWxzIG9uIHNvbWUgaW5wdXRzLCBzZWUg
dGhlIGxpbmtlZCB0aHJlYWQgZm9yCj4gbW9yZSBkZXRhaWxzLiBJdCB0dXJucyBvdXQgdGhlcmUg
d2VyZSBubyBzdHJuY21wKCkgY2FsbHMgaW4gdGhlIHNlbGYKPiB0ZXN0cywgdGhpcyBhZGRzIG9u
ZS4KClRoYW5rIHlvdSwgaXQncyBnb29kIGVub3VnaC4KClJldmlld2VkLWJ5OiBBbmR5IFNoZXZj
aGVua28gPGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+Cgo+IFJlcG9ydGVkLWJ5OiBIZWlrbyBT
dMO8Ym5lciA8aGVpa29Ac250ZWNoLmRlPgo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yODAxMTYyLjg4Yk1RSmJGajZAZGllZ28vCj4gU2lnbmVkLW9mZi1ieTogUGFsbWVyIERh
YmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBl
bCA8Ympvcm5Acml2b3NpbmMuY29tPgo+IC0tLQo+IENoYW5nZSBiYWNrIHRvIGl0J3Mgb3JpZ2lu
YWwgZm9ybS4gQ2hlY2twYXRjaCBzdGlsbCBjb21wbGFpbnMgYWJvdXQKPiBfX2luaXRjb25zdCwg
YnV0IHRoZXJlJ3MgYSBwYXRjaCBhZGRyZXNzaW5nIHRoYXQgWzFdLgo+Cj4gWzFdIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDMwMTA5NDMyMC4xNTk1NC0xLWJqb3JuQGtlcm5lbC5v
cmcvCj4KPiB2Mi0+djM6IFJlbW92ZWQgdGhlICJjaGVja3BhdGNoIGZpeCIgcGF0Y2gKPiAgICAg
ICAgIEFkZGVkIG9uZSBtb3JlIHRlc3QKPgo+IHYxLT52MjogQWRkZWQgdHdvIG1vcmUgdGVzdHMg
KHBvcy9uZWcpLiAoQW5keSkKPiAgICAgICAgIE1pbm9yIGNvZGUgc3R5bGUgaXNzdWVzLiAoQW5k
eSkKPiAgICAgICAgIEZpeGVkIGNoZWNrcGF0Y2ggZXJyb3JzLgo+IC0tLQo+IGxpYi90ZXN0X3N0
cmluZy5jIHwgNDIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3Rl
c3Rfc3RyaW5nLmMgYi9saWIvdGVzdF9zdHJpbmcuYwo+IGluZGV4IGM1Y2I5MmZiNzEwZS4uZjE4
YTM0NTc4ZjFmIDEwMDY0NAo+IC0tLSBhL2xpYi90ZXN0X3N0cmluZy5jCj4gKysrIGIvbGliL3Rl
c3Rfc3RyaW5nLmMKPiBAQCAtMjA3LDYgKzIwNyw0MyBAQCBzdGF0aWMgX19pbml0IGludCBzdHJz
cG5fc2VsZnRlc3Qodm9pZCkKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiArc3RhdGljIF9f
aW5pdCBpbnQgc3RybmNtcF9zZWxmdGVzdCh2b2lkKQo+ICt7Cj4gKyAgICAgICBzaXplX3QgaTsK
PiArICAgICAgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3RybmNtcF90ZXN0IHsKPiArICAgICAgICAg
ICAgICAgY29uc3QgY2hhciAqc3RyX2E7Cj4gKyAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKnN0
cl9iOwo+ICsgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGNvdW50Owo+ICsgICAgICAgICAg
ICAgICB1bnNpZ25lZCBsb25nIG1heF9vZmY7Cj4gKyAgICAgICAgICAgICAgIGludCByZXR2YWw7
Cj4gKyAgICAgICB9IHRlc3RzW10gX19pbml0Y29uc3QgPSB7Cj4gKyAgICAgICAgICAgICAgIHsg
Ii9kZXYvdmRhIiwgIi9kZXYvIiwgNSwgNCwgMCB9LAo+ICsgICAgICAgICAgICAgICB7ICIvZGV2
L3ZkYSIsICIvZGV2L3ZkYiIsIDUsIDQsIDAgfSwKPiArICAgICAgICAgICAgICAgeyAiMDAwMDAw
MDAtLS0xMTExMSIsICIwMDAwMDAwMC0tLTExMTEyIiwgMTIsIDQsIDAgfSwKPiArICAgICAgICAg
ICAgICAgeyAiL2Rldi92ZGEiLCAiL2Rldi92ZFwwIiwgOCwgMCwgOTcgfSwKPiArICAgICAgICAg
ICAgICAgeyAiQUJDIiwgIkFCIiwgMywgMCwgNjcgfSwKPiArICAgICAgICAgICAgICAgeyAiQUJB
IiwgIkFCWiIsIDMsIDAsIC0yNSB9LAo+ICsgICAgICAgICAgICAgICB7ICJBQkMiLCAiQUJDIiwg
MywgMCwgMCB9LAo+ICsgICAgICAgfTsKPiArCj4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgQVJS
QVlfU0laRSh0ZXN0cyk7ICsraSkgewo+ICsgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qgc3Ry
bmNtcF90ZXN0ICpzID0gdGVzdHMgKyBpOwo+ICsgICAgICAgICAgICAgICBzaXplX3Qgb2ZmOwo+
ICsKPiArICAgICAgICAgICAgICAgZm9yIChvZmYgPSAwOyBvZmYgPD0gcy0+bWF4X29mZjsgb2Zm
KyspIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBpbnQgcmVzID0gc3RybmNtcChzLT5zdHJf
YSArIG9mZiwgcy0+c3RyX2IgKyBvZmYsIHMtPmNvdW50IC0gb2ZmKTsKPiArCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgaWYgKHJlcyA9PSAwICYmIHMtPnJldHZhbCAhPSAwKQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDB4MTAwMCArIDB4MTAwKm9mZiArIDB4MTAq
aSArIDB4MDsKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAocmVzID4gMCAmJiBzLT5yZXR2
YWwgPD0gMCkKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAweDEwMDAg
KyAweDEwMCpvZmYgKyAweDEwKmkgKyAweDE7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYg
KHJlcyA8IDAgJiYgcy0+cmV0dmFsID49IDApCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gMHgxMDAwICsgMHgxMDAqb2ZmICsgMHgxMCppICsgMHgyOwo+ICsgICAgICAg
ICAgICAgICB9Cj4gKyAgICAgICB9Cj4gKyAgICAgICByZXR1cm4gMDsKPiArfQo+ICsKPiAgc3Rh
dGljIF9fZXhpdCB2b2lkIHN0cmluZ19zZWxmdGVzdF9yZW1vdmUodm9pZCkKPiAgewo+ICB9Cj4g
QEAgLTI0NSw2ICsyODIsMTEgQEAgc3RhdGljIF9faW5pdCBpbnQgc3RyaW5nX3NlbGZ0ZXN0X2lu
aXQodm9pZCkKPiAgICAgICAgIGlmIChzdWJ0ZXN0KQo+ICAgICAgICAgICAgICAgICBnb3RvIGZh
aWw7Cj4KPiArICAgICAgIHRlc3QgPSA3Owo+ICsgICAgICAgc3VidGVzdCA9IHN0cm5jbXBfc2Vs
ZnRlc3QoKTsKPiArICAgICAgIGlmIChzdWJ0ZXN0KQo+ICsgICAgICAgICAgICAgICBnb3RvIGZh
aWw7Cj4gKwo+ICAgICAgICAgcHJfaW5mbygiU3RyaW5nIHNlbGZ0ZXN0cyBzdWNjZWVkZWRcbiIp
Owo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIGZhaWw6Cj4KPiBiYXNlLWNvbW1pdDogYzA5MjdhN2E1
MzkxZjdkOGU1OTNlNWU1MGVhZDc1MDVhMjNjYWRmOQo+IC0tCj4gMi4zNy4yCj4KCgotLSAKV2l0
aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
