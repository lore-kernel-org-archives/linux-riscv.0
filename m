Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D483C001E0
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 22:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6YQJ51AdjOwKLKbNvPs+OrMy1p32gA0oHffenyJaVQ=; b=t8KI21ajyqDqLX
	taqs+GjWq0/hEjc8wLHi0tUEsNY1uutTJod4uhORGc3ropjAFpLwhP6X+9keWMPDq9KNpBgHv//Cc
	1WQ8/zRqXH9a42we7x5KrutK5PasDMbIma6gAQykQX+wA4vbm+v0jseYPvpiLzDAESciW8s6IL4Fw
	P1B7yKGXZ/jkvs5Vtr5ZpxXxtZ3kUst7cS36H+SZ/rzWHBO/zkwNUCEXe93Y5bZWj3RHQ7FRG0bzc
	YDEkuFpDErhaecCU++gUwZPNmJ/q5MqND9k6eNnH+BgPtQNGeH183QNMAxBrnNeZ9ssBVALAfjzN4
	0lodfGaCHwNGMqjBNakw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQxpD-003Qox-2L;
	Tue, 01 Aug 2023 22:26:43 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQxpB-003Qmz-0p
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 22:26:42 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6bcb5df95c5so753658a34.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Aug 2023 15:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690928800; x=1691533600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jv6jpKJhy8/Sckln3Iy5hN8VGQyXxzCnKjLb9FdzrLY=;
        b=eQcjHdUMiP4KVuzPbfF/huXAQjIYpENF9bPpOmaZLemhYuhz0fmpcvjgpBzHITCWPa
         WfCGZ6lgn2+XhcuVgYNN5/TotcazrxjP2IKfHCR0HKpvIGFBr2+Im8QoFCYcsSQ3NfoA
         Wu1XJK9DV7duJnim+JeukPLWpBXTXZ2Z7LRUew6AtiwkShit+BsAWCAR5MZDSHf5DpL7
         G8FYYRSKrL6qXdl+p1fQtKXef1ylwbNWWI0IqIG7HTkJ/h2dBVTZKy2KzTor6jLZQJUP
         gelFkNvBmR+awuz1JvbiaCi8iH4b7IJHlWdGG4/q0M9VFgzqSTEOVoPV31k5Lhy8i3pS
         F0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690928800; x=1691533600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jv6jpKJhy8/Sckln3Iy5hN8VGQyXxzCnKjLb9FdzrLY=;
        b=LUiCWSUxRerc1FBOUfZ4icosYAhfe2pRq/RYUmSN10c6V0sPXG0QYdORypMan7M7Mk
         mkbmly9cFNa7KmZoe9EUM1JO8orOU1pMw1mL58pdNH4KvXsucQ+2dex+uASq3SE+b8lf
         uhZ1oJUuT+Qq3SsrGH87wtiQ+bHbzIaVsT/lXhIzw8TLWxwaLwoiptBXrRxrmwmdOtah
         oEz6/N2fGHHTPxewtNVLPBlIASF7FZ2CsYczFexDjZyujq4e8UnweBgAunZSp7owGFB7
         AftKeCkyWD4egMzayo0qp2cMDQXmEDaL9hlZ3rfzgDrzpWbu6PwstKntG/LYx3o0N7RN
         tcxQ==
X-Gm-Message-State: ABy/qLb3hZXhE5ljix+eMqSw9dMV6kpCzYEJQ89uRfqD3NgB/7Gw0IyW
	v7u6sKlKy8mOWnSSNuVPmw1TVg==
X-Google-Smtp-Source: APBJJlHWrpu26IQHATupCfOKcJlmefh6VXi8ZxEkDKe6BPilP80cVJ8dbkAy+62vxre/85ADQSoqOg==
X-Received: by 2002:a9d:75c2:0:b0:6b9:6484:2f08 with SMTP id c2-20020a9d75c2000000b006b964842f08mr12517057otl.36.1690928800720;
        Tue, 01 Aug 2023 15:26:40 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id e15-20020a9d6e0f000000b006b94904baf5sm5422429otr.74.2023.08.01.15.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 15:26:40 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 2/9] RISC-V: KVM: use ENOENT in *_one_reg() when extension is unavailable
Date: Tue,  1 Aug 2023 19:26:22 -0300
Message-ID: <20230801222629.210929-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801222629.210929-1-dbarboza@ventanamicro.com>
References: <20230801222629.210929-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_152641_291179_70B2D058 
X-CRM114-Status: GOOD (  12.50  )
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

Following a similar logic as the previous patch let's minimize the EINVAL
usage in *_one_reg() APIs by using ENOENT when an extension that
implements the reg is not available.

For consistency we're also replacing an EOPNOTSUPP instance that should
be an ENOENT since it's an "extension is not available" error.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_onereg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index ba63522be060..291dba76bac6 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -135,12 +135,12 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
 		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOM))
-			return -EINVAL;
+			return -ENOENT;
 		reg_val = riscv_cbom_block_size;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
 		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOZ))
-			return -EINVAL;
+			return -ENOENT;
 		reg_val = riscv_cboz_block_size;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
@@ -452,7 +452,7 @@ static int riscv_vcpu_set_isa_ext_single(struct kvm_vcpu *vcpu,
 
 	host_isa_ext = kvm_isa_ext_arr[reg_num];
 	if (!__riscv_isa_extension_available(NULL, host_isa_ext))
-		return	-EOPNOTSUPP;
+		return -ENOENT;
 
 	if (!vcpu->arch.ran_atleast_once) {
 		/*
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
