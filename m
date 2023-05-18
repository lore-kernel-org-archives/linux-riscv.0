Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E4FC77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 16:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J7Zpk/i0vy9xvBHfYOIufpEZ46C+ZgqW+byMyoUfrIg=; b=hHxFEydgyTV/DD
	haMFJM7d126FpUd5pmAizzlX8g/DS+r8XUNkzTVlslsePBZVAbt6+tMDOjGoNd7DPMHu6L+xwr2F5
	3vfmVRrndi/707uin+OQUdNepVtfInPOIijIDglLdOZp7I8Ei38/1Avj4wus8AAH2F3QPG6Wqt4+c
	+iHFVsvzsiQrOvqRrtPzEsA7+Bgxpf2Ge0LBz1UkUK1DUIpOWKGXOmp/gMtT004l1c8YL4L2y3OdU
	Bt8SRlSlPVUH8vegFE88Kz76wG79Vv6VlO3jmesl9VQttlO4OeHtBQ8Rd2mlu4FNyApzlk1Fn720s
	2UO+q7OIFztL3Kq1q8pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgfn-00DUrj-1k;
	Thu, 18 May 2023 16:40:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgfm-00DUr7-0E
	for linux-riscv@bombadil.infradead.org;
	Thu, 18 May 2023 16:40:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2CmyEkggETxM6j+XfIPwTDc2gU78hVyVqaTRQMELVN4=; b=UhcZmbZzE7zHOLcxHCK3n5tEJZ
	GKC2CICtdVfObLMP5V1jyP6JgLSMo+qGatFK7TZCD6AYik4EcyJNhd+SQdCjBcoa0rHQp8JEFrz0j
	xqxcqrQVcbKo8TdIqFk0trAFLW25rKl3T96OvBMeySsJJOJeviK/8cX8MTstsQ3um4E8FAKKubKvJ
	X8pqWN9y8fwIGSgnbGNKhvJAu0aSLKx07Uz+4wKHgzgcr82cFc1wZ/aCSPv0GPGXafuROgwwhL3z4
	+u9CKYacAyYE0x1X1vbpnLxB8uT1Ug+E7Icecb6owLtMZ/a5TJba34rnnRdKqyHEobm0YRAH0CwK6
	IfIZrb5A==;
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgOB-00ErOJ-0V
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 16:22:05 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-64d24136663so465686b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 May 2023 09:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1684426921; x=1687018921;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2CmyEkggETxM6j+XfIPwTDc2gU78hVyVqaTRQMELVN4=;
        b=AHgrGM3jlPNTSTiBOZXW97pWonk960v7FCpKkUSFO/Y9Nn3G9p9ifI4xumGalBeD8a
         ye8dx3J5sseaWNgTc1TBQ7/a6nk7QMlGOlqzMw6kg+gxxAkK+3l1DMvdTf1vk6fhg6OG
         oztqOYqxmsS2pUFQlHThd3wa/fD7Q3CCR6R3K8I57MHd5LkfVpOv+ruiHpZujgdrEUbC
         3gWDPmYGpAEeAgbphIJo5F1qtYBcSAxzbpC0GNT/QYDn7G9FDXkdkW8XdeZDPkJOyVEF
         bikoNET83RWv57aiVG/MG45EkIUd7gwBDGYmy5weNCoTa90jf9OSsIgefh06scr1ZJhc
         zGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684426921; x=1687018921;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2CmyEkggETxM6j+XfIPwTDc2gU78hVyVqaTRQMELVN4=;
        b=dAq3RZLzD5PvGEUKvalvtOhrBVcH7i+h97UmpS/trtpxrq7ywA7V/5tKqE0oGhopa/
         GCIpNYF2J6mI2xriAZYkJHu+YtwvdMK9wwL0QB5s5N/hZYPbjCsN1uzFQ2WLj3dUfH9D
         Vg+EqFwWG+W+k0TZi/qCrzaMvd5PnNHMvQQnI0M/JOud8kmfJw2k1Q2fddEU7s0c9qvo
         jdm8/5pMy5n/dtNXLBkdYUoFbE24Xu/isvNvOgXBNKvoHQl+IaztDiJBQp4pm1XZmu/p
         SCk7jgr+IV8NGPdIGSjgtlcqiXog7GlojJzxHUScC1ygdqSQ2e6U0qNC0DFU6TtJuCJ1
         67gA==
X-Gm-Message-State: AC+VfDxFIG1LNdRAaPw4cc/xcJZmxdgmn3E6tj1CYmF7FHbwbSQXdLO2
	nSDQJYYxtlCKAENybfmV38kG8L6ps1RVKE5QNqeGflSYrv9VPWVe4n+Ap1tk+NdMYL3mTre8Ls4
	wM0ckvFblGRcBs85HBJ4TczLK26PperpPCAcI99FNg4vymew2+l88deXjBdsMm4Fvq1NQt8nDjE
	hEJe5cBdnTcWFHbms=
X-Google-Smtp-Source: ACHHUZ6zEjYzMrp4gF79neLgZkrJ+BeVeXYBeUFIHe55QmvShuoHFiUoi5uBX6k4SWgM8gl2g1pynQ==
X-Received: by 2002:a05:6a00:21ca:b0:64c:ecf7:f49a with SMTP id t10-20020a056a0021ca00b0064cecf7f49amr6056402pfj.21.1684426920701;
        Thu, 18 May 2023 09:22:00 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id x23-20020a62fb17000000b006414b2c9efasm1515862pfm.123.2023.05.18.09.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 09:22:00 -0700 (PDT)
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
Subject: [PATCH -next v20 18/26] riscv: kvm: Add V extension to KVM ISA
Date: Thu, 18 May 2023 16:19:41 +0000
Message-Id: <20230518161949.11203-19-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518161949.11203-1-andy.chiu@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_172203_666260_011A4917 
X-CRM114-Status: UNSURE (   9.02  )
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
