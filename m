Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C52D5B16F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Dec 2025 13:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZk9oqYPGHjlr7uc3W7eqceRWqwH+mcN2WHCRhsvqLo=; b=LQcNjEBKEp/5e81oM5D6l5FgtU
	9IRBJHhEbV+n12jbt9Q5kkGEVFz4eFL3ejoi/Rd3ldgMd1sUt3BuqPpfwg8JT5gZ8ZR3XIuphcyMz
	7NOcgZ3so7oehwi4ocEzcSQ50NeRI+tNo+/yL8vmgEIwvc74JXzw6YFW41hQc/cL1AobvlyAUtB2T
	6exPL3XQtCvGHclQUZMnhfX7EQgEKzI08IxnJag4qzTpydFTtp8En4JwuefRU6i42uLKJ6W711LgY
	VrnNiniX0GCUqsbCaS+64NAvMzOUJ3w6hCyoIegH0OZA+kFgBhG21Co80Wlf1TC03+CjFLguGMuHM
	vAstNgzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV96B-00000003ipi-27To;
	Mon, 15 Dec 2025 13:58:51 +0000
Received: from crocodile.elm.relay.mailchannels.net ([23.83.212.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV966-00000003inM-3nfw
	for linux-riscv@lists.infradead.org;
	Mon, 15 Dec 2025 13:58:49 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 48911801D2D;
	Mon, 15 Dec 2025 13:58:45 +0000 (UTC)
Received: from fr-int-smtpout12.hostinger.io (100-108-113-51.trex-nlb.outbound.svc.cluster.local [100.108.113.51])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id BD1D48003D8;
	Mon, 15 Dec 2025 13:58:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1765807124;
	b=iunP80axDCTN3ndTayvpqBb4oDXT2BCkV1xczBXK8qHkuqquwxDVUFbwW74mgCUa4pbQEC
	zQVL+D5JaZvjgv4HJkAZ074xbPiFuz1YaRcX16IS09oVRQa5ja4NMTShY24sObGHTq/rmR
	Ex9rXUKxx5H8D18t+nNFrhNBePoWg7r80G8wSjtdRbS/YT3qit9+y88sEO3mGp9JuYkseV
	VVlZZSZiRquMIAko8YCeOz1Pun9rkg/MYTRSpb1IkR9nUGWB+EtZoqaqcsGkXFjZM0wl3L
	X4kiDKiaelwYKLq01cYlbnxQ7+Jo9EBjjv/rkrNtWeApbNIcymvs7JGSEQDowg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1765807124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=7apR0jdlQh68JBNJS0Kzie+uOx07+3csdNlfXBvqoM4=;
	b=eTDkUX8hciBrw+YgJ6uMydTou8BWyCUrGqkCMQUM9QI2uwVtqtvbbZXV1dK6Hw9OWNhJiy
	XYh5EqMsq2yE+UsWUWssJJWev8XImR7tblXBzskwo4vA7BKTw8bGezQmqxzToP47q7oe5O
	LcKNcy9qZz7X6/YcdkuLjTMBf/7zpxMxj4my6KPQqqEXvq5pH9pif+4o1ojT+1nVtessyU
	clATMFE1Qph65r5GxHF4sqNwLnRfEcSRcd4Th3sCS2DougpbuvbHVFNAPgjLnvGpGVhFqn
	zilA7nV1jaYomYCVIwcIOJ1fmGaFUDjoe39pwAG0KD+PElKkwYJlmJsmVmb7Dw==
ARC-Authentication-Results: i=1;
	rspamd-6ccd5b4cc5-7gv7b;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Stop-Decisive: 64ea8f0331194735_1765807125175_3980996007
X-MC-Loop-Signature: 1765807125175:4184771881
X-MC-Ingress-Time: 1765807125175
Received: from fr-int-smtpout12.hostinger.io (fr-int-smtpout12.hostinger.io
 [148.222.54.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.108.113.51 (trex/7.1.3);
	Mon, 15 Dec 2025 13:58:45 +0000
Received: from [IPV6:2001:861:4450:d360:6864:9326:2fe9:fe2] (unknown [IPv6:2001:861:4450:d360:6864:9326:2fe9:fe2])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dVM9F1vjhz1xrB;
	Mon, 15 Dec 2025 13:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1765807122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7apR0jdlQh68JBNJS0Kzie+uOx07+3csdNlfXBvqoM4=;
	b=CGMaqbMDJcq8MFuPxwaVG13FlF54jhY7ek8mzWB07NRJ3rIq9vppnBBesUwa1Ea73rIz0q
	OdIW/ma4P9dv1EGxfVq0gT4mSLXAJGnA4eG8wuPKc1Lgt036nDkPVFOFAR746SPtoHfXrh
	71FUq2VuyHtXRxWnNe7FPztogzDU9eNeZZ0UAsg8Xn3RlhgQbSQL5MtLy5wn1cuCj0mwJR
	nm+06P2x1FOmfx6dYRNQI1DIgGn/21zx3u5y6YpW1BxPXiP0E3/+0+pFrIFvnbrIyT87dD
	tttIkLNY7z7LFhV0OWcla25X0XxgWttDC9AUr96ZeIWSdJ8sIrj48TqhsfZqlA==
Message-ID: <bf815359-4b6e-4243-8a7a-6b00e259f4f6@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Binbin Zhou <zhoubinbin@loongson.cn>, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add MMC support on BPI-F3 and
 OrangePi RV2
To: Yao Zi <me@ziyao.cc>
References: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
 <20251215-k1-boards-add-mmc-v1-2-d68dc87d4aab@rootcommit.com>
 <aUADG5c8r0GEN6iP@pie>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <aUADG5c8r0GEN6iP@pie>
Date: Mon, 15 Dec 2025 13:58:41 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=NuiDcNdJ c=1 sm=1 tr=0 ts=69401412 a=w3a6Hyo9sJ87gWsMspevqA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=asDJCzfm3GB8K8yUXNsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=MtV9mxeqUzM0PhnktY_2:22 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfHAxxhTFOsmXJazwYlkMl2VvC/NWIAnTz3QIjkn94KcQIsuoDXEI1/5C8Fx8hqz+sa4T4w7JJCrmTGqJmAq2epTIbF4h3geq/jO6N9x4gyqguRfjJgI0 /x1UhAcMjHVc+X2NaTuAC7p3IBftvhkQJYm+QELrNA09wW5Ms1Hx2qcEZH/PrrW7rz7QjwTXvqchwBmsDYdMW+71znxkuEVLw3badFrDHkBd7zHVLBX5tFTz nvOkEUY6zk588u35eliyaM+AGZIWeGBivbFxUYwkKGoD+W62gboEIql+v7sSQIHNbYcTjQrFmIy4549P1wAQVKNebYQFHs6PjS5yNep1JnQgJ36cMG4PHyjt nuFKAoz+o3TncRbLoJXMQbhFFto/Y2/S8EUhC9LIukwBAhAbpeAmlXViWFG1x7gznM3EJUUH2Ew94t3enN8cXK9QR0KNHAFpvbaaNTNoK1bgqND8g53cVHrZ XK02uvzTk/k7aRAvryMHeIlj6lV19F0D0DOHttizZaSzizNhweN4S5eezTA=
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_055847_293899_2CF71530 
X-CRM114-Status: GOOD (  13.37  )
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

SGkgWWFvCgpUaGFua3MgYSBsb3QgZm9yIHRoZSByZXZpZXchCgpPbiAxMi8xNS8yNSAxMzo0Niwg
WWFvIFppIHdyb3RlOgo+IE9uIE1vbiwgRGVjIDE1LCAyMDI1IGF0IDEwOjEwOjE0QU0gKzAwMDAs
IE1pY2hhZWwgT3BkZW5hY2tlciB3cm90ZToKPj4gVGhpcyBpbnRyb2R1Y2VzIGEgbmV3IHNkaGNp
MCBub2RlIGFuZCBlbmFibGVzIGl0Cj4+IGZvciB0aGUgQmFuYW5hUEkgRjMgYW5kIE9yYW5nZVBp
IFJWMiBib2FyZHMuCj4+Cj4+IE5vdGUgdGhhdCBjYXJkIGRldGVjdCBpcyBtYXJrZWQgYXMgYnJv
a2VuIGluIHRoZSBkcml2ZXIKPj4gKFNESENJX1FVSVJLX0JST0tFTl9DQVJEX0RFVEVDVElPTiBx
dWlyayksIHRoZXJlZm9yZSByZW1vdmluZyB0aGUgY2FyZAo+PiB3aGlsZSB0aGUgc3lzdGVtIGlz
IHJ1bm5pbmcgd29uJ3QgaGF2ZSBhbnkgZWZmZWN0Lgo+IFRoaXMgZGVzY3JpcHRpb24gbG9va3Mg
c3VzcGljaW91czogU0RIQ0lfUVVJUktfQlJPS0VOX0NBUkRfREVURUNUSU9OCj4gZG9lc24ndCBi
cmVhayBob3RwbHVnLiBJdCBvbmx5IGluZm9ybXMgc2RoY2kgY29yZSB0byBhY3RpdmVseSBwb2xs
IGZvcgo+IGNhcmQgc3RhdHVzLCBpbnN0ZWFkIG9mIHJlbHlpbmcgb24gaW50ZXJydXB0cyBmb3Ig
c3RhdHVzIGNoYW5nZS4KCkkgbXVzdCBoYXZlIG1pc2ludGVycHJldGVkIHRoZSBjb2RlLsKgIEkg
bW9kaWZpZWQgdGhlIGRlc2NyaXB0aW9uIHRvIGp1c3QgCm1lbnRpb24KdGhhdCBjYXJkIGRldGVj
dGlvbiBjdXJyZW50bHkgZG9lc24ndCB3b3JrIHdpdGggdGhlc2UgY2hhbmdlcy4KCj4KPiAuLi4K
Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS5kdHNpIGIv
YXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS5kdHNpCj4+IGluZGV4IDc4MThjYTQ5Nzli
Ni4uYTViN2Q3YzhjMDY2IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNl
bWl0L2sxLmR0c2kKPj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS5kdHNp
Cj4+IEBAIC05ODcsNiArOTg3LDE2IEBAIGVtbWM6IG1tY0BkNDI4MTAwMCB7Cj4+ICAgCQkJCWlu
dGVycnVwdHMgPSA8MTAxPjsKPj4gICAJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPj4gICAJCQl9
Owo+PiArCj4+ICsJCQlzZGhjaTA6IG1tY0BkNDI4MDAwMCB7Cj4+ICsJCQkJY29tcGF0aWJsZSA9
ICJzcGFjZW1pdCxrMS1zZGhjaSI7Cj4+ICsJCQkJcmVnID0gPDB4MCAweGQ0MjgwMDAwIDB4MCAw
eDIwMD47Cj4+ICsJCQkJY2xvY2tzID0gPCZzeXNjb25fYXBtdSBDTEtfU0RIX0FYST4sCj4+ICsJ
CQkJCSA8JnN5c2Nvbl9hcG11IENMS19TREgwPjsKPj4gKwkJCQljbG9jay1uYW1lcyA9ICJjb3Jl
IiwgImlvIjsKPj4gKwkJCQlpbnRlcnJ1cHRzID0gPDk5PjsKPj4gKwkJCQlzdGF0dXMgPSAiZGlz
YWJsZWQiOwo+PiArCQkJfTsKPiBUaGlzIG5vZGUgc2hvdWxkIGJlIHByb2JhYmx5IHB1dCBiZWZv
cmUgdGhlIGVtbWMgbm9kZSwgc2luY2UgaXQgY29tZXMKPiB3aXRoIGxvd2VyIGFkZHJlc3MuCgpP
b3BzLCBjb3JyZWN0IGluIG15IGJyYW5jaC4gVGhhbmtzIQpDaGVlcnMKTWljaGFlbC4KCi0tIApN
aWNoYWVsIE9wZGVuYWNrZXIKUm9vdCBDb21taXQKWW9jdG8gUHJvamVjdCBhbmQgT3BlbkVtYmVk
ZGVkIFRyYWluaW5nIGNvdXJzZSAtIExlYXJuIGJ5IGRvaW5nOgpodHRwczovL3Jvb3Rjb21taXQu
Y29tL3RyYWluaW5nL3lvY3RvLwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
