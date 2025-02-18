Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2273C021AA
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 17:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SF9doJ3PFr/Pk40H/VEjKscEKGL6xyL8PQTMxhmhcZw=; b=FW5kBh5npdlVtl
	KPu/yXGSam/zpw2dn/j5Jcz+IwaPt11JPJbuVtEaiz4b6Sti48xFqzr25Hr3kQSdXHYZJwow+qTDL
	d4S8Rvf+aQP8m2burOX3mCTBnR+tsUs/HutUISO9MVhunPHOO7yJbW2RIua3TECtj2nRRvL3kI38w
	XdwBlNbTW1Dbe8WxGHraxQREg2w2l6YGl10jy4+DdkwpTtFtZfi9SFH8jNHkVDfMab0LwHsSkXGDP
	iqwIjUe9wLKjKOEaXU+p0cDj0WU64oVQZwV/4zeMu99aDiHpS0jqWG3sJmZe+WN8+0O1ybT7/0Cp4
	1MEdUFLT8G8Iakgt4Mvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkRWz-00000009Cxd-1jFz;
	Tue, 18 Feb 2025 17:37:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkRWy-00000009CwW-23If
	for linux-riscv@bombadil.infradead.org;
	Tue, 18 Feb 2025 17:37:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ltKaZrI9teXpHN3rxYKOD+ITb8+l8u8RqERzWuBNvdA=; b=UQvkXezk++oRGtLEqmsw29IuI5
	0eYUWkH3zg2/BlkhiTI/8FAkKUqd4pukNb+6AXntdD3ekEh2KQyNhhnXpwaWuj14aXhYm2Vw/LlU2
	a2M0i0ADuZn1fLFt7fQNe0eyNuLNBsDDpFZV8SA2sKcLEDXtrM3tBfUvbfyBdx8nJd92km73ld8Za
	hQihkXGgADRKKL0SvSkreq9D5vhuhiEeT38YcLMIBInq/GOcYqxcvmJ98GV46YPg7N9RCvn6i7SvP
	QVGzxJBzsT0Cp/Y1RJ9arCqTMOXqFkPeJoaps2rqN6zGC4F7tXx98tCYkNhTBlS4ACJ/QqWsO9so1
	1DyO11vA==;
Received: from sender4-pp-o92.zoho.com ([136.143.188.92])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkRWv-000000021ep-0Akv
	for linux-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 17:37:11 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1739900221; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=grr+0lS3/3BYH360gRwkzLM+3E466IAaltXYKBbg79sVz19or3+IQpyGZDcAklYrm+slRNSSCYXNJ99pmPLE9ObA1Jc6dWW+sJQjp2yidnreWBuFFaELBfRPNos4zb9+cDDm3QxSRI3FwqQBxo1E+gTAOV+y7d9wQcTRMXMiK0M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739900221; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ltKaZrI9teXpHN3rxYKOD+ITb8+l8u8RqERzWuBNvdA=; 
	b=V3gCXeeN44w4wXMEB0QD46IIGQR+mXNwYx2navETCqdQoO+kYcisMlC0ofEk60S3oZDR1CyciSCEukHn/fzabVUcWsAgP8KO/pQs9Liy3hC+hXO4kXq8flp5jYaS7x8RI6xJizBsW2WpmmXO0IvRzk6E4nMVEoF7Occl5I+5dO4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739900221;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=ltKaZrI9teXpHN3rxYKOD+ITb8+l8u8RqERzWuBNvdA=;
	b=MG2IetzsDhA8+Sfnq0OUEnWCZy+ea618WnHYx4ejx49qE25J+rYyojOqnsM5hT/Y
	LD0rGafHN23Hp+vSdMV7OPcOfCqfzvlYCwu9hr6u2Q6ciu4kjTyMRloMIzjSvHgcjEq
	oQE1xMJrvwXhtunOZi1NnO5M/diXh67EhWru+nuY=
Received: by mx.zohomail.com with SMTPS id 1739900216177414.7839071442543;
	Tue, 18 Feb 2025 09:36:56 -0800 (PST)
Message-ID: <56310dfb-62c8-4508-a36f-22f383053024@zohomail.com>
Date: Wed, 19 Feb 2025 01:36:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] riscv: dts: canaan: Add clock initial support for
 K230
To: Conor Dooley <conor@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>
References: <20250217-b4-k230-clk-v4-0-5a95a3458691@zohomail.com>
 <20250217-b4-k230-clk-v4-3-5a95a3458691@zohomail.com>
 <20250218-status-friend-51fb039ab97e@spud>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <20250218-status-friend-51fb039ab97e@spud>
Feedback-ID: rr08011227cd7930601ff6ebc2a10e2da600003679650531eac0101031d31a21ff948c946d9e95b9b798b92f:zu08011227e9cf27d652ab798f48ced574000072302a8a14e3f70cb8059410b94c92a96d722e96a5a4a72a3a:rf0801122b73a3e2e54c7314499e8c1a04000091975e61466cda03089d952cd1635febf3eea1ae3ebb2c624ecb168621:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_173709_606217_D223D342 
X-CRM114-Status: GOOD (  10.37  )
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

