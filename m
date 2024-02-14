Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598D3C48BC3
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 12:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=89MIA3rHyUwkgKUClFtsLCtK0/m8vlXB7ZJOX/TOMeU=; b=oaQOMH58BJf2kG
	oUq5pklpXUGNg8gNk+52PwhRAKQBiegiqsQkhQMeuZm26v2aeKfsRL8+lh1hVSC09guP1HLSGw2pF
	/dlREY0DVZmJF6KQZU/uDxjGw2N3IAU3j6mFE1t1Np0Xx1nWeJZ2vz3n0h6hHXJEOVAD8FRkgPT3O
	oMAzX0R3g1edZ+JkiuMm1fgXNBuv37PbvR9vsp0fqVq6pcvt4AF0lTxjSsvF7QMnOvbgnOYQhdXQS
	A+qnV5KAoE71DRZpl6/nvHoP2dSt0BxV6d/1j6qvn++czJ0KeqSGgAQVInlTpF2X0a50EuEmUF58o
	NDDT9geOoEibDkGWMZPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raEX2-0000000CrK1-37tp;
	Wed, 14 Feb 2024 12:38:32 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raEWy-0000000CrFv-0U0J
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 12:38:29 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1d8da50bffaso24695215ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 14 Feb 2024 04:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1707914307; x=1708519107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHKjtl+TiQN3xkVjk4Gl68ZjMVAysMTJP3yyqxhX3IM=;
        b=GweRYfsIlbzbT68CzTI2ODVBgNdwPAUJNV1L5RGo9a/WbQQk/WE9bE3MffrHovVDNp
         sSXpg+E09H1v7aZyCswI5V7HIpy9SBn3OoXCEezsLmXXUxVqyAlEUP2pWafS+LFtCWEb
         boWq3PvSZ6h6s+xO+XLDxfOd4PYw8mAlLJY0RCF2Y0G3Vba+Smbi39ryrbVmkv2mWIiL
         A+cY66eVlNzU+vJ5D6krsUgSG4EhAIMjzI3mnz5z+XFPlFlhVpF5NNhigyE3hr1udlvp
         N3Y7bb0VIvgE0fsnBk7G665sMaBX6tiD+Wnfyhv7ZDM8gRiBIUgtSyWXPnEzaxHoOoFo
         sxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707914307; x=1708519107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NHKjtl+TiQN3xkVjk4Gl68ZjMVAysMTJP3yyqxhX3IM=;
        b=IU9NEGr/zhqD0sgZXZh/pVZALw4m2II2/0ulqCSMoIZ6BRuPLI/7NhKgTO7DqI4MCd
         Xg/XL0szPdV+o+/t/VRJRi2IJKKMaIqs9yevZxAvruJ9GVqmrEg+/UdUNiApIm9jDYvl
         +2kfYrThOoLmgIsX7TzeWsG0Y8L33cy358ClSGRgOvatmviu0eg1Dir4IsuxggFrm8QV
         2akUe9qVN6u9RGPM8TImOQBBgtnOWSaOPiozABgkuS7qtJpzFK0NK9P4lA+gZHggAhr1
         Azrfmmq7nSrZtfDGMOpPgVxgkuUVl8dYchgQL0VzmIdOjwdZTF331M92y/LA8gNHTAQo
         INnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqHARj1WM2QfQgR57sqsXvSG1G/MEphXcBX2YxNEQB+m6CXoK/TqHD3+jgEaPgnYrPCVXqzpa/AqdrpwyGLMCGxqo5QtizsoUycu/D3pYR
X-Gm-Message-State: AOJu0YzHtO/ElMIzj0v9nJ0iTOY57beD9BTBz/RHQhT4dOXYoOqD7xhC
	DlQ+UaA7pob7lyThaRoDiuRgAu0hr8Bh0FCFxD3se48XEWycebw/nhuCQYIPCjs=
X-Google-Smtp-Source: AGHT+IE4eB6K18FO+NV+30jFVOFBt5sQrSmihTsDMjky3cQtyum08b1pUVZK7T/7CIdCYEPbGH9Wqw==
X-Received: by 2002:a17:902:eb89:b0:1db:68d5:6281 with SMTP id q9-20020a170902eb8900b001db68d56281mr717883plg.35.1707914307513;
        Wed, 14 Feb 2024 04:38:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6JYSlk0nXCb0cCSJmJVtMcA3/mi/wxVgTU49YydRY51DqTvVP0HOsuMu+uEiHFW5vdTQBkqUZY9o5tBwRP6TqnEv+nZnUhap2OH+nfGTbEt3lY/Ae/q4i9vdc/StMRf+9juoiTb/5jO4vlL/PqQK3OjSqQ5dh7uzMrrlFalyKWpy+t+tn0Fo0/V2Tp2w0HKwrTY7LYbYAtv4VlJgxcpzDN8v0xk6gU0lKQbcRYPrLUTNWXKMg7VyqN9gdLEg1/FaCxccjnyp/qaIA0HjWXBKEUDaA1hBUn+wc2bETB9VvFzfzckufJ8BKYSQzn3cTVYx9swbNbLAACI5d2s7kS1aF8ZwYTw3o9N7OZFInjwG0TMXNnyBL31t5GwmjElQXq09vk4owgaVGpVZDJGgc292s+M5meW0j8nnGCPfgm/rfrIQxUno++Ly0eMQ/Ng==
Received: from anup-ubuntu-vm.localdomain ([171.76.87.178])
        by smtp.gmail.com with ESMTPSA id o20-20020a170902e29400b001d9b749d281sm3041419plc.53.2024.02.14.04.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 04:38:27 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 5/5] KVM: riscv: selftests: Add Zacas extension to get-reg-list test
Date: Wed, 14 Feb 2024 18:07:57 +0530
Message-Id: <20240214123757.305347-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240214123757.305347-1-apatel@ventanamicro.com>
References: <20240214123757.305347-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_043828_192082_D23A0581 
X-CRM114-Status: UNSURE (   8.14  )
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

The KVM RISC-V allows Zacas extension for Guest/VM so let us
add this extension to get-reg-list test.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 5429453561d7..d334c4c9765f 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -47,6 +47,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVNAPOT:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVPBMT:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZACAS:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBB:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBC:
@@ -411,6 +412,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(SVINVAL),
 		KVM_ISA_EXT_ARR(SVNAPOT),
 		KVM_ISA_EXT_ARR(SVPBMT),
+		KVM_ISA_EXT_ARR(ZACAS),
 		KVM_ISA_EXT_ARR(ZBA),
 		KVM_ISA_EXT_ARR(ZBB),
 		KVM_ISA_EXT_ARR(ZBC),
@@ -933,6 +935,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(sstc, SSTC);
 KVM_ISA_EXT_SIMPLE_CONFIG(svinval, SVINVAL);
 KVM_ISA_EXT_SIMPLE_CONFIG(svnapot, SVNAPOT);
 KVM_ISA_EXT_SIMPLE_CONFIG(svpbmt, SVPBMT);
+KVM_ISA_EXT_SIMPLE_CONFIG(zacas, ZACAS);
 KVM_ISA_EXT_SIMPLE_CONFIG(zba, ZBA);
 KVM_ISA_EXT_SIMPLE_CONFIG(zbb, ZBB);
 KVM_ISA_EXT_SIMPLE_CONFIG(zbc, ZBC);
@@ -987,6 +990,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_svinval,
 	&config_svnapot,
 	&config_svpbmt,
+	&config_zacas,
 	&config_zba,
 	&config_zbb,
 	&config_zbc,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
