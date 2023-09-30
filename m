Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28222E7735F
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Sep 2023 09:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YflQzpaZF42p83lj2a2Eyaa4f7tu4b2b8OPR91TMWAc=; b=COQfdVkrueuIV1
	/lx6Fv/YXS4x4TzNEkYixFrODtZHm8w/Pm1YNLxhP/e8hYeNvAQXRl+y7Fe/zSkf33NnmHCVSDONY
	dHPCkchOZoW9N4cDLaSKwboCNs+vJO+uSFar6HR4rIw6LiM71wvibGySiXbLXKFHhswi+2Cs8X0du
	Pz/RhGVWAbh3NjG8DBPDpKvPPuOPqM4NhDgVsIK/FvgdrTlaxM2Urp3QV8DGS7BL4i5BpB+KmOkvP
	LVMlIfxqfZa3TUsRQ2UR4wy9fdfH3KTXg2/G1heOd35zkfokkipl/ZrM6CuRK1icwfhemz6jY9NAt
	tF2FRTWIcALjDJx5eexA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmW5u-009EK2-2v;
	Sat, 30 Sep 2023 09:17:02 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmW5r-009EJD-0D
	for linux-riscv@lists.infradead.org;
	Sat, 30 Sep 2023 09:17:01 +0000
X-QQ-mid: bizesmtp63t1696065391t50lhqi7
Received: from [172.23.146.214] ( [202.201.12.64])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 30 Sep 2023 17:16:29 +0800 (CST)
X-QQ-SSF: 01200000000000907000000A0000000
X-QQ-FEAT: I8hG9CuxGDLQuXHf8VtanQ2ZKm/Lok9FMJ2TGfARaNJMLrUjTGywh20/NmSwG
	k9B3qP7xVX/XDL06cEqN5/T6/SlOcD4tPyRI/KVWQ2eCnI6BkC0ATKt+axs/D4EPawFNEI3
	YaGcCsD8+HPskciaD+yBpR5OuwYD7WBzbHQovVbVg8kQQWpAKZZnAlgndmPK7kJN1YG9U8N
	SFfVUGyMvbQAHhUHmGRHv7A87YJ5YzWpvdZqd6sYD9av2+O8nRHxBIc17gXHoWYKWCleklM
	6vlcrr94AMxb+A9fpXH77coirsb89nAPxpQFneyWGktY2v8wFATEKFC5+CA0a3XVSMP7RM9
	/bY+92t8qHABlXjh4KknZoCVfi1Lw==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14407844278423888286
Message-ID: <547F71D46EA4696E+a7d57e8e-aa8f-4779-8108-9c326e1bde86@tinylab.org>
Date: Sat, 30 Sep 2023 17:16:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: falcon@tinylab.org
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux@weissschuh.net, palmer@rivosinc.com,
 paul.walmsley@sifive.com, paulburton@kernel.org, paulmck@kernel.org,
 tim.bird@sony.com, tsbogend@alpha.franken.de, w@1wt.eu
References: <cover.1695679700.git.falcon@tinylab.org>
Subject: Re: [PATCH v1 0/7] DCE/DSE: Add Dead Syscalls Elimination support,
 part1
Content-Language: en-GB
From: Yuan Tan <tanyuan@tinylab.org>
In-Reply-To: <cover.1695679700.git.falcon@tinylab.org>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230930_021659_461946_845F1D0A 
X-CRM114-Status: UNSURE (   3.88  )
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

SGVyZSBpcyBhIHRlc3QgcmVzdWx0IGFib3V0IERFQURfQ09ERV9EQVRBX0VMSU1JTkFUSU9OIChE
Q0UpIGFuZCBkZWFkIHN5c2NhbGxzCmVsaW1pbmF0aW9uIChEU0UpLiBJdCdzIGJhc2VkIG9uIGNv
bmZpZ1sxXSBhbmQgYSBzaW1wbGUgaGVsbG8uYyBpbml0cmFtZnMuCgpJbiB0aGUgRFNFIHRlc3Qs
IHdlIHNldCBDT05GSUdfU1lTQ0FMTFNfVVNFRD0ic3lzX3dyaXRlIHN5c19leGl0IHN5c19yZWJv
b3QsIgp3aGljaCBpcyB1c2VkIGJ5IGhlbGxvLmMgdG8gc2ltcGx5IHByaW50ICJIZWxsbyIgdGhl
biBleGl0IGFuZCBzaHV0IGRvd24gcWVtdS4KCnzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgc3lzY2FsbCByZW1h
aW4gfCB2bWxpbnV4IHNpemXCoMKgwqDCoCB8IHZtbGludXggYWZ0ZXIgdHJpcCB8CnwgLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSB8IC0tLS0tLS0tLS0tLS0tIHwgLS0tLS0tLS0t
LS0tLS0tLSB8IC0tLS0tLS0tLS0tLS0tLS0tLSB8CnwgZGlzYWJsZSBEQ0XCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMjM2wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8IDI1NTk2MzLCoMKgwqDCoMKgwqDCoMKgwqAgfCAxOTYzNDAwwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8CnwgZW5hYmxlIERDRcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8IDIwOMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyMDM3Mzg0ICgtMjAu
NCUpIHwgMTQ4NTc3NiAoLTI0LjMlKcKgwqAgfAp8IGVuYWJsZSBEQ0UgYW5kIERTRShTSEVfR1JP
VVApwqDCoMKgwqDCoCB8IDPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE4NTY2NDAgKC0y
Ny42JSkgfCAxMzU0NDI0ICgtMzEuMCUpwqDCoCB8CnwgZW5hYmxlIERDRSBhbmQgRFNFKFNIRV9M
SU5LX09SREVSKSB8IDPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE4NTY2NjQgKC0yNy42
JSkgfCAxMzU0NDI0ICgtMzEuMCUpwqDCoCB8CgpJdCBzaG93cyB0aGF0IGRlYWQgc3lzY2FsbHMg
ZWxpbWluYXRpb24gY2FuIHNhdmUgNyUgb2Ygc3BhY2UgYmFzZWQgb24gRENFLgoKWzFdOiBodHRw
czovL3Bhc3RlYmluLmNvbS9LRzRmZDdhVAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
