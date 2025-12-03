Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE716D12D56
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Dec 2025 12:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dxVcuwk9NNlGWKgguNnHIfoWBTL5T9Uc7VtkOKhrdmU=; b=1uiWJF49uueAnJ
	k6w9DWPtho/+t8lIYkpVfvnlWET8nc//j6AYJ9Fj3D79qbtncPADHEMzeQHGSL2Lj1vaNaJVKBDux
	95uMIy4L9zVUHmgPQAP8Qw2GAIY1I9WCYSon/1FPhNjAvP4PyWJJOl+XpJH0IzWeRRWU4PX0E1/Mt
	qlHlJuAAnHesRm145jhSDYz488Ql+MfMLf0F1YZWCAGs+3aBxrJEXjdjX5Z6FtJmK9/drc/Oyv6GL
	EbYRwuuTXshCzZPytklHTXfDze0WFb8mcwe9UdTEVq9aX5y0unfZm35wUxkLXwa8ylitmc0g+Lbo2
	mcEjJdp/54d01e5R76Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQmJm-00000006ZZh-13j9;
	Wed, 03 Dec 2025 12:50:50 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQmJj-00000006ZZO-33Mz
	for linux-riscv@lists.infradead.org;
	Wed, 03 Dec 2025 12:50:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=7bxUoqueGpQycm3ueoFCbBXEoaqy3OXWepI1Z2fqw/A=;
	b=aKKM/a010O5Zv40M+uV1VBr2yAXU/uHA341A76X1g6clSwx4howYEK9cB34HlM
	+/FncaDBPL/CqvC/geBcMUAjEDdWTETSTzpLUPtKBiutg2QUaP6MvqSBfqP0kYb1
	zfIzDU8NVTCiTmV6qgIJH1RSoBmNdr0pUwY7egvROUvPE=
Received: from duge-virtual-machine.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wCntgIWMjBpPLfXDg--.632S2;
	Wed, 03 Dec 2025 20:50:32 +0800 (CST)
From: q691800735@163.com
To: conor@kernel.org,
	krzk@kernel.org
Cc: linux-riscv@lists.infradead.org,
	Jiayu Du <q691800735@163.com>
Subject: Re: [PATCH] riscv: dts: canaan: Add K230 clock provider DTSI
Date: Wed,  3 Dec 2025 20:50:23 +0800
Message-ID: <20251203125027.9820-1-q691800735@163.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203-f383bdd0@spud>  
References: <[PATCH] riscv: dts: canaan: Add K230 clock provider DTSI> <20251203-f383bdd0@spud>
MIME-Version: 1.0
X-CM-TRANSID: _____wCntgIWMjBpPLfXDg--.632S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfUFkucDUUUU
X-Originating-IP: [183.192.220.104]
X-CM-SenderInfo: jtwzimyqqxjki6rwjhhfrp/xtbBgAsZMGkwKW+qJwAAsw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_045048_235350_91F438D6 
X-CRM114-Status: UNSURE (   5.29  )
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

SGkgQ29ub3IsIEtyenlzenRvZiwKClNvcnJ5IGZvciB0aGUgcHJvYmxlbWF0aWMgcGF0Y2ggYW5k
IGFueSBoYXNzbGUgaXQgY2F1c2VkLiBBcyBhIG5ldyBjb250cmlidXRvciBmb2N1c2VkIG9uIEsy
MzAgZHJpdmVycywgeW91ciBub3RlIGFib3V0IG9uZ29pbmcgY2xvY2sgZHJpdmVyIHdvcmsgd2Fz
IGNydWNpYWwuCgpJ4oCZbGwgaW1tZWRpYXRlbHkgc3RvcCBkdXBsaWNhdGUgZGV2ZWxvcG1lbnQs
IHNlYXJjaCB0aGUgbGludXgtcmlzY3YgYXJjaGl2ZXMgZm9yIHRoZSBleGlzdGluZyBLMjMwIGNs
ayBkcml2ZXIgcGF0Y2hlcywgYW5kIHJlYWNoIG91dCB0byB0aGUgbGVhZCBkZXZlbG9wZXIgdG8g
YWxpZ24gb24gbmV4dCBzdGVwcy4gSeKAmW0gY29tbWl0dGVkIHRvIGxlYXJuaW5nIHVwc3RyZWFt
IHN0YW5kYXJkcyBhbmQgbWFraW5nIG1lYW5pbmdmdWwgY29udHJpYnV0aW9ucyBtb3ZpbmcgZm9y
d2FyZC4KClRoYW5rcyBmb3IgeW91ciBwYXRpZW5jZSBhbmQgZ3VpZGFuY2UuCgpTaWduZWQtb2Zm
LWJ5OiBKaWF5dSBEdSA8cTY5MTgwMDczNUAxNjMuY29tPgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
