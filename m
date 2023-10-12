Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C846ECDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 13:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B4UEAtPOtJYfuwnmk5n5UNLMg1VMOUiTBwZC3TmJKiE=; b=NYxDWNDjc+OSbX
	PtJjrAMGaLwgtPidM2YBwXEF9D03QAREBvjI0U/IT/V6vCtqx8rRoiuc32TJPf3zxKj9FzkW0VFWg
	7r6XLU3Z1GinwKMtFbjHSrDPwTGKAFZi99uq677rBJNyz3KAVSOtrS9RXqFGvROc1Ewu5kJuENnnD
	nb0S0fj9j0PAqUW5EEGFI8wH8dai99wG0cMy0D6D82t/8Z0n7koigqxuYWJWxrLImw55hp2EXiQ86
	jBWA83h8QKpEEmb326th95y7VrhWdSt4HnQPiBVC71qGyeaAotMwhXpPPCKzyvCE7oRF69DW+/IHf
	0PqqaFkv7e9ayGGmKWvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqvZ4-0013ly-2o;
	Thu, 12 Oct 2023 13:17:22 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqvZ1-0013kN-05
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 13:17:20 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-406532c49dcso2956685e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Oct 2023 06:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697116636; x=1697721436; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=86Iw7ER1iL0qJPH6MKujEBhxqQiEFeQL7nq+sGVZkTo=;
        b=CVKJzZTQig5WaCioqOtBMv6+JS307YGJqFidS4ZGWVfIE6/7uHMF1ekNZU/5R4nDzS
         GMCnhc5SjZxiQ/0Ni777AQ1WD1z8OQZwpD71mBNsv9X+Jas9BafnA3w6brp3Rl7m4fF5
         r14Y8AQ80Mz7Ads6yHeN/1EZLuUwrdsn0mFZ8gIoUW6ETovNEZbkCbvqxptVL1rcv6zv
         xGDzaZ0HrP6yS6rAE2YocAOJkDRFfdSVU32/KbR0sdjKLyXw58jG6ZGemjCybQhUcJpo
         SjK9jIwMe14Ggd4MrJG6OzApkDADe6ebjG6cB/wMjQ/1Pd/UyiIOVLO1KolSd3Hj/6uN
         NKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697116636; x=1697721436;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=86Iw7ER1iL0qJPH6MKujEBhxqQiEFeQL7nq+sGVZkTo=;
        b=pxpQsVHQ5r2I9ynNR6vhAXANgmy9/+MweGhbUi2BANvJhKjcBIyCb5ndLZp3y1fsHZ
         Gtqv0o/10cA/WuQ4gkRotOXgFmr3bSxy5q2RbQ0JvauAOmE7Dh2+fKnuDOUtJuV7fWmL
         /rQnuS/7bs0JR02B+vpdyuuPSV/WKyAtfbnjXdWvg3cKXABKFBwukDAgJV1hd+fuXcr4
         0k1ZaEy3m4kyYg3V6gzZZhAuOIjmtozzk02bb7ug1AtTNnMUeFVA3j1JaFlxFMISJPWJ
         jzJJI6FwIiXJA3VQjUzdCqqk/bkSsQvGTik1t+jR5aD2NzYr9OIWtS4PoVykeBQCnOTY
         tM6A==
X-Gm-Message-State: AOJu0Yz3AToPpBX8wG2zz8c7/Bnob5TbEYPMdzk70O4ILfKXRLTMhcbo
	mOqQUqvYXvagwjcQsA5EHhsMtI1s89zogWBzh26DEA==
