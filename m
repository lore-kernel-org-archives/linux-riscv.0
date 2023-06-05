Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED3CC7EE24
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 15:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s5LqxxpFVCjPfNdoxB3TWHJj9h54K0yGxDCMBztb/JQ=; b=OUCzNS0AaHcpvm
	6h9VCXoFLUhgz+UOiya8MghSPB34W9DhM97pKBvHWF+6Gt8Cx7ceoLuvyNV7W+DShR+ekfmGsI2zG
	Blr/dI33IzXKRVVqkVvCi0tLIOvHa2RNZb+auACS76kZ3buhWZX0TUXQvumVMYljYQwV11RYvi6G7
	oxBTNNc3P64EokTkBUpEzLcunAD07S+INrc/8sdnHdj8ggkZKBcu03+KCPPKXRRe77LM+byDFyfhg
	8uheRXLjT8HY7DR9Xq3hx4MJ1VjuN1UwJlP7VamRK19G/IDrdF/iHtjyocHsrSd8F7ZQK890wlmq0
	T3VMC596g3/DAs+V+j7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CKo-00Fzh3-2n;
	Mon, 05 Jun 2023 15:41:30 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CKn-00FzeD-0P
	for linux-riscv@bombadil.infradead.org;
	Mon, 05 Jun 2023 15:41:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=le6WsiFFpntTNhwR6ZdThyFuzfVMTXPYkTAyRr8nwRI=; b=Bv0iXR0QrVhhGZ+8YfnX4jN5+k
	1DoUC1Zocy7BaxgNu7sXgKD5SD1JRJX0hkP2SCX7ccoxz1jmrmmOqzqS87u65BQLH7Q5+JQ1g3Nzm
	oTDdquYmFCS3eoIOnRmYiYa1y+TokyaYFw8MK0GIMKIaQX9aSGNN3huFCsx+CKWzrXp3Xe4SfCdy1
	SsWS58clUsyFXTrhUd/rcPOdIOMfE91xZqKQQAcvY+HcXQqYqpVjays35G+mXjAZ/MLzlSWxJ6gZb
	zJt7FN9ixb1NfgKG83YfBvOi2H+8UcWxRtCJxJ39eiZYtpe47YSpC4R4tBUcSKAVe8oJUVN5K07iO
	aN4fWiCQ==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CKk-003OIW-0A
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 15:41:27 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1b01d912a76so22469865ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 08:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1685979683; x=1688571683;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=le6WsiFFpntTNhwR6ZdThyFuzfVMTXPYkTAyRr8nwRI=;
        b=d+VxNOOQAYl7No/bE0Eojd1GYi+MRhT2Pby2jWoSFXSqUG8BgURwze0nShY/toqzYx
         C/WtCyxZA8GCoZnSCw7mO36blaG/NDggsPeg04KH2aJoaDhPkXVbw9Oz8f/H5Qh1x990
         taBoEsUSxj94ml9ML0MwfSzKodLhVwBsLOWyslkDYUSh4VosvqwIltYtzDzD0pnFvn/i
         hGLMy0SKjDc7WllfsI/57BAJwE0zqYQPa+9VLrBSLjj02U1OUHyHUE2xw172H9W49dJj
         GLB7YZNAaWZ2R/F8NDODJUWaVu8V5dhYQ+LxFxQi512Vtxs/a/R2XiF7GzRrFS2Qng9h
         N5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979683; x=1688571683;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=le6WsiFFpntTNhwR6ZdThyFuzfVMTXPYkTAyRr8nwRI=;
        b=hkn7W1Jhq5A0R3B0Dxt3kLn8+LJjoWSN77uLZ+GXlkF7vtQ46bsSRCFWRoxQfPf7lc
         r96QXubs58GfFVH06dQ/gFQPtG3FB+JvzC/dL1fw1oVttnYIwEyzq/+dVaf5WSeHxIH2
         NeIdVAuCJ9/pqTuV4onaH3jhkDOFAH32YMx5d49rH1+DmhXudQpgDwRMPz7G2T0h8RmE
         narebHmdsKco+sz/iphSqPpFoDYpWcvnIq2IKKaXjQV6h8y7Jo2SgfccjSEyhF026TrI
         aF4IF8jOCkbM2oo0mLaFshNtIVY48nOCxo67m+iIMfOQwDI0oj6bYckTleFf/QYWqcdc
         TuCQ==
X-Gm-Message-State: AC+VfDzEtdXcyvIfs75ZsROY3M+MTD4IQ9UfKxmqEzH9L6H5rwaXIIfP
	nmjKhq6QdpL9u2fcp7EKG0aRYIVXxsJXKOK43vgwdUIoix56njURCG3Hhxvww7XnmqQpcVAHgAU
	Z/DF2d1j7i9YxcoivIXyfsY7/+q4ez7gLHDweInAPrxVc7fXNjDyso8JBKVDw4or/424wgNQZjA
	fFy3Q73Mqov2/JtbY=
X-Google-Smtp-Source: ACHHUZ7q7e7Tg1BdWpbPDPd+Pjd+pgjDAOZ9wkARLO/Bd52hIUUFEEnGT7DcWONAockW3n4coc2/bw==
X-Received: by 2002:a17:903:4293:b0:1b0:26f0:4c8e with SMTP id ju19-20020a170903429300b001b026f04c8emr2643302plb.69.1685979683648;
        Mon, 05 Jun 2023 08:41:23 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id jk19-20020a170903331300b001b0aec3ed59sm6725962plb.256.2023.06.05.08.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:41:23 -0700 (PDT)
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
	Vincent Chen <vincent.chen@sifive.com>,
	Mathis Salmen <mathis.salmen@matsal.de>,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH -next v21 16/27] riscv: signal: validate altstack to reflect Vector
Date: Mon,  5 Jun 2023 11:07:13 +0000
Message-Id: <20230605110724.21391-17-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230605110724.21391-1-andy.chiu@sifive.com>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_164126_255362_567DA816 
X-CRM114-Status: GOOD (  10.34  )
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
index f117641c1c49..180d951d3624 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -476,3 +476,10 @@ void __init init_rt_signal_env(void)
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
