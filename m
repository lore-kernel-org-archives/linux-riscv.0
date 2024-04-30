Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01971C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 12:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DqAzCjE7S8A6mD/f9CN0a+UY8l5D/c4C/YoMMLgOUqk=; b=zNSmQ8BlSAjNUW
	CsqO0PKZtgLe5hnfqvbQ3hp27oRpj2tH/NtgvuI7x8q9Yq1CFh82FQolE++gc++sqd/3xlq9/xFPB
	QslKhd+YBEr0EDGveya6UzQv6g8MJ+yzpClmXRYSbrQL7MNm92kQ1Pcumx3UZNWrUywe9gqmLBZ00
	TC7KwAEre+d4oHZcQezSzh4HIXLzBbPeYlHBiVGut/9PVXNZVXGINVUQ5u6yGc8zBiKDJ7SKhhya7
	wajeeFH7Xn4Qc8CUOlGxziZW1jOfmTpEfwqnk0J45ohlBW6fGU6WqAXlMJqEfbGBN1ZlDmrC7G9yZ
	iju6+TFTPjRSIkfxU9iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1mgK-00000006LLD-1VzP;
	Tue, 30 Apr 2024 12:34:00 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1mgG-00000006LGA-29FQ
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 12:33:57 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-51d9af6bf36so346808e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 Apr 2024 05:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714480428; x=1715085228; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8JYnpful/x3DE6HE/Q8pSIRWAs5wjh2Z17X6El2O6XQ=;
        b=F7lIUuGzNi1RCWbSdBeKQjgwFwmDl3wpZ6A1uLGIhYRgpCnNXKDFE3WTE1AwKuCSsL
         XRfEvnDO7Pok2kJ87K/nigiC/ofPsBdbOYoOP/X/Kh1kfgqB6kfmc7bdt2/7s1nA616q
         l2nv9sGXmlUVBf+sh7MFHPeAVMzDhiI79b+s25LF7wHGRFLwv0fkAcknTFNuGXPdGKN9
         WfWk3A/QXEZ2v25ZmzyxabWG2eeA/5TLbhyxQ6byAG/Zy2sqIyyac66wY4D9LNtXFHT1
         teJEGwj2CiLV4KeQn8nsY0af/5Tc+34seXJ04awulwhwihAkaSsWgSFRLuMkywrylZ+a
         bH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714480428; x=1715085228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8JYnpful/x3DE6HE/Q8pSIRWAs5wjh2Z17X6El2O6XQ=;
        b=akwoqAOrCAUQ+bTUAYMwZ6fE5okqs2iOdxhJZ3QLWnEaDLsHHPfAKfLPiZCCH6OmYf
         pJewGVXQC+L0id/o79xs9htZZZFEd7+z5/vqSMa9Xk2GNGKJAMBn70h7wzJ7w39bxR65
         eS6tWuxdMRn5bIKzv3RqFGg+2vD8PJVJQwVg3qqBLodt5Xh6qF1JXor/tsOm4/XGZt9E
         JjALs6rCrU5Pn1Jlsuuw/aqyqV2upU/DFbFn2KwX/XwItVXnw2zIE2pEX8jdFTiS7luX
         D1YN5m+iC6qxjRDuo/K4Lhzwk9yd2pkU71ZoiIzD/jhyrwlEf20FBKjrQ0ZAIp6sfj7Z
         Rf5g==
X-Forwarded-Encrypted: i=1; AJvYcCVgXJxB62/bKtAkMeMTJ5CKKbjTtKd8DY1OL7gyhHHHTWRi193qvc1fdZfFBN49RbHywj/tb6bccpATyf0tIiXGusBT2YHQnPV7xdRqEgZL
X-Gm-Message-State: AOJu0YwiOOl0jNKJsVQBdA3oRAX9kdWitlj8u4PMK6SrMgiOsnaGUP5R
	2tIho+aBEHxcfrTw8pNXbr60v8L67UzwF2KbLUg9oIKtFuYcxih6ojN6NPUHqJE=
