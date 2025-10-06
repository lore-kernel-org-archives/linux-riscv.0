Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10ED1CCA470
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Oct 2025 19:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s99uQ3vuLFvjXqE0qiK28pxhSpPnaeE76jVCbq81xIk=; b=jWtt4UjDSyrY1H
	AWFwo5BDSusgZerUmeWZ6shM+DgkVSHdWbINDCs4fgRBELhxwXFBrxyxejmw5qDJsifeYdwoauvWx
	eOudJ6NKqIzg/zTB9YXq+1Af/cc6C1WBFGBW6WmzQ46pL3QN6FPu5G4R10ttD6T7SoN6Z2fOHm/Dz
	FTZb8oczZD5OfeZ1WBJoDpiFhmoMQwSK0DzZmwBZunyXiejAZfEuOZCSqrvpRGvzu93z08mV1f+IY
	vmtmnbaJidiRXPesRRFCrKx/6Aaq7pDsfTEMkJTs5PgumfGJAwVaKwbGQaqEDvmCF74tcs7UKjV5K
	2qekftlMBkdck83HdNjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5qSq-00000000e20-01Yr;
	Mon, 06 Oct 2025 19:01:40 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5qSm-00000000e0q-1ayf
	for linux-riscv@lists.infradead.org;
	Mon, 06 Oct 2025 19:01:38 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-339d53f4960so2403741a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Oct 2025 12:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759777295; x=1760382095; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYZ8UHayERgN9wwxms25R/WIMLPdiBWsn9w/tx9HKCQ=;
        b=S8nsyGMmjZiAnQg1StbaoEm86gxD6hj9ahvmUc3fPrqhD9066VIHvhEqi86Qny98LJ
         946kMXmTPWIKxNdAfXIWd2noa+Ua+D7nmoIsQgIhvj1Yevl+tfkvSTaq/YnfCYcUF5RD
         9Fe4VBiMwCUp9jjh2GweS9bSoxXiQk+79Uwccv3Uls1j2VaScQJVT7kPAEZQdzskImOo
         GUEaYEPas6e3d7/QxZFoNgcpwIGGnFE1EfqwjS9lYHj5ktF9odeAOAWfoEOjJ99X1i4G
         PTjnl0nNCsN7m7voSg6dgkpt4qe+2Mc/UEW7utBYC8NcxvJPA2NnimhIbJRDry9KiKxv
         mOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759777295; x=1760382095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mYZ8UHayERgN9wwxms25R/WIMLPdiBWsn9w/tx9HKCQ=;
        b=gv3UmAfSTSdPwtN4guoxCv0jX6vmgJDBa46JnAP2T5JmQZFPfz1oXadMwT0jxHNh7M
         bQN3FW/MEr/3kY/hm8dvzQyDz0bfICw9lOS3bH39iqHXbP0Aad9DtZTcXMzLoTO9z+4x
         0zKVrsznCqB4MCjbytxezKNKwH4ruQOwZlVt7v/syLO4gGM1JU2Gs+qN8Qre1pTo2sti
         qML7EqTU1e4EvNFklYYkfQGW2HGw8rk7pbGMVuPotyI8+tXtoJZQUTWm4hviudL0xtuR
         6C/SUp+NwQCmA6RLDjRsVTeKOOh64z8wKt16UOW9xEcQX2jYYEJky/jETJ3O6GAWhSG0
         r0oA==
X-Forwarded-Encrypted: i=1; AJvYcCWKaXLRpMLusUnY0TxnD9ZrCzEyudbwA2FXjCWt9W28JFB2QCE+ct8Da4sorHXIHh9+6JX9Q5DLOP9aQg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrCLlxH1bpNeQR/SS38cX/DeJQVOEOb2TRAq1oLAczim6jXjVG
	0TIignNo6f3S5IUPpXEgsRHeDpWAsHtg7n5/qw7WDO1NOBznVFe4L+kTwTlFVi1UXMXYOrpWhPO
	hFGxR8j/lJo6sE/4U3JEvt73jCEcWl+A=
