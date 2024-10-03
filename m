Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303B3CF8565
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 07:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l2z7Z1A3b006N3l2o0ppgpWKnpf4u/FpOj9KdbtjM84=; b=T+a4s4cbdOd6el
	KPkA8mcSLk7C35zIj2PLSkh5kJQJLlVlHPj+XCdAxEGaaAebMQBEzG7PPKLwJ6F5DSCzu+V1iaGFP
	QULGo44Ac/yKKcFliy5t4iIkgdGcYXPKXeCTccF8m6XPmbls5Q4lt9k2qA0hsZzCb1l6zUTuKbeW+
	IJWGSIN709BUyrI9X+FOCXoBynUiTfNRLWaiDHbaPN4fsTiFniKHizzJ6WJaO+zJMpjWnhGjvRhYC
	wvhT7s6NGC+lt0O8fPstt3dt7jKYtNbpnKul3k4ljF5dE1m5QzpMwmnXTEGNr5EJ3AWtIfw1anVYx
	bJ1+uhCBDxkP5EbuBlPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swGjx-00000008TGL-1gvn;
	Thu, 03 Oct 2024 07:59:13 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swGdE-00000008S71-0k8T
	for linux-riscv@lists.infradead.org;
	Thu, 03 Oct 2024 07:52:17 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42cb57f8b41so8432265e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Oct 2024 00:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727941934; x=1728546734; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hqwQ/zncqL+Otp1RcK1yRc78ue9IM5xaO84OK1nfH6k=;
        b=prSUuC0CyALvmfIRq9RLz2rLnfMvBP8sQ9ed1KCst7Rw3C3QOXNoVbPR1LlPTubMoj
         PXOUg9F02Qit/uAwn4/viWAn841HjoAN//drUdLrMHyjs75y/2ngReIFK5P7e66cjWOc
         M87ahNycRUsKvzooau00RDKhKNS6tWFhBzbPLiOtlDkJmbJSL0yzZmo6qmcSqKrqIHRO
         J6AzfmBzx0nHEzFebVHl+WCGy4u/LA6x2GRdSYG/WtKxYGoVpWfAYL5xRhboTFatR833
         ltui4pvyeln6M8SSjhjNdvxAifHxHYPKd1gGrMy36GPbDMa3vexqNTdIc9/Aq1WGb8Hw
         /D0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727941934; x=1728546734;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hqwQ/zncqL+Otp1RcK1yRc78ue9IM5xaO84OK1nfH6k=;
        b=iYZGSJMxNbhttlSaCWuG/Q8PM78qzRL9ejo6DXqebu6rV2kXb8osaD0MIwZfqqGlA0
         RRPcDDT6xhEfBZ0QUzvMNEQXwD1/oDiqbiUs/eGpnhewblX3VcLzA7BRkI/caurP365k
         ZfbJ9mI6Br/E39TQKV4hw1uCLGy9Td1f0OwKREkkeoHJvmEVaOAyB7JJmVP2JhBiZWj6
         kSAl0r+cOeDyHk3/EHBKXjoQYIUEjwKvLax+8uv5GELCcf4vhtt1sAtQmzKnqkBOz07c
         r0dX3Jt6XO5dMvQXdA4UU1BPYvHo+3UB5L2dBmq5OENIbKYfpUWqESPY59HgPUr2n7/n
         uKrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZoaxU+E+WyAPNoTZbs4KrWjJ/6t3Aj4gNfL1vMJYvlhpU+hdsmDdHCqjeHjRGwrU2cMapGoeh80bMRw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCcy4OwrEdMM1cPpc+K5XSFbVG6Y3Umruo1fc2nBXg8W+j781u
	s5nT+hNFSl88lN/MItKGuzI1mfM+zlMPgLXsUIt8Kft5GNb6Eyz9EmRJUY1zd5I=
X-Google-Smtp-Source: AGHT+IGXlCpjd4tKzLHHj8wH2BDGO4iTZaoBK1oTq4S+8PGiA4E1uN9byvXyd5dtX9Xfr2ZPDnjeyg==
X-Received: by 2002:a05:600c:1ca2:b0:42c:b995:20db with SMTP id 5b1f17b1804b1-42f777b1fe6mr50087975e9.5.1727941933917;
        Thu, 03 Oct 2024 00:52:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f802a02d0sm8695285e9.29.2024.10.03.00.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 00:52:13 -0700 (PDT)
Message-ID: <e10bff0c-a243-4280-925a-ceba13d0f1b4@rivosinc.com>
Date: Thu, 3 Oct 2024 09:52:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 4/5] dt-bindings: riscv: add vector sub-extension
 dependencies
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241002-defeat-pavestone-73d712895f0b@spud>
 <20241002-eagle-fresh-4b2e259e45ee@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20241002-eagle-fresh-4b2e259e45ee@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_005216_239803_12A65BEF 
X-CRM114-Status: GOOD (  13.06  )
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

