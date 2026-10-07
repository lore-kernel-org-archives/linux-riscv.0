Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFE7CA6002
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 15:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jNuKL/rsX8bzcVg3LOphFIwqYU7yX8D6DK0nSjnatN4=; b=V137bDeO4FqFky
	PydRuoTzRs+fFlPN4Hs8Lapc5tiyqT/k4FqT2uoGdtfdDJdarBdiaD914tA/PR7g/t9Zy5VSGVOll
	Z5h0tnNf3RisU3/q+RzcTCi6HzTqR0zIc3+I0JMaN2pOQLBKUUzd3KUyItSb6QV3dlT9ETE/9BzA/
	T/1Bf1QU4DwEOTfaoUxgug4kjmAMD1lrjrTN39AhGtDGz78M/Ax0zw93mP0MOEj5Yh6f3qkuZvU/m
	G3JPcQwr28RVx6liYXHsB1xIQx+Y87/f+ThKmS3p6Phi9gAFarDg43OhWVQbtDbVGDRpa67g++BLk
	0yKqiAS3VcXB1B6FjqvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEU1i-00000002jpp-01QF;
	Wed, 07 Oct 2026 15:57:54 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEU1f-00000002jop-0JHk
	for linux-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 15:57:52 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-15756f82e8aso1298598c88.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2026 08:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791388670; x=1791993470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zVUR0mPxOZ7cLe3tx3kr6IkZOSqHAPMm8wQmfjR1ZyE=;
        b=XgOkr/7sOQrNJ6HoqH89CodoZMNwBfWtCEhWvsqx5OerwSCqAxxv68bA2f/OKQxTf+
         QRMinbJz//fuyuz70s6udVIVwOHMvjd9JcS7jVhI0NvzLK+qWJhNAJ1Nzj/DgAah3Dmp
         /kSRJoT3My413Ga880f17JKVRIRe4zuTFlFtpP6ub3GvHkyiLJx+zmxIa6IqMXTZ888t
         YeMCKQA55Vxl9OOJbZ3NTEAv5FfxQSDQALGN/LcS5g4AtZ/DIVOukOaLLaxuho+DSFpV
         GmRFnWuck/wB/VFu29WFGxa3y+KoHhuKacktxbWPnh1sxsSsR+QdU0BA+bAJpafFy/7C
         dVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791388670; x=1791993470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zVUR0mPxOZ7cLe3tx3kr6IkZOSqHAPMm8wQmfjR1ZyE=;
        b=eV+pFOGgwn8UStXcGmDIQ8QzgF5FKVw3eh1M5SluvvDfHHyDCpx54ZBVDNqP5yNbIJ
         7WOJYW3e66QoSryE+IfiXHjNqIPvgXDl1Om26s84SjPOTbeSeihYxjh7M3tk6i6nRxpv
         i25Fij6LYmv7ctYUp5JBep5+FoHahTvXXnaIgmRTQauKXsVZLOwHqMoOmzPHUEE+WvOl
         s4bedgKsqLMmyGn9bLudiYswHxBzW8HTwhlk2+L4UAGQNb/kNQOUBV6KwDjqp/Q+pS7e
         7FrX9QqDUrEAIyZktMBtHOLjqrHXO8x2sUSjAeWTOxcLmOinlrAN4zhBcSVcfGd/Qg6x
         D87Q==
X-Forwarded-Encrypted: i=1; AKwUvBweRlwukUxRzI1cg45NPX9QwOGHCAEzrcgUClCoSLEOP67jS0jTO9zBj5NwNOi52PhIEbWLWU51nwUr5w==@lists.infradead.org
X-Gm-Message-State: AFuF++kIFHStd9L9umKEqoBA64Lmlju28Sln17SUHto5M/KYISjBshMv
	0QO6zzIIa/kTgPHFAh8567bPf00VVgX7PCR+wKZN0vBcZt9lObwhxod0VpohNXih6N4=
X-Gm-Gg: AYBFou1ThP8QFpBH4/cHul0m9nMUGeaR4qd+BcXG7VgTUlRoJlpj875fg0XlNa4SoM+
	TcYq4IQ2QmZkThS2llJLeRS7+dMPo0LrAQaGQ0cD6p20FtjFktkol/YKavkWl6tv4FXmTj4GGvK
	T7XBB1mzfKECcteDqkbB4WTUb2fmREUZOLvmBbx60kBYgkj+Jhd5M66HtljpQjDGp4FeCVEv2Jn
	hyzUgXNkyQzayUkdnHdkpcfgRBaeKC9tBsO3DwRMTrcClSSe4mTTFRujLRDfImdmajLqv6K3imy
	tA47IIvTBIdb3BC0qZsrwMlz543fq6kInHB9v2EmJOexNanPyzrDaN/DB1x2RiDoZTjpF5vacgQ
	0Ud60ZNhI1CZSG3GE24Fz6w9SyW8roRR9xyIkVhYvmxxJsGnei2zW5v+CSaemtEd9rAKGSmoOx9
	iw2RigOOX2aewExXGpGJ81AHK0o75vMgqXU+Gg1sQusCLH21lvL+zNeYgPWaCu018RDlwN4cH51
	IGJmD4tbuXnSiGJ1a3P
X-Received: by 2002:a05:7022:512:b0:146:84fd:7b58 with SMTP id a92af1059eb24-15d2e03cf39mr9053699c88.9.1791388670115;
        Wed, 07 Oct 2026 08:57:50 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16168f586f8sm9457788c88.13.2026.10.07.08.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 08:57:49 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Paul Walmsley <pjw@kernel.org>
Cc: Deepak Gupta <debug@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zong Li <zong.li@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] riscv: cfi: Bounds check restore token before swap
Date: Wed,  7 Oct 2026 08:57:40 -0700
Message-ID: <20261007155748.291814-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_085751_164389_FFCA36E1 
X-CRM114-Status: GOOD (  11.77  )
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

Currently the user-provided shadow stack restore token is not checked
before being used as the address in ssamoswap.d. While an invalid
restore token will be caught and raise SIGSEGV, this happens after
writing 4 bytes of zeroes anywhere in the address space. Check that the
restore token is at least a valid user address before the swap to ensure
we do not scribble over kernel memory.

Fixes: 66c9c713de59 ("riscv/signal: save and restore the shadow stack on a signal")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kernel/usercfi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index dec0ba5eff5ea..23c4d6d9d8cbc 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -206,10 +206,13 @@ int save_user_shstk(struct task_struct *tsk, unsigned long *saved_shstk_ptr)
  */
 int restore_user_shstk(struct task_struct *tsk, unsigned long shstk_ptr)
 {
+	unsigned long __user *token_ptr = (unsigned long __user *)shstk_ptr;
 	unsigned long token = 0;
 
-	token = amo_user_shstk((unsigned long __user *)shstk_ptr, 0);
+	if (!access_ok(token_ptr, sizeof(token)))
+		return -EFAULT;
 
+	token = amo_user_shstk(token_ptr, 0);
 	if (token == -1)
 		return -EFAULT;
 
-- 
2.52.0

base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
branch: up/cfi-fixes

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
