Return-Path: <SRS0=q2sy=AK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E777C433E6
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 03:19:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E111820702
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 03:19:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MdILcyH0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="SI3ZxUA9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E111820702
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yyGoZvCPRB13Kw4D0fAy0D4YpVVwmHYgo/iRo+/0Cnw=; b=MdILcyH0eS+cspFCu5B/qtDEz
	3QPO5fyt8kQ0uTsJpBkCHgqnQ9WcQKVti16B86DnT5ovSJnmIL7D4ACpE0NWzijvFi8wjaOblTBUx
	qeyJJCEstXto/uVHe51eX15DR3WTRGULsJuKPlFROM+6IvqOeqt/NldI1bgaq6iayd9UNN4tAHA7l
	oUQ47/kagentHQw0bUR3/eZcrT/BOYr2FxSjEu2qmmyWgdf+jKZOzPfyqKyIpTrRMwvfgf+bW8M5w
	/b4gHvtS+Ast8yvMH79Sc+8UljPX148i9m3BUDMDceNHo/is/fQJsmCoVl+pYZQ4Tz+CGkBVfvmgn
	YDPvs5p8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpkKP-00012L-PX; Mon, 29 Jun 2020 03:19:29 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpkKN-00011M-8Q
 for linux-riscv@lists.infradead.org; Mon, 29 Jun 2020 03:19:28 +0000
Received: by mail-pl1-x642.google.com with SMTP id f2so6531469plr.8
 for <linux-riscv@lists.infradead.org>; Sun, 28 Jun 2020 20:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PSUA2EwIKXLOLtNV96SGUJsM2m2OTdn3sR6o2KuM1UA=;
 b=SI3ZxUA9MsGFyjEOEhJDbIUFM4vZxkLrpUos41w1aNc7MaAAu/mg9tswobj1hVq6nO
 n5w/oWiSuHVskaRjPfz/DYSSKAo69a0PrXMKnQAjrWOEY0wDBSoXmkm4k7Jm9VsnqAoQ
 PZE6TLXel62BJhqpSuxlJeZuqxWsCiMOrvvFWxyT6dp5ARd5dbNIyEBrjvlt0J4zw4Ow
 7zOY1EJaov0Yqz+aFPfRjvelwlPxwgiKW2hOYARD9IM/vUoLjsy0xhp/42IDAt9ohhEK
 rp+We8aLf/9bHHgZsV59QFqMJLwL4Ia/rscQp0gz/62hnc8KHQnliaYb0FuSSnztGcWI
 sRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PSUA2EwIKXLOLtNV96SGUJsM2m2OTdn3sR6o2KuM1UA=;
 b=jhI95yTTguxj4V5ZG/VNdTUkkI+E+/M7yalKucuGF0sQPf9LfMr5FrqytkR++I2DXD
 gwGYUycOvhU3bc1j8BoDvXsFwxX0molecjlSmEwfqwh/GHecdEqpAWnwbOpecb8+pMQl
 MMbntw2ZcnXXbXzJerfG4+7dKTuycoC7G0UZ4nkH/M+eXk/7M/xQQxrUkjR2bwJCZRdp
 QxW0WT5QhKvZR9Zmt9sKOCynpo3UlcBdw2u1xEd0shh0oUukQicwvMfyA4YnSdepmnYS
 6ty3+lpaG21BSiIFYzTI3pDOy48tEeXrLWhI5G+LKeNQOev4sjjp0Fby4lbod++nk9vu
 Q6Hg==
X-Gm-Message-State: AOAM5336Wu43XFaXJ6yuCr3/WjEXmL1S0+eee5ip8u3DvIEE8EJC0gq3
 7XTXf1HDAMfiLLSBFENPaWMaOA==
X-Google-Smtp-Source: ABdhPJxbFHWw7jbZvnoyS2mNUkXDUMitESxb7srIaoRp/tgjSbxzNGBXmxyMtnMqIcEnC21YLuFAgQ==
X-Received: by 2002:a17:902:9047:: with SMTP id
 w7mr11534050plz.95.1593400765176; 
 Sun, 28 Jun 2020 20:19:25 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id j70sm12876254pfd.208.2020.06.28.20.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 20:19:24 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/6] riscv: add definition of hpmcounter CSRs
