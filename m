Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B7CC636D6
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 16:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rmn+xffy+S+SvEh9CJaL6B2LDCtpmc0a/IqVLNZAM9s=; b=Jyy0dsiBOwaKMB
	83U0lLNbMugczo+qK/9DFZK7TrgoBONX6n5UD6O9zLV4+ttLUsNA0Oq4coFvF77YdhCeSu0iIVpr4
	+FeNrpui+RuzbDN+6hKehcxr+uYM71BE0uo2glF1GPpjkGEum9DXcjzSbutPozfqI/YGgWWeQquWl
	zEnC6ig9b+v9lepf+EboOYRdbbfrBZZA0v7c+RWQ0HBpokQ5lGfOBe2z0plijp3AojkOzOcvYEpTw
	o28zatNqebxgWmq2/jmWVxqfl4HGbwCgOmIEc+B/WxnMo55V0DTB5GnAIiMo2tiV2mVUOWRo/7Pee
	B8gLTc5Mknw+nYm6d9Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ9Np-002KKc-OB; Thu, 09 Feb 2023 16:02:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ9Nl-002KJx-Uy
	for linux-riscv@bombadil.infradead.org; Thu, 09 Feb 2023 16:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/Z6tZFFE5BTtnAERh23ZFuGlAMKjWB1LeNlstGrShuA=; b=FIp5Ec8JHgaTagaL0UNx2crIqS
	Se92pgk4nzVRHFCyWpFh/P+cj0pnqpAArTlviuXwPW3Cz14VSjMb+ihjSEiqUgco5Lr81g6LRa3XY
	fFEzrMsyBbFaLq+IuT+0QyMxSoiTREzNPsf4zth1JfqoigPGmNvPIOFXNp1fxyCk4Ks543Lhtc495
	8H0PzLI4d4c2wLzix9NQ3Sua8BbnnHqWbBq+0bDFQrVahEhljlzTTLqO3JboAaqTz+uh9+DRwyBaN
	fOLeTSdSCmyhof1TVS7BOxOOndORESCeayJZpsbIcFqW/PPFHqNXg//NtXYFxA5G8EiHafdzKu9Eb
	Vtb66QdQ==;
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pQ8oH-007wyW-1p
	for linux-riscv@lists.infradead.org;
	Thu, 09 Feb 2023 15:26:09 +0000
Received: by mail-ed1-x52e.google.com with SMTP id l12so2481456edb.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 07:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Z6tZFFE5BTtnAERh23ZFuGlAMKjWB1LeNlstGrShuA=;
        b=MfRJdMTAHj5+JJRQGofZ32uOas7iRCdR8tHF/yrvxQYPDbC6OaM+RwXjiXD7/9ocBc
         Hge/rnFAvW44scWIKVn/wGhW9qPR89vZ91M2KeY1rPbFHJLxkHnK5O3eUaPnXT0RW34m
         ADVTu/E2h34e7G1jQlwdxPvZq6vLkaoX2C1E3MsbNNNFPZBa4cTrWUhreTyq7bw7Y/lB
         JlvCxWwzg4hyufzefxwhBQUgxvSzgydjJ0CmWxRbqfJcBsykqzpbbjsLqV/jQmFW7E9Q
         g6+hBU33VIXt9BjfuDF5djj4kBGKZMcDhKDu0H98EIRZe4I3bxEevYP78bHiK5RmYEYs
         0u9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Z6tZFFE5BTtnAERh23ZFuGlAMKjWB1LeNlstGrShuA=;
        b=VQR5tJx2Bo7X9rBU4dcK9iE140sSN+zs0Ju6OJKU+OhxECsVUEAZ0pG7iuPPisGLlw
         yE9tGFQ1rhTCMz/2g279KST2Tk+LEawynx0QQtbiIVuidx3VgBOmkr+/GUTZZjHzDjqD
         xf+z+hVaCDC5z9EroCvijMbCj4vq8JLlUbC71Zua6On4Mbif0QR7g+NhnWSYT3R5uvwr
         zkb12IFn82aJisTpy/d0pGmqcKBEXCrx/dEj3Ei6/TT+AnrHUZLz+ScRWStZwqPQ9pP9
         nN2Yn9M8rNDvAY3chCFoaetolPKuKbLg0qOUlyk5qFi6IFzFCBCSvFntJ1JUZPszvbO/
         gfZg==
X-Gm-Message-State: AO0yUKVrXw4tzaRuolTRvOzJwDDfCq8QmbmvseRf4KGIApxhQlNMrBHj
	EVfNSN6YO/DssVE+3Et1lyesDZc94VwxOfJx
X-Google-Smtp-Source: AK7set+wpnd01LOEUonPTuImhSfFXIsbYs/b88fzwjAmEzUc0jZtT+PCnTayBEqgczGaaZE+1WKvHA==
X-Received: by 2002:a50:c05b:0:b0:4ab:2033:8c55 with SMTP id u27-20020a50c05b000000b004ab20338c55mr1781619edd.33.1675956402823;
        Thu, 09 Feb 2023 07:26:42 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id s6-20020a50d486000000b004aab36ad060sm891945edi.92.2023.02.09.07.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 07:26:42 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: 'Anup Patel ' <apatel@ventanamicro.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Atish Patra ' <atishp@rivosinc.com>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Rob Herring ' <robh@kernel.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v4 7/8] RISC-V: KVM: Provide UAPI for Zicboz block size
Date: Thu,  9 Feb 2023 16:26:27 +0100
Message-Id: <20230209152628.129914-8-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209152628.129914-1-ajones@ventanamicro.com>
References: <20230209152628.129914-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_152605_773709_F49BC996 
X-CRM114-Status: GOOD (  11.08  )
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

We're about to allow guests to use the Zicboz extension. KVM
userspace needs to know the cache block size in order to
properly advertise it to the guest. Provide a virtual config
register for userspace to get it with the GET_ONE_REG API, but
setting it cannot be supported, so disallow SET_ONE_REG.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 92af6f3f057c..c1a1bb0fa91c 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -52,6 +52,7 @@ struct kvm_riscv_config {
 	unsigned long mvendorid;
 	unsigned long marchid;
 	unsigned long mimpid;
+	unsigned long zicboz_block_size;
 };
 
 /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 7c08567097f0..e5126cefbc87 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -276,6 +276,11 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 			return -EINVAL;
 		reg_val = riscv_cbom_block_size;
 		break;
+	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
+		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOZ))
+			return -EINVAL;
+		reg_val = riscv_cboz_block_size;
+		break;
 	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
 		reg_val = vcpu->arch.mvendorid;
 		break;
@@ -347,6 +352,8 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
 		return -EOPNOTSUPP;
+	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
+		return -EOPNOTSUPP;
 	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
 		if (!vcpu->arch.ran_atleast_once)
 			vcpu->arch.mvendorid = reg_val;
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
