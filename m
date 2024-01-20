Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6D2C47258
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 22:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jkp9tlh2TWijNn5yumoViRbni9EvKCTcLFk23v8F39Y=; b=mFGw7Rlqgnwoxf
	yEeOrr4HpQZVJGkz11rcsYOWgF31tC1jU0qizCNty0IQApCiTzEUBAXeKRUgMPYC+0xZrYM7BA2q4
	KBpuBg3PjXV36n94gVtdrLNMKQQMylvMdk2xZx8xUdocXmVOAFlOAi+IoyOipOQklzUDzB0BL6ZlX
	V1f6Cl+qtn2l522yEDlvmHccg4oNbJcYY0gz2ndrL+/taiIhVtQaieBrEK6W5n3rR1vzH0RJpvhp7
	nZg45YdOK+5NfhDhAIP6nUh5RZgnEoZ6P0ysbEXpM+dgpy66NZI++HaIOwg3Huxntg+fC9wlzMGIu
	WBdSEsIl5MIytt1OKptw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRJfU-008VkW-0w;
	Sat, 20 Jan 2024 22:18:24 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRJfO-008Vit-3A
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 22:18:23 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d711d7a940so17239705ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 20 Jan 2024 14:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705789097; x=1706393897; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1WUVuDLHStAllFcB0Ov3F6dgFqUmfYVHvBZ3n1HqWbA=;
        b=1O9v5I+H0pOKkr3Vc9QvzJwsj8haoy09wppA8bIBCdyjVkFZoKTrmb1F/bmQK9AeGa
         0eQigOHUFHvTEFVeuM6cm8qlshtvO1+7F5qr7SX3cK86CTuKqJ6p7tLNmtkU33xz3I+c
         NX2z/FAseFlx37Kz62zIYOrpUpLaBvwu+3iuUr81eMQV8sAQYjLxPj17xXp8f1PoZSw4
         jIB1O2NfGpGUKSP14fJx/ywOpK2syzXknfX9QkYZo5tkJVcanizhLEgP2HtMbIXQ6YLI
         Ch6i3s0c+GGH54c2dzl+EPjsZeZ9UchaxQEZ5/wovXP1/OCbsZJAu2beDlb+5yDKer4B
         RMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705789097; x=1706393897;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WUVuDLHStAllFcB0Ov3F6dgFqUmfYVHvBZ3n1HqWbA=;
        b=qQyFfHZ4p8OPDYf6PCqw7aJ5E7J2x5DSIAXoYcK+GNLrSNsnOFC4hGGPnbS6Q+QBRX
         Scr3sEXhta7XUm3DnavMs1b0fNQt63HRQem1gLMOHOxzOJZN5uo8ZO3n5o4cu5xmsjRd
         vPqGy4Ui8Rj9KU11UPhVkVHv1Q/gcNLd551uloohcs9cYXcqM/jLijVFTiSHHmB/aT5l
         4Pgs4pSzOUwMb+ET4uuEEvP7XMt59rZqBlyUFSTHYOks71iDec2TinqNGJYOZNT9j9CN
         kcSo+/ME0+R/uIDVIzxOep+GlhtKejD2xTKEs9FyUBP10KnI3hTPO64cZ4HSEgrgba8i
         Q16Q==
X-Gm-Message-State: AOJu0YzUDABtKstr3xc0xfWvq9UOi0i/LYu9Ewg/YrkE2FOPnymyLDxP
	DBjMh52jKy6u06sseSaBpSQ75tkMdjrG8lVvy5Qt+1kErUjb5jy9bNxeSmBHe0k=
X-Google-Smtp-Source: AGHT+IGnWeXsIRP7nUHqmRUizOAddhsYAQGcMNa/0yJUL4I37X3BJLSnqErZFnwGZHDwiHsLQ1AiEw==
X-Received: by 2002:a17:902:aa87:b0:1d4:5cf1:3484 with SMTP id d7-20020a170902aa8700b001d45cf13484mr2186382plr.62.1705789097173;
        Sat, 20 Jan 2024 14:18:17 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d4-20020a170902c18400b001d71649bf9asm3706961pld.252.2024.01.20.14.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jan 2024 14:18:16 -0800 (PST)
