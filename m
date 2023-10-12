Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1038CCDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 07:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H/D0k3cGoqHZpubW2aCX4izaV/RL00QcDeJr2CQVQ9U=; b=wb+asNQmGIDi7N
	wGz+GlFfQ7dQRVqec3RSryrCDMQvfvSaFr6pB15uoaIew4khBm6tAXqg8RcrVBR5k0jPTkHYZox1q
	dp4j5pu1R9p1Gwig7czunU/gi3yA31cDAiBAIU2f2mCEZSINc2q3b09YQDpsOHdi5k8qCp7DQxEYF
	L/26JTx6j/oCZA67i5+sjLEECXoFYms7j/aclCNBWXq+lV9492cRdZ5YFNx0cjwDosJsOj0pq7T4H
	EYFBoAb088b47pLH3PYxBUsRQvj1t4QWTFCXDzkoyl3Pt82wqS/OA5hzk4+g6RixWPI2MMRwSR8ho
	PAMncdCtxf/5q01VVQEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqpvI-0001ht-0Z;
	Thu, 12 Oct 2023 07:15:56 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqpvE-0001hT-13
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 07:15:54 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4053e6e8ca7so2303555e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Oct 2023 00:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697094949; x=1697699749; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KXCX0IrmSUAHDEC+IloTWKmfzlKX5kVqCGXqvzJraC0=;
        b=SpVaYnUUG0HB2tsg+YTIPpOXgXyNANSbOmTIFAaAjwnSQm6b7caBmOeiJp7EGH1DdE
         O7nsMLaYLFkAl2MbPkKJNQPr2QOsHfknHpRInB2MlJbXigFptvDZguMCBBEYjkW3xFre
         Ek3DPe2yHoIBuYpJnO1RPW1oxUNeYGyPwxwGDPNC28f/13RW0xw19jNVt6dKnBaz0F21
         aJ6MnxOWLcHns0hlfbWd/XhOceGLUHsJqvpXM0JAbPkcgfJnfPqszJGkyDuvTb/rz3D5
         QuNlYlmBwqTo9NWFf3K8zsRIC8PGO7WoHJTuhd1InLt8Xo6A2Y4UNZDnn1MYFpiuVwgb
         6b1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697094949; x=1697699749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KXCX0IrmSUAHDEC+IloTWKmfzlKX5kVqCGXqvzJraC0=;
        b=dNFRAFB/VoepNs0YgVai1X/+zei8Ujti4+ceTY4U5oFbWw8rBUcOt4Iy3fIf3GWenz
         g1VvSPiZQLs5xFlTCIREqvFBBpEag/+LSjcNURIPdGB7LWWOguVLkipXnYu6CSpwmajI
         qksbjqWOIuy7GW9uK72N0NFkfXPY4S6hZBVQZnEta00e4Au+uE4UBqy+s1feS/qLh1nP
         xpFgmL0u0hgOk+a8MuVwLg4GJssmus0iy0c6g6EW0YnbWJYXW7hsAJ4NxCFXBvwoMkq2
         MQkbBxARf5yoVeGSCJ7hZfTVXtUBS83zMCJUja6E/mAQd0Riux9Xdh0Je7ysHMYzYYgw
         hYZA==
X-Gm-Message-State: AOJu0YyhMZPP7bSkEInen4mJ4CTy0iuwI51Y2a2nUe6lFqqVgBy3A/mD
	Z0rH+e8hGnPj7l00SNXBvp7nVpdD+b1LYgcClm6k9w==
X-Google-Smtp-Source: AGHT+IF8ZVCCfIFHscwR+LhyeBNqMXqYxxa5f++Vy8Gg5L6iDKMU8VQSX5qkaLQ8psvTbqv+62pjxw==
X-Received: by 2002:a05:600c:214f:b0:406:513d:738f with SMTP id v15-20020a05600c214f00b00406513d738fmr20891443wml.2.1697094948360;
        Thu, 12 Oct 2023 00:15:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:3fed:c1e5:145f:8179? ([2a01:e0a:999:a3a0:3fed:c1e5:145f:8179])
        by smtp.gmail.com with ESMTPSA id l16-20020a7bc450000000b0040536dcec17sm20897533wmi.27.2023.10.12.00.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 00:15:47 -0700 (PDT)
Message-ID: <11d6a463-4e00-4407-9d93-2f9d190c4be3@rivosinc.com>
Date: Thu, 12 Oct 2023 09:15:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/13] riscv: report more ISA extensions through
 hwprobe
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>, Evan Green <evan@rivosinc.com>,
 Conor Dooley <conor@kernel.org>
References: <20231011111438.909552-1-cleger@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20231011111438.909552-1-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_001552_565556_7AA794C2 
X-CRM114-Status: UNSURE (   9.51  )
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

