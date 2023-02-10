Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB196C636CD
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Feb 2023 14:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g4GrTTw53AKOvBrn/AXpv8vi7FENq8sQj8JOR+jPDCE=; b=uC3ZEIo6tfSnno
	sLWtDlX7jU+fzU/gojUeX3jcK6KZGv1eKh/2W8JNdIytzyao4DW8pTjEFFm6hri7PYToH7cLyZgLe
	A7H0Lqs5cBQ4uyPaRoCdtEpZlLgBlVjbyP99NhxjLtlyjyFvuiBQaCpjVE6R9We+b8QET87J0kVHM
	9fxH465DQEog3uKU2khEKoJSS3t/pQQ5R8g+nIZnJqa2T+NlUPf+HhqR0/XFaP2sFyqLrMtH+aADB
	S0lpG179LFbUlIdOeaqVvvwaLUGae7hTrVjvkVcZQaVHdrbGmVcDDT67QMS5mHRkWLV4LMZU3YkdP
	aaUbUTAdpH0veIr/fHsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQUMz-0062Kw-Iu; Fri, 10 Feb 2023 14:27:21 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQUMx-0062J4-CZ
	for linux-riscv@lists.infradead.org; Fri, 10 Feb 2023 14:27:20 +0000
Received: by mail-wr1-x435.google.com with SMTP id co8so1493119wrb.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Feb 2023 06:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ceHLeqJb/8JC46v9fimPjQQwYVOelzaxlpfKlrdams0=;
        b=3mSFr7TZiIW7nwfOpoLLswRG9WNFL8JDi1jk9+/T63+a7gMH3vJqvEyLoBVdTZZfiG
         epkFXDb82SBfTr6eEabrcbpf9x0fJ7P5IroYSeE3SM8SGN1BxNx7nGuE93Kajt7hK8YA
         ETvf4C3ci3UXi0al3h9dS5AMIQVzmaTwPo2uMk8uTZRIEInFVVlKjo34bgMyxbYZ7IH/
         h+vCFY4fG76yJhWzPnzS7KjHvTG2kDuHDXV/womDoH9x3a4aIB+grdQwxA0rKtkDbe7E
         0Ys8ZDkanJtP32iHJN93nv2zYWPZh47/FYYkp24fgF+P6Xh4+P3BUGE++jgpdwT5ls21
         zFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ceHLeqJb/8JC46v9fimPjQQwYVOelzaxlpfKlrdams0=;
        b=32LH05IVYEQ4GT4tyxPgR4oTX404azZakI3JhQAo9AHJzD01QvslsVhNBxkmMoOGYe
         WzXXr0SQdQMgvdh3WerJ7xS1A0aipByrzoWQN8gzoGfyjAdFS8CXJdPPEKTng6+zNsNF
         ELCPIhZhiAvh2VZMKIeeb5s9pORPjk5A3lAgdpACeckmeo6/7sR1/uN0cfEyZnRbo5Hz
         je8JmvKCxBMUR2zyNQjNZZlFoVWSyUlRLX9vyhwwU0q2GTrf62vBeT4nugY+qwHWkHT6
         0U668VnFmJkas6UAo+0bPsqErLsWw7Dj79L+7onzyWabftz2JCjl7x2Nsub5v0EfmmSW
         vBiw==
X-Gm-Message-State: AO0yUKVkgdHhIzIaa6BqdPRk3OYESqGQ2VPTBlx0r/HVw/6/pXpv46yZ
	L8KXy0h/oGO0Htf9BkARoeefCg==
X-Google-Smtp-Source: AK7set/Jbyl4v9fxcipnYs583qTKV9G6tdJI07ELZH8BUsyvkjhq67DR+Hc4GkvinyCHgpeLZqPm2A==
X-Received: by 2002:adf:f590:0:b0:2c5:48ad:d352 with SMTP id f16-20020adff590000000b002c548add352mr2339253wro.14.1676039236031;
        Fri, 10 Feb 2023 06:27:16 -0800 (PST)
Received: from localhost.localdomain (cpc98982-watf12-2-0-cust57.15-2.cable.virginm.net. [82.26.13.58])
        by smtp.gmail.com with ESMTPSA id j7-20020a5d4487000000b002c3de83be0csm3963968wrq.87.2023.02.10.06.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 06:27:15 -0800 (PST)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: anup@brainfault.org,
	atishp@atishpatra.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Rajnesh Kanwal <rkanwal@rivosinc.com>
Subject: [PATCH v2 1/1] riscv/kvm: Fix VM hang in case of timer delta being zero.
Date: Fri, 10 Feb 2023 14:27:11 +0000
Message-Id: <20230210142711.1177212-1-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_062719_432819_EC9D9EB0 
X-CRM114-Status: UNSURE (   9.80  )
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

Fixes: 8f5cb44b1bae ("RISC-V: KVM: Support sstc extension")
Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
v2: Added Fixes tag in commit message.

v1: https://lore.kernel.org/all/20230210135136.1115213-1-rkanwal@rivosinc.com/

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
