Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636E0D3940B
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 10:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ka/sDTRPNBCNRKrtA4tB3cFJ7h0gR+dvYmQxoEoghb8=; b=x1eK/rWPVESeYw
	31qrgsrUXbMQwVKWDc5HIsO2BrYoBboCnxS+JF38hiW2iadfSgmJfwKGw6HbvlcwomkupUJWX+Suk
	aI9DOBkqvGU6O7f0s3oO8+GQxmVpfeD2JkxQVeHj51laaLG2MzDsW23m3+VYfkAoUnJADleCw2wEB
	o7hLxpswGFjn+2HNOoBtpbxWU13fL0hGcGXit4EmmnyVpAz4iqE1fJfMkaahEJwF0egteUyGx/IGC
	GVL8sGbnVfF6xpIuHEty6saxASmnEhSi4gcC5eSpKrEX0eIG7unVlFH16+b/S1+YvvRd9OAvBmjnr
	TDCDsAx/HhOE+5QWm6Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FKM-0000000HPer-3SCH;
	Thu, 02 Apr 2026 10:31:06 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FKK-0000000HPe7-2IIb
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 10:31:05 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-94ac8cbf3feso452818241.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Apr 2026 03:31:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775125863; cv=none;
        d=google.com; s=arc-20240605;
        b=LBcrQuwYoP0imfMqW3LIiX0EZAPckSeJB0JbeB5wYJmg2A6GHDgL776YRWpLZUxKHC
         ayYg1qUYLzXdvdf6p9hUTOQCaZDGArbUxEI1Dbfm3eZgmRitlWmSS9ciMxGl8OlLL19K
         60SQI+4Z647KZUtTGdVP7XXnys8rJ7G1tM0ojbDANrY2XU7Cwn+8xuvztMESV5M/jvD/
         C560LzxLr17f4uKpFRO0/Hkl2VbL1fJVOt9GCvANL+eYOpze2+GHAcZ4ETzdwPJcoGxY
         LopNzWyK+MjS5VFTLyXibggxOkLOnJp2mHWGCr3vLIFPDacP0+0xzPTv+4Jt/Io920BZ
         PzpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Ob4WvASBXKLoNDxbRXnh3mN8JCXap6XQdaiWgxzkgI=;
        fh=9J8SYfj6viu8lCv3tbjuMC4w8LuIPWnxkQ45VzL9ON4=;
        b=aoIHRprpdZvOHpJ4paCyRNXyBbFPJFnZJn6EL6RrJyx+LDeScHaLk2i1tE5HhL8cV/
         yX79zgn3pNpZjl6oG7TfeEfWeI5rn4gSeOKE0MpZ55N6kgBFceWkLd4NZ33iS3WPxxE3
         ytlwVUkGrAH74KMcYfuLJUAQPGkjBVlXPHt9x5lpkLnnzb6/YsNMigB1MLnow89Fx/Cb
         RlxQfIN5S01znfOx5/wVQvXGlnXuCs3KUzHfpmRldzcD6nxNHxezXjYrzzW4bXrosrZZ
         Bz3+0LfMzLf97z9K3nLvU0w9lZ8KR9em4ZiGXiGc73ik2fl3PO01UM9T1SsweTG+2/fE
         2vng==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775125863; x=1775730663; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ob4WvASBXKLoNDxbRXnh3mN8JCXap6XQdaiWgxzkgI=;
        b=kwZhOQVMWUZep9ZTQsV9/9LwM618L6vA+p2PgQZZ5JVHMkfPeJdijjk+jeDs1sYxJx
         c85l/Akbk5jqW16Mp1jsoWltpjzzLaPtzeAzZSTUsUeYLNFrzhA0GaEvjjYsncigtakM
         KBEg12cF+n2/06crvIHGMUbPMv5umKxpf/OhTpkKLQ6N/EtcMKVf1lzLGRA/dqn+A7Pn
         fGPFuYnyngjgJpUP5T7DyFox324tTXR/LQSdWEbYR8hXZ6GOvUwb4VNozExEJ5ZcwHUF
         n24n05o3uA9pkQjSuewJ6G0HeSgLS4/6YiEZ9buXtdR1IJtdMJgLhyAtle7CFGYEvaWl
         USHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775125863; x=1775730663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Ob4WvASBXKLoNDxbRXnh3mN8JCXap6XQdaiWgxzkgI=;
        b=iW7BLfYAHpPR1S867QxIWiDDwhC25FyKH1D6WinKAxG+KUhxF6pITijx92jD83ACM2
         7AEvFwZcecpKBuvYCUeU9xGnYg5hL3hJIKTt8LWNLjmSaWv1waJYrvkVmj2sZLoKTls2
         c7Gyq0zQF+idCuArk1KadgEnGl3YWW+8Bo7qwbVNxGZI0Ngi4T16uFrpPJH6XQWpzqpi
         3eoQqs/aA7Vx+uHMH3WFiChMsMhk4g5pulNOx+4My3zTSJrMgP29WrOgWujdfNomwqhu
         WTkrQxlnh/tUfEGYdYWz+fiO2xuyyXyk0VINTMdRXC2KJxN1jLicu7jYBuhDtf0ahm+u
         +xiA==
