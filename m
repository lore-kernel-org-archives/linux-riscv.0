Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA45C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Mar 2022 16:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gzVZeOSg8OwnWez9QAqSTew/wMsGxpfzygSY0D7HTQU=; b=dd5nmp60np6p0b
	h+6aP3r1ZVPrezVoVpv94NdDo/KoULmL/cnJRnjQKbxUPYdo/BadHeqWEevqeJg1blhn3pV6XkAlS
	d+jYkNlvZHpLXaYqQq8HpQAoq43GF8uAc2hc0wBuw2VDHwb1CR9pRZ3asJWL87wm6JmUNe/D4rLqD
	L28vsoXdyYL1NHCO/NVEWzS14Nv7QqOdwZiKzNdpyfaVDd/0gFdqydlAPmgWy7oC3gPwCh3vUmb6F
	n7qhPEaqwQY8Yt1YETHQ7TDC+VnVw/wTyoTwtqPDfO3sxqg79bZKFXI+BmgnRKxK/ZF92M0equouF
	QnVKSaMHsLagVepyX+QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZF0Y-00CwrC-Py; Tue, 29 Mar 2022 16:47:51 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZEzk-00CwQf-94
 for linux-riscv@lists.infradead.org; Tue, 29 Mar 2022 16:47:02 +0000
Received: by mail-pg1-x52b.google.com with SMTP id o8so15313932pgf.9
 for <linux-riscv@lists.infradead.org>; Tue, 29 Mar 2022 09:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=mjUJmj4POHLc72j+uESMrPipTUvziFqTLssOqNZTKng=;
 b=16bvm3mK5BVPEq0QsKQh8+GZ+eE3roFJbDhcdsWwz8Ho+JKpMBeJgHQBc5vEXGZTl5
 MyoYHuyex5gP78CXssjDemtj7S6fPfK7X8eP3FYhNjPAf3AI5lE0tnJANGvwoZzqP/Pw
 WxmltKzSxZV1WZB8zTh3uOTnae0eIbiGn+1aSmAZsDV/311oVeTG/Bgc1ltg8bJ+0fAN
 vp4pJaVXVGunFXuZZzGlPrAs7OxLKBy17is1ZCMJTGsvR8LfDSyu54kgns9+5vH0Z8eQ
 luAFgyJnoyCxTYL+/zKEBfV/IF3hV/kSxOHalp6TjtfIIehSJ5o099fb+cko7bEnMX7+
 9LEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=mjUJmj4POHLc72j+uESMrPipTUvziFqTLssOqNZTKng=;
 b=2qNsOV21U7Q/p9dmCcx4Q4QBU1GwRESPDitTUg48oGEo1MQMOwoBFtyUit2lyR653O
 6JcZ1Ppa8uNFH02dF0dtZQZZ2NMhmYFyBG2FxnGxLhxIiTUIcXjIF8KG/z7aeaAIKrIQ
 TDb6NbAHENkXm0XuGIOLSxMjRqVAA0yBAUAtOdiiUWl9berjXrQS2PxSGczD1s+CH+dg
 lIIKu4ToiYtLRyFo6gMM6FqFx4scDvbT09QCtn2RIip1t6Da0g1ItKTwZzXg7LYVPNiW
 sf5Ml+oePsbp4mUbYVL1lU7z6KDwJHtoxzQ5sHQ6sibngXvyMmCb1kaRXzBUhCxZiu9s
 sYWA==
X-Gm-Message-State: AOAM5300iqcNg5RiUkfbi3CPLVaOtOFNJXEyCLJlaZc23v9RBbI45Zv/
 bVcJRGBknr0qK3sthiK48GeFwETtDMzcFQ==
X-Google-Smtp-Source: ABdhPJxTUNdlC9idt9aofzdeF/SqBgQafoUThLB6TuhkEmYTEqzNhlqRyTH3BuFi+mQCqEe8rTs57Q==
X-Received: by 2002:a62:4e4e:0:b0:4fa:b1d4:3405 with SMTP id
 c75-20020a624e4e000000b004fab1d43405mr28627061pfb.71.1648572415934; 
 Tue, 29 Mar 2022 09:46:55 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 e12-20020a056a001a8c00b004fab88d7de8sm20243658pfv.132.2022.03.29.09.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 09:46:52 -0700 (PDT)
Subject: [PATCH] doc: RISC-V: Remove pmu/ from the toctree
Date: Tue, 29 Mar 2022 09:45:44 -0700
Message-Id: <20220329164544.29367-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, Stephen Rothwell <sfr@canb.auug.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_094700_354010_D23EB03C 
X-CRM114-Status: UNSURE (   9.86  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

This subdir no longer exists: it was there to document some of the
quirks and paths forward for handling them, but those have been dealt
with as of Atish's recent patch set.

Fixes: 23b1f18326ec ("Documentation: riscv: Remove the old documentation")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 Documentation/riscv/index.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/riscv/index.rst b/Documentation/riscv/index.rst
index ea915c196048..e23b876ad6eb 100644
--- a/Documentation/riscv/index.rst
+++ b/Documentation/riscv/index.rst
@@ -7,7 +7,6 @@ RISC-V architecture
 
     boot-image-header
     vm-layout
-    pmu
     patch-acceptance
 
     features
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
