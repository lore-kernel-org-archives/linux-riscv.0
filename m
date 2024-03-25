Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DCAC54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 05:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5Ci9d4QDw9bO8Mc9HMv0JKFuY0sMofD9I4XdmJ9mvnk=; b=Z0ICudrSbqChyF
	aQnfd3/G7HT8BV5aBA/uf1meVVge8S5PMRsEJ7Bh0N53MXaX43HX8imMCXwZlmpwMlePoJkvc5xWo
	CcCspn7cW0rZHSPr/WEv6yBtFqhOiBudbZ8kUM+fiNZQMH9AA+h2D64CnaFt6bQnqhaxYWpRlh4g/
	Bb6+hSkhzxP6O4PuAw8K7cZkKI8nd6Q2t3XLNLUcX7eU+uifvOqB+8MYDLT9ucrzlW6EKFXT1JEiR
	vJ80R3q3N4MQOzxwRP3YUgKPjShGekxofcmFEL/UaUUYkJa6EDG4Z1Z+BWUffw4vCoHGvPVsypWZO
	QiBOpTpljNJXNnD6KrYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rod0C-0000000FRjz-03fu;
	Mon, 25 Mar 2024 05:36:08 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rod06-0000000FRhe-0zAQ
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 05:36:06 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1e04ac4209eso35189125ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 24 Mar 2024 22:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1711344960; x=1711949760; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lyoarTjKcudqpm/+s+LdT14bjtAdB4FCtPAFLHEqxSI=;
        b=ZZmcAIFLAbGTabxYrPBB+04qFaz1V7a7Hx2szWnSMMKWg3zGTFDhHTaWtVcxiu/kLf
         u+nAq3l3X/mKdKZ8IqP/KruDt5UpAgvoi1lKqMSu5dpt4GPkk6R5ggVbDgSZPCLXQajV
         4MPIvePG0WEPHkNiDMjvZXN11wqCrtL6G58sqnqJbreZytq51pwfVbzuCaePezoPVgRu
         u8Jjea0dhsiJvhIJgr3aJd5J5dHP+zFQFQoJhB/wdlFmbm9iuS3FaUueT7YURmT4CbTX
         o6HkT2hTYjHkN8Su8yg1bPLTly3xhxTcY4yGi9IwudzGbxViMJBSh9Iskqd/SYua5h0z
         atLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711344960; x=1711949760;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lyoarTjKcudqpm/+s+LdT14bjtAdB4FCtPAFLHEqxSI=;
        b=YkE7GxwfgmsfKghMPTzWKmcoVll3C7amH0nBLiZCmxHKje+VzNFquuFK1qAYLcKqLV
         iTk0WE4EmLKUMzhojOs1QC6RLjSq/WJ0v4YqmpPRuimqJ6An40JlxVdKjcrUs4B0lkoN
         igVYOFUr4n9I7Ba7zmmmhK1zRuVp0hTD3Ol6QwQfIG+NpHgIZL1a9kOSlLU0afSKIzgm
         whwEUxAHyQ6fJUWfUh3dD9SlanSe9b7GC2k8cZwIk7Q6SRIsHBBroCEH3M65nRBmTJQR
         p9OlAphWFIBGPXqLXoashEiZ12Zbd4QjcS+Tj3N7qcETdB4Hs4GPrbX6qvt/SbZm9wdH
         y2Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXuZaWlWH2HZjTAa4yH6zm6dBl3+udUOvBfc4wwSzY2HhvC7bVSnGmGeq5HvI98D6M1Oge1yicFNT39azGcvPwjbKoKKJmwNrpjw9tMGVmZ
X-Gm-Message-State: AOJu0Yz1XPR+1msuCRe9Iz/tJ9rrth17T6L7aIjvovwYcn/8eVbH/Xvj
	g3u69Jy6+7gfYiCGrHwGMlPxlPGfEEzegvthN1yje/0H/n6hro+hzQ9Qtw2HiTw=
X-Google-Smtp-Source: AGHT+IFsmvvZQwjEktcv1O+Zs6kvLZEZ5n4KaB9Sy9cuxKNHOKlbwXGA3QxiSxwMP4hP9RmVQ9BM8Q==
X-Received: by 2002:a17:902:b196:b0:1dc:696d:ec6e with SMTP id s22-20020a170902b19600b001dc696dec6emr5553018plr.21.1711344960038;
        Sun, 24 Mar 2024 22:36:00 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id e7-20020a170902784700b001def758b7d0sm4043129pln.127.2024.03.24.22.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 22:35:59 -0700 (PDT)
Message-ID: <66010d3f.170a0220.c578b.937e@mx.google.com>
Date: Sun, 24 Mar 2024 22:35:59 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Branch: fixes
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: v6.9-rc1
X-Kernelci-Report-Type: build
Subject: riscv/fixes build: 8 builds: 0 failed, 8 passed (v6.9-rc1)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_223602_338796_D8432271 
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

cmlzY3YvZml4ZXMgYnVpbGQ6IDggYnVpbGRzOiAwIGZhaWxlZCwgOCBwYXNzZWQgKHY2LjktcmMx
KQoKRnVsbCBCdWlsZCBTdW1tYXJ5OiBodHRwczovL2tlcm5lbGNpLm9yZy9idWlsZC9yaXNjdi9i
cmFuY2gvZml4ZXMva2VybmVsL3Y2LjktcmMxLwoKVHJlZTogcmlzY3YKQnJhbmNoOiBmaXhlcwpH
aXQgRGVzY3JpYmU6IHY2LjktcmMxCkdpdCBDb21taXQ6IDRjZWNlNzY0OTY1MDIwYzIyY2ZmNzY2
NWIxOGEwMTIwMDYzNTkwOTUKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0CkJ1aWx0OiAxIHVuaXF1ZSBhcmNoaXRl
Y3R1cmUKCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CgpEZXRhaWxlZCBwZXItZGVmY29uZmlnIGJ1
aWxkIHJlcG9ydHM6CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcgKHJpc2N2LCBj
bGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0
Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZGVmY29uZmlnIChyaXNjdiwgZ2NjLTEwKSDi
gJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcrQ09ORklHX1NNUD1uIChyaXNjdiwgZ2NjLTEw
KSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcrQ09ORklHX1NNUD1uIChyaXNjdiwgY2xh
bmctMTYpIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNo
ZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29uZmlnIChyaXNjdiwg
Y2xhbmctMTYpIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21h
dGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29uZmlnIChyaXNj
diwgZ2NjLTEwKSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNt
YXRjaGVzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpub21tdV9rMjEwX3NkY2FyZF9kZWZjb25m
aWcgKHJpc2N2LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNl
Y3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kbm9tbXVfazIxMF9zZGNh
cmRfZGVmY29uZmlnIChyaXNjdiwgZ2NjLTEwKSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2Fybmlu
Z3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0KRm9yIG1vcmUgaW5mbyB3cml0ZSB0byA8aW5m
b0BrZXJuZWxjaS5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
