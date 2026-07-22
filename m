Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70B3C44539
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 14:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7NUGfyOm5fmQQxID69nVlux4ZUI3CPj++k/F09u1G5o=; b=EYJr3dyKaO43nh
	QpcVrGA2ky/8zEriKjSvQoPesiLTpLDhkkXk7bY1Co9dqqkAWOMQ9+xPoLZ54u/cDAocEn0uLVycV
	ve3/vut45BUIqNydwSdNSjNsrGxcGeqP1n8a7bh44kgKWpBpMIDTbcdVkne9yQMzmJC9qMbw7JsAm
	4RXp+MhoQssG8Pp2pEZiRkGkvyn/zgeZlzGEZ2wzkWMAzqq2vtWybWgWGIJWU6hDZb+nu/iakb/Dk
	1A+kcATKf3ZrSjYn0AC09i97Fb4AjX6ZgXJ10IllTjioAbAsyGDFCAsWZ++Bk3tpV+9y1ynBGcfDu
	MDF81Vwzz0TOdvlDVQZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXWD-0000000Bycw-2ZB9;
	Wed, 22 Jul 2026 14:01:53 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXWB-0000000Byac-1KPV
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 14:01:52 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-84e27035206so72271b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 07:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784728910; x=1785333710; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lhfzR90Z74WPj2CRcWlLERVPxsI4JJvonp11/p/J06I=;
        b=SqzwlMrf2p9EEYoHmF2O0HQCiw5XLwoPx7IMAev4Od/1Kayjnd8OzEAM77qrKgYQfy
         V++kOaFUl1dGrGLRuc594OobHrFf8xT5dqiQE3zVeMe9RnTMSTwi+QxhDc1ux+L9NR/v
         iv5QufJWc7/QeohLpgKjFnDUIzSdAGCYoV7GmA22AOemZ7sfsrS8kr4SgCPd+eXELSMY
         f981eCKaP/iu+AFUWUnCKYj5lrbF9HpKA0JxzHPM59WHOAcwyKdtXpgdBVzJ+9BRv0rX
         Q6+tXv0XBjw7SSvnhLKrYspQ39XVSirByo524uCM9LrRYqixxZMUzVvNjSSVDNRLPSh2
         tnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784728910; x=1785333710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lhfzR90Z74WPj2CRcWlLERVPxsI4JJvonp11/p/J06I=;
        b=TwakZUozOzUAW9HtGsGMOfQX15vfeogTfCWsZ2G3uvw79O3i1bFHRjTs/p62ylz1N3
         6Fr/HMUjzKzVFzg7Cz7s5s7ZyGhPQ19qG2CIoU/gN4ot4MdIIwtRi21aES1V58shEJo6
         dn5PA3aebeOHRRt/k1UfEcgsqGuXb/VGUhrcS/tmFLo/H/C8M5J+mhdnWnIX9ET+wFg3
         WEWWfz8m8P9DsY2N6DE/qFgG6DprcTMXdGC0yRdI+uzbPdXVUlwVg0BrdJglydabD3bP
         fh8M7qNDjtwtcb8XY+USOPW/GxFVmVtKVYEHQZmAt4eMT0TkXm7SRojaWxYDT+192LTK
         chDg==
X-Forwarded-Encrypted: i=1; AHgh+RriSKKq3lZ95b+44EFOpLcKtYPE2vrxfceCZxBT2g97GkstReKSXpI825IR4vTHUlxhnmeNhu/7LJ8Hrw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHucQs5Y1p6F4GKxYSuhr8cbA+0pouC9zcJjj/uPFQJbO41aXA
	jKFfvPQJcv3cD133ib7GflPBM8Zy3yuATMhc1S88ykmd8w83+NFxUjaW
X-Gm-Gg: AR+sD11C9ahsQ/tAb6byDIlvF+4bGbvf+YFyQ5DZ7K6fP/qHWPgQ+J97Noh7CtQUzHN
	EjqoesOHFn/slc2RS/AmRuW4imbzEiJS7TsEHYnai3/jEwB6/N9KBqGMabLQ/oYKO0mF63tEeOz
	p+I/1uhkUf/HxxJN6FQ4DZE5NJK8/2zWhZ7F2rKsAk7KWiGEh4OD+I9VCP7T24tD612nBCm0Weo
	LKwqm5VVb9CthzH8BVrXm6IC2b8RFADPwcbX8cBe5pS+rP9W/eaJmVJesIuAcxxc++UH5WMN/IV
	8OCpZ8rdqgH2c1B51dqGAVZrQnmpJrk5ZjllJUP2gp35dQcFA32GRGRiY2AhHyoImvZLtXGoFVc
	b7v2g3s/79SHG6vt6lV0F3D6Lwq/KrJuXNSrPhBuKPL5hLlEbRFAwJ+KpBAq3Hw3AXeHhonKEBw
	HYa75w5yHd8bUDEMirFpDe3c3/oNlL5gM0IxENc7tVmeYKQfg=
X-Received: by 2002:a05:6a21:62c4:b0:3c0:b3f7:e5e5 with SMTP id adf61e73a8af0-3c3ad65cc12mr24097620637.25.1784728910120;
        Wed, 22 Jul 2026 07:01:50 -0700 (PDT)
Received: from computer.goose-salary.ts.net ([2a09:bac5:40b2:277d::3ef:c9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1a8a1fsm1242281a12.26.2026.07.22.07.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:01:49 -0700 (PDT)
From: Varun R Mallya <varunrmallya@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	bjorn@kernel.org,
	pulehui@huawei.com
Cc: alex@ghiti.fr,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	puranjay@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	varunrmallya@gmail.com
Subject: [PATCH bpf-next v3 6/6] riscv, bpf: Remove BPF exceptions from denylist
Date: Wed, 22 Jul 2026 19:30:13 +0530
Message-ID: <20260722140015.1982158-7-varunrmallya@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722140015.1982158-1-varunrmallya@gmail.com>
References: <20260722140015.1982158-1-varunrmallya@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_070151_356383_80CE1857 
X-CRM114-Status: UNSURE (   9.48  )
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

This patch removes BPF exceptions from riscv64 denylist on
BPF selftests since support for exceptions has been added now.
Also, since the file is empty, delete the file.

Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
---
 tools/testing/selftests/bpf/DENYLIST.riscv64 | 2 --
 1 file changed, 2 deletions(-)
 delete mode 100644 tools/testing/selftests/bpf/DENYLIST.riscv64

diff --git a/tools/testing/selftests/bpf/DENYLIST.riscv64 b/tools/testing/selftests/bpf/DENYLIST.riscv64
deleted file mode 100644
index ca1beae7fe8f..000000000000
--- a/tools/testing/selftests/bpf/DENYLIST.riscv64
+++ /dev/null
@@ -1,2 +0,0 @@
-# riscv64 deny list for BPF CI and local vmtest
-exceptions					# JIT does not support exceptions
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
