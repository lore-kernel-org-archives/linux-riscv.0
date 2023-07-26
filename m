Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1433DC001B0
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 16:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bPVJANMvVzOawf59VcrWWr7jHKIgx8DDh8nD7jDfHIQ=; b=1gSYfK1yFfqrvr
	xfnTLT5nVQctfobV0areGK1peCDfuXMLqmUa5REvTUZgDbisiKCKBYMzidHMEm/ArSTUzYJ5E3aaJ
	th10n2cRbjh4QLR7zHH3gmf5esaGsvpgPU8NiZfUmcGz4xDWBt7PdMvOb95grS3YruLUEsUabAXtv
	q6OFKMBklFjcIjV/54wgklupKABkKkRzaEl4x1RZazP3rgq4d57hC97RAnRkvFIMtRwvBdgk9dAcx
	T5p8QSZsfeXGM4AbViJHdWm+EZk+xpyVBrNcRgVCul4DuroUf8uMzFZ1G4kTQ21vLDKn7hpRX54XY
	X6dqVD1YzU1uSyiJcyxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOhew-00B3He-2c;
	Wed, 26 Jul 2023 16:46:46 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOheo-00B39r-0J
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 16:46:39 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1bbc06f830aso8629035ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jul 2023 09:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690389995; x=1690994795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcvGxWKs0ioHSwaNFVtuDJQ1B/8SpZlsoy8QXz36r7I=;
        b=ctlEmW7DMTMNY+Sp7acXqqDtGLdfH554pjXRJaq8fLvxFb/RtQTWgjya5aX8frZUG+
         kWLLX3V5bkPJ8D9sRUV/MwHTEJpB9RCwH6/ndhkksdQtRuU+HRr0zUfscDgxiFSHZA9+
         yIU0ZD4Tam8mQ2WS+5pLZ/c5X4RhjfmHJo3MwLkOOIWTzwMnMBP8Q0wn+W52egZzi2xU
         AAyOixs1odiPKZLEKGezwwzYUkbE2yPosL+ri5v70wHRzK4oQvk1fggscCcK6icuFnGe
         uL29fxGA2FdvaKyJUxHyjHp+jMTQA1xrvEzeIai5Rjkq71aK2LAAFsldGh/eFZfk8xRM
         s+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690389995; x=1690994795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gcvGxWKs0ioHSwaNFVtuDJQ1B/8SpZlsoy8QXz36r7I=;
        b=OaogSU7rkcVoNwFNhvEV9vjCB1aQaKc43+om2yRxWNNfiRMU0kGItmRdvXMnrPt9Qm
         vPd+RQLF2lKtM2G3QRLWxnst4ShQvXpXJ1QmdLjLqpd9VqFh1JIV0wIgWqrt9bIJsiUq
         aKnipxiN1vgKCRTmwjj+4InKO9TuJT6b4ToSfgd2Q2hC89F+OfVpzX5bZNkNml6QT0G3
         blqjLnJeG0ndCvdqS83iS6Wnq1103sOYw5OZgtVnqYUSHPNG4ljqdZxJsic5wrlf5hTq
         qX1msAnD5PkRR2Skqxc9m3sZocE48ivJ+XTyK848VrHNiS7Jx7s63BSp6JZGQjpNNfNQ
         VZig==
X-Gm-Message-State: ABy/qLZY2QdQEYr6hq6iVZAzC6ECb1zq9R379JN7NGt0GnjUKzZqiIW6
	DSESYU2GlvqV166q089NFsk0VB+LOvB/OLb5GCc=
X-Google-Smtp-Source: APBJJlHYD5X46sfJHvjFJ8cY7MrqSJBPdDrgEnmRM7T9AiO1YpDySEyimp6MxA9+6dubMdyjQlpBgQ==
X-Received: by 2002:a17:902:c943:b0:1b2:676d:1143 with SMTP id i3-20020a170902c94300b001b2676d1143mr38193pla.15.1690389994874;
        Wed, 26 Jul 2023 09:46:34 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id h5-20020a170902f54500b001bb6c5ff4edsm11628870plf.173.2023.07.26.09.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 09:46:34 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: charlie@rivosinc.com,
	conor@kernel.org,
	paul.walmsley@sifive.com,
	palmer@rivosinc.com,
	aou@eecs.berkeley.edu,
	anup@brainfault.org,
	konstantin@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	mick@ics.forth.gr,
	jrtc27@jrtc27.com,
	rdunlap@infradead.org,
	alexghiti@rivosinc.com
Subject: [PATCH v7 4/4] RISC-V: mm: Document mmap changes
Date: Wed, 26 Jul 2023 09:45:58 -0700
Message-ID: <20230726164620.717288-5-charlie@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726164620.717288-1-charlie@rivosinc.com>
References: <20230726164620.717288-1-charlie@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_094638_168465_65B1673C 
X-CRM114-Status: GOOD (  12.61  )
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

The behavior of mmap is modified with this patch series, so explain the
changes to the mmap hint address behavior.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/riscv/vm-layout.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/riscv/vm-layout.rst b/Documentation/riscv/vm-layout.rst
index 5462c84f4723..69ff6da1dbf8 100644
--- a/Documentation/riscv/vm-layout.rst
+++ b/Documentation/riscv/vm-layout.rst
@@ -133,3 +133,25 @@ RISC-V Linux Kernel SV57
    ffffffff00000000 |  -4     GB | ffffffff7fffffff |    2 GB | modules, BPF
    ffffffff80000000 |  -2     GB | ffffffffffffffff |    2 GB | kernel
   __________________|____________|__________________|_________|____________________________________________________________
+
+
+Userspace VAs
+--------------------
+To maintain compatibility with software that relies on the VA space with a
+maximum of 48 bits the kernel will, by default, return virtual addresses to
+userspace from a 48-bit range (sv48). This default behavior is achieved by
+passing 0 into the hint address parameter of mmap. On CPUs with an address space
+smaller than sv48, the CPU maximum supported address space will be the default.
+
+Software can "opt-in" to receiving VAs from another VA space by providing
+a hint address to mmap. A hint address passed to mmap will cause the largest
+address space that fits entirely into the hint to be used, unless there is no
+space left in the address space. If there is no space available in the requested
+address space, an address in the next smallest available address space will be
+returned.
+
+For example, in order to obtain 48-bit VA space, a hint address greater than
+:code:`1 << 47` must be provided. Note that this is 47 due to sv48 userspace
+ending at :code:`1 << 47` and the addresses beyond this are reserved for the
+kernel. Similarly, to obtain 57-bit VA space addresses, a hint address greater
+than or equal to :code:`1 << 56` must be provided.
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
