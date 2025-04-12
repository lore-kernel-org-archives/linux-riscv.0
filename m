Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CB2C369A1
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Apr 2025 04:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2xqhVEZqjhmqKHxQq8Az/amNnQWkMcUU6EkcZWTNWsU=; b=m5y9QHfKjTmwos
	+as+ZHowJ0iwW5XM9VU0ZUwWL1OhjcOXLnkKBycDIHKIgiaGPSpoE+kKJSMrkXGoa+d7VXpcknW4W
	/dDzO+uaHYy27jdD5MqYyWHPGPIFIX+Sy0KPxSLe07GFuzqfWjPcJQaaaqK9jfn/V2Xuzfw9lJfw3
	ca0fo0BRzZ/4YF+cheA14Yow5PLXB++ymvMd7yvZDTN0A/73pgzzUt2cHnHhB7l9TKzLg+0pCy484
	cT68lYdEyVT7GSdszjQVdpxY9husYSTVipPKMOuV9+aDc+6+pS23lMcbJmSJI0EAUpPEXDBe+lQ/l
	t5B+NVvl/zZw9vhRjjvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3SOH-0000000FP6F-43g1;
	Sat, 12 Apr 2025 04:22:49 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3SOE-0000000FP5W-35ME
	for linux-riscv@lists.infradead.org;
	Sat, 12 Apr 2025 04:22:48 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ac29fd22163so398649866b.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Apr 2025 21:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744431765; x=1745036565; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05C5L0Gpse8OxdiRbCXeFoAP6LtcohYGcNTzACQG79I=;
        b=CmfmO4/48yUT3gs3VbamUwTKrXJAsoj1iXqpEbPaf07VdrsOhwmZAlnr/G+v8Mur9J
         JwKbUYRamxtpBJ2cWTkNsR2Oq2CuVvkheJracK0lHDo9/IWsEMkzTLHF/LNi9/qFr2vb
         bcKI31qeNlEZhfM568s3IJGIgBugAa4oScsAM3MJRTwnX0xaPwxVoqyyei1AGcfKKrcX
         Cjx55dQcmmsTNrG0J+2hrD2T/ZUnVXhdElcVB/H9kgDCK1spzlgm8ZCpa0xvfBJIN01s
         Zy61t591tAwISipS+ywF6pPee01W9RizIiX7CCYHvbWHbw8Mr9/hISNiOHzrb+m7D4EX
         7JnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744431765; x=1745036565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=05C5L0Gpse8OxdiRbCXeFoAP6LtcohYGcNTzACQG79I=;
        b=lxXCEDJHB5DInyX7O3wlullSTjPyNsC3I+mPlJYnN35C6mOm/5cxasMpY4mMS3YAX5
         CrSc5CG+8p53bN5JLV9oAGTXRTK83wGYCG29zhakt5LdfAFzICClgfbGPkzF9+7zEfgO
         EPjAlEWxAWLShgWvintW+lEfniGaTFQCEN2hU4/FMUJpZ1mmseaz176yMR8brEwDI4F3
         OWu3X1h3XHok6IFEaZPvPYr4UCOgzgKPjvT/L8B5LD41wE7NxZM4cCqraag1gqscFfss
         iFOG7D28UmAUlxpigqlim4kUQZumURzhE+MM/p3pto4JckmChdFCUomH5wlMHL25IsjG
         z3Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVKZNiAjC2YTp9aJUI+vY7AhCkasTnuE5DOmPAeFhls2y1b8c1rRHvb+QwgNNf6kC581z3LTh/MrzBOyA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+imMXdP7Y68AhCm02BaIzTBuwONt3HNgbZEzPBTopIfaZl3rC
	dzcLwsJi+Ec+DkUwR42ENbktH9ACK+sjYXqbMJK0aBY4k1eVtHtIWZq7fTka65xTHcVXzfZfXT1
	x3HIm9c4s73xqtYJjSCAye8uXDkCE73+djeMg2A==
