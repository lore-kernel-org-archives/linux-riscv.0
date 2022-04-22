Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81987C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Apr 2022 10:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=78uX9NQDKMWH95ASW8+yUeX/JEiv7lVPbiVOv9r5Ems=; b=KZT5QtvIjEW2Wy
	SxKXPavbGgjU0f+x02Jm8NqMDDthuJ7FKx7S22dPFdviQQnjgN6gk5J+mHzrfQp9fpifasgtYuDXj
	cbq7lOBBawM8zmdeKu2C/pNtR+jfA1jPYTVYRM99D7kC1DEUPa6q9OtW+VSpq5obDMYZbaPBYPghn
	7/+3tz+j4FsJI3ZDxsjWF7+FxmrDCSh59mSZoHfq0FKnEX3CeCO8rawTDxu0itxhD2z122KndwDW/
	omQovomVv4rUgJi3FDokgQ/v0XqkvUJlMwOYcOjY46K0gFiFB19dUCfC+DuWb1Tbq7GLZADHr82cL
	9q3ZK/TELW2jVajTxSZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhqUs-0000Jh-VY; Fri, 22 Apr 2022 10:26:42 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhqUe-0000DD-Ty; Fri, 22 Apr 2022 10:26:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37DEF1477;
 Fri, 22 Apr 2022 03:26:24 -0700 (PDT)
Received: from [10.57.12.164] (unknown [10.57.12.164])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C18F3F766;
 Fri, 22 Apr 2022 03:26:18 -0700 (PDT)
Message-ID: <91c64a80-3892-944d-4178-5b57a4f2899d@arm.com>
Date: Fri, 22 Apr 2022 11:26:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] binfmt_flat: Remove shared library support
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Kees Cook <keescook@chromium.org>, Niklas Cassel <Niklas.Cassel@wdc.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Mike Frysinger <vapier@gentoo.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Jesse Taube <Mr.Bossman075@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
References: <20220414091018.896737-1-niklas.cassel@wdc.com>
 <f379cb56-6ff5-f256-d5f2-3718a47e976d@opensource.wdc.com>
 <Yli8voX7hw3EZ7E/@x1-carbon>
 <81788b56-5b15-7308-38c7-c7f2502c4e15@linux-m68k.org>
 <87levzzts4.fsf_-_@email.froward.int.ebiederm.org>
 <01b063d7-d5c2-8af0-ad90-ed6c069252c5@linux-m68k.org>
 <CAMuHMdXd94L=766usN4WG-hK2MpQLy50mJZ=9G9NGv03kx8V8Q@mail.gmail.com>
 <CAK8P3a3Cjna7H_YxFvg6UEOqQf9ZqLp9EVOCFFewzWBHVT4nWg@mail.gmail.com>
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <CAK8P3a3Cjna7H_YxFvg6UEOqQf9ZqLp9EVOCFFewzWBHVT4nWg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_032629_094373_D5EDD5BD 
X-CRM114-Status: GOOD (  17.59  )
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

On 4/21/22 8:12 AM, Arnd Bergmann wrote:
> On Thu, Apr 21, 2022 at 8:52 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> On Thu, Apr 21, 2022 at 1:53 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
>>> On 21/4/22 00:58, Eric W. Biederman wrote:
>>>> In a recent discussion[1] it was reported that the binfmt_flat library
>>>> support was only ever used on m68k and even on m68k has not been used
>>>> in a very long time.
>>>>
>>>> The structure of binfmt_flat is different from all of the other binfmt
>>>> implementations becasue of this shared library support and it made
>>>> life and code review more effort when I refactored the code in fs/exec.c.
>>>>
>>>> Since in practice the code is dead remove the binfmt_flat shared libarary
>>>> support and make maintenance of the code easier.
>>>>
>>>> [1] https://lkml.kernel.org/r/81788b56-5b15-7308-38c7-c7f2502c4e15@linux-m68k.org
>>>> Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
>>>> ---
>>>>
>>>> Can the binfmt_flat folks please verify that the shared library support
>>>> really isn't used?
>>>
>>> I can definitely confirm I don't use it on m68k. And I don't know of
>>> anyone that has used it in many years.
>>>
>>>
>>>> Was binfmt_flat being enabled on arm and sh the mistake it looks like?
>>
>> I think the question was intended to be
>>
>>      Was *binfmt_flat_shared_flat* being enabled on arm and sh the
>>      mistake it looks like?
>>
>>>>
>>>>    arch/arm/configs/lpc18xx_defconfig |   1 -
>>>>    arch/arm/configs/mps2_defconfig    |   1 -
>>>>    arch/arm/configs/stm32_defconfig   |   1 -
>>>>    arch/arm/configs/vf610m4_defconfig |   1 -
> 
> Adding stm32, mps2 and imxrt maintainers to Cc, they are the most active
> armv7-m users and should know if the shared library support is used anywhere.

Never seen shared library in use for flat format, so FWIW

Acked-by: Vladimir Murzin <vladimir.murzin@arm.com> # ARM


> 
>       Arnd


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
