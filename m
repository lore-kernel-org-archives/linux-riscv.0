Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6585D59D99
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Dec 2025 10:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:MIME-Version:Message-Id:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Iys53LrlvZBCaGy0oDGnRDc3uKuZKIbeq5gk+fgL8Kw=; b=tAHowBxJMkEGlJ
	o0M0k82SClsO8UwOfSpLUVNfopZh1cP+8qMz1cauZOd3qamjEV9DQIOI/YQG/w6D3DKXDNz4ZmQEV
	twxDSU1u5w5ojAmCiW5iy1zTDU30uT852d46wJyAHJ5G4Zr1GqTPoJCo0gSQnFRCaK1nZjwKBT5po
	qmN5v1CbbyZSyCi3N16S4xad9UbFkpLM08INkzwCbq3HaC7cpSO1O/dMYk/yco0UWBDuTObBPLTQR
	9AvubSh80851DX/4fLGHCbZMHu9Wjbq2tbfq2N2jdeXTiennHZ1hg4TL42v6jcb/b2PJD0o72p+tb
	LVqC1qsU1hWu69XcOsVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV5X5-00000003QTE-41UD;
	Mon, 15 Dec 2025 10:10:24 +0000
Received: from hamster.birch.relay.mailchannels.net ([23.83.209.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV5X2-00000003QQW-0kcR
	for linux-riscv@lists.infradead.org;
	Mon, 15 Dec 2025 10:10:22 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 35FA08C1A5B;
	Mon, 15 Dec 2025 10:10:17 +0000 (UTC)
Received: from fr-int-smtpout21.hostinger.io (trex-green-6.trex.outbound.svc.cluster.local [100.103.181.229])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 8C6F68C18B2;
	Mon, 15 Dec 2025 10:10:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1765793416;
	b=5q0e4ZQoqC9eR0hIb06oLPXZd3topRzp+c2WM5TT+6eFP33U0R7b1CDBRi1rEF8YZ4FWhk
	5C662hQnMJ+4GB5YuRCQifqtxQw2bPealhP9OGgtoIZ3vftPnRqa6VcyVaA+eOxuhBu60q
	pfFSgb0+1ErxG9mjbZJOZSPr6sP2qxe/lPBFcl3z6VctxT1j9T/ob5PaoCIcTH+di5R49M
	4QkVjaieXrAgR7lQVtGcY5uTMhKUvmucHFOEuD27a71O4dw+1z1DqJnKIyIkGZuFvabdkX
	MK7G1r5o0CpkMcdgKhmyk/cUHHf8QQQ7BoUHxuO8TzqZmLRAmbMapPBqze2nkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1765793416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=MdrmeeCks4FJzkBoGakJbsA/aHmeUE8JtLcDNU3joKA=;
	b=iNFHZha9EUz9IfCJoby0ESjnijLbxE0GuE+npkUAJqI59oavuoqdxI8W0tIRtnCJBqbYOu
	6apg7eQqyS5P5bDXX9kwhqdqtmy1/keS4n6i2jPZPfaQdrVLDn+3q2B8ZG3QyNQRlKOtwb
	87BSR3uVw2/E/o6HUAIweW1j24tpiyXWHX8gS/2sKj5H8EAMw5I1pc/v3HlXqlbDtuCoAA
	CzvaqYpVYuasVfpAQ9g4dFVXHZuL+uBDtsZ2j90wObqXfE94O1h3TC6CjPcpfdx997vhWC
	DMbSr8FO+sCHVJxZT/JOWFmYENWDHu8DpweoJ34oPcZCt3cVZPRE54R9mNvY3g==
ARC-Authentication-Results: i=1;
	rspamd-659888d77d-l96jv;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Language-Tasty: 650e12c43d4a52d0_1765793416966_771428107
X-MC-Loop-Signature: 1765793416966:1917266722
X-MC-Ingress-Time: 1765793416965
Received: from fr-int-smtpout21.hostinger.io (fr-int-smtpout21.hostinger.io
 [148.222.54.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.103.181.229 (trex/7.1.3);
	Mon, 15 Dec 2025 10:10:16 +0000
Received: from [127.0.1.1] (unknown [IPv6:2001:861:4450:d360:b35b:2e1:df94:f057])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dVG5d3m5Sz1xmR;
	Mon, 15 Dec 2025 10:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1765793413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MdrmeeCks4FJzkBoGakJbsA/aHmeUE8JtLcDNU3joKA=;
	b=l6lWVKD5824ZhPJyg7AJVVYAY/RUEm1EcL4vDKczxhCGFUzB8coFomAy0ZdIrS4AlQVwEK
	GxpN/7lSax3HXvh0uIqlwnEzVXI+CYf4aXeZ92YEhPRp3OAu+2kdAyqaZ2kelVyYJwTuZ8
	f+bw96UMjuVfLrvZEAA2/8AFlMp+rZ/ZmbThvG7v8YC1L7Xl1HlF3IvweviKG/LRva6Vun
	A/Fvj+iwWDoAtqcoJpWpaDp6s/+QamepQLwShP13sILM/u5AEuw+seFYAWoKT5qp6K+F7H
	1kBPmjQy7P4lEKeM9r9bzUAXyn+sk0tYYU7LJWhzKX3LgTc3qQzvMP9KdKcevA==
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH 0/2] Attempt to enable MMC on SpacemiT K1 boards
Message-Id: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHveP2kC/x3MSQqAMAxA0atI1gZstDhcRVzUJmoQB1oQQby7x
 eVb/P9AlKASocseCHJp1GNPMHkGfnH7LKicDFSQNWQsrgbHwwWO6Jhx2zw2VelrbsU2RJC6M8i
 k9//sh/f9AB3ORZBjAAAA
To: Yixun Lan <dlan@gentoo.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>
X-Mailer: b4 0.13.0
Date: Mon, 15 Dec 2025 10:10:13 +0000 (UTC)
X-CM-Envelope: MS4xfMZ5MhDyPJZPwYDKvirvxx1fKMrm8UoTCMi346wdL8uRWeA3Al2RY9G2cF9BkrsAAhUKdjkzOcu56gqcUxPOhHdVbMdgKCPgYcKwR94+3OpGxDbFYnhI jlv5sYzTE0rGv3jrrsdONE2XgoSUuQbQxtMu+5Rufk0d8RKnZhwXVJ9t9vOhnfFoD3ZdinBEyGyp/vRR2wq0sMw+5brES4H87+geK+iDWfcJ8barGw5g4f+P ZAgFJl4LSRF9/+X9onU9edsjP4fC5Mpq8R7/vSJGEPF3XszMFBBknYoCpFXmbwlaRyuo6JCeldW6f7xh006Podgvonl6mKxCQbNISYe9XRYxOaf9E9P3AyjX Zreb7dbvBcwZjB3D3EENEfiQQqkW1xm0FkwvchC7EfK0rBjKMTQFI9M7iIJ5HltL38KrEUNkclfyfDMTB3/JKjOrTyTDl1c+0K6G986z+AuzAtOj3bE=
X-CM-Analysis: v=2.4 cv=NuiDcNdJ c=1 sm=1 tr=0 ts=693fde85 a=1de+KQ0ukeRx8XkBeA/5cw==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=wSgA-RrWGlcEN9QXZX8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_021020_403731_7483FCA0 
X-CRM114-Status: UNSURE (   5.68  )
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

VGhlIGZvbGxvd2luZyBjb21taXRzIGFyZSB0cnlpbmcgdG8gZW5hYmxlIE1NQyBzdXBwb3J0IG9u
IHRoZSBPcmFuZ2VQaSBSVjIKYW5kIEJhbmFuYVBpIEYzIGJvYXJkcy4KClRoaXMgaXMgcGFydGlh
bGx5IHN1cHBvcnRlZC4gT24gYm90aCBib2FyZHMsIHBhcnRpdGlvbnMgYXJlCnJlY29nbml6ZWQg
YW5kIGEgZmlsZXN5c3RlbSBjYW4gYmUgcmVhZCB1bnRpbCBhIGNlcnRhaW4gcG9pbnQuCgpIb3dl
dmVyLCBhZnRlciBhdHRlbXB0aW5nIHRvIHJlYWQgYSBwYXJ0aXRpb24gdmlhIGRkIHRvIC9kZXYv
bnVsbCwKdGhpcyBlcnJvciBpcyBzaG93bjoKClsgNTAzLjg2ODY1MF0gRGlzYWJsaW5nIElSUSAj
MjEKCklSUSAjMjEgd2FzIGluZGVlZCB0aGUgSVJRIGZvciBtbWMgKGZyb20gL3Byb2MvaW50ZXJy
dXB0cyk6CgrCoMKgwqDCoMKgQ1BVMCBDUFUxIENQVTIgQ1BVMyBDUFU0IENQVTUgQ1BVNiBDUFU3
CsKgMjE6IDM5MCAwIDAgMCAwIDAgMCAwIFNpRml2ZSBQTElDIDk5IEVkZ2UgbW1jMQoKVGhpcyAi
RGlzYWJsaW5nIElSUSIgbWVzc2FnZSBjb21lcyBmcm9tIGtlcm5lbC9pcnEvc3B1cmlvdXMuYywK
bWVhbmluZyB0aGF0IHRoZSBJUlEgd2FzIHNwdXJpb3VzLCBpLmUuIG5vdCBoYW5kbGVkIGJ5IHRo
ZSBkcml2ZXIuCgpUaGlzIGlzIGNvbmZpcm1lZCBieSB0aGUgbnVtYmVyIG9mIGludGVycnVwdHM6
CgrCoMKgwqDCoMKgQ1BVMCBDUFUxIENQVTIgQ1BVMyBDUFU0IENQVTUgQ1BVNiBDUFU3CsKgMjE6
IDEwMDM5MSAwIDAgMCAwIDAgMCAwIFNpRml2ZSBQTElDIDk5IEVkZ2UgbW1jMQoKV2hhdCBjb3Vs
ZCBiZSB3cm9uZz8gQXJlIHRoZSBwaW4gY29uZmlndXJhdGlvbnMgY29ycmVjdD8KTXkgdW5kZXJz
dGFuZGluZyBvZiBNTUMvU0QgYW5kIG9mIHRoZSBLMSBTb0MgaXMgdmVyeSBsaW1pdGVkLgoKU2ln
bmVkLW9mZi1ieTogTWljaGFlbCBPcGRlbmFja2VyIDxtaWNoYWVsLm9wZGVuYWNrZXJAcm9vdGNv
bW1pdC5jb20+Ci0tLQpNaWNoYWVsIE9wZGVuYWNrZXIgKDIpOgogICAgICByaXNjdjogZHRzOiBz
cGFjZW1pdDogQWRkIGkyYyBidXNlcyBvbiBPcmFuZ2VQaSBSVjIKICAgICAgcmlzY3Y6IGR0czog
c3BhY2VtaXQ6IEFkZCBNTUMgc3VwcG9ydCBvbiBCUEktRjMgYW5kIE9yYW5nZVBpIFJWMgoKIGFy
Y2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRzICB8ICAxMiArKwog
YXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1vcmFuZ2VwaS1ydjIuZHRzIHwgMTc2ICsr
KysrKysrKysrKysrKysrKysrKysrCiBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLXBp
bmN0cmwuZHRzaSAgICAgfCAgMTMgKysKIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEu
ZHRzaSAgICAgICAgICAgICB8ICAxMCArKwogNCBmaWxlcyBjaGFuZ2VkLCAyMTEgaW5zZXJ0aW9u
cygrKQotLS0KYmFzZS1jb21taXQ6IDhmMGI0Y2NlNDQ4MWZiMjI2NTM2OTdjY2VkOGQwZDA0MDI3
Y2IxZTgKY2hhbmdlLWlkOiAyMDI1MTIxNS1rMS1ib2FyZHMtYWRkLW1tYy04NDNjN2Q5ZTU4MjIK
CkJlc3QgcmVnYXJkcywKLS0gCk1pY2hhZWwgT3BkZW5hY2tlciA8bWljaGFlbC5vcGRlbmFja2Vy
QHJvb3Rjb21taXQuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
