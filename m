Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3467C48BF6
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 05:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZZ8EuQ2FBg5jZVTkf1seMH2ub7zp2dqW/riRk3XcqoM=; b=xc1Oo7Vnte4h9y
	zHWbSNFwOI5KZJpUd5EmTALyrK7h2P6JfSjyW7/CGHR61u6mJrqIjq9G58Q9wf/Pk+im/tkUzfPwX
	fgsH3IKeDulc4zvmfTtwJCSGMThnpVz/1/luvxxD4ca322WllOUx4GXGpbLEWxjkGHwg0EftRxB2H
	ab7qtsfxK/jkJHdKW/DmjZcXFs+C+lA/7iaThlnYoolMyCJM93+3nQHL5d/gHWa2COoip4+NTKNHU
	rNnUCHt+fD2icjIWpaDnldYjTuO7hwqOxMN7oKX8BnKkNWzlH/KTIo1RI+iDqU7TGJpQYw+kDUR4W
	U0HwK7xIu1JLcHvA2JDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfYdq-0000000C81b-0UX6;
	Thu, 29 Feb 2024 05:07:34 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfYdn-0000000C7zc-0cSl
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 05:07:32 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1dcad814986so5041395ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 21:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1709183246; x=1709788046; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C9gLjb3OEuSRdMJTCKb4yFPoWUD6chtHPJ13NEtxwpk=;
        b=jH66DEPdPdFIH1VPTlBhkm4guvOAOuyBkXT/JcO2EkdC6QRYdX8eQ6HBNfJaZ5eQnH
         XL4F393YjxYrD+46w6GH4apyJ18SgbV5k7uFLD5ixiUVItBrnLtNHgtHSzexr9EUEIfZ
         bu8wmzek5Qid8LpGOpGPJqq+QQHPeCjCiAOySERNqjRR0OuQN8HB19g7LX2F3x8Rw27M
         AIIfCRN/Vd6AOJu81GSSu7PlHoTa9FTcO0kY/gb+PJaA1XK6SOkkblQEatQ/bKB3aH6q
         /aXK+ishLpBul2P8d8t5rDsvSG7Ie26varizwCBsSpMHuMv9FTppvp3y4xyZS3Oi2Sv3
         GCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709183246; x=1709788046;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C9gLjb3OEuSRdMJTCKb4yFPoWUD6chtHPJ13NEtxwpk=;
        b=Q3Jzhy9TqsYjh4iTsOCnQs4kJB9ZLZKwQcEs3FNk4ZCsHvySkR3bf9D98Jo1srgiPg
         aKCCHA/8gM2AWP7NuGQJy96dk5kGD79zmXat/t3ai7qA0Mm2hENYZ8fYximolKuTslSl
         zovMQ1A00maE1yGwxRamGltkpq7/gk6wONx+5DNGPTAqjnTyehXLQ3YYiN5vBHltJ54B
         zBF6xdkYADHCSZMqjqwFztHGoAcny111BPOFoQsIsShFuhovhGKZ2GszcI/4bC6ZSRsm
         +S9mKuI8XJITHZIV/0G+pIss62OyIm+TvIJNc8/lWeaVXWBa53EoS/E/+LCy3uzWmEkv
         kNsw==
X-Forwarded-Encrypted: i=1; AJvYcCWwqTNcerpzuXjyM3tFL7ZkUX8HzxBsXFkVfBkRoe7PPIUjc8+wGLacgIaVf3+A3r7DXPbg20ZuwYt02ZQ5z0lYa/Id/DRWSwZyz2Xj4Vsq
X-Gm-Message-State: AOJu0YxfC7WUnbVuUvDtIm7kaIemOUqKTCvOAwrRaajIz6NBGS60Au0b
	3d165ojbFP3Xe0VdmKva4ENwWl5E59GAn6badFe17bqTYA5c38SAtG7WEX55VIMNf+4NUKL5KXQ
	SK9k=
X-Google-Smtp-Source: AGHT+IG1E9Me8/ViL7MPla0Akx0APSdhNxaHB+8HRwUMcZom2Jj+iE0yJvEyEiVZm3UH6+AzQ9ppgw==
X-Received: by 2002:a17:902:ff01:b0:1dc:caaa:7c95 with SMTP id f1-20020a170902ff0100b001dccaaa7c95mr871435plj.15.1709183246540;
        Wed, 28 Feb 2024 21:07:26 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id i9-20020a170902c94900b001dcc09487e8sm362649pla.50.2024.02.28.21.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 21:07:25 -0800 (PST)
