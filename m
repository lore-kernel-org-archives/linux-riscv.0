Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC262C47422
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 02:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DKy5GhX+nD6nd5/FXh9CUyQ7cfQb58eCuSgYj7L30kw=; b=Y5xCHX9Ua0lF87
	/WR9WS0zDFmTn52gr6ycQxPPajxaP6OKmIgwFHHbskSS0HcVedgFfEUN4Ll6uufIXicOtz/pFqD2E
	y1kywL4HcpNAA7RSFB0PNaLI+4RRkbHMpsF2lYqcFiC2Minxl4c/uf7DtvpNHeJ7jTAuls6iyAWV2
	bVkAv+t+VDKw17d5l3Z1qWbxXDMN90MK5dXvklD6/jBSMkL8MOgoZTyZABK0xC8O50Us3IVM2S0FT
	3qUymlz+1UCLFQHe83RJSHVA6NQ1uaSUMghwN+3hyop2y1zcQrdNqCeN4WUcTAejx5MKpU9pE2zBU
	DbRXx/B8Nv72plTb/cUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRkVN-00AQ8R-32;
	Mon, 22 Jan 2024 02:57:45 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRkVI-00AQ7W-0s
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 02:57:44 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6dbd7f1a300so1060236b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 21 Jan 2024 18:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705892258; x=1706497058; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=momkXe/3+pKMn0g4e4YDwFC414eRg2svS7RZt/Rpong=;
        b=jqTOuQDYp700utl25VXejGEzJ/TGnrUzwm7iEr02J/0fCAf7Rwo/UhjiuEsNQ8uFZc
         LIHf0HWeWSb8frrmk6PV8KYOzeI2EurmtqDiQ90nCGlMX3LkGSt12UbbvkldnWIPXgXn
         2LB3/nZ47uFgGN3j60lQX2oJqONqKMMbr+TLSCRNENK2khf3dFuDVxcoauhczh+5w8nA
         SNvye5v8wGQZPgLLm1hmwCHZ0NfO3xI4/eq3tamPiDXfJlinoHE+9k3OjFbAg2pJ2GK9
         KKQM9TBgv0xm+84q3/F8kIheM96q6jYkyglwy7hQ3vJpHEwC5TESgVYIj4h/n2j4W7oR
         Dn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705892258; x=1706497058;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=momkXe/3+pKMn0g4e4YDwFC414eRg2svS7RZt/Rpong=;
        b=h7+KY8spPrYal/ywOO636THVUehZvKswEwLtN5KZKvjQvLJtVOlTGGKUWeaOQtU4cd
         A75XpNnkDbQBY2sHWuu2huO8bqRDtUORv2XvPsgqKHsAoz7yPSBunQl+pYq2Ew23RbLg
         a+9/5gqD6xTk4CD91y1CYvXYc5GP9862v+18mrhMARln1FED5jh1yWB5BmLW2z2+9lIg
         lkBtabDWWcFbAfaQZ3P+NNAG4pWB2bBfDxxg827T/5SglAmy2S+ds8LpAzHU6kcL2qsE
         OKTHZd2HyK1h6n0bzdmienzFf7BWQDqz2pol3uGKVXCA1IkhsbyXlD1I55l5ujhgptGH
         +OQA==
X-Gm-Message-State: AOJu0Yx1A95PjqSDoqLKjX/boUEgYLV/xBT2RgTYxIF2rSKZpJ/g9Kma
	7js+EDq5yD54qcWbuTCv9Z1DfEYPQnG90LOeAhUXkrupZ/BTWLRQ9QGJWvscxYYCN5ML2gXXZx5
	ZKrQ=
X-Google-Smtp-Source: AGHT+IFO5cZ2w+W/7tuXeBjjaeUot5tiHlVbE5Gapp+qAcQiaa2+h+XkFUz8q0uNPhOiLOSBJ/0aJA==
X-Received: by 2002:a05:6a20:bf16:b0:196:ae4b:e007 with SMTP id gc22-20020a056a20bf1600b00196ae4be007mr3708341pzb.116.1705892258108;
        Sun, 21 Jan 2024 18:57:38 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id a11-20020aa780cb000000b006dbd5a5dca9sm2104199pfn.185.2024.01.21.18.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jan 2024 18:57:37 -0800 (PST)
