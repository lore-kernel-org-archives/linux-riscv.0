Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0960EC83038
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 17:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JtxKSmCHELUmNgZ3iPSu6xAjjDUAEvbqBQbJ1IJExSs=; b=YBFwzTTuukXoX6
	SToBPp3KEcEFsy0nNMQumfBeJAvuapnOlJT2Y1+9mjg8sMtuzh8Gb1iWavDUx4TcYQSM/JAixsNQh
	U8MDnIgnxsUnHDznYWwok87zVVL5Ei4VQ4K+ffd9QiSiTR/ZxxaRtdb0KDeC2RZvIt58+3hNAJl3H
	47GI33SmwJ4I2UMrBxaJGsB7SFg10pYDjfY0g1YhYo8CYlYg6ZkLvx2YjM0zIqYxQ+obh2FMRUdoU
	rYc4SaB6O9WpQ92HoK5mSQyjJ7cJiak4xhKT7VQvX+mirUD4S9T2SVDDQc35qvtHKSE0r/nlJIv5Y
	fKZBy+mzdPmGnKkdkQAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1ZG-00000009AJg-2xOy;
	Wed, 02 Jul 2025 17:48:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0q4-000000093HY-15hb
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 17:01:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A95876111F
	for <linux-riscv@lists.infradead.org>; Wed,  2 Jul 2025 17:01:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC18C4CEF2
	for <linux-riscv@lists.infradead.org>; Wed,  2 Jul 2025 17:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751475699;
	bh=K6npPwHBi2DGHnFB8cl+vvK8I6ibe7HqdGsOF64ZxCs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o+8BCDQyeUWWo69CKGFQez5Cbr20o/NSDZkTrZ0tTOe8blmA9sQucX/SN9hQvQM3z
	 3UNH+1M7T9wUWomD/rBq7FXAztDaRmQNJYaMlvLPIMfwwHxxpHD93CEjlVkwc5LHqJ
	 b5ChwVZdRQH0xpa83i8d5YfPIJ0jeWbqP6eNYWCaEnt33HMn6EFjk4+oJPok8lE/W3
	 x3As9zOkVRITFiQOizLS0IeaySaMNi9tZ18xg9Qdm4D7SPJr+ewiRpv3m98niSMBG6
	 ikU4p1dlCNjNJdnTmJNAjpTqrVD1gdR128NVqBTlrP/B2BB/vXjL0kuMBRZMayNKwO
	 zI+IFgmJdp7tA==
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-60402c94319so4102516eaf.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 10:01:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUIX+6q1rtjgZHF1OEb4hTSGzBdahrKTEHmm/f5uJSaZLQkeXTYkAxrRoh7C6h25sWcVeD5ATD3uOErlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyowBTrX6gD4R8KVVPhfFn656+oJzPyIGW3Kip/ku3KRUalFijR
	Qh6x+82CaEXJ5/hGCgUV3/gVGboRs0xf/WLehvg7mjlPOJ5Y+tIFOPwUM5AKY4248G1zXTeB+3O
	lzgKpxsKsTHctLUMXd9CyNB+hftIfLcE=
X-Google-Smtp-Source: AGHT+IGPd++aiCNQ4qfuEIoYUI2K930oDrPPW3BNMd8Apd55Lv82AJ7wV9K+7i8ylCY8TGknSq7EnGbvDAKM/sPSrwE=
X-Received: by 2002:a4a:ca89:0:b0:611:aabf:2b7d with SMTP id
 006d021491bc7-612012d05e1mr2142271eaf.7.1751475698640; Wed, 02 Jul 2025
 10:01:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-15-apatel@ventanamicro.com> <CAJZ5v0ifCN7OWEw0DHpULSmXn4nCb9EdJMjQPJwmdoF_y0nfjA@mail.gmail.com>
 <aGVF8Gqzs2YZf1Os@sunil-laptop>
