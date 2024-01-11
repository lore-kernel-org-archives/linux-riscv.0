Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B307FC47422
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 17:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aZkUo07dbBSgSbatVwgMBTwKNaEFQKa77MXdqpk04sc=; b=CrhKuZfcGfY8Rc
	KLqUldZNUI+TcNCQKZMc8a+7PgJAtyKdngG777V1oLsvNBMSkFlb+u7SbMSiC+Vdt3aRTpUQuR/py
	ZeZjJYgNiSbywzRHJRF7s1BQtn1O7iK+JgGZqbr9vAg9p0uWUTsJVlOBuxUw0gc82lOU6QXFoCyFN
	8w/BQTHCid2wrR5IX2ibw+H8RwRwuInfqFMT0+8heeYHiEi+HReIkuwTPbUDL+8I8uO9xlwUyYUcD
	dfSr/7w3rfbvt3DQyzulag0X9FUFrviP6+awgH2nEusSoETZlQ7elmKNPwxughFBh2FduRpVvtl0Z
	KTxU9ECwRGAR0RjJorBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNygz-000hdJ-2d;
	Thu, 11 Jan 2024 17:18:09 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNygw-000hc2-0e
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 17:18:07 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6db0c49e93eso2812233b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jan 2024 09:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1704993482; x=1705598282; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MRmDlHyTWGqNWP2eGQy/Z/xQu0ih4wtsCe9dx36Bfz4=;
        b=LYzsVTJcAhtFiMBwormPTrsX1ji1eP2NYxG2BuU7jw85p2/JmyK6bqOhZBTVaKSjud
         PMtl0Fl2vrRiTxN5u21SP+ax5yC8AVYyMokjTWYKrFDnIxlU7H6J2ckfUyfUNhJrJfcj
         RF24qgPLhJV0BCxYwMZqiBlo2RL/TgT/3jqsbuxOo4mnng1zZc5Z56PuX9R2I3jUGDY3
         Ig0QAjdrh07sfAARDX81als4Cy9/fsGYL7a6g//kJxSc9VLEi5NnuVTuq2FWdYJMbyqI
         D5RtPAfFnClU/N9IvcYUezWLYpKJhT8tMbg8nTaDPkEmIozrDPH0ce/MUarakMAKW+GE
         dR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704993482; x=1705598282;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRmDlHyTWGqNWP2eGQy/Z/xQu0ih4wtsCe9dx36Bfz4=;
        b=B0NWgJuQy8d2Khr878LSbe3s+6Gq1h5x+0PssceyJCpKtYweQStLAyC5rT5qdCBYCE
         y1XjrTecFR4Od9d8sYjA0Ndmh0oJNqOVngJ+bJa0Iyo9tdM/2ApnaXR7v6rpvuo/ydsn
         RLSmLVvpiDqKKBMJzA+yyOM22wSSfeD68T6jCSso9BvpDIb1IMgNi9hCfJZI8HeSsVCz
         2oGC5689OlnbHmnDMClk3+mGTDl1wH7z8exugf/BsSeJsYl4epiPzuBaGZSsByviwVcF
         I78GDZ//lVckmC4Ry09p1iI5zyl7uSz/glp+2vCFqJPpAQmX2pZvjya8Ma06duXIWiey
         u09w==
X-Gm-Message-State: AOJu0YzD5RpM63QXa1GBwMmGR1ZDDb024Oxmrini2ZH6gF2UwyTLAjof
	S4XxR7HErWTIJ4nLGUVg3ps+aJOlsiEQ1Q==
X-Google-Smtp-Source: AGHT+IFvBKQym3LmFyt/RdZw2Hr16nwq6JGtzOyRscakabn77AP8+htuSPKFozixltDa5NKyay7qLg==
X-Received: by 2002:a05:6a21:32a0:b0:19a:38e2:48ad with SMTP id yt32-20020a056a2132a000b0019a38e248admr179201pzb.59.1704993482503;
        Thu, 11 Jan 2024 09:18:02 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id m6-20020a62f206000000b006dae568baedsm1406125pfh.24.2024.01.11.09.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 09:18:01 -0800 (PST)
Message-ID: <65a022c9.620a0220.ba379.452d@mx.google.com>
Date: Thu, 11 Jan 2024 09:18:01 -0800 (PST)
MIME-Version: 1.0
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: riscv-for-linus-6.7-rc5-79-gd3e591a38c98d
X-Kernelci-Report-Type: build
Subject: riscv/for-next build: 8 builds: 0 failed,
 8 passed (riscv-for-linus-6.7-rc5-79-gd3e591a38c98d)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_091806_484513_39715745 
X-CRM114-Status: UNSURE (   1.66  )
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
LWZvci1saW51cy02LjctcmM1LTc5LWdkM2U1OTFhMzhjOThkKQoKRnVsbCBCdWlsZCBTdW1tYXJ5
OiBodHRwczovL2tlcm5lbGNpLm9yZy9idWlsZC9yaXNjdi9icmFuY2gvZm9yLW5leHQva2VybmVs
L3Jpc2N2LWZvci1saW51cy02LjctcmM1LTc5LWdkM2U1OTFhMzhjOThkLwoKVHJlZTogcmlzY3YK
QnJhbmNoOiBmb3ItbmV4dApHaXQgRGVzY3JpYmU6IHJpc2N2LWZvci1saW51cy02LjctcmM1LTc5
LWdkM2U1OTFhMzhjOThkCkdpdCBDb21taXQ6IGQzZTU5MWEzOGM5OGQ0NDhhZTg0ZWJhMWY4OTM4
OGM1NTM4MmNiMGUKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
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
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29uZmlnIChyaXNjdiwgY2xhbmct
MTYpIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29uZmlnIChyaXNjdiwgZ2Nj
LTEwKSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVz
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