Message-ID: <65add9a1.a70a0220.f4542.46c5@mx.google.com>
Date: Sun, 21 Jan 2024 18:57:37 -0800 (PST)
MIME-Version: 1.0
X-Kernelci-Branch: fixes
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: v6.8-rc1
X-Kernelci-Report-Type: build
Subject: riscv/fixes build: 8 builds: 0 failed, 8 passed, 2 warnings (v6.8-rc1)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_185740_306075_58C60975 
X-CRM114-Status: UNSURE (   2.08  )
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
Z3MgKHY2LjgtcmMxKQoKRnVsbCBCdWlsZCBTdW1tYXJ5OiBodHRwczovL2tlcm5lbGNpLm9yZy9i
dWlsZC9yaXNjdi9icmFuY2gvZml4ZXMva2VybmVsL3Y2LjgtcmMxLwoKVHJlZTogcmlzY3YKQnJh
bmNoOiBmaXhlcwpHaXQgRGVzY3JpYmU6IHY2LjgtcmMxCkdpdCBDb21taXQ6IDY2MTM0NzZlMjI1
ZTA5MGNjOWFhZDQ5YmU3ZmE1MDRlMjkwZGQzM2QKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0CkJ1aWx0OiAxIHVu
aXF1ZSBhcmNoaXRlY3R1cmUKCldhcm5pbmdzIERldGVjdGVkOgoKcmlzY3Y6CiAgICBkZWZjb25m
aWcgKGdjYy0xMCk6IDEgd2FybmluZwogICAgZGVmY29uZmlnK0NPTkZJR19TTVA9biAoZ2NjLTEw
KTogMSB3YXJuaW5nCgoKV2FybmluZ3Mgc3VtbWFyeToKCiAgICAyICAgIHNlY3VyaXR5L3NlY3Vy
aXR5LmM6ODEwOjI6IHdhcm5pbmc6IOKAmG1lbWNweeKAmSBvZmZzZXQgMzIgaXMgb3V0IG9mIHRo
ZSBib3VuZHMgWzAsIDBdIFstV2FycmF5LWJvdW5kc10KCj09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
CgpEZXRhaWxlZCBwZXItZGVmY29uZmlnIGJ1aWxkIHJlcG9ydHM6CgotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQpkZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMSB3
YXJuaW5nLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKV2FybmluZ3M6CiAgICBzZWN1cml0eS9zZWN1
cml0eS5jOjgxMDoyOiB3YXJuaW5nOiDigJhtZW1jcHnigJkgb2Zmc2V0IDMyIGlzIG91dCBvZiB0
aGUgYm91bmRzIFswLCAwXSBbLVdhcnJheS1ib3VuZHNdCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQpkZWZjb25maWcgKHJpc2N2LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5p
bmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZGVmY29u
ZmlnK0NPTkZJR19TTVA9biAocmlzY3YsIGdjYy0xMCkg4oCUIFBBU1MsIDAgZXJyb3JzLCAxIHdh
cm5pbmcsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgpXYXJuaW5nczoKICAgIHNlY3VyaXR5L3NlY3Vy
aXR5LmM6ODEwOjI6IHdhcm5pbmc6IOKAmG1lbWNweeKAmSBvZmZzZXQgMzIgaXMgb3V0IG9mIHRo
ZSBib3VuZHMgWzAsIDBdIFstV2FycmF5LWJvdW5kc10KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CmRlZmNvbmZpZytDT05GSUdfU01QPW4gKHJpc2N2LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJy
b3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0Kbm9tbXVfazIxMF9kZWZjb25maWcgKHJpc2N2LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAg
ZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0Kbm9tbXVfazIxMF9kZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAw
IGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCm5vbW11X2syMTBfc2RjYXJkX2RlZmNvbmZpZyAocmlzY3YsIGdjYy0xMCkg4oCU
IFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0Kbm9tbXVfazIxMF9zZGNhcmRfZGVmY29uZmlnIChyaXNjdiwgY2xh
bmctMTYpIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNo
ZXMKCi0tLQpGb3IgbW9yZSBpbmZvIHdyaXRlIHRvIDxpbmZvQGtlcm5lbGNpLm9yZz4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
