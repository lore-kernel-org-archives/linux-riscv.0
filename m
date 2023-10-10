Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008EECD80A0
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 10:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2/HypEtaj4YsM4nv31mg+XDb6sjFE9BfTIq/+Xt3oFc=; b=iDjwI3L1OcUWCX
	NJ3K6Ia0QN2n/sLXo1bnl58OIQBkBjWR0F/2fxFqgRtKFifjpQrx111h0yOwMLeNcyOrteq4li79y
	oQcgoyVNXb7R51X/FcJA3Cvi6Haz5xx+i4arStEjE5yutF9k6uYM6EVrdLZHZLtmoxRYo3OdAdtom
	Lq1Mi5pE3z9bej4kJ3lcpRdNgKodGUph+GQFj70FI+xN1W4Osoi4DnfPYMXxEg/YTCP0oYlpP1+jx
	Oc3cJzWDfbqd4zueL1/3KxeiDm0+21woVB8Y9O9xYPALJ1fhdErof9Gn8rw1p9GgYZa/GQu/8l9Mq
	nMl6xHUOm3YJYyz9CVEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq9wx-00D1MQ-2B;
	Tue, 10 Oct 2023 10:26:51 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq9wt-00D1Lo-28;
	Tue, 10 Oct 2023 10:26:49 +0000
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6c61d955161so3131768a34.1;
        Tue, 10 Oct 2023 03:26:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696933606; x=1697538406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbmON3xp7LlIs9AFrDaNfaYi2KFfIcOVngy3VzyA1Hk=;
        b=fV2MS+AvZCR8kBLVem70abzPkZ4i0HZ3DLYQNf9UU+o/tRUDHLsphJGRkWt6ZE+1un
         pDo/b72avKGf2ca/NUY3h5X8pmMwk/gVWTBfcoBDVsXFnq72W/cVD11A9i0j8IH3dZ7D
         OYV1ONFRjZGQpvGDEbpkXjbTPe6p6t/7lOBoQOtapLiws10/BTGqqRf6jIbPM1Uv2d55
         a/QPA2xhS8eanYNUzU7FYn24N2gcCEDJPntnRkZ2/mH9JMS7j9LzvORE6uQgeMQeEkpi
         amUW0NHHcIjpggt195meTOeM8FjujbFlcbUItvFIadbROKuHphYt/iiZjcwFY4akCgOb
         AN3A==
X-Gm-Message-State: AOJu0YzHr4eZ5O5VxMZpQtAP1gCw5FV/6u0CGFzQk+w+aoVfS5zUzi0X
	1TsnmCgz2ysSkwODrCHYVsUUipb9Q+1MEA==
X-Google-Smtp-Source: AGHT+IElkozBrw98/ZqEDquzjUhmVttIeS/VJ/arQ7ghywuiZb7TmyJmyUUY+yqXfE2ZLt96rmVhgg==
X-Received: by 2002:a9d:69d3:0:b0:6b8:9932:b8ad with SMTP id v19-20020a9d69d3000000b006b89932b8admr13694378oto.1.1696933605855;
        Tue, 10 Oct 2023 03:26:45 -0700 (PDT)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com. [209.85.161.41])
        by smtp.gmail.com with ESMTPSA id w6-20020a056830060600b006b9348b6f51sm1763877oti.54.2023.10.10.03.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 03:26:45 -0700 (PDT)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-57bce354d94so2660408eaf.2;
        Tue, 10 Oct 2023 03:26:45 -0700 (PDT)
X-Received: by 2002:a81:8647:0:b0:595:89b0:6b56 with SMTP id
 w68-20020a818647000000b0059589b06b56mr20014839ywf.28.1696933584327; Tue, 10
 Oct 2023 03:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20231009211845.3136536-1-arnd@kernel.org> <20231009211845.3136536-2-arnd@kernel.org>
