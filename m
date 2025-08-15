Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FAECA0EE6
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 18:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OOENMo1/SQGkcwJBPkdr4TaXTRux7CmZbLeMNYdGYjE=; b=4D5eqFGs2+lcxk
	Hvx2hZStK+jCQZbYaJkmMS9M7xCHoSkzI0euinPjOVNhHWBlMm9tpIqG9pFjvvcHWjwTXXi5lPHJ5
	6bM+JMbRhlALeGT4OuIlA8Un6zQj2nyMiG3O6sbukhLNGXgMNxiNxdfdg8hkzcI3Ls6f3UBZ6BA1S
	NX+0fJjGsj+7avH/ISsTtKN5/OVmUE3rOg3lRpiKb1nFAJJhf1vusSRQSu39Rxc3LaRz1MENvV/AN
	7v5ykAESPkm2WRIrjj0h5UVve0pBIt+I+DiBJ9SbCzmb9Froh/9Q5ZOtyKzLUqg3DJBxBotiOfA2H
	n+o4WVExaWPAEfVmhfGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umzeB-00000003Iuq-07Mu;
	Fri, 15 Aug 2025 18:59:27 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umxjC-000000031iy-10NK
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 16:56:31 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755276951; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=I1KZnk3WfWu1cQ1jxo1VsRmVlsIU6YWwRBnQ+f+2yAaXYuT1GF06HaMm1bYWgIykWQ3ejH8CVF9lxpbJyrekzjd/BMgRd+dyf2MFw2VWhEbBUy282KwR8JwYFjeiC+0XJRWFSrg8d1Lb8Cd/O7596VadBC0dXGsr8HG3IE0iCtc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755276951; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gC5qM8Cx4LZKmph+qExp4Xp+Dwg1SSgnweE6z3hBj74=; 
	b=ECGfifXF8LeZ11Fbrw7CIdhDs13TS94oxcGQIT4lhe+9BLYzR8fdeZzIbaUEfOeHsuniaMFNnBdkD11Em0bqxEYfB+g7+2VV3hfq/WQtT+P1ChgC2RMZazVoO5Mq8lf/zN95INDIm56czekmyvGrFe5sqvHhn8GMLFR1WVJtShg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755276951;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=gC5qM8Cx4LZKmph+qExp4Xp+Dwg1SSgnweE6z3hBj74=;
	b=Iw14CfU1QZEZi+0aTWkSK3gHhPyKKe4IiLXbJYkbjoLfA0MZA2KDOgkOvD7X/b92
	1Cnp7M+S5JGnp1c7BES11OzTUcekZv3zvAkJt5+mv24ERxQWt+/LAu8fGdKT6DBn/2/
	sPoKWxcIAeepUpnklcvR5i0jz/8BHKmzuZWU86Pme78sSmm654pDeDH1SzwjsxSRps1
	0uapNW+dtYwiAxjtklUCNrxPgcu+yUBc6f1HoQ1dK1kOqzOoAaIoZnvCO/2NbX4v/FD
	NioOsiRHXUJe7h3pK9GnM5bulOgMYxsmX4uNnn5d8fzX9w0p5ftvSrH9Kb1CXChmvdw
	QY9Rh5cP1Q==
Received: by mx.zohomail.com with SMTPS id 1755276948014489.74805819275286;
	Fri, 15 Aug 2025 09:55:48 -0700 (PDT)
Message-ID: <d07fa80e65949c4f0a5200cee1daf4783f038e37.camel@icenowy.me>
Subject: Re: [RFC PATCH 2/8] dt-bindings: display: add versilicon,dc
From: Icenowy Zheng <uwu@icenowy.me>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Drew Fustini
 <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>,  Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner
 <heiko@sntech.de>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal
 Wilczynski <m.wilczynski@samsung.com>, Han Gao <rabenda.cn@gmail.com>, Yao
 Zi <ziyao@disroot.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
Date: Sat, 16 Aug 2025 00:55:34 +0800
In-Reply-To: <4655d43b17c732947246f0e0deac14265fa07ca1.camel@icenowy.me>
References: <20250814164048.2336043-1-uwu@icenowy.me>
	 <20250814164048.2336043-3-uwu@icenowy.me>
	 <20250814220444.GA3988176-robh@kernel.org>
	 <5af90b60-d65b-4e80-9a27-44938bbd450b@kernel.org>
	 <4655d43b17c732947246f0e0deac14265fa07ca1.camel@icenowy.me>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_095630_339291_37C5D40E 
X-CRM114-Status: GOOD (  15.67  )
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

