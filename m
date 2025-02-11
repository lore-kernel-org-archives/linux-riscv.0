Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3F8C021A2
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 13:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s2e1I7+4qIQ0wzSMVue8MguNFW/g0g93f7HISempj8c=; b=nP0I4VhglCWzeF
	cT9GG6lIBT8y/W13HzUYHlbFNyBwZIZx/HRqeq9BaDGT991gNDl57a0ZgZMy9cyi4aiXH/X/k+zJk
	a/EQZNZZEc2j5U4e4GXy2JV0p6ri8+Tm6ToDPUHpymzHbzLDvXoWGT5SvG/pTg04L4IdZUg8KhCHQ
	hRwE3ZPjlwUtvlC2hIIjsLuXVygAz9CZjt6b6nvLQP65TsC1RRDRrUlCJqxpiMBnezC+ehRCE+0zj
	0YDATJUigt5woQnaiflJmkYSlFrLLfTTfvJll/utg4FbSqE2/3mIrWu5pu9PfEistKAiWJoLj5DEB
	AUFgK8iXJHmmw0Btjxsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thqVw-00000003zOi-1ziD;
	Tue, 11 Feb 2025 13:41:24 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thqNt-00000003xtK-3jEE
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 13:33:07 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4393f6a2c1bso14515855e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 11 Feb 2025 05:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739280784; x=1739885584; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0wrmDUq/HHsKw+sefoEbxInuEgbCMl1q15xZjalPz7Q=;
        b=ZxNcGRbjaIVT/EKWwVPcI7hDtqc5rXOKcihkbJaq4hUTZZhcYwkMDT4mgJ5s2//EE3
         2Or31WieDGHnkTb8ZwEfJGbnLqJNKh5z/ga6givHmD1zhFmcA/RM7QiMNbmXgelVtM0K
         3tAZx/3WqVRSUpu3kQenvPYNR613wC/f9hlOop4UzycyRa+bYc47VpZS9fkkaJaiQfTn
         hJ2P00Me1Y+qKmUdPVcu6t+SSImh5/986H88VWIu4eLQN+GULv+RPRIovRl6bx08t+sH
         3QTGxbKUk2hrR67RGi8YdU6VWGQfS9UJScVBC0pS1uQjf47o3eS0W12WlwSjVygAiPV+
         Q86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739280784; x=1739885584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0wrmDUq/HHsKw+sefoEbxInuEgbCMl1q15xZjalPz7Q=;
        b=KrCGODh2O7hUh2lswSqdgGfBfWoKhpy6QHCQ+5TylxvtaGR/83QIS8/wTANGpsoM4k
         GHJXCr2bq+UmmMGU83p/MB9hE/uR6ACazDIbfF4wuLMuvqCP50O0C9Qyt4c64MHe+o70
         8nNWat2DraxP91iyaSmhXYNTXfyMWhi/CWZ38j5Zo0tgT5MpzHe9aZ3HVFDwX0MG068E
         pXSMPMC3zH4UY2L/QS6E+N7M1p84bNAidSt6/UE9UoCGYH+D3Q0Oar5osOYcxR8Ay8G7
         0sDDn/spYXee+4VDg9gUGGKGp/Gd7AV3E1Xnyv5wvzc1+97zMvtvqkOqfGsl5D0J1x+J
         kwUg==
X-Gm-Message-State: AOJu0YwRBvGQIg4Z8fx94ty9wDusdJfsF8/kmBosgQPIMD/iYRVh/V8q
	vozbrCC6S9LMi595vLpO/NhyiiDDjXwkXcHU1z25y+mOcrVybeuMFRGJUxo2DvA=