X-Gm-Gg: ASbGncu5GRvnug3FJovoWqyHdjXN36XopjTL/EFtOt1s8kdkoDBhpZcvwAPrPvj8+yC
	gjjJEfc9Cz/TK5Ejg8FghfjC3so8ZQpR3ivrExiT9WoIuqlJJs2C8M1Jd99iGkYzSXzXN2kvP37
	35tmXARmRKyMGgEDLyrUulQHeKJw==
X-Google-Smtp-Source: AGHT+IGYuiszYCi7qWo9y4ZA32qHFUN/1bWbzAZvEtCTohy4G3Cy1q93jH/uejMtJJyZEjD+1PtKWMiMNzmzfMkJcy4=
X-Received: by 2002:a17:907:7fa5:b0:ac7:b48f:4cd6 with SMTP id
 a640c23a62f3a-acad34ba069mr421800166b.24.1744431764635; Fri, 11 Apr 2025
 21:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-8-guodong@riscstar.com> <20250411140510-GYA22364@gentoo>
 <d2c26d3e-787a-490e-9134-8ffe2f6b8333@riscstar.com> <j35vjluiykbu2gxg5zkoxm67muj5y66zn6tjwhdbnolkyeilh7@cubjbzouewiy>
In-Reply-To: <j35vjluiykbu2gxg5zkoxm67muj5y66zn6tjwhdbnolkyeilh7@cubjbzouewiy>
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 12 Apr 2025 12:22:32 +0800
X-Gm-Features: ATxdqUFBjSG4mlbdp7nE8mXBUsIc0jQlH-3ugDyge5bg-US1BCesmG_1FB96s9Q
Message-ID: <CAH1PCMa6BihBDubJNL2W-kfzUdwwKgiKgW=iz5JsroWQVyhg+g@mail.gmail.com>
Subject: Re: [PATCH 7/9] riscv: dts: spacemit: Add PWM14 backlight support for BPI-F3
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Alex Elder <elder@riscstar.com>, Yixun Lan <dlan@gentoo.org>, ukleinek@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, geert+renesas@glider.be, 
	heylenay@4d2.org, tglx@linutronix.de, hal.feng@starfivetech.com, 
	unicorn_wang@outlook.com, duje.mihanovic@skole.hr, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_212246_779621_F97036A6 
X-CRM114-Status: GOOD (  34.65  )
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

