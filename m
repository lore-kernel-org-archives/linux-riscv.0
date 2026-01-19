Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C123D29C50
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 17:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hhrs6xjp0+IPIACEuIBR22Md1f9itwzib5qqD8+msO8=; b=gkHxKsll0qS3C0
	fEJJgDS1HhLjvrsVp8MCgvzgVS2fnOgyMX8I4aMzH17lrXavnXFs6UTmPJiPDzjMKMizSBEg7oBfz
	sAqngaJ+ZYO1PNpgexTe30eLhwOdAua8G8vpXlk14oq+zNYVWwTdzF8N9jGZZHwuQucP304ntGwMj
	R2mXCDcEzumoJMQ1P0jG5VKPEGVfNccheADA11uxFvNbws7lUB3O6od2Z7v2jy/OSWlu8kHJpdRfW
	ZlkeC2+PHctzLWmBPyThfvaFdaX5OulaikhiXVIKG1TlNAaL7oDPWdPIy46WFBzSW79XqiYK+c2q8
	kThEPlIRplekeREKaceQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhtFU-00000002eyA-1yb7;
	Mon, 19 Jan 2026 17:41:08 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhtFI-00000002exT-15uT
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 17:41:04 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b870732cce2so695492866b.3
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 09:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1768844453; x=1769449253; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xxuB9R8OZVTOu5sOIu1fuGMwJs++8RRhWGGzXgdP+YM=;
        b=OMe0mBhI+8I1uWt5eaT6/NzPfp+Smdl/btTreJ0XhffV38HpvdBdNG54tmv/U1uQsd
         9r0smzoZQ+1+dA1zYJ9AMKfjl1tSbyTtm+5VUZx5BoFdR4MtkpDvPuU1deCdP9D3dSGT
         479wR7dkfHbWelFsEEi3kEITAJDFQwTQOGnNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768844453; x=1769449253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxuB9R8OZVTOu5sOIu1fuGMwJs++8RRhWGGzXgdP+YM=;
        b=n7n4RX3Fm8s0Zxx9dTafRHwO8QksEXb/kARVRysiKvTcUxHLZYowEtYMrwTJzmK13o
         SePKIOtdyVIZnShzJnmWgwENxaZhwvBFbF/C4PA2sKKlGTLtKNtxCLC/WskO1sV7HxRK
         bMWBCKK3dSja21lbnzWpBAoeCwLmCgJ5a9QkgUF/S27AyxeIxxhi04/dRZSJs40JaCUS
         7EFPDvU/fFyweh7+uxT+RarhOscdtKCCukW19ysWjd+prfRCF0WmtlqY1UgyFLMs33ze
         +Yri1ZH7b17B9d0bVijdra8Y9eYHSatV7VGyP1EGkdg5KMmD6X3phC5/INKUeIh1NZJo
         Knhg==
X-Forwarded-Encrypted: i=1; AJvYcCX/DyLmRs3tsnDuw9EuG0FMI/tyW3d40MQNZR+Jq8qa/+YJdDq129S6B9rLfadIPbGqJITVBdCuI4fqZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywpvfyhf2eR6OrR7MhfMvpeENcdrfdKpuSvQGmfPlh+VCQ0lo1f
	9On/loV8FN0f2ZRDezZZkdK6uxF3pycbFGbcP5o4TH5iPVElGHV9lDuH7eeWkgHL7+gOvDdIj2Q
	OQUzUgzY=
