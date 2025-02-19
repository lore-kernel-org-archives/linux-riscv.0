Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5959AC021B1
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 12:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rsmao2LJ5Abd9Zoo9Y+S0QV7bboTg9wq5jJScd9x9iA=; b=hXSC3xSMewoq4g
	drYW7ygsihICp6zIBgh6gbPrHO9LLuZHKINnp+pZzGRGkgEHj8edQiDa8O9J0MlqSLs1fW4CPXHZ5
	PWPEmaogVmGM6yrm6yjD/YwI96xlY98gsM5pe9UkheTluq3nWKWTowz7L+FNamRIXFERALg2UBhVa
	2ujqKO+k2t65v6jTV6V3DpchxKEu9ni5uGBLL53ZbNA+ZKT0agFvXIxn4UFpdt7xRYvCVc0DJxPzQ
	uYNfIfH/ZkQDd+vOZs/ZJDACW9xcCQZU2S64ld6sFtN190Gm4AS06S2m0VK1jOmTXhZOOijFqSRN7
	a320022E93Di67liQRxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjDN-0000000CfKV-1lHs;
	Wed, 19 Feb 2025 12:30:09 +0000
Received: from sender4-pp-o92.zoho.com ([136.143.188.92])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjBd-0000000CepC-3Y1B
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 12:28:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1739968099; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DwOm7E10jY6hnTNzCCj1JkCNeNmp5cnR4tsrNDv568EeiQsvOI/fwVWP12qAlSLNDuRdiPxHEtDk3H6B6MW/ilzNiWRmQIGhFujoZTZT55mLXNp02XahOi4c8BK6iWdE2E4xuWtSjAvW8o8mE+M1YkU/q2d6HsYQ4Ax2ECJLDmw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739968099; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ErJtYKOge+GvQHMf4JHdyvPeqtIfe3Bc9K5kgIMMY60=; 
	b=dQEYNF8Q1JVEneqIpP27h2QC5ssWSgcbr4h5714G6T8NGejgkDF57eGhlBLXW1k788ivzYkWx0UbNwoTRhHNsmIVKhUiBlCcwy0YyUJF3hwwLsHpvBXqhCw/ywI8ZSWPtQzJeoMKOQviz+B9jsflr3dXyudkmBRre/BLHM8ShXo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739968099;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:From:From:Subject:Subject:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=ErJtYKOge+GvQHMf4JHdyvPeqtIfe3Bc9K5kgIMMY60=;
	b=YmQwLOKGu4rY5j4baZqxOl0lYivbcDkBNS9011a2kCnyIiCAWgJfLqind0Cv8/Z2
	Yq9xFCDXXfMWWnNWsliFn/iXEpDCfzKpUo8EIo0SopzP+h2NiZGgpFhD+RiuDECJTK1
	3uWd2oJSLy9Ye3Bi0N++NeFDTA+Im0QdyhzhTedQ=
Received: by mx.zohomail.com with SMTPS id 1739968094991431.0733059111493;
	Wed, 19 Feb 2025 04:28:14 -0800 (PST)
Message-ID: <41b3863a-0b2a-4cb1-8d83-8397822ed788@zohomail.com>
Date: Wed, 19 Feb 2025 20:28:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Xukai Wang <kingxukai@zohomail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: clock: Add bindings for Canaan K230
 clock controller
To: Stephen Boyd <sboyd@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250217-b4-k230-clk-v4-0-5a95a3458691@zohomail.com>
 <20250217-b4-k230-clk-v4-1-5a95a3458691@zohomail.com>
 <c68c14422c7d27278f6fc75f285db7c7.sboyd@kernel.org>
Content-Language: en-US
In-Reply-To: <c68c14422c7d27278f6fc75f285db7c7.sboyd@kernel.org>
Feedback-ID: rr08011227ebd6254e49c7c0cdfe03935a0000a6ec7566cfabf3e694acedeb925f7105b625ce95562fa49b8b:zu08011227354929267fad4875a2f0fd7400000a59bb746f134a904ecc190f99b7fc8c6d6568ac7781fb3d72:rf0801122bf18172995ae17d7bb5eb31740000b17bd183a15457a0257c4e8f72133640fc83bda074112f4bc6c1cc9f77:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_042821_951046_21B1070D 
X-CRM114-Status: UNSURE (   9.08  )
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

