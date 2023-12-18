Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F46C35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 12:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d6qsNpd8fYyMbyUVNrzmweHZl2q9W/jm1ixJFBHU+pQ=; b=xDYYYNUMMYtLys
	jZ91eAr2GJqbdw/EgwvuNgarEhZE3E9gJt4XS5uAgHbZlYN2rNS6wINEd5TnHyacR46f4+5QzF7H/
	JholU427oylsoHIKQI0txppwpxB5h2fawisWHziJ5Bn6QyPLFrKDAFzqMmk2Sq2B4F5m7BjVYM9UP
	H00Rcnk9v9GPMGZHtX1tIVV09Qj/fra1ufvTIK3rcX6JMBd5MxFXPbuyWvpyrT1I3d+vmM2VCpYaG
	QccvJPVTv33mc1aD5riGbnf6oay9Uxc6gvJnx1rz298jXdqcx2ACr4iLnPlT6KPdDiReKbBX1pBH/
	TuNka7TQ6fJQv/yUQLWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFCWB-00Aa3b-0g;
	Mon, 18 Dec 2023 12:14:43 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFCW7-00Aa0Y-1U;
	Mon, 18 Dec 2023 12:14:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=08SzGJH5lXG9BtLXnSCiZJkgfUYvZPRLdF1MiDN6maA=; b=C2KaLUoh/n1BgxKSf6SrAbqvai
	JKrWWotA8ePs91dXAVLuwjEpSY5ePbNax2YRNGRaUBgp7XlJSEVD5M4TKEtLw4VeIHgs2tqfFO7aM
	dxhfjGyheynixij5MnQ9UsD+vCLAUH1h1KZirAZWC8js4LRKy1n3PwI3uBnUi1JZVY2U7Ihv5/Mor
	rJp5cRqch1rnSU/tEZFmu+buYl/SCLuuuxAXtVHXXphaJjFugXWAG6myDphxhCF2EwzotxfXC/uJ4
	u6LnZqqFeEf53FdSsSiRJvxxjxBXV5gsbJXRjyqKyBk1ikWGT5yxqUY1944KT5NF09+Aqz0ttUPbl
	JFeOLJUA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54580)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rFCVj-0005GR-2l;
	Mon, 18 Dec 2023 12:14:15 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rFCVi-0006hJ-Np; Mon, 18 Dec 2023 12:14:14 +0000
Date: Mon, 18 Dec 2023 12:14:14 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, acpica-devel@lists.linuxfoundation.org,
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
	Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com,
	James Morse <james.morse@arm.com>
Subject: Re: [PATCH RFC v3 21/21] cpumask: Add enabled cpumask for present
 CPUs that can be brought online
Message-ID: <ZYA3lmPOwIOJq/iY@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
 <E1rDOhX-00Dvlg-Ci@rmk-PC.armlinux.org.uk>
 <20231215171831.00004a19@Huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231215171831.00004a19@Huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_041439_497627_872BD49E 
X-CRM114-Status: GOOD (  17.49  )
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

On Fri, Dec 15, 2023 at 05:18:31PM +0000, Jonathan Cameron wrote:
> On Wed, 13 Dec 2023 12:50:59 +0000
> Russell King (Oracle) <rmk+kernel@armlinux.org.uk> wrote:
> 
> > From: James Morse <james.morse@arm.com>
> > 
> > The 'offline' file in sysfs shows all offline CPUs, including those
> > that aren't present. User-space is expected to remove not-present CPUs
> > from this list to learn which CPUs could be brought online.
> > 
> > CPUs can be present but not-enabled. These CPUs can't be brought online
> > until the firmware policy changes, which comes with an ACPI notification
> > that will register the CPUs.
> > 
> > With only the offline and present files, user-space is unable to
> > determine which CPUs it can try to bring online. Add a new CPU mask
> > that shows this based on all the registered CPUs.
> > 
> > Signed-off-by: James Morse <james.morse@arm.com>
> > Tested-by: Miguel Luis <miguel.luis@oracle.com>
> > Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> > Tested-by: Jianyong Wu <jianyong.wu@arm.com>
> > ---
> 
> Needs docs
> Documentation/ABI/testing/sysfs-devices-system-cpu
> seems to have the rest of the similar entries.

Any ideas what I put in there as "Date" ? It seems to me that we have
little idea when this might be merged.. I could use the date of the
commit (Nov 2022).

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
