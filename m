Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D807BC28B20
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Mar 2025 22:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1BKUWH5Z7+HjXzdg4oLHMT4t1SyqJ4QmViAlusznF9Y=; b=vkYgKIjBDGZdF5
	jBOOuyRFDFZ5Tj+epCuuJXeNb92TTTg3qpkSQNshZevqhYQLqUggLcj2AZXChK+a5q4a548GtnwdL
	RkluEBgZA44z36QAzFWTwfmS7hxG45hrEb4q3ene26ESed7Uh6NyHZmrXDuriUTBmCymKKmQIq81k
	IHnKYY5qe8FyLaQamnhEMJX7gIa9H2HeHOHYXN+wWrMHYzBT7+E73ZMmmL+iRqFYO18J+8NLSb7yQ
	CUgY3aMmWvyxS0WEgOpw7mF511aP6U1Ej/Yn3JVna17NITQo/I4JoJNNQqbVFqr8Jw2dnCTXmJUQX
	O1XD0W76RsT+L5zQjbBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyI0O-0000000EON3-1sSC;
	Fri, 28 Mar 2025 22:16:48 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyHyd-0000000EODy-2Kh5
	for linux-riscv@lists.infradead.org;
	Fri, 28 Mar 2025 22:15:01 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3d5bb2ae4d3so8891545ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Mar 2025 15:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743200098; x=1743804898; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RUbOEFaJOAbY7faqDFBOHIbC1ZRfCrfheNTZ60rM6cc=;
        b=Th7+HsSlWiBico6V0kDZ/tqCfoBO1YA7c8OhukjFq2epgd852XhssimYjHF4OQtHix
         Jpi6swO89ZaGJVG2f53kRiNYy7o0EnuUPWmVW2P2nnSlb7TbRwjcaL4XYEY3LvZnKP0j
         jMuko5MGItIIv0UzN+xY0gRGXFWuDsb0kbCeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743200098; x=1743804898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RUbOEFaJOAbY7faqDFBOHIbC1ZRfCrfheNTZ60rM6cc=;
        b=eAOLYKA7VwrxEwnCNZ4iHleYqcNycUyS+7o21ultUAkRh6/Fjnj8IegOdaOhILEkjf
         iLquwDVDaLhUBr973VMRymTA9ucG21i0BDtPcxLXGOKYRcayqO+4SMf7zbSjEfBxGDoZ
         Pmpp8iki48dNzNSghK8Fgs6ytHo/2zHezWhku9pCKHETqPW42gzSvQ6qLPSHnvBPiX5p
         5pQV7b0b5kdXP5KK39DvSmT0ktr9+h4ovLzFP3zDWCdUpgZKPMoaI8SWX1Ec2bDpwRHo
         sKC+q58/ja5/2uo7YNWmnunK73UGNR2GJP/HTbHLzZE1tml+PYwDoyVJW64fTqAi1Uim
         TWXg==
X-Forwarded-Encrypted: i=1; AJvYcCWoK0JTEX0hPmQgEzqsAVgxyxo59nkCkKNmC4gFoK8BAfGXmkkgiqun+T6NDC8Pdx7ZN2SjkX8lYvGGFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrfHmmauuMY4ZkXG1sjPJItR4yvxkSDxSHyG/tvZJ8/3XZr7JR
	iCwBOfwuekhEY/XhdXd+6xWTOHpyARFZQ+wsvj6cU58c/Z89B0LOmKP6bSEbwz0=
X-Gm-Gg: ASbGncvWcJnEmwzDWKUWc1RX8UgV6sma6+XwiGXGHmvfzAxWkztCLSeJ8d8QR2eRzUC
	gV73itbRrJJYO4i2XLmd7BGqiA6/RVvI4JkAYThKaAt2EUIdrXFNcRtirkIAMDN1oV0WkqIe5s/
	CTzmsbF/gB9TXjx0OPxc+MQbK8b/LipSN/PgJjufcYkwF8uNd+X2i8wKrkesiX+7tc33f1sjice
	DSMLFuPx/X9dIS/4IDOB7trb0lMglK7KwYC39avWVhLAUaJHFwr2J9Z75r9ldBJLrJ0R2qnPoU3
	8r8jIDGvupmWkcID7uFSleS71YMyiE+EopQSvSk9b1hfzeBuMIN0ipc=
X-Google-Smtp-Source: AGHT+IHAgQaNQm7V/HQ9xhZOQz/Fs6tsLI4+HRU2b6hOJkb/FR7IJnx7J0M2QjLjv4gsNmH0eGf+NQ==
X-Received: by 2002:a05:6e02:3807:b0:3d0:47cf:869c with SMTP id e9e14a558f8ab-3d5e0a004a5mr11036025ab.19.1743200097993;
        Fri, 28 Mar 2025 15:14:57 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f464751ebasm643215173.57.2025.03.28.15.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 15:14:57 -0700 (PDT)
Message-ID: <a998f3fa-495c-4165-884a-a11c5cb61e96@linuxfoundation.org>
Date: Fri, 28 Mar 2025 16:14:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/14] Add support for suppressing warning backtraces
To: Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow
 <davidgow@google.com>, Rae Moar <rmoar@google.com>
Cc: Maxime Ripard <mripard@kernel.org>, Kees Cook <kees@kernel.org>,
 Alessandro Carminati <acarmina@redhat.com>, linux-kselftest@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Daniel Diaz <daniel.diaz@linaro.org>, Arthur Grillo
 <arthurgrillo@riseup.net>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 loongarch@lists.linux.dev, x86@kernel.org
References: <20250313114329.284104-1-acarmina@redhat.com>
 <202503131016.5DCEAEC945@keescook>
 <20250313-abiding-vivid-robin-159dfa@houat>
 <c8287bde-fa1c-4113-af22-4701d40d386e@roeck-us.net>
 <20250313150505.cf1568bf7197a52a8ab302e6@linux-foundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250313150505.cf1568bf7197a52a8ab302e6@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_151459_723430_CDDED3E1 
X-CRM114-Status: GOOD (  11.00  )
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

On 3/13/25 16:05, Andrew Morton wrote:
> On Thu, 13 Mar 2025 11:31:12 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> On Thu, Mar 13, 2025 at 06:24:25PM +0100, Maxime Ripard wrote:
>>>>
>>>> Yeah, as with my prior review, I'm a fan of this. It makes a bunch of my
>>>> very noisy tests much easier to deal with.
>>>
>>> And for the record, we're also affected by this in DRM and would very
>>> much like to get it merged in one shape or another.
>>>
>>
>> I was unable to get maintainers of major architectures interested enough
>> to provide feedback, and did not see a path forward. Maybe Alessandro
>> has more success than me.
> 
> I'll put them into mm.git, to advance things a bit.

I haven't heard from kunit maintainers yet. This thread got lost
in inbox due to travel.

David/Brendan/Rae, Okay to take this series?

Andrew, Okay to take this through your tree - this needs merging.

thanks,
-- Shuah


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