T24gU2F0LCBBcHIgMTIsIDIwMjUgYXQgNzoyOOKAr0FNIElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBBcHIgMTEsIDIwMjUgYXQgMDk6MjM6MjlB
TSAtMDUwMCwgQWxleCBFbGRlciB3cm90ZToKPiA+IE9uIDQvMTEvMjUgOTowNSBBTSwgWWl4dW4g
TGFuIHdyb3RlOgo+ID4gPgo+ID4gPiBPbiAyMToxNCBGcmkgMTEgQXByICAgICAsIEd1b2Rvbmcg
WHUgd3JvdGU6Cj4gPiA+ID4gQWRkIGEgUFdNLWJhc2VkIGJhY2tsaWdodCBub2RlIGZvciB0aGUg
QmFuYW5hIFBpIEJQSS1GMyBib2FyZCwKPiA+ID4gPiB1c2luZyBQV00xNC4gVGhlIGJhY2tsaWdo
dCBpcyBkZWZpbmVkIGFzIGEgJ3B3bS1iYWNrbGlnaHQnIGRldmljZSB3aXRoCj4gPiA+ID4gYnJp
Z2h0bmVzcyBsZXZlbHMgYW5kIGEgZGVmYXVsdCBicmlnaHRuZXNzIHNldHRpbmcuIFBXTTE0IGlz
IGFzc2lnbmVkCj4gPiA+ID4gYSBwZXJpb2QgbGVuZ3RoIG9mIDIwMDAgbmFub3NlY29uZHMuCj4g
PiA+ID4KPiA+ID4gPiBUaGlzIGNvbmZpZ3VyYXRpb24gd2FzIHVzZWQgdG8gdmVyaWZ5IFBXTSBk
cml2ZXIgY2hhbmdlcywgd2l0aCBQV00xNAo+ID4gPiA+IHRlc3RlZCBhbmQgaXRzIHdhdmVmb3Jt
IGNvbmZpcm1lZCBhcyBjb3JyZWN0Lgo+ID4gPiA+Cj4gPiA+ID4gVGhlIG5vZGUgc3RhdHVzIGlz
IHNldCB0byAiZGlzYWJsZWQiLCBhbmQgc2hvdWxkIGJlIGVuYWJsZWQgd2hlbiB0aGUKPiA+ID4g
PiBkaXNwbGF5IGRyaXZlciBpcyByZWFkeS4KPiA+ID4gPgo+ID4gPiAuLiBzZWUgY29tbWVudHMg
YmVsb3cKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHdW9kb25nIFh1IDxndW9kb25nQHJpc2NzdGFy
LmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgIC4uLi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5h
bmFwaS1mMy5kdHMgICAgICB8IDMyICsrKysrKysrKysrKysrKysrKysKPiA+ID4gPiAgIDEgZmls
ZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1mMy5kdHMgYi9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0cwo+ID4gPiA+IGluZGV4IDgx
NmVmMWJjMzU4ZS4uZDA0YjU3ZGRlYjQ2IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRzCj4gPiA+ID4gKysrIGIvYXJjaC9y
aXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1mMy5kdHMKPiA+ID4gPiBAQCAtMjgs
NiArMjgsMzIgQEAgbGVkMSB7Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICBkZWZh
dWx0LXN0YXRlID0gIm9uIjsKPiA+ID4gPiAgICAgICAgICAgICAgICAgICB9Owo+ID4gPiA+ICAg
ICAgICAgICB9Owo+ID4gPiA+ICsKPiA+ID4gPiArIHB3bV9ibDogbGNkX2JhY2tsaWdodCB7Cj4g
PiA+ID4gKyAgICAgICAgIGNvbXBhdGlibGUgPSAicHdtLWJhY2tsaWdodCI7Cj4gPiA+ID4gKwo+
ID4gPiA+ICsgICAgICAgICBwd21zID0gPCZwd20xNCAyMDAwPjsKPiA+ID4gPiArICAgICAgICAg
YnJpZ2h0bmVzcy1sZXZlbHMgPSA8Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgMCAgIDQwICA0
MCAgNDAgIDQwICA0MCAgNDAgIDQwICA0MCAgNDAgIDQwICA0MCAgNDAgIDQwICA0MCAgNDAKPiA+
ID4gPiArICAgICAgICAgICAgICAgICA0MCAgNDAgIDQwICA0MCAgNDAgIDQwICA0MCAgNDAgIDQw
ICA0MCAgNDAgIDQwICA0MCAgNDAgIDQwICA0MAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgIDQw
ICA0MCAgNDAgIDQwICA0MCAgNDAgIDQwICA0MCAgNDAgIDQxICA0MiAgNDMgIDQ0ICA0NSAgNDYg
IDQ3Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgNDggIDQ5ICA1MCAgNTEgIDUyICA1MyAgNTQg
IDU1ICA1NiAgNTcgIDU4ICA1OSAgNjAgIDYxICA2MiAgNjMKPiA+ID4gPiArICAgICAgICAgICAg
ICAgICA2NCAgNjUgIDY2ICA2NyAgNjggIDY5ICA3MCAgNzEgIDcyICA3MyAgNzQgIDc1ICA3NiAg
NzcgIDc4ICA3OQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgIDgwICA4MSAgODIgIDgzICA4NCAg
ODUgIDg2ICA4NyAgODggIDg5ICA5MCAgOTEgIDkyICA5MyAgOTQgIDk1Cj4gPiA+ID4gKyAgICAg
ICAgICAgICAgICAgOTYgIDk3ICA5OCAgOTkgIDEwMCAxMDEgMTAyIDEwMyAxMDQgMTA1IDEwNiAx
MDcgMTA4IDEwOSAxMTAgMTExCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgMTEyIDExMyAxMTQg
MTE1IDExNiAxMTcgMTE4IDExOSAxMjAgMTIxIDEyMiAxMjMgMTI0IDEyNSAxMjYgMTI3Cj4gPiA+
ID4gKyAgICAgICAgICAgICAgICAgMTI4IDEyOSAxMzAgMTMxIDEzMiAxMzMgMTM0IDEzNSAxMzYg
MTM3IDEzOCAxMzkgMTQwIDE0MSAxNDIgMTQzCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgMTQ0
IDE0NSAxNDYgMTQ3IDE0OCAxNDkgMTUwIDE1MSAxNTIgMTUzIDE1NCAxNTUgMTU2IDE1NyAxNTgg
MTU5Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgMTYwIDE2MSAxNjIgMTYzIDE2NCAxNjUgMTY2
IDE2NyAxNjggMTY5IDE3MCAxNzEgMTcyIDE3MyAxNzQgMTc1Cj4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgMTc2IDE3NyAxNzggMTc5IDE4MCAxODEgMTgyIDE4MyAxODQgMTg1IDE4NiAxODcgMTg4
IDE4OSAxOTAgMTkxCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgMTkyIDE5MyAxOTQgMTk1IDE5
NiAxOTcgMTk4IDE5OSAyMDAgMjAxIDIwMiAyMDMgMjA0IDIwNSAyMDYgMjA3Cj4gPiA+ID4gKyAg
ICAgICAgICAgICAgICAgMjA4IDIwOSAyMTAgMjExIDIxMiAyMTMgMjE0IDIxNSAyMTYgMjE3IDIx
OCAyMTkgMjIwIDIyMSAyMjIgMjIzCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgMjI0IDIyNSAy
MjYgMjI3IDIyOCAyMjkgMjMwIDIzMSAyMzIgMjMzIDIzNCAyMzUgMjM2IDIzNyAyMzggMjM5Cj4g
PiA+ID4gKyAgICAgICAgICAgICAgICAgMjQwIDI0MSAyNDIgMjQzIDI0NCAyNDUgMjQ2IDI0NyAy
NDggMjQ5IDI1MCAyNTEgMjUyIDI1MyAyNTQgMjU1Cj4gPiA+ID4gKyAgICAgICAgID47Cj4gPiA+
ID4gKyAgICAgICAgIGRlZmF1bHQtYnJpZ2h0bmVzcy1sZXZlbCA9IDwxMDA+Owo+ID4gPiA+ICsg
ICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ID4gPiBJJ20gY29uZnVzZWQsIGhhcyBEVCBp
biBib2FyZCBmaWxlIHdpdGggZGlzYWJsZWQgc3RhdHVzIGRvZXNuJ3QgbWFrZSBzZW5zZT8KPiA+
ID4gaXQgZG9lc24ndCByZWFsbHkgdXNlZnVsIGZvciBwbGFjZWhvbGRlciwgZXZlbiB3b3JzZSB0
aGF0IGZ1bmN0aW9uYWxpdHkgbWF5IG5vdAo+ID4gPiB2ZXJpZmllZCwgc28gSSdkIHN1Z2dlc3Qg
c2VuZGluZyBhbG9uZyB3aXRoIGRpc3BsYXkgZHJpdmVyIHdoaWxlIGF0IGl0Li4KPiA+Cj4gPiBJ
IHRoaW5rIEkgc3VnZ2VzdGVkIGhlIGluY2x1ZGUgdGhpcy4gIEd1b2RvbmcgdGVzdGVkIFBXTSB1
c2luZwo+ID4gYSBiYWNrbGlnaHQgb24gYSBkaXNwbGF5IGNvbm5lY3RlZCB0byBhIEJhbmFuYSBQ
aSBQQkktRjMgYm9hcmQuCj4gPiBUaGUgYWJvdmUgbnVtYmVycyBjb21lIGRpcmVjdGx5IGZyb20g
dGhlIGRvd25zdHJlYW0gY29kZSwgd2hpY2gKPiA+IHVzZXMgdGhpcyBQV00gY29uc2lzdGVudGx5
IGFzIGEgZGlzcGxheSBiYWNrIGxpZ2h0Lgo+ID4KPiA+IEJ1dCB5b3UncmUgcmlnaHQsIHRoZSBl
eGFjdCBzZXQgb2YgbnVtYmVycyB0byB1c2UgaXMgZGVwZW5kZW50Cj4gPiBvbiB0aGUgZGlzcGxh
eSB1c2VkLCBzbyBpdCdzIGJldHRlciB0byBhZGQgdGhlbSB3aGVuIHRoZSBkaXNwbGF5Cj4gPiBn
ZXRzIGludGVncmF0ZWQuCj4gPgo+ID4gVGhlIHB3bTE0IG5vZGUgY291bGQgdXBkYXRlIHN0aWxs
IGJlIGFkZGVkIGhlcmUsIGJ1dCB0aGF0IHRvbwo+ID4gbWlnaHQgYXMgd2VsbCB3YWl0IHVudGls
IHRoZXJlJ3Mgc29tZXRoaW5nIHRvIHVzZSBpdC4gIFNvIEkKPiA+IHRoaW5rIHRoaXMgcGF0Y2gg
Y2FuIGp1c3QgYmUgZHJvcHBlZC4KPiA+Cj4KCkkgY2hlY2tlZCB0aGUgZXhpc3RpbmcgYm9hcmRz
IGJhc2VkIG9uIFNwYWNlbWlUIEsxIFNvYywgYWxsIG9mIHRoZW0gYXJlCmZvbGxvd2luZyB0aGUg
c2FtZSBwaW5tdXggZGVzaWduIG9mIHVzaW5nIHB3bTE0IChhbmQgcGluY3RybCBncm91cCAxLApp
ZS4gcHdtMTRfMV9jZmcpIGFzIHRoZSBkaXNwbGF5IGJhY2tsaWdodCBjb250cm9sLgoKVGhhdCdz
IHdoeSB0aGUgY29kZSByZWxhdGluZyB0byBwd20xNCwgaW4gbXkgb3BpbmlvbiwgY291bGQgYmUg
dXNlZnVsIHRvCm90aGVycy4KCj4gSWYgdGhpcyBwYXRjaCB3aWxsIGJlIGFwcGxpZWQgYXMgaXQg
aXMgYWZ0ZXIgYXBwbHlpbmcgdGhlIGRpc3BsYXkKPiBkcml2ZXIuIEkgcmVjb21tZW5kIHRvIHBy
ZXNlcnZlIHRoaXMgcGF0Y2gsIGJ1dCBtb3ZlIG91dCBvZiB0aGlzCj4gc2VyaWVzIGFuZCByZXNl
bmQgaXQgYXMgUkZDLiBJZiB0aGlzIGlzIG9ubHkgZm9yIHRlc3QgcHVycG9zZSwgaXQKPiBpcyBi
ZXR0ZXIgdG8gbW92ZSB0aGlzIGludG8gdGhlIGNvdmVyIGxldHRlciBhbmQgYWRkcmVzcyBpdCBp
cyBmb3IKPiB0ZXN0aW5nLgo+CgpZZXMsIGl0J3MgZm9yIHRlc3QgcHVycG9zZS4gU28sIGxldCBt
ZSBtb3ZlIHRoZSBjb2RlIHNuaXBwZXQgaW50byB0aGUKY292ZXIgbGV0dGVyIGluIG15IG5leHQg
dmVyc2lvbi4KCi1HdW9kb25nCgo+IEluIG1vc3QgY2FzZSwgcGF0Y2hlcyB3aXRoIHNvbWUgdW5t
ZWV0IGRlcGVuZGVuY3kgc2hvdWxkIGZvbGxvdwo+IG1haW50YWluZXIncyByZXF1ZXN0LCBvciBo
YXMgc3BlY2lmaWMgcHVycG9zZXMuIEl0IGFsc28gbmVlZGVkIHRvCj4gYmUgbWFya2VkIGFzIFJG
Qy4KPgo+IFJlZ2FyZHMsCj4gSW5vY2hpCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
