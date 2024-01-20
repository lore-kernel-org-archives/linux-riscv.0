Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E904EC4725D
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 00:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WJmcxeCnE7LAhi8MqVoJwWPEUOc5/RTkNQPk2hNTPK8=; b=dv8oHyj0BwD/Jv
	pXuLa1VCKhxMvg+T85xlm6o8K4jM/tR2eiI+ojXIbb9u8RS3yg0AndW0b8aPkdy32yYLipuyBkbJa
	14zFlVPFU/BX1LsXzWDV1pDDajUf37ZpZkYhaHL5CNHTv4JflIrC4WExstSbz3encw3HHmqiAoq8O
	Df1mPyEif3js/h1uonBdjxKMtTeBLpW4t4CiMSc02gfvSUPwtdBYM3IZSpnad652mU3cHQpLKsW2f
	mpwNhMi40XAbSLVp7UDq+XeLUeen7sz7QLOXeGSRk7XRbP9jePO9nlz7x51xjTQ36bdb+tSTI/Esx
	PNxId7ido2rFgeKvSKvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQzMl-006xhl-1y;
	Sat, 20 Jan 2024 00:37:43 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQzMh-006xhS-2Z
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 00:37:42 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6dbb26ec1deso1534026b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jan 2024 16:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705711057; x=1706315857; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T7XOBWnbCNO1ZU2jlR87vgYqaOoIuVhaUAx2bKK2uEs=;
        b=DN+3hSzF4yFz7D/4x78R7/fIMHwjRisXVDoAF3KkanasPiRNQhJZIUVTfAL8vJ9tRY
         p5SJyXNYA5BhHoZKv1VPplk8Wyus6iY8YgVfjlX1Gdvf4EtnTVeaIej7m0vvHcAw3Mvx
         /T80vC+n/7qiTEGqHKT3YC2d85WMtkotAbb76AqscUWFfQlC3RtMSOhW661xsP/r+sIS
         TlFysUQ4cP+o2MxirEaybdcsta6/F5cVm39xougU6/QqfztCn0FT/N2jBxFcDaPPTc1i
         iRpuvd2P710eN0BtmR5+gj0d+0d3OdYn3887ASSb8N2zQXtnbRlHdiXwRlgsYb3Sw43T
         QLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705711057; x=1706315857;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T7XOBWnbCNO1ZU2jlR87vgYqaOoIuVhaUAx2bKK2uEs=;
        b=Zd4Ka7ah2OeFccrlEn1AatvyY6ZY4SLip5AkmgljNmUU/+P1V8HRLRitD5LWI2GsLF
         La687yL3PzYVPvUSAj9PVmhEudZu1IhmZu+EVN+r1Pf0mod0xjOQvJZJD38o8wtBVubC
         /jPRMVTd9+Fpx4ltNHz5XgsP5TENKSCVVD4CYM3ddJNrhT1toc0N6IVHFx5AJaQcuV0c
         kuRU5IA/ulTAqW3eAVN6NAdD3kj6nunIKa0oGckLISUiEpJLCGBOqEi4fMmBySVEffsy
         l7Blm+1cCO54Bj57T9M1ZhDdCsr3MxFqSUKpUvlj4MDv0Zs5od1+NRW6kDh7wvWC8hhu
         d+UA==
X-Gm-Message-State: AOJu0YyHrjH+Rt7+1ERLopys0Y0W5042knTwo/7tmXW3kLR2GgbLm430
	T/mX1MDtDjrxmtjv8iJOAXGCzbnTlKAIgTeK82l8FsJpKfLvm+RzXVVVOU2mxss3JG6IgczAG0C
	yN7g=
X-Google-Smtp-Source: AGHT+IEA2melSsNkAA22EijTOqXuC882Q8dXwyhLZS3JNm8WyZkz/Hku3P3mvnctdcBmYHres0OfNQ==
X-Received: by 2002:a05:6a00:27a8:b0:6d9:a856:ec9b with SMTP id bd40-20020a056a0027a800b006d9a856ec9bmr833230pfb.25.1705711057718;
        Fri, 19 Jan 2024 16:37:37 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id s34-20020a056a0017a200b006d9b93ca5e2sm5854377pfg.146.2024.01.19.16.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 16:37:37 -0800 (PST)
Message-ID: <65ab15d1.050a0220.26c6.a376@mx.google.com>
Date: Fri, 19 Jan 2024 16:37:37 -0800 (PST)
MIME-Version: 1.0
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: riscv-for-linus-6.8-mw2-1-gf24a70106dc1a
X-Kernelci-Report-Type: build
Subject: riscv/for-next build: 8 builds: 0 failed,
 8 passed (riscv-for-linus-6.8-mw2-1-gf24a70106dc1a)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_163740_857761_35F19C9D 
X-CRM114-Status: UNSURE (   1.63  )
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

cmlzY3YvZm9yLW5leHQgYnVpbGQ6IDggYnVpbGRzOiAwIGZhaWxlZCwgOCBwYXNzZWQgKHJpc2N2
LWZvci1saW51cy02LjgtbXcyLTEtZ2YyNGE3MDEwNmRjMWEpCgpGdWxsIEJ1aWxkIFN1bW1hcnk6
IGh0dHBzOi8va2VybmVsY2kub3JnL2J1aWxkL3Jpc2N2L2JyYW5jaC9mb3ItbmV4dC9rZXJuZWwv
cmlzY3YtZm9yLWxpbnVzLTYuOC1tdzItMS1nZjI0YTcwMTA2ZGMxYS8KClRyZWU6IHJpc2N2CkJy
YW5jaDogZm9yLW5leHQKR2l0IERlc2NyaWJlOiByaXNjdi1mb3ItbGludXMtNi44LW13Mi0xLWdm
MjRhNzAxMDZkYzFhCkdpdCBDb21taXQ6IGYyNGE3MDEwNmRjMWFkMmE3NTViMmQ0MmY0N2NmMWRj
ZjI0ZjBiMjcKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvcmlzY3YvbGludXguZ2l0CkJ1aWx0OiAxIHVuaXF1ZSBhcmNoaXRlY3R1cmUKCj09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09CgpEZXRhaWxlZCBwZXItZGVmY29uZmlnIGJ1aWxkIHJlcG9y
dHM6CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKA
lCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCmRlZmNvbmZpZyAocmlzY3YsIGNsYW5nLTE2KSDigJQgUEFTUywg
MCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQpkZWZjb25maWcrQ09ORklHX1NNUD1uIChyaXNjdiwgZ2NjLTEwKSDigJQgUEFT
UywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQpkZWZjb25maWcrQ09ORklHX1NNUD1uIChyaXNjdiwgY2xhbmctMTYpIOKA
lCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29uZmlnIChyaXNjdiwgZ2NjLTEwKSDi
gJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQpub21tdV9rMjEwX2RlZmNvbmZpZyAocmlzY3YsIGNsYW5nLTE2
KSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpub21tdV9rMjEwX3NkY2FyZF9kZWZjb25maWcgKHJpc2N2
LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlz
bWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kbm9tbXVfazIxMF9zZGNhcmRfZGVmY29u
ZmlnIChyaXNjdiwgZ2NjLTEwKSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2Vj
dGlvbiBtaXNtYXRjaGVzCgotLS0KRm9yIG1vcmUgaW5mbyB3cml0ZSB0byA8aW5mb0BrZXJuZWxj
aS5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
