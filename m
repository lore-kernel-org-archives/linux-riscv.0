Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B48C4452B
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 00:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X+8hKqwKxtOcG8eQ8dimJE8AUBirzz/ui5jGQc1U2fk=; b=RHwqSYaKrsub2i
	0dfnBNRhkzP7bgC2Nt7pXKH4zvKrSL4+OlZ60m9l1oYxQSP+tPwT3UmUHQ2X9aOJSEq3MX4c8O/AF
	gNBO1NCu/IV3xfGQa+tg3N5DLh8InNDGGfQdEiVK/j92ZGbHlYltqd28vXGUwhKA774uItn227tmt
	caMx7yKQdKqv0MZoIy6r7n1RHfJM0WZrcWO2ZGQa/G/apHOhi3oF4MHjX+J4O+JnPDvnasAj0Jakr
	lfj/ju21L0d307UxAEN7b/+CRl700oq0QpvgMMnZVcqjHgnPd6/zkvkZxI3AFuDhB0PizdbmsssqP
	jDVOEwvLm66oDgguH2qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmLDV-0000000AfE6-1nKv;
	Wed, 22 Jul 2026 00:53:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmLDU-0000000AfE0-073p
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 00:53:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5824E4142D
	for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 00:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B88FF1F000E9
	for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 00:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784681623;
	bh=czGTILjPdNvnBenGx8SAYJSQ9/9/JFdl5M3AsxVU13c=;
	h=Date:From:To:Subject;
	b=RDVfO975FhtZOFPTLJ9kcjdbb5a/a78CyGcbTJuBtgt6+aon3/a64Dzor6kfHHLcy
	 d5BrIOWbEaTx7CijYnTgVAMMg0QrumiDG/x6eKvVbeZ4FFsCUyZUWIHJ7J9LY/V+G7
	 43LUhxVcno2eTKlqN8H6fBkIqVmJuWJT5d8VyNckXdhXWEuaUswxkpl5xa6vUQOUmY
	 3+DEB8tHZW6lFhWC4p8siAKvNsjZoCPgNmdvX51t9IA568VarBmVUoTmdPw5s4X6XD
	 c0CaaELrS6LKfsxmPukRxQze7ZM19M9bg+XZ0pR86BD1B6T+NlE5aB2FmpGVREX/MS
	 LQR+AiS1Qtz8Q==
Date: Tue, 21 Jul 2026 18:53:38 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: linux-riscv@lists.infradead.org
Subject: RISC-V experimental branch updated (tag: riscv-experimental-for-v7.3-2026072101)
Message-ID: <d7850ea9-3ef7-559e-d3e2-c5dcee7a4e0d@kernel.org>
MIME-Version: 1.0
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


Folks,

The riscv-experimental-for-v7.3-2026072101 has been pushed up to the 
pjw/riscv tree:

  https://git.kernel.org/pub/scm/linux/kernel/git/pjw/riscv.git/tag/?h=riscv-experimental-for-v7.3-2026072101

and the experimental/merged branch has been updated:

  https://git.kernel.org/pub/scm/linux/kernel/git/pjw/riscv.git/log/?h=experimental/merged

For more background on the purpose of the experimental tags and branches, 
see:

  https://lore.kernel.org/linux-riscv/8637881e-183e-940a-27a6-c3dc27d2df20@kernel.org/

The patches here are still under review and test, and they may or may not 
make it into riscv/for-next for v7.3.   The intention here is simply to 
increase our collective confidence level in what we're thinking about 
pushing into riscv/for-next in the future, including any conflict 
resolutions.

Please go forth and test, especially on hardware/emulation!  Thanks to 
anyone who can help out,
 

- Paul


The tag "riscv-experimental-for-v7.3-2026072101" contains patches from:

- experimental/counter-delegation-v8
- experimental/refactor-vector-context-v4
- experimental/reliable-unwinding-livepatch-v4
- experimental/rva23u64-v5
- experimental/ssqosid-v4
- experimental/vector-speed-probe-v1
- experimental/tlb-flush-opt-v2
- experimental/variadic-sbi-ecall-v2
- experimental/fix-kprobes-minimal-kernel-v1
- experimental/sbi-sse-v9

on top of today's riscv/for-next.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
