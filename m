Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D935C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 12:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iBl0cZ1ByhGq29YikE8wkkGDG7jh0HGt7LtphlHMzMM=; b=jJ/t4Xm7EBgpLP
	5O8R1Ogul8SknHVYDvEvVPZM9SVwK8zGlWjhnvoZiUUnotoRZ51kBn5cBEspDutEgsEZ0lJBrtBtF
	5CNGRyoKHn1tGcP6SRbynE/3QTc/HWJVx4iOgKalKXgkJPbTbYxO9XqD1Ur9kC5n59Lsf4XjLX/Rb
	a2T4QHV/3J8jZDVUI5cW6AYPdba17DdzkkgcnzPxDaMpJb2k+tMszEG3gKMSw9UeECrzrtp2h7og0
	zgFkNsMyWa7M2mDBxnkcxwIWBAE5taLRjMzjmBGDx5iC8ZzVhZgodxt20csSSouPL2IV0c4zYufd2
	iLkAVxt2/GiWc4ILYQqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwMl0-003KFQ-2W;
	Tue, 09 May 2023 12:47:54 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwMkv-003KCb-2k
	for linux-riscv@bombadil.infradead.org;
	Tue, 09 May 2023 12:47:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=941FZ9JR8q5CEhK2jSJwDse+5gwyYf1wDxuvPa9cwEY=; b=ae+AKqtk+Mp35xM7biefREYSMe
	dLDRmxwFrPwuaMwGkG1p0Pd8JKOJ1iTU5MvR5GOFqPy3RM8q5NRAcqG8XIjqar/aVJ9X8DEOVO1Yy
	8IeMXvhJ7Mtb6tZcWv5zuSURQdt1AEERTbVR7iefbpXTYSQiv8ecS+9ct3th/DXbk4I67umLGtSk/
	hl6VbA0Vex7GHO3ENiMH8JDUcqvGhKzn/p7NX8ow/dsMSDgF5xP8XoLU2YrhoDRNJXBmghh92V+73
	BjYGnBN5msWMpCMK0SHCbispIUMkB0Srv9zq43912mdRFFMjwyYNAks1dfYb27iwGIlf9rbDUW/oz
	o5Dc1j5g==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKeq-00669x-2N
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 10:33:28 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1aad5245632so40655875ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 03:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1683628402; x=1686220402;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=941FZ9JR8q5CEhK2jSJwDse+5gwyYf1wDxuvPa9cwEY=;
        b=An7cnHT+loomL/g7RPJmFt75o6e0J+e4OnOK/7+TXoVdE0nczQr9FSgNtsTA8dGa6l
         oXlXl7mwBZOFnD6EQIrBdlqArIc9rVndl/oGZPf/MWlv6mO2tjsTT03YHNw1ywBFECAW
         FKU9PP5P50HYEcMnrxwzcAj03n5dxcznQO6tM3Au55xmfaUb0CY4IG8AQ4H30aNtKOZn
         yVVKy+VO6yNMuIU2hydnKL9Na7YRePysTlTdtSn1z0BqqWy2aSgG927vfJg7IpJHaAgL
         ni330YvIhU3/uX84oahdFv/wkb3JsgKE01aKtRdEcWK+pM3q/i3jvEjy0++kjkvrUkfN
         yD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683628402; x=1686220402;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=941FZ9JR8q5CEhK2jSJwDse+5gwyYf1wDxuvPa9cwEY=;
        b=TDJQCUnVt+nqPeJ3PCMwAScuLln4S9HNFGB5n0pSNYp/nUW3z9V8BxciAnDRlZQWIV
         MfbDSEvdPAMJJ9zWF5jRfoKkS2hI8aVfq8KCJSyGM+o3tWLspHAER68EhasqZEfgp45a
         J2dFt8NIQLGqHZMe86oMM56hGGTTo21wgu0WcekVlPrkg3HYDzXxE9ivh4d2dvJHtni6
         OCRcIxoY5oOANlGxBHEcS3VygKD3rJew88TsGtAoYYdpwDoctZIJnlLcYVc4iqQHz05b
         BFbp9eoccT878o7vFVcvnIpPhhalhARktQG0PJRJJJYSjdaY4R2LofbBadoJEuAmszLO
         oGhw==
