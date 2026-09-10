Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D88C79FB9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 06:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AQkHqAZOnY0//VDQDndbzTBLeEq6lu8oaSRmLpwR0PA=; b=RzbrL9Nz5wjsuE
	d8ZMcOQGYLFb7HD5cK6zz9mZwQTwIDBpKvLJMPFpP4y0E0uLEdSGCsDJNJZ4XcQlkcWlrylwYj4If
	Y/yA+/eSDjkE3wJEmlYKACTkS9wDtCy6ozqATB86e1ojsNtMxESDdvj/ax42n01g3KPy95SlVTNv0
	MqyUTXhDhcgrJih8lRBHYPrIYxTiZrJysyfTidmbUwDgtKaP+EsGpCGEf/0ju452xihLkjwbGBrW8
	QHPq5/qUBjYTTNOk9RSqSuw/cSj960INH6io596xTduN3k3QsPTJvGTAdNE570w5Dil2vcuNCVQFf
	0KxGBz9jhoFrbBS0vvkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YND-0000000DWnA-30Zt;
	Thu, 10 Sep 2026 06:35:03 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YNB-0000000DWkg-3Y3j
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 06:35:02 +0000
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so51660335e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2026 23:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022099; x=1789626899; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wrGQmgTiJm55JhKTBWHPGvE5gvx0Uq3tjEPdNSRkMAU=;
        b=DsJNcFQjfdMNfzWP5Vk3EM9lp4s20NL7pkCgCsE6bOqAOMIZ+OVYVmfymcO6+9c3rB
         O1Jx22V19STctmL0aqRckwQTdTGRWhZwpvE3WL2/2HD/rTpKBC6mJNvmORaq2hUSVeGi
         +pR9TSgXUWtWfwKU20qidBav+RudnDykl7FPwFhR31ybaW4oqmdktocatKebHml+8cXe
         /fQU2MY/TnP4C56G2PnxNVoTr1IlFDaPmbmVXYSwsCw40XgPh62PckloYNC5Qo//FmI4
         PTFxMesNDFx5oKFjvtMWSnkRvxo8ghtpkl8FXmKveq7+zvIu4oWK5Z2h9b8seD0CSdVL
         Lmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022099; x=1789626899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wrGQmgTiJm55JhKTBWHPGvE5gvx0Uq3tjEPdNSRkMAU=;
        b=g3l+qAB4MkBJGesKKdxl0qWOwLeHGk+9TRg8cfBdsP1S428J5JDD10q6TdO6KOmGaG
         neDau1Ue5CQzf/MqiNQZgHRnD1NSrVExRPzp+2APt1o1cXxRcnlTi7ccfWEOfmzZRTn2
         ieheT+Fua0LpKdtXuYP2Jc73SNhuLNM90GeMsN/wtq5Ga5ywXn9RO9ZHpheVs/cd+JuO
         Qg82ghnzcueYHyD03ZMzyceZc4YfrnpRcQQQskzJQiIn8v+hpb4WMR9k7RasnelE3IF3
         lYwnqAOXZ8vGn1zdG5cDXy9I/lsu7GNgbtPfDdClbMiuGtLi+CfZOknQq3Zb2X8U1Tci
         ia5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzHl5OUSme9Z6pQImNK5hPrdBba8P8hhMC2MbzbRwA+nFbDVqxjCALIQveAiTYbbdmKUiIVyqxE1JIxKg==@lists.infradead.org
X-Gm-Message-State: AFuF++l/ogIzybKZjPn8XyBVblQxMH19eePw7qMYR4gTtavWHGeLvRBo
	6oLKvKXxPR+s8KBKmpN8ZXf+j6w7wmyrA+6+W4joJ2sGPnoy3ZHoY9ig
X-Gm-Gg: AYBFou31iPi2h97Q69aVXgYwrBobC+tuDlZlRhLokhG5BqgBro2EVq5nWP75dg8vKE8
	34TVWGs//OEehdSb5/78h3s4lFj1mt6I2JsBydEsGSwc+LlboKDjGpXda63He3bROSSJAT/xJvp
	mBg7iI4o/BfzolwXb7QYQfpZC+EKFN9r2tGJbwo5wn/J/ncuFq/WrsthKP9Dvp9fdKNy4NsBUK9
	mrxVUcDOU+ZlnIY3Ppu+6+tmNJaXQeqKaNVJkvg9TAay7B490DTj84pAsPuOztK72fcfIVz1qSt
	dlEaTNX0gqQB/+Zfv7EQhhOka4momtME7yhDTigHkt6vbye8YfgoGn0TiNgvsgKrLPEa2vmR/fK
	qDt5t8VKJN2ijXTJltQyzlD/I2fD98HTkFzz2b21gpOyNmvckd7euuqsc00XlJ9efqk0/ME51H6
	oPBXRMXHWEwJvZ4JYmhKz17EhHb4qMolLSCvbG9sqE9gdHJC2yXQhGALQptmnIqumS8iosXBbXX
	9xSiI2osePdzHxkQ68fyjObl3vP6OjoKYNISX5ZPd8=
X-Received: by 2002:a05:600c:5254:b0:49d:5ff:f404 with SMTP id 5b1f17b1804b1-49d05fff5abmr273112235e9.1.1789022099342;
        Wed, 09 Sep 2026 23:34:59 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e2212193esm2595255e9.1.2026.09.09.23.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:34:58 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	jonathan.cameron@oss.qualcomm.com,
	sibi.sankar@oss.qualcomm.com
Subject: [PATCH v3 1/2] arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
Date: Thu, 10 Sep 2026 08:34:39 +0200
Message-ID: <20260910063440.4677-2-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910063440.4677-1-okerixx@gmail.com>
References: <20260910063440.4677-1-okerixx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_233501_903055_6F76BE24 
X-CRM114-Status: GOOD (  12.57  )
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

arch_freq_get_on_cpu() computes the product of the frequency scale and
the reference frequency as a u64, but assigns it to an unsigned int
before shifting it back down:

	freq = scale * arch_scale_freq_ref(cpu);
	freq >>= SCHED_CAPACITY_SHIFT;

The product is truncated to 32 bits before the shift, so the result
wraps once arch_scale_freq_ref() exceeds 2^32 / SCHED_CAPACITY_SCALE,
i.e. 4194304 kHz.

On a Snapdragon X2 Elite (Glymur) laptop, whose boost OPP is 4723200
kHz, cpuinfo_avg_freq reports 524283 kHz instead of ~4723200 kHz while
the CPU demonstrably runs at the boost frequency: a fixed workload
completes in 1.72 s at the 4723200 kHz OPP versus 2.01 s at 4032000
kHz, matching the 1.171 frequency ratio.

Keep the arithmetic in 64 bits until after the shift.

Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 arch/arm64/kernel/topology.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index d28438f8b83f..0eca321ff113 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -245,8 +245,7 @@ int arch_freq_get_on_cpu(int cpu)
 	 * (see amu_scale_freq_tick for details)
 	 */
 	scale = arch_scale_freq_capacity(cpu);
-	freq = scale * arch_scale_freq_ref(cpu);
-	freq >>= SCHED_CAPACITY_SHIFT;
+	freq = (scale * arch_scale_freq_ref(cpu)) >> SCHED_CAPACITY_SHIFT;
 	return freq;
 }
 
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
