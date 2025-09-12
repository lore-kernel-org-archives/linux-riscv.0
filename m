Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BA8CAC582
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 19:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zm41KyPdzpiFbUFDmdkwqb+PySDvg/EFmKNCuGRgw+I=; b=j5dswGbY9WB3TL
	n4HUyZCEwETggu5vlQIMzVabOL3KGRCuoH+Pf1z/laMymIoubRHn3pGDrWxA4qcpxAQM5UOuRgaKK
	DdYi6tiENbD4bv/vgyxl+VUPI+5L5LJ4BOct0j272Tsq/+GteO9xwSX1b0haRcgdOPNIQ5lwYmGGM
	jAqF/RbqEOzPT7fU508HF9b5w4GgQ34zWKvwIcDvyigbVs4bvTOKm51EdzG6DHkYtv6IVhKRDdwWn
	W8Rab0eghzI0nJ5tqK5o5uUoZe2rjtPXbgCfOXoNr5uRID23iQq9Uw1RMx6oT3PQZ6Iui+6Krv8Lw
	pwj2is7X3ge17BYLH8SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux9qV-0000000BJCH-1f4u;
	Fri, 12 Sep 2025 19:54:11 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux9qS-0000000BJA1-2cYI
	for linux-riscv@lists.infradead.org;
	Fri, 12 Sep 2025 19:54:10 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45b9853e630so20496095e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Sep 2025 12:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757706847; x=1758311647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=crP5kybyDKEP1L3Fsm57wKH5BFdIt0syo+qIG2jEqhk=;
        b=BvKWosSPteyC+ovQyxNQ5UsM7hb76b3LdNmv6HX3XsiLHGY8ttReaUpErLZEKVKj2e
         G+lJQayoP9AxaYebT7nqsMeNf07+oHLtfTtfllUB0JBnptQGeStdEhxpvyi7+X5YiEoF
         7wXdLWmMsqzsdMfqIxEO6qjXXsB/HIgnyxk6SLkRn5FyClX/SKBzzfn3CG+OBztbjmMY
         siIHtlf7OmP7lkzP4DZ1U5olL6KVQpKo9abSj6iJP9ZAfe6iyRInNQS/DJ/WnNxGW/Nq
         qt/LR9sV/HXczdJKLfJCTkF8Zma+81XRzHp+rcO1/GV3QdgtAPoMKuGkYwXx1xszgDYb
         orIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757706847; x=1758311647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crP5kybyDKEP1L3Fsm57wKH5BFdIt0syo+qIG2jEqhk=;
        b=NJd+CVmajojJ+79IA11g8oeAX6Dkna9yO7I6PuN/Yp5jF2xZu7N+sx61fmGL/HyNvh
         kpIYcvGdUCXNcaFEnb8QIc4fHXNIjxW/Oz/HdkaQcKvvhAwaMDueSMd9Uy+jPgNChgAQ
         9MYYVjAgPBQxcWo9zUZD2DxEzIyDVmHppRPjRiW4VbGoEA4bgU2AxOu/aFkwuoNnvsxx
         Co9GNJA0XF/pQc8Fwdj66MtJmr+Zg08Wjqrh+T0DnT6HUYHli2Ic+NE4DKMCgUDjVXa1
         L04E25MJ4tigzXDxNq6pVyQY8VlRaHIMRU3dGByvDxrqFHMlLarTpJrRu51mU1wua8qc
         Mrkw==
X-Forwarded-Encrypted: i=1; AJvYcCU6Yd8yev7GeBDBnEYA8b0Be/y6slxNrdOa5fH3qjuxFFe8nVEJMt3TrKEAHq3s+OOTuKFBBaAn5goVag==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKCv405UfwdorWxv6uugV9PHPNszKHmjwgeNHpO2z78P8x6fhm
	7bWxrqGfin5zGqvJbV5ELMW9tlY6LJ79TQ4+oDNdT5xv2QSYmnnvvz21
