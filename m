Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F4CC5AD4E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 18:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WfSS72ZfALFy1PfHdbKxpsZSAMx+QuccsrW2Bvlw9IM=; b=Wf5xtjbP79pV3j
	DFSJyUOUNgwALDiDuAn457161sMdrDqpeU/1Kqi2oUZEk20BcqeS5LoXX6YOKtdLzNV7FHxbOMF9N
	+eypnBB2hilN5Kkbv1xddxsXIaRErpLaJJoMHTPRv/ZCgCe/Hyjmemb51oGwzggv7Khzvva1auaPK
	LJY570Ko9L0iWt68fyiSr3fUsuPG5QnpS9OxYLW9m7tiWw/QNhHF5zRmsewqIgMEgMgv3fjaMN54f
	udMWhFqOydm/lkEkW8QAZJeulTLVxM7Nr3rHizWBi3f4E9MZ8UW31SDlxq6iEvHOs2tCC0BLbKexy
	7G3KAo04uqd+FjDNgyvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtVZI-0000000FTFN-10yF;
	Fri, 20 Feb 2026 18:49:36 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtVZF-0000000FTEy-19B8
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 18:49:34 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-65a2fea1a1eso5526155a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 20 Feb 2026 10:49:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771613371; cv=none;
        d=google.com; s=arc-20240605;
        b=QdlvkpEuLGuNhop60JNfblJhesXq3dVfhaG2PqiprOb1enxWGnustCVGeLHLA3BtHb
         3TgzceXo1MkoqPX+j8ibBn7rHdRqia1PdGkvCZTvJxuoc2zZfSutQKK5hcKGOzjelTFP
         bMPen1YJR5/ocmRO9Wv0TNnIVzrSxvbMBAGPJPIzon3gw9d2JqhLZYFIFyYExszqKv2p
         hDggn9ASaIHrz9/22yDCM6IJb0ZDFGBOz9cRk7CSwdVIqXbwk3Yh9yp5Q3FycgK0mi3H
         0fo9LR9ot1huQaTIzauW1xtPXBzNN3ODC7btkW/QW0ydmfXUgDE942j2ncpMkPaYrUmp
         1Xow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wx+eX0mBS59Zy6hvZp9IaEVvMB66mMGe+OdOIYRjb5w=;
        fh=6U0TJSPF6yF8lDDzEpQtmsLHnB9C+cOHj05f9LJTjFA=;
        b=ixAl2iU4mGUf02pdELW6bSwg697xk18qWiW9czzyeEII8lYJk9D7fISSqHd3zAoVTL
         1xmqliBzyLJbikgZxpFjxhPQ2tkkUtil3F9GvPyVC+47l6XdcCsiXV4QqxrZhUXA37F7
         CuNyH8oJeQcydBek/+gpHfz0slfy5HJJ06/3E5i24GaciNj0NetPUhnyjJEZzC/MGd4q
         j8oKBUV+Y2gOQ/j0HYGaQUVCUbb8W1G55bs1lGP0j4NMGem65FGoEXgk42547WI2vSWu
         ZcOZIe/buXQDLGskKe6V0LpNz+1h70jZEyHXDmV+K+QgUSwXjRkqF1UkQn9y95HTDe4Y
         EwYw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1771613371; x=1772218171; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wx+eX0mBS59Zy6hvZp9IaEVvMB66mMGe+OdOIYRjb5w=;
        b=CL/zCQadS7ysPcywPPmMtubi8/8FDzocZ0fIK4k1eY1R3qXWZt/icVSPlpbuYR6kq1
         cOvdggjg9VGO08bxKGPLooTIa3wwS6WWOBvU7VhpTAhUzwIs9LTxd8VrVVEAsj7Xkt2M
         ZTWr18B6AsI4gXRtK7/RkbS1p7J3p9W0GT1a+BL0jO4dAUhwgMWqoNp1t+mYmkMdcW8E
         6izUUECkeHk45i18SsZgMWvQ8ZARibZP7xUzw1CdMCNDvyeIxpU1HajprgNDX48vG5Ic
         dx4yjxqyrl2I6/VRPEvBOZKUctAs/MN7itXgSF4wEFyiJAwyo3/uQvVgALtT4DtnYfSC
         eWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771613371; x=1772218171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wx+eX0mBS59Zy6hvZp9IaEVvMB66mMGe+OdOIYRjb5w=;
        b=O9rbwpaIGtWbGgb+HRivlkNQlhTjgsv+Y1wSEP/iR2EryIAr6zsYEB1egBbxCLA4dk
         WRFLmpuQ3GqdQkaCpqSRQjmJtQtFu1lI8uTkeTDBFBQC2usNbPuPQjDp5Vgm6o7a/OOP
         gyq7RDFnqAhBMY/di7AkvmWqpn3rKKd7d2X1XQ0Iqg/UNWZ7YL8eUWxBdfE4YYogDZFr
         dX3BAgzcwt7eR3lV88VpqnDFrPwNKFjIeCDrnYoAewkuSVggb4BKzs26F1PKFOEi5ZBZ
         ScaIS0H9wGZnkBvfhSmrEj/Dt6vD4z9WZxFDTz3F3vlCv4pQzzDiOinf769uXLizvihF
         /1kA==
