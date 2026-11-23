Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737AA606A31A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 18:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gY1pIWHl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bapmArYo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lf9ajtsQdKZS0zBtkaVWoEbYU9S+7VnQhFa+ySs3e/k=; b=gY1pIWHlfvvRPzKJyv16koJVwF
	KfNOJJ8ix5THyo82mvipI5zYM9UsdGFC9rEFZFp8qMTj4asjA+PD+RPsgdiAOu/s441PG/GFS5/p0
	i7pJ8j1YQXyNTKhB8GnMCVy+qabAdBKTM4Zh3+VEIw1MDUqGOyzP/p+rnX4c7l+I3S8+nLBDK9rS4
	ejU4MBq1ZlJUjv+TuDZ5vpQP6S55vEyMpwn9S4ocq71xe9m9k8mMEDhd2c8OcHkVlE2jE4vs6kI1C
	Xv44FXwNSgn9r6GpU7w3X1DYdHCXyDDeEBEXoJ4WB0DLilrbxceB1A4Mwr26GeCoKQRit87TpjPHq
	p3DHI9AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZ2e-00000004Z7C-40C1;
	Mon, 23 Nov 2026 18:45:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZ2E-00000004Yt3-0Xgh
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 18:45:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9288762455;
	Mon, 23 Nov 2026 18:45:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795459500;
	b=N0P+TM4sQJUhwvthYW+pnmKcAUuVbPGDla1fYuzR9h9YB+0Cd/meA4Xu5E61nHDsKHnh
	 iP/UGHWBXcWPGFtu24KXE3zsjGblZsz4aepUfllTsl9eGC6pYDPUlrZI/FXD9AzcM21Y6
	 2sJNOLg/BGKr0md/IrExo8DlHwPsa0rcFsvIixP/VUW0C6eyXEpEOuCe6PRtlpI/hU/Xj
	 +rCkabxGP+okHGi0dfYZX9JvhD4SO/kuVE7j1OIGh6XVu8eJA4ZbwJ3NYshQ0IRsVxbhZ
	 ZlEWgVcvj6Pbww9jlhZ2J4SQsY3ETPyROYe0xp5vmXA1P+FJCxjG80BVrpugrUErDgw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459500;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=2EyvKGJby7u96yUshyzbi6zLoTlKsi5MJp9yGQp9UFM=;
	b=KacazgLQriLukGCnq/Zc7MUjBEEx4jmDgU8dIcEahBYmkgg05LW+IybpxD6crgrO2mJM
	 Idta0qeZlZurctRBpd+f/KyJcq3L5NYqG0cWQtkh4iRLFcIdLn3mU54qUETr1Joi6z3RO
	 f0fJHK7GFklFEibYhpXXQg5xjpEj24TwSQtAHGauTv1PDckDYwi1HD+i70glv/PXgb3cv
	 wacyzYnxZnos0X0gpwlPlsVMX+Vn486J7F8ARN9jRoPPpInnJSeGIL2K5NGAV3NidxOOb
	 ugVdJppdVlSOCtRdf/LE37tXojY3a24Tj5ZE0kj33e06TxlOy06D/JZ7RGOxqu6O8PQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C66E31F000C0;
	Mon, 23 Nov 2026 18:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459500;
	bh=2EyvKGJby7u96yUshyzbi6zLoTlKsi5MJp9yGQp9UFM=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=bapmArYoZVCd+0TZEovhtrRe8XtyorxEpB2OmP5LjC9MR4Io3TBd9Rqoj/JZ7COlg
	 TVn9rrE6Nldpk7COU7pfnMi4pvZnBW06mpW0hPU1KjoKpPOsXzHw37+YR1nIiRU+vQ
	 8RhLpDO+rDsRuh3gvaj2AgmFjwJrOqbNyXCsVBXE6W20TN/FMZpgHH0Wg2jzKRvMx6
	 870LFIa/8qLhkEDRFHhdTfW63jRpHKOBS1guT5jl4t+YhcKsliTkyIAaT1nbg874KK
	 6YfkjFuSOUY4aUMhcBJq39Hs3jKwBfvUFRZNDH1SFauKGLG7h5Svq8ArO7pVSopv88
	 eqom/XzzkJ+Jw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 553294C5A7;
	Mon, 23 Nov 2026 18:44:52 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Tue, 24 Nov 2026 02:44:45 +0800
Subject: [PATCH] riscv: vdso: Define BUILD_VDSO
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261124-riscv-vdso-build-vdso-v1-1-c52b0b3592dc@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAJyJBGsC/yWMQQqAIBAAvyJ7TkjJir4SHSzXWogMlyQI/57Ub
 eYw8wBjJGQYxAMREzGFo4iqBCybPVaU5IqDrnWrlG5kJF6STI6DnC/a3Y/Wzb7rTWO98VDaM6K
 n+/uOU84vR63LbmcAAAA=
X-Change-ID: 20261124-riscv-vdso-build-vdso-adbf7854af5f
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459491; l=1289;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=dAS3hQxQuE0pYdjMaRRfsno7t7qwdj3jEoveU0f6oWg=;
 b=YPNE9RlZxuADbrEQ9JR/ChY+NDusx5Ei/QLKFb9cujFmClqvAns64uITCNJZzvn7HsRzmfE6L
 /PEZXb+MtO3AfClONlwsVevAQx7iL8yfowyl2z7/xMEydoxHkWkBNPB
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: gaohan@iscas.ac.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Han Gao <gaohan@iscas.ac.cn>

Unlike arm64, powerpc and others, riscv does not define BUILD_VDSO
for its vDSO build, so header checks on it never apply here.

The T-Head WRITE_ONCE errata needs it to keep its alternative out of
the vDSO. Otherwise booting with CONFIG_DEBUG_VIRTUAL=y hits
VIRTUAL_BUG_ON() in vmalloc_to_page().

Link: https://lore.kernel.org/linux-riscv/CAJF2gTQ+cOYfQX=JsK6T6Aij79FU9RGuyxAAouyL958z8ABqng@mail.gmail.com/
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
Tested with the WRITE_ONCE errata V6 in qemu -cpu thead-c906.
---
 arch/riscv/kernel/vdso/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index c023046a3fd75a95946babb96b3f9019ee2dec4a..b99645672634852df814e9d17c768bf82297079b 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -35,6 +35,7 @@ endif
 
 ccflags-y := -fno-stack-protector
 ccflags-y += -DDISABLE_BRANCH_PROFILING
+ccflags-y += -DBUILD_VDSO
 ccflags-y += -fno-builtin
 ccflags-y += $(CONFIG_CC_OPT_INLINE_MEMSET)
 ccflags-y += $(KBUILD_BASE_ISA)$(CFI_MARCH)

---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261124-riscv-vdso-build-vdso-adbf7854af5f

Best regards,
-- 
Han Gao <gaohan@iscas.ac.cn>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
