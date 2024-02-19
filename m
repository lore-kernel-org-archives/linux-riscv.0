Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC75CC54764
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Feb 2024 09:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RnEnIAqDLoErZX7V/GjTjGp9Pa5m6PzXLTs2RIBzy4A=; b=pLjwGUAK4GwGsW
	TVOfemg5LqNw5OlYI0IfDeKHEXQ89MdmZqoekttJqncrdlOP8WLCjAezYh2zum3ShW6f3cz5pDz8j
	hEwO3SxFnCNEw6N28VQKLdcupml1NPbe/UfFAyQnDRy9LllqFNIhXvvWcHnyob2cTA72GqyiG3jyl
	xVF+z9V2WCbU4bvwS4csnZnnV/CgJTTGwbveeCIIBcCdlH+K8P37zofdHWieA1bROJZFC9QATn1IY
	N0y/sV9dOmaE0OW2BWnYG+LD8s1JSFSdN67kb3PM28/UQ79LU3jJGdwvjlvXp+ppptbPtrbpl94R7
	j7jCkNIIliZUoS5veXmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc0Dj-00000009t31-1rWG;
	Mon, 19 Feb 2024 09:45:55 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc0Dg-00000009t1N-0Kj4
	for linux-riscv@lists.infradead.org;
	Mon, 19 Feb 2024 09:45:53 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2d228a132acso24734521fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 01:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708335949; x=1708940749; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=naVcereUeVbO3/kpmJac5B2YT7rfwRkVivtJPUxX/Ps=;
        b=FnUSEo0EwR9eLeiZLko9C0mr0ZPN5yXuxdbZulDZ76Ma29eNiHnMONYxTRkgWeh7me
         wI/RJ8XX6wMYXSEIsgGqdPbhF3W4vpg2neAHoD0Z5YFX/ASjhILrDoGmYYedt7mz9A0d
         X4d4hRkUlF2fIGl1Gati5WXZIcDZ6H9N1Rivc3uPD1GtsFECLybbzkHgKrIRg3iAESlU
         w3EcUG6e847ce2KGZSwHwJDeMUSTMa/OnhGQFk3jW41tgdos9yTkHXRAuiBIuDMOgBJy
         vegjeeO4oSG7t8FW5764+8Lzo+2u57aFPWehhEmiTFCk+TTRtl8x6U+3faPpihajyCzp
         3iNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708335949; x=1708940749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=naVcereUeVbO3/kpmJac5B2YT7rfwRkVivtJPUxX/Ps=;
        b=Kpnwj0SjMJUqGyeVHlB/G2RjN04X4cgD1BwibGOVpsmN5sK8bnfGAmmu4fQk0o7uT/
         5xc7ktDD5OTHmzb+Zm9sGLWx8ldmurqMB2UNJcrWZQJzDgO9FwMuVY1yonEd3BUAbXyn
         dy+yUYLdn9xNQaTgCjIlKGFuxuJ0EPZCtlVVEiFSqHYWsUEfjGvDDYJgB0m2U3Gv3t0d
         CsgI44icT/SoCVj5C25oZ+0oHwwXeFK4/4dajqOTxW2uuXENyCelPYYp7xIEaoesJDE5
         IZd1/EBDqpuijPXWTbbI9RV16GqGLFXAr3KaIx76UhurM09ySlSxQbyestIF1Lwatfxv
         XUKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn2AOZASHki5MqPmGeq2gd6l7U4cWOm7VDvvubC8d1VTABVZd1RmSvW+IcafFVVxm2VJDMYOK1tAwfB83Z9cS4+4Ocwy5/exfvWBOtPJjk
X-Gm-Message-State: AOJu0YxokTm0+uu7VQoQDt5Ha3IxSiDFCEV3/g0i5sZf5tD32LdEShlM
	biqsYQuK7rbCBprJTkuuEgiN/xG+osjMrfvs/ybGhxvNem+a71rMuneXZlCy6DyAbRFFAnTUzVW
	qQdobkolNPajJDFnnnNgZ6vh/X4Wak7bjR0vEfQ==
X-Google-Smtp-Source: AGHT+IGAijWJ2t6HYaGF6pJu0Y9VzBy2gwT9CAw6PjDoQnuVNOtC7X4VHfZDfslwVbPV/P3tZbkNIq5o09aA55e5Vhc=
X-Received: by 2002:a2e:a49a:0:b0:2d2:4315:4d8b with SMTP id
 h26-20020a2ea49a000000b002d243154d8bmr194214lji.2.1708335949088; Mon, 19 Feb
 2024 01:45:49 -0800 (PST)
MIME-Version: 1.0
References: <20240127161753.114685-1-apatel@ventanamicro.com>
 <20240127161753.114685-24-apatel@ventanamicro.com> <8734tsce9o.ffs@tglx>
