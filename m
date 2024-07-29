Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F01C3DA61
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 20:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wkhAFkY3V2Uzd2vzm7zCu3otL0HoxdZQe0J4szX1pFk=; b=Eo043mvHC3EE9C
	6fEyV8uDxRkXjTKQYRjW+KfWoSsZ6gH6gJ64cxh2L7BgECZG3MveGKPbMPt7wbMVXpLlhjM4azkll
	7Zd52qOWfMSCJPc2qr3CgzDhrN4STPIOavDt8RN/qtEawiE9NwOeumnZG0k/Or21UuSxuy/DlTh5V
	RcloVaPtYfP25rWcyRRArOEhjrdNuEicdbcOoLz8dkUBLfJaxfuIeYRmrAzZwxFHBzvrM4KOixVpB
	/6/CATGBvPv6UB8TDzBOR2Bu/CewtqM+PcWefJAPwaROxpxTwTgJIssJPcwFW+o/IdCWVsdK8eOmT
	6WlADMUOE8S7VzK8v2FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYXKU-0000000ChRm-1Is8;
	Mon, 29 Jul 2024 20:50:50 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYXKQ-0000000ChQn-2moy
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 20:50:47 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7a1be7b7bb5so2760033a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jul 2024 13:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722286245; x=1722891045; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YALcHE45yFBd6B8M2GwV44w9Qj1q3iq9UvV9zldTY8s=;
        b=chPkduMBKClW5y8KMW7bElB1OQr661Dl5gQqFC+SKTkX9wtj3ikwb6JZJR+e4J4HYv
         sGsLujSIKlZKxRU7eEP283u+uLbPIprgtBTdm58ycNgt+r5gowxhLuLTMLqu7hj5H9+L
         mOUJKnUZjoJR4pDlRBG/zF7oTrTvCLMMzJ4/BKPw3U046cgQleEIL2XGBeRivW1dvTyj
         VWAp6wlaXG1rimujk7lrDHiTAHywEs+Si7I9cyYf1LTqzv0ER3I/uqN1ZOgpA5UzwKO5
         mp95utn0xGU4gNVfiAemNi7/LWrmMrItJnehG6LpExGEV3vVQzCknTB4M7K6pkCjXtp+
         xh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722286245; x=1722891045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YALcHE45yFBd6B8M2GwV44w9Qj1q3iq9UvV9zldTY8s=;
        b=wInBGpniQL16UnjNFnJcMY2izC2F7yj+V2/OKlgMuW979Q6BrZXbrFEgPWz0dKDHLB
         dwYuJkjaIYKwWw0gG+bYXMajjOoAxnJpcBZBwdiF2gTVQP+cMe0Wu+hnKj0c+QyzEw0u
         XgvRG1UGPQkin45RFkTBhzMd3afnaSC6Xm7zTACsO+fGMWu5eEwkGL/bYgVKntu5V2lE
         L+7+CoMTdy8JSjAyHtYDQaoJ1GECXnsZIC37aEX2ompoMTiakRXLvmJQ0KLxvIRpp0vq
         HZ2e6ZcudV8juu9KlWMk5YARPBLla7t/VdAfti+DKQXPFgIqy+Z252jmxLrL/u/NmfCX
         vcmg==
X-Forwarded-Encrypted: i=1; AJvYcCW4f4bqQMuaJ8KNgwA9eRv60OPR3v5pfM7buQ2/cD7AworlfGdJBHeAynQZBHYu4h1G6k2FG3i9me/ogmaUkBXBknregVjnCBE988+nupeP
X-Gm-Message-State: AOJu0YxCLq72Tv0R7WZ8VPV2Dspr9A7SfXt+LlJVmLLlh/RnWi9vdkSc
	0Bj9gV9uzBJMPMaLJoIfvrwLJp2WSdiW+WC6wNVDIxM/3PWYk6pw4kggxXLTQ7aAoQUW8G1NLcX
	l
X-Google-Smtp-Source: AGHT+IEDXOv0oX/69rDFZ/8mFt51Yof+gUeyqD/AVuJdZ/wo3n5UfYRR5ZPswAmeUMRaOEdviGizbA==
X-Received: by 2002:a05:6a20:9f89:b0:1c4:d4b2:ffe5 with SMTP id adf61e73a8af0-1c4d4b30374mr3193080637.54.1722286244829;
        Mon, 29 Jul 2024 13:50:44 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead72ba2csm7454541b3a.93.2024.07.29.13.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 13:50:43 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 29 Jul 2024 13:50:36 -0700
Subject: [PATCH 2/2] tools: Optimize ring buffer for riscv
MIME-Version: 1.0
Message-Id: <20240729-optimize_ring_buffer_read_riscv-v1-2-6bbc0f2434ee@rivosinc.com>
References: <20240729-optimize_ring_buffer_read_riscv-v1-0-6bbc0f2434ee@rivosinc.com>
In-Reply-To: <20240729-optimize_ring_buffer_read_riscv-v1-0-6bbc0f2434ee@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andrea Parri <parri.andrea@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722286240; l=920;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=vkgW6uSkTrdq/a10IhVcXIlyy7ZpLz6+wi4VUooJ/G4=;
 b=6aHzlAFODxv03rehQH+ihSsrMnz7sWZc1A11YVvX3P66jucVnPCsnJUrMqSjNfcAEEr1HsL4F
 h1j5DqJJcehCOzZfRMxGWt+WNuh5aB190ykVgIfGSl6pAtDILpmMnaI
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_135046_744673_1C7711C3 
X-CRM114-Status: UNSURE (   9.12  )
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

Now that riscv supports optimized barriers, use them in the ring buffer.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
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
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