X-Forwarded-Encrypted: i=1; AJvYcCUXi3JFUyVP2rn8t2hPf9xBVFJxY4yCnqGJBeUdDlVIS5QEoAyJA/jtBZHkmekTi4a2Q+C1ZmBMXtxHmA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyzN2YpovY4tJngvN/XDNstf7vltC1WiMOecF/vMpuNjRDCKoSi
	jzhuZvGz99eVEWSmtvnHZfJoTGMz0qgzp38j8fuRqSMTVcCgWck4jwOyB1t1C2jaltzztnldDJg
	HpOKTucr3tCwjPAsvtC0TuxAuwyMPX4OXKPXEMP9Yvg==
X-Gm-Gg: AZuq6aIIKwP+cZB5ryTEtUgExdu+b3D5dOfCW3l0vTNnJTD9Nkf0ENekHpNIz7eKYyv
	qcYF59iNuJyImis91LEDXR5g/wzcRskhGah2ZgZ8TmZUg8KdyWyg0zayGT3WXsb1QaBywEyj0L0
	XV+Vp5nAWrjSidipw6kF790+FZhewsiwjbUQT6tqJ+FbGbsG79Dep6MG+77v4zbTifD3ASUYXeK
	65R1Y5xVQL4tYkVgFjJVByiLFzOjGt6OPNXgnjM85aMP7HJyCfXZuGcdgha64be+xAtmhkVT4F9
	nAUhSHKFZg==
X-Received: by 2002:a17:906:99c1:b0:b8f:dec3:6606 with SMTP id
 a640c23a62f3a-b90810d9416mr39173466b.23.1771613371158; Fri, 20 Feb 2026
 10:49:31 -0800 (PST)
MIME-Version: 1.0
References: <20260220-fu740-v1-0-c8af54130c58@sifive.com> <20260220-fu740-v1-2-c8af54130c58@sifive.com>
 <20260220-contest-ambiguity-1a4099520bdf@spud>
In-Reply-To: <20260220-contest-ambiguity-1a4099520bdf@spud>
From: Max Hsu <max.hsu@sifive.com>
Date: Sat, 21 Feb 2026 02:49:19 +0800
X-Gm-Features: AaiRm50P1Nlh0T0vDWni0aUkbrbTe6xYAsBq75SA6rKDY3TAVmB4kTeN4YB9xj8
Message-ID: <CAHibDyy1mA2s9_UjKGPemRaKNSvyq07Ok5+4yruQ1uXX+R-Pkg@mail.gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: interrupt-controller: Add SiFive
 FU740-C000 PLIC
To: Conor Dooley <conor@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Thomas Gleixner <tglx@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_104933_352956_5EACF0C5 
X-CRM114-Status: GOOD (  16.61  )
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

