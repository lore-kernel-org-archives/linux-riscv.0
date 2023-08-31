Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96995C88CB2
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 22:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LU+LXGMFolDXACDYb1nSiWo1fFopa5zMEQgGvYjYviQ=; b=WQOGGtZ6GGPneg
	NK8kv1C7oi/XEZ87JmWPVN/CEgJDD8aqUWIPS/iphTakfTt5RhhrCTurhUUqWRdODTvO1zDhrbh92
	yOj0fuhAsj7KdvEyMWDEWAmNrpKh2jPe7S0svlhoN+CVq0pyyTphEr1zTXX607a7AxIJuyCEwx79C
	ND+j6k8LhPi3T/3Q5MSQ0BAx8dVV59ytSQwVFLG8E/xRAzvZqztJdYmXiXMWii+yZttmqD7a82mNE
	iUAL1ocxQLD6x4e7yFPwmB1gxRhNsFrStLrZsGOwbeAJC+pU33ukBkcEujXVyiuMTlEwseCJvDBmc
	Peb+q1VqsIDc9KqTgJ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbpkl-00FsFL-2e;
	Thu, 31 Aug 2023 22:03:03 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbpki-00FsCq-0P
	for linux-riscv@lists.infradead.org;
	Thu, 31 Aug 2023 22:03:02 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-68a3f1d8be2so1133606b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 31 Aug 2023 15:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1693519364; x=1694124164; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8dfGNX8Rkoq7/NROpZjI4omJbSo9QjYKogXlLhPBWqU=;
        b=fBH6+Ja4qkLu5qzLrQ0EQTn2ywfpR/j+GuWVoTp8qegm7BOm9CBtoN4ZQyXD0JCjBg
         CEia0xonTDrosjwBsyjQnxVV6AFLCuOCkTfrSRCq1m75fiBZIn0p3Xewgs8yYX1Yy5Km
         +7QfNO7F8Zq4SGP1ThDUJqW5qQ102MJoEp0TeGOwUG8VhADtTwnkJUhc/1+RIdXvq6kO
         1FEC0HWynHAvq15339CUyvegWLkGzeivKFj5bao4CodUTan+yZmuOl1qUkK+NOHZN3AV
         A1aLeNHK+jafqPqyYAkjoq4D7+0TKaHzJpomUqzFAWX5MTzryPztqx+8ZGdd0G5VyTci
         4hKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693519364; x=1694124164;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8dfGNX8Rkoq7/NROpZjI4omJbSo9QjYKogXlLhPBWqU=;
        b=LE9D6cRqGtKos1i+E/i6XJHwh0qCETC3Zsr+KcitG43HhJhNUn9X+KJQjADP8GMgQo
         X3xhYkFOJVCpIp3ibJKVFAiD1AhSZxEbPCIifnOgweYPbsMHbWIUKhPm96R56GCpvI5d
         6BSsMo4qb+9Wgg0KTq5t4E8gJrAKu6HxRLvrvJTHqFvjrJMrZiqC4V+gaiXZWMkzuLR3
         NjqiGQw7yqRTmQzI52zibgY3HfXYRCmRaiSYMvp5KUYMGZ53LSfSecASBE6e4lCqYLPD
         dxXAgi5ukwaiK8eLZ0CjIJeqDFTmqleaLO2wYA618HD+pyI3oMxuqStqF3BHfo5ugAiV
         r2kQ==
X-Gm-Message-State: AOJu0YyStGMi0Ki0A0A4PFyRpc8BAZ9k2W5MGnFHpZpNzFHCyDauD/1M
	gg4oHR7agQX4WZla/58FgzP1FA==
X-Google-Smtp-Source: AGHT+IFntkoTD+/OWzS+cmusGBk6IRJayi5BmNQmoVdUVYkXVR1Ue6E5NP8Fx01xCU5lVxvZ8zDDGw==
X-Received: by 2002:a05:6a00:9a1:b0:68b:ee34:9731 with SMTP id u33-20020a056a0009a100b0068bee349731mr1322207pfg.6.1693519364111;
        Thu, 31 Aug 2023 15:02:44 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id e8-20020a62ee08000000b00686dd062207sm1717394pfi.150.2023.08.31.15.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 15:02:43 -0700 (PDT)
In-Reply-To: <20230822164904.21660-1-andy.chiu@sifive.com>
References: <20230822164904.21660-1-andy.chiu@sifive.com>
Subject: Re: [PATCH] riscv: signal: fix sigaltstack frame size checking
Message-Id: <169351910642.23657.16115457219052816039.b4-ty@rivosinc.com>
Date: Thu, 31 Aug 2023 14:58:26 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: greentime.hu@sifive.com, bjorn@kernel.org, prashanthsw@google.com,
  Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
  Conor Dooley <conor.dooley@microchip.com>, Vincent Chen <vincent.chen@sifive.com>,
  Mathis Salmen <mathis.salmen@matsal.de>, Guo Ren <guoren@kernel.org>, Andrew Bresticker <abrestic@rivosinc.com>,
  Vineet Gupta <vineetg@rivosinc.com>, Guo Ren <guoren@kernel.org>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
  Andy Chiu <andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_150300_403900_D44EE593 
X-CRM114-Status: GOOD (  13.69  )
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


On Tue, 22 Aug 2023 16:49:03 +0000, Andy Chiu wrote:
> The alternative stack checking in get_sigframe introduced by the Vector
> support is not needed and has a problem. It is not needed as we have
> already validate it at the beginning of the function if we are already
> on an altstack. If not, the size of an altstack is always validated at
> its allocation stage with sigaltstack_size_valid().
> 
> Besides, we must only regard the size of an altstack if the handler of a
> signal is registered with SA_ONSTACK. So, blindly checking overflow of
> an altstack if sas_ss_size not equals to zero will check against wrong
> signal handlers if only a subset of signals are registered with
> SA_ONSTACK.
> 
> [...]

Applied, thanks!

[1/1] riscv: signal: fix sigaltstack frame size checking
      https://git.kernel.org/palmer/c/d77303a57c95

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
