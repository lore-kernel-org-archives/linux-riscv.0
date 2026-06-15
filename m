Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3157CD98CE
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 23:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I/P+pXCtodd7fC8IYtCqliK1hRMz5u1f+jaMrzqxwg8=; b=S2vvNDt6h62jyV
	JwXXeZx6SZosm5rd97ZTYtMv+hBGaf8vjfQZc2TgLSzL6qxH04F3L5WnRliFtUBR3trYIHlukioPA
	TVv7gAYz4ODi0EkA0RLTCLeDlVPJZQvwUCeC2iIEq05TGiBZvMtjWcdqoKLHqQiMezLlyAXYUN2cU
	hZiG1hHeQ5EH7h0L3cGUI4hIkUT4mWPndO/Jx4vutj87+vdo0gmSScU8nDY3Yr3SWxU2Eg0IrkvPd
	eJ7S5XZO1NugMkV1Bk+UCo83LfdFXfHRGHrAcsUOkHNG1m59RNvixP1mR/m9qTNAiTV0AVe0cHbKq
	S6dLgg5qUHU/jq7t2VtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGjW-0000000EwO2-1zq3;
	Mon, 15 Jun 2026 23:28:46 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGjU-0000000EwNZ-099P
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 23:28:45 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781566121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bFD7PCYKgMNlQ0jJPMmBIf9JeT90Xg327A7enHcLmAQ=;
	b=cVG44EW3QUCRCgsq2RqyhOsSP+ar7IZtxISVDRqexoye3m3MkwCuL4VwCJZ0tbO9jJUnfL
	sK6MpkXMKSuGR3NQorsVjOFspqTCHgR5OWb9dQobANunc+yi6tch6aA6sL59rHbfm7Vl4J
	OmKN5Y+VsweLxuoBzW/kEX6II7uKs5o=
From: Atish Patra <atish.patra@linux.dev>
Date: Mon, 15 Jun 2026 16:28:21 -0700
Subject: [PATCH 1/2] riscv: efi: Power off via EFI runtime services when
 available
MIME-Version: 1.0
Message-Id: <20260615-efi_reset_shutdown-v1-1-9414edcbbab0@meta.com>
References: <20260615-efi_reset_shutdown-v1-0-9414edcbbab0@meta.com>
In-Reply-To: <20260615-efi_reset_shutdown-v1-0-9414edcbbab0@meta.com>
To: Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Atish Patra <atish.patra@linux.dev>
Cc: linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Atish Patra <atishp@meta.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_162844_230122_427E303C 
X-CRM114-Status: UNSURE (   6.92  )
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

From: Atish Patra <atishp@meta.com>

When booted via UEFI with runtime services enabled, EFI Reset Shutdown is
the firmware-preferred shutdown path: it lets firmware run its own
shutdown hooks which may invoke SBI SRST extension internally. However,
RISC-V always powers off via the SBI SRST extension today and EFI runtime
path is never used even when firmware provides it.

Enable the poweroff via EFI by overriding efi_poweroff_required()

Signed-off-by: Atish Patra <atishp@meta.com>
---
 arch/riscv/kernel/efi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/efi.c b/arch/riscv/kernel/efi.c
index b64bf1624a05..2d3cc57b4535 100644
--- a/arch/riscv/kernel/efi.c
+++ b/arch/riscv/kernel/efi.c
@@ -95,3 +95,8 @@ int __init efi_set_mapping_permissions(struct mm_struct *mm,
 				   md->num_pages << EFI_PAGE_SHIFT,
 				   set_permissions, md);
 }
+
+bool efi_poweroff_required(void)
+{
+	return efi_enabled(EFI_RUNTIME_SERVICES);
+}

-- 
2.53.0-Meta


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
