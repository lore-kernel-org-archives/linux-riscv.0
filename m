Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDAAF5580B
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 11:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TAM+bb0RgI99+xL4Pv/6Sq3j5W25AbbGMisbOIugG6c=; b=gO4JXQn4X03T4v
	hgZaWCD3zg8NlN17eCdwQ46P5Ss+os42NTRf9ob1jPTKEtZv8q+O7ZJ4rB1Vo+T1vXum1E7FElbk7
	YKbkaEflv5GJ/X9A1CwuGiBtpHjwRtPcLbmZziLKLwy2Jzg16CzEgby5Zo9XJEUqU8wjO8WXkAiyL
	dX1qW09HiSM+fhwHQ8rENOnz7ub0wn028pu/cCHMcDqiwmZ0b+r7QIx1kwUEOZMFUr1WFIJQc89JO
	pHqSIDgRY1BWIzn1xhBud4QhgttVtFWhWRDOUeHF+wwekOIXzxMU4SNneOzX5WBTcNSLoY1+JJ+ql
	F3ym29/0+UMWQcdo1Smw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEmbH-00000006mTE-2yhe;
	Mon, 20 Apr 2026 11:15:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEmbF-00000006mSH-3jxk
	for linux-riscv@bombadil.infradead.org;
	Mon, 20 Apr 2026 11:15:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=AZ0MKSlHobFIOsk1M9IBf3+SftFqlO8HUX0oeTinBG0=; b=ijJ4iMXpZEoxFgCVTuZ3R07OiM
	hpWosmuQkkcfnFAoVDttwhDRvNBhTVS4zpFDl73iMKCwg4vKJsHxbo2hDlLu/knUb8VkDD6KsqC69
	1zLE9RNu21KTm6bKgpb9kG1a56PXDmHco8hlF2L9AFodyjupgusVhGmWMcYlaDQXBkymyD61v4vdI
	UTrnKV79A/C6fOg3jADzjPDZtntode860XdfnylPtx4KZOclnYkf3flazgWuJ3BjQZj3KTTJHmPLr
	rTShi2R0oQR8GHFwrbzNZc0bwR4y/E3tcx/qflos/VRUNaYqTyax/d5chMxrs901LQIQ6k4j4w7ap
	lB36uhHw==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEmbB-00000008JdO-2a8v
	for linux-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 11:15:32 +0000
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxVunHCuZpbhUCAA--.2050S3;
	Mon, 20 Apr 2026 19:15:19 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxLMLFCuZp00RxAA--.17475S3;
	Mon, 20 Apr 2026 19:15:19 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH RFC bpf-next 1/2] selftests/bpf: Add riscv support for get_preempt_count()
Date: Mon, 20 Apr 2026 19:15:15 +0800
Message-ID: <20260420111516.19982-2-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20260420111516.19982-1-yangtiezhu@loongson.cn>
References: <20260420111516.19982-1-yangtiezhu@loongson.cn>
MIME-Version: 1.0
X-CM-TRANSID: qMiowJBxLMLFCuZp00RxAA--.17475S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7WFWrGrWrGFy3AFW3Jw4kZrc_yoW8CFyfpr
	W8try0yw1YyFW7JFsrGw4kGw4Yqrn5Was5Cw13KrZ7AF1YqrWkXFyS9rW3trs0gryFqrWF
	vw1akrWruasrJabCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07URa0PUUUUU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_121530_225097_677C1132 
X-CRM114-Status: UNSURE (   5.53  )
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

There is no riscv support for get_preempt_count() currently and its
fallback path always returns 0, just add it so that bpf_in_interrupt(),
bpf_in_nmi(), bpf_in_hardirq(), bpf_in_serving_softirq(), bpf_in_task()
works for riscv as well. With this patch, "./test_progs -t exe_ctx"
should pass on riscv.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/testing/selftests/bpf/bpf_experimental.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
index 2234bd6bc9d3..e5c039bc44cb 100644
--- a/tools/testing/selftests/bpf/bpf_experimental.h
+++ b/tools/testing/selftests/bpf/bpf_experimental.h
@@ -505,6 +505,8 @@ static inline int get_preempt_count(void)
 	return bpf_get_current_task_btf()->thread_info.preempt_count;
 #elif defined(bpf_target_s390)
 	return bpf_get_lowcore()->preempt_count;
+#elif defined(bpf_target_riscv)
+	return bpf_get_current_task_btf()->thread_info.preempt_count;
 #endif
 	return 0;
 }
@@ -515,6 +517,7 @@ static inline int get_preempt_count(void)
  *	* arm64
  *	* powerpc64
  *	* s390x
+ *	* riscv
  */
 static inline int bpf_in_interrupt(void)
 {
@@ -536,6 +539,7 @@ static inline int bpf_in_interrupt(void)
  *	* arm64
  *	* powerpc64
  *	* s390x
+ *	* riscv
  */
 static inline int bpf_in_nmi(void)
 {
@@ -548,6 +552,7 @@ static inline int bpf_in_nmi(void)
  *	* arm64
  *	* powerpc64
  *	* s390x
+ *	* riscv
  */
 static inline int bpf_in_hardirq(void)
 {
@@ -560,6 +565,7 @@ static inline int bpf_in_hardirq(void)
  *	* arm64
  *	* powerpc64
  *	* s390x
+ *	* riscv
  */
 static inline int bpf_in_serving_softirq(void)
 {
@@ -580,6 +586,7 @@ static inline int bpf_in_serving_softirq(void)
  *	* arm64
  *	* powerpc64
  *	* s390x
+ *	* riscv
  */
 static inline int bpf_in_task(void)
 {
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
