Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F40CA9EDE
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 18:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oLp988JBD0Mnmy+mya5Qf9NNTqRHS+iFjkluY2Qj/Yc=; b=S8T24Mh2NVRtHV
	2VJALlhvte1bflE39wdOW4xNxS4cUPzjIMGAg6VIXiqL0zuEu7pL+kJEBRSS/vX0v/WW333vSXqMp
	xxm2dmGQFlu5pr4eLMaod2oXpL5/RI+n/HziEFJo7rf3uuZ6WAqfOTrCqgchbxkSDabf3nlI4iJtO
	dlp33N2AgqdjaGD7R2TTymcLdst1KEinlXZFxvEfcCMJReTMgAFTd7wTpM5cv13aFaGGOpd0Lqvmm
	KiMc2ad470jJzjDRXbsFMoEebBn1+DnL8in9S3qxh1cF7V4TMuCXM7PfvXS6W04QYLtCNVV2DuM6S
	/n4bceV9bzMxrPb90ffQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGL0J-0000000BH87-07uL;
	Mon, 12 Oct 2026 18:44:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGL0F-0000000BH5E-0M7m
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 18:44:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791830640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mp4Az4pn5hEgJeWah5nozn6weJjpUXzUrROIxr1Rl0E=;
	b=OU5NZKm62Ix8p6qN3gEETIluNOCNtZR3ZJqN9tJ/Ey2nkyiIx/Ib3B06fL1T/vtQC1NAyP
	rVVt+4ABR2Gm6oqTOkXYlDu8qeD12BGIW/Fy/UaW7G5tu40pXnTKSbWnP20fqeBFxTUAai
	JCOSr0TIjitwD6D4THX6IfVMNXuVVUM=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-H3WlGnneOZWkByGBcw1Pgw-1; Mon, 12 Oct 2026 18:43:58 +0000
X-MC-Unique: H3WlGnneOZWkByGBcw1Pgw-1
X-Mimecast-MFC-AGG-ID: H3WlGnneOZWkByGBcw1Pgw_1791830638
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-47d81384b4bso2655860fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 11:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791830638; x=1792435438;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Mp4Az4pn5hEgJeWah5nozn6weJjpUXzUrROIxr1Rl0E=;
        b=GXZDWfLN2G8qia7BeTCzie9Z43j8xwb6AfeL+n3A+3slHJPoW4l6DKwC8lshWFKcCq
         RHQKbtD63inwgXRm7YXY9Sc+JYWzQzysGh0lPYL4yEkvo9pGaK6AIpsTDQ/b2T7d750W
         7ioyH2QBcVNDkmpfmoEjnN087CY9D2/pjP+HgZIj2VmAZl/IAVgfRreQZSY1FyWZdQw4
         AMLfXCIQkwpOyuvCUSXHOF3M4I4K4I6W9J2xTib9fvdEmyfK4I6JEr02QCQpQFhP1sE9
         24a+qiYgC+TH5EWC0nr1Je6GTHlIGsVXE7nyNbg8kVeKgTHpmfOWQ03hr1dXYB0Jzlm2
         gfQw==
X-Forwarded-Encrypted: i=1; AKwUvBz3cYFfGtcziNER42Mg3d4QsbSIegurrbdJ3yBXJ5fD9BVqEr02N9S3Mg3ybCZJWT2XnoKvg7dkXfk6BA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLnXB0YM9cTkZ9wsAg7sWQRmuujmUKbXVJXeQzo6Aclh6ujO8H2
	8Fesaw//cNmsIf8Dox82WiUNj9b7SOUypleiO1lbFSRsYPSvENYB7yegBM/Cx24Mljzbpylm+wX
	PZ8dS2QuRj9mRSoudIbQ8ehwPJCETGFZea4sqnYUXTDp5rRzDL+upHDD674npK7jq2Vy0wA==
