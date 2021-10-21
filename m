Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD50C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 11:57:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CF4D60FED
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 11:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7CF4D60FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dFyfJ9WdAOjFff7cXkTzSxjL3jH0IETznihQEMiQ4jI=; b=E1Crcs4cjdLF6x
	5Fbpsp5RdnfNqEZHEFTl2gSxUkLkLi6STiwGHtqxCQ7YuUwCwUiPsBTDYJin1L53F/ngFtL4Ay7u/
	bJNN043cl1+hfHJaNjZWYJ6wqlgDQDX4o3p0wmQehwvldNEMPQ8q4dp7hqeAuMfQt1p1XMWRmuWH3
	5CsnMNaivAccAGfgsZzzLQTpNBSswEj3eq5C+99RjbxMCjZ1qA5cEYiBBOAXtX8AcQ9nzBQ3zQYjv
	tkKkNTfge8eRJxO+IPGVmKZdD2A+PNB9N8lalKUHSwtSf6B1EtEs27uwkHdxjFfyUA/ag6ZcXd9jy
	OKFnIXQVJGGzIL3lr1fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdWhT-007Opj-OS; Thu, 21 Oct 2021 11:57:35 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdWhR-007Op4-6k; Thu, 21 Oct 2021 11:57:34 +0000
Received: by mail-pg1-x530.google.com with SMTP id r2so49387pgl.10;
 Thu, 21 Oct 2021 04:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=idIj9x5Y1snEOdYM83+I6n7R4t6XnyFXPq7fZJooAt0=;
 b=QvnqmUW3vkYQDIvz4c0DkDquBfz0UXqjZUC0PwY4U8mXRpvcJ+SrK+3ui+5qMXR5nS
 T88lojXXUAUuEtM2XKgqmwuKaPsSjqDf/OxyM+NZgN9M2pa9d8LlQ4qe6KlA1PB2oWTU
 gEMfvIdPYfSzcBLsrxntIAPlht7kvi1XxsXuy6ks/zvRjrdk+BHTtE9uC7zhq6PCRgia
 Y77EkhCkAPPCN1ptuF6l+zorCgwqHKs5KV6FLRDTvufFCWTt0EaGxf21EzB+fuAB70Jx
 t+hHzP5Qd1TjFeRtbQBEPMHBikZemHsfLoL787dBzW4sWlwEhBJowuzcLmXcPu9qeaWo
 +uXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=idIj9x5Y1snEOdYM83+I6n7R4t6XnyFXPq7fZJooAt0=;
 b=2G+I5Fd32HAvAKnFndG0KcjEluI+FLbUF7j2NfThSsjWjgCjiwlpNVucc812PHKjKz
 KO/vL/cZrXCA8BhAhJHHP1RW6t+4A2Cq4irjgxQ8M+4+BwIIURNN09DxycS7nvzCssFb
 RMuGk0Kz333lx7+tujDJSXHXen8Sf7Yxal/ds3NGrr8yFVD/KN+qNeJo/k1XmIbLMkNK
 W2JdcjPJqFW8RIYcrrOZ9k9ZmefecvvFOUU8XhSc4wV042s2ba8yAP4K5uQ+4AYa2Ieh
 0VtRgwDCvn1Wujt/5vRYbpBjQodSeNIMA0xY+1xRUeBHmxwU+26mVd5oV/DE4tIA+lI+
 jG/w==
X-Gm-Message-State: AOAM531AEWNoSGeMSS+Vux1052jANXI8x71VGbgmjI82VSfebtuodxEA
 ArYxS2rMxucby3c5obTNejw=
X-Google-Smtp-Source: ABdhPJwu17uilS+pRVvSk89iNu6lAdgJwU8YwJMCdjTqkpEZIwNjHy9NHuJ4Lw3z8EjgYKkXVJnT1A==
X-Received: by 2002:a63:7406:: with SMTP id p6mr4044865pgc.246.1634817451815; 
 Thu, 21 Oct 2021 04:57:31 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id t3sm5082314pgo.51.2021.10.21.04.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 04:57:31 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ran.jianping@zte.com.cn
To: anup@brainfault.org
Cc: anup.patel@wdc.com, aou@eecs.berkeley.edu, atish.patra@wdc.com,
 cgel.zte@gmail.com, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, ran.jianping@zte.com.cn,
 zealci@zte.com.cn
Subject: [PATCH] RISC-V:KVM: remove unneeded semicolon
Date: Thu, 21 Oct 2021 11:57:06 +0000
Message-Id: <20211021115706.1060778-1-ran.jianping@zte.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAAhSdy3DWOux6HiDU6fPazZUq=FOor8_ZEoqh6FBZru07NyxLQ@mail.gmail.com>
References: <CAAhSdy3DWOux6HiDU6fPazZUq=FOor8_ZEoqh6FBZru07NyxLQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_045733_295852_413EBDC7 
X-CRM114-Status: GOOD (  12.38  )
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

 Elimate the following coccinelle check warning:
 ./arch/riscv/kvm/vcpu_sbi.c:169:2-3: Unneeded semicolon
 ./arch/riscv/kvm/vcpu_exit.c:397:2-3: Unneeded semicolon
 ./arch/riscv/kvm/vcpu_exit.c:687:2-3: Unneeded semicolon
 ./arch/riscv/kvm/vcpu_exit.c:645:2-3: Unneeded semicolon
 ./arch/riscv/kvm/vcpu.c:247:2-3: Unneeded semicolon
 ./arch/riscv/kvm/vcpu.c:284:2-3: Unneeded semicolon
 ./arch/riscv/kvm/vcpu_timer.c:123:2-3: Unneeded semicolon
 ./arch/riscv/kvm/vcpu_timer.c:170:2-3: Unneeded semicolon

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
