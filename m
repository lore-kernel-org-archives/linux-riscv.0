Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96109C76196
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 08:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ISDHqNEu071zpWuS+Clio04h16M7+rt/3VzoBok4lUs=; b=D0OyLwrLKq9hj3
	fWfxpVWcNQbW4sAgVb03C04oKzuDAxysoFeamd/1gEXG4I+myj/nLdgl5CEIHvo6tZe19j0KGEiCw
	yqdRQwu4sWdYhZ7wuDW18PBC5pbLSd0wkErpHhffvBiiACvkxgm9I8NOs7dnPdXsVhooPU7xSN/hn
	Nw4Z5JH3hopfd91ATEqdkHbhrNhdssbV32UZYEa0/oX4wHnj7FHO4dV1HG1HEEz8zb3o4AUnyRxN4
	Rgmq2N3ix44xz2KYSXON2r68GaBHN/3CpW8JVgvSFHrRn02iD0EMRfX4esweOY++RsnDf1Ise7fvv
	76W9sJ8+VUj9OmMx6lpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9hy-00GxhY-3B;
	Tue, 11 Apr 2023 08:50:34 +0000
Received: from mail-yw1-f175.google.com ([209.85.128.175])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9hv-00Gxg5-1R;
	Tue, 11 Apr 2023 08:50:32 +0000
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-54c17fa9ae8so244680037b3.5;
        Tue, 11 Apr 2023 01:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681203028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2XsMmfYvpqHWFGERwzpiHyCVbGoq54hxk7fbEhr0Ujk=;
        b=4liAZUgE962xquVPBcYrMmqEtNuQLjTlLIR2EoS6VYL57LebouVXnk2n1qibI35Iey
         RtiH2vvuBQqQ00sbGY5XkPCeGPwXQBLvGs3K0hDA0hX5Ur/Y/f0bJduBsAtaN6OXLcSX
         pNvytTqyG0gsUfneBQz5/NkNNInDjHWBr5frjKWrH3W/ufuhQ8V3xAm74gVF2pgyjdcO
         FkPz6eSN32211bsJWc4oifiKD7M8qAXGmJlOUhrKOuWJarmJCRUWpgd+5W8o0d3rgGuB
         eCicntbVcVKmA7GlPXIS1Jkznqvb1EOihp8AOI61MHW7tInIKZoLWwGp5+rjFqbVRlzz
         MZ2g==
X-Gm-Message-State: AAQBX9eNLbj9z5fDbgHexENbVr9O903FDmSZ8aNVg/H3SIcsPY4NcLZd
	BrKzQxiF/c1YA20p2n8yFOpvI2oqm619ew==
X-Google-Smtp-Source: AKy350bk9iPVQ6T43YkJK4vxkHevY6Kx4QZ7dib5qY6N0f6CoyvECM21rdch4y17xT4+o4QqldVt7g==
X-Received: by 2002:a81:6c7:0:b0:54c:8fa:9351 with SMTP id 190-20020a8106c7000000b0054c08fa9351mr11354954ywg.11.1681203028011;
        Tue, 11 Apr 2023 01:50:28 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id n124-20020a0dcb82000000b00545a0818493sm3355611ywd.35.2023.04.11.01.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 01:50:26 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-54ee17a659bso146807857b3.4;
        Tue, 11 Apr 2023 01:50:25 -0700 (PDT)
X-Received: by 2002:a81:bc08:0:b0:54e:e490:d190 with SMTP id
 a8-20020a81bc08000000b0054ee490d190mr1268334ywi.4.1681203004780; Tue, 11 Apr
 2023 01:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230323163354.1454196-1-schnelle@linux.ibm.com>
 <248a41a536d5a3c9e81e8e865b34c5bf74cd36d4.camel@linux.ibm.com>
 <B1EC1AC7-6BB5-4B66-B171-24687C3CBFB3@zytor.com> <d8686aaf-f12e-446b-9a80-335bb4266a4d@app.fastmail.com>
 <ccff565cde1440b8bff92d96f94a32b5@AcuMS.aculab.com>
