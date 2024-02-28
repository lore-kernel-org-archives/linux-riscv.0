Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA21FC47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 17:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2wQ2I7VjvkoPNcEtcw1yvGQT3HNGkW//y1Qdf3TP76w=; b=VxiKstJ0voO4nh
	KCCO7qHcf0mv04Jr0S4FMyKV8TXniSDvhvNC5jW4uiWeearQhZPll41zsOBhVlGStm0I+3eEoN4+V
	TQ6s3+c7dfss8adBHT636Ga81C3+vJr6h1+4sZcadmwMgPJk5CNwvdwKuwiTN7gTtFx0sqyuHe5UV
	GaWfdNO2cQsZgPNZioEPrUDD3OfBHlsHGLEm6/P49KsKLKKfQJ18Z8l1tSVUVeNgI2OwTZPtWxzu+
	OUjFrkdk1icYwe8+N6PcjoGJpAkOPZhWX5khmr9H8SEE6ALuUENT+kkjJdf2BzYOLuBnSOR6UANrE
	yWtzvQ/nVC+22676EwGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfO7y-0000000AMzB-24OO;
	Wed, 28 Feb 2024 17:53:58 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfO7v-0000000AMwR-2bwO
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 17:53:57 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-299e4b352cdso4282994a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 09:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1709142832; x=1709747632; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iPY10kf2LEeajts0C8kcUmttMTHcCt6mxSsc5xYdjOs=;
        b=DA8iMpxiVQj66czIejzpZvqDd2yyLMIfU2Fs/ngsOd+NhFfPQzFrbN4NAqR1mp0E/8
         uhmvnf/hN4hE7+1KWXCoEzsPYmr14pbtuAP5hn6WwZajV+8WRLK72FfJzH49AdQoq6xl
         r/JuFNz7ST5JlzTXsFnL2c+8s4cBuTKf8bMo/XZ/caoGiADaIbaqPA1E5PDUYLSasFaJ
         vT5RYa85uVODRLURhPGYinnzBDGZ6kcrC107zBgPSXWUpKDPmupACGW5mdkTUpr/mcfj
         +tenjT5dHgsE02DEQlLwtZHVc82GqAf2IECuuC9tB5REvTV1gILbrWHQT/+EYef1EYuv
         aSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709142832; x=1709747632;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iPY10kf2LEeajts0C8kcUmttMTHcCt6mxSsc5xYdjOs=;
        b=MJz9txhGS9RphGTa2dIZkEcJkWxdMZ3rnYmQXNif1WttjDDP9QrEfaLafnoSjBX0G2
         BJXAVaBTyj7byjYeLaEsfqAd12LPD2FPYd3eNOfBvjD5hJvMKtCaa3VTRL1pFVoRcXjc
         xvQNlp2tOU1v+uxrytZdyNQhqqlBijb9yaPcVoX9q5NpHiyDqz2geTyTRzfrTT1td0tM
         6q8JxnOkFZQeMfXhj/4fsFUv1BHAN8jJp8zfBnj/IKRuLWosZq5ucZYC8Xn5pE5mdM9z
         VPDZQ8tu3mj4c4AvKDnb9XQ28vKLNAyDCiwMYFCUpKRwAtb4OERvqElX7VB1TsiSQE9w
         Fslg==
X-Forwarded-Encrypted: i=1; AJvYcCUOQEGDLgLkjJdJlGtPk3eVL97klHK6MfeHe8ILNF4jRVXQ92rIACYu6kEyOOf5dDd3zFvbxBAc53kCrwlpVcIXZf82cjlAgVz8+xi5Mqcc
X-Gm-Message-State: AOJu0YxYT+qUUCuMK3LZEHQa1brSHKQ4R7LKpNQQ6FZUd6JStaQiSWkP
	kVFCmIwR761VkQQpyiIpbOrYNSxQ5Xd18HiJ7++3FSkJOcOb656Ic/RLNXjM+Hw=
X-Google-Smtp-Source: AGHT+IEsUT49vCBnLHz6ZxxzTxCyJnlbvkukEye3f3mGNn4yJFXaLbQ6ZKO8I9eHUuKLU4Xpp3LbVg==
X-Received: by 2002:a17:90b:4384:b0:29a:6436:ed59 with SMTP id in4-20020a17090b438400b0029a6436ed59mr414597pjb.2.1709142831754;
        Wed, 28 Feb 2024 09:53:51 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id x2-20020a17090a164200b002995e9aca72sm2120786pje.29.2024.02.28.09.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 09:53:51 -0800 (PST)
