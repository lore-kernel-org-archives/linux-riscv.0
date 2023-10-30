Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F5BC41535
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 17:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m8Rcq21bXdbPtOyzR0sK7ZBFYUWiUyn4W1dlrb9VqpY=; b=q7PztZ113c2Rw7
	EKtYQE0UU85fPzgwmChck0mgnUPYJN5X8BxNiyI/I+wyitQ1si4vS7RHZTaitGzoKv2J8AknQGy9h
	rQqLyPWP4oga42w4vj8dPtZTWwS5eNljozpWA2lQQtN7OLARXhzXo87yoVM+eLK3VpH3jls6dEfQ0
	iWHSfsKYR2MpoDW5hmrMYCfAXBrjTop58FNXLPfceXZ8fJ4mM8yel5iRZQxB2yrU0KD40ulH/7JNp
	m6NP7OjCudnXKI2XUKTtsz1AFpC8BIxuMgPZ8Kxi8nQt8mVP0rFnjx3CMLTx9ecicQopcf+V3Tigq
	TGfpMKon/OKRFRJNjHkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxWQB-003nYj-0u;
	Mon, 30 Oct 2023 17:51:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxWQ7-003nWl-0L;
	Mon, 30 Oct 2023 17:51:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ni1GPgCl8w8Lwh/aSdbo/ks9Sgjz4jtglOS0ql7XSO4=; b=01c617rJlquZVt2QBAZvsxfiUn
	We9Aa2YJR/FiIGF2DchKsF4HTzXH4x13XmbhOFjuOjjTLrSvKEbbIiIVeMQu4u7PR8HN2WFJmMyfQ
	C6J8t3czF4AKG2F9u13+0fCagYzgASIqbySFKQ8DbW1a5cFRQtx6yrNueDmBMUQgJ3HEoQfA/tW2Y
	6zKGiVKt5ORIV3bWGHSyvSBoiOH7RlM0U2llB7+2OXH2TD8iVukcZ8K6w4/w+3LY6bhMz5YBBMP6H
	5M32zkEld5QtXKRKatFhDhrcgT9/IEWXaX/fsQh6kfxMZP7g104aTS23og0hO0W/VM5RGC4DF0bOO
	lTqzoc7Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50422)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qxWPr-0001wo-2E;
	Mon, 30 Oct 2023 17:51:07 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qxWPn-0004Co-Sm; Mon, 30 Oct 2023 17:51:03 +0000
Date: Mon, 30 Oct 2023 17:51:03 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Miguel Luis <miguel.luis@oracle.com>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"x86@kernel.org" <x86@kernel.org>,
	"acpica-devel@lists.linuxfoundation.org" <acpica-devel@lists.linuxfoundation.org>,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	"jianyong.wu@arm.com" <jianyong.wu@arm.com>,
	"justin.he@arm.com" <justin.he@arm.com>,
	James Morse <james.morse@arm.com>
Subject: Re: [RFC PATCH v3 00/39] ACPI/arm64: add support for virtual
 cpuhotplug
Message-ID: <ZT/tB0ykr8JJd+E4@shell.armlinux.org.uk>
References: <ZTffkAdOqL2pI2la@shell.armlinux.org.uk>
 <C2C5C292-AD2C-4D98-8225-39ABE68C5395@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <C2C5C292-AD2C-4D98-8225-39ABE68C5395@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_105123_147638_7B6A9DAA 
X-CRM114-Status: GOOD (  14.25  )
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

On Mon, Oct 30, 2023 at 04:41:19PM +0000, Miguel Luis wrote:
> Hi Russell,
> 
> Tested on QEMU, based on Salil's RFC v2 [1], running with KVM.
> - boot
> - hotplug up to 'maxcpus'
> - hotunplug down to the number of boot cpus
> - hotplug vcpus and migrate with vcpus offline
> - hotplug vcpus and migrate with vcpus online
> - hotplug vcpus then unplug vcpus then migrate
> - successive live migrations (up until 6)
> 
> Feel free to add:
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> 
> Thank you
> Miguel
> 
> [1] https://lore.kernel.org/qemu-devel/20230926100436.28284-1-salil.mehta@huawei.com/

That's good news, thanks for testing!

I've pushed out an updated series against v6.6 earlier today in case
anyone wants something specifically against v6.6, but I don't think
there is any pressing reason to re-test. The only ACPI change
between the two is:

9b311b7313d6 ACPI: NFIT: Install Notify() handler before getting NFIT table

and the only arm64 changes are in dts files. Nothing significant in
kernel/ and nothing in drivers/base/.

So I think at this point, I will pause waiting for 6.7-rc1 (which
I'll do an updated patch set, since it will include changes queued
up) and hopefully followed by Rafael's comments. Maybe James will
also have some time to work on this again.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
