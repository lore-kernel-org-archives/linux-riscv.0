Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828D3C32771
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 21:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k75v65YvJfPfr+a4Ialsh9bnzjk+u673R38VHKRYN0k=; b=4i5aMSxnqPS4Bq
	SPO9XiXGlUs3ST4XGmSK/0dmnHbXN9g4hlApvjKsNt1nrKXEatlkk8rCDNCnxewd8Wk7vOr/ssVvU
	bloZn3qMr+zFX7t0OtPDrR2xVzG6F2z5+aL3XqS8a5FVGYqIaAKex9880d+YR2M2n64O50hch8Iou
	BMBIMvy2Wzt69lM4qTe3P+sJXNJn/QQA8qEAS2OJtuCCXDHcAbeZEdbFUVzRShcBf68s029bEIupT
	TmL7dfh1puH186MMMvFM+HFbwNHUgII2+QJTJBA6UOj48nfV7Flw6+ovwWCnppn/cVKVsoCqe3juX
	Q0WkqOOLA4newpazbFvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob7gI-00Cncs-3G; Wed, 21 Sep 2022 21:54:58 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob7gG-00Cnbk-0q
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 21:54:57 +0000
Received: by mail-pj1-x102c.google.com with SMTP id fv3so7917887pjb.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 14:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ktAQp/cqUNax6F89ciMk5io9XS6O+IoDU1II6HgARlk=;
        b=SQEMJdZAxGZLgr10LuMDwKTK6WnB/iHH0F/XbZBnLhtsk4J9RkRaDB/8S59fu2bvkW
         T+GTfp5V+hhi71zNXY6WbofK00rZEfqdtw8pA4P0Wzr9Try2jGDApm2BQrjuu8euMhBk
         yZoFHMNBtPF7gP870Pz67atYHfqGG79eDhd04MoUTO+mYew6PrPR6NNI0+REGOUQJlAN
         PCNWJlfaruV0NIL6eAnQjufQJw4ddzljKoBygMsvenog8DVFmgMY2sn2d5Ui3Mqfxf/D
         EJWveRPWpqS8XThMM/pepjqjRGb6ZvWRi5MTpio7GEks4HIuQzVxCzIrjzh2R2YfJqS0
         r/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ktAQp/cqUNax6F89ciMk5io9XS6O+IoDU1II6HgARlk=;
        b=KjCekhbaR2SMdvd3mHWkersDaqUSpwbPo8MluKfRFUrhEK9UEebqqCscVSNkSoYGgo
         l4Hukv/Ck6VWlpHjryzEmM3sfLnU5Sgfgi1NkrLcHUa1E3EU7y2J6eII+DpwGgH/H+gG
         chPMwsK7BKiJNeRYsjSUV09NrQKP9ZvORbXMfc6p/vmSf4SHbtsCb5rnHRx2n5MQCgiq
         41crsCIqtl56SydbY7oKw3m7fX1f/K/3SIPxNgF4dLNCwCWBcSAj2C2bnKs25fg0KrvE
         whan0f63NhisDqF5EWD0Xd58YNM/fgwxH3s+Hz5K2N2BhGyLc7JZ//0XnC3SWpzQvM1F
         YCVQ==
X-Gm-Message-State: ACrzQf1RLE/TiLgbl9z+012NkJHJ59pNs3dO+0aEsNT6T++AovDUP9QM
	Cz+3VtuQV6nhT6rA8W4ELmMxvg==
X-Google-Smtp-Source: AMsMyM7EX7gXqZwatQYRLwQnKPNv/NMPRKHkABZjVRfo3abBbcBrIn6WEKrplk+J2Ts1/dkn3qOeqg==
X-Received: by 2002:a17:902:d512:b0:178:6946:a2aa with SMTP id b18-20020a170902d51200b001786946a2aamr139075plg.116.1663797295533;
        Wed, 21 Sep 2022 14:54:55 -0700 (PDT)
Received: from stillson.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id k7-20020aa79727000000b005484d133127sm2634536pfg.129.2022.09.21.14.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 14:54:55 -0700 (PDT)
From: Chris Stillson <stillson@rivosinc.com>
To: 
Cc: Vincent Chen <vincent.chen@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Chris Stillson <stillson@rivosinc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Dao Lu <daolu@rivosinc.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Nick Knight <nick.knight@sifive.com>,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Changbin Du <changbin.du@intel.com>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Yury Norov <yury.norov@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vitaly Wool <vitaly.wool@konsulko.com>,
	Myrtle Shah <gatecat@ds0.me>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Janosch Frank <frankja@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Vincenzo Frascino <Vincenzo.Frascino@arm.com>,
	Eugene Syromiatnikov <esyr@redhat.com>,
	Colin Cross <ccross@google.com>,
	Peter Collingbourne <pcc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Barret Rhoden <brho@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v12 15/17] riscv: Add V extension to KVM ISA allow list
Date: Wed, 21 Sep 2022 14:43:57 -0700
Message-Id: <20220921214439.1491510-15-stillson@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921214439.1491510-1-stillson@rivosinc.com>
References: <20220921214439.1491510-1-stillson@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_145456_070571_341C6D88 
X-CRM114-Status: GOOD (  11.51  )
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
