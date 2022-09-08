Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F33C54EE9
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 16:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ReL3xKWa+4aQbMon2SZUo0y6rDe/dywupFi/yibnJXg=; b=o6MkbjRiEml4Tz
	ZtRItX7F/qNiIYldGiSqV6FXUF4oA9nyI7ikFoKoo2OPOlE8jZXIA/thFbeD6mVvN1rtCISCslC9M
	H03ezgLuKljgNXbHBqIEBK9GDoJvd7620ZWZBJhroFItpqVrjGXG7CzchLjkM0kkT+iah/b1U+KI6
	y9fnLQ/W/QTRTMeZH4vci8KAjhYOwtBKIny2Sq62nq+0FM/9M6ys1/vDE73bRaZmQK38+f5qxUjVV
	BwOjdCI7s+jAbXW0SuVsywsUdNw/dNgQ8fe5jjERdaYhWb4h7rD59V/+PZHmfkoyRuAHs0gG2ycCA
	Lr4vwJfo3l9dzEI7a/Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWK06-005Xy3-TO; Thu, 08 Sep 2022 16:03:34 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWK04-005Xvu-3I
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 16:03:33 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-333a4a5d495so170141977b3.10
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 09:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=9jDIgaiDOueBZywEIJYtrnQ4M8lU4j/xUU5lsSusSWQ=;
        b=w7oP9Mam2FF5isqkBFvrRGCu0IZdmwvaAmasErePzQDAKe1DC8g7Ioy3GAmttBr4aZ
         i7mcQz9QfxOPs6O2hMgfUUDEWyAfy5UipJ62kuiIvLHHkl7pFBZFA9uZoIwZdVpoywzt
         kYmAp0ZdbbsjUKK6jg7CB4Ta7vceYccoDG5Qyoml5JQMYc8vfPhpZ1pwP9gWyzbMrGQe
         xHDi8Gd7QQ9OUHBSkfu/7rebK3hSfY0A/hFr1M99lKv6m6DjoMLs6bH+UU2TPZtWwgsd
         L1qXiq25W3uA56FRjl4DSkgISLQust05sQaa/2j6/Ffrg+OkpfW56NgdJ8H6uv65Q8XK
         ii3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=9jDIgaiDOueBZywEIJYtrnQ4M8lU4j/xUU5lsSusSWQ=;
        b=OnxZJ+BqkbSm/hCkSiLoOwKw2/53hFPWqK/38JT8gjPUONl7W3BD1HLnl0Q9OI8ugf
         iL1hWyWwMBirfjivpAiCdIl4QIWwcKAmDRiOn3ubUd6RRUCZ0XEM4dPdZRL+gbia/OZh
         BCkvm4VeWztFXb3RlWnddJkxEU2Tbi4OKcW8fCkvmyAPQ0qrkxZYIImlBepXy2Kn45eC
         wq+xIr7xxewp3LBSe/9SKRBO73sRJEJk2NruJPMDouEU5SNWGlORZ5Khf9R63vied+QX
         p+6UsKOlgEkrHKXXPoGaiXEK6oeb1JhsSUI2A06dgwnyR440GD07VNrVehIGEbevqh0z
         ry8g==
X-Gm-Message-State: ACgBeo0abE98+Fvwx5R7dE+uUUS7nM6ikanXn0d88ccS4qWd/tGz2dy3
	1PMTN7Q54YHY9F2bjnRQJNkvw3UYh087QutHaqBKRg==
X-Google-Smtp-Source: AA6agR4Jd6UzszZSbhssCptu3gk3s0Y88Z77skDGyRd6UzQCdc27W75KBjszSyjEUahkjPYoooq704swveDF4P6hF/c=
X-Received: by 2002:a81:8006:0:b0:336:e100:8206 with SMTP id
 q6-20020a818006000000b00336e1008206mr8179205ywf.427.1662653008926; Thu, 08
 Sep 2022 09:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220831172500.752195-1-ajones@ventanamicro.com>
 <20220831172500.752195-3-ajones@ventanamicro.com> <3006889.o7ts2hSHzF@diego>
