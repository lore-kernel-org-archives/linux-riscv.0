Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60829C47077
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 00:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qq7t0ep0M/egak2KZY+6eHlmecgPJF/NtUA+8WtKsmU=; b=QUaLUhZ5sTUZQI
	qvepaKBLEJYD7Qi11DAVIWwanDPzcVBwNS2Rw7IY6DnhyNZawmFlbZxXt1hVEpYPaZ4rPtF70Trwl
	UnZ22VplSjhYexT9xj4ttWpekfTncRo/sj3MGCtmGgGL/6pszYqYH8ahdsSMMkr59Ilr2i2KYS7OX
	FqyLStkwXtpsHSlqr3OBRnk9hbjsjnlPHD5E5mPz4ATOnYqOFrz/ypHOzXATKZ0ky6qxsrXrpXfTa
	l7gkUSsUaVxwOj/Vn2W3fp0v0RmwB4IVgEeP6f+RvRJbgA/s83oYJjmZ+S1YXTiQ+6v+c1gOuqDra
	v7tr1H72XMukE6u7fb1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNMuT-00A0R7-2Z;
	Wed, 10 Jan 2024 00:57:33 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNMuQ-00A0QV-2y
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 00:57:32 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-28be024282bso2440265a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jan 2024 16:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1704848248; x=1705453048; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vXm2n74fm8lU0hlZGiL5OKrc8gd5O8Lvjsdxji+ZfWk=;
        b=qB6yjbjw+gIY+lLjLYLsJzkoYZgQDy6YpxQDsNQD47gulaCDTd3DUgvlVcWzXJPY0F
         Pu1H21nFAyn233SK0UIiKTpGMs8FI01C4w4pHeXulWI8Sj0OR7yNjffm632i3Ez6IysA
         ug5MzFe8CBEKrhtH6Qc3JUpSxrhAHRuNqi0L4zAkDvdY3rAtcbuxs3XkWri0V+1rxKn6
         yhEJVvEYCaB6006cWWJTK0C/tQt+XiZLpeIMm6h9yfrLK1JToO1QIApCyUWGvFiyDC+T
         oRpEoUehx/3HIUAoRoAF9uGNpg9RYQhyjtnUpneiy24MzBGlbn4qgo9zRfKl1ntrfBZP
         2wLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704848248; x=1705453048;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vXm2n74fm8lU0hlZGiL5OKrc8gd5O8Lvjsdxji+ZfWk=;
        b=FfA4HtCyZWuODlta8CzIA9cxpRjKSyhtNRd8G0RpmZCIDkDWxGeEvMDb9Erj33KPy9
         eAD3y4+AKtBYaF06PxISt5ur4CoIwsF6HBvda4QHS5FEFIs7DL7e/hAJkWj28kRm29so
         cOMgRBFFFZOiEtYr3XEdXBie2ujCWBDpHQdlN6sTE+IniuF/IqWUgAxkEo2Wl1ewYCf9
         z4r+DgJGl8k/QYnMJaslvKFbMlpP7hGtqGJHfB//C1N4EcDGmtrGuOJYFhQ95axUHbQY
         Hmjmr0qO0SlCU5DZNCbw0E2GQnudwIO2kSKiqyKriy9Epjr0I+4UCZAQ2HlMhDnKzXwe
         Z0UA==
X-Gm-Message-State: AOJu0YwrtRNaauuutP2ZVOxWnpko8TfHVDWixIqxV4JiuslUjzAhUYit
	FpwWLy3Ipp5DlwqVUiiG45BE+l4uEpT0kA==
X-Google-Smtp-Source: AGHT+IFfPXeYWNALIXpvBL3kDZUKId6rWZOmrv1V45Ai8RSFq82mrpdI4rDtTK3uyARNViCGH5q8aw==
X-Received: by 2002:a17:90a:d504:b0:28b:dc0d:8b84 with SMTP id t4-20020a17090ad50400b0028bdc0d8b84mr105612pju.50.1704848248219;
        Tue, 09 Jan 2024 16:57:28 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id su7-20020a17090b534700b0028da44b2c33sm121420pjb.27.2024.01.09.16.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 16:57:27 -0800 (PST)
