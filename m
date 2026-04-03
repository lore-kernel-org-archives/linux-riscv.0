Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC19E7E363
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 10:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VTclKR0oTOSVIyS++cPKZ4Z1SOj4S4SXVqGgRonjMmc=; b=Yeogi0vTUMaO2h
	RlAlyjWlbTJERmfxT4Y0ft+Akw80TtCwQVVz/vxKejrNJK/WkEmOU0k9Xff3MiEDf9jHpuJdTYNJE
	IgohUeLgwOxDud0OHmM1tbzm96ky5Ktxok94aQWDlctTbo8l6h2rnFgoIqapRycusSaTurMu89JOX
	XbALReXByFAlmlVUVb8U6mrlzjm2EEW/iO2Nx/WuY2gaWahmDORgtOdr0xDDqT2KVA/wmkG8JbTuQ
	JRElIqfKj1r+85ARSgndWFPCOycGD9KwqcKtvEI6HDG71NFZFcSp3/OFkD/rxJUkVYSmQhHQy+V1s
	b401QXY8ViJcpxN9WMiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8bQ9-00000001rTO-47RR;
	Fri, 03 Apr 2026 10:06:34 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8bQ6-00000001rSv-0WvK
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 10:06:32 +0000
Received: from [10.213.19.33] (unknown [210.73.43.101])
	by APP-01 (Coremail) with SMTP id qwCowACHLGgZkc9pk38PDA--.5212S2;
	Fri, 03 Apr 2026 18:06:18 +0800 (CST)
Message-ID: <00ddad5a-02f5-474e-af9c-11ce7716ddfc@iscas.ac.cn>
Date: Fri, 3 Apr 2026 18:06:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vivian Wang <wangruikang@iscas.ac.cn>
Subject: Devicetree spec: Specifying /cpus/cpu@* unit address format?
To: devicetree-spec@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev
Content-Language: en-US
X-CM-TRANSID: qwCowACHLGgZkc9pk38PDA--.5212S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CrWUAF15WF18Cr4kJFWUurg_yoW5JrWrpr
	s7uFyUtryqyF48Jw42q3WUX3y3AFWkWw4UtF95J34kAFZ8WFykZFna9wn0gFyUCF1xXa45
	Zws09a4UC3ZrZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Ib7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_Gw1l42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjxUgvJmDUUUU
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_030630_560944_4306B16A 
X-CRM114-Status: UNSURE (   8.24  )
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