X-Forwarded-Encrypted: i=1; AJvYcCV8BpkhRhwioC+jwB3463rcoGcrC2GxsZMJZIDAeyPzWD+V7BC20Zh5kw7eoXR19yapk1dhA9gKMC9K4w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyI7e7SRCDqr5vLU8blDf3sMSxAp9m80oVEnPqehcmlr4ZnjetY
	U8P9BlZA+5aX0orbSKa/ZPKH66OQRcF2th8OxOdwZgqGUUMNsOC288eqhkeMRpcoJbDSUliJJEY
	yYf+nCga8LUsLsX6flWkW8wPxnmqamj2bSp8tWXMPvg==
X-Gm-Gg: ATEYQzwsHGWIBs7sBFqRs5x9EsMFXXutLwId4x8Byx7XZI4BxLPEXMm0AYPKHr/+E/r
	zxbrPP4EQxGVhi5n7IpVAQsAoYGMZpu3rgA0z55m0crd7tMiM9/wvxyUYd31DWE6nynuEOiOnjb
	ub7CACFQ9KrI+7CIinuXpTKD7XUIgbQBVBNXY3JNF5Lv1cM+YjNwEwyKDh2loAL2W1km+hI8Xw4
	/7im6Gkx3LJ2D7cb10MNc3zx6SYb0v51AuGZJDkrNQVWUTwISoypK7/dEiuyFK56W5url4Kl3SB
	xi4vr7Lx5TQCqTa5Ah4J4tHPJw3ne7lFLKzuoQ8=
X-Received: by 2002:a05:6102:5343:b0:605:17b8:16db with SMTP id
 ada2fe7eead31-605681ba7d8mr2632044137.25.1775125862274; Thu, 02 Apr 2026
 03:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260331171248.973014-1-gaohan@iscas.ac.cn> <20260331171248.973014-3-gaohan@iscas.ac.cn>
 <MA5PR01MB12500707BE1C6E11EC3F4B94FFE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA5PR01MB12500707BE1C6E11EC3F4B94FFE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
From: Han Gao <rabenda.cn@gmail.com>
Date: Thu, 2 Apr 2026 18:30:49 +0800
X-Gm-Features: AQROBzCGzBaggmtPSR3_A5qLKsf5xg9SqM3fnlQMsletNH9S6oyqQ5RfqOQtIhM
Message-ID: <CAAT7Ki_BkfYCN_AJtksOEopU2r0iYPybuEQfm+pMLpsm8+EJkA@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: Add dma-coherent to SG2042 PCIe controllers
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Zixian Zeng <sycamoremoon376@gmail.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_033104_622360_93C02D2D 
X-CRM114-Status: GOOD (  21.86  )
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

