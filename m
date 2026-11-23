Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D49606A31E
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 09:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GspNDsVQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2wuF38czpBYWq+UCPmTXvYtoJ9aeB7SQUYqy1I20L9k=; b=GspNDsVQPxdWMVuTohRgp/kl8G
	hibTWrrn2kkTAcmiMZQuOrLv8Fk1sZYCvO/eFQgd24iPgHYraDh0Enp0r9lwyxQGkxCBhahGjG3Ry
	Wcaerf/kU+s/xTk8VWZhvRUPOWcjgE7CdOxlAlG9zNftQbMpLcMG8gZozb8noKv4qgSrt2c7K9obV
	1/kW5zrIF3MahU7UwKnhopzfJ8GLzGyGA+WKQsnteXCxoCLJ6HQe3bUxOuL2ActKhl7jFHzRBS9wQ
	Tq/c7gzeah+VWafEGV3YtKkDQ5FN2V9jqz9DRiIjaLD5RCnrT6OnspLcT96LNNS5Wp7EUIOjmlJms
	ZBRjCIHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQfg-00000002p0K-2LqY;
	Mon, 23 Nov 2026 09:49:12 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQfb-00000002ox4-3tBU
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 09:49:10 +0000
Received: from f3f1baf57000.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAAXr7QLDARryhPDAQ--.35445S2;
	Mon, 23 Nov 2026 17:48:59 +0800 (CST)
From: liutong <liutong@iscas.ac.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <apatel@ventanamicro.com>,
	linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] serial: earlycon: bail out on zero progress in SBI DBCN write
Date: Mon, 23 Nov 2026 09:48:43 +0000
Message-Id: <20261123094843.540808-1-liutong@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAXr7QLDARryhPDAQ--.35445S2
X-Coremail-Antispam: 1UD129KBjvJXoWruryUXFy5Aw48ZFyfury7trb_yoW8Jr4fpw
	129FyqyFW5tF1fZ3ZF9F15uFyrZa9rAry7KFyUCwnYv3sYqF4SkFW3ta4YgFyrJr97JF12
	kF4YyFWrA3Wjk3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26F4UJVW0ow
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07b818PUUUUU=
X-CM-SenderInfo: xolx301qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_014908_361329_F5B7DDA0 
X-CRM114-Status: GOOD (  11.75  )
X-Spam-Score: -1.9 (-)
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

sbi_dbcn_console_write() loops until all bytes are written and exits
early only on an error. When sbi_debug_console_write() returns 0 it
stays in the loop forever.

A zero return is not an error. Per the SBI specification, the call "may
do partial/no writes if the debug console is not able to accept more
bytes".

OpenSBI can return 0 here. Its semihosting console reports 0 when a host
write fails, and SBI passes that number back unchanged.

Fix the check to use <= instead of <, so that a zero return also ends
the loop.

Fixes: c77bf3607a0f ("tty/serial: Add RISC-V SBI debug console based earlycon")
Cc: stable@vger.kernel.org
Signed-off-by: liutong <liutong@iscas.ac.cn>
---
 drivers/tty/serial/earlycon-riscv-sbi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/earlycon-riscv-sbi.c b/drivers/tty/serial/earlycon-riscv-sbi.c
index 0162155f0c83..a8ffee389e15 100644
--- a/drivers/tty/serial/earlycon-riscv-sbi.c
+++ b/drivers/tty/serial/earlycon-riscv-sbi.c
@@ -29,7 +29,7 @@ static void sbi_dbcn_console_write(struct console *con,
 
 	while (n) {
 		ret = sbi_debug_console_write(s, n);
-		if (ret < 0)
+		if (ret <= 0)
 			break;
 
 		s += ret;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