In-Reply-To: <20231009211845.3136536-2-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Oct 2023 12:26:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU6MFLCOe4BSWr5oVC4JcLpBS+2PvQsoSEWMLRAFpvaGA@mail.gmail.com>
Message-ID: <CAMuHMdU6MFLCOe4BSWr5oVC4JcLpBS+2PvQsoSEWMLRAFpvaGA@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] vgacon: rework Kconfig dependencies
To: Arnd Bergmann <arnd@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>, 
	"David S. Miller" <davem@davemloft.net>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Daniel Vetter <daniel@ffwll.ch>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Airlie <airlied@gmail.com>, Deepak Rawat <drawat.floss@gmail.com>, 
	Dexuan Cui <decui@microsoft.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guo Ren <guoren@kernel.org>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Khalid Aziz <khalid@gonehiking.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, WANG Xuerui <kernel@xen0n.name>, Wei Liu <wei.liu@kernel.org>, 
	Will Deacon <will@kernel.org>, x86@kernel.org, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-efi@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-hyperv@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_032647_719588_E7E3566A 
X-CRM114-Status: GOOD (  30.21  )
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

SGkgQXJuZCwKCk9uIE1vbiwgT2N0IDksIDIwMjMgYXQgMTE6MTnigK9QTSBBcm5kIEJlcmdtYW5u
IDxhcm5kQGtlcm5lbC5vcmc+IHdyb3RlOgo+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+Cj4KPiBUaGUgbGlzdCBvZiBkZXBlbmRlbmNpZXMgaGVyZSBpcyBwaHJhc2VkIGFzIGFu
IG9wdC1vdXQsIGJ1dCB0aGlzIGlzIG1pc3NpbmcKPiBhIGxvdCBvZiBhcmNoaXRlY3R1cmVzIHRo
YXQgZG9uJ3QgYWN0dWFsbHkgc3VwcG9ydCBWR0EgY29uc29sZXMsIGFuZCBzb21lCj4gb2YgdGhl
IGVudHJpZXMgYXJlIHN0YWxlOgo+Cj4gIC0gcG93ZXJwYyB1c2VkIHRvIHN1cHBvcnQgVkdBIGNv
bnNvbGVzIGluIHRoZSBvbGQgYXJjaC9wcGMgY29kZWJhc2UsIGJ1dAo+ICAgIHRoZSBtZXJnZWQg
YXJjaC9wb3dlcnBjIG5ldmVyIGRpZAo+Cj4gIC0gYXJtIGxpc3RzIGZvb3RicmlkZ2UsIGludGVn
cmF0b3IgYW5kIG5ldHdpbmRlciwgYnV0IG5ldHdpbmRlciBpcyBhY3R1YWxseQo+ICAgIHBhcnQg
b2YgZm9vdGJyaWRnZSwgYW5kIGludGVncmF0b3IgZG9lcyBub3QgYXBwZWFyIHRvIGhhdmUgYW4g
YWN0dWFsCj4gICAgVkdBIGhhcmR3YXJlLCBvciBsaXN0IGl0IGluIGl0cyBBVEFHIG9yIERULgo+
Cj4gIC0gbWlwcyBoYXMgYSBmZXcgcGxhdGZvcm1zIChtYWx0YSwgc2lieXRlLCBhbmQgc25pKSB0
aGF0IGluaXRpYWxpemUKPiAgICBzY3JlZW5faW5mbywgb24gZXZlcnl0aGluZyBlbHNlIHRoZSBj
b25zb2xlIGlzIHNlbGVjdGVkIGJ1dCBjYW5ub3QKPiAgICBhY3R1YWxseSB3b3JrLgo+Cj4gIC0g
Y3NreSwgaGV4Z2Fnb24sIGxvb25nYXJjaCwgbmlvczIsIHJpc2N2IGFuZCB4dGVuc2EgYXJlIG5v
dCBsaXN0ZWQKPiAgICBpbiB0aGUgb3B0LW91dCB0YWJsZSBhbmQgZGVjbGFyZSBhIHNjcmVlbl9p
bmZvIHRvIGFsbG93IGJ1aWxkaW5nCj4gICAgdmdhX2NvbiwgYnV0IHRoaXMgY2Fubm90IHdvcmsg
YmVjYXVzZSB0aGUgY29uc29sZSBpcyBuZXZlciBzZWxlY3RlZC4KPgo+IFJlcGxhY2UgdGhpcyB3
aXRoIGFuIG9wdC1pbiB0YWJsZSB0aGF0IGxpc3RzIG9ubHkgdGhlIHBsYXRmb3JtcyB0aGF0Cj4g
cmVtYWluLiBUaGlzIGlzIGVmZmVjdGl2ZWx5IHg4NiwgcGx1cyBhIGNvdXBsZSBvZiBoaXN0b3Jp
YyB3b3Jrc3RhdGlvbgo+IGFuZCBzZXJ2ZXIgbWFjaGluZXMgdGhhdCByZXVzZWQgcGFydHMgb2Yg
dGhlIHg4NiBzeXN0ZW0gYXJjaGl0ZWN0dXJlLgo+Cj4gUmV2aWV3ZWQtYnk6IEphdmllciBNYXJ0
aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPgo+IFJldmlld2VkLWJ5OiBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiBSZXZpZXdlZC1ieTogS2hhbGlkIEF6
aXogPGtoYWxpZEBnb25laGlraW5nLm9yZz4KPiBBY2tlZC1ieTogSGVsZ2UgRGVsbGVyIDxkZWxs
ZXJAZ214LmRlPgo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+
CgpUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCgpSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVu
IDxnZWVydEBsaW51eC1tNjhrLm9yZz4KCkEgZmV3IHN1Z2dlc3Rpb25zIGZvciBzaW1wbGlmaWNh
dGlvbiBiZWxvdy4uLgoKPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2NvbnNvbGUvS2NvbmZpZwo+ICsr
KyBiL2RyaXZlcnMvdmlkZW8vY29uc29sZS9LY29uZmlnCj4gQEAgLTcsOSArNyw5IEBAIG1lbnUg
IkNvbnNvbGUgZGlzcGxheSBkcml2ZXIgc3VwcG9ydCIKPgo+ICBjb25maWcgVkdBX0NPTlNPTEUK
PiAgICAgICAgIGJvb2wgIlZHQSB0ZXh0IGNvbnNvbGUiIGlmIEVYUEVSVCB8fCAhWDg2Cj4gLSAg
ICAgICBkZXBlbmRzIG9uICE0eHggJiYgIVBQQ184eHggJiYgIVNQQVJDICYmICFNNjhLICYmICFQ
QVJJU0MgJiYgICFTVVBFUkggJiYgXAo+IC0gICAgICAgICAgICAgICAoIUFSTSB8fCBBUkNIX0ZP
T1RCUklER0UgfHwgQVJDSF9JTlRFR1JBVE9SIHx8IEFSQ0hfTkVUV0lOREVSKSAmJiBcCj4gLSAg
ICAgICAgICAgICAgICFBUk02NCAmJiAhQVJDICYmICFNSUNST0JMQVpFICYmICFPUEVOUklTQyAm
JiAhUzM5MCAmJiAhVU1MCj4gKyAgICAgICBkZXBlbmRzIG9uIEFMUEhBIHx8IElBNjQgfHwgWDg2
IHx8IFwKPiArICAgICAgICAgICAgICAgKEFSTSAmJiBBUkNIX0ZPT1RCUklER0UpIHx8IFwKCllv
dSBjYW4gZHJvcCAiQVJNICYmIiwgYXMgaXQgaXMgaW1wbGllZCBieSBBUkNIX0ZPT1RCUklER0Uu
Cgo+ICsgICAgICAgICAgICAgICAoTUlQUyAmJiAoTUlQU19NQUxUQSB8fCBTSUJZVEVfQkNNMTEy
WCB8fCBTSUJZVEVfU0IxMjUwIHx8IFNJQllURV9CQ00xeDgwIHx8IFNOSV9STSkpCgpMaWtld2lz
ZSBmb3IgIk1JUFMgJiYiLgoKVGhlIDMgU0lCWVRFIGRlcGVuZGVuY2llcyBjYW4gYmUgcmVwbGFj
ZWQgYnkgU0lCWVRFX1NCMXh4eF9TT0MuCgo+ICAgICAgICAgc2VsZWN0IEFQRVJUVVJFX0hFTFBF
UlMgaWYgKERSTSB8fCBGQiB8fCBWRklPX1BDSV9DT1JFKQo+ICAgICAgICAgZGVmYXVsdCB5Cj4g
ICAgICAgICBoZWxwCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAg
IEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBi
ZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0
aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3
aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9y
IHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0g
TGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
