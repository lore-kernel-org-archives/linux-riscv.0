Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F414CD8C92
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 15:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PWRBn3HynwWaEcrYxS7EKcUydlK6Ez6Y7vTOgbH18qM=; b=JOLLyedWruKCqI
	qqM8hxHhvkT0stUbvUcjlDtSiT1E4ut9nuFJtfhIzeVjIL7+3et4NqdAB1ZXcGBCpo4+hK7YhtXq1
	tG1x145hJb+Ry+upEoOElINeuThA5oh4m2wfus1Auh2w68oEwB648pkq4eFrKym3NqsrMA8WpoXQP
	vONuY5uUgrkTpDINx2spUv57SEvJq1EemLZ+VDx7Mk4SRNHDgnhWM+oxJbbhjHRdiu4jY/oyRmBMs
	mHzvpFXirM/c6Feg3+UqQP+7bzFcR4sBziiM2Bv0LroO2ICHEi2OmY0wtvUoiRDkxgG9nCBPGIvhn
	40hfD6xTbtvVfrnQkgrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcN3-0000000411q-3aiv;
	Mon, 08 Jun 2026 15:58:37 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcN1-0000000411E-26hh
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 15:58:37 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-45eea68dd6fso2311699f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jun 2026 08:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=siderolabs.com; s=google; t=1780934313; x=1781539113; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hiaq02sgTN+eg9Ui+NZIWW5xOwd5YS8q5QwBFbVzNCM=;
        b=XLBzE1MhzWMF7JtCdUOIkOR3WD+q/+gCiyjWQkKy0kVZ/OVGgpBdABNOAhaNriTzgP
         SQMHclHfNN90TrcTs58LTOONrY5Xhu+ohx0o2YhyqFMuf1IUvu0BKXxVb/nAGL5fLeEV
         hKyXZ8XRUYCSbNEf4x8ij48kEAcHigdmf3JJXYUqFmkYv7Dy0VHWGOGfqRxi1+JcoDuS
         677gIdYPeDTQyMfNmWtmo+6tT+RKnd1xZBAaoYUcWIC6AAG7ZA8vsPrNpkiJ0Im3AmC5
         QQJ+DSKnWl4ex1qCNGaJfqdqaTIQhtw/7MpOcmtQIv1xE26sin+cfTkmeQqEQcnb+m19
         T+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780934313; x=1781539113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hiaq02sgTN+eg9Ui+NZIWW5xOwd5YS8q5QwBFbVzNCM=;
        b=WOZtI9+a5dqAo+NGXZ+YSbgeFJoINqa9LNBN3Jux5VL0C0sHHKCJWlJxXLpvLp5koA
         /RM6aVrgOqPz++f7JsERYIA/gTrv0O7ZkGP/0nr4OyQmhfa7rEuynmsTmHvEzi+m5Wjf
         fnj0Dbje+TDyAgOC5SEygbyQh4Zu2d+StRYCyL272/ZaEPQnvGGkcr0l0u5vRSJAjQaO
         pYMYWIaUtgqqFk7lFvHoubiU4FEgGzTJ9a56/HCDwS4Cl+qUm9i5lVOOtt6cLM65JrOU
         Wa8fc32RMkyE2DQIYyYdFzov/AOVm6qascuhnPYK93OHSS47e9SNOG+qh9tTaGrnyTMy
         fSPQ==
X-Forwarded-Encrypted: i=1; AFNElJ/AL2VfIwHm7i2MdoRbTgr9LeDP9N83rHfEHPXHVbVNVlpbrw2WGf/wiAu4E5hiY+iWHdLfdNSCvAYQuA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFg3dFaVO4RzYJZvE09qfvJ+M/BvqfGpv7yxA0y8NCEgKKsm+x
	FSrAy3Hw5H3Mk4DqlZf/STGNm5LuwyyT+HAF/wiJRUSBABsoQrx4r9REBhqSQf2wvkk=
