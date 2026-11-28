Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2877606A31C
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Nov 2026 13:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vh/dxVrc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=X3v3EJ+C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cZKwbWEyt9gqu6OkqZBB4Lwj8h19KicJ0DNM1hK7wzU=; b=vh/dxVrcrFn+ZMPOcOK8Xij+DS
	9Ig5s2HsTF6mFHG2LqMZ5T8Z5ZZ/qznhLMGqqq5/zF93JtApu4zwhIN9ub1Ff9EK5ZB7VDCZW/5X7
	QrauQTMra23Zw9aguu7+BaqpRaM1xoK0asAaZHCekjVarPhUyP9eu7vDK/I72moYm2t3juPSl6NbE
	32PhXymCHna6M0YNmo16S4dbuxSgc2/tB+2QKcjRChmp31uPCs7NWQ0R87zrrwpHhMLfdXYmGELMb
	Nv8s1d5vBzYhpwrap19d2LZqGBqCV4M7orVFuDcl98VxfAjUmTxqH07VUORyhSX82RWwoTKrlzssh
	BSczKGNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXIlt-00000000nm7-0v4o;
	Sat, 28 Nov 2026 13:47:21 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXIlq-00000000nlk-1ssB
	for linux-riscv@lists.infradead.org;
	Sat, 28 Nov 2026 13:47:20 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-67da564d9f2so11501118d50.1
        for <linux-riscv@lists.infradead.org>; Sat, 28 Nov 2026 05:47:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795873637; cv=none;
        d=google.com; s=arc-20260327;
        b=RkzTW/PSdBT0+4yiuNetwfbr8A+ewlBHMgO33UGXh7xwgoCftg1MNx2u7iKpWRzE/9
         RuwxvnNubh3UbuDfjCd64A78Skc8ZbdzxZUt3xWcWa9XA4giomOLZjXRMJ/+bwuKWfMh
         BrvhpLlM+9Xya00x30EwbxqhRcstdjge8VEqqGJvcOYsAUyMIoeg1LMxHH653PVlkT7h
         bsSjuXe0prdIkSzzt5fvL6VDVkPDowIJCfE951gDezqK8mDIN+TKq2E+T4ls8ecl7CV5
         IPVRMEopYMhRk8jg3EyqhYS/ucul1nzdvGwyu/1wSisIMpoH/yclrRBZdrCYJYUI7Hks
         BKhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r0WbWTy8H8AEJBJ2yF6at8ZT6mtzoF1bxzPJALDoIu4=;
        fh=hgAd6wwEI1ccYmeuFt5tgwsL4HhQr3dwq1GNo1j2ntM=;
        b=SeYd1G6QNY4NlrFNi1dLBuNCxtf6r5xCt5DXte+6nlNYz0NPxSZZVKK9ZPUZCQ6bb/
         JQwHlpKhzj10tiFtJVC3GvKI82jjxBbSwTMKAz5CAyU0g/u7JFcb66dtwtMBBAlyLVpb
         vcSVyCbrR9ZqcknsFRwkcRqqMNISirPH2Zoa8EqORLAntSNXJfRJct2UCk2N3hAi3Fr/
         3N/iCro/8ZFE2Ba7l+rm2q1l7DD0Q5WnxSwbcgLVGFfYAooY/GyKuWZ2fsYubxj1z32K
         BshiMqD1ML568zgP2xd95pFlmXkd8+1djwFBW5xDWQhe7q70GADhCwxRaBso1NZoiIz9
         fsGQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1795873637; x=1796478437; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r0WbWTy8H8AEJBJ2yF6at8ZT6mtzoF1bxzPJALDoIu4=;
        b=X3v3EJ+CYBUFEoyhn3NDkkurj/03/jkObcMSjUjxNk2SVY5XNvTtXxCroIemYfBpoX
         NylLTu+UZFmzRH9Myy1nmiwZpYnklaz/aGvPAYcs4WzoBc/Bhdp9RIC8GsV+waiosefN
         FClXy517w4bawErd4+XaaklGAgaBIJOp70QHbbdsNmEwt3bzQmZ+njqabjHtzNiEnJl3
         e+hJzwR+IwMLPAy9RLkIwWdzrHwaFSHVpWsWtk+zusxeb52NL3ZAwa2KvG/1f3qsJqTn
         +IjcIBrkSy3zUL+FJkcNcy7LMTE+qouViL+mCA9AD0LM5XfdeodEEXAiyZD4WR8RxpDd
         kHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795873637; x=1796478437;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0WbWTy8H8AEJBJ2yF6at8ZT6mtzoF1bxzPJALDoIu4=;
        b=1dJLNFzRRuJa0vsM4hsda9WH21wbGRTqHpGm8zpSuUEJsPjHYm9McG+KVz23v1zwOg
         H0c4BBWpcduhS6berk7sghXWXjfd1tuY+VMiyCZhTvAT+EHBazXv1Pw3iH3zjuOYlNds
         xP80Gg4XwtrabLPe8yzHXjKBLVk6dTt6TKB69ECcHilWG4tePmLaILJJDXe/zGe+UV6A
         T0khKGY6xfBO0rWdZ7yTSn6VceW5lmdmqnFT4jRedR36ElOqfhSQgZay6zLlB68ufE55
         kw3AmYXGFcWjR0nHIg2s5fWQ6sDYoSLhshVXZ29wdqkAa1axaJKZgV4/K356w3aLK/pQ
         XPeg==