T24gRnJpLCBGZWIgMjAsIDIwMjYgYXQgMDk6MjM6MTggKzAwMDAsIENvbm9yIERvb2xleSB3cm90
ZToKPiBTbyBkbyB0aGUgZ2VuZXJhbCBydWxlcyBmb3IgZGV2aWNldHJlZSBiaW5kaW5ncywgdGhh
dCdzIG5vdCBzb21ldGhpbmcKPiBTaUZpdmUgc3BlY2lmaWMgRldJVy4KPiBBY2tlZC1ieTogQ29u
b3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KClRoYW5rcyBmb3IgdGhlIHJl
dmlldyBhbmQgdGhlIGFjaywgQ29ub3IuCgpJJ2xsIHVwZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2Ug
aW4gdjIgdG8gcmVmZXJlbmNlIHRoZSBnZW5lcmFsIGRldmljZQp0cmVlIGNvbnZlbnRpb25zLgoK
VGhhbmtzLApNYXggSHN1CgpPbiBGcmksIEZlYiAyMCwgMjAyNiBhdCA1OjIz4oCvUE0gQ29ub3Ig
RG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgRmViIDIwLCAyMDI2
IGF0IDA0OjI3OjA2UE0gKzA4MDAsIE1heCBIc3Ugd3JvdGU6Cj4gPiBBZGQgdGhlIFNpRml2ZSBG
VTc0MC1DMDAwIFBMSUMgY29tcGF0aWJsZSBzdHJpbmcgdG8gdGhlIGJpbmRpbmcKPiA+IGRvY3Vt
ZW50YXRpb24uCj4gPgo+ID4gVGhpcyBmb2xsb3dzIHRoZSBTaUZpdmUgSVAgdmVyc2lvbmluZyBz
Y2hlbWUgd2hpY2ggcmVxdWlyZXMgU29DLXNwZWNpZmljCj4gPiBjb21wYXRpYmxlIHN0cmluZ3Mg
Zm9yIHByb3BlciBoYXJkd2FyZSBpZGVudGlmaWNhdGlvbiwgZXZlbiB3aGVuIHRoZSBJUAo+ID4g
YmxvY2tzIGFyZSBmdW5jdGlvbmFsbHkgaWRlbnRpY2FsLgo+Cj4gU28gZG8gdGhlIGdlbmVyYWwg
cnVsZXMgZm9yIGRldmljZXRyZWUgYmluZGluZ3MsIHRoYXQncyBub3Qgc29tZXRoaW5nCj4gU2lG
aXZlIHNwZWNpZmljIEZXSVcuCj4gQWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5
QG1pY3JvY2hpcC5jb20+Cj4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXggSHN1IDxtYXguaHN1
QHNpZml2ZS5jb20+Cj4gPiAtLS0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1
cHQtY29udHJvbGxlci9zaWZpdmUscGxpYy0xLjAuMC55YW1sICAgICAgfCAxICsKPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGlj
LTEuMC4wLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0
LWNvbnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbAo+ID4gaW5kZXggZTAyNjcyMjM4ODdl
Li4zNTFkMjZhYjE5NTYgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbAo+ID4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9s
bGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwKPiA+IEBAIC02Myw2ICs2Myw3IEBAIHByb3BlcnRp
ZXM6Cj4gPiAgICAgICAgICAgICAgICAtIGVzd2luLGVpYzc3MDAtcGxpYwo+ID4gICAgICAgICAg
ICAgICAgLSBtaWNyb2NoaXAscGljNjRneC1wbGljCj4gPiAgICAgICAgICAgICAgICAtIHNpZml2
ZSxmdTU0MC1jMDAwLXBsaWMKPiA+ICsgICAgICAgICAgICAgIC0gc2lmaXZlLGZ1NzQwLWMwMDAt
cGxpYwo+ID4gICAgICAgICAgICAgICAgLSBzcGFjZW1pdCxrMS1wbGljCj4gPiAgICAgICAgICAg
ICAgICAtIHN0YXJmaXZlLGpoNzEwMC1wbGljCj4gPiAgICAgICAgICAgICAgICAtIHN0YXJmaXZl
LGpoNzExMC1wbGljCj4gPgo+ID4gLS0KPiA+IDIuNDMuMAo+ID4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
