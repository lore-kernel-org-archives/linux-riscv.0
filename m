Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE87ECDB474
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 01:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:
	Date:In-Reply-To:From:Subject:Mime-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OAL7V8t18uWHUSGArIishFLygdPFT+PNbe+HbITuIuw=; b=THbq6F82Zfi6T5
	5PCU9RwpB8onjEYxtqpEtfMSiq2MrwAcgcSLCq0mFWVuS5XqWJr+Z+MZIur5xv1N4bxRPjeRiPX/B
	g2RFnpnycGIDTmAWVBL+Nk60LjfRFKVTDabXbf8zuOrmBQh8oEPZP4nOlm3cjETBnrBoSbW1N49BQ
	K3dWJ4xWJS06OiD9ugtWgfspcUU7C7Ht900Fc9P/9CdhvjLEeflUzVpMG4iAhfKMe7Wgyg6Mv47LQ
	C+yrHVXjpD9A8eDVD0C5Fally0jDpZdX1vOrxYM0oq/Zlrvf/OZCHpZ326AHofJ74A2b9WFtnkaod
	ZrUIbPmlpv28UW+c3PKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsvd0-00DYLW-1Z;
	Wed, 18 Oct 2023 01:45:42 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsvcx-00DYKp-2R
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 01:45:41 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1c9e06f058bso43845385ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 18:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1697593536; x=1698198336; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIoyMcQHZ0Qpe7BKvINLbeGCoM4NhndfXHONk8A0DuA=;
        b=iq05NSKY6oXJm9cfhtRJbOgWpY0p1frLRqWQV2feoM5ek8PDfgLzvllkJ31pDyHuPx
         YEOuAYawSgcVEhZH39ifofoBMeXYXxY/Q+3v5O1RsFHahROJSW4yZK0jcBYObNaoLCwX
         TWL0UYqsZs7Gnf/ZpwIODDcc7d+njKjJ6HTXIiaYvvkJQVJhkbyTkbAvPeliPi4+EEUo
         ntn/bEs/PlDRN4ypwDvmoa22GlRJGza8XrT+opo3s6g/xnMD/OSrv7CjEBb54d6OI6+m
         nIXWfHDdVbPtEGljWfCLIa1uTyLLXBkpdOYe9dzt0i3h/zHL38UFGBZOC/VgJ8p8D9PZ
         UNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697593536; x=1698198336;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIoyMcQHZ0Qpe7BKvINLbeGCoM4NhndfXHONk8A0DuA=;
        b=qIEt7F1OlKT4cuBmVFF+sbHAjUSLgk0BaZHzgRHIVpOoHbEu//WHkjoMbjTUFZXJNa
         YcGYg7aBu1hqHrIRVlv+y4x8+n5iumxcpPDUFGc5CKIIAyCOiv4sOWiza/uGvH3WN9nH
         VeucxHKTRmEJ/vzL9pUuG+RqvmYIaJHWMajTMoCE+2UBwg+t0O/SYqLJqX6ZVWb+uGhV
         D0Z5jaqXpUPl+q/2CMzsDTz8t/b4INKD929zicUvS7BICYmYEAYzyXeACT/AbFKxlFwe
         Yi/sRwypj5K9lPKHU5M/EnjQKUYYZubAjfbo2KM0+OD2YAtx/VOkima1o5K716dXMX7c
         3stA==
X-Gm-Message-State: AOJu0YzNH9vl4/AUd2qvMS1Z+Fb4bp5OCxLTOOZ7LxRBCGsKBaHjNlg1
	5Vt0W6mrMu1msvBn2e+HFu5+QA==
X-Google-Smtp-Source: AGHT+IEhf4Aw5KzsP/CJeC+Xlre2SWvSR0H6szLH78PgMiwD0/+840q7dozZd2G8H0QR1O26UaYkUA==
X-Received: by 2002:a17:902:e5c3:b0:1b0:3ab6:5140 with SMTP id u3-20020a170902e5c300b001b03ab65140mr5806185plf.4.1697593536621;
        Tue, 17 Oct 2023 18:45:36 -0700 (PDT)
Received: from ?IPv6:2402:7500:5ce:a18a:d02c:5aee:75ae:ccc2? ([2402:7500:5ce:a18a:d02c:5aee:75ae:ccc2])
        by smtp.gmail.com with ESMTPSA id q11-20020a170902dacb00b001c746b986e5sm2247981plx.45.2023.10.17.18.45.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Oct 2023 18:45:36 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH v2 05/19] riscv: add ISA extension parsing for vector
 crypto extensions
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231017131456.2053396-6-cleger@rivosinc.com>
Date: Wed, 18 Oct 2023 09:45:30 +0800
Cc: linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>,
 Evan Green <evan@rivosinc.com>,
 Conor Dooley <conor@kernel.org>,
 Samuel Ortiz <sameo@rivosinc.com>
Message-Id: <DA8B4610-D514-4733-B875-C247FFCCC7AA@sifive.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
 <20231017131456.2053396-6-cleger@rivosinc.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_184539_888733_EDFD9181 
X-CRM114-Status: UNSURE (   8.07  )
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
Reply-To: 20231017131456.2053396-6-cleger@rivosinc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gT2N0IDE3LCAyMDIzLCBhdCAyMToxNCwgQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3Np
bmMuY29tPiB3cm90ZToKPiBAQCAtMjIxLDYgKzI2MSwyMiBAQCBjb25zdCBzdHJ1Y3QgcmlzY3Zf
aXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKPiAJX19SSVNDVl9JU0FfRVhUX0RBVEEo
emt0LCBSSVNDVl9JU0FfRVhUX1pLVCksCj4gCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHprc2VkLCBS
SVNDVl9JU0FfRVhUX1pLU0VEKSwKPiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemtzaCwgUklTQ1Zf
SVNBX0VYVF9aS1NIKSwKPiArCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2YmIsIFJJU0NWX0lTQV9F
WFRfWlZCQiksCj4gKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmJjLCBSSVNDVl9JU0FfRVhUX1pW
QkMpLAo+ICsJX19SSVNDVl9JU0FfRVhUX0RBVEEoenZrYiwgUklTQ1ZfSVNBX0VYVF9aVktCKSwK
ClRoZSBgWnZrYmAgaXMgdGhlIHN1YnNldCBvZiBgWnZiYmBbMV0uIFNvLCB0aGUgYFp2a2JgIHNo
b3VsZCBiZSBidW5kbGVkIHdpdGggYFp2YmJgLgoKKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmJi
LCBSSVNDVl9JU0FfRVhUX1pWQkIpLAorCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2YmIsIFJJU0NW
X0lTQV9FWFRfWlZLQiksCisJX19SSVNDVl9JU0FfRVhUX0RBVEEoenZrYiwgUklTQ1ZfSVNBX0VY
VF9aVktCKSwKCm9yCgorCV9fUklTQ1ZfSVNBX0VYVF9CVU5ETEUoenZiYiwgcmlzY3ZfenZiYl9i
dW5kbGVkX2V4dHMpLAorCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2a2IsIFJJU0NWX0lTQV9FWFRf
WlZLQiksCgpbMV0KaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWNyeXB0by9ibG9iL21h
aW4vZG9jL3ZlY3Rvci9yaXNjdi1jcnlwdG8tdmVjdG9yLXp2a2IuYWRvYwoKLUplcnJ5Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
