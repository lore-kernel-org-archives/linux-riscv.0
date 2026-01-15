Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC07D44C7E
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 16:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EISCRf9EYHjBZPonvhpqOj2TrNtuWoH+E9xL6UH1kuk=; b=tnLDsnvvNI7P0C
	TDchfF/u/rXkRB6LZTE9UlrdXlLRc6H5xzxqB7E0izG4ppbgb2xb7US0qTcZHvtTuxqdmaeRVV7wg
	2LiTYcgn+HcJcPMNpiIHOf0SDCoSsaHWArAzXuylyFW9RaU8APag+Ixy6xaYGCNqYmCGihhUdsj/y
	ym+EV0IvbpHupwLCMOhSPwWexY8FRBwgAhKkaCiRM6mFn4fREUMpOx2wdCWBxejMWEOq+aAyyo8v+
	3lQJt0aa0IYI5IUNPlpVvsmBXjZliGQEuK+g23JgtRF8zlHBGZMAEciEdwk/xyaVwbmflIFMOOpS9
	RUS6ikFOzmf8dDgKyyAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQOM-0000000CnNe-377v;
	Thu, 15 Jan 2026 16:40:14 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQOI-0000000CnMd-23RO
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 16:40:12 +0000
Received: from duge-virtual-machine (unknown [183.192.221.134])
	by APP-05 (Coremail) with SMTP id zQCowADHWQ1aGGlpltIZBQ--.29159S2;
	Fri, 16 Jan 2026 00:39:56 +0800 (CST)
Date: Fri, 16 Jan 2026 00:39:54 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org,
	krzk+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, cyy@cyyself.name,
	dlemoal@kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	gaohan@iscas.ac.cn
Subject: Re: [PATCH v3 1/2] dt-bindings: riscv: canaan: add 100ask K230
 boards compatible strings
Message-ID: <aWkYWlODTKVw4bH9@duge-virtual-machine>
References: <20260115060801.16819-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260115060801.16819-2-jiayu.riscv@isrc.iscas.ac.cn>
 <20260115-muscular-oxpecker-of-typhoon-bbe46f@quoll>
 <aWjTl2g11WNc3gvT@duge-virtual-machine>
 <20260115-vending-statistic-9db5bd1829ec@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115-vending-statistic-9db5bd1829ec@spud>
X-CM-TRANSID: zQCowADHWQ1aGGlpltIZBQ--.29159S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKFyxCr17Zr45Zw1fJr13urg_yoWfAFgEgr
	Wvkwn2kw4DJryDA3Z5trZ3JrZFgwnrt345X3s5Xwn8X3s8Ga4vy34kWrn3t3W5tF47Gryx
	ur13XF4UG3sIgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsxYjsxI4VWkCwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z2
	80aVCY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07j0fOwUUUUU=
X-Originating-IP: [183.192.221.134]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_084010_910147_B66FF193 
X-CRM114-Status: GOOD (  14.72  )
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

On Thu, Jan 15, 2026 at 03:27:28PM +0000, Conor Dooley wrote:
> On Thu, Jan 15, 2026 at 07:46:31PM +0800, Jiayu Du wrote:
> > On Thu, Jan 15, 2026 at 10:30:35AM +0100, Krzysztof Kozlowski wrote:
> > > On Thu, Jan 15, 2026 at 02:08:00PM +0800, Jiayu Du wrote:
> > > > K230 CANMV DSHANPI is a development board produced by 100ASK.
> > > > 
> > > > Add compatible string for the board and its SoM.
> > > > 
> > > > Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> > > > ---
> > > >
> > > 
> > > <form letter>
> > > This is a friendly reminder during the review process.
> > > 
> > > It looks like you received a tag and forgot to add it.
> > 
> > I will add the Acked-by/Reviewed-by/Tested-by tags in v4 version.
> 
> I'll go fetch them, unless you have to send a v4 for some other reason.
I don't need to send v4 anymore. Then I want to confirm if both patches
of this series are in good condition, or did you only fetch patch 1?

Regards,
Jiayu Du


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
