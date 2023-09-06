Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302CCEB8FB6
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 11:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9xgdKK6GP+o0CelyA3ECcxEHwjG77/Bn6sVGsM2YCrQ=; b=vc2K5h1Wc+7UA8
	tLGjBtXe3ALX6qRMp/mRXEXD/2l5grt6TluhSH3YrFInBcq9jetQ2K9jJksJR4u0BbCxYdBcPSUaI
	C8Dr8WicmJRqGDSExbAaUEAplqs2/W+lY0O2MDJ/zTbNy4qgjPg4QoCRbICB7jC1YMHKhjUaUthLg
	0D4tkFwKZvnkhwBjjsX4+eott4lmt60+WsFvCVzgxh/0YbDhVTyEyp4HLjSQfH/+EQqriS/mMZIoD
	rH9U9C2bfLZ18G9yEa0lkAXLJsfGxIwaJESSYmym3kVC8WJllCNOkUwDuUcXguTlCE9p770gWb/vs
	f+O6tl501iM9SyFSHWnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdqW4-008ais-1f;
	Wed, 06 Sep 2023 11:16:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdpOh-0083sl-2l;
	Wed, 06 Sep 2023 10:04:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=IGl4f8qSyJbybUV+DSgMG5FrEN4WC4Vxv72Dl1UPv4E=; b=BC3Uk8XbDaBA+gNNvrZaOM0CoY
	brg2Kjq4wVu0Xn07k9XEyF7T/Zignv0ZBL/7QOBfZKo8jcGOtNtH0nVkhTV3fGSr0Fp54Lg/FSWRu
	jie9q0n9OTOlIiINbgZjEYssxIHetXebzstSUxpL8zTT+n9/OKsxCJhgVINcitvZGa6fg2penkOVF
	67Ex3X1bjxuIXjOZdwb+Qtg7Qd7LM0pHxoiWA8x3HX7Bbk0/2UKMA9IWeKxK77i6AiKh8mVmSI030
	oeB96Km6ljnnvl9zETOCBWUWH2YlJaAeiHpsNuXwqJHD14UxfSPhV61beoqPYvH7JtrAypGTQZe1x
	00Vcx7ow==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdpOS-0012PP-17;
	Wed, 06 Sep 2023 10:04:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2C89360FDE;
	Wed,  6 Sep 2023 10:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE7CEC433BD;
	Wed,  6 Sep 2023 10:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693994649;
	bh=4qu6gNf1P779rn1wd4BnvavbHAx8Qh/H9OngrcT0avw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BTOvay+ljaBED9elt4djmeJQK4mwQhiBE2AFfBF+/Wba07j+eCNKbDlUWbg3RpBDw
	 hGmvsrZBZRQN6ojN6QuRL90gXHQ+S77viY+Jvpn1Zazw8J4hBnNjQ1X6wDu6RGm2aX
	 AT3/yya8ZgE+dq5MrLZZAwB8zm9nJjCGkcw+6J4Ums1J4F21+rxmhb8CnLXJ2qN9Dk
	 UNa5hTht1yl2vR5HK/8m2/4Us34yldYRFwpdsUf+oLFdiPUgJMas4iJPFr0DnvYDET
	 cdKEB0Q9J7lPiBpgo3FsBxD/iR4gzuy6loxD29M4zow3QzJOcIO4xsZUdExd/kTpTg
	 xhBKv1/AiWH2g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D673BEB8FB6;
	Wed,  6 Sep 2023 10:04:08 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Wed, 06 Sep 2023 12:03:25 +0200
Subject: [PATCH 4/8] x86 vdso: rm sentinel element from ctl_table array
MIME-Version: 1.0
Message-Id: <20230906-jag-sysctl_remove_empty_elem_arch-v1-4-3935d4854248@samsung.com>
References: <20230906-jag-sysctl_remove_empty_elem_arch-v1-0-3935d4854248@samsung.com>
In-Reply-To: <20230906-jag-sysctl_remove_empty_elem_arch-v1-0-3935d4854248@samsung.com>
To: Luis Chamberlain <mcgrof@kernel.org>, willy@infradead.org, 
 josh@joshtriplett.org, Kees Cook <keescook@chromium.org>, 
 Iurii Zaikin <yzaikin@google.com>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, Guo Ren <guoren@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-ia64@vger.kernel.org, linux-csky@vger.kernel.org, 
 Joel Granados <j.granados@samsung.com>
X-Mailer: b4 0.13-dev-86aa5
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=vL1EzsjYbFXKFrtK9nHJVvAi8tmBe++iatkzXK58byA=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBk+E6VLWSScWJxr1IbmgKPa1RZW7ObxI6WU/TSb
 /w1xzkBrsGJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZPhOlQAKCRC6l81St5ZB
 T411C/4nYVxay01MI0fYlh2tXeRCZT4XrLhFpLHSsLO88W+1QBZQtZ8gO2vM+93YWSmHFkQoCsR
 KcoJwZ+EkkMf8WsQfME5NZZe9QqAWa0BuN3fag7YtX7JeDKjC5MraH/M3Zm35qVZ29hSCd/4mDY
 8DDTvWypGbwepR7WT38A30v9LrG80iOyooAB06kaGaxwXBA3ii+b2P6VHUVMlvMLuWkUOyok6/z
 nA2x0x83Wvsq170HlyQKHOBwap14ZhJ6OPoFSyTWUr6U983PpnqsfDmTcYgdE+OARYk8x4Ngmcx
 IRZjjJbvj2Sm+tgS6ENeITYZVJd8V0y0m8MU6xbC9ZLpoWEJGxj6JLAvO/ZSPaiRekoLloMAteJ
 es6duh9rqCsTesV5rsulOZIo6tufJTM0rY9CFw8vaGH/f/Kt3xBuSdy2fhgoBSo+hfeoGpSsKyE
 sbPcJ2atpAF8XbaZ3GdfKliG0jmCzxzi14sxh9li2gbxkwNwKNDKPBCYFUWsOqoMQezN8=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for j.granados@samsung.com/default with auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_110418_350999_7D28B762 
X-CRM114-Status: GOOD (  13.94  )
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
Reply-To: j.granados@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Joel Granados <j.granados@samsung.com>

This commit comes at the tail end of a greater effort to remove the
empty elements at the end of the ctl_table arrays (sentinels) which
will reduce the overall build time size of the kernel and run time
memory bloat by ~64 bytes per sentinel (further information Link :
https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)

Remove sentinel element from abi_table2.

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 arch/x86/entry/vdso/vdso32-setup.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/entry/vdso/vdso32-setup.c b/arch/x86/entry/vdso/vdso32-setup.c
index f3b3cacbcbb0..37b761802181 100644
--- a/arch/x86/entry/vdso/vdso32-setup.c
+++ b/arch/x86/entry/vdso/vdso32-setup.c
@@ -66,8 +66,7 @@ static struct ctl_table abi_table2[] = {
 		.proc_handler	= proc_dointvec_minmax,
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_ONE,
-	},
-	{}
+	}
 };
 
 static __init int ia32_binfmt_init(void)

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