X-Gm-Gg: ASbGncvKHwJewM3jJh3fUTQF2xebT8w+J8vFDaw7oDIj/2yj35m95/shoCy34zBZL53
	21CZNBAU+IuUCVDeYCXaRa90WTEDOyb0OFU3/yvaxpc7nfpkv47oedpiiyzp2mUwQ3RSU9Tlyan
	eq0iu4iQ3E7FNowLvLr95kZvTqmdLpvoXzD0fdBrOYIFhXEGmnVKi0kdz6+/WUcAzGXSLzIucf4
	XPKpTRiFC1FnauFEAnouMQtVAAQLFmJLWJBmHckNABeDb1gCoOvXJVn8esSn/DS0Uoo2I6o10Ec
	xpA7R2Ae5mPV1gG6MXfshCmmzLXWzpfQdGx8yyC/g9j1gYV6eU4vESNaCCkVQvuPUoRSqn5ViJU
	/9pb8FWmSSaJvAdW54iCHnmNJYOHowxTl4vq+4We9MRW2KZ+w3PmGrXXGis1SZvu3I/J8VrQYk7
	/+3rh7gDY=
X-Google-Smtp-Source: AGHT+IHYbSxBKDnneqMGe4B4GqdstQRPwP2TMBkU5KGjwaP3qxT6Gii/ajCV1viHAEQt0HDASC1PLw==
X-Received: by 2002:a05:6000:40cb:b0:3da:d015:bf84 with SMTP id ffacd0b85a97d-3e7659cc7e2mr4361632f8f.25.1757706846599;
        Fri, 12 Sep 2025 12:54:06 -0700 (PDT)