T24gc2Vjb25kIHRob3VnaHQsIG1heWJlIGl0IHdvdWxkIG1ha2UgbW9yZSBzZW5zZSB0byBzcXVh
c2ggYWxsIGxvZ2ljYWwKY29tbWl0cyB0b2dldGhlciAoZHQtYmluZGluZ3MsIGh3cG9yb2JlLCBl
dGMpIHdpdGggYWxsIHRoZSBJU0EKZXh0ZW5zaW9ucyBpbiBlYWNoLiBUZWxsIG1lIGlmIHlvdSB0
aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIuCgpDbMOpbWVudAoKT24gMTEvMTAvMjAyMyAxMzoxNCwg
Q2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+IEluIG9yZGVyIHRvIGJlIGFibGUgdG8gZ2F0aGVyIG1v
cmUgaW5mb3JtYXRpb24gYWJvdXQgdGhlIHN1cHBvcnRlZCBJU0EKPiBleHRlbnNpb25zIGZyb20g
dXNlcnNwYWNlIHVzaW5nIHRoZSBod3Byb2JlIHN5c2NhbGwsIGFkZCBtb3JlIElTQSBleHRlbnNp
b25zCj4gcmVwb3J0LiBUaGlzIHNlcmllcyBhZGRzIHRoZSBmb2xsb3dpbmcgSVNBIGV4dGVuc2lv
bnMgc3VwcG9ydDoKPiAKPiAtIFpmaFttaW5dCj4gLSBadmZoW21pbl0KPiAtIFppaGludG50bAo+
IC0gWnZiYgo+IC0gWnZiYwo+IC0gWnZrYgo+IC0gWnZrZwo+IC0gWnZrbmVkCj4gLSBadmtuaFth
Yl0KPiAtIFp2a3NlZAo+IC0gWnZrc2gKPiAtIFp2a24KPiAtIFp2a25jCj4gLSBadmtuZwo+IC0g
WnZrcwo+IC0gWnZrc2MKPiAtIFp2a3NnCj4gLSBadmt0Cj4gCj4gQ2zDqW1lbnQgTMOpZ2VyICgx
Myk6Cj4gICByaXNjdjogZmF0b3JpemUgaHdwcm9iZSBJU0EgZXh0ZW5zaW9uIHJlcG9ydGluZwo+
ICAgcmlzY3Y6IGFkZCBJU0EgZXh0ZW5zaW9uIHByb2JpbmcgZm9yIFp2KiBleHRlbnNpb25zCj4g
ICByaXNjdjogaHdwcm9iZTogZXhwb3J0IFp2KiBJU0EgZXh0ZW5zaW9ucwo+ICAgZHQtYmluZGlu
Z3M6IHJpc2N2OiBhZGQgWnYqIHJhdGlmaWVkIGNyeXB0byBJU0EgZXh0ZW5zaW9ucyBkZXNjcmlw
dGlvbgo+ICAgcmlzY3Y6IGFkZCBJU0EgZXh0ZW5zaW9uIHByb2JpbmcgZm9yIFpmaC9aZmhtaW4K
PiAgIHJpc2N2OiBod3Byb2JlOiBleHBvcnQgWmZoL1pmaG1pbiBJU0EgZXh0ZW5zaW9ucwo+ICAg
ZHQtYmluZGluZ3M6IHJpc2N2OiBhZGQgWmZoL1pmaG1pbiBJU0EgZXh0ZW5zaW9ucyBkZXNjcmlw
dGlvbgo+ICAgcmlzY3Y6IGFkZCBJU0EgZXh0ZW5zaW9uIHByb2JpbmcgZm9yIFppaGludG50bAo+
ICAgcmlzY3Y6IGh3cHJvYmU6IGV4cG9ydCBaaGludG50bCBJU0EgZXh0ZW5zaW9uCj4gICBkdC1i
aW5kaW5nczogcmlzY3Y6IGFkZCBaaWhpbnRudGwgSVNBIGV4dGVuc2lvbiBkZXNjcmlwdGlvbgo+
ICAgcmlzY3Y6IGFkZCBJU0EgZXh0ZW5zaW9uIHByb2JpbmcgZm9yIFp2ZmhbbWluXQo+ICAgcmlz
Y3Y6IGh3cHJvYmU6IGV4cG9ydCBadmZoW21pbl0gSVNBIGV4dGVuc2lvbnMKPiAgIGR0LWJpbmRp
bmdzOiByaXNjdjogYWRkIFp2ZmhbbWluXSBJU0EgZXh0ZW5zaW9uIGRlc2NyaXB0aW9uCj4gCj4g
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCB8IDEyNyArKysr
KysrKysrKysrKysrKysKPiAgRG9jdW1lbnRhdGlvbi9yaXNjdi9od3Byb2JlLnJzdCAgICAgICAg
ICAgICAgIHwgIDY1ICsrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgg
ICAgICAgICAgICAgICAgfCAgMjEgKysrCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9o
d3Byb2JlLmggICAgICAgICB8ICAyMSArKysKPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVy
ZS5jICAgICAgICAgICAgICAgIHwgIDIxICsrKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlz
Y3YuYyAgICAgICAgICAgICAgICAgfCAgNTMgKysrKysrLS0KPiAgNiBmaWxlcyBjaGFuZ2VkLCAy
OTQgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
