Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FDAC3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 08:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fDY7nPxZZOi8ngegUPRqxEQV7ybB/0bh6O07ReZvLOE=; b=QIP2VJHgJ4F71D
	oAT9sXU4ubIobULzWqIKTF5zDKKN2nwI8pvpHKV6cFKMs5H8MuQi1frFjmIOHCT92QK1OERSIaCge
	gnS96vxsh9CJfxf8QTSQT4yMQV/BuElp3vJ+3snAjU6QCjSi58Rz66/8DBN8XT4URxZlS1WTVrCkY
	c3Hq55BzIlqDzXAxWMn4s0LfDab7y+V4/kRebFR2fHQlNdIV8XZUT2QNkVk8EGKh9fP31ogUaugEr
	68S7n09yN4b/8TVWIDAXZFHGNdTzMAJipxIINVDicbqJdAMrfW5+1pP9qLcCPkgpe3+CZzo9GhhKs
	1haktYMH317ZlR3iJ26w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMl4m-004KAz-1D;
	Mon, 08 Jan 2024 08:33:40 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMl4i-004K9h-2J
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 08:33:38 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40d2376db79so14790835e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jan 2024 00:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704702813; x=1705307613; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GfLQg2J+OwD4mK8aB87IakjXF3Kgfssqm9r5be44QF4=;
        b=Naex8LLInfBinnuGr/8xCaF+NFsmA2LyMOpXauzAQ4Wm08ouc+pORoeiPKdy4eShWG
         BmysYHBCaB8EZ6eWqzgVvrOHL28wZembIXGjKL4fRsxzIb8V5HVKZZEN9ihAXfzxQAav
         hZd0eip4rOd5FSgXWofcBV+OKm11qL7DxhYh2vwrgEU+icC3sx331d5onZQphu9kONY9
         t4xfFJ3gPTnEmsCGpWShHUw6p5yv8I4IysptjxN5iJJ7hO/PtSr6ICbe5PQot7Zg9z3u
         fIfKpeWfrrxekfS1dgzCgdpdhraLCaJ/btNiSkL84T8oVzIDhySRzk0dXe85js7VoXPN
         cPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704702813; x=1705307613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GfLQg2J+OwD4mK8aB87IakjXF3Kgfssqm9r5be44QF4=;
        b=vVt4xVsd7A/WAV3tGOCmE5lC/gyHeizg5E6hkKhPnWTF31S+YWj6AWpPtzluea7Wrr
         ITRy5RYRO9S0WSslyhrfDZ72DSIlrT1eq2UNsAJpBiazVf46HIo+d9WzEe8V4UVxPGJc
         kWC6Ttg3D43tT2SdXTIrvMhJvzIdDQFmOSVPKxW/o8ysY47tVD4jYenBuAkOmKt8kVKt
         CFrH4yPGjwl4OuI+GOFPiDeFPLAn7KARbbUyFjSYTqEyOs/qvvI0I6BhMjocmOjT4p6O
         woa/EejbbV5aXfrrXFx3kQjmX/TfmQnuhPkiwYWcd9oOApmeUu38z04UK032SFRS98ch
         J+Kg==
X-Gm-Message-State: AOJu0Yypw16SSXMMlcQiCt/+PV3zijC/eqhCpLJ1J1BkptpP3Veo+x/d
	heiECGLdwR6ZlPR1+by1VjDlCxXZupqzWA==
X-Google-Smtp-Source: AGHT+IFdr9+p9p3yVvUI5Yb2+RUaaTtc6lK6/0ftFespHQFyJZzml/U22xZUgZCqObC/GxElyekYhg==
X-Received: by 2002:a05:600c:3411:b0:40d:4dce:4a2e with SMTP id y17-20020a05600c341100b0040d4dce4a2emr2008525wmp.26.1704702813400;
        Mon, 08 Jan 2024 00:33:33 -0800 (PST)
Received: from [172.20.10.3] ([37.161.21.69])
        by smtp.gmail.com with ESMTPSA id p7-20020a05600c358700b0040d3db8186fsm10246189wmq.5.2024.01.08.00.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jan 2024 00:33:32 -0800 (PST)
Message-ID: <848d1908-b758-44c2-a7bd-f3e83da18bce@suse.com>
Date: Mon, 8 Jan 2024 09:33:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/36] Remove UCLINUX from LTP
To: Rob Landley <rob@landley.net>, Cyril Hrubis <chrubis@suse.cz>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it,
 Li Wang <liwang@redhat.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Christophe Lyon <christophe.lyon@linaro.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux-sh list <linux-sh@vger.kernel.org>
References: <20240103015240.1065284-1-pvorel@suse.cz>
 <CAMuHMdXGwyS-CL0vLdUP4Z4YEYhmcmDyC3YdGCnS=jFkqASqvw@mail.gmail.com>
 <20240103114957.GD1073466@pevik>
 <CAMuHMdX0s0gLRoPtjJmDnSmZ_MNY590dN+JxM1HKAL1g_bjX+w@mail.gmail.com>
 <ZZVOhlGPg5KRyS-F@yuki> <5a1f1ff3-8a61-67cf-59a9-ce498738d912@landley.net>
Content-Language: en-US
From: Andrea Cervesato <andrea.cervesato@suse.com>
In-Reply-To: <5a1f1ff3-8a61-67cf-59a9-ce498738d912@landley.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_003336_777167_4B964467 
X-CRM114-Status: GOOD (  12.15  )
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

Hi!

My 2 cents. I'm working on refactoring growfiles test which uses UCLINUX 
flag.
During its development I had occasion to check UCLINUX support and 
(indeed) it seems pretty
broken for LTP, because nobody is maintaining it for a while and such 
tests use old API that will
be replaced in any case sooner or later. I agree with other people about 
removing it, unless there's
a valid reason to keep it.
Just in case we want to keep it, someone should take care about UCLINUX 
support, testing LTP releases for it as well, but it doesn't seem like 
something we can do inside the LTP devs team due to the lack of resources.

Regards,
Andrea

On 1/5/24 04:52, Rob Landley wrote:
> On 1/3/24 06:09, Cyril Hrubis wrote:
>> Hi!
>>> I am not sure I agree with this series.
>>> Removing support for UCLINUX from LTP is almost a guarantee for
>>> not noticing when more breakage is introduced.
>>>
>>> How exactly is UCLINUX broken in LTP?
>> As far as we know noone is using it and nobody is maintaing it for a
>> decade,
> Nobody is maintaining "uclinux" because that was a distro, but you can build
> nommu support in buildroot and such, and people do.
>
> Rob



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
