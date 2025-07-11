Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4A8C83F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 11:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k7TAATXiU+Hh6A27xumyN9uTIoy+4lR5sHw0nuy2adE=; b=Qmrj/HIBQ7jJO6
	B94QJ2lJ/Ra6YKSmgAqA0BntJU9F+NvW2Z7WzMm1hySUcZ9wmwpSIGnPafVBHJg+9RiK/wXTR9DFR
	v+6MxXoLUK1du8S4cAiRgw+nrliuc0Xln9JtRbtePcPUvljFvLoqJng8jXt2auet8FjB8DRdUuqsY
	a+UIwANYZazttLBhiYAjY9szT9I2mcdAitm1Id0yc8V3FpAVzkQbfX+yIwObvfLQT+AnkAZ7T1h/x
	mqv5dskAlKgmoOsN4zy0ElMAjIJt6So+4w8cpookWjsnii6WEr4uqfExoUNt/4hfcKzODQTaWENAz
	ey4YWjZ7oGCRenvYz5hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaBid-0000000EZjL-2fx9;
	Fri, 11 Jul 2025 11:15:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAhd-0000000ERvC-0kfX
	for linux-riscv@bombadil.infradead.org;
	Fri, 11 Jul 2025 10:10:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=F8tWE0r3Tcv1SfxUO2H8WhkzQ9Z1mkOVB49cyr/0YAc=; b=bWGgJK6Xw2ogUZmEikb0Zm/SnS
	VnHf8ICvj7KdczSbDHgp1dFESmmoddRKaLq3Fhy2ON16NpZ6KeDFgjonBMhbCngAR9PtrXpqGwJag
	Cx3XHhApiJTA08luOrM0cc35zckcFmX9F0ZsbCLc0Oc7wb3/GtNogpPTEPHutHyOirAnPrXicSwlt
	P7SRNiPKXflpDjcuEkwYpAr30JlDmokOFWS0EPtWZB2TR8G8RM8E+qpnZ8JMOFy2zj5bdwJPsqMSW
	hM8uuFax/6dxAres4HQxkoAjxy4IjQIwiiy3mYIu/UbE55iW8cKT5CV1BhaYmlsQkxv/5Deuv0vmA
	rT7UeLbA==;
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAhW-00000009Eij-2j5Y
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 10:10:00 +0000
Received: from ubt.. (unknown [210.73.43.2])
	by APP-03 (Coremail) with SMTP id rQCowACXJ3nj4nBo8xESAw--.40582S5;
	Fri, 11 Jul 2025 18:09:40 +0800 (CST)
From: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>
Cc: linux-riscv@lists.infradead.org,
	linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH V2 3/5] raid6: riscv: Add a compiler error
Date: Fri, 11 Jul 2025 18:09:28 +0800
Message-Id: <20250711100930.3398336-4-zhangchunyan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711100930.3398336-1-zhangchunyan@iscas.ac.cn>
References: <20250711100930.3398336-1-zhangchunyan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowACXJ3nj4nBo8xESAw--.40582S5
X-Coremail-Antispam: 1UD129KBjvdXoW7JF1fWr45XrykuF1xKF4DArb_yoWxKFX_ZF
	1Fkwn7AF1kCa9av34ayrW5C34kZFs0qr18JrWxt3W3Xry8ua4Y939Iqwn5ZFyFqrW7ZFWa
	qrn8JFW7twnF9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb98YjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7
	IE14v26r1rM28IrcIa0xkI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CE
	w4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6x
	kF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY
	1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4
	xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_AcC_ZcWlOx8S6xCa
	FVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I
	0En4kS14v26r1q6r43MxkIecxEwVAFwVW8twCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE
	7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
	8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWU
	CwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
	1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBI
	daVFxhVjvjDU0xZFpf9x07UE2NtUUUUU=
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: x2kd0wxfkx051dq6x2xfdvhtffof0/1tbiCQ8AB2hw2+oZIAABsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_110955_353329_68343AD6 
X-CRM114-Status: UNSURE (   7.57  )
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

The code like "u8 **dptr = (u8 **)ptrs" just won't work when built with
a compiler that can use vector instructions. So add an error for that.

Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
---
 lib/raid6/rvv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/raid6/rvv.c b/lib/raid6/rvv.c
index 89da5fc247aa..015f3ee4da25 100644
--- a/lib/raid6/rvv.c
+++ b/lib/raid6/rvv.c
@@ -20,6 +20,10 @@ static int rvv_has_vector(void)
 	return has_vector();
 }
 
+#ifdef __riscv_vector
+#error "This code must be built without compiler support for vector"
+#endif
+
 static void raid6_rvv1_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
 {
 	u8 **dptr = (u8 **)ptrs;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
