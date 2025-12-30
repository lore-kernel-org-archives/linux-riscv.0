Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5463E9412E
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 09:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KtkPZM7CiUVWZg+b+LMQweJYvY3b2uBkdqzCNTtHkVo=; b=uvDdjfb0kAq/Mg
	GwcBFHrxaZhSDayh7aehn0JlYP9s8mYkX3i4vLZGqxKsHDdBBQxCExHRpxObAQcSj7+PjDLgnpE7N
	BDukgSxuDiNgyiZDFrQM0iA/XTfsjHE8KpomX13MNRN65G5MUXnguBCmgjF2LNUam1Xr11/yyZlFh
	c2zTNQA6ApK/VqucVcXVo6jB3FkD6jSaY08Yp9k8SbiWczwOUiu0x7+SQ+unOAJe5GxUYgeLwFMRP
	Qyefy53RkN1zceI9zOKF4kZ0ABmp+XAi08kmz45CIEq3hcYF0BlXGlMsNKrZKZtiz2HbSn3cUjKH1
	gwhFoPFQTYFhMT28YJWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVel-00000004cbr-3EUO;
	Tue, 30 Dec 2025 09:04:43 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVeh-00000004ca4-29mc;
	Tue, 30 Dec 2025 09:04:42 +0000
Received: from duge-virtual-machine (unknown [223.160.207.108])
	by APP-01 (Coremail) with SMTP id qwCowADHcm6XlVNpQBFYAg--.11893S2;
	Tue, 30 Dec 2025 17:04:26 +0800 (CST)
Date: Tue, 30 Dec 2025 17:04:21 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: conor@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, neil.armstrong@linaro.org, krzk+dt@kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: phy: Add Canaan K230 USB2.0 PHY DT
 schema
Message-ID: <aVOVlQXAQyr3aI1+@duge-virtual-machine>
References: <20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20251230023725.15966-2-jiayu.riscv@isrc.iscas.ac.cn>
 <20251230-tricky-hasty-koala-2fc9f0@quoll>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251230-tricky-hasty-koala-2fc9f0@quoll>
X-CM-TRANSID: qwCowADHcm6XlVNpQBFYAg--.11893S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYq7k0a2IF6w4xM7kC6x804xWl14x267AK
	xVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWUuVWrJwAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j
	6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Jr
	0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAa
	Y2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4
	A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY
	1x02628vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCF54CYxVCY1x0262kKe7AKxVWUtVW8Zw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU2xR6UUUUU
X-Originating-IP: [223.160.207.108]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_010439_920868_7ED4B31E 
X-CRM114-Status: UNSURE (   8.51  )
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

On Tue, Dec 30, 2025 at 08:36:06AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Dec 30, 2025 at 10:37:20AM +0800, Jiayu Du wrote:
> > k230-usb-phy driver supports USB 2.0 phys integrated in Canaan
> 
> Describe hardware, not driver.
> 
> > K230 SoC. Add YAML schema for its binding.
> 
> There is no such stuff as YAML schema for a binding. Look at other
> commits how they phrase it.
> 
> > 
> > Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
I'm truly sorry for taking up your time. Thank you for your patience.
I will carefully revise and test it.

Regards,
Jiayu Du


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
