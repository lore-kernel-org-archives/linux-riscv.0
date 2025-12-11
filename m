Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14162D3E783
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Dec 2025 00:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Olldz9q4PHkn5Jk4AfDEY3NhGTil99zs+3lKI9DA4vw=; b=d3to4Djweg+k5P
	3PNMhvnibJ4ikM5mTXcObz+nz0kic7+gk8kEA0sLDVgby5KSTkeoRXP32qgK3wkRj7FGfgtc7F6Ux
	d9MQV1ishqbjXP+aB7St/kUcLpuaaZk8Pto0plLpG6XocFEnDvh6ODeDC7tmm12Rc/kTO8ppk9yhj
	4gr1qnmwTOLpNLV/owLDpOmgLs5lhfE+Mi9ywpcMuMS3PehfZ/2wyFxb+6AW/rEvsH57e17bLz51o
	f7r0NDHXyKbGwdaz0NTpfv3zFdNQ+OG9elmNusDV/g+zh+0Xt2B4pSjXUZuAbatrvri0/OaLMRuAl
	KjXFHXpw3dsVBbzSs6Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTUYs-0000000G1Bu-1V5h;
	Thu, 11 Dec 2025 00:29:38 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTUYq-0000000G1BW-0LPA
	for linux-riscv@lists.infradead.org;
	Thu, 11 Dec 2025 00:29:37 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-297dd95ffe4so4313765ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 10 Dec 2025 16:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1765412975; x=1766017775; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hph6c6mLrMrxrVM4J3elgrKqEusrkULz2AJc0PIUBG4=;
        b=SNw4UnPSx4uNonXPqomRHgk4DoLTD/OfWx73GB5S9UeozPAmp+CAI+6OijUySz5h9m
         iar7LTI4v6R7x/bJsYvhu1PiH5vtxO+kcb7BUC+09PZYxQdbrgiMnYhoNHAHs1NTZd/B
         fbj+YkXmb21XzSEgNoq73AADAp8BqiOSaZijD3SWAjk9iLi72NGz1ma/wXrH+QtSL/LB
         1OoU2BijwyP3l9M7KmOLVvEyfPtm52SrSlb96yMsq0PnPUa5mEw2vIIoq9c8NOITvQxt
         Zc6vJ/i41sQtkdFXmJamOK9tH8phONdD0I4PgZA5osY+s55eRChtOk2ggdFLksB5bgp9
         +Ecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765412975; x=1766017775;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hph6c6mLrMrxrVM4J3elgrKqEusrkULz2AJc0PIUBG4=;
        b=tGiKpdMn13mWuDhB7b4Q+16YXSRVpcs1ddlknWqtjtnnzhPhQx6rfb35NkZ1V0VEO3
         rq9Ia0G6hQSrFZuUEiW44DO63QxglxGXCu3xWlxhjsniD1tpv9vE0T12ggyW4SDD6WBh
         /5U+sHZpdwff/1TOtr0lSzN/Q9fKZn631PNT3UGbmyCvzyGJbu/izgiTteGLUY+ShEBu
         Xm7WQEvIclUtjObkHQYuZQAZkhHNmv6ol6kwpu5+XKnRWMuilcxwHBq7hlF3Zk6I+6uz
         cZrDpSwhTJIZ+naNx7uUXFcKtmyeYJSjyQaNPyeoQv7NE2AwBB63SU4FUb01yqatWu6v
         XTcg==
X-Forwarded-Encrypted: i=1; AJvYcCWyFYXQdU2QJOmRt7dN8QXqke09Gisu7ZPm8LwdirYI3IpFwstqFIC3mSyUIgC15Qrgoiz4SqQPPw+KRg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRCfW1qpGotdcEfqRrVD5FOt8yj4JzSmSVyEVNeCbpmQ8WpYIP
	0L1gMFwKEcpwHjCUBh9xcZEtdC7/EpOkxrMmErrHDpSjzUlcrhJCl7PWz9clHkdBqpk=
X-Gm-Gg: AY/fxX5LomPcV7871qYWrg9Fog2btQxmGyZ27Q2fiwdlKQSyfnb+LRJbLS2n4oP+PKE
	xkx4tfPHXFxzGpeakOhqg5YhMA91jbMmD8zrqrv777uAWjjUmI9atZqrcwg2/EA04bvrjdP86Wm
	ogoJIA2tujC6AM1v8kce1mN3u7FQptfdJN+EZbwGZlZH1pt/RLqJNSaNlEbex1imVWw+WiGxQN/
	BNmmVWoPu4QrAgTl5PhdK2sxBofQHj3LfyEu19CFd3mEMManJFPajX9XXYDbbKCD3XIPNZ38ylz
	0rALdc/FgCySrpiQrtgVi8rpW6C+e8qtUHAHmh62lf3gllysKhoz6eNezI8MO835EGuBdM3ivV2
	M16MdW0QW8ppusU1qhRJQVYn8s4K85IeToVvhml0vRjcIneXzLQhDY1NnH2e4x2PnW4jVM28JNY
	1Sqbj7y9JAgzZ4/FkvR1+54sIBXwFJeQ==
