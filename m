Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E6BC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 31 May 2022 19:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hphPQhFNPNGNpAH4sFpcBFj67D3mpxTDUKHR3l3e4NI=; b=24bsUQXv0R/F9i
	+Huqo68migLMaYyxsRTiISA9aKsnYISZHmtbhr8M2vl8r2IYZ2rcaUQvFu1q4xAO1MRjYto0T2Odj
	rPiz8CYJj29MJJwJibvGss2XbRBH3ZP4sfpXpVYM6ZAgLYKGjpv9VYxvmFPvqwa4Dr//070k2G+vl
	duWLKg3sKo4aAgLJWoAd3RsXzMvL3UsYOC9rc/oEcxOeNp4bbFG7byzdJdUQdydkLgbiCRKg3LzXr
	YBTUmyyZpd8tggVVQo5aOTvvs46nIdixCeBr5hMQ0Wn3RvzGJdqCTiySqIVmab7FuV0obHy1zHLdv
	aVT4cy5wcDefTPx7cn3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw7Aa-00CH5V-PL; Tue, 31 May 2022 19:04:44 +0000
Received: from mail-vs1-f44.google.com ([209.85.217.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw7AY-00CH4M-7C
	for linux-riscv@lists.infradead.org; Tue, 31 May 2022 19:04:44 +0000
Received: by mail-vs1-f44.google.com with SMTP id 68so14540240vse.11
        for <linux-riscv@lists.infradead.org>; Tue, 31 May 2022 12:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1ZeGJTUXZPxAO5jhONwtVhilmc3GtYxBhVB9MqXOe9g=;
        b=ZQWkmR8Ag8p/fkR+I+iWi8hLOkQMy1Su5pu4+beIeR5lJZ6dRk01my2PeZazgsVhku
         0Mp80pIIf/OFDaGoLfAruxv8neHohP7/cZVaJaOamnsA6rGbbFrVAb/r2Uhefh4rue8Y
         13VZDvBWvTCruB+OUsY9Og7EoEzGsaxSGnwikkWV95zDXxbU07Y0EPA/8zeXvfBOyX8n
         8qA4N3wwGkBIMptoYLhD8dqKidwqJ5YAWqJH0AkEuHtukbDvIdYtPMw54WjVRJSVCcRh
         Y77m9caWwiBbF6bCTAeBGSUQW83OIk5ycTGkH7LekIy9c0wTCFxuTd0uCayWVjTxB8Zt
         rKsQ==
X-Gm-Message-State: AOAM531WQ/QqW+SyK+CscXaCJsI7OI25NbZ9sdkgSuAKBLwtSzsES5xI
	46ZqZyv2wewygXtsu5ByLNV2yq1pdf68Xw==
X-Google-Smtp-Source: ABdhPJyqcie+m7yPlsf/h3x0N2m6OvdHl7qmP9AV0iP2Hfs4P6AB7tBTUkuDXSuLUdTNf9scgatRAQ==
X-Received: by 2002:a05:6102:3f0f:b0:32a:46dd:a908 with SMTP id k15-20020a0561023f0f00b0032a46dda908mr24852890vsv.48.1654023875367;
        Tue, 31 May 2022 12:04:35 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id b132-20020a1f348a000000b00351bcf78967sm2298084vka.9.2022.05.31.12.04.34
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 May 2022 12:04:35 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id r22so5110691ual.3
        for <linux-riscv@lists.infradead.org>; Tue, 31 May 2022 12:04:34 -0700 (PDT)
X-Received: by 2002:a05:6902:905:b0:64a:2089:f487 with SMTP id
 bu5-20020a056902090500b0064a2089f487mr61384058ybb.202.1654023864081; Tue, 31
 May 2022 12:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com> <20220509233235.995021-17-dmitry.osipenko@collabora.com>
In-Reply-To: <20220509233235.995021-17-dmitry.osipenko@collabora.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 31 May 2022 21:04:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUFqf58F31EAGnhp_cu9k-G4Sx1cmwx-PGb3mU+6bjRnQ@mail.gmail.com>
Message-ID: <CAMuHMdUFqf58F31EAGnhp_cu9k-G4Sx1cmwx-PGb3mU+6bjRnQ@mail.gmail.com>
Subject: Re: [PATCH v8 16/27] m68k: Switch to new sys-off handler API
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, 
	Joshua Thompson <funaho@jurai.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Greentime Hu <green.hu@gmail.com>, 
	Vincent Chen <deanbo422@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	Lee Jones <lee.jones@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Guenter Roeck <linux@roeck-us.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-csky@vger.kernel.org, 
	"linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Parisc List <linux-parisc@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Linux-sh list <linux-sh@vger.kernel.org>, 
	xen-devel@lists.xenproject.org, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, 
	linux-tegra <linux-tegra@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_120442_301567_E30BE35E 
X-CRM114-Status: GOOD (  29.96  )
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

SGkgRG1pdHJ5LAoKT24gVHVlLCBNYXkgMTAsIDIwMjIgYXQgMTozNCBBTSBEbWl0cnkgT3NpcGVu
a28KPGRtaXRyeS5vc2lwZW5rb0Bjb2xsYWJvcmEuY29tPiB3cm90ZToKPiBLZXJuZWwgbm93IHN1
cHBvcnRzIGNoYWluZWQgcG93ZXItb2ZmIGhhbmRsZXJzLiBVc2UKPiByZWdpc3Rlcl9wb3dlcl9v
ZmZfaGFuZGxlcigpIHRoYXQgcmVnaXN0ZXJzIHBvd2VyLW9mZiBoYW5kbGVycyBhbmQKPiBkb19r
ZXJuZWxfcG93ZXJfb2ZmKCkgdGhhdCBpbnZva2VzIGNoYWluZWQgcG93ZXItb2ZmIGhhbmRsZXJz
LiBMZWdhY3kKPiBwbV9wb3dlcl9vZmYoKSB3aWxsIGJlIHJlbW92ZWQgb25jZSBhbGwgZHJpdmVy
cyB3aWxsIGJlIGNvbnZlcnRlZCB0bwo+IHRoZSBuZXcgc3lzLW9mZiBBUEkuCj4KPiBOb3JtYWxs
eSBhcmNoIGNvZGUgc2hvdWxkIGFkb3B0IG9ubHkgdGhlIGRvX2tlcm5lbF9wb3dlcl9vZmYoKSBh
dCBmaXJzdCwKPiBidXQgbTY4ayBpcyBhIHNwZWNpYWwgY2FzZSBiZWNhdXNlIGl0IHVzZXMgcG1f
cG93ZXJfb2ZmKCkgImluc2lkZSBvdXQiLAo+IGkuZS4gcG1fcG93ZXJfb2ZmKCkgaW52b2tlcyBt
YWNoaW5lX3Bvd2VyX29mZigpIFtpbiBmYWN0IGl0IGRvZXMgbm90aGluZ10sCj4gd2hpbGUgaXQn
cyBtYWNoaW5lX3Bvd2VyX29mZigpIHRoYXQgc2hvdWxkIGludm9rZSB0aGUgcG1fcG93ZXJfb2Zm
KCksIGFuZAo+IHRodXMsIHdlIGNhbid0IGNvbnZlcnQgcGxhdGZvcm1zIHRvIHRoZSBuZXcgQVBJ
IHNlcGFyYXRlbHkuIFRoZXJlIGFyZSBvbmx5Cj4gdHdvIHBsYXRmb3JtcyBjaGFuZ2VkIGhlcmUs
IHNvIGl0J3Mgbm90IGEgYmlnIGRlYWwuCj4KPiBBY2tlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVu
IDxnZWVydEBsaW51eC1tNjhrLm9yZz4KPiBSZXZpZXdlZC1ieTogTWljaGHFgiBNaXJvc8WCYXcg
PG1pcnEtbGludXhAcmVyZS5xbXFtLnBsPgo+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5r
byA8ZG1pdHJ5Lm9zaXBlbmtvQGNvbGxhYm9yYS5jb20+CgpUaGFua3MgZm9yIHlvdXIgcGF0Y2gs
IHdoaWNoIGlzIG5vdyBjb21taXQgZjBmN2U1MjY1YjNiMzdiMAooIm02OGs6IFN3aXRjaCB0byBu
ZXcgc3lzLW9mZiBoYW5kbGVyIEFQSSIpIHVwc3RyZWFtLgoKPiAtLS0gYS9hcmNoL202OGsvZW11
L25hdGZlYXQuYwo+ICsrKyBiL2FyY2gvbTY4ay9lbXUvbmF0ZmVhdC5jCj4gQEAgLTE1LDYgKzE1
LDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L3N0cmluZy5oPgo+ICAjaW5jbHVkZSA8bGludXgva2Vy
bmVsLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3Jl
Ym9vdC5oPgo+ICAjaW5jbHVkZSA8bGludXgvaW8uaD4KPiAgI2luY2x1ZGUgPGFzbS9tYWNoZGVw
Lmg+Cj4gICNpbmNsdWRlIDxhc20vbmF0ZmVhdC5oPgo+IEBAIC05MCw1ICs5MSw1IEBAIHZvaWQg
X19pbml0IG5mX2luaXQodm9pZCkKPiAgICAgICAgIHByX2luZm8oIk5hdEZlYXRzIGZvdW5kICgl
cywgJWx1LiVsdSlcbiIsIGJ1ZiwgdmVyc2lvbiA+PiAxNiwKPiAgICAgICAgICAgICAgICAgdmVy
c2lvbiAmIDB4ZmZmZik7Cj4KPiAtICAgICAgIG1hY2hfcG93ZXJfb2ZmID0gbmZfcG93ZXJvZmY7
Cj4gKyAgICAgICByZWdpc3Rlcl9wbGF0Zm9ybV9wb3dlcl9vZmYobmZfcG93ZXJvZmYpOwoKVW5m
b3J0dW5hdGVseSBub3RoaW5nIGlzIHJlZ2lzdGVyZWQsIGFzIHRoaXMgaXMgY2FsbGVkIHZlcnkg
ZWFybHkKKGZyb20gc2V0dXBfYXJjaCgpLCBiZWZvcmUgdGhlIG1lbW9yeSBhbGxvY2F0b3IgaXMg
YXZhaWxhYmxlLgpIZW5jZSByZWdpc3Rlcl9zeXNfb2ZmX2hhbmRsZXIoKSBmYWlscyB3aXRoIC1F
Tk9NRU0sIGFuZCBwb3dlcm9mZgpzdG9wcyB3b3JraW5nLgoKUG9zc2libGUgc29sdXRpb25zOgog
IC0gQXMgYXQgbW9zdCBvbmUgaGFuZGxlciBjYW4gYmUgcmVnaXN0ZXJlZCwKICAgIHJlZ2lzdGVy
X3BsYXRmb3JtX3Bvd2VyX29mZigpIGNvdWxkIHVzZSBhIHN0YXRpYyBzdHJ1Y3Qgc3lzX29mZl9o
YW5kbGVyCiAgICBpbnN0YW5jZSwKICAtIEtlZXAgbWFjaF9wb3dlcl9vZmYsIGFuZCBjYWxsIHJl
Z2lzdGVyX3BsYXRmb3JtX3Bvd2VyX29mZigpIGxhdGVyLgoKQW55dGhpbmcgZWxzZT8KVGhhbmtz
IQoKPiAtLS0gYS9hcmNoL202OGsvbWFjL2NvbmZpZy5jCj4gKysrIGIvYXJjaC9tNjhrL21hYy9j
b25maWcuYwo+IEBAIC0xMiw2ICsxMiw3IEBACj4KPiAgI2luY2x1ZGUgPGxpbnV4L2Vycm5vLmg+
Cj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3JlYm9vdC5o
Pgo+ICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L21tLmg+Cj4g
ICNpbmNsdWRlIDxsaW51eC90dHkuaD4KPiBAQCAtMTQwLDcgKzE0MSw2IEBAIHZvaWQgX19pbml0
IGNvbmZpZ19tYWModm9pZCkKPiAgICAgICAgIG1hY2hfaHdjbGsgPSBtYWNfaHdjbGs7Cj4gICAg
ICAgICBtYWNoX3Jlc2V0ID0gbWFjX3Jlc2V0Owo+ICAgICAgICAgbWFjaF9oYWx0ID0gbWFjX3Bv
d2Vyb2ZmOwo+IC0gICAgICAgbWFjaF9wb3dlcl9vZmYgPSBtYWNfcG93ZXJvZmY7Cj4gICNpZiBJ
U19FTkFCTEVEKENPTkZJR19JTlBVVF9NNjhLX0JFRVApCj4gICAgICAgICBtYWNoX2JlZXAgPSBt
YWNfbWtzb3VuZDsKPiAgI2VuZGlmCj4gQEAgLTE2MCw2ICsxNjAsOCBAQCB2b2lkIF9faW5pdCBj
b25maWdfbWFjKHZvaWQpCj4KPiAgICAgICAgIGlmIChtYWNpbnRvc2hfY29uZmlnLT5pZGVudCA9
PSBNQUNfTU9ERUxfSUlDSSkKPiAgICAgICAgICAgICAgICAgbWFjaF9sMl9mbHVzaCA9IHZpYV9s
Ml9mbHVzaDsKPiArCj4gKyAgICAgICByZWdpc3Rlcl9wbGF0Zm9ybV9wb3dlcl9vZmYobWFjX3Bv
d2Vyb2ZmKTsKPiAgfQoKVGhpcyBtdXN0IGhhdmUgdGhlIHNhbWUgcHJvYmxlbS4KCkdye29ldGpl
LGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tCkdlZXJ0IFV5dHRl
cmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGlu
dXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVv
cGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3Vy
bmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lgog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