Date: Mon, 29 Jun 2020 11:19:12 +0800
Message-Id: <7301edd00542bf480539f2f00011be8d9cc76d3e.1593397455.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1593397455.git.zong.li@sifive.com>
References: <cover.1593397455.git.zong.li@sifive.com>
MIME-Version: 1.0
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
Cc: Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The hpmcounter CSRs are used for perf to read the value of monitoring
hardware events.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/include/asm/csr.h | 58 ++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index cec462e198ce..3a18a0bbdc6d 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -83,9 +83,67 @@
 #define CSR_CYCLE		0xc00
 #define CSR_TIME		0xc01
 #define CSR_INSTRET		0xc02
+#define CSR_HPMCOUNTER3		0xc03
+#define CSR_HPMCOUNTER4		0xc04
+#define CSR_HPMCOUNTER5		0xc05
+#define CSR_HPMCOUNTER6		0xc06
+#define CSR_HPMCOUNTER7		0xc07
+#define CSR_HPMCOUNTER8		0xc08
+#define CSR_HPMCOUNTER9		0xc09
+#define CSR_HPMCOUNTER10	0xc0a
+#define CSR_HPMCOUNTER11	0xc0b
+#define CSR_HPMCOUNTER12	0xc0c
+#define CSR_HPMCOUNTER13	0xc0d
+#define CSR_HPMCOUNTER14	0xc0e
+#define CSR_HPMCOUNTER15	0xc0f
+#define CSR_HPMCOUNTER16	0xc10
+#define CSR_HPMCOUNTER17	0xc11
+#define CSR_HPMCOUNTER18	0xc12
+#define CSR_HPMCOUNTER19	0xc13
+#define CSR_HPMCOUNTER20	0xc14
+#define CSR_HPMCOUNTER21	0xc15
+#define CSR_HPMCOUNTER22	0xc16
+#define CSR_HPMCOUNTER23	0xc17
+#define CSR_HPMCOUNTER24	0xc18
+#define CSR_HPMCOUNTER25	0xc19
+#define CSR_HPMCOUNTER26	0xc1a
+#define CSR_HPMCOUNTER27	0xc1b
+#define CSR_HPMCOUNTER28	0xc1c
+#define CSR_HPMCOUNTER29	0xc1d
+#define CSR_HPMCOUNTER30	0xc1e
+#define CSR_HPMCOUNTER31	0xc1f
 #define CSR_CYCLEH		0xc80
 #define CSR_TIMEH		0xc81
 #define CSR_INSTRETH		0xc82
+#define CSR_HPMCOUNTER3H	0xc83
+#define CSR_HPMCOUNTER4H	0xc84
+#define CSR_HPMCOUNTER5H	0xc85
+#define CSR_HPMCOUNTER6H	0xc86
+#define CSR_HPMCOUNTER7H	0xc87
+#define CSR_HPMCOUNTER8H	0xc88
+#define CSR_HPMCOUNTER9H	0xc89
+#define CSR_HPMCOUNTER10H	0xc8a
+#define CSR_HPMCOUNTER11H	0xc8b
+#define CSR_HPMCOUNTER12H	0xc8c
+#define CSR_HPMCOUNTER13H	0xc8d
+#define CSR_HPMCOUNTER14H	0xc8e
+#define CSR_HPMCOUNTER15H	0xc8f
+#define CSR_HPMCOUNTER16H	0xc90
+#define CSR_HPMCOUNTER17H	0xc91
+#define CSR_HPMCOUNTER18H	0xc92
+#define CSR_HPMCOUNTER19H	0xc93
+#define CSR_HPMCOUNTER20H	0xc94
+#define CSR_HPMCOUNTER21H	0xc95
+#define CSR_HPMCOUNTER22H	0xc96
+#define CSR_HPMCOUNTER23H	0xc97
+#define CSR_HPMCOUNTER24H	0xc98
+#define CSR_HPMCOUNTER25H	0xc99
+#define CSR_HPMCOUNTER26H	0xc9a
+#define CSR_HPMCOUNTER27H	0xc9b
+#define CSR_HPMCOUNTER28H	0xc9c
+#define CSR_HPMCOUNTER29H	0xc9d
+#define CSR_HPMCOUNTER30H	0xc9e
+#define CSR_HPMCOUNTER31H	0xc9f
 
 #define CSR_SSTATUS		0x100
 #define CSR_SIE			0x104
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