Message-ID: <65ac46a8.170a0220.d6f56.f52c@mx.google.com>
Date: Sat, 20 Jan 2024 14:18:16 -0800 (PST)
MIME-Version: 1.0
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: v6.7-12908-ge5075d8ec5647
X-Kernelci-Report-Type: build
Subject: riscv/for-next build: 7 builds: 0 failed, 7 passed,
 2 warnings (v6.7-12908-ge5075d8ec5647)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_141819_365627_138CBF64 
X-CRM114-Status: UNSURE (   2.06  )
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

cmlzY3YvZm9yLW5leHQgYnVpbGQ6IDcgYnVpbGRzOiAwIGZhaWxlZCwgNyBwYXNzZWQsIDIgd2Fy
bmluZ3MgKHY2LjctMTI5MDgtZ2U1MDc1ZDhlYzU2NDcpCgpGdWxsIEJ1aWxkIFN1bW1hcnk6IGh0
dHBzOi8va2VybmVsY2kub3JnL2J1aWxkL3Jpc2N2L2JyYW5jaC9mb3ItbmV4dC9rZXJuZWwvdjYu
Ny0xMjkwOC1nZTUwNzVkOGVjNTY0Ny8KClRyZWU6IHJpc2N2CkJyYW5jaDogZm9yLW5leHQKR2l0
IERlc2NyaWJlOiB2Ni43LTEyOTA4LWdlNTA3NWQ4ZWM1NjQ3CkdpdCBDb21taXQ6IGU1MDc1ZDhl
YzU2NDczMjJmYjllNjk5YmZiNzYzMzFjYzhlZTA5OGQKR2l0IFVSTDogaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0CkJ1aWx0OiAx
IHVuaXF1ZSBhcmNoaXRlY3R1cmUKCldhcm5pbmdzIERldGVjdGVkOgoKcmlzY3Y6CiAgICBkZWZj
b25maWcgKGdjYy0xMCk6IDEgd2FybmluZwogICAgZGVmY29uZmlnK0NPTkZJR19TTVA9biAoZ2Nj
LTEwKTogMSB3YXJuaW5nCgoKV2FybmluZ3Mgc3VtbWFyeToKCiAgICAyICAgIHNlY3VyaXR5L3Nl
Y3VyaXR5LmM6ODEwOjI6IHdhcm5pbmc6IOKAmG1lbWNweeKAmSBvZmZzZXQgMzIgaXMgb3V0IG9m
IHRoZSBib3VuZHMgWzAsIDBdIFstV2FycmF5LWJvdW5kc10KCj09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09CgpEZXRhaWxlZCBwZXItZGVmY29uZmlnIGJ1aWxkIHJlcG9ydHM6CgotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQpkZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywg
MSB3YXJuaW5nLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKV2FybmluZ3M6CiAgICBzZWN1cml0eS9z
ZWN1cml0eS5jOjgxMDoyOiB3YXJuaW5nOiDigJhtZW1jcHnigJkgb2Zmc2V0IDMyIGlzIG91dCBv
ZiB0aGUgYm91bmRzIFswLCAwXSBbLVdhcnJheS1ib3VuZHNdCgotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpkZWZjb25maWcgKHJpc2N2LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdh
cm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZGVm
Y29uZmlnK0NPTkZJR19TTVA9biAocmlzY3YsIGdjYy0xMCkg4oCUIFBBU1MsIDAgZXJyb3JzLCAx
IHdhcm5pbmcsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgpXYXJuaW5nczoKICAgIHNlY3VyaXR5L3Nl
Y3VyaXR5LmM6ODEwOjI6IHdhcm5pbmc6IOKAmG1lbWNweeKAmSBvZmZzZXQgMzIgaXMgb3V0IG9m
IHRoZSBib3VuZHMgWzAsIDBdIFstV2FycmF5LWJvdW5kc10KCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCm5vbW11X2syMTBfZGVmY29uZmlnIChyaXNjdiwgZ2NjLTEwKSDigJQgUEFTUywgMCBlcnJv
cnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpub21tdV9rMjEwX2RlZmNvbmZpZyAocmlzY3YsIGNsYW5nLTE2KSDigJQgUEFTUywgMCBl
cnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQpub21tdV9rMjEwX3NkY2FyZF9kZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQ
QVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfc2RjYXJkX2RlZmNvbmZpZyAocmlzY3YsIGNsYW5n
LTE2KSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVz
CgotLS0KRm9yIG1vcmUgaW5mbyB3cml0ZSB0byA8aW5mb0BrZXJuZWxjaS5vcmc+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