X-Google-Smtp-Source: AGHT+IEx9wPWOVom03CbrBv668hbIBnPdmng+CCts+Z4IvDPQOvyvDCWnMIlSYmRVAmf0hB8TXqbXw==
X-Received: by 2002:adf:fdd0:0:b0:317:7238:336a with SMTP id i16-20020adffdd0000000b003177238336amr19428901wrs.5.1697116635863;
        Thu, 12 Oct 2023 06:17:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:3fed:c1e5:145f:8179? ([2a01:e0a:999:a3a0:3fed:c1e5:145f:8179])
        by smtp.gmail.com with ESMTPSA id d12-20020a5d538c000000b0032769103ae9sm18393106wrv.69.2023.10.12.06.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 06:17:15 -0700 (PDT)
Message-ID: <b157edc4-a21f-40ac-8c9f-e989b34bb872@rivosinc.com>
Date: Thu, 12 Oct 2023 15:17:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/13] riscv: add ISA extension probing for Zv*
 extensions
Content-Language: en-US
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>, Evan Green <evan@rivosinc.com>,
 Conor Dooley <conor@kernel.org>
References: <20231011111438.909552-1-cleger@rivosinc.com>
 <20231011111438.909552-3-cleger@rivosinc.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20231011111438.909552-3-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_061719_065805_815D7861 
X-CRM114-Status: GOOD (  15.09  )
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

