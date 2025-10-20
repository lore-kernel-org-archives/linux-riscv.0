Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E63ACCD193
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 04:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ur32O8lVD5YFcZ1/ZMAkjAgpvCmhLBh2cL7fEZWy0Vg=; b=z63EV5EDr43iqM
	99ulA7kR+bgrqoqN/vM2Q8y+Td3JQoeuDdYF31Um1AdlGqCGcfieeSzm6HlgroMEe5kM+H/kqS9J7
	0+MP05slM4d6E+mHuAO6K4bNDLegw/sGoWNRe6joFTaWa5gQILYuQYV6EbJSnO+1JnrbejjrE1ftw
	qgwchZ2mTfqOwx2Ooafg4fRb8S6XoQWZDJdT7T3wR+FjTHyoLBZ5WCc/br9FzGVGwGVAvdWQVQcjB
	lZ1NxaNhZfVWAhYvuEtQx3rmT77Tz+lCIQzNTwdT/DkfO3SNyO4Eg/VCL2EFfj4tj5HR6E0qhWX2J
	MtvhKlzX6F3cFeu+po6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhOd-0000000Bpgb-1M9R;
	Mon, 20 Oct 2025 04:21:23 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhOZ-0000000Bpe5-33Il
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 04:21:21 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b6093f8f71dso2630653a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 19 Oct 2025 21:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760934079; x=1761538879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4l4TBk/LGXRpjovIOSrhrLfanQNTxjIirl6+Uo+sE8=;
        b=KXTdG67LvuVXXuNrdm1s88MyPZBTGM4lNwiBfSeHJGNzBTTX0bNhYX9zSPaz6dd8/S
         PTTOMPVMfXe/TedmLhmlv7cW0kjT8PkSVj/m9bAajxrHJFUsX56K7tVxMQSUuPUT9QMw
         Ei7YR2Lhzawr5I7/8EA2KMG+SzWM+e0UJdmezXfuTYwnXCZU3XS/i0/U6ghBW6OboY9i
         Yn7hJSu13S8YZVBO7tit/f4GaEgHj4TFfR/jyevpaD2yNW6J9zVSYfIbCp5gC36YwmmX
         +tcf+Cl7RaYJtQ8ExhY6Xc3z0zIuGFZ4hwhoGo3XcIWW1t+rNSWPboPQXM72Ue1Z/eUz
         TOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760934079; x=1761538879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4l4TBk/LGXRpjovIOSrhrLfanQNTxjIirl6+Uo+sE8=;
        b=adYmDsc8MOpF7XKxiutLHpwudJ8ZBjG29Bm05oM7/DC9uq1u+YLwB+kA68Hn5lSWaH
         1sNkq4PJuyssbK/msIW0WUIymYXPdgFluZXbhv3OgqWyB3cI534FHrOvte4yt1dS8OP2
         KVXUlaQoyPIEqPzgDlF97Vn4RrMBWcOhVLIqURth3Wf7f++jGuQayw9GqZkin5c81iQ+
         IyfUnzmI6o07oV7RvdBnIdiEhhCsgwxs+XceQnse/kb8tIMZdGcoK110xudJtOaqMagz
         R4i4nXkVmzA7rP5fZINADxrO4MZBi7dvv6Yr99Y8M+jSq+fGfkMga6bbCWzMixpOw8X3
         519g==
X-Forwarded-Encrypted: i=1; AJvYcCXukCZsNeLDfmVuZUnbS4D+kJIK2V24zqjMPtFOjiv7L022DgJDSOlGbQApkj+OeWRAbBlswYP7kHWW1g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpLYEGJT+IcJT/nnxJdskQBhOxpKBefCv8x1JbaNTc9lEBTg8H
	LMJtvt5gGSdrBBEkgNqhrvO2rDFdSRf1NFfdFPyvSq2Erx6QqhKUio+BAXqS1DaXgTQ=
X-Gm-Gg: ASbGncsH97WU9bAaOcp/tCyYROhaCeE6waB3RxMmcF9kDgSrM8+PRed6Ncwjm9H2Wkc
	HQJhmk/rzvX5FCFm8OtZEmAzpsY/WPrnHr1HPea5281rxd8jVHjGoCLzlmMLvzzg4VyLD59dGRJ
	9Zhil636AjQD+vjKuCJZQIgqCqXkODgaAfONUhYxHnScMxnDU94S2ovwuM/Y2UMgRWrwmTHYv4Q
	LsxOAbiLw/+REIDCiqo9RALPGoQRBCNCX0qf5CiyQ+SXH3j4M8xYlpqn+AjwRt5+2neaD0iVAYi
	jDT7UGrtfn9zQ+VWSEdKHvqvF5ROdlchLJGGnSL/kVSE9LRqlo2feWysWR6811matmIn2t/16lK
	ixDs19KCQ/m/34qa2b1mDgnF0SeOaJSXbs7xkA5k+a3pbLI/BTztdid6cC91JnwUZTdeIIODc9/
	W/Dh1CmNF4krWSXpL6Qu9nxR/jy/LqxQ7Xpix341tF3vlP9pRnhqZ8oqctRHHED37wqcscrMIAH
	wDntsrWr42N
X-Google-Smtp-Source: AGHT+IGSr6CeYbnbhFqLb/PEPw/yfGu/4coKFj18cuRK0sGNHLwIgZvYXiVeS+ZT8M8+GdgG4XcYZw==
X-Received: by 2002:a17:903:120b:b0:290:cd5f:a876 with SMTP id d9443c01a7336-290cd5fa92emr146909545ad.13.1760934078867;
        Sun, 19 Oct 2025 21:21:18 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ec14e9sm68762035ad.9.2025.10.19.21.21.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Oct 2025 21:21:18 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	guoren@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	lukas.bulwahn@gmail.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v4 01/10] riscv: Add ISA extension parsing for Zalasr
Date: Mon, 20 Oct 2025 12:20:47 +0800
Message-ID: <20251020042056.30283-2-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251020042056.30283-1-luxu.kernel@bytedance.com>
References: <20251020042056.30283-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_212119_794966_DB5FBB20 
X-CRM114-Status: UNSURE (   8.22  )
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

Add parsing for Zalasr ISA extension.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index affd63e11b0a3..ae3852c4f2ca2 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -106,6 +106,7 @@
 #define RISCV_ISA_EXT_ZAAMO		97
 #define RISCV_ISA_EXT_ZALRSC		98
 #define RISCV_ISA_EXT_ZICBOP		99
+#define RISCV_ISA_EXT_ZALASR		100
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 743d53415572e..bf9d3d92bf372 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -472,6 +472,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zaamo, RISCV_ISA_EXT_ZAAMO),
 	__RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
 	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
+	__RISCV_ISA_EXT_DATA(zalasr, RISCV_ISA_EXT_ZALASR),
 	__RISCV_ISA_EXT_DATA(zalrsc, RISCV_ISA_EXT_ZALRSC),
 	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
 	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