X-Gm-Gg: AYBFou1X6rSaGPXnbHpAUrkDZw9BP8kAcEO1mrBdRYzxTosrm1y0Tua+Z5OzJLjwPoV
	C5C2XbbrmC7QwALlN3evyzCBvkf4gMFVzDiVCuHUply5nj4nSls6Spct8JjlNoQ+znT1/8zUCtI
	TT8Y9P8roLXxssJa8iS2lkaITFDqX25gzkZWjJhIV5wYsDUuqz2oBC86nxzOkIPbjXYjOQ4pAyk
	/2I+DGbUzX0mgh6H0q8AED2zYRWLR83cfjuQIOTJjicdBZbu7fUVk1MBGHiDZlqH8CrvGlOXDea
	KW1bD/RtH3A3oJHvE8++cDbOkYgOKiEWVQpRfMcbaOYFnpK9t95fKw==
X-Received: by 2002:a05:6123:550:20b0:5c9:a60c:273d with SMTP id 71dfb90a1353d-5e91f4fc783mr2548296e0c.21.1791829927036;
        Mon, 12 Oct 2026 11:32:07 -0700 (PDT)
X-Received: by 2002:a05:6123:550:20b0:5c9:a60c:273d with SMTP id 71dfb90a1353d-5e91f4fc783mr2548281e0c.21.1791829926536;
        Mon, 12 Oct 2026 11:32:06 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e92f300f42sm5764908e0c.0.2026.10.12.11.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:32:06 -0700 (PDT)
Date: Mon, 12 Oct 2026 14:32:04 -0400
From: Jennifer Berringer <jberring@redhat.com>
To: Shengyu Qu <wiagn233@outlook.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	James Morris <jmorris@namei.org>
Subject: Re: [PATCH 4/4] riscv: dts: spacemit: k3-com260-ifx: Add rfkill nodes
Message-ID: <20261012183204.c845fc69@redhat.com>
References: <20260928231807.1757995-1-jberring@redhat.com>
 <20260928231807.1757995-5-jberring@redhat.com>
 <TYWPR01MB10887E1A3744FD44000F89E8F98922@TYWPR01MB10887.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <TYWPR01MB10887E1A3744FD44000F89E8F98922@TYWPR01MB10887.jpnprd01.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xZlWhnPgUZIr03f5YG_UGyOlpcVnkNEm1XoXSAEnyBA_1791830638
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_114403_209015_0B86F297 
X-CRM114-Status: GOOD (  24.59  )
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

