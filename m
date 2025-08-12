Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D1BCA0EE4
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 17:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tjYlcqN4XlMdgwaGlObEm4FBnJqL3puZ6FnsBX7EQ8c=; b=Qmy1hdrVSC9hZr
	tZvhrZjzd1+F+73urBhfQ8ZFuwk4E/GZ38cpddFDNEAn0XVYBbSTvXh8yhbr5DFnWP5n9VkpxUccl
	ou8BMGmttQuTv+YfonP/hOiPm3MIy9Spv1OJSeXGbjLHAR6/1jb8Bxy7wpxFQVRtjGM1qOJGA7BZl
	AgtFYoq4Ek/yWet/iU0Uo6epwAoCXUYCGvRS0RdHHK/qVgm4sBHroww6tWuM5b7CuaRjVo0MyiUB/
	9Tr1AyPr/494xQC8157DvLjNXijHP93fiq7VQJvjWsRyhp7QU0bGHPsZqhkb9Yc7JqrP2QsziEzu6
	tfCsMYTsLfkI549ZC8EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulsq1-0000000BZLc-35Eb;
	Tue, 12 Aug 2025 17:31:05 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulnJj-0000000AcRm-16bD
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 11:37:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4911841C06;
	Tue, 12 Aug 2025 11:37:16 +0000 (UTC)
Message-ID: <1fdaa939-d26c-454a-a722-7d0a590557b7@ghiti.fr>
Date: Tue, 12 Aug 2025 13:37:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] riscv, bpf: fix reads of thread_info.cpu
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Pu Lehui <pulehui@huawei.com>,
 Puranjay Mohan <puranjay@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250812090256.757273-2-rkrcmar@ventanamicro.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250812090256.757273-2-rkrcmar@ventanamicro.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeehvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeejieeuudejieekveeutdeguefhkeduledugeevhefffeejudeggedufffgleeugfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemjedtudgumeekugguugemsgekrgdtmedvjehfsgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemjedtudgumeekugguugemsgekrgdtmedvjehfsgdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemjedtudgumeekugguugemsgekrgdtmedvjehfsggnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepvdefpdhrtghpthhtoheprhhkrhgtmhgrrhesvhgvnhhtrghnrghmihgtrhhordgtohhmpdhrtghpthhtohepsghpfhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhop
 egrshhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhesihhoghgvrghrsghogidrnhgvthdprhgtphhtthhopegrnhgurhhiiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhtihhnrdhlrghusehlihhnuhigrdguvghvpdhrtghpthhtohepvgguugihiiekjeesghhmrghilhdrtghomhdprhgtphhtthhopehsohhngheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_043723_456277_D99B37AC 
X-CRM114-Status: GOOD (  13.15  )
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

SGkgUmFkaW0sCgpPbiA4LzEyLzI1IDExOjAyLCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4gSGVs
bG8sCj4KPiBUaGVzZSBwYXRjaGVzIGFyZSByZWxhdGVkIHRvIGEgcmVjZW50bHkgcXVldWVkIHNl
cmllcyBbMV0gdGhhdCBmaXhlcyB0aGUKPiBzYW1lIGJ1Z3MgaW4gbm9ybWFsIGNvZGUuICBUaGF0
IHNlcmllcyBmaW5pc2hlcyB3aXRoIGEgcGF0Y2ggdGhhdCB3b3VsZAo+IGhhdmUgZXhwb3NlZCB0
aGUgQlBGIGJ1Z3MsIGJ1dCBsdWNraWx5IGl0IHdvbid0IGdldCBtZXJnZWQgdW50aWwgdjYuMTgu
Cj4KPiBJIGRvbid0IGtub3cgZW5vdWdoIGFib3V0IEJQRiB0byB2ZXJpZnkgdGhhdCBpdCBlbWl0
cyB0aGUgY29ycmVjdCBjb2RlCj4gbm93LCBzbyBhbnkgcG9pbnRlcnMgYXJlIHdlbGNvbWUuCj4K
PiAxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI1MDcyNTE2NTQxMC4y
ODk2NjQxLTMtcmtyY21hckB2ZW50YW5hbWljcm8uY29tLwo+Cj4gUmFkaW0gS3LEjW3DocWZICgy
KToKPiAgICByaXNjdiwgYnBmOiB1c2UgbHcgd2hlbiByZWFkaW5nIGludCBjcHUgaW4gQlBGX01P
VjY0X1BFUkNQVV9SRUcKPiAgICByaXNjdiwgYnBmOiB1c2UgbHcgd2hlbiByZWFkaW5nIGludCBj
cHUgaW4gYnBmX2dldF9zbXBfcHJvY2Vzc29yX2lkCj4KPiAgIGFyY2gvcmlzY3YvbmV0L2JwZl9q
aXRfY29tcDY0LmMgfCA0ICsrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4KCkJvdGggcGF0Y2hlcyBsb29rIGdvb2Qgc286CgpSZXZpZXdlZC1i
eTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgoKU2luY2UgdGhpcyBv
bmx5IHRvdWNoZXMgcmlzY3YgYW5kIEkgaGF2ZSBhIGJ1bmNoIG9mIGZpeGVzIHBlbmRpbmcsIEkg
CnByb3Bvc2UgdG8gdGFrZSB0aG9zZSBwYXRjaGVzIHRocm91Z2ggdGhlIHJpc2N2IHRyZWUsIEkn
bGwganVzdCB3YWl0IGZvciAKQmrDtnJuIHRvIGNvbmZpcm0gaXQgaXMgY29ycmVjdC4KCkBSYWRp
bTogVGhpcyBpcyB0aGUgdGhpcmQgc2ltaWxhciBidWcsIGRpZCB5b3UgY2hlY2sgYWxsIGFzc2Vt
Ymx5IGNvZGUgCihhbmQgYnBmKSB0byBtYWtlIHN1cmUgd2UgZG9uJ3QgaGF2ZSBhbnltb3JlIGxl
ZnQgb3Igc2hvdWxkIEk/CgpUaGFua3MsCgpBbGV4CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
