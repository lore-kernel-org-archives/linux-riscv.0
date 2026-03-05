Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6575F33A77
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 14:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ouKQG2A+KErnGKdVhn/FcflooPb9Bdycy0ijR0GkUs4=; b=n+laT3YZsuaCvW
	2UT5BIvSvjlFwfBYhPuCOioUoSc0OY4BvdJ4rqVBibK6mDJqU7RBfliAT83XE5V+ykxrAlngIxWWx
	66AD7rKe7iKyD7ysI6OPy3eUJumISI2o0E1VR77d3OXuK5o85lNnDLhgbn49mi7RYYrgvf8omBGuN
	UCk8GlTYTHKFRc82yxU/5HOeYKnYqlghajUXwnVcqqPwcLiFmtZCPwduL+5ehinfdeGu/Qta+Llkh
	gyAfJPEY5vxWbVD2Bh3f+dVcFNMBL/7+Jnuz/tltV5CjJZQpQCkgvLyzx++Wxr18p/C7cKg5INREQ
	z87WpdLIo8BiRFfteBCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9so-000000020Yp-2msi;
	Thu, 05 Mar 2026 14:40:58 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9sk-000000020XA-0SJr
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 14:40:56 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.14])
	by APP-03 (Coremail) with SMTP id rQCowABnhNvulalpTx7iCQ--.24548S2;
	Thu, 05 Mar 2026 22:40:47 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rahul Tanwar <rtanwar@maxlinear.com>
Subject: [PATCH v2 0/2] Add cofficients to the TH1520 PVT
Date: Thu,  5 Mar 2026 22:40:42 +0800
Message-ID: <20260305144044.44208-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CM-TRANSID: rQCowABnhNvulalpTx7iCQ--.24548S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtrWxZF1DWw1xKF1xJFWUJwb_yoWxCFcEka
	409FWDCws5A3Z3tF10yrWxJrs8A3y5C3WfAa48tFy2gr98Cr98ZayDCwn3Cr4UuFy5CFyx
	Ar1kGrZ7t3y2gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb38FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjfUonmRUUUUU
X-Originating-IP: [112.94.103.14]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_064054_534000_977ADAF3 
X-CRM114-Status: UNSURE (   7.40  )
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

This patchset tries to add PVT cofficients from the T-Head TH1520 user
manual to the corresponding DTSI file.

The v1 revision of this patchset is called "Initial thermal management
for Lichee Pi 4A board", however the thermal zone and cooling related
parts are already added to the DT as part of the TH1520 PWM patchset.

Icenowy Zheng (2):
  dt-bindings: hwmon: moortec,mr75203: adapt multipleOf for T-Head
    TH1520
  riscv: dts: thead: th1520: add coefficients to the PVT node

 Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml | 4 ++--
 arch/riscv/boot/dts/thead/th1520.dtsi                        | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
