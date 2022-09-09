Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856F5ECAAD3
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 21:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GgLWcW1A3Jt/jQ1M4FQHK3fAqBen9tL8stRds/LEybo=; b=KLgkGLDJI+6zZS
	xubG+kMbUrei7Xxqsj5eeXvTk7a5gMwa14W//m706vOtR5+KANYfswe+mRqGDChxnR0jeuuFYjKGb
	hBvNYHthB2TlzI8wlIFVk6L/KQaYxw8awWgszBpCL4uWbDhZmmpFHMUkT5G1FcyzqvepuygQgZblx
	j7y6s+TPPLayjQetxWgIqZUsEcyHITg+jOlGQbC5zOb0mXeC59V9AIqUdL/XsjSoHlf04cLHHaKgt
	bKiEIFVDDqQEJbfbqUJevLi5P+xMheSF82kiDqEacW22nLoVHv76JO/nZSzgU8wu5EQmtxsrOit6G
	goM12NsY3NBy1rnSIBOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWlXN-0033ny-QI; Fri, 09 Sep 2022 21:27:45 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWlXI-0033kY-Se
	for linux-riscv@lists.infradead.org; Fri, 09 Sep 2022 21:27:42 +0000
Received: by mail-qt1-x82a.google.com with SMTP id g12so1913207qts.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Sep 2022 14:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=XCqFILlORIl73ysqc0Ul7pNfGlGrUGGUodvmYmFWBzU=;
        b=lQ8xgvfOqQ4TnJL7QZEv/D17SJFXVYCbEbAHGn5JXmt0kRtMdbJu5H6PYqaMZKwXN3
         3SNhslYduiyRqOjjI5jwxyFvWh6It7bHfFqoG5fV8Lqv6TLyDwYZtGuOlZGNo1atkkvS
         dJ8nBFev0T+PPQlQDPiDIXjitTQNXQSW/Jj46ndMAN6k4S5WF4w5Kk2uBTFUC7sVRnZn
         f4S7zUaf1s/6xwZo5ioY8rmG//9E6HY1NDg7gxbRuZv8sbbYxmykU/r9Aao1GvOEBfte
         81kN3EjYob5F4B6/OjArtpYQJfVzT/ipxrczpw4o6SfeQAB+Aps8BE8CFYTt/5p4SYRU
         AhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=XCqFILlORIl73ysqc0Ul7pNfGlGrUGGUodvmYmFWBzU=;
        b=2zcyRJtCFBYDvsITXPVsCDR16t/NcbgZkPD549aMMpof67H46RCRL5kkjSxvHbj9vy
         +S6mtX/wZLxBIwKIuwBBQD4Z9ePeVr1vq+uqiaRZ5jry8UpNb/fTRMk8q+voJ8CKTcBA
         cdmTkxFWx0Y1Hslv6Z4IkskcvJaaJc9LzQAMm1eAGNQy2RYQo39Q9F7JHtDC8s19MVOt
         WjZcb4fRqkKK5JwtasIzuQe5WOyoWo8zigW+UdL+dP4/dBBUEInwgvVZbD3Rnz2aKir/
         6lp9+K+cMfbM48e+UgVWrk+gWU6amOHyNn6I2k6DHULQIczQxLirFxrxcdTVnaDs9INA
         iEQA==
X-Gm-Message-State: ACgBeo0Owp3BHOnVurdiCIsIa9EtqElfuA853nV8bUq+P4+gI5JfAtMB
	MJZGHZ76AUl3AQwNZQf8HgsQ2w==
X-Google-Smtp-Source: AA6agR5iBUieo1I964FBEtcDnsH45WXOoVqFhxQhvwNg7+f3V95B56mPBysZmvQjXi9vUg+gS4t8/Q==
X-Received: by 2002:ac8:5710:0:b0:343:5fa9:b707 with SMTP id 16-20020ac85710000000b003435fa9b707mr13796746qtw.192.1662758856892;
        Fri, 09 Sep 2022 14:27:36 -0700 (PDT)
Received: from abrestic-xps.ba.rivosinc.com (pool-71-105-112-35.nycmny.fios.verizon.net. [71.105.112.35])
        by smtp.gmail.com with ESMTPSA id o22-20020ac872d6000000b0034359fc348fsm1085138qtp.73.2022.09.09.14.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 14:27:36 -0700 (PDT)
From: Andrew Bresticker <abrestic@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Celeste Liu <coelacanthus@outlook.com>,
	dram <dramforever@live.com>,
	Ruizhe Pan <c141028@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 1/2] riscv: Make VM_WRITE imply VM_READ
Date: Fri,  9 Sep 2022 17:27:30 -0400
Message-Id: <20220909212731.1373355-1-abrestic@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_142741_178669_CB3B3BE9 
X-CRM114-Status: UNSURE (   9.82  )
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

RISC-V does not presently have write-only mappings as that PTE bit pattern
is considered reserved in the privileged spec, so allow handling of read
faults in VMAs that have VM_WRITE without VM_READ in order to be consistent
with other architectures that have similar limitations.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
---
 arch/riscv/mm/fault.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index f2fbd1400b7c..d86f7cebd4a7 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -184,7 +184,8 @@ static inline bool access_error(unsigned long cause, struct vm_area_struct *vma)
 		}
 		break;
 	case EXC_LOAD_PAGE_FAULT:
-		if (!(vma->vm_flags & VM_READ)) {
+		/* Write implies read */
+		if (!(vma->vm_flags & (VM_READ | VM_WRITE))) {
 			return true;
 		}
 		break;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
