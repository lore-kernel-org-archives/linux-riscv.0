Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30683CD343D
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 05:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c6mKhDrm52NXy3jjteX3S2teQiUbuWX6PyBsTpaUXyo=; b=B7WSJ1fwDbosTq
	60iYvDEjtn7/xvdeKtboYkrul38cpHPB53VAqLDCpS9YMG4d1BU9AATafEXYUkuZVuRxBq9rPiE8+
	q0NC+2bHeDxgrR2slqVwVCsMxnr9osiVbyQ3PoisdA3N5uv0x44ktlc8zM0tmRM7x9GjBBZCKMQ5C
	qjoHekiIvSfrKPe+lXk2RzjKZKdKMx7Q34uHhiF8KRs+fbi6svIFKlzVuid1LKdmOZxgMmaddOzWt
	742qdJ2U2MudIByar3Li2+yYaDbCCUSfK3Rr3SxRoCCEywd0v5FQBJlxE0pUkkFaPHKSyZENo5KRn
	bmAFT+7+Vt+HMaaX9T2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiTLE-00H2xp-0t;
	Tue, 19 Sep 2023 05:32:08 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiTLA-00H2we-0a
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 05:32:06 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 2A9DF24E287;
	Tue, 19 Sep 2023 13:31:29 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 19 Sep
 2023 13:31:29 +0800
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 19 Sep
 2023 13:31:28 +0800
Received: from EXMBX168.cuchost.com ([fe80::1869:e641:8a12:96d6]) by
 EXMBX168.cuchost.com ([fe80::1869:e641:8a12:96d6%16]) with mapi id
 15.00.1497.044; Tue, 19 Sep 2023 13:31:28 +0800
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: Chris Hofstaedtler <chris@hofstaedtler.name>
CC: "aurelien@aurel32.net" <aurelien@aurel32.net>,
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>,
	"davidlt@rivosinc.com" <davidlt@rivosinc.com>, "herbert@gondor.apana.org.au"
	<herbert@gondor.apana.org.au>, "kernel@esmil.dk" <kernel@esmil.dk>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: RE: starfive crypto list_add corruption
Thread-Topic: starfive crypto list_add corruption
Thread-Index: AQHZ2yzjjWDz/x6w9kGlTSbBzWx+s7AEQLcAgAECsiCADtOfAIANpvYw
Date: Tue, 19 Sep 2023 05:31:28 +0000
Message-ID: <50aa501b9aa64d3bad457f4625a17a45@EXMBX168.cuchost.com>
References: <292c90859f2e4135b40307d61488692c@EXMBX168.cuchost.com>
 <24laigwzjtx6scexj5otiesaolgytduhfp7ahqi7hvyhyc4fnv@vc2gqkxnp7v3>
In-Reply-To: <24laigwzjtx6scexj5otiesaolgytduhfp7ahqi7hvyhyc4fnv@vc2gqkxnp7v3>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_223204_525358_8B7E613C 
X-CRM114-Status: GOOD (  13.20  )
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

> > > I got this issue, if I remember correctly, I fixed it by enabling
> > > CONFIG_ARM_AMBA and CONFIG_AMBA_PL08X. It improved things a bit,
> 
> I still see the list_add corruption trace with CONFIG_ARM_AMBA and
> CONFIG_AMBA_PL08X set:
> 

[...]
 