CgpPbiAxMS8xMC8yMDIzIDEzOjE0LCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4gQWRkIHByb2Jp
bmcgb2Ygc29tZSBadiogSVNBIGV4dGVuc2lvbnMgdGhhdCBhcmUgbWVudGlvbmVkIGluICJSSVND
LVYKPiBDcnlwdG9ncmFwaHkgRXh0ZW5zaW9ucyBWb2x1bWUgSUkiIFsxXS4gVGhlc2UgSVNBIGV4
dGVuc2lvbnMgYXJlIHRoZQo+IGZvbGxvd2luZzoKPiAKPiAtIFp2YmI6IFZlY3RvciBCYXNpYyBC
aXQtbWFuaXB1bGF0aW9uCj4gLSBadmJjOiBWZWN0b3IgQ2FycnlsZXNzIE11bHRpcGxpY2F0aW9u
Cj4gLSBadmtiOiBWZWN0b3IgQ3J5cHRvZ3JhcGh5IEJpdC1tYW5pcHVsYXRpb24KPiAtIFp2a2c6
IFZlY3RvciBHQ00vR01BQy4KPiAtIFp2a25lZDogTklTVCBTdWl0ZTogVmVjdG9yIEFFUyBCbG9j
ayBDaXBoZXIKPiAtIFp2a25oW2FiXTogTklTVCBTdWl0ZTogVmVjdG9yIFNIQS0yIFNlY3VyZSBI
YXNoCj4gLSBadmtzZWQ6IFNoYW5nTWkgU3VpdGU6IFNNNCBCbG9jayBDaXBoZXIKPiAtIFp2a3No
OiBTaGFuZ01pIFN1aXRlOiBTTTMgU2VjdXJlIEhhc2gKPiAtIFp2a246IE5JU1QgQWxnb3JpdGht
IFN1aXRlCj4gLSBadmtuYzogTklTVCBBbGdvcml0aG0gU3VpdGUgd2l0aCBjYXJyeWxlc3MgbXVs
dGlwbHkKPiAtIFp2a25nOiBOSVNUIEFsZ29yaXRobSBTdWl0ZSB3aXRoIEdDTS4KPiAtIFp2a3M6
IFNoYW5nTWkgQWxnb3JpdGhtIFN1aXRlCj4gLSBadmtzYzogU2hhbmdNaSBBbGdvcml0aG0gU3Vp
dGUgd2l0aCBjYXJyeWxlc3MgbXVsdGlwbGljYXRpb24KPiAtIFp2a3NnOiBTaGFuZ01pIEFsZ29y
aXRobSBTdWl0ZSB3aXRoIEdDTS4KPiAtIFp2a3Q6IFZlY3RvciBEYXRhLUluZGVwZW5kZW50IEV4
ZWN1dGlvbiBMYXRlbmN5Lgo+IAo+IFsxXSBodHRwczovL2RyaXZlLmdvb2dsZS5jb20vZmlsZS9k
LzFnYjlPTEgtRGhiQ2dXcDdWd3BQT1Zyclk2ZjNvU0pMTC92aWV3Cj4gCj4gU2lnbmVkLW9mZi1i
eTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+IC0tLQo+ICBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggfCAxNiArKysrKysrKysrKysrKysrCj4gIGFyY2gvcmlz
Y3Yva2VybmVsL2NwdWZlYXR1cmUuYyB8IDE2ICsrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBj
aGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vaHdjYXAuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+IGluZGV4
IGI3YjU4MjU4ZjZjNy4uNGU0Njk4MWFjNmM4IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vaHdjYXAuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+
IEBAIC01OCw2ICs1OCwyMiBAQAo+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWklDU1IJCTQwCj4g
ICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aSUZFTkNFSQkJNDEKPiAgI2RlZmluZSBSSVNDVl9JU0Ff
RVhUX1pJSFBNCQk0Mgo+ICsjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZCQgkJNDMKPiArI2RlZmlu
ZSBSSVNDVl9JU0FfRVhUX1pWQkMJCTQ0Cj4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVktCCQk0
NQo+ICsjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZLRwkJNDYKPiArI2RlZmluZSBSSVNDVl9JU0Ff
RVhUX1pWS04JCTQ3Cj4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVktOQwkJNDgKPiArI2RlZmlu
ZSBSSVNDVl9JU0FfRVhUX1pWS05FRAkJNDkKPiArI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWS05H
CQk1MAo+ICsjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZLTkhBCQk1MQo+ICsjZGVmaW5lIFJJU0NW
X0lTQV9FWFRfWlZLTkhCCQk1Mgo+ICsjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZLUwkJNTMKPiAr
I2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWS1NDCQk1NAo+ICsjZGVmaW5lIFJJU0NWX0lTQV9FWFRf
WlZLU0VECQk1NQo+ICsjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZLU0gJCTU2Cj4gKyNkZWZpbmUg
UklTQ1ZfSVNBX0VYVF9aVktTRwkJNTcKCkFib3V0IFp2a3MvWnZrbiwgdGhlc2UgZXh0ZW5zaW9u
cyBhcmUgYWN0dWFsbHkgc2hvcnRoYW5kIGZvciBhIGZldyBvdGhlcgpzdWItZXh0ZW5zaW9ucywg
aXQgaXMgc3RpbGwgbm90IGNsZWFyIGlmIGl0IHNob3VsZCBiZSBwYXJzZWQgYXMgaXMuClRoZXJl
IGFyZSBtdWx0aXBsZSBzb2x1dGlvbnM6CgotIEhhbmRsZSB0aGVtIGFzLWlzLCBzaW1wbHkgZW5h
YmxlIHRoZSBleHRlbnNpb24sIGlmIHJlcG9ydGVkIHRocm91Z2gKaHdwcm9iZSwgdXNlcnNwYWNl
IHdpbGwgYmUgcmVzcG9uc2libGUgdG8gZGV0ZWN0IHRoZSBzdWItZXh0ZW5zaW9ucwooY3VycmVu
dCBhcHByb2FjaCkKCi0gIlVuZm9sZCIgdGhlIGV4dGVuc2lvbiBpbiBvcmRlciB0byBlbmFibGUg
YWxsIHRoZSBzdWItZXh0ZW5zaW9ucyBhbmQKa2VlcCB0aGUgbWFpbiBvbmUgKGZvciBpbnN0YW5j
ZSBmb3IgWnZrbiwgZW5hYmxlIFp2a25lZCwgWnZrbmhiLCBadmtiLApadmt0LCBadmtuKQoKLSAi
VW5mb2xkIiBidXQgZG9uJ3Qga2VlcCB0aGUgZXh0ZW5zaW9uICJzaG9ydGhhbmQiIGluIHRoZSBJ
U0EgZXh0ZW5zaW9uCmxpc3QgKGZvciBpbnN0YW5jZSBmb3IgWnZrbiwgZW5hYmxlIFp2a25lZCwg
WnZrbmhiLCBadmtiLCBadmt0KQoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gKyNkZWZpbmUgUklTQ1Zf
SVNBX0VYVF9aVktUCQk1OAo+ICAKPiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX01BWAkJNjQKPiAg
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlz
Y3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+IGluZGV4IDFjZmJiYTY1ZDExYS4uODU5ZDY0N2YzY2Vk
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ICsrKyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+IEBAIC0xNzQsNiArMTc0LDIyIEBAIGNvbnN0
IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtdID0gewo+ICAJX19SSVND
Vl9JU0FfRVhUX0RBVEEoemJhLCBSSVNDVl9JU0FfRVhUX1pCQSksCj4gIAlfX1JJU0NWX0lTQV9F
WFRfREFUQSh6YmIsIFJJU0NWX0lTQV9FWFRfWkJCKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRB
KHpicywgUklTQ1ZfSVNBX0VYVF9aQlMpLAo+ICsJX19SSVNDVl9JU0FfRVhUX0RBVEEoenZiYiwg
UklTQ1ZfSVNBX0VYVF9aVkJCKSwKPiArCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2YmMsIFJJU0NW
X0lTQV9FWFRfWlZCQyksCj4gKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmtiLCBSSVNDVl9JU0Ff
RVhUX1pWS0IpLAo+ICsJX19SSVNDVl9JU0FfRVhUX0RBVEEoenZrZywgUklTQ1ZfSVNBX0VYVF9a
VktHKSwKPiArCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2a24sIFJJU0NWX0lTQV9FWFRfWlZLTiks
Cj4gKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmtuYywgUklTQ1ZfSVNBX0VYVF9aVktOQyksCj4g
KwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmtuZWQsIFJJU0NWX0lTQV9FWFRfWlZLTkVEKSwKPiAr
CV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2a25nLCBSSVNDVl9JU0FfRVhUX1pWS05HKSwKPiArCV9f
UklTQ1ZfSVNBX0VYVF9EQVRBKHp2a25oYSwgUklTQ1ZfSVNBX0VYVF9aVktOSEEpLAo+ICsJX19S
SVNDVl9JU0FfRVhUX0RBVEEoenZrbmhiLCBSSVNDVl9JU0FfRVhUX1pWS05IQiksCj4gKwlfX1JJ
U0NWX0lTQV9FWFRfREFUQSh6dmtzLCBSSVNDVl9JU0FfRVhUX1pWS1MpLAo+ICsJX19SSVNDVl9J
U0FfRVhUX0RBVEEoenZrc2MsIFJJU0NWX0lTQV9FWFRfWlZLU0MpLAo+ICsJX19SSVNDVl9JU0Ff
RVhUX0RBVEEoenZrc2VkLCBSSVNDVl9JU0FfRVhUX1pWS1NFRCksCj4gKwlfX1JJU0NWX0lTQV9F
WFRfREFUQSh6dmtzaCwgUklTQ1ZfSVNBX0VYVF9aVktTSCksCj4gKwlfX1JJU0NWX0lTQV9FWFRf
REFUQSh6dmtzZywgUklTQ1ZfSVNBX0VYVF9aVktTRyksCj4gKwlfX1JJU0NWX0lTQV9FWFRfREFU
QSh6dmt0LCBSSVNDVl9JU0FfRVhUX1pWS1QpLAo+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoc21h
aWEsIFJJU0NWX0lTQV9FWFRfU01BSUEpLAo+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoc3NhaWEs
IFJJU0NWX0lTQV9FWFRfU1NBSUEpLAo+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoc3Njb2ZwbWYs
IFJJU0NWX0lTQV9FWFRfU1NDT0ZQTUYpLAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
