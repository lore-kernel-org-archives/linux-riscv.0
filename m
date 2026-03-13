Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDE6106FD9D
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 08:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NsUCQVIzNQHr2p9LQbu20WhONjccLgtkmL4E5HJFC9w=; b=m61DDnrkgfZDJb
	nhyKcaW4lzV32db1F4RqzfVnXRaoJgNapjDjY8BB/IWKhu94CDWiX+0jEcFtTFv34nK8xhjusZMJe
	2fNHBrviUJiXq3aH1EqoKwrpNF+N9FZc88/KPk+gXk7xsYotDcWHujFhD8ceuP9ww0IS0RWWjGDZb
	0vZePt58YW06TsyYylYdwyF8YofSAE72XnCmHirfgZ5dI7gM3og8DmG6aXaX6bV+lCnxa51vgLYSn
	+DndJMsfTK33OWdh4XvsaHkLSUtGL1ZpfmDZm9EZV62pb0Dz+sDx6wmiMqy8hOHGDIA9HhtiIj+/f
	ZkLaMnQEqCVySJ39jPdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yAP-0000000HIrC-0wHp;
	Fri, 13 Mar 2026 08:46:45 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yAJ-0000000HIoc-3QZz
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 08:46:43 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-899efe93d4eso24838226d6.2
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 01:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773391598; x=1773996398; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWtVhcPwqjrv+e22Y/nIPTx2YCaGzJEiskvbRnBBT54=;
        b=FCNJtLIc56uDJe9vxXjsig7j5OLMmHE+vtmonYCvYFcf0cjCCtmUxQ3j1hjJBgXHrD
         dsL/kugWQlZ3GQZ3P1laZOjK47QEm72zt0HFF9VI3Vd0diyteSTW0VKRh7Sl3/X7UdiO
         hVyiZfP/DZ2ESQWdQ1KTDNAlpy+ApqO3wDmT19NjwsDOotrFbtvx5omsmeE/PoZ7W/Jx
         tB4aldPUZK7xsL5kz4JPl+ZxMw5DkA622HuRINdabitl9iPT1csBwlWMLx2wcDOG5ec8
         a90GJlpmtqdTPFGVZfogut3R4aoyNMS/yHU+8kFkPPJ4zBBO5kquv8t4CyGFgujo2iyt
         p+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773391598; x=1773996398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EWtVhcPwqjrv+e22Y/nIPTx2YCaGzJEiskvbRnBBT54=;
        b=oM1ZdeZJ2VmUqoE4PybWpaP6iV9/dJasS4pN5U8+yEkgwJY6DWrhdBTFSfbCeMiw9a
         rMtsWMZDsMw1G9Xg69tPCRx6RRqwSISKAZ55ybnp+UsPIBWyDiKxV5xLQLLdvrRIMZZZ
         Dgmmty/3ZknheACSLTZQytRv3F274hMw2dT49KQmiT99d2YsgQ+xLHWE8YIoTlKAnXGN
         Ih2+l3tdX6F3GgScCigaDKZl6NAd6uYqNYly+ctDKEma1nSfDDxszmrKCCYAe2RpgwhP
         qjmBXsGGc2ZBzburfQd88G4s8cxsZwgdr90P1BYd/CpOPu/Hm+6bdtk+DIjrEYVxu8M4
         WYdg==
X-Gm-Message-State: AOJu0YzAFBaUsoRxK5LJXbcVQ+/PvTvn/vuqWA92Rm0BY0gJHxHMIvT8
	4TMW+q16B/EfNxTJFoqr/pqZE+OpLZmz9qfuM2OYTuc/xFcyXYRVyryBubAp0Hsv
X-Gm-Gg: ATEYQzy/sZVSjBo2yK0LjhPTO0ZFcW8d0KLyCUqQzIFOiL85aCootvsm1ZbJuu1CEOB
	SyRGK5TZ5PvNIh0SdG1F3PDJTZQJXud3mM2H1hJh02EK1LTyvxHeW4tY6ZVD9UUHi/3Rq6bp3ce
	UHvvrQq+zMuNT0A9OHMADpnfo076YXhvMgVvCQv9l9hWlkF6wsIFu1hqyG/k45J5LnptcOWEuPy
	3tlIr4J8PqTKt/O7cxmYKGtwGqP5qCY79s7udZepUdxO5AV4H6ykAuRZclKbRVClntlB88VKqo1
	YJnJDuzOvVibJXI6afdpaQsW7BGp6++PhnWWbqAiIcMT/0t/W30p+48Dy+Xsia6jOO2qRJtD0nY
	7voEMbs7eiuJbOQLgnwXTjv/xaZbW8yTFoZmUoZhrQnxgxu4qPODgmORF8oUmjPbErQjWeye9/1
	n/EyDjcn1zc807Y08HxRlH5mQuFnP4a0Tw25I=
X-Received: by 2002:a05:6214:21c4:b0:899:fd8c:55d2 with SMTP id 6a1803df08f44-89a81cce733mr42999986d6.15.1773391598089;
        Fri, 13 Mar 2026 01:46:38 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65beb131sm50142206d6.13.2026.03.13.01.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 01:46:37 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: linux-riscv@lists.infradead.org,
	samuel.holland@sifive.com,
	david@redhat.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	gaohan@iscas.ac.cn,
	me@ziyao.cc
Cc: lizhi2@eswincomputing.com,
	hal.feng@starfivetech.com,
	marcel@ziswiler.com,
	conor@kernel.org,
	kernel@esmil.dk,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 6/6] [TESTING-ONLY] riscv: dts: eswin: eic7700: activate XPbmtUC
Date: Fri, 13 Mar 2026 01:44:07 -0700
Message-Id: <20260313084407.29669-7-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313084407.29669-1-ganboing@gmail.com>
References: <20260313084407.29669-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_014639_857972_7B951B4B 
X-CRM114-Status: UNSURE (   7.46  )
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

Set riscv,xpbmt-uncache-bit to 38 for testing only.
(Make sure your firmware remaps it as the following)

            [0x0,    0x20000000) Core Internal
     [0x20000000,    0x40000000) Core Internal (Die 1)
     [0x40000000,    0x60000000) Low MMIO
     [0x60000000,    0x80000000) Low MMIO (Die 1)
     [0x80000000, 0x10_80000000) Cached Mem
  [0x20_00000000, 0x30_00000000) Cached Mem (Die 1)
  [0x80_00000000, 0xa0_00000000) High MMIO
  [0xa0_00000000, 0xc0_00000000) High MMIO (Die 1)
  [0xc0_00000000, 0xd0_00000000) Uncached Mem  <----------.
  [0xe0_00000000, 0xf0_00000000) Uncached Mem (Die 1)  <--+--.
with firmware/hypervisor re-mapping:                      |  |
------------------------------------                      |  |
 [0x100_80000000, 0x110_80000000) Mem UC+ ----------------'  |
 [0x120_00000000, 0x130_00000000) Mem UC+ (Die 1) -----------'

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 arch/riscv/boot/dts/eswin/eic7700.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
index f16ec76fb130c..5c413439daf0a 100644
--- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
+++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
@@ -10,6 +10,7 @@
 / {
 	#address-cells = <2>;
 	#size-cells = <2>;
+	riscv,xpbmt-uncache-bit = <38>;
 
 	cpus {
 		#address-cells = <1>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
