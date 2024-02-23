Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF30C5478C
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 05:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TqmrlWz9jovhakBHp/NgsPMS8NsqgS4b8jHBcNSMmuM=; b=Y8UFmRcdgFDkSO
	ULehBnMch+a8ngMKIbgGj53ruxBVe+EFErpzS2xW9xQLrgWzyTOV4tRFDXFGm+j3Bo6NCqeMrVIU2
	vl6P3hkDMDGEf6gBwmGXqXXm1dbsdFdOulFiYrOWOuYJkzl9fVe4YD6hwdeX115bbHWJqjk4No6av
	e3Dsk8qLK5HADWmb09sYF/XVBLwt+HqtoQzO+zRxkivB4IEm82GyV9N+d0iUbgni6AcqVdWR4h/nC
	CAy5hHLzP2HPFF9A1JJLDXJy8r5sqqcdLdV0Tz+nPt0SbW76z6GT1e+lsDOKnum3p76QIjeXCahw4
	v3i7YV1Ed3lxGd7QPlWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdNjr-00000007whW-2O09;
	Fri, 23 Feb 2024 05:04:47 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdNjf-00000007we1-0Hzz
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 05:04:36 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6e45bd5014dso192653b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 21:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1708664662; x=1709269462; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UPhDrNG7FCTiWQMJYLxp9PolkKl8ZWdLpsA0x+dysqo=;
        b=EwwL/uowyV11EN4E85zE/36NFvYgD9gtt2An99Q7tbCf1DWF3KImJf1A7sE2E/X9pe
         iNkdFpT/SIWkRckQz6oHJG6uSTeIMM8WEO16mG39qEx3WmBKJEGVxN5S+RZq4nLYkOKK
         1vRJz7dTUzv+qSAE3fvBKTdl8MPNdTTgnZFaJYaPkTLYcsnZdBZYh4aFYvmfBplctmjo
         wmgWh2R9RguBvY1c9ql2hsjNmA2et9ijq5MZXxC4mdOhc/sp2hnhKL9emkKZnljRmAza
         sqQ+VJs9/mFptbxPOPS9V+iNN02c3gAKIXRjhRjhccSDPHkSlkavWMDVdV9XoFa9/sHf
         6C8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708664662; x=1709269462;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPhDrNG7FCTiWQMJYLxp9PolkKl8ZWdLpsA0x+dysqo=;
        b=jSOg0wAWj/dM8GPAdY6DPXpeaqsaDNWIWA9ySNnkWMmsP2VBs1XgqhqRfeRml0VVAW
         WkIKO/uqJ+0Od0FP/66A3YEp5YVkSByqxUAKyscbxBFnBuPsHz/cz7I1leZebj1RnuGH
         ypBYclsHSHn/Ih8oj8HbCcvamcZy+F1cs1/QDJwPiCQUAtsvu+hXJ5fsKYZ8Ek6YCtXZ
         wJUiX8W/ontlNxmZTIWnEiaZ8sQ+Wcp/LqRva7//iX/qGMwQKcmGYRwWk8uWBAIWC9dc
         Ve+kAZZynGH+WzWHP2BmciskLQy0zt+xxUZshQL0zVW74wfOIdGLPKrktUBtpndQNCF/
         cGnw==
X-Forwarded-Encrypted: i=1; AJvYcCWav9iZkBw4DgQZah/bnORpwi5ta/SszMPD928Lma3PH6LDyBIuy7ztKIDnXitO5CFdGp+CgkH9ytWHxTV1RosDSHwFVzeztAzYdAe+GjAN
X-Gm-Message-State: AOJu0YytYymc/H8VAIzKwnwJoxtjhZhmbsfA7pkxYj2bJ7YkV7OwqkBR
	EOq87eW4E2IT2QqLyKCcB+N/ImDzqv2sjkcLbiDyLwRn0vOm0EQiryfMwlerL+1HQTnDdb3nG/G
	md2Q=
X-Google-Smtp-Source: AGHT+IHDbLwWrGaYFTn5YtMVGwDssbt7XwL5aJIwAvbyUVNAg21XbvzR0C4y4vyqi7Oy1GZ1nCLsJQ==
X-Received: by 2002:aa7:983a:0:b0:6e0:4556:4a1a with SMTP id q26-20020aa7983a000000b006e045564a1amr878552pfl.33.1708664661421;
        Thu, 22 Feb 2024 21:04:21 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p21-20020aa78615000000b006e0949b2548sm11159433pfn.209.2024.02.22.21.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 21:04:20 -0800 (PST)
