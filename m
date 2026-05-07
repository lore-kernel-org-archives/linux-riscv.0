Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5E3CD343B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 08:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yzAE6Tsc+U0CheDdnqYeQ8To7PyOIABFEW3cNenJmrY=; b=EXquvvfXyjF2Vp
	L6/HdGRctDiw6/m3Q0P7EHcBL9rMozHuvJX8+KxV5qRm87qlCv0+ovi1Uj6QlH3sEyYKzUzgq7T+Y
	xWIZkfcWpzbCsX0p6sA8hpgmeZr8iwds9HWabVNEI+a5t5jEaXJ0WGf3khjJIVNUYPojdm0VkFoIN
	5M6ZZujMa5dcKWDNPMuxZiPd0WKKCLQb3EUED4Bz6nK/OV5v2kJUlq8HnA4q+suZOG7hPehaIizVH
	H7UV4iFw8JCJcXMxCVYqUxys9ruTQZIWB7hz5taRYxiLF3e5iI4nsfC/7xzEpDh2Dz5LbdATxxJot
	MfdxK3fpAheM3XphQxmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKty1-000000039KV-40Kx;
	Thu, 07 May 2026 08:20:21 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtxz-000000039JW-1KSV
	for linux-riscv@lists.infradead.org;
	Thu, 07 May 2026 08:20:20 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-40974bf7781so1581845fac.0
        for <linux-riscv@lists.infradead.org>; Thu, 07 May 2026 01:20:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778142018; cv=none;
        d=google.com; s=arc-20240605;
        b=D3PxMwJFulG7uR9NkHlj3RylZUQASu4Sqi6GlNReqBuOqIqmASZdPrdmSzC3dS93zM
         rffp+uBWT89qgj4Qml3YsT46cLOKcCnWnpWS7yIQbaqPg5KuGyASeJxLCQ6H3OafWeld
         my6ApWf5jsqJ3yd5PLaKlm6TuxSO+ansGH9E7kLf8pka7wVQ+nuiJRwGVVCeUo/nhEuP
         ZmyMLy9gXAeXnnmbff5/U1eXqQUBW0xKJphi4ft1oaw2LaM9BFLVWVA4j+V/IxsM/J3X
         E/RwwFHSyWN9pqmSWRkZ0Fwooc6KuAeGmah6gHVfd4hYrd4qwMYtmj1OQeo66U/wY+zU
         H89Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bWYx5HG66i84XevwfveNmgHdFOQmLx/UvaTFzQl0TiU=;
        fh=tTcE8Dc96INbHOJi5LXnXQKj78NR7sL7WeQGtFqo2DQ=;
        b=fOKyrhQwS7yx7sdq/oQgSSzR0trqnua1K2KIrIWsU6KcrHUu+ZCy/GsQwEWxCJ5Ggy
         oMtOBJeJziXWxM9kcjSo3gv8sUssCM/vmlW3wMd9qjRDCVsiVGyant65D6XEDd0pM25T
         9XL0M2QS/QBs8cBtSMomCccCeLzPeka2A1auCgeIYlcJfcBo4CifcuEm7IDZqCF8OhDR
         su+nQ8CP6g35pg32Mg0KhkRKRi3ktSMUeG8EV6i2BzoNqj7NL1E8sZYRsQ5v0IJitpMk
         BBvkg1jkj9SAMQeUSfRenSCq5BlDv8W9CHJOUlxqg0gVCYGltiWoxFAs6b0MNb4hvhjn
         1tPA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1778142018; x=1778746818; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWYx5HG66i84XevwfveNmgHdFOQmLx/UvaTFzQl0TiU=;
        b=mqhJN3ewHFFDC3wKkRcNbk7G0PzlT5Z1zIgeZL4quyHypsFke9GrVBIOKh3DbKyLb0
         JbgttyPb/d4iTkOsuauMrSFr5O7JlpR+Alz6KMCeeAvVxY+zAFlJG4BooI9SLcGum4O4
         j26S8lluUU3PBK+1Nfwr3U2kWZWSUVYPt7Nxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142018; x=1778746818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bWYx5HG66i84XevwfveNmgHdFOQmLx/UvaTFzQl0TiU=;
        b=DhQ/bqCJS4cGZgRcNE7ZeTxiua1c11Ua5VtNaA6JnkotVS6U++V4zdpQhl+fkTIey1
         VThIwNPjnoKxKIuh1KSwlh4wNfc3ipdL79MmVKdL6udxRZMFE2dM3OZ9Jkmx2Eh2BJs6
         ZvqcTYGErlRXc9tl3QyBOWD3oeuzA2RBbFj8diBlZv/8rEGMCejK/UGvb9vxz88CCU5Y
         /i1F12SUUNFLCXGMC7dVSl0IkMrOtsHtqxup/fDyE6NoSyMNJMLvp4Ee1Ypvt07CO9w6
         X0J6DUCAmYsuR9b+Kpb7Fa4rpUHqPcloOsuQ1f/XUrVCVyKMAu3aaCgSSJ8lza8JSNCT
         W4RA==