X-Google-Smtp-Source: AGHT+IGh50yRx9fgD9SXLf1xEw2mn31RrUC8rB0v4vouvrUtYjpyhg94cyY1iBQpCTQRoHim5SrX3A==
X-Received: by 2002:a2e:910a:0:b0:2dd:60d3:7664 with SMTP id m10-20020a2e910a000000b002dd60d37664mr8644774ljg.5.1714480428077;
        Tue, 30 Apr 2024 05:33:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:c21b:67fd:90ab:9053? ([2a01:e0a:999:a3a0:c21b:67fd:90ab:9053])
        by smtp.gmail.com with ESMTPSA id c1-20020a5d4141000000b003436cb45f7esm550771wrq.90.2024.04.30.05.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 05:33:47 -0700 (PDT)
Message-ID: <770710b3-2495-41a6-9822-d9af9b13cef5@rivosinc.com>
Date: Tue, 30 Apr 2024 14:33:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] riscv: add ISA extensions validation
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20240429150553.625165-1-cleger@rivosinc.com>
 <20240429150553.625165-3-cleger@rivosinc.com>
 <20240429-subtext-tabby-3a1532f058a5@spud>
 <5d5febd5-d113-4e8c-9535-9e75acf23398@rivosinc.com>
 <20240430-payable-famished-6711765d5ca4@wendy>
 <dbcf0be9-eae6-4776-bc5b-c6fad58df9c3@rivosinc.com>
 <20240430-gratuity-refinish-29abb136c958@wendy>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240430-gratuity-refinish-29abb136c958@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_053356_579378_2417AA08 
X-CRM114-Status: GOOD (  11.78  )
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

CgpPbiAzMC8wNC8yMDI0IDE0OjEyLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gVHVlLCBBcHIg
MzAsIDIwMjQgYXQgMDE6NTg6MTFQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBZ
ZWFoLCBzZWUgd2hhdCB5b3UgbWVhbi4gSSB0aGluayB3ZSBhbHNvIG5lZWQgdG8gZGVmaW5lIGlm
IHdlIHdhbnQgdG8KPj4gZXhwb3NlIGFsbCB0aGUgSVNBIGV4dGVuc2lvbnMgaW4gL3Byb2MvY3B1
aW5mbyAoaWUgbm8gbWF0dGVyIHRoZSBjb25maWcKPj4gb2YgdGhlIGtlcm5lbCkgb3Igbm90LiBJ
ZiBzbywgYWRkaXRpb25hbCB2YWxpZGF0ZSgpIGNhbGxiYWNrIHdvdWxkIG1ha2UKPj4gc2Vuc2Uu
IElmIHdlIHdhbnQgdG8ga2VlcCB0aGUgZnVsbCBJU0Egc3RyaW5nIGluIC9wcm9jL2luZm8sIHRo
ZW4gd2UKPj4gd2lsbCBuZWVkIGFub3RoZXIgd2F5IG9mIGRvaW5nIHNvLgo+IAo+IElmIGV4dGVu
c2lvbnMgYXJlbid0IHVzYWJsZSwgdGhleSBzaG91bGRuJ3QgYmUgaW4gL3Byb2MvY3B1aW5mbyBl
aXRoZXIKPiBhcyB0aGVyZSdzIHByb2dyYW1zIHRoYXQgcGFyc2UgdGhhdCB0byBmaWd1cmUgb3V0
IHdoYXQgdGhleSBjYW4gdXNlLAo+IHBvc3NpYmx5IGV2ZW4gb25seSBjaGVja2luZyBhIHNpbmds
ZSBjcHUgYW5kIHVzaW5nIHRoYXQgYXMgZ29zcGVsLgo+IFRoYXQncyB3aHkgdGhlcmUncyB0aGF0
IHBlci1oYXJ0LWlzYSB0aGluZyB0aGF0IHdhcyBhZGRlZCBieSBvbmUgb2YgeW91cgo+IGNvbGxl
YWd1ZXMgbGFzdCB5ZWFyLgoKQWNrZWQuIFNvIGluZGVlZCwgdmFsaWRhdGUoKSBjYWxsYmFjayBm
b3IgRi9WIGRlcGVuZGVudCBleHRlbnNpb25zIG1ha2VzCnNlbnNlLgoKQ2zDqW1lbnQKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
