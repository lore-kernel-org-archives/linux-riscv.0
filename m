Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA453C27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 11:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=41kl0JgQZ6pBhjnOnAPU+IwE2uc6jpY3Bjlw5D3k8wU=; b=gErrkTbwaIIe2f
	uhdjEdvb9fKxA5liGZ9BNrgWnBqgzAVQgg/LwEvM1bKbw56E/cxGF5Avq53XKOaeI8kOKd00/lX+S
	A4n/90+t5Apafu2zOPE7mcR+aoiQZM3n8dRgTDaGr3ThmLDKGu9SLFUMkAmWkQZfSiYmUvKa3y55Q
	YSI380/sntNEMGupTaF1wXwwg51R7DOlStmYIBHNAyDX3EwnB5/qtJw/2il/ecq6LswnCAmQij/br
	CWOHq5+pgDLyU7nNeLuaHTK9WuOFd6Jrv5RvFiOHjJ3Ns/CQrcpjMJAqq78DaeM6wTSwz0K+E/2tS
	FN8nKcmgsdwm7+m6ZT4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKcGN-00000008tep-2JAh;
	Fri, 21 Jun 2024 11:17:03 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKcGJ-00000008tbw-0KDD;
	Fri, 21 Jun 2024 11:17:01 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a6f04afcce1so221143366b.2;
        Fri, 21 Jun 2024 04:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718968615; x=1719573415; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=08k9pna/opWaEBAg76zcgK1RSow47jGdPu4ejDMD8xg=;
        b=MlamOlfkK5OeEgL9FdQejWdQBHcOkTCFRUJLXJE5YKrPnptzOElWSL+XP2VbJLELwy
         +cZmXoCnfHDQSrr1KicIQjuE1pXz+aVRvaUPRYXsf/yCy1MOETpNG4FRrpaTk7S4513g
         vGr4bFX8ao+bcIA6dPRN0Cm/qAbLsZh+8mTNiClw/gcdUhRL9zdNtvEVGmIwKjrclgDy
         mOC6aX7jPSpDxckmsXGPBZogIKi/K/o2Zv07V4Rv6CIJS7f4d/UFX90DaB1HvR3giEN0
         i1XTiXfq8Ar8Jfl25+jZGhISUmjqVZfQJP1EygIvZWq4/W4IDC4oOM3BWM+QXqVEuCtu
         GkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718968615; x=1719573415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=08k9pna/opWaEBAg76zcgK1RSow47jGdPu4ejDMD8xg=;
        b=SQ3GUXs08cjBBnxYJ0Xxwun7FepxW2ixwKaOQ97Gca1Lv3yV2sptWyvjNr7RsTFWhc
         BTFkumooCq3jL4YBt3BZRqBacqukAq3BJU55QaHenyWOMa3VxAyGCgaCsJIuBR8dSqhO
         S7M+CbTlpW+WqSvItMjMTAxYY0h0ZQCTif3pPmaaunfmhvRd2GrSeBn7GxnymmcTGrxN
         kEOUTjynhIy+nvDD+Lb7kalA5fij7ZhH79/wYcFzrsES/WkX/UPZbR1ig8nuxOBmFjik
         BO1sEXPFH1zpAzT76su8oplk5539f4PX0aK64qmrm7amh/JyG8w3s9RLj0HzdseeswtQ
         vyjw==
X-Forwarded-Encrypted: i=1; AJvYcCXWFNIdIjCA+vVlisRM9mqbDdlxZkZcdUBzkP4VQ39trvQ9znXFqujULDJgkvVMAR4aBRNJTqmGPSLw8ZMO/2r1m5MY4dqk9YA84KFDkw==
X-Gm-Message-State: AOJu0YwbVnjoyjxlIzHgZH6mgdvQGcLnq9OmNjJ4wI4jJpaEO4VKwSFb
	rHocCjO679t+RVZlZg0FK+us9QzpfQmLZQM44H5UzX8yPWMfu0YlgsEVTv3m
X-Google-Smtp-Source: AGHT+IEQA9JTSUlACGJxZV6P42mF5Qfs1km1bZk9sSrb3zLaZehHEY4QKzeHjWVfBYdo4222YzZQ1A==
X-Received: by 2002:a17:907:7625:b0:a6f:53f9:7974 with SMTP id a640c23a62f3a-a6fab7791a4mr539231866b.52.1718968614880;
        Fri, 21 Jun 2024 04:16:54 -0700 (PDT)
Received: from andrea (host-82-50-195-19.retail.telecomitalia.it. [82.50.195.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf48b7desm73263366b.90.2024.06.21.04.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 04:16:54 -0700 (PDT)
Date: Fri, 21 Jun 2024 13:16:50 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor.dooley@microchip.com, anup@brainfault.org,
	atishp@atishpatra.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	christoph.muellner@vrull.eu, heiko@sntech.de, charlie@rivosinc.com,
	David.Laight@aculab.com
Subject: Re: [RFC v2 0/2] riscv: Idle thread using Zawrs extension
Message-ID: <ZnVhIi0Jre77i3RN@andrea>
References: <20240621093223.37893-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240621093223.37893-1-luxu.kernel@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_041659_368740_5008F6BF 
X-CRM114-Status: UNSURE (   7.01  )
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

> This is the second version of idle thread based on Zawrs extension. We
> rebased our code on Andrew's patch series[1] which provides basic
> support for Zawrs as well as optimization for spinlock.

There's some feedback on Andrew's v2 [1] which seems to equally apply
to the later, mentioned series/submission, and hence to the series in
question (although only indirectly admittedly).

As an additional comment, please do add  linux-kernel@vger.kernel.org 
(the LKML) to your Cc:  list on patch submission (again, this applies
to both Andrew's and the present submissions).

  Andrea

[1] https://lore.kernel.org/linux-riscv/ZiWCP6f6zZ3dKXfN@andrea/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
