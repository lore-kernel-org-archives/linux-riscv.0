Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9C7C02196
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 12:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ugP+Z79Jp63r7XnuWXLormcwS9Bi1uNdFPt8I+kg/jk=; b=YipjsfCJuVF27b
	kR9rw/pQaZQK4E1veFZbSA0Bhqyi0I6McnhPPecTKR6pnRcprsbEAosJDJ7x4sgJWCdeOLdrLlCmP
	NaRuNUgTrUTDLXtsGeK7MU3yMcLghhNY5IEUtkRteUsUr/LuuZaXf9zFA2Fz/GfmwwjUREcfCB+h3
	QU5lC6SsOt68Kyywtf4PZvgFWptaMtn8L6N2jkfg0G/m5HkMPFMWlCgCrXnoHWMH6PwakCLFwpHEM
	Jrry7u9wmsaI/kygtQwSQ9DXqvpMl9HqKcvZhAZ/v9ZaI8gk/we0vdt3vgKfjQKPVglOmub9bFo6r
	0l7O8R+lrNghssr62MeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg13n-00000006Hos-1jWp;
	Thu, 06 Feb 2025 12:32:47 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg13j-00000006Hmj-2Rat
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 12:32:45 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5401ab97206so926614e87.3
        for <linux-riscv@lists.infradead.org>; Thu, 06 Feb 2025 04:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738845162; x=1739449962; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWRkn692xu3fndHgX/PtDqTVcXyCxVQh1w1lZ4iFLSw=;
        b=YRdADevIfO6hL+V4j2ZLFZ9dG+AlA3RYK1u5y3DmwDWd5AdjOuFdEK7HI0n+bgWqTi
         rbvtOZmXUtAdPDOKDE/11BMEelilBbFDAjnggbmb5ZQx3XWld8gduBJAKUtaH+erhFy9
         Wb74dc/D9eOgnox12485ATMXCg3XGwWHEnGbNt2nTa9mjhiKMQvNGmbHAW4kZ245bvXw
         TZOeXwT92jnah8VYzyX5mpX5eb1Gx2LS5iYmH97rYEiVgjQJvOzd9eqjeqTibPjcbPVf
         iN+l9Sq81V0L7G6DNp17lYvLLJjFrFVl9uJBxlcIk3HC8gbTX+5ScKY3IIKrLRfedqoY
         KvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738845162; x=1739449962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWRkn692xu3fndHgX/PtDqTVcXyCxVQh1w1lZ4iFLSw=;
        b=vccxZZ0l3IEQxRPL0pzVnxOqoCma6hsNEVBRMvrMpC9xqa7Rwqj4vbzGYuaWECGFDJ
         IzlaienPXT7TPofn8fl3VWpYT8NKeYXR93WdfbVg8T1paTOqObYobPrSJzjF+QxvAsCE
         H9yhrDKZnCn4QaG+1UecviDi9nDfszb1tRoIjjTES6ImgcjmswGJbwgvnRC/Puonr5LH
         JFAfNWqoe5Vj85/ih/i3XuCiHLtgoVc+QYfmrR2J8Yeks5wtqzaYL8+Ku0dk5TRk7Qws
         QzV5PTMLlaXS34h/SorZ+Osb+PFxO5MiD+pLozmatqT2HKUzmb9qfh34zNs5PD+mu8Nn
         sv4A==
X-Forwarded-Encrypted: i=1; AJvYcCXKJQ75tN1eB/s2uQaFVOrnpg1OSGxeHZOnred8cxp+gPTNL02muXRS8+TDMpxUrfEDPqypneoY0S4C+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVRQgu3sNjjukUJ25XfZsLdxcQNEMipOft33sFxM6Z6R6ZhpV6
	Q6YzoVn5G9bfU8v2MQjEN+fMJ5rySQGE4vQFft6QQHAdwEqbfyCHPtb76jfqj6TBqIrmrH886Bi
	eS0eTZG6gExr6aZSu8iGdMRixQjR27dQQ+WvPsw==
X-Gm-Gg: ASbGnct7/B3pIiCdquoWxv7l6Br4nQdbEuxGEfnk3PIdKoZv4hvB7Ik+nchj7hvO5bx
	uCrSnmqALDZf0RybYY9RMKtFqQbgQn/lycCJD4gC2RuR5UZun7DVoAjd8yWlDJxHxhGVAcOingA
	==
X-Google-Smtp-Source: AGHT+IHOno/KZ+CGEGcrQMo7/996cTTP2DtCCzvVKfHVrOt05I06XEuaoQXc/ObdS2ENzYO5jwzIxEyk9zg2zQOd/6g=
X-Received: by 2002:a05:6512:b90:b0:542:19ef:95c2 with SMTP id
 2adb3069b0e04-54405a225f3mr2321112e87.23.1738845161587; Thu, 06 Feb 2025
 04:32:41 -0800 (PST)
