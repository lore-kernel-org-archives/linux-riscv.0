Return-Path: <SRS0=yqCT=HA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C356BC433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jan 2021 19:01:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56BD064E0F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jan 2021 19:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56BD064E0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vf6oKko2WKJQztGu5UvndVCPIFYjAJE4mXaajTW1IV8=; b=ObqKhA5UlFRxcd4RhovWwjaUC
	FOlxP0cVfHUAvHru38Zx818dtgT+37+jmUheFBb3PJ0E2ydCA5OXdo5oiASdE9BpAlJbI69cN8eUj
	BTe7Q1Ik+P/X1y26KWQVKgwuXf0w1FY1NfixwK4qdIMIR8+vqQab5JutkLeF8D3ZtyQ492mIqmw20
	yYPTH9OJSYaf4AdGMI7E+6KShwIeqlx5LCkBbBCvnv11mqMjanq8xdOahLNcRYPXTFp9OnVNv8vIh
	WIUX1TOQ1/T7465hC8avgIRDWibAfscrGGKzqSWhzsAtmvyG7g4B7DgXfbnEgjsHoDEuaWcpXwI9D
	SBRG0yt2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Z0u-0005ps-T9; Fri, 29 Jan 2021 19:01:00 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5Z0s-0005nv-B0
 for linux-riscv@lists.infradead.org; Fri, 29 Jan 2021 19:00:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1611946858; x=1643482858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vZldTM6FtX8zAz/82bg/iHZZ5vBv6DuboGd6Gv8CJL8=;
 b=oL7VIc9H9B5UBCgbHig82dB6aqz+iiytyJ8oIOnJ4lepMVrF3pkf7sFb
 mjF5QyOFEvoQxqsqnSB4JXSbqb6OhBbwiEDg070L9lLt4bzer80niyAZX
 xOOttb9Nk0THv026IgL/06MehQf0iKG9YWJwsowUCr5GrborkMwh7SanI
 /YPcigWH63zpiR24j33oQY/Al18AEAoIrqBTjTHHHuIXHA5j0HkffNTkj
 2vsusbRFz8PL2mqLyhncg3IuBp/etdRp3uIn5IHzX7pcVkIrn+PIpc/jf
 48mZUefH88rveN9GdcIE445XhG/KudBjgFOPBxzoHv5fipPDV3n8X1ykW w==;
IronPort-SDR: gOa7ve5lDtKjSB0kSCmprZzzJsPhx2hqelALKzjqbvGHGlFb4YOuQLR6nixxPN5O8X44GwAzHI
 JNdXJ3QpQN8Cgb+H4XAgRO8PF3jxlSHdYz25pqQr6gGyeFrc1780rceF15NTT+HFHZ5TlE29Km
 0kWf+irheKh6K3wd7H2ASUPZPbWjPiHCbsfhXHVLlZMoAeyd973bQIxcX32mhO1FFhY/IiJCnQ
 I6AREe3XzrvZGCkQSQ5pKKpYXiyF/nWxmt9UNFkx6K/r0yvSrgHVD5fyxjIQDC97KddJIhiSrM
 JBY=
X-IronPort-AV: E=Sophos;i="5.79,386,1602518400"; d="scan'208";a="158658726"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Jan 2021 03:00:55 +0800
IronPort-SDR: CYGOogNn+FQdDlroxSvrYMblYJIBWR6QySAq6z+zDraOscUiSz4M521rLvhx47YDx+9RM1Ofi4
 xq0Z8ymb81hvJRbgvGxkxsujsdmgav+Ee/mixD7EOSZWlDJHm1c5vOnv363jpA/g1zg9IoQM2L
 i9MGnW15Of9QUw3W8NdIS14JF7vE4Gr+qoKGyLywft583Du12X7OkSO1ALzXNKLIIbpu+EqNNa
 SwQszLvYFokvVT9Lsond9z3xXU4cmFYC2jOjab5iLuUIunr9dlFaftM9roYU4Ci78sWQNxqGJe
 Y9iDd+R6NGjen1+b1LPl5Buj
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2021 10:45:13 -0800
IronPort-SDR: X7WyXnjKJibRyNc4+vNza209iP55cN/v9duebfXYs8amH7iT/Ra1DehB6uI469L8Xnmul0jaIB
 I+wmhNaWhnz5h/LyjxqsGCGlxlWZEIkF7cRbaVhVU0OVaDi+4vRdhlRSjj9mjO59I/mY6PjKhu
 MSsLivXPJVksfaL60cymcOULpjF0lTkstBfW8Witwm5LSPD8uhlWbmaujTFcwcHn7/Cj/vvW98
 3Q3580JqBdbloVRkLIYZ5kLXDeGtaDRbph9cjFokOhUu5ro691OSA22QYK82h2nBXSyZ+YZMKm
 j80=
WDCIronportException: Internal
Received: from usa003967.ad.shared (HELO jedi-01.hgst.com) ([10.86.63.124])
 by uls-op-cesaip01.wdc.com with ESMTP; 29 Jan 2021 11:00:55 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] riscv: Align on L1_CACHE_BYTES when STRICT_KERNEL_RWX
Date: Fri, 29 Jan 2021 11:00:37 -0800
Message-Id: <20210129190038.1001626-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129190038.1001626-1-atish.patra@wdc.com>
References: <20210129190038.1001626-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_140058_546075_D1F869FA 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sebastien Van Cauwenberghe <svancau@gmail.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Nick Desaulniers <ndesaulniers@gooogle.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Sebastien Van Cauwenberghe <svancau@gmail.com>

Allows the sections to be aligned on smaller boundaries and
therefore results in a smaller kernel image size.

Signed-off-by: Sebastien Van Cauwenberghe <svancau@gmail.com>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/set_memory.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
index 211eb8244a45..8b80c80c7f1a 100644
--- a/arch/riscv/include/asm/set_memory.h
+++ b/arch/riscv/include/asm/set_memory.h
@@ -32,14 +32,14 @@ bool kernel_page_present(struct page *page);
 
 #endif /* __ASSEMBLY__ */
 
-#ifdef CONFIG_ARCH_HAS_STRICT_KERNEL_RWX
+#ifdef CONFIG_STRICT_KERNEL_RWX
 #ifdef CONFIG_64BIT
 #define SECTION_ALIGN (1 << 21)
 #else
 #define SECTION_ALIGN (1 << 22)
 #endif
-#else /* !CONFIG_ARCH_HAS_STRICT_KERNEL_RWX */
+#else /* !CONFIG_STRICT_KERNEL_RWX */
 #define SECTION_ALIGN L1_CACHE_BYTES
-#endif /* CONFIG_ARCH_HAS_STRICT_KERNEL_RWX */
+#endif /* CONFIG_STRICT_KERNEL_RWX */
 
 #endif /* _ASM_RISCV_SET_MEMORY_H */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
