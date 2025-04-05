Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF58C36010
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Apr 2025 11:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E5QfcelbQ9hAa72IiPXKy0d/CEpRjAMfWbfEiDRVsiU=; b=GwYAO1l/n1kX5b
	/UUU4MrqdmWrhR3n1gfNghjLMbLRIPdieQNms1OIRmfg1aP3JLSA7/NbN3/DrU093XUjrNnzAVXwT
	SsN7uwJI0CUjcZCAExDkp+8YqztHXvm4Aq1lVA0p8gBEJ172/7tlw8WAGvaYGycm2T3slKfpwLMmS
	DZa8yV2oFnsVgkrot6VTHG40J4F0a8vLNOWDe3HMKK+af9v5Pjqrfq9WJ9KdAUFPNJkGHvbgVwip5
	IeTckAIbLHJbvG/0demmemUK9T+710ZM7aTP/8IWtyyjuVfmms2MzRHAUyxEI4n0U2WYEvyhJTK2D
	d1oU74i61ryrGcub3AkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u11ce-0000000DtRK-0Upg;
	Sat, 05 Apr 2025 11:23:36 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u11cb-0000000DtQm-22aX
	for linux-riscv@lists.infradead.org;
	Sat, 05 Apr 2025 11:23:34 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-736aaeed234so2400880b3a.0
        for <linux-riscv@lists.infradead.org>; Sat, 05 Apr 2025 04:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743852212; x=1744457012; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZX20hU9jsDEvNi8QMGzQFtvjq3DSEQK4C5TXMmOIUs=;
        b=cbRX21QZVztNsOyw3DoK/fmgAuSWkKIHUtSHWcUV2EqqXhXaecrPmV7HLVx8x4ZH6X
         USZUBu3R+AZUPZGksUYly9nlQZhxsiK4GdMOK1YhSbnPzPtyzrgRMCBjdJuCWKUJWGdB
         hlfQcufxUKnHllPbX83BGRMRflBCXvH86WXofkpxEV2rDXnHf01w0EznnK9Uh2xYMd0r
         iNfHS+T7W5eBxjncpMkKdIvlYIf5+DTd4NgHMA3Mn3+9+VQvSZhXuCk18oOmDHkeoFDG
         JmtlZ+iuP0Fh6kKz+zZq7jRkQXooCoPgbvbJUUkiHfeGlM9h1qfOs0Nlq7aOmCwLer5U
         wZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743852212; x=1744457012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RZX20hU9jsDEvNi8QMGzQFtvjq3DSEQK4C5TXMmOIUs=;
        b=EDkCppWXELgEIl6uw3IsAtQRycDP9ap58Cawv6habyhiJbw2IS4pjuJHYG+ohdWahK
         c/cO6rhnVUDtW229qVpuu+mqoX2mLhFLah/61tSQG8mgk25xJnBPgGunoajnyaGCkMf7
         VMrC5IYnPbltF164EucAQaNTNg/jmFGQL1ELSmfvotj/GujFpNAhj+OwQB+jx3z+xW/m
         zruLZBzmBFn7W3klSW0uiEXhl+kuk9M3GoVu5sSOCHGc0TBdCw2nEdZUy43WzATE5Q/Z
         ZsodSReDIJYPnA1HNX5N/8+xAIW+GJ4eeePbq3R2D2TZmekKH0OsUUEH/ySqjXb/Y5hk
         sszQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6OIdDD9hQSIhx5TRlknlC6dAN8qPCXLkm2hv9VBbflPkwaLsIlH9AoFgNHd6BFcq2lgADv8ayhNpJgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxNKAWmAoivVVzF9PZSm2yz3AZ3wmbCC8OUFhZyVC4cZSFhma8
	9ckcxiZG51+UXcVDok8Ze3TqsTeN1WvQOfrfDDGuNodGLdj08ga0