Message-ID: <659deb77.170a0220.32620.0e3e@mx.google.com>
Date: Tue, 09 Jan 2024 16:57:27 -0800 (PST)
MIME-Version: 1.0
X-Kernelci-Branch: fixes
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: riscv-for-linus-6.7-rc5-4-gb8b2711336f03
X-Kernelci-Report-Type: build
Subject: riscv/fixes build: 10 builds: 0 failed,
 10 passed (riscv-for-linus-6.7-rc5-4-gb8b2711336f03)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_165731_377115_4DC67B46 
X-CRM114-Status: UNSURE (   2.19  )
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

cmlzY3YvZml4ZXMgYnVpbGQ6IDEwIGJ1aWxkczogMCBmYWlsZWQsIDEwIHBhc3NlZCAocmlzY3Yt
Zm9yLWxpbnVzLTYuNy1yYzUtNC1nYjhiMjcxMTMzNmYwMykKCkZ1bGwgQnVpbGQgU3VtbWFyeTog
aHR0cHM6Ly9rZXJuZWxjaS5vcmcvYnVpbGQvcmlzY3YvYnJhbmNoL2ZpeGVzL2tlcm5lbC9yaXNj
di1mb3ItbGludXMtNi43LXJjNS00LWdiOGIyNzExMzM2ZjAzLwoKVHJlZTogcmlzY3YKQnJhbmNo
OiBmaXhlcwpHaXQgRGVzY3JpYmU6IHJpc2N2LWZvci1saW51cy02LjctcmM1LTQtZ2I4YjI3MTEz
MzZmMDMKR2l0IENvbW1pdDogYjhiMjcxMTMzNmYwM2VjZTUzOWRlNjE0NzlkNmZmYzQ0ZmI2MDNk
MwpHaXQgVVJMOiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9yaXNjdi9saW51eC5naXQKQnVpbHQ6IDEgdW5pcXVlIGFyY2hpdGVjdHVyZQoKPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT0KCkRldGFpbGVkIHBlci1kZWZjb25maWcgYnVpbGQgcmVwb3J0czoKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCmRlZmNvbmZpZyAocmlzY3YsIGdjYy0xMCkg4oCUIFBBU1Ms
IDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KZGVmY29uZmlnIChyaXNjdiwgY2xhbmctMTYpIOKAlCBQQVNTLCAwIGVycm9y
cywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCmRlZmNvbmZpZytDT05GSUdfU01QPW4gKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNTLCAwIGVy
cm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCmRlZmNvbmZpZytDT05GSUdfU01QPW4gKHJpc2N2LCBjbGFuZy0xNikg4oCUIFBBU1Ms
IDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0Kbm9tbXVfazIxMF9kZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKAlCBQQVNT
LCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29uZmlnIChyaXNjdiwgY2xhbmctMTYpIOKAlCBQ
QVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfc2RjYXJkX2RlZmNvbmZpZyAocmlzY3YsIGdjYy0x
MCkg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kbm9tbXVfazIxMF9zZGNhcmRfZGVmY29uZmlnIChyaXNj
diwgY2xhbmctMTYpIOKAlCBQQVNTLCAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1p
c21hdGNoZXMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCnJ2MzJfZGVmY29uZmlnIChyaXNjdiwg
Z2NjLTEwKSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRj
aGVzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpydjMyX2RlZmNvbmZpZyAocmlzY3YsIGNsYW5n
LTE2KSDigJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVz
CgotLS0KRm9yIG1vcmUgaW5mbyB3cml0ZSB0byA8aW5mb0BrZXJuZWxjaS5vcmc+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
