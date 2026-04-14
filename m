Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EAFF531D0
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 03:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pGp5D8vwlZeBXECKHtIEkWNIKHpqw8WmYnjKqPcJiR8=; b=AdgOpY92b2GZ7B
	CA3YV4rQYHRWvn3p6E8y1ZgJZNTYC206c5MU5Aa4uH1B7j7WnXcPGfa4iXojX9Y6wlBhsUdsoEfm5
	z21oaEDIY4jQhe9WI4nFzNuaZciy0EOiMx5OkhtMYxKYjd2yHEfHDWwBvfMywLCYwfR2Uft6Lsv95
	5LazlZwhy20dJ5behpFYDbgPpbygK//pdaD3XOwh6VuzgDlv3AFo3/JgHInuJH1eyzzHZ98RKJT0M
	g/WYz6XTUw3GqpXYQ2cXXb10X8r3jRu//3OI5Pto7xrrN57b6aKg/YOBQwXzmHb9Hk+XZg0ZvgsDH
	2Rafj0C9cESScpg6MWRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUiN-0000000GfhS-0Xnv;
	Tue, 14 Apr 2026 03:45:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUiL-0000000Gfgx-1lMX
	for linux-riscv@bombadil.infradead.org;
	Tue, 14 Apr 2026 03:45:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=InYbmzu0LhOVxzCvOhL7w5tQA7Qr5roxBjUclg6lFhc=; b=gCpPOYEw971eyymaI7PZufMKsZ
	M+EsFeK5BgB64Vjk2DfvbB6Wennv3F91CmsSnN0ysx8FIoZ2TLfmnVYoyzdteSbBM+mXO8G3B3iw0
	1u98iTWeMsjmx+RLUkPx3VJY732bcbdknuvmeOCD55Pr9eXwSh+a6T+w+tq9rj12i1dMtfoni4FVG
	gftiObVzhCyzqe4L2K9KQQJKE2w/bIDQv/qXOcddXWRZ6aIRnTrv6CjbzChOauBiEAkY0fQk/3YLM
	80d4UvxM2hVIjGk91aBAhO5Zvw45eJVY/XksxYjQda2NPPOocT7i2xaS9UzUttQNE9yeaiPqf/aR5
	lXd2Q6iA==;
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUhz-00000000DXW-2ZL5
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 03:45:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1776138238;
	bh=InYbmzu0LhOVxzCvOhL7w5tQA7Qr5roxBjUclg6lFhc=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=c877n/ycVFwioaz9BCOoA1HK1xkddxvIkrBA6a0i7RQcCMaSUDlHYfLMHTvAO7Oki
	 L3mPijK7lUJsmZFutgXmKy0/FU7tl3INoV8U47GYEC07EX1RLGI/V53dFIvSuFxXpw
	 XuzLF1nZiykbfaYUhEQMwaTCSAzSZIhJDKpsN6LA=
X-QQ-mid: zesmtpsz5t1776138157t27d795e9
X-QQ-Originating-IP: 1lHqPqE89eQuvMv5Vq8A6d+wSfjEkGnUFlxIs8jjGCw=
Received: from snode5.. ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 14 Apr 2026 11:42:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11799666380509806706
EX-QQ-RecipientCnt: 26
From: Zane Leung <liangzhen@linux.spacemit.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	gregkh@linuxfoundation.org,
	alexander.shishkin@linux.intel.com,
	irogers@google.com
Cc: coresight@lists.linaro.org,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com,
	mchitale@gmail.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	andrew.jones@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	anup.patel@oss.qualcomm.com,
	mayuresh.chitale@oss.qualcomm.com,
	zhuangqiubin@linux.spacemit.com
