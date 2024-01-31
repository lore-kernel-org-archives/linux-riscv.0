Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A67C4828F
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 11:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c3ALDkOVq/OPa4y/0E3+b2gDDXYCZiYCZSblP+y/Ows=; b=m5TVltMdAwVkkV
	QdxqGFHLUjIosnxhN1CH62hZHWbSSQuD0U/k9yAE3aHKhtJxdg5Xlo+upqP4x1ymIif76VHfOpBqU
	W12C2c6PgPJgFiqEm6dlITjmBOMOFcid1Uxj6K/9s1T/69DYN+WTdBzQgqldodnc4vZGCjmqCxO7B
	OFOTVW4CUXOGT765+nuKBaDf6fy7JweHx1IxhTJDAfyku2wTWfxGD8VI4gv2wuL8Q4K4EkBzS5G3m
	niAEf3edfo1MlU7Y/Lk/g9VBodHPG8Mr/9bPOTB/zxT4euqUTjA4gVx2A71clc6VFsaaIM1m0XqUu
	WtSQ64mOjrZP7ABqWxDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8oh-000000036tg-3FRM;
	Wed, 31 Jan 2024 11:31:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV6fG-00000002NJ2-2Zjy
	for linux-riscv@bombadil.infradead.org;
	Wed, 31 Jan 2024 09:13:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NKyQ+NYmyEORjEVLOILCupdU78jh7B5uEXwcPzogYDs=; b=Hq1nX4B0mt9ow3dIXbzyeR1cKz
	3oCABu14iBujT/HWzctX23PaSyImkNrHPY1yQblDGVQx6tuciIl+z4ro/MQkqKcMAxsgsWOv5WIg5
	jmxT3j6AH+yzmMRBSRoDCuHG9iFM/8Y58KPliqVoWxVMmMcq8IY+Oc1nuZamzdww0xQqXey5ow1HA
	f2ccFyq+xB76bnuTJHLpykN9DDzBHW3F1BxCNe+iEp56Dxxti8DrcZytV0KlOzQ8ifZlUdZbys9ab
	xENlpCtRYWFONpKjGKlOtgHUwSdyaSgFWcEj6ZkdsTc7rKvbSm5D8dS5OVSp8gF1eFzFZakzaP1GK
	zOqzHh6Q==;
Received: from mailgate.ics.forth.gr ([139.91.1.2])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV6f3-00000008td8-0eiX
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 09:13:45 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
	by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id 40V9DIPF038023
	for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 11:13:18 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
	q=dns/txt; i=@ics.forth.gr; t=1706692393; x=1709284393;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IYBTdJHKQ0RVYWFXR/QOfnk02aGGwsRpeoUxX3/R4y0=;
	b=lEQNI/0CXmtnIz2NGH/I5yO76PaRxkPFR6Ka1hgItKC9NSsc6jE1z/SfGA9hRKe+
	sxIfhFTunHRgGHci7LCfoc/I7089WqQieB7034iqvirwnJ5ouVAm2NFNvuSNYaXa
	QP9qOT1GzyuJC3GhkO1NvF/7/w70XDW16/idaguVVOx11+aIYiicZ1A6SpTauYsf
	YdWYQR7BEsDK4JDAXqSbype2IeuadZEKkhc+d/Ufnr62lxwf81NlUQex+UyFcksJ
	2lM5d2FhUd7+G/f6zCXbI/nKA7XtR3RUNJ0zGgNUA6QW5jeDx466iTfCmyb+1F4P
	RCZjTbXL5KF0FzSsBe9GcA==;
X-AuditID: 8b5b014d-a23ec70000002178-e3-65ba0f2980c1
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
	by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id E3.0B.08568.92F0AB56; Wed, 31 Jan 2024 11:13:13 +0200 (EET)
X-ICS-AUTH-INFO: Authenticated user: mick at ics.forth.gr
Message-ID: <ee1c316d-5bfd-4a5f-8e44-04a7c6f31b81@ics.forth.gr>
Date: Wed, 31 Jan 2024 11:13:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] riscv: optimized memmove
Content-Language: el-GR, en-US
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Matteo Croce <mcroce@microsoft.com>, kernel test robot <lkp@intel.com>
References: <20240128111013.2450-1-jszhang@kernel.org>
 <20240128111013.2450-3-jszhang@kernel.org>
 <fa36b871-43d7-413c-82a2-0ecc0ebce9b4@ics.forth.gr>
 <Zbj1o6VAsk8Tn2ab@xhacker>
 <c6066469-7bc9-4232-b600-0b167193f13f@ics.forth.gr>
 <ZbnZthTjiUArHIvq@xhacker>
