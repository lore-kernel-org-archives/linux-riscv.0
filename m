Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3AECDB465
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 13:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=keM1yDR5CyR7a5imDc+7jZSKGqlNEDqYfxghTtcemZE=; b=za79c4k7lTzSAx
	iDfXNK76vZXaiPsPJpTrVlYZ0OguVJZJRtF20aGdye3k4DX8Pp2hVMRs2bFfb3Y68fK8IEgpSjCbV
	TWBfDbYe692HlpWv799K77Kk2WuGAtBXJiuofT7TCwAAoEyZ5PjdDNpfNWtzOjYrE9nhzfXkhxZP9
	Ae9olj4UGc9oy+8b+i1TCVJwXiR+Ta9lH9DPFp3S6Kr5LGloeNdxRr3KaTEUdqnmVzuUwOjF72FOi
	sAZ7B9eeii7EdywYQ0uoUSrxJLL2Syr/d4vm3/EhGeM/SdYX5vqez62J+fK6U4nBJzViuzhkyBu1+
	XZrhibE8ojfL0NzyD9qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtTJ7-00HYIF-0B;
	Thu, 19 Oct 2023 13:43:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtTJ4-00HYHN-0k
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 13:43:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 81F6661452;
	Thu, 19 Oct 2023 13:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3421C433C7;
	Thu, 19 Oct 2023 13:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697723001;
	bh=fNfzoqPWnxpHpfpwgiuXewdIuM9DFInylMJTHvvmILo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gnP8+wBbAkOCOyn5Cg5KbPb8++KjWQ/7lQ8rMIHckwlmX3FAW8KMQ2GTkslW8Al6/
	 mmftTT6QyTe6Mjvc6xY6mrGooWm7sMVOQPZZCY5kuoW2yCsPjlS7krk1kygXEyjaXb
	 S8oBOu+WISWZ+MQqb8+9fvujWdfgAiKfFr11gGqK4cSCWF/u0pkuHVszXHiBfRqhHN
	 AtTEl6DdBvJC5vJn8aV+CyLDKQIG7ZueP/60QBRmneObNlEjVhAECF8e3NOoTEWbCG
	 AXHggYFB9W9q81QusyURho5DJ5I/l3MQcc+ItbdFzGERTmDLY2hH0tbzgG/B/YxVuo
	 KFtHBZjP8X8Gw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas
 Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v10 00/15] Linux RISC-V AIA Support
