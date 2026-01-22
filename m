Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EE3C44500
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 09:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FdtOJlMPp5P9mW9IE1Lu/0buJz1QuMgwMyoKTY/4omM=; b=HpfuiXF3oX7VEX
	TNaVpgHuNoK+R5hAFVWxLHTpBWXopfPm9xBiQDvjErLUzqmOcnICyljDyB2HV5fNPVF8Lv9dXHpXA
	8zKNlIHJ/pfB9rvY7xPC6mxyvitnE5uP3X4MgT6KSIOZbEDf6rK2vsZRNyPMQ/w0Vg0zdiisEIYtf
	X3G/D+Fx7PcX8+47VIFsnfxVE7FOlhd2k5xwlm0X8B8fM5+VsWMdkbUN1jy5OxGtZMsw3AKHsFjdm
	jiwo7wzS5yE0S6Rf+FpAAMcX4vhHZf4kHUGAB1ccwBS9Tv0W0jvGxtvafisQKUHnr12pChtolG5dq
	F8cy+HgorioGDv+frLQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vir0M-00000006k6i-1Ilz;
	Thu, 22 Jan 2026 09:29:30 +0000
Received: from sender4-pp-f119.zoho.com ([136.143.188.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vir0J-00000006k6E-3JnC
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 09:29:29 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769074142; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Udvbm8NgR2dtivyV/B8IJDDZ879uhF5Ci3xQtoVfIihHPwArmKYLfmxJVM7t4A+/a6Z40cTs6yZQsk3h02ba5Zr9r0Ryz+zGG13v920KVVt8yHcZqnNFM+l+3r8DQ0eEwbMXugtZNzmkGu86oQCEEggkKTmXz//f2Nah8wcqF0Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769074142; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jkBmy4kjCDcQOpfASv2lnaUG8rOadoq5dD9Vpg8Ptdk=; 
	b=L+MkeuxBkvhwGY8m1P0SJA4Y5mnZPrFwRWtqv3W6tutGLI3HwXhXinZ1NGnE2vJeUa3HE48xaN0MNFNNFTiuNB8rsccfWzX1UZxfGPGs4yRXtg/cyGAFwafSCiwuj4hy2r+O9OJpbvwqpVVVOnyk7gxB6I/Q+37gja1oHdTYPqQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769074142;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=jkBmy4kjCDcQOpfASv2lnaUG8rOadoq5dD9Vpg8Ptdk=;
	b=Y2mbPBuOuCj9AxxoCurKOpHBaIkqJQIOkD9SwYE43pZlGaPEu9D2e7xCcwzBWaMO
	GwV0ar9sHZrVXjosHPl3cjjnsbSVvFOx73PZp2KCnt5aHnTAtOlh393GhhdYnydVJCR
	teiljx6lsiYlcFNvaZQTSVaVpMxwTYWebbA8yiBR9xDEe0TjiuMvwkcWcCzcyAgQRB8
	hWibZuPEkykvZ9UK/irHVLmbgOyetIiAoSbG4kG31JIcJ+tY53vkNAnk0ihVRwWmLeR
	h1AfgaOr34lurEyIZmOcbxv34+iUmzwLrRhJhuo9s8OIUAkx9VnFB/JtjXvWO9juQN9
	J8T9eAtDYg==
Received: by mx.zohomail.com with SMTPS id 176907414121622.6349085265756;
	Thu, 22 Jan 2026 01:29:01 -0800 (PST)
Message-ID: <7802bbc5edf2cfd6bf0d3f189aa7e6f6fc62e6ae.camel@icenowy.me>
Subject: Re: [PATCH v5 3/9] drm: verisilicon: add a driver for Verisilicon
 display controllers
From: Icenowy Zheng <uwu@icenowy.me>
To: Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Dmitry Baryshkov
 <lumag@kernel.org>,  Michal Wilczynski <m.wilczynski@samsung.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Han Gao <rabenda.cn@gmail.com>,  Yao
 Zi <ziyao@disroot.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Han Gao <gaohan@iscas.ac.cn>
Date: Thu, 22 Jan 2026 17:28:48 +0800
In-Reply-To: <56e1974c-0fe6-4bdb-918d-fcf6a8b866c1@suse.de>
References: <20260116043746.336328-1-zhengxingda@iscas.ac.cn>
	 <20260116043746.336328-4-zhengxingda@iscas.ac.cn>
	 <56e1974c-0fe6-4bdb-918d-fcf6a8b866c1@suse.de>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_012927_900984_96BCF111 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
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

5ZyoIDIwMjYtMDEtMjHmmJ/mnJ/kuInnmoQgMTM6NTYgKzAxMDDvvIxUaG9tYXMgWmltbWVybWFu
buWGmemBk++8mgoKPT09PT09PT09PT09PT0gODwgPT09PT09PT09PT09PT09PT09PT09PT0KPiA+
ICtzdGF0aWMgaW50IHZzX2dlbV9kdW1iX2NyZWF0ZShzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJp
diwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fbW9kZV9jcmVh
dGVfZHVtYiAqYXJncykKPiA+ICt7Cj4gPiArwqDCoMKgwqDCoMKgwqAvKiBUaGUgaGFyZHdhcmUg
d2FudHMgMTI4Qi1hbGlnbmVkIHBpdGNoZXMgZm9yIGxpbmVhcgo+ID4gYnVmZmVycy4gKi8KPiA+
ICvCoMKgwqDCoMKgwqDCoGFyZ3MtPnBpdGNoID0gQUxJR04oRElWX1JPVU5EX1VQKGFyZ3MtPndp
ZHRoICogYXJncy0+YnBwLAo+ID4gOCksIDEyOCk7Cj4gCj4gUGxlYXNlIHVzZSB0aGUgbmV3IGRy
bV9tb2RlX2FsaWduX2R1bWIoKSBpbnN0ZWFkLgoKSXQgc2VlbXMgdG8gYmUgc3RpbGwgYSBzdGF0
aWMgZnVuY3Rpb24sIGF0IGxlYXN0IGluIDYuMTktcmMxIC4KCkl0IGxvb2tzIGxpa2UgSSBzaG91
bGQgcHV0IGEgY2FsbCB0byBkcm1fbW9kZV9zaXplX2R1bWIoKSBoZXJlLCBpcyB0aGlzCmNvcnJl
Y3Q/CgpUaGFua3MsCkljZW5vd3kKCj4gCj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqByZXR1cm4g
ZHJtX2dlbV9kbWFfZHVtYl9jcmVhdGVfaW50ZXJuYWwoZmlsZV9wcml2LCBkcm0sCj4gPiBhcmdz
KTsKPiA+ICt9Cj4gPiArCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
