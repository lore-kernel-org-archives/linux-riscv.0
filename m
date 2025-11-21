Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1719FCFA749
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 08:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:Message-Id:Mime-Version:Subject:Cc
	:To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=byE48Ep4hZS1e79/4niE4I4oMJSO+nhGC+nRXtvOV9I=; b=vblKnpKdx3vYjf
	DY/AP+3JPgBhuLVn7DwoNTw6pfgY7YK4KFE9d/lQLrWheGaewxpLlHm0XQBpVEgckzS7FTOeUNpr0
	tsY4M8qfaTx7KWGzDp0tq09svHC+ZfWqYfOqDCDnfYsdZiXvLLY/KImxLBboy/a9QiZO0sI61o2px
	2eu5BBlhfB2z1jqCpyvN8Wp9ltRCxuuU55IGrfFTH0h/2p1lIzIQSA+ODrzr562WUTirI2xKRKqrA
	aok7fRtGlecw3gsO3nu94vkOUKEHDhldxvUSaIpdsbcPkS+bAAwmpZ35SlQjUa84BVoDmWvkEwUSa
	WUP3yoi6zxUdvUkIc4+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMTT-0000000842s-2ONI;
	Fri, 21 Nov 2025 08:26:35 +0000
Received: from sg-1-100.ptr.blmpb.com ([118.26.132.100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMTQ-0000000841C-0dim
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 08:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1763713582; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=eJ+FzEufrvbHpOroaZ2V6g/NkWBVb9p6/GlSGX5who4=;
 b=PeFSzCGDA+NKze4ebHCvIJHhw8qQHa2mc06mQ7cdW04q4P+KxdIvvISbmrEIPZ1g+w8xfA
 x3Kaw1fSFIWxqDUbL+Ref8TqbRrX4iA0iQVry79wTy+GRKcTshyIZWPXf6/gS1+/rGfPkR
 PufKNJi71vkb94vjl/fTUwO7OVogzzY6KP7cPvLNWBFFc6iIYcRGq2O62rvAiG2yHa6oNn
 I+iw99BLWWJZzfmV5HcsD9XWiQAE9MVgefqLYEpVbfgyzpGJLr0ribE0Jxsz/Zn2p1c5HH
 JuTYRmK6VEi/fUPQdYMdqJzrAOPta/Ayq9EpJ6oOoox+t0n1PetoLY2FcpgGnw==
Date: Fri, 21 Nov 2025 16:26:19 +0800
To: <cleger@rivosinc.com>
Cc: "Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"Himanshu Chauhan" <hchauhan@ventanamicro.com>, 
	"Anup Patel" <apatel@ventanamicro.com>, 
	=?utf-8?q?=E8=B7=AF=E6=97=AD?= <luxu.kernel@bytedance.com>, 
	"Atish Patra" <atishp@atishpatra.org>, 
	=?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
	=?utf-8?q?=E5=B4=94=E8=BF=90=E8=BE=89?= <cuiyunhui@bytedance.com>, 
	=?utf-8?q?=E5=85=83=E7=AB=B9?= <yuanzhu@bytedance.com>
Subject: SSE May Corrupt KVM's Context
Mime-Version: 1.0
X-Lms-Return-Path: <lba+16920222c+946b48+lists.infradead.org+zhangzhanpeng.jasper@bytedance.com>
Message-Id: <00786ddb6d626442879072851d455bbd8ef1181d.e1f179e9.b8a1.463b.998f.98948268e9ea@bytedance.com>
From: "Zhanpeng Zhang" <zhangzhanpeng.jasper@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_002632_550278_55C05161 
X-CRM114-Status: UNSURE (   4.21  )
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

SGkgQ2zDqW1lbnQswqAKCkkgZW5jb3VudGVyZWQgYW5vdGhlciBTU0UgcHJvYmxlbSByZWNlbnRs
eS4gSG9zdCBTU0UgZXZlbnRzIG1heSBhZmZlY3QgdGhlIGd1ZXN0LiBOZWl0aGVyIFBNVS1TQkkt
U1NFIG9yIEtWTS1TU0UgaXMgZW5hYmxlZC4gSnVzdCB1c2luZyB0aGUgc2ltcGxlc3QgcmlzY3Zf
c3NlX3Rlc3QgdG8gdHJpZ2dlciBlY2FsbCBTU0UsIGFuZCBpdCB3aWxsIGFmZmVjdCB0aGUgS1ZN
IHZjcHUgcnVubmluZyBpbiB0aGUgYmFja2dyb3VuZC4KClRoZSBmb2xsb3dpbmcgbG9nIGlzIHRo
ZSBvdXRwdXQgb2YgS1ZNIGFuZCBRRU1VIHdoZW4gdmNwdSBjcmFzaGVzOgoKW8KgIDE1Mi4yMjg1
NDhdIGt2bSBbMTQ1XTogVkNQVSBleGl0IGVycm9yIC0xNApbwqAgMTUyLjIzMDY2NF0ga3ZtIFsx
NDVdOiBTRVBDPTB4ZmZmZmZmZmY4MDA0MDI4MCBTU1RBVFVTPTB4MjAwMDA0NTAwIEhTVEFUVVM9
MHgyMDAyMDExMDAKW8KgIDE1Mi4yMzE4NjhdIGt2bSBbMTQ1XTogU0NBVVNFPTB4ZiBTVFZBTD0w
eDNjOCBIVFZBTD0weDAgSFRJTlNUPTB4MTAzMDIzCmVycm9yOiBrdm0gcnVuIGZhaWxlZCBCYWQg
YWRkcmVzcwrCoHBjIMKgIMKgIMKgIGZmZmZmZmZmODAwNDAyODAKwqBtaGFydGlkwqAgMDAwMDAw
MDAwMDAwMDAwMArCoG1zdGF0dXPCoCAwMDAwMDAwMjAwMDAwMTAwCsKgbWlwIMKgIMKgwqAgMDAw
MDAwMDAwMDAwMDAwMArCoG1pZSDCoCDCoMKgIDAwMDAwMDAwMDAwMDAwMDAKwqBtaWRlbGVnwqAg
MDAwMDAwMDAwMDAwMDAwMArCoG1lZGVsZWfCoCAwMDAwMDAwMDAwMDAwMDAwCsKgbXR2ZWMgwqDC
oCAwMDAwMDAwMDAwMDAwMDAwCsKgbWVwYyDCoCDCoCAwMDAwMDAwMDAwMDAwMDAwCsKgbWNhdXNl
IMKgIDAwMDAwMDAwMDAwMDAwMDAKwqBtdHZhbCDCoMKgIDAwMDAwMDAwMDAwMDAwMDAKwqBtc2Ny
YXRjaCAwMDAwMDAwMDAwMDAwMDAwCsKgeDAvemVyb8KgIDAwMDAwMDAwMDAwMDAwMDAgeDEvcmEg
wqDCoCBmZmZmZmZmZjgwYzFhYzJjIHgyL3NwIMKgwqAgZmZmZmZmZmY4MWUwM2NmMCB4My9ncCDC
oMKgIGZmZmZmZmZmODIwMWFhNjgKwqB4NC90cCDCoMKgIGZmZmZmZmZmODFlMGUwYzAgeDUvdDAg
wqDCoCBmZmZmZmZmZjgwYjkxYTA4IHg2L3QxIMKgwqAgZmZmZmFmODBmZWUwMDAwMCB4Ny90MiDC
oMKgIDAwMDAwMDAyMDAwMDAwMjAKwqB4OC9zMCDCoMKgIGZmZmZmZmZmODFlMDNkNTAgeDkvczEg
wqDCoCAwMDAwMDAwMDAxMDAwMDAwIHgxMC9hMCDCoCAwMDAwMDAwMDAwMDAwMDAwIHgxMS9hMSDC
oCAwMDAwMDAwMDAwMDAwMDAwCsKgeDEyL2EyIMKgIDAwMDAwMDAwMDEwMDAwMDAgeDEzL2EzIMKg
IGZmZmZhZjgwZmZlMDAwMDAgeDE0L2E0IMKgIDAwMDAwMDAwMDAwMDAwMDAgeDE1L2E1IMKgIGZm
ZmZhZjdmODAwMDAwMDAKwqB4MTYvYTYgwqAgMDAwMDAwMDAwMDAwMDAwMiB4MTcvYTcgwqAgMDAw
MDAwMDAwMDAwMDAwMiB4MTgvczIgwqAgZmZmZmFmODBmZWUwMDAwMCB4MTkvczMgwqAgZmZmZmZm
ZmY4MTYzOTE3MArCoHgyMC9zNCDCoCBmZmZmZmZmZjgyMDIwMGY4IHgyMS9zNSDCoCAwMDAwMDAw
MDAwMDAwMDAwIHgyMi9zNiDCoCAwMDAwMDAwMDAwMDAwMDAwIHgyMy9zNyDCoCAwMDAwMDAwMDAw
MDAwMDAwCsKgeDI0L3M4IMKgIDAwMDAwMDAwMDAwMDAwMDAgeDI1L3M5IMKgIDAwMDAwMDAwMDAw
MDAwMDAgeDI2L3MxMMKgIDAwMDAwMDAwMDAwMDAwMDAgeDI3L3MxMcKgIDAwMDAwMDAwMDAwMDAw
MDAKwqB4MjgvdDMgwqAgZmZmZmZmZmY4MGI4NTExMCB4MjkvdDQgwqAgZmZmZmZmZmY4MjA1ZDI1
OCB4MzAvdDUgwqAgZmZmZmZmZmY4MjA1ZDI1OCB4MzEvdDYgwqAgZmZmZmZmZmY4MjA1ZDJhMApb
wqAgMTUyLjMxMjgyNF0gcmlzY3Zfc3NlX3Rlc3Q6IEZBSUxFRDogRmFpbGVkIHRvIHdhaXQgZm9y
IGV2ZW50IGxvY2FsX3NvZnR3YXJlX2luamVjdGVkIGNvbXBsZXRpb24gb24gQ1BVIDIKW8KgIDE1
Mi4zMTc5MzNdIHJpc2N2X3NzZV90ZXN0OiBGQUlMRUQ6IFJlY2VpdmVkIFNTRSBldmVudCAtNjU1
MzYgb24gQ1BVIDIgaW5zdGVhZCBvZiA0CgpUaGUgZm9sbG93aW5nIGlzIHRoZSBhc3NlbWJseSBj
b250ZXh0IHdoZXJlIHZjcHUgY3Jhc2hlcywgd2hpY2ggaXMgdGhlIFNBVkVfR1VFU1RfR1BSUyBt
YWNybyB0aGF0IHJ1bnMgd2hlbiBpdCBnZXQgYmFjayB0byBob3N0KHZjcHVfc3dpdGNoLlM6IExr
dm1fc3dpdGNoX3JldHVybikuClRoZSBzc2NyYXRjaCBpcyBzZXQgdG8gMChvciBvdGhlciBiYWQg
YW5kIGxvdyBhZGRyZXNzZXMpIGJ5IG1pc3Rha2UsIGNhdXNpbmcgYSBjcmFzaCB3aGVuIHN0b3Jp
bmcgdGhlIHZpcnR1YWwgbWFjaGluZSBjb250ZXh0LgoKwqDCoCAweGZmZmZmZmZmODAwNDAyN2Mg
PCsyNTI+OiDCoCBjc3JydyDCoCBhMCxzc2NyYXRjaCxhMArCoMKgIDB4ZmZmZmZmZmY4MDA0MDI4
MCA8KzI1Nj46IMKgIHNkIMKgIMKgwqAgcmEsOTY4KGEwKQrCoMKgIDB4ZmZmZmZmZmY4MDA0MDI4
NCA8KzI2MD46IMKgIHNkIMKgIMKgwqAgc3AsOTc2KGEwKQrCoMKgIDB4ZmZmZmZmZmY4MDA0MDI4
OCA8KzI2ND46IMKgIHNkIMKgIMKgwqAgZ3AsOTg0KGEwKQrCoMKgIDB4ZmZmZmZmZmY4MDA0MDI4
YyA8KzI2OD46IMKgIHNkIMKgIMKgwqAgdHAsOTkyKGEwKQrCoMKgIDB4ZmZmZmZmZmY4MDA0MDI5
MCA8KzI3Mj46IMKgIHNkIMKgIMKgwqAgdDAsMTAwMChhMCkKwqDCoCAweGZmZmZmZmZmODAwNDAy
OTQgPCsyNzY+OiDCoCBzZCDCoCDCoMKgIHQxLDEwMDgoYTApCgpUaGlzIGlzIGEgbXVzdC1vY2N1
ciBwcm9ibGVtIGluIG15IGVudmlyb25tZW50LiBBcyBsb25nIGFzIGFuIGlkbGUgVk0gaXMgcnVu
bmluZyBpbiB0aGUgYmFja2dyb3VuZCzCoCBydW4gdGhlIFNTRSB0ZXN0IGluIGxvb3Agb24gdGhl
IGhvc3QsIGFuZCB0aGUgdmNwdSB3aWxsIGNyYXNoLiBDYW4gdGhpcyBwcm9ibGVtIGJlIHJlcHJv
ZHVjZWQgaW4geW91ciBlbnZpcm9ubWVudD8KClJlZ2FyZHMsClpoYW5wZW5nCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
