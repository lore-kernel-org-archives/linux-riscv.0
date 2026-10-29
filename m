Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9EA606A31A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 12:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qb96BceI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bHTtW/Aw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=uN2uHyTEGqX9e8Tp1Z2jbgyruBTo1PTGyZLvm6K8Z8c=; b=Qb96BceIpCPnfjnzRFZGuWklJy
	eeLG70nEI3g/iC+h/sWoodqt2xxMand5B/dfGAsMm8/P+cFVe5DaaQXQ0euPQ4LZ5V18OzQUgPzds
	rHqZ0180pfC3u7v9ZAIYJZloHbTHJu0toRRCujqoxpfSazYNxwd7icqH35qpMVdbR8Lzhfyfil4Si
	h4QnPwIfKmyyOwcf1FnZe+QvOCs8zCAA+Nny3x/+4VoIRD2txze1YMZf4rvJNKCKla1Jd2S19Th7e
	dPcA6og0+HGg5WABnirfCullaU2QKaqb6+zFf9HpD0NGrprKj0w/9r9arryP+0cnqsfwabGRJrUK1
	r2lt8WEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOv7-000000097JS-15Vy;
	Thu, 29 Oct 2026 12:07:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOv5-000000097JB-28Jw
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 12:07:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B38AA43EFC;
	Thu, 29 Oct 2026 12:07:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F328D1F031E0;
	Thu, 29 Oct 2026 12:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793275666;
	bh=inpyt3Rrb7RnvCQP0qSRx5Fwr/dkOoWZ2t8y/zEuWDc=;
	h=From:Date:Subject:To:Cc;
	b=bHTtW/AwHG6+/BFJ+L/1jf66oFYksGYaLDFUeWlYTcG3ebpWd0N7xkISM9U+wzFuI
	 PRg46AV7Abokc4xSwhCusoHAQmjlLhoQrKv44fOCAG2SHgEJMXH3bgK/E9Ba3kOegN
	 fkHBHE290wcMT37tIN+db4CxQ+WOsNjQJ//K1m/opM7VPG+n5wwrxjwzSh8F4jCgWm
	 XhYn9cih1wSHQiCFtyR9pg9yLxow3eJ6iPic2mI7fCGYMHkCxTcEB/7TK1alGuunFs
	 md/ALlZya8X5hgJ3COOFAK4sAggoO8dhqDZycrUqNbNRKcalyQ/e9Wy7uf1/2eXaI4
	 yy62EUa5u8gMA==
From: Michael Ellerman <mpe@kernel.org>
Date: Thu, 29 Oct 2026 23:07:12 +1100
Subject: [PATCH] riscv: defconfig: Disable COMPAT_BRK
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-compat-brk-v1-1-5b2cf86eb453@kernel.org>
X-B4-Tracking: v=1; b=H4sIAO8242oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyNL3eT83ILEEt2komxdc3MzI7MUE9OkFJMkJaCGgqLUtMwKsGHRsbW
 1AL56+T5cAAAA
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Michael Ellerman <mpe@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1793275642; l=1793;
 i=mpe@kernel.org; h=from:subject:message-id;
 bh=M6mNXQk4Rnm5+SV8gIzGNpeDCGaYM+xtfU0KRGAdG6s=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgQtFOQ8VZI/Axk0Fks/N12S7JhYPye
 mYAoMsJQX+ym0QAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNRGYIVXiRV+Peg96k3unoeKtipr/oFog0mT6Q6xxwSXInD5thnx7G8DfjTcmB3mM5lbtme44y3
 OKVy5o/Mblgw=
X-Developer-Key: i=mpe@kernel.org; a=openssh;
 fpr=SHA256:xCm/G0UENYxMIqGzk+n5LBC6uWXo4GA2D0VGpX86Mrw
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

COMPAT_BRK defaults to y, which disables brk (heap) randomisation by
default (ie. randomize_va_space=1 by default) for compatibility with
"ancient" binaries, in particular libc5 based binaries.

libc5 predates RISC-V, so there can't be any libc5 binaries for RISC-V.

COMPAT_BRK was introduced in 2008, commit 32a932332c8b
("brk randomization: introduce CONFIG_COMPAT_BRK"). But even then the
only non-libc5 binaries mentioned as being broken were ~5 year old
versions of emacs (see commit c1d171a00294 ("x86: randomize brk")).

Distro kernels for riscv64 also disable it, including Debian, Fedora,
openSUSE and Ubuntu. So even if there were riscv binaries out there
that rely on it, no mainstream distro would support them.

Most other architectures already disable COMPAT_BRK in their primary
defconfigs, including arm64, x86_64, powerpc, s390, loongarch and
sparc64, as do the riscv nommu defconfigs. It is also disabled in
kernel/configs/hardening.config.

So disable COMPAT_BRK in the riscv defconfig so that brk is randomised
by default, matching distro and other arch configs.

Signed-off-by: Michael Ellerman <mpe@kernel.org>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511..933cbf2735ec 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -52,6 +52,7 @@ CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_BLK_DEV_THROTTLING=y
+# CONFIG_COMPAT_BRK is not set
 CONFIG_SPARSEMEM_MANUAL=y
 CONFIG_NET=y
 CONFIG_PACKET=y

---
base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
change-id: 20261029-compat-brk-77626d45bd4b

Best regards,
-- 
Michael Ellerman <mpe@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