In-Reply-To: <20231003044403.1974628-1-apatel@ventanamicro.com>
References: <20231003044403.1974628-1-apatel@ventanamicro.com>
Date: Thu, 19 Oct 2023 15:43:18 +0200
Message-ID: <87o7gu7mo9.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_064322_355359_48E56F4D 
X-CRM114-Status: GOOD (  15.73  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQW51cCwKCkFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cml0ZXM6Cgo+
IFRoZSBSSVNDLVYgQUlBIHNwZWNpZmljYXRpb24gaXMgcmF0aWZpZWQgYXMtcGVyIHRoZSBSSVND
LVYgaW50ZXJuYXRpb25hbAo+IHByb2Nlc3MuIFRoZSBsYXRlc3QgcmF0aWZpZWQgQUlBIHNwZWNp
ZmNhdGlvbiBjYW4gYmUgZm91bmQgYXQ6Cj4gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2
LWFpYS9yZWxlYXNlcy9kb3dubG9hZC8xLjAvcmlzY3YtaW50ZXJydXB0cy0xLjAucGRmCj4KPiBB
dCBhIGhpZ2gtbGV2ZWwsIHRoZSBBSUEgc3BlY2lmaWNhdGlvbiBhZGRzIHRocmVlIHRoaW5nczoK
PiAxKSBBSUEgQ1NScwo+ICAgIC0gSW1wcm92ZWQgbG9jYWwgaW50ZXJydXB0IHN1cHBvcnQKPiAy
KSBJbmNvbWluZyBNZXNzYWdlIFNpZ25hbGVkIEludGVycnVwdCBDb250cm9sbGVyIChJTVNJQykK
PiAgICAtIFBlci1IQVJUIE1TSSBjb250cm9sbGVyCj4gICAgLSBTdXBwb3J0IE1TSSB2aXJ0dWFs
aXphdGlvbgo+ICAgIC0gU3VwcG9ydCBJUEkgYWxvbmcgd2l0aCB2aXJ0dWFsaXphdGlvbgo+IDMp
IEFkdmFuY2VkIFBsYXRmb3JtLUxldmVsIEludGVycnVwdCBDb250cm9sbGVyIChBUExJQykKPiAg
ICAtIFdpcmVkIGludGVycnVwdCBjb250cm9sbGVyCj4gICAgLSBJbiBNU0ktbW9kZSwgY29udmVy
dHMgd2lyZWQgaW50ZXJydXB0IGludG8gTVNJcyAoaS5lLiBNU0kgZ2VuZXJhdG9yKQo+ICAgIC0g
SW4gRGlyZWN0LW1vZGUsIGluamVjdHMgZXh0ZXJuYWwgaW50ZXJydXB0cyBkaXJlY3RseSBpbnRv
IEhBUlRzCgpUaGFua3MgZm9yIHdvcmtpbmcgb24gdGhlIEFJQSBzdXBwb3J0ISBJIGhhZCBhIGxv
b2sgYXQgdGhlIHNlcmllcywgYW5kCmhhdmUgc29tZSBjb25jZXJucyBhYm91dCBpbnRlcnJ1cHQg
SUQgYWJzdHJhY3Rpb24uCgpBIGJpdCBvZiBiYWNrZ3JvdW5kLCBmb3IgcmVhZGVycyBub3QgZmFt
aWxpYXIgd2l0aCB0aGUgQUlBIGRldGFpbHMuCgpJTVNJQyBhbGxvd3MgZm9yIDIwNDcgdW5pcXVl
IE1TSSAoIm1zaS1pcnEiKSBzb3VyY2VzIHBlciBoYXJ0LCBhbmQKZWFjaCBNU0kgaXMgZGVkaWNh
dGVkIHRvIGEgY2VydGFpbiBoYXJ0LiBUaGUgc2VyaWVzIHRha2VzIHRoZSBhcHByb2FjaAp0byBz
YXkgdGhhdCB0aGVyZSBhcmUsIGUuZy4sIDIwNDcgaW50ZXJydXB0cyAoImxueC1pcnEiKSBnbG9i
YWxseS4KRWFjaCBsbngtaXJxIGNvbnNpc3RzIG9mICNoYXJ0cyAqIG1zaS1pcnEgLS0gYSBzbGlj
ZSAtLSBhbmQgaW4gdGhlCnNsaWNlIG9ubHkgKm9uZSogbXNpLWlycSBpcyBhY3V0YWxseSB1c2Vk
LgoKVGhpcyBzY2hlbWUgbWFrZXMgYWZmaW5pdHkgY2hhbmdlcyBtb3JlIHJvYnVzdCwgYmVjYXVz
ZSB0aGUgaW50ZXJydXB0CnNvdXJjZXMgb24gIm90aGVyIiBoYXJ0cyBhcmUgcHJlLWFsbG9jYXRl
ZC4gT24gdGhlIG90aGVyIGhhbmQgaXQKcmVxdWlyZXMgdG8gcHJvcGFnYXRlIGlycSBtYXNraW5n
IHRvIG90aGVyIGhhcnRzIHZpYSBJUElzICh0aGlzIGlzCm1vc3RseSBkb25lIHVwIHNldHVwL3Rl
YXIgZG93bikuIEl0J3MgYWxzbyB3YXN0ZWZ1bCwgYmVjYXVzZSBtc2ktaXJxcwphcmUgaG9nZ2Vk
LCBhbmQgY2Fubm90IGJlIHVzZWQuCgpDb250ZW1wb3Jhcnkgc3RvcmFnZS9uZXR3b3JraW5nIGRy
aXZlcnMgdXN1YWxseSB1c2VzIHF1ZXVlcyBwZXIgY29yZQoob3IgYSBzdWItc2V0IG9mIGNvcmVz
KS4gVGhlIGN1cnJlbnQgc2NoZW1lIHdhc3RlcyBhIGxvdCBvZiBtc2ktaXJxcy4KSWYgd2UgaW5z
dGVhZCB1c2VkIGEgc2NoZW1lIHdoZXJlICJtc2ktaXJxID09IGxueC1pcnEiLCBpbnN0ZWFkIG9m
CiJsbnEtaXJxID0ge2hhcnQgMDttc2ktaXJxIHggLCAuLi4gaGFydCBOO21zaS1pcnEgeH0iLCB0
aGVyZSB3b3VsZCBiZQphIGxvdCBNU0lzIGZvciBvdGhlciB1c2Vycy4gMS0xIHZzIDEtTi4gRS5n
LiwgaWYgYSBzdG9yYWdlIGRldmljZQp3b3VsZCBsaWtlIHRvIHVzZSA1IHF1ZXVlcyAoNSBjb3Jl
cykgb24gYSAxMjggY29yZSBzeXN0ZW0sIHRoZSBjdXJyZW50CnNjaGVtZSB3b3VsZCBjb25zdW1l
IDUgKiAxMjggTVNJcywgaW5zdGVhZCBvZiBqdXN0IDUuCgpPbiB0aGUgcGx1cyBzaWRlOgoqIENo
YW5naW5nIGludGVycnVwdHMgYWZmaW5pdHkgd2lsbCBuZXZlciBmYWlsLCBiZWNhdXNlIHRoZSBp
bnRlcnJ1cHRzCiAgb24gZWFjaCBoYXJ0IGlzIHByZS1hbGxvY2F0ZWQuCgpPbiB0aGUgbmVnYXRp
dmUgc2lkZToKKiBXYXN0ZWZ1bCBpbnRlcnJ1cHQgdXNhZ2UsIGFuZCBhIHN5c3RlbSBjYW4gcG90
aWVudGlhbGx5ICJydW4gb3V0IiBvZgogIGludGVycnVwdHMuIEVzcGVjaWFsbHkgZm9yIG1hbnkg
Y29yZSBzeXN0ZW1zLgoqIEludGVycnVwdCBtYXNraW5nIG5lZWQgdG8gcHJvYWdhdGUgdG8gaGFy
dHMgdmlhIElQSXMgKHRoZXJlJ3Mgbm8KICBicm9hZGNhc3QgY3NyIGluIElNU0lDKSwgYW5kIGEg
bW9yZSBjb21wbGV4IGxvY2tpbmcgc2NoZW1lIElNU0lDCgpTdW1tYXJ5OgpUaGUgY3VycmVudCBz
ZXJpZXMgY2FwcyB0aGUgbnVtYmVyIG9mIGdsb2JhbCBpbnRlcnJ1cHRzIHRvIG1heGltdW0KMjA0
NyBNU0lzIGZvciBhbGwgY29yZXMgKHdob2xlIHN5c3RlbSkuIEEgYmV0dGVyIHNjaGVtZSwgSU1P
LCB3b3VsZCBiZQp0byBleHBvc2UgMjA0NyAqICNoYXJ0cyB1bmlxdWUgTVNJcy4KCkkgdGhpbmsg
dGhpcyBjb3VsZCBzaW1wbGlmeS9yZW1vdmUoPykgdGhlIGxvY2tpbmcgYXMgd2VsbC4KCkkgcmVh
bGl6ZSB0aGF0IHRoZSBzZXJpZXMgaW4gdjEwLCBhbmQgY29taW5nIHdpdGggYSBjaGFuZ2UgbGlr
ZSB0aGlzCm5vdyBtaWdodCBiZSBhIGJpdCBvZiBhIHBhaW4uLi4KCkZpbmFsbHksIGFub3RoZXIg
cXVlc3Rpb24gcmVsYXRlZCB0byBBUExJQy9JTVNJQy4gQUZBSVUgdGhlIG1lbW9yeSBtYXAKb2Yg
dGhlIElNU0lDIHJlZ2lvbnMgYXJlIGNvbnN0cmFpbmVkIGJ5IHRoZSBBUExJQywgd2hpY2ggcmVx
dWlyZXMgYQpjZXJ0YWluIGxheW91dCBmb3IgTVNJIGZvcndhcmRpbmcgKGdyb3VwL2hhcnQvZ3Vl
c3QgYml0cykuIFNheSB0aGF0IGEKc3lzdGVtIGRvZXNuJ3QgaGF2ZSBhbiBBUExJQywgY291bGRu
J3QgdGhlIGxheW91dCByZXF1aXJlbWVudCBiZQpzaW1wbGlmaWVkPwoKCkFnYWluLCB0aGFua3Mg
Zm9yIHRoZSBoYXJkIHdvcmshCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