T24gMjAyNS8yLzE5IDA1OjUxLCBTdGVwaGVuIEJveWQgd3JvdGU6Cj4gUXVvdGluZyBYdWthaSBX
YW5nICgyMDI1LTAyLTE3IDA2OjQ1OjE2KQo+PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
c2NoZW1hcy9jbG9jay9jYW5hYW4sazIzMC1jbGsueWFtbCMKPj4gKyRzY2hlbWE6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+PiArCj4+ICt0aXRsZTogQ2Fu
YWFuIEtlbmRyeXRlIEsyMzAgQ2xvY2sKPj4gKwo+PiArbWFpbnRhaW5lcnM6Cj4+ICsgIC0gWHVr
YWkgV2FuZyA8a2luZ3h1a2FpQHpvaG9tYWlsLmNvbT4KPiBJcyB0aGlzIG1pc3NpbmcgYSBkZXNj
cmlwdGlvbiBvZiB0aGUgZGV2aWNlPwoKQWxyaWdodC4gSGVyZSdzIHRoZSBhZGRlZCBkZXNjcmlw
dGlvbjoKClRoZSBLMjMwIGNsb2NrIGNvbnRyb2xsZXIgbWFuYWdlcyB0aGUgUExMcyBhbmQgc3lz
dGVtIGNsb2NrcyAoc3lzY2xrKSwKZ2VuZXJhdGluZyBjbG9ja3MgZm9yIGRpZmZlcmVudCBkb21h
aW5zLiBUaGUgaW50ZXJuYWwgUExMcyBhcmUgZGVyaXZlZApmcm9tIHRoZSBleHRlcm5hbCBvc2My
NE0sIGFuZCBhbGwgc3lzY2xrIHNpZ25hbHMgdXNlIGVpdGhlciB0aGUgUExMcycKZGl2aWRlcnMg
b3IgZGlyZWN0bHkgdGhlIG9zYzI0TSBzb3VyY2UuCgpOb3QgYWxsIG1hY3JvcyBkZWZpbmVkIGlu
IGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svY2FuYWFuLGsyMzAtY2xrLmgKYXJlIGF2YWlsYWJs
ZSBmb3IgdXNlIGluIGNsb2NrIGNvbnN1bWVyIG5vZGVzIHlldC4KCkRvZXMgdGhpcyBsb29rcyBh
cHByb3ByaWF0ZT8KCj4+ICsgICAgICAgIHJlZyA9IDwweDkxMTAyMDAwIDB4MTAwMD4sCj4gSXMg
dGhlcmUgYSByZWFzb24gd2h5IHRoZSBQTEwgcmFuZ2UgY29tZXMgZmlyc3Q/CkFzIEkgdGhvdWdo
dCB0aGF0IHRoZSBQTEwgaXMgdGhlIGJhc2UgZm9yIG90aGVyIHN5c3RlbSBjbG9ja3MgKHN5c2Ns
ayksCnNvIEkgcGxhY2VkIGl0IGZpcnN0Lgo+IFdoYXQncyBhdCAweDkxMTAxMDAwPyBNb3JlIGNs
ayBoYXJkd2FyZT8KClJlZ2FyZGluZyAweDkxMTAxMDAwLCB0aGVyZSBpcyBubyBjbGsgaGFyZHdh
cmUgYXQgdGhhdCBhZGRyZXNzOyBpdCBpcwpyZWxhdGVkIHRvIHRoZSBSZXNldCBNYW5hZ2VtZW50
IFVuaXQgKFJNVSkuCgpZb3UgY2FuIHJlZmVyIHRvIHRoZSBLMjMwIFRlY2huaWNhbCBSZWZlcmVu
Y2UgTWFudWFsIFsxXSBvbiBwYWdlIDExIGZvcgppdHPCoEFkZHJlc3MgU3BhY2UgbWFwcGluZy4K
ClRoYW5rcyBmb3IgeW91ciB0aW1lLgoKTGluazoKaHR0cHM6Ly9rZW5kcnl0ZS1kb3dubG9hZC5j
YW5hYW4tY3JlYXRpdmUuY29tL2RldmVsb3Blci9rMjMwL0hESy9LMjMwJUU3JUExJUFDJUU0JUJC
JUI2JUU2JTk2JTg3JUU2JUExJUEzL0syMzBfVGVjaG5pY2FsX1JlZmVyZW5jZV9NYW51YWxfVjAu
My4xXzIwMjQxMTE4LnBkZgpbMV0KCj4+ICsgICAgICAgICAgICAgIDwweDkxMTAwMDAwIDB4MTAw
MD47CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
