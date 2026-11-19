Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBF7606A320
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 07:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zdEdCAhX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=fHHIVyEp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=I826di+WC0mduODlkK7t6C+OW4ERCMZxwCaZUho5BPE=; b=zdEdCAhX+WV5ee+RWf3H2N0qU+
	VW0UFDhd6LA7BwVpFYA2dTTHhfbwLIFdL+5bTBIvWrMim8uewlSUzDyXlGVHGA8GVjj6vtu3RxZWW
	/4qSP/KCC+BwQeZ7+CnXZJkeiLUBVpcT/rZo8BRm7Gn9ocho9FrliK5u71HUTWjZQxgsf3B0TglWJ
	6OrZGM2+oHY8fLE3QwsloEn6n0vfId+9QXKQWuoYE5EYIoOiVjr2SbELXwq6vovA5bwuX5n9APVFS
	HBe51oNa0I1Gp83uEJeiBRLT+xfsakeZcakwne86AW5bCZsX1d8poaoZPTw0Q9cyhvA6t3Chg3bwd
	wYDPb87w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwjY-0000000B5ef-2UHG;
	Thu, 19 Nov 2026 07:39:04 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwjS-0000000B5ab-3tte
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 07:39:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1795073892;
	bh=akDNbQx5FRb9gHPUZNIVSoupLqofkytxxol6XFlCraQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=fHHIVyEpCDHKo0PtvTQl3Yh0SV0eE/U/kDhsGZJCrnU6gviFNi8GCwUkY5bRxkdT3
	 22Zbt/QrIvbe6xaERzHMPKDbDWWqOSMfCJ6HIbSWoQar3xGG1eTYmKtuZWYzF7zNWW
	 agc2cJUhka/b6lPE0UnHbMP90TAGTFAJm5JruUbF/nytvhhnm2TgjxTBQk4EnA7ONH
	 hYnD+yNTyNP3+g/u4DNYIqOhqgeDqoabZp4K5ahgfY4+CTxTrCDWYB3BL+IBGiAGQi
	 qKSKqqaPUYnfGDEUc3sKzEh81Jt0KSkWDhjNqVbC4eBox0+lIOwV8Equh4cck4QbMZ
	 s3xaVTJyAttfw==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id D69FFB221F5A;
	Thu, 19 Nov 2026 08:38:07 +0100 (CET)
Message-ID: <053b55fe-47d0-4cc7-ba53-c560fc9c1d1b@freeshell.de>
Date: Wed, 18 Nov 2026 23:38:01 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/2] Add UFS Host driver support for SpacemiT K3 SoC
To: Yixun Lan <dlan@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <mkp@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>,
 Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
 Stanley Jhu <stanleyjhu@google.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
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
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <avyusx36U534Bpu9@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_233859_495326_60C2D9FF 
X-CRM114-Status: GOOD (  33.34  )
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
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Yixun, and Aurelien,

