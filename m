Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1993CD5B16F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 09:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+F49ClZnSpeTp/4bHdbEPG7aH8J81ua48eYkee3eMCM=; b=KcTCnUSbvgy7Q9
	hmoH8u1atbrnTrvIXb6NBpfhleC67uldEOyd97V3iqOqzr4z3q9sbO7JUzje4pNFim7FiMMDN87Ij
	iyjvnq2W8gVs1Tp3ekyB4M4KYVNQ4Lbk7eIT5G0luydlMfh/pskrwRKMcKaIGk7OV6Y+ROhML6N1U
	QuzL9trUwgHcv9ipHqsP+a7PxdbpQnp2olWJp8EGORlcF63wPxFVmiCMb5zRi6SSv/QtAzgp8Qp70
	y+TvrpSeIchF8DTkC65VnjtefLmCYSkEAStYSaVnw4eeGd2uVjBEbR7DDVDzd/JMxGnbuCGrywUJM
	UpDyCq7wmo021sTERjQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5iDG-0000000DpCr-20p8;
	Tue, 29 Oct 2024 09:08:30 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5i0z-0000000Dm7A-21YR
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 08:55:51 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7ea6a4f287bso3293491a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 01:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1730192148; x=1730796948; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuWnhLJQw+PAY3xEBfJ+QJn2JlieNeFBTgX6ZFMdL84=;
        b=iaDZunlWlVyd/SC6CMXs8+rQil/VIiTCUA3J8A9FiEaWX24L+OtNaa8igpb7Fwv0BW
         ZDy1gg+Vh6mWyRNSqN5a6+mqvKdYPdWzf26gvkTwicgncOSl2G1eD/TtXh4MsfauKA3W
         e+SEIxGOrNw4HRTZsEipLO4qjoZ89A3TRv1p20Y/uHUG0Nt3ebg8OWX+bGEkEDydZSOd
         YiPWpzW7PkrHPKtKdFm/RNMxDS1tYA9SrzMmiyuT5JjwEzratR3efTay6V+vG9ImR8Qc
         OGqF1boYjR7LTsXk8FW/8iDmguglndRjmYfHq/5xMQMxGb61aJP8zxgHM26DQuUv6aV3
         Pa/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730192148; x=1730796948;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xuWnhLJQw+PAY3xEBfJ+QJn2JlieNeFBTgX6ZFMdL84=;
        b=BgCdG3Y6ku4l3qFL0IGk9xZJ0m5w+5RUGDh4PHM5ERzKltWUB1PayvY5fqzHlvoUob
         b+cjElMSo3jNSUNLnpVWUZ81CzHaG3TzJXpvz6L+UN9QMCAEJH1jbURZTXQHzUF7aWw1
         Z+F6LT6OshIX1/iBRc0rJYdjbAUpaa1lsDcYfe2XWePBT8glAbHc2dpynsxUQ9jif/dw
         Z4fvRsq/e4f5pjHySjeEu5btl4m+OI7KzyvzIy7Vy95JXta6tVylDb4vkO95FVFm7rwK
         PKQJhN5sBYUmJBojKbk+KNtgxDMpmAdtFT1YBCyUwFs69L5rdw2uIGCmODMdzV/vdA56
         gohw==
X-Forwarded-Encrypted: i=1; AJvYcCXajgppJAnntj0Q+2IcltUdIPbcUnPhnIPFnwpQbTcVc4vBTNEQYtPokjfsFYx+/IdWJEI+OG0DqpkCCw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo4eDppVqrbWQBICmv85Akv5fTp45jEqfhXZPBEbfVPKyr807E
	RqKiIMyFPRaYlt9F9NCwG44DSD3MjUbVUl94S2dECCBCP3Un29JV8uec1oga+iU=
X-Google-Smtp-Source: AGHT+IHf0YC+Ea5Ksx4oBfD4ogAxvHzzwCrdPrdXaYrCaa9GKLqYlspwFnf6XIm9UGsHOjhUqPUyrA==
X-Received: by 2002:a05:6a21:a24c:b0:1cf:2853:bc6c with SMTP id adf61e73a8af0-1d9a84de0a3mr14026908637.33.1730192148007;
        Tue, 29 Oct 2024 01:55:48 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057931a06sm7054189b3a.55.2024.10.29.01.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 01:55:47 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v2 1/1] RISC-V: KVM: Fix APLIC in_clrip and clripnum write emulation
Date: Tue, 29 Oct 2024 16:55:39 +0800
Message-Id: <20241029085542.30541-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_015549_606203_5FFC9F80 
X-CRM114-Status: GOOD (  11.47  )
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

In the section "4.7 Precise effects on interrupt-pending bits"
of the RISC-V AIA specification defines that:

"If the source mode is Level1 or Level0 and the interrupt domain
is configured in MSI delivery mode (domaincfg.DM = 1):
The pending bit is cleared whenever the rectified input value is
low, when the interrupt is forwarded by MSI, or by a relevant
write to an in_clrip register or to clripnum."

Update the aplic_write_pending() to match the spec.

Fixes: d8dd9f113e16 ("RISC-V: KVM: Fix APLIC setipnum_le/be write emulation")
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
---
v2;
- add fixes tag (Anup)
- follow the suggestion from Anup
---
 arch/riscv/kvm/aia_aplic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/aia_aplic.c b/arch/riscv/kvm/aia_aplic.c
index da6ff1bade0d..f59d1c0c8c43 100644
--- a/arch/riscv/kvm/aia_aplic.c
+++ b/arch/riscv/kvm/aia_aplic.c
@@ -143,7 +143,7 @@ static void aplic_write_pending(struct aplic *aplic, u32 irq, bool pending)
 	if (sm == APLIC_SOURCECFG_SM_LEVEL_HIGH ||
 	    sm == APLIC_SOURCECFG_SM_LEVEL_LOW) {
 		if (!pending)
-			goto skip_write_pending;
+			goto noskip_write_pending;
 		if ((irqd->state & APLIC_IRQ_STATE_INPUT) &&
 		    sm == APLIC_SOURCECFG_SM_LEVEL_LOW)
 			goto skip_write_pending;
@@ -152,6 +152,7 @@ static void aplic_write_pending(struct aplic *aplic, u32 irq, bool pending)
 			goto skip_write_pending;
 	}
 
+noskip_write_pending:
 	if (pending)
 		irqd->state |= APLIC_IRQ_STATE_PENDING;
 	else
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
