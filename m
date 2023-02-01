Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E6DC63797
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 00:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=flDQTiMgSQj3yGI9cir8iZfDU/hE7pkvv/rt+fQ/+pw=; b=GmKiJX+hH1jWw9
	EGhO52nJDPoD+zXfRWgOXA9WEvzhsUe/48gFow5DzASwghoYOjyMoNrjr8Bml+FDX2OnN4AOJgA55
	l3sZSvwPMOqKV1JyUyYP30zRa9/X1FF4gNaxyloNpREaFaoIPe37CdMPffVjpk9NSLQvb+fXOWO8k
	RNYxvbepxSjPyAo7EM1zYg9GUl/5uBSEjLlgH+9jpz1zHQN6UJB50uzQbEF/dAd6A/0thsGMJZj4w
	cYGiP/vPlvqEiVkxGNdvBV45IiSLl+103QwcSnHXEO7voygxlvV2TsZOdOfBhyYOQJ87QhNQONUtq
	L7RDNhpVbOW8/CPb1Hhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNN48-00Dv9C-CO; Thu, 02 Feb 2023 00:03:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNN43-00Dv1u-Hd
	for linux-riscv@bombadil.infradead.org; Thu, 02 Feb 2023 00:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=f/7530mh4DkGnv39VYISEk6sTro0TBVeeYDJYRU9cCE=; b=ZonDDZBFX9cdY8IZKbOOfdVKQF
	z94zLi8TBiGq9GAn/ub+9VzC49SaEMfmXlzkGbSeFyknfz4M+reBLqP3uX5b37V4REp8bzegWQfnc
	d2bHbOawb4TldXOpqZvVFozlPLjbsS0BOEDZ+qxoXlFQ6ScI7YfJLHsa9d5VeqmnPtn++pGIXh42D
	CSINUkS5BiX3AHvbI5aTwIURgMBjzuC6O3qP++2hKEBFcgIuJnoaoZxpJ5dtZaXrcXYMjkdlgL3w0
	8pcrfN5SR7X3qlVg10OvEQVUKM5BcJfKQiujecGr5wQ75C/A4jSZU9XS6DJm/g60dVdYOyjMRoGCl
	DREVvukw==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pNMHM-004wik-01
	for linux-riscv@lists.infradead.org;
	Wed, 01 Feb 2023 23:12:41 +0000
Received: by mail-pj1-x102b.google.com with SMTP id j5so239364pjn.5
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 15:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/7530mh4DkGnv39VYISEk6sTro0TBVeeYDJYRU9cCE=;
        b=6rrYpuQ3AazlVjMMqGZZu5fqvWSx4m30nKrrli18Or8Z5zP+uxSAYGM9KwQ8QThJKh
         NhPSaWAkWIVugK1pWjFB0xZo0yGJKVVRYvCCZEaw8o6NQrg3KvGg2mVc2oS8Wm7J9Yxf
         ZEtGO1jXQXZ1foQbxQPD0bch3bOQWkFrj0yPM0ivgMu7otiD7CMlZTVc1c6Jh+MQq94w
         5PEY7auuWiTfnCI4NmhQYtox/77QemHrB2VSkzqCbAXFJUrXX1VmNqk40aKOMfUF3ajy
         UtEaqBPJXT7bVv5ugZ9uE+MiVAa4BlkFKiTo9pnBn56SUsZzgRMgctBcPWNwLHN4mH9H
         ruIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/7530mh4DkGnv39VYISEk6sTro0TBVeeYDJYRU9cCE=;
        b=g23/t3fKxj1BhNrhymsZecTYqSeHDAR4J6ej/DBXVPNi86K+VtsfwyO6myzn+52QFH
         ueum+IZYZJH7hk0psyR39bzSuSpZe5xg2/9e4sruydkcfU2MS8z0Uo29Mrif54X5+1j1
         ouxz32bp9GcnR0PwrfMnh9bQifVwHuwWeIziG4e/GtOqkLkww10vcqhAH5oDPYZt8o9t
         /zsUoXAV7ttfP+6ORSDhdkT8BeQxQyBeWR58DSdwNyFvJ3eF2nwlIijxqYuxyStNJfXb
         yH2bB0uzuF62fWG5xeSqNZbDxAC1RVpVJtf8gNg/GqqeRUCZg/JZk0pV5XxCwUt+4vZ0
         7jhA==
X-Gm-Message-State: AO0yUKV/M6g3VdFAS1x7UsHAGzbEQdJa3h2D+1iFx9KKjT3/rrRFzbD5
	DmcLdVg/nK4FJUVK2Oz/wjTxMg==
X-Google-Smtp-Source: AK7set9Rt/QreaL1VPXUzodJiWysodEyNH87Hm5kvz/h1prd3AvfYbOWToHLHNakOdrUE2hCDsn95g==
X-Received: by 2002:a17:90a:31b:b0:22c:2da6:f3c0 with SMTP id 27-20020a17090a031b00b0022c2da6f3c0mr4126607pje.42.1675293181142;
        Wed, 01 Feb 2023 15:13:01 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id t3-20020a17090a510300b0022bf0b0e1b7sm1861774pjh.10.2023.02.01.15.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 15:13:00 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Eric Lin <eric.lin@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 09/14] RISC-V: KVM: Make PMU functionality depend on Sscofpmf
Date: Wed,  1 Feb 2023 15:12:45 -0800
Message-Id: <20230201231250.3806412-10-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230201231250.3806412-1-atishp@rivosinc.com>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_231236_243453_FF3C7496 
X-CRM114-Status: GOOD (  11.59  )
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

The privilege mode filtering feature must be available in the host so
that the host can inhibit the counters while the execution is in HS mode.
Otherwise, the guests may have access to critical guest information.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 2dad37f..9a531fe 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -79,6 +79,14 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
 	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
 	struct kvm_pmc *pmc;
 
+	/*
+	 * PMU functionality should be only available to guests if privilege mode
+	 * filtering is available in the host. Otherwise, guest will always count
+	 * events while the execution is in hypervisor mode.
+	 */
+	if (!riscv_isa_extension_available(NULL, SSCOFPMF))
+		return;
+
 	ret = riscv_pmu_get_hpm_info(&hpm_width, &num_hw_ctrs);
 	if (ret < 0 || !hpm_width || !num_hw_ctrs)
 		return;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
