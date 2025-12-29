Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3596E92724
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 06:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GoK+R5I4R24rclHHEE6N0Tr8dIFYWcZTcgvURYF3jP0=; b=QfZkL+K9CIMPF3
	K8uaNVJzWUdJljnI2cVs2KJNEm/fjmnf2NbC93kVE6O5B0GZWfk+MPtOQeGSmNeQzPzMgLOjJQbdb
	4vitMnb03h6ZF9UMaPdszuBdNs8/GQrMG/Li3VjWPZFBqRGMTaJBb042H6MFepSSfFjGC4RkxYkq8
	bjqctN84nlSaagigU14OxW/YTwU1VOIPYPVuxI0vyyxc19uweijKIXo0yXjI8afFMXToBYyaar74w
	zAgjWM4AF8w2v/klEpfGaNT7NKJT3ho7563CvlF+B1tJWUjZgJyO3RrDV2J9h/NMydQuGZpI3Anau
	aJnLwhqKi9EXo3hRdJyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va6W8-00000003NHZ-3rjk;
	Mon, 29 Dec 2025 06:14:08 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va6W5-00000003NGK-2AMv
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 06:14:07 +0000
Received: from duge-virtual-machine (unknown [223.160.206.4])
	by APP-03 (Coremail) with SMTP id rQCowABnaL8UHFJpuWxrAg--.22171S3;
	Mon, 29 Dec 2025 14:13:51 +0800 (CST)
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: conor@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alex@ghiti.fr,
	jiayu.riscv@isrc.iscas.ac.cn,
	cyy@cyyself.name,
	kingxukai@zohomail.com,
	TroyMitchell988@gmail.com,
	gaohan@iscas.ac.cn,
	me@ziyao.cc
Subject: [PATCH 1/2] dt-bindings: riscv: canaan: add 100ask K230 boards compatible strings
Date: Mon, 29 Dec 2025 14:13:17 +0800
Message-ID: <20251229061318.16756-2-jiayu.riscv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229061318.16756-1-jiayu.riscv@isrc.iscas.ac.cn>
References: <20251229061318.16756-1-jiayu.riscv@isrc.iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowABnaL8UHFJpuWxrAg--.22171S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw1UuF1DJw1fKF1DZryrWFg_yoWDtrc_ua
	1xur1kWryUJF9agFs8CFWIkFW7Aw4ftFykAr9rJ3Wvk343Z39xZFWvk34Ykr43CF4Uurn3
	Ars5Jry3ursrCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbk8FF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6r1S6rWUM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGwA2048vs2IY02
	0Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
	AFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
	0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI
	1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
	UjIFyTuYvjfU8XdbUUUUU
X-Originating-IP: [223.160.206.4]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_221405_938868_8AC98F31 
X-CRM114-Status: UNSURE (   6.22  )
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

K230 CANMV DSHANPI is a development board produced by 100ASK.

Add compatible string for the board and its SoM.

Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
---

The hardware details are available here[1].

[1]: https://github.com/100askTeam/eLinuxAI-TrainingDocs/blob/master/docs/CanaanK230/part1/01-Introductionhardwareresources.md

 Documentation/devicetree/bindings/riscv/canaan.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/canaan.yaml b/Documentation/devicetree/bindings/riscv/canaan.yaml
index f9854ff43ac6..b9f095bc6021 100644
--- a/Documentation/devicetree/bindings/riscv/canaan.yaml
+++ b/Documentation/devicetree/bindings/riscv/canaan.yaml
@@ -48,6 +48,11 @@ properties:
               - canaan,k230-usip-lp3-evb
           - const: canaan,kendryte-k230
 
+        items:
+          - const: 100ask,canmv-k230-dshanpi
+          - const: 100ask,canmv-k230-module-dshanpi
+          - const: canaan,kendryte-k230
+
 additionalProperties: true
 
 ...
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
