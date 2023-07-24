Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF78C0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 12:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vpf0hcvpF8EIoBvBBQIbtiw51fxTwJl7I9KAoo813ZY=; b=VzjOuSIJXS6Xae
	FthbfCTXI08S7kwEN39Kba1idddQ+58bxEm/CJ1DBBaij0ZswpOPG0qCtenHLnrR/Khq32LUcAtZk
	26qFieNJILyBwxqEcnlHZJMnc8If4wmIAMkVgFZr9N4DY7RoaSk2r2vcsh767hTOVj+JeS2X4AhWV
	IzAGpZivt14Iw3cCuSsBOpvrnDvcr8bvAgJPZ99EoiQtBs2MzCDKt62wsEsgE/v2hERaVaMi15s0L
	xnIRumzKiNYIcXyEjrH4z4tFl/13pEvJgnf9fPj3dvUs/4IUg5Y12/i7ZBSL/LunXw62BzAknVG/5
	V2FXA6AilimRXzQm+KBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNuMB-004AOg-12;
	Mon, 24 Jul 2023 12:08:07 +0000
Received: from mail-pl1-f172.google.com ([209.85.214.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNuM7-004AN6-0y;
	Mon, 24 Jul 2023 12:08:04 +0000
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1b9e9765f2cso20609145ad.3;
        Mon, 24 Jul 2023 05:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690200479; x=1690805279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nNGOJzgymf6gQYpdxd2UIkw90HSJ+oAIVzOwuAShWk=;
        b=aL8Sdk4sAGKn3pshBqzc476FjirQk0u1gMpNjZU+nxIi5X/+jIQUQe79L9lt7woCqB
         31D6kqUjGsmwPuzrubCep1KQZopGS0ZmrL9LMUjOBard5MHTpVrSKKKH8CQkPn9IK2LZ
         PJQLr+rbLpDqrj5UmeiMmYC8/QR8vreaaOrUwYDZkr0+Fz/vNDTQQLRVrDV7hKcOgcFD
         u33ep+rxj5cRJDHXwKu9JZDiqD2b/Dpxx+lRHyRQ2a3s+zHa8FNeM6KHLQkVDugr+hTr
         FoP9KK8wP/10aNa7R27TRVqDv+ugUyJImO8GTcEoBvpeH6SX7z5bHb3O5lrz0CMKXZmg
         zYnQ==
X-Gm-Message-State: ABy/qLa/DxJU7waL5k8isXvLhLKsuPGrvECxEU8VGny+BIGNiGT2Chcw
	fVRZxBLwmE9eSTXW/7rBp/6CyJdPserasg==
X-Google-Smtp-Source: APBJJlGO7XnVMad+1onHdTSqD7fWwE+zi68FTammT/h25r51tvcSDPH3LNBCqICFw+2MXJnkjVBfWg==
X-Received: by 2002:a17:902:6b48:b0:1b5:fb8:a821 with SMTP id g8-20020a1709026b4800b001b50fb8a821mr6581207plt.13.1690200478510;
        Mon, 24 Jul 2023 05:07:58 -0700 (PDT)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com. [209.85.210.169])
        by smtp.gmail.com with ESMTPSA id p11-20020a170902bd0b00b001bba669a7eesm1885091pls.52.2023.07.24.05.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 05:07:58 -0700 (PDT)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6687466137bso2305536b3a.0;
        Mon, 24 Jul 2023 05:07:57 -0700 (PDT)
X-Received: by 2002:a25:238e:0:b0:d05:abaf:9933 with SMTP id
 j136-20020a25238e000000b00d05abaf9933mr7019302ybj.36.1690200457350; Mon, 24
 Jul 2023 05:07:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230719123944.3438363-1-arnd@kernel.org> <20230719123944.3438363-2-arnd@kernel.org>
 <87pm4lj1w3.fsf@mail.lhotse> <19631e74-415e-4dcb-b79d-33dcf03d2dfc@app.fastmail.com>
In-Reply-To: <19631e74-415e-4dcb-b79d-33dcf03d2dfc@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Jul 2023 14:07:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVszR+oZi8x8L0iXx=ydTiaNUZxToBSdf=2ZH5t85+D_Q@mail.gmail.com>
Message-ID: <CAMuHMdVszR+oZi8x8L0iXx=ydTiaNUZxToBSdf=2ZH5t85+D_Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] vgacon: rework Kconfig dependencies
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org, 
	Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>, 
	Javier Martinez Canillas <javierm@redhat.com>, "David S . Miller" <davem@davemloft.net>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Brian Cain <bcain@quicinc.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Daniel Vetter <daniel@ffwll.ch>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dave Airlie <airlied@gmail.com>, 
	Deepak Rawat <drawat.floss@gmail.com>, Dexuan Cui <decui@microsoft.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	guoren <guoren@kernel.org>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Khalid Aziz <khalid@gonehiking.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Russell King <linux@armlinux.org.uk>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	WANG Xuerui <kernel@xen0n.name>, Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>, 
	x86@kernel.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-hexagon@vger.kernel.org, 
	linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_050803_341264_DED15768 
X-CRM114-Status: GOOD (  27.31  )
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

