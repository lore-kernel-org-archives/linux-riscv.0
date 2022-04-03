Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623B5C433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Apr 2022 06:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LxBSCFGG4fhZ7Zgvr/Ubb80t7sKAjASiuxb5A5uY56E=; b=dKPJibM6JzkjU5
	M/rNjjq5+7k6n4liXlX7tzFa2IixVhGdtd7ISN4rbBQmDAJcmXD6kBQF+2d9CX8eN6CVukMFYPoHV
	BI2fxtKIdicbYrftMW3X4EbLCOJE5bVlOSsKImREFJsC9jyyDpTtKKHg+1G8o9tm4C265N+HdGp6a
	ga5rCQg75ZgrzelnwHYXeqIPWpDM26GFSm0ODI7lVtgv2/K+qdtTghbloeJigG5AYp7JTcq0Hpzsk
	fXL7MSru+GCZSbSHCw35xjLrVpj5YRm3zcndc9wl8blcXe30GL8OppzqMi2QGoE8PER5SN5RM1+Te
	WB2Z4S2mokppih8inToA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nauBW-00Atp3-2r; Sun, 03 Apr 2022 06:58:02 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nauBT-00AtoM-Pu
 for linux-riscv@lists.infradead.org; Sun, 03 Apr 2022 06:58:01 +0000
Received: by mail-pg1-x529.google.com with SMTP id q19so5762231pgm.6
 for <linux-riscv@lists.infradead.org>; Sat, 02 Apr 2022 23:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VB4BowOKcVjDMzaFI2q1TdcawJXQCYjd9zAqRkqdqfo=;
 b=G0niXPXzEWlRviSWcbVBuBoDbthSi30PCxNELYi6MmbdCJy43ME8ZsxfPVG2hP3NYN
 aoi4ZZvpx57Na3PaFPWmyfDIpqaaIMwGEb/NhYXKoUPvpFkWEvhsPnVhK4uaWKtSKBXJ
 jJ4K0TwkIO316hnyPjn5rbahKj5aIiGedBynlkaCRvXDNjLorKirU9tK0C5cXGUrAzn+
 kDVW4O2SQyCtTxBhXnX2m2zCrwCtZvJgvScXEEguAMNcG9zwE2MOCVxQqv4po5TGonXU
 JGqPLmN+r4DgjDvaIc/O5DetEwtFR03lu1nP7NAEksDa0T5OEpekcqB4yyJTBjo2WU6p
 L63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VB4BowOKcVjDMzaFI2q1TdcawJXQCYjd9zAqRkqdqfo=;
 b=uTIyguoozns3cVfMHWt3vE2K4gK48XzzKMbJyXJ3S8NrN+h6IafvnmjxXx1sRUoczl
 hAyV5gdmW51kXwNGHcc2BygPMN1gZNRVWUIXnC7CMr0Eo+iCTrzGzQnWq/S91p1AF0rQ
 1DME+rsp+7OzYSNoeMy7ZufK/0CGxlR9wW4HCUpvGx3zyoot99iaTL+A/PgzEEowmJcy
 2zgY23Ra3Alc3yE70/Gz/xvPmFSftVlThezNJwoHaIk9C7B3ADcZdbICKqL0j8lcm+tv
 9a/I+DsmIKvOohLA7Rv0AtvGaYc3uyoFvHIVw664JUmMbpDunZGHmz19Uz/8Rf1/f8TE
 6ntg==
X-Gm-Message-State: AOAM530gl4o/ZPv8TiUg7JkLstalyIJETb6955M+Dz9vhnvDOJKhSVYu
 x/D8EkxCJy3+kq+5iJ1vhSw=
X-Google-Smtp-Source: ABdhPJwSBLxoxI5PkLY2KMc/MKylwInJtYBAp6BxcAs6CfGnjoINlGlRb4+5gL8MvusBS6kHu3iSaQ==
X-Received: by 2002:a65:694c:0:b0:398:fd64:7422 with SMTP id
 w12-20020a65694c000000b00398fd647422mr4191685pgq.503.1648969077955; 
 Sat, 02 Apr 2022 23:57:57 -0700 (PDT)
Received: from ubuntu.mate (subs02-180-214-232-68.three.co.id.
 [180.214.232.68]) by smtp.gmail.com with ESMTPSA id
 ds15-20020a17090b08cf00b001c6a4974b45sm17077143pjb.40.2022.04.02.23.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Apr 2022 23:57:57 -0700 (PDT)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Anup Patel <anup.patel@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH RESEND] Documentation: kvm: Add missing line break in api.rst
Date: Sun,  3 Apr 2022 13:57:36 +0700
Message-Id: <20220403065735.23859-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220402_235759_896640_C991E6A0 
X-CRM114-Status: UNSURE (   9.17  )
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

Add missing line break separator between literal block and description
of KVM_EXIT_RISCV_SBI.

This fixes:
</path/to/linux>/Documentation/virt/kvm/api.rst:6118: WARNING: Literal block ends without a blank line; unexpected unindent.

Fixes: da40d85805937d (RISC-V: KVM: Document RISC-V specific parts of KVM API, 2021-09-27)
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/virt/kvm/api.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 9f3172376ec3a6..a529f94b61edcd 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6115,6 +6115,7 @@ Valid values for 'type' are:
 			unsigned long args[6];
 			unsigned long ret[2];
 		} riscv_sbi;
+
 If exit reason is KVM_EXIT_RISCV_SBI then it indicates that the VCPU has
 done a SBI call which is not handled by KVM RISC-V kernel module. The details
 of the SBI call are available in 'riscv_sbi' member of kvm_run structure. The

base-commit: f443e374ae131c168a065ea1748feac6b2e76613
-- 
An old man doll... just what I always wanted! - Clara


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
