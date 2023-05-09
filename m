Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8718C7EE22
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 13:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J7Zpk/i0vy9xvBHfYOIufpEZ46C+ZgqW+byMyoUfrIg=; b=aXeaWyydM21R+J
	jwJ33fAg7uaK3Y+byPSlGbXKCb/5I+F2m3Ft20DDZGSLnSfYea2B8VByr5uk0Xi0MSDj/gd9QRyCz
	Et4NhuHQvk71CVk/WbDqOrN63gHPWevzY0sNRuBItBKavSrBm8LfYrIxOqjnWzT/L+YjtSo+DGBt3
	0RcOEkeAtR+wk/Htzi8XjvNvRoR6FIIsnsJEjtlwoWatfipon4l71NKJWY/eWjzhNdH5btdJrKRiS
	ktSMfWX/8kYMYyEPCcXWX877R41CSdZThbmh2DbPNafLqq5jVGZ6tRRTaSrkfdxkX6K6mRx3zX0yB
	5mo3vQMOwBiUUHj1rdgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwMxU-003Lt1-1u;
	Tue, 09 May 2023 13:00:48 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKeU-002tCR-2H
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 10:33:03 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1aae5c2423dso55649445ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 03:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1683628382; x=1686220382;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2CmyEkggETxM6j+XfIPwTDc2gU78hVyVqaTRQMELVN4=;
        b=D/421YHEpIqNI2B2tC62nRVwKRwWISvXzmsVHqTnpPS7sWEA5oV1gg2yv1CEkeGvOm
         bu1OOQ6Yf89bbybbbU0wwjnQwiQVjiB/EhJ03s/W50aVstzO9WgbfPOMzwwsnKGKI0to
         MZQ2nQbm8+QMiWVOZnDBjVZcsGMvGpMmQnb1HigNlJb39UODk9qWFugpBSB2zx4VIkny
         sBXzjT4kXsh3egVScNVaKPzn/3b8PGUP2CoQ7prUfczz+/WdJZ1tjNK8fzTX0PNwwj78
         xL/z1eYT+/J+H40phb43402KErFEDLk32KMdSisouu6uFPJiGp8NE8k3YQV359BRYaP0
         u77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683628382; x=1686220382;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2CmyEkggETxM6j+XfIPwTDc2gU78hVyVqaTRQMELVN4=;
        b=ONBEGxjQ3iBB931aelw6Y5NgV/owTV6nP25o+CNbr90aZxqcIyLpbgipVGT6LZ4JQs
         GV8ukkxvwAVrtuojO/MUHlRvYL1yP1gWHIHnGjIeYjF57Rluly3lHCDjkRDkSFJlEuv6
         HYstjRixMMCwBMBIHnboW7IiwYipJfIkTY4RadAhb2WLJqer9uTk3yRWnEh5htY8l6Ni
         5+tFC34jIK8F9yHpikdb4sGW+H8sBk6jXdcyeD42nAl2mAGHwlsvI9mWEXb7RpDbcokb
         CunuIQbCHP7gZg8Y9JZYt65C4pchxwm+2dkIIjCHmGLYtdN+d8VcE2o7u3cUSWhfWf+N
         Yxfw==
X-Gm-Message-State: AC+VfDzpQ7jyK9D9pL5IzkPKisOQgUYwQ9VcitF5ROJ400YCilQF4p+l
	H+PBxyAF21Mh0Ph5GJ99ENa+VgIm+kYgD89Lpq7NttkQAElCPBJ4pnDSjepASW+E2I2RxoQDDIp
	huM/ncL5VGwy+px8+smHqRjz0DpwKh6yrZoOZUk2BPBT9iXpmoAGYMzv200ZWU4CkaEaxGwlv5P
	icq5qG+P/YZvyw
X-Google-Smtp-Source: ACHHUZ4Ly10PFLn+5gXRgXrwx2fNdl0W+ClxbNID56SqwDXqCRw4c0/ArwzFpS0/+IbhyeeqFQd3tg==
X-Received: by 2002:a17:90a:2b4a:b0:24e:49d4:bc42 with SMTP id y10-20020a17090a2b4a00b0024e49d4bc42mr13483367pjc.1.1683628381876;
        Tue, 09 May 2023 03:33:01 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o11-20020a170902d4cb00b001a076025715sm1195191plg.117.2023.05.09.03.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 03:33:01 -0700 (PDT)
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
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH -next v19 18/24] riscv: kvm: Add V extension to KVM ISA
Date: Tue,  9 May 2023 10:30:27 +0000
Message-Id: <20230509103033.11285-19-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230509103033.11285-1-andy.chiu@sifive.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_033302_753956_EBF2A3F6 
X-CRM114-Status: UNSURE (   9.61  )
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

From: Vincent Chen <vincent.chen@sifive.com>

Add V extension to KVM isa extension list to enable supporting of V
extension on VCPUs.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index f92790c9481a..8feb57c4c2e8 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -121,6 +121,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZICBOZ,
 	KVM_RISCV_ISA_EXT_ZBB,
 	KVM_RISCV_ISA_EXT_SSAIA,
+	KVM_RISCV_ISA_EXT_V,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 8bd9f2a8a0b9..f3282ff371ca 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -57,6 +57,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	[KVM_RISCV_ISA_EXT_H] = RISCV_ISA_EXT_h,
 	[KVM_RISCV_ISA_EXT_I] = RISCV_ISA_EXT_i,
 	[KVM_RISCV_ISA_EXT_M] = RISCV_ISA_EXT_m,
+	[KVM_RISCV_ISA_EXT_V] = RISCV_ISA_EXT_v,
 
 	KVM_ISA_EXT_ARR(SSAIA),
 	KVM_ISA_EXT_ARR(SSTC),
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