X-Forwarded-Encrypted: i=1; AFNElJ94WRGbSn9okCB9tXk8/74yk3gUDmpnVdgA20i9YCkTVE54x4UFgvo1Jc0IJabuRB6qShh39084et+XeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzB7csjoi6WMZOjfYTiQ/6PweKOHQFkQnTPJsXdZlQFIinEG+ro
	qOrPQ9q2+oKmTuPtGaSNmXGshW8yf6omWnOEsiXa/xaDaTuJaZWK8tVeV81YqOG816Q/9MjUWNh
	4pXJRpiF1xBR0xwHDL5qpzrvHrNQWQGve/MnFNoF4hQ==
X-Gm-Gg: AeBDieu8mBSVrJKovWBjgW2JA8d1WN4HoSpKJ1HbWvw8jV4S7NLyjIgYJEIOb7pjdpc
	0nXA3kgb7Cdawj3kmXEa9W69nXTgfV4y2LfQfoXkJ2F1IRO20c0TVKtNeNXzNdxDk6FBbZG5wYE
	Y/xwiPcwspLG2bL1J6NGsEr6a6D3TpcReVHa07YUst42DjO6jSea90W6uGt9zShgESeGDmKj7so
	VMlKNxzrxEvcGkxC/Bm2y+ROX4SVwV4zwwtLjnMsx7kwkFW6lKbIG4V1dIKq9k3POGw1IYi3vVS
	O/79TQEw526+C1Mu3xwgVPAHlh4AjkfOVSZw2tOrZ+dRlaKx66U=
X-Received: by 2002:a4a:e60a:0:b0:684:5e35:6091 with SMTP id
 006d021491bc7-699ab62b9fbmr808519eaf.26.1778142017994; Thu, 07 May 2026
 01:20:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com> <20260413-orangepi-sd-card-uhs-v8-8-c21c40ec16d0@gmail.com>