X-Google-Smtp-Source: AGHT+IEqajP6+u4eTxzUYHfF6PVb972s/3Qa3UlhPbS0/TAJuALl6ObT5PUNXanFEPyHtJ8XnDuE7g==
X-Received: by 2002:a17:903:234c:b0:299:e041:ecf6 with SMTP id d9443c01a7336-29ec27ce2b4mr43176775ad.40.1765412974654;
        Wed, 10 Dec 2025 16:29:34 -0800 (PST)
Received: from [100.64.0.1] ([167.103.29.104])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c2b8e0fb4sm539653a12.25.2025.12.10.16.29.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 16:29:34 -0800 (PST)
Message-ID: <818ba76e-0553-459d-b956-520f23762034@sifive.com>
Date: Thu, 11 Dec 2025 09:29:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/22] checkpatch: Warn on page table access without
 accessors
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Joe Perches <joe@perches.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: devicetree@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Conor Dooley <conor@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, Andy Whitcroft <apw@canonical.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
 <20251113014656.2605447-8-samuel.holland@sifive.com>
 <1dfa1e3566cafbe43a1d4753defef9c82ddb3b64.camel@perches.com>
 <a6e7a571-91d2-4e66-bc86-ba30f624294b@sifive.com>
 <273b638e-8251-4faf-929a-87432a48abdc@kernel.org>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <273b638e-8251-4faf-929a-87432a48abdc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_162936_136518_E44C7113 
X-CRM114-Status: GOOD (  16.51  )
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