In-Reply-To: <3006889.o7ts2hSHzF@diego>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 8 Sep 2022 21:33:15 +0530
Message-ID: <CAAhSdy0yiYZFhcxvDr22h1+NWgQAc-APhZfErdfgcHD1kMosfg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] riscv: Introduce support for defining instructions
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	mchitale@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_090332_393650_0FEDBE95 
X-CRM114-Status: GOOD (  28.82  )
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

T24gVGh1LCBTZXAgOCwgMjAyMiBhdCA5OjE5IFBNIEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRl
Y2guZGU+IHdyb3RlOgo+Cj4gQW0gTWl0dHdvY2gsIDMxLiBBdWd1c3QgMjAyMiwgMTk6MjQ6NTgg
Q0VTVCBzY2hyaWViIEFuZHJldyBKb25lczoKPiA+IFdoZW4gY29tcGlsaW5nIHdpdGggdG9vbGNo
YWlucyB0aGF0IGhhdmVuJ3QgeWV0IGJlZW4gdGF1Z2h0IGFib3V0Cj4gPiBuZXcgaW5zdHJ1Y3Rp
b25zIHdlIG5lZWQgdG8gZW5jb2RlIHRoZW0gb3Vyc2VsdmVzLiBDcmVhdGUgYSBuZXcgZmlsZQo+
ID4gd2hlcmUgc3VwcG9ydCBmb3IgaW5zdHJ1Y3Rpb24gZGVmaW5pdGlvbnMgd2lsbCBldm9sdmUu
IFdlIGluaXRpYXRlCj4gPiB0aGUgZmlsZSB3aXRoIGEgbWFjcm8gY2FsbGVkIElOU05fUigpLCB3
aGljaCBpbXBsZW1lbnRzIHRoZSBSLXR5cGUKPiA+IGluc3RydWN0aW9uIGVuY29kaW5nLiBJTlNO
X1IoKSB3aWxsIHVzZSB0aGUgYXNzZW1ibGVyJ3MgLmluc24KPiA+IGRpcmVjdGl2ZSB3aGVuIGF2
YWlsYWJsZSwgd2hpY2ggc2hvdWxkIGdpdmUgdGhlIGFzc2VtYmxlciBhIGNoYW5jZQo+ID4gdG8g
ZG8gc29tZSB2YWxpZGF0aW9uLiBXaGVuIC5pbnNuIGlzIG5vdCBhdmFpbGFibGUgd2UgZmFsbCBi
YWNrIHRvCj4gPiBtYW51YWwgZW5jb2RpbmcuCj4gPgo+ID4gTm90IG9ubHkgc2hvdWxkIHVzaW5n
IGluc3RydWN0aW9uIGVuY29kaW5nIG1hY3JvcyBpbXByb3ZlIHJlYWRhYmlsaXR5Cj4gPiBhbmQg
bWFpbnRhaW5hYmlsaXR5IG9mIGNvZGUgb3ZlciB0aGUgYWx0ZXJuYXRpdmUgb2YgaW5zZXJ0aW5n
Cj4gPiBpbnN0cnVjdGlvbnMgZGlyZWN0bHkgKGUuZy4gJy53b3JkIDB4YzBkZScpLCBidXQgd2Ug
c2hvdWxkIGFsc28gZ2Fpbgo+ID4gcG90ZW50aWFsIGZvciBtb3JlIG9wdGltaXplZCBjb2RlIGFm
dGVyIGNvbXBpbGF0aW9uIGJlY2F1c2UgdGhlCj4gPiBjb21waWxlciB3aWxsIGhhdmUgY29udHJv
bCBvdmVyIHRoZSBpbnB1dCBhbmQgb3V0cHV0IHJlZ2lzdGVycyB1c2VkLgo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gPiBSZXZp
ZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KPiA+IC0tLQo+ID4gIGFy
Y2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgICB8ICAzICsrCj4gPiAgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9pbnNuLWRlZi5oIHwgODYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgODkgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2luc24tZGVmLmgKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiBpbmRleCBl
ZDY2YzMxZTQ2NTUuLmY4ZjNiMzE2YjgzOCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvS2Nv
bmZpZwo+ID4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiBAQCAtMjI3LDYgKzIyNyw5IEBA
IGNvbmZpZyBSSVNDVl9ETUFfTk9OQ09IRVJFTlQKPiA+ICAgICAgIHNlbGVjdCBBUkNIX0hBU19T
RVRVUF9ETUFfT1BTCj4gPiAgICAgICBzZWxlY3QgRE1BX0RJUkVDVF9SRU1BUAo+ID4KPiA+ICtj
b25maWcgQVNfSEFTX0lOU04KPiA+ICsgICAgIGRlZl9ib29sICQoYXMtaW5zdHIsLmluc24gciA1
MSQoY29tbWEpIDAkKGNvbW1hKSAwJChjb21tYSkgdDAkKGNvbW1hKSB0MCQoY29tbWEpIHplcm8p
Cj4gPiArCj4gPiAgc291cmNlICJhcmNoL3Jpc2N2L0tjb25maWcuc29jcyIKPiA+ICBzb3VyY2Ug
ImFyY2gvcmlzY3YvS2NvbmZpZy5lcnJhdGFzIgo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2luc24tZGVmLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2luc24t
ZGVmLmgKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjJk
Y2QxZDQ3ODFiZgo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9pbnNuLWRlZi5oCj4gPiBAQCAtMCwwICsxLDg2IEBACj4gPiArLyogU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSAqLwo+ID4gKwo+ID4gKyNpZm5kZWYgX19BU01fSU5T
Tl9ERUZfSAo+ID4gKyNkZWZpbmUgX19BU01fSU5TTl9ERUZfSAo+ID4gKwo+ID4gKyNpbmNsdWRl
IDxhc20vYXNtLmg+Cj4gPiArCj4gPiArI2RlZmluZSBJTlNOX1JfRlVOQzdfU0hJRlQgICAgICAg
ICAgIDI1Cj4gPiArI2RlZmluZSBJTlNOX1JfUlMyX1NISUZUICAgICAgICAgICAgIDIwCj4gPiAr
I2RlZmluZSBJTlNOX1JfUlMxX1NISUZUICAgICAgICAgICAgIDE1Cj4gPiArI2RlZmluZSBJTlNO
X1JfRlVOQzNfU0hJRlQgICAgICAgICAgIDEyCj4gPiArI2RlZmluZSBJTlNOX1JfUkRfU0hJRlQg
ICAgICAgICAgICAgICAgICAgICAgIDcKPiA+ICsjZGVmaW5lIElOU05fUl9PUENPREVfU0hJRlQg
ICAgICAgICAgIDAKPiA+ICsKPiA+ICsjaWZkZWYgX19BU1NFTUJMWV9fCj4gPiArCj4gPiArI2lm
ZGVmIENPTkZJR19BU19IQVNfSU5TTgo+ID4gKwo+ID4gKyAgICAgLm1hY3JvIGluc25fciwgb3Bj
b2RlLCBmdW5jMywgZnVuYzcsIHJkLCByczEsIHJzMgo+ID4gKyAgICAgLmluc24gICByIFxvcGNv
ZGUsIFxmdW5jMywgXGZ1bmM3LCBccmQsIFxyczEsIFxyczIKPiA+ICsgICAgIC5lbmRtCj4gPiAr
Cj4gPiArI2Vsc2UKPiA+ICsKPiA+ICsjaW5jbHVkZSA8YXNtL2dwci1udW0uaD4KPiA+ICsKPiA+
ICsgICAgIC5tYWNybyBpbnNuX3IsIG9wY29kZSwgZnVuYzMsIGZ1bmM3LCByZCwgcnMxLCByczIK
PiA+ICsgICAgIC40Ynl0ZSAgKChcb3Bjb2RlIDw8IElOU05fUl9PUENPREVfU0hJRlQpIHwgICAg
ICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICAgKFxmdW5jMyA8PCBJTlNOX1JfRlVOQzNfU0hJ
RlQpIHwgICAgICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAgICAoXGZ1bmM3IDw8IElOU05f
Ul9GVU5DN19TSElGVCkgfCAgICAgICAgICAgICAgIFwKPiA+ICsgICAgICAgICAgICAgICguTF9f
Z3ByX251bV9ccmQgPDwgSU5TTl9SX1JEX1NISUZUKSB8ICAgICAgICAgXAo+ID4gKyAgICAgICAg
ICAgICAgKC5MX19ncHJfbnVtX1xyczEgPDwgSU5TTl9SX1JTMV9TSElGVCkgfCAgICAgICBcCj4g
PiArICAgICAgICAgICAgICAoLkxfX2dwcl9udW1fXHJzMiA8PCBJTlNOX1JfUlMyX1NISUZUKSkK
PiA+ICsgICAgIC5lbmRtCj4gPiArCj4gPiArI2VuZGlmCj4gPiArCj4gPiArI2RlZmluZSBJTlNO
X1IoLi4uKSAgaW5zbl9yIF9fVkFfQVJHU19fCj4gPiArCj4gPiArI2Vsc2UgLyogISBfX0FTU0VN
QkxZX18gKi8KPiA+ICsKPiA+ICsjaWZkZWYgQ09ORklHX0FTX0hBU19JTlNOCj4gPiArCj4gPiAr
I2RlZmluZSBJTlNOX1Iob3Bjb2RlLCBmdW5jMywgZnVuYzcsIHJkLCByczEsIHJzMikgICBcCj4g
PiArICAgICAiLmluc24gIHIgIiBvcGNvZGUgIiwgIiBmdW5jMyAiLCAiIGZ1bmM3ICIsICIgcmQg
IiwgIiByczEgIiwgIiByczIgIlxuIgo+ID4gKwo+ID4gKyNlbHNlCj4gPiArCj4gPiArI2luY2x1
ZGUgPGxpbnV4L3N0cmluZ2lmeS5oPgo+ID4gKyNpbmNsdWRlIDxhc20vZ3ByLW51bS5oPgo+ID4g
Kwo+ID4gKyNkZWZpbmUgREVGSU5FX0lOU05fUiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgX19ERUZJTkVfQVNNX0dQUl9O
VU1TICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsiICAg
IC5tYWNybyBpbnNuX3IsIG9wY29kZSwgZnVuYzMsIGZ1bmM3LCByZCwgcnMxLCByczJcbiIgICAg
ICAgICAgICBcCj4gPiArIiAgICAuNGJ5dGUgICgoXFxvcGNvZGUgPDwgIiBfX3N0cmluZ2lmeShJ
TlNOX1JfT1BDT0RFX1NISUZUKSAiKSB8IiAgXAo+ID4gKyIgICAgICAgICAgICAgKFxcZnVuYzMg
PDwgIiBfX3N0cmluZ2lmeShJTlNOX1JfRlVOQzNfU0hJRlQpICIpIHwiICAgIFwKPiA+ICsiICAg
ICAgICAgICAgIChcXGZ1bmM3IDw8ICIgX19zdHJpbmdpZnkoSU5TTl9SX0ZVTkM3X1NISUZUKSAi
KSB8IiAgICBcCj4gPiArIiAgICAgICAgICAgICAoLkxfX2dwcl9udW1fXFxyZCA8PCAiIF9fc3Ry
aW5naWZ5KElOU05fUl9SRF9TSElGVCkgIikgfCIgICAgXAo+ID4gKyIgICAgICAgICAgICAgKC5M
X19ncHJfbnVtX1xccnMxIDw8ICIgX19zdHJpbmdpZnkoSU5TTl9SX1JTMV9TSElGVCkgIikgfCIg
IFwKPiA+ICsiICAgICAgICAgICAgICguTF9fZ3ByX251bV9cXHJzMiA8PCAiIF9fc3RyaW5naWZ5
KElOU05fUl9SUzJfU0hJRlQpICIpKVxuIiBcCj4gPiArIiAgICAuZW5kbVxuIgo+ID4gKwo+ID4g
KyNkZWZpbmUgVU5ERUZJTkVfSU5TTl9SICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyIgICAgLnB1cmdlbSBpbnNuX3JcbiIKPiA+ICsK
PiA+ICsjZGVmaW5lIElOU05fUihvcGNvZGUsIGZ1bmMzLCBmdW5jNywgcmQsIHJzMSwgcnMyKSAg
ICAgICAgICAgICAgICAgICBcCj4gPiArICAgICBERUZJTkVfSU5TTl9SICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgImluc25fciAi
IG9wY29kZSAiLCAiIGZ1bmMzICIsICIgZnVuYzcgIiwgIiByZCAiLCAiIHJzMSAiLCAiIHJzMiAi
XG4iIFwKPiA+ICsgICAgIFVOREVGSU5FX0lOU05fUgo+ID4gKwo+ID4gKyNlbmRpZgo+ID4gKwo+
ID4gKyNlbmRpZiAvKiAhIF9fQVNTRU1CTFlfXyAqLwo+ID4gKwo+ID4gKyNkZWZpbmUgT1BDT0RF
KHYpICAgIF9fQVNNX1NUUih2KQo+ID4gKyNkZWZpbmUgRlVOQzModikgICAgIF9fQVNNX1NUUih2
KQo+ID4gKyNkZWZpbmUgRlVOQzcodikgICAgIF9fQVNNX1NUUih2KQo+ID4gKyNkZWZpbmUgUkQo
dikgICAgICAgICAgICAgICAgX19BU01fU1RSKHYpCj4gPiArI2RlZmluZSBSUzEodikgICAgICAg
ICAgICAgICBfX0FTTV9TVFIodikKPiA+ICsjZGVmaW5lIFJTMih2KSAgICAgICAgICAgICAgIF9f
QVNNX1NUUih2KQo+Cj4geW91IG1pZ2h0IHdhbnQgc29tZSBzb3J0IG9mIHByZWZpeCBoZXJlCj4g
ICAgICAgICBSSVNDVl9SUzEodikgPwo+Cj4gV2hpbGUgdHJ5aW5nIHRvIGFkYXB0IHRoaXMgZm9y
IHRoZSBjbW8gc3R1ZmYgSSByYW4gaW50byB0aGUgaXNzdWUKPiBvZiBicGYgY29tcGxhaW5pbmcg
dGhhdCAiSU1NIiBpcyBhbHJlYWR5IGRlZmluZWQgdGhlcmUuCj4KPiBBbmQgbmFtZXMgYWJvdmUg
YXJlIGdlbmVyaWMgZW5vdWdoIHRoYXQgdGhlc2UgYWxzbwo+IG1pZ2h0IGNvbmZsaWN0IHdpdGgg
b3RoZXIgc3R1ZmYuCgpJIGNhbiB1cGRhdGUgdGhlIEtWTSBSSVNDLVYgcXVldWUgYnV0IEkgc3Vn
Z2VzdCB0bwp1c2UgYSBzbWFsbGVyIHByZWZpeC4gTWF5YmUgUlZfeHl6KCkgPwoKUmVnYXJkcywK
QW51cAoKPgo+Cj4KPgo+ID4gKyNkZWZpbmUgX19SRUcodikgICAgIF9fQVNNX1NUUih4ICMjIHYp
Cj4gPiArI2RlZmluZSBfX1JEKHYpICAgICAgICAgICAgICBfX1JFRyh2KQo+ID4gKyNkZWZpbmUg
X19SUzEodikgICAgIF9fUkVHKHYpCj4gPiArI2RlZmluZSBfX1JTMih2KSAgICAgX19SRUcodikK
PiA+ICsKPiA+ICsjZW5kaWYgLyogX19BU01fSU5TTl9ERUZfSCAqLwo+ID4KPgo+Cj4KPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