Received: from yanesskka.. (node-188-187-35-212.domolink.tula.net. [212.35.187.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017bfd14sm74650375e9.21.2025.09.12.12.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 12:54:06 -0700 (PDT)
From: Yana Bashlykova <yana2bsh@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Cc: Yana Bashlykova <yana2bsh@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	bpf@vger.kernel.org,
	llvm@lists.linux.dev,
	lvc-project@linuxtesting.org
Subject: [PATCH 6.1 10/15] selftests: net: genetlink: add packet capture test infrastructure
Date: Fri, 12 Sep 2025 22:53:33 +0300
Message-Id: <20250912195339.20635-11-yana2bsh@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250912195339.20635-1-yana2bsh@gmail.com>
References: <20250912195339.20635-1-yana2bsh@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_125408_729841_82508853 
X-CRM114-Status: GOOD (  15.37  )
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

Add test cases for monitoring Netlink traffic during test execution

Require CONFIG_NLMON.

Signed-off-by: Yana Bashlykova <yana2bsh@gmail.com>
---
 tools/testing/selftests/net/Makefile    |   6 +
 tools/testing/selftests/net/genetlink.c | 234 ++++++++++++++++++++++++
 2 files changed, 240 insertions(+)
 create mode 100644 tools/testing/selftests/net/genetlink.c

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 69c58362c0ed..0c325ccc5f03 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -71,6 +71,7 @@ TEST_GEN_FILES += bind_bhash
 TEST_GEN_PROGS += sk_bind_sendto_listen
 TEST_GEN_PROGS += sk_connect_zero_addr
 TEST_PROGS += test_ingress_egress_chaining.sh
+TEST_GEN_PROGS += genetlink
 
 TEST_FILES := settings
 
@@ -82,3 +83,8 @@ $(OUTPUT)/reuseport_bpf_numa: LDLIBS += -lnuma
 $(OUTPUT)/tcp_mmap: LDLIBS += -lpthread
 $(OUTPUT)/tcp_inq: LDLIBS += -lpthread
 $(OUTPUT)/bind_bhash: LDLIBS += -lpthread
+
+$(OUTPUT)/genetlink: LDLIBS += -lnl-3 -lnl-genl-3
+$(OUTPUT)/genetlink: CFLAGS += $(shell pkg-config --cflags libnl-3.0 libnl-genl-3.0)
+
+EXTRA_CLEAN := $(SCRATCH_DIR) $(OUTPUT)/genetlink.pcap
diff --git a/tools/testing/selftests/net/genetlink.c b/tools/testing/selftests/net/genetlink.c
new file mode 100644
index 000000000000..5be9ca68accd
--- /dev/null
+++ b/tools/testing/selftests/net/genetlink.c
@@ -0,0 +1,234 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Generic Netlink and Netlink test cases
+ *
+ * This test suite validates various aspects of Generic Netlink and Netlink communication
+ *
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <errno.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <ctype.h>
+#include <sys/wait.h>
+#include <time.h>
+#include <inttypes.h>
+#include <signal.h>
+#include <netlink/netlink.h>
+#include <netlink/genl/genl.h>
+#include <netlink/genl/family.h>
+#include <netlink/genl/ctrl.h>
+#include <netlink/genl/mngt.h>
+#include <linux/genetlink.h>
+
+#include "../kselftest_harness.h"
+
+#define MY_GENL_FAMILY_NAME "TEST_GENL"
+#define MY_GENL_CMD_UNSPEC 0
+#define MY_GENL_CMD_ECHO 1
+#define MY_GENL_CMD_SET_VALUE 2
+#define MY_GENL_CMD_GET_VALUE 3
+#define MY_GENL_CMD_EVENT 4
+#define MY_GENL_CMD_NO_ATTRS 5
+
+#define MY_GENL_SMALL_CMD_GET 0
+
+#define MY_GENL_ATTR_UNSPEC 0
+#define MY_GENL_ATTR_DATA 1
+#define MY_GENL_ATTR_VALUE 2
+#define MY_GENL_ATTR_PATH 3
+#define MY_GENL_ATTR_NESTED 4
+#define MY_GENL_ATTR_MAX 4
+
+#define THIRD_GENL_FAMILY_NAME "THIRD_GENL"
+
+#define THIRD_GENL_CMD_ECHO 1
+
+#define THIRD_GENL_ATTR_UNSPEC 0
+#define THIRD_GENL_ATTR_DATA 1
+#define THIRD_GENL_ATTR_FLAG 2
+#define THIRD_GENL_ATTR_MAX 2
+
+#define PATH_GENL_TEST_NUM "/sys/kernel/genl_test/value"
+#define PATH_GENL_TEST_MES "/sys/kernel/genl_test/message"
+#define PATH_GENL_TEST_DEV "/sys/kernel/genl_test/some_info"
+#define PATH_PARALLEL_GENL_MES "/sys/kernel/parallel_genl/message"
+#define PATH_THIRD_GENL_MES "/sys/kernel/third_genl/message"
+
+#define MY_MCGRP_NAME "MY_MCGRP_GENL"
+
+#define GENL_CTRL "nlctrl"
+#define CTRL_ATTR_POLICY_MAX (__CTRL_ATTR_POLICY_DUMP_MAX - 1)
+
+#define PARALLEL_GENL_FAMILY_NAME "PARALLEL_GENL"
+#define PARALLEL_GENL_ATTR_UNSPEC 0
+#define PARALLEL_GENL_CMD_SEND 1
+#define PARALLEL_GENL_CMD_DUMP_INFO 2
+#define PARALLEL_GENL_CMD_SET_VALUE 3
+#define PARALLEL_GENL_CMD_GET_VALUE 4
+
+#define PARALLEL_GENL_ATTR_DATA 1
+#define PARALLEL_GENL_ATTR_BINARY 2
+#define PARALLEL_GENL_ATTR_NAME 3
+#define PARALLEL_GENL_ATTR_DESC 4
+#define PARALLEL_GENL_ATTR_FLAG_NONBLOCK 9
+#define PARALLEL_GENL_ATTR_FLAG_BLOCK 10
+#define PARALLEL_GENL_ATTR_PATH 12
+#define PARALLEL_GENL_ATTR_MAX 12
+
+#define LARGE_GENL_FAMILY_NAME "LARGE_GENL"
+
+/*
+ * Test cases
+ */
+
+/**
+ * TEST(capture_start) - Starts Netlink traffic capture using nlmon interface
+ *
+ * Creates a virtual nlmon interface, enables it and starts packet capture
+ * with tcpdump. Captured packets are saved to 'genetlink.pcap' file.
+ *
+ * Note:
+ * - Requires root privileges
+ * - Creates temporary interface 'nlmon0'
+ * - Runs tcpdump in background
+ * - Adds small delay to ensure capture starts
+ */
+
+TEST(capture_start)
+{
+	printf("Running Test: starting Netlink traffic capture...\n");
+
+	// Only root can monitor Netlink traffic
+	if (geteuid()) {
+		SKIP(return, "test requires root");
+		return;
+	}
+
+	char command[256];
+	int result;
+
+	snprintf(command, sizeof(command), "ip link add nlmon0 type nlmon");
+	result = system(command);
+	ASSERT_EQ(WEXITSTATUS(result), 0);
+	if (result == -1) {
+		perror("system");
+		return;
+	}
+
+	snprintf(command, sizeof(command), "ip link set nlmon0 up");
+	result = system(command);
+	ASSERT_EQ(WEXITSTATUS(result), 0);
+	if (result == -1) {
+		perror("system");
+		return;
+	}
+
+	snprintf(command, sizeof(command),
+		 "tcpdump -i nlmon0 -w genetlink.pcap &");
+	result = system(command);
+	ASSERT_EQ(WEXITSTATUS(result), 0);
+	if (result == -1) {
+		perror("system");
+		return;
+	}
+
+	printf("nlmon is up. Starting netlink process...\n");
+
+	sleep(2);
+
+	printf("Starting Netlink tests...\n");
+}
+
+/**
+ * TEST(capture_end) - Terminates Netlink traffic monitoring session
+ *
+ * Performs controlled shutdown of nlmon capture interface by:
+ * 1. Stopping tcpdump capture process
+ * 2. Bringing down nlmon interface
+ * 3. Deleting nlmon interface
+ *
+ * Test Procedure:
+ * 1. Privilege Check:
+ *    - Verifies root privileges (required for nlmon operations)
+ *    - Gracefully skips if not root
+ *
+ * 2. Capture Termination:
+ *    - Stops tcpdump process (2-second delay for cleanup)
+ *    - Brings nlmon0 interface down
+ *    - Deletes nlmon0 interface
+ *    - Validates each operation succeeds
+ *
+ * 3. Cleanup Verification:
+ *    - Checks system command exit statuses
+ *    - Provides detailed error reporting
+ *
+ * Key Validations:
+ * - Proper termination of monitoring session
+ * - Correct interface teardown
+ * - Root privilege enforcement
+ * - System command error handling
+ *
+ * Expected Behavior:
+ * - tcpdump process should terminate successfully
+ * - nlmon0 interface should deactivate cleanly
+ * - Interface should be removable
+ * - Non-root execution should skip gracefully
+ *
+ * Security Considerations:
+ * - Requires root for network interface control
+ * - Ensures complete capture session cleanup
+ * - Verifies proper resource release
+ *
+ * Note:
+ * - Should be paired with capture_start test
+ * - Includes 2-second delay for process stabilization
+ * - Provides status feedback through printf
+ */
+
+TEST(capture_end)
+{
+	printf("Running Test: stopping Netlink traffic capture...\n");
+
+	// Only root can monitor Netlink traffic
+	if (geteuid()) {
+		SKIP(return, "test requires root");
+		return;
+	}
+
+	char command[256];
+	int result;
+
+	sleep(2);
+
+	snprintf(command, sizeof(command), "pkill tcpdump");
+	result = system(command);
+	ASSERT_EQ(WEXITSTATUS(result), 0);
+	if (result == -1) {
+		perror("system");
+		return;
+	}
+
+	snprintf(command, sizeof(command), "ip link set nlmon0 down");
+	result = system(command);
+	ASSERT_EQ(WEXITSTATUS(result), 0);
+	if (result == -1) {
+		perror("system");
+		return;
+	}
+
+	snprintf(command, sizeof(command), "ip link delete nlmon0 type nlmon");
+	result = system(command);
+	ASSERT_EQ(WEXITSTATUS(result), 0);
+	if (result == -1) {
+		perror("system");
+		return;
+	}
+
+	printf("The capturing is over\n");
+}
+
+TEST_HARNESS_MAIN
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