MIME-Version: 1.0
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-4-apatel@ventanamicro.com> <20250203224436.GA363790-robh@kernel.org>
In-Reply-To: <20250203224436.GA363790-robh@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 6 Feb 2025 18:02:28 +0530
X-Gm-Features: AWEUYZkAxRNuUmU_XWz__RY8mc4lXIPtw0_-vRmYJbJRtQCbjrwJyHKjevCNgIg
Message-ID: <CAK9=C2WTbkT32ERGZBGHyu0R1OSjTpHBswbBvsxygoycfr_2Fg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 03/17] dt-bindings: mailbox: Add bindings for
 RISC-V SBI MPXY extension
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_043243_627366_34EF640A 
X-CRM114-Status: GOOD (  24.46  )
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Jassi Brar <jassisinghbrar@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rahul Pathak <rpathak@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Atish Patra <atishp@atishpatra.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBGZWIgNCwgMjAyNSBhdCA0OjE04oCvQU0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEZlYiAwMywgMjAyNSBhdCAwMjoxODo1MlBNICswNTMw
LCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gQWRkIGRldmljZSB0cmVlIGJpbmRpbmdzIGZvciB0aGUg
UklTQy1WIFNCSSBNZXNzYWdlIFByb3h5IChNUFhZKQo+ID4gZXh0ZW5zaW9uIGFzIGEgbWFpbGJv
eCBjb250cm9sbGVyLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2
ZW50YW5hbWljcm8uY29tPgo+ID4gLS0tCj4gPiAgLi4uL2JpbmRpbmdzL21haWxib3gvcmlzY3Ys
c2JpLW1weHktbWJveC55YW1sIHwgNTQgKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94L3Jpc2N2LHNiaS1tcHh5LW1ib3gueWFt
bAo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWFpbGJveC9yaXNjdixzYmktbXB4eS1tYm94LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWFpbGJveC9yaXNjdixzYmktbXB4eS1tYm94LnlhbWwKPiA+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjhhMDVlMDg5YjcxMAo+ID4gLS0t
IC9kZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21h
aWxib3gvcmlzY3Ysc2JpLW1weHktbWJveC55YW1sCj4gPiBAQCAtMCwwICsxLDU0IEBACj4gPiAr
IyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2Up
Cj4gPiArJVlBTUwgMS4yCj4gPiArLS0tCj4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
c2NoZW1hcy9tYWlsYm94L3Jpc2N2LHNiaS1tcHh5LW1ib3gueWFtbCMKPiA+ICskc2NoZW1hOiBo
dHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+ICsKPiA+ICt0
aXRsZTogUklTQy1WIFNCSSBNZXNzYWdlIFByb3h5IChNUFhZKSBleHRlbnNpb24gYmFzZWQgbWFp
bGJveAo+ID4gKwo+ID4gK21haW50YWluZXJzOgo+ID4gKyAgLSBBbnVwIFBhdGVsIDxhbnVwQGJy
YWluZmF1bHQub3JnPgo+ID4gKwo+ID4gK2Rlc2NyaXB0aW9uOiB8Cj4gPiArICBUaGUgUklTQy1W
IFNCSSBNZXNzYWdlIFByb3h5IChNUFhZKSBleHRlbnNpb24gWzFdIGFsbG93cyBzdXBlcnZpc29y
Cj4gPiArICBzb2Z0d2FyZSB0byBzZW5kIG1lc3NhZ2VzIHRocm91Z2ggdGhlIFNCSSBpbXBsZW1l
bnRhdGlvbiAoTS1tb2RlCj4gPiArICBmaXJtd2FyZSBvciBIUy1tb2RlIGh5cGVydmlzb3IpLiBU
aGUgdW5kZXJseWluZyBtZXNzYWdlIHByb3RvY29sCj4gPiArICBhbmQgbWVzc2FnZSBmb3JtYXQg
dXNlZCBieSB0aGUgc3VwZXJ2aXNvciBzb2Z0d2FyZSBjb3VsZCBiZSBzb21lCj4gPiArICBvdGhl
ciBzdGFuZGFyZCBwcm90b2NvbCBjb21wYXRpYmxlIHdpdGggdGhlIFNCSSBNUFhZIGV4dGVuc2lv
bgo+ID4gKyAgKHN1Y2ggYXMgUklTQy1WIFBsYXRmb3JtIE1hbmFnZW1lbnQgSW50ZXJmYWNlIChS
UE1JKSBbMl0pLgo+ID4gKwo+ID4gKyAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PQo+ID4gKyAgUmVmZXJlbmNlcwo+ID4gKyAgPT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PQo+ID4gKwo+ID4gKyAgWzFdIFJJU0MtViBTdXBlcnZpc29y
IEJpbmFyeSBJbnRlcmZhY2UgKFNCSSkKPiA+ICsgICAgICBodHRwczovL2dpdGh1Yi5jb20vcmlz
Y3Ytbm9uLWlzYS9yaXNjdi1zYmktZG9jL3JlbGVhc2VzCj4gPiArCj4gPiArICBbMl0gUklTQy1W
IFBsYXRmb3JtIE1hbmFnZW1lbnQgSW50ZXJmYWNlIChSUE1JKQo+ID4gKyAgICAgIGh0dHBzOi8v
Z2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LXJwbWkvcmVsZWFzZXMKPiA+ICsKPiA+ICtw
cm9wZXJ0aWVzOgo+ID4gKyAgJG5vZGVuYW1lOgo+ID4gKyAgICBjb25zdDogc2JpLW1weHktbWJv
eAo+Cj4gJ21haWxib3gnIGlzIHRoZSBkZWZpbmVkIG5hbWUgZm9yIG1haWxib3ggcHJvdmlkZXJz
LgoKT2theSwgSSB3aWxsIHVwZGF0ZS4KCj4KPiA+ICsKPiA+ICsgIGNvbXBhdGlibGU6Cj4gPiAr
ICAgIGNvbnN0OiByaXNjdixzYmktbXB4eS1tYm94Cj4gPiArCj4gPiArICAiI21ib3gtY2VsbHMi
Ogo+ID4gKyAgICBjb25zdDogMgo+ID4gKyAgICBkZXNjcmlwdGlvbjoKPiA+ICsgICAgICBUaGUg
Zmlyc3QgY2VsbCBzcGVjaWZpZXMgY2hhbm5lbF9pZCBvZiB0aGUgU0JJIE1QWFkgY2hhbm5lbCwK
PiA+ICsgICAgICB0aGUgc2Vjb25kIGNlbGwgc3BlY2lmaWVzIE1TR19QUk9UX0lEIG9mIHRoZSBT
QkkgTVBYWSBjaGFubmVsCj4gPiArCj4gPiArcmVxdWlyZWQ6Cj4gPiArICAtIGNvbXBhdGlibGUK
PiA+ICsgIC0gIiNtYm94LWNlbGxzIgo+ID4gKwo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBm
YWxzZQo+ID4gKwo+ID4gK2V4YW1wbGVzOgo+ID4gKyAgLSB8Cj4gPiArICAgIHNiaS1tcHh5LW1i
b3ggewo+ID4gKyAgICAgICAgICBjb21wYXRpYmxlID0gInJpc2N2LHNiaS1tcHh5LW1ib3giOwo+
ID4gKyAgICAgICAgICAjbWJveC1jZWxscyA9IDwyPjsKPgo+IElzIHRoZXJlIGFuIFNCSSBub2Rl
PyAjbWJveC1jZWxscyBjb3VsZCBqdXN0IGJlIHBhcnQgb2YgdGhhdCBhbG9uZyB3aXRoCj4gYW55
dGhpbmcgZWxzZSB0aGF0IFNCSSBpcyBhIHByb3ZpZGVyIGZvci4gQW5kIHdlIGFscmVhZHkgaGF2
ZSB0aGUgUE1VCj4gU0JJIGJpbmRpbmcuIEl0J3MgYWxsIG9uZSB0aGluZywgc28gdGhlcmUgc2hv
dWxkIGJlIG9uZSBTQkkgbm9kZS4gVGhlbgo+IHdlIGNhbiBkZWJhdGUgYWJvdXQgY2hpbGQgbm9k
ZXMgb2YgaXQuCgpUaGVyZSBpcyBubyBTQkkgbm9kZSBmb3IgYW55IG90aGVyIFNCSSBleHRlbnNp
b24uCgpUaGUgUE1VIGJpbmRpbmdzIGZvciAicmlzY3YscG11IiBjb21wYXRpYmxlIHN0cmluZyBp
cyBmb3IgdGhlIGZpcm13YXJlCmRyaXZlciAoTS1tb2RlKSB3aGljaCBpbXBsZW1lbnRzIHRoZSBT
QkkgUE1VIGV4dGVuc2lvbiBub3QgdGhlIExpbnV4CmRyaXZlci4KClRoZSAidGl0bGUiIGFuZCAi
ZGVzY3JpcHRpb24iIG9mCjxsaW51eF9zb3VyY2U+L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9wZXJmL3Jpc2N2LHBtdS55YW1sCm5lZWRzIHNvbWUgY2xhcmlmaWNhdGlvbi4KClJl
Z2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
