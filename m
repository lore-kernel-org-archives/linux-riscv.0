Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C34EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 00:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dh23w1aMqkQd3q4hd7RFBghTw/qVVFeB5NqWyk+JBbk=; b=PBP/htNNMB8eaP
	m7erLekHcAqNwit5+WfHE5aVMf8GnnYajKT17xUxdTHdwnN943z1/XpsAatsKlVEKq3kkyOAPBjJX
	vocTivCGg+VHlBt4Fu7xmY4g/wYaGl//lvYgHKqgfat4rguB6XRWwPn06XEHApQdnj3aExrJFG02+
	SzR3wT+xFwGC+it5azd6sZ6iG4xeCdJNMadiZhjzkkrR55tpejAEDBw0U/JiSLGie9b2VoywB0mIb
	pEk3oiPPTkCU5Fc9aC+xUYHSx1HvfPISVDx6cZ8eu96cJm8eRHkxyvETQFBUJNTxqfFKLlngDzRsJ
	AdHuhPuWAhQRPz+cKFBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPQQ-009meA-2D;
	Tue, 20 Jun 2023 00:40:50 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPQM-009mbu-2a;
	Tue, 20 Jun 2023 00:40:49 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045192;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0VlZOfiK_1687221637;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VlZOfiK_1687221637)
          by smtp.aliyun-inc.com;
          Tue, 20 Jun 2023 08:40:38 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: anup@brainfault.org
Cc: atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] RISC-V: KVM: Remove unneeded semicolon
Date: Tue, 20 Jun 2023 08:40:36 +0800
Message-Id: <20230620004036.4868-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_174047_036016_2D3A8002 
X-CRM114-Status: UNSURE (   7.08  )
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

./arch/riscv/kvm/aia_imsic.c:94:2-3: Unneeded semicolon
./arch/riscv/kvm/aia_imsic.c:134:2-3: Unneeded semicolon
./arch/riscv/kvm/aia_imsic.c:173:2-3: Unneeded semicolon
./arch/riscv/kvm/aia_imsic.c:210:2-3: Unneeded semicolon
./arch/riscv/kvm/aia_imsic.c:296:2-3: Unneeded semicolon
./arch/riscv/kvm/aia_imsic.c:354:2-3: Unneeded semicolon
./arch/riscv/kvm/aia_device.c:105:4-5: Unneeded semicolon
./arch/riscv/kvm/aia_device.c:166:2-3: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5569
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 arch/riscv/kvm/aia_device.c |  4 ++--
 arch/riscv/kvm/aia_imsic.c  | 12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index 84dae351b6d7..0eb689351b7d 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -102,7 +102,7 @@ static int aia_config(struct kvm *kvm, unsigned long type,
 				break;
 			default:
 				return -EINVAL;
-			};
+			}
 			aia->mode = *nr;
 		} else
 			*nr = aia->mode;
@@ -163,7 +163,7 @@ static int aia_config(struct kvm *kvm, unsigned long type,
 		break;
 	default:
 		return -ENXIO;
-	};
+	}
 
 	return 0;
 }
diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index 8f108cfa80e5..fd4965c6f591 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -91,7 +91,7 @@ static unsigned long imsic_eix_read(int ireg)
 	switch (ireg) {
 	imsic_read_switchcase_64(IMSIC_EIP0)
 	imsic_read_switchcase_64(IMSIC_EIE0)
-	};
+	}
 
 	return 0;
 }
@@ -131,7 +131,7 @@ static unsigned long imsic_eix_swap(int ireg, unsigned long val)
 	switch (ireg) {
 	imsic_swap_switchcase_64(IMSIC_EIP0, val)
 	imsic_swap_switchcase_64(IMSIC_EIE0, val)
-	};
+	}
 
 	return 0;
 }
@@ -170,7 +170,7 @@ static void imsic_eix_write(int ireg, unsigned long val)
 	switch (ireg) {
 	imsic_write_switchcase_64(IMSIC_EIP0, val)
 	imsic_write_switchcase_64(IMSIC_EIE0, val)
-	};
+	}
 }
 
 #define imsic_vs_csr_set(__c, __v)		\
@@ -207,7 +207,7 @@ static void imsic_eix_set(int ireg, unsigned long val)
 	switch (ireg) {
 	imsic_set_switchcase_64(IMSIC_EIP0, val)
 	imsic_set_switchcase_64(IMSIC_EIE0, val)
-	};
+	}
 }
 
 static unsigned long imsic_mrif_atomic_rmw(struct imsic_mrif *mrif,
@@ -293,7 +293,7 @@ static int imsic_mrif_isel_check(u32 nr_eix, unsigned long isel)
 		break;
 	default:
 		return -ENOENT;
-	};
+	}
 #ifndef CONFIG_32BIT
 	if (num & 0x1)
 		return -EINVAL;
@@ -351,7 +351,7 @@ static int imsic_mrif_rmw(struct imsic_mrif *mrif, u32 nr_eix,
 		break;
 	default:
 		return -ENOENT;
-	};
+	}
 
 	if (val)
 		*val = old_val;
-- 
2.20.1.7.g153144c


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
