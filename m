Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A8FC021A5
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 00:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6OzlSLmEDxmTZGGOWjgBQ1lVLRqdyG9JO3abRrCdyvI=; b=FcyO1Js5+Zbttz
	qCT7KDa6g0v4Sfnmnz/OrQVK3+9TvMn0hQDqF6jCxQxMB3Xf7TdGxYTzMCuCdv9OZZb3DRJwLQvPw
	bDYly2PuwWyTJrNPcbL2KB2+dhtT0NNRBWhDAYVN2TQYhpc5KeOIcTUOoDftVYUivCynEDlzqbUNH
	d9k/2bL9wQQLnX2OV4IsQgf8kngAbSzZgLQnPtoS06TKLShfAqIrcZzcqbzBAI4Uojlx2iECkndyz
	L0GaBBkmlZimvc0qaQAy6RUp3dPSpYr8xDyvpyUJD4Hv/rangt6GBlLIY49/ZRx/iaQNM7K5UTRn8
	SdqFgg0+tZJSK5qOQ/dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thdrZ-00000001w2t-1LvA;
	Tue, 11 Feb 2025 00:10:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbS9-00000001VWm-2kr1
	for linux-riscv@bombadil.infradead.org;
	Mon, 10 Feb 2025 21:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NTEMNxwWUDdJDHTSWR5BaYosnBDapUg7Ev6g031TeV8=; b=Tw26OiWB/v6EZDCoBFcd7+afXN
	MBJNb5jmNlACGdHtAzXRQxXtSLcG7y2EolLJTBP5u/s4IdbH+R/8DwtIeRIUYrNjFe6kFI3Fupz9U
	q00YQzF6+ZLPldauviizvE2Ac5vDbyyH1rsDhTvzXFHYUBOpBVy6QoHkLEDGJpge0ho2HM/FDrSsy
	lgJp+28Twm0h2cJE48LfM3Eh0XTD0YgUsrBLs4nkkTvbAcRYByDm579GWfwnzaTzNUDaRRFTHm49B
	Ywut5sGAHSDQQbfSZu1ruL/kIrlV06NC1CxKdUFFRHsdaRKX6AgqMi0mryRJUpDaqw7To0xLbGCpk
	GveB75LA==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbS0-00000000I9i-1cV9
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 21:36:27 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38dcf8009f0so1647768f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 13:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739223374; x=1739828174; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTEMNxwWUDdJDHTSWR5BaYosnBDapUg7Ev6g031TeV8=;
        b=dbu+XeA9MAYnScbolaP3CtUclJ44e2xkxUSdbinjC8eghPDi+x33nOQXL2LNQc7twz
         +vGh8fE3H+jxLRV0G4K+HhrXeGs2p4WOO+IiochBPUldmKcrJrrtlP9PqFZlDCjcdaZG
         ryaFDprPzu7K1gfamAElAuCMZuP2t4IWqgVepxExxvlgd9aHsQm6fHzI5tDZML82iCty
         IbGzQXbeGwrhArmeMjVyin03Db3y3EeeZM0z+zEV4bH3PTTTQK1hk/y+a9y6y4mBIFWb
         2pMKOQZp5CdA+r92dZX1SwYO4Ad7e7N1WCiP3EBHbGI2IMifDW15LnhDPrt/Z0cI4OiS
         0lxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223374; x=1739828174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTEMNxwWUDdJDHTSWR5BaYosnBDapUg7Ev6g031TeV8=;
        b=ULUPEl6TOonEbP/gvGAJD72xWTSOlQoVP43vAkg7Y0UMdmoEVad6eRGpBctmek3Bmz
         om370yDlPlkXbxdtT7YFSaayGLKtsb+vQUhNKx/e+s8y6rfNUtc1Elr0ATqg8iZ7yY9Y
         EZ2fhqeYdsEeuZ7fZTGR0ZhYpjyiPk4ZzQHqE7NjUDprKMzHIrG+ZwnzHij2Vmo0b4N2
         BZpeJKxYMj62Syb8z9dyUttOI7ZDMVTN7L6E50LEW4rinRVS9uNIo+LIxzkAYWxSZW5U
         Il0mNJn06PwAzAj8YVCv/DqIJ7IcXDk4eoL7eKOFRSk/kCkRaL/fIvaxNBDb36McK6Gq
         psiA==
X-Forwarded-Encrypted: i=1; AJvYcCWE6ZKNnPNi8ChWBlzhZd/sMRar2jKTeSb7du1QVssDhHNilzYhAy/Ba6mmfiV/OXNusiVKtonvtMUdZw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwITnF8mygWyTcnNErw218rvOg0n04V/Au2N0eISxDBuf9zgI4/
	lDIT0xFoEznVuZw4GSfot4zOietZ7GSR3biWJxCe7hwrjC1G6jQPFNSRqk+71Lg=
