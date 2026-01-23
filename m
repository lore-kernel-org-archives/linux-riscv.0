Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB00D7234B
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 08:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oUHhYCNQQRiS+t2Wzxh2XuNwDE6fH9UkUxxsbVoW7mo=; b=ZyJp79QGefm1Jq
	u0jvBd9i7TuUJHh1kGMGjdkftHs/81Q5Cf0pqq+yntVtJd1B40snJ4cEYNISxQpfeGSO/DU2B2w4n
	7JjueDCNTqfXF781rJT8cUE7MkyUsDSILI11PbzHEMRgAs1mPUqz9d0gFLkLQM3+9iE4KHCpXmt+g
	7ByoYpytwwY9nBW8XAxqYyzQX9gfsLYe1Lrj9u9lzOjbhVaYdQ6VD0KdpIcdKznL21+qpZVBdqUUG
	FaFQuWIMKaDVPF1Y5qtWt9FXj+Jbu8FN4+x6yIwEs4pd/4sGOesV53FcaH7ONEPOM6snhXRIa61Du
	T4ywhgryqXiLXf3NXFkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjCSJ-00000008SQt-29Ql;
	Fri, 23 Jan 2026 08:23:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjCSG-00000008SQY-1tNJ
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jan 2026 08:23:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769156622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CD+T1KpcisOIdjn7OKGY4SJv7GT2lLztb8OPYUclLjw=;
	b=CFsn5BjTBy3loyWuMyo6KYy9N3YahZGpeUH+dLG5q6NaZUreUH/3MHUOhQx3tcaJ6UxI2e
	ICb3f7FJjEf9VS4gxwQ8gsZ0+mTXKHh3yoWLIb4u1985Pqu0ES4DD74UMiVfdNCRXeK5wj
	L+xAh+tOu/u3FO5rg9LU56sdtuVl578=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-aqZj13OQPheMwFw8eXr3BQ-1; Fri, 23 Jan 2026 03:23:40 -0500
X-MC-Unique: aqZj13OQPheMwFw8eXr3BQ-1
X-Mimecast-MFC-AGG-ID: aqZj13OQPheMwFw8eXr3BQ_1769156619
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4359849d324so1414729f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jan 2026 00:23:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769156619; x=1769761419;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CD+T1KpcisOIdjn7OKGY4SJv7GT2lLztb8OPYUclLjw=;
        b=OJ+efyqL9Dt2XOCKmlkN8dHugv4obNKXYAHZigAS+nq0gMIrj6rvNKNsA5nort0sor
         PRJZRt2qAEW7qNxtME+48l8RggmF3ZeXrFwp/3NiWaB08jqHIAb/XMpezM2abz8fyz1p
         BTHn55cHe3+p1HbbJSjsoTzoXoumon90aJ+M2DTUQ+PHszVs2bzF7fM4ZAHR/TlpWgNB
         ytkG+AXtZA1kAyq7i7CdJ3s27yqG8zF6Xcm48p1XMukO/bn6DealQeYTuPYf13+y6gvu
         xQmztzyMwTl18cxZmR94cW6hY8er8r1HPdj0+9DtYBZ8W2yrzdngBp2XBcVYA/DdPjcM
         /dzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm5m4qoGtZEfiF/SaveczDL/db2N+kV130uqUMWdtmyCXU0ezZ+FeYTyLmg6JEGBA6mjwGBryC8ckduQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv1dGnUuo6avRczpJtVn2kxmG/lcSyvp+KfANiKYeW4/cA5eEW
	TWvT69T78l2X2MeJiY7fcC/kfB9XvkPLipxsqN60vH3ck582G0vEeU+V0f8JayMLEpx1vydzUaE
	HlgIiBeIfF7x3LNoj8PnMCDiZAtNJ+VuVZ2TbZ6qgVFREqMG3shgak7/lHRawPSBis6Ha6Q==
X-Gm-Gg: AZuq6aImopX8JVefCz+1JbdlttXfp5BSgioK4kmfQJTABeynWiDGht/YOkiX0RIa+/S
	Qth+noQGmt0gOe5KrJJXdzxXZmuAMiWkMSk2aws/hG6ePFyXuLgK5dQ7AMDydHuDlA0riBAZRYP
	2+I1YQg5F1DX3zGZCldF2+mh/gnJqzPBA0glqLKrNCWhx7Uw1B/6I2pMYDpzYkmgS05pOWxxecQ
	CXqzYNLu5rqQ6RZVfA6xvhabiPD5Jd0MzOuGr/rhbhjBTSXbIGYnUWnJ0xgQVJhCB/DUUzQUg10
	dDWtz1JysxnK8MwnpW3oQ8JMK0QO6TaWkzqxdsPhG875AeNVV/o8ylcvvL2Zyw4JuZgFLTe9LwV
	62vXlLC6k3dQ6L4NwZcv1SC8cD+wecVRHIDQXbtBKrFG4tp4jV965tkdGKueQ5c3oFX9W
X-Received: by 2002:a05:6000:144a:b0:435:9653:e151 with SMTP id ffacd0b85a97d-435b1587d3bmr3552722f8f.3.1769156619039;
        Fri, 23 Jan 2026 00:23:39 -0800 (PST)
X-Received: by 2002:a05:6000:144a:b0:435:9653:e151 with SMTP id ffacd0b85a97d-435b1587d3bmr3552677f8f.3.1769156618637;
        Fri, 23 Jan 2026 00:23:38 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24bedsm4756198f8f.17.2026.01.23.00.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 00:23:38 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Yixun Lan <dlan@gentoo.org>, Guodong Xu <guodong@riscstar.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Alex Elder <elder@riscstar.com>, Lee Jones <lee@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/4] regulator: spacemit-p1: Fix voltage ranges and
 support board power tree
In-Reply-To: <20260122101122-GYA63789@gentoo.org>
References: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
 <20260122101122-GYA63789@gentoo.org>
Date: Fri, 23 Jan 2026 09:23:36 +0100
Message-ID: <87qzrgenzr.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3SSp1nT0ocMqJRw_ns-xBybWt9LVPhACeRfD6Od4SJM_1769156619
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_002344_562976_F0A258F5 
X-CRM114-Status: GOOD (  12.91  )
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

Yixun Lan <dlan@gentoo.org> writes:

Hello Yixun and Guodong,

> Hi Guodong,
>
> On 17:43 Thu 22 Jan     , Guodong Xu wrote:
>> This series fixes hardware voltage constraints and enables flexible power
>> tree configurations for the SpacemiT P1 PMIC.
>> 
>> Patch 1, n_voltages is corrected to match hardware register widths, as the
>> previous values prevented regulators from reaching higher operational
>> voltages (e.g., 3.3V on LDOs).
>> 
>> Patch 2-4, hardcoded supply assumptions are replaced with explicit
>> devicetree properties. PMIC supply connections are board-design decisions.
>> Moving this to DT allows supporting varied topologies without driver
>> modifications.
>> 
>> Note: Patch 3 introduces a bisect breakage by transitioning to
>> pin-specific supply names. Probe failures will occur on existing board
>> (K1 Bananapi F3) until Patch 4 updates the corresponding DTS file.
> This patch bring system-wide change that not only affect Bananapi F3..
>
> Please also provide fix for other boards, I think you may not be able
> to test all boards, but make sure the patches are available, so people
> who interested can test, P.S I can help on milkv jupiter board
>

I can also help testing on the milkv jupiter board.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
