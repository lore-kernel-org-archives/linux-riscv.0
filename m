Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52171ECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 15:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vBo+IwJg+fylrmnw6dDpD5B/0OYALSz04n2DQyGbIAM=; b=pmdCbXBqzGcyok
	5QU5Q9Gyh76Q6xT3RXM08Na6BOUNW7RREGFUMMKvYih66uaHJRexhHkh0LoDM2EJBXNWZmxgn6KYK
	JMMUttbHLnlh/mqWvOduO9nP7RDEf3NURrLioND7l0j6f7TgPt2PryQls/hfNvk5gQxhiIedD3aoW
	aSNWveWAnWRY2mQh+nKq/L6Mqd8iPSr9/GBh3uOdXk3N2Q6DcPGCUSU8nxpL/tZPBqgygwq00+lcN
	WMT9oFbSenKchJEgvZFPETrblP3QqU6PHOKLPj7gnAPaArZXbZPZ+4lO1cr2qshp5QXLDya7kZEHJ
	f/Tsfsj6jT3a6byf+PEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYqoN-00CO5u-GU; Thu, 15 Sep 2022 15:29:55 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYqoL-00CO55-BL
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 15:29:54 +0000
Received: by mail-pj1-x102a.google.com with SMTP id fv3so18168935pjb.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 08:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=KR++kMsMWKOlc+go1l1Yf8GVj8KL9Cb61pjIboyyqR8=;
        b=ahEVuxmFzgnxBezEb0sUfrVVeCNprdpHXM3l99VqS5aWxPDKlOC1T8aZGHAdZaxkHE
         y5PGNT0bwoPrHaoXH6V7h7TorpChtmizjQnJGanZ74PVyGVszWg8Y7E8OrUcqBI7Q0vH
         ZxPcKJFNRBtXZkVH42QfbGb9anylU8gVPi681bNcag+x0HmKiA+oBHaWk9Lqkjj9MKSE
         s0b0DARlE1Ea8XQpXlSviyC87DixJsvBOeptX040meV2rov60j4RPmoKUFXt4ZU9Mk69
         Wg20BjXlgVngLvKgp2y3xILkPVATKEQCmtLCN2e+Z0bYentdKwvzzQbc9IvrM0ihe+GK
         7Ohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=KR++kMsMWKOlc+go1l1Yf8GVj8KL9Cb61pjIboyyqR8=;
        b=gFnP3Z/DBwS3YjxCfIoQSWD0ylqDDGPw2kWagauzUtCpfmkmQBPo9gTBnn/KhWwqtK
         SiQCJLeH3Dd/Wid5uOKNJ3gB7sSx3lh7CrPsiKg1/Klwui2GCkT9qnDosXayrK4kMk0n
         NjIzMXStd4kONDWpKI+4TqZjDptbn84PX0AAp0hqglSTkrHHYwlSqP+JC0BQyU079MIv
         6AXldD5QKE6xa7bPceRRnlMNRG/5hQgts50pCYSWJ6inedcXxx5fK3mnKxO9mspk6RuK
         aa1fGxKgBesi7oxNCm7SXwBCA1ph+YcO3PzA1uRWkGHGgM1zihAdN7sn3JHudySUJGJ4
         YBYw==
X-Gm-Message-State: ACrzQf08HD/5g9BiPUuIdhUDK/6skHwM2jm5HpCfcpJo5sZGxpoGWH1q
	mfds7O+bpxwh/w/IovUg2TfKgA==
X-Google-Smtp-Source: AMsMyM4aWNGBoSARbIuRTYYbvZhShCyrQxQl9Uh52BoO6JwMBuVh4DehW427QM06MYdPUkYhGCdNpg==
X-Received: by 2002:a17:90b:33cf:b0:202:5183:c1ab with SMTP id lk15-20020a17090b33cf00b002025183c1abmr454730pjb.117.1663255790511;
        Thu, 15 Sep 2022 08:29:50 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([122.169.80.30])
        by smtp.googlemail.com with ESMTPSA id w5-20020aa79545000000b0053818255880sm12644152pfq.193.2022.09.15.08.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 08:29:49 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1] RISC-V: KVM: Allow Guest use Zihintpause extension
Date: Thu, 15 Sep 2022 20:59:33 +0530
Message-Id: <20220915152933.816459-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_082953_431739_85328B81 
X-CRM114-Status: UNSURE (   8.05  )
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

We should advertise Zihintpause ISA extension to KVM user-space whenever
host supports it. This will allow KVM user-space (i.e. QEMU or KVMTOOL)
to pass on this information to Guest via ISA string.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index b6770ee08872..9085b90cf324 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -99,6 +99,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_SVPBMT,
 	KVM_RISCV_ISA_EXT_SSTC,
 	KVM_RISCV_ISA_EXT_SVINVAL,
+	KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 901bb5c0cb50..0de0dd22e734 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -54,6 +54,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	RISCV_ISA_EXT_SVPBMT,
 	RISCV_ISA_EXT_SSTC,
 	RISCV_ISA_EXT_SVINVAL,
+	RISCV_ISA_EXT_ZIHINTPAUSE,
 };
 
 static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
@@ -89,6 +90,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_M:
 	case KVM_RISCV_ISA_EXT_SSTC:
 	case KVM_RISCV_ISA_EXT_SVINVAL:
+	case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
 		return false;
 	default:
 		break;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
