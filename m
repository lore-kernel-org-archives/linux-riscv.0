Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D78A606A31B
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 03:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mqn1fRP+;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=nR6Cafaa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QEguCn83gy6rIRgSqRsVOn8biDnv3mhp/QmhPUvZIJ4=; b=Mqn1fRP+TGD0h3ddcCRcr4uGhY
	zhSSjAhD4q7HZarDGn/pInhvYQI54AeD3XdaYUhmEHuW2FPAD7KbYatSrLzNnFHub6lMkYrHisfo0
	dfL38Re33+Z16c48u6/f3LvQ+XR0bVGvccTEINBryAScCgGt6IOO3lRLH7idXxAaKPnkC/LSYWN+9
	mKjfDkHttncnXPA7CCS60EzwliRv70JR4ipvIWV3PccsDHVvd6IzrTw4kOdiRIzrwmdu7vcnz/LRK
	VheBDJQk/luerO72Qa7ESLgwgZ29tFnGw+wVmffo4O3uzV/hkf4CogLSaePTqwsXy5WH1QEuqYiPn
	xu78R9qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5nA-0000000FPHs-08Wn;
	Fri, 23 Oct 2026 03:18:04 +0000
Received: from smtp-usa1.onexmail.com ([52.205.10.60])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5n6-0000000FPBI-3p4m
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 03:18:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725428;
	bh=jems36ZyCMio5DHjWW4K3j7Cy2Dpa9yQxkXkkknhqG0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=nR6CafaaGuQQzqiTTirNnOmcF/lmZPomh7IcPj6sbd9wwEwkspuJv/V3NOhofTpqo
	 Jyi5X2JfT0XA+ko5nN8KBsTzRPE9eh3FObCzgEExnbYZQ5s0eOTKgovOUqZZqws0Pp
	 4WbtQp2rys0LQ7C3+6Bfrl+zc3N2Wb9XAKxNnkGc=
X-QQ-mid: esmtpsz11t1792725370te99b9679
X-QQ-Originating-IP: n7zbQ3yIL03qVRYiYpE6SuaL6NrmGcp6uGlDmpnv3xM=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:16:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8562332882774819472
EX-QQ-RecipientCnt: 26
From: Zane Leung <liangzhen@linux.spacemit.com>
To: gregkh@linuxfoundation.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	alexander.shishkin@linux.intel.com,
	suzuki.poulose@arm.com,
	mchitale@gmail.com,
	anup@brainfault.org,
	irogers@google.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	alex@ghiti.fr,
	atish.patra@linux.dev,
	andrew.jones@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	liangzhen@linux.spacemit.com,
	zhuangqiubin@linux.spacemit.com,
	coresight@lists.linaro.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/24] perf: Flag whether gtrace AUX data carries CoreSight framing
