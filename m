Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA255C25B79
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 10:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bdSwZXexAU25k0u6xFdiGLFcMJCiDn5mhmgmcBfk2jw=; b=abLkouIMqIQTF3
	LxJKX0+v6Fnopl56Vz/fm4FleLMHEtTbIMrduVP/t2+CyDDW8K0gi6QhGhfBsDMsWLunBPjlNsB16
	eLLbGdbtPZ1P7OeKoDM/mtgDttpKK87/h1L77A8m+5t2cZOekheQ5mCLMG460OttvPnF/rq9UiWk6
	8qVHeuRvrISbvNkb9F3S8AvZm409SRdF1DZJknwVj1I+uB/6dv9pxnhLY/jhI8p4gvNOnaXScn/ts
	9G86/w1eZaUTaq4dgdnPANEf4zZjdKfyOJmzyzHJLan5Rw7GIQsa+MLRvOAT0X2zxnxhhGFihbVfK
	o+hHbkFjTpZRKKNMNv4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sASF0-00000008gBu-2nY5;
	Fri, 24 May 2024 10:33:38 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sASEv-00000008g7O-0SZS
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 10:33:34 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2bdd8968dabso1443123a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 May 2024 03:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1716546811; x=1717151611; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jd1Ys62vbvg6Kc0O0Y86nMWaJ5oNcjAjjfmW/HddUAI=;
        b=OmuKI8AkHOmXCfocmfrc2Pn484eU3Wr0pCUlROmyZHZyOHWtbZW30fDd+VdcvMWEwj
         mRlpWLSqdqHvUFTpcwe6fUBYX7elCPR9k4MG4CnooREl6IDVYi/FkdN2F+lZ6kyqIr8b
         +sL7SOgRVFInk1uKacgYpqwl2p6bFFmmhCDoxFxv81gJghTbPn1rLTw7jFzdbrHHc6if
         Ud19yZcG+HDY25It5JMRuYXsDU5lMe9gy9xtkHlqyZsOUJQjxD3QViPZkb+7kXeBZG24
         fCci7BEx+ggQvp+sSIqmMk7CDLSC+22IZBkZOkUgU07oled/6qkcM0blae2hMPvJ/RKQ
         SVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716546811; x=1717151611;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jd1Ys62vbvg6Kc0O0Y86nMWaJ5oNcjAjjfmW/HddUAI=;
        b=NviMy/yj70avsZWl5AIQSWK1kKGeqVLl0nlmDAtrIxENLG+eE9MblyKFLeSUVPEv28
         5OuaUEol0tRKvGqYfq3WrA8EhfMtxpbFW2QLX2WoJJtQjN8PJoZ7BsXZiDFvm2YHnWrR
         H1SZLqISxEKhqQxaK8+JtnMhurAMuwSgbmXepxd3DB8eU/Xo2hGh3+qQwlXFdidw+fW/
         WDpGptja7uFgCLYxwErVY2V6hMZHKsR07qXRZ9j/mwrsXj9G2+J8xKDNu8ztkc0YELS/
         u+g1Ob5WmRSjq4gHVqosjjA0SzamE+8JMrvmZ/vJdmlq1QPuA/lWP5vZEbC68ATLRfZa
         1zsQ==
X-Gm-Message-State: AOJu0YxYhZb7IA5Cs6WpIdSRmplRfnciUUoI99JTdpr4nj8W+YqW7qqz
	Kd+BMQZmdMKiJ6AQqH3jMQCgPfHZuq1tQuBune62d3cm+cMeSCE5efUBBLDIAxH5iYzJfmq606E
	yEPBgz3l1KSDlsOx8vbaM7UmL3YZY3hRMBRl/r0S6ICgfEb26eivOt/5eZbT3opOTJ5DoFTouCZ
	cFPCZ8A7vzq80sLfCxRb/NtmOxMILMhZiurm2sEGKfZC8wcUdOPQoYH7Y=
X-Google-Smtp-Source: AGHT+IEqHFEgIIblN+tGvoPCOSPByLGwZDHSVVvoF8yH7h0Gq/GADB1ishTF2VIIM9YemQrEgoARmQ==
X-Received: by 2002:a17:90a:db54:b0:2be:d1:e7e1 with SMTP id 98e67ed59e1d1-2bf5e173c71mr1678283a91.10.1716546811417;
        Fri, 24 May 2024 03:33:31 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c756996sm10936625ad.8.2024.05.24.03.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 03:33:31 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	cleger@rivosinc.com,
	alex@ghiti.fr,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 3/5] RISC-V: KVM: Add Svadu Extension Support for Guest/VM
Date: Fri, 24 May 2024 18:33:03 +0800
Message-Id: <20240524103307.2684-4-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240524103307.2684-1-yongxuan.wang@sifive.com>
References: <20240524103307.2684-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_033333_192507_2796692A 
X-CRM114-Status: UNSURE (   9.20  )
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

We extend the KVM ISA extension ONE_REG interface to allow VMM tools to
detect and enable Svadu extension for Guest/VM. The ADUE bit in henvcfg
is cleared by default for backward-compatibility.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index a59a8448deea..bcf99264560d 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -167,6 +167,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZFA,
 	KVM_RISCV_ISA_EXT_ZTSO,
 	KVM_RISCV_ISA_EXT_ZACAS,
+	KVM_RISCV_ISA_EXT_SVADU,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 994adc26db4b..4166665e215d 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -37,6 +37,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(SMSTATEEN),
 	KVM_ISA_EXT_ARR(SSAIA),
 	KVM_ISA_EXT_ARR(SSTC),
+	KVM_ISA_EXT_ARR(SVADU),
 	KVM_ISA_EXT_ARR(SVINVAL),
 	KVM_ISA_EXT_ARR(SVNAPOT),
 	KVM_ISA_EXT_ARR(SVPBMT),
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
