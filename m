Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DD1C25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 15:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UllCcNrq7yJZp419ECjMSDArUz2MfVuVUovdiDgJWRY=; b=38BnW0/ScH5gC1
	L5kzYbinO85H1OJkejSmwaC5TAH+vzU3T1us/xVaVFNvgHdk0zPe5ES88c6MgLEm1qALi+nCc6wra
	ZAZHIOEplBLsjhViycd3qPQlUSfbQWNzja9r53a+xZidq/Eie2tvWAoUQ5cJgc4sFjpQKpEsnnYTl
	62rye9vtoHPb7gcNeVr5hA0Rhk/t6NtA8SvW6W3xsrubfYNrxv5EtKIutseYXFqN/vYHl//g0olNx
	RWR9/opyUDuQ8tQmFhG+pMXsqV+uZPqhDVk48lq7MSWjqI+0Fw9HOblfLURW89TudnjrnCJi8tOxD
	t80aFCUn2iyefTD2jLVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9nps-00000003MJH-3x0h;
	Wed, 22 May 2024 15:25:00 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9npp-00000003MIM-3AbU
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 15:24:59 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1edf506b216so108470085ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 May 2024 08:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1716391495; x=1716996295; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6BS+zvc/Mq6JRJHxr/gBshJfmA904KbaXb53i8XGq+U=;
        b=JFebLl5m/vVqEKLaRgqKJ8ekXnSntjx48qb55mYiAzel4yghs6dID5s8+iDsm6qAfr
         ccqx69Ns59hFRwMjKKEFDiin86owY0Y6K1JHiR3P/IhHK6+DnkZckxFX8VC+MzvSlT4J
         oul7HQzzpcgp/kxOr63nIzLwww3O0cQoiTCLUeLgE3Q4+ySWxL+XQMuvmc6v+umuqzjq
         sSqENlGhrUJo3GwHnXng4fnct8rMwXO1FO6V/kxn7hn8wi3MFR3d6/Oq2R2RAmFSWVFw
         w0FOVyXCkaCEpgcI9sHWbVV0EK3ZpgqiGXi0LKWryue9r2F53bfrZ8uPEpSHnmOg48rI
         D7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716391495; x=1716996295;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6BS+zvc/Mq6JRJHxr/gBshJfmA904KbaXb53i8XGq+U=;
        b=VK9S6w/Cf8VDcaT8WoZBCrZ+bY01NFCRctcTi3983CN3GqBDqLIXh0gsJ+1yDtejnf
         xSGHdmroicKswLsi2Pclr8jONlXaNAMqqYQY60UG6PBiXRXao+GIMeqewIqeRrXXOhpf
         NPlJqGzgZlLKi1laGsu3HxjwTboQZJFmb0FK/XNf8IwtrJhVV5aUeDHU5IKmod0fEzDf
         HHMI5Lh8KXmBd3TREWQLyg4/RiS1JyhpDSCqHjpjFlhrTHC2jPON6FCAhF2795ivuXNT
         E0RT+4SLtDbrtkna+LADsN+8yPfcrJU7KmAYL69L/xXyrbszjqK6X11x+jw4+3Uq0//Q
         0NxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBtvtes3CUW5SYRtzlYLyObI6EhpqAMCcZitgz8YJxOKLB6uLit7je0MJ4SXZi6APoM/GXBQQ98IlPH0CAtwJtTyhJKkWOnXRkpN6VQf0Y
X-Gm-Message-State: AOJu0YzLPe3nBo/uuOSrnaTYVXhgIG08Yhw6HxicbWnSQyNm/81M2pXT
	o5CzIwftaXxIdAqFjzpg3LaRgzdWqDUTUPY6MSFdQJBqiz6Oul/sIIqXhP4msXawRDD8nKt/esW
	+xy4=
X-Google-Smtp-Source: AGHT+IHUiPVo0xNZws0o7fQZIw/BZ4qd4nFe/26l9HKK6bgeDe8/eXaNQntIBFt8XUTkdgvK8Dl7Tg==
X-Received: by 2002:a17:902:e84c:b0:1f3:35e8:d301 with SMTP id d9443c01a7336-1f335e8d5d0mr2449535ad.4.1716391495075;
        Wed, 22 May 2024 08:24:55 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f32695c45fsm13244235ad.92.2024.05.22.08.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 08:24:54 -0700 (PDT)