X-Gm-Gg: ASbGnctcOrzm3BH4KUx/U5MBMmhVA0gKzRYSSp5uNg+QvikF6l1YDEJtFvUsUsuc4am
	3JSKGBHzPUKQxcIBKvEVIoRtylT9h6zXHBt4mcT7sJ0qXu89F4byv0/kDHcpAijKEuimAnXb4Sa
	tJNb9tOGjDcDDj+M74/VYC4FAnUNJTjQy+qJZ213BXElPiObzkGuMVmatm5sL2KcX4DClM4ma1k
	09TLe8ySULCq5dCWCWRTOeOryghmqzSRuRnAvB//p8hbhIGlaHdB21bKWzawniTvcLQsz4b+Z6K
	sBDWjd1cdGqXa3Af56wYm+ip9iS5kNxEE4Eafge6ibtCziLiFFf3RYshqGVXKWlxNPpoNOU5qph
	T+n/C5h9iObg2q8azxyFBYNoNRwgqIlY=
X-Google-Smtp-Source: AGHT+IHTCLHBH921U9jgvr7Q+b2IjSfmOh/lM1Ct6P/k/BHbW31WYiU2NAXxIwif55l65eP3+wzArw==
X-Received: by 2002:a05:6a00:44c7:b0:736:34a2:8a23 with SMTP id d2e1a72fcca58-739e7120149mr7511611b3a.15.1743852212232;
        Sat, 05 Apr 2025 04:23:32 -0700 (PDT)
Received: from localhost.localdomain (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ee7absm5178968b3a.58.2025.04.05.04.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 04:23:31 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: gregkh@linuxfoundation.org
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bigeasy@linutronix.de,
	conor.dooley@microchip.com,
	jirislaby@kernel.org,
	john.ogness@linutronix.de,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pmladek@suse.com,
	ryotkkr98@gmail.com,
	samuel.holland@sifive.com,
	stable@vger.kernel.org,
	u.kleine-koenig@baylibre.com
Subject: Re: [PATCH v4 1/2] serial: sifive: lock port in startup()/shutdown() callbacks
Date: Sat,  5 Apr 2025 20:23:07 +0900
Message-Id: <20250405112307.485386-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2025040553-video-declared-7d54@gregkh>
References: <2025040553-video-declared-7d54@gregkh>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_042333_529558_8A6A8C0F 
X-CRM114-Status: GOOD (  12.27  )
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

Hi Greg, thanks for the comments!

On Sat, 5 Apr 2025 08:35:44 +0100, Greg KH wrote:
>On Sat, Apr 05, 2025 at 01:43:38PM +0900, Ryo Takakura wrote:
>> startup()/shutdown() callbacks access SIFIVE_SERIAL_IE_OFFS.
>> The register is also accessed from write() callback.
>> 
>> If console were printing and startup()/shutdown() callback
>> gets called, its access to the register could be overwritten.
>> 
>> Add port->lock to startup()/shutdown() callbacks to make sure
>> their access to SIFIVE_SERIAL_IE_OFFS is synchronized against
>> write() callback.
>> 
>> Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
>> Cc: stable@vger.kernel.org
>
>What commit id does this fix?

I believe the issue existed ever since the driver was added by commit 
45c054d0815b ("tty: serial: add driver for the SiFive UART").

>Why does patch 1/2 need to go to stable, but patch 2/2 does not?  Please

The patch 2/2 has nothing to do with existing issue and its only the 
patch 1/2 that needs to go to stable as discussed [0].

>do not mix changes like this in the same series, otherwise we have to
>split them up manually when we apply them to the different branches,
>right?

I see, I'll keep this in mind.
Let me resend the two separately with 'Fixes:' tag for the patch 1/2. 

Sincerely,
Ryo Takakura

>thanks,
>
>greg k-h

[0] https://lore.kernel.org/lkml/84sen2fo4b.fsf@jogness.linutronix.de/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
