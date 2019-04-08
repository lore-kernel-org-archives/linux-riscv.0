Return-Path: <SRS0=Pyjh=SK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C88C282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  8 Apr 2019 06:51:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53EDE20870
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  8 Apr 2019 06:51:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rt1EhfZ1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Cauuls9x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53EDE20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gAwAm/8pXS3BJr2GQFVaIBlab8/Q95MSrNIfioXi9Vk=; b=rt1EhfZ1nRGm2jhhVSmBjl2CZ
	aZqRFToKRPw1bui6VU3ANX0XqBfChjxvJK4qexB8Yzq4Ub2zZ2weThsPfm+rBLbLuRKgQezVCqMGO
	jWe1cCU09TKZceot+AXWpClcdeejI0pEoyTfwkR0HEBltrjA5qjeVoZxT4GaibIRY2WzW7FRCdY3l
	1iNu7TweipXgkCIpTkSSez6HXQJgN1BK5XrNmIwDUZSrJcuFP/u49/jcmC3C2dc/z8Kyqf93Q2W+g
	U+4W5RoWvo9XdQWdZs5j1yVOKhWO53QG6dnQ+L3TeeQM5ZOrOwXMezbAU06dd2W0tuyBRxrFJAvDQ
	NRY5TsWrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDO7b-0004jP-S4; Mon, 08 Apr 2019 06:51:11 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDO7Y-0004ii-QQ
 for linux-riscv@lists.infradead.org; Mon, 08 Apr 2019 06:51:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1554706268; x=1586242268;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=5iFowsCMSNga4hk8IgQvcF3PRwiaEBQDNBt1+CSm0pw=;
 b=Cauuls9xQhm4AQaz4NHoX/hmbAy5GBZ+7lkVZk93EiVcEs8eY7zKxOIu
 1iMLM8h4J+sqyPYLPijV4hgxlY9U2B1A/crbsXQjOBZPZ79IcL3p7a/px
 3jsUDXHdz9XcjYsTPikzJjzBy3MBiGmlQ3ktDRGuD3SVcoaZifHYhdFWV
 9u+N9yMvRTJ5r9277snR6vFD3xuyTmHSB0xdH+tqeLGiZF8+usOs5EYpT
 5n0++HJ3tOHzxgiqZnUCf/qibulBET9BhPMoZKselAIetReEZWdVtURu1
 FjpOEgi4tEIISO1qsafaJO361Y4O76H2R5mVnC1umWvLeKvbbVk83Mk/I g==;
X-IronPort-AV: E=Sophos;i="5.60,324,1549900800"; d="scan'208";a="211005446"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Apr 2019 14:50:55 +0800
IronPort-SDR: hsvd6sN6KHV8ueq4LxmWiTdPihxGo2y4pSAkXWqrr6e61n/m0b8EQpIOA2nxh2cOY+18MF2eUi
 cyuS4fLzgJTQbmzbzlQSt9b3ehBRnnDgwaa+EhWmHYy00JTQJcv42Bi4dyoTPfKkZMRK6HMG3i
 cPpHbRnFK0FF9Iy6XPfS5CW4yPpFT3UYK+BwF8tF3yvkTrlN8YKZMJCy+EUobHjEITl5RhmZnq
 5WB6fUn2IIcUuecfbueT7qcrTG4ViYj4bYCrf4q/Y8Fm7Yr6G/PCmBz86nBR/21pdIpXPwFFuB
 4nS/5EclgR+LUhrGxFp8Qlwv
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 07 Apr 2019 23:27:54 -0700
IronPort-SDR: FJN83C6n60QyDAf2PHxdI847Qc9piuhFMBKkQOKXN27EzsqT7F/VWICFnESCHvrPBXEFRetbMj
 1XokoLU/nI9ZDUC94f21B3kWopw3qhrsbLb3+e9mbnZ4hakHWKHjnbBQcB6Le9QoGnsXuzlTBD
 g8zmLNIUvRzO+NeEs00bfSKPBmTLUYqHqML3R40F38f8P2XbNVnpIBJ2/UJZCNAdwwZMvut4Yn
 nHP1GBCaNKIrChZ3PUQppPa18vywjIYvbo6DCGfJmkc/w5LTg9J7uD0c0qGeUmbnhuqXA/Jsig
 uSc=
