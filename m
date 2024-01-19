Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F39C47422
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 02:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1FJIJPiSbRnsnm4Y/izwtvl608PITGMs4yyeE4YY4Ao=; b=jNwb6nRC7PI6Dt
	0ukkppmjnLQ4b3O1GrDina0OiC4S/f2WJQl9u8UC8vYuXpAtsXmNgibyc394jSyNqRrKE1/z2xGUN
	Ya5R9zZcLMNRCPv5ky2UKefs3x3q4G+Bgq9zN7wB+wK2c73L7YOvGL7YJY4RBCjAQOdeiYWFQUA2G
	nJtDNeS8xqGyzZ/p/IZZfh4vaygSrP2EhfwU6OaHdQWSIv9+KVlUmgAwgfrs41zalGAM7eO9ERX1e
	pRpxnj+y1DM1k7fKCE6hQhgKNHiddhz1Mvpp0Zqrrr3GC893Day63dfYGKCd2lTeYOoTAQ1Q0gzu1
	TRBuFPWvBnD+g4sGigCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQeK4-004HF8-0i;
	Fri, 19 Jan 2024 02:09:32 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQeJz-004HEr-39
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jan 2024 02:09:30 +0000
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6dd8cba736aso169974a34.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jan 2024 18:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705630106; x=1706234906; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r0sPa3sxjy5ZWdYu2g6K5sh6dKu6D5cAkUhj5KX/LPA=;
        b=y3hy4q+PuLYzWuh7c+jPS5mZ64h+wRe9EbftV3E7EzIVSUOJ7v75hrGixGiaXsn7d1
         8zzt8mXeIwrStTugvEAoWc98v7bDVRwDZIJv1OPau5kogL4o50lnpMO8poV/utGNd60j
         uLvpM8aMO1MImorFEYo3x/kCDiRehtnPVr7TM8s2bgK/YNjV0gM5nnnDnGbjijjXLsZi
         n2Ahcio6M03JVao11kafubaOTrpTqsrozpMEJpA8grHRcOSSfP9v1d0gR+3Sshaxgh+9
         QYBV5S2x8CcAXhMtMseIA0ssR4HKC2xigY8OygESu0I7HGbyzZ5IYnYaKkaIVUnggAN3
         9y5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705630106; x=1706234906;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r0sPa3sxjy5ZWdYu2g6K5sh6dKu6D5cAkUhj5KX/LPA=;
        b=iy9aM4h8D3JY5hY76swGRYLCCu7fJVHKdPEqWuVIULnk9pV33CQo8ciMMPxn/06kpR
         yC532S/OuVtRKLdEU+on1Pd73/kKyn8SuvhjMU2aZ9knVC+2/+h9+qJgTrVWLMYKpgtf
         dg57+JyJZWcLGn+MMC7QjLWoW2MPW5zBAsQE7rD1JCBcnJxkYYoEF6v/Op4SpIcOTTiu
         ooUqxT3mjPmb8Gb/rOkMpIqqiDc19gybKaZK3xk9/y7mPwrEqMO23K+eq/1ZQL0OTLeP
         FG4r1NB0PUsWpaQZDAybfwRFWmb4k/ulx8kgJKgomRrYbBjiK1jhupAn5B/lPe/3TxNl
         291g==
X-Gm-Message-State: AOJu0YzPkc3wmtaBisoETHGoNI1dN9lTw4/5E/5cjxkVNJmP9cOwnpw/
	FdJF0HZy71bxYDw5NZVqDv3ScKnz+7qIfEJGPSG/9od9xUyk+OPn2p/tvzsmeSYuc/6fjGsX7ce
	NZwE=
X-Google-Smtp-Source: AGHT+IHPzyqZMNuXMoGUa+FLeRYNuELZU6u+P+Wlzwom+JHv9zHcamf4r0YLGRygd6m0Ge9pRsEFqw==
X-Received: by 2002:a05:6359:2ea3:b0:176:1227:873f with SMTP id rp35-20020a0563592ea300b001761227873fmr1900476rwb.50.1705630106478;
        Thu, 18 Jan 2024 18:08:26 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id qn14-20020a17090b3d4e00b0028bf79ad453sm2604242pjb.21.2024.01.18.18.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 18:08:26 -0800 (PST)
Message-ID: <65a9d999.170a0220.7a86a.da3c@mx.google.com>
Date: Thu, 18 Jan 2024 18:08:26 -0800 (PST)
MIME-Version: 1.0
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: riscv-for-linus-6.8-mw1-65-g4525462dd0db9
X-Kernelci-Report-Type: build
Subject: riscv/for-next build: 8 builds: 0 failed,
 8 passed (riscv-for-linus-6.8-mw1-65-g4525462dd0db9)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_180929_038459_76014CB1 
X-CRM114-Status: UNSURE (   1.60  )
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
LWZvci1saW51cy02LjgtbXcxLTY1LWc0NTI1NDYyZGQwZGI5KQoKRnVsbCBCdWlsZCBTdW1tYXJ5
OiBodHRwczovL2tlcm5lbGNpLm9yZy9idWlsZC9yaXNjdi9icmFuY2gvZm9yLW5leHQva2VybmVs
L3Jpc2N2LWZvci1saW51cy02LjgtbXcxLTY1LWc0NTI1NDYyZGQwZGI5LwoKVHJlZTogcmlzY3YK
QnJhbmNoOiBmb3ItbmV4dApHaXQgRGVzY3JpYmU6IHJpc2N2LWZvci1saW51cy02LjgtbXcxLTY1
LWc0NTI1NDYyZGQwZGI5CkdpdCBDb21taXQ6IDQ1MjU0NjJkZDBkYjllODZiYjY3YzEwZGVkYmJh
YTRmOGQ2MjY5N2QKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0CkJ1aWx0OiAxIHVuaXF1ZSBhcmNoaXRlY3R1cmUK
Cj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09CgpEZXRhaWxlZCBwZXItZGVmY29uZmlnIGJ1aWxkIHJl
cG9ydHM6CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcgKHJpc2N2LCBnY2MtMTAp
IOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRlZmNvbmZpZyAocmlzY3YsIGNsYW5nLTE2KSDigJQgUEFT
UywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQpkZWZjb25maWcrQ09ORklHX1NNUD1uIChyaXNjdiwgY2xhbmctMTYpIOKA
lCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCmRlZmNvbmZpZytDT05GSUdfU01QPW4gKHJpc2N2LCBnY2MtMTAp
IOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29uZmlnIChyaXNjdiwgY2xhbmct
MTYpIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29uZmlnIChyaXNjdiwgZ2Nj
LTEwKSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVz
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpub21tdV9rMjEwX3NkY2FyZF9kZWZjb25maWcgKHJp
c2N2LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24g
bWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kbm9tbXVfazIxMF9zZGNhcmRfZGVm
Y29uZmlnIChyaXNjdiwgZ2NjLTEwKSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAg
c2VjdGlvbiBtaXNtYXRjaGVzCgotLS0KRm9yIG1vcmUgaW5mbyB3cml0ZSB0byA8aW5mb0BrZXJu
ZWxjaS5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
