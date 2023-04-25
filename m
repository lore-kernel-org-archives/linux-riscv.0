Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C26C6FD18
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Apr 2023 12:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=au46xpB6kt8SzIGM38NkKsgxBUxq4zSUc72Lrxz+UJ0=; b=tYgkjrP7J3rheE
	Y2rt29WvuoaJq9zikajGwknNtsQECjts5g7rJVK5d3Bqg/F/udMHIGy7G5jLuQJa6wUReM6clouEK
	IuuKkZjUtrN/i6eqBNLX3sfwm9jE+B0WvYpwxX0esD37xzGknHMBCr7sXwlBwPEwUX7c9nAw9+YHs
	ATsf1bQbtrDppXJO6sB2Q/6XYuHHG0ckjzabClKvdRw/J31MQSPWDc/S+/0yc35lP6tCEuI7v9sMK
	cKnMAYhlTc8QrZfuQ3dY8c0R0S+uHPe4JZBvumNjnLNSOUUU5I/MXvIPjezVB9k9y98M/IAL2H3tU
	Bq7gx1BfO/KalNhBiOnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prHMH-0011Rz-26;
	Tue, 25 Apr 2023 12:01:21 +0000
Received: from out162-62-57-137.mail.qq.com ([162.62.57.137])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prHME-0011P8-0B
	for linux-riscv@lists.infradead.org;
	Tue, 25 Apr 2023 12:01:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1682424069; bh=meMe2T6KKbX+l3+HBOMKvPki3tbvHHhySN0Qss7JmnY=;
	h=From:To:Cc:Subject:Date;
	b=XvBlS8uRpuJYUKwkU/Q6WNMEs7hnYhKWgoX+2Wdhr7SJm6WYB4/787HzpJzGsCCSw
	 i4J6c02h6jiu3kTO5GdYG3pw7ygLzvsXvQ97HpP56WY5asW0rFGtjpEpH6O22imgaY
	 Cgo16ruoCh4DwrgD+0sqAvvUXVmZgx+Lvlwq6Yao=
Received: from cyy-pc.lan ([2001:da8:c800:d084:c65a:644a:13d7:e72c])
	by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
	id 1235043; Tue, 25 Apr 2023 20:00:18 +0800
X-QQ-mid: xmsmtpt1682424018txcilf7bg
Message-ID: <tencent_1647475C9618C390BEC601BE2CC1206D0C07@qq.com>
X-QQ-XMAILINFO: MmpliBmRb3iCj/22F3Hkzg44Cma8g01zlNRT4DRJwi4CfhvQ5DYbNHtDz9LzPC
	 mnwGEhmCouvCVQvGtB0o9RBIZ2mqU7tJVVkrmdBy9jZfSCT0wAI3Htz7WCF005Xwr1S/QO2qDUJs
	 nlT3WXhuaV06q4Ag9f5yRvF2WIPkwXW24IZXF8Jvw1eTk7fgWDAthhZ8BVzCl1uilaad7w7w8L7h
	 Mgxh4x+F7nvNVwsgB1tOKneigLiV0J/jxGUQ/O6td/k+Gnev/yUnh3hDNiGaXeW6inDu2uvmGelv
	 HC1OkyBYHkabv9HJNP/4TZ2b4GBSlGQm1gK19LlimUp4lfVJyrV0NBk2eNPxgk/Bp+v2OTOLk5zM
	 WcOJC8j5TolnmjXyu2OB46Lt6WtGIVn5uV/xdfv+eqem9PAl4FWPy2/zYJIhNhJCOtobs01F4HFJ
	 c4ulEpwErguY3goPnfQYXTqFd1WtPm8794KUig73wkVCPKUwHmaXv3i8O3QrWqmzjqyZdK3YOXji
	 CpbGQPGLqjH3bvpQ5Rvmhis6wM2KM6OpUpySopq590lNv5YOPyPnSve28F/MqMoGc5b/IIBzRsrI
	 jpIHsHJmPN7POteRvPRREOQAJlwF4o9JN16aUycfO7kXGJ7WklbcavLifNv8g3k35TldJtuGugMc
	 UXthK+w4gJp40TF5n0+Mh+xUBAgcHpPLpKwy9ccHWbFYz7bK9IG+nrmzJuQ9FA3FWIzEF/r7JBcq
	 KL/NsfRE0jfZ3i7HAYwduBPWx+8hfVIHehBtANGV2gfNnbXFaYH0hQHiKwXJkw84IN1r652A3Hnn
	 8CqbgVuAH/QM45Hlw1dIBEKOnwt+0ux2G3kWhEs5rdVNTtZAZb2fcyzNfP6MMmdMpECdhhEspFoV
	 p6PRkVRn1yE4XVy1E/nlco3j1keqBTv097uIJsZ+emDz0Co3jeN0dQoU3Fs4b55cEDuiRX2G70mC
	 3mJBDy7Ip/+HyGV2rPTSuljU5Us7IUFnRWe/CGqoWB88a+CGSOb5EBjyR6vS5VK8JCO23M35whVF
	 rSdLPX+Qx13F+clTxuYeDJyiAMT88=