T24gVGh1LCBBcHIgMiwgMjAyNiBhdCA0OjQ04oCvUE0gQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdA
b3V0bG9vay5jb20+IHdyb3RlOgo+Cj4KPiBPbiA0LzEvMjAyNiAxOjEyIEFNLCBIYW4gR2FvIHdy
b3RlOgo+ID4gU0cyMDQyJ3MgUENJZSByb290IGNvbXBsZXhlcyBhcmUgY2FjaGUtY29oZXJlbnQg
d2l0aCB0aGUgQ1BVLiBNYXJrIGFsbAo+ID4gZm91ciBQQ0llIGNvbnRyb2xsZXIgbm9kZXMgKHBj
aWVfcmMwIHRocm91Z2ggcGNpZV9yYzMpIGFzIGRtYS1jb2hlcmVudAo+ID4gc28gdGhlIGtlcm5l
bCB1c2VzIGNvaGVyZW50IERNQSBtYXBwaW5ncyBpbnN0ZWFkIG9mIG5vbi1jb2hlcmVudCBib3Vu
Y2UKPiA+IGJ1ZmZlcmluZy4KPiA+Cj4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4g
U2lnbmVkLW9mZi1ieTogSGFuIEdhbyA8Z2FvaGFuQGlzY2FzLmFjLmNuPgo+ID4gLS0tCj4gPiAg
IGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi5kdHNpIHwgNCArKysrCj4gPiAgIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3Nv
cGhnby9zZzIwNDIuZHRzaQo+ID4gaW5kZXggOWZkZGYzZjBiM2I5Li4zYWY3NzA1NDk3NDIgMTAw
NjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDIuZHRzaQo+ID4g
KysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLmR0c2kKPiA+IEBAIC00MTcs
NiArNDE3LDcgQEAgcGNpZV9yYzA6IHBjaWVANzA2MDAwMDAwMCB7Cj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgdmVuZG9yLWlkID0gPDB4MWYxYz47Cj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ZGV2aWNlLWlkID0gPDB4MjA0Mj47Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgY2Rucyxuby1i
YXItbWF0Y2gtbmJpdHMgPSA8NDg+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGRtYS1jb2hl
cmVudDsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBtc2ktcGFyZW50ID0gPCZtc2k+Owo+ID4g
ICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gPiAgICAgICAgICAg
ICAgIH07Cj4gPiBAQCAtNDM5LDYgKzQ0MCw3IEBAIHBjaWVfcmMxOiBwY2llQDcwNjA4MDAwMDAg
ewo+ID4gICAgICAgICAgICAgICAgICAgICAgIHZlbmRvci1pZCA9IDwweDFmMWM+Owo+ID4gICAg
ICAgICAgICAgICAgICAgICAgIGRldmljZS1pZCA9IDwweDIwNDI+Owo+ID4gICAgICAgICAgICAg
ICAgICAgICAgIGNkbnMsbm8tYmFyLW1hdGNoLW5iaXRzID0gPDQ4PjsKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICBkbWEtY29oZXJlbnQ7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgbXNpLXBh
cmVudCA9IDwmbXNpPjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJs
ZWQiOwo+ID4gICAgICAgICAgICAgICB9Owo+ID4gQEAgLTQ2MSw2ICs0NjMsNyBAQCBwY2llX3Jj
MjogcGNpZUA3MDYyMDAwMDAwIHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICB2ZW5kb3ItaWQg
PSA8MHgxZjFjPjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBkZXZpY2UtaWQgPSA8MHgyMDQy
PjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBjZG5zLG5vLWJhci1tYXRjaC1uYml0cyA9IDw0
OD47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgZG1hLWNvaGVyZW50Owo+ID4gICAgICAgICAg
ICAgICAgICAgICAgIG1zaS1wYXJlbnQgPSA8Jm1zaT47Cj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgc3RhdHVzID0gImRpc2FibGVkIjsKPiA+ICAgICAgICAgICAgICAgfTsKPiA+IEBAIC00ODMs
NiArNDg2LDcgQEAgcGNpZV9yYzM6IHBjaWVANzA2MjgwMDAwMCB7Cj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgdmVuZG9yLWlkID0gPDB4MWYxYz47Cj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ZGV2aWNlLWlkID0gPDB4MjA0Mj47Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgY2Rucyxuby1i
YXItbWF0Y2gtbmJpdHMgPSA8NDg+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGRtYS1jb2hl
cmVudDsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBtc2ktcGFyZW50ID0gPCZtc2k+Owo+ID4g
ICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gPiAgICAgICAgICAg
ICAgIH07Cj4gRm9yIGJpbmRpbmcgY2hhbmdlcywgTEdUTS4gQnV0IEkgaGF2ZSBhIHF1ZXN0aW9u
IHJlZ2FyZGluZyB0aGlzIGNoYW5nZQo+IGluIGR0c2kuCj4KPiAgRnJvbSB5b3VyIHBhdGNoIGRl
c2NyaXB0aW9uLCBJIHVuZGVyc3RhbmQgdGhhdCBlbmFibGluZyB0aGUKPiBgZG1hLWNvaGVyZW50
YCBhdHRyaWJ1dGUgcmVxdWlyZXMgdXBncmFkaW5nIHRoZSBmaXJtd2FyZSBgZmlwLmJpbmAuIElm
IGEKPiB1c2VyIG9ubHkgdXBkYXRlcyB0aGUga2VybmVsICh3aGljaCBpcyByZWxhdGl2ZWx5IGVh
c3kpIGJ1dCBmb3JnZXRzIG9yCj4gZG9lc24ndCBrbm93IGhvdyB0byB1cGdyYWRlIHRoZSBmaXJt
d2FyZSwgZW5hYmxpbmcgYGNvaGVyZW50YCBtaWdodAo+IGNhdXNlIHRoZSBrZXJuZWwgdG8gc2tp
cCBhbGwgZXhwbGljaXQgY2FjaGUgbWFpbnRlbmFuY2Ugb3BlcmF0aW9ucy4KPiBDb3VsZCB0aGlz
IHBvc2UgYSBzdWJ0bGUgcmlzaz8KPgo+IFdvdWxkbid0IGl0IGJlIHNhZmVyIHRvIGxlYXZlIHRo
ZSB1cHN0cmVhbSB1bmNoYW5nZWQgaW4gZHRzaSBhbmQgYWxsb3cKPiB1c2VycyB0byBhZGQgdGhl
IGBkbWEtY29oZXJlbnRgIGF0dHJpYnV0ZSB0aGVtc2VsdmVzIGFmdGVyIHRoZXkgdXBncmFkZQo+
IHRoZSBmaXJtd2FyZT8KCkluIHRoZSBmaXJtd2FyZSwgZmlwLmJpbiBhbmQgZGV2aWNldHJlZSBh
cmUgZGlzdHJpYnV0ZWQgdG9nZXRoZXIuClNvIG1hdGNoaW5nIGlzc3VlcyBhcmUgdW5saWtlbHku
Cgo+Cj4gSSB3b3VsZCBncmVhdGx5IGFwcHJlY2lhdGUgeW91ciBndWlkYW5jZS4KPgo+IFRoYW5r
cywKPgo+IENoZW4KPgo+CgpUaGFua3MsCkhhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
