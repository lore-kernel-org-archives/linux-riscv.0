Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80BEC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jan 2022 13:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ymI4FSe+8s0Zd4ZVixOr6yb+27HjoGKoSidOonxpA6o=; b=oSztl2uyymMhu0
	eRLTOXu7tWJZqjToz/dgWNNSFBqHd4RqSDVTBPvHhzFMpf2PVeTxlbVYGC4ycBg/7jvd/1GPv7WY8
	OF2G/WEFMLPdBppfUKrNNDcICql6g/KiH30woxu/6Y3pFb6KUH5VuhaqkUZJZsnLq97atUp5t0RFc
	BKuq6I5QTLSdtgMuFmicmfx6xKNZZFd3EUn/2P+Fh2lzsfM96DYvfSSKPIrfg0cMV8NiYcsSxifBE
	BInZeL2y7zGw7obHRCGR7ALz+M6FTB4wvyJsazoCfJgjChvhWzj4V+bvbG7Nhx5JZPmzosJgYuQWu
	rJzFdb19VFDEm/9nJrrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4NXb-0096tn-Cg; Mon, 03 Jan 2022 13:38:23 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4NXY-0096sU-JN
 for linux-riscv@lists.infradead.org; Mon, 03 Jan 2022 13:38:21 +0000
Received: by mail-oi1-x22d.google.com with SMTP id be32so54922693oib.11
 for <linux-riscv@lists.infradead.org>; Mon, 03 Jan 2022 05:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FD1ZmMFhS+qUrrSOxnb+UqMmZ3J0+5ZPilSel+beKWg=;
 b=lsX6wqRd4zBPFvV4mwJf6IIcyqmwFfi5t8d/lmGshHal8JmmFQyBj/oFoFjM90Tj5L
 M+3LEM+zxcmZS0hZHWqsGW6UVzjtiKAE4LaHZcOMDpXq324n4nZONGmGaMcGDSa4kffs
 q9OmZRh0t1HyawyNKV9eusZIpNB+ZPKH8I3Pl/6YttsrqseDUSiOSsd9h3Kx9C5ixubz
 Mbo/AhXuOvvgH7Z/g1g7mkWAgvmdNq8BQ4GtfwGiczdE1nrN8V6InmFxW2fWg9fCOIRE
 Ux+ssG0mXw3exxhqcFyt1P5kKX7+Kqvt5ESxh7YqsY153IJGzWho1wihLOIdsxQxZIFJ
 mKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FD1ZmMFhS+qUrrSOxnb+UqMmZ3J0+5ZPilSel+beKWg=;
 b=XpmOTLhRAqvl9s61fGqCIgcyViFTM+o7Qs11SkXDCQO7HsrNEc0LHeDQDN7xYCkEMT
 uUO24lwhE+lRk+79aEdlKJ1yC4JwdOmnBLfGaMm7XwGMA25KoczxCNgXkJRzwwrEsa2/
 53jFE4TxHaYeZ8y8Yx3JPW0oqe3X/9xigPliyj4RZEoPB2eh+NSJtGgiIOmnawKw+k/c
 56AlPCqNX6Jq7mfO1uUPTKll7LoUl0v1PdXPpS9yYxUId5V3XdofiEKGzXcV6dUc9vKx
 c9hdDd7HcE/OZxQI1U8TMPzqrd/6qpNerDkNXsEz3JSOJ4CGD7QZKVvpYuPi9ksqbSA3
 5ETw==
X-Gm-Message-State: AOAM533i6LopvhNNfD68J8mNbRKVfuTVGzS1oOgliNYApohWbA7I+NZW
 a7098pZipsx0HOY8QYkyGTjO6Q==
X-Google-Smtp-Source: ABdhPJyfG/Xw2iZw6I2UvhVuymj+VSlEvk6nhBJMk/v0H8M0txzIh068DZ9LN1PNwXfvTPB9ywXK5w==
X-Received: by 2002:a05:6808:f8c:: with SMTP id
 o12mr34833308oiw.50.1641217096986; 
 Mon, 03 Jan 2022 05:38:16 -0800 (PST)
Received: from localhost.localdomain ([122.171.53.133])
 by smtp.gmail.com with ESMTPSA id a12sm7679978otk.35.2022.01.03.05.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 05:38:15 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>
Cc: Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org,
 KVM General <kvm@vger.kernel.org>
Subject: [PATCH] MAINTAINERS: Update Anup's email address
Date: Mon,  3 Jan 2022 19:07:59 +0530
Message-Id: <20220103133759.103814-1-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_053820_667725_7EF87574 
X-CRM114-Status: UNSURE (   9.42  )
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

I am no longer work at Western Digital so update my email address to
personal one and add entries to .mailmap as well.

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index e951cf1b1730..f5d327f0c4be 100644
--- a/.mailmap
+++ b/.mailmap
@@ -46,6 +46,7 @@ Andy Adamson <andros@citi.umich.edu>
 Antoine Tenart <atenart@kernel.org> <antoine.tenart@bootlin.com>
 Antoine Tenart <atenart@kernel.org> <antoine.tenart@free-electrons.com>
 Antonio Ospite <ao2@ao2.it> <ao2@amarulasolutions.com>
+Anup Patel <anup@brainfault.org> <anup.patel@wdc.com>
 Archit Taneja <archit@ti.com>
 Ard Biesheuvel <ardb@kernel.org> <ard.biesheuvel@linaro.org>
 Arnaud Patard <arnaud.patard@rtp-net.org>
diff --git a/MAINTAINERS b/MAINTAINERS
index 3e8241451b49..aa7769f8c779 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10443,7 +10443,7 @@ F:	arch/powerpc/kernel/kvm*
 F:	arch/powerpc/kvm/
 
 KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)
-M:	Anup Patel <anup.patel@wdc.com>
+M:	Anup Patel <anup@brainfault.org>
 R:	Atish Patra <atishp@atishpatra.org>
 L:	kvm@vger.kernel.org
 L:	kvm-riscv@lists.infradead.org
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