T24gMjAyNS8yLzE5IDAxOjAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gTW9uLCBGZWIgMTcs
IDIwMjUgYXQgMTA6NDU6MThQTSArMDgwMCwgWHVrYWkgV2FuZyB3cm90ZToKPj4gKwkJc3lzY2xr
OiBjbG9jay1jb250cm9sbGVyQDkxMTAyMDAwIHsKPj4gKwkJCWNvbXBhdGlibGUgPSAiY2FuYWFu
LGsyMzAtY2xrIjsKPj4gKwkJCXJlZyA9IDwweDAgMHg5MTEwMjAwMCAweDAgMHgxMDAwPiwKPj4g
KwkJCSAgICAgIDwweDAgMHg5MTEwMDAwMCAweDAgMHgxMDAwPjsKPj4gKwkJCWNsb2NrcyA9IDwm
b3NjMjRtPjsKPj4gKwkJCWNsb2NrLW91dHB1dC1uYW1lcyA9ICJDUFUwX0FDTEsiLCAiQ1BVMF9Q
TElDIiwgIkNQVTBfTk9DX0REUkNQNCIsCj4+ICsJCQkJCSAgICAgIkNQVTBfUENMSyIsICJQTVVf
UENMSyIsICJIU19IQ0xLX0hJR0hfU1JDIiwKPj4gKwkJCQkJICAgICAiSFNfSENMS19ISUdIX0dB
VEUiLCAiSFNfSENMS19TUkMiLAo+PiArCQkJCQkgICAgICJIU19TRDBfSFNfQUhCX0dBVCIsICJI
U19TRDFfSFNfQUhCX0dBVCIsCj4+ICsJCQkJCSAgICAgIkhTX1NTSTFfSFNfQUhCX0dBIiwgIkhT
X1NTSTJfSFNfQUhCX0dBIiwKPj4gKwkJCQkJICAgICAiSFNfVVNCMF9IU19BSEJfR0EiLCAiSFNf
VVNCMV9IU19BSEJfR0EiLAo+PiArCQkJCQkgICAgICJIU19TU0kwX0FYSSIsICJIU19TU0kxIiwg
IkhTX1NTSTIiLAo+PiArCQkJCQkgICAgICJIU19RU1BJX0FYSV9TUkMiLCAiSFNfU1NJMV9BQ0xL
X0dBVEUiLAo+PiArCQkJCQkgICAgICJIU19TU0kyX0FDTEtfR0FURSIsICJIU19TRF9DQVJEX1NS
QyIsCj4+ICsJCQkJCSAgICAgIkhTX1NEMF9DQVJEX1RYIiwgIkhTX1NEMV9DQVJEX1RYIiwKPj4g
KwkJCQkJICAgICAiSFNfU0RfQVhJX1NSQyIsICJIU19TRDBfQVhJX0dBVEUiLAo+PiArCQkJCQkg
ICAgICJIU19TRDFfQVhJX0dBVEUiLCAiSFNfU0QwX0JBU0VfR0FURSIsCj4+ICsJCQkJCSAgICAg
IkhTX1NEMV9CQVNFX0dBVEUiLCAiSFNfT1NQSV9TUkMiLAo+PiArCQkJCQkgICAgICJIU19VU0Jf
UkVGXzUxTSIsICJIU19TRF9USU1FUl9TUkMiLAo+PiArCQkJCQkgICAgICJIU19TRDBfVElNRVJf
R0FURSIsICJIU19TRDFfVElNRVJfR0FURSIsCj4+ICsJCQkJCSAgICAgIkhTX1VTQjBfUkVGRVJF
TkNFIiwgIkhTX1VTQjFfUkVGRVJFTkNFIjsKPj4gKwkJCSNjbG9jay1jZWxscyA9IDwxPjsKPj4g
KwkJfTsKPiBBcG9sb2dpZXMgZm9yIG5vdCBjb21tZW50aW5nIG9uIGl0IHVudGlsIG5vdywgYnV0
IHRoaXMgcGF0Y2ggc2VlbXMgbGlrZQo+IHRoZXJlJ3Mgc29tZSBodW5rcyBtaXNzaW5nIGZyb20g
aXQuIEknZCBleHBlY3QgeW91IHRvIHJlbW92ZSB0aGUgZHVtbXkKPiAiYXBiLWNsay1jbG9jayIg
ZnJvbSB0aGUgZHRzIGFuZCByZXBsYWNlIGl0IHdpdGggYSByZWFsIG9uZSBzb3VyY2VkIGZyb20K
PiB0aGUgbmV3bHkgYWRkZWQgY2xvY2sgY29udHJvbGxlci4KClRoYW5rcyBmb3IgeW91ciB0aW1l
LgoKSSd2ZSBtb2RpZmllZCBhbGwgbm9kZXMgdGhhdCBwcmV2aW91c2x5IGRlcGVuZGVkIG9uIGFw
Yl9jbGvvvIwgYW5kIHRoZXkKYXJlIG5vdyByZWZlcmVuY2luZyB0aGUgbmV3IGNsb2NrIGNvbnRy
b2xsZXIuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
