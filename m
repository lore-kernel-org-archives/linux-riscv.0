Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C51DC43217
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 22:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ra29Gcre4593FaAbMMCLVpJITR5s1KbiPkhD5upv+9c=; b=s/1qth6EZHrDd9
	+XQqMhQUv/Lyijaw2WyPYe5y/zgiPnvuWoZ+1SKFa2WAfEpI6zP0nmKrHDtN4Hi4B5skZ8yvqeKVG
	9seEZlZEe5hW4Z3WQF2kd6lPLMrPSQ/K1gP3F4gNMBWZZVG2O6R9keVEjsRgdR5g9/456MwVZblGn
	2jWzEVYXPkWd90IcpKX98oRjMmHLp3S4hy5mW3YdAdS7t+HCd/lvBhLGkK1wVs2xTiyRICpzbW08W
	wyGe1r8ydDfZb1d++OhEsmAl6kwBoIl1Q8qWq6bshujtHy1VN2hUAy0R+t6I4gAwzB3rXfZ6WdLRZ
	lYjM0u7hL09+x9oNrehg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noBvf-00GZBG-OM; Mon, 09 May 2022 22:32:35 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noBvY-00GZ53-Gx
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 22:32:29 +0000
Received: by mail-pf1-x430.google.com with SMTP id p8so13417308pfh.8
 for <linux-riscv@lists.infradead.org>; Mon, 09 May 2022 15:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=pWbw2Mwy88SDSkfpA4D7g/Rmsq9eS9lL/9r9k9KvO7g=;
 b=aKb0kPhWVd5eMpmlkl9NknitMxg8gh5oazT3otM1H7wNssSLITeEgVYd3fLrFpqhAN
 6lW7y7N8edPrk+YAtulN/xaP8NiOVNXKZAi6KA0NNveYzfnxDp9ggPIafs2mYWMuEWpF
 yisEk6Vl9il9YEGMryMzMjf2wBlPJtypJNMiXj/O7kxrK4628fYPSch836eJYFLJD5Wl
 OrKTh30iRJgEMKA4TvqbYiX+DIHWjjGEmbm+VHeiIrDIZkzUjvIVMUmJT2O64m4s1rq4
 s75jC01yaX0ljYX5/96b4XICWLQpDnMGWrtzgp0A1FvhK7kRpUekOBDbUefjzvvkL2IY
 V5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=pWbw2Mwy88SDSkfpA4D7g/Rmsq9eS9lL/9r9k9KvO7g=;
 b=Sy/opS4xR5DWZxssJ8gEHJWcC8DbNLKB6Cx8castqcn00tIsNPE32K/6ZVev+oPwYH
 vbe70STDkMRb3S6JQCXBXSOagOPgwv1j/38Dht/HOqoJOV+gjCQmWkmTEQ6QSsi5JJ0v
 u9ap6nMxBYBMGkvicJLaX8hYismY/5YjYq0FAkTN6bRI3HLUSMCXxKtSaLdc85OWt1c4
 T+CPaOlonLMkC5DCZ3DwnbI+9ly6sz38QhPtXyZMpNy5/jOvvT5DkJCOHac297c5mop3
 mXY1PBJF8LAa2c5P6xKEbKoPdNqc6q4K/beeoFGZOnEcwCS0Oz5pYZO/mJ8RuP0sHx66
 FLmw==
X-Gm-Message-State: AOAM533EmuFUrPnl+zt7Ki2/Twkq1mQjVhqRI+B/4ZlZmql3lpQKan2B
 MBQgiFLuhw+Xh2LMftmiLI4vUA==
X-Google-Smtp-Source: ABdhPJxUc/qGM9x1mbDewFdh0f2iSebcv/MH281VDWnsTPJAYa63hm5brMdaLkqzPiol6IuhZdvYkA==
X-Received: by 2002:a05:6a02:10d:b0:381:f4c8:ad26 with SMTP id
 bg13-20020a056a02010d00b00381f4c8ad26mr14585787pgb.135.1652135546996; 
 Mon, 09 May 2022 15:32:26 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 w19-20020a1709029a9300b0015e8d4eb1ddsm407885plp.39.2022.05.09.15.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 15:32:26 -0700 (PDT)
Subject: [PATCH v5 3/7] asm-generic: qrwlock: Document the spinlock fairness
 requirements
Date: Mon,  9 May 2022 15:29:52 -0700
Message-Id: <20220509222956.2886-4-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220509222956.2886-1-palmer@rivosinc.com>
References: <20220509222956.2886-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: guoren@kernel.org, peterz@infradead.org, mingo@redhat.com,
 Will Deacon <will@kernel.org>, longman@redhat.com, boqun.feng@gmail.com,
 jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, macro@orcam.me.uk, 
 Greg KH <gregkh@linuxfoundation.org>, sudipm.mukherjee@gmail.com,
 jszhang@kernel.org, linux-csky@vger.kernel.org, 
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 linux-riscv@lists.infradead.org, 
 linux-arch@vger.kernel.org,         linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_153228_611271_C0F212EE 
X-CRM114-Status: GOOD (  10.71  )
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

I could only find the fairness requirements documented as the C code,
this calls them out in a comment just to be a bit more explicit.

Reviewed-by: Arnd Bergmann <arnd@arndb.de
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 include/asm-generic/qrwlock.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/asm-generic/qrwlock.h b/include/asm-generic/qrwlock.h
index 7ae0ece07b4e..24ae09c1db9f 100644
--- a/include/asm-generic/qrwlock.h
+++ b/include/asm-generic/qrwlock.h
@@ -2,6 +2,10 @@
 /*
  * Queue read/write lock
  *
+ * These use generic atomic and locking routines, but depend on a fair spinlock
+ * implementation in order to be fair themselves.  The implementation in
+ * asm-generic/spinlock.h meets these requirements.
+ *
  * (C) Copyright 2013-2014 Hewlett-Packard Development Company, L.P.
  *
  * Authors: Waiman Long <waiman.long@hp.com>
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
