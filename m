Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62724C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 16:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GovQmsdd+YdHiNmxDzEBHd3fqthsAJxRcjkl2BD2W00=; b=II+aNON5uDct+u
	NDaFMQ8i9lVYnvy+fQX9jw2okeXY0VwHdWNRQm+aH0LfqnvSYyP1jCixViQopkQDLtpAk+otOi7fd
	92TM1tdwbUjnY5JKP3ALXy8xh2kUCmRizIGL8a7hguVbRDRk+YnwXptuvpMcnYEPGJmcKcsCWuzx7
	bmCmvTBTXVd5gSsRcaCpwjFIgK3PXrP99DcKtMyvEmhTrDmWri4+CRke69cdNEY+0cPzWERRNt2G8
	Tnz5S8ydSW0n6ogBFsdq+Ak1sk4CYNxjK19a+kXKBWomc2Qlkp1CJSC49S7gOdQw+xUgVE1MboC9V
	+3pZ9jaU2S+gbrLzeeCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNxcO-000Xli-2T;
	Thu, 11 Jan 2024 16:09:20 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNxcK-000Xks-2a
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 16:09:18 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-28c0d8dd88bso3826019a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jan 2024 08:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1704989354; x=1705594154; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i0JDUeVDBNFO9B4+Ds9DV5lpfG0C+T76kz1oQDHNLVA=;
        b=AykJjqVctTAWy8re2xqo/sbey8cjF7wpjNvGC8w6ojWY739gy8oRxuRHaJ167JlFk8
         XH2cpOcUf7l/bffjkxTEozZgQdA9vXsIFxFZq8du6R3quTdyr9Jt/qVKRGjxd3Sv2LrG
         DAPTxkC/oKspVlbKso8yqyYf4wt459vk0ga7SvNc3SGRHTut4HjvhlG/I6U4W1twDeg2
         5nLqxzjr2PcSnjCNiXVB/dUVMtLmEJ7GGF9oSmXZ2nqpnU5c7aXEPQF19lanQ00arlDe
         qQ97J+gRYB5BPDJVzgWl0dkJcmkGlRmg2dTGC/7lwy1+DZ+nqQLeHwG0315/FafALw9M
         Koxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704989354; x=1705594154;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0JDUeVDBNFO9B4+Ds9DV5lpfG0C+T76kz1oQDHNLVA=;
        b=Z2sL8Rn1AAJKevYeA3wF+rAKwkHjcseL6fJaIKdZFVCE5KDkdsmA+aPo17TPR2NcyJ
         KJEfrtkSoFFWyqxDW9CGdU3uj800v9aVR5YEBOB/MdxumqhFVySb7WqV5v6VGzCeNHts
         e3C7Iy641LPl8bZwcdi1DsUX0NdpWPVip/vzGRv+CLjz6sMS5oJC8HdsgceFWlYCdPV3
         YV4yeGluATZAwWssAXdmgZWBAq8G3KWLRW7QfNalRjCbaBmxe5Ly9gXx+8jdiJK/F7my
         IhNzXwxYvYcfCAsaJfzgaxlRDfx7dA0hZeeNw/n96UqzxfKdgLP4i7+aHjBS62nZ0iQS
         ceDw==
X-Gm-Message-State: AOJu0YwbqYx0GgsxNMdLxkAmp09xBeODWyPKj/BMeTnwH5Gy3EHGOfxs
	HxAcBqX81YxY7LbdFTlC5/i0ZycfDqw2Vn89cnKNjdqFDfIxWQ==
X-Google-Smtp-Source: AGHT+IE8InVO+BFNqgqQNc9fymNtPIi60zkjtt+S+CAqntViZDfTk+tE+FYRCCyds97n9p7QtYNrZA==
X-Received: by 2002:a17:90a:ec0b:b0:286:7f0d:6254 with SMTP id l11-20020a17090aec0b00b002867f0d6254mr1153366pjy.63.1704989354275;
        Thu, 11 Jan 2024 08:09:14 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ee11-20020a17090afc4b00b0028db1713cbbsm4084056pjb.1.2024.01.11.08.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 08:09:13 -0800 (PST)
Message-ID: <65a012a9.170a0220.b2957.ff3d@mx.google.com>
Date: Thu, 11 Jan 2024 08:09:13 -0800 (PST)
MIME-Version: 1.0
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: riscv-for-linus-6.7-rc5-79-gc4e4b793738c3
X-Kernelci-Report-Type: build
Subject: riscv/for-next build: 8 builds: 0 failed,
 8 passed (riscv-for-linus-6.7-rc5-79-gc4e4b793738c3)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_080917_172361_042C91E9 
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
LWZvci1saW51cy02LjctcmM1LTc5LWdjNGU0Yjc5MzczOGMzKQoKRnVsbCBCdWlsZCBTdW1tYXJ5
OiBodHRwczovL2tlcm5lbGNpLm9yZy9idWlsZC9yaXNjdi9icmFuY2gvZm9yLW5leHQva2VybmVs
L3Jpc2N2LWZvci1saW51cy02LjctcmM1LTc5LWdjNGU0Yjc5MzczOGMzLwoKVHJlZTogcmlzY3YK
QnJhbmNoOiBmb3ItbmV4dApHaXQgRGVzY3JpYmU6IHJpc2N2LWZvci1saW51cy02LjctcmM1LTc5
LWdjNGU0Yjc5MzczOGMzCkdpdCBDb21taXQ6IGM0ZTRiNzkzNzM4YzMyYjZjNzQzNzJkMjliMWNl
YWU4ZmRhYzU3NmMKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
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
