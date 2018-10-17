Return-Path: <SRS0=aUtB=M5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D2DBECDE32
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Oct 2018 21:46:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22BEC2145D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Oct 2018 21:46:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hRTjYQ6W";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="VQgCgHDN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22BEC2145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vRxfy0xLBh8h4Yvs1GFPf3N+o9CHFO6vjrrUF/V0Vek=; b=hRTjYQ6WGmFNUFOu4Ul4Fm6S5
	+mOshkTBRBES4k6rXrq5XNjwsCFIM6GPaHhjLYNabIKWJhFc69qfCfY8DpXjnfnRNMEApeo4juR3G
	VzqYYmRMpaiFxwBOibAOUMCgwaTwxqSh6btOwlmXhmPHfSvgA9ZFFYCdEjr5YL0luTAsSoorMxD1j
	Z74W8HQDgYEh3lOx0l/3EXBaGbizxq0mReQipxctYwdTrvfoWgLviJW/1InuKjS01EEcsYBQwZxGe
	xbeNyqRdPoEx3Err/qmRms+3s8Lc3BDPoYRYaQv4y0ZPleF/1GsDbOUau0zTphopp8uSYY+nQpLDo
	pVyz+PHdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCtdw-0003KN-2H; Wed, 17 Oct 2018 21:46:16 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCtds-0003J9-1O
 for linux-riscv@lists.infradead.org; Wed, 17 Oct 2018 21:46:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1539812772; x=1571348772;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=8VlMOJnAuhPsAYJEs53Het/Qfc9+MZRrBMmO82hRXns=;
 b=VQgCgHDN0mFVrqAjdqL+suash4FizkWN0PH7PlYX99qDb89mzRUKGr67
 7++x0/aDNLxlpa/eggsoevfg5+i7GsGU9PqEYzQIXJa7b9e/IRcI3ciQO
 0ocOXmtEGLA/NiGXZYsHXQCaUSsEM2Y4aaB/KNtoCQHR9HWmLjGZiKAG+
 ByW+bV4zUIozr/rQ8SuZZZJ4qmlcEIvhzmEFggqf3d2utUNJlRaWeN/PQ
 LgMm/HW9GVEhjoCsEvj33XNC/2oWaSD9gehBhKcraA9mK9ZhFeHG/Upwj
 LsWuXz0dTRNtFpWu/sWrr6JNtxXcln62p4QBOWyyES4bCdIVbB/5Hb2Y6 A==;
X-IronPort-AV: E=Sophos;i="5.54,393,1534780800"; d="scan'208";a="93882490"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2018 05:45:58 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP; 17 Oct 2018 14:31:02 -0700
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.73.114])
 ([10.111.73.114])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Oct 2018 14:45:59 -0700
Subject: Re: [RFC 1/4] pwm: sifive: Add DT documentation for SiFive PWM
 Controller.
To: Rob Herring <robh@kernel.org>
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
 <1539111085-25502-2-git-send-email-atish.patra@wdc.com>
 <20181010134926.GD21134@ulmo> <25758ab9-eb36-741b-6264-42412b3ddd8e@wdc.com>
 <20181016110142.GC8852@ulmo>
 <6e108e3c-15c1-b13b-ac3e-60c5eb209c7b@sifive.com>
 <20181016220437.GB31973@mithrandir>
 <7fc1168d-a840-032a-c0a9-2a610127c484@wdc.com> <20181017155818.GA21971@bogus>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <40c50c06-7a89-47db-1a5c-07c58b6c253b@wdc.com>
