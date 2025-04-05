Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B2BC36010
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Apr 2025 14:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lgtu2tv4omHM4ilBcbXEvFngBhnc4OS9Dt/26aI0OOE=; b=yQn7qxT9n6ulJU
	JlA8KTrbPhmuwEQVAUczL03gnc/i9v7iYejVQbnTtM7UKRpN+wtZ1oisgJJfzFHzZk2yZnl76/yka
	+tPuSuo9ecP1kIg3ww/8uP8e5JfgP0bl1ckS1JOFrr+wUeQ2RjG/ANxCNQ6FTJItYRbI2QnZJubWv
	OCNgouXhUQNfhInBMN2IKMY3dZcljHsQAj7sMT+OdmE2iDeVcOhwa5qP+Ql1FHYFDPZpoWWiU/aIY
	QGmrqgcvZ0vNLQZfqYPhMtnXicboxBKXmJFJG7bKAoh8Q+MkrBJpAMKgm2JjjDTiiO8RCKZZBnHvI
	NOLaVVsIYRA33cFvgZ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u14W5-0000000E3xk-0PPG;
	Sat, 05 Apr 2025 14:29:01 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u14W2-0000000E3wt-2oQ7
	for linux-riscv@lists.infradead.org;
	Sat, 05 Apr 2025 14:28:59 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-227aaa82fafso25852695ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 05 Apr 2025 07:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743863338; x=1744468138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahwQ81oXocQBWNsh5IPSlPP/mK02nGlAnWcU1yfQR7E=;
        b=gDHXzVrU04YkXWuLt79JHBEd18egxiG7ttuxP6TZcp+vG3obZVGci+0xG0EA1QHK9Z
         8ESlOCoQIfCp/wZ4Dm/yV9btS8Uheej/1nqVNX3cdQzJ7jzHmgqd7Hb1TRHO/YakG3Bd
         J8X1NjKPpL+zelMLeNxz2DCf9gZYPIrs+tkO0dPmWldfUeGElOK7zo7d1dT+lWQmiSjp
         iyHF8spYalZ3gbeFBfidtiWLcKMlLQ9/Ihrlx4Wku5pG4DQDrBGPKxitnbakqxFhzbFC
         WTzWVT1Rnd1jGFMs7/WsxHPT3WEcLE4U/7o0hxHOUY/qyr4I2GSDz/1bGps/9lssn/E8
         6XNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743863338; x=1744468138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ahwQ81oXocQBWNsh5IPSlPP/mK02nGlAnWcU1yfQR7E=;
        b=Y1h3ZMdsI4BBByz/Z5IveUmxeR6YJMW63dGww4xfQI4P24j3DmiAyzT3IBBPwnzN48
         J453IlEfbdW5UXbk3FLc3+WFg3BiBG3AJxz7I1Vy//OrYp5Q2hZFzfw2aPx0du5E0EEa
         KymSoHocyj8InR6vsyBnMaSSg+u6x9Op2iwpTebyspVsX9G6PxzTgbhv8gBusHX/1yz5
         ieMAJC8ZHqH93KB19cpUD3fgGbuEPYsXLYDeHT1kteYJ60RA4ZfQbUpPKLO3aSmieVU6
         wkyD++3qVwvDWYu4u1M8N60zifS4WegR6bVcw2/AzYTqluY8VuJhuAf4BeqQlIuLuumZ
         GO5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHL1Kmgsa4vcfajNaKnsxdHWqFWXwBjl7fXKCZPqT95vNagJcNO/RHaKyAHPDvqnYnIu4fZNTGmAVwgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAJdS/DfzKoe3JmP/alYqjqhAXKrA1eLrkELPanzqTm2u4ItTE
	61U0TvX3PRoFd1wHbg8YHXNe1vuDI6FrqNx9TamInL2RN1Wz/Ao0
X-Gm-Gg: ASbGncuqlICaiiWi+uVI+vBCz5+wJBIloXEZ3F70go65faFeE4cSQf/3C4QAb6MSIEO
	3UxUBQ0zxUD5W6CKhJvKYeGR9lmZmlSfwpMOKJCfId8xV+jubaa0EhCooshe+QDSGnvQkG3tVkm
	6rHkdtfeMcFr7jEjaXPw1gv/gW3pEoWZMg2k7ejvljdvcf2i9gFthlI9uZ2tjjCT5VERJXGrA/O
	jPoZGYgjPdPUfE5Z5ByThy8HkeIhfB41x4qSupXTsKl92Im6EFiukBbAKagffU9egzCzMDRC73Q
	oL5v5J5RG2B9Rgw9xDQs9yCLpthqztscMR2HjgiK/OjsjKF0MOXcQye3ylAshOs8zRqPIZEmYzj
	dRS90790Nr9Hg56KVfYrqCWEmmCOtZYs=
X-Google-Smtp-Source: AGHT+IErW+VC7cKEtMFmjVemula5pnmsuaKk1cpS31e1xYdUj8s0o8v1uVlk17v8qniHfkpWedVWsw==
X-Received: by 2002:a17:902:ec86:b0:21f:5cd8:c67 with SMTP id d9443c01a7336-22a8a080701mr97537995ad.31.1743863337699;
        Sat, 05 Apr 2025 07:28:57 -0700 (PDT)
Received: from localhost.localdomain (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785aea7fsm50296915ad.2.2025.04.05.07.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 07:28:57 -0700 (PDT)
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
Subject: Re: [PATCH] serial: sifive: lock port in startup()/shutdown() callbacks
Date: Sat,  5 Apr 2025 23:28:32 +0900
Message-Id: <20250405142832.491151-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2025040513-bronco-capsule-91aa@gregkh>
References: <2025040513-bronco-capsule-91aa@gregkh>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_072858_726931_A6E89B1F 
X-CRM114-Status: GOOD (  11.45  )
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

Hi Greg,

On Sat, 5 Apr 2025 14:40:33 +0100, Greg KH wrote:
>On Sat, Apr 05, 2025 at 10:24:58PM +0900, Ryo Takakura wrote:
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
>> Fixes: 45c054d0815b ("tty: serial: add driver for the SiFive UART")
>> Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
>> Cc: stable@vger.kernel.org
>> ---
>> 
>> This patch used be part of a series for converting sifive driver to
>> nbcon[0]. It's now sent seperatly as the rest of the series does not
>> need be applied to the stable branch.
>
>That means this is a v2 patch, and you should also send the other patch
>as a v2 as well, right?

Oh yes. I wasn't sure about the versioning for this patch. Let me resend
this patch as v2.
Also for the other patch, as now its sent as a single standalone patch,
I'll resend it as v2.

>thanks,
>
>greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
