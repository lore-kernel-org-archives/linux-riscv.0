Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D875CC3ABC3
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 16:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YBtAycX5Sx7xZVo9v0jAlZxjmngtEZ/def5DOmRgr8o=; b=1FTkXT4Ahc+Ovk
	K1yAVUUg5w5R94hBbMpw+aQcAKe1YM4uKpdjtiFS7S68caak3q4Af7fZt8qp49Nqc2kfla20XYvY4
	dMuvMwB7abd2BV0kVL0klZPKCuk92/4ciqsMWu1VNJ0SOly6rb5o0OTOutho3u/TD+wac/3DD/7zW
	bBkr74pwqSrKmqYgu2ij7cdrRBtUCXfZitlnPJbPKrlqU19UlLTzeU3QUilzLIoVeZ3ScW5EFRL1L
	k/yQVC03E0mdjVHOrfF7rAmM5w1AiBatC7uSQAEYRAChHw5BSxeNgDFXz9nR1jlBgC+VzTsSVGHVv
	Us5S2jymTKpaFQVaUYpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEWGO-0000000A61q-1oj6;
	Mon, 12 May 2025 16:44:24 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEW00-0000000A2UG-12vE
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 16:27:29 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3cfce97a3d9so32997115ab.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 May 2025 09:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747067247; x=1747672047; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tAY5Ws/2zHP7f1+msXoBsYcHSMzdc5Is7v349rd+4sk=;
        b=M7bOlt7rF1pnLELYMql8p074stxOlTjLEbUKsNDmDU/tqtMQW1ncDnoHR6d/KnUuL8
         BzexrU6TBXDa9enolRPPgkuD43Lcbi9MfEyxnMo2rkCUKK5K6oeov4qTrHpJmIwRw8K9
         iZNTU5U2RFwl3Qpb21T/XE55Wp0a8rqNNk+JdCaIsSuJ0X04ycn1vW863joM+HOaVh/S
         FxpwUCrCAMjEXu8K+CWIL8t/MHrcsrRxXZ19F+a2NWrHrb475cBSdRYqIMbjcq3jKFN3
         jvpw/nNv5bU7Je8Z3/6WVQKLaX6Y6NlqBHOAkoGrWlHZEHimGhJuHbhrteIUTxlS4A6M
         oc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747067247; x=1747672047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tAY5Ws/2zHP7f1+msXoBsYcHSMzdc5Is7v349rd+4sk=;
        b=f4hRaggwy5e+igBrVRvi0XcOxqeVwFidQyonzg0iLv2g1zto+8ZXUMRtVWYASM/0tR
         UAr18mE1Cjm1TJ+WTL9fdGzD9yJnizah+eiQTLYztTKxT2kdrbmT6aUyndMIFIawGG18
         ddUe9pnidpOUo5y0d2I8z9nq7LIThD5QIGZcr+j8DQ5JtrtlAlVy+sJW7IpQ7uGAVJ9s
         MBom3laYJb6KHJ8n2HaKRjFUwjF23ZpGRMisw8G5dbzS7u0MNcfgSgMuidoKdgI889+F
         1z4xtGRwJC1hB6TqpYFcozXXvShM8ehpCjNoo0VoTCAV8i4gsLFGWEKhRiDYqQhShUUf
         lpPA==
X-Forwarded-Encrypted: i=1; AJvYcCWtG/WuiyrvshnacxggN6R6pHGXLFNFoDCWTsIfI0i3Ovp3hzPIR7/t7tOSAjJ/lJENoQQ6wNK6qfZRMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXVXkMd+9o4OhMV9Q14A5eKiPsS4yBNscJT+RaHOm6/aSHdEnc
	+QlWtDqakVhBHPALcAiG3JaV+5KXMj//5syEvsn1FbS9vgi2xR/3I40iSxmtEy0=
X-Gm-Gg: ASbGncssoUqirPqkSktcAp43RrG1DI8wAVQEAv3L53JQLvFwO2FzGLlTaDTOmlY+bZj
	Nl4hiNaXfludy9rnHFlg/Azsdo9TrpadnyVZiDo78Vrzrb80xsdWC4FQeejFEc8WDTp7hC7U8tW
	HxmLs+cXT5dgjrVvIIq+Rtyua2ZuaDFr6q6Lty5HxtDrlU52G47t3TbuFvKQVfo18VhtvOFSWoN
	5p4qGt7/oDhhN7NzfsMvcPLXHGOHA7Yt/uPAaJyOQ6UJ5xq5/3Bm0HEOxmzKyJ6czdotHxR0zC5
	HFOBcCE/oXLshyaCRR60tDaUGz0PdYbQu5A2B8uxnPgly5+6cf2fA0p5CshbVJvhrBzaM6PAkVM
	1eYJwqK7oEwT8XCDRAbzNSjSMiw==
X-Google-Smtp-Source: AGHT+IHMljbBOih9XI5ChNfY5x9ORAxK3ZQZvd0UNipzv1F6zPCMndWOAl1ZZJYumsZfCVB/PanfHw==
X-Received: by 2002:a92:cda7:0:b0:3d9:66c7:d1e8 with SMTP id e9e14a558f8ab-3da7e165314mr150329395ab.0.1747067247243;
        Mon, 12 May 2025 09:27:27 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa2a9ac275sm1503877173.80.2025.05.12.09.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 09:27:26 -0700 (PDT)
Message-ID: <5674cfb0-fabe-4b58-98fd-8479c4d3ff79@riscstar.com>
Date: Mon, 12 May 2025 11:27:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/6] clk: spacemit: set up reset auxiliary devices
To: Philipp Zabel <p.zabel@pengutronix.de>, Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, heylenay@4d2.org,
 inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250509112032.2980811-1-elder@riscstar.com>
 <20250509112032.2980811-4-elder@riscstar.com>
 <20250512135429-GYA517867@gentoo>
 <abfd4c78-2592-4b8a-97be-109a8fd1bed6@riscstar.com>
 <91afcfde275a28127ba0df962a9abf4d07ba6b8b.camel@pengutronix.de>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <91afcfde275a28127ba0df962a9abf4d07ba6b8b.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_092728_302794_0BBB3254 
X-CRM114-Status: GOOD (  11.76  )
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

On 5/12/25 10:46 AM, Philipp Zabel wrote:
>>> so I'd assume the underlying device doesn't really care the id?
>>> but with different order of registration, it will result random id for the device
>> These things are identified in DTS files by their index values
>> defined in "spacemit,k1-syscon.h".  If there is a need for the
>> assigned device ID to be consistent, I'm not aware of it.  Can
>> you think of one?  I think all that matters is that they're
>> unique, and this ensures that (for up to 2^32 PMICs).
> If there are multiple reset controllers and the driver can be unbound,
> it's trivial to provoke a collision by keeping one device bound and
> unbinding/binding the second one until next_id wraps.
> This could be fixed by using ida_alloc/free to manage the id.
> 
> regards
> Philipp

OK thank you.  I'll put together v9 of this series and will use
an IDA to set the device ID.  Thanks again for the explanation.

					-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
