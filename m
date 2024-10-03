Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E70CF8567
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 07:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E0hFQTjQ6bFCPQ8Fvjwoz0EkrAidq6fUqaIFUW5d4Sg=; b=iEDz2AYhgplF8X
	tk5U/bsko2z6LXy/X7wSbai8QqgkEOsBsReIM8ZoaSam9YdeVIygs6QmX4A+aMf2SBqVrOOPO37gW
	4C54gUiH59aCkq5mjnOpPTxj8eV0Lzj5qL7TmX/bjk8JiVtmxrv3Lex+uTySP0QYV4ki7c2iEwQtu
	334SmuQPPAgbsRyidrSPhGS3/NmEIckSJ2ZSy0zvF7wFSKxzMAtxFf9yokqiULnYAduMwjp36+E1o
	uy5MlI3fDxkzFjmTAJW+f6qJXEiLVYyz+t/Wk4WsKK55xCOo2Ita9f1IRAY9poey3VSpycqNPlYdY
	nYOZPL6v3YBHWm0A4b1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swGju-00000008TFd-3btk;
	Thu, 03 Oct 2024 07:59:10 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swGaw-00000008RSU-3eB9
	for linux-riscv@lists.infradead.org;
	Thu, 03 Oct 2024 07:49:56 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-37cdbdbbb1cso372636f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 03 Oct 2024 00:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727941793; x=1728546593; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u1YwTr9h8LtbzMOl0TrTDXIEzjgLgPj2qUkc0qSTvso=;
        b=DU76SR1mJxPwOLQeXO4UYDEXVBfm+wPG/jzF325rYGhsO5Rkz6KPagRrnSAj2U1udk
         5Cf58bnIrkLO+8NI+y1v1j01L/z4ISE4aaa7zAXMY0vLypDmSu8+RmxVhdXr+d/DM6Yg
         ZywtgAggVn9Fb2cXDkhc5lanPIdx4v5QtBupN4+wrkO8WxThCVcY3QqgTzMxMYOQULHe
         uDg6YtX6a1VDcsW2vIgNhMTYE5MSUCiIWQfU/sbC4p8RnNpc1xTwgzZXhKH6ga2BeIiK
         zLYWHLphKzdSHaXCGCXA7HOX16eD47whxi37rUj5e9dFCJxHhxdow+CewikThotPnM9x
         95WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727941793; x=1728546593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u1YwTr9h8LtbzMOl0TrTDXIEzjgLgPj2qUkc0qSTvso=;
        b=GY220SaCaKRQGb8sYhWMgqyz1wNJJfGVDKw1j+ATxUJXZje4SXeLSnvaCQtzvAS4jm
         8FMhTp0LiTVVUCh9u3vPoZSMCRyCEbmGJ7oejJIwcG6X/siQjh6RJV9yXpGDbJ9ibLXS
         PSHefZlNFhKXi4q+eD51r9m0yFiDNRhxMVrrMzDP6nWHpsg3cjmrV3/0qDjCThzwBolp
         AxGNQLqFvOEFOuVpuLdVzqvDWaN/3eh/LNdz71u9ngeBVYynjdaxqi5yMT5gfqFTJCWZ
         bgvIvqGgzyg4/1nGkoFWt5hx0Yf1QMuvLFHUGPg8RyokwC0XIQV611zU5L5Jlyql8H2i
         XoCw==
X-Forwarded-Encrypted: i=1; AJvYcCWm97TVzcaZFyifo33VtbVTu28w9G9SBqrDNulB0qQ3Fxk/IVlKZz4eGLsJn77D4RBe7OGSWvc9OEJImQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxyHCVI39X2BwR2xehrPZ5iZvD50Dqfsvils8bYjsNW2nzMt/TX
	m7FBSYM5Gx4taiDiT/LeUaPCKgbf4vVrJu+3RXWHZNx0jFoqFm3JrCRlpWQ1wlg=
X-Google-Smtp-Source: AGHT+IGLcxSI9tvWu0h1tUW6RfGSAAByFwWwvbEAOy5Bn8EDCgNaJ6vYB5LX4/TpSeyYiKyDH03HuA==
X-Received: by 2002:a5d:504e:0:b0:37c:d26c:8dc4 with SMTP id ffacd0b85a97d-37cfba03ea9mr4035595f8f.36.1727941792805;
        Thu, 03 Oct 2024 00:49:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d0823ed00sm657222f8f.49.2024.10.03.00.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 00:49:52 -0700 (PDT)