SGkgQXJuZCwKCk9uIEZyaSwgSnVsIDIxLCAyMDIzIGF0IDEwOjI54oCvQU0gQXJuZCBCZXJnbWFu
biA8YXJuZEBhcm5kYi5kZT4gd3JvdGU6Cj4gT24gRnJpLCBKdWwgMjEsIDIwMjMsIGF0IDA2OjU5
LCBNaWNoYWVsIEVsbGVybWFuIHdyb3RlOgo+ID4gQXJuZCBCZXJnbWFubiA8YXJuZEBrZXJuZWwu
b3JnPiB3cml0ZXM6Cj4gPj4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiA+
Pgo+ID4+IFRoZSBsaXN0IG9mIGRlcGVuZGVuY2llcyBoZXJlIGlzIHBocmFzZWQgYXMgYW4gb3B0
LW91dCwgYnV0IHRoaXMgaXMgbWlzc2luZwo+ID4+IGEgbG90IG9mIGFyY2hpdGVjdHVyZXMgdGhh
dCBkb24ndCBhY3R1YWxseSBzdXBwb3J0IFZHQSBjb25zb2xlcywgYW5kIHNvbWUKPiA+PiBvZiB0
aGUgZW50cmllcyBhcmUgc3RhbGU6Cj4gPj4KPiA+PiAgLSBwb3dlcnBjIHVzZWQgdG8gc3VwcG9y
dCBWR0EgY29uc29sZXMgaW4gdGhlIG9sZCBhcmNoL3BwYyBjb2RlYmFzZSwgYnV0Cj4gPj4gICAg
dGhlIG1lcmdlZCBhcmNoL3Bvd2VycGMgbmV2ZXIgZGlkCj4gPgo+ID4gTm90IGRpc3B1dGluZyB0
aGlzLCBidXQgaG93IGRpZCB5b3UgY29tZSB0byB0aGF0IGNvbmNsdXNpb24/IEkgZ3JlcHBlZAo+
ID4gYXJvdW5kIGFuZCBjb3VsZG4ndCBjb252aW5jZSBteXNlbGYgd2hldGhlciBpdCBjYW4gd29y
ayBvbiBwb3dlcnBjIG9yCj4gPiBub3QuIGllLiBjdXJyZW50bHkgaXQncyBwb3NzaWJsZSB0byBl
bmFibGUgQ09ORklHX1ZHQV9DT05TT0xFIGFuZAo+ID4gcG93ZXJwYyBkb2VzIGhhdmUgYSBzdHJ1
Y3Qgc2NyZWVuX2luZm8gZGVmaW5lZCB3aGljaCBzZWVtcyBsaWtlIGl0IHdvdWxkCj4gPiBhbGxv
dyB2Z2Fjb25fc3RhcnR1cCgpIHRvIGNvbXBsZXRlLgo+Cj4gVGhlIFZHQSBjb25zb2xlIG5lZWRz
IGJvdGggc2NyZWVuX2luZm8gYW5kIHZnYV9jb24gdG8gd29yay4gSW4gYXJjaC9wcGMKPiB3ZSBo
YWQgYm90aCwgYnV0IGluIGFyY2gvcG93ZXJwYyB3ZSBvbmx5IHJldGFpbmVkIHRoZSBzY3JlZW5f
aW5mbzoKPgo+ICQgZ2l0IGdyZXAgdmdhX2NvbiB2Mi42LjI2IC0tIGFyY2gvcHBjIGFyY2gvcHBj
NjQgYXJjaC9wb3dlcnBjCj4gdjIuNi4yNjphcmNoL3BwYy9wbGF0Zm9ybXMvcHBsdXMuYzogICAg
IGNvbnN3aXRjaHAgPSAmdmdhX2NvbjsKPiB2Mi42LjI2OmFyY2gvcHBjL3BsYXRmb3Jtcy9wcmVw
X3NldHVwLmM6ICAgICAgICBjb25zd2l0Y2hwID0gJnZnYV9jb247Cj4KPiBzbyBhZnRlciBhcmNo
L3BwYyB3YXMgcmVtb3ZlZCwgdGhpcyBiZWNhbWUgaW1wb3NzaWJsZSB0byB1c2Ugb24gYm90aAo+
IHBwbHVzIGFuZCBwcmVwLiBUaGVzZSB0d28gcGxhdGZvcm1zIHdlcmUgYWxzbyAoYXMgZmFyIGFz
IEkgY2FuIHRlbGwpCj4gdGhlIG9ubHkgb25lcyB0byBzdXBwb3J0IHZnYTE2ZmIgYXMgYW4gYWx0
ZXJuYXRpdmUgdG8gdmdhY29uLCBidXQKPiBib3RoIHBsYXRmb3JtcyB3ZXJlIHJlbW92ZWQgbGF0
ZXIgb24uCgpJIGRpZCB1c2UgdmdhY29uIGFuZCB2Z2ExNmZiIG9uIENIUlAgb24gYSBzZWNvbmQg
dmlkZW8gY2FyZAooaW5pdGlhbGl6ZWQgdXNpbmcgR2FicmllbCBQYXViZXJ0J3MgeDg2IEJJT1Mg
ZW11bGF0b3IpLCBidXQgdGhhdCB3YXMKZGVmaW5pdGVseSBiZWZvcmUgdGhlIGFkdmVudCBvZiBh
cmNoL3Bvd2VycGMvLgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAg
ICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXgg
YmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNh
dGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQK
d2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBv
ciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0t
IExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
