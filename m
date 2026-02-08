Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58315EF06E3
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Feb 2026 14:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:Cc:
	Message-Id:Date:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jzy6a52lnLnmtS/BUlb+UNZwsVs5EAlRrUd27QVH7UI=; b=cAOlhKn2lr22Mv
	LWrXfe0R00UU+VBGkVzN4cZfI846g0b5QdAqOK0o90XiS9P2kLX4SzMt/FemBvtE+JTxXDx7nlCqx
	+JSNqjg6u7qUUWypMCoH2eCD7C03ED87d9OTlSypmEwdwpKbL1EVJOAh16ku0/WJPtJjsxkfL+UTX
	WuO2TMSID76jfpvvWXl67EVOJltXUSEhL7XOHLV0o1ONFWb1z/JcD9LuV/TK04c46lpLshhjFsioW
	7cN2rPA7WAgFxJekgpvSFLx0+NqEuSG4rJHH/myFovAOKgy6YhMvb0m9Ehbvt1yOAip0KRRDnoWBG
	VG2ODv9ozD0OwP8LXcHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp69y-0000000DOnu-3i2Z;
	Sun, 08 Feb 2026 14:53:14 +0000
Received: from mail-dl1-x1242.google.com ([2607:f8b0:4864:20::1242])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp69w-0000000DOnb-3h1e
	for linux-riscv@lists.infradead.org;
	Sun, 08 Feb 2026 14:53:14 +0000
Received: by mail-dl1-x1242.google.com with SMTP id a92af1059eb24-124a1b4dd40so125213c88.0
        for <linux-riscv@lists.infradead.org>; Sun, 08 Feb 2026 06:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770562391; x=1771167191; darn=lists.infradead.org;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8h+xkqNhYlCxgIu3rSmKZo7/K9DidHR1ZXFR3pIVmKY=;
        b=H7kaPH8yj4gmfShT8a5vNGfaQIjebDt1g2zyMgmiuoAHet0QCxpDiepusYcnqWyWEA
         yLDYPTKeD/8FlGY2vzsKAnl+IA1ChMa3XbLXpma2NcgBGuev2L2n/kG4rfwGiJYbIZGo
         m/TaK4Z52KTIlGXb57IYVfD0JVBXdtpcKIof9MInkxV6n/S7o3FFQS7vev/o9o6LTZOS
         fL6W9Zaq8oVzpLVKy5kVLuq2nSCyZejdRbL+aK654zBaLyGKLKqabXxqvmpKZDbGWL0E
         q8Liiqed4AFemfOICVTS/oa9/pGFQ2WkNPAukkXhzAt608JKwFISMaXUpUNiPUBr5aZZ
         /1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770562391; x=1771167191;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8h+xkqNhYlCxgIu3rSmKZo7/K9DidHR1ZXFR3pIVmKY=;
        b=rqb98Gc+a/qdMhRRjeBR0qcPIMccdMV233f1HlDV1nnWz4ZQppSx1PD+SszamQSTAi
         D0UYd4DIPRG3RohF/mjsaeSsbfl5DwjchQhTgsHDEX6XvychlmgK5Tg1I2UdOWhKJ2UP
         BlG66WPJJj3XNU0TFelYyiXHF0wGab0fihzyDc6Qd9EJ++2Vdj3LFVXQzV8uTv3W0ndn
         9iA4Jrr/YEy8kR4qgzzPGZsqpA6DKAr40bEe3cvtZmeYkht7/zsE7ETAE9uYUrW5YjHl
         XFzbqdWz25H7ozR6YMR9RwqC/1WEX8VT2RejWyePwOHCkkmnym/ZPn7exeQV0ln6wc51
         SqQw==
X-Forwarded-Encrypted: i=1; AJvYcCWEgwjZOxJ2pqPQ9YVJdAkWYHy8CGmJl44NbAYE5PgA2YnZpYXFn6BhujYe82PM6uCNJiR4KAj2la+ldg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxoOqI81BAZ745otoKEzTUpM578cV9MI/Htkd6H6ttM3N264e9r
	4O6Y6EV5dTM+p4kZ715CyqhqGUJQhdIkYyQ12uuDYY7orend+ro4fDc48AVjZFK/
X-Gm-Gg: AZuq6aLoPNMPtYzEXotj27YuapFdquft3FK6jY59GICz5xltQoWV+Xa3R/IF5aMFj31
	r3/QbJFbpxf+/LD3Yxd2cv/OrCCftqI5+YT3LE5bgxSzWxKq5u1P9CyamvkERjYftvboBzdT8RX
	ZZK4h0RqgqzaJl3ouhNoSsklBHUlK/GWjNajcTRwInV/nbBqutttL+FV28kJCC0VAfIJCJF1Mz7
	i3cIn4qfovgtJjG83N0Iqk9ogGUlZ00cSrwxXxG7R8aJfqCDszcFuoIJFVgwtO0UIw/eNyQ1oT/
	6xAYjENcwjlo9XIg21lKI2dfgekowFVE44wvww5ss3tJs4ijgUpTA5SBf0qMV2y21LQFvdvHK8+
	vRn7lMA/Di7SOyUcRFNanCzcNGEr1NRV4+C77ZJzDBiKITaKpVbjbm3fUINHvxgH2YR1mWlmwjP
	m/Cxoxge5LkRGQZg==
X-Received: by 2002:a05:7022:ff43:b0:127:874:af0a with SMTP id a92af1059eb24-1270874af69mr3714033c88.5.1770562390862;
        Sun, 08 Feb 2026 06:53:10 -0800 (PST)
Received: from localhost ([72.11.140.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm8128977c88.8.2026.02.08.06.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 06:53:10 -0800 (PST)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Mime-Version: 1.0
Date: Sun, 08 Feb 2026 22:53:07 +0800
Message-Id: <DG9NZG0N2T3V.3DZ7YPCZAMD36@linux.spacemit.com>
Cc: "Andi Shyti" <andi.shyti@kernel.org>, "Yixun Lan" <dlan@gentoo.org>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, "Alex Elder"
 <elder@riscstar.com>
Subject: Re: [PATCH v7 0/2] i2c: spacemit: introduce pio for k1
To: "Aurelien Jarno" <aurelien@aurel32.net>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260207-b4-k3-i2c-pio-v7-0-626942d94d91@linux.spacemit.com>
 <aYiR0VQXvBJDSQPh@aurel32.net>
In-Reply-To: <aYiR0VQXvBJDSQPh@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_065312_922522_CC1340FE 
X-CRM114-Status: UNSURE (   9.28  )
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

On Sun Feb 8, 2026 at 9:38 PM CST, Aurelien Jarno wrote:
> Hi Troy,
>
> On 2026-02-07 23:08, Troy Mitchell wrote:
>> This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
>> enabling the use of I2C in atomic context.
>> 
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>> Troy Mitchell (2):
>>       i2c: spacemit: move i2c_xfer_msg()
>>       i2c: spacemit: introduce pio for k1
>> 
>>  drivers/i2c/busses/i2c-k1.c | 316 +++++++++++++++++++++++++++++++++-----------
>>  1 file changed, 236 insertions(+), 80 deletions(-)
>> ---
>> base-commit: 2fe0719258a48c204270366ef574066122e81924
>> change-id: 20260207-b4-k3-i2c-pio-318088c1b3b7
>> 
>
> Thanks for this new version. This is:
>
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Thanks for your tag. I have collected all of your tags in this version.
Apologies for the delay in sending this version.
I hope it hasn't held up your patch queue (p1-reboot)

                                  - Troy
>
> Regards
> Aurelien


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
