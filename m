Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903D6CA6009
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 08:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1kZyFwLPQS7CddVbS+grPQWOC+gWGy8cYhFoGpFX8wc=; b=tNTL1y3XXt9if+
	TYz2VqlcV4puj3Ti9X0uqqCQpW4r8X80ytXAu1i/jvPjBbVF1WeWsIbp/V4wNRQ6si53TV8JnW85x
	xJlq9VFv8NhbwAvU01c4MinrkMuAEf0nthAVFvh80l3MJQhlM2n7F0Djp/rfAKGbTXtb1sK2ERFWp
	jDWoSXHZQlzx1Ks1zgP6/9ne0X416aMT7V/qNiOatI41u+B2UbxrQX7LXDxJ9tFFClqEREGnmT1Tl
	mu1y470cBrNj6phgqyjJm7RVeNa08k8ntvjyJplzJXVRSm1YyC3xbRZ1+1X8TqZQdPV0u4yfxulUx
	cadd+TRpBAJVWoS+stzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENN8-00000001zNg-1Pxi;
	Wed, 07 Oct 2026 08:51:34 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENN4-00000001zKu-0gYr
	for linux-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 08:51:33 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-1419d3416ceso6846074c88.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2026 01:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791363089; x=1791967889; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPRc8TVOWkVWbOW79DTb/n8a1v8Pn81m9sQQRmtvu9o=;
        b=QDh8nqqI5HJOZLeW9ONKQIcMt3RFhraoSo+4UdNtqNXI79N9C+Jh07ZmSP8EhzEhtk
         Wv2WZNP9e8N+ae/B/iAgzDDQlYuJD+CAoKGYQAeB82i9f4rLBuNaRtk9mq1+gjgXJoWc
         BGi0rhuKt4Ugl3hWxPr5snuWmvPLKEjEkBmKfZgH/DwaImRv1A1rCtZ7LgRzMJ9h/W/S
         /0ipA7trYTDvoJQ2ACgvlOw6aHtW4o6iXbn1IIl0DNpwLI1cSmhlGRQ1oMwNVCxjvsHB
         wydqbtJdPujNkBDBsWb8xPXMceDfiHLfH0auHGrCtznq9CRxj32izoitwxrlTqxm85Bf
         lrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363089; x=1791967889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UPRc8TVOWkVWbOW79DTb/n8a1v8Pn81m9sQQRmtvu9o=;
        b=JeWpPX6WlnzpNDWOyl9P247vbdTzR+c287+7nMu7EYb8P/cNkeLxxK2b0JSz7thaQb
         xyy+LzmcX+a2a2P8GrynvPkt8/VDZQVS/9A5N+V7SdMZqDORGqhmcDtQAnz1s9mq6uWv
         rttt5CZJPdBvO3v4IXeHeZHoUmXml09SNRZX4sbw8d+YCR+kDQNoQ7KNsLcySnR21tlS
         FnrwQnkP2vmTX3smGs2nkaYRumA24kMIANxHlwhtfCHNsfO6yOsmo1Er8NGuwpucQhKQ
         9BI3H7duWQ7SFslDsDLkVpEHlrnFQdRXOXTM8+zbahBv1Qdd0w9yv8LHvoFiJ22QJ9hY
         Avbg==
X-Forwarded-Encrypted: i=1; AKwUvByAA9k/ZrtXpjuI0wDuctgn5RJCD/2PeuByMGjpwyNOttmib7j92zxYaTqa8zQc9KQZb2poct92HSBa4w==@lists.infradead.org
X-Gm-Message-State: AFuF++nUMHS3qBMUUQCE9cycapwbS5qF7x9qcLJCD4PS6EItYxNd586u
	IHqNH57TNnRizhtzEgzFW5XqcU6gWbdJGXJ62fGaKpMKR+rT9s0nzYF6a8sohYQhTkU=
