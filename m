Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B30606A320
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2026 10:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2NW6S8Ff;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dykeEpYc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/Y6RXrwaKTl7TmbMCCxycdiV9S7GncNdLzkPasGfpwM=; b=2NW6S8FfYxEfYYaoKGHhDhR84H
	J/uIPbsSv8qisGmUwMM8q4fR6QBKiXKtDk7vs1XSWc4jqUglUglnJeCIQtEEUxyNS3+lG8RyOSPlV
	CnBD2N1e/UKTN6BgVWFaJNcE+R1JldrYAfsUm5hLqAvCa5am2vHmf4AMzZ3aN7ny4taEqSu9U0jDP
	SOxIANCPGTuF2sJNcRFIx4YwoEZZvw971/PuoOrBVP4w47FmQN28bj7zwTCvU2hXROrmD8o7buDEj
	ZZbYALt00EzTqYtmeQuMXeaq4oxX+NehNFYnPgPL19EEAF0/tRiUT9URfHmBDZNlDYfSNMbqU8t27
	o1pKvaRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUiU8-0000000H2iF-1IGw;
	Sat, 21 Nov 2026 10:38:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUiU7-0000000H2ht-14V6
	for linux-riscv@lists.infradead.org;
	Sat, 21 Nov 2026 10:38:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DB58C43CF3;
	Sat, 21 Nov 2026 10:38:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795257498;
	b=bxf6eHYjI/MJW0pI/cloCI7/ShxDTqBblypsvWxvHfgYe/v+lCIqU0CyooLR9vROiIs3
	 9pnKl42WtM6YiVygldUvUjxk49L1r0ocV+r7Lt7nmgQF6u2Uuj/CC6OMCqHVzEzixkHBP
	 mlOeSwa66Uw/6Z42VfaoDvncGe9XnrkGaHu68fEyqQLR1b2FmkHAoF65AqDM3ZLmmDJO3
	 noKfOAi6GTlbdggOXe1K0+gWZhjW9Lnic0UJuWFoaLLhsiJHZ48RmblgQF9Odj+Dd69ng
	 D//cR916LnQ5Xec3tdvWUnbPZlv/3TfmLRFhgWejM6EWPlhl9BFt3ZdS8K9EPTujDkw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795257498;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=W/y323rtHI4A6G9EZ6Uz12b8FGYlp7r0b2dLPeWwIb8=;
	b=kccpPT/vOWQu1Qa/OSmZ06BvbY3xsROUcwDn69sgNfoxFTsF3DhK/5YCvB3KTiwRNVse
	 HdPWyK6FgAS+FgbTgLJ0fFv1onkMUCiGbs8sDluLXFny3EZxU2yajYvonRgQ3n+ZcyH91
	 iFo+FQ14TfNija3G8r13ECKsf7fMXezzSnET2gntQp2Y/dObMUl6g+UakzF7aM7BNdprm
	 rK/jes1SQXxf2Zs/qeYB0d/SB5w81DQktwPJihRS35JW28JxDAWQtJDEAh6vgdNpIpt6w
	 TdUom2tmhYL8qKknL2MgYmfWr2G0hb+yFXhdJGn5Eid3cIkls1MYS2IgucwBFX90mdg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9065C1F000C4;
	Sat, 21 Nov 2026 10:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795257498;
	bh=W/y323rtHI4A6G9EZ6Uz12b8FGYlp7r0b2dLPeWwIb8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=dykeEpYcROTO59DQEUAkvm+1W5L4T2W957LzpyD79COQ8FYmQvk2WAY1uQJCTDoq5
	 Gu8jGvFqsK3pJHEh4oDGzv1CoHVAJIgRD+utEXQkgRFAPhjiiOImXakY5WS+x8nudX
	 x8smwr8dz1lLYpcm0em4sVbZ/WJZ6hL7uCpkKh98jeENBELfRSDNIHlcTdqovUMeEQ
	 Hw0uV4sB9ZOjJk6rXupSVAZlo43BE1klae57Rhq05LPVFkWUmptyo+mbUj8m+NDeGz
	 VyZ6fSf9Q0Qw6Rm4AjHl1c+amIw5V56vvdEbRwGDTFlXzLsKonK9TVQTobA1epTRGo
	 NINuzfwg6jsGQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 155EC4BBE3;
	Sat, 21 Nov 2026 10:38:17 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sat, 21 Nov 2026 18:38:07 +0800
Subject: [PATCH 1/2] riscv: efi: Map runtime MMIO with device attributes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261121-b4-sg2042-efi-rtc-v1-1-19898b8ad497@iscas.ac.cn>
References: <20261121-b4-sg2042-efi-rtc-v1-0-19898b8ad497@iscas.ac.cn>
In-Reply-To: <20261121-b4-sg2042-efi-rtc-v1-0-19898b8ad497@iscas.ac.cn>
To: Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Atish Patra <atish.patra@linux.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, linux-efi@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, sophgo@lists.linux.dev, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795257496; l=1030;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=AXs3CmUyHq0DbOalkM59cymNHEWwCflCrFagmnUXH40=;
 b=+R7iok8HWxtWVdFYvjuL61Ut91D/mbpDWKM53jRhVd4qqn7/sjzLv+Snse+8aZgLqEHJOOeid
 xXeqEtr/y3EDSWZSeiif9VMkcf+BUQn8NS0Qrt/IbRR23abw8rzSlfq
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

EFI_MEMORY_MAPPED_IO regions are mapped with PAGE_KERNEL, so device
registers end up mapped as normal memory.

On Milk-V Pioneer, GetTime() reads the clock controller registers and
faults:

  Oops - load access fault [#1]
  Workqueue: efi_runtime efi_call_rts
  status: 0000000200000120 badaddr: 0000007030012000 cause: 0000000000000005

Use PAGE_KERNEL_IO for these regions.

Fixes: b91540d52a08 ("RISC-V: Add EFI runtime services")
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/kernel/efi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/efi.c b/arch/riscv/kernel/efi.c
index 2d3cc57b4535..11e85d0ebc91 100644
--- a/arch/riscv/kernel/efi.c
+++ b/arch/riscv/kernel/efi.c
@@ -22,7 +22,7 @@ static __init pgprot_t efimem_to_pgprot_map(efi_memory_desc_t *md)
 	u32 type = md->type;
 
 	if (type == EFI_MEMORY_MAPPED_IO)
-		return PAGE_KERNEL;
+		return PAGE_KERNEL_IO;
 
 	/* R-- */
 	if ((attr & (EFI_MEMORY_XP | EFI_MEMORY_RO)) ==

-- 
2.55.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