Message-ID: <65d82754.a70a0220.c7e08.512b@mx.google.com>
Date: Thu, 22 Feb 2024 21:04:20 -0800 (PST)
MIME-Version: 1.0
X-Kernelci-Tree: riscv
X-Kernelci-Branch: fixes
X-Kernelci-Kernel: riscv-for-linus-6.8-rc4-8-gfc325b1a915f6
X-Kernelci-Report-Type: build
Subject: riscv/fixes build: 8 builds: 0 failed, 8 passed,
 2 warnings (riscv-for-linus-6.8-rc4-8-gfc325b1a915f6)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_210435_270795_D0F0C465 
X-CRM114-Status: UNSURE (   1.96  )
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

cmlzY3YvZml4ZXMgYnVpbGQ6IDggYnVpbGRzOiAwIGZhaWxlZCwgOCBwYXNzZWQsIDIgd2Fybmlu
Z3MgKHJpc2N2LWZvci1saW51cy02LjgtcmM0LTgtZ2ZjMzI1YjFhOTE1ZjYpCgpGdWxsIEJ1aWxk
IFN1bW1hcnk6IGh0dHBzOi8va2VybmVsY2kub3JnL2J1aWxkL3Jpc2N2L2JyYW5jaC9maXhlcy9r
ZXJuZWwvcmlzY3YtZm9yLWxpbnVzLTYuOC1yYzQtOC1nZmMzMjViMWE5MTVmNi8KClRyZWU6IHJp
c2N2CkJyYW5jaDogZml4ZXMKR2l0IERlc2NyaWJlOiByaXNjdi1mb3ItbGludXMtNi44LXJjNC04
LWdmYzMyNWIxYTkxNWY2CkdpdCBDb21taXQ6IGZjMzI1YjFhOTE1ZjZkMGM4MjFiZmNlYTIxZmIz
ZjEzNTRjNDMyM2IKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0CkJ1aWx0OiAxIHVuaXF1ZSBhcmNoaXRlY3R1cmUK
Cldhcm5pbmdzIERldGVjdGVkOgoKcmlzY3Y6CiAgICBkZWZjb25maWcgKGdjYy0xMCk6IDEgd2Fy
bmluZwogICAgZGVmY29uZmlnK0NPTkZJR19TTVA9biAoZ2NjLTEwKTogMSB3YXJuaW5nCgoKV2Fy
bmluZ3Mgc3VtbWFyeToKCiAgICAyICAgIHNlY3VyaXR5L3NlY3VyaXR5LmM6ODEwOjI6IHdhcm5p
bmc6IOKAmG1lbWNweeKAmSBvZmZzZXQgMzIgaXMgb3V0IG9mIHRoZSBib3VuZHMgWzAsIDBdIFst
V2FycmF5LWJvdW5kc10KCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CgpEZXRhaWxlZCBwZXItZGVm
Y29uZmlnIGJ1aWxkIHJlcG9ydHM6CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcg
KHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMSB3YXJuaW5nLCAwIHNlY3Rpb24g
bWlzbWF0Y2hlcwoKV2FybmluZ3M6CiAgICBzZWN1cml0eS9zZWN1cml0eS5jOjgxMDoyOiB3YXJu
aW5nOiDigJhtZW1jcHnigJkgb2Zmc2V0IDMyIGlzIG91dCBvZiB0aGUgYm91bmRzIFswLCAwXSBb
LVdhcnJheS1ib3VuZHNdCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcgKHJpc2N2
LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlz
bWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZGVmY29uZmlnK0NPTkZJR19TTVA9biAo
cmlzY3YsIGdjYy0xMCkg4oCUIFBBU1MsIDAgZXJyb3JzLCAxIHdhcm5pbmcsIDAgc2VjdGlvbiBt
aXNtYXRjaGVzCgpXYXJuaW5nczoKICAgIHNlY3VyaXR5L3NlY3VyaXR5LmM6ODEwOjI6IHdhcm5p
bmc6IOKAmG1lbWNweeKAmSBvZmZzZXQgMzIgaXMgb3V0IG9mIHRoZSBib3VuZHMgWzAsIDBdIFst
V2FycmF5LWJvdW5kc10KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRlZmNvbmZpZytDT05GSUdf
U01QPW4gKHJpc2N2LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAw
IHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kbm9tbXVfazIxMF9k
ZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywg
MCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBf
ZGVmY29uZmlnIChyaXNjdiwgY2xhbmctMTYpIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5n
cywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2sy
MTBfc2RjYXJkX2RlZmNvbmZpZyAocmlzY3YsIGdjYy0xMCkg4oCUIFBBU1MsIDAgZXJyb3JzLCAw
IHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
bm9tbXVfazIxMF9zZGNhcmRfZGVmY29uZmlnIChyaXNjdiwgY2xhbmctMTYpIOKAlCBQQVNTLCAw
IGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLQpGb3IgbW9yZSBp
bmZvIHdyaXRlIHRvIDxpbmZvQGtlcm5lbGNpLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