Date: Fri, 23 Oct 2026 11:14:57 +0800
Message-Id: <20261023031505.2020925-17-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
References: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MsvKKjAOQ1AaMhPI55VFTKrH2mVOONDTyOpg+ZB07am93l9YegJ6qziN
	Y/fsIDTSU3mVgcALgFM4m0KTlX/PWPYaw/TZOshQQ2jNTpfle22OmF15gvOmnLNtXS/rUYq
	mu57SP9gnnjcJAYhAR9Qu7QEmRqiuhcet/s0mBimyBHZc+ziYyvPusUpuagsvi3b2fEJMUE
	tcFGGgzyJi9knQ3LHvz/lj3ss5VfjaxaiijtRoTtQirs/av9xCufouG6AFFAIjaTKPu7LF/
	Ir+VrnCpdw33GjD2vx0ce5CswEeV8hQsZSy6xdTF9ESxllYi/Qj1IFG1Ne8MkH6r+g9UtgY
	ARoyofRzFUxFZ84OvXbfWVjCXI9iqizfDfktK9m+65ZYk7WaIkvpI2N1tFp4M9BZyUjvFRf
	lyTlQdYc70UFIJLiLQ28Nev/RwxPWE7EsmWpweoO9xwWuLnFlFSTZ4m3v673H/QmiZqaKPL
	h8li4MHYGnJrpKv2+sR4hU+Ms2fj64b6CRjIXC+paJm1XamnVHNva5FtUbmDzlt490vC+pt
	+x3QwPVKuFZF0IRbDTT8F4RO3rB96RXLdoiRJtIoVzWeqkxpyajMKLkxxgVuVfgPPM7nZSF
	/KPCdXjwS0nuWYz9RSOzYOWELQIckdhDRq8EsxOGS5NMN6klWKf/PQ0snkiYnDsAZYzlsAe
	SgvzlrI/v7mxZnR8mfOckKAHLnQwteJB6czF6bfC32jeX0vlGvxwdhe8khHIXK3DcS6Q06T
	oRY00cm4bmXarN1okc4SD/rp+TXM+w+NyApW1Q7GwxrUUWATP9LpdIMm5XQ6i5F4pGDr4Yd
	YEal/fjP2gF5iLl8gLaVNMTykwDqLB/O3PSDqiXUNJDuFMeNsaOI2mgtK1ZQFmUu+EJ+Apl
	59Sq3FAh4D1wZTh3B2mhau468bdciMS8WmVoXagBijSeLFVdHstt6sWwkkPrBP2UETYtM7k
	7Txxjq9olRXLYeF+yDc0cwoPTbzBIsuZBc0UWrnQPuurCE4oKbspS5bSgXqKILMJpsBJJNn
	JFe4eomLt/a/MwKEjwjYIpu6MtZj9cFlbY8oVWvhgaAD6pHgfhIVFO2qaJDEf5G/Pv4T+PX
	Xy4ys3eaG/o
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_201801_471636_BF8E0AEE 
X-CRM114-Status: UNSURE (   7.41  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Define PERF_AUX_FLAG_GTRACE_FORMAT_CORESIGHT for the gtrace format
which reports whether the data has been wrapped in CoreSight frame
formatting by a CoreSight sink.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 include/uapi/linux/perf_event.h       | 1 +
 tools/include/uapi/linux/perf_event.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index 2ac00a409a04..9d9ed2adc1d4 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -1315,6 +1315,7 @@ enum perf_callchain_context {
 #define PERF_AUX_FLAG_GTRACE_FORMAT_UNKNOWN	 0x0000
 #define PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE	 0x0100 /* RISC-V E-trace format */
 #define PERF_AUX_FLAG_GTRACE_FORMAT_NTRACE	 0x0200 /* RISC-V N-Trace format */
+#define PERF_AUX_FLAG_GTRACE_FORMAT_CORESIGHT	 0x0300 /* Trace with CoreSight formatted frames */
 
 #define PERF_FLAG_FD_NO_GROUP			(1UL << 0)
 #define PERF_FLAG_FD_OUTPUT			(1UL << 1)
diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
index 2ac00a409a04..9d9ed2adc1d4 100644
--- a/tools/include/uapi/linux/perf_event.h
+++ b/tools/include/uapi/linux/perf_event.h
@@ -1315,6 +1315,7 @@ enum perf_callchain_context {
 #define PERF_AUX_FLAG_GTRACE_FORMAT_UNKNOWN	 0x0000
 #define PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE	 0x0100 /* RISC-V E-trace format */
 #define PERF_AUX_FLAG_GTRACE_FORMAT_NTRACE	 0x0200 /* RISC-V N-Trace format */
+#define PERF_AUX_FLAG_GTRACE_FORMAT_CORESIGHT	 0x0300 /* Trace with CoreSight formatted frames */
 
 #define PERF_FLAG_FD_NO_GROUP			(1UL << 0)
 #define PERF_FLAG_FD_OUTPUT			(1UL << 1)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
