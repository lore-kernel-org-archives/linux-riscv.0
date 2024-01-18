Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E60C47077
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 05:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j6idObm1LSwWn5oaOm78vmusiO+8vpPAwWJfLweEcoM=; b=AMhemcqLFJHh2k
	QD4FjmLSexZHzmr2azo6ncDUO+B8UmP3gJUqN01hjgsiBkHqJ+/s3Qv9QnHymAvBpJ5SEnSB6yO4X
	/UeyFe48nG7NtOVWlEWSKWF/kcrfNLQMLw2xz82jemrj4Ls3brlLES8shmrfbMk+N+zoVpAraFLrN
	hzqiAr/fpwqIa15RhJRKyMvxw6t74mwEFocz9zd6lWNTpqC09AaSZLfEHuyGjlvz55UOxi5tC+Nb3
	7FfOidqLam753Ldcqrs0GblQGyabsRq/P+mB8yESu0tgqKEhT2T9Ct2lEsS2SI2sYme3S1UQeXmeP
	cDE+ETqsO108s9od9LjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQKja-001g2K-0Q;
	Thu, 18 Jan 2024 05:14:34 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQKjW-001g0w-2V
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jan 2024 05:14:33 +0000
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5990de0ea91so1636903eaf.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jan 2024 21:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705554805; x=1706159605; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qazYWh/1bgwB8Jcs7vw1zTnnKSQkH7ScKa4eVb1pZMU=;
        b=yMkkIFsFCOoJHE8+BRz9DpgKovlzUwlmJMuIASeugYvJXut8NqtVXUgkulVqZuGvNr
         VnwzqKbSNqXVrSNe8WSdN5HU/HQtrvj7N7GEW2iXMHtAy3LAymUnU9Oe3/FzSwZz2zbS
         bC4m7/AazPDUSlKMih0zbfVkcvsqNlXowylA1/ZvLHqpXVAAC3xj9geLdJYWZQ1Qkuo2
         gpIuXe6afDFNLkM4NlLFZlIPCb5LJw3KlnsRMx9/t2Yu+knMOdIhB+IKPTTI4+2ImqgM
         zGorHkO+w/vdf3ZT2xaIG/wBJJ9y4Rtln5y2O3+eppym/aabNpoEZyIvXhyIsGZryQjd
         4Cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705554805; x=1706159605;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qazYWh/1bgwB8Jcs7vw1zTnnKSQkH7ScKa4eVb1pZMU=;
        b=FNsKjbss5VsZpCNUv0fXxr5bfCT2nmUYhkPf4edN4NPr06l8mwAdcSRrLfmJw7wHsP
         XifI5Yoc52WO6SUVIImPt/y+dADOJAoAk5HSOYUBz2W24i5dW5mfXv+VZkSlhthueYQB
         H9/hyy+fCXSZxSSb5XNdXN+ywj2xa3ja6Ogp5rUzLJVG3GlWTDgKMhNK+l1QJ532mcpj
         e6/CxwbpdKM6M5v1cAkiay+Qxq9AMy9i46fuPkOomJUAF6nIi2vWaKRK+tcxO0eqj05T
         IYWlRmChicD8GhmrgHyJT09Z7e+8+aOdG/09yG93u31XQglYssHjcLfOodn/KhOOK0Kk
         A+ZQ==
X-Gm-Message-State: AOJu0Yxdvib3kKUrp0iWWm+iik4Mc6pKNhcswRTccIPJ+Ho4aZJEUW6f
	8saijAzgEYoXikpbyB6fm11wYSY0BlBYHDxF2PdBiqelzrTIS9iYoXIKX4YT1/U=
X-Google-Smtp-Source: AGHT+IH5EGpbFdhUP2O3SZRRyJRtQANB4yyAZ82a/QBkhxXGvxgIi//ctD356U/U23yZummLXzobkA==
X-Received: by 2002:a05:6359:2881:b0:172:cb8d:71de with SMTP id qa1-20020a056359288100b00172cb8d71demr335213rwb.62.1705554805366;
        Wed, 17 Jan 2024 21:13:25 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id f1-20020a63dc41000000b005c6617b52e6sm612622pgj.5.2024.01.17.21.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 21:13:24 -0800 (PST)
Message-ID: <65a8b374.630a0220.de098.3057@mx.google.com>
Date: Wed, 17 Jan 2024 21:13:24 -0800 (PST)
MIME-Version: 1.0
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: riscv-for-linus-6.8-mw1-43-ga894e8ed09c6c
X-Kernelci-Report-Type: build
Subject: riscv/for-next build: 8 builds: 0 failed,
 8 passed (riscv-for-linus-6.8-mw1-43-ga894e8ed09c6c)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_211431_825743_3CF63C5D 
X-CRM114-Status: UNSURE (   2.13  )
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
LWZvci1saW51cy02LjgtbXcxLTQzLWdhODk0ZThlZDA5YzZjKQoKRnVsbCBCdWlsZCBTdW1tYXJ5
OiBodHRwczovL2tlcm5lbGNpLm9yZy9idWlsZC9yaXNjdi9icmFuY2gvZm9yLW5leHQva2VybmVs
L3Jpc2N2LWZvci1saW51cy02LjgtbXcxLTQzLWdhODk0ZThlZDA5YzZjLwoKVHJlZTogcmlzY3YK
QnJhbmNoOiBmb3ItbmV4dApHaXQgRGVzY3JpYmU6IHJpc2N2LWZvci1saW51cy02LjgtbXcxLTQz
LWdhODk0ZThlZDA5YzZjCkdpdCBDb21taXQ6IGE4OTRlOGVkMDljNmM3ZmEyMzk3MTE4MTlkYjgz
YjhjMDUwZWI3YjAKR2l0IFVSTDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0CkJ1aWx0OiAxIHVuaXF1ZSBhcmNoaXRlY3R1cmUK
Cj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09CgpEZXRhaWxlZCBwZXItZGVmY29uZmlnIGJ1aWxkIHJl
cG9ydHM6CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpkZWZjb25maWcgKHJpc2N2LCBjbGFuZy0x
Nikg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZGVmY29uZmlnIChyaXNjdiwgZ2NjLTEwKSDigJQgUEFT
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
