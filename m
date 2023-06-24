Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B654EB64DC
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jun 2023 10:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I17N3wFIM1QSawkIFwp6BUtE74mmGuhto81waFYWjJM=; b=QCG/uHvdhb/amf
	RvKnRaHHgOvL939AWpNDnWrzS3AgeV5cReemgTgeh1HbWEfCwiNeQHur1MrEW8ixPdEScqLk+U6Ie
	epXBw+l8Dg21imQh3iUGCM/oNE05zccuDSRfx81dNeiDP+a4nzODdH2gtfzeGX1HUQR6383D0w3Dy
	erHRPRCf1n5tjWYLhZWwOUvptAo50rcYKDilVRGTi/H4CvCfQJihu7O/GKXaLaEZ2I8yh/81VBbsy
	qDv85AN0n2gOqQ2XQjnxP411AyD2EWT/0yd9jwfLaoF+oiRr7YkrysXt3rqPl1C899UHD9mcOAb4/
	voNPCF+fWJLMC0Ti0lHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qD0Pz-005hgS-2V;
	Sat, 24 Jun 2023 10:22:59 +0000
Received: from out162-62-58-211.mail.qq.com ([162.62.58.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qD0Pw-005hfQ-0f
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jun 2023 10:22:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1687602147; bh=ZPqsBRiD2qdKFt2nVlMfoA1SbLdu/T9qJmjOqN2CHAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JUArZ8ozT/rg2RDioIv2B1MhrjG1VXLBsgdHjvcOx+8AvHsqOUUS7CGmjkDzF4ALm
	 vObAPSRGGRViTAOw6ayaQCRVA9W/6ts8+MN8zZpjUKyWzPbVDiSk/HUgP4HSieR0TL
	 397Amj9J1D6evWKTrfJ92CclNM9oQ1rSzqcgsyhE=
Received: from localhost.localdomain ([240a:42d8:2400:8e2:3982:c8ab:f689:6a24])
	by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
	id 5932A218; Sat, 24 Jun 2023 18:22:19 +0800
X-QQ-mid: xmsmtpt1687602139tyiycog4l
Message-ID: <tencent_817CE182DEDA938E03B848314821098D4408@qq.com>
X-QQ-XMAILINFO: OEUhVsHQax4MuZAT+PUI+KMeFIffDAhIbn+ONyhtlPxiFnj+0X0WnygNB/pViY
	 kyrMZZ4DxzsDvNpI7jzo7iSw1LWSaUR1k2k6MEEhdkKM/7dPOJKqB17AAnR8nPyRSCSiDq8GiCEe
	 OkyS3oGCmwHGaiJdW3yPtT8EacU0GXoaXFmvXet7d0sPiTLNnelvZvXwxbECj1m5EXaulFOW9UYo
	 +0UB+AaicFX4ZWf6qK8bDseSI0ipJURoi+kQl4xEQHT2QNpNS9vTOxWyg94e/bioZVGrF60T4kt/
	 L7gbGJTN9CL+BauLT8MNDZvfHsunPxjUbeeF7sSALwE8vN6Oqe8gxhjNk1Cg5Zsv4Plany4JsYsf
	 VN6BegI8k2/98eZ/qP3l/w2Ieq3MPVfYPkcBD/oGvj4CZtfi443W0v23y6oLJ0i5qWsBi1qzvOZS
	 aAL8uw/TcmCboe7qDezeVsknQbE7AhJuW0OeplrCCWYmjZO548Y95lOA003uLyM981FzYOnUPWXJ
	 JAAb6r0CGATCZ8NkQxJlWbpECWzPNfKszs5hhrzHIgiyxdvY4pPero+Uyybwf1ybWKOGkuuKus9t
	 8u/6KFvDd9zOB3UEpFVU4MiMwUHJcyllspeX8RA2yHHjecqYmjvea9ArgjIlSc38R3dv87l1Be2u
	 DOwpH0d9RbSo5XuoRWMqiPplz/F0o95bEn7EE5TWmxyFWsag8JoxDI2BaHTxUMNQ9X89qRfyo6A6
	 pY7TdGGlYSjWRZFCYjETAqsAqI8dJfboMrtcIB6Vs/IQHALRmqUitn7PCAlWukm+GcDJJ3bSLgki
	 fFSn1URidlLVVDLHoIA9/IRLC1T5lypbGYiwIvtaem706XZ+ucbbGjlYK2A7SLc/cwDfYA4+3wUx
	 GyccTKi0O1uuYKwNy3eZULCw6RKNjO8g4hXPqmLC9tmQXBmji5GkFiAU63DNTEmeEc/MHidSc+A7
	 88iESTzoZSBg7nn/tG3cwjWocoAQSDIP8Y40H/PgWTmYc5tKGnTusPWS1fAPb8Jwmp3aKhR0U=
X-QQ-XMRINFO: Mu10XATLq/IERfXGovp1cJndKWH8Kl+aSQ==
From: Yangyu Chen <cyy@cyyself.name>
To: evan@rivosinc.com
Subject: Re: [PATCH 0/2] RISC-V: Probe for misaligned access speed
Date: Sat, 24 Jun 2023 18:22:19 +0800
X-OQ-MSGID: <20230624102219.3049-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20230623222016.3742145-1-evan@rivosinc.com>
References: <20230623222016.3742145-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_032256_818589_00603C2E 
X-CRM114-Status: UNSURE (   6.19  )
X-CRM114-Notice: Please train this message.
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
Cc: heiko@sntech.de, linux-doc@vger.kernel.org, palmer@rivosinc.com, cyy@cyyself.name, conor.dooley@microchip.com, guoren@kernel.org, jszhang@kernel.org, linux-riscv@lists.infradead.org, corbet@lwn.net, jeeheng.sia@starfivetech.com, masahiroy@kernel.org, greentime.hu@sifive.com, shosie@rivosinc.com, lizhengyu3@huawei.com, ajones@ventanamicro.com, aou@eecs.berkeley.edu, alexghiti@rivosinc.com, samuel@sholland.org, leyfoon.tan@starfivetech.com, paul.walmsley@sifive.com, heiko.stuebner@vrull.eu, apatel@ventanamicro.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org, xianting.tian@linux.alibaba.com, palmer@dabbelt.com, andy.chiu@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

Thanks for doing this. 

On 6/24/23 6:20 AM, Evan Green wrote:
> I don't have a machine where misaligned accesses are slow, but I'd be
> interested to see the results of booting this series if someone did.

I have tested your patches on a 100MHz BigCore rocket-chip with opensbi running on FPGA with 72bit(64bit+ECC) DDR3 1600MHz memory. As the rocket-chip did not support misaligned memory access, every misaligned memory access will trap and emulated by SBI.

Here is the result:

~ # cat /proc/cpuinfo
processor       : 0
hart            : 0
isa             : rv64imafdc
mmu             : sv39
uarch           : sifive,rocket0
mvendorid       : 0x0
marchid         : 0x1
mimpid          : 0x20181004

processor       : 1
hart            : 1
isa             : rv64imafdc
mmu             : sv39
uarch           : sifive,rocket0
mvendorid       : 0x0
marchid         : 0x1
mimpid          : 0x20181004

~ # dmesg | grep Unaligned
[    0.210140] cpu1: Unaligned word copy 0 MB/s, byte copy 38 MB/s, misaligned accesses are slow
[    0.410715] cpu0: Unaligned word copy 0 MB/s, byte copy 35 MB/s, misaligned accesses are slow

Thanks,
Yangyu Chen


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
