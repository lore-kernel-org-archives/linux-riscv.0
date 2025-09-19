Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFE4CAC592
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 15:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Cc:To:From:
	Subject:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WaflqyFcuRiiIhjplj5OLYAeNvXJXLxSFqea2tKukcs=; b=e8GpBBnRgi6tTh
	c+Ak3AOVBqJislXSamEySZ/lQKS4CUP0u/zVAxzBnjYgCZQ3aIjGnvwtDh0ZKbowCBVmWo60TjqNj
	/nxfIBstBcIECo8txdRTQytqhZx/Jyv8BGT1mCX04YDvfPwoThkkq4evzTUeL/o2xj70Z21keTVkx
	quinpJTOJUsUf0gnlE489MHthKV0rBJ2WvIayyhz3oK7TsIz75zIyMcjB9u4t5sCWzK5lkKLoptIv
	LQCCcsr+ms+EciJR5Cd6bV9kW4/Sqb3g2qcZyNohINBdnHTx93Cop7J3oa9Csnuf9uprHi/4u5Dib
	jTkBZZUqVqBT3TRwXEkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdVt-00000003RJ9-29Fq;
	Fri, 19 Sep 2025 15:59:09 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdVq-00000003RFk-3EoU
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 15:59:08 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-32eb76b9039so2696563a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 08:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758297546; x=1758902346; darn=lists.infradead.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CgJHB0f2ZN3bUarxuGAa6kT4dSp6f27kYDaIU7kYRH0=;
        b=2b/GqX0dbCvj10Ll75k4kTntA1nWaWopwWqPNcgMSIhUG9vMCE/rYUJVLgZ0SmpRVy
         ETZU88l/s+cbN5snN0m5uPO3VY07Os2XnQo4ztc238WZrc9UsngOaytJcFH2WkCZuAjQ
         uYor6dV1/QyafG4LmqVmcNRnkBuC/QMeicg+yjG/qubTjNnwTJJzvTKS5/b8aealiQY+
         5jUgfaSOkjhJDT/iec9kR8sL/06KhaCTYyayTpimvDfqQzGqgBt+qjqgp6QG9w0rc4A7
         WoC4JMtC1soeaOeevz4oyqllU8QaiQCEHCpfeaFI9KlHbWrCyWSdq5P8H3i/juI/QWoO
         OI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758297546; x=1758902346;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CgJHB0f2ZN3bUarxuGAa6kT4dSp6f27kYDaIU7kYRH0=;
        b=udipCuQiGv6VqMDF4V8ZCYvg8Ybf9YiUscZsHJv6nBFcXiOuJdK6DAaTqa37vGW7NE
         A81Shjgaj8cj2CZwNaqa9qNPHo3/DU4CaPPDI4IT4K1xagXCLrgXLyp6jo1iqTueQ4jV
         1jB4f/6eRh1ckd9z/VZkS3vIk08xeBLODbNJ9/7vm0dar7ZHMHQvzl0xK/lXkF7Fes/I
         ev3KchP0NjjEvTFvF6gHDTvVOu2jwVTYbPOrLeYLFDdXUcFThRFhFopmIGkCzD1CUsfr
         d1evJ+UlLU1AeuhjVAZ1SHBopoJyltKLCRulVdYqAv1ArrNv9FXgoZxCFiz6VHkR+9q9
         9bPg==
X-Forwarded-Encrypted: i=1; AJvYcCVkOWWuoetnq4LfQRTThy8yCggnMsSxsNgkH+DhCGMhWInPas1BFS1q4/oXhkbtmQgmmhBedkwxTzX9lQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJgghLMp6ZmOKJVuf5mAaqRbVOJ/8xL3CbCrTfFQ9DtH6EKQQq
	7foGqqCAfuEXfwK2TqX+eroq0aySnS2ZNojBDcfIrADoq2SW/VFyP/a754A4ekRwxvo=