CgpPbiAwMi8xMC8yMDI0IDE4OjEwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gRnJvbTogQ29ub3Ig
RG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiAKPiBTZWN0aW9uIDMzLjE4LjIu
IFp2ZSo6IFZlY3RvciBFeHRlbnNpb25zIGZvciBFbWJlZGRlZCBQcm9jZXNzb3JzCj4gaW4gWzFd
IHNheXM6Cj4gfCBUaGUgWnZlMzJmIGFuZCBadmU2NHggZXh0ZW5zaW9ucyBkZXBlbmQgb24gdGhl
IFp2ZTMyeCBleHRlbnNpb24uIFRoZSBadmU2NGYgZXh0ZW5zaW9uIGRlcGVuZHMKPiB8IG9uIHRo
ZSBadmUzMmYgYW5kIFp2ZTY0eCBleHRlbnNpb25zLiBUaGUgWnZlNjRkIGV4dGVuc2lvbiBkZXBl
bmRzIG9uIHRoZSBadmU2NGYgZXh0ZW5zaW9uCj4gCj4gfCBUaGUgWnZlMzJ4IGV4dGVuc2lvbiBk
ZXBlbmRzIG9uIHRoZSBaaWNzciBleHRlbnNpb24uIFRoZSBadmUzMmYgYW5kIFp2ZTY0ZiBleHRl
bnNpb25zIGRlcGVuZAo+IHwgdXBvbiB0aGUgRiBleHRlbnNpb24KPiAKPiB8IFRoZSBadmU2NGQg
ZXh0ZW5zaW9uIGRlcGVuZHMgdXBvbiB0aGUgRCBleHRlbnNpb24KPiAKPiBBcHBseSB0aGVzZSBy
dWxlcyB0byB0aGUgYmluZGluZ3MgdG8gaGVscCBwcmV2ZW50IGludmFsaWQgY29tYmluYXRpb25z
Lgo+IAo+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1pc2EtbWFudWFsL3Jl
bGVhc2VzL3RhZy9yaXNjdi1pc2EtcmVsZWFzZS02OThlNjRhLTIwMjQtMDktMDkgWzFdCj4gU2ln
bmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiAt
LS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIHwgNDYg
KysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKQo+
IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yv
ZXh0ZW5zaW9ucy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2
L2V4dGVuc2lvbnMueWFtbAo+IGluZGV4IDc3OWY1Y2ZhYjgwNmUuLmFiZjI1NzkxNzFjNWIgMTAw
NjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVu
c2lvbnMueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNj
di9leHRlbnNpb25zLnlhbWwKPiBAQCAtNjA1LDYgKzYwNSw1MiBAQCBwcm9wZXJ0aWVzOgo+ICAg
ICAgICAgICAgY29udGFpbnM6Cj4gICAgICAgICAgICAgIGNvbnN0OiB6Y2EKPiAgCj4gKyAgICAg
IC0gaWY6Cj4gKyAgICAgICAgICBjb250YWluczoKPiArICAgICAgICAgICAgY29uc3Q6IHp2ZTMy
eAo+ICsgICAgICAgIHRoZW46Cj4gKyAgICAgICAgICBjb250YWluczoKPiArICAgICAgICAgICAg
Y29uc3Q6IHppY3NyCj4gKwo+ICsgICAgICAtIGlmOgo+ICsgICAgICAgICAgY29udGFpbnM6Cj4g
KyAgICAgICAgICAgIGNvbnN0OiB6dmUzMmYKPiArICAgICAgICB0aGVuOgo+ICsgICAgICAgICAg
YWxsT2Y6Cj4gKyAgICAgICAgICAgIC0gY29udGFpbnM6Cj4gKyAgICAgICAgICAgICAgICBjb25z
dDogZgo+ICsgICAgICAgICAgICAtIGNvbnRhaW5zOgo+ICsgICAgICAgICAgICAgICAgY29uc3Q6
IHp2ZTMyeAo+ICsKPiArICAgICAgLSBpZjoKPiArICAgICAgICAgIGNvbnRhaW5zOgo+ICsgICAg
ICAgICAgICBjb25zdDogenZlNjR4Cj4gKyAgICAgICAgdGhlbjoKPiArICAgICAgICAgIGNvbnRh
aW5zOgo+ICsgICAgICAgICAgICBjb25zdDogenZlMzJ4Cj4gKwo+ICsgICAgICAtIGlmOgo+ICsg
ICAgICAgICAgY29udGFpbnM6Cj4gKyAgICAgICAgICAgIGNvbnN0OiB6dmU2NGYKPiArICAgICAg
ICB0aGVuOgo+ICsgICAgICAgICAgYWxsT2Y6Cj4gKyAgICAgICAgICAgIC0gY29udGFpbnM6Cj4g
KyAgICAgICAgICAgICAgICBjb25zdDogZgo+ICsgICAgICAgICAgICAtIGNvbnRhaW5zOgo+ICsg
ICAgICAgICAgICAgICAgY29uc3Q6IHp2ZTMyZgo+ICsgICAgICAgICAgICAtIGNvbnRhaW5zOgo+
ICsgICAgICAgICAgICAgICAgY29uc3Q6IHp2ZTY0eAo+ICsKPiArICAgICAgLSBpZjoKPiArICAg
ICAgICAgIGNvbnRhaW5zOgo+ICsgICAgICAgICAgICBjb25zdDogenZlNjRkCj4gKyAgICAgICAg
dGhlbjoKPiArICAgICAgICAgIGFsbE9mOgo+ICsgICAgICAgICAgICAtIGNvbnRhaW5zOgo+ICsg
ICAgICAgICAgICAgICAgY29uc3Q6IGQKPiArICAgICAgICAgICAgLSBjb250YWluczoKPiArICAg
ICAgICAgICAgICAgIGNvbnN0OiB6dmU2NGYKPiArCj4gIGFsbE9mOgo+ICAgICMgWmNmIGV4dGVu
c2lvbiBkb2VzIG5vdCBleGlzdCBvbiBydjY0Cj4gICAgLSBpZjoKCkxvb2tzIGdvb2QgdG8gbWUu
CgpSZXZpZXdlZC1ieTogQ2zDqW1lbnQgbMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgoKVGhh
bmtzLAoKQ2zDqW1lbnQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
