Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87265C0218C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2025 22:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/iHp+w7FnB/vK5GZF1EAQ5Vsl1ZRCGgqVffOCAUn9Pg=; b=GPAVcPA1DlY6Nx
	zmk2TxIhU283kVZtL3IJ7wVusf3YFTcOpoa4Y7m86URSjh/NjMooP2cKD9Yqgzk4DTvZFpbAX7mBL
	tHYZWwKmFlewSaol68bgk7CRYWiDYLoYRBEer0wuzdXqI5Q6IEeCjaVrBNymfwEze2VxqYdI9XgJG
	COnw5GAhxZeS5KQhirrPjS7oVIgpGzNliB7XBowhIinb8BVjq+M+vNJNLVmI14rMrE2tjOoCoUuRI
	zeOGoc2FZV+x/MJQMZOm5HGv2OTk2b66plwiIdV5dnYBsWw4N8sYaQNnZ4FEXcggVEtCN0TbrBtw5
	ijJPHcUkp+vWJkmOmu6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tajed-0000000BMXV-1ESP;
	Wed, 22 Jan 2025 22:56:59 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tajeZ-0000000BMVp-2k3J
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jan 2025 22:56:57 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2f42992f608so528472a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jan 2025 14:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737586614; x=1738191414; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cnzMlYCzKVvpxw7yPav+PLPBZlq1nGQlt5nCryj5lKM=;
        b=HCXDBnQMX/vyLF33BiapaUyx5CEn6pQWZSCr0AKRd8+RuOY0vfcIb5a7jmueoCoTFK
         F2q4dKJ+xp+0xG6O+5nOwW5oVd4jNymsitRvV9lwE5WTyAzV1SchkOaDaZqWv75+bljt
         hHzzVh7qCsb4PSHwo13WCiIiYyLXaTnQFWe9S6CIsuSsDvfC8KM7YHFfmp9cYrHB+Vi5
         emUlv4okGd5z+Dineke6xrTOc4ZB1F41ewbipC/hJYNxfO9nIqLCrW3bSyGnv3CXx8D0
         ZlyG5LUAxJlfhpOGYy9gqHx0Y0tqS1BoTaH3ypsAhUOCQgZkqivMeEijUfqUkr3AxUzq
         j+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737586614; x=1738191414;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cnzMlYCzKVvpxw7yPav+PLPBZlq1nGQlt5nCryj5lKM=;
        b=Xdm6UToC+uAQDf0McO36LEh/N7bUGzuSkZSrK4pmwdbw4ZMrPKBaEY/Szi9y26G1sG
         Vv4DK4Z7QLrJtsI8jc4zu4QJkhDhprXM8LXzv8S6L4uzhTssFOq0dqHTy2rJGQS9LAg5
         ccUF3UV6lprNPGmMVf4bWA5wZ1N+5wtcQ9BldJ5VZ/HBWmE2auxWxOjvP22Kbdxoi7CB
         1appX+LUckRcioNLVUEuaR7HPwUaUIA2u3h6TOujwbdBFrCgp2NlHBYlo8W95btIlTTE
         oKf6Re+f67XyyyGaQpN5EgG4y+p9biryTqRxhbvLW6Dpr+z8qyS+NSbZHD0GJeRGNnNX
         QeUg==
X-Gm-Message-State: AOJu0YyIl1CHc8IjgqLO1joF3BZYsp7qUxBtffBIc4lBOtvyX5+uqjcB
	H895VD2nalANMVkWLRf5QjtpdgB6OE9pHK/mVIm6uSmYj73SBof4Jqg4twazzD8=