From: Nick Kossifidis <mick@ics.forth.gr>
In-Reply-To: <ZbnZthTjiUArHIvq@xhacker>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGLMWRmVeSWpSXmKPExsXSHT1dWVeTf1eqwdceToutv2exWzQfW89m
	cXnXHDaLbZ9b2CxeNT9is/j76z+rxcvLPcwWbbP4HTg83rx8yeJxuOMLu8fiPS+ZPDat6mTz
	2Lyk3qN1x192j0vN19k9Pm+SC+CI4rJJSc3JLEst0rdL4Mr49uwDc8F53oqe3RfYGhjbuLsY
	OTkkBEwkTj9pZ+pi5OIQEjjCKHHl4A4WiISlxOZPL4FsDg5eAXuJlqYSkDCLgKrEnh2H2UBs
	XgFBiZMzn4CViwrIS9y/NYMdpFxYwFBi9+1KkDCzgJzE+2fbWUFsEQE1iV/7HoOtYhaYxiSx
	/U4T1N5OJok9C7cyglSxCWhKzL90EGwvp4C6xJb1jhCDzCS6tnYxQtjyEtvfzmGewCgwC8kZ
	s5Dsm4WkZRaSlgWMLKsYBRLLjPUyk4v10vKLSjL00os2MYKjgtF3B+PtzW/1DjEycTAeYpTg
	YFYS4V0ptzNViDclsbIqtSg/vqg0J7X4EKM0B4uSOO8J2wXJQgLpiSWp2ampBalFMFkmDk6p
	Bqa2R4WLL4vtfKhg/HW5/JRZs2r5n4XPrbs/6+iiZRmZGi78wm+numxcFnXGwNThI2sox4Vj
	xxbvsHM2+C/25ajMwy1daese3OmaM/mRssql4+6zXh7+qnFKxO4997yuJY66YSayTDfXd/lx
	PpsRkaM7Y1Gny71/oX47ji6KDJ9+bv6jxYoq1+1u7Hj4MEvy2ESBmCtHaldlVpZN0Gfu0NV+
	/fSz+iK7QPM/TPO35rUnW7keWyJvuO5LsdTSuZoX5/7hMa5d7Fmu88D6kn8/bz6PebeQ8I1Y
	4ccSFmfzZlh6Lw7RubVUrjni/Ybn76/KB3++rHCKZWmr6La428+ONp3JCHmRssjC627W0fu3
	Nv6/r8RSnJFoqMVcVJwIACQyWkH5AgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_091341_037872_0FB11D56 
X-CRM114-Status: GOOD (  15.91  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 1/31/24 07:25, Jisheng Zhang wrote:
> 
> I didn't have c99 spec in hand, but I found gcc explanations about
> restrict keyword from [1]:
> 
> "the restrict declaration promises that the code will not access that
> object in any other way--only through p."
> 
> So if there's overlap in memcpy, then it contradicts the restrict
> implication.
> 
> [1] https://www.gnu.org/software/c-intro-and-ref/manual/html_node/restrict-Pointers.html
> 
The union used in the code also contradicts this. BTW the restrict 
qualifier isn't used in kernel's lib/string.c nor in the current 
implementation 
(https://elixir.bootlin.com/linux/latest/source/arch/riscv/include/asm/string.h#L16).

> And from the manual, if the memcpy users must ensure "The memory areas
> must not overlap." So I think all linux kernel's memcpy implementations(only copy
> fw and don't take overlap into consideration) are right.
> 
> I did see the alias-memcpy-as-memmove in some libc implementations, but
> this is not the style in current kernel's implementations.
> 
> Given current riscv asm implementation also doesn't do the alias and
> copy-fw only, and this series improves performance and doesn't introduce the
> Is it better to divide this into two steps: Firstly, merge this series
> if there's no obvious bug; secondly, do the alias as you suggested,
> since you have a basic implementation, you could even submit your patch
> ;) What do you think about this two steps solution?
> 

I still don't understand why you prefer undefined behavior over just 
aliasing memcpy to memmove. Anyway, do as you wish, I don't have time to 
work on this unfortunately. Feel free to use the code I shared for bw 
copy etc.

Regards,
Nick


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