On 11/17/26 11:44, Aurelien Jarno wrote:
> Hi,
> 
> On 2026-11-16 17:15, E Shattow wrote:
>> Hi Yixun,
>>
>> On 11/15/26 19:46, Yixun Lan wrote:
>>> This series try to add UFS support for SpacemiT K3 SoC, the controller
>>> components consists of System Bus Interface Unit, UFS Host Controller
>>> Interface, UFS Transport Protocol Layer, UFS Host Registers, Device
>>> Management Entity (DME), Transport Layer, Network Layer, Data Link
>>> Layer, PHY Adapter Layer, and M-PHY Interface. A more detail functional
>>> block diagram can be found in SpacemiT website, chapter 9.7.3 [1]
>>>
>>> The DTS patch has been dropped in this series [2], and will send
>>> in separate series once this patch accepted. For people who want to
>>> test UFS driver, please grab the DT patch from version v5 [3].
>>>
>>> Enable UFSHCD_CAP_KEEP_AUTO_BKOPS_ENABLED_EXCEPT_SUSPEND,
>>> This allows the device auto-bkops to be always enabled except
>>> during suspend (both runtime and suspend), with this feature,
>>> the BKOPS interrupt (log below) isn't reported anymore.
>>>
>>> [  806.710763] ufshcd-spacemit c0e00000.ufshc: ufshcd_bkops_exception_event_handler: device raised urgent BKOPS exception for bkops status 1
>>>
>>> Link: https://spacemit.com/community/document/info?nodepath=hardware/key_stone/k3/k3_docs/k3_usermanual/09_memory_storage.md&lang=en [1]
>>> Link: https://lore.kernel.org/all/20260918-belligerent-succinct-kraken-7fa592@quoll/ [2]
>>> Link: https://lore.kernel.org/all/20260916-08-k3-ufs-support-v5-3-1f5d71f1027d@kernel.org/ [3]
>>> Signed-off-by: Yixun Lan <dlan@kernel.org>
>>> ---
>>> Changes in v8:
>>> - enable UFSHCD_CAP_KEEP_AUTO_BKOPS_ENABLED_EXCEPT_SUSPEND
>>> - rename to "ref_clk", see explanation in patch
>>> - add delay between enable clk & deassert reset
>>> - respect bRefClkGatingWaitTime, add wait delay
>>> - drop comment of ufs_hba_spacemit_vops, which got CI complaint
>>> - rebase to v7.4-rc1
>>> - Link to v7: https://patch.msgid.link/20261002-08-k3-ufs-support-v7-0-bb39007ff9ae@kernel.org
>>>
>>> Changes in v7:
>>> - check err return value of ufs_spacemit_quirk_host_pa_saveconfigtime()
>>> - Link to v6: https://patch.msgid.link/20260921-08-k3-ufs-support-v6-0-3479768a2299@kernel.org
>>>
>>> Changes in v6:
>>> - drop unused macro and dev_req_params
>>> - use global PX_xx macros
>>> - fix axi clock name
>>> - drop dts patch
>>> - collect tags
>>> - Link to v5: https://patch.msgid.link/20260916-08-k3-ufs-support-v5-0-1f5d71f1027d@kernel.org
>>>
>>> Changes in v5:
>>> - adjust clock names
>>> - add runtime power support
>>> - collect tags
>>> - Link to v4: https://patch.msgid.link/20260908-08-k3-ufs-support-v4-0-22aa2bd97d3b@kernel.org
>>>
>>> Changes in v4:
>>> - fix clock and reset settings
>>> - drop function which retrieve value of tx_lanes
>>> - propagate return error of ufs_spacemit_dme_set()
>>> - check return value ufs_spacemit_check_hibern8()
>>> - drop call to ufshcd_vops_phy_initialization()
>>> - handle compiling warning if CONFIG_OF not enabled
>>>  add __maybe_unused to ufs_spacemit_of_match
>>> - Link to v3: https://patch.msgid.link/20260806-08-k3-ufs-support-v3-0-037fb322acdb@kernel.org
>>>
>>> Changes in v3:
>>> - collect tags
>>> - fix dt-binding warning reported-by sashiko
>>> - fix low freq in opp-2 table
>>> - fix err checking in check_hibern8()
>>> - propagate err code in link_startup_notify()
>>> - update documents for event_notify()
>>> - ufs clock driver is merged into v7.3-rc1, update cover letter
>>> - Link to v2: https://patch.msgid.link/20260725-08-k3-ufs-support-v2-0-45036a2a2418@kernel.org
>>>
>>> Changes in v2:
>>> - fix missing interrupts property
>>> - move ufs node to k3-com260.dtsi
>>> - convert freq-table-hz to operating-points-v2
>>> - rework reset_control, fix header and drop global variable
>>> - drop dump_host_regs() debug interface
>>> - converge and refactor dme_set() operations
>>> - massive reduce of busy delay() loops
>>> - drop vendor specific hce_enable_notify(), fallback to default
>>> - drop unused member from struct ufs_spacemit_host
>>> - add COMPILE_TEST support to Kconfig
>>> - comment style fix
>>> - Link to v1: https://patch.msgid.link/20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org
>>>
>>> ---
>>> Yixun Lan (2):
>>>       scsi: ufs: spacemit: dt-bindings: Add UFS controller for K3 SoC
>>>       scsi: ufs: spacemit: k3: Add UFS Host Controller driver
>>>
>>>  .../devicetree/bindings/ufs/spacemit,k3-ufshc.yaml |  56 ++
>>>  drivers/ufs/host/Kconfig                           |  12 +
>>>  drivers/ufs/host/Makefile                          |   1 +
>>>  drivers/ufs/host/ufs-spacemit.c                    | 655 +++++++++++++++++++++
>>>  drivers/ufs/host/ufs-spacemit.h                    |  77 +++
>>>  5 files changed, 801 insertions(+)
>>> ---
>>> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
>>> change-id: 20260605-08-k3-ufs-support-c8b308e415e2
>>>
>>> Best regards,
>>> --  
>>> Yixun Lan <dlan@kernel.org>
>>>
>>>
>>> _______________________________________________
>>> linux-riscv mailing list
>>> linux-riscv@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>
>> Tested v7 and v8 successfully on Sipeed K3 Pico-ITX (32GiB DRAM / 128GiB
>> UFS model). Build and test methodology:
>>
>> ### build chimera debian-installer with patched mainline kernel
>> ### assume fresh Debian testing "forky" build environment
>>
>> apt update
>> apt install -y b4 bc bison ca-certificates cpio \
>>  crossbuild-essential-riscv64 curl debhelper fakeroot flex kmod \
>>  libdw-dev libssl-dev libssl-dev:riscv64 linux-config-7.2:riscv64 \
>>  python3 rsync
>>
>> curl -L \
>>  https://git.kernel.org/torvalds/t/linux-7.4-rc3.tar.gz \
>>  | tar xz
>>
>> pushd linux-7.4-rc3
>> b4 am -v1 -o- \
>>  https://lore.kernel.org/all/20261115195112.32120-1-e@freeshell.de/ \
>>  | patch -p1
>> b4 am -v5 -P3 -o- \
>>  https://lore.kernel.org/all/20260916-08-k3-ufs-support-v5-0-1f5d71f1027d@kernel.org/ \
>>  | patch -p1
> 
> After applying that patch, you also need to change:
>   clock-names = "axi", "ref";
> into
>   clock-names = "axi", "ref_clk";
> to match the change done in the code in v8.
> 
> [...]
>