Message-ID: <65e0110d.170a0220.d6b09.16c4@mx.google.com>
Date: Wed, 28 Feb 2024 21:07:25 -0800 (PST)
MIME-Version: 1.0
X-Kernelci-Tree: riscv
X-Kernelci-Branch: for-next
X-Kernelci-Kernel: v6.8-rc1-37-g886516fae2b73
X-Kernelci-Report-Type: build
Subject: riscv/for-next build: 8 builds: 0 failed, 8 passed,
 2 warnings (v6.8-rc1-37-g886516fae2b73)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_210731_438201_8E749668 
X-CRM114-Status: UNSURE (   2.12  )
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

cmlzY3YvZm9yLW5leHQgYnVpbGQ6IDggYnVpbGRzOiAwIGZhaWxlZCwgOCBwYXNzZWQsIDIgd2Fy
bmluZ3MgKHY2LjgtcmMxLTM3LWc4ODY1MTZmYWUyYjczKQoKRnVsbCBCdWlsZCBTdW1tYXJ5OiBo
dHRwczovL2tlcm5lbGNpLm9yZy9idWlsZC9yaXNjdi9icmFuY2gvZm9yLW5leHQva2VybmVsL3Y2
LjgtcmMxLTM3LWc4ODY1MTZmYWUyYjczLwoKVHJlZTogcmlzY3YKQnJhbmNoOiBmb3ItbmV4dApH
aXQgRGVzY3JpYmU6IHY2LjgtcmMxLTM3LWc4ODY1MTZmYWUyYjczCkdpdCBDb21taXQ6IDg4NjUx
NmZhZTJiNzNhMTU3ODYwMGU5NTYzMTQzNjc4NWYzZTQ0ZDYKR2l0IFVSTDogaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0CkJ1aWx0
OiAxIHVuaXF1ZSBhcmNoaXRlY3R1cmUKCldhcm5pbmdzIERldGVjdGVkOgoKcmlzY3Y6CiAgICBk
ZWZjb25maWcgKGdjYy0xMCk6IDEgd2FybmluZwogICAgZGVmY29uZmlnK0NPTkZJR19TTVA9biAo
Z2NjLTEwKTogMSB3YXJuaW5nCgoKV2FybmluZ3Mgc3VtbWFyeToKCiAgICAyICAgIHNlY3VyaXR5
L3NlY3VyaXR5LmM6ODEwOjI6IHdhcm5pbmc6IOKAmG1lbWNweeKAmSBvZmZzZXQgMzIgaXMgb3V0
IG9mIHRoZSBib3VuZHMgWzAsIDBdIFstV2FycmF5LWJvdW5kc10KCj09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09CgpEZXRhaWxlZCBwZXItZGVmY29uZmlnIGJ1aWxkIHJlcG9ydHM6CgotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQpkZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9y
cywgMSB3YXJuaW5nLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKV2FybmluZ3M6CiAgICBzZWN1cml0
eS9zZWN1cml0eS5jOjgxMDoyOiB3YXJuaW5nOiDigJhtZW1jcHnigJkgb2Zmc2V0IDMyIGlzIG91
dCBvZiB0aGUgYm91bmRzIFswLCAwXSBbLVdhcnJheS1ib3VuZHNdCgotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQpkZWZjb25maWcgKHJpc2N2LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAw
IHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
ZGVmY29uZmlnK0NPTkZJR19TTVA9biAocmlzY3YsIGdjYy0xMCkg4oCUIFBBU1MsIDAgZXJyb3Jz
LCAxIHdhcm5pbmcsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgpXYXJuaW5nczoKICAgIHNlY3VyaXR5
L3NlY3VyaXR5LmM6ODEwOjI6IHdhcm5pbmc6IOKAmG1lbWNweeKAmSBvZmZzZXQgMzIgaXMgb3V0
IG9mIHRoZSBib3VuZHMgWzAsIDBdIFstV2FycmF5LWJvdW5kc10KCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCmRlZmNvbmZpZytDT05GSUdfU01QPW4gKHJpc2N2LCBjbGFuZy0xNikg4oCUIFBBU1Ms
IDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0Kbm9tbXVfazIxMF9kZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNT
LCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29uZmlnIChyaXNjdiwgY2xhbmctMTYpIOKAlCBQ
QVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfc2RjYXJkX2RlZmNvbmZpZyAocmlzY3YsIGNsYW5n
LTE2KSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVz
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpub21tdV9rMjEwX3NkY2FyZF9kZWZjb25maWcgKHJp
c2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1p
c21hdGNoZXMKCi0tLQpGb3IgbW9yZSBpbmZvIHdyaXRlIHRvIDxpbmZvQGtlcm5lbGNpLm9yZz4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
