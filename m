Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876B9C47DB3
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 16:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IQ4IGI055xjhL3QEtPPXAToEF5bzNIJ94gaQKSAHnz0=; b=Gz8NGIXjeN9y9u
	XD/ygFSYp10efiPtHBc8UqOCjpE5tx3VOumh+ms7a1ynylGhOM16+AHPVESLTtp2ACMAtJk0Sml1n
	NyW73NkF4RTsRxNC3B4PbCIVuQH6UEmchsSzvGJta0JuzMRAj1QcG/c+0JXLJyFpdvZWkJHH46xh8
	wYacvmLTbFkOx63xzbZL5mEn/dC9L5/9PIQFX9VTka1ouTuN/Pqip5vnVEohwut0djOatNK5rlcrs
	x0o/NwRA4IemHD4OlD1+2XCBabMJXejCZw58Pvig/cASCl2FdZ2klXhHx0Vabzgz+GC1OMO5ZSrBF
	kOsSajydTL5q66P2lE+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQV6W-003EIf-1z;
	Thu, 18 Jan 2024 16:18:56 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQV6U-003EHK-0Z
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jan 2024 16:18:56 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1d6f020e4f5so13294465ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jan 2024 08:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1705594730; x=1706199530; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUdziJ4CF+g/axp3K/3uL12zeJe8MxGGfGJ8SlFEIPY=;
        b=sy7wbamFNwzGnn+ETP2f8+wg09TqAOgShkXLCp9OSygoeLSO73K+LguQPFon5v9QOi
         QNbnZWDph3lKELnGQsNAkAWdCZwJuqC0TZInmZiiu3B449uiBXXOzNSJLUhMu90N7iXU
         oMEZ+yFTmBjwkYT6nr3nm96lZh6+RwKvKlsZbgYA0X6/+7wu78e8QqjWpGLbB9Bw2WzG
         5/p6Ut6/DxriEyrDeWkr06LOI/72oc0E9WFCGV/KgZ/raPJ8zcloelajF5OSYRoWWoL/
         E6Z4fqb2KQ6Z0YIi8xkGB9xGhXI+Et5GghbSEM/X6XneteT8/gFhniu8puxKmHrDrNxi
         G6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705594730; x=1706199530;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUdziJ4CF+g/axp3K/3uL12zeJe8MxGGfGJ8SlFEIPY=;
        b=q8tawoYL+4nvHYuP5sL9dchifveZD3GUHBIvbAiba9zFmk9YriWdPtQlyOZdZGUAW6
         hAzuA9lEWDPtecJ4zcqbnQntYQy8ziuR3ue9YQkJrtRO13Yt+5Ei0boT5FjXn61HdqPa
         uxJodnDBGps/y2D4WmX/hICzgGcB/I1WhkHdAlIgkfoI1XXgX/Wq3IeeakWR0Ygpsh+s
         g7fnDKg2H5VkTdhRZvMQF/UwTcoY379vrswqmpQvw81jYzVn5FXHyff/Kn/WslTzGPrz
         3mxvY+X+7xovM1Dk7W9foL2eoLzOLUnkZ9rKVO1rxLIvvThk4ekCrxbfSkV8Ir7EbtO4
         AyRA==
X-Gm-Message-State: AOJu0YxuFS7S9MRmIXxsWWLS+sVVFOxdaWuZ+4kpyD8V2GuDDJKStrVu
	QD1A/j7uRDDsrqt/1ljXnebP3Qx09sE0RGoXvOrDgFaXkMLQRHzUeOqKYbvzIYw=
X-Google-Smtp-Source: AGHT+IGR1YTco3sCzMrw4EhDl+FM7tYSCwoMEGFKcgTFtYcKXpU/BnrVMEiUkH+wyEGjGpbrydo7Sg==
X-Received: by 2002:a17:903:1111:b0:1d7:1315:ad2c with SMTP id n17-20020a170903111100b001d71315ad2cmr590743plh.132.1705594730264;
        Thu, 18 Jan 2024 08:18:50 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ki4-20020a170903068400b001d5ea27932csm1569997plb.77.2024.01.18.08.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 08:18:49 -0800 (PST)
Message-ID: <65a94f69.170a0220.d30f4.684d@mx.google.com>
Date: Thu, 18 Jan 2024 08:18:49 -0800 (PST)
MIME-Version: 1.0
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: riscv-for-linus-6.8-mw1-63-g080c4324fa5e8
X-Kernelci-Report-Type: build
Subject: riscv/for-next build: 9 builds: 5 failed, 4 passed, 5 errors,
 10 warnings (riscv-for-linus-6.8-mw1-63-g080c4324fa5e8)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_081854_396068_6BCB0726 
X-CRM114-Status: UNSURE (   1.96  )
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

