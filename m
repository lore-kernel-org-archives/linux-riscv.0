Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEE5C5478C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 03:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Cc:Date:Message-Id:Subject:
	Mime-Version:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=84dycsv/tY+irQZOG8VlBvru3efAy6+pj5u/vAWgCmY=; b=2yJ
	0ciPJ8899vDgNaviDnRm4uuYSYZbFLRdROFBYYT71dgpdE3OT8qohlEZKk2JZ3w2VQz5w/iDpGeF9
	D3UoyoNyYR4BvjI7LYd0EiXRSPtBz91q1lN+K2ILl9e0fxwpr4OE8Bv7/hRPhiLnWsHCPkrGM4acg
	oHqYzE70ooW8+thb2Jgq7N0Yg4yBNxmdZkBCM1ZGRWFvWLv7HxPVyGXEGAX5v5Bm5PHf8Iau/nHNL
	BvbmgAXCTIBu6cgsuf3+ajOMfb6KMEmKIeRXMTsxmOmb6iXI9Tuh1baVcd0Pj4c6aD6pfXB8nYlx3
	Vc/GR/547eEDTVrVMxrGl9SdaWDxZlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfAx5-00000007tYI-3JRj;
	Wed, 28 Feb 2024 03:49:51 +0000
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfAx1-00000007tVP-3yfW
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 03:49:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pku.edu.cn; s=dkim; h=Received:From:Content-Type:
	Content-Transfer-Encoding:Mime-Version:Subject:Message-Id:Date:
	Cc:To; bh=duqQuA0+jCKFtODOoRpkaSM6yTZVpx/9mzEVGr69PcU=; b=toWcGG
	U0lgwU1XYSQaBlXnd1F3wsRjzVmjCiL9M7fOgbDQQOwC7HNDVd/+cemI2loYewl6
	hXmszAaOQfC1kPMoJPjmxagfHwX+9zLCkC0m6MVjw5R8DsyVCDiTNQDk/3/5O7EK
	n5pd1auagiypcYoY5Apd/KrtcJRFf+3d+F8lk=
Received: from smtpclient.apple (unknown [10.7.111.29])
	by front02 (Coremail) with SMTP id 54FpogDHHwxKrd5lpSUyAQ--.9732S2;
	Wed, 28 Feb 2024 11:49:30 +0800 (CST)
From: =?utf-8?B?6Zu35Y2a5ra1?= <garthlei@pku.edu.cn>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: RISC-V PMU driver issue
Message-Id: <CC51D53B-846C-4D81-86FC-FBF969D0A0D6@pku.edu.cn>
Date: Wed, 28 Feb 2024 11:49:20 +0800
Cc: linux-riscv@lists.infradead.org
To: Atish Patra <atishp@atishpatra.org>
X-Mailer: Apple Mail (2.3774.400.31)
X-CM-TRANSID: 54FpogDHHwxKrd5lpSUyAQ--.9732S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtF1fZw1UJF13Gr4ftr48Xrb_yoWkGrb_GF
	ykXr9rJwsIyanYqasrtr47XayIqr48u3s5Ar18Ww13Kr95XFnxGw1vkFy8tr4xtFZaqrn8
	tFZ3Xw1I9wnIvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb2AYjsxI4VWkCwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4
	kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_
	Cr1j6rxdM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAIw28IcVCj
	z48v1sIEY20_Kr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j04E_UUUUU=
X-CM-SenderInfo: isrqijqrtqijo6sn3hxhgxhubq/1tbiAgEBBWXeGUgH7AABsH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_194948_547523_4182DD9C 
X-CRM114-Status: UNSURE (   9.31  )
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

Hi all,

I am having problems with the RISC-V PMU driver. The overflow handler of my custom perf event kernel counter seems to read an incorrect value from the event.
It seems that the issue lies in the function `riscv_pmu_event_set_period`, which sets `prev_count` to a new value but does not modify the underlying hardware counter. When `perf_event_read_value` gets called later in the user-defined overflow handler, `riscv_pmu_event_update` will update the `count` field again based on the unmodified hardware counter value and the modified `prev_count` field, which causes an incorrect reading.
I noticed that other PMU drivers, such as the ARM one, write to the underlying counter in their set_period functions, which prevents the problem. However, the RISC-V SBI specification does not have such an API to write to a counter without starting it. Using `local64_read(&hw_evt->period_left) <= 0` directly as the guard condition to place `riscv_pmu_event_set_period(event)` after it seems to work, but I am not sure whether it can cause other issues.

Thank you,
Bohan Lei

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
