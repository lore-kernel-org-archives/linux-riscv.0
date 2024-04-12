Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAB0C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 06:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HRkK5JLUjSd3c4Ht8r5i6PGIVCfC60w84kg1y0rhn/g=; b=OnkrWav4wP12CF
	D0cgNl7spoM9tqUD3W55YwXtg+pPcE/1fI2K2I4M7d1idwStyZdItUpqENoOr/w9s1FhbVXTFRWC1
	wBqwuPy3Kobo6/eIbS8mQNwZbOuijM6PU2lImRdTLEg/9eLoI/2thPfjUWuloXjmvb5hNSC3hHJTc
	g/6A2BYP92ZmixbixwrxGkkZBVeTAW6OB6m8GRFCpixNzNPvHUUIcCoOsaCiZAlShxtGIlyD3UwL5
	WCRNy0vCIGJpJ7if3rMWlmUKWh8W5YBhSkuFvKUeRyeK2fBuQ25hzHBtDCx0xG3USpW/iuGeOPJJ/
	5jASUnA7x2uZtHDIOOyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvAir-0000000FdM5-3OL9;
	Fri, 12 Apr 2024 06:49:17 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvAio-0000000FdJg-2UQI
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 06:49:16 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1e5aa82d1f6so1522915ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 23:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712904554; x=1713509354; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OADn3kHEewLkE3kxFhkvk62eojDLq3ulyri6MOmjFqk=;
        b=KwgN23MlPFkiMxQxAtnFM7ZUkiDpTDCwR7/u4v1h9Udm1WEqSjFvbUrj5Ipg3Edv2p
         OMwkxTbsNrCNTIZawDQlYqlsZyQQAeBCVl+gyqOtq8fADun11Vi9xUN0aDeeB3mrkDO5
         eTrLMMz4OGKDKQWAG4iWmoubvsiRqHZsuTqR7tPzIoIK87RKPzWiGrN24WHNVwXQXYhx
         Ejqf4Wdv0JV5zFg/raf2hDv3ZmhqIZ5CJSLBPw4jkTrbkMgp/oPzo72AxcWt8oK4Fvz5
         HgY1QtRv8Y52ylv5WqDIKnr51X5c18DGDpP95cPeNO7H/CQiYg4lWuMn3JKnfI4pmxI8
         ihkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712904554; x=1713509354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OADn3kHEewLkE3kxFhkvk62eojDLq3ulyri6MOmjFqk=;
        b=KWsOS8O0l28vCNz2p1K9vNUOaGZx6zLVUjSsYijwMEuqChKGs8fRV8Y2ExRGwvpSZO
         o+OYnHZuixE7mVG+/+U2kqqBmTdrvZCLa082DHvpOom4bv+nkHtbMtvNf2xQ8+UegfXa
         k26Uqpt8eehThxNBBt/qFm/Jsp8ajO2WWXmTeoOhSbkBNXO3UUJW+Wz5qIybzXMTaujm
         7RQgHUkWzcZJs24P100DZdSDJ/WKeUTrJKNsKJTqqsRLxBoVX06aI3uwr2VBcwnnPFcX
         aIB6nQ8SLaBAbBZoHC3GCMqztqVyYjsybC0HczUjR9plqFhf8T7qWPeK9jchZ8wtJu3E
         LnYA==
X-Gm-Message-State: AOJu0YxdTSjXrDNNEZvWSGzqcrHuIGSiokFi27hmWurJCuGPe51IyH/T
	1qeqB/YFvrXNjAyc/QS8jOCJu0NrbuI8Z83XoMoV0DDxg+yVKiNhktZYGCR5Ucc=
X-Google-Smtp-Source: AGHT+IFbQ2c5TpJxdrKyUl2ru1yHmpDc6XY0Qm2Yv9aIIgLh9stQZB1+mDwKdX6s0oRU3mLmFdEA7w==
X-Received: by 2002:a17:902:cec1:b0:1e3:ce12:ef77 with SMTP id d1-20020a170902cec100b001e3ce12ef77mr2423696plg.11.1712904553854;
        Thu, 11 Apr 2024 23:49:13 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q8-20020a170902b10800b001e107222eb5sm2258818plr.191.2024.04.11.23.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 23:49:13 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 12 Apr 2024 14:48:59 +0800
Subject: [PATCH v4 3/9] riscv: cpufeature: call match_isa_ext() for
 single-letter extensions