5ZyoIDIwMjUtMDgtMTXmmJ/mnJ/kupTnmoQgMTc6NTMgKzA4MDDvvIxJY2Vub3d5IFpoZW5n5YaZ
6YGT77yaCj4g5ZyoIDIwMjUtMDgtMTXmmJ/mnJ/kupTnmoQgMTE6MDkgKzAyMDDvvIxLcnp5c3p0
b2YgS296bG93c2tp5YaZ6YGT77yaCj4gPiBPbiAxNS8wOC8yMDI1IDAwOjA0LCBSb2IgSGVycmlu
ZyB3cm90ZToKPiA+ID4gPiArCj4gPiA+ID4gK21haW50YWluZXJzOgo+ID4gPiA+ICvCoCAtIElj
ZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1lPgo+ID4gPiA+ICsKPiA+ID4gPiArcHJvcGVydGll
czoKPiA+ID4gPiArwqAgJG5vZGVuYW1lOgo+ID4gPiA+ICvCoMKgwqAgcGF0dGVybjogIl5kaXNw
bGF5QFswLTlhLWZdKyQiCj4gPiA+ID4gKwo+ID4gPiA+ICvCoCBjb21wYXRpYmxlOgo+ID4gPiA+
ICvCoMKgwqAgY29uc3Q6IHZlcmlzaWxpY29uLGRjCj4gPiA+IAo+ID4gPiBJZiB0aGUgY2xvY2tz
IG9yIHJlc2V0cyB2YXJpZXMgYnkgcGxhdGZvcm0sIHRoZW4geW91IG5lZWQgYW4gU29DIAo+ID4g
PiBzcGVjaWZpYyBjb21wYXRpYmxlIHN0aWxsLiBJZiB0aGVzZSBjbG9ja3MvcmVzZXRzIGFyZSBz
dHJhaWdodAo+ID4gPiBmcm9tCj4gPiA+IHRoZSAKPiA+ID4gUlRMIGFuZCBhbnkgb3RoZXIgbnVt
YmVyIG9mIGNsb2Nrcy9yZXNldHMgaXMgd3JvbmcsIHRoZW4gd2UgY2FuCj4gPiA+IHN0aWNrIAo+
ID4gPiB3aXRoIGp1c3QgdGhpcyBjb21wYXRpYmxlLgo+ID4gCj4gPiBTaG91bGRuJ3Qgd2UgaGF2
ZSBoZXJlIGFsd2F5cyBTb0MgY29tcGF0aWJsZT8gQ2FuIGl0IGJlIGV2ZXIgdXNlZAo+ID4gYWxv
bmUsCj4gPiBvdXRzaWRlIG9mIGdpdmVuIFNvQz8KPiA+IAo+ID4gSSBjb3VsZCBpbWFnaW5lIG5v
dzoKPiA+IAo+ID4gaXRlbXM6Cj4gPiDCoCAtIHt9Cj4gPiDCoCAtIGNvbnN0OiB2ZXJpc2lsaWNv
bixkYwo+IAo+IEkgZm9sbG93ZWQgdGhlIGB2aXZhbnRlLGdjYCBzaXR1YXRpb24gaGVyZSwgYmVj
YXVzZSB0aGUgcmVnaXN0ZXJzCj4gYmVmb3JlIDB4MTQwMCAod2hlcmUgcmVhbCBkaXNwbGF5LXJl
bGF0ZWQgdGhpbmdzIHN0YXJ0KSBzZWVtcyB0bwo+IGZvbGxvdwo+IHRoZSBzYW1lIHNjaGVtZSB3
aXRoIEdDLXNlcmllcyBHUFVzLCBpbmNsdWRpbmcgdGhlIGlkZW50aWZpY2F0aW9uCj4gcmVnaXN0
ZXJzLgoKQW4gZXhhbXBsZSBoZXJlOiB0aGUgY3VzdG9tZXIgaWQgKDB4MDAzMCkgcmVnaXN0ZXIg
dmFsdWUgcmVhZCBvdXQgb24gVC0KSGVhZCBUSDE1MjAgaXMgMHgzMGEsIGJ1dCBvbiBTdGFyRml2
ZSBKSDYxMTAgaXQncyAweDMwZSBpbnN0ZWFkLgoKKEJvdGggYXJlIERDODIwMCByZXYgNTcyMCwg
c28gdGhlIDB4MDAyMCByZWcgaXMgMHg4MjAwIGFuZCAweDAwMjQgcmVnCmlzIDB4NTcyMC4pCgo+
IAo+ID4gCj4gPiAKPiA+IEJlc3QgcmVnYXJkcywKPiA+IEtyenlzenRvZgo+IAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
