Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D5D606A33B
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 16:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IdOZ3Zvx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=EqPrM0py
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=26s9mZs0fP/4KGWMMa98sE4zJlRrO1ZlwDc9wTdpLcw=; b=IdOZ3ZvxMsSJmllaloaIiCFN7K
	vTpC3iS3q2KD9g5WbquUUzC9coQzhF2F6etA2TgmmizLo9CfJ3vWn+7uV3R3KmVwkZlg3dRsO6Kch
	j9RUJ9rUVcgrl7So7eWdYQ2INqjJ/3cHqPPWqiRAMhtgd2VlxVU3XxymNm7xe9PSzaLAIIvaxgJXN
	cuFHMlg0Mj5cXNxFtCyr4+cSGB8BJUb69Mr+9YkNIQOwcSUrFiEW5ryUVQC67UugympbN34XSwEvm
	UDb9EvRaMj/bQ8ctPv2DlaUlYrX0+Tye0iUGE3dql8yokK7CysOynjlknKfvcIQQhmTKvQD50hehI
	gEaW5Jpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5Qe-0000000CkN0-2m5H;
	Thu, 19 Nov 2026 16:56:08 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5Qb-0000000CkLc-409Z
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 16:56:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=kwyugsNu4/tep0lvJ/4udRwqoAJgnB/y7VsHTKO8ZMQ=; b=EqPrM0pyAxa8ZlSkLqTAdR2BGd
	eFrq7mXsxrYa77d5+uWkY17tLHY4zE5FTGbMZuMLA2FqC4R72SLau9EsUMvLasDsrMOSNRd1QNJkH
	2OMzKnKOjsknyzp597Wu31Qz1kL4dilvFuWHYTiEy6bgBhNMVVnPFqI1qDjXCAm7Tas+lW7DR9sZV
	d+gmO8vyTEXUV6UBx9Knaq2NXLUCGwf7hrVqfcxWJ4Zvs+IxIUnWLr6eCp7rmACI6tLrVbopgvxCf
	HVDEVWByeAJ9RaJVicLr2vYAgH7lZvpqYBvo9mcCgZLVCKx7dgAFZnVmWMVzzmt2p58K1RnpoR6hc
	DW78MCZA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xU5QI-00000001j9b-0hMX;
	Thu, 19 Nov 2026 17:55:46 +0100
Date: Thu, 19 Nov 2026 17:55:45 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: E Shattow <e@freeshell.de>
Cc: Yixun Lan <dlan@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
	Stanley Jhu <stanleyjhu@google.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Jennifer Berringer <jberring@redhat.com>,
	Trevor Gamblin <tgamblin@baylibre.com>, linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v8 0/2] Add UFS Host driver support for SpacemiT K3 SoC
Message-ID: <av8qEXk68wsy7pNe@aurel32.net>
Mail-Followup-To: E Shattow <e@freeshell.de>, Yixun Lan <dlan@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
	Stanley Jhu <stanleyjhu@google.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Jennifer Berringer <jberring@redhat.com>,
	Trevor Gamblin <tgamblin@baylibre.com>, linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261116-08-k3-ufs-support-v8-0-e3b256972dd4@kernel.org>
 <8462a0d9-e9b7-467d-b2e1-7870c78e2691@freeshell.de>
 <avyusx36U534Bpu9@aurel32.net>
 <053b55fe-47d0-4cc7-ba53-c560fc9c1d1b@freeshell.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <053b55fe-47d0-4cc7-ba53-c560fc9c1d1b@freeshell.de>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_085606_006481_719E61D0 
X-CRM114-Status: GOOD (  22.36  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 2026-11-18 23:38, E Shattow wrote:
> I was missing this detail previously. For testing again of v8 I have now
> inserted a sed pipe to change this as suggested for the dts application
> step of the build procedure:
> 
> b4 am -v5 -P3 -o- \
>  https://lore.kernel.org/all/20260916-08-k3-ufs-support-v5-0-1f5d71f1027d@kernel.org/ \
>  | sed -z 's%\(clock-names = "axi", "\)ref\(";\)%\1ref_clk\2%' \
>  | patch -p1
> 
> Additionally to the build procedure, since Debian testing now features
> linux-config-7.3 and no longer linux-config-7.2, I now substitute
> accordingly from linux-config-7.2 to linux-config-7.3

[...]

> $ journalctl --dmesg | grep ufshcd
> ufshcd-spacemit c0e00000.ufshc: freq-table-hz property not specified
> ufshcd-spacemit c0e00000.ufshc: ufshcd_populate_vreg: Unable to find
> vdd-hba-supply regulator, assuming enabled
> ufshcd-spacemit c0e00000.ufshc: ufshcd_populate_vreg: Unable to find
> vcc-supply regulator, assuming enabled
> ufshcd-spacemit c0e00000.ufshc: ufshcd_populate_vreg: Unable to find
> vccq-supply regulator, assuming enabled
> ufshcd-spacemit c0e00000.ufshc: ufshcd_populate_vreg: Unable to find
> vccq2-supply regulator, assuming enabled
> scsi host0: ufshcd
> ufshcd-spacemit c0e00000.ufshc: ufshcd_scsi_add_wlus: BOOT WLUN not found

All those are expected, so it's great that the issue you reported is 
fixed.

> I did not again see the DL error event. However, the first attempt to
> build Linux does fail:
> 
> make[7]: *** [scripts/Makefile.build:572: drivers/gpu/drm] Error 2
> make[6]: *** [scripts/Makefile.build:572: drivers/gpu] Error 2
> ...
> make[5]: *** [scripts/Makefile.build:572: drivers] Error 2
> make[4]: *** [Makefile:2244: .] Error 2
> make[3]: *** [debian/rules:80: build-arch] Error 2
> dpkg-buildpackage: error: make -f debian/rules binary subprocess failed
> with exit status 2
> make[2]: *** [scripts/Makefile.package:126: bindeb-pkg] Error 2
> make[1]: *** [/home/es/linux-7.4-rc3/Makefile:1852: bindeb-pkg] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 
> real    188m48.844s
> user    1415m17.363s
> sys     66m11.932s

I guess the error is some GCC ICE.

> Linux is running on the K3 SoC here without clocks preparation from the
> bootloader; it is quite slow by comparison to a Linux kernel that
> follows clock preparations by the vendor BSP bootloader. Simply
> re-running the same "make ..." build command is successful in the same
> system without any changes:
> 
>   DEPMOD  debian/linux-image-7.4.0-rc3-k3ufs/lib/modules/7.4.0-rc3-k3ufs
> ...
> dpkg-deb: building package 'linux-image-7.4.0-rc3-k3ufs' in
> '../linux-image-7.4.0-rc3-k3ufs_7.4.0~rc3-2_riscv64.deb'.
> ...
> real    34m56.794s
> user    241m15.511s
> sys     18m4.532s
> 
> Similar build failures occasionally happen when the root filesystem is
> on USB microSD adapter-connected microSD storage. I assume the build
> failures with default clocks configuration are not constrained to just
> the UFS support series here.

Yes, this is a known issue, unfortunately the K3 does not run stable 
under load. See this thread (although it seems at the end the K1 and K3 
issues are different ones):
https://lore.kernel.org/linux-riscv/apSYF5x1Tu7PlyL1@aurel32.net/

Also see this Fedora issue:
https://forge.fedoraproject.org/riscv/planning/issues/36

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
