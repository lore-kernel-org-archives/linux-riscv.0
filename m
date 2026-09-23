Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF5FC982EA
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 06:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:From:Subject:Cc:Message-Id
	:Date:In-Reply-To:References:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RHS3JP412V4hrWJcQFGwLH8gDdInXKxgyFLKjRvAd74=; b=Ul8HHM3mm4Qjgq
	n13YCFoW0ZeFeeH+rJq96si8TyIxSX/naSKUt7M2yvHbrj0A1lKwLJT3ee65XQDM/ifOLEUjoqERu
	g5OwdzXyrYGv7fxmPFwnRA6sBEZ5ER6Jh0etIotV/0B2XQCcP0hDiItg8ERnd1oaKuEvsfS6S+hLX
	FyjA9rJLZTbSX9AwK+OHBSwoBl7Sjludmc4ttVghJXk5jKG41uTT9arDux1PfQgk9g5eDtMr2zBt6
	eavCT3HE73iBq9PwVwtGnPP8uxcNxckpPQz8fmOJ3thFQgCw/caCNZxarl090oRCOxUSvsYHdfyIQ
	pNWwcHJJf5QADlwePZow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GZq-00000007IdQ-1OLk;
	Wed, 23 Sep 2026 06:35:34 +0000
Received: from va-2-28.ptr.blmpb.com ([209.127.231.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GZm-00000007Icy-0vV7
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 06:35:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1790145323;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=ztHEw/1Esw+HMkU5DeZIN4w0wpwjtVn/TgDeHPNre28=;
 b=oEth2X2gsToIXLxZmPhc3+7xCC1hHHyNXzU5Sp/Zc2HsvlSl8I1ncrwhgcr2yAnSZFd8Fq
 Pe87rUXTN2xrN0LaO2jS01CoHgo0xBNm1FsTecMEf1Ck1c6pdUXb+V0Adk1aXYzbtNQQOZ
 Wq+xC14y5C0aXX5cNY80ePgxTtmNr1RQRMdDSNg8LhRWuvlN9mniOQngSe/EEOduUJvRof
 Lu05Fn3J5hWhi+AyJnyqiqt2lcP+n8VCSNxrpvBqXq9c7Z73FSBeGylBo3ilT6zMImGkgu
 DDdZWyKcv1H1wzEY2NwxK8O6MJXobjU4V8ZANvhdppyhImZwWP3gdrvlqwSDGA==
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
X-Lms-Return-Path: <lba+16ab37329+f73f35+lists.infradead.org+sandie.cao@deepcomputing.io>
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io> <20260922110450.3426070-1-sandie.cao@deepcomputing.io>
	<DLMC741RLFU5.3FF1DL7YEIFK9@linux.spacemit.com>
In-Reply-To: <DLMC741RLFU5.3FF1DL7YEIFK9@linux.spacemit.com>
Date: Wed, 23 Sep 2026 14:35:20 +0800
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.2bcc8e57.b8bf.421b.9230.3eea00252952@feishu.cn>
Cc: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_233530_956149_76CC9DAC 
X-CRM114-Status: GOOD (  11.10  )
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

SGksIFRyb3k6Cgo+IEZyb206ICJUcm95IE1pdGNoZWxsIjx0cm95Lm1pdGNoZWxsQGxpbnV4LnNw
YWNlbWl0LmNvbT4KPiBEYXRlOsKgIFdlZCwgU2VwIDIzLCAyMDI2LCAxMDoyMwo+IE9uIFR1ZSwg
U2VwIDIyLCAyMDI2IGF0IDA3OjA0OjUwUE0gKzA4MDAsIFNhbmRpZSBDYW8gd3JvdGU6Cj4gPiBA
QCAtMTg0LDYgKzE4NSwyNCBAQCAmY29tYm9waHkgewo+ID4gWy4uLl0KPiA+ICsmc2RoY2kwIHsK
PiA+ICsgwqAgwqAgwqAgwqBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiLCJ1aHMiOwo+ID4gKyDC
oCDCoCDCoCDCoHBpbmN0cmwtMCA9IDwmbW1jMV9jZmc+Owo+ID4gKyDCoCDCoCDCoCDCoHBpbmN0
cmwtMSA9IDwmbW1jMV91aHNfY2ZnPjsKPiA+ICsgwqAgwqAgwqAgwqBidXMtd2lkdGggPSA8ND47
Cj4gPiArIMKgIMKgIMKgIMKgY2QtZ3Bpb3MgPSA8JmdwaW8gSzNfR1BJTyg4OCkgR1BJT19BQ1RJ
VkVfTE9XPjsKPsKgCj4gRG9lcyBHUElPODggaGF2ZSBhbiBleHRlcm5hbCBwdWxsLXVwPyBUaGUg
U0RLIERUUyBbMV0gYWxzbyBpbmNsdWRlcwo+IG1tYzFfY2RfY2ZnIGluIGJvdGggcGluY3RybCBz
dGF0ZXMsIHdpdGggYSBwdWxsLXVwIGFuZCAzLjMgViBjb25maWd1cmF0aW9uLgo+IE5laXRoZXIg
bW1jMV9jZmcgbm9yIG1tYzFfdWhzX2NmZyBjb3ZlcnMgdGhpcyBwaW4uIElzIHRoYXQgY29uZmln
dXJhdGlvbgo+IHVubmVjZXNzYXJ5IG9uIHRoaXMgYm9hcmQ/Cj7CoAoKRk1MMTNWMDUgU0QgY2Fy
ZCBzbG90IGlzIGluc2lkZSB0aGUgYm9hcmQsIGl0IGRvZXNuJ3QgbmVlZCBjZC1ncGlvLCBGTUwx
M1YwNSBLZWVwcyBHUElPODggdG8gbG93LCBUaGVuIFNEIGNhcmQgaXMgYWx3YXlzIG9uIGZvciBT
RCBDYXJkIGRyaXZlci4KCldlIGNoZWNrIHRoZSB2bW1jLXN1cHBseSBpcyBwM3YzLsKgV2UgaGF2
ZSB0aGUgc2FtZSBTREsgRFRTIGNvbmZpZyB3aXRoIGszX2NvbTI2MFsxXSAsIHNvLCB0aGlzIHBh
dGNoIGZvbGxvd3MgdGhlIFNEIGNhcmQgcGF0Y2ggb2YgazNfY29tMjYwIGR0c1syXS4KwqAKSWYg
dGhpcyBpcyBub3QgY29ycmVjdCwgd2Ugd2lsbCBjaGFuZ2UgaXQuCgpMaW5rOiBodHRwczovL2dp
dGh1Yi5jb20vc3BhY2VtaXQtY29tL2xpbnV4LTYuMTgvYmxvYi9rMy1ici12MS4wLnkvYXJjaC9y
aXNjdi9ib290L2R0cy9zcGFjZW1pdC9rM19jb20yNjAuZHRzaSBbMV0KaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjYwNjEwLTA3LWszLWVuYWJsZS1zZC12MS0xLTE5NmFlMjliZDA5MUBr
ZXJuZWwub3JnLyBbMl0KCkJlc3QgcmVnYXJkcwpTYW5kaWUKCj4gPiArIMKgIMKgIMKgIMKgbm8t
bW1jOwo+ID4gKyDCoCDCoCDCoCDCoG5vLXNkaW87Cj4gPiArIMKgIMKgIMKgIMKgZGlzYWJsZS13
cDsKPiA+ICsgwqAgwqAgwqAgwqBjYXAtc2QtaGlnaHNwZWVkOwo+ID4gKyDCoCDCoCDCoCDCoHZt
bWMtc3VwcGx5ID0gPCZhbGRvND47Cj4gPiArIMKgIMKgIMKgIMKgdnFtbWMtc3VwcGx5ID0gPCZh
bGRvMT47Cj7CoAo+IENvdWxkIHlvdSBjb25maXJtIHdoaWNoIHJhaWwgc3VwcGxpZXMgdGhlIGNh
cmQncyBWREQ/IFRoZSBTREsgRFRTIFsxXQo+IHVzZXMgcDN2MyBmb3Igdm1tYyByYXRoZXIgdGhh
biBhbGRvNC4gRG9lcyB0aGF0IFJQTUkgcmVndWxhdG9yIG1hcCB0bwo+IEFMRE80LCBvciBpcyB0
aGUgY2FyZCBwb3dlcmVkIGJ5IGEgZGlmZmVyZW50IHJhaWw/Cj7CoAo+IExpbms6IGh0dHBzOi8v
Z2l0aHViLmNvbS9zcGFjZW1pdC1jb20vbGludXgtNi4xOC9ibG9iL2szLWJyLXYxLjAueS9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2szLWRlZXBjb21wdXRpbmctZm1sMTN2MDUuZHRzIFsx
XQo+wqAKPiAtLcKgCj4gVHJveSBNaXRjaGVsbAo+wqAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
