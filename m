Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65315C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 10:46:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 286D460E8C
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 10:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 286D460E8C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=efcpO6rPFr2hIXp9gnx+GlHSIViDOTgPEWFHP9sBRZg=; b=c4zBvMRHVXbvdk
	oxfzvdgDCca2qZZNgNyAxLP50T82Mxrdpr/zVzB1e2iCvgvsrxFGI6oo7rBVYXoyItHFQCFe2GPzs
	6tAVcDR3nndnTnnFWQgxnedoNpMkQSDJNf8/hMvpXUZ73WNBTjyWe3+F5bnlaTuLBnGlfsEFd3Na6
	WfhJkMCdoL45LT6EkZD1hu2rsO3pyFnbaivn0BPsa3u4c85jwl0lsKj1mn8oR9mRHz1fKo7VTkbQk
	4Q6fvJ+MddWsA7+S6zflFPv19IadwC7kPTORv5VN8aRcpWGdz+pruIBmVR9FrAhL0geu+hqi9J4R4
	0oHjCmbgL0GEBY0wf1nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdVa4-007HIc-5K; Thu, 21 Oct 2021 10:45:52 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdVa0-007HG8-N6; Thu, 21 Oct 2021 10:45:50 +0000
Received: by mail-pl1-x62c.google.com with SMTP id y4so153648plb.0;
 Thu, 21 Oct 2021 03:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AD2dgM0zOn+M+g2RGuvovb9BPcvRHY33KeWc/UhpNGw=;
 b=Snj3fnFkDCt/kE5qCbarCVOnGdbw8px3rbLWF5GhXJ+Cjza+RNMQKVP5qdVC9BkfKM
 BzgD3ew1SREru87oLgmeH7xzYSfg0CaPSDX1820dqKMSGJaz38ZDHJVoYT0Awwnckn23
 EbfNdYChCd1lp1TELLyMLfkPl+T+gOKGpwfo+al9SFE9hmNdawJZPkf+/jCEpitKQtut
 R9V9xPkzxkkdP4fDfZpA6yUlbtDeJ75wV4gf1rqMIrssVI0lnsBM/oPtVyHwG1nh0AsB
 gP/u+hNuf+FzmxS4KSfOeR6nbBdHq7zNlu91Xx34+Qbe2w1qssUw+xG85ZAcYiNwLFEB
 1BsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AD2dgM0zOn+M+g2RGuvovb9BPcvRHY33KeWc/UhpNGw=;
 b=aKKYBYtUWYJEdb+U5DIu8ge+XqG1cVvtfZFr2wkmTg/uWQ4oBNRmTg7JSgb49u4uA8
 IjSmF4Zvq2vmFUKxMpwSf3iQkN6OC2GRJmyJ+haTs9IpxmM4IeZMGVAgXsc7REg5n8rQ
 kGoKYzbZLxaWiO8bHx0TliDpiYQ1E+Y8ssJ6h4YnSY0e9QGFDRxcJkYXt12z/AsAfl0B
 /f3aUdNzUh+LP5qp3PZ3RNjESMIUBVIHLzvmpn2W20s9lqAB0N2ZUjqGQFbMF7J9Tlif
 vWZTG1T03Z8xlmJqyQcBMDpSddotnIVbL5HubxWjYkGuOVJpGZQ+wWOPwPsua7Syu7xC
 gGjQ==
X-Gm-Message-State: AOAM5339cm2Pjzm6XuDw8+Qrgy4Ok51h7+Ps0hsjYUdOgaHMxkrOarez
 A1EWNibbmtAIZxX7oKEHXa8=
X-Google-Smtp-Source: ABdhPJzdNFVZFI9FIDisl3iWCkpstFXbPSPKvMlVXZy6TSnE0XsAMgeyH85X1nHC6O2Q51WGZFqDbw==
X-Received: by 2002:a17:90a:ac14:: with SMTP id
 o20mr5702524pjq.219.1634813147081; 
 Thu, 21 Oct 2021 03:45:47 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id x20sm5355438pjp.48.2021.10.21.03.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 03:45:46 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ran.jianping@zte.com.cn
To: anup.patel@wdc.com
Cc: atish.patra@wdc.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 ran jianping <ran.jianping@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] RISC-V:KVM: remove unneeded semicolon Elimate the following
 coccinelle check warning: ./arch/riscv/kvm/vcpu_sbi.c:169:2-3: Unneeded
 semicolon ./arch/riscv/kvm/vcpu_exit.c:397:2-3: Unneeded semicolon
 ./arch/riscv/kvm/vcpu_exit.c:687:2-3: Unneeded semicolon
 ./arch/riscv/kvm/vcpu_exit.c:645:2-3: Unneeded semicolon
 ./arch/riscv/kvm/vcpu.c:247:2-3: Unneeded semicolon
 ./arch/riscv/kvm/vcpu.c:284:2-3: Unneeded semicolon
 ./arch/riscv/kvm/vcpu_timer.c:123:2-3: Unneeded semicolon
 ./arch/riscv/kvm/vcpu_timer.c:170:2-3: Unneeded semicolon
Date: Thu, 21 Oct 2021 10:45:36 +0000
Message-Id: <20211021104536.1060107-1-ran.jianping@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_034548_800000_143253C4 
X-CRM114-Status: GOOD (  11.71  )
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

From: ran jianping <ran.jianping@zte.com.cn>

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ran jianping <ran.jianping@zte.com.cn>
---
 arch/riscv/kvm/vcpu.c       | 4 ++--
 arch/riscv/kvm/vcpu_exit.c  | 6 +++---
 arch/riscv/kvm/vcpu_sbi.c   | 2 +-
 arch/riscv/kvm/vcpu_timer.c | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index c44cabce7dd8..912928586df9 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -244,7 +244,7 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 		break;
 	default:
 		return -EINVAL;
-	};
+	}
 
 	if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
 		return -EFAULT;
@@ -281,7 +281,7 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 		break;
 	default:
 		return -EINVAL;
-	};
+	}
 
 	return 0;
 }
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 13bbc3f73713..7f2d742ae4c6 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -394,7 +394,7 @@ static int emulate_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		break;
 	default:
 		return -EOPNOTSUPP;
-	};
+	}
 
 	/* Update MMIO details in kvm_run struct */
 	run->mmio.is_write = true;
@@ -642,7 +642,7 @@ int kvm_riscv_vcpu_mmio_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
 		break;
 	default:
 		return -EOPNOTSUPP;
-	};
+	}
 
 done:
 	/* Move to next instruction */
@@ -684,7 +684,7 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		break;
 	default:
 		break;
-	};
+	}
 
 	/* Print details in-case of error */
 	if (ret < 0) {
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index ebdcdbade9c6..eb3c045edf11 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -166,7 +166,7 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
 		/* Return error for unsupported SBI calls */
 		cp->a0 = SBI_ERR_NOT_SUPPORTED;
 		break;
-	};
+	}
 
 	if (next_sepc)
 		cp->sepc += 4;
diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index ddd0ce727b83..5c4c37ff2d48 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -120,7 +120,7 @@ int kvm_riscv_vcpu_get_reg_timer(struct kvm_vcpu *vcpu,
 		break;
 	default:
 		return -EINVAL;
-	};
+	}
 
 	if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
 		return -EFAULT;
@@ -167,7 +167,7 @@ int kvm_riscv_vcpu_set_reg_timer(struct kvm_vcpu *vcpu,
 	default:
 		ret = -EINVAL;
 		break;
-	};
+	}
 
 	return ret;
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