Message-ID: <65df732f.170a0220.1c47c.a756@mx.google.com>
Date: Wed, 28 Feb 2024 09:53:51 -0800 (PST)
MIME-Version: 1.0
X-Kernelci-Tree: riscv
X-Kernelci-Branch: fixes
X-Kernelci-Kernel: riscv-for-linus-6.8-rc4-12-g325731481cea1
X-Kernelci-Report-Type: build
Subject: riscv/fixes build: 8 builds: 0 failed, 8 passed,
 2 warnings (riscv-for-linus-6.8-rc4-12-g325731481cea1)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_095355_887997_D63F1B26 
X-CRM114-Status: UNSURE (   2.19  )
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
Z3MgKHJpc2N2LWZvci1saW51cy02LjgtcmM0LTEyLWczMjU3MzE0ODFjZWExKQoKRnVsbCBCdWls
ZCBTdW1tYXJ5OiBodHRwczovL2tlcm5lbGNpLm9yZy9idWlsZC9yaXNjdi9icmFuY2gvZml4ZXMv
a2VybmVsL3Jpc2N2LWZvci1saW51cy02LjgtcmM0LTEyLWczMjU3MzE0ODFjZWExLwoKVHJlZTog
cmlzY3YKQnJhbmNoOiBmaXhlcwpHaXQgRGVzY3JpYmU6IHJpc2N2LWZvci1saW51cy02LjgtcmM0
LTEyLWczMjU3MzE0ODFjZWExCkdpdCBDb21taXQ6IDMyNTczMTQ4MWNlYTExZjBkNWU3NzFmNmQ5
YmE3OGNmMTNmMDg0MDcKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0CkJ1aWx0OiAxIHVuaXF1ZSBhcmNoaXRlY3R1
cmUKCldhcm5pbmdzIERldGVjdGVkOgoKcmlzY3Y6CiAgICBkZWZjb25maWcgKGdjYy0xMCk6IDEg
d2FybmluZwogICAgZGVmY29uZmlnK0NPTkZJR19TTVA9biAoZ2NjLTEwKTogMSB3YXJuaW5nCgoK
V2FybmluZ3Mgc3VtbWFyeToKCiAgICAyICAgIHNlY3VyaXR5L3NlY3VyaXR5LmM6ODEwOjI6IHdh
cm5pbmc6IOKAmG1lbWNweeKAmSBvZmZzZXQgMzIgaXMgb3V0IG9mIHRoZSBib3VuZHMgWzAsIDBd
IFstV2FycmF5LWJvdW5kc10KCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CgpEZXRhaWxlZCBwZXIt
ZGVmY29uZmlnIGJ1aWxkIHJlcG9ydHM6CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25m
aWcgKHJpc2N2LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNl
Y3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZGVmY29uZmlnIChyaXNj
diwgZ2NjLTEwKSDigJQgUEFTUywgMCBlcnJvcnMsIDEgd2FybmluZywgMCBzZWN0aW9uIG1pc21h
dGNoZXMKCldhcm5pbmdzOgogICAgc2VjdXJpdHkvc2VjdXJpdHkuYzo4MTA6Mjogd2FybmluZzog
4oCYbWVtY3B54oCZIG9mZnNldCAzMiBpcyBvdXQgb2YgdGhlIGJvdW5kcyBbMCwgMF0gWy1XYXJy
YXktYm91bmRzXQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZGVmY29uZmlnK0NPTkZJR19TTVA9
biAocmlzY3YsIGNsYW5nLTE2KSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2Vj
dGlvbiBtaXNtYXRjaGVzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcrQ09ORklH
X1NNUD1uIChyaXNjdiwgZ2NjLTEwKSDigJQgUEFTUywgMCBlcnJvcnMsIDEgd2FybmluZywgMCBz
ZWN0aW9uIG1pc21hdGNoZXMKCldhcm5pbmdzOgogICAgc2VjdXJpdHkvc2VjdXJpdHkuYzo4MTA6
Mjogd2FybmluZzog4oCYbWVtY3B54oCZIG9mZnNldCAzMiBpcyBvdXQgb2YgdGhlIGJvdW5kcyBb
MCwgMF0gWy1XYXJyYXktYm91bmRzXQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kbm9tbXVfazIx
MF9kZWZjb25maWcgKHJpc2N2LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5p
bmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kbm9tbXVf
azIxMF9kZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJu
aW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11
X2syMTBfc2RjYXJkX2RlZmNvbmZpZyAocmlzY3YsIGNsYW5nLTE2KSDigJQgUEFTUywgMCBlcnJv
cnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpub21tdV9rMjEwX3NkY2FyZF9kZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNT
LCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLQpGb3IgbW9y
ZSBpbmZvIHdyaXRlIHRvIDxpbmZvQGtlcm5lbGNpLm9yZz4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