From: Yangyu Chen <cyy@cyyself.name>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wende Tan <twd2.me@gmail.com>,
	Soha Jin <soha@lohu.info>,
	Hongren Zheng <i@zenithal.me>,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH 0/2] Allow case-insensitive RISC-V ISA string
Date: Tue, 25 Apr 2023 20:00:14 +0800
X-OQ-MSGID: <20230425120016.187010-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_050118_575471_05AE8C74 
X-CRM114-Status: GOOD (  13.90  )
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

According to RISC-V ISA specification, the ISA naming strings are
case insensitive. The kernel docs require the riscv,isa string must
be all lowercase to simplify parsing currently. However, this 
limitation is not consistent with RISC-V ISA Spec.

The motivation for this patch series is that some SoC generators
will provide ISA strings with uppercase letters in the device tree.
For example, the rocket-chip will have "Zicsr_Zifencei_Zihpm_Xrocket"
in the ISA string. If we did not modify the ISA string manually, the
parser in the current kernel will have errors when the pointer meets
uppercase letters because it assumes the string only has digits, 
lowercase letters, and underscores. Then, the parser will fail and
the pointer of the parser will continue at the next position, which
will confuse the parser and cause the kernel to misbehave.

For example, "Zifencei" will be parsed as "ifc" since the parser will
fail at 'Z' and then continue at 'i'. Then, if we disable the FPU in
the CPU hardware and remove the "fd" from the device tree but leave
the CONFIG_FPU=y in the kernel, the kernel will panic at 
`__fstate_restore` function since the "Zifencei" (parsed as "ifc")
will confuse the current kernel that the CPU has "f", and the kernel
will save and restore the FPU registers during the context switch,
leading to illegal instruction exceptions.

However, it is not necessary to require the ISA string must be all
lowercase. The case-insensitive parser can be easily implemented
using `strncasecmp` and `tolower` functions. Moreover, the kernel
parser implementation should match the ISA specification rather than
using a more strict rule.

This patch series allows case-insensitive RISC-V ISA string:
* Patch 1 modifies the ISA string parser in the kernel to support
  case-insensitive ISA string parsing. It replaces `strncmp` with
  `strncasecmp`, replaces `islower` with `isalpha`, and wraps the
  dereferenced char in the parser with `tolower`.
* Patch 2 modifies the docs to no longer require the riscv,isa
  string to be all lowercase.

Yangyu Chen (2):
  riscv: allow case-insensitive ISA string parsing
  docs: dt: allow case-insensitive RISC-V ISA string

 .../devicetree/bindings/riscv/cpus.yaml       |  7 +++----
 arch/riscv/kernel/cpu.c                       |  6 ++++--
 arch/riscv/kernel/cpufeature.c                | 20 +++++++++----------
 3 files changed, 17 insertions(+), 16 deletions(-)

-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
