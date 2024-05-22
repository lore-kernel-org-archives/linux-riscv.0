Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181D6C25B7D
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 02:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kpnDltMV3FrGoxpJRTJNU7NSu0iNT3Ymhz5QHt/7ngQ=; b=aqtLcf/O+AFsXoszLJUjcvooLf
	aHFBMlaWMez5pSzUD3IrU3TIryS3BlaNjHAzOKEg/pKLMV/T5593d1Te/l8TWEC7AAQ5BlUbiP1wp
	5z+OXtxCX7QVKKZHFHpY0TYLxKecFvhKuTmPO75dFQyFgOfnOSxxAQ2ANm4Fr2zixeGwC3FAXYdvg
	pe/spaXZng020AF85q7AoUT1n6JjEhyPYgJO6LBn35PcUmFKbnR+yRqeP4j9mCqV2To4wlb9YaDmq
	QHYqNqyomF7wQ3Be/Gk+A7hgHAmTFfPqP/iMnwgwOXOUonO6SKGWJKlnq3VjP2J7qWMDi1DjnWlWn
	hpP+ETSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9bWY-00000001jQ7-3J62;
	Wed, 22 May 2024 02:16:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aLR-00000001Tdx-2Yxa
	for linux-riscv@bombadil.infradead.org;
	Wed, 22 May 2024 01:00:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ICjb8r/0X2VlW3crKp/bODhAG5H3VpO5yUTD4XwYdkM=; b=H41PWFa0GfSDdu2WxSkEUuRUx7
	NPqH1eJfCzjXM9sA9yt5cvDDETBpUTOtCf3MPOSwLUDtb/5GoSL1Wk7kunVbT7OCcWph7ZmG2aVBf
	MAAeojFuors1Si/Fs4Gwj2GDj7USFXM5Mkzamxx9K6eEZ1Y/RneNQMJdUh/BtrGhs5TAA/46mBB9H
	pAK+jPy71qLIOnvHlHXHwdiZFaE3CBGDNxoo6FE+1Oqa3dRRv5kOnknjJrgTX4UpUXR66cYWcn/mA
	FD5Uy7xHYGrn0Nfigo/D07Am44jkhcAyFiTK0albF1voVRuLIBKVL+NFSZxx1eWEMsUxwojti2lPK
	tA63MQSA==;
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aLN-00000000Ajf-3Ypl
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:00:39 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-62a379a7c80so229074a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339626; x=1716944426; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ICjb8r/0X2VlW3crKp/bODhAG5H3VpO5yUTD4XwYdkM=;
        b=aSEWmhGImgiRhGP+bYp0TO3rVpnk6e0X9oS+nxZLNKGD02/voDLKHtQ+y68TvMQzB/
         qZlvoSvhF9br9tUY27XHH/Nkjod1zTUYoBaH/8Zgy4oRKebBFtBzHLzNNjNNgI2vTZRo
         zZajrdxnBMgyi4nLFeeA36hSnOJeLHZ+08xCXsXznMEFnH0y15AVRx7J96bTklLvgn2j
         dlyTX3dHP++o+Uxu9sp580Tr9pvss7+/7dlxErkebdiOMWqw+aG6rFXVVt//76uFWgtW
         theoJ4RQ5YFmC6bO6gGrLQ1yV3SC8OiTNat3EvaNtpvNtZyq52Z/IUgC0W9caxK1Is4O
         K48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339626; x=1716944426;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ICjb8r/0X2VlW3crKp/bODhAG5H3VpO5yUTD4XwYdkM=;
        b=ux0BW/vyG6M0T6P1UUTf0YAWdypwgb4a32FrKZHtg1cvRnCm/82AVPKQydmt+qvUCz
         RWEKcuSwZkjULXfPNRnkqzle3aOG1LRb+rpjSFXVqa6gPfCRNAUj/fqmSp0ctoerP9wo
         05I9OH/MojGjmTbN/ue4rfXTkEXEss4ptQw5PeCWpD776WegdQ2w5dq1OzaG61SE/wgC
         o0FOEXPFR1KUXJ2f1xrhJBW++WiCIiZbvdzBGfzBI0IOl8V8xA75ulwSc7rtn/1xKZXK
         sbsdBU1jm7fDD1kxJxVV++8shGqE5ysfHjwnAsAXPUEr4EV8LkNxDmYdwz/qhiiBMDJa
         7XUw==
X-Forwarded-Encrypted: i=1; AJvYcCWeDrtNZQNW+M+oq2XHFi+wU/706mC5hNjvibK1NQt3MotSH2bcDi6jsfbzQRTLEoYBbmhNp0rLXfne3eZD346OmVQ6+B0IereLyYPmivBv
X-Gm-Message-State: AOJu0YxfkoxDSG8IBzgjD+0SAS4iuvY2gUqB2Hm5EPn2j5nYt8pUdRp1
	+0Og19lD2w+BLaXvAS1YZRsQpJ0iKRSUKKkMHrXk2Hfr4eyEcC1incar9im66B2L2R1ijt95Jy+
	Icg==
X-Google-Smtp-Source: AGHT+IFVVN1hN+8KBf9/+c7BLP6SPEGkbks7vo1HQExRs2GPHR6ceK4qQ3u4PxzKSc59nuvr03+npLjv5V0=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a02:491:b0:5f4:246c:1406 with SMTP id
 41be03b00d2f7-66457fb8639mr36373a12.3.1716339625682; Tue, 21 May 2024
 18:00:25 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:05 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-20-edliaw@google.com>
Subject: [PATCH v5 19/68] selftests/fpu: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_020037_900126_BE3358CE 
X-CRM114-Status: UNSURE (   8.20  )
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

_GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
redefinition warnings.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/fpu/test_fpu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/fpu/test_fpu.c b/tools/testing/selftests/fpu/test_fpu.c
index 200238522a9d..53a7fef839e7 100644
--- a/tools/testing/selftests/fpu/test_fpu.c
+++ b/tools/testing/selftests/fpu/test_fpu.c
@@ -4,8 +4,6 @@
  * module to perform floating point operations in the kernel. The control
  * register value should be independent between kernel and user mode.
  */
-
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <errno.h>
 #include <string.h>
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
