Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67286C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Apr 2022 23:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=//kvbgbZ2PoWlji7L/u2Nf/q3jMR64YfqVebOgtFj6A=; b=zUbpH1NqxAKiKD
	aQWbElA/CEgMfzoi4IsanoY+Ii/UygqCwHEpbPewAM5K42IbWjsZQKlYOoQWLKO5jE3xkkbr4J6Zd
	3RCRUxGNpmT83Y/pw2ZcyFj3H8DLqrxRjNeKJdnC6kkqroF3A8A5XMh+C9A1f/gz0DlP17WAvFDIl
	WA8eyI+LDC5E6mRsHv7DCnxup0t9m33x86jMlsUivLP4vrOUUG2HI4x5JdBBPIrRR78H5cd7jfZ0a
	Wcs1oqvcCKw4TK5RHzoqHPdInKSVfOVHnxRQeTdp8YyxcVJLf3qt28S8kjzAaN8j/h/0JCkfioxAD
	RCv735/sR7f2SrcV4hxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbWDR-00Gh6k-Uw; Mon, 04 Apr 2022 23:34:33 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbWDO-00Gh5b-IB
 for linux-riscv@lists.infradead.org; Mon, 04 Apr 2022 23:34:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649115270; x=1680651270;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+5MMmPyU6ZJJ0lTiy81U+nJ/FsY36S456cHlcxHKPSc=;
 b=mJWyRjYFbc/VyZM6MyYXc9lGHn9T1eSwjcf6CeCcrJSet+b6+rI5TdYl
 0viSP3sPTKOyep4m+yMLPZHt4CIigzvtXwl2C3shtDYafyKAwMM1OKy/+
 yBc+idoXOqrZ5pCCwTIBxah5RGGnkR5DpVNwMo1WWNBApk2WuaEaZLxmW
 yY30Xh0xznYS6/U6oD951M+fiE5kRWVREr54jVvccqNxP5jJkNhgNfBXp
 Quli4W+N/hJ2YVujJTNGdUEOQvc6hULwHxUz9bwAmMvdRmhhC4rHTiHws
 U8qeEbQ3kBMZ0Rlj3PEdRY3EblId11G/g76rYMtmUies8FGlh2y8Ac3oG g==;
X-IronPort-AV: E=Sophos;i="5.90,235,1643644800"; d="scan'208";a="197084032"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 05 Apr 2022 07:34:28 +0800
IronPort-SDR: jczkTfjaqolA7lOeel+1p7vB/YyFcwpXyr8kTREL1JlH/wnTod6YfxX6KTVz21GmM/O4oUCGIR
 ffUrvz7svUq+hW/nONQYzGHPcuBvtdbD/E6QKoPhloH315Vpla8tT5SGGujamintjuM+P3snYt
 W4Y97S9jFvAZO189TJTo2NOIQkTPAoAO91X4PF3Dq+pNljC880Ud2Nd6Z23ojt5VZOmYpcs4Uw
 IhEJALPUsPgo0mtSNmCkaQA/kehCSr3qTDAA49lD4MFCS8HZSxey/eTCQuaI7hf4shlEmsm3Av
 sS7nQfXeVPlo41ePJCInv2Z6
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2022 16:06:00 -0700
IronPort-SDR: j9hKbCF8GPI8d+YAWWfZfztMz6suZhqOx9vj81C10UqlzcmTWn/+/s+RFoECybLDjr/jhRhQ/r
 AdC0/B6aH/JxMMDTUvjuW9qV9TXcY/88oBWvlzxDKmjFMnJH/o/4G6WMEWa/4vVYf51djGZM3g
 wymZdMI4AKTrVQOfbPd3CHLL+d0O75EC6gKSj+J7Oo5IusUISDnhLVyIHssMLRc0nioFA/m1a3
 rpkHIUu74J2nBX6p0wRxn1pxrzazujVoa4VlTMG+Vn4wh7oGqDrxYU/AD0Ox6W2334SHF8+rKi
 U8c=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2022 16:34:26 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KXRv54Zmhz1SVp2
 for <linux-riscv@lists.infradead.org>; Mon,  4 Apr 2022 16:34:25 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1649115264; x=1651707265; bh=+5MMmPyU6ZJJ0lTiy81U+nJ/FsY36S456cH
 lcxHKPSc=; b=NmXGSpihtKJypsJDwlOSBugs5bzoYpMuuBDgh/oBqIn+/Eb8mMq
 lI6D/MptbIBjXUVDl/UMgUaRdw4yZZvwum/7IJjbVyOrmgTT+k/7Pf/TIW2Szu6k
 gc7mfbb8PoLSzmV7Wh2r1w3TskdGFURxSc8XADmTZENiyab6u+3Ep2eTIOdqdSF6
 NWkS2OD25F1vSAjy1UWzi5Cy3L1OuNi1q6ge7xGAumKL2x02HwBUCiLi9eXMfRNm
 SiZfFUOR8TizSU1svfJKmtFfvy1CHmvgomNA5aLGazPZojpQLhdHYFwFf34/zQHz
 XYUG2Wmpho9kURuveUVhewHi9fGM2cECXOw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id pwFzErMkOE9n for <linux-riscv@lists.infradead.org>;
 Mon,  4 Apr 2022 16:34:24 -0700 (PDT)
