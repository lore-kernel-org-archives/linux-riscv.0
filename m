Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD1EEEB57D
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 10:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UPZ8TJl7nyhTbFNv0/BKYZldqiz+KLelyWGiVXhtXBg=; b=orzfHQAVnVY4LP
	lySvFAlOvX8q8pRWXkltnLvTDqc1/Gnrqlo2bkrYoUYIEudK73G/EzOTjqW74Ynk3xuiWH2YTNfC0
	htr0J8vsuAag5EwcOZCIhAj3mIcSzSfPiIeqQrabS1sp2pW9VAg0i9/UUWEOyfs9BxoNIgUq62equ
	FJA1m5ojOWIPG921O+Xy7uEVfJkoeY/jvA0tWW89JbG0gbetiJXXb8B3uNcNKBh3PQ+gLkGSRZG20
	YIOooJlRfrKmdMAIKe/ibTVzWNFEBDUkLe51hJsO61ISnzH2LeCGHaODhNXrodCS52KELy6CGaxWj
	WIPLAvPjS/tylvZm9WiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sogcw-0000000Ccp0-2T7h;
	Thu, 12 Sep 2024 10:00:38 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sogct-0000000Cco6-111I
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 10:00:37 +0000
Received: from ubt.. (unknown [210.73.53.31])
	by APP-03 (Coremail) with SMTP id rQCowABXho61u+Jmfr4GAw--.13301S2;
	Thu, 12 Sep 2024 18:00:22 +0800 (CST)
From: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
To: Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH] selftest/mm: Do not use hint for riscv mmap
Date: Thu, 12 Sep 2024 18:00:18 +0800
Message-Id: <20240912100018.736447-1-zhangchunyan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowABXho61u+Jmfr4GAw--.13301S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr1DCry3XFWkZF1xAFWDArb_yoW8Jw47pr
	97Gwn0kF1FqFnrJa1UXr17urWvkF1vqay0yr1Uu34S9r15Xr97uws7C3y7tFsxKFWrXrs3
	A3W0vw13uF4UX3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
	wI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvj
	DU0xZFpf9x07j5Z2-UUUUU=
X-Originating-IP: [210.73.53.31]
X-CM-SenderInfo: x2kd0wxfkx051dq6x2xfdvhtffof0/1tbiBwsSB2bif7X3hgAAsm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_030035_686343_6036DF02 
X-CRM114-Status: UNSURE (   8.78  )
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

When the virtual address range selftest is run on RISC-V platforms,
it is observed that using the hint address when calling mmap cannot
get the address in the range of that validate_addr() checks, also
that will cause '/proc/self/maps' have gaps larger than MAP_CHUNK_SIZE.

Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
---
 tools/testing/selftests/mm/virtual_address_range.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/testing/selftests/mm/virtual_address_range.c b/tools/testing/selftests/mm/virtual_address_range.c
index 4e4c1e311247..25f3eb304999 100644
--- a/tools/testing/selftests/mm/virtual_address_range.c
+++ b/tools/testing/selftests/mm/virtual_address_range.c
@@ -64,6 +64,14 @@
 #define NR_CHUNKS_HIGH  NR_CHUNKS_384TB
 #endif
 
+#if defined(__riscv) && (__riscv_xlen == 64)
+static char *hind_addr(void)
+{
+	return NULL;
+}
+
+static void validate_addr(char *ptr, int high_addr) { }
+#else
 static char *hind_addr(void)
 {
 	int bits = HIGH_ADDR_SHIFT + rand() % (63 - HIGH_ADDR_SHIFT);
@@ -81,6 +89,7 @@ static void validate_addr(char *ptr, int high_addr)
 	if (addr > HIGH_ADDR_MARK)
 		ksft_exit_fail_msg("Bad address %lx\n", addr);
 }
+#endif
 
 static int validate_lower_address_hint(void)
 {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
