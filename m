Return-Path: <SRS0=vikP=Z7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B1BC43603
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2019 17:32:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2911A20836
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2019 17:32:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A3hF4I7p";
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vOpqIJ6q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2911A20836
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qigMm4EqiyANinCkFguk39Cl6HfqkkQUc4cgfeXf+Bk=; b=A3hF4I7pkaeqnz
	N2WczWHz39fcxLhLDyLgtIS08s4fz0BsX88tn+zhBU4k2cBZDyWrk2LEcrA8Q3arRfIpB2YswnoyY
	135AladjWW//mnq0CXxDQfCm7GYpDdOQpPnbrjvTFB7U/7P1yYJqmHsLEyiXHknF06NK5sxHrSnyZ
	mItx4a86EsVzFwZOumM/7DL16mXiydD5sdH8SRHyZfet1GJT9gdNUKeAZJUTbfFuG47kCDfY4Ny2O
	P0JMm2ORseNHZHdPlyyxiQIHS20bEOYPWq8bUxP3cijzWKYyKJYsdBtVPwzyN8CHH0zXjGkOgIZX+
	ELmdbQIpMtKWA1m8hw/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieMtL-0004bc-Gg; Mon, 09 Dec 2019 17:32:15 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieMtE-0004Tr-1L
 for linux-riscv@lists.infradead.org; Mon, 09 Dec 2019 17:32:09 +0000
Received: by mail-pj1-x1042.google.com with SMTP id z21so6166291pjq.13
 for <linux-riscv@lists.infradead.org>; Mon, 09 Dec 2019 09:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qigMm4EqiyANinCkFguk39Cl6HfqkkQUc4cgfeXf+Bk=;
 b=vOpqIJ6q75D7Put1Ibs+aBj9GoAdDjQOk0kztitX4aNnyO/uS5BEGTuVOgzGw3NuBq
 JhC61Pb0KNlCTr4SsK7zAwkA3PhZlEAIDpK9DHRPY9T8ODSc9+HqQ7xpE8Ta/uMp8QUW
 qHTBgLILsfFr+3JqxiF26oCYVBtFk2gGrj72WTrXW3GF5KB0cxTJi0xpP/oy4drKf1vA
 ZxqCN+fhD3HZ716kGXZCnQqRhyvSGhQg8vPxDf4XLKKz8GX+t7jFrKyhuLlHH/z8klwd
 Y91XRDVJEquj55w7xMkcNWqqJnBOyzRGmO3lrm7tXbKsPFW1J+nIqrjeMe6b3wBgC90K
 Ogaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qigMm4EqiyANinCkFguk39Cl6HfqkkQUc4cgfeXf+Bk=;
 b=jgM/YJJ3VR392MCowmPfqRpZ/cKiFL6iAgwUs6/amEuSCe5nD06wzFOkW6FvrK9A2/
 cUXFd2Zl9/loXpluSHW9A4TL0UWmFruWAlR68RqbydZTo7ZjAdqMhpxlRFoX3bp0enud
 YzCCZUZZqkj+1LbXzUJw0N6ltfriWXmCnjtpZQFTjZqBj9mQb2elz7Y9Fcxadyn0Mx14
 BRtA0SQLOeUqS/MW8ZopbI4L+iwL0Be/jtNBGEJuCiOizJx4EIZB1aDrXt1ZnOuU2Des
 CEuHBLzSQk04ZhZ9mwy12Q2qvLSlxatu843CieDc4PvngZ7URdig8PF82pv/qT3p62U6
 4BpQ==
X-Gm-Message-State: APjAAAVkEPGKlM2sGYBBsu6ES99MJp0vx+4kf2xcUQVf087MGlYyfgRF
 d+Zgh9QdRI/NUADrVc8G0V4=
X-Google-Smtp-Source: APXvYqyWxdQ0hJhMJ0rThrltp9ujToYcSdgDSDZcAlBK2cFpYYNKVR4Jr1SX1fsoeMJ7K9c2xhIJGA==
X-Received: by 2002:a17:902:ac8b:: with SMTP id
 h11mr30749482plr.87.1575912727095; 
 Mon, 09 Dec 2019 09:32:07 -0800 (PST)
Received: from btopel-mobl.ger.intel.com ([192.55.55.41])
 by smtp.gmail.com with ESMTPSA id d23sm54943pfo.176.2019.12.09.09.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 09:32:06 -0800 (PST)
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>
To: daniel@iogearbox.net,
	ast@kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH bpf-next 7/8] riscv,
 bpf: add missing uapi header for BPF_PROG_TYPE_PERF_EVENT programs
Date: Mon,  9 Dec 2019 18:31:35 +0100
Message-Id: <20191209173136.29615-8-bjorn.topel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191209173136.29615-1-bjorn.topel@gmail.com>
References: <20191209173136.29615-1-bjorn.topel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_093208_138486_44CC1B8D 
X-CRM114-Status: UNSURE (   9.43  )
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
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>,
 linux-riscv@lists.infradead.org, bpf@vger.kernel.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Add missing uapi header the BPF_PROG_TYPE_PERF_EVENT programs by
exporting struct user_regs_struct instead of struct pt_regs which is
in-kernel only.

Signed-off-by: Björn Töpel <bjorn.topel@gmail.com>
---
 arch/riscv/include/uapi/asm/bpf_perf_event.h | 9 +++++++++
 tools/include/uapi/asm/bpf_perf_event.h      | 2 ++
 2 files changed, 11 insertions(+)
 create mode 100644 arch/riscv/include/uapi/asm/bpf_perf_event.h

diff --git a/arch/riscv/include/uapi/asm/bpf_perf_event.h b/arch/riscv/include/uapi/asm/bpf_perf_event.h
new file mode 100644
index 000000000000..6cb1c2823288
--- /dev/null
+++ b/arch/riscv/include/uapi/asm/bpf_perf_event.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI__ASM_BPF_PERF_EVENT_H__
+#define _UAPI__ASM_BPF_PERF_EVENT_H__
+
+#include <asm/ptrace.h>
+
+typedef struct user_regs_struct bpf_user_pt_regs_t;
+
+#endif /* _UAPI__ASM_BPF_PERF_EVENT_H__ */
diff --git a/tools/include/uapi/asm/bpf_perf_event.h b/tools/include/uapi/asm/bpf_perf_event.h
index 13a58531e6fa..39acc149d843 100644
--- a/tools/include/uapi/asm/bpf_perf_event.h
+++ b/tools/include/uapi/asm/bpf_perf_event.h
@@ -2,6 +2,8 @@
 #include "../../arch/arm64/include/uapi/asm/bpf_perf_event.h"
 #elif defined(__s390__)
 #include "../../arch/s390/include/uapi/asm/bpf_perf_event.h"
+#elif defined(__riscv)
+#include "../../arch/riscv/include/uapi/asm/bpf_perf_event.h"
 #else
 #include <uapi/asm-generic/bpf_perf_event.h>
 #endif
-- 
2.20.1


