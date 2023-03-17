Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C153EC74A5B
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 11:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xjiYssFx8DqrKxCZ3MZthVxgzAhs3hTYG/U+o5To/QY=; b=fttF+5rNkvoi4j
	C0Z9ROWkZRZ9fehcT4shJKjDLfnbH4whFtRGGyA+19mHGEF99Thi/busoHNU5u/3JtOTQgRp//inB
	/5QmvauIsZIDGMp86bhFjiwnZkuLmhrFSXFXk1wIF4A3wt8xj4K5tm/pU96dIi4Y50mHk3xhj/0KR
	cWS6cI2iuWEFJjMy2bxRpp1FOfnWpbc+U5VIdZy5LfDpIpcvL7jz9erI6lhApxpEeAGBMZyIUigsQ
	6TuHAxmfIWp9Y2jALU5iCPB7rQdHymQ7ZBoOPepKNaUcHaBu4R6WQ2aW3DixfOgqN45AO5IIrDEnj
	DWDO3q9WCUJIdU83jdlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8PL-0025n7-1M;
	Fri, 17 Mar 2023 11:38:03 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8PI-0025hn-2l
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 11:38:02 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 6-20020a17090a190600b00237c5b6ecd7so8776558pjg.4
        for <linux-riscv@lists.infradead.org>; Fri, 17 Mar 2023 04:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679053080;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/AAqGu3Y2tE6PwERzlxgF8pRZFhzabNc8FHDT4FhM8k=;
        b=nj5v12IcZMYNHjmFVH++QzKHCWs0GKMkGrliIDsjFKLUFGeE2RCDK+RjZ5DRrTwUUx
         JajHVOQBuSP1SMTwN3vWgVLdAauo0PNs3uv3y8b/mZGBt+tgGNVd8Tev564nCvj9Is5I
         IT1yBCOFgAhIFT5osnX8bAPerR45dOIWzRT9/0KOoWX2YbjaeDhVJ0f4JtZ5vMmq3Zp5
         BOxtfyf56eMGmwR8+KWuCZiRIFAPIOoVmhAwQG9QAs+qZt9DkEzZbiImgCLWHDbYEFg4
         ttgWyB98rPq8kgActV9328vzs0a0BZe9nBhiOss2mE6788zyQL4OphU5blrQu61yibFE
         sCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679053080;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/AAqGu3Y2tE6PwERzlxgF8pRZFhzabNc8FHDT4FhM8k=;
        b=TMW868bxJUdFiDwrfxss5Q7bp6ITxe9DzEdnCmmL+EBxWif9i/FEJBCY7cpUF4zXey
         gZNAZ7bdDbUPMmuVFJEfSvUtTuh1USoyQX1HeTw6+f0d0A2Oiv04MeFYk4WLRnHJF7SL
         MolklgdZv8BQCBIX3wchDHn0V8WdVKRfzS1x7HNZN5CIUwbd6v4yEWKf5/Mr4yx9YXbO
         1y8qU2qYSrDzpXmOb3gjvtDJV2sndJ0uhVYyDzuAHYnMJ1TeOpKVZWWh4U0kFX3rTg7F
         i0h3I5g1NiD8q+NfGqOrBVfLlJBWWokeNjq9wPpJtBeMUn4iXKklZPYGrOd+pB7PXj4V
         FZZQ==
X-Gm-Message-State: AO0yUKWHdyPENDewRqXiuTEP3aQrc5OHV0jVQXtRRAJUxeRvF3jr6It0
	8Yk/Ja72mXiaMTFkRs67Mfxe3BMzo6f2H4bmM6s1KPVCxedKPvY56VOoRknGyUf/izmr7TNsUVp
	Y+7qbhghpj7/mhoD+QX1i7l1DS2l6Flf25KZMLcDr+wLzsNcpliIKCYDEWL5oLWVx4LBsL4w9C7
	4/e3GjegdxK6xQ
X-Google-Smtp-Source: AK7set+DAvC6Q7FfJrmAD5sAzOxXleg1aj0ZYT15Rx6xTjJu9mqsLBNLrtb03zlBd55lzQi5lBKhLQ==
X-Received: by 2002:a17:90a:1950:b0:234:d78:9b4c with SMTP id 16-20020a17090a195000b002340d789b4cmr7573916pjh.18.1679053080110;
        Fri, 17 Mar 2023 04:38:00 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id n63-20020a17090a2cc500b0023d3845b02bsm1188740pjd.45.2023.03.17.04.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 04:37:59 -0700 (PDT)
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
Subject: [PATCH -next v15 17/19] riscv: kvm: Add V extension to KVM ISA
Date: Fri, 17 Mar 2023 11:35:36 +0000
Message-Id: <20230317113538.10878-18-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230317113538.10878-1-andy.chiu@sifive.com>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_043800_906536_692DDA4E 
X-CRM114-Status: UNSURE (   8.36  )
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
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 92af6f3f057c..3e3de7d486e1 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -105,6 +105,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_SVINVAL,
 	KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
 	KVM_RISCV_ISA_EXT_ZICBOM,
+	KVM_RISCV_ISA_EXT_V,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 7d010b0be54e..a7ddb7cf813e 100644
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
