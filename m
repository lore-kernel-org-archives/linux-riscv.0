Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC6AC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 00:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oNPFcwrOM/RLikwy24+QKAh3YOnH61Jdia2SPAfwG6Y=; b=tF/U+L3f1UekJv
	P0GiY9T4P9KOnED+9RwB9Pivmz/J+XcMhub+PCrs6VaMv9rTj9LgjkAxrjSF27WNMrZWw2H7H1XVR
	uXdXoeIyMwXu5kj01AA/VBJHPxtDTtjHSdBDn5nluFVupj2o5xnkX6KkXskBey3eO1oZXN2U9o2P4
	G34jq1MLP3uBgvN5wjSXthz/Ad5N5GQD4fdeZ/5Sq29ZjataYKxtNjKwCqQQjyhldfb+tCggXiU1L
	lFA6Ov7xqLVwczSzZIKT6rj+GOC1xCKDtIOHi9PQ5pNJB88mYb6n3oqXSNuZhYtvV+24pDZt9BEMc
	E4Zv6Psqz635zEjZ6nfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2LGK-00CwwG-0D;
	Mon, 13 Nov 2023 00:57:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2LGH-00Cwun-2h
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 00:57:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699837028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JSnhv2PPOYa4ZnCU0cai1bmRuczHu96zHiRWZODUn4U=;
	b=JIEKbx0iSQdpX0FzLBFeca4pVo9PpRzKrNE5sISMEF1tFi1eCuP+8sR/YBVpTFFnHRdvt6
	ya7HB9jqGdgH/BPKJTcYFSgyUFhDH5Y2G3hWygrkQyftU+3MLhhIxc+z70qQYeHmnL+QYu
	WDdJ26M6r3kSDk0YUbQUk0/YbjG/aDI=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-7ZNNOQ0sPC-QZWe6ETNE9g-1; Sun, 12 Nov 2023 19:57:07 -0500
X-MC-Unique: 7ZNNOQ0sPC-QZWe6ETNE9g-1
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-5be0d708b04so4156623a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 12 Nov 2023 16:57:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699837026; x=1700441826;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JSnhv2PPOYa4ZnCU0cai1bmRuczHu96zHiRWZODUn4U=;
        b=jqUCNRjbcYPgXQbc+tSo8ld0nrBzlLzhXSlqczXbYfUUtCzc9+XFeO1fHArlkLQ70I
         FrqslGp5EQ1iiz+pDc9zGZ7OhYyuWXMhiUnPMzWRbkR/sFHw53ph/1wiBKquvuFEq7as
         qBKMyzkDGWZMbfE8icV/vCRfsjJ0PnTMMFLtAay/c83eyzVsmgMStJv18RY6QhwgLwyu
         QREpgfT3SPw4hj++XKqNqFnoQq6ahkqjQFOYkM2ucmJ+RIhKbrg6yXhkQNnAf52u8x38
         u5aJkQKZfWa7DVNXJQmBN6BjnPN0G37zaES7NACs0PWhdOGc8NEKdY+M0qA6k17wej5M
         V3Dw==
X-Gm-Message-State: AOJu0YxEQaUKNQX2tU5qu4WZNT3u6o1g7zSmaaFpWKeJq4Rr2HRLDQsu
	Em6c7i9i4E+FL9U/R1jDIN9j9LsGZ6GpqNJrigNI6gyIgHMCij9sHDLNTH1zNm4w87ZcpFhdNv+
	56Rbt5RF4FPxQwmGz8XWNcRJxNtoR
X-Received: by 2002:a17:903:41c1:b0:1cc:5ed4:7b4c with SMTP id u1-20020a17090341c100b001cc5ed47b4cmr8056807ple.35.1699837026076;
        Sun, 12 Nov 2023 16:57:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYB8Gjvjb9rpzJlKa/gGoy1/kAMp5o6DcRuutNzYMQOmMyg/HSI8WRyf/v5bwebYCVyW6+ig==
X-Received: by 2002:a17:903:41c1:b0:1cc:5ed4:7b4c with SMTP id u1-20020a17090341c100b001cc5ed47b4cmr8056788ple.35.1699837025799;
        Sun, 12 Nov 2023 16:57:05 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id h4-20020a170902eec400b001b03f208323sm3058989plb.64.2023.11.12.16.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 16:57:05 -0800 (PST)
Message-ID: <2c597d46-9e15-4059-9386-a811fa7b65dd@redhat.com>
Date: Mon, 13 Nov 2023 10:56:56 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 09/22] drivers: base: add arch_cpu_is_hotpluggable()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org,
 linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com, James Morse <james.morse@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JLQ-00CTxK-Ln@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JLQ-00CTxK-Ln@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_165709_974012_37B31605 
X-CRM114-Status: GOOD (  10.76  )
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

On 11/7/23 20:30, Russell King (Oracle) wrote:
> The differences between architecture specific implementations of
> arch_register_cpu() are down to whether the CPU is hotpluggable or not.
> Rather than overriding the weak version of arch_register_cpu(), provide
> a function that can be used to provide this detail instead.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>   drivers/base/cpu.c  | 11 ++++++++++-
>   include/linux/cpu.h |  1 +
>   2 files changed, 11 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
