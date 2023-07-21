Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A47EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 05:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+Yl4s7WBFZWJPQZwp9FvEXhHkYMnFQo2BCFj3Q3GRI=; b=Ng/AkWQVFADmEE
	cG0KG9yHbyHxbDb2ZppQu/ITImCAi5/lj4obe5bKUDjOI5+qirbu358b7A5J/X4Svv2RloEhJJ1SF
	MBZqlqRv8qLOdmrZLCAmASUB5cTCLf8USMreJEeiSiMFxclvu/F+BPPDAJvmpVH59RkGUfa48RDCE
	F61ux3YwzMjNQLmidq2TdqPO8723Xkn8ffJS9G/GhYJdSjjRCA+wn/VxZiV/gsniI5zhFJ4+is6TN
	ixQIehl3bN/C9yBBQj2V2W+giBZYnc5Ua+SOG2DSt2lKcn+jXDUaa5IBeGBjvelNVeQe1e9o/ySyn
	OLhalNyTnb0DjQJQYNkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMibb-00Cuk7-1y;
	Fri, 21 Jul 2023 05:23:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMibZ-00Cujj-0x
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 05:23:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A98D06106D;
	Fri, 21 Jul 2023 05:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2856BC433C8;
	Fri, 21 Jul 2023 05:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689916983;
	bh=7TI6tqB7E156y5x5qr+a0YCtqayJkxGxgLppwFI6wGc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=hoZvho3/t8C4yvC1181/KnR0Dorlwx89i8XjOkchiHrzslAp2gnwdBvWw5KzTPyyS
	 b4cTGyVVh9IYcDCvejanjDZ6xN23qDa5edotrxNxzEtj1wtsy3CrDEze0GcW6H82WA
	 bxi+vw+qk/GCycXczgkIi5MybagHwDZ+XB8YNefxME0aKuwW0qqMpc6X6LfOEn15v4
	 1+cfCP/mbD9CiaVHcyVvy2C8vGVGdOkkhNnZ9DStZ9ssX+nAdd7XdwQMeWX3sHQg65
	 oQYd73/ZbSKCALoWMHC81ovpKLvLhXrc5x6T5/0yhpbLdue79zsqI0OdHsSOeWsYiP
	 veGSpA7y22tyg==
Date: Fri, 21 Jul 2023 06:23:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Guo Samin <samin.guo@starfivetech.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org
CC: Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Richard Cochran <richardcochran@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>
Subject: Re: [PATCH v1 0/2] Add ethernet nodes for StarFive JH7110 SoC
User-Agent: K-9 Mail for Android
In-Reply-To: <42beaf41-947e-f585-5ec1-f1710830e556@starfivetech.com>
References: <20230714104521.18751-1-samin.guo@starfivetech.com> <20230720-cardstock-annoying-27b3b19e980a@spud> <42beaf41-947e-f585-5ec1-f1710830e556@starfivetech.com>
Message-ID: <A0012BE7-8947-49C8-8697-1F879EE7B0B7@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_222305_433411_FC2C609E 
X-CRM114-Status: GOOD (  15.16  )
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

