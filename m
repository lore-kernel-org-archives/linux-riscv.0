Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8974BC369C2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 11:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhByPjX6lU4I56jvksv4bOPf5wyZB2OPiWPVGcfj57Y=; b=ku4+mbbpYrTwZPydi3m7ot8/+p
	gDYaAIJCbd8Deop1S3TV+xDj34RApiLinLv4eS3Gu3UyhqYaRciCI1MYdsJIvHP9zurdKsepLBe8b
	2x9bmnXtwqSOITPt+SU4Wr0W6CcJTfo08ZnxAeQ8dk8EcQ8nQ3+CgVSqkHjgoMfphI643WG6MC3Zj
	+aMCJO4jzBkAjmMkZc0boRwegqogO+0VYzZa61lF2yY/Hcb7sXeiNnFP8prto1MeImnWByyrRnwCv
	F7iD4mE3awrBfWRXkq4QAZ7KzbnFe1YUNOTCjUlBuus+BjvW2gett8CurUd1TugiJcwVvfuPKBw3v
	vInpoz1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BPg-00000006s2s-1s8s;
	Tue, 22 Apr 2025 11:03:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Aju-00000006jDt-2yGz
	for linux-riscv@bombadil.infradead.org;
	Tue, 22 Apr 2025 10:20:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=bj+0Q+EB1V2pPyRxQBEmN/DJlQu1UVnuS3zStM7Ud70=; b=estGReGCL1N4Abde2jMO8kYwny
	TBVTPQ3Bh+Bt4lpm+aKWsCevNucmqjT5ABVHThQAuCMXLzNHQZh7WI2ViNl209RW5mMwu/yciEBPl
	nDqlmcVMzBaVqO1RVWP+U0iumOseQPFzt0XdOH6RFTXAWrxuW/HW5f58LRC15UYJCrff96nGd/joY
	oALv3q2C2439xpM9HOSUO0zcPo1pu52DFyfi4yzf6dmaf3zE22xDy5HBrvpcSe4D51DsflTgBv+vY
	Jm6NTpyoYctIxxLtBcxcIg/7JyREK1L085kqRtPz01cXaxWDVMXIOK63Ne9J/z8RcLI96a0PNr6Ht
	iQTIxU0A==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7Ajr-0000000BB0X-0nt5
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 10:20:29 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so45653995e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 22 Apr 2025 03:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745317224; x=1745922024; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bj+0Q+EB1V2pPyRxQBEmN/DJlQu1UVnuS3zStM7Ud70=;
        b=SgKiGlKZgyVOJyFTdOri8lQV1cdLohtitj0EpPDTsWx8VnBnS5d4tIwVpkhZQxhUCH
         dyIjxCSd6gUirbcOqgjEmZBBLRHj3yOMLpM1j7Bp+uGrabL7jr3lgH71bVN/DLCRE4vy
         hyaqgYNiuOLpotxrmsivCeCHwHRdiJrqf6dX02qY92HPtjr6pj4iSqg05uy3lLJhne85
         mpGzt7bjXU5xIXNJfbwwzX3PbsJc/roKPV7HtECp9DTT+J/0wZ3sTIOcufzi/DYvGI5O
         CxdbMNxWc8zXGqGmwHOwPOiG+CIHtT8E0EPiIkNWOEgOpOpBQnRvC552LSGhOnjnToGN
         Hs2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745317224; x=1745922024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bj+0Q+EB1V2pPyRxQBEmN/DJlQu1UVnuS3zStM7Ud70=;
        b=ZN1Be7s+ETyx38BPXdWOa/c3wNFUE+Pg4i4Ym1LHdSX919KiSvZWj+GhfdEgtz6cl7
         jXUMsbsMfjQp+6/FepJP+//RPclNB5ln0ZhrFkDMLClb9W9HzgqlZtdYGL+xoCbg6nWE
         vTR76z1N3i/BRVuudjeaFwRNb2IXxH6oJ4fFjSMiPXSAgfhwptQ6685XI0+NtstTOyga
         ZvCNjlsx/VxPqsK6S9oKYb6c/j7mccalL9pFEBe0upsmG9OGnkReRaGxUvsxCSdFkL3w
         8lWqI7pnR6i5J/XZZn0kJLss3cjjoHWqusDPmq1m03rWa4L+h8RXCUR4elKM4/gMkzNt
         CWgA==
X-Forwarded-Encrypted: i=1; AJvYcCVgaE21OBmF0UuN/LoSTmvA5i7OpxmecsDmEN6x8On6S1/R1wj6QCkF6uyz7Yy7qZ/3Eko+MU6Qfuykzg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi5wUhGQynPNWnr++SOwtwY7ZXKI/cMQk3lFkSHguNbbxNJKXk
	CVZCZGVN8bLugczoFVHIWsYdYbLgEWKrziEFCnJxQJzOPkSciLVUrc1bJStyWv0=
X-Gm-Gg: ASbGncsvICbUtJyUWGQklZ/vmR9hoFaubb+bYPHDNp3Dzift/EgEGla+IjT4V0CGbIN
	WUwGA90REW285XaF/EDBTF0HsBrMG18sATk1pyBOCvasp6uLlP3/IaC4duR6ATPQTRN1f43NAKG
	52GQ2D68pm9w7Pmm7NRR+oP17lLWwU8aIWQaUBzkQz+xF3MPCEF2AksER5iD9MYjRWCqHwaaAQL
	Upp0ZCBWWiKE0ndgNT45uJYajxXb2Jxvug3OX0qUFnj5M3cJ2Qy3QCEx1zzFlVLImJrZCkbGvK8
	QPPYJoZT6C2HtwBAexjjf3d7V5hDGoun7tgoWxdderL+NMn6QIJIhHEgivO5C5PtI3bhD7jp5Zo
	wkq0TPmjb
X-Google-Smtp-Source: AGHT+IExxiC1/7BEDxlUOLO/mtxEuxbqvG4oZX6ER4Jw2XdzzKvzbDTjBvuvcHjBv9h1dlP2oFw8qQ==
X-Received: by 2002:a5d:6d88:0:b0:39a:d20b:5c14 with SMTP id ffacd0b85a97d-39efbad3217mr11799503f8f.36.1745317224351;
        Tue, 22 Apr 2025 03:20:24 -0700 (PDT)
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5acc5dsm171044195e9.9.2025.04.22.03.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 03:20:23 -0700 (PDT)
Message-ID: <fff7f6f1-8fb6-4ff9-8f13-cf0e2a9ecb1a@linaro.org>
Date: Tue, 22 Apr 2025 12:20:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] riscv: Fix typo EXRACT -> EXTRACT
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
References: <20250422082545.450453-1-alexghiti@rivosinc.com>
 <20250422082545.450453-2-alexghiti@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250422082545.450453-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_112027_341530_4F17FAB9 
X-CRM114-Status: UNSURE (   7.02  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjIvNC8yNSAxMDoyNSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IFNpbXBseSBmaXggYSB0
eXBvLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9z
aW5jLmNvbT4KPiAtLS0KPiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi5oIHwgMiArLQo+
ICAgYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgICAgfCAyICstCj4gICAyIGZpbGVzIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBQaGlsaXBw
ZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
