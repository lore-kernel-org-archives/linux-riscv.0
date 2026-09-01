Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4891C624D0
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 19:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FXgsePgpuWI3iFM7RSL7o9xml43NVrdTrDKGFtcOd7I=; b=GSOfWOSLPuOdPq
	fw1NCSq9oldDo4Mq2P7/yRRiVa7+Im7DccBm6YNFjI/+9XozEcDrZ9xwxbRhrT8TUSP7c6+8QNWjJ
	zvUv25cZh5KDPurxiN1t3hAnmY76EPffRtdB2k/QHnnlcDt5M3xdvsg3c9kky0gBibbFFrEvK+FnZ
	SSF2f/5a1ql1witLsKbDPDeYcl5Pq2oVCx+7u6VV8NzGnx0IGZYYQJpMgCsixpbzl0RRfPv0v3jD2
	xOxl198zbyr+423Gs6OWpC4RVmoqVf2EHaiCfpRXbhMzwwL+JL4EZ8qCCBoHZyNyWca3QvZgZqW6/
	Dt70g+ArHW/r5jHU+fUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1U5A-0000000DC24-39EI;
	Tue, 01 Sep 2026 19:23:44 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1U55-0000000DC0n-1IBv
	for linux-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 19:23:43 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7f18c0e03e3so77809a34.2
        for <linux-riscv@lists.infradead.org>; Tue, 01 Sep 2026 12:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1788290617; x=1788895417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PNvkhU2BRMZNB3fl0oNJy+OMAEhNSqwG8+0oFRP4+kI=;
        b=OvrHYujXV8fo0P5sNjKQbTpb6CYACxaoH1mQcw/WFhYrFS7VpsjX0z5L8KWJ/6jyxi
         krdPvTL8F2MiPsA+D0Cy7mIokOmTYkdbyeQJhAJWirqiv6iE2oS7cGRfEK2qfHd7l1T/
         nQxYZ/iVoTgrmTvZlLs5Hfhx0kIS0Cgu+NAZGjZyI+BvjEOA+cXjRG8KWiF/WWEI4Cbt
         hK3rh8COyp+HmapAv4cYaZJ4bujO0lC4980h6GF/kJs/zbffN2QOGcyCNO+k+rZFCaVB
         vTiLUVDqXRy31TUG7ASsvGP8ff6PQ6EFCDOkADzWNWXGvZsqMsRBFF6XKNWVXQQs5Dqn
         mnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788290617; x=1788895417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PNvkhU2BRMZNB3fl0oNJy+OMAEhNSqwG8+0oFRP4+kI=;
        b=CZahx5umoGEjNQf+w1a6uhZGbZYyy+OfWhRuptYRQYB/Tk+knEomN2ehuLi743w/Vu
         khBZlSCUxIgqXjXpp8oggUN3ln0htnaUTVinHDFpbzeLGm9ze1al6tsP7GLopng3O/YE
         2oiFTXAB8i3xjSsHSwcrNS73R8inb5m7cqQkuupsUVqicDh+q9TzzsqOvGg24rKVzhRQ
         TgCbiaCvbSF4Yy9jKJl8v3o4AnwfMNBaPwFrG2SXvDZthChUSK2cf/MGkpRxj7VGGq8L
         omx188wI0sBsdNZ+Zo3Ng1QrSGvlhohjIYAsklAPwZKT9bKX7k4Wzx8aPK9DzKhKNv3t
         TZqg==
X-Forwarded-Encrypted: i=1; AHgh+RqUazS6R3I9Cz2H75e2Q7F4cHPcVQCfuZn0l7IDXJzqDi3jEZYeOArEq9OqL9cDWBIXE3qEYWtXGD+N2w==@lists.infradead.org
X-Gm-Message-State: AFuF++llPr8qjqRrA8/SSTNnQH2igp68/1RZVBIDvQEwGPd+3KVBnHNA
	lghz2+JQBechz8fJ88naEuILQCpVXGBOPbftCqBI2S1ECzj++jWKd+XxV9uTe9fW29o/z36D7oI
	qQccgug1DoA==
