Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524DBCD11DD
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 10:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yq+N7d/S5cpnQfSlWNEMGS/VkHUWN2qEYzvCbMIu1YA=; b=OhDdYrIQUqFUGy
	S1ZVj07Mx8fnLM2+U/JiJFIt7cjQX4xCA5Kdn90kZNmtXYdmAW7pYD/gUkHJndzYa6qTSUvsNULe9
	uhUAgi+AHN+vtnJ5w5Uw6489BEfu2VJoexXX21awwb5nMk84P4p5LW+uXKIR0+S3ztlNWqBlhSqKM
	NH3dVIAomk5jRikNYVKOrN3GAh4y7Ie/wbXJxGLpRZ2qOEUk42IJVLxdTJRCVPKZ25O2yxamFluci
	H0lP83abOM79RSwRkkQ9/sTofP79YyRUJkWCCXaNj+BcgnUV+wqoWqNg7Un1yyTvM55hZtmQMYxxi
	7X/YA/MLr7nMvDbEWxLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq9Yl-000000003YI-3wrm;
	Fri, 29 Mar 2024 10:34:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8Wm-0000000HUUk-2eDp
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Mar 2024 09:28:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AWJBCH09eu6e6/Y/jgxKzI6AZAa7BXYvEZEuKCZc7nk=; b=VMYKI+MB2UTQgTiLimWJc0jdk+
	+GXreDdZiM6HhFhvS0jy7eZdPKDMzDRVMeqkBI7eUjoXX2VUzH2cH2RKgy8dJu6pQxnp4QC/OYXZM
	h3/WAMrUXGlhExJGW8moo17118Se0snxvzcFr12F2DBX/69TYxz71GY93uG/5KSdH3OU2DlPipro8
	nCS8RiUATSxNFEyDQbC5R8/n29feW+CepVxsePS83Q33UBt+7aFRykV17tuSKDnyMkrR0dh1eELag
	Ejd6HFUD1dU2VNTespi1jE+N1glmdSMe9yyqICbGyBm284p/2fuxHCCk4Cx2C6pRdx7U/4ufX8yNt
	I4oae6oA==;
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8Wi-00000001Tu1-40vA
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 09:27:59 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6e8f51d0bf0so1559461b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 02:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711704475; x=1712309275; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWJBCH09eu6e6/Y/jgxKzI6AZAa7BXYvEZEuKCZc7nk=;
        b=NfAxuojrPPQMkaNVyuAP2qLs+VQQvUr1YTA43pWJjtTZ/PMgizHJMPv9VyvNqhF/jk
         xi/ZQgp09f6vLyoyqceiQJrq4oawo9ln4pcHpZXhTPN9o7FO5D3Mn8p3aJo9boAw/jVd
         5Iof47RrtO+OR7VAnkYF4fSMo6OBw7JQ/6+Qhziv6FWwuRWQ+zYAO0MDd5SPnJ3dPSSY
         KkpLlraFVQukWZr++06Ns3J7iAclVcyHW1pWskhW5yP2fcSn/HDRBPwM+oHboEOwUaD3
         G3cAB5cUvzA2UPx9B0/GLpAIerQ83gsoepdce6/h1KmQyqzb/2RRmygWJPS1RFvyzGSb
         CKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711704475; x=1712309275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWJBCH09eu6e6/Y/jgxKzI6AZAa7BXYvEZEuKCZc7nk=;
        b=Wlq71E1PzWAztwy4jmMxJymARYmHAuyXzuRxE1a5lQNP17piklqCq0H/7MnPQpwfNN
         qNAJd320mzPPm/lJHhXfrqzr0ZzmMf3yRnU7SLet5clwrMJFH78pf/n929+l2kaHxPOk
         3hIGOa4CB6gRomIJt6/MGrMs1zAuIcVTcC2hhD9c2TvwpHtL3VLBO7OfBwstEZaPivRP
         jLnrEEaTiVYNNQIpPnA7HloAxow7BJt7NRpcuNDXvWkxF+uSE+9+8e0crOr0pijaSpwZ
         bSMnGVfZyTpAPK0Ff0liIYZn+1rR5jn/KamfXNNv7ATm6Wh0OYe13SImb3KNoh/1Xa04
         9DGA==