Received: from [10.225.163.2] (unknown [10.225.163.2])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KXRv20dN1z1Rvlx;
 Mon,  4 Apr 2022 16:34:21 -0700 (PDT)
Message-ID: <5245096f-6003-39a9-6e5e-db2fc4f567fd@opensource.wdc.com>
Date: Tue, 5 Apr 2022 08:34:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PULL] remove arch/h8300
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 "moderated list:H8/300 ARCHITECTURE"
 <uclinux-h8-devel@lists.sourceforge.jp>,
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Linux-sh list <linux-sh@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Rich Felker <dalias@libc.org>
References: <Yib9F5SqKda/nH9c@infradead.org>
 <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org>
 <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <CAMuHMdWcg+171ggdVC4gwbQ=RUf+cYrX3o9uSpDxo-XXEJ5Qgw@mail.gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <CAMuHMdWcg+171ggdVC4gwbQ=RUf+cYrX3o9uSpDxo-XXEJ5Qgw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_163430_636475_517711BD 
X-CRM114-Status: GOOD (  23.62  )
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

On 4/4/22 22:22, Geert Uytterhoeven wrote:
> Hi Arnd,
> 
> On Mon, Apr 4, 2022 at 3:09 PM Arnd Bergmann <arnd@arndb.de> wrote:
>> On Sun, Apr 3, 2022 at 2:43 PM Christoph Hellwig <hch@infradead.org> wrote:
>>> On Tue, Mar 08, 2022 at 09:19:16AM +0100, Arnd Bergmann wrote:
>>>> If there are no other objections, I'll just queue this up for 5.18 in
>>>> the asm-generic
>>>> tree along with the nds32 removal.
>>>
>>> So it is the last day of te merge window and arch/h8300 is till there.
>>> And checking nw the removal has also not made it to linux-next.  Looks
>>> like it is so stale that even the removal gets ignored :(
>>
>> I was really hoping that someone else would at least comment.
> 
> Doh, I hadn't seen this patch before ;-)
> Nevertheless, I do not have access to H8/300 hardware.
> 
>> 3. arch/sh j2 support was added in 2016 and doesn't see a lot of
>> changes, but I think
>>     Rich still cares about it and wants to add J32 support (with MMU)
>> in the future
> 
> Yep, when the SH4 patents will have expired.
> I believe that's planned for 2016 (Islamic calendar? ;-)
> 
> BTW, the unresponsiveness of the SH maintainers is also annoying.
> Patches are sent to the list (sometimes multiple people are solving
> the same recurring issue), but ignored.
> 
> Anyway, I do regular boot tests on SH4.
> 
>> 5. K210 was added in 2020. I assume you still want to keep it.
> 
> FTR, I do regular boot tests on K210.

FYI, we identified the problem that makes userspace execution unreliable.
Working on a fix.


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
