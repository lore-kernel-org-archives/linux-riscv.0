Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898BDC6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 16:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WlKkYSW6y1jJ7BibbTu7JX/OdkGuFFeZMYgvEL01RA0=; b=DUFsRLAFaNT5Qs
	EVVND5G+kbeHm/rZ1YcT+5NTU1rWyjSF7RsWK27BQ+rEe/IgA7Ov78y6sd0FNLdX4fBi5Fs8G0/CO
	/n128ZbQyXOThx5HV4PdYHRVgGpkZk/noASAHhEu3+/MXsSSjQHepi+wcsqgOfZDcfr2RbNL4XHT5
	emDdkGAEWDzIYJrPEQR9k/kDfmkybbT+cynDfr1OxRffSQ2ToVbC5p5aO8AmIoY9ho2q42NaoS8xz
	qru0VnVqOuy6JOJyaYme/wr7i/AFHXHQZLLhXMHrWDYEUQ03Gqw2wV/w5EdEhyJPtQXSHQDrNxIz7
	QC7KwCRvFAm9uDt84Qkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq4G-00Bm3u-2n;
	Mon, 27 Mar 2023 16:51:36 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq4C-00BlyF-1A
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 16:51:33 +0000
Received: by mail-pl1-x632.google.com with SMTP id c18so8988886ple.11
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 09:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679935889;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JozESal/Fbpp9RViTDB8Qd5//8qhpKIjNlNXSseO97c=;
        b=FQClOy8uhHD8HXTVMAkI2hlX+myS5NpsInaAGuzVF/YYHIFfXuTOPS1VgtCfdFGmnA
         I1WFAX7STgi247ygtMPXKLtDZ8dn9m5hu9wDPxrFci0BDOAuZPuhhgkRJS0TezMyOoVX
         Wm9TLKctCmM2tOs4J0i970J78Drn5D9X2Xw1307HWgR5u8+FUmGZaDGZRExs38WzuftY
         ERJyIYzz3ntEjuGwze4K4Uz6LKNB9/onC8CM1IwA05Pi0QjWvmcWkfqJUyhaYQKp4677
         /hKr/GU1XJ7Qu113/AYitD0tjnmSb+9UjBP7lZhndHmrP2VN8O6rwZu3XFaRlA4gGQ8x
         WbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679935889;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JozESal/Fbpp9RViTDB8Qd5//8qhpKIjNlNXSseO97c=;
        b=HkfglZ9HGBtjvDPH2+cmzmxze9ibPTg4xHNKklZslh1Y0fn7LfyB8CxVE2zDEgZiaR
         /2dqD8FIEhbjDERckqV4rRPKpLRDTfEseioto/xtditIQu1Sc1V5qxlvNv0Zpn0z5t1/
         VabJhsq8i0YnYaPEPwBjrCPlKDMH49dyCf5xmEh2j/sSScjDkPgd9M/cozXtVF+zDsLQ
         BIGNRDLcnxar7QcDYHXQCfrPLVDdzmSQP0TJPjQukaVNNlNDZr08a98I0VsjyAjujiwQ
         Xg9hqe0ahPOgn4j/8tkdqguOiN+7zIj1Y+L/my7YCZNYBVGzXUbPVJIjn5LpzAGvA8Qj
         EslQ==
X-Gm-Message-State: AO0yUKVvJzIUCHiG87TlqGXbxLuEoubDf4IhGQhk4+tlN+gcCpnpoIRt
	Vo7VYJgUwMLVheRVBXeNW3QbuDkC5pgTR6qmIl9hweGRvKMav6IaBGnZn/anV6dFmLVM4PoJUUc
	ig2Du4zGxo0hEJKTaTW+Ap07CFe6VLu8m8G+YAD5zNhI/ljiQiHvDul0qttQjLXS3HnqqV8WCET
	QxNIhUD81WfrR3
X-Google-Smtp-Source: AK7set/JbltxNvnJPfxKE8YPJavwWOt3kjuVHPlOdSBNEsQuY4hrqlGsWSRZQViZSSF4uL3WPD8W0w==
X-Received: by 2002:a05:6a20:b291:b0:ce:ca9:ab56 with SMTP id ei17-20020a056a20b29100b000ce0ca9ab56mr11838514pzb.34.1679935889098;
        Mon, 27 Mar 2023 09:51:29 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q20-20020a62e114000000b0061949fe3beasm19310550pfh.22.2023.03.27.09.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 09:51:28 -0700 (PDT)
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
Subject: [PATCH -next v17 17/20] riscv: kvm: Add V extension to KVM ISA
Date: Mon, 27 Mar 2023 16:49:37 +0000
Message-Id: <20230327164941.20491-18-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230327164941.20491-1-andy.chiu@sifive.com>
References: <20230327164941.20491-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_095132_404346_FA00FC37 
X-CRM114-Status: UNSURE (   8.76  )
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
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index e44c1e90eaa7..d562dcb929ea 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -107,6 +107,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
 	KVM_RISCV_ISA_EXT_ZICBOM,
 	KVM_RISCV_ISA_EXT_ZICBOZ,
+	KVM_RISCV_ISA_EXT_V,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 6adb1b6112a1..bfdd5b73d462 100644
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