Subject: [RFC PATCH 11/12] perf symbols: Add RISC-V PLT entry sizes
Date: Tue, 14 Apr 2026 11:41:52 +0800
Message-Id: <20260414034153.3272485-12-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
References: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MRPscMwXVhqxc3MrnyyLuSLozoLxndtu8zKJkqH1WhQwdGnqKfY84b4u
	oU4dvCLZZmBrYkFea8qH8i/oxZIlTb7Rj0ZFaxHpMbhbsZMKKqof3iKuS1riPl3o52U5FSU
	GaTjQYTezh6oCLK1xiFDeB3LQ6bRW78QFuUl5V5C865SQdtH4GzVcswWUJkpnh4oXMRlpJJ
	wRqWTo40R+SQQlUSwRbobCiZLlOswxtBvhMKMlD2DYRnypQUB4SaVoKp7oBH8LzLtQOc3QB
	q27IAaUaxQMt26K5epLT922k6OxNH5FJ+AWzSN2fZwuGBjLTX2s+TWv9OFrY35TV4C5+xwr
	/0p6d1twta2POygC2qyOLJMQAQjcOyhtlQL+IuP/RrWQFP+YWWgCGq/HAdKqI/QHbKt3ymR
	qohDFxmlp9owzXI8wBx+pBsXE3vTodNW97Tk8kLY1dPGeY07Ho5jkq+bW3bm4/pVEOYB4yf
	5H9Ll8ei9349T6g+oLxpEF0WO7+qp4yQQmN/juQ+1BXEzgzt0x0O/pwX4yGgwFT2aK3P1r6
	p+UxwwnfFWu7RqoMmxQjrcFtFvtNf0HVRbugR/QJO3rgKTdgpRbzg4ujf2LyaV/kYfn4+Zv
	T57iltUVEvacoFAQSUpvLtTeK+j1yFGxLhpPGqinndL5db0Blt21YTgEZh4/uI4QpLT3UMP
	TWVyrjmsw4ZvJOAUzZCSbsFBI9KgCnwz6nc+ZWGqoyALLz/9yLIo/LqOslUN7KEbPgBMNdE
	ROAF4l6JRJI9aAgL6wNA1mWAj8jItLFmBN7eSjWNHiYedQg185nUlc6h1nfp0AhLJKnIzr9
	gK1IVS3I3h6jlauM31IHE506zI4rkc9+/MNOM9R2N2TVrjzrHzih42ZyCCeb77PMvd8gz7E
	zdBoZvKwMGbsxEFak0ViDdc7RKFBStVZCu84mZdbPtKADzfawwbFnKNiHBAf3+pyYPWm5BE
	5vEnompLsZtoQ4Wa5ctH0o8wYLwSvFvkPJeR/0lUK0R+uYnqKwjnrge1TUOnaNr5dO43mdO
	T2SySF7pNNSQyLZ0StkoYd6GqihuB2FXlJk4isYk5SzB8UsPSzM2CEGvi/vCOSFZqQIeJox
	YsEb9LwfLtDDIzCeH3doX0YpHBMW4AL4HfQ55MHxDuj6f91JG9lggvPBoCwc04/+A==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_044506_925305_77389875 
X-CRM114-Status: UNSURE (   6.46  )
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

From: liangzhen <zhen.liang@spacemit.com>

Add PLT header and entry size definitions for RISC-V architecture.

RISC-V uses:
- PLT header size: 32 bytes
- PLT entry size: 16 bytes

This allows perf to correctly identify and display PLT symbols
instead of showing them as [unknown].

Signed-off-by: liangzhen <zhen.liang@spacemit.com>
---
 tools/perf/util/symbol-elf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/perf/util/symbol-elf.c b/tools/perf/util/symbol-elf.c
index 76912c62b6a0..e54ff59eb6ef 100644
--- a/tools/perf/util/symbol-elf.c
+++ b/tools/perf/util/symbol-elf.c
@@ -379,6 +379,10 @@ static bool get_plt_sizes(struct dso *dso, GElf_Ehdr *ehdr, GElf_Shdr *shdr_plt,
 		*plt_header_size = 32;
 		*plt_entry_size = 16;
 		return true;
+	case EM_RISCV:
+		*plt_header_size = 32;
+		*plt_entry_size = 16;
+		return true;
 	case EM_SPARC:
 		*plt_header_size = 48;
 		*plt_entry_size = 12;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