X-Gm-Gg: ASbGncvuCjCc2t7nS5n4L0IG5PMAGX4JqhCClSe/Q1rKWSXH991lfhLWrgTtIsFdAw+
	x9XyvXYsNYexFuX0k8EXzCPhjjy0eVX7cW/+AEi0+dimOmRIdt6ms03rEtCYrQ3Zdj9xcCRKmxe
	+qtjP0Aa8fffSfhVPTeJaKb1LAT+wkPZc+ZW8lFrmSNp33Nu8T5rG+vpnLcTwysx3h78M/3D6m2
	Q4R7gX5IXSOpUPg3sGtsezpoYUFb+dmW7lp/X/S
X-Google-Smtp-Source: AGHT+IHjbRQmxK9nItl2HffExFNwVAi7q3n9PoNqjUew1CuTn1djxW2xNlMPlH1OQdzQN2XzFyIHcR/X/BEeXf1S/Xs=
X-Received: by 2002:a17:90b:4d05:b0:329:e2b1:def3 with SMTP id
 98e67ed59e1d1-339c271e913mr18582984a91.10.1759777295000; Mon, 06 Oct 2025
 12:01:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250921083446.790374-1-uwu@icenowy.me> <20250921083446.790374-3-uwu@icenowy.me>
 <20250922204349.GA1290045-robh@kernel.org> <1ac8c72206abf9f3e0a13e1fcf44be5c605f6372.camel@icenowy.me>
 <36040a0a40311cb1e871075f0c5ad175342ed5db.camel@icenowy.me>
 <CAH9NwWdx-Ut35RvhmNsdQbC4vfm3rH1VPN7H2uDBRsmsFjZU_Q@mail.gmail.com>
 <84566b33d0d08ad070c3aa8a01e07f3a0e3bff50.camel@icenowy.me> <c7d79542aedb6c074c4be21eaa15c71a53e87da4.camel@icenowy.me>
In-Reply-To: <c7d79542aedb6c074c4be21eaa15c71a53e87da4.camel@icenowy.me>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 6 Oct 2025 21:01:22 +0200
X-Gm-Features: AS18NWCjcsoivBsp8jaWAwEQpEhhNVJLV_pDpFJNQ8qKcsWUh9zL3A2T5EiSJg8
Message-ID: <CAH9NwWe+eStPai5baFY62RCUB=3c9qmOSXpFuAvyX2a7_v=0Vw@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: display: add verisilicon,dc
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Rob Herring <robh@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, 
	Russell King <linux+etnaviv@armlinux.org.uk>, 
	moderated for non-subscribers <etnaviv@lists.freedesktop.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Han Gao <rabenda.cn@gmail.com>, 
	Yao Zi <ziyao@disroot.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_120136_425571_E860547B 
X-CRM114-Status: GOOD (  36.66  )
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

