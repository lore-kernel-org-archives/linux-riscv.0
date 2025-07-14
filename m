Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB82C83F1A
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 10:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H77FsO3nig2o/qJnnkE9i77q7NeLBKprz307hbwn2Ss=; b=wLzyDQhKRvcKcJ
	6z3uMc59dpgOlG1NeJOuWDVem9DqTij2N0ESRIBt6O3OURQ1B+6Q6NBIyR21daYB6IZib5SdZB+8q
	tjsjJwFNRWg3sLO/Ogj1VoKa+SQtQrz6JzhbwLz0TBiAlkazIdHvsP8TSAZTJy2vVYGZGBZKvcKI/
	4RQeflBV5teiOFKz4gPCHnOXkZTlJkkhyV1OlZWqcwgzo0Vaixq27Y5uwEZschrtk7Fe49kv+fSqK
	3w7H55J+biJzRYHqyGkO1QbO37VektZTWtUUFNvA3i3QB7vIWw8dL/8tiTxwVTb/3HBEjXCCMW2mT
	u+dDL0HK42HdYUK4lDQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubG80-00000001suy-2i2b;
	Mon, 14 Jul 2025 10:09:44 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFlA-00000001pKw-32Ls
	for linux-riscv@lists.infradead.org;
	Mon, 14 Jul 2025 09:46:12 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-748e81d37a7so2366677b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Jul 2025 02:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1752486364; x=1753091164; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0dnf5JriQVpHQM4YNtZJFgadu2tM3f9E9KiPFuztXa0=;
        b=bYJgKO73wDXF4e2h1oSNr2qTOEwttlDjzfZ1tqJq/bMqUGwBtDg8yzaD2nCnq/XOFr
         g6mu9kyjRNJ9+bXYMuH8uyw8I/bKwXsE0Ow1w+k6wOQrqaqw73Vl9sYH7wgU82Z43qOI
         YYHEFQvgdoMKwsyBU8pDAnRARxv7y8MniFh/ipOkhRDdHpPRFDnDEHqriEfvUWfS5z0u
         FKAGCXYOPE7oBtUg8+jIXYBQYb3j1t1wvBQNm3qFYQiuRusxr+20xcYL2pAvWvzS+KeF
         hM7CqNLynd1jHnl8LavckiEP0GZxcyiqAWEtFAOAOTfmNCNK9dEfMnyCIEAfnF3MT5ic
         Vwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752486364; x=1753091164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0dnf5JriQVpHQM4YNtZJFgadu2tM3f9E9KiPFuztXa0=;
        b=qa4RpMeaFW5EYLwOmHIxpsuONiw088VGHZsRUQ+SRUZ8FiXCG99hGgN4HOevpRL779
         KXhTnMg45C4Nl2u7jCgtjRIaWrk5M3HGeeqWYZGh2tegdLaQVGqHYC1BTn7JnGFlJdVv
         jwO/fazBriGQmkjhtSMfx4HTuSSKX9OnZsNLx0SYxZ+lG8noBUVAupP1oNj1UmthD3zd
         zIxLxHiANOK23SyMpBvzmq/MHnt46hZFHny1bCvUshzccLpBmn/ENDVUWZfbOxRT1jvr
         09SEmBQYoy2Q4wX5w/YM+RwJzO98pp5AVmnrpCnEverD/ibxox/TAMVT7bLxnvQwFQO8
         /zbw==
X-Forwarded-Encrypted: i=1; AJvYcCXFbaeiHMc58Q+ckeJ+qhTheejHjGKfMkNyRVzfRx0+p3JYqiQRyCIUkJp/VEd2Mi1tfNowb2mwNanKrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVCaqW+XzDvBMrGeftpvYvbGJ9qrTlbr2O86sMFSmYFGdMKaib
	c0xCXpiZ4WIed9PyasGEGbUzLHAZBfVAbV8/4XEPXW6N0kM9ts1CJ0HHJDqhVne/ANQ=
X-Gm-Gg: ASbGnct7iQHYU+Lxjgq2tjPk7UPRfDyGu6XYdE7aSAl5GZ7Dn7ZZE8pHlFLtY/41uYX
	ecbjb/jd36Dne2JAGbOInHl26AMSSo4Oxtv48AW5XoVeojfoiFUF1WxxUdbBYix8hSnupC77epK
	qS+VvUtpYDodyc5ysJesn1m54maeGjxLRTnhBy4WvbQq1gZKdZLC+35Uyl1jspR3shIxQlLxpwZ
	onYoRipxewzohlLoxoy9Dbtc9z3V53615z3KXv08LHv8tLBZd/lI10oWTZNLdY6CylxnmN6mJoE
	fb8LDi4o6TLtOZ9E11ueZMVnr+cRePatCd7oiBw3PiuQDIZbTGPHY2eYlPFmSRP/QGdG1+bLonp
	fypWBwj4gVYIYE9TGIan+Wu8A3SY4jyc7uIGP5YnigZ75hrObUtwshFqntZM7BA0e6R+rh3OW/C
	wgBO3mFF5vrQ==
X-Google-Smtp-Source: AGHT+IFF990cxBBIj5rcns4ua/Z9mSLbBzTWgWQcSkoafAxgEV/F4FcvyqoXGxjBchTkM6/hWtRe9Q==
X-Received: by 2002:a05:6a00:1992:b0:747:accb:773c with SMTP id d2e1a72fcca58-74ee2c509e7mr17413857b3a.13.1752486364023;
        Mon, 14 Jul 2025 02:46:04 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd73b7sm10201283b3a.1.2025.07.14.02.45.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Jul 2025 02:46:03 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: rkrcmar@ventanamicro.com,
	cleger@rivosinc.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v4] RISC-V: KVM: Delegate illegal instruction fault to VS mode
Date: Mon, 14 Jul 2025 17:45:54 +0800
Message-Id: <20250714094554.89151-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_024608_754903_28A1C75E 
X-CRM114-Status: UNSURE (   7.37  )
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

Delegate illegal instruction fault to VS mode by default to avoid such
exceptions being trapped to HS and redirected back to VS.

The delegation of illegal instruction fault is particularly important
to guest applications that use vector instructions frequently. In such
cases, an illegal instruction fault will be raised when guest user thread
uses vector instruction the first time and then guest kernel will enable
user thread to execute following vector instructions.

The fw pmu event counter remains undeleted so that guest can still query
illegal instruction events via sbi call. Guest will only see zero count
on illegal instruction faults and know 'firmware' has delegated it.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/kvm_host.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 85cfebc32e4cf..3f6b9270f366a 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -44,6 +44,7 @@
 #define KVM_REQ_STEAL_UPDATE		KVM_ARCH_REQ(6)
 
 #define KVM_HEDELEG_DEFAULT		(BIT(EXC_INST_MISALIGNED) | \
+					 BIT(EXC_INST_ILLEGAL)     | \
 					 BIT(EXC_BREAKPOINT)      | \
 					 BIT(EXC_SYSCALL)         | \
 					 BIT(EXC_INST_PAGE_FAULT) | \
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