KEFsc28gcG9zdGVkIGF0OiBodHRwczovL2dpdGh1Yi5jb20vZGV2aWNldHJlZS1vcmcvZGV2aWNl
dHJlZS1zcGVjaWZpY2F0aW9uL2lzc3Vlcy84NiApCgpIaSBhbGwsCgpQcmVzZW50bHksIHRoZXJl
IHNlZW1zIHRvIGJlIHNvbWUgY29uZnVzaW9uIGluIHRoZSBjb21tdW5pdHkgYWJvdXQgdGhlCmZv
cm1hdCBvZiB1bml0IGFkZHJlc3NlcyBmb3IgIi9jcHVzL2NwdUAqIiBub2RlcyBmb3IgYSBDUFUg
d2l0aCBJRCA+IDksIGUuZy4KCsKgIMKgIGNwdUA/Pz8gewrCoCDCoCDCoCDCoCByZWcgPSA8MTA+
OwrCoCDCoCDCoCDCoCAvKiByZWcgPSA8MHhhPjsgKi8gLyogVGhpcyBzaG91bGQgYmUgZXF1aXZh
bGVudCAqLwrCoCDCoCB9CgoKU2hvdWxkIHRoaXMgYmUgYSBkZWNpbWFsICJjcHVAMTAiLCBvciBo
ZXhhZGVjaW1hbCAiY3B1QGEiPyBJIGNhbid0IGZpbmQKYW55IGV4cGxpY2l0IHNwZWNpZmljYXRp
b24uCgogICogTW9zdCBvdGhlciBub2RlcyBzcGVjaWZ5IGEgaGV4IHVuaXQgYWRkcmVzcwogICog
SSBjb3VsZCBub3QgZmluZCBhbnl0aGluZyBzcGVjaWZ5aW5nIHRoaXMgZ2VuZXJpY2FsbHkKICAg
ICAgbyBBRkFJQ1QsIHRoZXJlJ3Mgbm8gL2NwdXMgaW4gSUVFRSAxMjc1CiAgICAgIG8gZVBBUFIg
ZG9lc24ndCBzYXkgYW55dGhpbmcgYWJvdXQgdGhpcwogICAgICBvIFByZXNlbnRseSwgRFRTcGVj
IGRvZXNuJ3Qgc2F5IGFueXRoaW5nIGFib3V0IHRoaXMuCiAgKiBkdC1zY2hlbWEgc2F5cyBpdCdz
IF5jcHVAWzAtOWEtZl0rJCwgc2VlbWluZ2x5IGludGVuZGluZyB0byB1c2UKICAgIGhleGFkZWNp
bWFsLCBidXQgbm90IGZvcmJpZGRpbmcgZGVjaW1hbC4gWzFdCiAgKiBPZiB0aGUgYC9jcHVzYCBz
Y2hlbWFzIGluIExpbnV4CiAgICAoRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3th
cm0sbWlwcyxyaXNjdixsb29uZ2FyY2h9L2NwdXMueWFtbCksCiAgICBub25lIG1lbnRpb24gdGhl
IG5vZGUgdW5pdCBhZGRyZXNzCgpBcyBvZiBjdXJyZW50IHVzYWdlOgoKICAqIE9mIGFsbCB0aGUg
RFRTIGZpbGVzIGluIChtYWlubGluZSkgTGludXgsIG1vc3QgZWl0aGVyIHVzZSBoZXgsIG9yCiAg
ICBoYXZlIHJlZyA8IDkgZm9yIGFsbCBDUFVzLgogICAgICBvIEFGQUlDVCBmcm9tIGdyZXBwaW5n
LCBhcm0gYW5kIGFybTY0IGNvbnNpc3RlbnRseSB1c2VzIGhleC4KICAgICAgbyBNb3N0IHJpc2N2
IFNvQ3MgaGF2ZSA8PSA5IENQVXMuIFRoZSB0d28gdGhhdCBkb24ndCB1c2UgZGVjaW1hbDoKICAg
ICAgICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby97c2cyMDQyLHNnMjA0NH0tY3B1cy5kdHNp
CiAgICAgIG8gTm8gb3RoZXIgYXJjaCBoYXMgaW4tdHJlZSBEVFMgd2l0aCBDUFUgcmVnID4gOQog
ICogT2YgYWxsIHRoZSBkdC1iaW5kaW5ncyBleGFtcGxlcyBpbiBMaW51eCwgb25seSBvbmUgdXNl
cyBkZWNpbWFsLCBidXQKICAgIGl0IHNlZW1zIHRvIGJlIHVuaW50ZW50aW9uYWw6CiAgICBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvb3BwL29wcC12Mi55YW1sCiAgKiBRRU1VIGdl
bmVyYXRlcyBkZWNpbWFsIGZvciBtdWx0aXBsZSBhcmNocyBpbiBlLmcuCiAgICBgaHcve2FybSxy
aXNjdn0vdmlydC5jYCBhbmQgb3RoZXIgcGxhY2VzIChncmVwIC1SICJjcHVAIikKICAqIFNwaWtl
IChSSVNDLVYgZW11bGF0b3IpIGdlbmVyYXRlcyBkZWNpbWFsIFszXQoKSXQgY291bGQgYmUgYSBn
b29kIGlkZWEgdG8gaGF2ZSB0aGlzIHN0YW5kYXJkaXplZCwgbGlrZSBhbGwgb3RoZXIgdW5pdAph
ZGRyZXNzZXMuCgpEVFNwZWMgc2F5czoKCsKgIFRoZSBiaW5kaW5nIGZvciBhIHBhcnRpY3VsYXIg
YnVzIG1heSBzcGVjaWZ5IGFkZGl0aW9uYWwsIG1vcmUgc3BlY2lmaWMKcmVxdWlyZW1lbnRzIGZv
ciB0aGUgZm9ybWF0IG9mIHJlZyBhbmQgdGhlIHVuaXQtYWRkcmVzcy4KClNpbmNlIC9jcHVzIGFu
ZCAvY3B1cy9jcHVAKiBhcmUgZ2VuZXJpY2FsbHkgZGVmaW5lZCBpbiBEVFNwZWMgYW5kCnNwZWNp
YWxpemVkIGZvciB2YXJpb3VzIGFyY2hpdGVjdHVyZXMsIEkgYmVsaWV2ZSB0aGlzIGlzIHRoZSBy
aWdodCBwbGFjZQp0byBzdGFydCBzdGFuZGFyZGl6aW5nIHRoaXMuIEV2ZW4gaWYgYXJjaC1zcGVj
aWZpYyBkZWZpbml0aW9ucyBhcmUKcmVxdWlyZWQsIGF0IGxlYXN0IERUU3BlYyBjYW4gZ2l2ZSBh
IHJlY29tbWVuZGF0aW9uIG9uIHdoZXRoZXIgdG8gdXNlCmRlY2ltYWwgb3IgaGV4YWRlY2ltYWwu
CgpUaGFua3MsClZpdmlhbiAiZHJhbWZvcmV2ZXIiIFdhbmcKClsxXTogaHR0cHM6Ly9naXRodWIu
Y29tL2RldmljZXRyZWUtb3JnL2R0LXNjaGVtYS9ibG9iL3YyMDI1LjEyL2R0c2NoZW1hL3NjaGVt
YXMvY3B1cy55YW1sI0w1Mi1MNTQKWzJdOiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytc29mdHdh
cmUtc3JjL3Jpc2N2LWlzYS1zaW0vYmxvYi81ZWVlYjkxZWZhOTY2OTM2ZWY3Yjk4MGY1ZThkZDAw
ZmZiZTcwNzg2L3Jpc2N2L2R0cy5jYyNMNjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
