Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF04E7716E
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 22:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sHmQ0wlweyw/lGjtao0rIu/wgMYHERe+aMECjMkKVR0=; b=M+q/DsUkCsBRq5
	8lseoUjUygIbIfudHiTHOmJxYHjpOk4LUSv9LldBUz7PLsNs6K6JuS/xslhwIorp/h8LIZGnHxYov
	LcavIJDgrB92yN9gdH2sfpMpL2qFufANHHrbN+APUuz3yzjeZUH0nrhpN+U9Yb/rUehMO/n9/fmGu
	JVxe6zJQ1eDuWYnMTHoetwye3preZL94UcqEIx7e/2rAaG4Dee6ZYILS7Yk1ngeJTtQGD4vC1h0rE
	oInc/D+M8Q2DXa3K3eyKxgpz2JqL0lSVWrHZQ5PVdUM7VSL8uAvTiM/knbEv0MolXuax50j5YtSj5
	lsLSMeKiHhLWxODecjpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJKcL-0000000HVV2-280u;
	Thu, 05 Dec 2024 22:46:41 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJKcI-0000000HVUD-3b5I
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 22:46:40 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-215666ea06aso21466915ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 14:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733438797; x=1734043597; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OfJMtQFbbnJLYJc+B7e+6XkPBjJDuJEYU2he5Ao9TfA=;
        b=L4vThtfb5UC6kMZPF1QMJ89Rr8UzkjXFs3PEcHIEvyknuGkjQk1yLIhWuQsviFew9r
         xql/3JV4sICpD/FSrff83yuioBGaYWnH6sI1PDWB16yNQq/iMEg02vTe5bIVgpxK/z9D
         8KLmHDGgwQozJQ3fkTOt+0AZAElEu3g1TPhwTQSLeQccs2KFyjXVBGBYJZZTSW1HlbvJ
         WxlTXiARJizxcDghxlxo8f0cu+BjvNSZ9PaE31vKLpTyFlm40j8GRKOrvMzh7quGT2OQ
         IOi989jNQGQv2hj5xE0ow29pGS5sSOM03LvttVDOpVgahcZ+Z0Ust6/qxiq+mqINmNku
         2ESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733438797; x=1734043597;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OfJMtQFbbnJLYJc+B7e+6XkPBjJDuJEYU2he5Ao9TfA=;
        b=GC4IyF83FXi9G4xZnVuqTBnfwzfkTsLXVbgsyXPaN/qO/b9+a1O0n5wF5EqqCyiLjD
         3ZTVRGEh5/ijtjXliqt+IAAeecnGmJs3LQnnymtdA2yUvTpSuKoXScZxUh9st6V2nhij
         9X1GqzuPW69ExKSbDI56FgsfDEZzAq3UrmSOoROBFnaOlTdq7hxqtS88nhlLomUBbCfu
         QSLbk/fYd5d6OoLsjfc4LsY7vQgQlTABsKvyMAMfNNsLtaR2e/3opKQF14aBFshrCUPh
         g7neI4NCno0z70QOLDaiuCTxlsPniapWWqN7tcX7hhhsNQzAuKfNgtxUOiXHnzS5wY24
         UCCw==
X-Forwarded-Encrypted: i=1; AJvYcCU3OAK64xoQRHqFUC0wRl8xTn1AOzg/S/RQYy1MymVZiDND2JjAMMMYX6QGk5BcmxRD4kEJlaLy6dmdkg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzuglbg9dCGk5Xeyyn5amI/VhnJLCKQ5dz23j94dXduEv+PnHaX
	QzLW+cYnRNDAPrbPJ4irWltXuM+eobfwPMt4JQeuIaP2wgu5fAq1MFYKjbVdnug=
X-Gm-Gg: ASbGnctTOOwhG4kn+8B3wbB2ieA/qedGOJp3XJANhA4A25Sj2fDc4KYMD2E2EEyr4fy
	Il9zTOGfV4f1ut/H1zYFziO+USC/d0Tsfcpcx6XJSipswBrgAO0K2OlN2ouz1x7aR3RhPZbisik
	XvPGa28XYoerYi5c/kj7noB9ZRoSjflpHxZc/TVjmUszHwW/AA7vNpYbhrWW46WBmopMTqi0gVa
	qRm2FALeCFNqu3epUtToR5n/DPr63jded/RdOykPjWILLAs4e0GNplTAlrYkHPeXA==
X-Google-Smtp-Source: AGHT+IGxKOF4tRLn53n+/IZITYCtDtQqL2cXFtOxICsp7MDrCCvJrXxUHWRF+tn5X2o0rn6cYCcUog==
X-Received: by 2002:a17:903:2bcc:b0:215:9c06:272a with SMTP id d9443c01a7336-215f3cfb96amr81493175ad.24.1733438797715;
        Thu, 05 Dec 2024 14:46:37 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725a2ca9115sm1753760b3a.166.2024.12.05.14.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 14:46:36 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 05 Dec 2024 14:46:19 -0800
Subject: [PATCH] MAINTAINERS: Remove Albert Ou from riscv
MIME-Version: 1.0
Message-Id: <20241205-remove_albert-v1-1-17eb850f1540@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIADotUmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIwNT3aLU3Pyy1PjEnKTUohLdJFODZEvTVENLYwMzJaCegqLUtMwKsHn
 RsbW1APvWqqFfAAAA
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=915; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=kSys1miFh76n/13JeF6prq2YaIdC+5aYiljRgT2zqnw=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3qQrnPYb265jRnv91QeMvN8Y80RI+vAuD5nw7mDfln2H
 s/+rdzdUcrCIMbBICumyMJzrYG59Y5+2VHRsgkwc1iZQIYwcHEKwEQ+RzEynJtXYXFmYvasdVmF
 r2tmPlu9Y1XWDJN2k/JrNke2XsrvecLwm+VGp9vRlkWPFlzyuqLiFMoktt3vQNP8+1ezX5SY1DO
 fYQMA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_144639_278813_50E801F2 
X-CRM114-Status: UNSURE (   7.67  )
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

Albert is not an active maintainer and his inbox rejects all emails.
Remove him from the maintainer's list to put an end to everybody who
interacts with the riscv linux mailing list from getting spammed with
rejection emails.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b1..8a5e12355850 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20104,7 +20104,6 @@ F:	include/linux/irqchip/riscv-imsic.h
 RISC-V ARCHITECTURE
 M:	Paul Walmsley <paul.walmsley@sifive.com>
 M:	Palmer Dabbelt <palmer@dabbelt.com>
-M:	Albert Ou <aou@eecs.berkeley.edu>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
 Q:	https://patchwork.kernel.org/project/linux-riscv/list/

---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241205-remove_albert-b50c95e19306
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
