Return-Path: <SRS0=7nvN=DM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15358C4363A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 18:41:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 530AF20853
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 18:41:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r+LNc538"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 530AF20853
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7dfNBBdsUUnJNwaIhiPOIVvRwHn06moi2OD9f10Lrn4=; b=r+LNc538GLT5a4afb114LMODG
	CSXBiJ0hl0HDb7ZaQVtMsMSxSuxZgldzKxtjdeZKkbAl/B2tYADOFd9yE6wzasrBccFqTkPw7Vmm5
	iK4UMLJ6d8c/i6ICoIEe4Qa+UmOqOtryv2SEqMaAGXcvZ4axWZK1jUn2As58uVD5pLi6mQERUxpJY
	5UxfmwZliFUJLDQbaZdzije2Vkoyj+R4THJiyVqVJmD2kNGYV/hF7TWzRpB+9CZXT0vKT0GeWXMX5
	l5YhZ5EPNkmUhRg7Ar9GenZH9C9iBmgbMMjGpiGKWZsd/NjojJ7w4X8Zu0hxGysjPxReS9w1UtfO1
	qRqTfYV8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPVPy-0002Og-Tc; Mon, 05 Oct 2020 18:41:02 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPVPw-0002Ni-Gs
 for linux-riscv@lists.infradead.org; Mon, 05 Oct 2020 18:41:01 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4C4qDT3bBpz1qt4L;
 Mon,  5 Oct 2020 20:40:56 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4C4qDS5R48z1r0lS;
 Mon,  5 Oct 2020 20:40:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id dhxAh5FxZBrC; Mon,  5 Oct 2020 20:40:55 +0200 (CEST)
X-Auth-Info: wToZBNEoEF1rWN+IPsWKDZkac8E1RIC382M0Q6fDxQgtEkwRSbB5xQed0w7uOL0i
Received: from igel.home (ppp-46-244-175-195.dynamic.mnet-online.de
 [46.244.175.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon,  5 Oct 2020 20:40:55 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id E303C2C2982; Mon,  5 Oct 2020 20:40:54 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Palmer Dabbelt <palmerdabbelt@google.com>
Subject: Re: [PATCH V2 1/3] riscv: Fixup static_obj() fail
References: <mhng-847e71cf-64bc-464b-8d09-3bcec40aa491@palmerdabbelt-glaptop1>
X-Yow: HOW could a GLASS be YELLING??
Date: Mon, 05 Oct 2020 20:40:54 +0200
In-Reply-To: <mhng-847e71cf-64bc-464b-8d09-3bcec40aa491@palmerdabbelt-glaptop1>
 (Palmer Dabbelt's message of "Mon, 05 Oct 2020 09:39:51 -0700 (PDT)")
Message-ID: <87362stt1l.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_144100_766426_733E7769 
X-CRM114-Status: GOOD (  15.26  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: tycho@tycho.ws, aou@eecs.berkeley.edu, nickhu@andestech.com,
 anup@brainfault.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 guoren@linux.alibaba.com, guoren@kernel.org, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com,
 tglx@linutronix.de, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Okt 05 2020, Palmer Dabbelt wrote:

> On Mon, 05 Oct 2020 01:25:22 PDT (-0700), schwab@linux-m68k.org wrote:
>> On Sep 14 2020, Aurelien Jarno wrote:
>>
>>> How should we proceed to get that fixed in time for 5.9? For the older
>>> branches where it has been backported (so far 5.7 and 5.8), should we
>>> just get that commit reverted instead?
>>
>> Why is this still broken?
>
> Sorry, I hadn't seen this.  I'm not seeing a boot failure on 5.9-rc8 with just
> CONFIG_HARDENED_USERCPOY=y in addition to defconfig (on QEMU, though I doubt
> that's relevant here).

I don't see a boot failure either, but eventually you will get crashes
like this, and resources are not properly released:

[ 4560.936645] usercopy: Kernel memory overwrite attempt detected to kernel text (offset 241626, size 16)!
[ 4560.945324] ------------[ cut here ]------------
[ 4560.949954] kernel BUG at mm/usercopy.c:99!
[ 4560.954030] Kernel BUG [#1]
[ 4560.956805] Modules linked in: nfsv3 nfs_acl rfkill mmc_block sf_pdma i2c_ocores virt_dma spi_sifive uio_pdrv_genirq uio loop drm drm_panel_orientation_quirks rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_resolver nfs lockd grace fscache af_packet mscc macsec macb ptp pps_core phylink of_mdio fixed_phy libphy pwm_sifive mmc_spi crc_itu_t crc7 of_mmc_spi mmc_core spi_bitbang sunrpc sg dm_multipath dm_mod scsi_dh_rdac scsi_dh_emc scsi_dh_alua
[ 4560.995103] CPU: 2 PID: 23806 Comm: nis Not tainted 5.8.10-1-default #1 openSUSE Tumbleweed (unreleased)
[ 4561.004563] epc: ffffffe00036140e ra : ffffffe00036140e sp : ffffffe004bc7d60
[ 4561.011679]  gp : ffffffe00127ee60 tp : ffffffe1b05d0000 t0 : ffffffe001297ca0
[ 4561.018886]  t1 : ffffffe001297c30 t2 : 0000000000000000 s0 : ffffffe004bc7d80
[ 4561.026093]  s1 : ffffffe00003afda a0 : 000000000000005b a1 : ffffffe1f7d67588
[ 4561.033298]  a2 : ffffffe1f7d6c108 a3 : 0000000000000000 a4 : ffffffe000043e80
[ 4561.040506]  a5 : ffffffe1f7d6be80 a6 : 0000000000000144 a7 : 0000000000000000
[ 4561.047712]  s2 : 0000000000000010 s3 : 0000000000000000 s4 : ffffffe00003afea
[ 4561.054918]  s5 : ffffffe1f7e00e80 s6 : 0000002af4a2c2e0 s7 : fffffffffffff000
[ 4561.062124]  s8 : 0000003ffffff000 s9 : ffffffe19f985400 s10: 0000000000000010
[ 4561.069329]  s11: ffffffe1f7e00e80 t3 : 0000000000038fa8 t4 : 0000000000038fa8
[ 4561.076533]  t5 : 0000000000000001 t6 : ffffffe00128e062
[ 4561.081832] status: 0000000200000120 badaddr: 0000000000000000 cause: 0000000000000003
[ 4561.089821] ---[ end trace a7c93e7595e9c2cc ]---
[ 4561.095589] BUG: Bad rss-counter state mm:00000000c54f4c29 type:MM_ANONPAGES val:1

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
