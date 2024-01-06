Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B64C3DA6E
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Jan 2024 01:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VIK/xSKyIyXolb6XhvGs3X9QwXP83Kk6mRwbe+/UPTs=; b=xTNQLPWboQ3G5g
	U+asDCDG1wbYLG8aEVqFhTSTj70d60kLO+0QnzdRPcRifwULWkxeCf55vvB2WiBFqFAkZ2noITWsT
	RoGXqY7prqInldGgNit7wwg8SFrcsH+gUXyJYXeO+IjtleqGEf2hIGh51wrpc4otf6ys8s9MoXyDo
	rpCQKSqUZd3sUFJVOtMhm1ePv/fyLK5dUUa0fiiaT4bTmY416eld1FHbWXXXkNY4769kr4gIhRMZV
	JdXyv7IeWuvP0PPnpfpjBlblugDpoe1uSWpC52QnFH+PsZwgNSltEn5zl/Yl2bCny9LPQ+gsc4S11
	wYKOvpaN+zKaiepy5D7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLvPw-000XCg-1j;
	Sat, 06 Jan 2024 01:24:04 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLvPt-000XCM-1k
	for linux-riscv@lists.infradead.org;
	Sat, 06 Jan 2024 01:24:03 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3bbd6e37a9bso188301b6e.0
        for <linux-riscv@lists.infradead.org>; Fri, 05 Jan 2024 17:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1704504239; x=1705109039; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o8SUTicuPWOYFEmAVyt1LxUExDZM/tqxyyjDIGMyblo=;
        b=aj3mWguN1zQ1/Ot1eXme9q+103TVbdR+pqDRfnxQNqF/rogJzbSwN746l7BQzuj+eU
         r/kLd5Ti8omtV6SF6na/nXStfcnv+l1jtMTS1enMNXMabQg+Jf1U6s3X8sgZwaH3zMvr
         KRr7+i2W++k46w6ANBWwIKG45tgB/52abgyG1pggeKH0eLphE6BfU+4KH0GuCD+9B/J+
         5fUfKY71Mb4skXP7Qj2QXS/BoM7lSvvp0rlCJnCCX5UiEBLPcbPa3TgN9IGHJbnNCC1W
         VoU34jCVGUUWLIFubQE9GQvVr8u93AojajR4F+gi5wYKXaUMUKfwzOSeAdiGDqDyhGkn
         Fctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704504239; x=1705109039;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o8SUTicuPWOYFEmAVyt1LxUExDZM/tqxyyjDIGMyblo=;
        b=hh6zKoft0Rz7wlYFkowyqvSIEVUR18YBmRNZvtB9LsboLzC/W4Yfi+qe04zDybEGWF
         +YjVW8dpo+kjjJWVCmlRxPLhWdcKKBoixtvbAARyEMC4ToANWXi0PQOhGZ5PBmyAK23t
         2u8QjgcmX+ROvDOY53Lp62OYwO59m7r7JNV33sJp1OcvNBg4yOkkM/pVXi2/z+pjfhaC
         gNMh5E+2sy9U6RhD6LyfNLxYgMf6VAhPR9o17KMxA6Cx8AYTw7jAfwKXiLIbR9CLvLBS
         mrdjVzB4rCT6Atv4KG9xxVnC//JgvfuaCg8End5fwRkUUfjDDNFy52BgZCOpDhIocpK0
         PZxw==
X-Gm-Message-State: AOJu0YzDaDVq8vgtCrA/bN0OftGjtzmrqgcGnP7Fy/hilpb6bDS0EAe6
	GuNMvw0RquyeBq2oIp8EzcLjHF2utxu7KQ==
X-Google-Smtp-Source: AGHT+IHvffVoYqPCK1zGknU8N9pPjjbJM0tVlSspi6f9okgq4LpwS9sMf4cy0U7i+qnL8cimj/aB6g==
X-Received: by 2002:a54:4684:0:b0:3bb:fe4f:e5c0 with SMTP id k4-20020a544684000000b003bbfe4fe5c0mr275067oic.31.1704504239733;
        Fri, 05 Jan 2024 17:23:59 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id db4-20020a17090ad64400b00286da7407f2sm1933954pjb.7.2024.01.05.17.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 17:23:58 -0800 (PST)
Message-ID: <6598abae.170a0220.5d9d2.43ad@mx.google.com>
Date: Fri, 05 Jan 2024 17:23:58 -0800 (PST)
MIME-Version: 1.0
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: v6.7-rc1-39-g5a2cf779e677
X-Kernelci-Report-Type: build
Subject: riscv/for-next build: 8 builds: 0 failed,
 8 passed (v6.7-rc1-39-g5a2cf779e677)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_172401_953118_5773CAD2 
X-CRM114-Status: UNSURE (   1.74  )
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

cmlzY3YvZm9yLW5leHQgYnVpbGQ6IDggYnVpbGRzOiAwIGZhaWxlZCwgOCBwYXNzZWQgKHY2Ljct
cmMxLTM5LWc1YTJjZjc3OWU2NzcpCgpGdWxsIEJ1aWxkIFN1bW1hcnk6IGh0dHBzOi8va2VybmVs
Y2kub3JnL2J1aWxkL3Jpc2N2L2JyYW5jaC9mb3ItbmV4dC9rZXJuZWwvdjYuNy1yYzEtMzktZzVh
MmNmNzc5ZTY3Ny8KClRyZWU6IHJpc2N2CkJyYW5jaDogZm9yLW5leHQKR2l0IERlc2NyaWJlOiB2
Ni43LXJjMS0zOS1nNWEyY2Y3NzllNjc3CkdpdCBDb21taXQ6IDVhMmNmNzc5ZTY3NzVkNjQxOTc2
NjAxYWUyMWQ0YzViZTNjOTk1ZTIKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0CkJ1aWx0OiAxIHVuaXF1ZSBhcmNo
aXRlY3R1cmUKCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CgpEZXRhaWxlZCBwZXItZGVmY29uZmln
IGJ1aWxkIHJlcG9ydHM6CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcgKHJpc2N2
LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21h
dGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRlZmNvbmZpZyAocmlzY3YsIGNsYW5nLTE2
KSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcrQ09ORklHX1NNUD1uIChyaXNjdiwgZ2Nj
LTEwKSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVz
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcrQ09ORklHX1NNUD1uIChyaXNjdiwg
Y2xhbmctMTYpIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21h
dGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29uZmlnIChyaXNj
diwgY2xhbmctMTYpIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1p
c21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29uZmlnIChy
aXNjdiwgZ2NjLTEwKSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBt
aXNtYXRjaGVzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpub21tdV9rMjEwX3NkY2FyZF9kZWZj
b25maWcgKHJpc2N2LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAw
IHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kbm9tbXVfazIxMF9z
ZGNhcmRfZGVmY29uZmlnIChyaXNjdiwgZ2NjLTEwKSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2Fy
bmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0KRm9yIG1vcmUgaW5mbyB3cml0ZSB0byA8
aW5mb0BrZXJuZWxjaS5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
