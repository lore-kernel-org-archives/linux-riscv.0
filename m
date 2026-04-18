Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5EFF99C73
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Apr 2026 04:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8egGvkVgEoWv5fhfUPXd7qQDyEa6fJJhbE0AQ+S3S/E=; b=CMDbtPhJVhh/ni
	hgKMqZ5GkpSmH0dE2bkAexYTCNQwrMMYk5rrZV2e80Hf8vAhsYSKbuwaZoa8HRnXKyvruzJPmtMGZ
	Ta04sCz9ZBMnDZf4FbmMxwEIW+p9NrhCETn6EqSmns+7KkYN8v6zi+BXFqb/mYL86m70xgC5jxxYe
	zVllZ12ueWTZp4Nlf2cH0vOXURNlnlXmVDQ+b8pxnyPcIOQ0hTAGOf7aDi0ya8OhtcEbpzsprQ5QT
	MYMqooE6Dc4InypHUNUQC5WEMnUoTn8nia/aEJekI2JPpDFwc4PrkEZ3hrpg2CWUry60E+Q69K+f3
	Sca3T2/4bPw6InKK6Iew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDxKx-00000004jTK-0q0m;
	Sat, 18 Apr 2026 04:31:19 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDxKv-00000004jT1-01nc
	for linux-riscv@lists.infradead.org;
	Sat, 18 Apr 2026 04:31:18 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-8d76492e51bso140386985a.0
        for <linux-riscv@lists.infradead.org>; Fri, 17 Apr 2026 21:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776486675; x=1777091475; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cBCDY9Aa7rojk9MystYTyZX9f4FxFWPHtSMPA1AK7sM=;
        b=WxS0ORHrDY8jUt+W6jDkJJT9a4U+wFyhGxf2nVKCyKlKEGcLJ+q0CLOHIkSRGtO7yZ
         aaXWTa4MU0bzdrKkVx225n78gMHJXc3W+DSHOQnkUQC/ynNcsfFKeyNPiAsqRnHhGrU/
         C4607Y25uhz0NqzxwVgDbEcX7CfEreqH7twhlafSF8T3WPi7HfPnpa751lE7N/HKQDVa
         S9LpWKsizLRTa1EXPMbCIISLoWYkUxDig9s3UknxSchxNRc9Ov7VXqNdFeboJukua7Iu
         vA5alOk6J99Yz1QOcNSk5pI/9+kYcVDFpXsinQFn93ccV3UiG2GlP/FGUGzNMNM/hff2
         VL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776486675; x=1777091475;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBCDY9Aa7rojk9MystYTyZX9f4FxFWPHtSMPA1AK7sM=;
        b=mJouoo4FtZ2mmHOxNTJgqG869aP6fpG5l8NR4MyGNXjRUbgUj4nBFEWFf1A0BtQka1
         UAvdfDEcSPDLQRwrX05Eh2PeSTQBFNSfpwgrsMeQhdJijCrfUfG1TDgKKgO/otNj9+Ku
         fmwX+A+fmkw4AcFO7YwbexQej4G9dHRSnShw3pHJ2uu+Q2VQ9vti9MED5ST95K0T5PJj
         VD78MrHSdIJl+At4D692K8akFEXQ4aF7I6VlbcyBfkTFliBsdgqnR3ympZ9Y0OQxEZOY
         nrVflo8cbTFw2DtHLhN1H/tz6DR0PHYjlHtgPU2OkWODui3Jc6rfb4JnClUfQaYrVvES
         DpXw==
X-Gm-Message-State: AOJu0YzhgEYeZe27e48gxCJjq2DWjUogodLBLAq1O0Z0Cl8I303acxNF
	qhZgsQzeIOPQxo74EqkdFJpI9uyql8UY0Llmtp85tyqPpx4KyPVXuwr+
X-Gm-Gg: AeBDieuIXxqaCvIgfZIcbWsdN9YYmblUISEghuTgxwYRbzyzEKTqbgnqgksL9436gGi
	JvpPxFSGx3/LXKibQVF3zDDjmi/DS0LVr6BebNdpMOM6+iH+bNMrI060anunS1nZkRt+jMa0YkM
	TYgsU5Cv0y7dgTMoUUCKutxSTBprOuQ+C7N8HYnuVGWYLM2PM69HQhmO3pxKDk9//FRVj787lFH
	H7gn4Gzv7CC5G6U73hCAYlnybEIOaQP9RqimyKvkHuQ8J0r1xhpQdK38rAF4o3vPFXCaFu3d3TM
	EwJ3XhSSxBo/16QqnGBvXMHkLJJ5PmdaNX2Qf+EfMDW8BRpVz40ADkYR7oZdo+0BXoxi9np8u+n
	diQn/F/y3b04HUw7JfpYVJEpiSwMWkRXkbmjQ/5hxykSYhfgs9TrcywW3u7DvUvviSHTdoVrDws
	O90koFdxTHIx9FqTYlHsOtfaQt5WAhQwaYbsytlTG3sWfLGk6wOaxZmg==
X-Received: by 2002:a05:620a:2242:10b0:8cf:d441:c7c0 with SMTP id af79cd13be357-8e791b9425cmr557984985a.34.1776486675370;
        Fri, 17 Apr 2026 21:31:15 -0700 (PDT)
Received: from inky.localdomain ([2607:fb91:4c8b:380b:9598:7e6e:c0df:107b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac6c3e7sm26755216d6.13.2026.04.17.21.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 21:31:14 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Sat, 18 Apr 2026 00:31:08 -0400
Subject: [PATCH] riscv: cfi: gitignore generated vdso files
MIME-Version: 1.0
Message-Id: <20260418-vdso_cfi_ignore-v1-1-f4b89f5b0d3b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAsJ42kC/x3MQQqAIBBA0avIrBNUJKqrRIjaWLPRUJBAvHvS8
 i3+b1AwExbYWIOMlQqlOCAnBv628UJO5zAooWah5cLrWZLxgQxdMWXkTsxaBqvU6hYY1ZMx0Ps
 f96P3D2tfYnRhAAAA
X-Change-ID: 20260418-vdso_cfi_ignore-b0641fa229b8
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776486673; l=717;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=cBCDY9Aa7rojk9MystYTyZX9f4FxFWPHtSMPA1AK7sM=;
 b=XKT1Y3ZPOfVVeoAK2RmJOSLdgDpovPA7lS8yf1xiJM2xkWG1rR1xC0daBubAx35pbyjhmEO4q
 aVCYrrBQ3jsBEMtdMHUrPZb75wH/tCcvYyRWWVz/Ci/HVgyTRErsOts
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_213117_050320_8C9A2E39 
X-CRM114-Status: UNSURE (   8.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

During compilation, the standard VDSO files are copied into
arch/riscv/kernel/vdso_cfi. Add a .gitignore to prevent these files from
being tracked by git.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 arch/riscv/kernel/vdso_cfi/.gitignore | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/vdso_cfi/.gitignore b/arch/riscv/kernel/vdso_cfi/.gitignore
new file mode 100644
index 000000000000..8bc6f31c8ee6
--- /dev/null
+++ b/arch/riscv/kernel/vdso_cfi/.gitignore
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-only
+*.S
+*.c
+vdso.lds
+!vdso-cfi.S

---
base-commit: 08ee1559052be302f1d3752f48360b89517d9f8d
change-id: ${change-id}

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