X-Gm-Gg: ASbGncthk5McSCm0Bvt59X2SNd6SoPgawfdXVW5gYpUfg7kpNYhlnO04rn9rAszPsob
	tlhzVI3He9bn/I7brHtgNdG+8kgawJj6BDiAWZo2YAPPpFJNogk2qRdCKZH8oOXcTFE5P5q7E/K
	smetSDFG3yqJ8zuhpkkpaJE7Z/LLFyTe58iv8trm3lLst5sfK4iIG7r3akxqsZB6QIbfKfwKbJK
	oqxPf1oQHM1lzwEtkwCR4n2RvciPnHRg32FfGXbgPiqw5wk0JO6z9uksHNyQhRaz1b6uRnSzowg
	VlSJ5+fVeDGkivs2elPqzE+QV7HoDaX16zNXNj4nLy+CnVIUXlz62F2GlNcZ
X-Google-Smtp-Source: AGHT+IEqlc/lpTpwK9yYW79C3YmHjyqoHdYU9IFEmIVHONYafZyXfrM25WF2Citl+iuABPW8/Dn2HA==
X-Received: by 2002:a05:600c:1987:b0:434:fe3c:c662 with SMTP id 5b1f17b1804b1-4394ced8c52mr27059525e9.12.1739280784044;
        Tue, 11 Feb 2025 05:33:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43935d4bd5csm104208905e9.6.2025.02.11.05.33.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 05:33:03 -0800 (PST)
Message-ID: <e0225e44-b86f-4935-b524-86a28131fe7d@rivosinc.com>
Date: Tue, 11 Feb 2025 14:33:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] RISC-V: add vector crypto extension validation
 checks
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley
 <conor.dooley@microchip.com>, Eric Biggers <ebiggers@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
 <20250205-quench-entrench-09bed8c8c823@spud>
 <f1ce7aa9-63e3-41bd-9bb0-a54ebc714dff@rivosinc.com>
 <20250211-implode-mute-8ff31f44bdf9@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250211-implode-mute-8ff31f44bdf9@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_053306_185910_1ED66405 
X-CRM114-Status: GOOD (  22.37  )
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

