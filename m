Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522BFC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Apr 2022 02:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tcc03foF+YROptThN5/Cb3G0dNll3M0lh0sNebaM6cA=; b=IdvLmTdN2YU5Ea
	3ixBMQw4RcJNCSUHKJJlhFNlAVJgLCFYbxMhT09PLHShkhTJlinINq1euKme9ZSezYi4xW4OCr6eP
	q2/rqC6+qMHemmEJoILEbrCm0RNdA3o0CZWR3xycZaISrNLz9P0Dqi6i5hYoOfOYuCG00M8S65UII
	tWEIFOeEJaFKVxQM9YFVove3RcLM+eqEH2huuwH+GJrWUzuvAtw7W40yoL4ZL/JTdHsyIhs+cZwV0
	lD0u8FDrTtI9gt839JWcfn9L2dn5KqjHcG8vClvyHHFNZECU6ptDY2xyNJOudhaqu1PU8yNptUmGW
	qENY0zv4ze8xdj7W/HgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfBUC-0085BI-S9; Fri, 15 Apr 2022 02:15:00 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfBU8-00859k-9b
 for linux-riscv@lists.infradead.org; Fri, 15 Apr 2022 02:14:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649988896; x=1681524896;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WhFCPjpcY73NOr+2vy/xILbKOpm8U3lMJb79Q6mDq7Q=;
 b=ngzHZJjEhdtLKqz4rITWWoTPqfsQFN4buZLet0NzdAlO5Vfi4RZn640e
 W/ZMQl4dR3C0PFJKyoUO5QhmW+hSUaORePGyzajALHsvCR1uYW5jFQdGw
 XcJeceS++Hi4i7S0xLjc6EN0+tHL9Wh0VGpKmjWAY2v5ELsCM3gfIekFn
 ca65Z1oG90GI++q7m6bzP9ZauLJgRelHqk7vzTATT23//LoOJ6UcCB+lj
 4nlUjC8BBptW8PXf1P4b8rOiSZDAgxuvekST+VOkjx/HBa8PJWbrXShM3
 FcO4K6Wvs0pbqE7akFmNQfN4gQRXCp1YpCSb8OUUKGcuK5ov2aI5mkgZ0 Q==;
X-IronPort-AV: E=Sophos;i="5.90,261,1643644800"; d="scan'208";a="302152819"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2022 10:14:52 +0800
IronPort-SDR: mqALAGFMVdHevuLEvSpltn6yqR2LKbcdlip5v+27lqSE9lKo7HkvROTS5pX9KMPmQK3fD5pDP4
 5139O8QRs/DMVpXalH91pDUoc7RNwrPKKa5Ca1xcA/1jXK/+WpMjV/I8C15AOGWJbTxclfAOCE
 +qHm43NAZDAsKxoEK0jWD71bqZ36szbNAWP2sN8FFQOsZu2EX5VZjisnEgJM19A+gza2Bh/lji
 UOauFGcccaSXpX3cLYYgOzgXIqDP0niyVbYmYBNXD3e2MhQ3Cb/H2hAyKAS+RzpDWKKlKuwXFB
 QvUW1zqb2JD9MGYkGXlgOAQJ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Apr 2022 18:46:03 -0700
IronPort-SDR: KJoVoqzTmTH3EPpa4lwbcTrivBbXrEQGRgBvq8dgV9fFkmb3R+6QR/FoJL28yY4HwcEU6XmebN
 1t8XBjBo3t5umyeghbRqid4H3i6FkQIYSytIhxXCJCU/WBKmXLYCvSLO2g9tpB4KGPGW4O6pKE
 rgeWz/wgD0C3N5em0QxdEYM6BGfH9Me759ocZmqXRiMq3BqqXtwdzlIoYlCnoHR0uKamYUhg/F
 ZVS+8dLtzrUV7JO3nnTPLhkvU8jkyFYkAMJEYKP9AuzCbMSBmuX+sUaUGH67h8Q5wpbHLeN/+a
 xpA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Apr 2022 19:14:53 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Kffzb3jvVz1SVnx
 for <linux-riscv@lists.infradead.org>; Thu, 14 Apr 2022 19:14:51 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1649988890; x=1652580891; bh=WhFCPjpcY73NOr+2vy/xILbKOpm8U3lMJb7
 9Q6mDq7Q=; b=Je/KTCSORMEIBsQ9wzBGLn5Wo3UMd7sE2lFIN5Rq985Iji1IXPo
 iCJAyaGCoha060/PbFVDMlRHJdhkSml8b/ir9aQH0DW7YizZa4FJ8QHNCOYppqNh
 jQlNFP3Xr0a0A/TeSI4Ho9yv9ik71juA9gPCZuqPfgjxiQk1HuRcSJHExbup/3rQ
 vUvoOoSHzb37h6QKTl1KAxr5rWJR97jWSIwd3cllkfiVUVboU+58h0RwM9e4gH2Y
 PZ5Ft3VsQheRqzXZAu0A8Ri+FeNfH1qm5fjisfcTFrSmit2G6RwzCUgXvyBEzhoB
 HCjDVfmcMu9bKJ8hWcwmN7thSnoedePTA9g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id plsGFvjbLJTD for <linux-riscv@lists.infradead.org>;
 Thu, 14 Apr 2022 19:14:50 -0700 (PDT)