X-Gm-Message-State: AC+VfDwh4uK6uSBjhUZ4BuKo9J2K8qXSNZrtEW6+IHM9Vk7OA8ekXyy9
	M+9gb/TG0Q4rKC/kMOIYsblKk2IgiDBCy6lRutAXb6swD8hdD2bv+xaGvoLBB3vGbTb9wa9ruDP
	Bk1YwI66RnvIx0oDPDzYtRo/y3wTAnpEh+ecOUlzRNWTDEPvL1almrlWTT/yqweuZ4JIZ7EMDTE
	C6YDMKp63xHSp+
X-Google-Smtp-Source: ACHHUZ4L8N85doaQ33hgQswXAJ2/iV0cFZ2Wf2RzXa8ycldgql4vMle8s5Eb4TVPCsn5L6rx7lVvJA==
X-Received: by 2002:a17:902:b583:b0:1a9:20ea:f49b with SMTP id a3-20020a170902b58300b001a920eaf49bmr14245517pls.24.1683628402118;
        Tue, 09 May 2023 03:33:22 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o11-20020a170902d4cb00b001a076025715sm1195191plg.117.2023.05.09.03.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 03:33:21 -0700 (PDT)
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
	Vincent Chen <vincent.chen@sifive.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH -next v19 21/24] riscv: Add sysctl to set the default vector rule for new processes
Date: Tue,  9 May 2023 10:30:30 +0000
Message-Id: <20230509103033.11285-22-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230509103033.11285-1-andy.chiu@sifive.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_113324_862813_3ADA845D 
X-CRM114-Status: GOOD (  13.46  )
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

To support Vector extension, the series exports variable-length vector
registers on the signal frame. However, this potentially breaks abi if
processing vector registers is required in the signal handler for old
binaries. For example, there is such need if user-level context switch
is triggerred via signals[1].

For this reason, it is best to leave a decision to distro maintainers,
where the enablement of userspace Vector for new launching programs can
be controlled. Developers may also need the switch to experiment with.
The parameter is configurable through sysctl interface so a distro may
turn off Vector early at init script if the break really happens in the
wild.

The switch will only take effects on new execve() calls once set. This
will not effect existing processes that do not call execve(), nor
processes which has been set with a non-default vstate_ctrl by making
explicit PR_RISCV_V_SET_CONTROL prctl() calls.

Link: https://lore.kernel.org/all/87cz4048rp.fsf@all.your.base.are.belong.to.us/
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/kernel/vector.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 16ccb35625a9..1c4ac821e008 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -233,3 +233,34 @@ unsigned int riscv_v_vstate_ctrl_set_current(unsigned long arg)
 
 	return -EINVAL;
 }
+
+#ifdef CONFIG_SYSCTL
+
+static struct ctl_table riscv_v_default_vstate_table[] = {
+	{
+		.procname	= "riscv_v_default_allow",
+		.data		= &riscv_v_implicit_uacc,
+		.maxlen		= sizeof(riscv_v_implicit_uacc),
+		.mode		= 0644,
+		.proc_handler	= proc_dobool,
+	},
+	{ }
+};
+
+static int __init riscv_v_sysctl_init(void)
+{
+	if (has_vector())
+		if (!register_sysctl("abi", riscv_v_default_vstate_table))
+			return -EINVAL;
+	return 0;
+}
+
+#else /* ! CONFIG_SYSCTL */
+static int __init riscv_v_sysctl_init(void) { return 0; }
+#endif /* ! CONFIG_SYSCTL */
+
+static int riscv_v_init(void)
+{
+	return riscv_v_sysctl_init();
+}
+core_initcall(riscv_v_init);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
