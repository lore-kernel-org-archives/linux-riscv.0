Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5C1C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 27 May 2022 04:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m+pr/J4BxEJw0+MEW/AQpSsoMaZeztw6mlj//0v00jM=; b=M+fY64pqcFoa+C
	WTisBmYvRZMy3uF/8ro9iUUR/gbCFXT+yRN05qpESDYh7nDe1tTJdFpZ7Xb9+e7E2Fdjv1pl4NgcP
	4JR+N2oamKD1vM8yKGOWFM6odOnIH05NQxrfcHVbqljJfn6PqKkySVIOsz3mj+m349h+/DYSU7zJH
	dUv2/pm8HpIYJRGrFPTB4Xs9XSCHruhDaQbElSgfNwnnvPre8JIO1JiC6inJUvdQ/K/lXU/1kFlUS
	7rrIybvm7UNWyqrMvql2RAoEDo5jKN5FJL9tw0Njb2I2G/GkM7nQA1oW5EIwFFIsW+/okYyB4rSvm
	7aVp88ymqzMCnzHyBE9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuRbr-00GZzz-8O; Fri, 27 May 2022 04:29:59 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuRbm-00GZxV-5h
	for linux-riscv@lists.infradead.org; Fri, 27 May 2022 04:29:55 +0000
Received: by mail-pg1-x531.google.com with SMTP id h186so2979712pgc.3
        for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 21:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bIrQErFI0nRjNQUwExp/Jh1TFsN8kfOtxaRGqU2b0Oo=;
        b=pKCqDbTIAzv7XZRd/1zw5xnWSmXS92/XeAuIrPG8RV18k253OQHW3beXdj/Z8X8DpF
         8AUBLn8agQRTVprD6pj44OQXvmKpf7X1Xombc26hQyZyMIO2Ckewei5KbRrlAIWsyfNm
         6/qvRTgRbDTc0KXsSKeP0hKxIzwqLoey2H1mU8H4qSIKDSLr+xWPNBsrtYxbOO5VhJqh
         zRaJGTh5c3xN8Sr/aJOtrqj6z1aQf8DjyKQ7u/WpEYnPwyYBxxwV0X4ArwfrxW7eag40
         hhLVhFQwIMTNWbmV7EeuTdBm7BcP9DItwSC7gkPsO7/ZwBcLx5bGDyJHtapzlyZmwt3F
         9XnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bIrQErFI0nRjNQUwExp/Jh1TFsN8kfOtxaRGqU2b0Oo=;
        b=xoK8ZANzHOKfOBgj5TvjHpb20fyckTlXPeAxvDzZpnhP0sbEf1dAAgRGfXOiMVzHHC
         8oN2DN+V1XH69BKrRl2gsUI3Z38GmvL7vSghBahQP33JyCPXw+z0Ja/6OyScvyBxHMR3
         QmBScRHZiKPGwGI8DGF+cq8cDHGuN3NlwzZz8tZcbnyxKX4F8BEOWIGx7Kyls8JQTMZw
         5b3wgVbSuvxzbWxstXFdZnRVhJniZD8gJpDYw5wAG2z3T0S8zw6zSsJTzXaolrBCayVc
         MMJ2IFkKMJ0MLB22mSZBoZmLiqda8amLDWTmW8RkOXbvL3JWByJ0siAsQ0zwvbFCexYx
         oOjA==
X-Gm-Message-State: AOAM5307L7PxxJNtv2eUzcGjuFKrNiTYqVGyFSiqSTbu8kwZt3lEdZym
	1GJYVBBOUSM7YvK9+9LqK+6Oew==
X-Google-Smtp-Source: ABdhPJxrx52oLQouegWB2cqbQczI8Sk5a9+PlV1NL/HCXxcozVKB/AzjA84fz49VaakZvG2hls6TCA==
X-Received: by 2002:a05:6a00:1683:b0:4f7:e497:6a55 with SMTP id k3-20020a056a00168300b004f7e4976a55mr41855313pfc.21.1653625792677;
        Thu, 26 May 2022 21:29:52 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id y63-20020a638a42000000b003fadfd7be5asm2352307pgd.18.2022.05.26.21.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 21:29:52 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 2/4] RISC-V: Enable sstc extension parsing from DT
Date: Thu, 26 May 2022 21:29:35 -0700
Message-Id: <20220527042937.1124009-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220527042937.1124009-1-atishp@rivosinc.com>
References: <20220527042937.1124009-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_212954_297927_C1262F16 
X-CRM114-Status: GOOD (  10.04  )
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

The ISA extension framework now allows parsing any multi-letter
ISA extension.

Enable that for sstc extension.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpu.c        | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 0734e42f74f2..25915eb60d61 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -52,6 +52,7 @@ extern unsigned long elf_hwcap;
  */
 enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
+	RISCV_ISA_EXT_SSTC,
 	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index ccb617791e56..ca0e4c0db17e 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -88,6 +88,7 @@ int riscv_of_parent_hartid(struct device_node *node)
  */
 static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
+	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
 };
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1b2d42d7f589..a214537c22f1 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -192,6 +192,7 @@ void __init riscv_fill_hwcap(void)
 				set_bit(*ext - 'a', this_isa);
 			} else {
 				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
+				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
 			}
 #undef SET_ISA_EXT_MAP
 		}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
