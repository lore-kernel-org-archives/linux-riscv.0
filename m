Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148D4C83F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 05:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eg4lxGNHIrwRSeMgOlbwtatB3vk1mxf0CyAuncFm/wc=; b=gokkBlz2noTrZ+
	+KoyTzfeoUPSEBa0rkydiKkgfbAmtOj3OOYhB4jeAz9jFOJkn7GTk8aFz9c7zoHwNuPiTDpT7Y6iq
	YOR8/LxbFVzsVMXCZFig0pGlf7p1c7cpMTAM3rHqS9KJJYYLnrB3ivKtMSYWzryC4Oc5nStNa9eAl
	MsLtJpbMrcEZY3V6W1+i9JgXkyOGzha7kcckHxDMZE5VzMVbNWta+XVgkhXyOZgyIbRUOQmWJpCp0
	e62vu44MbFJObVTR9y6HkjU5PGo7/sP+Mu9UfHR88ZapQidNDE0G9NSAYZKUV9Qke7uAxO/mkCwxh
	XiX/TeV40XDQhBSyyQ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucHdA-00000009FDy-2yO3;
	Thu, 17 Jul 2025 05:58:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucHce-00000009F8x-30CN
	for linux-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 05:57:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C980CA5735F;
	Thu, 17 Jul 2025 05:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFE41C4CEE3;
	Thu, 17 Jul 2025 05:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752731855;
	bh=i+OYdUkzIJ+AokfBhPSqQ383cgIi3Nc46oS6KmIomUc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QzQNGPgxrWisoas4UiKWJ+SQc43/UbFnhh64wImY0/frHWCs3kfshTqOF5lcf20PQ
	 OMR0N89h5OW4RJmGCXtUPB5RaDXXjuZ26oHAJptytCCa4PHzT2sKzm5LYwUeyhYUzu
	 jMbVtlfSI4jBnIG+oO1bSOWD9/vZEO50YB80oaOhDyMYJ8RWBXxw5Qeqjm1zwVXGPN
	 Vj2ivN79F6dvPmn9Go6Py0y71gW/92ilydfQ1CFeacRyzsO2Ofzhqt5pek4SJDrG07
	 sXNMN724JJfe19hc9QYfxjTTB+M4fzZc6ycGcbejGblHnNnihmrY+YfqHQX6uexYHa
	 GsKznhW3oErFA==
Message-ID: <a1c9e261-9889-4652-abd0-fc46b53594cb@kernel.org>
Date: Thu, 17 Jul 2025 07:57:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: Add the device tree of the XiangShan
 platform's nanhu soc
To: =?UTF-8?B?56em5bCR6Z2S?= <qinshaoqing@bosc.ac.cn>,
 "paul.walmsley" <paul.walmsley@sifive.com>, palmer <palmer@dabbelt.com>,
 aou <aou@eecs.berkeley.edu>, robh <robh@kernel.org>,
 krzk+dt <krzk+dt@kernel.org>, conor+dt <conor+dt@kernel.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, =?UTF-8?B?546L54S2?=
 <wangran@bosc.ac.cn>
References: <20250103063040.10817-1-qshaoqing926@163.com>
 <2c75df56-fb55-4dd3-ac63-518233e61c8f.qinshaoqing@bosc.ac.cn>
 <17ab3ebb-2f46-4c61-a194-57d72f382517.qinshaoqing@bosc.ac.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <17ab3ebb-2f46-4c61-a194-57d72f382517.qinshaoqing@bosc.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_225736_894520_78B2BC88 
X-CRM114-Status: GOOD (  15.11  )
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

