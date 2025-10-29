Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C94CCF9EA
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 01:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Agi8gV8i4CB21lQuMg2u1l4O2uysM7B12Y12FpY5W2Y=; b=U61d9rCTqwWF5S
	DYSTmSGBGezB14prNMBnDm4Wxg6YYi02+c5jXdSsbGEfwXvdIxl4FlYvx3bu44J3W8NsHyqHgXBm7
	0oN6lEvLgApVgmsKW9E8iMC3RJz7sjv7OJOJfTSEEHvcLZj3zLfJFy36UABCQzC3RttYbkslF/n81
	JXMMVe7+xhK3RaVZaBAaQxXcasIVyyEYYoqxSXhTfX7cRfkdXvemkAFLCgBDyyYhJI6pBfPcUdsdi
	/eGEjIbJMgdLV9SGdVN5OShotHlMYb6oi6Wb+90+uZmCZ9LuAcT/2sqVn8IgWZPvyiN3IktjZVZIi
	24xz/bRn/8HiG1Pnmg/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDvD8-0000000Gvy4-2Jl0;
	Wed, 29 Oct 2025 01:42:50 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDvD5-0000000Gvx5-2Uky
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 01:42:49 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so42947505e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 18:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1761702165; x=1762306965; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EWYacNbOuERW4OojK9bgZfknBThRIQSN+JVixz2GaWY=;
        b=YoWwKAn/YIR1gLuELdl4LxRZApo/qA9e40maQe+O0vgtEsgwH3kla/kGinhWjgdPFz
         vl4zs7iKpzoMMfrEo7D3tcwcaQrZ8fqB14suO7PDt7JVWx8CBEEG7xJLukHDe/Lweqnc
         7/u2Ouw+q7zSo5vWeCVpQPRlL5zfJt0D3cwy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761702165; x=1762306965;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWYacNbOuERW4OojK9bgZfknBThRIQSN+JVixz2GaWY=;
        b=e9k0MN080yPeeNaaB1linUYYZekAE4vTc3UmD0Qd0XKcww6S8hbU/DVTKzoF7obg+4
         FYPDFlWjgHCNaMR6azsBStIUetzKLdizq6BCNFQBK2RYFfMcTqwkX6pmLoVgGuBfAPnw
         y747Lu3jvRlxIoEkcdBS6FOmG+wt0Of6uZNsFWOGCk8HJe6hu4ogh9lI3r1ggTte24Qt
         93RIVp1z7r8GF6r95XRCBGRn9yHNfOI+gsaTQawchfxQp1YJCtQxcnIDLkUpwh7+J5iX
         bVpDAP5oU+/ZB/fYVh8aHbvt1svmqrxDHMv2MchNvcExokMqbaYsimQpMBFDdY8IYrYe
         gIPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6DqYMt4H/RZYYYh/qKL5rZNK4NHCbpWIx/ImwrSE+qikPjQMf/s2AstZVHsomq5vHSYxclupN4hW7yQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGChNQ5q2EtxmdpgZcgze+uP5a0I4YPQwdftrphbCX49CIcsYR
	VHA5eN0BadxvgeGReua+Zd05Bjv8vHRyJEQMY7GrPk3dVgAfTaX1A5PWvMAtq2OaW9M=
X-Gm-Gg: ASbGncsos1xIz/6YJwhX82KtYesKHN27iyKaxkxKmRL8PpkSJNt7lufnPqbV06R/zIP
	64wQTWORypqQmoFSZdl3HXDf6KW6xjrF01tis7V0NMJMyf4Br26HAx1cWbWmd+pSrMc5h5GRSEO
	5j3w6QzoN3nPYzVCekYqzWyQxMTLrsL0Rwkl8gt+4XRb8fdAmu5BgMku/qWKtb+oX/2n4XUaLNo
	+4cO2CnIoPEHhD8C8XWwdbIaWL//bmJG+WGM9QPELth2+b3ADVGgnNPSdHm9/78VA90gS1fdStA
	JQWg79iwQ8h4SxXHBrIitj24RSP04vxjxiX9eFEIe4+jwXQw3iKDKSGq1LM1OdcnQVqv6imkzup
	LkEdg6LwRJ391KIw0jVt97GpE///9QJ5HO48OOvOsE+qUSaSV9C6QYha9GlZAGE2I+so0kXatuz
	0KwmAu4MbCMlkvVOXRv4HHSFeibUICoS8S1Fxybj0GhQ==
X-Google-Smtp-Source: AGHT+IGqI9jtOex3Utdbx/Z1nQq99SV5FMBT/ydoR0q3MNA+77+i7Qo+Sb3m9MO+Mv1x7c12EQbYmw==
X-Received: by 2002:a05:600c:3b1d:b0:475:dd9a:f786 with SMTP id 5b1f17b1804b1-4771e1f4075mr10435015e9.40.1761702164908;
        Tue, 28 Oct 2025 18:42:44 -0700 (PDT)
Received: from [192.168.1.32] (host-78-149-11-196.as13285.net. [78.149.11.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e196b27sm21805305e9.8.2025.10.28.18.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 18:42:43 -0700 (PDT)
Message-ID: <5bc35f89-1b77-4c0c-b6ea-fe9b2cb74870@citrix.com>
Date: Wed, 29 Oct 2025 01:42:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: torvalds@linux-foundation.org
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, axboe@kernel.dk, bp@alien8.de,
 brauner@kernel.org, catalin.marinas@arm.com, christophe.leroy@csgroup.eu,
 dave.hansen@intel.com, dave.hansen@linux.intel.com,
 david.laight.linux@gmail.com, edumazet@google.com, hpa@zytor.com,
 kuni1840@gmail.com, kuniyu@google.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mingo@redhat.com,
 mpe@ellerman.id.au, npiggin@gmail.com, palmer@dabbelt.com, pjw@kernel.org,
 tglx@linutronix.de, will@kernel.org, x86@kernel.org
References: <CAHk-=wiTN=1Sm5DVnXDtQ-tSiPuz-7QVpgP2vt6LgaEnhbubfw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] epoll: Use __user_write_access_begin() and
 unsafe_put_user() in epoll_put_uevent().
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CAHk-=wiTN=1Sm5DVnXDtQ-tSiPuz-7QVpgP2vt6LgaEnhbubfw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_184247_669671_34C635F9 
X-CRM114-Status: UNSURE (   6.46  )
X-CRM114-Notice: Please train this message.
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

> Yeah, clac/stac are horrenously expensive on Zen 2. I think they are
> microcoded - and not the fast kind - so effectively serializing.

AIUI, Zen5 is the first uarch capable of renaming the AC flag.

This make STAC/CLAC "lfence-like" in practice on older CPUs, because of
an implementation constraint of not being able to execute speculatively.

~Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