> I also see this panic:
> 
> [    3.558296] jh7110-crypto 16000000.crypto: will run requests pump with
> realtime priority
> [    3.565961] dwmmc_starfive 16020000.mmc: Version ID is 290a
> [    3.566016] dwmmc_starfive 16020000.mmc: DW MMC controller at irq
> 70,32 bit host data width,32 deep fifo
> [    3.574329] cfg80211: Loading compiled-in X.509 certificates for regulatory
> database
> [    3.577585] mmc_host mmc1: card is polling.
> [    3.606327] Unable to handle kernel paging request at virtual address
> ffffffff800fab24
> [    3.820748] Oops [#1]
> [    3.823027] Modules linked in:
> [    3.826090] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W
> 6.5.0zeha3-00072-g385eddf4e78f #6
> [    3.832229] mmc_host mmc1: Bus speed (slot 0) = 49500000Hz (slot req
> 400000Hz, actual 399193HZ div = 62)
> [    3.835566] Hardware name: StarFive VisionFive 2 v1.2A (DT)
> [    3.850595] epc : starfive_rsa_enc_core+0x30/0x116
> [    3.855402]  ra : starfive_rsa_enc+0x5e/0xbc
> [    3.859679] epc : ffffffff8086937a ra : ffffffff808694be sp : ffffffc800023910
> [    3.866898]  gp : ffffffff81723980 tp : ffffffd8c0150000 t0 :
> ffffffd8c22380c8
> [    3.874117]  t1 : 0000000000000000 t2 : 472f9351d07df710 s0 :
> ffffffc800023960
> [    3.881335]  s1 : ffffffd8c013ea80 a0 : ffffffd8c013ea80 a1 :
> 0000000000000001
> [    3.888553]  a2 : 0000010000000000 a3 : ffffffd8c0133c40 a4 :
> 0000000000000002
> [    3.895770]  a5 : ffffffff800fab24 a6 : ffffffd8ff1d6d90 a7 :
> 0000000000000000
> [    3.902988]  s2 : ffffffd8c013ea40 s3 : ffffffd8c2238180 s4 :
> 0000000000000001
> [    3.910206]  s5 : ffffffd8c22380b0 s6 : ffffffd8c0133c40 s7 :
> 00000000000002a8
> [    3.917425]  s8 : ffffffff8114c240 s9 : 000000001f030000 s10:
> 0000000000000001
> [    3.924642]  s11: ffffffd8c0048300 t3 : 0a1255840a4b7df8 t4 :
> 28fc2f2b1f3b4e7d
> [    3.931861]  t5 : e2bb8080e13469b3 t6 : ffffffd8c2238440
> [    3.937170] status: 0000000200000120 badaddr: ffffffff800fab24 cause:
> 000000000000000f
> [    3.945083] [<ffffffff8086937a>] starfive_rsa_enc_core+0x30/0x116
> [    3.951183] [<ffffffff808694be>] starfive_rsa_enc+0x5e/0xbc
> [    3.956762] [<ffffffff8045edc4>] pkcs1pad_verify+0xb2/0xea
> [    3.962256] [<ffffffff8045e21a>] crypto_sig_verify+0xa2/0xd0
> [    3.967919] [<ffffffff8047e8c0>] public_key_verify_signature+0x168/0x1d2
> [    3.974625] [<ffffffff80480018>] x509_check_for_self_signed+0x58/0xa0
> [    3.981071] [<ffffffff8047f486>] x509_cert_parse+0x148/0x19e
> [    3.986735] [<ffffffff8047fd08>] x509_key_preparse+0x20/0x18c
> [    3.992485] [<ffffffff8047d8b4>] asymmetric_key_preparse+0x52/0x86
> [    3.998668] [<ffffffff8044fcb8>] __key_create_or_update+0x16c/0x372
> [    4.004941] [<ffffffff8044fecc>] key_create_or_update+0xe/0x16
> [    4.010780] [<ffffffff8047fc78>] x509_load_certificate_list+0x86/0xf6
> [    4.017226] [<ffffffff80c3a59a>] regulatory_init_db+0x92/0x124
> [    4.023068] [<ffffffff800020f0>] do_one_initcall+0x38/0x17c
> [    4.028646] [<ffffffff80c00f1c>] kernel_init_freeable+0x1a2/0x204
> [    4.034749] [<ffffffff80bb4b56>] kernel_init+0x1e/0x10a
> [    4.039979] [<ffffffff8000336a>] ret_from_fork+0xa/0x1c
> [    4.045218] Code: 0205 84aa 8a2e 000f 0140 3783 030b 4709 8793 4007
> (c398) 2783
> [    4.052715] ---[ end trace 0000000000000000 ]---
> [    4.057339] Kernel panic - not syncing: Attempted to kill init!
> exitcode=0x0000000b
> [    4.064990] SMP: stopping secondary CPUs
> [    4.068927] ---[ end Kernel panic - not syncing: Attempted to kill init!
> exitcode=0x0000000b ]---
> 
> Maybe this can also be investigated.

Is there a guide/wiki to compile a fedora-riscv image for VF2 board?
I'll will try reproducing and fix these issues on my side.

Thanks
Jia Jie
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
