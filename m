Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897BEC7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 17:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EaQlvZjuBdTs4ROlcAeMvh1PgDVTVgmZgvi48ANzSF4=; b=yW73KHMpR+cdUl
	7qf+u3NvYVjVkZM2LByjann3nquEl8Gcr5A9ARr+xRNaLe491pvvjZ1mR9IDqEsbnehfV2YGfu4BU
	PMKWyITqFHxCrasVuGK19jImjOyOhPjkxz+UKYRdGcFJ4tdzFo225u/tajfZ1M6tPGFfchyXZllQd
	VuDjNzg8YiBJ8aUy/NIsP/HJ+FYs3qqaIvGL8kFN0F+XF0RYfo0EZFh5WCbrIuNo4IgIc8XXm/TjN
	PCkiWFH9E3ZG9itDIlYdTr8B5C32ojROnVoIyKxa6UAFEb1R7l1UVSx3F+RZ8BLXfZCuP2Zme0Moo
	puSX3wJKJ2cv9+5CYG4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbTb-003EJI-Be; Fri, 24 Feb 2023 17:03:19 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbTW-003EEI-0p
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 17:03:16 +0000
Received: by mail-pl1-x62c.google.com with SMTP id e5so125372plg.8
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 09:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gGZWEGHhXqO9OeXhoDxEGsON6GC4YBeiRX5XbYj9IGA=;
        b=ghKPeKR0G7uqNkPIH1npSQFQIWcsGSKvYwwCyhwQTOj1TK5WP1/aNJ87vT0C1mdcnO
         ht5/8+RtBaKIBxaPDYvuzQsOxqiMvI534Qu4gaxQ+XfWL9g2HKUXKKWh1ey/XkDk9aE4
         uOginkp7cstMsnvp873wEwWYntVED1Z4ero00tYFcx5ZsZFedEvwzeLBaW2pWlE7ZkvX
         SRYhb5BU8VVVN5y4d3J1ryOd+P61zO/X+cx91jMeI/8uHICjlll5wYhewyKdfmnsTgxM
         4UtNUvfkSRXbex1Rs90s99OR/M3QkP960CJkZZXziXCoNG/Qs9eq5X/jSB4btL/i3pcv
         y8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gGZWEGHhXqO9OeXhoDxEGsON6GC4YBeiRX5XbYj9IGA=;
        b=auw2PyztGdE4ZasBweoZF+9vIDOd7OU+S/oE66EwcipGyNdaQ67byS1g8H5G+90wG+
         lw5Csy2kjMO12IPhRMdQMe3+PdI5GDHhbw/zg/eBsDXNlYyGtX7EZNRrjyXMga/fiRu7
         22RWriCMkwMKEzydXvLH+KR22xDZ/BQib43kiVTCiBI6Oxut02vM6bEmGRR7CkqNKTtB
         QCJ6ikzeQLCm1a/i0yA2Ha7g1oOTjIh/4JAoWFfzSrUVnx/cSzIS1NurC97lngLeje/v
         oWxqe065C1vWAibXT79KyJxZyh2ahBdD7FZPSpV+FoFQtV5FD8fltcdEjSzJpu2Mz2MN
         HF/Q==
X-Gm-Message-State: AO0yUKVKZDArRt4pV6ZIhFuWCXhACt/dLvX6rjRSA60sWvxlnFbiygV2
	my3K5DHZxOFR7noY6NwolbVnauxR4kNE3FkEYVYLtoDPgcY2zHGfqHI+73nd7khiBqAbcZ0Zc4F
	7ydftU4xGjY+njZFELutm+Uge7n5p+KNTxr5v3MU4Mx7LuioCDGfzU8San01bBVvAUYOBB44vPC
	ZPs/FTv+dQjw==
X-Google-Smtp-Source: AK7set/PDa9oZC/tYXZAV4EbClHLZdMbVmxGR97qkvUkEEVLbHU3vmzGKHxKFJkEDjHgyyUthiP+iw==
X-Received: by 2002:a17:903:1ce:b0:19a:c65d:f97 with SMTP id e14-20020a17090301ce00b0019ac65d0f97mr24637061plh.41.1677258193134;
        Fri, 24 Feb 2023 09:03:13 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id b12-20020a170902b60c00b0019472226769sm9234731pls.251.2023.02.24.09.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 09:03:12 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Vincent Chen <vincent.chen@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH -next v14 15/19] riscv: signal: validate altstack to reflect Vector
Date: Fri, 24 Feb 2023 17:01:14 +0000
Message-Id: <20230224170118.16766-16-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230224170118.16766-1-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_090314_076462_4959C12B 
X-CRM114-Status: UNSURE (   9.67  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

MINSIGSTKSZ alone have become less informative by the time an user calls
sigaltstack(), as the kernel starts to support extensions that
dynamically introduce footprint on a signal frame. For example, an RV64V
implementation with vlen = 512 may occupy 2K + 40 + 12 Bytes of a signal
frame with the upcoming Vector support. And there is no need for
reserving the extra sigframe for some processes that do not execute any
V-instructions.

Thus, provide the function sigaltstack_size_valid() to validate its size
based on current allocation status of supported extensions.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/kernel/signal.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index aa8ee95dee2d..aff441e83a98 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -494,3 +494,11 @@ void __init init_rt_signal_env(void)
 	 */
 	signal_minsigstksz = cal_rt_frame_size(true);
 }
+
+#ifdef CONFIG_DYNAMIC_SIGFRAME
+bool sigaltstack_size_valid(size_t ss_size)
+{
+	return ss_size > cal_rt_frame_size(false);
+}
+#endif /* CONFIG_DYNAMIC_SIGFRAME */
+
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