Date: Wed, 17 Oct 2018 14:45:56 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181017155818.GA21971@bogus>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181017_144612_139708_51B8D588 
X-CRM114-Status: GOOD (  24.40  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Wesley Terpstra <wesley@sifive.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hch@infradead.org" <hch@infradead.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181017214556.cexodFFGb15dGnxvH5t4JUoq4CchVgBn2de1elJt29c@z>

On 10/17/18 8:58 AM, Rob Herring wrote:
> On Tue, Oct 16, 2018 at 03:20:34PM -0700, Atish Patra wrote:
>> On 10/16/18 3:04 PM, Thierry Reding wrote:
>>> On Tue, Oct 16, 2018 at 10:31:42AM -0700, Paul Walmsley wrote:
>>>>
>>>> On 10/16/18 4:01 AM, Thierry Reding wrote:
>>>>> On Mon, Oct 15, 2018 at 03:57:35PM -0700, Atish Patra wrote:
>>>>>> On 10/10/18 6:49 AM, Thierry Reding wrote:
>>>>>>> On Tue, Oct 09, 2018 at 11:51:22AM -0700, Atish Patra wrote:
>>>>>>>> +Required properties:
>>>>>>>> +- compatible: should be one of
>>>>>>>> +	"sifive,fu540-c000-pwm0","sifive,pwm0".
>>>>>>> What's the '0' in here? A version number?
>>>>>>>
>>>>>> I think yes. Since fu540 is the first Linux capable RISC-V core, SiFive Guys
>>>>>> decided mark it as version 0.
>>>>>>
>>>>>> @Wesly: Please correct me if I am wrong.
>>>>> It seems fairly superfluous to me to have a version number in additon to
>>>>> the fu540-c000, which already seems to be the core plus some sort of
>>>>> part number. Do you really expect there to be any changes in the SoC
>>>>> that would require a different compatible string at this point? If the
>>>>> SoC has taped out, how will you ever get a different version of the PWM
>>>>> IP in it?
>>>>>
>>>>> I would expect any improvements or changes to the PWM IP to show up in a
>>>>> different SoC generation, at which point it would be something like
>>>>> "sifive,fu640-c000" maybe, or perhaps "sifive,fu540-d000", or whatever
>>>>> the numbering is.
>>>>
>>>>
>>>> The "0" suffix refers to a revision number for the underlying PWM IP block.
>>>>
>>>> It's certainly important to keep that version number on the "sifive,pwm0"
>>>> compatible string that doesn't have the chip name associated with it.
>>>
>>> Isn't the hardware identified by "sifive,pwm0" and "sifive,fu540-c000"
>>> effectively identical?
>>
>> Yes.
>>
>> Is there a need to have two compatible strings
>>> that refer to the exact same hardware?
>>>
>>
>> The DT in the hardware has only sifive,pwm0. I have added
>> "sifive,fu540-c000" as that was concluded as the correct compatible string
>> from platform level interrupt controller patch(PLIC) discussion.
>>
>> (http://lists.infradead.org/pipermail/linux-riscv/2018-August/001135.html)
>>
>> "sifive,pwm0" is required to until all the Unleashed SoC gets an updated
>> firmware with correct compatible string "sifive,fu540-c000". I agree this is
>> a mess. But we have to carry it until all every DT(corresponding to each
>> driver) is finalized. I guess SiFive will release a firmware update that
>> contains all the updated DT once that is done. We can get rid of all the
>> redundant compatible strings at that time.
> 
> I don't want to repeat compatible string discussions on each and every
> IP block. I already have to do this with some vendors.
> 



> The RiscV vendors' needs and design flow are a bit different from
> traditional SoC vendors AIUI for the last discussion. If you need to do
> something that doesn't follow normal conventions, that's fine. Just
> please document a convention that works for you. This should explain
> where the '0' above comes from for example. And I'm not a fan of s/w
> folks making up version numbers.
> Sorry for bringing up the same discussion. My aim was just to reiterate 
the suggestion you made on the other other thread (i.e. PLIC compatible 
strings) and use the same format used in PLIC block. As these IP 
blocks(pwm & gpio) are also from SiFive for the same Soc (HiFive 
Unleashed board), I was just trying to clarify that this driver also 
follows the exact same convention adopted for PLIC IP block.

Regards,
Atish

> Rob
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
