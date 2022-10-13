Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44167C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 19:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Date:Message-Id:
	Subject:References:In-Reply-To:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NuuLKs/f+R2Qht0s5+BXPU/UcOJEMPMTO+JFRf/sasE=; b=mVVVJgDEhQXv92
	S6PpFIOBmzoRPkYJvv24wVKkVse/RxDoS/jGlKtS6ae9zjv5P5UOvsoL4+NZjJE+6XE9xXD2Q0uSh
	Ju5WAEPtHdZ0tMfowHaZyCuNLzNNxYYc2NwF2mswGkjXYAj86yTXOe/hgFchdVYmLZM4YcLa1RmWz
	8jX961BYDg7heHPG+/ciCuHqRGfvIqWDt804maQDIUD7uED64f8HaWS1l5JwG3IF+wFGTB5kfHK2p
	EyApX2xQp3Ucr3h3e9IidDe9i2NYcbhu1+r9+5sqNxVLBBVC4wZjd+lcw0WLHg3XSmkSkoAzHK6se
	sUTnCpXJI/TzqAczN44g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj4Bq-00Crht-CR; Thu, 13 Oct 2022 19:48:22 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj4Bl-00Cre7-07
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 19:48:18 +0000
Received: by mail-pg1-x536.google.com with SMTP id 128so2457415pga.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Oct 2022 12:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pT0WZwzWJXbUSL4g5q4il7bObISoyHGAnumZpBqL1t8=;
        b=r3uaV9ZNyLou/HKvgjWXZYe2wlhlWtjfRukHhN234MSrrPquwuyhD4WF0lfl7KY5vP
         qBSMUpkNyKOViEe/aYKhse+2EQ9d6cttCOrHx1kqb8OE67BwtUj/Uf60ojHpU+4pwIss
         KBSXht6vTeHlq4tZO3jMxunsaltsALrN8jMmU7O6u7UfRudu4UgRipp9/M8pvqKiO/Vp
         d5fgF5g+c39lOVUvGWiaaEFy5zX+PM2AynxbCOMcn5uNfUhF83X5V23pQJYfEGqOUasN
         sb8FI94ArNlk6RAzl1yx/JdGfi1OQTp8wHz+4aK74+Do6FGq4SF2NfMT9pHzqFQAv3JS
         eZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pT0WZwzWJXbUSL4g5q4il7bObISoyHGAnumZpBqL1t8=;
        b=IPAzGVW+5bZV9oo5TdYB9uB03pBQWnRU3G+597FaHU14jZMomPxkG5Z4lwk0XewER6
         nWvg9+RritWKzXQJRzpSHKHvyexe/z62OTLPJBAK7M7wRYkeuCLD+DPjONbiU9wo48PQ
         wcpiDLZ+PABh/q/SLMb0BzZZNRwlPRnAoEdS/lNM1ghApujG0AsoaQBI5pPR3fDL4Ms4
         Dm2OcqfYS76NE7PPL2O4srLrSJ5tN3UjRKqFiu+8oAz5ReNp+thavvZjjqznr1buSdm6
         0cAxghIwdPITklqNgSZYPn1Hr0ogUYDrTqiZW+tE0QvqzYnhTh03hy3fQfD8qCV2BPff
         9+9g==
X-Gm-Message-State: ACrzQf3CIt6Bm57x9fm3isfajTw74orsggMKICgt5etH/FzaGmI7QXbO
	WgNOyvQdFi1+nmGY1De9BC2bYSpkbGAU9g==
X-Google-Smtp-Source: AMsMyM4cRSBo4dkOC37HrIyT9SC0XkVfzCFHGyMXChE+rTuWibS8pnWgeFKNSWTWm+01HlLAbqZ6Lw==
X-Received: by 2002:a65:6bc4:0:b0:439:8ff8:e2e1 with SMTP id e4-20020a656bc4000000b004398ff8e2e1mr1318148pgw.91.1665690493887;
        Thu, 13 Oct 2022 12:48:13 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id w128-20020a628286000000b00562a71d719fsm71842pfd.155.2022.10.13.12.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 12:48:13 -0700 (PDT)
In-Reply-To: <20220928131807.30386-1-palmer@rivosinc.com>
References: <20220928131807.30386-1-palmer@rivosinc.com>
Subject: Re: [PATCH] RISC-V: Re-enable counter access from userspace
Message-Id: <166569033640.14806.5465239876406037308.b4-ty@rivosinc.com>
Date: Thu, 13 Oct 2022 12:45:36 -0700
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-36ce3
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_124817_054627_E0A96184 
X-CRM114-Status: UNSURE (   4.85  )
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

On Wed, 28 Sep 2022 06:18:07 -0700, Palmer Dabbelt wrote:
> These counters were part of the ISA when we froze the uABI, removing
> them breaks userspace.
> 
> 

Applied, thanks!

[1/1] RISC-V: Re-enable counter access from userspace
      https://git.kernel.org/palmer/c/5a5294fbe020

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