CgpPbiAxMS8wMi8yMDI1IDEzOjM0LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gVHVlLCBGZWIg
MTEsIDIwMjUgYXQgMDk6NDU6NDRBTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pgo+
Pgo+PiBPbiAwNS8wMi8yMDI1IDE3OjA1LCBDb25vciBEb29sZXkgd3JvdGU6Cj4+PiBGcm9tOiBD
b25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+Pj4KPj4+IFVzaW5nIENs
ZW1lbnQncyBuZXcgdmFsaWRhdGlvbiBjYWxsYmFja3MsIHN1cHBvcnQgY2hlY2tpbmcgdGhhdAo+
Pj4gZGVwZW5kZW5jaWVzIGhhdmUgYmVlbiBzYXRpc2ZpZWQgZm9yIHRoZSB2ZWN0b3IgY3JweXRv
IGV4dGVuc2lvbnMuCj4+PiBDdXJyZW50bHkgcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUo
PHZlY3RvciBjcnlwdG8+KSB3aWxsIHJldHVybgo+Pj4gdHJ1ZSBvbiBzeXN0ZW1zIHRoYXQgc3Vw
cG9ydCB0aGUgZXh0ZW5zaW9ucyBidXQgdmVjdG9yIGl0c2VsZiBoYXMgYmVlbgo+Pj4gZGlzYWJs
ZWQgYnkgdGhlIGtlcm5lbCwgYWRkaW5nIHZhbGlkYXRpb24gY2FsbGJhY2tzIHdpbGwgcHJldmVu
dCBzdWNoIGEKPj4+IHNjZW5hcmlvIGZyb20gb2NjdXJpbmcgYW5kIG1ha2UgdGhlIGJlaGF2aW91
ciBvZiB0aGUgZXh0ZW5zaW9uIGRldGVjdGlvbgo+Pj4gZnVuY3Rpb25zIG1vcmUgY29uc2lzdGVu
dCB3aXRoIHVzZXIgZXhwZWN0YXRpb25zIC0gaXQncyBub3QgZXhwZWN0ZWQgdG8KPj4+IGhhdmUg
dG8gY2hlY2sgZm9yIHZlY3RvciBBTkQgdGhlIHNwZWNpZmljIGNyeXB0byBleHRlbnNpb24uCj4+
Pgo+Pj4gVGhlIDEuMC4wIFZlY3RvciBjcnlwdG8gc3BlYyBzdGF0ZXM6Cj4+PiAJVGhlIFp2a25o
YiBhbmQgWnZiYyBWZWN0b3IgQ3J5cHRvIEV4dGVuc2lvbnMgLS1hbmQgYWNjb3JkaW5nbHkKPj4+
IAl0aGUgY29tcG9zaXRlIGV4dGVuc2lvbnMgWnZrbiBhbmQgWnZrcy0tIHJlcXVpcmUgYSBadmU2
NHggYmFzZSwKPj4+IAlvciBhcHBsaWNhdGlvbiAoIlYiKSBiYXNlIFZlY3RvciBFeHRlbnNpb24u
IEFsbCBvZiB0aGUgb3RoZXIKPj4+IAlWZWN0b3IgQ3J5cHRvIEV4dGVuc2lvbnMgY2FuIGJlIGJ1
aWx0IG9uIGFueSBlbWJlZGRlZCAoWnZlKikgb3IKPj4+IAlhcHBsaWNhdGlvbiAoIlYiKSBiYXNl
IFZlY3RvciBFeHRlbnNpb24uCj4+PiBhbmQgdGhpcyBjb3VsZCBiZSB1c2VkIGFzIHRoZSBiYXNp
cyBmb3IgY2hlY2tpbmcgdGhhdCB0aGUgY29ycmVjdCBiYXNlCj4+PiBmb3IgaW5kaXZpZHVhbCBj
cnlwdG8gZXh0ZW5zaW9ucywgYnV0IHRoYXQncyBub3QgcmVhbGx5IHRoZSBrZXJuZWwncyBqb2IK
Pj4+IGluIG15IG9waW5pb24gYW5kIGl0IGlzIHN1ZmZpY2llbnQgdG8gbGVhdmUgdGhhdCBzb3J0
IG9mIHByZWNpc2lvbiB0bwo+Pj4gdGhlIGR0LWJpbmRpbmdzLiBUaGUga2VybmVsIG9ubHkgbmVl
ZHMgdG8gbWFrZSBzdXJlIHRoYXQgdmVjdG9yLCBpbiBzb21lCj4+PiBmb3JtLCBpcyBhdmFpbGFi
bGUuCj4+Pgo+Pj4gU2luY2UgdmVjdG9yIHdpbGwgbm93IGJlIGRpc2FibGVkIHByb2FjdGl2ZWx5
LCB0aGVyZSdzIG5vIG5lZWQgdG8gY2xlYXIKPj4+IHRoZSBiaXQgaW4gZWxmX2h3Y2FwIGluIHJp
c2N2X2ZpbGxfaHdjYXAoKSBhbnkgbG9uZ2VyLgo+Pj4KPj4+IExpbms6IGh0dHBzOi8vZ2l0aHVi
LmNvbS9yaXNjdi9yaXNjdi1jcnlwdG8vcmVsZWFzZXMvdGFnL3YxLjAuMAo+Pj4gU2lnbmVkLW9m
Zi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPj4+IC0tLQo+
Pj4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyB8IDQ5ICsrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0KPj4+ICAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwg
MTYgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2Nw
dWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+Pj4gaW5kZXggNDBh
MjRiMDhkOTA1Li4xYzE0OGVjZWE2MTIgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC9jcHVmZWF0dXJlLmMKPj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+
Pj4gQEAgLTEzOCw2ICsxMzgsMjMgQEAgc3RhdGljIGludCByaXNjdl9leHRfdmVjdG9yX2Zsb2F0
X3ZhbGlkYXRlKGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgKmRhdGEKPj4+ICAJcmV0
dXJuIDA7Cj4+PiAgfQo+Pj4gIAo+Pj4gK3N0YXRpYyBpbnQgcmlzY3ZfZXh0X3ZlY3Rvcl9jcnlw
dG9fdmFsaWRhdGUoY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSAqZGF0YSwKPj4+ICsJ
CQkJCSAgICBjb25zdCB1bnNpZ25lZCBsb25nICppc2FfYml0bWFwKQo+Pj4gK3sKPj4+ICsJaWYg
KCFJU19FTkFCTEVEKENPTkZJR19SSVNDVl9JU0FfVikpCj4+PiArCQlyZXR1cm4gLUVJTlZBTDsK
Pj4+ICsKPj4+ICsJLyoKPj4+ICsJICogSXQgaXNuJ3QgdGhlIGtlcm5lbCdzIGpvYiB0byBjaGVj
ayB0aGF0IHRoZSBiaW5kaW5nIGlzIGNvcnJlY3QsIHNvCj4+PiArCSAqIGl0IHNob3VsZCBiZSBl
bm91Z2ggdG8gY2hlY2sgdGhhdCBhbnkgb2YgdGhlIHZlY3RvciBleHRlbnNpb25zIGFyZQo+Pj4g
KwkgKiBlbmFibGVkLCB3aGljaCBpbi10dXJuIG1lYW5zIHRoYXQgdmVjdG9yIGlzIHVzYWJsZSBp
biB0aGlzIGtlcm5lbAo+Pj4gKwkgKi8KPj4+ICsJaWYgKCFfX3Jpc2N2X2lzYV9leHRlbnNpb25f
YXZhaWxhYmxlKGlzYV9iaXRtYXAsIFJJU0NWX0lTQV9FWFRfWlZFMzJYKSkKPj4+ICsJCXJldHVy
biAtRUlOVkFMOwo+Pgo+PiBBZnRlciBhIHNlY29uZCB0aG91Z2h0LCBJIHRoaW5rIGl0IHNob3Vs
ZCBiZSB0aGlzOgo+Pgo+PiBpZiAoX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2Ff
Yml0bWFwLCBSSVNDVl9JU0FfRVhUX1pWRTMyWCkpCj4+IAlyZXR1cm4gMDsKPj4KPj4gcmV0dXJu
IC1FUFJPQkVERUZFUjsKPj4KPj4gRXh0ZW5zaW9ucyBjYW4gYmUgZW5hYmxlZCBsYXRlciAoYnV0
IGNhbiBub3QgYmUgInJldmVydGVkIikgc28gY2hlY2sgZm9yCj4+IHRoZSBleHRlbnNpb24gdG8g
YmUgcHJlc2VudCAoaW4gd2hpY2ggY2FzZSBpdCdzIG9rKSwgb3Igd2FpdCBmb3IgaXQgdG8KPj4g
YmUgKHBvdGVudGlhbGx5KSBlbmFibGVkLgo+IAo+IEFoLCBvZiBjb3Vyc2UgaXQgaXMgb3BlcmF0
aW5nIG9uIHRoZSAvcmVzb2x2ZWQvIGlzYSwgbm90IHRoZSBzb3VyY2Ugb25lLgo+IE1ha2VzIG1l
IHRoaW5nIHRoZSBwYXJhbWV0ZXIgb2YgYWxsIHRoZSB2YWxpZGF0ZSBjYWxsYmFja3Mgc2hvdWxk
IGJlCj4gInJlc29sdmVkX2lzYV9iaXRtYXAiIGluc3RlYWQgb2YgImlzYV9iaXRtYXAiIHRvIG1h
a2UgdGhpbmdzIGNsZWFyZXI/CgpZZWFoIHRoYXQgd291bGQgYmUgaGVscGZ1bCBJIGd1ZXNzLgoK
Q2zDqW1lbnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