X-Forwarded-Encrypted: i=1; AL+hErGFXXBYHZxWF6/E202HQyY/oUCs+zeiBAjnaOtMoinz6m4fTN4of52FfPANqvjsVJN9+IpjdwFYx5cRUA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8CjTDJqLMbFRbIJEOa7BBoA017LzFfEiJksVZF4H0JYERjfIxk
	sPllsdB3BkhdJtA6rqqAeuIVmAULcx+HEWl05zHuXRjI2vmWOGIwOnf7llGvaucIJW8H3rgX/1l
	KniwvbEBSsXo88NhqjamZlrq456iLexZMgavsdmsMIg==
X-Gm-Gg: AZFdTZfEKoxGMXoYb1gDgUVX82RmKfw32qIHsjDVewxUULsncMzDokstH5FJ93juTmS
	Wga/+uGBj229ZPa8iEZrgp6RAwDq+yfCezv2Is670O9CFDCFiexvulzsaM0JMXmwXzAmv7lv2pX
	0R7ARmlW6Ikj6y3xwaPGdm4maPHBbXk6U6bB+PEleqYOIR9SYnsON8QLtBPV/AN9tTjANlOQj4E
	49La0merbovU5e3OnWrWJb1OlwfDdn497m9dBeDK7rn086V/UTIjsiXF5Dpf+kOze4vdOzN6pJ8
	Z0EOjuK46jFf7nAlDAJA5Xv8w3mnWL/dQrhKitfKnj+8/1bAuRCyHTMMBZn01h7juifOatZO5tz
	lzqCGeUtdCyDuoTvPcX9ywS+iqBXXLV6Y8J7o8hjF3JiU+XED8nLk2r29ED6CCQhPWls/uJt9Oj
	l8ZcOKOby41F9usH6CqShLHYslvw==
X-Received: by 2002:a05:690e:440d:b0:67b:9953:2d97 with SMTP id
 956f58d0204a3-67df4479b3cmr7173129d50.79.1795873636887; Sat, 28 Nov 2026
 05:47:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
 <20260918-k3-aclint-v3-6-cf4fd4050e14@pigmoral.tech> <yf2dawzefycxhhs7zkua3v3hoirals3wtr6rheh4li33eq7r4i@yb7cem4r6x3z>
 <DN6QXCF5LYQM.1F5IA58ETMXVM@pigmoral.tech>
In-Reply-To: <DN6QXCF5LYQM.1F5IA58ETMXVM@pigmoral.tech>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Sat, 28 Nov 2026 07:47:03 -0600
X-Gm-Features: Aa3M54r7COSuoCAZh2e-0U3S35YxbgE_qpFJlIopzh7FxBeYqA4RHXPR262VGcc
Message-ID: <CAEev2e-XsKPkEuvvdQeOuz9YymoZ_MZ8zGod+AuUUxxQPzLWPg@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] riscv: dts: spacemit: k3: Replace incorrect CLINT
 node with ACLINT nodes
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, Radu Rendec <radu@rendec.net>, 
	Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Guodong Xu <docular.xu@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Conor Dooley <conor.dooley@microchip.com>, Bo Gan <ganboing@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_054718_644760_7A33AFA9 