I was missing this detail previously. For testing again of v8 I have now
inserted a sed pipe to change this as suggested for the dts application
step of the build procedure:

b4 am -v5 -P3 -o- \
 https://lore.kernel.org/all/20260916-08-k3-ufs-support-v5-0-1f5d71f1027d@kernel.org/ \
 | sed -z 's%\(clock-names = "axi", "\)ref\(";\)%\1ref_clk\2%' \
 | patch -p1

Additionally to the build procedure, since Debian testing now features
linux-config-7.3 and no longer linux-config-7.2, I now substitute
accordingly from linux-config-7.2 to linux-config-7.3

>> I do notice some UFS-related warnings and errors in dmesg:
>>
>> journalctl --dmesg | grep ufshcd
>> ufshcd-spacemit c0e00000.ufshc: freq-table-hz property not specified
>> ufshcd-spacemit c0e00000.ufshc: ufshcd_populate_vreg: Unable to find
>> vdd-hba-supply regulator, assuming enabled
>> ufshcd-spacemit c0e00000.ufshc: ufshcd_populate_vreg: Unable to find
>> vcc-supply regulator, assuming enabled
>> ufshcd-spacemit c0e00000.ufshc: ufshcd_populate_vreg: Unable to find
>> vccq-supply regulator, assuming enabled
>> ufshcd-spacemit c0e00000.ufshc: ufshcd_populate_vreg: Unable to find
>> vccq2-supply regulator, assuming enabled
>> scsi host0: ufshcd
>> ufshcd-spacemit c0e00000.ufshc: ufshcd_scsi_add_wlus: BOOT WLUN not found
> 
> I do have all those messages, I think they are just harmless.
> 
>> ufshcd-spacemit c0e00000.ufshc: DL error event, INT errors:0x4,
>> DL_ERR:0x80000020
> 
> This one looks more worrying. I do not have it when testing. Does it 
> happens immediately or after a while? under load?
> 
> Regards
> Aurelien
> 

$ journalctl --dmesg | grep ufshcd
ufshcd-spacemit c0e00000.ufshc: freq-table-hz property not specified
ufshcd-spacemit c0e00000.ufshc: ufshcd_populate_vreg: Unable to find
vdd-hba-supply regulator, assuming enabled
ufshcd-spacemit c0e00000.ufshc: ufshcd_populate_vreg: Unable to find
vcc-supply regulator, assuming enabled
ufshcd-spacemit c0e00000.ufshc: ufshcd_populate_vreg: Unable to find
vccq-supply regulator, assuming enabled
ufshcd-spacemit c0e00000.ufshc: ufshcd_populate_vreg: Unable to find
vccq2-supply regulator, assuming enabled
scsi host0: ufshcd
ufshcd-spacemit c0e00000.ufshc: ufshcd_scsi_add_wlus: BOOT WLUN not found

I did not again see the DL error event. However, the first attempt to
build Linux does fail:

make[7]: *** [scripts/Makefile.build:572: drivers/gpu/drm] Error 2
make[6]: *** [scripts/Makefile.build:572: drivers/gpu] Error 2
...
make[5]: *** [scripts/Makefile.build:572: drivers] Error 2
make[4]: *** [Makefile:2244: .] Error 2
make[3]: *** [debian/rules:80: build-arch] Error 2
dpkg-buildpackage: error: make -f debian/rules binary subprocess failed
with exit status 2
make[2]: *** [scripts/Makefile.package:126: bindeb-pkg] Error 2
make[1]: *** [/home/es/linux-7.4-rc3/Makefile:1852: bindeb-pkg] Error 2
make: *** [Makefile:248: __sub-make] Error 2

real    188m48.844s
user    1415m17.363s
sys     66m11.932s

Linux is running on the K3 SoC here without clocks preparation from the
bootloader; it is quite slow by comparison to a Linux kernel that
follows clock preparations by the vendor BSP bootloader. Simply
re-running the same "make ..." build command is successful in the same
system without any changes:

  DEPMOD  debian/linux-image-7.4.0-rc3-k3ufs/lib/modules/7.4.0-rc3-k3ufs
...
dpkg-deb: building package 'linux-image-7.4.0-rc3-k3ufs' in
'../linux-image-7.4.0-rc3-k3ufs_7.4.0~rc3-2_riscv64.deb'.
...
real    34m56.794s
user    241m15.511s
sys     18m4.532s

Similar build failures occasionally happen when the root filesystem is
on USB microSD adapter-connected microSD storage. I assume the build
failures with default clocks configuration are not constrained to just
the UFS support series here.

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
