Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FB9D74978
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Oct 2024 06:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M3xsLHyiafUVMD52208UZirq6PxtgTW/RtKF1oB/+Rc=; b=4ChQq7HPtI3GE1
	QB0eb/KrTy+qN1Mo73tX95A+8GmSLZ8IzleDwC7ATtu0+rFCx9BE+P7R32DIT6iKPmGwQ3/sPay4q
	EZhEFImDnPhZRv24CheET9ddVjBcphOvsxUO9PjUYQPaJRGaDrZkRsR6Yn3Cy38uBgX/EtPiatvJW
	cKfby12xIDhqDLzMyRM6XPzaEk7dsy5W/yKkd2scevVozXQ4yKl8Mj9swIj64UBA+/2zHq2Q6RjqV
	lpUipP7QZ4KTLiUZlLQNBTt9IbR4KpI+6Uie2rwLE+1B1k6yThRosJ74pVdD1qrBQMxHTV0hTTrSq
	0iNF2m/4e2uESEB39+Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t62RN-0000000H0fh-0YXF;
	Wed, 30 Oct 2024 06:44:25 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t62RJ-0000000H0eN-42wF
	for linux-riscv@lists.infradead.org;
	Wed, 30 Oct 2024 06:44:23 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4314c452180so3143415e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 23:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730270660; x=1730875460; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MmAW25Xq+08xhdq2HO0pkvHqB0sZSIrEGg3huWOKOV0=;
        b=bGb48Ph1qBacTy7CCdSpgBgNcnko1QZwpozNBFfRwcBw46O5UPVV/FBS3eLwnNIBQI
         ai2zAl20QSxPPjNHSby8qMMnQ4jJS7woLdUs3ViiuiWL4VMU5TlFwLzIM69MQzgS/KiD
         1jmvfFK3XO0v3g01pbKDogWryKkoAg3dOKHSSOC2f6S/Np+vcfXZUrWm6Ivax4lOOr0h
         v1DGWUWpL0JYyQ33cIjo/byog4H7or85FO6Iywwna3XUQRD2AarDhfQcyOIcGlpr1lB+
         xZdfPcaEgT/K+wdf/G2asdwQrR5rab7POo/q9n/LwnsP2E5bEraWqG+rIFepYLnOPulY
         cuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730270660; x=1730875460;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmAW25Xq+08xhdq2HO0pkvHqB0sZSIrEGg3huWOKOV0=;
        b=X0g4UgXESskWJF5aEA+9ayrp2XIxmNiyzPjN7DcZBxTM2nmy1M0D8xEaqdiCWsCNki
         s8tAQPLLn7injGQ2Db2lEQgxz93/B2xKXysWqlMF5igrbwoo3kzdJYZwyj4sHtp0Waza
         VQDsvzRr51psK2pHaKh7WoNqYMWqJkmveUnhEMavAd7OnNJtpAW2riI5dxm36or1mj78
         DtGfHIFD0v0C17hJ3YHnnR0J26B7nCg7bcXksGypuSCToSYBbyBoGE0IgX+3cEC6VV3p
         eeCNavxyO7wbnnJuloPWtKhD8UGGnzTTTDg81EvnhYLqvSG9L2UeOp5F2XnXFu91cf6w
         U7Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUosQYyABS9f+2r7Y0sU00WBZlcdbFXXXY0LNqu4tytGauF5ahVRx2CbSBGOub2uP2W+H334iQxdM5Kow==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwnd30KH0QKBplGdo6OkWvkZggG9pNTNQ2CznEcioY3WcmDEKa
	OS7A8sSQbp9x6mFrsp+L7L0JGbd3pu2HWRsdWpFsgW82Y707tgrY
X-Google-Smtp-Source: AGHT+IE04UHobsipZRhjEUzyXYGDVgV5T/lYJ6JQc+mK46hY0hvvTcPS2K/ZH1cAZUvWtfyIwLDZ5A==
X-Received: by 2002:a05:600c:1990:b0:42c:b826:a26c with SMTP id 5b1f17b1804b1-431bd703983mr8293365e9.8.1730270659725;
        Tue, 29 Oct 2024 23:44:19 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9ca704sm11249655e9.41.2024.10.29.23.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 23:44:19 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/2] cpuidle: riscv-sbi: fix device node release in early
 exit of for_each_possible_cpu
Date: Wed, 30 Oct 2024 07:44:08 +0100
Message-Id: <20241030-cpuidle-riscv-sbi-cleanup-v1-0-5e08a22c9409@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALjVIWcC/x3MQQqDMBBG4avIrDtgYhHiVUoXZvK3DkgaMiiCe
 HdDl9/ivZMMVWE0dSdV7Gr6yw3u0ZEsc/6CNTWT7/3T9T6wlE3TCq5qsrNFZVkx560wQhwkhhF
 uTNT6UvHR4/9+va/rBjbbwBRrAAAA
To: Anup Patel <anup@brainfault.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atishp@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-pm@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730270658; l=1106;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=BpGY/eDm3rqBN7WhGt8Gp/hzEZK3r2dryyGFB17Y+qg=;
 b=Fi6G0zA8GxCLTTdxKa+iqQDjcH+qVUO0DqHCmAOYnKZNPnjqlM26MfkkjHWg5JOGPx43G+3hI
 BaHi4Gjt/YkDDRSSo/e1d/N6fxTxCtY3SXoh1IxP9YGLfFYEhCmY8qE
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_234422_042083_FCC1B0ED 
X-CRM114-Status: GOOD (  10.21  )
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

This series releases the np device_node when it is no longer required by
adding the missing calls to of_node_put() to make the fix compatible
with all affected stable kernels. Then, the more robust approach via
cleanup attribute is used to simplify the handling and prevent issues if
the loop gets new execution paths.

These issues were found while analyzing the code, and the patches have
been successfully compiled, but not tested on real hardware as I don't
have access to it. Any volunteering for testing is always more than
welcome.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (2):
      cpuidle: riscv-sbi: fix device node release in early exit of for_each_possible_cpu
      cpuidle: riscv-sbi: use cleanup attribute for np in for_each_possible_cpu

 drivers/cpuidle/cpuidle-riscv-sbi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
---
base-commit: 6fb2fa9805c501d9ade047fc511961f3273cdcb5
change-id: 20241029-cpuidle-riscv-sbi-cleanup-e9b3cb96e16d

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