CgpPbiAyMSBKdWx5IDIwMjMgMDM6MDk6MTkgSVNULCBHdW8gU2FtaW4gPHNhbWluLmd1b0BzdGFy
Zml2ZXRlY2guY29tPiB3cm90ZToKPgo+Cj4tLS0tLS0tLSDljp/lp4vkv6Hmga8gLS0tLS0tLS0K
PuS4u+mimDogUmU6IFtQQVRDSCB2MSAwLzJdIEFkZCBldGhlcm5ldCBub2RlcyBmb3IgU3RhckZp
dmUgSkg3MTEwIFNvQwo+RnJvbTogQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPgo+5pS2
5Lu25Lq6OiBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+LCBSb2IgSGVycmluZyA8cm9i
aCtkdEBrZXJuZWwub3JnPiwgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3Nr
aStkdEBsaW5hcm8ub3JnPiwgUGF1bCBXYWxtc2xleSA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29t
PiwgUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4sIEFsYmVydCBPdSA8YW91QGVl
Y3MuYmVya2VsZXkuZWR1PiwgSGFsIEZlbmcgPGhhbC5mZW5nQHN0YXJmaXZldGVjaC5jb20+LCBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnLCBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnLCBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZywgbmV0ZGV2QHZnZXIua2VybmVsLm9yZywg
U2FtaW4gR3VvIDxzYW1pbi5ndW9Ac3RhcmZpdmV0ZWNoLmNvbT4KPuaXpeacnzogMjAyMy83LzIx
Cj4KPj4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPj4g
Cj4+IE9uIEZyaSwgMTQgSnVsIDIwMjMgMTg6NDU6MTkgKzA4MDAsIFNhbWluIEd1byB3cm90ZToK
Pj4+IFRoaXMgc2VyaWVzIGFkZHMgZXRoZXJuZXQgbm9kZXMgZm9yIFN0YXJGaXZlIEpINzExMCBS
SVNDLVYgU29DLAo+Pj4gYW5kIGhhcyBiZWVuIHRlc3RlZCBvbiBTdGFyRml2ZSBWaXNpb25GaXZl
LTIgdjEuMkEgYW5kIHYxLjNCIFNCQyBib2FyZHMuCj4+Pgo+Pj4gVGhlIGZpcnN0IHBhdGNoIGFk
ZHMgZXRoZXJuZXQgbm9kZXMgZm9yIGpoNzExMCBTb0MsIHRoZSBzZWNvbmQgcGF0Y2gKPj4+IGFk
ZHMgZXRoZXJuZXQgbm9kZXMgZm9yIHZpc2lvbmZpdmUgMiBTQkNzLgo+Pj4KPj4+IFRoaXMgc2Vy
aWVzIHJlbGllcyBvbiB4aW5neXUncyBzeXNjb24gcGF0Y2hbMV0uCj4+PiBGb3IgbW9yZSBpbmZv
cm1hdGlvbiBhbmQgc3VwcG9ydCwgeW91IGNhbiB2aXNpdCBSVnNwYWNlIHdpa2lbMl0uCj4+Pgo+
Pj4gWy4uLl0KPj4gCj4+IEFwcGxpZWQgdG8gcmlzY3YtZHQtZm9yLW5leHQsIHRoYW5rcyEKPj4g
Cj4+IFsxLzJdIHJpc2N2OiBkdHM6IHN0YXJmaXZlOiBqaDcxMTA6IEFkZCBldGhlcm5ldCBkZXZp
Y2Ugbm9kZXMKPj4gICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9jb25vci9jLzFmZjE2NmM5
Nzk3Mgo+PiBbMi8yXSByaXNjdjogZHRzOiBzdGFyZml2ZTogdmlzaW9uZml2ZSAyOiBBZGQgY29u
ZmlndXJhdGlvbiBvZiBnbWFjIGFuZCBwaHkKPj4gICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9jb25vci9jL2IxNWE3M2MzNThkMQo+PiAKPj4gVGhhbmtzLAo+PiBDb25vci4KPgo+Cj5IaSBD
b25vcu+8jAo+Cj5UaGFuayB5b3Ugc28gbXVjaO+8gSAKPgo+VGhlcmUgaXMgYSBxdWVzdGlvbiBh
Ym91dCB0aGUgY29uZmlndXJhdGlvbiBvZiBwaHkgdGhhdCBJIHdvdWxkIGxpa2UgdG8gY29uc3Vs
dCB5b3UuCj4KPkxhdGVzdCBvbiBtb3RvcmNvbW0gUEhZIFY1WzFdOiBGb2xsb3cgUm9iIEhlcnJp
bmcncyBhZHZpY2UKPm1vdG9yY29tbSxyeC14eHgtZHJpdmVyLXN0cmVuZ3RoIENoYW5nZWQgdG8g
bW90b3Jjb21tLHJ4LXh4eC1kcnYtbWljcm9hbXAgLgo+VjUgaGFzIGFscmVhZHkgcmVjZWl2ZWQg
YSByZXZpZXdlZC1ieSBmcm9tIEFuZHJldyBMdW5uLCBhbmQgaXQgc2hvdWxkIG5vdCBjaGFuZ2Ug
YWdhaW4uCj4KPlNob3VsZCBJIHN1Ym1pdCBhbm90aGVyIHBhY3RoZXMgYmFzZWQgb24gcmlzY3Yt
ZHQtZm9yLW5leHQ/IAoKSHVoLCBkdGJzX2NoZWNrIHBhc3NlZCBmb3IgdGhlc2UgcGF0Y2hlcywK
SSBkaWRuJ3QgcmVhbGlzZSBjaGFuZ2VzIHRvIHRoZSBtb3RvcmNvbW0gc3R1ZmYKd2VyZSBhIGRl
cC4gZm9yIHRoaXMuIEknbGwgdGFrZSBhIGxvb2sgbGF0ZXIuCgo+Cj5bMV0gaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L25ldGRldmJwZi9jb3Zlci8yMDIzMDcyMDExMTUwOS4y
MTg0My0xLXNhbWluLmd1b0BzdGFyZml2ZXRlY2guY29tCj4KPiAKPkJlc3QgcmVnYXJkcywKPlNh
bWluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
