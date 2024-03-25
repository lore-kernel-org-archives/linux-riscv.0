Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71905C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 05:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TC2zyPOEQd1OKSHWvTFVHUDpJU8xbmwrH3ZLvXfQj+0=; b=eTuwyivWjlAc2s
	QTAZsoLM5+jmIViTovkCLYI8TAucumlDumL2MsZStNi3zPzhOEvOU27L+2p83Hj+0YG3/ngS1RVky
	hRR69RXADXV9gPDJkzcCWU2woVI6nj7gwkWC7p2h1okA2XNHaXKkBKoD7fVc4vdcR46/En/HLsQ1t
	fhgMtWIxvtcVc0MzRdiqpRVwSpVjmjYwyC6uueeISBxFhDJvGfNvpqyc+06SwbBrkN+CdE6qqVIav
	HgC39wZ/Pb2RDl7MkHau8WKTOwEFcBFwWu22zzhVW7LlEj+XyTmE5fa11d2ktl87/iQy9tDHDuFcP
	G3d3YOasUcZM8MnCf+NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rocW2-0000000FKeu-2sd2;
	Mon, 25 Mar 2024 05:04:58 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rocVy-0000000FKcw-2k6i
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 05:04:56 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5dbf7b74402so2128320a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 24 Mar 2024 22:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1711343093; x=1711947893; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9HZd4atYODlgDSGwS16f5Aolx8IvAmQjbB2dQH+dclc=;
        b=EuFeeqOm9qcaJPRo9BU8OMEU0wQ4vCNYzzkNgJsb+NaEg4b8hDe25Um3XUijrtHNFh
         CLcNOX5aOSZmjVtlOycqZqpzNmrtwWYqZVfqXJ0r7Bxze6bwwFrFte7q5lYXP8IYBkwQ
         9hdQ2bnfa5T8XCRkB81pEbCKwQbT4s6wx68qEfa4+lu8kRIfxu+haDDlYpKsRm/txk3U
         ECHNFc8WjrbXBIeySgITO55F6KA06eWyqvNzHWapIQFqHXuQqoiklixN1V42IHBKhIBb
         Vf9rw+goFp0boAqpTyuCG2VJmyhKCBLB6gyodcCQ27qBIq6MSomT6O9YgmwWnq4MbMhu
         8/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711343093; x=1711947893;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9HZd4atYODlgDSGwS16f5Aolx8IvAmQjbB2dQH+dclc=;
        b=aPYKiaCciolkcZCpiT2DvJtYBMhE4dsngiIt00XZQ/lOsxG49s92KR82TxV1/gGhgi
         SBnDeLcSj+UPD/54feErXjLswMZvqjGaKSZ+zMI8VXwgNsJLjgJZWcnB7IR99RAUWCDY
         saTGD2ChE1CdKQSTSbZ6nc0gly1zfpQ4eR6+pYsBWy5ytutgefBiCfO320PVXbtqOK/y
         UI2izqJk2a2+FF57Pj/Y0eMroDIyoI9fYLgB5APtFYV7UXRgRdZ6oyrFMpN547My/RV2
         vhXdm/lc+oAvE+AjP/9OxtsqxFWRJpSpxtR+QvY9jZMpmvUFyPjg1sd5aIrmvQ7zgcMt
         b7XQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6FdCQebd4eFHiZh/L9b+Y+WSTWtar0+YxTpGelm6mv6MAZIsbaZC8Y2gXuyowlablO+3jdMWpqd/oXXI9+/y2jicIY7lw1SOxtlamDs9l
X-Gm-Message-State: AOJu0YxDoLkQ8Ov/98PsdXYmODBro4fc38pIJQ2qP8GvLYF+SqzBQmKD
	6xKaz3yCL1uxvjRyc/SW4oxmfnAmDt8hSMwr7HhBYmHbnUC88dL0+d6gSodbX2I=
X-Google-Smtp-Source: AGHT+IG8+1E9wd3FvXKbJOjTUncMD3nlq8VwKwgsWfeiLyIvRsJ2L6SmFbw6Rwh6sW7rn7iQ9Z1vSw==
X-Received: by 2002:a05:6a20:7a9f:b0:1a3:aea1:bc7d with SMTP id u31-20020a056a207a9f00b001a3aea1bc7dmr4375718pzh.30.1711343092655;
        Sun, 24 Mar 2024 22:04:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id mo12-20020a1709030a8c00b001db717d2dbbsm3914251plb.210.2024.03.24.22.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 22:04:52 -0700 (PDT)
Message-ID: <660105f4.170a0220.f7ed9.8f88@mx.google.com>
Date: Sun, 24 Mar 2024 22:04:52 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: v6.9-rc1
X-Kernelci-Report-Type: build
Subject: riscv/for-next build: 8 builds: 0 failed, 8 passed (v6.9-rc1)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_220454_938761_DC6379C0 
X-CRM114-Status: UNSURE (   3.06  )
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

cmlzY3YvZm9yLW5leHQgYnVpbGQ6IDggYnVpbGRzOiAwIGZhaWxlZCwgOCBwYXNzZWQgKHY2Ljkt
cmMxKQoKRnVsbCBCdWlsZCBTdW1tYXJ5OiBodHRwczovL2tlcm5lbGNpLm9yZy9idWlsZC9yaXNj
di9icmFuY2gvZm9yLW5leHQva2VybmVsL3Y2LjktcmMxLwoKVHJlZTogcmlzY3YKQnJhbmNoOiBm
b3ItbmV4dApHaXQgRGVzY3JpYmU6IHY2LjktcmMxCkdpdCBDb21taXQ6IDRjZWNlNzY0OTY1MDIw
YzIyY2ZmNzY2NWIxOGEwMTIwMDYzNTkwOTUKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0CkJ1aWx0OiAxIHVuaXF1
ZSBhcmNoaXRlY3R1cmUKCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CgpEZXRhaWxlZCBwZXItZGVm
Y29uZmlnIGJ1aWxkIHJlcG9ydHM6CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcg
KHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9u
IG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRlZmNvbmZpZyAocmlzY3YsIGNs
YW5nLTE2KSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRj
aGVzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcrQ09ORklHX1NNUD1uIChyaXNj
diwgZ2NjLTEwKSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNt
YXRjaGVzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcrQ09ORklHX1NNUD1uIChy
aXNjdiwgY2xhbmctMTYpIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9u
IG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29uZmln
IChyaXNjdiwgY2xhbmctMTYpIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0
aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29u
ZmlnIChyaXNjdiwgZ2NjLTEwKSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2Vj
dGlvbiBtaXNtYXRjaGVzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpub21tdV9rMjEwX3NkY2Fy
ZF9kZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5n
cywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2sy
MTBfc2RjYXJkX2RlZmNvbmZpZyAocmlzY3YsIGNsYW5nLTE2KSDigJQgUEFTUywgMCBlcnJvcnMs
IDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0KRm9yIG1vcmUgaW5mbyB3cml0
ZSB0byA8aW5mb0BrZXJuZWxjaS5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
