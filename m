Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BD8C5475B
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 02:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QgwP3/rIJxSXkZHzzepBSL7FUIwo8IXCH/q5z+o5ORA=; b=Rl5vhrb8vRP+R0
	2PBdk1EmGLp8/vJ+Rpx8hXAEIgL3GYzic12jxivVselZxDmbzyp5Qbh3e2i8bzTHQ8ntQRoBOjKmt
	8ZoH+NSb3Q0s/X5CoNM1NfBeMWjLUmEX8yD+Daht9N2xHk1FfsKGrKY4+7T2KZjTZwnofdaY9aEtz
	RXai683mkeoYpN5FO/D+0i6s4K3CjMwvoKxg+TEs1NNYOJ2/isZ/J3Qhr0pF3ER5fAty2h8qVdKI2
	n/YgIkWHEw35iqlkHSKOE7SaewstrAUebQ5E87rR8pcXAP85dSqR6ejJSSiffFYU0Q2wIwdymIawQ
	McNDsTrT8E6TgiCFtDXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjrkq-00000003z6j-18Wx;
	Tue, 12 Mar 2024 02:20:36 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjrkm-00000003z5q-2YWs
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 02:20:34 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1dd878da011so13414255ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2024 19:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710210031; x=1710814831; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MRqA0g05W48N7EVchL2+ZCRtUYEZmKtpe/WU4nz0oWY=;
        b=HLbfExhFoWmOHFXeCiUgVNssOTEOXCScBOu7zXsVDsUldPEd/vfd2zsl93XineN2/x
         8JvE/6FOUKq9eHSJm2TO9PkoWeNNqSoLuh9N8esPGTj1xYCG/n95f63uAnlJo8JcVMEM
         iM2+PJ6qvWHcGbCi35LeiRB3IjGr3z1d/iU4riac1YrNBM8tl5c8WtVUTGuwMa+fTxoQ
         6wGnTxMw9GQdluMRTRjxo8bDd3w+VtoqzvOyB224kFCPsZDRVwwuIJe2XoFWaauW8mxI
         NLFPNIg8tFsPlpeBQQP06ZBOYJELMKEqpMlPzGKYWAYU4kIJlbgqMn9tmTTx8/0QtndI
         e5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710210031; x=1710814831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRqA0g05W48N7EVchL2+ZCRtUYEZmKtpe/WU4nz0oWY=;
        b=iGjgx4+AWNCZbb8FpF3/ytC8awpCqYzRhi5f8ABg44f4MjTNrzltOEuAtAZwtZ5KV4
         nc2FG+MXGAc82SWMrxmMmzEZqm4XpW0C35f4Hqo4LPvP1JQgbWWJltLE4XoZHLMU6WZY
         naS4LptReOfHiNcwWU8Y3PksJGiZdtnioLhR+5mpCisSKIINputburO3HyyX4PxjA7Q7
         KecWhxtXcuVHOnak3ShWijCRIgq8W/125lPpHPE45PPEIObbAbXuTGEUwMt325ERYzMb
         caYeDhzrm27RRsudECCOUSq5OkrquBtkXF4ruIm+cciUtKGeuQR9j9pyvpdGdWVtgxTP
         6yxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEC3wmEE/0vy1ClI2qnQ5KqvBRYqNWFxDva+Y16AiQglacfNc3iFpiA0xzj3hOIdpZmFZWAMS7PzwAVzm3wpRpDLi+g8+HViuFV8YWU6pG
X-Gm-Message-State: AOJu0YxAdth4RuxKXib7mVokE21f6MDMRv/0ICn4xgSGhVF0IhtHqV6P
	o8luo+XHLoBTijhAGtRLe/CahbRrALxv0eNkZQmEMVDfLhwZ9gC76a0QRDKc2Ys=
X-Google-Smtp-Source: AGHT+IHRzmrrD/vL7SV/zQC2oOq7RNpJg6XVo2QWxnj/zrg5gCaGqRzQXEVdk40YCrf7mEvIJxwvJw==
X-Received: by 2002:a17:902:d58b:b0:1dd:b6b8:a689 with SMTP id k11-20020a170902d58b00b001ddb6b8a689mr572370plh.6.1710210031582;
        Mon, 11 Mar 2024 19:20:31 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902ecc600b001db5bdd5e33sm5394175plh.48.2024.03.11.19.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 19:20:31 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	stable@vger.kernel.org
Subject: [PATCH] riscv: Fix spurious errors from __get/put_kernel_nofault
Date: Mon, 11 Mar 2024 19:19:13 -0700
Message-ID: <20240312022030.320789-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_192032_752847_F1C831BF 
X-CRM114-Status: GOOD (  11.56  )
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

These macros did not initialize __kr_err, so they could fail even if
the access did not fault.

Cc: stable@vger.kernel.org
Fixes: d464118cdc41 ("riscv: implement __get_kernel_nofault and __put_user_nofault")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---
Found while testing the unaligned access speed series[1]. The observed
behavior was that with RISCV_EFFICIENT_UNALIGNED_ACCESS=y, the
copy_from_kernel_nofault() in prepend_copy() failed every time when
filling out /proc/self/mounts, so all of the mount points were "xxx".

I'm surprised this hasn't been seen before. For reference, I'm compiling
with clang 18.

[1]: https://lore.kernel.org/linux-riscv/20240308-disable_misaligned_probe_config-v9-0-a388770ba0ce@rivosinc.com/

 arch/riscv/include/asm/uaccess.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index ec0cab9fbddd..72ec1d9bd3f3 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -319,7 +319,7 @@ unsigned long __must_check clear_user(void __user *to, unsigned long n)
 
 #define __get_kernel_nofault(dst, src, type, err_label)			\
 do {									\
-	long __kr_err;							\
+	long __kr_err = 0;						\
 									\
 	__get_user_nocheck(*((type *)(dst)), (type *)(src), __kr_err);	\
 	if (unlikely(__kr_err))						\
@@ -328,7 +328,7 @@ do {									\
 
 #define __put_kernel_nofault(dst, src, type, err_label)			\
 do {									\
-	long __kr_err;							\
+	long __kr_err = 0;						\
 									\
 	__put_user_nocheck(*((type *)(src)), (type *)(dst), __kr_err);	\
 	if (unlikely(__kr_err))						\
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