cmlzY3YvZm9yLW5leHQgYnVpbGQ6IDkgYnVpbGRzOiA1IGZhaWxlZCwgNCBwYXNzZWQsIDUgZXJy
b3JzLCAxMCB3YXJuaW5ncyAocmlzY3YtZm9yLWxpbnVzLTYuOC1tdzEtNjMtZzA4MGM0MzI0ZmE1
ZTgpCgpGdWxsIEJ1aWxkIFN1bW1hcnk6IGh0dHBzOi8va2VybmVsY2kub3JnL2J1aWxkL3Jpc2N2
L2JyYW5jaC9mb3ItbmV4dC9rZXJuZWwvcmlzY3YtZm9yLWxpbnVzLTYuOC1tdzEtNjMtZzA4MGM0
MzI0ZmE1ZTgvCgpUcmVlOiByaXNjdgpCcmFuY2g6IGZvci1uZXh0CkdpdCBEZXNjcmliZTogcmlz
Y3YtZm9yLWxpbnVzLTYuOC1tdzEtNjMtZzA4MGM0MzI0ZmE1ZTgKR2l0IENvbW1pdDogMDgwYzQz
MjRmYTVlODFmZjM3ODAyMDZhMTM4MjIzYWJmYjU3YTY4ZQpHaXQgVVJMOiBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9yaXNjdi9saW51eC5naXQKQnVpbHQ6
IDEgdW5pcXVlIGFyY2hpdGVjdHVyZQoKQnVpbGQgRmFpbHVyZXMgRGV0ZWN0ZWQ6CgpyaXNjdjoK
ICAgIGRlZmNvbmZpZzogKGdjYy0xMCkgRkFJTAogICAgZGVmY29uZmlnK0NPTkZJR19TTVA9bjog
KGdjYy0xMCkgRkFJTAogICAgbm9tbXVfazIxMF9kZWZjb25maWc6IChnY2MtMTApIEZBSUwKICAg
IG5vbW11X2syMTBfc2RjYXJkX2RlZmNvbmZpZzogKGdjYy0xMCkgRkFJTAogICAgbm9tbXVfdmly
dF9kZWZjb25maWc6IChnY2MtMTApIEZBSUwKCkVycm9ycyBhbmQgV2FybmluZ3MgRGV0ZWN0ZWQ6
CgpyaXNjdjoKICAgIGRlZmNvbmZpZyAoZ2NjLTEwKTogMSBlcnJvciwgMiB3YXJuaW5ncwogICAg
ZGVmY29uZmlnK0NPTkZJR19TTVA9biAoZ2NjLTEwKTogMSBlcnJvciwgMiB3YXJuaW5ncwogICAg
bm9tbXVfazIxMF9kZWZjb25maWcgKGdjYy0xMCk6IDEgZXJyb3IsIDIgd2FybmluZ3MKICAgIG5v
bW11X2syMTBfc2RjYXJkX2RlZmNvbmZpZyAoZ2NjLTEwKTogMSBlcnJvciwgMiB3YXJuaW5ncwog
ICAgbm9tbXVfdmlydF9kZWZjb25maWcgKGdjYy0xMCk6IDEgZXJyb3IsIDIgd2FybmluZ3MKCkVy
cm9ycyBzdW1tYXJ5OgoKICAgIDUgICAgYXJjaC9yaXNjdi9saWIvY3N1bS5jOjIwNjo2OiBlcnJv
cjogZXhwZWN0ZWQg4oCYOuKAmSBiZWZvcmUg4oCYW+KAmSB0b2tlbgoKV2FybmluZ3Mgc3VtbWFy
eToKCiAgICA1ICAgIGFyY2gvcmlzY3YvbGliL2NzdW0uYzoyMTM6MTogd2FybmluZzogbGFiZWwg
4oCYZW5k4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1sYWJlbF0KICAgIDUgICAg
YXJjaC9yaXNjdi9saWIvY3N1bS5jOjE2NToxNzogd2FybmluZzogdW51c2VkIHZhcmlhYmxlIOKA
mGZvbGRfdGVtcOKAmSBbLVd1bnVzZWQtdmFyaWFibGVdCgo9PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQoKRGV0YWlsZWQgcGVyLWRlZmNvbmZpZyBidWlsZCByZXBvcnRzOgoKLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KZGVmY29uZmlnIChyaXNjdiwgZ2NjLTEwKSDigJQgRkFJTCwgMSBlcnJvciwgMiB3
YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCkVycm9yczoKICAgIGFyY2gvcmlzY3YvbGli
L2NzdW0uYzoyMDY6NjogZXJyb3I6IGV4cGVjdGVkIOKAmDrigJkgYmVmb3JlIOKAmFvigJkgdG9r
ZW4KCldhcm5pbmdzOgogICAgYXJjaC9yaXNjdi9saWIvY3N1bS5jOjE2NToxNzogd2FybmluZzog
dW51c2VkIHZhcmlhYmxlIOKAmGZvbGRfdGVtcOKAmSBbLVd1bnVzZWQtdmFyaWFibGVdCiAgICBh
cmNoL3Jpc2N2L2xpYi9jc3VtLmM6MjEzOjE6IHdhcm5pbmc6IGxhYmVsIOKAmGVuZOKAmSBkZWZp
bmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtbGFiZWxdCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQpkZWZjb25maWcgKHJpc2N2LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5p
bmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZGVmY29u
ZmlnK0NPTkZJR19TTVA9biAocmlzY3YsIGdjYy0xMCkg4oCUIEZBSUwsIDEgZXJyb3IsIDIgd2Fy
bmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgpFcnJvcnM6CiAgICBhcmNoL3Jpc2N2L2xpYi9j
c3VtLmM6MjA2OjY6IGVycm9yOiBleHBlY3RlZCDigJg64oCZIGJlZm9yZSDigJhb4oCZIHRva2Vu
CgpXYXJuaW5nczoKICAgIGFyY2gvcmlzY3YvbGliL2NzdW0uYzoxNjU6MTc6IHdhcm5pbmc6IHVu
dXNlZCB2YXJpYWJsZSDigJhmb2xkX3RlbXDigJkgWy1XdW51c2VkLXZhcmlhYmxlXQogICAgYXJj
aC9yaXNjdi9saWIvY3N1bS5jOjIxMzoxOiB3YXJuaW5nOiBsYWJlbCDigJhlbmTigJkgZGVmaW5l
ZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWxhYmVsXQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
ZGVmY29uZmlnK0NPTkZJR19TTVA9biAocmlzY3YsIGNsYW5nLTE2KSDigJQgUEFTUywgMCBlcnJv
cnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpub21tdV9rMjEwX2RlZmNvbmZpZyAocmlzY3YsIGdjYy0xMCkg4oCUIEZBSUwsIDEgZXJy
b3IsIDIgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgpFcnJvcnM6CiAgICBhcmNoL3Jp
c2N2L2xpYi9jc3VtLmM6MjA2OjY6IGVycm9yOiBleHBlY3RlZCDigJg64oCZIGJlZm9yZSDigJhb
4oCZIHRva2VuCgpXYXJuaW5nczoKICAgIGFyY2gvcmlzY3YvbGliL2NzdW0uYzoxNjU6MTc6IHdh
cm5pbmc6IHVudXNlZCB2YXJpYWJsZSDigJhmb2xkX3RlbXDigJkgWy1XdW51c2VkLXZhcmlhYmxl
XQogICAgYXJjaC9yaXNjdi9saWIvY3N1bS5jOjIxMzoxOiB3YXJuaW5nOiBsYWJlbCDigJhlbmTi
gJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWxhYmVsXQoKLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0Kbm9tbXVfazIxMF9kZWZjb25maWcgKHJpc2N2LCBjbGFuZy0xNikg4oCUIFBBU1Ms
IDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0Kbm9tbXVfazIxMF9zZGNhcmRfZGVmY29uZmlnIChyaXNjdiwgZ2NjLTEwKSDi
gJQgRkFJTCwgMSBlcnJvciwgMiB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCkVycm9y
czoKICAgIGFyY2gvcmlzY3YvbGliL2NzdW0uYzoyMDY6NjogZXJyb3I6IGV4cGVjdGVkIOKAmDri
gJkgYmVmb3JlIOKAmFvigJkgdG9rZW4KCldhcm5pbmdzOgogICAgYXJjaC9yaXNjdi9saWIvY3N1
bS5jOjE2NToxNzogd2FybmluZzogdW51c2VkIHZhcmlhYmxlIOKAmGZvbGRfdGVtcOKAmSBbLVd1
bnVzZWQtdmFyaWFibGVdCiAgICBhcmNoL3Jpc2N2L2xpYi9jc3VtLmM6MjEzOjE6IHdhcm5pbmc6
IGxhYmVsIOKAmGVuZOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtbGFiZWxdCgot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpub21tdV9rMjEwX3NkY2FyZF9kZWZjb25maWcgKHJpc2N2
LCBjbGFuZy0xNikg4oCUIFBBU1MsIDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlz
bWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kbm9tbXVfdmlydF9kZWZjb25maWcgKHJp
c2N2LCBnY2MtMTApIOKAlCBGQUlMLCAxIGVycm9yLCAyIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlz
bWF0Y2hlcwoKRXJyb3JzOgogICAgYXJjaC9yaXNjdi9saWIvY3N1bS5jOjIwNjo2OiBlcnJvcjog
ZXhwZWN0ZWQg4oCYOuKAmSBiZWZvcmUg4oCYW+KAmSB0b2tlbgoKV2FybmluZ3M6CiAgICBhcmNo
L3Jpc2N2L2xpYi9jc3VtLmM6MTY1OjE3OiB3YXJuaW5nOiB1bnVzZWQgdmFyaWFibGUg4oCYZm9s
ZF90ZW1w4oCZIFstV3VudXNlZC12YXJpYWJsZV0KICAgIGFyY2gvcmlzY3YvbGliL2NzdW0uYzoy
MTM6MTogd2FybmluZzogbGFiZWwg4oCYZW5k4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3Vu
dXNlZC1sYWJlbF0KCi0tLQpGb3IgbW9yZSBpbmZvIHdyaXRlIHRvIDxpbmZvQGtlcm5lbGNpLm9y
Zz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
