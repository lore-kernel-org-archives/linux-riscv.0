Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B07DC77B71
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 16:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dRGBZJEnYY+PmGRyeD3enEfmyswaWs2Az+tWXjwHqqM=; b=S9YQh9gLnNHVoH
	8GLS1GVR1GjJHY6r3Wk/ocX7+IrUe9pIWTK0h1wpnZdZb5VzHNdadAPhB5egmq6/qeoT0tGYZiWGl
	S2J40j90ZRzan2SlJySn3pc7xHv7/a7PtKutq8NxHMW3YhH9to13KLdBD8W0aEx5dAowyfQaR4LBa
	M4bM/HIVwco2gk7KGW+hN5J9eyq0UR9m3Y6T2bOBKsG0bUy4cbl/ktheWmpRJ09cGWa2BwddeKnHO
	vsPJOzmNsMIK3B5Eq7gjQfgsXUbdaQ7+Uk8WOTHYNzX98mq+F98r79ZHHullMEAkZHoygQstlxvUO
	r/BMLGIHxyfNXLOjsO5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLqj-00A2AK-0j;
	Fri, 14 Apr 2023 16:00:33 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLqg-00A22U-1D
	for linux-riscv@lists.infradead.org;
	Fri, 14 Apr 2023 16:00:31 +0000
Received: by mail-pj1-x1033.google.com with SMTP id k65-20020a17090a3ec700b00247131783f7so4437912pjc.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Apr 2023 09:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1681488029; x=1684080029;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KUlZU4jbXrvVX0wjIPVLaSJmpFs1THD4w3JnPj0HJFk=;
        b=Mlgms75yqWeLTkYqHiJjvSel58ySvtkQoXkycao5QCuLMS7lVEiaDjiq/jUSmK5Um5
         3DrLR+J8vdOtRDmHsrdXtcyucKdJSduoDf2lxFq8pS6ceLqQ4xqpVXoauqY/x6ktIxiX
         HSFUtLZc8iEI5ObhFHkkvcMwLCr4hletTwaolJ0SuFZWiSq9cs7t3oc9/S3640t77Vgw
         yq8um2CLbE1exAnuCTrMjfNE12JtDNuT7kfvM6+CVPA1xovkv27HfXBEyiWPNuKLrMiP
         maFKu5j02IU4mL8vbTb6Du5BAIyyax+Ita/6KJmnARGhLQn31qWxVWKB3B0HCzijeESv
         mahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681488029; x=1684080029;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KUlZU4jbXrvVX0wjIPVLaSJmpFs1THD4w3JnPj0HJFk=;
        b=C2fC7xvOcG/s1uiyvaimsOWuYPFZYnXC5E5vKzneIylH+jAhek91aqMZOITmjUgiua
         tkb+tfqB2b32S0qMulteHBgYFHV1pK1hhdtP1QOcTNvDuvqse01Rdk98lmAIhUjQ98Ih
         VeykTxtzcBOqgMPt8VheaF3hiKogJyor9Xh0US1cCBovAhEBH0X5VxJfFZge2DT5Rnqi
         mxIJOGBeabHZliU+dWDXdloKjJ5pRhAB3m5EXwFU3bOXP/cKzlDUN4xYX6BdVMmWoDN4
         XlNjucLvw/HpGPo9QEQJPZtwhHWLQ4KEdbONTSUzqyDtOyVgYpxi4j4FH1UQf0nSoj6+
         VmoA==
X-Gm-Message-State: AAQBX9drTX7jCBR1OOUIzxiYx8/azlArGK7tZDx8VUoc3Mnwcx7C4ujA
	Ks+0o54p1W8PPUuwmOIFDgh9QN6yjc5tkKHA0FEAk+dZ7+h9SW6xuh+fvQscbtFQSXhUVvAt7A3
	WvJsESi74Pitmq5lSePDCOS7QyZ64OwEMwV38foK8vBQUYN+OOiXEpI28UOhy2StY1Hv/KkusWk
	uwFpxJ+9RhOMQG
X-Google-Smtp-Source: AKy350b2yRGqmXSmp577Bu3JFR1YRggH+c5zBk/D9yeWIB98+DOaaoUYfX8QFTu7txBaCsMvgcnr6Q==
X-Received: by 2002:a17:90a:4ec2:b0:23c:fef0:d441 with SMTP id v2-20020a17090a4ec200b0023cfef0d441mr5835665pjl.33.1681488028800;
        Fri, 14 Apr 2023 09:00:28 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id br8-20020a17090b0f0800b00240d4521958sm3083584pjb.18.2023.04.14.09.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 09:00:28 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH -next v18 15/20] riscv: signal: validate altstack to reflect Vector
Date: Fri, 14 Apr 2023 15:58:38 +0000
Message-Id: <20230414155843.12963-16-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230414155843.12963-1-andy.chiu@sifive.com>
References: <20230414155843.12963-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_090030_418707_4280D9A9 
X-CRM114-Status: GOOD (  10.20  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Some extensions, such as Vector, dynamically change footprint on a
signal frame, so MINSIGSTKSZ is no longer accurate. For example, an
RV64V implementation with vlen = 512 may occupy 2K + 40 + 12 Bytes of a
signal frame with the upcoming support. And processes that do not
execute any vector instructions do not need to reserve the extra
sigframe. So we need a way to guard the allocation size of the sigframe
at process runtime according to current status of V.

Thus, provide the function sigaltstack_size_valid() to validate its size
based on current allocation status of supported extensions.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/kernel/signal.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 40f740183768..11411e113f0e 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -469,3 +469,10 @@ void __init init_rt_signal_env(void)
 	 */
 	signal_minsigstksz = get_rt_frame_size(true);
 }
+
+#ifdef CONFIG_DYNAMIC_SIGFRAME
+bool sigaltstack_size_valid(size_t ss_size)
+{
+	return ss_size > get_rt_frame_size(false);
+}
+#endif /* CONFIG_DYNAMIC_SIGFRAME */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
