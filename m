Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC921C43458
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 17:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xcg3QCH++cAnUdOtsYJdmgjGjlZXFvSQdRSz9C5AcTo=; b=SYiPpcSxASYW1R
	GMV8meOn/JVVeiwIU93sGJjX9oYW8Xyk4V7UQL+Lt+UYfV4YE3YO07v7E/a1hEWm6entWLhg6QpkC
	DcnL7lTpMz1KuIOd9EKB/iNCGxRavUoQIbO4Y1/pyGysJ93gyzLc9NK0wdB/GG7JKJufzC8BohoS3
	+nasHTvZKH/hog1jhUkXhIbRq8NZHHvBeE7Dyv+MMhRQeU/zpLXZRSBSpbNPY0dc8G31f5QxJd/YJ
	Dtw5QEYQ9g8k6XunA0JgbH+jHdbzeh3sKQD0St4Ctb7IvhHgY404XqcmHveiPxPSwI82vcEFvede3
	m0bCz9maT/466/BeKxhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgn7x-0000000DCIc-2gN9;
	Mon, 06 Jul 2026 17:29:05 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgn7u-0000000DCIA-2JRF
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 17:29:03 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ca7aaa4b85so30457085ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jul 2026 10:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358941; x=1783963741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sc8UWUFIFca5T75Paxs4hgOTZtiZGU1HZksFlaVnRMg=;
        b=I/WI7PMRFPWWU8h/Vxin9qomqe3yqNSJIohY5wXbWcp04zh3mtXZveyouJDRLxeZMF
         M57ECn/If8T20OSusEOON1BeiP8uqcRkzoqEcsDY3hkd1PVQbZpolZma5SE2gcqGeI32
         nnmVmPY/2aZ5A8t+fZ3N1ZY37yqf9UqqjrnU0/MpJQR4jUbOILmSwHN7QBkjDFnUI+c6
         2F/msjL6btfllqwfH38XKsB4dvsf9eOQRjxw6Tj6cBBjViP+l/i5nRnrg12J27L0TU2Y
         mqwvNnJBCPj+qTc4zpMLI9TLfRMuTDh5ZH1SQaBXiV/EQ/qGkA1OBrg8s0II376alcdH
         jHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358941; x=1783963741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sc8UWUFIFca5T75Paxs4hgOTZtiZGU1HZksFlaVnRMg=;
        b=Uh33vJuHoI2NOhtED6J/iPJUWGMmvc5TJJ44JMgfUB87xzkzuP1HTgDuOcsFGiibzM
         FUS9Tttsd/5epnb1w94X4QuO8u+eNB4N4LTzv7XR05UJr91y7Al/va9IqK1mtFp6YLnd
         mf8rl6ErGUuXaXfB8Nyn2Aze9vjSBdhwSGyT2k6XMELzJX8ILokcAvslq6DsDABGc4Bw
         Ut05XrdtnCsoR78+kPZsv/9NJ1VDdWk1oh+wV8nSYTiX0xPXWVBuK0vWayXZJt6ua+Rr
         2Xf79mYxnNqgfX9FO3ecrBNtk2r6C/vxWFtIhTqWAyZa6Kn5UEZBS9oH1NyybR3/d5y4
         FUKA==
X-Forwarded-Encrypted: i=1; AHgh+RqcuoBGPfyAfoSOg0YV0LmHNknpqBxQdgbx53J/7oUViYb4n9o5VXzMm1nJH7/AfkPADroXdL3dvaS17w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOaRPMMfv6gggYBB4PEScUCDHS6GlHUJ+/Nl2wisYtlFAdmIOz
	aHRARep1P5+RxTv0ROicJJ1+9DubmQ+gL+zl5mrwzVOqHFee0BaQ+jUm
X-Gm-Gg: AfdE7cmO/vCsn+t/ntNNBvjToVUAcfwCEojuZLye56vakfQsep+HEjeGKQZEcD5IIpP
	mp7pAj3zUZUfkKfY70E+PsbZhMaX9aZUitzfC6MqrCeei/LeSmi05jalUd/W93Tl5Saf/eKe5Us
	9SZNUmY34hvgOBXPfOpS0Dne8Eo+NW6oxrAFKe9L0UNR238d4ZasMcIvCf0deSQs9f67Qbrv/m/
	QeC53biSAPxX0MgU/oeCKqPSb2aD5FRcKoG7fCuv8m1iKqkKqoWU/YfGXzyt8ZesOOQUs4ZTV0M
	fMCnBib7HjfcqLz62m8BQsLTzvXXgwUH1yI/7mKLq5cc+WFVpIZj7nasRGq1rMVt5PWhLzA0/VB
	lDnDpY/4xCc6xv7PLw08N8ilRjbKnOAmpWw0VrFvmQqaChR4KB+Y/9eGWA4l0mcn/GmgU7QxRjD
	GrTvu0y8HrxPLfoO+zdiUdcI5rv0kLoLJEr6VGFLDEDOYx3Y1TbKRBhDDvL9rVaFsKpaPO44Eop
	BXYTKTfuQDO
X-Received: by 2002:a17:902:ec85:b0:2c6:a012:6241 with SMTP id d9443c01a7336-2ccbe3f7d69mr17749295ad.6.1783358941128;
        Mon, 06 Jul 2026 10:29:01 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (32.237.80.34.bc.googleusercontent.com. [34.80.237.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e54sm54667005ad.2.2026.07.06.10.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:29:00 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	luke.r.nels@gmail.com,
	xi.wang@gmail.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	pulehui@huawei.com
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	alex@ghiti.fr,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	marscheng@google.com,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH bpf-next v3 0/3] riscv, bpf: Add support for signed operations and 32-bit atomics
Date: Mon,  6 Jul 2026 17:28:43 +0000
Message-ID: <20260706172846.3876436-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_102902_593623_1F03AFF9 
X-CRM114-Status: UNSURE (   7.73  )
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

Add support for missing signed operations and 32-bit atomics in the
RV32 BPF JIT compiler.

The current implementation lacks support for BPF_SDIV, BPF_SMOD, and
BPF_MOVSX, ignoring the instruction offset field and treating them as
unsigned or zero-extended. Introduce support for these operations by
checking the offset field and emitting the corresponding instructions.

Additionally, we leverage the mandatory A extension to natively support
32-bit BPF atomics (and, or, xor, xchg) by mapping them directly to
amo*.w instructions. BPF_CMPXCHG continues to fall back to the
interpreter.

As a result, test_bpf.ko now runs with 0 failures, and the total number
of successfully JIT'ed test cases increases from 843 to 902.
---
Changes in v3:
- Pass insn directly to emit_alu_r32().
- Remove the Fixes: tag and update title.
- Consolidate size, mode, and off into insn for emit_store_r64().

Changes in v2:
- Add missing Fixes tags.
- Fix memory ordering by emitting aq=1, rl=1

Kuan-Wei Chiu (3):
  riscv, bpf: Add support for BPF_SDIV and BPF_SMOD in RV32 JIT
  riscv, bpf: Add support for BPF_MOVSX in RV32 JIT
  riscv, bpf: Add 32 bit atomic operations to RV32 JIT

 arch/riscv/net/bpf_jit_comp32.c | 111 +++++++++++++++++++++++++++-----
 1 file changed, 95 insertions(+), 16 deletions(-)

-- 
2.55.0.rc2.803.g1fd1e6609c-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
