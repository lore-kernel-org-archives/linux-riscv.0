Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F567C77B60
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 18:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rr6x26OTrEap8vNG0D8sKWUDN83KecXm+X4b5z/5kfM=; b=KiNPgUCMHxJefp
	l5Ixtrz+jYPQpYSgi8q+LEd8bsnNb1Ka2QZTHySOjjbakteF209FmY60Xxv8UuwG2cjzEbf/ya95E
	kE3Ns1fGRhj5kGb0uSeHBxODEa2dGosdwHQ2d9LJrgOKnn1xUNZjYS+Xvykv8UA2V+zGWkqMpA9ZL
	Hhw+j8axRfB2S7NldvDjSvYIvXzWYKVHEnlG3C6OuWI9O5xfGK4RMxC8qn5lSVRD3b9q9qkQAXZQK
	v0CUehKlR3ZASxFfXYeuP93Gqb+UdnP0XP0MsgzjMQXBOyBuQn1iX3BUDY867v05p7B0pTEXUfkvF
	5RoZLPU1CVXwMZCkJOdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgr8q-00Bya9-0R;
	Mon, 27 Mar 2023 18:00:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq3A-00BlFv-0q
	for linux-riscv@bombadil.infradead.org;
	Mon, 27 Mar 2023 16:50:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6nGKmDwG9+jNVeR75v05JMRVwMFJUAElECktRxuQgsc=; b=GP2foeReHblp3fh/+B7grgDSM+
	24q7OfIUbI9gzBeqkIPOQgkgqdN+Xx7rxYNw9CTeGbN+C07iokorDnpzJNZqmlO0F9s0imH10Dn9E
	8bY2lA+EDMIMRCyxJxm4Pg7BMfMVAmw4IUAjvnPdftTaMSmJj0CAthUgDPV7aoewH6Kse5VMcxg4C
	y14lvhVtm7YEPh8+f1/ipmZXXrpXiLR3RoW56SzVnPhQp/18mVaBuxTzYTTo03vu1ahfqJLxmGuwK
	Ef0isYxnh6nrDcZC/FB95Er7W5prY+fqCLc+dysXasyBV5gK7+M56hRRaN9M9YosbjRbxwGnq9fV+
	ssio6fKg==;
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq36-006EPK-2M
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 16:50:26 +0000
Received: by mail-pj1-x1033.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so9566348pjb.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 09:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679935819;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6nGKmDwG9+jNVeR75v05JMRVwMFJUAElECktRxuQgsc=;
        b=JfWWi0r3Aah4Ssp2OVePCRbSorndLBHm4Dfhdf+0iBVyhGo0793cDzOsrS/TOMoWRT
         p/+84IINhIIfrVo+i4eD91p/+khoi0bv8dpYW6Ftsjb5K3jEZKC3cSkaRZdQ+QDRgCGO
         NeFvS/FyX2no1E8JwM8SRXFyeRSANCwQqdg+QmTp/nhovXgRM9KkmopMx2dP1oVX6tD3
         cH6XRsAch40tbVIgsOKll4xAA7Zi+Xmpor//2HWaSyGfS24zq/a56eOk8HN3wZ+hAATl
         DXRqiOMOp76q4e8FLqFEUcX9B3kRor2z0c7AADxDr2quOhYazYu/P4cGQRg1S5awqYKm
         FyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679935819;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6nGKmDwG9+jNVeR75v05JMRVwMFJUAElECktRxuQgsc=;
        b=Nv2FxnpMiVB75PG/wp+Z9KWybe7VllPbI4VFjhsLyRiJDVjarQG6psfIkkheeK5WBQ
         av6AzEzRn2fuR0Ga4eMFEV20gTyo4LtW7hdr/Jj1MZDHnrwuld+cSflxywW+/nst4G8Q
         vnDcpEhzCcNTxGp15lXsoEHICb9WpAXXwct3vdU/gbS7ppKxSRTmTb0RAjP5BCNmTHDA
         ic+PpGBMR8465RdddqBXAveTR7o8LwET9A3lKKCeqNinjQ2aYrr4wxBTnXQJZk6oxoF6
         XOATiG9LxE/h296xbKYIsT3/xBWWbjlEorOwT8L3CDXadyXMfjtrKN7/mVgSXsYufuyC
         4z8A==
X-Gm-Message-State: AO0yUKXkNk3ycDv6AwO3ThsG3rYzzvPlQjkr9EuQjX3GAXktY+sTBmWW
	daYlpOpYhsZxFbyXIbVlUdUDil8i1MSvTYB3kk7mlrNo+TaT9mY1unswaCx0hx/S4Mssl5bLYwH
	9Tesz9d7xjGonKI5cOCVWpjdJ+OissFE3oH1j4S0/z9MUPr2LE99jjmP1s03wYfT3MQVhn37CDI
	74dMF7yq08kumx
X-Google-Smtp-Source: AK7set+Ze6NSJcYMb4Tv1Jgrtl8qn4HKSeVB7KJMmBL8DgmRijsSQsb628r6PiI7XdDQFapZ2Gw6nw==
X-Received: by 2002:a05:6a20:c2a0:b0:d3:d236:f5b7 with SMTP id bs32-20020a056a20c2a000b000d3d236f5b7mr9386121pzb.26.1679935819338;
        Mon, 27 Mar 2023 09:50:19 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q20-20020a62e114000000b0061949fe3beasm19310550pfh.22.2023.03.27.09.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 09:50:18 -0700 (PDT)
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
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH -next v17 06/20] riscv: Introduce Vector enable/disable helpers
Date: Mon, 27 Mar 2023 16:49:26 +0000
Message-Id: <20230327164941.20491-7-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230327164941.20491-1-andy.chiu@sifive.com>
References: <20230327164941.20491-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_175024_910061_1054518B 
X-CRM114-Status: UNSURE (   6.38  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Greentime Hu <greentime.hu@sifive.com>

These are small and likely to be frequently called so implement as
inline routines (vs. function call).

Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/vector.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 427a3b51df72..dfe5a321b2b4 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -11,12 +11,23 @@
 #ifdef CONFIG_RISCV_ISA_V
 
 #include <asm/hwcap.h>
+#include <asm/csr.h>
 
 static __always_inline bool has_vector(void)
 {
 	return riscv_has_extension_likely(RISCV_ISA_EXT_v);
 }
 
+static __always_inline void riscv_v_enable(void)
+{
+	csr_set(CSR_SSTATUS, SR_VS);
+}
+
+static __always_inline void riscv_v_disable(void)
+{
+	csr_clear(CSR_SSTATUS, SR_VS);
+}
+
 #else /* ! CONFIG_RISCV_ISA_V  */
 
 static __always_inline bool has_vector(void) { return false; }
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
