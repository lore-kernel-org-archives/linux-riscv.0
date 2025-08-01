Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF76C87FCB
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Aug 2025 08:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HEcWBCZU6rQI62HJyU5k0iQYWAFZYLTGPsLsmkT6hCo=; b=gkDefBGo2QOnHD
	SB/2c6FzH/q2jCM7cIz0FVTsHaBMnO/s1otFH+Q0L/6IvllukXBsZyOUdV1xKaLMl7Qkhgz6h/w9x
	fxsfROMLBZnKrioIA5XvwmrdGvH45Mi9QDtsvo8TfmKdoxxFc96xl+Ipk29mrJZr3xpcTERy8IjWW
	NXObXHw4cPraf1h/z0YVTgIcunPzfsYB2Xtl58XhEkhjvmNuGPcNfiOui1xCr15xDqR2FN6mhQiqo
	SrnxNSx3w6rcc/Oz/q2PHbaSPqAM+lihZWzoF0T+XikLaBNiGmMSqgNdr1NRAJfN5VE3KciSintVA
	1aihMiLARk7G3kndxTYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhlRb-00000005Hs2-2V0H;
	Fri, 01 Aug 2025 08:48:51 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhlMw-00000005HA6-0UOe
	for linux-riscv@lists.infradead.org;
	Fri, 01 Aug 2025 08:44:03 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-88109d54abdso46712439f.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Aug 2025 01:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1754037841; x=1754642641; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLyL9cAx6BfgxcO7E+1dWaZ7Plp09nvga7blXTlglSc=;
        b=HX7hskwtMsXjNl9r0tYyHsPthkNDqCLShvSzPaNWU2gzi2Q0iM91QcSldh+gQFSZYo
         nHuo3B2+HVjrJHAWFK533t9WFmyoRATnVn/KpXckI928aApYrggFLBkH7Mfu1x3JXHXK
         MOR08O2bCprwC2ma8IjEnUzTFhpHr8nxda+X+SLGeWBQ9tlJsPJh5ca9dCyx1JjzOWEJ
         HlJV5ZhzifgFbrIhvDnBbMThXR5nlC53Z+gxiSIKZvodLUXQqBDr9o8WDYZhSou6YlCp
         +xASHbYc9CZrpwCYJJUrGGVr5roNRIqUkBC8Owpm7W8lM08yRI4IWzbQ6tB4zRiLq7Om
         lOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754037841; x=1754642641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLyL9cAx6BfgxcO7E+1dWaZ7Plp09nvga7blXTlglSc=;
        b=hMrNidoQMkAweOGdFz3flB9SQ0Bs5a8rmht+0jOWCB4ocsPbJ6CYGY/LH6g2BxOfvO
         XqfqNP+KAtx2XTwi1mcPokioZ2+GpDS7diDAvL/YpHPEjsSGmLWdSZVzf8lVClBQxQ6v
         vD0j9xgPtGZvejDvBhU5LyG7KCaf59kH28MRoRu5WGQEv1UaYATPysAWYVf4ZfNaBFZd
         yNMTll4aCt7lY5BeK3npQ5tcfdM06AP1TGPGukVe3ZrH3yHDhYXzybkIyYG3bwHTnrWW
         ++2uamfNGUFwRUlU+5t4uKjWrw580lkO2/HqZpaLthTd2LBg91Tr+09noUtotKyjPCXg
         66Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVE2NWonV4QXhOgiqTcvnd0x6ZeocsD3lstcVVT5mjLYNm1bnmv6UCzhAAKFbFf0JHD37ufX3SRr/EODQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzNrU9bmReHoNyl+xdusff/KUDVipsEs68luOZypV2vnQCDTW8
	5XWJAqHa52NT87Zps3ayVxluQyTCuWX1/z9Cw/kmGi+VTqbs/NHQdR5vslE3fqsjWxAw2fC8ZxE
	RhPZYZYJZNgBG5M6PtI6WbfIMlnL8jhekVKCyaiga3Q==
X-Gm-Gg: ASbGncvc+6M+33RnGJCDJFWPUY8zitOyTzUvkHZsWA24tlPt/jQb2Ujhz2ucKaBSMq9
	RWKL7abhVU28lkhqbC3kjNAdzjaqEfWIuwzusvYehLQEO9JWklCZkFMnD4we0XF+jLG3QaogOQL
	+OlmZJ90KO47ye33mybmkiBSVz4OzSUD7/dMZ88oVsH0zHgsz77v/zbQPMWL/11esANBawP/Gmm
	R8RpaJSOpXROi8=
