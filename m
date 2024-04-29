Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636B9C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 03:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W2OFG6zYdxpiiX36phMQ1XZhsbejemNW7t6pIyklIF0=; b=kFPe8pTFKxGKDm
	nOnEEq//pma6DuYxDV1JggQTQsu3FXT1oXuBRon7ZbPdL/4wXSO29o5UcyPkDcEOR32TUkBYVVH+S
	SEkFgmDEEmPX7H2E1vDIO0N8ObjQ++goBCFiaQYawDGvQDJBcPwGG5LvqUbD4GNRG4QOdaxhGuHpO
	11WVoogWHJEQrA0eozmyG6vzs0iuObjRwNMoo6WwxboLNRwPsoZrz27p7A+4Gj2rQOu4t3gt3RYyi
	wYngi32NxPaOyInILUiQDErQgpac+An0kP/G8Rv5GCUjjXIQnzLBuFI4ar3Ao/0o3OpXWMOmFKdkA
	62AvID1DSdS+/ktxVGlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1HRD-00000001JFw-2Y16;
	Mon, 29 Apr 2024 03:12:19 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1HR9-00000001JFR-32fr
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 03:12:17 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5e4f79007ffso2563055a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 28 Apr 2024 20:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1714360333; x=1714965133; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iB0uWMkgypI2ktLYSjz1lIHGauZ0tJpXd6xmWPO7CD0=;
        b=I2nymewI6Vmq/teTBB8nNCk6iRr5hDsfwUBRZafkRyk9jQMOvx6UFF2WgsSBZ2Phm/
         jwhm1xATyooC35kGkOpLNvbfYLI22S3oq91LDyVQgnSZlGWXIfgeSgLmdpwoA0NTlr7T
         zwtKjvQTuTDKWsErdNbEDArKEz39/CtPkmLYCQCuiQJwvPsS5FQU6rmp1s18R+BIe1Rr
         z9lRatnD0YfXxBGV7ceLe0KV2y2865LHToo8O4XkCE0v0g8z5ElqWXf9U9Z9X6mhPqhy
         Rlr+4cvD4IolAe00Dj9xUREcBLwVDY/Mid3azqJkKhzIMUApxeRqC348m0k3FaFmBNz5
         bjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714360333; x=1714965133;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iB0uWMkgypI2ktLYSjz1lIHGauZ0tJpXd6xmWPO7CD0=;
        b=BMQUDPayicPunN4aniO9fsDmSRrhBbplj6simOoxfOofm9nTrLVwnYXpNXBbDb4KOM
         OWejrdauyzwZnSAcMgn0fSu//fUq3Lp0HUTxYjV7CQlvQH3KxxMp2VWyRsWZB4KbGtxi
         IoOiVXZgdyoyBjwIvASe13qRD4/eFqXNUrLQo/RKCjLEExuo6yxRGYooe0oZnNJHuMgt
         2h2Xtkoc0GOlPRsXmZR35Cc2kTMtZMl1UHvWLgDUnRbJCMfB3V8PaBvyd7PjRee1Tri+
         bsBCtvEqCHyXXEYpJjYZMN/dklGZThiZ44jHa9zJFfld7MBaPe6GNxAs9fsK68KNCN08
         OrLg==
X-Forwarded-Encrypted: i=1; AJvYcCUi5rKjb5OX4gwZrd265MWKW0txQ4y0ZMsWbfssjMIMqycFjqYZ9UVVr1BeYocEiCFTdtDBqD7Q0l2qfPjCJ+PnamkQLDLRozwLOScJwEnY
X-Gm-Message-State: AOJu0YwsTbjPNgWgqXDnD6SsbQC8dkmzmetbbvvwN9y3yaFYlIpWAwDR
	ReuBPqMG5Ta1CqUQvhWUaAZCnCsTdNXrqT7YYl7IYFYHBbqx+LtsfAAeej1fVWnYUJ4qP+XjcrV
	BVXo=
X-Google-Smtp-Source: AGHT+IFnu4qWwbo+fXNqRfTIiAi82nWEy+hyA3RmUjevNscU1bDsnJ4yrRCAEmxRTl7TJrXMa5Pp5g==
X-Received: by 2002:a05:6a21:3483:b0:1af:3857:e652 with SMTP id yo3-20020a056a21348300b001af3857e652mr6629981pzb.12.1714360332743;
        Sun, 28 Apr 2024 20:12:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id lo8-20020a170903434800b001e546a10c50sm19087006plb.286.2024.04.28.20.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 20:12:12 -0700 (PDT)
Message-ID: <662f100c.170a0220.c571d.3a11@mx.google.com>
Date: Sun, 28 Apr 2024 20:12:12 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: v6.9-rc1-36-g0a16a17287901
X-Kernelci-Report-Type: build
Subject: riscv/for-next build: 7 builds: 0 failed,
 7 passed (v6.9-rc1-36-g0a16a17287901)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_201215_811600_D10A072A 
X-CRM114-Status: UNSURE (   2.98  )
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

cmlzY3YvZm9yLW5leHQgYnVpbGQ6IDcgYnVpbGRzOiAwIGZhaWxlZCwgNyBwYXNzZWQgKHY2Ljkt
cmMxLTM2LWcwYTE2YTE3Mjg3OTAxKQoKRnVsbCBCdWlsZCBTdW1tYXJ5OiBodHRwczovL2tlcm5l
bGNpLm9yZy9idWlsZC9yaXNjdi9icmFuY2gvZm9yLW5leHQva2VybmVsL3Y2LjktcmMxLTM2LWcw
YTE2YTE3Mjg3OTAxLwoKVHJlZTogcmlzY3YKQnJhbmNoOiBmb3ItbmV4dApHaXQgRGVzY3JpYmU6
IHY2LjktcmMxLTM2LWcwYTE2YTE3Mjg3OTAxCkdpdCBDb21taXQ6IDBhMTZhMTcyODc5MDEyYzQy
ZjU1YWU4YzI4ODNlMTdjMWU0ZTM4OGYKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0CkJ1aWx0OiAxIHVuaXF1ZSBh
cmNoaXRlY3R1cmUKCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CgpEZXRhaWxlZCBwZXItZGVmY29u
ZmlnIGJ1aWxkIHJlcG9ydHM6CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcgKHJp
c2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1p
c21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRlZmNvbmZpZytDT05GSUdfU01QPW4g
KHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9u
IG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRlZmNvbmZpZytDT05GSUdfU01Q
PW4gKHJpc2N2LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNl
Y3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kbm9tbXVfazIxMF9kZWZj
b25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBz
ZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVm
Y29uZmlnIChyaXNjdiwgY2xhbmctMTYpIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywg
MCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBf
c2RjYXJkX2RlZmNvbmZpZyAocmlzY3YsIGNsYW5nLTE2KSDigJQgUEFTUywgMCBlcnJvcnMsIDAg
d2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpu
b21tdV9rMjEwX3NkY2FyZF9kZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVy
cm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLQpGb3IgbW9yZSBpbmZv
IHdyaXRlIHRvIDxpbmZvQGtlcm5lbGNpLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