In-Reply-To: <aGVF8Gqzs2YZf1Os@sunil-laptop>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 2 Jul 2025 19:01:27 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iYjc2JurNAJyr1o03Mr7DJyc=MdHvbTsCsC76JR0suNQ@mail.gmail.com>
X-Gm-Features: Ac12FXwjgoj03UiKdGXfM8DuaJdwtG5xtG-ENxekbig-Cp5sM0uIGBwVeivKWu8
Message-ID: <CAJZ5v0iYjc2JurNAJyr1o03Mr7DJyc=MdHvbTsCsC76JR0suNQ@mail.gmail.com>
Subject: Re: [PATCH v7 14/24] ACPI: property: Refactor acpi_fwnode_get_reference_args()
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Anup Patel <apatel@ventanamicro.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Len Brown <lenb@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, 
	Leyfoon Tan <leyfoon.tan@starfivetech.com>, Atish Patra <atish.patra@linux.dev>, 
	Andrew Jones <ajones@ventanamicro.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

T24gV2VkLCBKdWwgMiwgMjAyNSBhdCA0OjQ14oCvUE0gU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdWwgMDIsIDIwMjUgYXQgMTI6MDc6MzZQ
TSArMDIwMCwgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4gPiBPbiBXZWQsIEp1bCAyLCAyMDI1
IGF0IDc6MTXigK9BTSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6
Cj4gPiA+Cj4gPiA+IEZyb206IFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPgo+
ID4gPgo+ID4gPiBDdXJyZW50bHkgYWNwaV9md25vZGVfZ2V0X3JlZmVyZW5jZV9hcmdzKCkgY2Fs
bHMgdGhlIHB1YmxpYyBmdW5jdGlvbgo+ID4gPiBfX2FjcGlfbm9kZV9nZXRfcHJvcGVydHlfcmVm
ZXJlbmNlKCkgd2hpY2ggaWdub3JlcyB0aGUgbmFyZ3NfcHJvcAo+ID4gPiBwYXJhbWV0ZXIuCj4g
Pgo+ID4gV2hpY2ggSSBzdXBwb3NlIGlzIGEgcHJvYmxlbS4gIFdoeSBpcyBpdCBzbz8KPiA+Cj4g
Zndub2RlX3Byb3BlcnR5X2dldF9yZWZlcmVuY2VfYXJncygpIGRvY3VtZW50cyBhcyBiZWxvdy4K
Pgo+ICogQG5hcmdzX3Byb3A6IFRoZSBuYW1lIG9mIHRoZSBwcm9wZXJ0eSB0ZWxsaW5nIHRoZSBu
dW1iZXIgb2YKPiAgKiAgICAgICAgICAgICAgYXJndW1lbnRzIGluIHRoZSByZWZlcnJlZCBub2Rl
LiBOVUxMIGlmIEBuYXJncyBpcyBrbm93biwKPiAgKiAgICAgICAgICAgICAgb3RoZXJ3aXNlIEBu
YXJncyBpcyBpZ25vcmVkLiBPbmx5IHJlbGV2YW50IG9uIE9GLgo+ICAqIEBuYXJnczogICAgICBO
dW1iZXIgb2YgYXJndW1lbnRzLiBJZ25vcmVkIGlmIEBuYXJnc19wcm9wIGlzIG5vbi1OVUxMLgo+
Cj4gWW91IGNhbiBzZWUgdGhhdCBuYXJnc19wcm9wIGlzIG5vdCBzdXBwb3J0ZWQgd2l0aCBBQ1BJ
IGN1cnJlbnRseS4gU2luY2UKPiBmd25vZGVfcHJvcGVydHlfZ2V0X3JlZmVyZW5jZV9hcmdzKCkg
Y2FsbHMKPiBfX2FjcGlfbm9kZV9nZXRfcHJvcGVydHlfcmVmZXJlbmNlKCksIHRoZXJlIGlzIG5v
IHdheSB0byBkZXRlcm1pbmUgdGhlCj4gbmFyZ3MgZnJvbSB0aGUgbmFyZ3NfcHJvcCBjdXJyZW50
bHkgd2l0aCBBQ1BJLiBTaW5jZQo+IGZ3bm9kZV9wcm9wZXJ0eV9nZXRfcmVmZXJlbmNlX2FyZ3Mo
KSBpcyBhIGNvbW1vbiBBUEkgYWNyb3NzIERUIGFuZCBBQ1BJLAo+IGl0IGlzIGEgcHJvYmxlbSBm
b3IgdXNlcnMuCgpTbyB0aGUgcHJvYmxlbSBpcyB0aGF0IGlmIG5hcmdzX3Byb3AgaXMgcGFzc2Vk
IHRvCmZ3bm9kZV9wcm9wZXJ0eV9nZXRfcmVmZXJlbmNlX2FyZ3MoKSBhbmQgaXQgaXMgYSB2YWxp
ZCAiY2VsbHMiCnByb3BlcnR5LCBPRiB3aWxsIHVzZSBpdCB0byBvYnRhaW4gdGhlIG51bWJlciBv
ZiByZWZlcmVuY2UgYXJndW1lbnRzCmFuZCBBQ1BJIHdpbGwgaWdub3JlIGl0LiAgVG8gbWFrZSBp
dCB3b3JrIHRoZSBzYW1lIHdheSBpbiBib3RoIGNhc2VzLAphY3BpX2Z3bm9kZV9nZXRfcmVmZXJl
bmNlX2FyZ3MoKSBuZWVkcyB0byBiZSBtb2RpZmllZCB0byB0YWtlCm5hcmdzX3Byb3AgaW50byBh
Y2NvdW50IHByb3Blcmx5LiAgVGhpcyBpcyB0aGUga2V5IGluZm9ybWF0aW9uIHRoYXQKbmVlZHMg
dG8gZ28gaW50byB0aGUgcGF0Y2ggY2hhbmdlbG9nLgoKPiA+ID4gVG8gZml4IHRoaXMsIG1ha2Ug
X19hY3BpX25vZGVfZ2V0X3Byb3BlcnR5X3JlZmVyZW5jZSgpIHRvCj4gPiA+IGNhbGwgdGhlIHN0
YXRpYyBhY3BpX2Z3bm9kZV9nZXRfcmVmZXJlbmNlKCkgc28gdGhhdCBjYWxsZXJzIG9mCj4gPiA+
IGZ3bm9kZV9nZXRfcmVmZXJlbmNlX2FyZ3MoKSBjYW4gc3RpbGwgcGFzcyBhIHZhbGlkIHByb3Bl
cnR5IG5hbWUgdG8KPiA+ID4gZmV0Y2ggdGhlIG51bWJlciBvZiBhcmd1bWVudHMuCj4gPgo+ID4g
QXJlIHRoZSBjdXJyZW50IGNhbGxlcnMgb2YgYWNwaV9md25vZGVfZ2V0X3JlZmVyZW5jZV9hcmdz
KCkgZ29pbmcgdG8KPiA+IGJlIGFmZmVjdGVkIGJ5IHRoaXMgY2hhbmdlIGFuZCBpZiBzbywgdGhl
biBob3c/Cj4gPgo+IEdvb2QgcXVlc3Rpb24hLiBJZiBzb21lIG9uZSBpcyBjdXJyZW50bHkgcGFz
c2luZyBib3RoIHZhbGlkIG5hcmdzX3Byb3AgYW5kCj4gbmFyZ3Mgd2l0aCBBQ1BJLCBub3cgd2l0
aCB0aGlzIGNoYW5nZSBpdCB3aWxsIHN0YXJ0IGdldHRpbmcgdGhlIHZhbHVlCj4gZnJvbSBuYXJn
c19wcm9wIHdoaWNoIHdhcyBzaW1wbHkgaWdub3JlZCBlYXJsaWVyLiBIb3dldmVyLCBJIHNlZSBv
bmx5IDIKPiBjb21iaW5hdGlvbnMgaG93IGZ3bm9kZV9wcm9wZXJ0eV9nZXRfcmVmZXJlbmNlX2Fy
Z3MoKSBpcyBiZWluZyB1c2VkLgo+Cj4gKG5hcmdzX3Byb3AgPSBOVUxMKSAmJiAoYXJnc19jb3Vu
dCAhPTApCj4gb3IKPiAobmFyZ3NfcHJvcCAhPSBOVUxMKSAmJiAoYXJnc19jb3VudCA9IDApCgpP
SwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