Received: from [10.225.163.9] (unknown [10.225.163.9])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KffzX2zWTz1Rvlx;
 Thu, 14 Apr 2022 19:14:48 -0700 (PDT)
Message-ID: <1ad275e2-8c7b-4b13-06f2-e2be13155185@opensource.wdc.com>
Date: Fri, 15 Apr 2022 11:14:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] binfmt_flat: do not stop relocating GOT entries
 prematurely on riscv
Content-Language: en-US
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Greg Ungerer <gerg@linux-m68k.org>, Mike Frysinger <vapier@gentoo.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <20220414091018.896737-1-niklas.cassel@wdc.com>
 <f379cb56-6ff5-f256-d5f2-3718a47e976d@opensource.wdc.com>
 <Yli8voX7hw3EZ7E/@x1-carbon>
 <6ee62ced-7a49-be56-442d-ba012782b8e2@opensource.wdc.com>
 <YljFiLqPHemB/u77@x1-carbon>
 <9a9a4dcf-0ea1-01ac-d599-16c10b547beb@opensource.wdc.com>
 <YljUWpq42t1gQFRf@x1-carbon>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <YljUWpq42t1gQFRf@x1-carbon>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_191456_423777_8C04626C 
X-CRM114-Status: GOOD (  29.75  )
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

On 4/15/22 11:11, Niklas Cassel wrote:
> On Fri, Apr 15, 2022 at 10:13:31AM +0900, Damien Le Moal wrote:
>> On 4/15/22 10:08, Niklas Cassel wrote:
>>> On Fri, Apr 15, 2022 at 09:56:38AM +0900, Damien Le Moal wrote:
>>>> On 4/15/22 09:30, Niklas Cassel wrote:
>>>>> On Fri, Apr 15, 2022 at 08:51:27AM +0900, Damien Le Moal wrote:
>>>>>> On 4/14/22 18:10, Niklas Cassel wrote:
>>>
>>> (snip)
>>>
>>>> So if we are sure that we can just skip the first 16B/8B for riscv, I
>>>> would not bother checking the header content. But as mentioned, the
>>>> current code is fine too.
>>>
>>> That was my point, I'm not sure that we can be sure that we can always
>>> skip it in the future. E.g. if the elf2flt linker script decides to swap
>>> the order of .got and .got.plt for some random reason in the future,
>>> we would skip data that really should have been relocated.
>>
>> Good point. Your current patch is indeed better then. BUT that would also
>> mean that the skip header function needs to be called inside the loop
>> then, no ? If the section orders are reversed, we would still need to skip
>> that header in the middle of the relocation loop...
> 
> So this is theoretical, but if the sections were swapped in the linker
> script, and we have the patch in $subject applied, we will not skip data
> that needs to be relocated. But after relocating all the entries in the
> .got section we will still break too early, if we actually had any
> .got.plt entries after the .got.plt header. The .got.plt entries would
> not get relocated.
> 
> However, the elf2flt maintainer explicitly asked ut to fix the kernel or
> binutils, so that they can continue using the exact same linker script
> that it has been using forever. (And we shouldn't need to change binutils
> just for the bFLT format.)
> 
> So the chance that the linker script changes in practice is really small.
> (This .got.plt vs .got hasn't changed in 19 years.)
> 
> But if it does, we will just have one problem instead of two :)
> However, I think that applying this patch is sufficient for now,
> since it makes the code work with the existing elf2flt linker script.
> 
> Adapting the code to also handle this theoretical layout of the linker
> script would just complicate things even more. I'm not even sure if we
> would be able to handle this case, since the information about the .got
> and .got.plt section sizes is lost once the ELF has been converted to
> bFLT.

OK. All good then.
I maintain my reviewed-by tag :)



-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
