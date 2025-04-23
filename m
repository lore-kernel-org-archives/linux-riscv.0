Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821BCC369D3
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 09:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PCOa//USgRs/VcnQTiT78vBxeZ/dL7EAa3XnRMvD5QA=; b=wrkL8/WDDnQEUU
	rZUtO8Y8ztug3mkwLl96Ej0g2ZL5dfOpwqiCUyfrhcxMhsA78Pk7M79SikSrBHGI7vdVmKGYP/tPu
	UAHYObpcgnktjNq4sS1cwwcacqFSvpa77wdr2WnMm03ySeeiq6qd5Bpa18oda4iv6WPV7fRA4ClUZ
	pZYBUYixdvCrr2dZRo7F81f6px39xHBa38QN9ph4CujXAjo27o8IB0n0DASjjTS7ZjeR9kBC1qRal
	pXt7FVWXQUfEFogS3LkmHmW4nauQEIc9VWo1P8N+M5W3Q4eXduU1vqCAwYZ75y7s7TbzRLWQJB4GL
	mLMynuSB7GyZEh2Oj+wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7W2T-00000009rs0-0b8y;
	Wed, 23 Apr 2025 09:05:05 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7VEi-00000009ecC-01Ey
	for linux-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 08:13:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E093443A3;
	Wed, 23 Apr 2025 08:13:33 +0000 (UTC)
Message-ID: <4f65d7be-37d2-4646-bfb0-34b78047d4db@ghiti.fr>
Date: Wed, 23 Apr 2025 10:13:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/12] kernel: ftrace: export ftrace_sync_ipi
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Andy Chiu <andybnac@gmail.com>,
 linux-riscv@lists.infradead.org, alexghiti@rivosinc.com, palmer@dabbelt.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, bjorn@rivosinc.com,
 puranjay12@gmail.com, paul.walmsley@sifive.com, greentime.hu@sifive.com,
 nick.hu@sifive.com, nylon.chen@sifive.com, eric.lin@sifive.com,
 vicent.chen@sifive.com, zong.li@sifive.com, yongxuan.wang@sifive.com,
 samuel.holland@sifive.com, olivia.chu@sifive.com, c2232430@gmail.com
References: <20250407180838.42877-4-andybnac@gmail.com>
 <202504090657.5fiH4UIS-lkp@intel.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <202504090657.5fiH4UIS-lkp@intel.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeitdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeehtdefffefffdvffejkeduteduheejfeejteelleelveegtefhfedufeeuhfetudenucffohhmrghinhepghhithdqshgtmhdrtghomhdpghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghdptddurdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemtgeludgrmegtkeehvgemtgduuddtmeekuggvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemtgeludgrmegtkeehvgemtgduuddtmeekuggvvddphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemtgeludgrmegtkeehvgemtgduuddtmeekuggvvdgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepvdefpdhrtghpthhtoheplhhkphesihhnthgvlhdrtghomhdprhgtphhtthhopegrnhguhigsnhgrt
 gesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghlvgigghhhihhtihesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtohepohgvqdhksghuihhlugdqrghllheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhtrhgrtggvqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_011340_175869_5F45B998 
X-CRM114-Status: GOOD (  16.94  )
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