X-Gm-Gg: Acq92OFDuYwPJPd1cjE3L45ayPVH+0eXdgcsSZg0ALxtsktd0iGHXt7AkbuJWFrqjxG
	YtdHNJ8lNcHwWuaQr4GRFpO2DyBunlsR+cX7glcR72EaGU67bx4N3TTEMsgRmmH6uknJxYinEXz
	rH9A2UbvrDzdzeS7E/5nrGaK9T78GyjEXr5bHDeDRqjeo8s/X7xJgFACjHJtu1JU0ZbkAOHbDPh
	uzQmtPpsqMgkCHVPxrpiBDmvfg62re+P2ei99cuOP6izqQV4x8ERfZkwo7ZW31/CeITzmg9u9KM
	qoIBe8rJpVINwGnsuOTrLEJ1LIA4mSZulCxHKZRjvdA4HVoMpzGNOs5GQEnb83x7mtW0vW4IPWD
	4OaQnxJLz9wya5dWnD306Y1zGJJ4wBm2mmNjU8488TjIhb8i19N8n6ZL6xymo1GA96P0F+6kovY
	B5TkUTAClG4j3ihmbTLC2nTk5l2hoOekm4nczPnbJOk+TSwHM=
X-Received: by 2002:a05:600c:3153:b0:490:b8c0:d46a with SMTP id 5b1f17b1804b1-490c2604790mr273388415e9.22.1780934312914;
        Mon, 08 Jun 2026 08:58:32 -0700 (PDT)
Received: from smirabuild ([2a0b:6204:2bf7:46ff:214:5616:96d9:612])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cc140sm484355775e9.9.2026.06.08.08.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 08:58:32 -0700 (PDT)
From: Andrey Smirnov <andrey.smirnov@siderolabs.com>
To: pasha.tatashin@soleen.com,
	akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	syzbot+2b5fe617654be3d8848b@syzkaller.appspotmail.com,
	Andrey Smirnov <andrey.smirnov@siderolabs.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Andrei Vagin <avagin@gmail.com>,
	Andy Lutomirski <luto@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	stable@vger.kernel.org
Subject: [PATCH] mm/page_table_check: do not track special (PFN-mapped) PTEs
Date: Mon,  8 Jun 2026 19:57:58 +0400
Message-ID: <20260608155758.1220420-1-andrey.smirnov@siderolabs.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_085835_711201_0F481CCC 
X-CRM114-Status: GOOD (  16.86  )
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