T24gMjAyNS0xMS0xNCA0OjE3IEFNLCBEYXZpZCBIaWxkZW5icmFuZCAoUmVkIEhhdCkgd3JvdGU6
Cj4gT24gMTMuMTEuMjUgMDM6MzYsIFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+PiBPbiAyMDI1LTEx
LTEyIDg6MjEgUE0sIEpvZSBQZXJjaGVzIHdyb3RlOgo+Pj4gT24gV2VkLCAyMDI1LTExLTEyIGF0
IDE3OjQ1IC0wODAwLCBTYW11ZWwgSG9sbGFuZCB3cm90ZToKPj4+PiBBcmNoaXRlY3R1cmVzIG1h
eSBoYXZlIHNwZWNpYWwgcnVsZXMgZm9yIGFjY2Vzc2luZyB0aGUgaGFyZHdhcmUgcGFnZQo+Pj4+
IHRhYmxlcyAoZm9yIGV4YW1wbGUsIGF0b21pY2l0eS9vcmRlcmluZyByZXF1aXJlbWVudHMpLCBz
byB0aGUgZ2VuZXJpYyBNTQo+Pj4+IGNvZGUgcHJvdmlkZXMgdGhlIHBYWHBfZ2V0KCkgYW5kIHNl
dF9wWFgoKSBob29rcyBmb3IgYXJjaGl0ZWN0dXJlcyB0bwo+Pj4+IGltcGxlbWVudC4gVGhlc2Ug
YWNjZXNzb3IgZnVuY3Rpb25zIGFyZSBvZnRlbiBvbWl0dGVkIHdoZXJlIGEgcmF3Cj4+Pj4gcG9p
bnRlciBkZXJlZmVyZW5jZSBpcyBiZWxpZXZlZCB0byBiZSBzYWZlIChpLmUuIHJhY2UtZnJlZSku
IEhvd2V2ZXIsCj4+Pj4gUklTQy1WIG5lZWRzIHRvIHVzZSB0aGVzZSBob29rcyB0byByZXdyaXRl
IHRoZSBwYWdlIHRhYmxlIHZhbHVlcyBhdAo+Pj4+IHJlYWQvd3JpdGUgdGltZSBvbiBzb21lIHBs
YXRmb3Jtcy4gQSByYXcgcG9pbnRlciBkZXJlZmVyZW5jZSB3aWxsIG5vCj4+Pj4gbG9uZ2VyIHBy
b2R1Y2UgdGhlIGNvcnJlY3QgdmFsdWUgb24gdGhvc2UgcGxhdGZvcm1zLCBzbyB0aGUgZ2VuZXJp
YyBjb2RlCj4+Pj4gbXVzdCBhbHdheXMgdXNlIHRoZSBhY2Nlc3NvciBmdW5jdGlvbnMuCj4+PiBb
XQo+Pj4+IGRpZmYgLS1naXQgYS9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgYi9zY3JpcHRzL2NoZWNr
cGF0Y2gucGwKPj4+IFtdCj4+Pj4gQEAgLTc3MjEsNiArNzcyMSwxMyBAQCBzdWIgcHJvY2VzcyB7
Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBFUlJPUigiTUlTU0lOR19T
RU5USU5FTCIsICJtaXNzaW5nIHNlbnRpbmVsIGluIElECj4+Pj4gYXJyYXlcbiIgLiAiJGhlcmVc
biRzdGF0XG4iKTsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgIH0KPj4+PiArCj4+Pj4gKyMgY2hlY2sgZm9yIHJhdyBkZXJlZmVyZW5jZXMg
b2YgaGFyZHdhcmUgcGFnZSB0YWJsZSBwb2ludGVycwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAo
JHJlYWxmaWxlICF+IG1AXmFyY2gvQCAmJgo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICRs
aW5lID1+IC8oPzwhcHRlX3QgfHBbbXU0Z11kX3QgfGl6ZW9mXCgpXCpcKD8odm1mKFwufC0+KSk/
Cj4+Pj4gKHB0ZXxwW211NGddZClwP1xiLykgewo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFdBUk4oIlBBR0VfVEFCTEVfQUNDRVNTT1JTIiwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgIlVzZSAkM3BfZ2V0KCkvc2V0XyQzKCkgaW5zdGVhZCBvZiBkZXJlZmVyZW5j
aW5nIHBhZ2UKPj4+PiB0YWJsZSBwb2ludGVyc1xuIiAuICRoZXJlY3Vycik7Cj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIH0KPj4+PiDCoMKgwqDCoMKgIH0KPj4+Cj4+PiBTZWVtcyBsaWtlIGEgbG90IG9m
IG1hdGNoZXMKPj4+Cj4+PiAkIGdpdCBncmVwIC1QICcoPzwhcHRlX3QgfHBbbXU0Z11kX3QgfGl6
ZW9mXCgpXCpcKD8odm1mKFwufC0+KSk/KHB0ZXwKPj4+IHBbbXU0Z11kKXA/XGInIHwgXAo+Pj4g
wqDCoCBncmVwIC12ICdeYXJjaC8nIHwgd2MgLWwKPj4+IDc2Ngo+IAo+IFRoYXQgaXMgaW5kZWVk
IGNvbmNlcm5pbmcuCj4gCj4gSSByZWNhbGwgdGhhdCB3ZSBkaXNjdXNzZWQgYW4gYWx0ZXJuYXRp
dmUgYXBwcm9hY2ggd2l0aCBSeWFuIGluIHRoZSBwYXN0OiBJCj4gZG9uJ3QgcmVtZW1iZXIgYWxs
IHRoZSBkZXRhaWxzLCBidXQgZXNzZW50aWFsbHkgaXQgd2FzIGFib3V0IHVzaW5nIHNlcGFyYXRl
Cj4gdHlwZXMsIHN1Y2ggdGhhdCBkZXJlZmVyZW5jaW5nIHdvdWxkIG5vdCBnZXQgeW91IHRoZSB0
eXBlIHRoZSBvdGhlciBmdW5jdGlvbnMKPiB3b3VsZCBiZSBleHBlY3RpbmcuIFN1Y2ggdGhhdCB0
aGUgY29tcGlsZXIgd2lsbCBiYXJrIHdoZW4geW91IHRyeSB0byBkZXJlZmVyZW5jZS4KCkV2ZW4g
aWYgc29tZSBmdW5jdGlvbnMgYSBuZXcgaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZSwgZG9uJ3Qg
d2Ugc3RpbGwgaGF2ZSB0aGUKcHJvYmxlbSB0aGF0IG5laXRoZXIgdHlwZSB3b3VsZCBiZSBzYWZl
IHRvIGRlcmVmZXJlbmNlPwoKQSBzaW1pbGFyIG9wdGlvbiB0byBhIG5ldyB0eXBlIHdvdWxkIGJl
IHRvIGFkZCBhIHNwYXJzZSBhbm5vdGF0aW9uIHRvIHRoZQpwb2ludGVycyB0aGF0IHJlZmVyZW5j
ZSBoYXJkd2FyZSBwYWdlIHRhYmxlcywgc2ltaWxhciB0byBfX3VzZXIuIEkgaGF2ZQpwcm90b3R5
cGVkIGEgY29jY2luZWxsZSBzY3JpcHQgdG8gYWRkIHRoaXMgYW5ub3RhdGlvbiwgYW5kIHRoZSBz
cGFyc2UgY2hlY2tpbmcKd29ya3MuIEJ1dCBJIGRvbid0IGhhdmUgdGhlIGNvY2NpbmVsbGUgZXhw
ZXJ0aXNlIHRvIGF1dG9tYXRlIHRoZSB3aG9sZSB0aGluZywgc28KdGhlcmUncyBhIGxvdCBvZiBt
YW51YWwgY2xlYW51cCByZXF1aXJlZC4gQW5kIHRoaXMgcmVxdWlyZXMgdG91Y2hpbmcgYWxsCmFy
Y2hpdGVjdHVyZXMgYXQgb25jZSB0byBhdm9pZCBpbnRyb2R1Y2luZyBlcnJvbmVvdXMgc3BhcnNl
IHdhcm5pbmdzLiBTbyBJIGRpZApub3QgaW5jbHVkZSB0aGlzIGZvciB2MyBiZWNhdXNlIGl0IGlz
IHF1aXRlIGEgbG90IG9mIGNodXJuLiBJcyB0aGlzIHNvbWV0aGluZyBJCnNob3VsZCB0cnkgdG8g
ZnVsbHkgaW1wbGVtZW50IGZvciB2ND8KClJlZ2FyZHMsClNhbXVlbAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
