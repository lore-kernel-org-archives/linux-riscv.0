Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6871CA0EFA
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 14:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ifyKyBdiSNFtnz0ym6Ch4WD9wUJAHks3I7552wu+mH8=; b=TM8MT+/iKY0LQ0
	NToXlViumMjP4I6svgdvyP9HcjmtxolM+MOj2EuAHq2Xs67n+RL6myCRBUQ3YYyOWMrq7NvxmYNcc
	j4SCBQnEfhvBnimjCRhrvn1FjkwS1nr0yQS6bUOSvd72kdQZLGMxdVVs1qMZy9V66XYGfx1Uc9djS
	WZs7pkRo725Gygz1hCv0milRG4I2YgfcS0vgRLPqr+F1VdFgwGGJBKqPjXPTCLDrdJhVTY+bC+oZG
	hr8w8CKkVzRNFHPBOxDi69v2IO9eOxyW1dtR1f8/kfYtIV5CYlUEviIY0JAIhomkdg0Kmyc3KRlt1
	B7dHBxRtjQRJYp3IjcZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqv9E-0000000CMK4-1DVQ;
	Tue, 26 Aug 2025 14:59:44 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqv7R-0000000CLx3-1zN9
	for linux-riscv@lists.infradead.org;
	Tue, 26 Aug 2025 14:57:54 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-770d7dafacdso2714440b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Aug 2025 07:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756220270; x=1756825070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p/rODbLEiDc80ZuyhKo3EG6WxWc9OtiTJ41MRtq3bqg=;
        b=KOMVLg8k+Nk53ovDzAPZ259x7COuhNeY1smBWpNniAzeDjsWZaRVQA400DsK5XKg8Q
         Rxoyap5H+mSaKiH6SJZ3YwM/F8lEdAbDvujR/seCyFn72jTaNHN4BQTiaaSQHfkyNiZ4
         6Gv9MPVyM3/4piVVms2WhevME3rP4cO89aYNbW8f576MfsoWek+hKbNtuWTl4NB8+IBX
         oGGlMEl7zAeI5kRobI64x6/MPHbzS5bc2uZ5Krf8KweLZ4/HNERoJM10Yxv6yZ38nDky
         3mwCzs2XA9OL1CZB9Zx1MPk6LTia6l9Xxw6nNYrm6nQTxcF/xsWCZYMEdxifwEo/Ge1C
         dqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756220270; x=1756825070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/rODbLEiDc80ZuyhKo3EG6WxWc9OtiTJ41MRtq3bqg=;
        b=I3DE3XM0bov2fMBGfNKJNw/wdHYUC+O4szbth10C4lyXHN4tVZ2CWkCYxJ1kYLScBf
         g6Zkea6PiOWcY35jqbdkWJmjRMlG38HSM934nUIHZe4DVInYJCuxk5QfPViPwvlH7O+D
         KT/R3pbAxj9JmU+lIjtuKKBEm8njyIGqhvjmOaRLjVtCSUzlBDS5RR4wUKnocs5vyrGs
         hr67pyUa/InfhsI639J8CXEM+b4EO8uZuVvjKPEwy6mq9uH4Eb5lM46GCLq72ie1vQp5
         y6TV9mQ7pYFA3m9DB68tOs0+LkIgevWZT3cGHOyLnuLk7AP2FF2W/hQuaW+5xCBimPuz
         gEMw==
X-Gm-Message-State: AOJu0YyOgnuFNe0jdbWRU1UPA/AJ7aGSlLxUcYDXswXYe6wZPq23Gv5O
	q8oInBvwR+stiTlQMhmSHopKUIemqjP1jvJSgnp3/an8LL9Qj4C6p0szoNbdWFYmJZs=
X-Gm-Gg: ASbGncsVB7EcEVNOvaoDR+RHUpStU9qJQs3BUSlhy2RB+a/Ddu13bmgP2T8hHJnS6I1
	FSJqIXtYhGJ5a+1kyPEDnE6APQlxbOeA2pRKN+DYAZ/lcVH3wIuNAfGblLZVRUbYvUwgOTnoXO0
	7EUS2wavw8mgjTKUkZ0bDJGb0267O/h2di+fZPEdi9J1mKUULRGKCsRaUFsuxcwocSiAkWwY36g
	bshDQqf3Lhd+DrnL86FLojT7XNox6fiXXr3/LQPsvkvxIQPzCYNCOJrgkz/GH3HeMkXqUen+TO/
	ycOP7JP0Q9G0YTgjg6j1a7JJWF3vOE7VJ0SuCHj2BJhdXbA6Dp2tcJ1A8Id/tFPf4rDn/ExWj5K
	mm8QidhNmBXx7v7lzLfVMYmLZ/Bdr5dHJNDeODr6GBGLfy35CUV4o5u2fDRqnE+ftmgu9hdshXh
	etxZjFT6BFVHhW8mukXdKTUc9JiHmYTz+gSAOocuGihH8=
X-Google-Smtp-Source: AGHT+IEIXIQmU8wp8qY4XNiR6DcL8rQwXhPcaNjDBrRolp8ux1+qyrgMhseqoKwxG4bdfNPzKoAmDQ==
X-Received: by 2002:a05:6a00:990:b0:736:a8db:93b4 with SMTP id d2e1a72fcca58-7702f9d24d5mr19346689b3a.2.1756220269806;
        Tue, 26 Aug 2025 07:57:49 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77059928c5asm7209799b3a.1.2025.08.26.07.57.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 26 Aug 2025 07:57:48 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	ajones@ventanamicro.com,
	brs@rivosinc.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH 0/4] riscv: Add Zalasr ISA exntesion support
Date: Tue, 26 Aug 2025 22:57:36 +0800
Message-Id: <20250826145740.92276-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_075753_513583_36E7E4F8 
X-CRM114-Status: UNSURE (   8.09  )
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

This patch adds support for the Zalasr ISA extension, which supplies the
real load acquire/store release instructions.

The specification can be found here:
https://github.com/riscv/riscv-zalasr/blob/main/chapter2.adoc

Xu Lu (4):
  riscv: add ISA extension parsing for Zalasr
  dt-bindings: riscv: Add Zalasr ISA extension description
  riscv: Instroduce Zalasr instructions
  riscv: Use Zalasr for smp_load_acquire/smp_store_release

 .../devicetree/bindings/riscv/extensions.yaml |  5 ++
 arch/riscv/include/asm/barrier.h              | 79 ++++++++++++++++---
 arch/riscv/include/asm/hwcap.h                |  1 +
 arch/riscv/include/asm/insn-def.h             | 79 +++++++++++++++++++
 arch/riscv/kernel/cpufeature.c                |  1 +
 5 files changed, 154 insertions(+), 11 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