In-Reply-To: <ccff565cde1440b8bff92d96f94a32b5@AcuMS.aculab.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Apr 2023 10:49:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWe+U3yOOfy+z19apZaT0q7WhrR2beR=t0Jkbd3ODYbyw@mail.gmail.com>
Message-ID: <CAMuHMdWe+U3yOOfy+z19apZaT0q7WhrR2beR=t0Jkbd3ODYbyw@mail.gmail.com>
Subject: Re: [PATCH v4] Kconfig: introduce HAS_IOPORT option and select it as necessary
To: David Laight <David.Laight@aculab.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "H. Peter Anvin" <hpa@zytor.com>, 
	Niklas Schnelle <schnelle@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Yoshinori Sato <ysato@users.osdn.me>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S . Miller" <davem@davemloft.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"linux-m68k@vger.kernel.org" <linux-m68k@vger.kernel.org>, 
	"linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Linux-Arch <linux-arch@vger.kernel.org>, 
	"linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@kernel.org>, 
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, Johannes Berg <johannes@sipsolutions.net>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_015031_490040_27B39CA9 
X-CRM114-Status: GOOD (  34.63  )
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

SGkgRGF2aWQsCgpPbiBXZWQsIEFwciA1LCAyMDIzIGF0IDExOjM34oCvUE0gRGF2aWQgTGFpZ2h0
IDxEYXZpZC5MYWlnaHRAYWN1bGFiLmNvbT4gd3JvdGU6Cj4gRnJvbTogTGludXhwcGMtZGV2IEFy
bmQgQmVyZ21hbm4KPiA+IFNlbnQ6IDA1IEFwcmlsIDIwMjMgMjE6MzIKPiA+Cj4gPiBPbiBXZWQs
IEFwciA1LCAyMDIzLCBhdCAyMjowMCwgSC4gUGV0ZXIgQW52aW4gd3JvdGU6Cj4gPiA+IE9uIEFw
cmlsIDUsIDIwMjMgODoxMjozOCBBTSBQRFQsIE5pa2xhcyBTY2huZWxsZSA8c2NobmVsbGVAbGlu
dXguaWJtLmNvbT4gd3JvdGU6Cj4gPiA+Pk9uIFRodSwgMjAyMy0wMy0yMyBhdCAxNzozMyArMDEw
MCwgTmlrbGFzIFNjaG5lbGxlIHdyb3RlOgo+ID4gPj4+IFdlIGludHJvZHVjZSBhIG5ldyBIQVNf
SU9QT1JUIEtjb25maWcgb3B0aW9uIHRvIGluZGljYXRlIHN1cHBvcnQgZm9yIEkvTwo+ID4gPj4+
IFBvcnQgYWNjZXNzLiBJbiBhIGZ1dHVyZSBwYXRjaCBIQVNfSU9QT1JUPW4gd2lsbCBkaXNhYmxl
IGNvbXBpbGF0aW9uIG9mCj4gPiA+Pj4gdGhlIEkvTyBhY2Nlc3NvciBmdW5jdGlvbnMgaW5iKCkv
b3V0YigpIGFuZCBmcmllbmRzIG9uIGFyY2hpdGVjdHVyZXMKPiA+ID4+PiB3aGljaCBjYW4gbm90
IG1lYW5pbmdmdWxseSBzdXBwb3J0IGxlZ2FjeSBJL08gc3BhY2VzIHN1Y2ggYXMgczM5MC4KPiA+
ID4+PiA+Pgo+ID4gPj5HZW50bGUgcGluZy4gQXMgZmFyIGFzIEkgY2FuIHRlbGwgdGhpcyBoYXNu
J3QgYmVlbiBwaWNrZWQgdG8gYW55IHRyZWUKPiA+ID4+c3AgZmFyIGJ1dCBhbHNvIGhhc24ndCBz
ZWVuIGNvbXBsYWlucyBzbyBJJ20gd29uZGVyaW5nIGlmIEkgc2hvdWxkIHNlbmQKPiA+ID4+YSBu
ZXcgdmVyc2lvbiBvZiB0aGUgY29tYmluZWQgc2VyaWVzIG9mIHRoaXMgcGF0Y2ggcGx1cyB0aGUg
YWRkZWQKPiA+ID4+SEFTX0lPUE9SVCBkZXBlbmRlbmNpZXMgcGVyIHN1YnN5c3RlbSBvciB3YWl0
IHVudGlsIHRoaXMgaXMgcGlja2VkIHVwLgo+ID4gPgo+ID4gPiBZb3UgbmVlZCB0aGlzIG9uIGEg
c3lzdGVtIHN1cHBvcnRpbmcgbm90IGp1c3QgSVNBIGJ1dCBhbHNvIFBDSS4KPiA+ID4KPiA+ID4g
VHlwaWNhbGx5IG9uIG5vbi14ODYgYXJjaGl0ZWN0dXJlcyB0aGlzIGlzIHNpbXBseSBtYXBwZWQg
aW50byBhIG1lbW9yeSB3aW5kb3cuCj4gPgo+ID4gSSdtIHByZXR0eSBjb25maWRlbnQgdGhhdCB0
aGUgbGlzdCBpcyBjb3JyZWN0IGhlcmUsIGFzIHRoZSBIQVNfSU9QT1JUCj4gPiBzeW1ib2wgaXMg
ZW5hYmxlZCBleGFjdGx5IGZvciB0aGUgYXJjaGl0ZWN0dXJlcyB0aGF0IGhhdmUgYSB3YXkgdG8K
PiA+IG1hcCB0aGUgSS9PIHNwYWNlLiBQQ0llIGdlbmVyYWxseSB3b3JrcyBmaW5lIHdpdGhvdXQg
SS9PIHNwYWNlLCB0aGUKPiA+IG9ubHkgZXhjZXB0aW9uIGFyZSBkcml2ZXJzIGZvciBkZXZpY2Vz
IHRoYXQgd2VyZSBhcm91bmQgYXMgZWFybHkgUENJLgo+Cj4gSXNuJ3QgdGhlcmUgYSBkaWZmZXJl
bmNlIGJldHdlZW4gY3B1IHRoYXQgaGF2ZSBpbmIoKS9vdXRiKCkgKHByb2JhYmx5Cj4gb25seSB4
ODY/KSBhbmQgYXJjaGl0ZWN0dXJlcyAod2VsbCBjb21wdXRlciBkZXNpZ25zKSB0aGF0IGNhbiBn
ZW5lcmF0ZQo+IFBDSSAnSS9PJyBjeWNsZXMgYnkgc29tZSBtZWFucy4KPiBJdCBpc24ndCBldmVu
IGp1c3QgUENJIEkvTyBjeWNsZXMsIEkndmUgdXNlZCBhbiBBUk0gY3B1IChTQTExMDApCj4gdGhh
dCBtYXBwZWQgYSBjaHVjayBvZiBwaHlzaWNhbCBhZGRyZXNzIHNwYWNlIG9udG8gUENNQ0lBIEkv
TyBjeWNsZXMuCj4KPiBJZiB0aGUgaGFyZHdhcmUgY2FuIG1hcCBhIFBDSSAnSU8nIGJhciBpbnRv
IG5vcm1hbCBrZXJuZWwgYWRkcmVzcwo+IHNwYWNlIHRoZW4gdGhlIGJhciBhbmQgYWNjZXNzZXMg
Y2FuIGJlIHRyZWF0ZWQgZXhhY3RseSBsaWtlIGEgbWVtb3J5IGJhci4KPiBUaGlzIHByb2JhYmx5
IGxlYXZlcyB4ODYgYXMgdGhlIG91dGxpZXIgd2hlcmUgeW91IG5lZWQgKElJUkMpIGlvX3JlYWRs
KCkKPiBhbmQgZnJpZW5kcyB0aGF0IGNhbiBnZW5lcmF0ZSBpbi9vdXQgaW5zdHJ1Y3Rpb25zIGZv
ciB0aG9zZSBhY2Nlc3Nlcy4KPgo+IFRoZXJlIGFyZSBhbHNvIGFsbCB0aGUgeDg2IElTQSBkZXZp
Y2VzIHdoaWNoIG5lZWQgaW4vb3V0IGluc3RydWN0aW9ucy4KPiBCdXQgKHdpdGggdGhlIGxpa2Vs
eSBleGNlcHRpb24gb2YgdGhlIFVBUlQpIHRoZXkgYXJlIHByZXR0eSBtdWNoCj4gcGxhdGZvcm0g
c3BlY2lmaWMuCj4KPiBTbywgdG8gbXkgbWluZCBhdCBsZWFzdCwgSEFTX0lPUE9SVCBpcyBqdXN0
IHRoZSB3cm9uZyBxdWVzdGlvbi4KCk5vdCBhbGwgUENJIGNvbnRyb2xsZXJzIHN1cHBvcnQgbWFw
cGluZyB0aGUgSS9PIGJhciBpbiBNTUlPIHNwYWNlLCBzbwppbiBnZW5lcmFsIHlvdSBjYW5ub3Qg
c2F5IHRoYXQgQ09ORklHX1BDST15IG1lYW5zIENPTkZJR19IQVNfSU9QT1JUPXkuCgpHcntvZXRq
ZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0
dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBs
aW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBw
ZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpv
dXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQu
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
