Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6394C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 09:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vVvYSrR33X/x10IwBqkrFQvyd903TyX7GfvSDP8fjw4=; b=MQLNWLD5NzvGj2
	wVrn1iR/bcJrxpmfwx9Wq/nKmyPE8tKmv0uFP4JlGUVLb8hNo/LgfGWEUL1iIaljZup3eRjTN3sIx
	p8fiYqUrH9OrXTdIDcAFUWq+WqwJEYWPQKol4+pqb9jHFyX/9WhdtkLvjjfApyj3y2qVNEXw3UEzV
	EBR4YDXwUfeOm6vLBnrOOGKycmUmV0irpvSiJ5Q8qIUzSEiFNh4Kw3ya+mivqGzA21A+xCg23Qlxp
	CDd1VDhuiHsslKLEiL6wvUBy+UOdd9eeldR9KlSx+6m9rLKIcqBil+49+lCKeFkzxR9e1CJ+ezL/f
	WnAzHGjcc7XB618pc7cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOcYQ-00BIOr-TD; Mon, 28 Feb 2022 09:42:54 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOcYI-00BIIQ-Gn
 for linux-riscv@lists.infradead.org; Mon, 28 Feb 2022 09:42:48 +0000
Received: by mail-ot1-x331.google.com with SMTP id
 u17-20020a056830231100b005ad13358af9so8983749ote.11
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 01:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZOaq/RArOsIMDEytI6Sz1pnZYzBz3vUl5NUCRG67IW0=;
 b=tCKMHUU8QAqKTHwdEi5K8/K7yjrn7fm6WB/AaoaEQI6tkUpy5tW0WXN0c+xY9Wi4eJ
 x/2DwjrGbGUG4RKEmxOeEP4UJzXT31aFaGSjO3VDmZ41dPnA9lA4DvyCwFiroyue0Wus
 MiQrRH9NTjxL2rZt9GcERXjF19Gsjh6UQp9jwYgjC9F/0Ph+2RIEYnGOFkDZYlmeZPcu
 ZXWbxA09SAsx3NXpdUNxEaQvxuMSGUWI062WthWWaQnnZ4bBVaGfgClQmNDOGu9U6Dh/
 GK7TtuNQPyPZV2nGKSASb82XI4sjsqO9G4g7dLQ3Xgp/+VRD49LbiOgfd+2V9amTc/kJ
 2SwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZOaq/RArOsIMDEytI6Sz1pnZYzBz3vUl5NUCRG67IW0=;
 b=FxsGD7WhmcP3T7fVVzjbDnkM1M+q3BUQnUagCvT25To/JSbdFMpWQT7cIfzvqMi0Ww
 vL+wgd/zUgXxMGQrrjPIyPV2cVZe9D2rAcIt+w6PIgdctlAfe0ABtKWFmH60DvlWyKAf
 Kji/sqlcUpdxxoX6uUXtM7p8SJXvOEAq4B5E3AE0jNA+vcoeTd4dtkId5oV0Pg9Qolf7
 jNTyFRdWZo7QO04TOWAirXJYex8TyysvaEHoaluKabupQeAUitQsRJkp0x2Dbbtvs2cw
 g87R8S8YoBNT1S3/RB6Us/HzrvVXRFiWY4liJ0dOJl9JVjnMEUCNhQHHG7JafFMYWTre
 ZIVw==
X-Gm-Message-State: AOAM532WUqtkGF9kz7W/fN8Aoj8hlW7w0DGiPsfGrXrxBN8yeYMZL/he
 yJL8Px/Her4ceenFybioHV+Nv4MUOL0pRg==
X-Google-Smtp-Source: ABdhPJxEMD3OsXSa/J6FmMVubYEnSdaZt/5m8UwSnv4J/cr7HnlImwQ9KxEgWcFI2v0cqErwRyFD0Q==
X-Received: by 2002:a05:6830:1d92:b0:5af:4018:c8bf with SMTP id
 y18-20020a0568301d9200b005af4018c8bfmr8397412oti.349.1646041365638; 
 Mon, 28 Feb 2022 01:42:45 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 bx10-20020a0568081b0a00b002d70da1ac54sm5936852oib.19.2022.02.28.01.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 01:42:45 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, kvm-riscv@lists.infradead.org,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH 2/6] RISC-V: Enable sstc extension parsing from DT
Date: Mon, 28 Feb 2022 01:42:29 -0800
Message-Id: <20220228094234.3773153-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220228094234.3773153-1-atishp@rivosinc.com>
References: <20220228094234.3773153-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_014246_588517_22556791 
X-CRM114-Status: GOOD (  11.17  )
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

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpu.c        | 1 +
 arch/riscv/kernel/cpufeature.c | 4 +++-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 691fc9c8099b..7335e9138fb7 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -51,6 +51,7 @@ extern unsigned long elf_hwcap;
  * available logical extension id.
  */
 enum riscv_isa_ext_id {
+	RISCV_ISA_EXT_SSTC = RISCV_ISA_EXT_BASE,
 	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 031ad15a059f..7568c7084a52 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -71,6 +71,7 @@ int riscv_of_parent_hartid(struct device_node *node)
 	}
 
 static struct riscv_isa_ext_data isa_ext_arr[] = {
+	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
 };
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index f3a4b0619aa0..1d8a06575cea 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -192,8 +192,10 @@ void __init riscv_fill_hwcap(void)
 			if (!ext_long) {
 				this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
 				set_bit(*ext - 'a', this_isa);
-			}
+			} else {
+				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
 #undef SET_ISA_EXT_MAP
+			}
 		}
 
 		/*
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
