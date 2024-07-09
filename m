Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E4AC3DA41
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 12:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fIsmhAiCO/DfskiA5J347b5qkegGhaLk9pFkU5yT/hQ=; b=imtqu2wkW1YRm88Omg6z6uZTXD
	fTICty2qtsXktIl2K6sxVgMwtjAyf90crca5S3UH6/+xpSF9WgALj3VvjeC0oDHDjrSx8hYGDgltk
	Q41d4jZNAweT5Ep4F6VQx1G6FTLmrTx/KQIViKcC+sWJOgIDbQ8QEk5aqOcbsOi4FlrgF6n3kfE6k
	cvoDb92FlNLQnaNM72fo2o80PiQ1mFaRvrrYBkhx2ndaiuYzpzVfXK3m91g6smqHM2Lvh7ep8Ca0X
	qcYbJJ/M4CO48Dtn0F9SBtKYTybGS4y1vuFgLAImNSypYk6/7oEBseiqk6Jk4e25H0NLKEVdKIHqU
	GPHr5k9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR9wr-000000077r5-45Ti;
	Tue, 09 Jul 2024 12:27:57 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR9wa-000000077ng-2cM1;
	Tue, 09 Jul 2024 12:27:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1720527976; x=1721132776; i=wahrenst@gmx.net;
	bh=cCtoGEQ65O0NQHMFrW3/EWkn5s4oTQM/d6IPIcz9pxI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=iNEPb9BLGGngXSVlaV2Y5yqu2HXBUZ6ee4wlyeD4jUnl2jxZ3ROfuIaToeyDEeaM
	 ChamxzSRAioqbTQp8qQsUWRZx6LYO2U4TDkJ2WguyL4GeMnS/G2WPcVCWu60zPjyP
	 Vh4/Emn2CN8ZA9ZeReLL81xDo9eDREYSO5sUWQ54kuTiOBFZDGu7jfGWwBGdQDeDh
	 P0LxqK8Qz8LN6ipLHH2iWKLgibppHN4KyaWtS/AgeoRMD1HZazIRu9s+vhbCnSVFp
	 ziqSVnQ3zw9fnW13Q/cp2MCcrQip9PwUViOvp5M446wjyEbd+U4sBFRiCJlvYbaYo
	 HGiM5AnAtFWbi3GPFw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVN6t-1sqlVn12E3-00Oj39; Tue, 09
 Jul 2024 14:26:16 +0200
Message-ID: <6b7cfe69-4f72-490f-8e86-5343bd244a2d@gmx.net>
Date: Tue, 9 Jul 2024 14:26:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm: defconfig: drop RT_GROUP_SCHED=y from
 bcm2855/tegra/omap2plus
To: Kevin Hilman <khilman@kernel.org>, Celeste Liu
 <coelacanthushex@gmail.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
References: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
 <20240530111947.549474-14-CoelacanthusHex@gmail.com>
 <7hv81f78cy.fsf@baylibre.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <7hv81f78cy.fsf@baylibre.com>
X-Provags-ID: V03:K1:Ej+PAwp/ZJkhkceEoIwv6AInmRQiACjrvJFoir5Nuj9E1MJRvQA
 hCU1+y5KPH/WQUoUAj38tdnqg1TsI3WE3557l+L+5Zlw+pyx5u7oihbFKJ0II0kgo4eAkC9
 Qtrhsw6GW7j6n1LaLGg2lE46GZtD/AMneN85Q7N1yqHtfnzmF3zlp8522hgdV6zM7JOCk4j
 tUDmMBQyL0KKRh3tZUkgw==
