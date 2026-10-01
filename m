Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797AECA5FCE
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 07:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N7H6gUzVpf0ISuCX+bqL/MB0q2ObtYh7HaBJscHjrj4=; b=TU5/JWljxBNI7e
	lAgQFDKzhstrQ3QOmmzG/ctnNu4CdOSRhJdhXp4vJRYV15G6HMSvfMUINpsgDHEaE1QVKw+SZMGkO
	uokc6wgrCHXieFl7fR8wSYRokj0eCTb6V+9sz4J7W3HgAPZhfAd5och/Mcz3aEY+d/HnZ4ec0Y3y7
	yWvxeowRnx5wP10OCLGdXwCSrQonSin3AyZ2Q/haV6h61XVN80UD9SwheXwDDYwpSrxNA6/UjAAAq
	Q0W036sCG/X2Dzg/2FvJqIoJ5iKd7jW0Tfos0zLvgtWJ4fdjBZnnFYzYXvPlzv9GuTotYcxt/Gpp6
	YRYDEIBttm1KErt0QgXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBT0-000000082Oy-25Xu;
	Thu, 01 Oct 2026 07:44:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBSz-000000082NA-0fca
	for linux-riscv@bombadil.infradead.org;
	Thu, 01 Oct 2026 07:44:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=iY7Sa2SWMMCEMGQqzz8e4M9a/+kyCM+aQXVHKvZiaOo=; b=J+u0M2CUR2NvBffd344cS7RKnT
	r07O16lhEORV2t+xFY+K4rSGBAAp83rlUNQwGVkeQZIp3SGcD/r4XKsZT3Lto9cX/woQBRFeOYbQi
	MQDrxU0yDtSvRsi8eA6ErH5DaM9Xjfn6PaPKEGq9hMETTRdSfyLfIP/ulHANcNukYsrYwGgF7b0RY
	tLT1jXn349YskzLzupKN4a451U2wXCRWpg/B4fb0rNicPuH0KxsiLH8cBCDGM5rKfAZUVRuMe4WP2
	OFb1Bc0ttSHjJTfiMVxYPU+BeDETFEp3G2gkJXdlCXtmsbTuPZa/9q5icfxjviPAnHu0RLXOa5SMd
	ZJKnncYQ==;
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCBSu-00000004gyS-2JPO
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 07:44:32 +0000
Received: from [127.0.1.1] (unknown [223.166.93.127])
	by APP-05 (Coremail) with SMTP id zQCowAD3J0JPD75qjtLZCQ--.7172S3;
	Thu, 01 Oct 2026 15:44:18 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
Date: Thu, 01 Oct 2026 15:44:10 +0800
Subject: [PATCH v2 1/4] dt-bindings: riscv: thead: add Milk-V Meles
MIME-Version: 1.0
Message-Id: <20261001-rv-meles-v2-1-c61052262f84@iscas.ac.cn>
References: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>
In-Reply-To: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-CM-TRANSID: zQCowAD3J0JPD75qjtLZCQ--.7172S3
X-Coremail-Antispam: 1UD129KBjvdXoW7JF1DCw4xZrWfZFy7Wry5CFg_yoWDXrXE9F
	1xCF4DZay5JFn5Ka1YyrWUWFW5Z3yxCFyxAw12yF4Skw1kXFZ8Wasrt3s8Cr47Cr47uF1f
	Jws3Jr9rGFsrWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbkxFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGwA2048vs2IY02
	0Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
	ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
	AFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
	0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI
	1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2Kfnx
	nUUI43ZEXa7VUjrHUDUUUUU==
X-Originating-IP: [223.166.93.127]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiCRQHDGq9rsa9jwAAsb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_084429_472095_3104A624 
X-CRM114-Status: UNSURE (   8.12  )
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

Document the Milk-V Meles board compatible with the TH1520 fallback.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 Documentation/devicetree/bindings/riscv/thead.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/thead.yaml b/Documentation/devicetree/bindings/riscv/thead.yaml
index 301912dcd290e60f816d380152591106de9415b4..e8170915f4d6d63fbc10a0e6863ea7d5000e3643 100644
--- a/Documentation/devicetree/bindings/riscv/thead.yaml
+++ b/Documentation/devicetree/bindings/riscv/thead.yaml
@@ -17,9 +17,11 @@ properties:
     const: '/'
   compatible:
     oneOf:
-      - description: BeagleV Ahead single board computer
+      - description: TH1520 single board computers
         items:
-          - const: beagle,beaglev-ahead
+          - enum:
+              - beagle,beaglev-ahead
+              - milkv,meles
           - const: thead,th1520
       - description: Sipeed Lichee Pi 4A board for the Sipeed Lichee Module 4A
         items:

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
