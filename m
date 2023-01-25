Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9FFC61DA2
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 15:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7tWMreBgjVZf/dnN8Cm5Wzb2uUMpBWR6b2pYpSinGJw=; b=u1W/tQARFcYkgm
	plyT7nkeyUbBIjCQH/ZyIy2clIoakG4MNpn8hg97U3GLvkYASKzl9GEJIHPFqycbO0udPV4QgGCnr
	Qn5bnRAm2CtwQaswJxnez9WzC6+Ps/qYhUrtRd79zUL0sNjlVQa79c0KjGdvGfvNUmjKXd+6TlKaA
	YG3Frm/7urRvhj4H0n6ARYWRe2DraNkizoG8+CWrTjSBP92zEgUDFe7t66EgUO6GoEZ2UDOOqYRjH
	iHVmpVHE3Xh/lk9nZ0rPZVfiENbaO3GiS/OWCCc0IcqCRSzRTjNEiVaDyteUShTbqa64wKgFKE0GX
	1HU3b1d799n769/D9tqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhjb-007p5k-GS; Wed, 25 Jan 2023 15:30:47 +0000
Received: from mail-pj1-f43.google.com ([209.85.216.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgfb-007W0q-8M
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 14:22:36 +0000
Received: by mail-pj1-f43.google.com with SMTP id k10-20020a17090a590a00b0022ba875a1a4so2177439pji.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 06:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g9JZvEgc3t7qPHF5cXlDhMN5hpagVMZC9pMsAoNPQHU=;
        b=Z80E2gJ10aNEcbbtfGBocYqrqwwdq/5WOi8QAKgRWOxJXMcjnIowdDw6W9v3dwV93l
         ode8s+PQ7EE83o2idPCgt0+PNZCmEKgMVBt64j1esoeF00QAMIIeUvq02YE3bQnRclH/
         8jRt4POVT8xyxMOmCIBZCEpfX+jEfjDyRn0FBuCfzOZaXyB8zj1finphTxGIztgfAn3U
         kQIXCPWQnyQ9S94SlRiuv/20G/PvcOHIy9x8thpZ4SxdCzwq44DVLNLMlDErpkttdGSZ
         9f6ybVgQi7XVb/9af2YzJwseuQRH5XPhmMm0dCXauHiSjBiliuVmfCPA8TOQFHX2HNx4
         EjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g9JZvEgc3t7qPHF5cXlDhMN5hpagVMZC9pMsAoNPQHU=;
        b=OPRcb4XhwxoJpMYvytmNFGNMJqFbtWYaq5X0qZDe2C3dxxBZiU5TLko00q4ZuPots1
         6I5lctxkTpDK7+uLDZBjep32zYx/yr0zGmTkcm9nYehnH9OyIxKnAVflaSH9k+55l2l5
         fSfvSdyPcQSVny+zk51xNn5ouP6doM91hMvSKJNbNLbqgIevJBjg8LazHJQDm7Rmpkd7
         pCf9BXX7ceP2oMC+EMZM8vlUf+L5rhgqVNNmHUEjOLEKYtgwGs4ZOnIFO9tKnN6bOz3x
         vQjosK2Z32I/EQaHHSxIgq0Pmo/EmsQw8YE8LIcDzsejys3u0mDmK75f4soS4chkdSHk
         luzg==
X-Gm-Message-State: AFqh2krz06nkEhGLFEtKABOXN9uwhwUzxRMltSNHNaKqcHpv/xNBRC2b
	Zo7naSszYCoF3Qtscc5aMlidxZccHA+sfyQET3B8CGe6c3COaqoXyE7l/GPLjM3G99Bb+3UobIu
	PknAmb7byhbAHxoDN0cXXb439xsE5AR6JZAcqWm0gD/KMM9dwOe6GjRXX6znUFv0aGGQsL3fAWo
	5/jW3f/2xpAw==
X-Google-Smtp-Source: AMrXdXub9jcHo12sPl2id1IhPSk+pfQ9Gyt0ur1hAXKR1AcxccpzQIFjQ953qUhUJTULJyodLBxP8A==
X-Received: by 2002:a05:6a20:9f95:b0:b9:478f:9720 with SMTP id mm21-20020a056a209f9500b000b9478f9720mr24628451pzb.42.1674656552695;
        Wed, 25 Jan 2023 06:22:32 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id bu11-20020a63294b000000b004a3510effa5sm3203520pgb.65.2023.01.25.06.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:22:32 -0800 (PST)
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
Subject: [PATCH -next v13 16/19] riscv: Add V extension to KVM ISA
Date: Wed, 25 Jan 2023 14:20:53 +0000
Message-Id: <20230125142056.18356-17-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125142056.18356-1-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_062235_333518_F071C763 
X-CRM114-Status: UNSURE (   8.96  )
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
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 92af6f3f057c..e7c9183ad4af 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -100,6 +100,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_H,
 	KVM_RISCV_ISA_EXT_I,
 	KVM_RISCV_ISA_EXT_M,
+	KVM_RISCV_ISA_EXT_V,
 	KVM_RISCV_ISA_EXT_SVPBMT,
 	KVM_RISCV_ISA_EXT_SSTC,
 	KVM_RISCV_ISA_EXT_SVINVAL,
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 7c08567097f0..b060d26ab783 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -57,6 +57,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	[KVM_RISCV_ISA_EXT_H] = RISCV_ISA_EXT_h,
 	[KVM_RISCV_ISA_EXT_I] = RISCV_ISA_EXT_i,
 	[KVM_RISCV_ISA_EXT_M] = RISCV_ISA_EXT_m,
+	[KVM_RISCV_ISA_EXT_V] = RISCV_ISA_EXT_v,
 
 	KVM_ISA_EXT_ARR(SSTC),
 	KVM_ISA_EXT_ARR(SVINVAL),
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