UI-OutboundReport: notjunk:1;M01:P0:CY3hoQ/VQPY=;5QGFpAHuDX4v0nW4bbrXMcvM2hK
 vYnqvDsWKbcvHPlHjyAu1B7NjXCCKdEydnIkCb02e/O9SFu11zoROqN2443E6DETn+pRJ/ATw
 uC75juahlmOdRef/GIWmgUOF89ZxlNpamUGSRJMbcc/7acV3tyktqOTmeJxlUGm/SM9VqT22Y
 KZP+hHsXJbOD66Y88uvexJJ/bXGM6qzGenJ/FFefNIFQvSg81Mdj0TsYkE44jjuXFP6HOzvR7
 sfK3tUSSa+VOVUCpuVLM/CT9tqP1ebBVbGW8i2F2iJ7ZCF+Abffzz7W0YklTXbVDGZYVtqr6B
 wU4xb4LGpbV+YuwE/Z6CVBsgXktSUuccyUQNSue62AT4J9eibvy9Fg2PZvseBR0pFd8th3MdM
 uAJzeRXqbTBGFlDwJkm836FDmGIeSgXZqToBqD7eb9BKLbEvtEApMusg+8DNNanWvdGfsZqB/
 c/331otTYafTSC5+1UB2wPRsM9VvslvEU1EfZiIJBv2wiWFvAvSrsHoi5ueZYYmqPhfLTCaxF
 IDCbOQZKrbP/vbwSNwJZjo5ew3oOyDqL/o6yn4+Zp6zOM7nXI1D3bvIrxJCrK5gBDnttyqe/E
 bmiYbnssNvUEE7+bNEQ/MPt7xIsDe1kHCOeyFM5/vQeRHncgpuJ10i2uKdpGevOSohr3ghao6
 9oj5jIeHgymEcQEZGDQeesjnPjhwreNbaW2YOd8FW1J8+MQKDdmNUo+Lo/iNHgTBrMtuB3Qil
 xzpqw3ifkOFSoOTrRRPfJ7EZGae7oJ7+jq0FHgCMSeUnAXDBRyAAVyYmc+ks93Us7II8klNBI
 aa5PFxwJb0lP/7+bdAbJrFmCfqj7iq087cOKXyG81KDIw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_052740_990160_EC86D649 
X-CRM114-Status: GOOD (  12.45  )
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
Cc: Rich Felker <dalias@libc.org>, loongarch@lists.linux.dev, linux-sh@vger.kernel.org, Tony Lindgren <tony@atomide.com>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Palmer Dabbelt <palmer@rivosinc.com>, linux-mips@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Guo Ren <guoren@kernel.org>, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, Sven Joachim <svenjoac@gmx.de>, Mykola Lysenko <mykolal@fb.com>, =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michael Ellerman <mpe@ellerman.id.au>, Gregory CLEMENT <gregory.clement@bootlin.com>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, Jonathan Hunter <jonathanh@nvidia.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Nicholas Piggin <npiggin@gmail.com>, linux-rpi-kernel@lists.infradead.org, Lennart Poettering <lennart@poettering.net>, Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, WANG Xuerui <kernel@xen0n.name>, linux-kernel@vger.kernel.org, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Anup Patel <anup@brainfault.org>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Celeste,

there is a typo in the subject line

s/bcm2855/bcm2835

Am 09.07.24 um 01:49 schrieb Kevin Hilman:
> Celeste Liu <coelacanthushex@gmail.com> writes:
>
>> Commit 673ce00c5d6c ("ARM: omap2plus_defconfig: Add support for distros
>> with systemd") said it's because of recommendation from systemd. But
>> systemd changed their recommendation later.[1]
>>
>> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
>> needs an RT budget assigned, otherwise the processes in it will not be able to
>> get RT at all. The problem with RT group scheduling is that it requires the
>> budget assigned but there's no way we could assign a default budget, since the
>> values to assign are both upper and lower time limits, are absolute, and need to
>> be sum up to < 1 for each individal cgroup. That means we cannot really come up
>> with values that would work by default in the general case.[2]
>>
>> For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
>> can only be enabled when all RT processes are in the root cgroup. But it will
>> lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.
>>
>> Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
>> support it.
>>
>> [1]: https://github.com/systemd/systemd/commit/f4e74be1856b3ac058acbf1be321c31d5299f69f
>> [2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
>>
>> Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
>> ---
>>   arch/arm/configs/bcm2835_defconfig   | 1 -
>>   arch/arm/configs/omap2plus_defconfig | 1 -
>>   arch/arm/configs/tegra_defconfig     | 1 -
> For omap2plus_defconfig:
>
> Acked-by: Kevin Hilman <khilman@baylibre.com>
>
>
For bcm2835_defconfig:

Tested-by: Stefan Wahren <wahrenst@gmx.net>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
