Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3093AC32793
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 13:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6jUHTMnj2YcRBT1tmJiQ4O3Dl2cEyb5wFX8IFZMkUCk=; b=piKaMQky7WRFjH
	VEPDf40INoobgZl3IEEHMy/CTefEwswu1aIF6TKk2epEQtqV1uZBuBLmK8sOmbPbriCP/0iCBBSUM
	NB3DVAr+OiLizW03vt7EBKF7uHCPK6HyNii6OH9IgeazXLIYM7tlD48q2M0jz6gIkayNAHZykgB4u
	zhHPdqL5F7ddZ9aaXSEQVvM3XWHydTPFUHlNSikmE+2gyajXQu3gEUybxqks4+Z08Te4ORikBBQCG
	HG2nflvHW5355mu6Hw1gYC8KdLjk+W5zxdhvHaag+S4jRhOeaD1V51Vd4yFG003h82FelfFmBvB7z
	Fq/SQySieZQgqDVbpUVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQqO6-00DECK-V1; Wed, 24 Aug 2022 13:25:42 +0000
Received: from smtp09.smtpout.orange.fr ([80.12.242.131] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQqO3-00DE8d-Os
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 13:25:41 +0000
Received: from [192.168.1.18] ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id QqNuo0vdXtUbyQqNuoT03y; Wed, 24 Aug 2022 15:25:32 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 24 Aug 2022 15:25:32 +0200
X-ME-IP: 90.11.190.129
Message-ID: <c14607d5-337c-3e75-2b95-720553f40282@wanadoo.fr>
Date: Wed, 24 Aug 2022 15:25:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] rtc: mpfs: Use devm_clk_get_enabled() helper
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Conor.Dooley@microchip.com, Daire.McNamara@microchip.com,
 a.zummo@towertech.it, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rtc@vger.kernel.org
References: <e55c959f2821a2c367a4c5de529a638b1cc6b8cd.1661329086.git.christophe.jaillet@wanadoo.fr>
 <f76fb247-5160-61ed-a0a3-037d2f40d2f9@microchip.com>
 <c74a42f7-7d9a-6b52-85b2-d87dacd91be6@wanadoo.fr>
 <YwYZZWu3gOBIPJeI@mail.local>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <YwYZZWu3gOBIPJeI@mail.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_062539_965152_13888A8A 
X-CRM114-Status: GOOD (  13.85  )
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

TGUgMjQvMDgvMjAyMiDDoCAxNDoyOCwgQWxleGFuZHJlIEJlbGxvbmkgYSDDqWNyaXTCoDoKPiAK
PiBCVFcsIEkgdGhvdWdodCB5b3UgYWN0dWFsbHkgdGVzdGVkIHlvdXIgY2hhbmdlcyBvbiB0aGUg
b3RoZXIgcGF0Y2ggSQo+IHRvb2ssIG5vdCB0aGF0IHlvdSB3ZXJlIGRvaW5nIGEgYmxhbmtldCBj
b252ZXJzaW9uIG9mIHRoZSBzdWJzeXN0ZW0uCj4gVGhpcyBpcyB0aGUga2luZCBvZiBpbmZvIHRo
YXQgbXVzdCBhcHBlYXIgaW4gdGhlIGNvbW1pdCBsb2cuIEkgd291bGQKPiBkZWZpbml0aXZlbHkg
bm90IGhhdmUgdGFrZW4gdGhlIHBhdGNoLgo+IAoKT2ssIG5vdGVkIGZvciBmdXR1cmUgY29udHJp
YnV0aW9uLgoKCkluIGZhY3QgSSBmaXJzdCBzZW50IG9ubHkgb25lIHBhdGNoIHRvIHNlZSBpZiBp
dCBnb3Qgc29tZSBpbnRlcmVzdCBmb3IgCnN1Y2ggdHJhbnNmb3JtYXRpb24uCkkgb25seSBzZW50
IHNvbWUgb3RoZXIgYWZ0ZXIgeW91ciBBY2suCgoKTm90aGluZyBpcyBuZXZlciB0cml2aWFsLCBi
dXQgc3VjaCBwYXRjaGVzIGxvb2tzIGZpbmUgdG8gbWUuCkl0IHNhdmVzIHNvbWUgTG9DLCByZWR1
Y2UgdGhlIHNpemUgb2YgdGhlIC5vIGFuZCBzbGlnaHRseSBzYXZlcyBzb21lIApydW50aW1lIG1l
bW9yeS4KCkFuZCB1bmxlc3MsIEkgbWlzc2VkIHNvbWV0aGluZywgdGhlIG9yZGVyIG9mIG9wZXJh
dGlvbiByZW1haW5zIHRoZSBzYW1lLCAKYm90aCB3aGVuIHJlc291cmNlcyBhcmUgYWxsb2NhdGVk
IGFuZCBmcmVlZC4KCgpXaHkgd291bGRuJ3QgeW91IGhhdmUgdGFrZW4gc3VjaCBhIHBhdGNoPwoo
anVzdCBmb3IgbXkgdW5kZXJzdGFuZGluZyBhbmQgaW4gb3JkZXIgdG8gYXZvaWQgc3BhbW1pbmcg
b3RoZXJzIHdpdGggCnVzZWxlc3Mvcmlza3kgc3R1ZmYpCgpDSgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
