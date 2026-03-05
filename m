Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F7DF33A78
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 14:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p3TozYqYVsrHQ5L/IAMsw0YXPYbOyLxeFU6SdS3jfK8=; b=RqxbQLcVhDqM5j
	08QVW0L9L3yJLAMGWBVSw0/pQhGvCbMPUf0DBVfKV4cVMi0fWUNmDlqMl5t3zbx0rzd7X5n6mz2wY
	yfwdzkv4U+q8dsBckoS+cDDP/rYH0b9VjbM0aMBywl4I0/vV5Z08OSqxZUY2fcYDL1GCfYQliLoIM
	5YJ+BnZqI5uKNOSOIeVM5S06npPakE6u5ILwjRN9qLv3ZN1SXMbEOL8fdnF36EuQcIUz0zLBle90/
	5udhYmlCKh82eOKESR25Ix+ST1J+s4wYRmzV46QJDP3xy4Xp1AsVgGmLR92pqu3axBzOBRsZMMe2W
	MaCm9zAfCAE/X0zukOlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9sq-000000020ZG-0fZr;
	Thu, 05 Mar 2026 14:41:00 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9sn-000000020Y2-0b6K
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 14:40:58 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.14])
	by APP-03 (Coremail) with SMTP id rQCowABnhNvulalpTx7iCQ--.24548S3;
	Thu, 05 Mar 2026 22:40:54 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rahul Tanwar <rtanwar@maxlinear.com>
Subject: [PATCH v2 1/2] dt-bindings: hwmon: moortec,mr75203: adapt multipleOf for T-Head TH1520
Date: Thu,  5 Mar 2026 22:40:43 +0800
Message-ID: <20260305144044.44208-2-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305144044.44208-1-zhengxingda@iscas.ac.cn>
References: <20260305144044.44208-1-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowABnhNvulalpTx7iCQ--.24548S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CrWUuF1UGFyxuF4UurW5trb_yoW8XF18pr
	43KFyUJFs7WFyxZ3y7C3WrCr13X3Z5Xa15GayDJa4xtan8Aa1Utw4fKw1DAF1kCrWSqFW3
	KFW0gF4Fy34kAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
	AFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
	0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI
	1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
	UjIFyTuYvjfU8XdbUUUUU
X-Originating-IP: [112.94.103.14]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_064057_546505_1C82519F 
X-CRM114-Status: UNSURE (   8.30  )
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The G and J coefficients provided by T-Head TH1520 manual (which calls
them A and C coefficients and calls H coefficient in the binding as B)
has the 1/100 degree Celsius bit (the values are 42.74 and -0.16
correspondingly), however the binding currently only allows cofficients
as precise as 100 milli-Celsius (1/10 degree Celsius).

Change the multipleOf value of these two cofficients to 10 (in the unit
of milli-Celsius) to satisfy the need of TH1520.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
New patch in v2.

 Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
index 56db2292f062d..7d57c2934a8a1 100644
--- a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
+++ b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
@@ -105,7 +105,7 @@ properties:
       G coefficient for temperature equation.
       Default for series 5 = 60000
       Default for series 6 = 57400
-    multipleOf: 100
+    multipleOf: 10
     minimum: 1000
     $ref: /schemas/types.yaml#/definitions/uint32
 
@@ -131,7 +131,7 @@ properties:
       J coefficient for temperature equation.
       Default for series 5 = -100
       Default for series 6 = 0
-    multipleOf: 100
+    multipleOf: 10
     maximum: 0
     $ref: /schemas/types.yaml#/definitions/int32
 
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
