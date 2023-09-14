Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F896EDE99F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 10:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nmrg3F3lfE1pSjEfR1cc9v4KRKF1N/9U4vr4Ont9yxw=; b=Dx8x+i8q/DwODY
	F27Q+9GTU6DBSbeibIe2NsUKIExeN0uLsrK7rFzgHYUZvZeqt/xQGgFVi4tmQKj7WEFDMmtwJhfyM
	2PDjaI1/GRdnHKz34uhWSE/wpAESUzj5FAZFiu7127dlCOSIrUBcL6wtg3Sm62j4T7q8Rje9QDMK4
	9EYAVUyCIxjcPLo6yYcJZ7QPhpzhpnJc0PbSpYg5DaKzRL0JV5XWnD4z0nx2IuH4+zzmvnmYvxOcf
	bAoevKBjuWw3UfJZS/Yx1cEY1J+tylzAp6/g9jwnlZAN3pDykyDWYedHz3SBxbSQarSDCXrTvj+5B
	yi97IRCTPMIzWSfsjuAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgjD7-007v2N-2o;
	Thu, 14 Sep 2023 10:04:33 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgjD4-007v0i-1M;
	Thu, 14 Sep 2023 10:04:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TungYnLWY9BVlgruVURPd6F3Z87oI7SC3m5x9j6z2eg=; b=y9U73woI1ZDPmhAm+/gOrb9PoN
	WxH4DuTEG1QNBULV6zUe2S7kmS86eZZl110Gx3sDQ+8uHmBKKkwvLGuUsXmeQCbHJc3Rp+L7XM/ww
	5s39GgSMHFadDwMi/PN2t5rkyiphQX1ZrhY4iJflxBgAMIbwbcSqf6+wNlg5YbCDu2iRWF42QKgAM
	gvqabwDEdElAA23pKQBzzgePvq00M3IO48IMcyYlgtucEYPnfElxlyRtCXPQu2F/NpNIpiasr0E2g
	V+0bZcufUpoFQ81fewAN5YmTEk3eXiBQrfamqSAFku6oMOSF6p6xcjl/RsexI30JFTxyH5EBNB2ZI
	s+ZgrTqw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45606)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qgjD1-0003rJ-0a;
	Thu, 14 Sep 2023 11:04:27 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qgjD1-0004fG-TJ; Thu, 14 Sep 2023 11:04:27 +0100
Date: Thu, 14 Sep 2023 11:04:27 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: James Morse <james.morse@arm.com>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com
Subject: Re: [RFC PATCH v2 10/35] riscv: Switch over to GENERIC_CPU_DEVICES
Message-ID: <ZQLaq0/qyXdJWbLq@shell.armlinux.org.uk>
References: <20230913163823.7880-1-james.morse@arm.com>
 <20230913163823.7880-11-james.morse@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230913163823.7880-11-james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_030430_460128_46A82E4B 
X-CRM114-Status: GOOD (  11.55  )
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

On Wed, Sep 13, 2023 at 04:37:58PM +0000, James Morse wrote:
> Now that GENERIC_CPU_DEVICES calls arch_register_cpu(), which can be
> overridden by the arch code, switch over to this to allow common code
> to choose when the register_cpu() call is made.
> 
> This allows topology_init() to be removed.
> 
> This is an intermediate step to the logic being moved to drivers/acpi,
> where GENERIC_CPU_DEVICES will do the work when booting with acpi=off.
> 
> Signed-off-by: James Morse <james.morse@arm.com>

... and same concern as the previous patch.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
