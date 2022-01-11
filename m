Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61225C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jan 2022 01:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qMFZOJ0oG4cggivpNANQ/tk3zgSXwHrkwXUrHRTUhCw=; b=bAZ9YQislfZa4w
	2lyQEC6x4GQDBsbyg85yCVgpNxdpV+v1dBg71VZgD1NqYTLlgTJ078mWiI/tMTjKJX3u9tD1SU1zk
	3zNvvSYaoTE3zYvVe+o4dKXZKVAPT0l5jh5JdoUYK5MbZBQ5LCg9DnR46Kvr8FosCOx4tmjlCTs/R
	DBHNqZF2GtHHYXCcJCWjZoZ/e7JhFN0byk4PX+0/9jUTlhzjtyyFBu1WJxy+9casNXxRpHSdXR4dB
	w6ccsv2+0X7vo50rQt2GTEtnmxFgKkXVm6onAeb4eG8AGxzidf8MrpV6vfbHslXMRIaT3dmj9wc/2
	MyVl8H02z4mwv4Y9EIfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n75hT-00EBMe-MQ; Tue, 11 Jan 2022 01:11:47 +0000
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n75hP-00EBLW-St
 for linux-riscv@lists.infradead.org; Tue, 11 Jan 2022 01:11:45 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R861e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=11; SR=0; TI=SMTPD_---0V1X8SuR_1641863499; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0V1X8SuR_1641863499) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 11 Jan 2022 09:11:40 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: shuah@kernel.org
Cc: pbonzini@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] KVM: selftests: remove unneeded semicolon
Date: Tue, 11 Jan 2022 09:11:38 +0800
Message-Id: <20220111011138.3929-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_171144_125316_3EC614FD 
X-CRM114-Status: UNSURE (   6.24  )
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

Eliminate the following coccicheck warning:
./tools/testing/selftests/kvm/lib/riscv/processor.c:353:3-4: Unneeded
semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 tools/testing/selftests/kvm/lib/riscv/processor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index d377f2603d98..e8d7cda99472 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -350,7 +350,7 @@ void vcpu_args_set(struct kvm_vm *vm, uint32_t vcpuid, unsigned int num, ...)
 		case 7:
 			id = RISCV_CORE_REG(regs.a7);
 			break;
-		};
+		}
 		set_reg(vm, vcpuid, id, va_arg(ap, uint64_t));
 	}
 
-- 
2.20.1.7.g153144c


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
