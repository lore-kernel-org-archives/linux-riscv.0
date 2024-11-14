Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1F0D65C64
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 09:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8/jHG7GedDjY4HqeR7Pl3DHS5gZzo/BNRLQUZ82Zsgw=; b=tiEAlXh201Y9g6
	sIF82HZ65Tq/ZN08bJc411XgUlDqTc00z9lYVBtQts70pYMEi/iFzb0PH7K+ze78g3KWHpptO8q+5
	nEjSm0ktP7DGfC9vldQCJCP09xiMw3IG342UQuWmEYAWgu5M2CWLX+V7Sf3lAiGxS96+ZWVAvVnyK
	DkNGGmQE66qH9TBKmpGXGrt+moOizI/WrAagaUWFM3XJR5pKGwTkus8CMjmHj4QTwyqm30TBIpMRc
	KVNbv76lETPqRiK+JjnDD4jxWr+M6izXGlCdC4szLoMnNmOw/q7ToOU1K/z6CPr8SWnjbPdilOPor
	uuDKFGIt9NftCm5+Bb7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWJ0-00000009OKA-3hmD;
	Thu, 14 Nov 2024 09:38:26 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWIP-00000009O8J-1D1u
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 09:37:50 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-84fb1225a89so193006241.2;
        Thu, 14 Nov 2024 01:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731577067; x=1732181867; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehGB6dTMf4LXNmabx+6xsT2G4N4oRc0A26QJig4YDNQ=;
        b=LOtpRFLCa5weY917lMyXgyVAhZHqpnGl22Zl1FxgSfAIbQfXwGhIYuXf9VYvlAYXtU
         hdyIozSvEuyr8sQD9jUAvuSvX0VdVsEREJXvQjMsL3pG5dxLoo+qPFrIbBF5zwjZyF10
         /8FxGItl0NN1a4y3wR2kLP1A588h0+PQP9qAp2LwxngsyhFfTwvk4F6QncWK5AU8O8LX
         LHf0q0U9UTBTdl4LzZQnSF/tvGY/fTHOTtfjiTG1qh2twn86xowUmbR2CSQt4D6oKsXo
         8RJM9Sj17RW4AtQRu1AzW3TwxOpQHAPS71WYUaDII26S2UnbpQYXceBXLB+wju8CuSo7
         56Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731577067; x=1732181867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehGB6dTMf4LXNmabx+6xsT2G4N4oRc0A26QJig4YDNQ=;
        b=Xd97G3Ponxbk068rinad72SnrCgOSISqAeVIvirAd+DkPt9VIBN+9R/KWcha97sQ81
         uoZWccxOpqZ1dR9N9RczpPxR5bTqcOrNNF+XNOzv39rTj7jsR+ls9FgXbrXugBW2Cun7
         C3XniEv6MV1g5YvJpB3SUwM/IeIvpGyIJexJ6V0sLx9j9axqITmEuqSR33e6WhB4SaQg
         mFCPVQXL3CpRy/8fHhRRjVe1WQRWD1uUu0ECD5+BmmLxC7/8jR7KylEyItGX68fN71f/
         nHTTUIt4kXo2CBmXxgVDFhicBC41nL9zKVcY26WmYIpXNmC9Eg1JBH/njgxCRLy6LR3T
         BS+g==
X-Forwarded-Encrypted: i=1; AJvYcCUA7MmOzQ8p+8yuNffPedkvbCUbBZTlAuW+I04JrcRFNbSCxC/ApgH909g9p5qD7UMc05RQ0qGvbVLpTxgu6ZPV6Q==@lists.infradead.org, AJvYcCVFwNdMgSxncyFgeGwb05g3fI/B3fp+gFUGWlnyxSbP/Gz8NPX31PsPhNZNzO7IVMbfttaWqWnLPK6KWuk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4xJLaPnLYx1equOA+Ip+Xmcl+bbSu+zctBrG15RJEF/koWeTK
	73w8Y4Es8ZT4Ao+Bl4qrMNlWuKvvbKOM2q+iqxFfjmcdAF5aary8nwSKfAoN6EjBkC1lOhGOqbT
	hAsaiavEpjrMMa1loVLJyn6RV8YM=
X-Google-Smtp-Source: AGHT+IHI15hqHssAzfGGtyXPf31+1ZqoEAtir3h7D+FOXfOCfYcI4E+WZhvgG1S5uTZEAKfrOixmorXSlStST/rghQ8=
X-Received: by 2002:a05:6102:32cf:b0:4a3:c6f3:89c9 with SMTP id
 ada2fe7eead31-4aae138dcccmr23911356137.11.1731577066793; Thu, 14 Nov 2024
 01:37:46 -0800 (PST)
