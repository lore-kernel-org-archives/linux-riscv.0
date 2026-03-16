Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7C3F46421
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 09:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YgvlNqcvAX1N5CXDMcoaDeTbq+YSxtqenoynSV9ALiQ=; b=lhVQaD2mfHOzwA
	cAc56jOA5te9StZ/IkpZ3iQeMn4Pi4aiJDxP5UOuFH01t+JJKbxrU3aIYwdpqK/ri+1s+VyAPM9I2
	0vqnm2cJkRtgqh6/LqlTK34NTfCeJnqzySLx3wdlfOJu1oBNkiU8rwNF7TyEwduH+uqlR9AIADDtd
	+OSi5l2ACF9NPwo/NzxE2A+hzux4xqNHUi8YHNyO4T0jCP3cyU0BbeMbRkBcaj7aan8iJdxCn1wxd
	y6X8mYVAiAHzPfiybFSeVUqe6ndCpJE+xeG9iJfyX7tdomohLbkkkjDKzUjV1le+nOmokVTg6jEH2
	1ezS7YQShqNQEPDSFx7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24F0-00000003ddw-0hP2;
	Mon, 16 Mar 2026 09:28:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24Ex-00000003ddV-3KJd
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 09:28:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7427E444DF
	for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 09:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F960C2BCB7
	for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 09:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773653279;
	bh=O/YgTgaQRwnEXirxmU+ykEQ0yOSJ8I1KRJZXk4GajnM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=um21Ly8SseFTJHB6APb8c1vvjnw4Qo3PPBAIuDnbeBrrANm5pl8YoBi7+1xda+Yr+
	 g/SGslQ+inPIVImOKjxIk2VVXTggEuQJPM2ClVZBMiPWSjctuKkXZ8fPHvmZeVgWza
	 jpmtLCvv9bb0CP9lOUVRJWLyr6M8CgYCpeWxI9DfslyABaOd/EkUPnCqngTSPCWfBf
	 r2QG4fFdj8HHPulDlP+wr8sNcQsC8aXhxTeNrKM0p7j3u+qhWLqYpr9hFXWQ5gmd1C
	 G2UtcWVHohy5sFB+9BSFwsOxXKqKAeL8creJrKi3+vPQuCMFfjadxqYEAXLklLOQb7
	 Yae+EasyHNBmA==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79801df3e42so54155667b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 02:27:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVyVBH7KxHMlv1F7oBfBQ15ZT31tW08Mp9vDPnNYH311ZO3YG7vbhwoF2L5UlkNJytmkWFwbmrB1rwqbg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxeK/o/7fMahKyoabX8Z3ivYXPISqBFcJuKYZq/eTAGRf0Qha9z
	T4zq8o16TbPfqz9klOR1d16PEWnkbd44DEDphFC1R7LWvBv99P5S+OZU1tNTdaFraUcCkLZ0Ihh
	5Ob7GBLgTnIYFwh+t31iUzwREgAPbnK0=
X-Received: by 2002:a05:690c:c4fa:b0:79a:3be7:81a8 with SMTP id
 00721157ae682-79a3be7b453mr52979097b3.6.1773653278643; Mon, 16 Mar 2026
 02:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260311-tasting-friend-eae39148fb96@spud> <20260311-skimming-pummel-6a3e2fc66a9f@spud>
In-Reply-To: <20260311-skimming-pummel-6a3e2fc66a9f@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 10:27:47 +0100
X-Gmail-Original-Message-ID: <CAD++jLnsToZN7hBYWnxn8NrmhmgWpgmKDvDn=0TKig36TzcOrA@mail.gmail.com>
X-Gm-Features: AaiRm50WpMGGktuAFovbckLRYxycl65oWNTRA0oVNDR_39hckQmaUFp3WcObLzM
Message-ID: <CAD++jLnsToZN7hBYWnxn8NrmhmgWpgmKDvDn=0TKig36TzcOrA@mail.gmail.com>
Subject: Re: [PATCH v12 4/4] riscv: dts: microchip: update mpfs gpio
 interrupts to better match the SoC
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Herve Codina <herve.codina@bootlin.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_022759_884666_3B89E6D6 
X-CRM114-Status: GOOD (  18.90  )
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

