Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131E2CA0FE7
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 14:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ur32O8lVD5YFcZ1/ZMAkjAgpvCmhLBh2cL7fEZWy0Vg=; b=o0imY0o9nLkSyH
	Ai5SshU1E0iQBViCBjezp7n8m+mOVImu6pAig6B7WjXOOr+q2j3cs8x5t99wveYfMjjedaKBUWcOW
	/X4IIcKrdr3M0C7IEwXx4DXvdufALxZDTw+j3VEkwGjm0vM5Q++btB30QQEg/WkB3QowV7TNKNBhe
	2TZc45wlMXTTXGCnlHchcJbWCrXTwxdEhFmt8mEG5iXf+ahlJDL8Yd7eZnkx12FO84TXvAZAzcvHy
	GD3NEksHjIIEUletqN/VqI/3NJiWX5rWxdWMbp3agYL7xDmjQYvKPpqAEyBgOkVSVQIFv/FIV2jEF
	lIU8Mx37wN3NA39cskJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqv9E-0000000CMKN-3iIw;
	Tue, 26 Aug 2025 14:59:44 +0000
Received: from mail-pf1-f169.google.com ([209.85.210.169])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqv7S-0000000CLyH-4ADd
	for linux-riscv@lists.infradead.org;
	Tue, 26 Aug 2025 14:57:56 +0000
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-771ed4a8124so1829345b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 26 Aug 2025 07:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756220274; x=1756825074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4l4TBk/LGXRpjovIOSrhrLfanQNTxjIirl6+Uo+sE8=;
        b=Gjnm7sxC8bOLRik2oWnFaeQvP1XPYGED066RGwmbD2vauxyFlTZQuDw3dfNFv1Cmwv
         WWFzYansbVV8C1fmKdRONinlAifN+7iwLoQ3PYnlwUN1pjgmeE72BKKx+CuMTcfMvbT0
         vywLPu+zBQZMaIQ+ku9tahKpJESN+98+vbAiak2KZ1cH6aaSvoVRJPhTRN1apCYNerTv
         4WW7XMD7ZgU2Cmt1sFD4KAnd/ijRdjZlRM+Fwxf1rS53VCalaz9ODjD8SKPuarip+NM4
         H/BhjtuYsu+zCGvQF0wvvr6lDUSWnCNYpECpGLwkz/klRszxxxebIp3t1VDmRlPbhp94
         sP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756220274; x=1756825074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4l4TBk/LGXRpjovIOSrhrLfanQNTxjIirl6+Uo+sE8=;
        b=HGiCz2ltP+eWnADvz3zoYqva313O/wIEXzYmtBODYsmBfx51WNyWVnqwsG7d8T/Zk+
         5KSw2VjdhR1KNWq7OHb81IleNRVAk5J6ujgstaGEdrAwCd4lS24hNeqHRFJelcES+JFl
         7Mh8C2g/T5jTkf8yJiLxJu/fx05pnFY8TxOQDN9Z7vu9OO0e7SRlMhb/uCbhBRpE5fUY
         1/xpsCfD1kDzDUk+6TKh+SUjVH2swJqRvUdgVeXYtw0ruJpAeZby9jDt1jyhwByMVc9e
         tqItJ/GabcweRLQqxgoW3Tp5uqz8U5N/k50KvoRubqec2y+LwIOV/TbnpbTwIGr2K0EC
         7WwQ==
X-Gm-Message-State: AOJu0Yz5+ltFhV5ObBzFsZ4X59Qq6eiHEoZkvjgx5M9IXLi1ptuf5+lZ
	kJ1iw/HfAA0/HSGH+7Y9QUDm7cv3ZgiDwNnh9Jr7hwKjxpHM+nEtmAvVRAwLuJpNRY0WS/Qytq+
	3AepYryU=
X-Gm-Gg: ASbGncuVMi6NN5Kd2V2tD0o+EmNffA9LbcuUCnv4P/LCIdHsSWFzODtSkgC+4xPoG99
	1dU5VjmJkhosHf8XVDZoj/54Im+KNv7bl+PK8mQHo2/dW0PC3P0pqEcDDFY6oHLhmPrPCP/Yke0
	wIXptNeCvJ6sJ0eMtX1AGO2BZYlZKusx/Q+MRUCXMDoaqwjLUn8dqFH9RjJGWDWywq/3QJTxG+X
	xgTAVp8T+yezl1QetCOTaU5w2wep24OMBDpr1gsQ3JCa30cxJVwz/RdopMp2MFgQg9pJi9qYV3l
	swqTq62AE/wtxKcx2o3TQH38+JABOeVpfNCK12ZIrOZilm7TGgW7Dvy7204j7GJPyx/5Jh6MbFx
	k4lO7Q6ozkXa5CbhwG2Xz15bVnyIUmWUytAlEIadlb4Ovku6wxjzL5cQ8+eWABvo9ANqCDF3FrR
	em6H/B/5IwZd+6FY6rWEnIiDX7Eh/7LBf7Kuq7O7aw/l4=
X-Google-Smtp-Source: AGHT+IF2b1+8Sme48WZ+/3lAfrfDRXPo0RsBhXH2ou3PBP/Wh3Zgu70REv/4ACU8qivX/oSldk1NJg==
X-Received: by 2002:a05:6a00:1793:b0:771:f852:4529 with SMTP id d2e1a72fcca58-771f8524884mr4800612b3a.13.1756220273882;
        Tue, 26 Aug 2025 07:57:53 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77059928c5asm7209799b3a.1.2025.08.26.07.57.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 26 Aug 2025 07:57:53 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	ajones@ventanamicro.com,
	brs@rivosinc.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH 1/4] riscv: add ISA extension parsing for Zalasr
Date: Tue, 26 Aug 2025 22:57:37 +0800
Message-Id: <20250826145740.92276-2-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250826145740.92276-1-luxu.kernel@bytedance.com>
References: <20250826145740.92276-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_075755_034340_FED47A31 
X-CRM114-Status: UNSURE (   8.20  )
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

Add parsing for Zalasr ISA extension.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index affd63e11b0a3..ae3852c4f2ca2 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -106,6 +106,7 @@
 #define RISCV_ISA_EXT_ZAAMO		97
 #define RISCV_ISA_EXT_ZALRSC		98
 #define RISCV_ISA_EXT_ZICBOP		99
+#define RISCV_ISA_EXT_ZALASR		100
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 743d53415572e..bf9d3d92bf372 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -472,6 +472,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zaamo, RISCV_ISA_EXT_ZAAMO),
 	__RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
 	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
+	__RISCV_ISA_EXT_DATA(zalasr, RISCV_ISA_EXT_ZALASR),
 	__RISCV_ISA_EXT_DATA(zalrsc, RISCV_ISA_EXT_ZALRSC),
 	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
 	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