X-Google-Smtp-Source: AGHT+IHmDGSj8nBVu2UdqL0jDDjl4m5SMVZpNB5EGI45FpC4Q2VdKsJNxym9Ty834wUMcEEJgUTipp1SECn/mOC0qB8=
X-Received: by 2002:a92:d447:0:b0:3e2:9eac:dc01 with SMTP id
 e9e14a558f8ab-3e3f628ea39mr174094325ab.18.1754037840628; Fri, 01 Aug 2025
 01:44:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
 <20250704070356.1683992-9-apatel@ventanamicro.com> <175341132347.3513.7184287611040628050@lazor>
 <CAK9=C2UDV3xCpKxZmT4NsRvN=hCcQrcx0fr-QFD2fuOrqmXmHA@mail.gmail.com>
 <175359739515.3513.8664828076215459722@lazor> <CAK9=C2WRVHZ4FdoW0fKRRFg6qAC5asn03dHj_NXkMKfBXKkXdA@mail.gmail.com>
 <175398062959.3513.15195554063633980579@lazor>
In-Reply-To: <175398062959.3513.15195554063633980579@lazor>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 1 Aug 2025 14:13:49 +0530
X-Gm-Features: Ac12FXz23n5I2gUDW1GUPhVBv6qqLgn5liXl8qbTORMXLg42e8K813D_AmSmA3A
Message-ID: <CAAhSdy31yTWn2zXO+rVH0ziQ9YSc-tMV4g65Wso+3s=p_h2cGA@mail.gmail.com>
Subject: Re: [PATCH v8 08/24] dt-bindings: clock: Add RPMI clock service
 message proxy bindings