X-Gm-Gg: AR+sD11z45+PVwYMzsg5B6k7A8BV/yce8zBrl6rurGJm/IsoQR80oYN3A/jQSAoik34
	RR6AsRk40gESeLEo0t/2IQ3poOW7YDjjMxkZZDr4XoYikjpAYDCh74fE7uA3wn+Hx8QAozM7vUL
	KTeHS/c7FEGMLZmDBw6f3lPVOZCndW2aMcx4s83cQIx4lIUtcabUf2DDHIatmImBO5g1HeJ2uyV
	Cfx1+031shm+UoPrngwtdLabcuWOPSBYG5cyWCi0E+nphZthR3JnSSldd/ErlcGYGtcy5K3VwPO
	vwO1BVidpCS0zoUS2Tid7HcvmWks+fPckL7t4hS3eCmTj1c7APF13SZifeU8skC9RjeCP5bfwIm
	Q6QS3qVhDxpde4eJO+eAqcWQw+voRCW2o09xuYeWbbRSlSg2BBm5axMcpnYUOfWMSAuO4hzmMdL
	GxkMqeItOa3wOxHBirsybvUCcDSYEMBQv3civL1f0dRvdL0uejclZ7l3/MfaZsqNNuPzEKM72wY
	zFRpcQkQKAIrJaBM6FrguMgaUD3
X-Received: by 2002:a05:6820:1890:b0:6ae:a950:9faa with SMTP id 006d021491bc7-6b43661f415mr789332eaf.10.1788290617513;
        Tue, 01 Sep 2026 12:23:37 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([47.209.119.30])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46f330822basm808509fac.15.2026.09.01.12.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:23:37 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: andybnac@gmail.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	Anton Blanchard <antonb@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com
Subject: [PATCH v1] riscv: skip software algning code for HAVE_EFFICIENT_UNALIGNED_ACCESS
Date: Tue,  1 Sep 2026 14:23:32 -0500
Message-ID: <20260901192334.3543340-1-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_122339_458946_12BAE748 
X-CRM114-Status: GOOD (  11.30  )
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

We can jump straight into the copy loop if the kernel is compiled for a
hardware that natively supports misaligned access. The user copy
bandwidth improvement on K3 and Ascaolon is shown as below:

Misaligned user copy, size: 512B (offset: [0:15] except 0, 8)
BW Improvement	| Write	| Read	|
K3		| 6.19%	| 3.43%	|
Ascalon		| 10.0%	| 11.4%	|

Aligned user copy, size: 512B (offset: 0, 8)
BW Improvement	| Write	| Read	|
K3		| 1.69%	| 0.90%	|
Ascalon		| 1.25%	| 3.32%	|

Suggested-by: Anton Blanchard <antonb@tenstorrent.com>
Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
 arch/riscv/lib/uaccess.S | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 4efea1b3326c..cf8586a937de 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -76,6 +76,7 @@ SYM_FUNC_START(fallback_scalar_usercopy_sum_enabled)
 	li	a3, 9*SZREG-1 /* size must >= (word_copy stride + SZREG-1) */
 	bltu	a2, a3, .Lbyte_copy_tail
 
+#if !defined(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)
 	/*
 	 * Copy first bytes until dst is aligned to word boundary.
 	 * a0 - start of dst
@@ -103,7 +104,7 @@ SYM_FUNC_START(fallback_scalar_usercopy_sum_enabled)
 	/* a1 - start of src */
 	andi	a3, a1, SZREG-1
 	bnez	a3, .Lshift_copy
-
+#endif
 .Lword_copy:
         /*
 	 * Both src and dst are aligned, unrolled word copy
@@ -137,6 +138,7 @@ SYM_FUNC_START(fallback_scalar_usercopy_sum_enabled)
 	addi	t0, t0, 8*SZREG /* revert to original value */
 	j	.Lbyte_copy_tail
 
+#if !defined(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)
 .Lshift_copy:
 
 	/*
@@ -189,6 +191,7 @@ SYM_FUNC_START(fallback_scalar_usercopy_sum_enabled)
 
 	/* Revert src to original unaligned value  */
 	add	a1, a1, a3
+#endif
 
 .Lbyte_copy_tail:
 	/*
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
