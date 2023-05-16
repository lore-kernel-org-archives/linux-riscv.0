Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBC8C77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 07:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6hXdL4Vqj1Hg8HrO3hzE2wn2X26zZ/IKspKFrwgU9lY=; b=r/0uiUVNrESvR9
	4PyIRrO0dqIMkjBOjp/b0zs/6e7druthH+D2Xt8Sh6rC4QUJMYjpx74zR5Q2uWJr6C5iTs4QhM68C
	kYGXlt41lB22LRSmCKOAFv/hA9Bwar1C3Gj7pL+9vRJExMoj1UliSY7Zhgi9wDk+fmlKZm7ehnkin
	1IUqHtI6FlSGVgm4NS++O39p+18i7R5d3NtCY1i5FN3JkvzGM4MREjKyKY6nIDyYq+WIiP8WH2MiF
	4S40Kv+acyWftDlR5zpc22SwfSLhcbJQbrrLZKiZba8GesieYner/ZPqpKBNeMxYTk8Mv+p0kt3t5
	PVU/71JeGBuKzlrp1EYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyoxP-004cmm-2z;
	Tue, 16 May 2023 07:18:51 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyoxN-004cmE-1F
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 07:18:50 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-51f6461af24so9604155a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 May 2023 00:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684221528; x=1686813528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tnAI2sXUbiQvd6mgY7NnxOBWPf3gGQ8XWTI5xmKxwWU=;
        b=np4y4iLNUIexTfiyIkMxgYRriRCWr8e/v0OflxMm2NmIfb1jr2jheNFm1Ks54g+2f0
         yCdYdJ105s74b2lGBaMJLO0sY+u2TSGBBk/upTjlyWrV3Rs6gbgs5BY1+Kq8xDzyI+qs
         or9CRP5q7DogGW9pPPIMj3dhNLzm4sJV0HhgI2UuKgXUPRqEE9qfYM773droKbYS9THF
         3LheMjghgJSOiC7tR5xsEGfU1ycFZGm9Ifcvu0Sj41VX3pRDwF7ieFsEAz/F0fB8KzhU
         xZbMj9nEIukEPVK/IjlfIdLQjS86Sr7zMUAEtRTHXSlv6XbORqIwDInXPJvWyHYibCgD
         yAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684221528; x=1686813528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tnAI2sXUbiQvd6mgY7NnxOBWPf3gGQ8XWTI5xmKxwWU=;
        b=Q8ULqPVcJyvbnkLvs45/huXEGn6Umy0kbdL77VnP/uG1GuWzBtoaWGPaqSAbVpUri3
         GxuXEWMsFrm8H6cIv0ExSlTWI06zPlLihYJo8DtfeIaMkz3HKfvx+FTBp2dfBquXMAMC
         ppVLAL2aWkh7gAnQ7OkkqVQEvcZiCJ0I3kFR5WArRkMm1QAAybY2Xi6K3KlP3RYxXn/m
         2BjoQkVKE2xr4OL8LQpaevEXfZcp0KC1gAHWWxJ+W0c/HoW2xyyMk+DcQ1SDjSkDKJfz
         esNJ6rRPdeqFAYq2CwVOFfepxb53MM0BqbpewrOm1USodY/Mbgbk03a+6qUy82c4s1Qp
         Kyhg==
X-Gm-Message-State: AC+VfDwKQ8QuB1qPQzTz4VmmHI7GqLCXD4ietPnOavw8wPsmqxYVsu5D
	vCrVt9V6LCqu+pxTCpyLKdk=
X-Google-Smtp-Source: ACHHUZ6KLgde39yA7rEwU9DsLAFJhMvVZ4vKy7KxmS68J67q5sb74zy1V8UcYpfyCJsfvq+z8inB3Q==
X-Received: by 2002:a05:6a20:3d82:b0:104:2200:8949 with SMTP id s2-20020a056a203d8200b0010422008949mr21473230pzi.56.1684221527736;
        Tue, 16 May 2023 00:18:47 -0700 (PDT)
Received: from localhost.localdomain ([203.205.141.15])
        by smtp.googlemail.com with ESMTPSA id 17-20020aa79251000000b006468222af91sm12849830pfp.48.2023.05.16.00.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 00:18:47 -0700 (PDT)
From: Ze Gao <zegao2021@gmail.com>
X-Google-Original-From: Ze Gao <zegao@tencent.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	Conor Dooley <conor@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	Ze Gao <zegao@tencent.com>
Subject: [PATCH v2 0/4] Make fprobe + rethook immune to recursion
Date: Tue, 16 May 2023 15:18:26 +0800
Message-Id: <20230516071830.8190-1-zegao@tencent.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_001849_423657_1C3864D1 
X-CRM114-Status: GOOD (  10.89  )
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

Hi all,

This is the 2nd version of patch series to fix the ftrace rethook recursion problem.

v1: https://lore.kernel.org/linux-trace-kernel/cover.1684120990.git.zegao@tencent.com/T/                                 +++#md4c0bae6a6cae28dadf2a2c6105ff140b35fddea

As Steven suggested, this version removes unnecessary notrace annotations from fprobe
and rethook functions from v1 [PATCH 2,3,4/4] and replaces with makefile changes to filter
out compiler flags which ftrace depends upon for rethook related objects.

Ze Gao (4):
  rethook: use preempt_{disable, enable}_notrace in
    rethook_trampoline_handler
  fprobe: make fprobe_kprobe_handler recursion free
  fprobe: add recursion detection in fprobe_exit_handler
  rehook, fprobe: do not trace rethook related functions

 arch/riscv/kernel/probes/Makefile |  2 +
 arch/s390/kernel/Makefile         |  1 +
 arch/x86/kernel/Makefile          |  1 +
 kernel/trace/fprobe.c             | 72 ++++++++++++++++++++++++-------
 kernel/trace/rethook.c            |  4 +-
 5 files changed, 63 insertions(+), 17 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
