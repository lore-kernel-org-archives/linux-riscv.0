Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BDFC3DA61
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 20:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b60BjDUaTSxcOFpdOcZ5kFOWELJq3Vf4IoMtUczSmMA=; b=ghe0MAPUtuAoIq
	Wj8CW3FiPRzy3jDBjD2vCTnTWode5NBCD15RdRn+y2vmRFkVF7hFjrD4vPNDXzrq7KhKKioExzpil
	2D07YkWQYEfETwqXuLjHV3dQpXyOe6k5YOEO2mWgHYFUwmX5Oskm3lTyG1z6/aVFiGmK63l9fAeZy
	XuEYk7vi7W4Wr0JHXPYDrdUIj0BELT1h7uCOB9KlRge2p9ALkD0AuoH4QmtomT5rHn/92pgRK9LdS
	2YLHLBrp4iU8UUEfBpmLvfEAgyi842k2Kv5u/vd/+HX/MCDT1dLhYbxY1FpOe+qerxEz6sTv2/K+i
	oKKkguNCiRsSI7jdg+lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYXKQ-0000000ChQx-3FS7;
	Mon, 29 Jul 2024 20:50:46 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYXKO-0000000ChQH-15Z7
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 20:50:46 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-70d1fb6c108so2616705b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jul 2024 13:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722286242; x=1722891042; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MyqkDl560JD0CBTzhcqGXAUa2SEvliDo3DhwU/kYi7w=;
        b=GZO7d7pwper8VzKRl0r/ktZRzM+RZfMrQM43UJZAFfunzBhWnkhIvIS/dqqquHkelU
         cG1XXRnGp9jkVK85R36Fj6bcC1NFdJCLwWFJ9ywVYLAIC5c0+cFFfLonBZ/SEUGwIk5z
         EZ373w3VuSYHJJdi4fXnTLhEGFFvPANg6SQxBMSpDhzgAvhFZ62s6/Aoe8c1UPq+65yO
         zxEyAmgnx9GyG2Kqd9Ta9E2Ui5begflxv43hgxePG+hdNVoswlKidcHs/1MQkBm9UEqX
         APdYqolMDxqgqiv+76DcLUkpLivuOzfq2mmEpQXivpuCp+KJpDCD1hgrnxY3zJWzXLJ/
         /eaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722286242; x=1722891042;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MyqkDl560JD0CBTzhcqGXAUa2SEvliDo3DhwU/kYi7w=;
        b=ZLydoaB7TvuFxNHsXx3spRmJFdaRzUK9zKRXIlPQVGA1mI8wq9lPxDs9Os1Gum+X3Y
         ejqmCINyvvr150NtWRTDcvpuN/2+18jtjGyOwmIgIqsUbLWI2ExLQm7lwKuHYqZ33L8h
         jB1OzwC5MRbdYCTwIEpg5gk26WhSUjIYhRmEBHq7rEyzWwgMjAWExg3QTnR3RMNVCT4h
         VpOQW0ID5Kdqw1xGsSB/fVDQ8W0D0w+k8R1B+m4lWsmbaMNPW5X68AIS9Nt8EThChPia
         Sx9NYb9bg3nLerWOVnV9HvE9GshyUeXA0hcLcocqqUn4ZsgNzCBawbcnbhsZzaVE8k9q
         t44w==
X-Forwarded-Encrypted: i=1; AJvYcCUsUUcVzjqLfA8qYGKxFJVfEsNP8IelXjAO7HF0x9wk2XZXH/KGC4xM7Z7XOXQD/uVmGOuHYAqkLzhgwp/PQ78sGsB2ud4MM3wfQhNLPWzK
X-Gm-Message-State: AOJu0YxwDDYh+PD3W2K2IJ98CzkBKlsYaWQPZYV1OcYGg0vDZOlDW781
	KJ5XkohWnuQrdB2uwxscNF0toudfxNUMbgzuYLNOBw5vFdK4wluCjnv/bA4HT2sHkcgbfQXgzDG
	n
X-Google-Smtp-Source: AGHT+IG4q+xT7Eh/jxfLNLEeUa+wuUhMGfqsXxfHJcPRKtZmUSqwQyvc2zQVI5TKZqsQKXpgBYWH3A==
X-Received: by 2002:a05:6a00:3c90:b0:706:67c9:16d0 with SMTP id d2e1a72fcca58-70ecedbc503mr6449388b3a.26.1722286241843;
        Mon, 29 Jul 2024 13:50:41 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead72ba2csm7454541b3a.93.2024.07.29.13.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 13:50:41 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH 0/2] tools: Add barrier implementations for riscv
Date: Mon, 29 Jul 2024 13:50:34 -0700
Message-Id: <20240729-optimize_ring_buffer_read_riscv-v1-0-6bbc0f2434ee@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJoAqGYC/x2NwQqDMBAFf0X23IAusbb9lSJB44vuoVE2KqXiv
 xt6nDnMHJSggkSv4iDFLknmmKG6FeSnLo4wMmQmLtmWDddmXlb5yA9OJY6u30KAOkU3ZJH8bpg
 f9ll5i/4OypVFEeT7P7zb87wAqv4X33EAAAA=
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andrea Parri <parri.andrea@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722286240; l=748;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=SWoPzKkjwRPP6Fw8++lKxhhYl2PukdTfW8smKgrVYEM=;
 b=X/1NIE1i3kONOrn/juB4EbkpjSE6PBybz1vWcokDzgdT9HvE0maY9P/qm4SaaxK4RnxljnKmy
 Fi9LezqwdrHBqsyDrIeDZDY5pawHgzuuAOiJta1jDUwztfGMDtBhXd9
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_135044_600089_F9A4F7DA 
X-CRM114-Status: UNSURE (   7.28  )
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

Add support for riscv specific barrier implementations to the tools
tree, so that fence instructions can be emitted for synchronization.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Charlie Jenkins (2):
      tools: Add riscv barrier implementation
      tools: Optimize ring buffer for riscv

 tools/arch/riscv/include/asm/barrier.h | 39 ++++++++++++++++++++++++++++++++++
 tools/arch/riscv/include/asm/fence.h   | 13 ++++++++++++
 tools/include/asm/barrier.h            |  2 ++
 tools/include/linux/ring_buffer.h      |  2 +-
 4 files changed, 55 insertions(+), 1 deletion(-)
---
base-commit: 0c3836482481200ead7b416ca80c68a29cfdaabd
change-id: 20240725-optimize_ring_buffer_read_riscv-228491c4eb6e
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