T24gMTcvMDcvMjAyNSAwNDozNiwg56em5bCR6Z2SIHdyb3RlOgo+IAo+IAo+IFRoaXMgcGF0Y2gg
YWRkcyB0aGUgZGV2aWNlIHRyZWUgc3VwcG9ydCBmb3IgdGhlIFhpYW5nU2hhbiBwbGF0Zm9ybSdz
IG5hbmh1IHNvYwoKUGxlYXNlIHJlYWQgc3VibWl0dGluZyBwYXRjaGVzIGRvY3VtZW50LiBJdCB3
aWxsIGFsc28gdGVsbCB5b3Ugd2hpY2gKdG9vbHMgeW91IG11c3QgYWxzbyBydW4uCgo+IAo+IFNp
Z25lZC1vZmYtYnk6IHFpbnNoYW9xaW5nIDxxaW5zaGFvcWluZ0Bib3NjLmFjLmNuPgo+IC0tLQo+
ICBhcmNoL3Jpc2N2L0tjb25maWcuc29jcyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8
IMKgIDUgKwo+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL01ha2VmaWxlwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgfCDCoCAxICsKPiAgYXJjaC9yaXNjdi9ib290L2R0cy94aWFuZ3NoYW4vTWFrZWZpbGXC
oCDCoCDCoCB8IMKgIDIgKwo+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3hpYW5nc2hhbi9uYW5odS12
M2EuZHRzIHwgMjI2ICsrKysrKysrKysrKysrKysrKysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgMjM0
IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMv
eGlhbmdzaGFuL01ha2VmaWxlCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3hpYW5nc2hhbi9uYW5odS12M2EuZHRzCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
S2NvbmZpZy5zb2NzIGIvYXJjaC9yaXNjdi9LY29uZmlnLnNvY3MKPiBpbmRleCBmNTFiYjI0YmM4
NGMuLjg5YzgwZmQ0OTNmYiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcuc29jcwo+
ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZy5zb2NzCj4gQEAgLTgwLDQgKzgwLDkgQEAgY29uZmln
IFNPQ19DQU5BQU5fSzIxMAo+IMKgIGhlbHAKPiDCoCDCoCBUaGlzIGVuYWJsZXMgc3VwcG9ydCBm
b3IgQ2FuYWFuIEtlbmRyeXRlIEsyMTAgU29DIHBsYXRmb3JtIGhhcmR3YXJlLgo+IAo+ICtjb25m
aWcgU09DX1hJQU5HU0hBTgo+ICvCoCDCoCDCoCDCoCBib29sICJYaWFuZ1NoYW4gU29DcyIKPiAr
wqAgwqAgwqAgwqAgaGVscAo+ICvCoCDCoCDCoCDCoCDCoCBUaGlzIGVuYWJsZXMgc3VwcG9ydCBm
b3IgWGlhbmdTaGFuIFNvQyBwbGF0Zm9ybSBoYXJkd2FyZQo+ICsKPiAgZW5kbWVudSAjICJTb0Mg
c2VsZWN0aW9uIgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL01ha2VmaWxlIGIv
YXJjaC9yaXNjdi9ib290L2R0cy9NYWtlZmlsZQo+IGluZGV4IGZkYWUwNWJiZjU1Ni4uNDNhNzlj
YzlkZDdjIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvTWFrZWZpbGUKPiArKysg
Yi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL01ha2VmaWxlCj4gQEAgLTcsNSArNyw2IEBAIHN1YmRpci15
ICs9IHNpZml2ZQo+ICBzdWJkaXIteSArPSBzb3BoZ28KPiAgc3ViZGlyLXkgKz0gc3RhcmZpdmUK
PiAgc3ViZGlyLXkgKz0gdGhlYWQKPiArc3ViZGlyLXkgKz0geGlhbmdzaGFuCj4gCj4gIG9iai0k
KENPTkZJR19CVUlMVElOX0RUQikgOj0gJChhZGRzdWZmaXggLmR0Yi5vLCAkKENPTkZJR19CVUlM
VElOX0RUQl9TT1VSQ0UpKQo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3hpYW5n
c2hhbi9NYWtlZmlsZSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMveGlhbmdzaGFuL01ha2VmaWxlCj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjQxZTU4NTQ5MGE5Nwo+
IC0tLSAvZGV2L251bGwKPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3hpYW5nc2hhbi9NYWtl
ZmlsZQo+IEBAIC0wLDAgKzEsMiBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wCj4gK2R0Yi0kKENPTkZJR19TT0NfWElBTkdTSEFOKSArPSBuYW5odS12M2EuZHRiCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMveGlhbmdzaGFuL25hbmh1LXYzYS5kdHMgYi9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3hpYW5nc2hhbi9uYW5odS12M2EuZHRzCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjU2MGRlN2M3ZjIyZQo+IC0tLSAvZGV2L251
bGwKPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3hpYW5nc2hhbi9uYW5odS12M2EuZHRzCj4g
QEAgLTAsMCArMSwyMjYgQEAKPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4w
IE9SIE1JVCkKPiArLyogQ29weXJpZ2h0IChjKSAyMDI0LTIwMjUgQk9TQyAqLwo+ICsKPiArL2R0
cy12MS87Cj4gKwo+ICsvIHsKPiArICNhZGRyZXNzLWNlbGxzID0gPDI+Owo+ICsgI3NpemUtY2Vs
bHMgPSA8Mj47Cj4gKyBjb21wYXRpYmxlID0gImJvc2MsbmFuaHUtdjNhIjsKCgpQbGVhc2UgZm9s
bG93IGtlcm5lbCBhbmQgRFRTIGNvZGluZyBzdHlsZS4KCk9uY2UgeW91IGZpeCBhbGwgdGhlIHdh
cm5pbmdzLCBwbGVhc2UgcGFzdGUgZHRic19jaGVjayBXPTEgcmVwb3J0LgoKQmVzdCByZWdhcmRz
LApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
