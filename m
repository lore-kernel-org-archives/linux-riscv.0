Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4F3C25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=w3L0WxetYscFjy8PGVwxY+OVIPnAyjBqb64GJGkItnY=; b=yXoQzyb0EP9nqOG5LFl30+Dv6m
	OhFzjRGUsGR9y1DGRwxNHGcBzfvV3B9m/58IopHpCCzH1UkwP9mwcodiG2ZEYN95tbhfLSVJ7EmFw
	/sNJx2Ef/pQ2EbqA1v3HGwRSAwCnT4+CG+ZghAuioM2ZSwRuFjXIM6N2S9+mt2Z6d3kChgssdttFP
	wCa5rK3el+kVDqgRTHnHzXgma/CNqK8yl5EoMtKq7GvWnOPq56YfWS41kkbNxyaf8KUmKiW3p6Wxk
	41gfNMlije/2i5P9bqhVDUc4GNaJLo6ABWhl++RoZsm7hLcflrVCW112R+917Wwxl1UKvbmhaImqa
	AYSmB0Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aNh-00000001VDq-1w0b;
	Wed, 22 May 2024 01:03:01 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aM5-00000001U64-476o
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:01:36 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-66957d4e293so3010628a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339680; x=1716944480; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tXuQI7Rb82Ax963YHnFNfCPMg2TbL1f32XvNw+PdRZ4=;
        b=pqFJGeOE+2pVEi2hvuc6Y7W0Rx+vtYPweAbtG9L5OgldxshE5IQZkjqOZdA0o/fv26
         CzVnPSgD+PIfCx1iISqIq+VxsG0ax2J7wNXccB0Ps4poRhw9sDfTvabAV1v67ZCQY/PS
         BEYmdrXTSi7G+SHEVGT+7FZ0ggZPIGNFIFat2kIXSuf8tG2KfUtcT83FgNUX3OzM5NM0
         /+PKx1CpPHSWiIhIu79ai3xEMDGnGFiiKq2hKWqLkNu5xsWT9q0TDwTKymSPktfvljQz
         1CVdG+BhaSj0Oeq/WfAGFBiB4QwNjmyjulVtmm2Qnv/WTMYriwwYU1dp4UhHArSlymQp
         tPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339680; x=1716944480;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tXuQI7Rb82Ax963YHnFNfCPMg2TbL1f32XvNw+PdRZ4=;
        b=JbIRZ69SZREoK31uR+BhV5N9kSdOMV8qX/d6Wtw9eixt5ONl14Ch3queVfgSKEXADO
         FWFqvEVS45muKhDmHth1C3UM+3TxFMaSsEQ5oD+FEgT5KZWXkrTcDVvwRfSM8xswgeH1
         93gzB8ZO631b33vwWYvtYcfx1K4eW0FATKfRAYGXWPjFy9XQT+AJsVvXrVU6YyT+rhxd
         vdMDknawQzfD6cxUpWAh+d9kWvl9xpD+N+Lcu1Lt3W8IsLY9cjdlSLIzMNBOc/yiuRFt
         yz0lyfdUx/B9/yJtRYXg9yeg8TFQJ1bcB1gKBHUMzSBDs/bb0NOkxRPRpHYF2ojkEBBo
         LfBg==
X-Forwarded-Encrypted: i=1; AJvYcCWqNaYBEh3l2PbH99RHEkpaqBqhQsgw2msSzS3/F1lp2Bos5+GooKczz4FsJXC9m4vG5Pges6I5iy11l4tU7UP/hKX5oR6YVoZPkK7k3FUQ
X-Gm-Message-State: AOJu0Yzz0YhxXATAY+jr7Vs1AQU7d/3O/ECNcvjDQoUcHD+MeYLYkZ78
	+6QfZ17WkpDxdLldKaQ725MIJIzRZXofcXfQQ5jH5oUXrhIhEvqoAOiJHlAN4VSC9VI9EG9AoGR
	UDg==
X-Google-Smtp-Source: AGHT+IHKUKwbsVzLr9jgAiynMnCcN8AgBIIJwckaDWDAaS/0uV+IF6Nd/yvWpAr4baMiUsoE3FbLBWiXKVA=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a63:40c7:0:b0:66c:d006:9b62 with SMTP id
 41be03b00d2f7-6764d4fcf73mr1205a12.9.1716339680511; Tue, 21 May 2024 18:01:20
 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:23 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-38-edliaw@google.com>
Subject: [PATCH v5 37/68] selftests/net: Drop duplicate -D_GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_180122_244205_902F1982 
X-CRM114-Status: UNSURE (   8.92  )
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

-D_GNU_SOURCE can be de-duplicated here, as it is added by lib.mk.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/net/tcp_ao/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/tcp_ao/Makefile b/tools/testing/selftests/net/tcp_ao/Makefile
index 522d991e310e..c608b1ec02e6 100644
--- a/tools/testing/selftests/net/tcp_ao/Makefile
+++ b/tools/testing/selftests/net/tcp_ao/Makefile
@@ -26,7 +26,7 @@ LIB	:= $(LIBDIR)/libaotst.a
 LDLIBS	+= $(LIB) -pthread
 LIBDEPS	:= lib/aolib.h Makefile
 
-CFLAGS	:= -Wall -O2 -g -D_GNU_SOURCE -fno-strict-aliasing
+CFLAGS	:= -Wall -O2 -g -fno-strict-aliasing
 CFLAGS	+= $(KHDR_INCLUDES)
 CFLAGS	+= -iquote ./lib/ -I ../../../../include/
 
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