X-Gm-Gg: AYBFou0ZtJ+9mUwor1t3x9mD3zShOwznAIt27hQM0ZrAlHwdfD/l74enBM5aAS8HYYY
	syxzBnRPgHk8ANhpsw+9q1bPeUC/yzE0hgHmYz5zBhGsgrx15li5alti0PVvXYutl6QR+kXrYb2
	0b90ct5BWGSnkPXmQCdSRaom5EOodU7wetSXfWHRo9QLqwIjmcPrs2CEugbtrGtSvvFcjmXVGjs
	WzciIA37cZaAMuk9tAIUb1VW+MYoR+ETNgpsxfjjFRN6UVrgd2OXJrTtsX9Zu5qay3SKzOTQB+N
	vDHSCVxk5Mz3XQKBX6X1VOBM+V2WVBVtm09XXYq2HKktmt1ZtTtdM6ee1B2NtmQJFnbmWAxY3ua
	sgWvmpTk9yQzrRzhUAK5n74b4k7e54vL/3CD2AIdAXFs+tvH48PilDEoFgsIRD2CzvA5bE2zmaE
	aFE/75PfwRcs04ISuYoHXdm8+refHjnryawJ5aLotVwYb2E5znMhFfhH5/R56uz6NVXaZusysJP
	PdxDU0esKX2zXpCOrWe
X-Received: by 2002:a05:701b:4518:10b0:14d:3930:647d with SMTP id a92af1059eb24-1620374de3dmr1490658c88.9.1791363089288;
        Wed, 07 Oct 2026 01:51:29 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-163e3c5bed6sm396251c88.7.2026.10.07.01.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:51:28 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Paul Walmsley <pjw@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Andy Chiu <tchiu@tenstorrent.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 1/3] riscv: Drop CONFIG_RISCV_ISA_V_DEFAULT_ENABLE
Date: Wed,  7 Oct 2026 01:51:16 -0700
Message-ID: <20261007085126.222688-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261007085126.222688-1-samuel.holland@sifive.com>
References: <20261007085126.222688-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_015130_206966_B03EA6DE 
X-CRM114-Status: GOOD (  14.06  )
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

The ability to prevent userspace from executing vector instructions was
provided as a escape hatch for software that was broken by adding vector
state to the signal context. This appears to be unused in practice, and
creates confusion in the extension support returned by hwprobe(), as in
this one special case an extension reported as present by hwprobe() is
unusable.

Since we believe it is safe to always allow vector usage, start removing
this functionality by dropping the Kconfig option. It is possible to get
equivalent behavior by setting the sysctl at boot via the kernel command
line, but that method will also soon be deprecated.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/Kconfig         | 11 -----------
 arch/riscv/kernel/vector.c |  2 +-
 2 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d6c2dbf8455ce..e26450f0d38fb 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -650,17 +650,6 @@ config RISCV_ISA_V
 
 	  If you don't know what to do here, say Y.
 
-config RISCV_ISA_V_DEFAULT_ENABLE
-	bool "Enable userspace Vector by default"
-	depends on RISCV_ISA_V
-	default y
-	help
-	  Say Y here if you want to enable Vector in userspace by default.
-	  Otherwise, userspace has to make explicit prctl() call to enable
-	  Vector, or enable it via the sysctl interface.
-
-	  If you don't know what to do here, say Y.
-
 config RISCV_ISA_V_UCOPY_THRESHOLD
 	int "Threshold size for vectorized user copies"
 	depends on RISCV_ISA_V
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index b112166d51e9f..9641343732782 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -20,7 +20,7 @@
 #include <asm/ptrace.h>
 #include <asm/bug.h>
 
-static bool riscv_v_implicit_uacc = IS_ENABLED(CONFIG_RISCV_ISA_V_DEFAULT_ENABLE);
+static bool riscv_v_implicit_uacc = true;
 static struct kmem_cache *riscv_v_user_cachep;
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
 static struct kmem_cache *riscv_v_kernel_cachep;
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
