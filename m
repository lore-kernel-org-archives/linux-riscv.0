Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE94DC47077
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Jan 2024 19:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9cDaLITOlm/UIKt5gmjEbom8CaGPfmhqOVli/7yUasM=; b=ryDhfmcs+rzSlr
	J6R9n3b2+pWd5rrcqBw30lWNI/eSbiFh8Pbm8Ebi4d92HP1uH/ijmT9zdKclP5yJTMBCynZ5eZxx8
	Io657UaB+iN6Y5ir3hqhQAkWduQTV/UPDIGeHOJdSnT+owsCdsLLFLc/1dsHph7FKZiRLwjVo17oo
	YyjskUo1g3rhiP468rPYitKz78JMhl6fM+e60GHB518xsJSS8CwDFOYTVUAJm4JeKu9R2CQ9BIXg/
	vosb3MYvB9Cib8wTpao3R8cyFBLndPfi5p7q+iZLZLi/Wd2HUIWPsieRyhN6kPO6/y68w9LOYeeQk
	G90cyXSuVuEUbdtS/sHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rP6b4-007F7O-19;
	Sun, 14 Jan 2024 19:56:42 +0000
Received: from out162-62-58-211.mail.qq.com ([162.62.58.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rP6az-007F6W-2f
	for linux-riscv@lists.infradead.org;
	Sun, 14 Jan 2024 19:56:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1705262185; bh=p9Bu5tHe0FzPhQq4mnG4EqMw8nkniS9fHhWhaNF5cVw=;
	h=From:To:Cc:Subject:Date;
	b=rF+dbXRILjAuVUJfUfbLlOWfhKqA1O79/iKLGW1QA9Rl1d6p4k4dsNd6OvhgcSGLl
	 gSr6tC+MJzKRQqJ0WbLGANm4vh1piFJE57mDZQMEv01BACleBK9MRI5C6RgFQjZ8nP
	 Uel8mEsVxYf0txP3iCHg+r6ap/mbVXfVFAp6r95Q=
Received: from cyy-pc.lan ([218.70.255.58])
	by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
	id E112FC12; Mon, 15 Jan 2024 03:56:17 +0800
X-QQ-mid: xmsmtpt1705262177tqrr4biqc
Message-ID: <tencent_F3B3B5AB1C9D704763CA423E1A41F8BE0509@qq.com>
X-QQ-XMAILINFO: NQR8mRxMnur9qJqW6WlkeAfDDZIHIUWFf62lHXj5+7j9b/4lnmECzz+d7Pbxhp
	 75Wr185z4svs6HRiLa3p3mJVWnQzxP160GOB0oaXzlRXNc9TzstTyZ2GcYMWa9/Sw3Odq1Wd0HDD
	 rTb9U4a1HGvMYxKR1ook+0b7PZaPR2KIaocoY3BOFz6Roz/GA0QCq5eZ12/QEYDd/id7WNvWx/Sa
	 mHcRNdc4y3QYltZSWPLLKYm9y/ljZzWuxQ8uofE/kKHsuctCmJus4VuaTH/+Ybkxf/eL5Pq7CNI2
	 XZJG2BBQYA01RBqMcOZ9ON+svdxhv5Douh5K8sfhez7NZ4tbQb0Mh5ygn+oKwduoL+eThyuKjaA+
	 dIE6VA+gLXeAgG8mNMm7Et+ZFAmJ/fdwK3/bD7SGTNzsrGt7lsWbM3RMft1qk8cljGRlf3MUfbBb
	 gxA1gaSAUHiZStaL3W1m4w6HI9PlpEJSYR0am7Vho89bsvxGIXytzgaLMZUDTnjyHXEAYmZIq99+
	 TR9Pey2zvQZlH+7gIPdPXzaHYIix/F9Efsfil56PBoUAXa59z5CzIjFXWhfFgXQpNHc/fRvJZ5fq
	 xBiBdujTd/V2z4vnG3rYQKZ+BYIH8BTULUBDRodKKcxE81NIaaSTWO7m7bgQgkZ6W3C/lcQVwaHa
	 dfDVIJdjKS2C5EDWi7Ba0vqtO1/Zpo4LXkEBkqk6vrbU2gISbRA0zk5wGWaX6R42YoIoFOi5tMfR
	 MXG3Pkm80ZLLK6Jx17e8d/b4c5wUUhsAIAIawIsXO0PZtsMVnwOelPUbWrQUK44B48Y8bBB8G7M7
	 c8Mnf1od80ULkU/CICmf9JDuTKEIJd3Oi/ZcrKEZHXDyT2m11X/DjAXu0XUs/mpv8LAo2If/uWm9
	 z2V5/sdIBedcRBxu0Bzu2bb0ixM+VYkaq998jA0miSiwsEb9fwIgoS96g+rIPEN7pJzZlUwVF/MS
	 e9p2wzu+vbiXMs5SqlMyi02PdvcitZYtLuRhYh6+sjWfpsqJb+A2tzpY/bqwtG6NWv0pqr6mI=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Charlie Jenkins <charlie@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Andy Chiu <andy.chiu@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH 0/3] RISC-V: mm: correct mmap behavior in sv48 address space
Date: Mon, 15 Jan 2024 03:55:41 +0800
X-OQ-MSGID: <20240114195541.275148-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240114_115638_529540_A10B80AA 
X-CRM114-Status: GOOD (  12.67  )
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

Previous patch series [1] violates the principle of mmap syscall as it uses
hint address as the largest address space to use rather than where to
create the mapping, thus broke the possibility to mmap in sv48, sv57
address space without a MAP_FIXED flag. This patchset corrects the behavior
of mmap syscall and use the behavior of x86 5-stage-paging as a reference.

I first noticed this issue when I was trying to run box64 on a sv48 system
with commit previous than [2]. Then I reported this through private
communication, then a box64 contributor did some investigation and found
that trying to mmap in sv48 address space without MAP_FIXED flag will
always return a random address in sv39. I review the changelog with some
tests on qemu and found this issue was introduced from [1]. After reviewing
the code, tests and docs, I think the original author might misunderstand
the meaning of hint address in mmap syscall. Then I did some investigation
on other ISAs like x86 which has 5-stage-paging and found that it has
addressed the same issue if some userspace software assumes the pointer
size should smaller than 47 bits and also solved in kernel by limiting the
mmap in maximum 47 bits address space by default.

Finally I correct the behavior of mmap syscall as x86 5-stage-paging does,
and migreate the documentation from x86-64 kernel to riscv kernel.


[1]. https://lore.kernel.org/linux-riscv/20230809232218.849726-1-charlie@rivosinc.com/
[2]. https://github.com/ptitSeb/box64/commit/5b700cb6e6f397d2074c49659f7f9915f4a33c5f

Yangyu Chen (3):
  RISC-V: mm: fix mmap behavior in sv48 address space
  RISC-V: mm: only test mmap without hint
  Documentation: riscv: correct sv57 kernel behavior

 Documentation/arch/riscv/vm-layout.rst        | 48 +++++++++++--------
 arch/riscv/include/asm/processor.h            | 39 ++++-----------
 .../selftests/riscv/mm/mmap_bottomup.c        | 12 -----
 .../testing/selftests/riscv/mm/mmap_default.c | 12 -----
 tools/testing/selftests/riscv/mm/mmap_test.h  | 30 ------------
 5 files changed, 36 insertions(+), 105 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
