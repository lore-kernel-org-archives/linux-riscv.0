Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09765CD1292
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 00:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6WX/nIbBJLhd8RM40NhzOxx+meN0uoiDZY+t+QtFRPg=; b=AiQ1qyOMskfHt/
	i0d8l3Z3RRHfayMvx43iAMeuz6WqqFwfdOB0KLJio8Rq6Nicgj6dyodiDFs2AZn7CvNI70h7wH/4x
	oc8tWGQOSHYvUvoqhavgpBcmcCBPimfugDiK6Zo4SOKtZx/N2GwQNvHHnbQTKGIsSWQXE0fUHXKj7
	0tV2euCLRovkrQ20dkqcwIoV4F/0llqQ+J4g0J/tJ6ayATdEKYtxcmlCct1wKOFsUDiu2F8rjCETf
	jIz/FH4vOF4YlHuBcbiVFbtkNqet/WNba1yiMRlyZcRCd/LpVwokMaJc4V62Rgup/WavtJdqoctHv
	QR/xNxc98YruY0Lgg4Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsBIH-00000000oPf-2pZO;
	Thu, 04 Apr 2024 00:49:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAFf-00000000aMU-018p
	for linux-riscv@bombadil.infradead.org;
	Wed, 03 Apr 2024 23:42:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MSiG1xhiflfyI9bPxIgqPsLfJsD+ZxoOiAqpJ0kRoxs=; b=n26+k/6jIgmJt96d5HwnfmuEJ5
	zJXeJH7ijsxCrUQYRPwCQQws7DHbwCGHhF6I0NDqgatvYNdeLZHtm6s+xWuU/CWJO3JWo6RPbzgpm
	tBRyL5pB+YmpzJO5NkERZKQC8embKfl3NLDS5OPmla5ot87V5+ojS31ujyXqeuCOQKVyLKB6YK/Vy
	BqiAMtiMdPt8v09jtGG5kM+4rQV0YsCT8s8ORuUQYwSArgnyRyVBCG7lz8ENDRxZAn6/SJTsIeTNg
	lp3NO7nDR1DPdvIkeLmxgzdnxGpEIF2evBCU3y8RLo8RKy9aSrRhHwtxJNd8vtGVWNGgCNFbtswx8
	FNJTS0Aw==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAFb-00000006jTY-2Qt1
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:42:41 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1e28be94d32so2957565ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712187751; x=1712792551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSiG1xhiflfyI9bPxIgqPsLfJsD+ZxoOiAqpJ0kRoxs=;
        b=Uu6WQm7wJ/+WJSs8lCZ8n1/Fr1h9EHzMmaMJ2A7t+idr+jO6rZBq+dz241VXVVXyvH
         OolzZQlL9zEloHFrF54V2rRoOABNE7afExL+xk+3BpoxLJjGfv14lxno7r4Ij5RjUkUi
         HidKAWTOiB6/Xiy6mFl0WlqOEqw6NwUyI88o3dq4JAs8VR0E57u4hfDYDR9Eihr3X5Pl
         RBHNHSl3XMCfsUfG2kASVbr7cEkbcql9/NfZBUO65l3U2Zuuo5FmJrVthCj3M8aueCAn
         jgNEVNAeanH34czK0YN1YUmGzuDswpviFSpbPRu+iBm2MKEdnUoqRGU3lCG/iS+ngg8a
         0mXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712187751; x=1712792551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MSiG1xhiflfyI9bPxIgqPsLfJsD+ZxoOiAqpJ0kRoxs=;
        b=q54u8CThBIKNEx0mRBHHWUErRBqVnKgwOOio3mkH4fPT7ecXSdrsMpwvNMEXnQFJk9
         iBpxNAbgLf7mLQl5IoSL3hG2m7rJzovoXxq7eJHxMSGiKwKymhgVDKcNQQxihMG1LS01
         Pzo/5UrS3aFCWcXW3iHoQe4Ck+mxaXZzHXwxWdO5ly3j+2FHW6fYVrCe4sQBWWNZSZTq
         UmHD5WodbWxH4unum/WJIQIY8uynVAl3G0I3i23gmmK/N8M6FRkO2nISYbX4mSW8NJ9L
         3nI/Vn1dnPp6Edh/6KZ6MVAVIMJ7OAY/GwT1pm3ej9XKNlE4XhteN1IBBg65lMQqnV4X
         4sSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJc0zR/1idAeSvMdhXRbRuI6BD4+CoOMoPc7pReyIdLkUMEhbVs5hPTE5zqjXwWhnT6XPezvIrkFcpvqXuvbJGPgnWz9/GOsBCxzKbd1bC
X-Gm-Message-State: AOJu0Yxnel5hvuKSkfN7oqXE1KAHRBF03BVp2v8nCb6ceRq7DxmWRmBt
	+z8qlfVpI4I+/4wpnpwTJ0yzZB5wHwOsMxIv+Hdwuz7/PfKq5W29UTyRSb/NmsM=
X-Google-Smtp-Source: AGHT+IFMW5tbyyAjWJEE1nX9dbuRREm7VgmFXgOohN5Mrb4B/RniQlSV9gFzsZCwXmsG8xWhwnLhWw==
X-Received: by 2002:a17:903:487:b0:1df:f6ce:c9b3 with SMTP id jj7-20020a170903048700b001dff6cec9b3mr824638plb.43.1712187751469;
        Wed, 03 Apr 2024 16:42:31 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b18-20020a170902d51200b001deeac592absm13899117plg.180.2024.04.03.16.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:42:31 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	conor@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	corbet@lwn.net,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lstoakes@gmail.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	hankuan.chen@sifive.com,
	greentime.hu@sifive.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	charlie@rivosinc.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	sameo@rivosinc.com,
	shikemeng@huaweicloud.com,
	willy@infradead.org,
	vincent.chen@sifive.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	gerg@kernel.org,
	heiko@sntech.de,
	bhe@redhat.com,
	jeeheng.sia@starfivetech.com,
	cyy@cyyself.name,
	maskray@google.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bgray@linux.ibm.com,
	mpe@ellerman.id.au,
	baruch@tkos.co.il,
	alx@kernel.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	shr@devkernel.io,
	deller@gmx.de,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: [PATCH v3 20/29] riscv/kernel: update __show_regs to print shadow stack register
Date: Wed,  3 Apr 2024 16:35:08 -0700
Message-ID: <20240403234054.2020347-21-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403234054.2020347-1-debug@rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_004239_622620_0D5CF9C3 
X-CRM114-Status: UNSURE (   8.28  )
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

Updating __show_regs to print captured shadow stack pointer as well.
On tasks where shadow stack is disabled, it'll simply print 0.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index ebed7589c51a..079fd6cd6446 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -89,8 +89,8 @@ void __show_regs(struct pt_regs *regs)
 		regs->s8, regs->s9, regs->s10);
 	pr_cont(" s11: " REG_FMT " t3 : " REG_FMT " t4 : " REG_FMT "\n",
 		regs->s11, regs->t3, regs->t4);
-	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT "\n",
-		regs->t5, regs->t6);
+	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT " ssp : " REG_FMT "\n",
+		regs->t5, regs->t6, get_active_shstk(current));
 
 	pr_cont("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
 		regs->status, regs->badaddr, regs->cause);
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
