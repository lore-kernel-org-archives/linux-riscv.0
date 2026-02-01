Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8097E7C711
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Feb 2026 07:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lR5vql55v6TOvTWGHgiDJeEOD4/Rgabr8SkJLIgmKsA=; b=GISqmIgeDPGnMa
	i2SG8ygszHB1TRmi+eg1FtFPGHrPqoltODz9c6aMvXo21yYp7vGzde3scFHE0G4pP/RHbS5HFafDC
	6l+JUJxVQZrqfG31Bczs1cEHmCwz9DTntH6hKu2rkkFJ2Tf+6uQDlMDl2Qva5JgJNnaNbbhaZOxBD
	df60Pcea1mKS1wyouvnI9OcaC/4JvAxVlhBqPuWvF3XahzNrb1u+nFVpT58Px6fy5PUgXTlTMG7n7
	peijgv7LNdAI1PPbhZehyNUc7DReqDCwaeUhwuYseBuHSa8BbgS9l1ErsknJjNotQRyI7w2ePQ1o4
	vn/OXWNT9YFfmw4SLdxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmSIV-00000003L4W-3VtW;
	Sun, 01 Feb 2026 07:55:07 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmSIR-00000003L3r-1v2k
	for linux-riscv@lists.infradead.org;
	Sun, 01 Feb 2026 07:55:06 +0000
Received: from [192.168.0.111] (unknown [123.118.222.47])
	by APP-01 (Coremail) with SMTP id qwCowABnEm7FBn9pTAnlBg--.4747S2;
	Sun, 01 Feb 2026 15:54:46 +0800 (CST)
Message-ID: <d994ec8a-ff6a-4228-bfc9-2fcf9b35a460@iscas.ac.cn>
Date: Sun, 1 Feb 2026 15:54:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] riscv: dts: spacemit: Add PMIC regulators usb pcie
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>
References: <cover.1769895215.git.gaohan@iscas.ac.cn>
 <176992308158.607015.13478428408379130887@lemur>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <176992308158.607015.13478428408379130887@lemur>
X-CM-TRANSID: qwCowABnEm7FBn9pTAnlBg--.4747S2
X-Coremail-Antispam: 1UD129KBjvJXoWxurWfWrWUJrWDtFy7Gw47CFg_yoW5Ww43pa
	1F9wn3Kr1Dtrn7C3s2v3WxXFyS9w4kWF98Xr98Wr1kZa1rXayxtrySka15ua4UCryrCw4j
	qrZFkr93CF9xAa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjfUonmRUUUUU
X-Originating-IP: [123.118.222.47]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_235504_193888_C2054C5C 
X-CRM114-Status: GOOD (  20.76  )
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

