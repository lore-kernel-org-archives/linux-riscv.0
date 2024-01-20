Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A50C47258
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 19:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J+HlOHibhzd5wPYGfw3Rtm7lTp1doljI2Qn0Bfa261o=; b=Yq3Uor/8c1E2NN
	MrkXFO323neMTqEr7s45QtZrNrMzud3MLuMNjl+5xMQFYi9jOuuAe7zExb5iy6c6abCpwq/F6eaP7
	AxtUN1EoxznASfnju9vy7jhvTNC8VrYktjXd6uoeVBRX0R6Vh6Z5EXQPDoW2zv05XiVY5gpm95/EV
	u77xi8Vcao8mVVGaNkoBWlLAnzyaj7VndgFY0u71GaC0eIDIIIDMF8TrbfrBddG3vh35hhXINS0Ns
	uiExTsAzPpLAT3ThbS57pSbve83elffODrpn5gdVNIfY70sgphMI5rKo09c14CWVAshJrSsWef9nU
	xDdmKmUqdu6EhXOf7fsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRGmS-008GuR-2y;
	Sat, 20 Jan 2024 19:13:24 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRGmM-008Gtp-0M
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 19:13:23 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6da9c834646so1955351b3a.3
        for <linux-riscv@lists.infradead.org>; Sat, 20 Jan 2024 11:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705777995; x=1706382795; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FSXFDwM5xV6DnvVYL0DzuTVfxNpSITvNx/pfdyefBwo=;
        b=ILwbrVIBUy5wR3ZvhJJHjU6qHAk3Z0t9F4TH7KUdkm6G2JvH2p53DPohG+afkNaElq
         cOom8hFT8A3aDcKcRmckwaDlL8qsDQ6k3YxN68sNpctj00ngqDD8aWxw3tOsiPfkPwmL
         /jO6aKp7sDQEXTlotL6hO7AvpXrY7b/xpJRJvxobm2xU9HsMq8XAV9QH8TxHuZ3WI2oX
         ZZQJViCNb4l2GShqpiRzVpHq7xd6w5mkDeuFJja6OaBkDSO7HH8LJ6r69C4MbfMY37PC
         LqrrhWD8M76MnLM0DyVSWxWXx1LfpAtVNNgeaZiCbAzVOEVE1USSXtJXTdIHjPiYRb8t
         RcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705777995; x=1706382795;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FSXFDwM5xV6DnvVYL0DzuTVfxNpSITvNx/pfdyefBwo=;
        b=Hx+vrPdqhCUacIf3MGijw603x87pdCZSB/v9OhPSumdDM785IHvX9P3+6Jsf3/nQs9
         iHfMn5rNxDyzLnCzFnu6i6OWjLyW3q+67gcu9TtmFxeXCbaHuRBy3MOqh/L4oyS7DFMQ
         uyTf+3NT5wD40+Bt3KMMi7gwkET7F12K6dEJnzAxbqkH2uDkyVVdRpdqhgNtGik/RXwV
         VDlM2JFAPhGHkMOhI3ZLrz9hIIMH9Je2jVmjU7sF1XjDf+RTPz6+3tO7OYx47mVC4E7K
         HuQrRB5aRrpTgV0AX+8zIc/sdl9v7XdqKNQNA4FBHfXB6S5sbAgMM330uR62QyenKPw6
         qOow==
X-Gm-Message-State: AOJu0YxFofGGdD2IsE0xu8CYPbinUmvAnm1Ef1XpTBhzJBXKacaXBIrt
	hCThq+TfECRrnEbedsYmkZMh+lWag5h6IgMHIXmu8WVI248XB6z7qfl6DzA41Fk=
X-Google-Smtp-Source: AGHT+IFJrwx0tLU7uKohNHaawmOYWoulAcsx8PdPjrwaj0gtb8t/eAsUgXE+BPw9lCPXJg8Y8mlRjA==
X-Received: by 2002:a05:6a00:240e:b0:6d9:a683:a6e4 with SMTP id z14-20020a056a00240e00b006d9a683a6e4mr2622481pfh.68.1705777994733;
        Sat, 20 Jan 2024 11:13:14 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id i124-20020a62c182000000b006dadc436071sm7359616pfg.36.2024.01.20.11.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jan 2024 11:13:14 -0800 (PST)
Message-ID: <65ac1b4a.620a0220.16162.cef8@mx.google.com>
Date: Sat, 20 Jan 2024 11:13:14 -0800 (PST)
MIME-Version: 1.0
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: riscv-for-linus-6.8-mw4
X-Kernelci-Report-Type: build
Subject: riscv/for-next build: 8 builds: 0 failed,
 8 passed (riscv-for-linus-6.8-mw4)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_111319_508338_2605831F 
X-CRM114-Status: UNSURE (   1.75  )
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
LWZvci1saW51cy02LjgtbXc0KQoKRnVsbCBCdWlsZCBTdW1tYXJ5OiBodHRwczovL2tlcm5lbGNp
Lm9yZy9idWlsZC9yaXNjdi9icmFuY2gvZm9yLW5leHQva2VybmVsL3Jpc2N2LWZvci1saW51cy02
LjgtbXc0LwoKVHJlZTogcmlzY3YKQnJhbmNoOiBmb3ItbmV4dApHaXQgRGVzY3JpYmU6IHJpc2N2
LWZvci1saW51cy02LjgtbXc0CkdpdCBDb21taXQ6IGYyNGE3MDEwNmRjMWFkMmE3NTViMmQ0MmY0
N2NmMWRjZjI0ZjBiMjcKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0CkJ1aWx0OiAxIHVuaXF1ZSBhcmNoaXRlY3R1
cmUKCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09CgpEZXRhaWxlZCBwZXItZGVmY29uZmlnIGJ1aWxk
IHJlcG9ydHM6CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcgKHJpc2N2LCBnY2Mt
MTApIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRlZmNvbmZpZyAocmlzY3YsIGNsYW5nLTE2KSDigJQg
UEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcrQ09ORklHX1NNUD1uIChyaXNjdiwgZ2NjLTEwKSDi
gJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcrQ09ORklHX1NNUD1uIChyaXNjdiwgY2xhbmct
MTYpIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29uZmlnIChyaXNjdiwgZ2Nj
LTEwKSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVz
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpub21tdV9rMjEwX2RlZmNvbmZpZyAocmlzY3YsIGNs
YW5nLTE2KSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRj
aGVzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpub21tdV9rMjEwX3NkY2FyZF9kZWZjb25maWcg
KHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9u
IG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfc2RjYXJkX2Rl
ZmNvbmZpZyAocmlzY3YsIGNsYW5nLTE2KSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3Ms
IDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0KRm9yIG1vcmUgaW5mbyB3cml0ZSB0byA8aW5mb0Br
ZXJuZWxjaS5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
