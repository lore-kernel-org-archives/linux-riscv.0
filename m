Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9D4CD128A
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 16:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L6/r8JqOJskGfpfsG+qq1WW7GACbDX4FRY5ascdDBMM=; b=hON6JGAE5trN0o
	H+nProveDrbgLip23bTB/gaJ2DxHDE5G9qby4a3tU8kDYPouD3gSPsm49YQqU0Ua1aN87BZcB/uwP
	eAd0kfwrlah6mM2ywhFdICkNeHRmQsFg1pGV31KauPTgvWmk2U+nnHNPDq3ybsZ3av2Ni9e5V66UC
	rivwg0WomEqoXxsRF01/Nj0/eYpVdTSszdACo96rcvLXmNSV/8DO0xPkfptRE9u7RbBG6DcVyg7KU
	LIFUTEOf57gC/JwsNDHhnz9zmxd6nm8lk6PKP2VRYDh5i8rlGnhDspP1xU5ys/Tm46ZJXCrsC9J8S
	eme/Dq3iGVTjmEGwxHYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rubCy-000000086V4-2h2u;
	Wed, 10 Apr 2024 16:54:00 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rubCq-000000086TC-2cER
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 16:53:59 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1e36b7e7dd2so46231075ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 09:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1712768028; x=1713372828; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PzlJXFof8g8uTRfj0/3USlWhiaogYG/xAZAlpF3+ufU=;
        b=tUEGQ9IGDuaEXasUQszat40SJ07rgDOu4COYM95ipEr3j00tsr2qLotNqcEK/Pgv2D
         hcspSAaYHer/Durn5gND+kNSiehHHiOf4T2NHnP3F9uwd3YnkVTq1KFySlfAjYOr9Oy9
         ubziqIhw9tsV0mlh1cHvi4lC15hWU0Rd8RrptTHzJ9Y/O9eQA6jzAaHjf3pcTsQzuq77
         2zRvi8pCOvCNeGq4Vlpveb6E2QVQDsRNlRr4zWs4NoYU6thnOTReha1C93BdXWja8aJ3
         RmVDOdu/7JxIRgneQByIRZYvt3B0GDVFoIZWUKrm22bSm3TsVrm81vgsLTqcaJ6ZAJzz
         /5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712768028; x=1713372828;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PzlJXFof8g8uTRfj0/3USlWhiaogYG/xAZAlpF3+ufU=;
        b=UGE3tRrRraQAxIE1oKybhwFjzBfjo8l2C4llgyvzT0YY3s15saMmCmQLzJoE9e/0Ov
         5FdSPcqbJql7UqcQwop/465BHvaPORLTzAnF9Gq5u5Qq+GZrqfjV6cN6Nrs/J4hVKCSF
         BDY426Usx/rDVNYPC4VaWG1GZedQR2ZmMsueJqceU7PNrcdxaUEXSoCMDZ8LnB7DrQh9
         aztEShI2vPBNx7402dlyszRbus4DK1AUvtvg617E1S/q7q2oaKnGS7MZDLd73wiEWRQJ
         Rn21k6gReBpAy5jvTDIxktMEuYNo3z+apMr7UpPs3WINhywHnt0dp5qyqYh77bSUvKmG
         7paA==
X-Forwarded-Encrypted: i=1; AJvYcCV1cwVOVfRSI1cqyz0VKiz/lu8zqNzrQZCuMkVDMYbOFBdnEGW5ndl0j0IH4pb8TDvGnPAV8ajIs3yAs1vLaVsTQkezjfXlGWqoR+LPUbyW
X-Gm-Message-State: AOJu0YzO5hr3IT90Z83DNLNtWq5j2F7YR2Tad1xuM3BxRCzH2d5bzMwv
	6sWU6KfEltuQJpyq7sDUgKjMh6VpfAhQGkIYWoV5SNZMR3SmN03oG1DJJaBv0rM=
X-Google-Smtp-Source: AGHT+IH0LjsBKd9p9+/4R1+zddioLruZFy2/0AIrRJQVOI9Eyo1UuzyX5XbT/0XKwBmVKEFqqER9BQ==
X-Received: by 2002:a17:903:24e:b0:1e4:514a:55af with SMTP id j14-20020a170903024e00b001e4514a55afmr3575901plh.68.1712768027769;
        Wed, 10 Apr 2024 09:53:47 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id n2-20020a170902d2c200b001e3d2314f3csm9257634plc.141.2024.04.10.09.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 09:53:47 -0700 (PDT)
Message-ID: <6616c41b.170a0220.be5f4.9b33@mx.google.com>
Date: Wed, 10 Apr 2024 09:53:47 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: v6.9-rc1-19-gba5ea59f768f
X-Kernelci-Report-Type: build
Subject: riscv/for-next build: 8 builds: 0 failed,
 8 passed (v6.9-rc1-19-gba5ea59f768f)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_095356_817441_9C0489FE 
X-CRM114-Status: UNSURE (   3.71  )
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
cmMxLTE5LWdiYTVlYTU5Zjc2OGYpCgpGdWxsIEJ1aWxkIFN1bW1hcnk6IGh0dHBzOi8va2VybmVs
Y2kub3JnL2J1aWxkL3Jpc2N2L2JyYW5jaC9mb3ItbmV4dC9rZXJuZWwvdjYuOS1yYzEtMTktZ2Jh
NWVhNTlmNzY4Zi8KClRyZWU6IHJpc2N2CkJyYW5jaDogZm9yLW5leHQKR2l0IERlc2NyaWJlOiB2
Ni45LXJjMS0xOS1nYmE1ZWE1OWY3NjhmCkdpdCBDb21taXQ6IGJhNWVhNTlmNzY4ZjY3ZDEyN2Iz
MTliMjZiYTIwOWZmNjdlMGQ5YTUKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
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
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcrQ09ORklHX1NNUD1uIChyaXNjdiwgY2xh
bmctMTYpIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNo
ZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRlZmNvbmZpZytDT05GSUdfU01QPW4gKHJpc2N2
LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21h
dGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29uZmlnIChyaXNj
diwgZ2NjLTEwKSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNt
YXRjaGVzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpub21tdV9rMjEwX2RlZmNvbmZpZyAocmlz
Y3YsIGNsYW5nLTE2KSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBt
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
