Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E539C4706C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 07:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yu0SeT1Wbtn01v/TXlhOPRJTzUC/gBNrmJxXDxeHjx4=; b=LdBujknkGZLrOS
	/yJ6S4+v8R6zzQOX0N7b3aT5VNddFn+Zj8TAtu0n4xQ55mlOu68uoqwy7SgwlVEEUyc8CI+OXSTS1
	o/AoOp5HxLmIMZUEho5Zhkw3GWlqyvFSudAz+OJRecSoznvCGpIvG91mI92ItAW4zbHGTUchTVzw/
	cz6LchvDmwuBR/HeOt6rXUq5CuGkMdOZOB/GWj6oZymd/6lbBNO/DpkfT14mF8897K/GKbloVRQzJ
	wa24dumDms7mARXam/271JroaT53z2g1ZQrZ7j5F5Im5Ba7xgRk7lmLwGFL6VDZxTLX6ATzgGsTZc
	sLrjheUTu2IMT4DdjWVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOBxp-0025YU-0z;
	Fri, 12 Jan 2024 07:28:25 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOBxm-0025Y3-0k
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 07:28:24 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5ce0efd60ddso3518511a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jan 2024 23:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705044499; x=1705649299; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6rBwZl96Co75VhJWficqTDu8Aec8xN9HxL1XHRGFaHc=;
        b=x5V6+ADfk+JuE5tZ3knVgdcheX7RUk4At9p4Ns6myXVjoY7yiKC7hgIgn76FqZbJyP
         zsjz65I+lmrvbqBaTwaAlzRz4z2ZYYU0Pw9uG4ImDn2m15aeDZV00SOErZzWqjlFu35l
         mENO/vBWIemdqoik5srn2kqaoBnjY1sY3JUzqR/voMHMCEcgO46/i20wvjKNezy2cb9z
         uNmuc7bxI4TdfiNMdC9GNcD9QUGtZKkPlRsgNBWSrQDodLim5wK+fbuZcNIPVCBDVSvj
         ndSHZi5F6heZJQ3+RMCj1+1Me2m7j5zviwKmr5jyb0PQVqygEDQmVIwTyXxzAXYLPLLS
         Hp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705044499; x=1705649299;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rBwZl96Co75VhJWficqTDu8Aec8xN9HxL1XHRGFaHc=;
        b=EU1h8ECmMB6TOUdmqqBUnft6PNJrza3x5e1+5OBgi0bPdj6YJC1fSNo41rcefZksjS
         Tw/Ft5viK3iiEGHwRzjbGFZA9aFlivY4m8HPlm9ZWhYXRRaIWfToYXas8kMqQC3KLwoK
         yrazrzj+iYs4bG/rfZxfVP39oXulysl+zCMazefYPwFa3YUkKeDx9L1tMGIe57j2v269
         cAoZouufubvaGrLu0yLOOIKqHapNBWTUaFkYfhPDUijkGVQ7mFgmkNJCblBPQ/OMgp7n
         ZWnTwvbiTECS84yLKEVLB8ebHqh57HXYEx60huG9LC91BuB9Rc4QOBvWQ9mZ3UdvrnV2
         gu7A==
X-Gm-Message-State: AOJu0YyP6D+hC+thcddA1R9BkyRQZPZyLVxh40WWbo4JqKPgFa1SUPo3
	DzXY0DuMyWXy6kO0wkFPAfuh1ZS5GOiVZN1sSapGvRTH+brt3Q==
X-Google-Smtp-Source: AGHT+IGL1CzDBvsZfJVJ4W5fFR1pPlUzpNXIroixeonEsNQAFryJl9D1up0X070qpDKMJVpz8HYdsQ==
X-Received: by 2002:a05:6a20:3516:b0:190:36c3:afce with SMTP id d22-20020a056a20351600b0019036c3afcemr423172pze.113.1705044499249;
        Thu, 11 Jan 2024 23:28:19 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ee11-20020a17090afc4b00b0028db1713cbbsm5510701pjb.1.2024.01.11.23.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 23:28:18 -0800 (PST)
Message-ID: <65a0ea12.170a0220.b2957.4dbc@mx.google.com>
Date: Thu, 11 Jan 2024 23:28:18 -0800 (PST)
MIME-Version: 1.0
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: riscv-for-linus-6.7-rc5-102-g17a4608c5ada2
X-Kernelci-Report-Type: build
Subject: riscv/for-next build: 8 builds: 0 failed,
 8 passed (riscv-for-linus-6.7-rc5-102-g17a4608c5ada2)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_232822_623456_C517084A 
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
LWZvci1saW51cy02LjctcmM1LTEwMi1nMTdhNDYwOGM1YWRhMikKCkZ1bGwgQnVpbGQgU3VtbWFy
eTogaHR0cHM6Ly9rZXJuZWxjaS5vcmcvYnVpbGQvcmlzY3YvYnJhbmNoL2Zvci1uZXh0L2tlcm5l
bC9yaXNjdi1mb3ItbGludXMtNi43LXJjNS0xMDItZzE3YTQ2MDhjNWFkYTIvCgpUcmVlOiByaXNj
dgpCcmFuY2g6IGZvci1uZXh0CkdpdCBEZXNjcmliZTogcmlzY3YtZm9yLWxpbnVzLTYuNy1yYzUt
MTAyLWcxN2E0NjA4YzVhZGEyCkdpdCBDb21taXQ6IDE3YTQ2MDhjNWFkYTIxNmI3N2JmMDk0MDdl
MzcxMTlhZTJhYTgwOWEKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
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
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29uZmlnIChyaXNjdiwgY2xh
bmctMTYpIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNo
ZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29uZmlnIChyaXNjdiwg
Z2NjLTEwKSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRj
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