X-Gm-Gg: AZuq6aKma8XjYgkfDiwjq6TVdsPDUlEChc9Rmz+NPhpHZF78N7DvvKkPg+k+PuQSi/x
	fQza45qu4KcV1LbSQ5ch0myW1jre+VXdUdVWpMZ4Rl2LoJhiLmo/oFSdmZcVkwvgHouWRbIPLtr
	H1flqs7VwDQWnyk45fdYB4TokvhEHJt1y4UQXoXYnxUoMQ9F7FtPUiT/w4lQukf8SKbDxRsnoLh
	UTG4PbOvzn7rMwyOun/eZFJHyLMdlGc352+B2ydA249oUw2RlcpvMuH7VVE9yaAjaFLfZzITvFF
	QfZVg4gSvXo5sOttVKgvG1SKBkPvE83FfBWfwdbOseuPbi/PWuOvAA7kt+QTeMfl+B3vAQxGj5C
	18HRBLSxTKDdtg8Jic/gqXom+hxI3j5b/AiC0eFruH3EfqIchIU8mDZFMtXogq1eLudndbf1fvt
	ktodHsMVYsXCdmE5q2uVBMkf0G8c0GkYv+HTToFh0LqZimBKXfWNpOFsUnqw7L
X-Received: by 2002:a17:907:1c8e:b0:b54:7778:c62d with SMTP id a640c23a62f3a-b87968f5a53mr957650966b.15.1768844453589;
        Mon, 19 Jan 2026 09:40:53 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959fbd23sm1158748066b.51.2026.01.19.09.40.53
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 09:40:53 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b8710c9cddbso559659766b.2
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 09:40:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVOS0DcxzPxVQmLu3XybI+oSh8QKXOyR0SwAamHifHFKgfqeRqHRK6K3HcFMM7UdtPo1oPMVvmO8Y1YLA==@lists.infradead.org
X-Received: by 2002:a17:907:c0e:b0:b87:6bea:d48c with SMTP id
 a640c23a62f3a-b87968f7f32mr965975266b.23.1768844452848; Mon, 19 Jan 2026
 09:40:52 -0800 (PST)
MIME-Version: 1.0
References: <20260114072552.731974-1-vladimir.kondratiev@mobileye.com>
 <8afa0702-4d30-86e2-5afb-a7c113a92dec@kernel.org> <AS2PR09MB6296A1D1EF4ABD1C45202440948BA@AS2PR09MB6296.eurprd09.prod.outlook.com>
 <DFSQIY6WV4U7.3B3RY31KE739B@garyguo.net>
In-Reply-To: <DFSQIY6WV4U7.3B3RY31KE739B@garyguo.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 19 Jan 2026 09:40:36 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi2Y3MuMb+HMROL1+Jx8khu8QQnSX-_dmqTWX-kw7i8dw@mail.gmail.com>
X-Gm-Features: AZwV_Qha7z3d67OJeGtbYWii9aM0vb7UuhkaTX3ZiXm-RakiGezIh4mX1yDj8Es
Message-ID: <CAHk-=wi2Y3MuMb+HMROL1+Jx8khu8QQnSX-_dmqTWX-kw7i8dw@mail.gmail.com>
Subject: Re: [PATCH] riscv: support CPUs having only "zalrsc" but no "zaamo"
To: Gary Guo <gary@garyguo.net>
Cc: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Chao-ying Fu <cfu@mips.com>, 
	Aleksandar Rikalo <arikalo@gmail.com>, Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "olof@lixom.net" <olof@lixom.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_094057_064294_E59A01C8 
X-CRM114-Status: GOOD (  10.41  )
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

On Mon, 19 Jan 2026 at 09:17, Gary Guo <gary@garyguo.net> wrote:
>
> I'd be curious to know if any kind of performance evaluation has been done.
> atomic_inc is quite heavily used in the kernel.

LR/SC isn't generally a huge problem in itself - the problem is
typically that it requires a somewhat smart cache coherency to not get
into nasty "almost livelock" situations where heavy contention can
make things very unfair, and while the system on the whole makes
progress, some cores may end up starved.

That typically isn't seen unless you have lots of cores, though.

Of course, any CPU design that then left out AMO instructions in the
name of simplicity, probably *also* didn't put a lot of effort into
making the cache coherency have any kind of fairness guarantees.

So the platform is probably garbage for various other reasons.

             Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
