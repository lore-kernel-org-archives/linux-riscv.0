Return-Path: <SRS0=/L7I=NE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CCADECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 20:41:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 580E8205F4
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 20:41:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SQLt/zCY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="YeFBL9dt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 580E8205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HW4khUG27y06v5naOULjoSfMf8EfN7I0w5hk9Th+fiw=; b=SQLt/zCY5UWtqo
	RUUyF6KRcE/0S2FmtxQ9qkdGHrqKKgrZNhdVOrwKmpfJ9YcVKesqaU9xtfPzQkImy5QCZyqOMYtL7
	PUNkKPJMwI+dnaM0qQWmR5hD/U34z6SZzxnija4e11sUtAiusJ75q2wc4CgvJ6TQzsWdCyeOac4Bb
	hYcKxHoB2XRHrQtf1TDolSnIcu5KVhtC/xlWD8sPgNoIXKcyyUsjwU+ERy52le8uQprJ/ejYK73no
	ZIEazCZqJFXROeSrg2Jigy14jbtktcB1cxpCKhoPYB6AOJDtw2R1rFRxrxaxVExhDOtREva/dc2ae
	Hikhq6ErXRbNyp1SkV/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFPxi-0002N3-SF; Wed, 24 Oct 2018 20:41:06 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFPxe-0002LD-Cw
 for linux-riscv@lists.infradead.org; Wed, 24 Oct 2018 20:41:04 +0000
Received: by mail-pl1-x644.google.com with SMTP id f10-v6so2787116plr.1
 for <linux-riscv@lists.infradead.org>; Wed, 24 Oct 2018 13:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:cc:from:to;
 bh=l4cQhwyUcUP06KMujhIUzoj6XcQBIruPW01G2CSbcCk=;
 b=YeFBL9dt1FwnXNd1jeUEcz6PARC2or2JgJtQflvzRRugxSOooDcJ2ZgeZ+x5GYfOtf
 FzYg0/oAqZz5+Xjo6agzS2PF6HimmTYckT4xcKHS1Oo9Fk8FYlk0stpYmedh4ABHQFnT
 BTXgfRoQ7rEIPwCdNNY2y7WeCFtFjGyLYX6bQAd/UE/jdnNl4T7zNlMpUfcZpht6L7XK
 KZTG39UiOnKDRW0bGLY2BD2EYWkjyJA+M33r9wlJNdR2NGGTSnOVtposIAUhA94RXw35
 VatWoc4XIeq5WCo9/fKkLQ0w2L2Mjg/vIbKQz+SvKnhG/75oKcbuuW28S6Bz7hsz8i2L
 jn1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :cc:from:to;
 bh=l4cQhwyUcUP06KMujhIUzoj6XcQBIruPW01G2CSbcCk=;
 b=SLhUsLMXGYzxqWlIg0c2cI5ZkZwItBQKHRMHmtfZuUOoj63gdzpJiqr8pZZ5boZ6QS
 m4CD4oWDoNWApJKeA2wap79u5axRlcrz7KumytklfggN0OWWfkDEobn+sMmviLoq4LiP
 deLZeNiV/cpq2Hs4dZXzI3X+8RWaxBSWiOL6fhB741LEikPZS50v9sJix/TP5C+HrwPR
 5BxmVCVxgVfsAEr9QUsMYyt+HW0RXIYjsy8qml+HdLvP2mjCyphQ3vfibFOlSoS5WO/i
 kkOkJ1dDLNJzXQKRNElbnZbrrJ50F850Bg/7n2PxYFgprcWr6SBE+wgTlQiDiSqlx5M6
 4+Pw==
X-Gm-Message-State: AGRZ1gLaoyGru8qDw70AuHG2yuF0qevaXoiVjg29ozmoCtB2Bz7lASLo
 QAx8/1FMdKsSdUoDkvUwyvh4sQ==
X-Google-Smtp-Source: AJdET5eQ4iRvTxkuKb1mCg0vLUEmhYnw4urK9QM/Gc0lr2i/a1Cg5cY5zpFTtkO1tUSYUidL4Xvn0Q==
X-Received: by 2002:a17:902:7d98:: with SMTP id
 a24-v6mr3844789plm.271.1540413651482; 
 Wed, 24 Oct 2018 13:40:51 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id x73-v6sm14410558pfk.139.2018.10.24.13.40.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Oct 2018 13:40:50 -0700 (PDT)
Subject: [PATCH 1/2] Move EM_RISCV into elf-em.h
Date: Wed, 24 Oct 2018 13:40:35 -0700
Message-Id: <20181024204036.8799-2-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181024204036.8799-1-palmer@sifive.com>
References: <CAEn-LTqbEmWovu4t7Rs4C211+GRRU4V3B=+WmW0SOhX_b8db5Q@mail.gmail.com>
 <20181024204036.8799-1-palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181024_134102_442670_F6670B7C 
X-CRM114-Status: GOOD (  11.37  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: kstewart@linuxfoundation.org, aou@eecs.berkeley.edu, wad@chromium.org,
 paul@paul-moore.com, Greg KH <gregkh@linuxfoundation.org>,
 Wesley Terpstra <wesley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, eparis@redhat.com, luto@amacapital.net,
 dhowells@redhat.com, linux-audit@redhat.com, pombredanne@nexb.com,
 david.abdurachmanov@gmail.com, tglx@linutronix.de,
 linux-riscv@lists.infradead.org, keescook@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181024204035.Qgf135eVBbynBlYzYep1velMbh_Z_4tJzfhaEYFXB-Q@z>

This should never have been inside our arch port to begin with, it's
just a relic from when we were maintaining out of tree patches.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/include/asm/elf.h | 3 ---
 include/uapi/linux/elf-em.h  | 1 +
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index a1ef503d616e..697fc23b0d5a 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -16,9 +16,6 @@
 #include <asm/auxvec.h>
 #include <asm/byteorder.h>
 
-/* TODO: Move definition into include/uapi/linux/elf-em.h */
-#define EM_RISCV	0xF3
-
 /*
  * These are used to set parameters in the core dumps.
  */
diff --git a/include/uapi/linux/elf-em.h b/include/uapi/linux/elf-em.h
index 31aa10178335..93722e60204c 100644
--- a/include/uapi/linux/elf-em.h
+++ b/include/uapi/linux/elf-em.h
@@ -41,6 +41,7 @@
 #define EM_TILEPRO	188	/* Tilera TILEPro */
 #define EM_MICROBLAZE	189	/* Xilinx MicroBlaze */
 #define EM_TILEGX	191	/* Tilera TILE-Gx */
+#define EM_RISCV	243	/* RISC-V */
 #define EM_BPF		247	/* Linux BPF - in-kernel virtual machine */
 #define EM_FRV		0x5441	/* Fujitsu FR-V */
 
-- 
2.18.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