Message-ID: <664e0e46.170a0220.376fd.30b1@mx.google.com>
Date: Wed, 22 May 2024 08:24:54 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: riscv-for-linus-6.10-mw1-6-g018b9d9874e72
X-Kernelci-Report-Type: build
Subject: riscv/for-next build: 8 builds: 0 failed,
 8 passed (riscv-for-linus-6.10-mw1-6-g018b9d9874e72)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_082457_954825_EDAB3C06 
X-CRM114-Status: UNSURE (   3.82  )
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
LWZvci1saW51cy02LjEwLW13MS02LWcwMThiOWQ5ODc0ZTcyKQoKVGhpcyBsZWdhY3kgS2VybmVs
Q0kgcHJvdmlkaW5nIHRoaXMgcmVwb3J0IHdpbGwgc2h1dGRvd24gc29tZXRpbWUKc29vbiBpbiBm
YXZvciBvZiBvdXIgbmV3IEtlcm5lbENJIGluZnJhLiBOb3QgYWxsIHRlc3RzIGFyZSBiZWluZwpt
aWdyYXRlZC4KSWYgeW91IGFyZSBzdGlsbCB1c2luZyB0aGlzIHJlcG9ydCBhbmQgd2FudCB1cyB0
byBwcmlvcml0aXplIHlvdXIKdXNlY2FzZSBpbiB0aGUgbmV3IHN5c3RlbSwgcGxlYXNlIGxldCB1
cyBrbm93IGF0Cmtlcm5lbGNpQGxpc3RzLmxpbnV4LmRldgoKRnVsbCBCdWlsZCBTdW1tYXJ5OiBo
dHRwczovL2tlcm5lbGNpLm9yZy9idWlsZC9yaXNjdi9icmFuY2gvZm9yLW5leHQva2VybmVsL3Jp
c2N2LWZvci1saW51cy02LjEwLW13MS02LWcwMThiOWQ5ODc0ZTcyLwoKVHJlZTogcmlzY3YKQnJh
bmNoOiBmb3ItbmV4dApHaXQgRGVzY3JpYmU6IHJpc2N2LWZvci1saW51cy02LjEwLW13MS02LWcw
MThiOWQ5ODc0ZTcyCkdpdCBDb21taXQ6IDAxOGI5ZDk4NzRlNzJjOGQ2YTQ4OGIyYjE4NTU4ZTY2
NDk2MjE1M2QKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvcmlzY3YvbGludXguZ2l0CkJ1aWx0OiAxIHVuaXF1ZSBhcmNoaXRlY3R1cmUKCj09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09CgpEZXRhaWxlZCBwZXItZGVmY29uZmlnIGJ1aWxkIHJlcG9y
dHM6CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKA
lCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCmRlZmNvbmZpZyAocmlzY3YsIGNsYW5nLTE2KSDigJQgUEFTUywg
MCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQpkZWZjb25maWcrQ09ORklHX1NNUD1uIChyaXNjdiwgZ2NjLTEwKSDigJQgUEFT
UywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQpkZWZjb25maWcrQ09ORklHX1NNUD1uIChyaXNjdiwgY2xhbmctMTYpIOKA
lCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29uZmlnIChyaXNjdiwgZ2NjLTEwKSDi
gJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQpub21tdV9rMjEwX2RlZmNvbmZpZyAocmlzY3YsIGNsYW5nLTE2
KSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpub21tdV9rMjEwX3NkY2FyZF9kZWZjb25maWcgKHJpc2N2
LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21h
dGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfc2RjYXJkX2RlZmNvbmZp
ZyAocmlzY3YsIGNsYW5nLTE2KSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2Vj
dGlvbiBtaXNtYXRjaGVzCgotLS0KRm9yIG1vcmUgaW5mbyB3cml0ZSB0byA8aW5mb0BrZXJuZWxj
aS5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