To: Stephen Boyd <sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_014402_271200_FE530735 
X-CRM114-Status: GOOD (  18.31  )
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
Cc: linux-acp <i@vger.kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Conor Dooley <conor.dooley@microchip.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Rahul Pathak <rpathak@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdWwgMzEsIDIwMjUgYXQgMTA6MjDigK9QTSBTdGVwaGVuIEJveWQgPHNib3lkQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gUXVvdGluZyBBbnVwIFBhdGVsICgyMDI1LTA3LTI4IDAyOjE5
OjIzKQo+ID4gT24gU3VuLCBKdWwgMjcsIDIwMjUgYXQgMTE6NTPigK9BTSBTdGVwaGVuIEJveWQg
PHNib3lkQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBJdCdzIG5vdCBwcm92aWRpbmcg
Y2xrcz8gVGhlIFNCSSBmaXJtd2FyZSBpcyBub3QgZGlzY292ZXJhYmxlPyBEbyB5b3UKPiA+ID4g
aGF2ZSBhIHBvaW50ZXIgdG8gdGhlIERUUyBmb3IgdGhpcyBub2RlIGFuZCB0aGUgY2xvY2sgY29u
dHJvbGxlciBub2RlIGluCj4gPiA+IHRoZSBuZXh0IHBhdGNoPyBJJ2QgbGlrZSB0byB1bmRlcnN0
YW5kIHdoeSB0aGlzIGlzIG5hbWVkIGEgY2xvY2sKPiA+ID4gY29udHJvbGxlciB3aGVuIGl0IGRv
ZXNuJ3QgcHJvdmlkZSBjbGtzLgo+ID4KPiA+IFRoZSBmaXJtd2FyZSBkcml2ZXIgaXMgbm90IHBy
b3ZpZGluZyBjbGtzLiBBbHNvLCB0aGUgU0JJIGZpcm13YXJlIGFuZAo+ID4gdmFyaW91cyBTQkkg
ZXh0ZW5zaW9ucyBhcmUgaW5kZWVkIGRpc2NvdmVyYWJsZSBmcm9tIHN1cGVydmlzb3Igc29mdHdh
cmUuCj4KPiBJZiBTQkkgZXh0ZW5zaW9ucyBhcmUgZGlzY292ZXJhYmxlIGZyb20gc29mdHdhcmUg
d2h5IGRvIHdlIG5lZWQgYSBEVAo+IGJpbmRpbmc/CgpUaGUgZmlybXdhcmUgd2hpY2ggaW1wbGVt
ZW50cyB0aGUgU0JJIE1QWFkgY2hhbm5lbCBuZWVkcyB0bwpkaXNjb3ZlciB0aGUgdW5kZXJseWlu
ZyBSUE1JIHNlcnZpY2UgZ3JvdXAgZnJvbSBEVC4KCkxldCdzIHNheSB3ZSBoYXZlIG9ubHkgb25l
IFJQTUkgc2hhcmVkIG1lbW9yeSB0cmFuc3BvcnQgYmV0d2VlbgphcHBsaWNhdGlvbiBwcm9jZXNz
b3JzIGFuZCBwbGF0Zm9ybSBtaWNyb2NvbnRyb2xsZXIuIFRoaXMgUlBNSSB0cmFuc3BvcnQKd2ls
bCBiZSBzaGFyZWQgYmV0d2VlbiBNLW1vZGUgZmlybXdhcmUgKE9wZW5TQkkpIGFuZCBTLW1vZGUg
KExpbnV4KS4KClRoZSBPcGVuU0JJIHdpbGwgdXNlIHRoZSBmb2xsb3dpbmcgZXhhbXBsZSBEVCBu
b2RlcyB0byBwcm9iZSB0aGUKbWFpbGJveCBkcml2ZXIgYW5kIE1QWFkgZHJpdmVyIHRvIGV4cG9z
ZSBNUFhZIGNoYW5uZWwgdG8gUy1tb2RlLgoKbWI6IG1haWxib3hAMTAwODAwMDAgewogICAgY29t
cGF0aWJsZSA9ICJyaXNjdixycG1pLXNobWVtLW1ib3giOwogICAgcmVnID0gPDB4MDAgMHgxMDA4
MDAwMCAweDAwIDB4MTAwMDA+LAogICAgICAgICA8MHgwMCAweDEwMDkwMDAwIDB4MDAgMHgxMDAw
MD4sCiAgICAgICAgIDwweDAwIDB4MTAwYTAwMDAgMHgwMCAweDEwMDAwPjsKICAgIHJlZy1uYW1l
cyA9ICJhMnAtcmVxIiwgInAyYS1hY2siLCAiYTJwLWRvb3JiZWxsIjsKICAgICNtYm94LWNlbGxz
ID0gPDB4MDE+OwogICAgcmlzY3Ysc2xvdC1zaXplID0gPDB4NDA+OwogICAgcmlzY3YscDJhLWRv
b3JiZWxsLXN5c21zaS1pbmRleCA9IDwzPjsKfTsKCmNsb2NrLXNlcnZpY2UgewogICAgY29tcGF0
aWJsZSA9ICJyaXNjdixycG1pLW1weHktY2xvY2siOwogICAgbWJveGVzID0gPCZtYiAweDA4PjsK
ICAgIHJpc2N2LHNiaS1tcHh5LWNoYW5uZWwtaWQgPSA8MHgxMDAxPjsKfTsKCkJhc2VkIG9uIHRo
ZSBhYm92ZSwgTGludXggd2lsbCB1c2UgdGhlIGZvbGxvd2luZyBleGFtcGxlIERUIG5vZGVzCnRv
IHByb2JlIHRoZSBMaW51eCBNUFhZIG1haWxib3ggZHJpdmVyIGFuZCBSUE1JIGNsb2NrIGRyaXZl
ci4KCm1weHlfbWJveDogc2JpLW1weHktbWJveCB7CiAgICBjb21wYXRpYmxlID0gInJpc2N2LHNi
aS1tcHh5LW1ib3giOwogICAgI21ib3gtY2VsbHMgPSA8Mj47CiAgICBtc2ktcGFyZW50ID0gPCZp
bXNpY19zbGV2ZWw+Owp9OwoKcnBtaS1jbGsgewogICAgY29tcGF0aWJsZSA9ICJyaXNjdixycG1p
LWNsb2NrIjsKICAgICNjbG9jay1jZWxscyA9IDwxPjsKICAgIG1ib3hlcyA9IDwmbXB4eV9tYm94
IDB4MTAwMSAweDA+Owp9OwoKSSBob3BlIHRoZSBhYm92ZSBleGFtcGxlIERUIG5vZGUgcHJvdmlk
ZXMgYSBiZXR0ZXIgcGljdHVyZQphYm91dCBob3cgRFQgYmluZGluZ3MgYXJlIHVzZWQgaW4gZmly
bXdhcmUgYW5kIExpbnV4LgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
