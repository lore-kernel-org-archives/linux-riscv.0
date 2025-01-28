Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F56C02193
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 06:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a7pVGoPRYHSa4gXpCWDyCy8AnLTWHHsL225trUF3Czw=; b=GltfQ7iHdXpxYM
	jPiW3AC0aXALrrCKjxq3mXYLBb6hbnJutZSnYOEB9xQ6Mel+u0kKZWSDBnvFny5DHHG/j1adJPquZ
	pvKxIKcXGBcts3ucWqnOptCWUxZYfzzY2iRSWJk4POrZNS4sw4JlhDwEAEJdTl2eD0+gkBGXRpuh5
	jqAE0h4kt/+/L8MPcIkh8f+WxD0OdYUKpWHThnW10OcNmxsxaTmZsCHZU3oA0H31YAk0acE/varXv
	YIHwWn8ts1xF2rby/uWbiLNebqTL3jaFU93O/tRP57X78IBKjHafrB/0Kx2mBJ/BkFWLHeqPwR0aP
	6fQjJ7ffAqlnXZnfFCfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcfCS-00000004Djn-0e1L;
	Tue, 28 Jan 2025 06:35:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tceE2-00000004AUq-2aOy
	for linux-riscv@bombadil.infradead.org;
	Tue, 28 Jan 2025 05:33:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=sle+tYzc1Kj6tbZ7/BHbrlcS2vI3Z3FG3YJYp8onC8U=; b=Ye51lrrBB2UAL9vgZJb/UhWJHd
	WI6WEyimXVMo/1svofUgYVL/WJOhZyx5wyZ/kZpEz3+3ijlxWCGaJquv/cU9LNQCFM2OyHK2xHuSd
	VRNhnLI5WW3EwBmHcW+OVmWgFC6oPnpkQILMV2JcUWVP0vOO0pu+Gu5Lt2Yu1tHS7Sn3oVZF9oIr/
	sCcotbrqMLRuhaeshB0h3qYv5uqbkKO/XZJaKyuLNmqK/UZGUBqOnvCvszgagXEZ/Lur2PRplZg6l
	6D4mlFnLoEoTADZRgYMjGOVL4zwGrtGrhBLNVUs0oXiBjsro4gEnkyl120VEX8SqjIisZ/uEsa201
	QrOaZHpQ==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tceDz-0000000Epdj-0YWk
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 05:33:25 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ef8c012913so6923846a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 21:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738042400; x=1738647200; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sle+tYzc1Kj6tbZ7/BHbrlcS2vI3Z3FG3YJYp8onC8U=;
        b=iQmf1Ja1/n/p6l0vXUDoQK/iKQACrrNGYj8LQRr8X/7LmOLeCG6AGbvYlozMClu8CI
         8KgxQiys3qRvSh/vFUGOHIqSWf9MwYIQKzg+kfkceT4K4ZhcVd/HtQKWYfhWZwaMQYaF
         WGJ7LsJvA/z6Ff9yY7BctWvaQXm+EAAimmG2ATrv2B0fIcb/6YeKAHaN6vjDvA1WdTNs
         v279iLeBN6sHzOYDmG5ROFYsGbs+mCTroBRDeAb4729SsBPjXIuc2dk77wzbB1XT3RfV
         Lvdkrg5eZjQ3W7n3U6vyOMB1rvaStwoSNnKIiHdyWSHuMmE5gX8I/KPYv9L5l+3FcdOd
         81/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738042400; x=1738647200;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sle+tYzc1Kj6tbZ7/BHbrlcS2vI3Z3FG3YJYp8onC8U=;
        b=K2NlIe6vcANY+Dk9dsbBKARwZI5zgJDtk079zRAlBDMUdp9FiOauvyI7vE0UZmb9Zu
         PbWVX1hEGAuFGBHCTEQGXHCqtFp8UGLKj2EupOVq+4Al8q2NKIoNtlzvdlOD90YtvIBR
         CJERaIGQ/RfbyuCDNRQRExz4xTwctwOy8oiVuE8W98g68h/IWMCnIu8staHe/okEjDHd
         vDeRBkXwJ3MY60nARPehs6ohRnhfMTQVoIUXukCMKaPaY1tdHGSGYzsL5kM7Jp0Igd39
         hOd6fYE+bvLFBtqqKu+Q/yX8opIi4MntkhWeMJ9f4+1urzcCavo9JUJ9rESJo4Yc2E6c
         hCTQ==
X-Gm-Message-State: AOJu0YwaR2INF/vFQdguLvFdFQQ4AZpNuWPKv2arlxd3flDq25gR+qjV
	cenoN9d9myQTkBbHtSQMh88TvDqqWgN3Q3o8Tp0+1T/HkWN58FgMmIN2Rq4Gs4E=