X-CRM114-Status: GOOD (  29.12  )
X-Spam-Score: -2.0 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgSnVuaHVpLAoKT24gU2F0LCBOb3YgMjgsIDIwMjYgYXQgMzo0NeKAr0FNIEp1bmh1aSBMaXUg
PGp1bmh1aS5saXVAcGlnbW9yYWwudGVjaD4gd3JvdGU6Cj4KPiBIaSBBbmlydWRoLAo+Cj4gT24g
RnJpIE5vdiAyNywgMjAyNiBhdCAxOjI3IFBNIENTVCwgQW5pcnVkaCBTcmluaXZhc2FuIHdyb3Rl
Ogo+ID4gSGkgSnVuaHVpLAo+ID4KPiA+IE9uIEZyaSwgU2VwIDE4LCAyMDI2IGF0IDEyOjI5OjM4
QU0gKzA4MDAsIEp1bmh1aSBMaXUgd3JvdGU6Cj4gPj4gVGhlIEszIGltcGxlbWVudHMgc2VwYXJh
dGUgQUNMSU5UIE1TV0ksIE1USU1FUiBhbmQgU1NXSSBkZXZpY2VzLiBUaGUKPiA+PiBleGlzdGlu
ZyBDTElOVCBub2RlIGF0IDB4ZTA4MWMwMDAgaW5jb3JyZWN0bHkgZGVzY3JpYmVzIHRoZSBTU1dJ
Cj4gPj4gcmVnaXN0ZXIgc3BhY2UgaW4gdGhlIG5vbi1zZWN1cmUgd2luZG93IGFzIGEgbGVnYWN5
IENMSU5ULgo+ID4+Cj4gPj4gVGhlIEFDTElOVCByZWdpc3RlciBzcGFjZSBpcyBtYXBwZWQgYXQg
dHdvIGJhc2UgYWRkcmVzc2VzOiBhIHNlY3VyZQo+ID4+IHdpbmRvdyBhdCAweGYxODEwMDAwIGFu
ZCBhIG5vbi1zZWN1cmUgd2luZG93IGF0IDB4ZTA4MTAwMDAuIFRoZQo+ID4+IHNlY3VyZSB3aW5k
b3cgZXhwb3NlcyBhbGwgdGhyZWUgY29tcG9uZW50cywgd2hpbGUgdGhlIG5vbi1zZWN1cmUKPiA+
PiB3aW5kb3cgb25seSBleHBvc2VzIFNTV0k7IHRoZSBNU1dJIGFuZCBNVElNRVIgb2Zmc2V0cyBh
cmUgcmVzZXJ2ZWQKPiA+PiB0aGVyZS4gTW9yZW92ZXIsIGRlcGVuZGluZyBvbiB0aGUgZUZ1c2Ug
Y29uZmlndXJhdGlvbiwgdGhlIG5vbi1zZWN1cmUKPiA+PiB3aW5kb3cgbWF5IGJlIGVudGlyZWx5
IGluYWNjZXNzaWJsZSwgd2hlcmVhcyB0aGUgc2VjdXJlIHdpbmRvdyBpcwo+ID4+IGFsd2F5cyBh
dmFpbGFibGUuCj4gPj4KPiA+PiBSZXBsYWNlIHRoZSBDTElOVCBub2RlIHdpdGggdGhlIHRocmVl
IEFDTElOVCBkZXZpY2VzLCBhbGwgdXNpbmcKPiA+PiBzZWN1cmUtd2luZG93IGFkZHJlc3Nlczog
TVNXSSBhbmQgTVRJTUVSIGZvciBtYWNoaW5lLWxldmVsIGZpcm13YXJlCj4gPj4gc3VjaCBhcyBP
cGVuU0JJLCBhbmQgU1NXSSBmb3Igc3VwZXJ2aXNvciBzb2Z0d2FyZSBpbnRlcnJ1cHRzLgo+ID4+
Cj4gPj4gRml4ZXM6IDU2ZjM3ZTM5MWE2MiAoInJpc2N2OiBkdHM6IHNwYWNlbWl0OiBhZGQgaW5p
dGlhbCBzdXBwb3J0IGZvciBLMyBTb0MiKQo+ID4+IFNpZ25lZC1vZmYtYnk6IEp1bmh1aSBMaXUg
PGp1bmh1aS5saXVAcGlnbW9yYWwudGVjaD4KPiA+PiAtLS0KPiA+PiAgYXJjaC9yaXNjdi9ib290
L2R0cy9zcGFjZW1pdC9rMy5kdHNpIHwgNDMgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlv
bnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0
L2szLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2szLmR0c2kKPiA+PiBpbmRl
eCBjM2YyZGNlMDk2OWMuLjc0ODMxOTc0NDM1ZSAxMDA2NDQKPiA+PiAtLS0gYS9hcmNoL3Jpc2N2
L2Jvb3QvZHRzL3NwYWNlbWl0L2szLmR0c2kKPiA+PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L3NwYWNlbWl0L2szLmR0c2kKPiA+PiBAQCAtMTI2MSwxOSArMTI2MSw2IEBAIHNhcGxpYzogaW50
ZXJydXB0LWNvbnRyb2xsZXJAZTA4MDQwMDAgewo+ID4+ICAgICAgICAgICAgICAgICAgICAgIHJp
c2N2LG51bS1zb3VyY2VzID0gPDUxMj47Cj4gPj4gICAgICAgICAgICAgIH07Cj4gPj4KPiA+PiAt
ICAgICAgICAgICAgY2xpbnQ6IHRpbWVyQGUwODFjMDAwIHsKPiA+PiAtICAgICAgICAgICAgICAg
ICAgICBjb21wYXRpYmxlID0gInNwYWNlbWl0LGszLWNsaW50IiwgInNpZml2ZSxjbGludDAiOwo+
ID4+IC0gICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHhlMDgxYzAwMCAweDAgMHg0MDAw
PjsKPiA+PiAtICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzLWV4dGVuZGVkID0gPCZjcHUw
X2ludGMgMz4sIDwmY3B1MF9pbnRjIDc+LAo+ID4+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA8JmNwdTFfaW50YyAzPiwgPCZjcHUxX2ludGMgNz4sCj4gPj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmY3B1Ml9pbnRjIDM+LCA8
JmNwdTJfaW50YyA3PiwKPiA+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgPCZjcHUzX2ludGMgMz4sIDwmY3B1M19pbnRjIDc+LAo+ID4+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNwdTRfaW50YyAzPiwgPCZjcHU0X2ludGMg
Nz4sCj4gPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmY3B1
NV9pbnRjIDM+LCA8JmNwdTVfaW50YyA3PiwKPiA+PiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgPCZjcHU2X2ludGMgMz4sIDwmY3B1Nl9pbnRjIDc+LAo+ID4+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNwdTdfaW50YyAzPiwg
PCZjcHU3X2ludGMgNz47Cj4gPj4gLSAgICAgICAgICAgIH07Cj4gPj4gLQo+ID4+ICAgICAgICAg
ICAgICAvKiBzZWNfaTJjMzogMHhmMDYxNDAwMCwgbm90IGF2YWlsYWJsZSBmcm9tIExpbnV4ICov
Cj4gPj4KPiA+PiAgICAgICAgICAgICAgbWltc2ljOiBpbnRlcnJ1cHQtY29udHJvbGxlckBmMTAw
MDAwMCB7Cj4gPj4gQEAgLTEzMDUsNSArMTI5MiwzNSBAQCBtYXBsaWM6IGludGVycnVwdC1jb250
cm9sbGVyQGYxODAwMDAwIHsKPiA+PiAgICAgICAgICAgICAgICAgICAgICByaXNjdixudW0tc291
cmNlcyA9IDw1MTI+Owo+ID4+ICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJyZXNlcnZl
ZCI7Cj4gPj4gICAgICAgICAgICAgIH07Cj4gPj4gKwo+ID4+ICsgICAgICAgICAgICBhY2xpbnRf
bXN3aTogaW50ZXJydXB0LWNvbnRyb2xsZXJAZjE4MTAwMDAgewo+ID4+ICsgICAgICAgICAgICAg
ICAgICAgIGNvbXBhdGlibGUgPSAic3BhY2VtaXQsazMtYWNsaW50LW1zd2kiOwo+ID4+ICsgICAg
ICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHhmMTgxMDAwMCAweDAgMHg0MDAwPjsKPiA+PiAr
ICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzLWV4dGVuZGVkID0gPCZjcHUwX2ludGMgMz4s
IDwmY3B1MV9pbnRjIDM+LAo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICA8JmNwdTJfaW50YyAzPiwgPCZjcHUzX2ludGMgMz4sCj4gPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmY3B1NF9pbnRjIDM+LCA8JmNwdTVfaW50
YyAzPiwKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZj
cHU2X2ludGMgMz4sIDwmY3B1N19pbnRjIDM+Owo+ID4+ICsgICAgICAgICAgICB9Owo+ID4+ICsK
PiA+PiArICAgICAgICAgICAgYWNsaW50X210aW1lcjogdGltZXJAZjE4MTQwMDAgewo+ID4+ICsg
ICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic3BhY2VtaXQsazMtYWNsaW50LW10aW1l
ciI7Cj4gPgo+ID4gSSB0aGluayB5b3UnbGwgbmVlZCB0byBhbHNvIGluY2x1ZGUgdGhlICJyaXNj
dixhY2xpbnQtbXRpbWVyIiBjb21wYXRpYmxlCj4gPiBoZXJlIHNvIHRoYXQgdGhpcyBEVCBjYW4g
YmUgdXNlZCB3aXRoIHVwc3RyZWFtIE9wZW5TQkkuIE9wZW5TQkkgZG9lc24ndAo+ID4gaW5jbHVk
ZSB0aGUgc3BhY2VtaXQgc3BlY2lmaWMgY29tcGF0aWJsZS4gT3BlblNCSSBib290IHByaW50cyB0
aGlzCj4gPiBjdXJyZW50bHkuCj4gPgo+ID4gUGxhdGZvcm0gVGltZXIgRGV2aWNlICAgICAgIDog
LS0tIEAgMEh6Cj4gPgo+Cj4gQ3VycmVudGx5LCAicmlzY3YsYWNsaW50LW10aW1lciIgaXMgbm90
IHBhcnQgb2YgYW4gdXBzdHJlYW0gTGludXgKPiBiaW5kaW5nLCBzbyBJIGRvbid0IHRoaW5rIHdl
IHNob3VsZCBhZGQgaXQgdG8gdGhlIEszIERUUyB5ZXQuCj4KPiBZb3VyIGNvbGxlYWd1ZXMgYXQg
VGVuc3RvcnJlbnQgcHJvcG9zZWQgYWRkaW5nIHRoaXMgY29tcGF0aWJsZSBpbiB2Mwo+IG9mIHRo
ZSBBdGxhbnRpcyBzZXJpZXMgWzFdLCBidXQgaXQgd2FzIGRyb3BwZWQgZnJvbSB2NC4gVGhlIHY0
Cj4gY2hhbmdlbG9nIHNheXMgdGhhdCB0aGUgYmluZGluZyB3aWxsIGJlIHN1Ym1pdHRlZCBzZXBh
cmF0ZWx5IFsyXS4KPgo+IElmIHRoZSBiaW5kaW5nIGlzIGFjY2VwdGVkLCB3ZSBjYW4gdGhlbiBh
ZGQgdGhlIGdlbmVyaWMgY29tcGF0aWJsZQo+IHRvIHRoZSBLMyBEVFMuIE90aGVyd2lzZSwgT3Bl
blNCSSB3aWxsIG5lZWQgdG8gYWRkIHN1cHBvcnQgZm9yIHRoZQo+IEszLXNwZWNpZmljIGNvbXBh
dGlibGUuCj4KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNjEx
MDkwNTEwNTAuMTA1NjIzLTUtam9lbEBqbXMuaWQuYXUvCj4gWzJdIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LXJpc2N2LzIwMjYxMTI3MDYxNDMyLjE3MzA2LTEtam9lbEBqbXMuaWQuYXUv
CgpTb3JyeSwgZGlkbid0IHJlYWxpemUgdGhhdCB0aGlzIHdhcyB0aGUgcmVhc29uLiBMZXRzIGdl
dCBpdCBhZGRlZCBvbmNlCnRoZSBmaXhlZCBiaW5kaW5nIGlzIGluLgoKPgo+IEJlc3QgcmVnYXJk
cywKPiBKdW5odWkgTGl1Cj4KPiA+PiArICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4
ZjE4MTQwMDAgMHgwIDB4ODAwMD47Cj4gPj4gKyAgICAgICAgICAgICAgICAgICAgcmVnLW5hbWVz
ID0gIm10aW1lY21wIjsKPiA+PiArICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzLWV4dGVu
ZGVkID0gPCZjcHUwX2ludGMgNz4sIDwmY3B1MV9pbnRjIDc+LAo+ID4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNwdTJfaW50YyA3PiwgPCZjcHUzX2ludGMg
Nz4sCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmY3B1
NF9pbnRjIDc+LCA8JmNwdTVfaW50YyA3PiwKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgPCZjcHU2X2ludGMgNz4sIDwmY3B1N19pbnRjIDc+Owo+ID4+ICsg
ICAgICAgICAgICB9Owo+ID4KPiA+Cj4gPiBSZWdhcmRzCj4gPiBBbmlydWRoIFNyaW5pdmFzYW4K
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