Received: from usa004493.ad.shared (HELO [10.86.51.173]) ([10.86.51.173])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Apr 2019 23:50:55 -0700
Subject: Re: [isa-dev] Re: UNIX-Class Platform Specification Working Group
To: Christoph Hellwig <Christoph.Hellwig@wdc.com>,
 "sw-dev@groups.riscv.org" <sw-dev@groups.riscv.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "hw-dev@groups.riscv.org" <hw-dev@groups.riscv.org>,
 "isa-dev@groups.riscv.org" <isa-dev@groups.riscv.org>
References: <mhng-99966160-5466-4cfc-b3d8-48ad48d3dc74@palmer-si-x1c4>
 <CANs6eMn4+6XGaSOGyWoD5RK2DjQo2SUUHphqmL_dwQD-Xu-omQ@mail.gmail.com>
 <c1ea959e9114929b72f5b3d687e70429a3737d25.camel@wdc.com>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <8075b57a-52bd-e96d-0f5a-061ea3d12538@wdc.com>
Date: Sun, 7 Apr 2019 23:50:54 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c1ea959e9114929b72f5b3d687e70429a3737d25.camel@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190407_235108_996405_70AC5155 
X-CRM114-Status: GOOD (  17.59  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
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
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/7/19 12:36 AM, Christoph Hellwig wrote:
> On Fri, 2019-04-05 at 08:43 -0700, Palmer Dabbelt wrote:
>> Sorry for the delay, but it appears we now have a mailing list set
>> up!  I managed to announce the group right in the middle of the
>> workspace -> groups.io transition, which means we're the first group
>> to try out the new infrastructure.  As a result there may be some
>> wrinkles, but at least a handful of us can get into the group so with
>> any luck it'll work for anyone else.
>>
>> You should be able to join here:
>> https://lists.risc-v.org/g/tech-unixplatformspec/topics .  Just like
>> the other RISC-V specs, you'll need to be a member of the RISC-V
>> foundation to contribute to the platform specification -- sorry if
>> there was some confusion in my original email.
> 
> So in the past the way to join was through workspace.riscv.org - but
> login in there just returns an internal server error.  Has lists.risc-
> v.org replaced the above infrastructure or is it in addition?
> 

IIRC, workspace.riscv.org is going to be replaced with lists.risc-
v.org which will managed by Jeff. Platform Spec group just happened to 
be the fist one to deal with it.

There won't be a platform spec group in workspace.riscv.org.

Regards,
Atish
>>
>> On Tue, Apr 2, 2019 at 9:50 AM Palmer Dabbelt <palmer@sifive.com>
>> wrote:
>>> Atish and I have approval from the RISC-V technical committee and
>>> board to
>>> start a group to manage the UNIX-class platform specification.
>>> This working
>>> group will start by defining a subset of this platform
>>> specification that both
>>> allows compatibility with existing implementations and
>>> extensibility for the
>>> future needs.  The contents of this first platform specification
>>> will include:
>>>
>>> * A versioning scheme for future versions of the UNIX-class
>>> platform
>>>    specification.
>>> * A specification for a platform-level interrupt controller that is
>>> compatible
>>>    with existing implementations of SiFive's PLIC.
>>> * A specification for a standard SBI that is compatible with the
>>> current
>>>    implementation in Linux as well being extensible for future
>>> needs.
>>> * An SBI extension for CPU power management.
>>> * A specification of the interface between a bootloader and
>>> supervisor-mode
>>>    software.
>>>
>>> Since this working group mostly consists of standardizing existing
>>> implementations, I hope it can progress quickly.  As such, I'd like
>>> to set a
>>> 6-month deadline between when the working group is started (ie,
>>> today) and when
>>> a specification enters the 45-day review period.
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