SGksCgpPbiBTYXQsIE9jdCAxMCwgMjAyNiBhdCAwMzowODozNUFNICswODAwLCBTaGVuZ3l1IFF1
IHdyb3RlOgo+IEhpLAo+IAo+IEkgZG9uJ3QgdGhpbmsgZG9pbmcgbGlrZSB0aGlzIGlzIGNvcnJl
Y3QuLiBXZSBoYXZlIGEgZGVkaWNhdGVkIE0uMiBFa2V5Cj4gYmluZGluZyBhbmQgc2hvdWxkIHVz
ZSB0aGF0Ogo+IAo+IGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9iL21hc3Rl
ci9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY29ubmVjdG9yL3BjaWUtbTItZS1j
b25uZWN0b3IueWFtbAo+IAo+IEJlc3QgcmVnYXJkcywKPiBTaGVuZ3l1CgpUbyBteSB1bmRlcnN0
YW5kaW5nLCB0aGUgcHdyc2VxLXBjaWUtbTIgZHJpdmVyIHRoYXQgdXNlcyB0aGlzIGJpbmRpbmcK
Y3VycmVudGx5IG9ubHkgc3VwcG9ydHMgc3lzdGVtcyB0aGF0IHVzZSBVQVJUIGZvciBCbHVldG9v
dGgsIGFuZCBpcwpuZWVkZWQgZm9yIHRoZW0gYmVjYXVzZSBVQVJUIGlzIGEgbm9uLWRpc2NvdmVy
YWJsZSBidXMuIFF1b3RpbmcgdGhlCmNvdmVyIGxldHRlciBvZiB0aGUgc2VyaWVzIHRoYXQgaW50
cm9kdWNlZCB0aGlzIGJpbmRpbmc6CgoiVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBjb25u
ZWN0b3JzIHRoYXQgZXhwb3NlIFBDSWUgaW50ZXJmYWNlIGZvcgpXaUZpIGFuZCBVQVJUIGludGVy
ZmFjZSBmb3IgQlQuIE90aGVyIGludGVyZmFjZXMgYXJlIGxlZnQgZm9yIGZ1dHVyZQppbXByb3Zl
bWVudHMuIiBbMV0KCkszIENvTTI2MCBEZXYgS2l0IHNoaXBzIHdpdGggaXRzIEUta2V5IHNsb3Qg
cG9wdWxhdGVkIHdpdGggYW4gUlRMODg1MkJFCm1vZHVsZSwgd2hpY2ggdXNlcyBQQ0llIGZvciBX
aUZpIGFuZCBVU0IyIGZvciBCVC4gSSB2ZXJpZmllZCB0aGF0IG15CnBhdGNoIHNlcmllcyBkb2Vz
IG1ha2UgdGhlIHJma2lsbCBjb21tYW5kIGJlIGFibGUgdG8gZGlzY29ubmVjdCBhbmQKcmVjb25u
ZWN0IHRoZSBXaUZpIGFuZCBCVCBkZXZpY2VzIHdpdGggdGhpcyBtb2R1bGUuIEkgYWxzbyB0ZXN0
ZWQgdGhpcwpwYXRjaCBzZXQgd2l0aCBhbiBJbnRlbCBBWDIxMC4KCkluIGFkZGl0aW9uIHRvIFBD
SWUgYW5kIFVTQjIsIHRoaXMgYm9hcmQgYWxzbyBoYXMgaXRzIE0uMiBFLWtleSBzbG90CmNvbm5l
Y3RlZCB0byBzZGlvLCB1YXJ0NiwgYW5kIGkyczMsIGJ1dCBub25lIG9mIHRob3NlIGFyZSBjdXJy
ZW50bHkKZW5hYmxlZCBpbiB0aGlzIGR0cyBhbmQgdGhlIFJUTDg4NTJCRSBtb2R1bGUgZG9lcyBu
b3QgdXNlIHRoZW0uCgpTZXZlcmFsIG90aGVyIGV4aXN0aW5nIGRldmljZSB0cmVlcyBzZWVtIHRv
IHVzZSByZmtpbGwtZ3BpbyBub2RlcyB0bwpjb250cm9sIFdfRElTQUJMRSBwaW5zIG9uIE0uMiBF
LWtleSBzbG90cy4gTG9va2luZyBhdCByazM1ODggYm9hcmRzIGZvcgpleGFtcGxlOiBPcmFuZ2VQ
aSA1IFBsdXMsIEFybVNvTSBXMywgYW5kIFJvY2sgNUIgYWxsIGRvIHNvIGluIHRoZQpjdXJyZW50
IHRyZWUuCgpVbmxpa2UgdGhvc2UsIHRoZSByZmtpbGwgbm9kZXMgaW4gbXkgcGF0Y2ggYXJlbid0
IGFjdHVhbGx5IG5lY2Vzc2FyeSBmb3IKdXNhYmxlIFdpRmkgYW5kIEJUIG9uIHRoaXMgYm9hcmQu
IFRoZSBzaHV0ZG93bi1ncGlvcyBoZXJlIGFyZQpHUElPX0FDVElWRV9MT1cgYW5kIHRoaXMgbWVy
ZWx5IGFsbG93cyB1c2luZyByZmtpbGwgdG8gYmxvY2sgYm90aCByYWRpb3MKdmlhIHRoZSBXX0RJ
U0FCTEUgcGlucywgc28gSSdtIG5vdCBvcHBvc2VkIHRvIGRyb3BwaW5nIHRoaXMgcGF0Y2ggaWYK
YW55b25lIGJlbGlldmVzIGl0IHNob3VsZCBiZSBkcm9wcGVkLgoKWzFdIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xrbWwvMjAyNjAzMjYtcGNpLW0yLWUtdjctMC00MzMyNGE3ODY2ZTZAb3NzLnF1
YWxjb21tLmNvbS8KCj4gCj4g5ZyoIDIwMjYvOS8yOSAwNzoxOCwgSmVubmlmZXIgQmVycmluZ2Vy
IOWGmemBkzoKPiA+IEszIENvTTI2MCBJRlggaGFzIGFuIE0uMiBFLWtleSBzbG90IGZvciB3aXJl
bGVzcy4gQWRkIHJma2lsbCBub2RlcyBmb3IKPiA+IHRoZSBHUElPcyB0aGF0IGNvbnRyb2wgdGhl
IHNsb3QncyBXX0RJU0FCTEUxIyBhbmQgV19ESVNBQkxFMiMgcGlucyBmb3IKPiA+IFdMQU4gYW5k
IEJsdWV0b290aC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSmVubmlmZXIgQmVycmluZ2VyIDxq
YmVycmluZ0ByZWRoYXQuY29tPgo+ID4gLS0tCj4gPiAgIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3Bh
Y2VtaXQvazMtY29tMjYwLWlmeC5kdHMgfCAxNCArKysrKysrKysrKysrKwo+ID4gICAxIGZpbGUg
Y2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9ib290L2R0cy9zcGFjZW1pdC9rMy1jb20yNjAtaWZ4LmR0cyBiL2FyY2gvcmlzY3YvYm9vdC9k
dHMvc3BhY2VtaXQvazMtY29tMjYwLWlmeC5kdHMKPiA+IGluZGV4IDAxZTI4NmNiMDU3OTcuLmNk
ODc4MzQwZTVhZGQgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0
L2szLWNvbTI2MC1pZnguZHRzCj4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0
L2szLWNvbTI2MC1pZnguZHRzCj4gPiBAQCAtNDcsNiArNDcsMjAgQEAgcmVnX2F1eF92Y2MzdjM6
IHJlZ3VsYXRvci1hdXgtdmNjM3YzIHsKPiA+ICAgCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9
IDwzMzAwMDAwPjsKPiA+ICAgCQlyZWd1bGF0b3ItYWx3YXlzLW9uOwo+ID4gICAJfTsKPiA+ICsK
PiA+ICsJcmZraWxsLXBjaWUtd2xhbiB7Cj4gPiArCQljb21wYXRpYmxlID0gInJma2lsbC1ncGlv
IjsKPiA+ICsJCWxhYmVsID0gInJma2lsbC1wY2llLXdsYW4iOwo+ID4gKwkJcmFkaW8tdHlwZSA9
ICJ3bGFuIjsKPiA+ICsJCXNodXRkb3duLWdwaW9zID0gPCZncGlvIEszX0dQSU8oNzMpIEdQSU9f
QUNUSVZFX0xPVz47Cj4gPiArCX07Cj4gPiArCj4gPiArCXJma2lsbC11c2ItYnQgewo+ID4gKwkJ
Y29tcGF0aWJsZSA9ICJyZmtpbGwtZ3BpbyI7Cj4gPiArCQlsYWJlbCA9ICJyZmtpbGwtdXNiLWJ0
IjsKPiA+ICsJCXJhZGlvLXR5cGUgPSAiYmx1ZXRvb3RoIjsKPiA+ICsJCXNodXRkb3duLWdwaW9z
ID0gPCZncGlvIEszX0dQSU8oNTcpIEdQSU9fQUNUSVZFX0xPVz47Cj4gPiArCX07Cj4gPiAgIH07
Cj4gPiAgICZjb21ib3BoeSB7Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
