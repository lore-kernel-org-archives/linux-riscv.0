Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D2AC35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 12:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6w1fjrKXN0FCifAWLieJ6iyF+WU9IVy/iBwHMtc82Nc=; b=lJW32bw987UebH
	2KiDdVzfmhvTOeJCNYPgo3l0Y/+slmtXoZ/4vBF1Xwdnvf8TIB1wsGSYeonZH7nZGbTWVJB2Q0xgp
	qz9utqCr5ZWOL7+8CWMdrUyqaXfqCdZ5EjBfcCri7uYmgjNErP+gt/Al48QLX3uafXeJYKqbAAe/2
	G1kKIT7BggXo/EYEaOxQOr03/2nKNjfJIXgyhSwe73vO4rjZW+MiWeRu3T/Y92mLxUjRlyzoeB4Lv
	8lryaG1XFA5alC1mEeK8mOvE5ywW03Nun33VFfVAWUcNoqPfWzdcFd9iENCPMnKsaI64oZ20QNugK
	NWvA3JVU/uqmgbUVKDbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFDCT-00Akfp-2R;
	Mon, 18 Dec 2023 12:58:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFDCQ-00Akef-15;
	Mon, 18 Dec 2023 12:58:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1tKUg55GyHTf08JBzgZtZPRuKz4R//UeiI1dQsdNZgo=; b=Qko+tfQDFH5tQIm1p5IewFoZqc
	HQbLvnPtulg59EsBQmSHF3TGK/cg1U10PaVJbAPFhiDYDjQYcY0Tb45fv10B/s8amTj40tVQcUCGl
	orYICCQmfSSDBW1S8Va4xT8hdnzc3DVjCEYJhFpJZ9DM9SR8DgrYn9glT9DanCBbppoRBmAq9mlK6
	rbEHePJnWqF3fL6nDzAJyixhWe6uU25tQTzDkVtKpDVb93iIiK1+Zr+A+j9xCCo2GohTYU791FOf2
	YP4h4FqD1dG+3JNgOqZdD1sDv0QdhwyJiZno0EgDX7/vUu1hpnfUN74CEdu2Lk68k/uj0Soxl3/DQ
	aeSrb43Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50904)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rFDCB-0005MM-0g;
	Mon, 18 Dec 2023 12:58:07 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rFDCB-0006ii-Ft; Mon, 18 Dec 2023 12:58:07 +0000
Date: Mon, 18 Dec 2023 12:58:07 +0000
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
Subject: Re: [PATCH RFC v3 18/21] ACPI: processor: Only call
 arch_unregister_cpu() if HOTPLUG_CPU is selected
Message-ID: <ZYBB32fMWB6of7Jb@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
 <E1rDOhH-00DvlO-UP@rmk-PC.armlinux.org.uk>
 <20231215165009.000035f2@Huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231215165009.000035f2@Huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_045822_371898_4E804D59 
X-CRM114-Status: GOOD (  18.56  )
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

On Fri, Dec 15, 2023 at 04:50:09PM +0000, Jonathan Cameron wrote:
> On Wed, 13 Dec 2023 12:50:43 +0000
> Russell King (Oracle) <rmk+kernel@armlinux.org.uk> wrote:
> 
> > From: James Morse <james.morse@arm.com>
> > 
> > The kbuild robot points out that configurations without HOTPLUG_CPU
> > selected can try to build acpi_processor_post_eject() without success
> > as arch_unregister_cpu() is not defined.
> > 
> > Check this explicitly. This will be merged into:
> > | ACPI: Add post_eject to struct acpi_scan_handler for cpu hotplug
> > for any subsequent posting.
> > 
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Signed-off-by: James Morse <james.morse@arm.com>
> > Tested-by: Miguel Luis <miguel.luis@oracle.com>
> > Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> > Tested-by: Jianyong Wu <jianyong.wu@arm.com>
> > ---
> > This should probably be squashed into an earlier patch.
> 
> Agreed. If not
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

I'm not convinced that "ACPI: Add post_eject to struct acpi_scan_handler
for cpu hotplug" is the correct commit to squash this into.

As far as acpi_processor.c is concerned, This commit merely renames
acpi_processor_remove() to be acpi_processor_post_eject(). The function
references arch_unregister_cpu() before and after this change, and its
build is dependent on CONFIG_ACPI_HOTPLUG_PRESENT_CPU being defined.

Commit "ACPI: convert acpi_processor_post_eject() to use IS_ENABLED()"
removed the ifdef CONFIG_ACPI_HOTPLUG_PRESENT_CPU surrounding
acpi_processor_post_eject, and that symbol depends on
CONFIG_HOTPLUG_CPU, so I think this commit is also fine.

Commit "ACPI: Check _STA present bit before making CPUs not present"
rewrites the function - the original body gets called
acpi_processor_make_not_present() and a new acpi_processor_post_eject()
is created. At this point, it doesn't reference arch_unregister_cpu().

Commit "ACPI: add support to register CPUs based on the _STA enabled
bit" adds a reference to arch_unregister_cpu() in this new
acpi_processor_post_eject() - so I think this is the correct commit
this change should be merged into.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
