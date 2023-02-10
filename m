Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3A0C636CD
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Feb 2023 13:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1PEmo0+4mZkr8J9JqT4SOf8bHVIAGxhUn6V9/xO8uiI=; b=RIEqXypx8eA1ug
	fueQ2MUSLr7kIPm4I4UMWjxEml8KtpY8CDPHkm4xdSPVLvWe0h4LVjBJ9R0iSFBhtzVzFKUEq/3sH
	6cGCVMSJO0/BuVVCWYdEOUO3c5XOGQpc4GTG9ej/ei4FuUtVnYD2CSSbib1u8YW8znHnA+aeRy+5k
	6ROaFWKcMx26pUkNGessLb/LsOKM427KMzS1s/wu1BNjgqFrl8GArzVxEdF+NbajHZFPNyNrHRlqt
	7uMTJTrqFOHQP31NhPoLvkEmbpUeRRh3myIG665+v/YpZU8Hvc8abOyqzNg3M6L3Dlyw7TP6PVgTh
	cHtGNtUl87cj5Q6jQ/EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQToh-005slu-HM; Fri, 10 Feb 2023 13:51:55 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQToe-005skI-4J
	for linux-riscv@lists.infradead.org; Fri, 10 Feb 2023 13:51:53 +0000
Received: by mail-wr1-x430.google.com with SMTP id h16so5103213wrz.12
        for <linux-riscv@lists.infradead.org>; Fri, 10 Feb 2023 05:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aedyPRD2OA/Q12cErqdU0gdmNaMluYoniD9K/9T9nvs=;
        b=70p0hxOWJF2H2xeeGVBp8GoSNG+I+DPpr/hafBYFRJTc3Zgsmd26bhaxEEKctOotc0
         6w7f1sEjIkFRhMOQvo0g0drEaomWGjSzB/C67bXhzit412wpIsnJ2fmaDy5d8CKfpNFb
         lJg8UTcRguffcf9CsYsfw9ToXFKjJ+bf8peNV+tqPiSB5KiWqEEBqOgaBUvlCQNXwEyU
         13O0mTFve+E+MEhy7ZMD5DXzpcjIvXUe7uNC6m1FdNTArFMu14yfeVMxyIppu8BmYhC6
         65GNsjHdSnL0OCgparmZiacvz6yBk/jK1APmVUBHAgiy5Buh1evrUxa7sABIjGn2Udqv
         rqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aedyPRD2OA/Q12cErqdU0gdmNaMluYoniD9K/9T9nvs=;
        b=hmfk3thHdqB+YCKZBoYGBbW/wavcJqqxFleCWM9d3wXi2CUb51eAroOXs9800LLHIO
         j7P/RyQgWm4gylNRDz2GhZr3lnM5mniXY5IRMfPSiuMEUrQSjbny8xREBhRGnYAmGdea
         k1E4o4wj3my6dCJsAimheGLZ+1sHnyq0WQlaGYsdnX8zEeO0qRPCJMro8EPG0oIjN8E3
         SKEKsWUKgDv1lGofRqEjpwk4yu5yXooPD+Jx4EM90YJOa8Dkfigztv/sRAeeaqI0ncIm
         m+DfXTGZuaPHC2aYqvb2GAjtVDrU3fERrvpvAVjMhvyK7sw4uM9VqKmMsxEKtO2yiQzG
         ksgA==
X-Gm-Message-State: AO0yUKV6ecZ7kGNAr61qB8L7DPoRQCxDNRRnKP8c2Ovlpd4VxD7DSW55
	wIOMFYEToc8ENBqKeWl6MjOR+w==
X-Google-Smtp-Source: AK7set+agwpUiQqJSdzsO953ZKOM/iK4IfFaBn5DDHj9yHKm6NJvhIg6Lyd+UYT0ZCB4pAvi/JCaXQ==
X-Received: by 2002:adf:fe86:0:b0:2bf:ac3f:a9da with SMTP id l6-20020adffe86000000b002bfac3fa9damr14335774wrr.7.1676037109466;
        Fri, 10 Feb 2023 05:51:49 -0800 (PST)
Received: from localhost.localdomain (cpc98982-watf12-2-0-cust57.15-2.cable.virginm.net. [82.26.13.58])
        by smtp.gmail.com with ESMTPSA id e7-20020adfe7c7000000b002bdfe3aca17sm3883549wrn.51.2023.02.10.05.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 05:51:48 -0800 (PST)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: anup@brainfault.org,
	atishp@atishpatra.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Rajnesh Kanwal <rkanwal@rivosinc.com>
Subject: [PATCH 1/1] riscv/kvm: Fix VM hang in case of timer delta being zero.
Date: Fri, 10 Feb 2023 13:51:36 +0000
Message-Id: <20230210135136.1115213-1-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_055152_419003_2EA92637 
X-CRM114-Status: GOOD (  10.01  )
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

In case when VCPU is blocked due to WFI, we schedule the timer
from `kvm_riscv_vcpu_timer_blocking()` to keep timer interrupt
ticking.

But in case when delta_ns comes to be zero, we never schedule
the timer and VCPU keeps sleeping indefinitely until any activity
is done with VM console.

This is easily reproduce-able using kvmtool.
./lkvm-static run -c1 --console virtio -p "earlycon root=/dev/vda" \
         -k ./Image -d rootfs.ext4

Also, just add a print in kvm_riscv_vcpu_vstimer_expired() to
check the interrupt delivery and run `top` or similar auto-upating
cmd from guest. Within sometime one can notice that print from
timer expiry routine stops and the `top` cmd output will stop
updating.

This change fixes this by making sure we schedule the timer even
with delta_ns being zero to bring the VCPU out of sleep immediately.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 arch/riscv/kvm/vcpu_timer.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index ad34519c8a13..3ac2ff6a65da 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -147,10 +147,8 @@ static void kvm_riscv_vcpu_timer_blocking(struct kvm_vcpu *vcpu)
 		return;
 
 	delta_ns = kvm_riscv_delta_cycles2ns(t->next_cycles, gt, t);
-	if (delta_ns) {
-		hrtimer_start(&t->hrt, ktime_set(0, delta_ns), HRTIMER_MODE_REL);
-		t->next_set = true;
-	}
+	hrtimer_start(&t->hrt, ktime_set(0, delta_ns), HRTIMER_MODE_REL);
+	t->next_set = true;
 }
 
 static void kvm_riscv_vcpu_timer_unblocking(struct kvm_vcpu *vcpu)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
