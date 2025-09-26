Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174D9CAC5AE
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Sep 2025 14:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KbUDTOUEnv3j30xvwqtdS4hzxkU+3TZTr86Xc0sf5vM=; b=tz0Y2uyEHuA9Ti
	42ryd+g8ssT83hPVnqzPe4pJtQds1tZyuQvC3UY2rPk2366Nera4g4RjxQ+jMSlMh6ZgpYTNtO6kb
	umMBfn5jNMMy/p27SV6U2+zi/atkoiE2aqCGneTAhDsxLV//Y4SAit6nD3MNR5O4MG3GKNh8j5+Co
	8uw2Lr4DMCTqzBDTGKB9KPVuJfTAd0ElBw2c6bpsNrGHC3syzvLyf0smFe6NFcv+PTsdZADWmrV/D
	4khT7yoZmWZzrOeOJFDUbs/+eKAffeHDQphB3JJRLRfe5hsujyKbBGpOp4lndBYwvU9s7DZtSbeWJ
	yxsUN9xS/9p2ZSXZ6m5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29bV-000000024mV-39dj;
	Fri, 26 Sep 2025 14:39:21 +0000
Received: from mail-m21470.qiye.163.com ([117.135.214.70])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29bR-000000024hY-1nly
	for linux-riscv@lists.infradead.org;
	Fri, 26 Sep 2025 14:39:20 +0000
Received: from leo-ubuntu21.localdomain (unknown [114.84.85.30])
	by smtp.qiye.163.com (Hmail) with ESMTP id 10cd375ea;
	Fri, 26 Sep 2025 22:39:08 +0800 (GMT+08:00)
From: "fushan.zeng" <fushan.zeng@anlogic.com>
To: conor@kernel.org
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	fushan.zeng@anlogic.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	junhui.liu@pigmoral.tech,
	krzk+dt@kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	palmer@dabbelt.com,
	palmer@sifive.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	samuel.holland@sifive.com,
	tglx@linutronix.de,
	ruigang.wan@anlogic.com
Subject: Re: [PATCH v2 00/11] riscv: Add initial support for Anlogic DR1V90
Date: Fri, 26 Sep 2025 22:38:55 +0800
Message-Id: <20250926143855.4106-1-fushan.zeng@anlogic.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20250925-jaundice-uneasy-ff8b3b595879@spud>
References: <20250925-jaundice-uneasy-ff8b3b595879@spud>
MIME-Version: 1.0
X-HM-Tid: 0a998676aceb0224kunmdf48913a39ec1b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHR5LVh0fGhlPGEJKTUJJGVYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlKSk9VQ09VQ05VSEtZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSExVSktLVU
	pCS0tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_073917_754163_54858C3E 
X-CRM114-Status: GOOD (  30.65  )
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

On Thu, 25 Sep 2025 18:09:59 +0100, Conor Dooley wrote:
> On Thu, Sep 25, 2025 at 11:06:50AM +0800, fushan.zeng wrote:
> > Thanks first.
> > Anloigc already has the open source SDK at https://gitee.com/anlogic/sdk,
> > and will submit it to mainline at suitable time.
> > The code should be a full feature version after lots of tests, not the
> > modified and simplified version from Anlogic open source.
> 
> The nature of the upstreaming process will require what you have to be
> broken down into multiple parts and be upstreamed at different times,
> depending on how long components take to review. This is normal and
> expected. Of course there should be through testing done, but I don't
> think that what is in this initial patchset really requires much
> testing - if it boots then it's probably sufficiently tested!
> 
> > And we hope that there won't be two different versions code of anlogic SO=
> Cs,
> > it may confuse customers.
> 
> If there's ever going to be complete upstream support for your device,
> then there will be two versions, because looking at just the dts files
> in the gitee sdk you linked I have noticed things that are not acceptable
> in upstream. As others have said, you are not entitled to control the
> upstreaming process for your device. The only way to have some control is
> to submit patches yourself and to engage with the review process for other
> components. It's in everybody's interest to keep differences with your
> SDK to a minimum, but you need to accept that there will always be
> differences because the upstream community simply has higher standards
> than those in your SDK as well as a requirement for portable code that
> you do not have.
> 
> > It is better that anlogic SOCs are long term maintained and supported
> > by Anlogic officially in mainline and for customers.
> 
> It's only better if Anlogic submits better quality patches (no evidence
> for that yet) or submits the patches more promptly than others (which
> clearly has not happened here), and offers review commentary etc at a
> higher standard and more frequently than a non-employee maintainer would
> be able to do (there's no evidence for that so far either, given you're
> trying to stall this patchset). Your claim seems to have no merit as
> there is no proof that you'd do a better job.
> 
> Thanks,
> Conor.

Hi all,
I realize that my previous message was inappropriate and may have
given the wrong impression - my apologies.

To clarify, I am not trying to control the community
or block upstream work. I misunderstood the right
way to express myself before, and I take my
previous mail back.

Thank you for your guidance and patience. As a
newcomer to the Linux community, I am still
learning how to properly contribute.

If Junhui has further technical questions, please
feel free to contact me in this thread. I am happy to
help and to welcome contributions from the
community.

Best regards,
fushan



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