MIME-Version: 1.0
Message-Id: <20240412-zve-detection-v4-3-e0c45bb6b253@sifive.com>
References: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
In-Reply-To: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>, 
 Andy Chiu <andy.chiu@sifive.com>, Guo Ren <guoren@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Vincent Chen <vincent.chen@sifive.com>, 
 Greentime Hu <greentime.hu@sifive.com>, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13-dev-a684c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_234914_699947_0A36032C 
X-CRM114-Status: GOOD (  11.57  )
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

U2luZ2xlLWxldHRlciBleHRlbnNpb25zIG1heSBhbHNvIGltcGx5IG11bHRpcGxlIHN1YmV4dGVu
c2lvbnMuIEZvcgpleGFtcGxlLCBWZWN0b3IgZXh0ZW5zaW9uIGltcGxpZXMgenZlNjRkLCBhbmQg
enZlNjRkIGltcGxpZXMgenZlNjRmLgoKRXh0ZW5zaW9uIHBhcnNpbmcgZm9yICJyaXNjdixpc2Et
ZXh0ZW5zaW9ucyIgaGFzIHRoZSBhYmlsaXR5IHRvIHJlc29sdmUKdGhlIGRlcGVuZGVuY3kgYnkg
Y2FsbGluZyBtYXRjaF9pc2FfZXh0KCkuIFRoaXMgcGF0Y2ggbWFrZXMgZGVwcmVjYXRlZApwYXJz
ZXIgY2FsbCB0aGUgc2FtZSBmdW5jdGlvbiBmb3Igc2luZ2xlIGxldHRlciBleHRlbnNpb25zLgoK
U2lnbmVkLW9mZi1ieTogQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KLS0tCkNoYW5n
ZWxvZyB2MzoKLSBSZW1vdmUgc2V0X2JpdCBmb3Igc2luZ2xlLWxldHRlciBleHRlbnNpb25zIGFz
IHRoZXkgYXJlIGFsbCBjaGVja2VkIGluCm1hdGNoX2lzYV9leHQuIChDbMOpbWVudCkKLS0tCiBh
cmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCAxMSArKysrKy0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJl
LmMKaW5kZXggZDIyYjEyMDcyNTc5Li5mNmYzZWNlNjBkNjkgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlz
Y3Yva2VybmVsL2NwdWZlYXR1cmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJl
LmMKQEAgLTQ2OCwxNiArNDY4LDE1IEBAIHN0YXRpYyB2b2lkIF9faW5pdCByaXNjdl9wYXJzZV9p
c2Ffc3RyaW5nKHVuc2lnbmVkIGxvbmcgKnRoaXNfaHdjYXAsIHN0cnVjdCByaXNjCiAKIAkJaWYg
KHVubGlrZWx5KGV4dF9lcnIpKQogCQkJY29udGludWU7CisKKwkJZm9yIChpbnQgaSA9IDA7IGkg
PCByaXNjdl9pc2FfZXh0X2NvdW50OyBpKyspCisJCQltYXRjaF9pc2FfZXh0KCZyaXNjdl9pc2Ff
ZXh0W2ldLCBleHQsIGV4dF9lbmQsIGlzYWluZm8pOworCiAJCWlmICghZXh0X2xvbmcpIHsKIAkJ
CWludCBuciA9IHRvbG93ZXIoKmV4dCkgLSAnYSc7CiAKLQkJCWlmIChyaXNjdl9pc2FfZXh0ZW5z
aW9uX2NoZWNrKG5yKSkgeworCQkJaWYgKHJpc2N2X2lzYV9leHRlbnNpb25fY2hlY2sobnIpKQog
CQkJCSp0aGlzX2h3Y2FwIHw9IGlzYTJod2NhcFtucl07Ci0JCQkJc2V0X2JpdChuciwgaXNhaW5m
by0+aXNhKTsKLQkJCX0KLQkJfSBlbHNlIHsKLQkJCWZvciAoaW50IGkgPSAwOyBpIDwgcmlzY3Zf
aXNhX2V4dF9jb3VudDsgaSsrKQotCQkJCW1hdGNoX2lzYV9leHQoJnJpc2N2X2lzYV9leHRbaV0s
IGV4dCwgZXh0X2VuZCwgaXNhaW5mbyk7CiAJCX0KIAl9CiB9CgotLSAKMi40NC4wLnJjMgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