T24gV2VkLCBNYXIgMTEsIDIwMjYgYXQgNDoxOOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cgo+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3Jv
Y2hpcC5jb20+Cj4KPiBUaGVyZSBhcmUgMyBHUElPIGNvbnRyb2xsZXJzIG9uIHRoaXMgU29DLCBv
ZiB3aGljaDoKPiAtIEdQSU8gY29udHJvbGxlciAwIGhhcyAxNCBHUElPcwo+IC0gR1BJTyBjb250
cm9sbGVyIDEgaGFzIDI0IEdQSU9zCj4gLSBHUElPIGNvbnRyb2xsZXIgMiBoYXMgMzIgR1BJT3MK
Pgo+IEFsbCBHUElPcyBhcmUgY2FwYWJsZSBvZiBnZW5lcmF0aW5nIGludGVycnVwdHMsIGZvciBh
IHRvdGFsIG9mIDcwLgo+IFRoZXJlIGFyZSBvbmx5IDQxIElSUXMgYXZhaWxhYmxlIGhvd2V2ZXIs
IHNvIGEgY29uZmlndXJhYmxlIG11eCBpcyB1c2VkCj4gdG8gZW5zdXJlIGFsbCBHUElPcyBjYW4g
YmUgdXNlZCBmb3IgaW50ZXJydXB0IGdlbmVyYXRpb24uCj4gMzggb2YgdGhlIDQxIGludGVycnVw
dHMgYXJlIGluIHdoYXQgdGhlIGRvY3VtZW50YXRpb24gY2FsbHMgImRpcmVjdAo+IG1vZGUiLCBh
cyB0aGV5IHByb3ZpZGUgYW4gZXhjbHVzaXZlIGNvbm5lY3Rpb24gZnJvbSBhIEdQSU8gdG8gdGhl
IFBMSUMuCj4gVGhlIDMgcmVtYWluaW5nIGludGVycnVwdHMgYXJlIHVzZWQgdG8gbXV4IHRoZSBp
bnRlcnJ1cHRzIHdoaWNoIGRvIG5vdAo+IGhhdmUgYSBleGNsdXNpdmUgY29ubmVjdGlvbiwgb25l
IGZvciBlYWNoIEdQSU8gY29udHJvbGxlci4KPgo+IFRoZSBtdXggd2FzIG92ZXJsb29rZWQgd2hl
biB0aGUgYmluZGluZ3MgYW5kIGRyaXZlciB3ZXJlIG9yaWdpbmFsbHkKPiB3cml0dGVuIGZvciB0
aGUgR1BJTyBjb250cm9sbGVycyBvbiBQb2xhcmZpcmUgU29DLCBhbmQgdGhlIGludGVycnVwdHMK
PiBwcm9wZXJ0eSBpbiB0aGUgR1BJTyBub2RlcyB1c2VkIHRvIHRyeSBhbmQgY29udmV5IHdoYXQg
dGhlIG1hcHBpbmcgd2FzLgo+IEluc3RlYWQsIHRoZSBtdXggc2hvdWxkIGJlIGEgZGV2aWNlIGlu
IGl0cyBvd24gcmlnaHQsIGFuZCB0aGUgR1BJTwo+IGNvbnRyb2xsZXJzIHNob3VsZCBiZSBjb25u
ZWN0ZWQgdG8gaXQsIHJhdGhlciB0aGFuIHRvIHRoZSBQTElDLgo+IE5vdyB0aGF0IGEgYmluZGlu
ZyBleGlzdHMgZm9yIHRoYXQgbXV4LCBmaXggdGhlIGluYWNjdXJhdGUgZGVzY3JpcHRpb24KPiBv
ZiB0aGUgaW50ZXJydXB0IGNvbnRyb2xsZXIgaGllcmFyY2h5Lgo+Cj4gR1BJTyBjb250cm9sbGVy
cyAwIGFuZCAxIGRvIG5vdCBoYXZlIGFsbCAzMiBwb3NzaWJsZSBHUElPIGxpbmVzLCBzbwo+IG5n
cGlvcyBuZWVkcyB0byBiZSBzZXQgdG8gbWF0Y2ggdGhlIG51bWJlciBvZiBsaW5lcy9pbnRlcnJ1
cHRzLgo+Cj4gVGhlIG0xMDBwZnNldnAgaGFzIGNvbmZsaWN0aW5nIGludGVycnVwdCBtYXBwaW5n
cyBmb3IgY29udHJvbGxlcnMgMCBhbmQKPiAyLCBhcyB0aGV5IGNhbm5vdCBib3RoIGJlIHVzaW5n
IGFuIGludGVycnVwdCBpbiAiZGlyZWN0IG1vZGUiIGF0IHRoZQo+IHNhbWUgdGltZSwgc28gdGhl
IGRlZmF1bHQgcmVwbGFjZXMgdGhpcyBpbXBvc3NpYmxlIGNvbmZpZ3VyYXRpb24uCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgoKUmV2
aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzd0BrZXJuZWwub3JnPgoKWW91cnMsCkxpbnVz
IFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