In-Reply-To: <20260413-orangepi-sd-card-uhs-v8-8-c21c40ec16d0@gmail.com>
From: Margherita Milani <margherita.milani@amarulasolutions.com>
Date: Thu, 7 May 2026 10:20:06 +0200
X-Gm-Features: AVHnY4L7xr25tCAps8SxEp-5ZjcE9EGySyy8fEWRsxHZhWT1U2K2LtQjEajPjlU
Message-ID: <CA+Xcp4nY9GVMOmtMG-PNhY2vqP4Cc_amAMSa+M3vuDjWUkuCHw@mail.gmail.com>
Subject: Re: [PATCH v8 8/9] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
To: Iker Pedrosa <ikerpedrosam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_012019_370996_2F1D68CF 
X-CRM114-Status: GOOD (  15.78  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.dev>, linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-riscv@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, Yixun Lan <dlan@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, spacemit@lists.linux.dev, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

R29vZCBtb3JuaW5nIElrZXIsCgo+IEFkZCBjb21wbGV0ZSBTRCBjYXJkIGNvbnRyb2xsZXIgc3Vw
cG9ydCB3aXRoIFVIUyBoaWdoLXNwZWVkIG1vZGVzLgo+Cj4gLSBFbmFibGUgc2RoY2kwIGNvbnRy
b2xsZXIgd2l0aCA0LWJpdCBidXMgd2lkdGgKPiAtIENvbmZpZ3VyZSBjYXJkIGRldGVjdCBHUElP
IHdpdGggaW52ZXJzaW9uCj4gLSBDb25uZWN0IHZtbWMtc3VwcGx5IHRvIGJ1Y2s0IGZvciAzLjNW
IGNhcmQgcG93ZXIKPiAtIENvbm5lY3QgdnFtbWMtc3VwcGx5IHRvIGFsZG8xIGZvciAxLjhWLzMu
M1YgSS9PIHN3aXRjaGluZwo+IC0gQWRkIGR1YWwgcGluY3RybCBzdGF0ZXMgZm9yIHZvbHRhZ2Ut
ZGVwZW5kZW50IHBpbiBjb25maWd1cmF0aW9uCj4gLSBTdXBwb3J0IFVIUy1JIFNEUjI1LCBTRFI1
MCwgYW5kIFNEUjEwNCBtb2RlcwoKClRlc3RlZC1ieTogTWFyZ2hlcml0YSBNaWxhbmkgPG1hcmdo
ZXJpdGEubWlsYW5pQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgoKSG93ZXZlciBJIG5vdGljZWQgaXQg
b25seSB3b3JrcyB3aGVuIENPTkZJR19JMkNfSzEgaXMgZW5hYmxlZC4KTWljaGFlbCBPcGRlbmFj
a2VyIHRvbGQgbWUgaXQncyBuZWNlc3NhcnkgdG8gZW5hYmxlIHRoZSByZWd1bGF0b3JzCnVzZWQg
YnkgdGhlIG1tYyBjb250cm9sbGVyLgpTaG91bGQgd2UgYWRkIHRoZSBkZXBlbmRlbmN5IGJldHdl
ZW4gQ09ORklHX01NQ19TREhDSV9PRl9LMSBhbmQKQ09ORklHX0kyQ19LMT8gKFVubGVzcyBzb21l
IGJvYXJkcyBkb24ndCBoYXZlIHRoZXNlIGRlcGVuZGVuY3k/KQpUaGFuayB5b3UgZm9yIHlvdXIg
cGF0Y2hzZXQgd2hpY2ggd2FzIHJlYWxseSBuaWNlIQoKLS0gCk1hcmdoZXJpdGEgTWlsYW5pCkVt
YmVkZGVkIFNvZnR3YXJlIEVuZ2luZWVyCk0uICszOSAzMzQgNzU4IDkxMTEKbWFyZ2hlcml0YS5t
aWxhbmlAYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwoKQW1hcnVsYSBTb2x1dGlvbnMgU1JMClZpYSBsZSBDYW5ldmFyZSAzMCwgMzExMDAsIFRy
ZXZpc28sIFZlbmV0bywgSVQKVC4gKzM5ICgwKTQyIDI0MyA1MzEwCmluZm9AYW1hcnVsYXNvbHV0
aW9ucy5jb20Kd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCgpPbiBNb24sIEFwciAxMywgMjAyNiBh
dCAxMDowNeKAr0FNIElrZXIgUGVkcm9zYSA8aWtlcnBlZHJvc2FtQGdtYWlsLmNvbT4gd3JvdGU6
Cj4KPiBBZGQgY29tcGxldGUgU0QgY2FyZCBjb250cm9sbGVyIHN1cHBvcnQgd2l0aCBVSFMgaGln
aC1zcGVlZCBtb2Rlcy4KPgo+IC0gRW5hYmxlIHNkaGNpMCBjb250cm9sbGVyIHdpdGggNC1iaXQg
YnVzIHdpZHRoCj4gLSBDb25maWd1cmUgY2FyZCBkZXRlY3QgR1BJTyB3aXRoIGludmVyc2lvbgo+
IC0gQ29ubmVjdCB2bW1jLXN1cHBseSB0byBidWNrNCBmb3IgMy4zViBjYXJkIHBvd2VyCj4gLSBD
b25uZWN0IHZxbW1jLXN1cHBseSB0byBhbGRvMSBmb3IgMS44Vi8zLjNWIEkvTyBzd2l0Y2hpbmcK
PiAtIEFkZCBkdWFsIHBpbmN0cmwgc3RhdGVzIGZvciB2b2x0YWdlLWRlcGVuZGVudCBwaW4gY29u
ZmlndXJhdGlvbgo+IC0gU3VwcG9ydCBVSFMtSSBTRFIyNSwgU0RSNTAsIGFuZCBTRFIxMDQgbW9k
ZXMKPgo+IFRoaXMgZW5hYmxlcyBmdWxsIFNEIGNhcmQgZnVuY3Rpb25hbGl0eSBpbmNsdWRpbmcg
aGlnaC1zcGVlZCBVSFMgbW9kZXMKPiBmb3IgaW1wcm92ZWQgcGVyZm9ybWFuY2UuCj4KPiBTdWdn
ZXN0ZWQtYnk6IEFuYW5kIE1vb24gPGxpbnV4LmFtb29uQGdtYWlsLmNvbT4KPiBUZXN0ZWQtYnk6
IEFuYW5kIE1vb24gPGxpbnV4LmFtb29uQGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBJa2Vy
IFBlZHJvc2EgPGlrZXJwZWRyb3NhbUBnbWFpbC5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvYm9v
dC9kdHMvc3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRzIHwgMjQgKysrKysrKysrKysrKysrKysr
KysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5h
cGktZjMuZHRzIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1mMy5k
dHMKPiBpbmRleCA1NzkwZDkyN2I5M2QuLmE3ZDg4NTY0NjMwZiAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0cwo+ICsrKyBiL2FyY2gv
cmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRzCj4gQEAgLTIyMCw3ICsy
MjAsNyBAQCBidWNrM18xdjg6IGJ1Y2szIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHJlZ3VsYXRvci1hbHdheXMtb247Cj4gICAgICAgICAgICAgICAgICAgICAgICAgfTsKPgo+
IC0gICAgICAgICAgICAgICAgICAgICAgIGJ1Y2s0IHsKPiArICAgICAgICAgICAgICAgICAgICAg
ICBidWNrNDogYnVjazQgewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVndWxh
dG9yLW1pbi1taWNyb3ZvbHQgPSA8NTAwMDAwPjsKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+Owo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmVndWxhdG9yLXJhbXAtZGVsYXkgPSA8NTAwMD47Cj4gQEAg
LTI0MSw3ICsyNDEsNyBAQCBidWNrNiB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICByZWd1bGF0b3ItYWx3YXlzLW9uOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIH07Cj4KPiAt
ICAgICAgICAgICAgICAgICAgICAgICBhbGRvMSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
YWxkbzE6IGFsZG8xIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ3VsYXRv
ci1taW4tbWljcm92b2x0ID0gPDUwMDAwMD47Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwzNDAwMDAwPjsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHJlZ3VsYXRvci1ib290LW9uOwo+IEBAIC0zNjcsMyArMzY3LDIz
IEBAIGh1Yl8zXzA6IGh1YkAyIHsKPiAgICAgICAgICAgICAgICAgcmVzZXQtZ3Bpb3MgPSA8Jmdw
aW8gSzFfR1BJTygxMjQpIEdQSU9fQUNUSVZFX0xPVz47Cj4gICAgICAgICB9Owo+ICB9Owo+ICsK
PiArJnNkaGNpMCB7Cj4gKyAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiLCAidWhzIjsK
PiArICAgICAgIHBpbmN0cmwtMCA9IDwmbW1jMV9jZmc+Owo+ICsgICAgICAgcGluY3RybC0xID0g
PCZtbWMxX3Voc19jZmc+Owo+ICsgICAgICAgYnVzLXdpZHRoID0gPDQ+Owo+ICsgICAgICAgY2Qt
Z3Bpb3MgPSA8JmdwaW8gSzFfR1BJTyg4MCkgR1BJT19BQ1RJVkVfSElHSD47Cj4gKyAgICAgICBj
ZC1pbnZlcnRlZDsKPiArICAgICAgIGJyb2tlbi1jZDsKPiArICAgICAgIG5vLW1tYzsKPiArICAg
ICAgIG5vLXNkaW87Cj4gKyAgICAgICBkaXNhYmxlLXdwOwo+ICsgICAgICAgY2FwLXNkLWhpZ2hz
cGVlZDsKPiArICAgICAgIHZtbWMtc3VwcGx5ID0gPCZidWNrND47Cj4gKyAgICAgICB2cW1tYy1z
dXBwbHkgPSA8JmFsZG8xPjsKPiArICAgICAgIHNkLXVocy1zZHIyNTsKPiArICAgICAgIHNkLXVo
cy1zZHI1MDsKPiArICAgICAgIHNkLXVocy1zZHIxMDQ7Cj4gKyAgICAgICBzdGF0dXMgPSAib2th
eSI7Cj4gK307Cj4KPiAtLQo+IDIuNTMuMAo+Cj4KCgotLSAKTWFyZ2hlcml0YSBNaWxhbmkKRW1i
ZWRkZWQgU29mdHdhcmUgRW5naW5lZXIKTS4gKzM5IDMzNCA3NTggOTExMQptYXJnaGVyaXRhLm1p
bGFuaUBhbWFydWxhc29sdXRpb25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCgpBbWFydWxhIFNvbHV0aW9ucyBTUkwKVmlhIGxlIENhbmV2YXJlIDMwLCAzMTEwMCwgVHJl
dmlzbywgVmVuZXRvLCBJVApULiArMzkgKDApNDIgMjQzIDUzMTAKaW5mb0BhbWFydWxhc29sdXRp
b25zLmNvbQp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