In-Reply-To: <8734tsce9o.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 19 Feb 2024 15:15:37 +0530
Message-ID: <CAK9=C2Vf63ZcETD-ja33tK11XARz+y5hg1dqjGP-bZTW-XNWHg@mail.gmail.com>
Subject: Re: [PATCH v12 23/25] irqchip/riscv-aplic: Add support for MSI-mode
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_014552_149588_467E3099 
X-CRM114-Status: GOOD (  13.92  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBGZWIgMTcsIDIwMjQgYXQgMjozNOKAr0FNIFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIFNhdCwgSmFuIDI3IDIwMjQgYXQgMjE6NDcsIEFu
dXAgUGF0ZWwgd3JvdGU6Cj4gPiBXZSBleHRlbmQgdGhlIGV4aXN0aW5nIEFQTElDIGlycWNoaXAg
ZHJpdmVyIHRvIHN1cHBvcnQgTVNJLW1vZGUgZm9yCj4gPiBSSVNDLVYgcGxhdGZvcm1zIGhhdmlu
ZyBib3RoIHdpcmVkIGludGVycnVwdHMgYW5kIE1TSXMuCj4KPiBXZT8gSnVzdCBzL1dlLy8KCk9r
YXksIEkgd2lsbCB1cGRhdGUuCgo+Cj4gPiArCj4gPiArc3RhdGljIHZvaWQgYXBsaWNfbXNpX2ly
cV91bm1hc2soc3RydWN0IGlycV9kYXRhICpkKQo+ID4gK3sKPiA+ICsgICAgIGFwbGljX2lycV91
bm1hc2soZCk7Cj4gPiArICAgICBpcnFfY2hpcF91bm1hc2tfcGFyZW50KGQpOwo+ID4gK30KPiA+
ICsKPiA+ICtzdGF0aWMgdm9pZCBhcGxpY19tc2lfaXJxX21hc2soc3RydWN0IGlycV9kYXRhICpk
KQo+ID4gK3sKPiA+ICsgICAgIGFwbGljX2lycV9tYXNrKGQpOwo+ID4gKyAgICAgaXJxX2NoaXBf
bWFza19wYXJlbnQoZCk7Cj4gPiArfQo+Cj4gQWdhaW4gYXN5bW1ldHJpYyB2cy4gdW5tYXNrKCkK
Ck9rYXksIEkgd2lsbCB1cGRhdGUuCgo+Cj4gPiArc3RhdGljIHZvaWQgYXBsaWNfbXNpX2lycV9l
b2koc3RydWN0IGlycV9kYXRhICpkKQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCBhcGxpY19wcml2
ICpwcml2ID0gaXJxX2RhdGFfZ2V0X2lycV9jaGlwX2RhdGEoZCk7Cj4gPiArICAgICB1MzIgcmVn
X29mZiwgcmVnX21hc2s7Cj4gPiArCj4gPiArICAgICAvKgo+ID4gKyAgICAgICogRU9JIGhhbmRs
aW5nIG9ubHkgcmVxdWlyZWQgb25seSBmb3IgbGV2ZWwtdHJpZ2dlcmVkCj4gPiArICAgICAgKiBp
bnRlcnJ1cHRzIGluIEFQTElDIE1TSSBtb2RlLgo+ID4gKyAgICAgICovCj4gPiArCj4gPiArICAg
ICByZWdfb2ZmID0gQVBMSUNfQ0xSSVBfQkFTRSArICgoZC0+aHdpcnEgLyBBUExJQ19JUlFCSVRT
X1BFUl9SRUcpICogNCk7Cj4gPiArICAgICByZWdfbWFzayA9IEJJVChkLT5od2lycSAlIEFQTElD
X0lSUUJJVFNfUEVSX1JFRyk7Cj4gPiArICAgICBzd2l0Y2ggKGlycWRfZ2V0X3RyaWdnZXJfdHlw
ZShkKSkgewo+ID4gKyAgICAgY2FzZSBJUlFfVFlQRV9MRVZFTF9MT1c6Cj4gPiArICAgICAgICAg
ICAgIGlmICghKHJlYWRsKHByaXYtPnJlZ3MgKyByZWdfb2ZmKSAmIHJlZ19tYXNrKSkKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICB3cml0ZWwoZC0+aHdpcnEsIHByaXYtPnJlZ3MgKyBBUExJQ19T
RVRJUE5VTV9MRSk7Cj4KPiBBIGNvbW1lbnQgd2hhdCB0aGlzIGNvbmRpdGlvbiBpcyBmb3Igd291
bGQgYmUgbmljZS4KCk9rYXksIEkgd2lsbCBhZGQgYSBjb21tZW50IGFib3V0IHRoZSBjb25kaXRp
b24uCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