X-Gm-Gg: ASbGncuO9CWzMqKQ6niokN4hZZ39Y2cs43/i1Uu/kv7Plovr2oF+MokEtqcAZflqaUc
	mbG4FHAWbrC28aREddNqOBilZfmjnRM1HTG3j8YtPdYEzbF+L3w8LJr4P5yIDvhlQ+asXehTfPW
	J2IOhujBkYU6ssgMsVzT6E3fi/4Uq01eNX1WPmMOArp+TC25LxG1pdprNJqUdwlSGQF9f1tCkw/
	GztaqqCqAeHk8fqXLiyWZbM2l9rePAo/OIKZtG5onYd0gjLNpWMrY4VpsXhsCo1tFNqUrXcf+Ka
	eYGs8t/dbxBSd73UN6pvhQoF+O9OtCejEHcVeKY7Fhgm5WvC55k+6+UYbvdb+a8HrjkpBhG1Aov
	lr6E6bQKrmP8eNJxdGjYaWWY1i9Y=
X-Google-Smtp-Source: AGHT+IEdAyCSITR98V4XKa0FAl/E0GqQXNWCFucdaEXnbcjSumS7/t+fV3GOBTp74K+j/r6FUcBKoQ==
X-Received: by 2002:a17:90b:1b11:b0:32f:98da:c38c with SMTP id 98e67ed59e1d1-3309835fe90mr4603799a91.26.1758297545831;
        Fri, 19 Sep 2025 08:59:05 -0700 (PDT)
Received: from 1dfac204f25d ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3307f560453sm2122706a91.2.2025.09.19.08.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 08:59:04 -0700 (PDT)
MIME-Version: 1.0
Subject: [REGRESSION] riscv/for-next: (build) while in macro instantiation in
 arch/riscv/kernel/entry.o (arch/ri...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: gus@collabora.com, linux-riscv@lists.infradead.org
Date: Fri, 19 Sep 2025 15:59:04 -0000
Message-ID: <175829754353.367.8050455349214492658@1dfac204f25d>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_085906_835059_C188FA18 
X-CRM114-Status: UNSURE (   5.32  )
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
Reply-To: kernelci@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org





Hello,

New build issue found on riscv/for-next:

---
 while in macro instantiation in arch/riscv/kernel/entry.o (arch/riscv/kernel/entry.S) [logspec:kbuild,kbuild.compiler.note]
---

- dashboard: https://d.kernelci.org/i/maestro:4adda9bd89f93f21b8d87a69ffbf3044dd10a850
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
- commit HEAD:  a054965b36af884083add1a286cabf98caca549e



Log excerpt:
=====================================================
arch/riscv/kernel/entry.S:117:2: note: while in macro instantiation
 new_vmalloc_check
 ^
<instantiation>:56:26: error: unknown operand
 ALTERNATIVE("sfence.vma", "nop", 0, 86, 1)
                         ^
arch/riscv/kernel/entry.S:117:2: note: while in macro instantiation
 new_vmalloc_check
 ^
arch/riscv/kernel/entry.S:446:41: error: expected ')'
 ALTERNATIVE(".dword do_trap_insn_fault", ".dword sifive_cip_453_insn_fault_trp", 0x489, 0, 1)
                                        ^
arch/riscv/kernel/entry.S:446:41: error: unknown operand
 ALTERNATIVE(".dword do_trap_insn_fault", ".dword sifive_cip_453_insn_fault_trp", 0x489, 0, 1)
                                        ^
arch/riscv/kernel/entry.S:458:36: error: expected ')'
 ALTERNATIVE(".dword do_page_fault", ".dword sifive_cip_453_page_fault_trp", 0x489, 0, 1)
                                   ^
arch/riscv/kernel/entry.S:458:36: error: unknown operand
 ALTERNATIVE(".dword do_page_fault", ".dword sifive_cip_453_page_fault_trp", 0x489, 0, 1)
                                   ^

=====================================================


# Builds where the incident occurred:

## defconfig+CONFIG_SMP=n on (riscv):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:68cd6d0875b320799d2ffc5d


#kernelci issue maestro:4adda9bd89f93f21b8d87a69ffbf3044dd10a850

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