X-Gm-Gg: ASbGnctSTypVMBCp6Ds/YMIZRrrjYHc+DJFfoOsWzKUypZQqT1Z5aCH/T+vQuoxKTRo
	ZTIC5UT+yprXwf6moAuAX44F5plUMQAsepyqDHFqjhzfjhSFe6rHccTmw/58hJ6CCncJsyDJ9UA
	sJcwWAwWDxX0+V+m8fE8RMHfe+hR6YIHm5TdodLv2gtIKLfoia61D5Px2qHE/+/iN8rJ0n0YE9G
	OqHdf/HXiQSrQqiEtlgyfr5GLh14qVi9uZ8lrxN8pPHc+bWtU8MgOsOk+AJpnuieGdaq7WoPEwN
	gMKG7iKrLaugSqHZ9dAHPKj03owF4sI=
X-Google-Smtp-Source: AGHT+IGZkd74wEJ76f8m4806LJQwkYr3HqMsqTNdi/AqpJOBfIND9TCgujBv+d+IppRw8DYDaApu3g==
X-Received: by 2002:a17:90b:5448:b0:2ea:5dea:eb0a with SMTP id 98e67ed59e1d1-2f782c4d75cmr60542708a91.4.1738042400318;
        Mon, 27 Jan 2025 21:33:20 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffaf9e98sm8266247a91.38.2025.01.27.21.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 21:33:19 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v4 0/4] entry: Move ret_from_fork() to C and inline
 syscall_exit_to_user_mode()
Date: Mon, 27 Jan 2025 21:33:08 -0800
Message-Id: <20250127-riscv_optimize_entry-v4-0-868cf7702dc9@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABRsmGcC/3XNQQ6CMBCF4auQrq0p0ylSV97DGKJl0FlISUsa0
 XB3iytjZPm/ZL55iUiBKYp98RKBEkf2fQ7cFMLdzv2VJLe5BShAhQpk4OhS44eR7/ykhvoxTNL
 UukaNoDQYkU+HQB0/PuzxlPvGcfRh+nxJ5bIuoFElrICplEoikTXGWNe16hA4+ci92zp/F4uZ4
 NvRKw5kZ+fAWLTQGlX/cfS3gyuOzk5d2U5XF0uoLz/OPM9vIpGGXEsBAAA=
X-Change-ID: 20240402-riscv_optimize_entry-583843420325
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2277; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=vsu6cgsvHKwBowyBPOBpPBCq2EM+Gs+NrcIx6EM09Hc=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qMHPF7PA+2HPFSuWLm8pN9YV7aEamX16TPvjhzXHaFf
 dPLvSrrOkpZGMS4GGTFFFl4rjUwt97RLzsqWjYBZg4rE8gQBi5OAZjINWGG/xlTmq8y98Tnu3JM
 PDpzz7aGX8xCLSfWxBxJKV+muUvz4mmG/5nKU/TuzN/64MFXRbVQi1V2vg9VhU78lP8p3fVio5I
 wEyMA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_053323_405936_CB80FDDD 
X-CRM114-Status: UNSURE (   9.31  )
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
Changes in v4:
- I had messed up warning for ct_state() on rebase, correct that issue
- Link to v3: https://lore.kernel.org/r/20250124-riscv_optimize_entry-v3-0-869f36b9e43b@rivosinc.com

Changes in v3:
- Fixup comment to properly reflect args (Alex)
- Fix prototypes for loongarch (Huacai)
- Link to v2: https://lore.kernel.org/r/20250123-riscv_optimize_entry-v2-0-7c259492d508@rivosinc.com

Changes in v2:
- Fixup compilation issues for loongarch
- Fixup compilation issues with CONFIG_CONTEXT_TRACKING_USER
- Link to v1: https://lore.kernel.org/r/20250122-riscv_optimize_entry-v1-0-4ee95559cfd0@rivosinc.com

---
Charlie Jenkins (4):
      riscv: entry: Convert ret_from_fork() to C
      riscv: entry: Split ret_from_fork() into user and kernel
      LoongArch: entry: Migrate ret_from_fork() to C
      entry: Inline syscall_exit_to_user_mode()

 arch/loongarch/include/asm/asm-prototypes.h |  8 +++++
 arch/loongarch/kernel/entry.S               | 22 ++++++-------
 arch/loongarch/kernel/process.c             | 33 +++++++++++++++----
 arch/riscv/include/asm/asm-prototypes.h     |  2 ++
 arch/riscv/kernel/entry.S                   | 20 +++++++-----
 arch/riscv/kernel/process.c                 | 21 +++++++++++--
 include/linux/entry-common.h                | 43 +++++++++++++++++++++++--
 kernel/entry/common.c                       | 49 +----------------------------
 8 files changed, 119 insertions(+), 79 deletions(-)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20240402-riscv_optimize_entry-583843420325
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