X-Gm-Gg: ASbGncueCU+ed8pW+oFr6vTRvf4DLSJjytVM6DTQ/TBDW9y9qhxt5MzBtas9rECD/Mb
	3sxG3Cpk8c8EEAWc5plEtJtmjvfcyDUcHCiwIGTvExjAgvY3pquLqt8e4G8wctb1teR7s+Cuv6M
	nVO8sTR6aPy5q/JBkWibmGUBx1JeOHBpYHGMlQZgrsU9FI65mR6eKLDouPO4WV60T/HS3VbtMKW
	lgdA5ZqQsWGJn+fhsexPF7OEW9znvos5k2F9TsKJw8tb8ZtUgzmeA8fnF9JSYd7R8qOeKalYZOu
	tR3cTAxxkA==
X-Google-Smtp-Source: AGHT+IHB0x+Ki93nVMyNmjUvHS1Hbs7yWzbtT7Kml6NUqhDpPqvjvCne2/W3tEXbP1kUcPb30M8ZEw==
X-Received: by 2002:a17:90b:4b8d:b0:2ee:7a4f:9265 with SMTP id 98e67ed59e1d1-2f782c976f5mr35059946a91.15.1737586614341;
        Wed, 22 Jan 2025 14:56:54 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7e6aaf3b4sm2301375a91.25.2025.01.22.14.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 14:56:53 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH 0/4] entry: Move ret_from_fork() to C and inline
 syscall_exit_to_user_mode()
Date: Wed, 22 Jan 2025 14:56:19 -0800
Message-Id: <20250122-riscv_optimize_entry-v1-0-4ee95559cfd0@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJN3kWcC/x3MTQqAIBBA4avErBNsNJCuEhFhU80iizGiH7x70
 vJbvPdCJGGK0BQvCJ0ceQsZVVmAX4Ywk+IxG1Cj1VajEo7+7Lf94JUf6ikccqvaGWeNRW2whpz
 uQhNf/7btUvoAcMITyGYAAAA=
X-Change-ID: 20240402-riscv_optimize_entry-583843420325
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1633; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=mv7KUIbyKGHeuf7LA5c1+10gOtsNxeILI+8x5fj1ZI0=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/rE8s0TrtXqsUUK2vXc8j4W/efQ3uZL75iF2SsOVnDeT
 A4Sej+/o5SFQYyLQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgIlwXmT4n3/d44Sk1qzVd157
 MQQsunbo4UqfpE+mU7Yu3dsV5ztzqw8jQ/snE52ShgWi7NKP1iVNc5gjHhlyo0W+/uIiZvVbP9j
 e8gAA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_145655_915585_5CD85F0B 
X-CRM114-Status: UNSURE (   7.68  )
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

Similar to commit 221a164035fd ("entry: Move
syscall_enter_from_user_mode() to header file"), move
syscall_exit_to_user_mode() to the header file as well.

Testing was done with the byte-unixbench [1] syscall benchmark (which
calls getpid) and QEMU. On riscv I measured a 7.09246% improvement, on
x86 a 2.98843% improvement, on loongarch a 6.07954% improvement, and on
s390 a 11.1328% improvement.

Since this is on QEMU, I know these numbers are not perfect, but they
show a trend of general improvement across all architectures that use
the generic entry code.

[1] https://github.com/kdlucas/byte-unixbench

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Charlie Jenkins (4):
      riscv: entry: Convert ret_from_fork() to C
      riscv: entry: Split ret_from_fork() into user and kernel
      loongarch: entry: Migrate ret_from_fork() to C
      entry: Inline syscall_exit_to_user_mode()

 arch/loongarch/include/asm/switch_to.h  |  8 ++++++
 arch/loongarch/kernel/entry.S           | 22 +++++++--------
 arch/loongarch/kernel/process.c         | 36 ++++++++++++++++++++----
 arch/riscv/include/asm/asm-prototypes.h |  2 ++
 arch/riscv/kernel/entry.S               | 20 ++++++++------
 arch/riscv/kernel/process.c             | 21 ++++++++++++--
 include/linux/entry-common.h            | 43 +++++++++++++++++++++++++++--
 kernel/entry/common.c                   | 49 +--------------------------------
 8 files changed, 122 insertions(+), 79 deletions(-)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20240402-riscv_optimize_entry-583843420325
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
