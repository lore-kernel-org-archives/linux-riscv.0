Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A628C55ABA
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 02:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JINZEGqY9xWj2HHAjyZLm+kJHmpCI9lT52/jC/EBhRA=; b=z4Agce4nsGfTFO
	GpLVrqf2qeRo2TWQR8Ryc/JcxvEWklS1MUeovdkufdM+t4O9tqvG99/s04WrPZqDbQYEqPnEfrzg5
	p/SwEKXq4kWTEjzUMiZAjJ0mE/5zClbodaExrPb8qKa70fUyHWnRMUeKvgUYiAPbX+PQFFFY+Yxfc
	4agJS8Mv+YSKjOEVvLnl47Qek92pnlELE2DtFVEmj09hpqzLKHuWSlhQbi7PWc/goXKKK0HVgUisa
	amZ0gob0Nq7cZY1iK9SmzDjLbexzejKvQ+j4/58aRH+4d5gSlmWgsVq9sINnC7OEJUr1OWiIoDN3h
	RAXdTSU5QhU1q+Vp+Vcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wro5q-00000004pcc-1y8O;
	Thu, 06 Aug 2026 02:44:26 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wro5l-00000004pcH-46DV
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 02:44:25 +0000
X-UUID: b2eed532914011f1aa26b74ffac11d73-20260806
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:c371c1ee-ebea-4b17-b729-418e0d974607,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:b944984e5793b53cccfeaf2f5f05f109,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|136|865|898,TC:nil,Conte
	nt:0|15|52,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:ni
	l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b2eed532914011f1aa26b74ffac11d73-20260806
X-User: xiaopei01@kylinos.cn
Received: from [10.42.12.251] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1300538191; Thu, 06 Aug 2026 10:44:09 +0800
Message-ID: <89380ae2-0777-4518-9393-171aeae613a7@kylinos.cn>
Date: Thu, 6 Aug 2026 10:44:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] thermal: spacemit: k1: add shutdown action and reorder
 registration order
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, shuwei.wu@mailbox.org,
 rafael@kernel.org, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, dlan@kernel.org, daniel.lezcano@kernel.org
References: <1967d2bcc8fede6fbd25fc8eee07f2873fb41472.1784184867.git.xiaopei01@kylinos.cn>
 <DK4XSEPSTY3I.O9ZFCZ9BJGNW@linux.spacemit.com>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <DK4XSEPSTY3I.O9ZFCZ9BJGNW@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_194422_310229_000CA217 
X-CRM114-Status: UNSURE (   4.74  )
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

CgrlnKggMjAyNi83LzIyIDE1OjU0LCBUcm95IE1pdGNoZWxsIOWGmemBkzoKPiBPbiBUaHUgSnVs
IDE2LCAyMDI2IGF0IDEyOjA0IEFNIFBEVCwgUGVpIFhpYW8gd3JvdGU6Cj4+IEFkZCBhIGRldm0g
YWN0aW9uIHRvIGNsZWFuIGhhcmR3YXJlIGludGVycnVwdHMsIHNhbXBsaW5nLCBhbmQgY29udHJv
bAo+PiByZWdpc3RlcnMgb24gZHJpdmVyIHVuYmluZCwgbWlycm9yaW5nIHdoYXQgazFfdHNlbnNv
cl9pbml0KCkgc2V0cyB1cC4KPj4KPj4gUmVvcmRlciB0aGUgcmVnaXN0cmF0aW9uIG9yZGVyIHdp
dGhpbiBwcm9iZSgpOiByZWdpc3RlciB0aGUgdGhlcm1hbAo+PiB6b25lcyBmaXJzdCwgdGhlbiBy
ZXF1ZXN0IHRoZSBJUlEsIGFuZCByZWdpc3RlciB0aGUgc2h1dGRvd24gYWN0aW9uCj4+IGxhc3Qu
ICBPbiByZW1vdmFsLCB0aGUgaGFyZHdhcmUgaW50ZXJydXB0IGlzIGRpc2FibGVkIGZpcnN0LCB0
aGVuIHRoZQo+PiBJUlEgaXMgcmVsZWFzZWQsIGFuZCBmaW5hbGx5IHRoZSB0aGVybWFsIHpvbmVz
IGFyZSByZWxlYXNlZC4gIFRoaXMKPj4gYXZvaWRzIHRoZSBJUlEgdGhyZWFkIGFjY2Vzc2luZyBh
biBhbHJlYWR5IHVucmVnaXN0ZXJlZCB0aGVybWFsIHpvbmUKPj4gZHVyaW5nIGRldnJlcyBjbGVh
bnVwLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQZWkgWGlhbyA8eGlhb3BlaTAxQGt5bGlub3MuY24+
Cj4gUmV2aWV3ZWQtYnk6IFRyb3kgTWl0Y2hlbGwgPHRyb3kubWl0Y2hlbGxAbGludXguc3BhY2Vt
aXQuY29tPgpmcmllbmRseSBwaW5nLgpwcmV2ZW50IGJlaW5nIGZvcmdvdHRlbi4KClBlaS4KVGhh
bmtzIQo+IAo+IFRoYW5rcy4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