MIME-Version: 1.0
References: <f8cef6845a6141f0277e31a71fe153612daae776.1731436631.git.geert+renesas@glider.be>
In-Reply-To: <f8cef6845a6141f0277e31a71fe153612daae776.1731436631.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 14 Nov 2024 09:37:20 +0000
Message-ID: <CA+V-a8sdSBFin=edpj+p5k4KZU4aen+k0acJVTD35YxTbE1qYQ@mail.gmail.com>
Subject: Re: [PATCH] dma-mapping: Save base/size instead of pointer to shared
 DMA pool
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Oreoluwa Babatunde <quic_obabatun@quicinc.com>, Rob Herring <robh@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
	linux-renesas-soc@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_013749_360150_23EEF758 
X-CRM114-Status: GOOD (  14.55  )
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

T24gVHVlLCBOb3YgMTIsIDIwMjQgYXQgNjo0MeKAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbgo8Z2Vl
cnQrcmVuZXNhc0BnbGlkZXIuYmU+IHdyb3RlOgo+Cj4gT24gUlovRml2ZSwgd2hpY2ggaXMgbm9u
LWNvaGVyZW50LCBhbmQgdXNlcyBDT05GSUdfRE1BX0dMT0JBTF9QT09MPXk6Cj4KPiAgICAgT29w
cyAtIHN0b3JlIChvciBBTU8pIGFjY2VzcyBmYXVsdCBbIzFdCj4gICAgIENQVTogMCBVSUQ6IDAg
UElEOiAxIENvbW06IHN3YXBwZXIgTm90IHRhaW50ZWQgNi4xMi4wLXJjMS0wMDAxNS1nOGE2ZTAy
ZDBjMDBlICMyMDEKPiAgICAgSGFyZHdhcmUgbmFtZTogUmVuZXNhcyBTTUFSQyBFVksgYmFzZWQg
b24gcjlhMDdnMDQzZjAxIChEVCkKPiAgICAgZXBjIDogX19tZW1zZXQrMHg2MC8weDEwMAo+ICAg
ICAgcmEgOiBfX2RtYV9hbGxvY19mcm9tX2NvaGVyZW50KzB4MTUwLzB4MTdhCj4gICAgIGVwYyA6
IGZmZmZmZmZmODA2MmQyYmMgcmEgOiBmZmZmZmZmZjgwMDUzYTk0IHNwIDogZmZmZmZmYzYwMDAw
YmEyMAo+ICAgICAgZ3AgOiBmZmZmZmZmZjgxMmU5OTM4IHRwIDogZmZmZmZmZDYwMTkyMDAwMCB0
MCA6IGZmZmZmZmM2MDAwZDAwMDAKPiAgICAgIHQxIDogMDAwMDAwMDAwMDAwMDAwMCB0MiA6IGZm
ZmZmZmZmZTk2MDAwMDAgczAgOiBmZmZmZmZjNjAwMDBiYWEwCj4gICAgICBzMSA6IGZmZmZmZmM2
MDAwZDAwMDAgYTAgOiBmZmZmZmZjNjAwMGQwMDAwIGExIDogMDAwMDAwMDAwMDAwMDAwMAo+ICAg
ICAgYTIgOiAwMDAwMDAwMDAwMDAxMDAwIGEzIDogZmZmZmZmYzYwMDBkMTAwMCBhNCA6IDAwMDAw
MDAwMDAwMDAwMDAKPiAgICAgIGE1IDogMDAwMDAwMDAwMDAwMDAwMCBhNiA6IGZmZmZmZmQ2MDFh
ZGFjYzAgYTcgOiBmZmZmZmZkNjAxYTg0MWE4Cj4gICAgICBzMiA6IGZmZmZmZmQ2MDE4NTczYzAg
czMgOiAwMDAwMDAwMDAwMDAxMDAwIHM0IDogZmZmZmZmZDYwMTk1NDFlMAo+ICAgICAgczUgOiAw
MDAwMDAwMjAwMDAwMDIyIHM2IDogZmZmZmZmZDYwMThmODQxMCBzNyA6IGZmZmZmZmQ2MDE4NTcz
ZTgKPiAgICAgIHM4IDogMDAwMDAwMDAwMDAwMDAwMSBzOSA6IDAwMDAwMDAwMDAwMDAwMDEgczEw
OiAwMDAwMDAwMDAwMDAwMDEwCj4gICAgICBzMTE6IDAwMDAwMDAwMDAwMDAwMDAgdDMgOiAwMDAw
MDAwMDAwMDAwMDAwIHQ0IDogZmZmZmZmZmZkZWZlNjJkMQo+ICAgICAgdDUgOiAwMDAwMDAwMDFj
ZDZhM2E5IHQ2IDogZmZmZmZmZDYwMWIyYWFkNgo+ICAgICBzdGF0dXM6IDAwMDAwMDAyMDAwMDAx
MjAgYmFkYWRkcjogZmZmZmZmYzYwMDBkMDAwMCBjYXVzZTogMDAwMDAwMDAwMDAwMDAwNwo+ICAg
ICBbPGZmZmZmZmZmODA2MmQyYmM+XSBfX21lbXNldCsweDYwLzB4MTAwCj4gICAgIFs8ZmZmZmZm
ZmY4MDA1M2UxYT5dIGRtYV9hbGxvY19mcm9tX2dsb2JhbF9jb2hlcmVudCsweDFjLzB4MjgKPiAg
ICAgWzxmZmZmZmZmZjgwMDUzMDU2Pl0gZG1hX2RpcmVjdF9hbGxvYysweDk4LzB4MTEyCj4gICAg
IFs8ZmZmZmZmZmY4MDA1MjM4Yz5dIGRtYV9hbGxvY19hdHRycysweDc4LzB4ODYKPiAgICAgWzxm
ZmZmZmZmZjgwMzVmZGI0Pl0gcnpfZG1hY19wcm9iZSsweDNmNi8weDUwYQo+ICAgICBbPGZmZmZm
ZmZmODAzYTA2OTQ+XSBwbGF0Zm9ybV9wcm9iZSsweDRjLzB4OGEKPgo+IElmIENPTkZJR19ETUFf
R0xPQkFMX1BPT0w9eSwgdGhlIHJlc2VydmVkX21lbSBzdHJ1Y3R1cmUgcGFzc2VkIHRvCj4gcm1l
bV9kbWFfc2V0dXAoKSBpcyBzYXZlZCBmb3IgbGF0ZXIgdXNlLCBieSBzYXZpbmcgdGhlIHBhc3Nl
ZCBwb2ludGVyLgo+IEhvd2V2ZXIsIHdoZW4gZG1hX2luaXRfcmVzZXJ2ZWRfbWVtb3J5KCkgaXMg
Y2FsbGVkIGxhdGVyLCB0aGUgcG9pbnRlcgo+IGhhcyBiZWNvbWUgc3RhbGUsIGNhdXNpbmcgYSBj
cmFzaC4KPgo+IEUuZy4gaW4gdGhlIFJaL0ZpdmUgY2FzZSwgdGhlIHJlZmVyZW5jZWQgbWVtb3J5
IG5vdyBjb250YWlucyB0aGUKPiByZXNlcnZlZF9tZW0gc3RydWN0dXJlIGZvciB0aGUgIm1tb2Rl
X3Jlc3YwQDMwMDAwIiBub2RlICh3aXRoIGJhc2UKPiAweDMwMDAwIGFuZCBzaXplIDB4MTAwMDAp
LCBpbnN0ZWFkIG9mIHRoZSBjb3JyZWN0ICJwbWFfcmVzdjBANTgwMDAwMDAiCj4gbm9kZSAod2l0
aCBiYXNlIDB4NTgwMDAwMDAgYW5kIHNpemUgMHg4MDAwMDAwKS4KPgo+IEZpeCB0aGlzIGJ5IHNh
dmluZyB0aGUgbmVlZGVkIHJlc2VydmVkX21lbSBzdHJ1Y3R1cmUncyBjb250ZW50cyBpbnN0ZWFk
Lgo+Cj4gRml4ZXM6IDhhNmUwMmQwYzAwZTdiNjIgKCJvZjogcmVzZXJ2ZWRfbWVtOiBSZXN0cnVj
dHVyZSBob3cgdGhlIHJlc2VydmVkIG1lbW9yeSByZWdpb25zIGFyZSBwcm9jZXNzZWQiKQo+IFNp
Z25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+
Cj4gLS0tCj4gIGtlcm5lbC9kbWEvY29oZXJlbnQuYyB8IDE0ICsrKysrKysrLS0tLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4KVGVzdGVkLWJ5
OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+
CgpDaGVlcnMsClByYWJoYWthcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
