Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02047D232CB
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 01:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+j/d+tJcIWmRIdhVVdXNSzSaSJR9pndwlYjfEAZSkRE=; b=nnellnYFgcEogk
	0OKSGejrqT9x7t2UdFiZfuUrx2lJN3sJ7BT46/TETiPO/Cbw9NXMznsykHJLfVddxwn9TmGbwoYB0
	4sXGLQWzRrZ/+9yrJBO8pcs1CRgCoe4+cW1zFdUKQ4pr+jqtKkL4zuZ/iC8E1rbaV+TsJriSoqEwQ
	TepWYKNrIrfOo7g+NxFWXuonQai3Flgf5O0ofYmbTNyBsn9MvwCn1OeGTDbhOgEe9o1AM+EP9oApm
	BZ8hsvjiehrWGBK8DeoHXI4yVnC1JtsSbm37rzws7qgZO0/GmjJWeOcOPMJqRPgrw637ubKqA+gHw
	7+JXI3OM97DAfBdE0JHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve1dO-000000015W7-2t5n;
	Fri, 09 Jan 2026 01:49:50 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve1dL-000000015Vi-0j1Y
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 01:49:49 +0000
Received: from duge-virtual-machine (unknown [220.196.194.160])
	by APP-01 (Coremail) with SMTP id qwCowADXQ2+lXmBpWvPgAw--.7260S2;
	Fri, 09 Jan 2026 09:49:27 +0800 (CST)
Date: Fri, 9 Jan 2026 09:49:24 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Rob Herring <robh@kernel.org>
Cc: conor@kernel.org, krzk+dt@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, alex@ghiti.fr, cyy@cyyself.name,
	kingxukai@zohomail.com, TroyMitchell988@gmail.com,
	gaohan@iscas.ac.cn, me@ziyao.cc
Subject: Re: [PATCH v2 2/2] riscv: dts: canaan: Add initial dshanpi board DT
 files
Message-ID: <aWBepFEpO45Ocowb@duge-virtual-machine>
References: <20260104070911.219588-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260104070911.219588-3-jiayu.riscv@isrc.iscas.ac.cn>
 <20260106182754.GA2506656-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260106182754.GA2506656-robh@kernel.org>
X-CM-TRANSID: qwCowADXQ2+lXmBpWvPgAw--.7260S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYH7k0a2IF6w4xM7kC6x804xWl14x267AK
	xVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWUuVWrJwAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j
	6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Jr
	0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv
	0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z2
	80aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF
	7I0E8cxan2IY04v7MxkIecxEwVAFwVWkMxAIw28IcxkI7VAKI48JMxAqzxv26xkF7I0En4
	kS14v26r1q6r43MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI
	42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
	80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8VnmtUUUUU==
X-Originating-IP: [220.196.194.160]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_174947_726320_B1463551 
X-CRM114-Status: UNSURE (   7.14  )
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

On Tue, Jan 06, 2026 at 12:27:54PM -0600, Rob Herring wrote:
> On Sun, Jan 04, 2026 at 03:09:11PM +0800, Jiayu Du wrote:
> > +	model = "100ask CanMV-K230-Module-dshanpi";
> > +	compatible = "100ask,canmv-k230-module-dshanpi",
> > +		     "canaan,kendryte-k230";
> 
> These get overwritten, but aren't really valid on their own. Drop.
> 
...
> > +	timerx_pulse_in: clock-50m {
> 
> clock-50000000
> 
Thanks for your review. I will fix it in the v2.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
