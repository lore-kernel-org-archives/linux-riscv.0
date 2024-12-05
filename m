Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D968DE77175
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 10:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Y9/fLh37lv3hXSep5yvmnOkTbtgJpAL5Gh/BQtb95I=; b=cXq9zYgEz06dNi
	jbQ9UdZx4rjw8dN0f42OC7HdpEGRcr6UcW0akORMwP+gFI34QcHkFqZ31q0sRCIAlaKO0RLY8tKzZ
	AgiT51IpN7dfSFnwr5AZlILxcx4ygr8vDVLkqKKkL29fCzvxQi6h2OC2J+bmXkmk7+udqAbwQ5GM7
	UeZWPDKtXYUEWpbkIe27+RQAQRN85XVGLl5ElefWVDshaXnlXwPXg8U3DwPJ89+Xml0NE5SzFvwut
	KviQY/I5GOKDKEdf0x9UpVNGyc4lUxs+mvfK5lgxJsbN5PTpXWnE+ILPf07Y/C1CqNxzFTn4tSOXS
	wJISiaW2mZs4325tAcVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9M2-0000000Faiu-3jRl;
	Thu, 05 Dec 2024 10:45:06 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9G4-0000000FYRJ-2hgj
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 10:38:57 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-723f37dd76cso684749b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 02:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1733395136; x=1733999936; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfDjQEoTxdpd9iDlK1ps7bFltPFhkJicFLVtDzgiM9U=;
        b=bOmv9/Re517JUb59ziGDBgPZV15rgzsI1DhD/pj3CDqaJi2s5jPyQltyUfcJSva+VN
         gj6wT/SQsrR9hld2dHAC4ltpnS7wm/dZQw7a4hZn+jnLtr8Y03y5+4TNcPzy+M0pHWDa
         iVOGFsEK4jrO5/JvpSrBz0v6XlH10UfoUKxQ3OWfGg+kIBi4jOZr4SNdCT3LffizwizI
         3cXxVpQnY5SNfCc81qiL0gHXtfdmHiEXzmE5rQSsu2d5HWyGvyxFlFx7pexM9i71BFYb
         tG23ExU2+D9ElPjmAjEAR7+0hp0UBF6X11OE1y/6Xqy0UIEmsA8/a2U7RNlVYsrmVLCW
         vZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733395136; x=1733999936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VfDjQEoTxdpd9iDlK1ps7bFltPFhkJicFLVtDzgiM9U=;
        b=jYs4mwsdIWelEw5w7/uPywlrrjXyTVowzr1zlrpSkyggaP0shBz3O7fi4fTIW6ojhE
         uPGZ4Pn29IZCM8WK/5+OdlL2ioW3+SDz88FlSdMnVYULJOrm346RIQRiWU91jiCUiISQ
         nwBrC9nykPFshBoXIIGAk6C0oZjccMGN0JcrjTX9AgstgV7m1ZAQ6V8eKC4WGvEYsLEz
         Kj0Own+KOSGmJi4X6B6xfTu45pjorl6lNEq9utSdMbwAGXTNEPuYvl7Wkq4P0PNTrId8
         Q5hyoS9Apk4Xh5OUp5qMP7k9+PlF3KZwQSXx9CF47250eDBXYERr2N/T+C8HvCtMCCpE
         JOMw==
X-Forwarded-Encrypted: i=1; AJvYcCWnj+Zv3h1VArtCAfVx0wI7okQeEygk6270Lhw/3oM7ofDClW/PthIiNhnSjxJWsPpPAYiXWVCX2G1/3g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx97DIKnghKoh8qO2UUhGb8yTxrfL/2jgESfB37Grc0OckW6ikE
	/g+0y2ZlV45fo8FNMMyrXzih6mkRDGWVSaBq4kXijmCneBrkZFgH+bPk/FXgUx8=
X-Gm-Gg: ASbGncvbN6Qqrlo1EoghAaPHRnnpV66i47OSHHhzd6tjm/5wFEiefQMyMzYS1RV+Rzy
	PwfwUCG7PhMZNAhCxiC0C1+L6I9/mQ6PhBIwX3SOGkl4gDLQfx010I0YUsr7a37Vo8QXyn6QhqX
	Comy8Ae6i5oJrEQrSeP+JhyZRBH6pOOGyS4SamWbKyQATKY4ejjnCdSFriQQjQvvaq9bwajme7Z
	0ZVbMHmjYZI4oLvx1ZOFnLJnV2hvN02bigKcTRVPo1Ku+EDQzccm5yqUaGigXWlpz7Uj5CQ6v72
	o3xHgdzhoHueelNnOd1BFO/AgwlBehjQ
X-Google-Smtp-Source: AGHT+IHmLj1p53xhXYUvBEpMrjDW3Wg1vBwEcbP7EM0jf/sz5snayXz0eteUjpLhTi1nk0wWuAYigw==
X-Received: by 2002:a05:6a00:1703:b0:725:3bd4:9b52 with SMTP id d2e1a72fcca58-7257fa5a308mr13643770b3a.3.1733395136132;
        Thu, 05 Dec 2024 02:38:56 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156f048csm886826a12.39.2024.12.05.02.38.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Dec 2024 02:38:55 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	punit.agrawal@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH v2 19/21] riscv: Kconfig: Adjust mmap rnd bits for 64K Page
Date: Thu,  5 Dec 2024 18:37:27 +0800
Message-Id: <20241205103729.14798-20-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241205103729.14798-1-luxu.kernel@bytedance.com>
References: <20241205103729.14798-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_023856_683373_557841C5 
X-CRM114-Status: UNSURE (   5.80  )
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

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 592eb5766029..9dfe95a12890 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -253,6 +253,7 @@ config ARCH_MMAP_RND_COMPAT_BITS_MIN
 # max bits determined by the following formula:
 #  VA_BITS - PAGE_SHIFT - 3
 config ARCH_MMAP_RND_BITS_MAX
+	default 20 if 64BIT && RISCV_64K_PAGES # SV39 based
 	default 24 if 64BIT # SV39 based
 	default 17
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
