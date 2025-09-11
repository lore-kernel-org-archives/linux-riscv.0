Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4450ACAC58E
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 16:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jFOj8rh4cuaKWwWcigJ/C/ececBLGSd6Lf3ZSI/VymE=; b=2bZiy85lXZ37paF64qKVW/8eAU
	GT+XG3OTZK82igVBSHzyfWyhr2ensL0l6CqjVZXFExIXK2YIh80XoXPQa9Rbn9b1fj8tQq/eSmMZU
	86w2n8uluOz27arXj+XH9d/BCGgbDfnbCTIuyxAsj/qriUrfRj/6pG0WdMGon2o/jJkxPxJtBYKua
	a7Bue9m27DbQTs7BYo7WUlC2ihu0Ao847wC+tmE+LKEUE3zUC3iJLLKO2K0PMXxLRVKF+gn4VdKvB
	htoNvyEat+NShFyZETeAChimmEGIAaiOcCQH1g+DAkxMIvvK3D4pdwhqCvmdv7AkW5opo45DB+5Kk
	SpxLUZZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjzs-000000049ah-3q9J;
	Thu, 11 Sep 2025 16:18:08 +0000
Received: from relay1.mymailcheap.com ([149.56.97.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjzq-000000049aO-3ET2
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 16:18:07 +0000
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay1.mymailcheap.com (Postfix) with ESMTPS id 38E793E9B6;
	Thu, 11 Sep 2025 16:18:02 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id D119B400AA;
	Thu, 11 Sep 2025 16:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1757607480; bh=e2daLt1V5mwDLfvAGnCZnTwhKH5st86SEoa+sdQ3cwY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=pvJXc7OOKMED2ekAYpSqv4knHYjPwO5dDZlAKPC35VG+sb/VtDFXUl1NnqYrh1UXj
	 oqtSXUorEwrfscU8/9u2M4zcEMrV/eH3P395DK2FP6hwsrSKEbXFUe0CZeXuSaX2Y5
	 qv2uXDs7e95IXNUkJseNOzjItiidNbT6Xz/0iZN0=
Received: from [198.18.0.1] (unknown [183.95.75.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id BE34E41059;
	Thu, 11 Sep 2025 16:17:41 +0000 (UTC)
Message-ID: <35447ba0-21c2-4a12-9d27-033a7be0af3e@aosc.io>
Date: Fri, 12 Sep 2025 00:17:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] PCI: sg2042: Add Sophgo SG2042 PCIe driver
To: Chen Wang <unicornxw@gmail.com>, kwilczynski@kernel.org,
 u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 arnd@arndb.de, bwawrzyn@cisco.com, bhelgaas@google.com,
 unicorn_wang@outlook.com, conor+dt@kernel.org, 18255117159@163.com,
 inochiama@gmail.com, kishon@kernel.org, krzk+dt@kernel.org,
 lpieralisi@kernel.org, mani@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh@kernel.org, s-vadapalli@ti.com,
 tglx@linutronix.de, thomas.richard@bootlin.com, sycamoremoon376@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, rabenda.cn@gmail.com, chao.wei@sophgo.com,
 xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
References: <cover.1757467895.git.unicorn_wang@outlook.com>
 <162d064228261ccd0bf9313a20288e510912effd.1757467895.git.unicorn_wang@outlook.com>
Content-Language: en-US
From: Mingcong Bai <jeffbai@aosc.io>
In-Reply-To: <162d064228261ccd0bf9313a20288e510912effd.1757467895.git.unicorn_wang@outlook.com>
X-Rspamd-Queue-Id: D119B400AA
X-Rspamd-Server: nf2.mymailcheap.com
X-Spamd-Result: default: False [1.40 / 10.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dt];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,baylibre.com,eecs.berkeley.edu,ghiti.fr,arndb.de,cisco.com,google.com,outlook.com,163.com,dabbelt.com,sifive.com,ti.com,linutronix.de,bootlin.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,sophgo.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com,outlook.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_091806_883331_E015FD4A 
X-CRM114-Status: UNSURE (   7.04  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQ2hlbiwKCuWcqCAyMDI1LzkvMTAgMTA6MDgsIENoZW4gV2FuZyDlhpnpgZM6Cj4gK2NvbmZp
ZyBQQ0lFX1NHMjA0Ml9IT1NUCj4gKwl0cmlzdGF0ZSAiU29waGdvIFNHMjA0MiBQQ0llIGNvbnRy
b2xsZXIgKGhvc3QgbW9kZSkiCj4gKwlkZXBlbmRzIG9uIE9GICYmIChBUkNIX1NPUEhHTyB8fCBD
T01QSUxFX1RFU1QpCj4gKwlzZWxlY3QgUENJRV9DQURFTkNFX0hPU1QKPiArCWhlbHAKPiArCSAg
U2F5IFkgaGVyZSBpZiB5b3Ugd2FudCB0byBzdXBwb3J0IHRoZSBTb3BoZ28gU0cyMDQyIFBDSWUg
cGxhdGZvcm0KPiArCSAgY29udHJvbGxlciBpbiBob3N0IG1vZGUuIFNvcGhnbyBTRzIwNDIgUENJ
ZSBjb250cm9sbGVyIHVzZXMgQ2FkZW5jZQo+ICsJICBQQ0llIGNvcmUuCj4gKwoKV2hpbGUgYnVp
bGQgdGVzdGluZyB0aGlzIHBhdGNoIGFnYWluc3QgdjYuMTYuNiwgUENJRV9TRzIwNDJfSE9TVCBp
cyBzZXQgCnRvICJNIiwgdGhlIGtlcm5lbCB3b3VsZCBmYWlsIHRvIGJ1aWxkIGR1cmluZyBNT0RQ
T1NUOgoKRVJST1I6IG1vZHBvc3Q6ICJjZG5zX3BjaWVfcG1fb3BzIiAKW2RyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvY2FkZW5jZS9wY2llLXNnMjA0Mi5rb10gdW5kZWZpbmVkIQptYWtlWzJdOiAqKiog
W3NjcmlwdHMvTWFrZWZpbGUubW9kcG9zdDoxNDc6IE1vZHVsZS5zeW12ZXJzXSBFcnJvciAxCm1h
a2VbMV06ICoqKiBbWy4uLl0vbGludXgtNi4xNi42L01ha2VmaWxlOjE5NTM6IG1vZHBvc3RdIEVy
cm9yIDIKbWFrZTogKioqIFtNYWtlZmlsZToyNDg6IF9fc3ViLW1ha2VdIEVycm9yIDIKCkJlc3Qg
UmVnYXJkcywKTWluZ2NvbmcgQmFpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
