Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306C3C44519
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 13:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qwXihj20T/pTI6KSU/ujGtNkyp0wnb/Rn/Kdi8p09ec=; b=mEaJDx2RKliiN7
	4N+BqJyNXO7mmCiqV530XF//Aq2gEWwWx3124MzQlxT89DO+ncTKVcAbUd3+VJkPSUcTG1V0eA4yu
	6XWUsaP2w7Q8vHFYtK2YsCGKnt2NJrhTm/x9rW1cUr1S3wwt7Xk37FDyTvuQDCllvCgwYNDnXSwQ/
	sIZ+5bzh0JRROYack0tGATegchDiEft1NLHTA8DQF0jIo+1cqILTixXWS7LZDhpaqwB/55GaruLcd
	iPbkFW69nxJaCu2awpznVBMB9HoBXLhkQc3UOZtmA/FSAzrmGbzTKL54nli5GVbfAEo0yVo4GK/wV
	0vx5d6QYubUjhfYJuSrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk06p-0000000F1IZ-2735;
	Wed, 15 Jul 2026 13:57:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk06n-0000000F1HE-3DcU
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 13:57:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E969414FA;
	Wed, 15 Jul 2026 13:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E02F1F000E9;
	Wed, 15 Jul 2026 13:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784123829;
	bh=6L+vazQzDXMLa/yjhu8CrwcvdpiJna1r16t0Ef63MtI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XQOPV/w6jbclzedaGV+pbm6Ps+bkLkulvSxSGscKzEqZ1QkFhr72D9+LeLREzTTNU
	 wjmUafwLEuBcmg93wmSzFO8mIA2WiLFhinoVsXqC70reA+Pqg7Fxw4NR5w8Lb4hCvj
	 CuOZurkZ79dBArFKFGTbhBGMv/XPrP+2ijd1piV1oJE9OOoZ0VpnSdMTh0YdjiU0Gp
	 X81BPceIxIWeB8YSSmA8GJrIfEkPX58LkOXzYC86JjSYuCGuR9H+BIT3ji1IX8PkYM
	 NuNfzot3s9JAe2rAnFEgVFWZ7aJWemewCfm72/5CfJpT0CNKVlaAkYk5jLFZWczLDJ
	 skNbekyTLQtrQ==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Yixun Lan <dlan@kernel.org>, Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260704122538.92830-1-pengpeng@iscas.ac.cn>
References: <20260704122538.92830-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] PCI: dwc: spacemit: add missing MODULE_DEVICE_TABLE()
Message-Id: <178412382616.147568.15614000262290190322.b4-ty@b4>
Date: Wed, 15 Jul 2026 15:57:06 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15.2
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

Ck9uIFNhdCwgMDQgSnVsIDIwMjYgMjA6MjU6MzggKzA4MDAsIFBlbmdwZW5nIEhvdSB3cm90ZToK
PiBUaGUgZHJpdmVyIGhhcyBhbiBPRiBtYXRjaCB0YWJsZSB3aXJlZCB0byAub2ZfbWF0Y2hfdGFi
bGUsIGJ1dCBkb2VzCj4gbm90IGV4cG9ydCB0aGUgdGFibGUgd2l0aCBNT0RVTEVfREVWSUNFX1RB
QkxFKCkuCj4gCj4gQWRkIHRoZSBtaXNzaW5nIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIC4uLikg
ZW50cnkgc28gbW9kdWxlIGFsaWFzCj4gaW5mb3JtYXRpb24gaXMgZ2VuZXJhdGVkIGZvciBPRiBi
YXNlZCBtb2R1bGUgYXV0b2xvYWRpbmcuCj4gCj4gVGhpcyBpcyBhIHNvdXJjZS1sZXZlbCBmaXgu
ICBJdCBkb2VzIG5vdCBjbGFpbSBkeW5hbWljIGhhcmR3YXJlCj4gcmVwcm9kdWN0aW9uOyB0aGUg
ZXZpZGVuY2UgaXMgdGhlIGRyaXZlci1vd25lZCBtYXRjaCB0YWJsZSwgaXRzIHVzZSBieQo+IHRo
ZSBwbGF0Zm9ybSBkcml2ZXIsIGFuZCB0aGUgbWlzc2luZyBtb2R1bGUgYWxpYXMgcHVibGljYXRp
b24uCj4gCj4gWy4uLl0KCkFwcGxpZWQsIHRoYW5rcyEKClsxLzFdIFBDSTogZHdjOiBzcGFjZW1p
dDogYWRkIG1pc3NpbmcgTU9EVUxFX0RFVklDRV9UQUJMRSgpCiAgICAgIGNvbW1pdDogNDZhMWI3
NGYyY2FmYWEwMTUyYTRjOTk0YzYwMDM0ZjE0MTE5NTcwYgoKQmVzdCByZWdhcmRzLAotLSAK4K6u
4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
