Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E670C5CFCF
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 15:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FzJiXWSnT2mQMYjmaxjoht14+ZolX2CM34TEWGCP2ng=; b=GxVrdz0FCNnite
	nvYki6tFzj7MZwvhWxyE3YG1uF1NxjOuL8EYdfiBv8GVm1V/Ye/LMldUc8/BjhGxJ1OoCnbOaUq5u
	TQJUCEVAtzo2aooRCYX80Xpc3Vn7mcTpA0C0uV9QI8yx/YfXOWhTrK0CoRcjf4AU6wNcA9PGqeh6e
	cp1zue7jCcJ69cpxkFBTlfKlA/9BZ9CvQYZUt/QRdxWPEaqtWHodK3pEYQkhpuC2HbOUF9Kx9RQ6V
	egk4cqztw4+iZdlZCK8U8V+vHqFwE9Dul58CRXuby12HrvpV9dYlEQ1ZKV1WygsbzhhKANDAAmd85
	Ns8BSpS5Ymjl0yj8Y0mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXWL-000000013MI-32og;
	Thu, 13 Aug 2026 15:39:05 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXWH-000000013Ld-22nI
	for linux-riscv@lists.infradead.org;
	Thu, 13 Aug 2026 15:39:04 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowADnvPAL5X1q+Sh6BQ--.15943S2;
	Thu, 13 Aug 2026 23:38:51 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2 0/3] ACPI: RIMT: validate nested firmware extents
Date: Thu, 13 Aug 2026 23:38:51 +0800
Message-ID: <20260813153851.47947-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowADnvPAL5X1q+Sh6BQ--.15943S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr17XF1xKrWUCw4kWFWUXFb_yoW8Cw4kpr
	WfWFW5try8Jw4fK3yftw4jkF15urn3Jr47AF9xtwn7ZFn0qF4jkrWIk34IqanxGrn3Gw13
	Zr4FqFsruFy3CaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8Jw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcS
	sGvfC2KfnxnUUI43ZEXa7VUbo5l5UUUUU==
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_083901_902168_FB57D65C 
X-CRM114-Status: UNSURE (   5.73  )
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

RIMT consumers trust three separate layers of firmware data: the root
node area, the payload and arrays contained in each node, and cross-node
ID mappings.  Validating only the outer table does not establish the
bounds of either nested layer.

Split the validation by contract.  Patch 1 validates the root and node
envelopes while preserving unknown-node traversal.  Patch 2 validates
supported node payloads, arrays and the platform-device string.  Patch 3
validates exact destination-node references, mapping depth and ID
arithmetic.

Changes since v1:
https://lore.kernel.org/all/20260706094414.82794-1-pengpeng@iscas.ac.cn/
- split root, node-data and mapping-reference validation
- preserve unknown-node traversal compatibility
- require destination offsets to match exact node boundaries
- treat num_ids as a count, as specified by the RIMT definition
- keep the existing unchanged-ID result on mapping failure

Testing used Linux 3d6d817622b0 plus this series, GCC 13.3 and QEMU
8.2.2 for riscv64.  A temporary KUnit harness in rimt.c called the
actual static validation helpers; the harness is not part of this
series.  The acpi_rimt_bounds suite passed all three tests, covering
truncated table and node extents, invalid payload and array extents,
unterminated device names, interior node references, ID range and
addition errors, and a cyclic mapping chain.

This did not exercise a platform-provided RIMT table through the complete
boot-time discovery path.

Pengpeng Hou (3):
  ACPI: RIMT: validate table and node extents before traversal
  ACPI: RIMT: validate node payload and array extents
  ACPI: RIMT: validate mapping references and ID arithmetic

 drivers/acpi/riscv/rimt.c | 239 ++++++++++++++++++++++++++++++++++----
 1 file changed, 219 insertions(+), 20 deletions(-)


base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