X-Gm-Gg: ASbGncu7/p/GvWgmNPz70YGeGrcNDKxkPTJIcgNW6L66Tk4EnrWRAXhvPUibdD1+bVT
	tOxr4wfO2vd6rRZ9BjnCrTJfjwMMGV2syiXe1h4epRtUuDQV2WEqgIwtiWPLJe+WDnpRs/iZjUZ
	gO8aPXlcaiRJeOQQEg9VFWttvnN1/asKJWc/oSbLWSKEeNV+5xUBS6VPlKmlSyhCvnBaadD3m4r
	5RDBgZKoy98lomoJ3KSwuKgeyW3VFIKqOVuJCjyNHXJt0fM+7DAoCZ8Et3pdst4udIYeNpmtLbi
	4DNddPRCTWt2qefm
X-Google-Smtp-Source: AGHT+IFeyF81bBn0bup3UjkgQ031iOdpi9/jVXiALJpdAtVQDgUVud0mvsDq+oa8j9/bPhnXjupeow==
X-Received: by 2002:a5d:5552:0:b0:38d:c2d7:b5a1 with SMTP id ffacd0b85a97d-38dc8dddd9amr9308427f8f.19.1739223374260;
        Mon, 10 Feb 2025 13:36:14 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm47541515e9.40.2025.02.10.13.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:36:13 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 08/15] riscv: misaligned: enable IRQs while handling misaligned accesses
Date: Mon, 10 Feb 2025 22:35:41 +0100
Message-ID: <20250210213549.1867704-9-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210213549.1867704-1-cleger@rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_213622_550326_C57288D3 
X-CRM114-Status: GOOD (  10.54  )
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

V2UgY2FuIHNhZmVseSByZWVuYWJsZSBJUlFzIGlmIHRoZXkgd2VyZSBlbmFibGVkIGluIHRoZSBw
cmV2aW91cwpjb250ZXh0LiBUaGlzIGFsbG93cyB0byBhY2Nlc3MgdXNlciBtZW1vcnkgdGhhdCBj
b3VsZCBwb3RlbnRpYWxseQp0cmlnZ2VyIGEgcGFnZSBmYXVsdC4KClNpZ25lZC1vZmYtYnk6IENs
w6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5l
bC90cmFwcy5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwcy5jCmluZGV4IDU1ZDlmMzQ1MDM5OC4uM2VlY2MyYWRkYzQxIDEwMDY0NAotLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMK
QEAgLTIwNiw2ICsyMDYsMTEgQEAgZW51bSBtaXNhbGlnbmVkX2FjY2Vzc190eXBlIHsKIHN0YXRp
YyB2b2lkIGRvX3RyYXBfbWlzYWxpZ25lZChzdHJ1Y3QgcHRfcmVncyAqcmVncywgZW51bSBtaXNh
bGlnbmVkX2FjY2Vzc190eXBlIHR5cGUpCiB7CiAJaXJxZW50cnlfc3RhdGVfdCBzdGF0ZSA9IGly
cWVudHJ5X2VudGVyKHJlZ3MpOworCWJvb2wgZW5hYmxlX2lycXMgPSAhcmVnc19pcnFzX2Rpc2Fi
bGVkKHJlZ3MpOworCisJLyogRW5hYmxlIGludGVycnVwdHMgaWYgdGhleSB3ZXJlIGVuYWJsZWQg
aW4gdGhlIGludGVycnVwdGVkIGNvbnRleHQuICovCisJaWYgKGVuYWJsZV9pcnFzKQorCQlsb2Nh
bF9pcnFfZW5hYmxlKCk7CiAKIAlpZiAodHlwZSA9PSAgTUlTQUxJR05FRF9MT0FEKSB7CiAJCWlm
IChoYW5kbGVfbWlzYWxpZ25lZF9sb2FkKHJlZ3MpKQpAQCAtMjE3LDYgKzIyMiw5IEBAIHN0YXRp
YyB2b2lkIGRvX3RyYXBfbWlzYWxpZ25lZChzdHJ1Y3QgcHRfcmVncyAqcmVncywgZW51bSBtaXNh
bGlnbmVkX2FjY2Vzc190eXBlCiAJCQkJICAgICAgIk9vcHMgLSBzdG9yZSAob3IgQU1PKSBhZGRy
ZXNzIG1pc2FsaWduZWQiKTsKIAl9CiAKKwlpZiAoZW5hYmxlX2lycXMpCisJCWxvY2FsX2lycV9k
aXNhYmxlKCk7CisKIAlpcnFlbnRyeV9leGl0KHJlZ3MsIHN0YXRlKTsKIH0KIAotLSAKMi40Ny4y
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