QW0gTW8uLCA2LiBPa3QuIDIwMjUgdW0gMTg6MzQgVWhyIHNjaHJpZWIgSWNlbm93eSBaaGVuZyA8
dXd1QGljZW5vd3kubWU+Ogo+Cj4g5ZyoIDIwMjUtMDktMjXmmJ/mnJ/lm5vnmoQgMTM6NTcgKzA4
MDDvvIxJY2Vub3d5IFpoZW5n5YaZ6YGT77yaCj4gPiDlnKggMjAyNS0wOS0yNOaYn+acn+S4ieea
hCAyMDoxNSArMDIwMO+8jENocmlzdGlhbiBHbWVpbmVy5YaZ6YGT77yaCj4gPiA+ID4gPiA+ID4g
VmVyaXNpbGljb24gaGFzIGEgc2VyaWVzIG9mIGRpc3BsYXkgY29udHJvbGxlcnMgcHJlZml4ZWQK
PiA+ID4gPiA+ID4gPiB3aXRoCj4gPiA+ID4gPiA+ID4gREMKPiA+ID4gPiA+ID4gPiBhbmQKPiA+
ID4gPiA+ID4gPiB3aXRoIHNlbGYtaWRlbnRpZmljYXRpb24gZmFjaWxpdHkgbGlrZSB0aGVpciBH
QyBzZXJpZXMKPiA+ID4gPiA+ID4gPiBHUFVzLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4g
QWRkIGEgZGV2aWNlIHRyZWUgYmluZGluZyBmb3IgaXQuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gPiBEZXBlbmRzIG9uIHRoZSBzcGVjaWZpYyBEQyBtb2RlbCwgaXQgY2FuIGhhdmUgZWl0aGVy
IG9uZSBvcgo+ID4gPiA+ID4gPiA+IHR3bwo+ID4gPiA+ID4gPiA+IGRpc3BsYXkKPiA+ID4gPiA+
ID4gPiBvdXRwdXRzLCBhbmQgZWFjaCBkaXNwbGF5IG91dHB1dCBjb3VsZCBiZSBzZXQgdG8gRFBJ
IHNpZ25hbAo+ID4gPiA+ID4gPiA+IG9yCj4gPiA+ID4gPiA+ID4gIkRQIgo+ID4gPiA+ID4gPiA+
IHNpZ25hbCAod2hpY2ggc2VlbXMgdG8gYmUgc29tZSBwbGFpbiBwYXJhbGxlbCBidXMgdG8gSERN
SQo+ID4gPiA+ID4gPiA+IGNvbnRyb2xsZXJzKS4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1lPgo+ID4gPiA+ID4g
PiA+IC0tLQo+ID4gPiA+ID4gPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiA+ID4gPiA+ID4gLSBGaXhl
ZCBtaXNzcGVsdCAidmVyc2lsaWNvbiIgaW4gdGl0bGUuCj4gPiA+ID4gPiA+ID4gLSBNb3ZlZCBt
aW5JdGVtcyBpbiBjbG9jayBwcm9wZXJ0aWVzIHRvIGJlIGVhcmxpZXIgdGhhbgo+ID4gPiA+ID4g
PiA+IGl0ZW1zLgo+ID4gPiA+ID4gPiA+IC0gUmUtYWxpZ25lZCBtdWx0aS1saW5lIGNsb2NrcyBh
bmQgcmVzZXRzIGluIGV4YW1wbGUuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiAgLi4uL2Jp
bmRpbmdzL2Rpc3BsYXkvdmVyaXNpbGljb24sZGMueWFtbCAgICAgIHwgMTI3Cj4gPiA+ID4gPiA+
ID4gKysrKysrKysrKysrKysrKysrCj4gPiA+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMjcg
aW5zZXJ0aW9ucygrKQo+ID4gPiA+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQKPiA+ID4gPiA+
ID4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS92ZXJpc2lsaWNv
bixkYy55YQo+ID4gPiA+ID4gPiA+IG1sCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBkaWZm
IC0tZ2l0Cj4gPiA+ID4gPiA+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS92ZXJpc2lsaWNvbixkYy4KPiA+ID4gPiA+ID4gPiB5YQo+ID4gPiA+ID4gPiA+IG1s
Cj4gPiA+ID4gPiA+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS92ZXJpc2lsaWNvbixkYy4KPiA+ID4gPiA+ID4gPiB5YQo+ID4gPiA+ID4gPiA+IG1sCj4gPiA+
ID4gPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4gPiA+ID4gPiBpbmRleCAwMDAwMDAw
MDAwMDAwLi4wN2ZlZGM0YzdjYzEzCj4gPiA+ID4gPiA+ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiA+
ID4gPiA+ICsrKwo+ID4gPiA+ID4gPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvdmVyaXNpbGljb24sZGMuCj4gPiA+ID4gPiA+ID4geWEKPiA+ID4gPiA+ID4g
PiBtbAo+ID4gPiA+ID4gPiA+IEBAIC0wLDAgKzEsMTI3IEBACj4gPiA+ID4gPiA+ID4gKyMgU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkKPiA+ID4gPiA+
ID4gPiArJVlBTUwgMS4yCj4gPiA+ID4gPiA+ID4gKy0tLQo+ID4gPiA+ID4gPiA+ICskaWQ6Cj4g
PiA+ID4gPiA+ID4gaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS92ZXJpc2ls
aWNvbixkYy55YW1sIwo+ID4gPiA+ID4gPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4g
K3RpdGxlOiBWZXJpc2lsaWNvbiBEQy1zZXJpZXMgZGlzcGxheSBjb250cm9sbGVycwo+ID4gPiA+
ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiArbWFpbnRhaW5lcnM6Cj4gPiA+ID4gPiA+ID4gKyAgLSBJ
Y2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4KPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+
ID4gK3Byb3BlcnRpZXM6Cj4gPiA+ID4gPiA+ID4gKyAgJG5vZGVuYW1lOgo+ID4gPiA+ID4gPiA+
ICsgICAgcGF0dGVybjogIl5kaXNwbGF5QFswLTlhLWZdKyQiCj4gPiA+ID4gPiA+ID4gKwo+ID4g
PiA+ID4gPiA+ICsgIGNvbXBhdGlibGU6Cj4gPiA+ID4gPiA+ID4gKyAgICBjb25zdDogdmVyaXNp
bGljb24sZGMKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gVGhpcyBuZWVkcyBhbiBTb0Mgc3BlY2lm
aWMgY29tcGF0aWJsZS4gR2VuZXJhbGx5IGxpY2Vuc2VkIElQCj4gPiA+ID4gPiA+IGNvbXBhdGli
bGVzCj4gPiA+ID4gPiA+IGFyZSB1c2VsZXNzIGJlY2F1c2UgdGhlIHNwZWNzIGFyZW4ndCBwdWJs
aWMgYW5kIHRoZXJlJ3MKPiA+ID4gPiA+ID4gYWx3YXlzCj4gPiA+ID4gPiA+IGludGVncmF0aW9u
IHF1aXJrcy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGlzIG1pbWljcyB0aGUgR1BVIElQcyBieSB0
aGUgc2FtZSB2ZW5kb3IsIHNlZQo+ID4gPiA+ID4gZ3B1L3ZpdmFudGUsZ2MueWFtbCAsCj4gPiA+
ID4gPiB3aGljaCBjb250YWluIHRoZSBleGFjdCBzYW1lIHNldCBvZiBpZGVudGlmaWNhdGlvbiBy
ZWdpc3RlcnMKPiA+ID4gPiA+IChpbmNsdWRpbmcKPiA+ID4gPiA+IGEgImN1c3RvbWVyIGlkIiBv
bmUgdGhhdCBjYW4gZGlmZmVyaWVuYXRlIHRoZSBzYW1lIGNvbmZpZ3VyZWQKPiA+ID4gPiA+IElQ
Cj4gPiA+ID4gPiBvbgo+ID4gPiA+ID4gU3RhckZpdmUgSkg3MTEwIGFuZCBULUhlYWQgVEgxNTIw
KS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJZiB3ZSBjYW4gZ2V0IHZpdmFudGUsZ2MgdG8gd29yayB3
L28gU29DIHNwZWNpZmljIGNvbXBhdGlibGUsCj4gPiA+ID4gPiB0aGVuIHdlCj4gPiA+ID4gPiBz
aG91bGQgYmUgYWJsZSB0byBnZXQgdmVyaXNpbGljb24sZGMgdG8gd29yayB0b28uCj4gPiA+ID4K
PiA+ID4gPiBXZWxsIG1heWJlIEkgc2hvdWxkIGFkZCBldG5hdml2IHBlb3BsZSB0byB0aGUgcmVj
aXBpZW50IGxpc3QsIHRvCj4gPiA+ID4gYWxsb3cKPiA+ID4gPiB0aGVtIHRvIHRlbGwgdXMgdGhl
IG1hZ2ljIGJlaGluZCB2aXZhbnRlLGdjIC4KPiA+ID4gPgo+ID4gPgo+ID4gPiBWaXZhbnRlIEdQ
VXMgYXJlIHNwZWNpYWwgYmVjYXVzZSB0aGV5IGNvbnRhaW4gcmVnaXN0ZXJzIHRoYXQgYWxsb3cK
PiA+ID4gdGhlbSB0bwo+ID4gPiBiZSBmdWxseSBpZGVudGlmaWVkIC0gc2VlIGV0bmF2aXZfaHdf
aWRlbnRpZnkoLi4pLgo+ID4gPgo+ID4gPiBXZSBjYW4gcmVhZCBvdXQgdGhlIGZvbGxvd2luZyBp
bmZvcm1hdGlvbjoKPiA+ID4gIC0gbW9kZWwKPiA+ID4gIC0gcmV2aXNpb24KPiA+ID4gIC0gcHJv
ZHVjdF9pZAo+ID4gPiAgLSBjdXN0b21lcl9pZAo+ID4gPiAgLSBlY29faWQKPiA+Cj4gPiBXZWxs
IFZlcmlzaWxpY29uIERDcyAoc29tZXRpbWVzIGFsc28gY2FsbGVkIFZpdmFudGUgRENzIGJlY2F1
c2UKPiA+IFZpdmFudGUKPiA+IGlzIG5vdyBwYXJ0IG9mIFZlcmlzaWxpY29uKSBleGNlcHQgRENO
YW5vIGhhdmUgdGhlIHNhbWUgc2V0IG9mIElECj4gPiByZWdpc3RlcnMgKEluIGZhY3QgdGhlIHJl
Z2lzdGVycyBiZWZvcmUgMHgxNTAwIHNlZW0gdG8gaGF2ZSBtb3N0bHkKPiA+IHRoZQo+ID4gc2Ft
ZSBtZWFuaW5nIHdpdGggR1BVcywgc2VlIFsxXSwgaGVyZSB0aGUgcmVnaXN0ZXJzIGFyZSBldmVu
IG5hbWVkCj4gPiBHQ3ssUkVHfV94eHgpLCBzbyBpdCdzIHdoeSBJIGFzc3VtZSAidmVyaXNpbGlj
b24sZGMiIHdpbGwgd29yayBoZXJlLgo+ID4KPiA+IEFuIGV4YW1wbGUgb2YgaWRlbnRpZmljYXRp
b24gcmVnaXN0ZXJzIHJlYWRvdXQgb24gVEgxNTEwIGlzIHNob3duCj4gPiBiZWxvdzogKHRoZSBy
ZWdpc3RlciBuYW1lcyBhcmUgZnJvbSBldG5hdml2IHN0YXRlX2hpLnhtbCkKPiA+IGBgYAo+ID4g
cm9vdEBscGk0YTY2IFsgfiBdICMgYnVzeWJveCBkZXZtZW0gMHhmZmVmNjAwMDIwICMgTU9ERUwK
PiA+IDB4MDAwMDgyMDAKPiA+IHJvb3RAbHBpNGE2NiBbIH4gXSAjIGJ1c3lib3ggZGV2bWVtIDB4
ZmZlZjYwMDAyNCAjIFJFVgo+ID4gMHgwMDAwNTcyMAo+ID4gcm9vdEBscGk0YTY2IFsgfiBdICMg
YnVzeWJveCBkZXZtZW0gMHhmZmVmNjAwMDI4ICMgREFURQo+ID4gMHgyMDIxMDIwMQo+ID4gcm9v
dEBscGk0YTY2IFsgfiBdICMgYnVzeWJveCBkZXZtZW0gMHhmZmVmNjAwMDJjICMgVElNRQo+ID4g
MHgxMTEzMzAwMAo+ID4gcm9vdEBscGk0YTY2IFsgfiBdICMgYnVzeWJveCBkZXZtZW0gMHhmZmVm
NjAwMDMwICMgQ1VTVE9NRVJfSUQKPiA+IDB4MDAwMDAzMEEKPiA+IHJvb3RAbHBpNGE2NiBbIH4g
XSAjIGJ1c3lib3ggZGV2bWVtIDB4ZmZlZjYwMDBhOCAjIFBST0RVQ1RfSUQKPiA+IDB4MDIwODIw
MDAKPiA+IHJvb3RAbHBpNGE2NiBbIH4gXSAjIGJ1c3lib3ggZGV2bWVtIDB4ZmZlZjYwMDBlOCAj
IEVDT19JRAo+ID4gMHgwMDAwMDAwMAo+ID4gYGBgCj4gPgo+Cj4gUm9iLAo+Cj4gSXMgdGhpcyBh
biBhY2NlcHRhYmxlIGFuc3dlciBvZiBub3QgaGF2aW5nIGEgdmVuZG9yLXNwZWNpZmljCj4gY29t
cGF0aWJsZT8KPgo+IElmIGl0IGlzbid0LCBJIHdpbGwgYWRkIHZlbmRvci1zcGVjaWZpYyBjb21w
YXRpYmxlIHN0cmluZ3MgdG8gdGhlIG5leHQKPiByZXZpc2lvbiBvZiB0aGUgYmluZGluZywgYW5k
IG1heWJlIGFsc28gdHJ5IHRvIGFkZCB0aGVtIGZvciB2aXZhbnRlLGdjLgo+CgpUaGVyZSBpcyBu
byBuZWVkIHRvIHRvdWNoIGFueXRoaW5nIGZvciB2aXZhbnRlLGdjLgoKLS0gCmdyZWV0cwotLQpD
aHJpc3RpYW4gR21laW5lciwgTVNjCgpodHRwczovL2NocmlzdGlhbi1nbWVpbmVyLmluZm8vcHJp
dmFjeXBvbGljeQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
