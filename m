Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E930AC4707B
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Jan 2024 03:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bOfhDoNoA+vP23ch2FHmccO8lPSpvfVTUlZ7JrxmaC4=; b=Og6+9IMuRTjeqR
	FLwQwovMzryoozvp4nOkviDwM56FYBQuRX6tzUMsuSp0Ocr3aTtfCkGEPqO/r5F5huBuGISyWK4BA
	Mhb4QkRUm+ujEYTFiHQhmp0HWZdHwqBcVDyJXuEbEEe+vV0A8lL+y3lmCG8ds0Ua5MaTRIjFWH7DO
	U7jv9ubrz1P3gbgdRNtXE3oVLC+2FrZYuaRmuVDQOojCZRTnlOldH2/97zVqv+IgCFFYnJzwRR0Wo
	kAQWgfjGmjir6vh4Hs0F/C4nVtGbhnxBNmpqX7MlWbtd7eZBVaOW+5c57CCvq1MUhxwliFP8Cx41Q
	5/GycVePv8ehX3J4cYmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOUVL-004Tmq-0I;
	Sat, 13 Jan 2024 03:16:15 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOTLL-004Qhj-0h
	for linux-riscv@lists.infradead.org;
	Sat, 13 Jan 2024 02:02:01 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5cdfbd4e8caso5101178a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jan 2024 18:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705111254; x=1705716054; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BDxr4rYZqj7h5umv8vGw01w2SidO8F3uFhCtOJajPz0=;
        b=VfiyGyxO2wMO8P7aopyBSPQoAZOZFB6PhqMSIUW0WwPC4ie13RQYebAIv9zuaP0BUE
         wkwC1cJALMWORVuSwlvJDeYVUVv80XgqMu5dUlyNkJmAkZa7iNq1p2edLmxmn6FT4ZHd
         WFMGMUHmSUuxIG6+ooBTlN5FpqGsoBAiQl9il+4scVkQ3uA3cRSzsE1NR0aBWhWPCtwL
         neWN5Rv8mdRvn8rJfB/CBFFTtJpV46exVUeNomobCTlfVd7V3BO4VOV7PnwuyOUZMHzR
         sCrLu104QdhD6FN+c/6Iym0bt4utqH/hVLA1zqq681Tr226nUSjEHZSphD51T9lZAtDN
         nNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705111254; x=1705716054;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDxr4rYZqj7h5umv8vGw01w2SidO8F3uFhCtOJajPz0=;
        b=IHcSsQcHdd5yQVUcv0Pa4/pZFu5oP5uERTeCFcKmj342Ug9f9NI4c873d8TM2r1u7Q
         UxadRrSSxUkalc5NI1yqxYZTi5BWK2KpF4VTJfKyIK+wAEVQWszXilM1YXfJl+bpSwER
         yoFeV5vEX1TqngMpLTyMO4NoLk2f4Bg99auQicWXPxOVkruZefzziSoz6Xz1vd16AY+1
         IoOa0msO1ixR4Jst16u/s8Kv7kOEF2/QOH4IxQanwmgJsbv/VIfB4B7rNVS9Wf0HeWtY
         tF0heT47WZ3i9mWgInLHoFYnNbw/5bkDYWKR39zFhHHg6/UstCglfJlJjrho/jXzJqA0
         Hi+Q==
X-Gm-Message-State: AOJu0YzIoqvElLz2WmYa34zDsQRcpDQJHu6nhbI/jl3kLzTedj6Vcr4a
	PezmG8sntHH/5YtGCcUaHQzlWXLV+Jzxuh3CmgQ5nhpPRz4=
X-Google-Smtp-Source: AGHT+IE8q6lCO+KyiRrq1+U4MColqomIEl27h8cqhdeI40Qn9wzGzJFiIJlwh3djKgE5WvwrQyWNvw==
X-Received: by 2002:a05:6a21:1f0a:b0:199:d6b5:247c with SMTP id ry10-20020a056a211f0a00b00199d6b5247cmr1632319pzb.87.1705111254111;
        Fri, 12 Jan 2024 18:00:54 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id n8-20020aa78a48000000b006da5e1638b6sm3897769pfa.19.2024.01.12.18.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 18:00:53 -0800 (PST)
Message-ID: <65a1eed5.a70a0220.e4d35.de26@mx.google.com>
Date: Fri, 12 Jan 2024 18:00:53 -0800 (PST)
MIME-Version: 1.0
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: riscv-for-linus-6.8-mw1-32-gd4abde52b4b11
X-Kernelci-Report-Type: build
Subject: riscv/for-next build: 8 builds: 0 failed,
 8 passed (riscv-for-linus-6.8-mw1-32-gd4abde52b4b11)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_180153_533784_8BA57B83 
X-CRM114-Status: UNSURE (   1.37  )
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
LWZvci1saW51cy02LjgtbXcxLTMyLWdkNGFiZGU1MmI0YjExKQoKRnVsbCBCdWlsZCBTdW1tYXJ5
OiBodHRwczovL2tlcm5lbGNpLm9yZy9idWlsZC9yaXNjdi9icmFuY2gvZm9yLW5leHQva2VybmVs
L3Jpc2N2LWZvci1saW51cy02LjgtbXcxLTMyLWdkNGFiZGU1MmI0YjExLwoKVHJlZTogcmlzY3YK
QnJhbmNoOiBmb3ItbmV4dApHaXQgRGVzY3JpYmU6IHJpc2N2LWZvci1saW51cy02LjgtbXcxLTMy
LWdkNGFiZGU1MmI0YjExCkdpdCBDb21taXQ6IGQ0YWJkZTUyYjRiMTE2MTExNTM3NTkzZTI3NDRi
MzIzNGQxODgwOGQKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
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
LS0tLS0tLS0tLS0tLQpkZWZjb25maWcrQ09ORklHX1NNUD1uIChyaXNjdiwgZ2NjLTEwKSDigJQg
UEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcrQ09ORklHX1NNUD1uIChyaXNjdiwgY2xhbmctMTYp
IOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29uZmlnIChyaXNjdiwgZ2NjLTEw
KSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpub21tdV9rMjEwX2RlZmNvbmZpZyAocmlzY3YsIGNsYW5n
LTE2KSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVz
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpub21tdV9rMjEwX3NkY2FyZF9kZWZjb25maWcgKHJp
c2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1p
c21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfc2RjYXJkX2RlZmNv
bmZpZyAocmlzY3YsIGNsYW5nLTE2KSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAg
c2VjdGlvbiBtaXNtYXRjaGVzCgotLS0KRm9yIG1vcmUgaW5mbyB3cml0ZSB0byA8aW5mb0BrZXJu
ZWxjaS5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
