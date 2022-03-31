Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3732DC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 19:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=UNDx9Pt/ofwED7VZBddtuPk+2+GEiXJb3vRNcjL5Xso=; b=xhtggsO/NtQ0RzrG7AHnjnugOr
	cPVQ302DdfOeTe1Y43xI+WqkDGib68TrEF6NLzt7/87R2t75FebqrOdElifbsZGKFg1ocD/E4Gqj5
	LFu+u6Yt2prb3xVvw0QL3EOCGX0kEX4Ai1hsOArnrU5PRbCnBOZ34cczI6eIwhyDa55L1DAMq8GlL
	Lew6XBh20Z040e/7bazh8JQ41nXDfv0YqdUIegR951ZelfSK9iPhUCkBjCsy+2vWlbZtuCANBdQI8
	5ZBPdnEsU2J6j+sCEIuAu0j1Xg5RFLaLi4taJA+J69O+SXvbmU4pP3fxmVO3gRpclobcpOCfcbsLf
	gvZkUqKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1na0sF-003UrL-J3; Thu, 31 Mar 2022 19:54:27 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1na0sC-003UqS-EI
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 19:54:25 +0000
Received: by mail-pl1-x635.google.com with SMTP id p17so531714plo.9
 for <linux-riscv@lists.infradead.org>; Thu, 31 Mar 2022 12:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=8uJ7V2Lk5b43qtRmyNKIxduM/i4ZvkhkfMVtcSMTHLc=;
 b=FU4YJeOWM6yJOftdRdppJkqAphiFFHBDWUUenEYTDla3AjR/9XyWUZ7NZrML9kP99Z
 rqVOzKX0OfynEviPak2SUeMa0Jxf+lrS9EClU7ZqMwKR3W/DNIVrESqbp+0eIEVkrIBM
 M2axkYIj+R7nx0w3lyY4eEihxCsjEfF2rwwm4ERkBmFL3F2/vYC+dG+rn5028ncqt8cj
 SlsMm9LggdTPgKMEVRPSqQNUJJCSU9RceECfCtuPpey4sagbpN/5/PCyVkitJ13aPlA3
 YdQ3O527QYaVl7OfKeTFGDfExvfTRBdEKXr5OeP9UNh/o1LsqwQB9z32d0VsYvZtWzn+
 VywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=8uJ7V2Lk5b43qtRmyNKIxduM/i4ZvkhkfMVtcSMTHLc=;
 b=t8Eane7aGlueM8e+1mTcJ2hQSPDvGYKiW4US0PiMuYbnvBaBcan756PF8cLENzlpfY
 PO5Blq4h6j1lg5epdNub8Rrrg1G9r21KUW3dkJTGBpNA8aRHdS7QFPZW8pxgpB6vjyR9
 SVdi+TYbnOx17otxyEQLxOxb/I7jQgAcWYbWp4Q/WwNJCHJm/IzY9HMrw0wCOraKrMU/
 O+iPXz6oAULLbc0qGfZEi6VmMWlK1WOIp1jSLLZ1N6cMl5YBruEYc5CNWjG9zeQ84JRI
 sxsrqro4GskXc9K/01GwlMCtjdPsM7xrNPG+268DF+4RDRVXgQxyIn4DjTT5GwZi0K5X
 yqlA==
X-Gm-Message-State: AOAM532r2gTTGCwtwNRVL4vhffnJnSWPXelobWiq1wiSevKPydrUD1z5
 wYhh4AhjiRWausF803C7VC2y8g==
X-Google-Smtp-Source: ABdhPJw7JKGfhtf3xhglvwKuCf7tiq5byULmqZPX/onK7gDxOwmiShZCnNHHKkZbJwIlhjSsWTfaDg==
X-Received: by 2002:a17:903:32c7:b0:154:4156:f384 with SMTP id
 i7-20020a17090332c700b001544156f384mr6965753plr.34.1648756463019; 
 Thu, 31 Mar 2022 12:54:23 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 b10-20020a056a00114a00b004f784ba5e6asm323970pfm.17.2022.03.31.12.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 12:54:22 -0700 (PDT)
Date: Thu, 31 Mar 2022 12:54:22 -0700 (PDT)
X-Google-Original-Date: Thu, 31 Mar 2022 12:54:20 PDT (-0700)
Subject: Re: Re: [PATCH] target/riscv: Exit current TB after an sfence.vma
In-Reply-To: <CAKmqyKMsG6d7jaS2gxXxh+qONWkWGbHFwLK9tYb2q7eeQe77uw@mail.gmail.com>
CC: idan.horowitz@gmail.com, linux-riscv@lists.infradead.org,
 qemu-riscv@nongnu.org, 
 phantom@zju.edu.cn, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alistair23@gmail.com
Message-ID: <mhng-beb640a4-0833-45b9-a57d-1e98464152f5@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_125424_516072_1299EFD6 
X-CRM114-Status: GOOD (  32.56  )
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

On Wed, 30 Mar 2022 22:13:39 PDT (-0700), alistair23@gmail.com wrote:
> On Thu, Mar 31, 2022 at 2:36 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Wed, 30 Mar 2022 20:23:21 PDT (-0700), alistair23@gmail.com wrote:
>> > On Thu, Mar 31, 2022 at 3:11 AM Idan Horowitz <idan.horowitz@gmail.com> wrote:
>> >>
>> >> On Wed, 30 Mar 2022 at 19:11, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> >> >
>> >> >
>> >> > Presumably you mean "revert" here?  That might be the right way to go,
>> >> > just to avoid breaking users (even if we fix the kernel bug, it'll take
>> >> > a while to get everyone to update).  That said, this smells like the
>> >> > sort of thing that's going to crop up at arbitrary times in dynamic
>> >> > systems so while a revert looks like it'd work around the boot issue we
>> >> > might be making more headaches for folks down the road.
>> >> >
>> >>
>> >> The opposite in fact, I did not suggest to revert it, but rather undo
>> >> the revert (as Alistair already removed it from the apply-next tree),
>> >> since my original patch fixes buggy behaviour that is blocking the
>> >> testing of some embedded software on QEMU.
>>
>> Ah, sorry -- the QEMU tree I was looking at still had the patch in
>> there, must have just been an old one.
>>
>> > So, this is a little tricky.
>> >
>> > We want to apply the fix, but that will break current users.
>> >
>> > Once the fix is merged into Linux we can apply it here. That should
>> > hopefully be right at the start of the 7.1 QEMU development window,
>> > which should give time for the fix to propagate into stable kernels
>> > and not break too many people by the time QEMU is released.
>>
>> If you think this is a Linux bug then that makes sense, but I think this
>> is a QEMU bug -- I sent a patch, not sure if it went through as it didn't
>> make it to lore.
>
> Ah whoops. I saw the patch but didn't read it, then I assumed it was a
> Linux bug from your diff earlier.

No problem, that was the first thing I sent in the morning so I doubt it 
made any sense.

>
>>
>> I also think the bug will manifest without the TB exit patch, maybe in
>> single-step mode and definately if we happen to exit the TB at that
>> point for other reasons.  Assuming my reasoning is correct in that
>> patch, we may also be hitting this as arbitrary corruption anywhere.
>> I'd started to write up a "QEMU errata" Linux patch for this, but then
>> convinced myself that just adding the sfence.vma was insufficient.
>
> Yeah, looking at it now I agree, I'll send a PR for 7.0.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