VGhlIHZEU08gZGF0YSBzdG9yZSAoIlt2dmFyXSIpIHNwZWNpYWwgbWFwcGluZyBpcyBjcmVhdGVk
IGFzIGEgVk1fUEZOTUFQCm1hcHBpbmcgYW5kIGl0cyBwYWdlcyBhcmUgaW5zdGFsbGVkIGludG8g
dXNlcnNwYWNlIHdpdGggdm1mX2luc2VydF9wZm4oKSwKd2hpY2ggcHJvZHVjZXMgc3BlY2lhbCBQ
VEVzIChwdGVfc3BlY2lhbCgpKS4gT24geDg2IGFuZCBhcm02NCAoYW5kIHJpc2N2KQpwdGVfdXNl
cl9hY2Nlc3NpYmxlX3BhZ2UoKSBvbmx5IHRlc3RzIHRoZSBQUkVTRU5UL1VTRVIgYml0cyBhbmQg
ZG9lcyBub3QKZXhjbHVkZSBzcGVjaWFsIFBURXMsIHNvIHBhZ2VfdGFibGVfY2hlY2sgYWNjb3Vu
dHMgdGhlc2UgUEZOIG1hcHBpbmdzIGluCnRoZSBwZXItcGFnZSBhbm9uL2ZpbGUgbWFwIGNvdW50
ZXJzIGV2ZW4gdGhvdWdoIHRoZXkgYXJlIG5vdCBybWFwLW1hbmFnZWQKcGFnZXMgKHZtX25vcm1h
bF9wYWdlKCkgcmV0dXJucyBOVUxMIGZvciB0aGVtKS4KCk1vc3Qgb2YgdGhlc2UgZGF0YSBwYWdl
cyBsaXZlIGluIHRoZSBrZXJuZWwgaW1hZ2UgYW5kIGFyZSBuZXZlciBmcmVlZCwgc28KdGhlIHN0
cmF5IGFjY291bnRpbmcgaXMgaW52aXNpYmxlLiBUaGUgdGltZS1uYW1lc3BhY2UgVlZBUiBwYWdl
IGlzIHRoZQpleGNlcHRpb246IGl0IGlzIGEgcmVhbCBhbGxvY19wYWdlKCkgcGFnZSB0aGF0IGlz
IHJlbGVhc2VkIHdpdGgKX19mcmVlX3BhZ2UoKSBpbiBmcmVlX3RpbWVfbnMoKSB3aGVuIHRoZSBs
YXN0IHRhc2sgb2YgYSB0aW1lIG5hbWVzcGFjZQpleGl0cy4gQWNyb3NzIHRoZSBtYXAgLyB1bm1h
cCAvIHZkc29fam9pbl90aW1lbnMoKSB6YXAgdHJhbnNpdGlvbnMgdGhlCnNwZWNpYWwtUFRFIGFj
Y291bnRpbmcgaXMgbm90IGJhbGFuY2VkIGZvciB0aGlzIHBhZ2UsIHNvIGEgbm9uLXplcm8KZmls
ZV9tYXBfY291bnQgc3Vydml2ZXMgdG8gdGhlIGZyZWUgcGF0aCBhbmQgdHJpcHM6CgogIGtlcm5l
bCBCVUcgYXQgbW0vcGFnZV90YWJsZV9jaGVjay5jOjE0MyEKICBfX3BhZ2VfdGFibGVfY2hlY2tf
emVybysweGZiLzB4MTMwCiAgX19mcmVlX2Zyb3plbl9wYWdlcysweDUyZi8weDY1MAogIGZyZWVf
dGltZV9ucysweDg1LzB4YzAKICBmcmVlX25zcHJveHkrMHg3Zi8weDEzMAogIGRvX2V4aXQrMHgz
MTMvMHhhNjAKICBkb19ncm91cF9leGl0KzB4NzcvMHg5MAoKVGhpcyBpcyByZWxpYWJseSByZXBy
b2R1Y2libGUgb24geDg2XzY0IGFuZCBhcm02NCB1bmRlciBoZWF2eSBjb250YWluZXIvQ0kKY2h1
cm4gdGhhdCByYXBpZGx5IGNyZWF0ZXMgYW5kIGRlc3Ryb3lzIHRpbWUgbmFtZXNwYWNlcyAoQ0xP
TkVfTkVXVElNRSB2aWEKcnVuYyAvIGRvY2tlci1pbml0IC8gdGluaSksIGFuZCB3YXMgaW5kZXBl
bmRlbnRseSByZXBvcnRlZCBieSBzeXpib3Qgb24KcmlzY3YuIEl0IG9ubHkgbWFuaWZlc3RzIHdo
ZW4gQ09ORklHX1BBR0VfVEFCTEVfQ0hFQ0sgaXMgYWN0aXZlLgoKU3BlY2lhbCBQVEVzIGhhdmUg
bm8gc3RydWN0LXBhZ2Ugcm1hcCBzZW1hbnRpY3MgYW5kIG11c3QgbmV2ZXIgaGF2ZSBiZWVuCnRy
YWNrZWQgYnkgcGFnZSB0YWJsZSBjaGVjay4gU2tpcCB0aGVtIGluIGJvdGggdGhlIHNldCBhbmQg
Y2xlYXIgcGF0aHMgc28KdGhlIGNvdW50ZXJzIHN0YXkgYmFsYW5jZWQgKGFsd2F5cyB6ZXJvKSBm
b3IgUEZOLW1hcHBlZCBwYWdlcywgcmVnYXJkbGVzcwpvZiBob3cgdGhlIGFyY2hpdGVjdHVyZSBk
ZWZpbmVzIHB0ZV91c2VyX2FjY2Vzc2libGVfcGFnZSgpLiBwdGVfc3BlY2lhbCgpCmlzIGF2YWls
YWJsZSBnZW5lcmljYWxseSAoaXQgaXMgYSBuby1vcCByZXR1cm5pbmcgZmFsc2Ugb24gYXJjaGl0
ZWN0dXJlcwp3aXRob3V0IEFSQ0hfSEFTX1BURV9TUEVDSUFMKSwgc28gdGhpcyBpcyBhIHNpbmds
ZSwgYXJjaC1pbmRlcGVuZGVudCBmaXguCgpOb3RlIHRoYXQgdGhlIHY3LjAgZ2VuZXJpYyB2RFNP
IGRhdGFzdG9yZSByZXdvcmsgaW4gY29tbWl0IDA1OTg4ZGJhMTE3OQooInZkc28vZGF0YXN0b3Jl
OiBBbGxvY2F0ZSBkYXRhIHBhZ2VzIGR5bmFtaWNhbGx5IikgaW5jaWRlbnRhbGx5IGF2b2lkcwp0
aGUgcHJvYmxlbSBieSBzd2l0Y2hpbmcgdGhlIG1hcHBpbmcgdG8gVk1fTUlYRURNQVAgKyB2bWZf
aW5zZXJ0X3BhZ2UoKQp3aXRoIGJhbGFuY2VkIHN0cnVjdC1wYWdlIGFjY291bnRpbmcuIFRoaXMg
cGF0Y2ggZml4ZXMgdGhlIHN0aWxsLWFmZmVjdGVkClZNX1BGTk1BUCBwYXRoIHVzZWQgYnkgNi4x
OC55IGFuZCBlYXJsaWVyLCBhbmQgYWRkaXRpb25hbGx5IG1ha2VzCnBhZ2VfdGFibGVfY2hlY2sg
cm9idXN0IGFnYWluc3QgYW55IGZ1dHVyZSBQRk4tbWFwcGVkIHVzZXIgcGFnZXMuCgpGaXhlczog
ZGY0ZTgxN2I3MTA4ICgibW06IHBhZ2UgdGFibGUgY2hlY2siKQpDYzogVGhvbWFzIEdsZWl4bmVy
IDx0Z2x4QGxpbnV0cm9uaXguZGU+CkNjOiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNz
c2NodWhAbGludXRyb25peC5kZT4KQ2M6IEFuZHJlaSBWYWdpbiA8YXZhZ2luQGdtYWlsLmNvbT4K
Q2M6IEFuZHkgTHV0b21pcnNraSA8bHV0b0BrZXJuZWwub3JnPgpDYzogVmluY2Vuem8gRnJhc2Np
bm8gPHZpbmNlbnpvLmZyYXNjaW5vQGFybS5jb20+ClJlcG9ydGVkLWJ5OiBzeXpib3QrMmI1ZmU2
MTc2NTRiZTNkODg0OGJAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQpDbG9zZXM6IGh0dHBzOi8v
Z2l0aHViLmNvbS9zaWRlcm9sYWJzL3RhbG9zL2lzc3Vlcy8xMzQ5NgpDYzogc3RhYmxlQHZnZXIu
a2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgU21pcm5vdiA8YW5kcmV5LnNtaXJub3ZA
c2lkZXJvbGFicy5jb20+Ci0tLQogbW0vcGFnZV90YWJsZV9jaGVjay5jIHwgMTMgKysrKysrKysr
Ky0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvbW0vcGFnZV90YWJsZV9jaGVjay5jIGIvbW0vcGFnZV90YWJsZV9jaGVjay5j
CmluZGV4IDRlZWNhNzgyYjg4OC4uZWU0OTJkNTM4OWI5IDEwMDY0NAotLS0gYS9tbS9wYWdlX3Rh
YmxlX2NoZWNrLmMKKysrIGIvbW0vcGFnZV90YWJsZV9jaGVjay5jCkBAIC0xNTAsOSArMTUwLDE2
IEBAIHZvaWQgX19wYWdlX3RhYmxlX2NoZWNrX3B0ZV9jbGVhcihzdHJ1Y3QgbW1fc3RydWN0ICpt
bSwgcHRlX3QgcHRlKQogCWlmICgmaW5pdF9tbSA9PSBtbSkKIAkJcmV0dXJuOwogCi0JaWYgKHB0
ZV91c2VyX2FjY2Vzc2libGVfcGFnZShwdGUpKSB7CisJLyoKKwkgKiBQRk4tbWFwcGVkIChzcGVj
aWFsKSBQVEVzIC0gZS5nLiB0aGUgdkRTTy90aW1lLW5hbWVzcGFjZSAiW3Z2YXJdIgorCSAqIG1h
cHBpbmcgaW5zdGFsbGVkIHZpYSB2bWZfaW5zZXJ0X3BmbigpIC0gYXJlIG5vdCBybWFwLW1hbmFn
ZWQgYW5kCisJICogbXVzdCBub3QgYmUgdHJhY2tlZCBoZXJlLiBUcmFja2luZyB0aGVtIGNhbiBs
ZWF2ZSBhIG5vbi16ZXJvIG1hcAorCSAqIGNvdW50IG9uIGEgc3RydWN0IHBhZ2UgdGhhdCBpcyBs
YXRlciBmcmVlZCAodGhlIHRpbWUgbmFtZXNwYWNlIFZWQVIKKwkgKiBwYWdlIGluIGZyZWVfdGlt
ZV9ucygpKSwgdHJpcHBpbmcgdGhlIEJVR19PTigpIGluCisJICogX19wYWdlX3RhYmxlX2NoZWNr
X3plcm8oKS4KKwkgKi8KKwlpZiAocHRlX3VzZXJfYWNjZXNzaWJsZV9wYWdlKHB0ZSkgJiYgIXB0
ZV9zcGVjaWFsKHB0ZSkpCiAJCXBhZ2VfdGFibGVfY2hlY2tfY2xlYXIocHRlX3BmbihwdGUpLCBQ
QUdFX1NJWkUgPj4gUEFHRV9TSElGVCk7Ci0JfQogfQogRVhQT1JUX1NZTUJPTChfX3BhZ2VfdGFi
bGVfY2hlY2tfcHRlX2NsZWFyKTsKIApAQCAtMjA1LDcgKzIxMiw3IEBAIHZvaWQgX19wYWdlX3Rh
YmxlX2NoZWNrX3B0ZXNfc2V0KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCBwdGVfdCAqcHRlcCwgcHRl
X3QgcHRlLAogCiAJZm9yIChpID0gMDsgaSA8IG5yOyBpKyspCiAJCV9fcGFnZV90YWJsZV9jaGVj
a19wdGVfY2xlYXIobW0sIHB0ZXBfZ2V0KHB0ZXAgKyBpKSk7Ci0JaWYgKHB0ZV91c2VyX2FjY2Vz
c2libGVfcGFnZShwdGUpKQorCWlmIChwdGVfdXNlcl9hY2Nlc3NpYmxlX3BhZ2UocHRlKSAmJiAh
cHRlX3NwZWNpYWwocHRlKSkKIAkJcGFnZV90YWJsZV9jaGVja19zZXQocHRlX3BmbihwdGUpLCBu
ciwgcHRlX3dyaXRlKHB0ZSkpOwogfQogRVhQT1JUX1NZTUJPTChfX3BhZ2VfdGFibGVfY2hlY2tf
cHRlc19zZXQpOwotLSAKMi41My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