T24gMi8xLzI2IDEzOjE4LCBLb25zdGFudGluIFJ5YWJpdHNldiB3cm90ZToKPiBPbiBTdW4sIDAx
IEZlYiAyMDI2IDA1OjM4OjA3ICswODAwLCBIYW4gR2FvIDxnYW9oYW5AaXNjYXMuYWMuY24+IHdy
b3RlOgo+PiBUaGlzIHBhdGNoIHNlcmllcyBlbmFibGVzIHRoZSBQTUlDLCB2b2x0YWdlIHJlZ3Vs
YXRvcnMsIHVzYiBhbmQgcGNpZQo+PiBmb3IgdGhlIE9yYW5nZVBpIHJ2MiBib2FyZC4KPiBIaToK
Pgo+IFRoYW5rIHlvdSBmb3Igc2VuZGluZyB0aGlzIGluLiBJIGFtIHdvcmtpbmcgb24gImI0IHJl
dmlldyIgZnVuY3Rpb25hbGl0eSAKPiBhbmQgSSBhbSB1c2luZyBhcmJpdHJhcnkgc2VyaWVzIHRv
IHBlcmZvcm0gYWdlbnQtYXNzaXN0ZWQgcmV2aWV3cyB0byAKPiBmaW5kIGJ1Z3MgaW4gdGhlIHBy
b2Nlc3MuCj4KPiBUaGlzIHJldmlldyB3YXMgZG9uZSBieSBDbGF1ZGUgT3B1cyA0LjUuIEkgZG8g
bm90IGtub3cgZW5vdWdoIGFib3V0IHRoZSAKPiBzdWJzeXN0ZW0gdG8gbWFrZSBhbnkganVkZ21l
bnQgYWJvdXQgdGhlIHF1YWxpdHkgb2YgdGhlc2UgcmV2aWV3cywgYnV0IAo+IHRoZXkgbG9vayB2
YWxpZCBlbm91Z2guCgpJJ20gbm90IHN1cmUgaWYgeW91IHNlZSB0aGlzLCBidXQgeW91ciBib3Qg
Z2F2ZSB0d28gY29udHJhZGljdG9yeQpyZWNvbW1lbmRhdGlvbnMuCgpPbiBwYXRjaCAzIGl0IHNh
eXM6Cgo+IFRoaXMgdmluLXN1cHBseSBpcyByZXBsYWNlZCBieSBwZXItcmFpbCBzdXBwbGllcyAo
dmluMS1zdXBwbHkgdGhyb3VnaAo+IHZpbjYtc3VwcGx5LCBhbGRvaW4tc3VwcGx5LCBkbGRvaW4x
LXN1cHBseSwgZGxkb2luMi1zdXBwbHkpIGluIHBhdGNoCj4gNS83LiAgQ29uc2lkZXIgdXNpbmcg
dGhlIGZpbmFsIHN1cHBseSBwcm9wZXJ0aWVzIGhlcmUgZGlyZWN0bHkgdG8gYXZvaWQKPiBhbiBp
bnRlcm1lZGlhdGUgc3RhdGUgdGhhdCBpcyBpbW1lZGlhdGVseSBzdXBlcnNlZGVkLgpXaGVyZWFz
IG9uIHBhdGNoIDUgaXQgc2F5cwoKPiBUaGVzZSBwZXItcmFpbCBzdXBwbHkgcHJvcGVydGllcyAo
dmluMS1zdXBwbHkgdGhyb3VnaCBkbGRvaW4yLXN1cHBseSkKPiBhcmUgbm90IGRlY2xhcmVkIGlu
IHRoZSBzcGFjZW1pdCxwMS55YW1sIGJpbmRpbmcsIHdoaWNoIG9ubHkgaGFzCj4gdmluLXN1cHBs
eS4gIFdpdGggdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZSBvbiB0aGUgUE1JQyBub2RlLCB0
aGVzZQo+IHdpbGwgY2F1c2UgZHRic19jaGVjayBmYWlsdXJlcy4gIFRoZSBiaW5kaW5nIG5lZWRz
IHRvIGJlIHVwZGF0ZWQgdG8KPiBtYXRjaCwgb3IgdGhlc2Ugc2hvdWxkIHJlbWFpbiBhcyB0aGUg
c2luZ2xlIHZpbi1zdXBwbHkuCiJVc2UgdmluMS1zdXBwbHkgdGhyb3VnaCBkbGRvaW4yLXN1cHBs
eSwgbm90IHZpbi1zdXBwbHkiIGFuZCAidXNlCnZpbi1zdXBwbHkgb25seSwgbm90IHZpbjEtc3Vw
cGx5IGV0YyIgY2FuJ3QgYm90aCBiZSBjb3JyZWN0LCBzbwpvYnZpb3VzbHkgc29tZXRoaW5nIHdl
aXJkIGlzIGdvaW5nIG9uLgoKU28gd2hhdCBvbiBlYXJ0aCBpcyBnb2luZyBvbj8gR3JhbnRlZCwg
SGFuIGNvdWxkIGhhdmUgZGVzY3JpYmVkIGl0CmJldHRlciBpbiBoaXMgY292ZXIgbGV0dGVyLCBi
dXQgdGhlcmUncyBhIHByb3Bvc2VkIHVwZGF0ZSB0byB0aGUKc3BhY2VtaXQscDEgYmluZGluZ3Mg
WzFdIHRoYXQgd291bGQgaGF2ZSBkZXByZWNhdGVkIHZpbi1zdXBwbHkgYW5kCmFsbG93ZWQgdmlu
MS1zdXBwbHkgZXRjLiBTbyB0aGVyZSdzIGEgZGVwZW5kZW5jeSBpbiB0aGlzIHNlcmllcyBvZgpz
b21ldGhpbmcgbGlrZToKCiAgICBwYXRjaCAxLDIgLT4gcGF0Y2ggMyAtPiBiaW5kaW5ncyB1cGRh
dGUgWzFdIC0+IHBhdGNoIDUKCklmL3doZW4gdGhlIGJpbmRpbmdzIHVwZGF0ZSBpcyBhY2NlcHRl
ZCwgcGF0Y2ggNSBjYW4gYmUgYWNjZXB0ZWQgaW50bwp0aGUgRFRTIHRyZWUuIFVudGlsIHRoZW4s
IHBhdGNoIDUgc2hvdWxkIGJlIHdpdGhoZWxkLgoKVGhpcyBpc24ndCBvYnZpb3VzIGZyb20gdGhl
IHBhdGNoIGl0c2VsZiwgYnV0IHN0aWxsLCB0aGUgdHdvCnJlY29tbWVuZGF0aW9ucyBhcmUgY29u
dHJhZGljdG9yeSBvbiB0aGVpciBvd24sIGFuZCBtYWtlIGR0YnNfY2hlY2sKKG1lbnRpb25lZCBp
biB0aGUgcGF0Y2ggNSBjb21tZW50ISkgd291bGQgaGF2ZSBjYXVnaHQgdGhlIHByb2JsZW0gd2l0
aAp0aGUgcGF0Y2ggMyBjb21tZW50LsKgCgo+IEhvcGVmdWxseSwgdGhlc2Ugd2VyZSB1c2VmdWwu
IElmIG5vdCwgSSBhbSBzb3JyeSBmb3Igd2FzdGluZyB5b3VyIHRpbWUuCgpJIGFja25vd2xlZGdl
IHRoYXQgdGhpcyBpcyBhIHNhbXBsZSBzaXplIG9mIDEsIGJ1dCB0aGlzIGlzIG5vdCBtYWtpbmcg
bWUKZmVlbCBpbmNsaW5lZCB0byB0cnVzdCB0aGUgZnV0dXJlIG9mIHdoYXRldmVyICJhZ2VudC1h
c3Npc3RlZCByZXZpZXciIGlzCmdvaW5nIHRvIGJlIGhhcHBlbmluZy4gV2hhdCBnb29kIGlzIGFu
ICJhZ2VudCIgaWYgaXQga25vd3MgYWJvdXQgbWFrZQpkdGJzX2NoZWNrIGJ1dCBkb2Vzbid0IGV2
ZW4gcnVuIGl0IHRvIHNlZSB3aGF0IHdvdWxkIGhhcHBlbiB0byBpdHMKc3VnZ2VzdGVkIGZpeGVz
PwoKSSBkb24ndCBrbm93IHdoYXQgeW91IGhhdmUgaW4gbWluZCBmb3IgImI0IHJldmlldyIsIGJ1
dCBJIHRoaW5rIGF0IHRoZQp2ZXJ5IGxlYXN0LCAiYjQgcmV2aWV3IiBzaG91bGQgbm90IGVuY291
cmFnZSAiSSBkbyBub3Qga25vdyBtdWNoIGFib3V0CnRoZSBzdWJzeXN0ZW0gYnV0IHRoZSBMTE0g
Y29tbWVudHMgbG9vayB2YWxpZCIgcmVwbGllcy4KClJlZ2FyZHMsClZpdmlhbiAiZHJhbWZvcmV2
ZXIiIFdhbmcKClsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvc3BhY2VtaXQvMjAyNjAxMjQt
c3BhY2VtaXQtcDEtdjItMC0yYzg2YjA2Njk0YmFAcmlzY3N0YXIuY29tLwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
