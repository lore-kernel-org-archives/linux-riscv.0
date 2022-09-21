Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50EDCECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 21:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k75v65YvJfPfr+a4Ialsh9bnzjk+u673R38VHKRYN0k=; b=RyGpKRrsjpQMNf
	jzUXImUt1V2g7ZU1yBc3V+gUNJvpi7z9sND3/bS2uAUthpoVhQgQ56rBSNWpOzFsMXV9dsLBWUNAZ
	FOF2iVtaBoI9NeC600pfZpkTan50/ldpon03gOGM6VsTPEFFhQxAaBtAa8f4ho+hH6jXn9urPBaF8
	ylpi0pEk3TirlmioO1dVJ1tMO3f8EzZCy5ZyMq4LqF/roJ30GVjcqgKScYrytYgqqE4sly/wm9siC
	U8yImPXcQNxnjys4AqgnH1BW425l50FtlPJux712b2lw4pO2c+5gHrXKeyrTZ7s8mZE93U8DQWmXc
	5FE6Ud4SudjvLAiFosvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob6qn-00Cda3-4w; Wed, 21 Sep 2022 21:01:45 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob5gT-00CUSp-7c
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 19:47:02 +0000
Received: by mail-pj1-x102f.google.com with SMTP id q3so7539591pjg.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 12:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ktAQp/cqUNax6F89ciMk5io9XS6O+IoDU1II6HgARlk=;
        b=zwbyhDzQRazkKPkUkKTA75Qy/hHUyqU68q09gz++WhTD+RR4kHpnjIpuSUI6OfT9YB
         1x/8zQHCA26AHV4zfFJcPM6YNdq+DQnLs8Wam/QHellkGsicvUnN4Q8z4qCQAqIOAY0X
         y7yqPZQfc/Um950ruqmCurADgJXy+LIwqVLT8kAzSeKIgllrAAp4eMrpvc051VqXDBJR
         UMFOlzZ1WqBEuuIadc+Rp0tqMfbDTOOsEfU7Yx2R+vUN2+oITybn2yhE/sEj2/wBA1A4
         uAoCgf0NAZzY66lCaK2Ia5lvrgrl62P/TAQw0zWi11oG0WgMU6VEiKsDr5rWK6XI1DSK
         I/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ktAQp/cqUNax6F89ciMk5io9XS6O+IoDU1II6HgARlk=;
        b=PkeCx9uG7C7hnGhVLqBUWxI5/HGXfuwXaxU+zZin92X1gOsMfHhfnJEI7dqR+SsVI1
         VtzVxOi8YmShhPFSHorfYOM4MelzaxIbiF21wjOpC0fNUiecOER5Ar+NOQBULcLKxIHa
         rrNFKNe2FxWwfT8Wr6sq8UUofD+DWfkkjc6gEJXaduF3zEO8snMI1yXWGnHbhm1Tsokx
         +i0CWwfbSGUXFMSlJ7HTaiTDcXCmgAL+BXVH7aHQQjrsLQNZf7WgVXuofjgJPTVHwoGZ
         wJ92v6vFfDKdeZWCTpkQLQDPR1BA6PXUQDX/gLGgdQLpfCK43u9gX9AtfG/2BKjG0QVu
         4J8Q==
X-Gm-Message-State: ACrzQf2MZqqlRRd2eqgl2XuPO3JCtI2L+IuZS+6xh4cmFryvw3NYTIZk
	cSlffa2aRq4JH50iTO8aKpBwN5NNXZQf8g==
X-Google-Smtp-Source: AMsMyM5hLdVIT79sy0NshyrkqxA6rgsxwObvksA9OlAl8SItgPBXnV4LbdO7jAIrbffV3rJ8WIk8BQ==
X-Received: by 2002:a17:902:ccc7:b0:16c:484f:4c69 with SMTP id z7-20020a170902ccc700b0016c484f4c69mr6571218ple.118.1663789620571;
        Wed, 21 Sep 2022 12:47:00 -0700 (PDT)
Received: from stillson.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id o2-20020aa79782000000b0054aa69bc192sm2551057pfp.72.2022.09.21.12.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 12:47:00 -0700 (PDT)
From: Chris Stillson <stillson@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	jpalmer@dabbelt.com,
	kvm-riscv@lists.infradead.org
Cc: Vincent Chen <vincent.chen@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>
Subject: [PATCH 15/17] riscv: Add V extension to KVM ISA allow list
Date: Wed, 21 Sep 2022 12:46:27 -0700
Message-Id: <20220921194629.1480202-16-stillson@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921194629.1480202-1-stillson@rivosinc.com>
References: <20220921194629.1480202-1-stillson@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_124701_408214_A979E1CC 
X-CRM114-Status: UNSURE (   9.06  )
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

From: Vincent Chen <vincent.chen@sifive.com>

Add V extension to KVM_RISCV_ISA_ALLOWED list to enable VCPU
to support V extension.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 6f59ec64175e..b242ed155262 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -35,6 +35,7 @@ extern unsigned long elf_hwcap;
 #define RISCV_ISA_EXT_m		('m' - 'a')
 #define RISCV_ISA_EXT_s		('s' - 'a')
 #define RISCV_ISA_EXT_u		('u' - 'a')
+#define RISCV_ISA_EXT_v		('v' - 'a')
 
 /*
  * Increse this to higher value as kernel support more ISA extensions.
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
