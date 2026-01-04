Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C101C2A06A
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jan 2026 01:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ZTdlJ7RJXsu4hzclXerZvMh6Rb9+uYlpxZ2a66En60=; b=Z0NuTKzY6P7pcL
	ENfkRrKOEdVxmI53mpZEV6A0NriLn6p2HB7fLQRBp5P6+nrLIfI29CvTn1MO+NR0O3rJIkyvAYGaf
	cd5CBEnqOidEtooOV90rkJ9elTn0rsfINGENPws7Fyrzh0NZrn+/t8TA8iK4FNTEstyZtI5gF9NrU
	3zyceZCeC+BM7lfRUZzSVD4aE846sGg+hgfEYKdO1xbUUyMpauEEmaXzHX3dTFD5Ebd45eMDGSkMa
	rPbsyILdGPXumyeeDt+J7IEfUjJYwhnJlRx9PQuamALcR5dwXfU5DUjLpo4iSkjRR+WM8gnGWgfX4
	ARRsiZUxRBgt39+shN0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcD7J-00000009wXe-1ANa;
	Sun, 04 Jan 2026 01:41:13 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcD7F-00000009wXF-0Rj9;
	Sun, 04 Jan 2026 01:41:11 +0000
Received: from duge-virtual-machine (unknown [223.160.207.26])
	by APP-03 (Coremail) with SMTP id rQCowAA3T9YpxVlpeARJAw--.62026S2;
	Sun, 04 Jan 2026 09:41:00 +0800 (CST)
Date: Sun, 4 Jan 2026 09:40:57 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: conor@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, neil.armstrong@linaro.org, krzk+dt@kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: soc: canaan: Add top syscon for Canaan
 K230 SoC
Message-ID: <aVnFKX43C8wl4QiB@duge-virtual-machine>
References: <20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20251230023725.15966-3-jiayu.riscv@isrc.iscas.ac.cn>
 <20251230-jumping-visionary-coyote-c0be31@quoll>
 <aVPQNIhyfR/Da/gk@duge-virtual-machine>
 <572407e8-bac7-4277-bfbd-ed42327b0ff4@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <572407e8-bac7-4277-bfbd-ed42327b0ff4@kernel.org>
X-CM-TRANSID: rQCowAA3T9YpxVlpeARJAw--.62026S2
X-Coremail-Antispam: 1UD129KBjvdXoWruF48GFyrJr4xtF1DtrWfGrg_yoWDtrc_XF
	WDAw1xCw47CFZrtws7KF4kJry3Ka47GryjqrZ5Xr4jvr13ur95Aw4rC34xJw1kGFWUKF15
	Gr10vw4rW34YgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsxYjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_JFC_Wr1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z2
	80aVCY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07b0SoAUUUUU=
X-Originating-IP: [223.160.207.26]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_174109_516191_04E1D2CA 
X-CRM114-Status: GOOD (  16.35  )
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

On Tue, Dec 30, 2025 at 03:00:26PM +0100, Krzysztof Kozlowski wrote:
> On 30/12/2025 14:14, Jiayu Du wrote:
> > On Tue, Dec 30, 2025 at 08:39:19AM +0100, Krzysztof Kozlowski wrote:
> >> On Tue, Dec 30, 2025 at 10:37:21AM +0800, Jiayu Du wrote:
> > This hisys memory area not only includes the usbphy registers,
> > but also contains the registers of sd/mmc phy. Therefore, the
> > hisys node is necessary and cannot be folded.
> 
> Can be. There is absolutely nothing stopping it.
> 
> Anyway, define all nodes.

I will fold the child into the parent in v2, thanks for your guidance.

> > 
> > 
> > If what I said above is accepted by you, do I still need to
> > merge the two usb phy nodes by defining one phy with phy-cells=2?
> 
> You should read your datasheet, not exactly rely on me guessing. In
> current form of the binding, you must fold the child into the parent.
> 
> Best regards,
> Krzysztof
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
