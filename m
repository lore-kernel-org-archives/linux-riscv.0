Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD96606A6A1
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 11:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cZTtKaIA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MP3x1Ccg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=COMmTDVfSf1ZTe/2Y8cLsPjTNi6Qe6jHoMMl2pQeGf0=; b=cZTtKaIA5gt82FknnCVXvc1nio
	XYhku1ZJVXdhCQDwzRAMYuaPwgVX73/ifAGPCw0pu18pKqA+HQIBK141hIDuX4lDLyY1cKSSUZe9v
	XaC+RAgiRwSjR9Xa00TSDceR61LL8W0+NB4bEnjTleWqosjlTcbiRgaImTX6KdXySv/TYKuyI303C
	1RwfBy0sCJYypjrgqAREm5mBcywp3iLJfYLCgehVCdrrN1uQhAMa3UiiqhM2ZUnVWgEzDbU/VIRbB
	McmIJUzZfoFlAG8CPoI3PZlS5DxczPHgwZ4ZX4auCtlHd4MfKRbGUzKBlEaths0Sb0qxyX25rgh0e
	9qePu9fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXRs-0000000CqCS-3Y4E;
	Thu, 26 Nov 2026 11:15:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXRZ-0000000Cpse-0z7U;
	Thu, 26 Nov 2026 11:15:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F014F44FDC;
	Thu, 26 Nov 2026 11:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F70E1F000D3;
	Thu, 26 Nov 2026 11:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795691712;
	bh=Pa/qSMCChRGH42K3rYTSztXsaxvBOYR3oBjTN9/+VqU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MP3x1CcgVdwXZovNmf2Ki608k9RA+upmwxLp4DhhwvWZFzw5QHNd1LujvDkgy5dqK
	 VudlIr+IQ0y5h01MkihEvEk+fN3u6e0wS395BMpBkuMKyfNQDtQIXifIJtscUMPgMn
	 mRMkfl5ZkqBv6Pnrvr3XlMzLeXxLL8XTGCTeQjY+DsJ0sPHkki4BSfureOMycyH4Ig
	 6F6k/5CR5+LLNSNVwEdIqxm8cn75nagz+yLvq8j0f6/pr5fLtiTxD0jmw41RAcqdG1
	 gDHYFA178/+99Xx/ijLHYcEFPmOPjXC5GwRv8Ar3G2pFnmTMGX0EXfDolIxf5QrwSJ
	 NJqE+CbJ3opQQ==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 26 Nov 2026 13:14:17 +0200
Subject: [PATCH RFC v2 04/54] s390/boot: stop parsing the command line at
 "--"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-generic-set-memory-v0-1-v2-4-723f1e33c3d8@kernel.org>
References: <20261126-generic-set-memory-v0-1-v2-0-723f1e33c3d8@kernel.org>
In-Reply-To: <20261126-generic-set-memory-v0-1-v2-0-723f1e33c3d8@kernel.org>
To: linux-mm@kvack.org
Cc: =?utf-8?q?Adrian_Barna=C5=9B?= <abarnas@google.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Borislav Petkov <bp@alien8.de>, Brendan Jackman <brendan.jackman@linux.dev>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 David Hildenbrand <david@kernel.org>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
 Ingo Molnar <mingo@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <pjw@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Vasily Gorbik <gor@linux.ibm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, x86@kernel.org
X-Mailer: b4 0.16.1-dev
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

The kernel parses its parameters up to "--" and passes everything after it
to init. The decompressor parses the whole command line, so an argument
meant for init still takes effect in the decompressor if it has the name of
a parameter the decompressor knows, like "mem=".

Stop at "--", like parse_args() does.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/s390/boot/ipl_parm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/s390/boot/ipl_parm.c b/arch/s390/boot/ipl_parm.c
index 8bbd102fa50f..ed28ea2fc1d1 100644
--- a/arch/s390/boot/ipl_parm.c
+++ b/arch/s390/boot/ipl_parm.c
@@ -268,6 +268,10 @@ void parse_boot_command_line(void)
 	while (*args) {
 		args = next_arg(args, &param, &val);
 
+		/* The arguments after "--" are for init */
+		if (!val && !strcmp(param, "--"))
+			break;
+
 		if (!strcmp(param, "mem") && val)
 			memory_limit = round_down(memparse(val, NULL), PAGE_SIZE);
 

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
