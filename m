Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACDDCC6B10
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 09:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SHY2V3glbnypgA4bzfx9kFBp4DZyJsNxGRNH5FSAgOY=; b=CnzUsMawidv8wm
	60Dyg5wIVb+WJuag8DznnWZqtQNbtV7ZTsrXw60HlFQNB94F8chHEbDgdGXxM05f0gUaVSZC2Mjyv
	rwvbAVWc35KwLVAgY3ySTB7wyeK90K5BfjyfP3tXlhWKGbI6ZIWwpRtLld6VCftKCkbNdldXRj+EP
	1oDqIP7etU2pK0zLgSuRlYvuiBvGWfqUyqLV7yqdLuhBebr0W4e6pf/VYNLhpKO9rjMnutISJMHWl
	dMWpYnE4QxCmuftf7xfwZRYAVrZ4UZIruj/V+gmCnovL2TRvUYUudaqWEgYwlgwemlwLCYQOX+JTw
	JtDU7CdtbRH6dT3i8Fuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZGn-0000000CUNO-0sBg;
	Tue, 13 Oct 2026 09:58:05 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZGl-0000000CUMy-1yrQ
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 09:58:04 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso2212486f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 02:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791885481; x=1792490281; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uQEWFhbYK6EZsDbloJ25pzWntz9wwdcvgIHcKgGIKMA=;
        b=W9TwQT7mS/nIY4vBa3K/rK315U2PhCGkkpPs4Ik8o6YQVUcwWI8bJ611lzHSfNNouA
         O2E5BhnSpjDfufSVTqL+nv2He8BbBXHuXKfo5wVXPdg+tjEJOoLuyWQT4h9BL+vuhTGe
         575t6D3fVlq3mir5l0cquEITvI3uNWewSQvh6xB2RnsozCAPk5rML2lGl+2C8yhUOZKL
         a3iDJlPZ7ZL1TJZSz5bNEyVDYs6oHZCsPDA3Oz3ZbxpPbH3Wbx4vwiLn542QwXCGtGaP
         whsnIkhW8P1h3MyxUUlQ+/CR0uXPKXP+TNhy9fwGcS/JAiybJOEaQJRjZYNunye6VZFv
         ObWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885481; x=1792490281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uQEWFhbYK6EZsDbloJ25pzWntz9wwdcvgIHcKgGIKMA=;
        b=HdAZ4SN0zL17eoTKuw8kMhADkN9cvll0eO55etMe2X4b710KQcpDJNA4F7cuBw8IKf
         nUUOEOTC1hXVLonoJ2+dhohq6SpSUADwVMFQAhxoBpoZ/QpyMMWiprz1OfghSwPCdBBT
         soByHC2DmdE6ehqyphG8kRin7jIebkftkhDZ0AIIvgk4Pg4W4Lr9s8gyN4Je+fBB0sl3
         jpe0t2mbPZKhoJ0435NLZKxKNATaXJlRxQ5RZVSQPzy4I9+ZqoCp3lxqHg4Y2bjLL26B
         SVhbaotvDGJA3YrJ1yiaeanVInBbhyy0cH/bm690089B6/u4GjqHcgJUsOZcV8b8it8r
         3rpA==
X-Forwarded-Encrypted: i=1; AKwUvBxAaVC7u/e/91x/jJLt5rPoh3kS77X6pvZeuH7y36nCxZhnW2lI1gsW0HTIotl+W4uqX4emtCoUBKW5ZQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKqO9jCwKrJ9kkGzlZeuDWTMALWDCfdtCo5AA/oJLRRMSmyLT79
	6oyqNzfatipwOwxEAhrSwIwBOdcTUMIbIZELGVQEddJVrjYOg3UANLH9
X-Gm-Gg: AYBFou3qVz8nAMSlMGBNcI1dCF828ui9ntWqJqv5dTRRAvhD3zHAd4Utp8Rya1X0CU3
	PGgPnV6UDPbdx8jeuX+PEqbjesyFwep2CD/8BchtbNIsLZokCTo3I5YZuPAOYqQ39uyboGJcQXG
	QuClTpvUFMiRokPjgFhrby/pUQXZXq/pJC8SJyL3nqKozNDXMEYd7LHv1Uvq+Dd805eU3upmKT1
	x+N/kD81DLEre9VeJeWXVqeuWe60GU+hLRyKmSaqhiTdBQ913ZaEA0jkk4qkUCKHETb74hUsin3
	k6nl9JGBF7xiGjEsH6iVKBjnZPkacU+tQrsMXFvtCCxSXXi+M+vdro7H61/nRoj98v+qFLQzgFc
	dNG8OzjGbBrVUeIOBNjdxr2+xnLE9yYRDv6QIyXqfkGvxwZtQEXALO/CvoODGGEbGE0ernPMNVB
	5oxtGbXWNEVlHdhXu2HSbHWvrrHJ4FJHFL5gYONIrvNcOemmZlNe0mbgEjl5kQwU8RzNYpUQP6T
	RhBZU2Azm9v9tShwSvf7G4hjg==
X-Received: by 2002:adf:e014:0:20b0:48b:116d:56fb with SMTP id ffacd0b85a97d-48dba77ce45mr15979271f8f.1.1791885481321;
        Tue, 13 Oct 2026 02:58:01 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:c7f5:a913:e714:a9c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab5991sm4466267f8f.29.2026.10.13.02.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:58:00 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] cache: sifive_ccache: propagate IRQ count errors
Date: Tue, 13 Oct 2026 12:57:56 +0300
Message-ID: <20261013095756.1084568-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_025803_542222_E839EFC3 
X-CRM114-Status: GOOD (  11.07  )
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

platform_irq_count() returns -EPROBE_DEFER when the
interrupt provider is not ready, but
sifive_ccache_probe() only checks for a zero count.

-EPROBE_DEFER seems to be the only negative return
code possible here (currently).

A negative count skips the IRQ registration loop and
allows the probe to return success without requesting
a deferred retry.

Return negative IRQ counts so the driver is reprobed
when the interrupt provider becomes available.

Fixes: c90847bcbfb6 ("cache: sifive_ccache: Partially convert to a platform driver")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/cache/sifive_ccache.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
index 2acb8bdf06d52..b4033110f34e5 100644
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -262,6 +262,9 @@ static int sifive_ccache_probe(struct platform_device *pdev)
 	quirks = (unsigned long)device_get_match_data(dev);
 
 	intr_num = platform_irq_count(pdev);
+	if (intr_num < 0)
+		return dev_err_probe(dev, intr_num,
+				     "Failed to count interrupts\n");
 	if (!intr_num)
 		return dev_err_probe(dev, -ENODEV, "No interrupts property\n");
 

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
