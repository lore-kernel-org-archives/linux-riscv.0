Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E62B606A333
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 14:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GLn9qTKV;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RSQJfjke
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zO3/ncgycO+UYeXyh6S9xZCLTjmFyHC1e3zuhjW/RDE=; b=GLn9qTKVMDIfi1WTQTrFrSDfzb
	+K59G42LVs6nXqZ69xUaHBNVJHUqtQqwJXeLPwrkqs7CPHVuylTEooo3GixgEfxVZVPNQVHRedL9O
	NrICLj9oNcHuaRa+J+Aqu9wFxGT6s0IaJaZpzjgIPmbWYEEcshxix01QxRWFaXIzJMPgmbK6895X2
	KAbiKcasaaeyGrqzEejtTIUVrTVE6o8PKXI+l2GWqkxfBXg42nZKjoauQCcO718jB5KMPNEGi9P1i
	Hdx62ydHa969viWmJVa1IZWDgZFMpey0mBBnwtt6DcyAMsIHE/pqC2bQIIFhoSl5bekBjYLKvwtV/
	/92wn9jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtyU-0000000EJv9-078M;
	Thu, 22 Oct 2026 14:40:58 +0000
Received: from out-243.mta0.migadu.com ([2001:41d0:1004:224b::f3] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtyQ-0000000EJuh-3vP5
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 14:40:56 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Q8GxvwGChN6/R7iREbia4Y5Fe+czvz/W6UuO4Z5BeAg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792680051; v=1; x=1793284851;
 b=RSQJfjkeTeMv7d3HI9fYpewS/LEJnmAp+2VJu8Z/R+YVjzDjK3Rdiunj6L57DokGUwa26lhm
 z88Elv9JuEMAnpnsatW6mJNBmQ+/ElBOllDLlVh41xTV0Wk0mqDf4bRJo601405k2RRBLrGrM7w
 iItyavz0u0AnoTJFw1T6eZNg=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id eec811b34d849da2;
	Thu, 22 Oct 2026 14:40:51 +0000
X-Mizu-Trace-ID: eec811b34d849da2
X-Migadu-Flow: FLOW_OUT
Date: Thu, 22 Oct 2026 16:40:41 +0200
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, linux-riscv@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev, tjeznach@rivosinc.com, jgg@ziepe.ca, 
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org, 
	palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org, kevin.tian@intel.com, 
	fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v6 09/16] iommu/riscv: Reserve an MSI IOVA window for
 iommufd
Message-ID: <atoeGhJkcgy2G1tO@orel>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
 <20260925151659.419512-10-andrew.jones@oss.qualcomm.com>
 <179209292716.4133959.2758345963634439485.b4-review@b4>
 <atEuxafCLCdZrdR7@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <atEuxafCLCdZrdR7@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_074055_133300_AC6DC293 
X-CRM114-Status: GOOD (  18.33  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 15, 2026 at 12:51:33PM -0700, Nicolin Chen wrote:
> On Thu, Oct 15, 2026 at 04:35:27PM -0300, Jason Gunthorpe wrote:
> > > Reserve one page per possible CPU, sufficient for each supervisor IMSIC
> > > page. Use a 16 MiB base instead of the 128 MiB convention used by ARM
> > > SMMU. kvmtool places its guest IMSIC at 128 MiB, so with IRQ bypass the
> > > domain-wide guest MSI address match can also capture host-delivered
> > > MSI writes to the SW MSI window and misdeliver them to the guest.
> > > 
> > > 16 MiB falls in a hole in the current kvmtool and QEMU virt memory maps,
> > > away from their guest IMSIC windows and RAM. Keep the window below
> > > 4 GiB so devices with 32-bit MSI address registers can use it.
> > 
> > And this is a good reason you should not follow ARM down this mad
> > road. Nicolin had some patches to allow userspace to select the SW_MSI
> > range instead of using a kernel hard coded value, which becomes a
> > sneaky ABI. It would be much better if riscv starts off on the right
> > foot instead of continuing this mistake.
> 
> It was paused due to lack of an immediate interest:
> https://lore.kernel.org/linux-iommu/cover.1760487869.git.nicolinc@nvidia.com/
> 
> If riscv wants it, maybe we can give a push.
>

I'll look into Nicolin's patches in a follow-on series and defer enabling
VFIO_IOMMU_TYPE1 for now. I'll see if I can avoid introducing
IOMMU_RESV_SW_MSI at all, which would rule out using the legacy Type1
backend as it stands. Instead, I'll try to support existing Type1
userspace through iommufd's compatibility interface, which will need to
manage MSI IOVA allocation without SW_MSI, since existing Type1 userspace
won't issue Nicolin's ioctls.

I'm posting a much simplified DMA-IOMMU-only v7 now.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