SGkgQW5keSwKCk9uIDA5LzA0LzIwMjUgMDA6MzEsIGtlcm5lbCB0ZXN0IHJvYm90IHdyb3RlOgo+
IEhpIEFuZHksCj4KPiBrZXJuZWwgdGVzdCByb2JvdCBub3RpY2VkIHRoZSBmb2xsb3dpbmcgYnVp
bGQgd2FybmluZ3M6Cj4KPiBbYXV0byBidWlsZCB0ZXN0IFdBUk5JTkcgb24gbGludXMvbWFzdGVy
XQo+IFthbHNvIGJ1aWxkIHRlc3QgV0FSTklORyBvbiB2Ni4xNS1yYzEgbmV4dC0yMDI1MDQwOF0K
PiBbY2Fubm90IGFwcGx5IHRvIHRyYWNlL2Zvci1uZXh0XQo+IFtJZiB5b3VyIHBhdGNoIGlzIGFw
cGxpZWQgdG8gdGhlIHdyb25nIGdpdCB0cmVlLCBraW5kbHkgZHJvcCB1cyBhIG5vdGUuCj4gQW5k
IHdoZW4gc3VibWl0dGluZyBwYXRjaCwgd2Ugc3VnZ2VzdCB0byB1c2UgJy0tYmFzZScgYXMgZG9j
dW1lbnRlZCBpbgo+IGh0dHBzOi8vZ2l0LXNjbS5jb20vZG9jcy9naXQtZm9ybWF0LXBhdGNoI19i
YXNlX3RyZWVfaW5mb3JtYXRpb25dCj4KPiB1cmw6ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRl
bC1sYWItbGtwL2xpbnV4L2NvbW1pdHMvQW5keS1DaGl1L3Jpc2N2LWZ0cmFjZS1mYWN0b3Itb3V0
LWNvZGUtZGVmaW5lZC1ieS1XSVRIX0FSRy8yMDI1MDQwOC0wMjUxMTQKPiBiYXNlOiAgIGxpbnVz
L21hc3Rlcgo+IHBhdGNoIGxpbms6ICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA0
MDcxODA4MzguNDI4NzctNC1hbmR5Ym5hYyU0MGdtYWlsLmNvbQo+IHBhdGNoIHN1YmplY3Q6IFtQ
QVRDSCB2NCAwNC8xMl0ga2VybmVsOiBmdHJhY2U6IGV4cG9ydCBmdHJhY2Vfc3luY19pcGkKPiBj
b25maWc6IHh0ZW5zYS1yYW5kY29uZmlnLTAwMS0yMDI1MDQwOSAoaHR0cHM6Ly9kb3dubG9hZC4w
MS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjUwNDA5LzIwMjUwNDA5MDY1Ny41ZmlINFVJUy1sa3BA
aW50ZWwuY29tL2NvbmZpZykKPiBjb21waWxlcjogeHRlbnNhLWxpbnV4LWdjYyAoR0NDKSAxMS41
LjAKPiByZXByb2R1Y2UgKHRoaXMgaXMgYSBXPTEgYnVpbGQpOiAoaHR0cHM6Ly9kb3dubG9hZC4w
MS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjUwNDA5LzIwMjUwNDA5MDY1Ny41ZmlINFVJUy1sa3BA
aW50ZWwuY29tL3JlcHJvZHVjZSkKPgo+IElmIHlvdSBmaXggdGhlIGlzc3VlIGluIGEgc2VwYXJh
dGUgcGF0Y2gvY29tbWl0IChpLmUuIG5vdCBqdXN0IGEgbmV3IHZlcnNpb24gb2YKPiB0aGUgc2Ft
ZSBwYXRjaC9jb21taXQpLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWdzCj4gfCBSZXBvcnRlZC1i
eToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gfCBDbG9zZXM6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyNTA0MDkwNjU3LjVmaUg0VUlTLWxrcEBp
bnRlbC5jb20vCj4KPiBBbGwgd2FybmluZ3MgKG5ldyBvbmVzIHByZWZpeGVkIGJ5ID4+KToKPgo+
Pj4ga2VybmVsL3RyYWNlL2Z0cmFjZS5jOjE5MTo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90
b3R5cGUgZm9yICdmdHJhY2Vfc3luY19pcGknIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgICAg
ICAxOTEgfCB2b2lkIGZ0cmFjZV9zeW5jX2lwaSh2b2lkICpkYXRhKQo+ICAgICAgICAgICB8ICAg
ICAgXn5+fn5+fn5+fn5+fn5+Cj4KPgo+IHZpbSArL2Z0cmFjZV9zeW5jX2lwaSArMTkxIGtlcm5l
bC90cmFjZS9mdHJhY2UuYwo+Cj4gICAgIDE5MAkKPiAgID4gMTkxCXZvaWQgZnRyYWNlX3N5bmNf
aXBpKHZvaWQgKmRhdGEpCj4gICAgIDE5Mgl7Cj4gICAgIDE5MwkJLyogUHJvYmFibHkgbm90IG5l
ZWRlZCwgYnV0IGRvIGl0IGFueXdheSAqLwo+ICAgICAxOTQJCXNtcF9ybWIoKTsKPiAgICAgMTk1
CX0KPiAgICAgMTk2CQo+CgpJIGZpeGVkIHRoaXMgd2l0aCB0aGUgZm9sbG93aW5nIHRoYXQgSSBz
cXVhc2hlZCBpbnRvIHlvdXIgcGF0Y2gsIG5vIG5lZWQgCnRvIHJlc2VuZCBhIG5ldyBzZXJpZXMg
Zm9yIHRoaXMuCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9mdHJhY2UuaCBiL2luY2x1ZGUv
bGludXgvZnRyYWNlLmgKaW5kZXggMGQ0ZWVjNTc0NzA3NC4uMzAzNzQ0NzhjYjA3NyAxMDA2NDQK
LS0tIGEvaW5jbHVkZS9saW51eC9mdHJhY2UuaAorKysgYi9pbmNsdWRlL2xpbnV4L2Z0cmFjZS5o
CkBAIC02MzUsNiArNjM1LDggQEAgZW51bSB7CiDCoCNkZWZpbmUgZnRyYWNlX2dldF9zeW1hZGRy
KGZlbnRyeV9pcCkgKDApCiDCoCNlbmRpZgoKK3ZvaWQgZnRyYWNlX3N5bmNfaXBpKHZvaWQgKmRh
dGEpOworCiDCoCNpZmRlZiBDT05GSUdfRFlOQU1JQ19GVFJBQ0UKCiDCoHZvaWQgZnRyYWNlX2Fy
Y2hfY29kZV9tb2RpZnlfcHJlcGFyZSh2b2lkKTsKQEAgLTgwNyw3ICs4MDksNiBAQCBleHRlcm4g
dm9pZCBmdHJhY2VfY2FsbCh2b2lkKTsKIMKgZXh0ZXJuIHZvaWQgZnRyYWNlX3JlZ3NfY2FsbCh2
b2lkKTsKIMKgZXh0ZXJuIHZvaWQgbWNvdW50X2NhbGwodm9pZCk7Cgotdm9pZCBmdHJhY2Vfc3lu
Y19pcGkodm9pZCAqZGF0YSk7CiDCoHZvaWQgZnRyYWNlX21vZGlmeV9hbGxfY29kZShpbnQgY29t
bWFuZCk7CgogwqAjaWZuZGVmIEZUUkFDRV9BRERSCgoKVGhhbmtzLAoKQWxleAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
