Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F467C49EA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2024 22:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W5r35F+pJnG8S45PnHFdlvs9nNGp8dbPuMXpPOe6yuE=; b=hy95lHLpiDrZ0T
	OVovJZAw9zFfJNluxyPI6LZ1hdvE3oftAhtrD0wpOJ1v6eX/S3WLxuw4WVhEtSI4cPsvvt5zjUDNl
	PbihEzhMMmenPyCNfrpAAisajFErdG1o3Wr7s9DpzjqbEO/zC3irOiA2onfyRDRomaLz+7ixWgNhB
	RIXPURLN5f8EBcibGWDu9JnJa78vZsflvv6qpgJh/q/jwKEIyoD6NAFYN87VsqrFvQpFb6kuG+Zp/
	YqfS5UdwAsIFQgkfr3VqEdWlffcWQu37AcDVtLqS+aD0cG68FGNfCvNjfI/sECAgWRrju7RrLrbi4
	TrcKdLr/5LVpnmy828FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbSFN-000000034VC-3qEa;
	Tue, 06 Aug 2024 22:01:37 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbSFK-000000034TN-1hBv
	for linux-riscv@lists.infradead.org;
	Tue, 06 Aug 2024 22:01:35 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1fd9e70b592so10170195ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 06 Aug 2024 15:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722981694; x=1723586494; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJmmhRnSimDCA0DfhllOkj12P3+KFgh5jbLsFm9m3KY=;
        b=tLAbKp+c+8590n3OJ9+rdTTTQth8lT8beIpT4Bp0kUHDpB2Zzrfe2DQm6UVsZ9sjFz
         ur3xIGaEeep2CQxQNqHCV6u5gPlyec1zQVF8Yyv3oudfCGcDJrDIY5R0voE/Esoa7sbI
         DWgC80YP9R4VQraAGK6bEgaOnGE28wVwKmMP5BN+eNpbRKFd3gSGrihPj6IZCMSL850h
         7xusP2JgmXb3UDe2RMTvJmT72xzI0saI2g0loP0NFptnx4fbxsAHPGn/7FvqwDMQhKyl
         S3OSVkWhCHqWfCptAO3op5ufzpH+G5YtafzYzX+AYxw6NlN9jVh0e08DbheP5+K+yiBC
         Bhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722981694; x=1723586494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJmmhRnSimDCA0DfhllOkj12P3+KFgh5jbLsFm9m3KY=;
        b=AUtRmltRIJPJwedudkBDsbsX7AzxCiXUe7zgCPnv5CyHQ0WDnjSmJSDSYv1p8U2mAO
         K6DtdBbE7h5zF83D0tZMjsLXz0SJQKN96ufSrVsuUxj42vwMlAtcykq9B175QZ7I6Lz8
         3agppxwKoLSXoMC1a1SucySoFmPbjC0iN13lCVbgQ4NVGZ69Ee+Fk0Sk6Qgk2nXXHX7C
         QgkPCr6wM6EwYtjKCE+eTK4dueemCen78XeGitHJzQCnb4tgE5KiTdM1OCfRwhmQDAAS
         xa2oNGFK/ypkWDo4h6NGB0zeFYoqqV8NAP9EJZYFCUhXKr5mYBKRrDFYHbDOoskyG8qA
         rUqA==
X-Forwarded-Encrypted: i=1; AJvYcCUy8TULjh5AiAYxQ8dhTOUe7GIrLum2MThZGO/qaHmsmZG32FGEnWfHYAjrZINJN2bnTJMjLCcL9Fl9rbhBxUowYhM/nJn6Idkb19pEOSGS
X-Gm-Message-State: AOJu0YxI3cF2eoVaWrYLDYSI04xlYJbyMCqCOR6H3BAoK5+0lkq8MSro
	d4glof+jMU88L2MbagdVJr1TW5hl1rHpxA3VGXroosiSrbKnj/os6QuVK0l8NaI=
X-Google-Smtp-Source: AGHT+IEWeETuurba3ThRvk61Rcu8424k5tbYlxPJmgWMim8efAQl2JQ7VbuZiF1Qw0KHvZ58myqB1g==
X-Received: by 2002:a17:902:ce86:b0:1fd:a043:e3fb with SMTP id d9443c01a7336-1ff574e385dmr148056055ad.63.1722981693336;
        Tue, 06 Aug 2024 15:01:33 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f27340sm92578425ad.17.2024.08.06.15.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 15:01:32 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 06 Aug 2024 15:01:24 -0700
Subject: [PATCH v2 2/2] tools: Optimize ring buffer for riscv
MIME-Version: 1.0
Message-Id: <20240806-optimize_ring_buffer_read_riscv-v2-2-ca7e193ae198@rivosinc.com>
References: <20240806-optimize_ring_buffer_read_riscv-v2-0-ca7e193ae198@rivosinc.com>
In-Reply-To: <20240806-optimize_ring_buffer_read_riscv-v2-0-ca7e193ae198@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andrea Parri <parri.andrea@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722981688; l=988;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=JuRtxgHas7qW8HbkyhiDj2rMQVPrQdaqrYeR7vQQjjA=;
 b=L4G828in6P4VvsPDE9SYnotwcp2IAxWNTSxHkka7w/LXWCcJztnlELCpYajDBeGp0Om7i0Sis
 YWMQr6+ro6VBGAOmcJ4u/yy+EXWBEh/BiHRKIXXYnUxsgZ5ETVbauth
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_150134_477421_12E39D9C 
X-CRM114-Status: UNSURE (   9.46  )
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

Now that the riscv tools tree supports optimized barriers, use them in
the ring buffer.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Andrea Parri <parri.andrea@gmail.com>
---
 tools/include/linux/ring_buffer.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/linux/ring_buffer.h b/tools/include/linux/ring_buffer.h
index 6c02617377c2..a74c397359c7 100644
--- a/tools/include/linux/ring_buffer.h
+++ b/tools/include/linux/ring_buffer.h
@@ -55,7 +55,7 @@ static inline u64 ring_buffer_read_head(struct perf_event_mmap_page *base)
  * READ_ONCE() + smp_mb() pair.
  */
 #if defined(__x86_64__) || defined(__aarch64__) || defined(__powerpc64__) || \
-    defined(__ia64__) || defined(__sparc__) && defined(__arch64__)
+    defined(__ia64__) || defined(__sparc__) && defined(__arch64__) || defined(__riscv)
 	return smp_load_acquire(&base->data_head);
 #else
 	u64 head = READ_ONCE(base->data_head);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