Message-ID: <6b735be2-93d2-4cc2-b690-438f6e71cf0b@rivosinc.com>
Date: Thu, 3 Oct 2024 09:49:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 2/5] RISC-V: add f & d extension validation checks
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241002-defeat-pavestone-73d712895f0b@spud>
 <20241002-stuffed-trance-1323386dd80b@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20241002-stuffed-trance-1323386dd80b@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_004954_932367_86615A47 
X-CRM114-Status: GOOD (  24.25  )
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
RG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiAKPiBVc2luZyBDbGVtZW50J3Mg
bmV3IHZhbGlkYXRpb24gY2FsbGJhY2tzLCBzdXBwb3J0IGNoZWNraW5nIHRoYXQKPiBkZXBlbmRl
bmNpZXMgaGF2ZSBiZWVuIHNhdGlzZmllZCBmb3IgdGhlIGZsb2F0aW5nIHBvaW50IGV4dGVuc2lv
bnMuCj4gCj4gVGhlIGNoZWNrIGZvciAiZCIgbWlnaHQgYmUgc2xpZ2h0bHkgY29uZnVzaW5nbHkg
c2hvcnRlciB0aGFuIHRoYXQgb2YgImYiLAo+IGRlc3BpdGUgImQiIGRlcGVuZGluZyBvbiAiZiIu
IFRoaXMgaXMgYmVjYXVzZSB0aGUgcmVxdWlyZW1lbnQgdGhhdCBhCj4gaGFydCBzdXBwb3J0aW5n
IGRvdWJsZSBwcmVjaXNpb24gbXVzdCBhbHNvIHN1cHBvcnQgc2luZ2xlIHByZWNpc2lvbiwKPiBz
aG91bGQgYmUgdmFsaWRhdGVkIGJ5IGR0LWJpbmRpbmdzIGV0Yywgbm90IHRoZSBrZXJuZWwgYnV0
IGxhY2sgb2YKPiBzdXBwb3J0IGZvciBzaW5nbGUgcHJlY2lzaW9uIG9ubHkgaXMgYSBsaW1pdGF0
aW9uIG9mIHRoZSBrZXJuZWwuCj4gCj4gU2luY2UgdmVjdG9yIHdpbGwgbm93IGJlIGRpc2FibGVk
IHByb2FjdGl2ZWx5LCB0aGVyZSdzIG5vIG5lZWQgdG8gY2xlYXIKPiB0aGUgYml0IGluIGVsZl9o
d2NhcCBpbiByaXNjdl9maWxsX2h3Y2FwKCkgYW55IGxvbmdlci4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IC0tLQo+ICBhcmNo
L3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCAzNiArKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIv
YXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gaW5kZXggODRhMmFkMjU4MWNiMC4uYjhh
MjJlZTc2YzJlZiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMK
PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiBAQCAtMTAxLDYgKzEwMSwy
OSBAQCBzdGF0aWMgaW50IHJpc2N2X2V4dF96aWNib3pfdmFsaWRhdGUoY29uc3Qgc3RydWN0IHJp
c2N2X2lzYV9leHRfZGF0YSAqZGF0YSwKPiAgCXJldHVybiAwOwo+ICB9Cj4gIAo+ICtzdGF0aWMg
aW50IHJpc2N2X2V4dF9mX3ZhbGlkYXRlKGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEg
KmRhdGEsCj4gKwkJCQljb25zdCB1bnNpZ25lZCBsb25nICppc2FfYml0bWFwKQo+ICt7Cj4gKwlp
ZiAoIV9fcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUoaXNhX2JpdG1hcCwgUklTQ1ZfSVNB
X0VYVF9kKSkgewo+ICsJCXByX3dhcm5fb25jZSgiVGhpcyBrZXJuZWwgZG9lcyBub3Qgc3VwcG9y
dCBzeXN0ZW1zIHdpdGggRiBidXQgbm90IERcbiIpOwo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsJ
fQo+ICsKPiArCWlmIChJU19FTkFCTEVEKENPTkZJR19GUFUpKQo+ICsJCXJldHVybiAtRUlOVkFM
OwoKSGV5IENvbm9yLAoKU2hvdWxkbid0IHRoaXMgYmUgIUlTX0VOQUJMRUQoQ09ORklHX0ZQVSkp
ID8gSSBtZWFuLCBpZiB0aGUgZiBleHRlbnNpb24KaXMgZW5hYmxlZCBidXQgbm90IENPTkZJR19G
UFUsIHRoZW4gZGlzYWJsZSBpdC4KCkNsw6ltZW50Cgo+ICsKPiArCXJldHVybiAwOwo+ICt9Cj4g
Kwo+ICtzdGF0aWMgaW50IHJpc2N2X2V4dF9kX3ZhbGlkYXRlKGNvbnN0IHN0cnVjdCByaXNjdl9p
c2FfZXh0X2RhdGEgKmRhdGEsCj4gKwkJCQljb25zdCB1bnNpZ25lZCBsb25nICppc2FfYml0bWFw
KQo+ICt7Cj4gKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfRlBVKSkKPiArCQlyZXR1cm4gLUVJTlZB
TDsKPiArCj4gKwlyZXR1cm4gMDsKPiArfQo+ICsKPiAgc3RhdGljIGludCByaXNjdl9leHRfdmVj
dG9yX3hfdmFsaWRhdGUoY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSAqZGF0YSwKPiAg
CQkJCSAgICAgY29uc3QgdW5zaWduZWQgbG9uZyAqaXNhX2JpdG1hcCkKPiAgewo+IEBAIC0zNTEs
OCArMzc0LDggQEAgY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfZXh0
W10gPSB7Cj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQShpLCBSSVNDVl9JU0FfRVhUX2kpLAo+ICAJ
X19SSVNDVl9JU0FfRVhUX0RBVEEobSwgUklTQ1ZfSVNBX0VYVF9tKSwKPiAgCV9fUklTQ1ZfSVNB
X0VYVF9EQVRBKGEsIFJJU0NWX0lTQV9FWFRfYSksCj4gLQlfX1JJU0NWX0lTQV9FWFRfREFUQShm
LCBSSVNDVl9JU0FfRVhUX2YpLAo+IC0JX19SSVNDVl9JU0FfRVhUX0RBVEEoZCwgUklTQ1ZfSVNB
X0VYVF9kKSwKPiArCV9fUklTQ1ZfSVNBX0VYVF9EQVRBX1ZBTElEQVRFKGYsIFJJU0NWX0lTQV9F
WFRfZiwgcmlzY3ZfZXh0X2ZfdmFsaWRhdGUpLAo+ICsJX19SSVNDVl9JU0FfRVhUX0RBVEFfVkFM
SURBVEUoZCwgUklTQ1ZfSVNBX0VYVF9kLCByaXNjdl9leHRfZF92YWxpZGF0ZSksCj4gIAlfX1JJ
U0NWX0lTQV9FWFRfREFUQShxLCBSSVNDVl9JU0FfRVhUX3EpLAo+ICAJX19SSVNDVl9JU0FfRVhU
X1NVUEVSU0VUKGMsIFJJU0NWX0lTQV9FWFRfYywgcmlzY3ZfY19leHRzKSwKPiAgCV9fUklTQ1Zf
SVNBX0VYVF9TVVBFUlNFVF9WQUxJREFURSh2LCBSSVNDVl9JU0FfRVhUX3YsIHJpc2N2X3ZfZXh0
cywgcmlzY3ZfZXh0X3ZlY3Rvcl9mbG9hdF92YWxpZGF0ZSksCj4gQEAgLTkxMiwxNSArOTM1LDYg
QEAgdm9pZCBfX2luaXQgcmlzY3ZfZmlsbF9od2NhcCh2b2lkKQo+ICAJCX0KPiAgCX0KPiAgCj4g
LQkvKgo+IC0JICogV2UgZG9uJ3Qgc3VwcG9ydCBzeXN0ZW1zIHdpdGggRiBidXQgd2l0aG91dCBE
LCBzbyBtYXNrIHRob3NlIG91dAo+IC0JICogaGVyZS4KPiAtCSAqLwo+IC0JaWYgKChlbGZfaHdj
YXAgJiBDT01QQVRfSFdDQVBfSVNBX0YpICYmICEoZWxmX2h3Y2FwICYgQ09NUEFUX0hXQ0FQX0lT
QV9EKSkgewo+IC0JCXByX2luZm8oIlRoaXMga2VybmVsIGRvZXMgbm90IHN1cHBvcnQgc3lzdGVt
cyB3aXRoIEYgYnV0IG5vdCBEXG4iKTsKPiAtCQllbGZfaHdjYXAgJj0gfkNPTVBBVF9IV0NBUF9J
U0FfRjsKPiAtCX0KPiAtCj4gIAlpZiAoX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShO
VUxMLCBSSVNDVl9JU0FfRVhUX1pWRTMyWCkpIHsKPiAgCQkvKgo+ICAJCSAqIFRoaXMgY2Fubm90
IGZhaWwgd2hlbiBjYWxsZWQgb24gdGhlIGJvb3QgaGFydAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