X-Forwarded-Encrypted: i=1; AJvYcCUiOT+GwkW6+jaVaH2oVMQnxE6GJAlLvpE31Y/G+HRNROtSlzlPPYwDtiI2EkJwsudjIG26I5MdWAcYyNveMBMPly+AC9U+Q7z4SEqzduNy
X-Gm-Message-State: AOJu0Yx+89WtWHG1XYmqnVfcyNQ1Lqa1++JqmgHEPeqsPwpi0+6SR6mJ
	/GXxUKazPeRR2XJipyIM3IeycLyilGdrws3w+tmts/gkc+7ybciX2iQ9QNPIScATT/2/V5iTOsA
	GD/ErZf5EBx8sj0/Ad/MwghuTQUk92g5ioH8U9JhZVpxXL9FRjbvStbM5V4n7SsqZuRLQbQYF6o
	/ecPjwU7bARmExztJLxrN99nR1DDnMBCsCSiByXwZUgh/QcKLlyQ==
X-Google-Smtp-Source: AGHT+IHveAaHJ+i93XoWQQhAxL1npi1lTK697/I+K/Ux4G4x9neoQ8w5TBypEt7P1DanmINkW4zEcQ==
X-Received: by 2002:a05:6a21:3986:b0:1a3:af50:18bd with SMTP id ad6-20020a056a21398600b001a3af5018bdmr1630725pzc.28.1711704474638;
        Fri, 29 Mar 2024 02:27:54 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id cv17-20020a17090afd1100b002a02f8d350fsm2628830pjb.53.2024.03.29.02.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 02:27:54 -0700 (PDT)
From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 29 Mar 2024 17:26:20 +0800
Subject: [PATCH RFC 04/11] riscv: Add Sdtrig CSRs definition, Smstateen bit
 to access Sdtrig CSRs
MIME-Version: 1.0
Message-Id: <20240329-dev-maxh-lin-452-6-9-v1-4-1534f93b94a7@sifive.com>
References: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
In-Reply-To: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 Max Hsu <max.hsu@sifive.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_092757_229074_62E007F5 
X-CRM114-Status: UNSURE (   7.51  )
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

Add hcontext/scontext CSRs definition to csr.h

As riscv-state-enable [1] Smstateen extension spec:
Sdtrig CSRs: hcontext/scontext availability are controlled by
bit 57 of Smstateen CSRs.

Link: https://github.com/riscvarchive/riscv-state-enable/releases/download/v1.0.0/Smstateen.pdf [1]
Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 arch/riscv/include/asm/csr.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 2468c55933cd..308ae795dc82 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -204,6 +204,8 @@
 #define ENVCFG_FIOM			_AC(0x1, UL)
 
 /* Smstateen bits */
+#define SMSTATEEN0_HSCONTEXT_SHIFT	57
+#define SMSTATEEN0_HSCONTEXT		(_ULL(1) << SMSTATEEN0_HSCONTEXT_SHIFT)
 #define SMSTATEEN0_AIA_IMSIC_SHIFT	58
 #define SMSTATEEN0_AIA_IMSIC		(_ULL(1) << SMSTATEEN0_AIA_IMSIC_SHIFT)
 #define SMSTATEEN0_AIA_SHIFT		59
@@ -480,6 +482,10 @@
 #define IE_TIE		(_AC(0x1, UL) << RV_IRQ_TIMER)
 #define IE_EIE		(_AC(0x1, UL) << RV_IRQ_EXT)
 
+/* riscv-debug-spec: Sdtrig extension */
+#define CSR_SCONTEXT	0x5a8
+#define CSR_HCONTEXT	0x6a8
+
 #ifndef __ASSEMBLY__
 
 #define csr_swap(csr, val)					\

-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
