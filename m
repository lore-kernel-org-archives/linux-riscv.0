Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD65606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 03:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CL3mQG9N;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=fkeqOZpE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LSfO8ZpX/Fpdg1oU86OkYRCvHO8ZhrAws+y1FyG3lCY=; b=CL3mQG9NWkKp3rRJpptg1yg84B
	okI9m/WC7Ix+XA4eFJbLlCFMSoU8zuv8cGgkc8Yo0o9+I9TNKtGHrHnmfhnTYyLXxssgX4K2/f8xW
	8tIgQYbQEKcykarqGgdasgXPBLmftIS4Ru6mWAG4Y7LtyvRIDWItdpbVWx8jaDbKb57b+9ntowUO9
	eG5uyiuH8vcmNtLojuk4pPLAuIgEy1br1Y2iLwF8SudfY04iQ0ZPogArR8QoRw65pj4u1VKVGoGbU
	Gf1RE9A3RgqbGmFwzJAeNLzLa/X6snbNtPWFepPOhIAtD+WpiAuJ7bTr9eTdQ1wz6/jkKg+GxrYno
	3+mDhctg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHCz-00000008HFw-2buy;
	Thu, 29 Oct 2026 03:53:45 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMHCw-00000008HDL-2ldE
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 03:53:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=4E
	vimmkLbEENi9mMSmhBHB4VvqJZ5Y7K64ru9liOtoY=; b=fkeqOZpER4SizIoayk
	P7iZxjXd/+qUXdzCF0VAcUkOHJZHUzuCcUaBEKOXtf1hOSklIyftwboWY0FZeIpR
	izJAY+9XLmoPDz/jT5D5tCUAE++8b1OSLb06xlTtFpwM30P5qP7cZZbGcbq+o6N6
	5duH1wYS4uzCwbdfWdfG5W3DU=
Received: from pc.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCnsSkVw+JqTWv_Cg--.16381S11;
	Thu, 29 Oct 2026 11:53:06 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Andrew Jones <andrew.jones@linux.dev>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 09/20] riscv: acpi: validate RINTC entries before use
Date: Thu, 29 Oct 2026 11:52:40 +0800
Message-Id: <20261029035253.2333852-10-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029035253.2333852-1-yaojiale02@163.com>
References: <20261029035253.2333852-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: PigvCgCnsSkVw+JqTWv_Cg--.16381S11
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWxKF1xAryfCr1UGr1rZwb_yoWDCrg_C3
	Z7Z34rWr9akFW0qr18J34rurW5Kw1fAF95Cr1avrWUGFn5J34aqrZxAr95AryvkrnYgan3
	Awn0k39F9r42vjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbgyCJUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQJMhmriwyLj-wAA3w
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_205343_045537_4E6D2FC9 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The RINTC callback reads flags and other fields from a typed MADT record
without checking that the complete record is present. A truncated
firmware entry can therefore cause out-of-bounds reads during CPU map
initialization.

Reject incomplete RINTC entries before accessing typed fields.

Fixes: f99561199470 ("RISC-V: ACPI: Cache and retrieve the RINTC structure")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 arch/riscv/kernel/acpi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index efd52a5d05b5..9e0658c6a869 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -171,6 +171,9 @@ static int acpi_parse_madt_rintc(union acpi_subtable_headers *header, const unsi
 	struct acpi_madt_rintc *rintc = (struct acpi_madt_rintc *)header;
 	int cpuid;
 
+	if (BAD_MADT_ENTRY(rintc, end))
+		return -EINVAL;
+
 	if (!(rintc->flags & ACPI_MADT_ENABLED))
 		return 0;
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
