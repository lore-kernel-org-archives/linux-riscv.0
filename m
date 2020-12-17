Return-Path: <SRS0=FwEc=FV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BA6C4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 12:26:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3823E222B3
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 12:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3823E222B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2xubafBhuEAuhPx/Rj+5Z+4hAlk9m3XsRCsWi54dtWc=; b=ysHGcGw0u++tR4
	oC8ESaolVBOYoDcZ//RFLH5MvWpoNtjxNQ8GriTWHkkKPvvhF+Jg3R3vt7e3+Di7snv+Qjt7RCtIw
	os0Yai0j/uQNSyZawGnjYHz+0lr1A+Cvw3Ku02jncgRxpTUXvv51Zo/kaxVf6jfyhJ7KjLCIGN2EQ
	EDy9x0EOU4BJkOuCs62LSUW7ApOh8RIs0GL2bA2Wqdfn0DzvCtv6yBJcXmYHgE0YyCNzpmHpEFdUT
	2b/pi7bers4iNXJmnEeNhBwczR+cPWC6XCGvSfuaAgpFmiDwAppsaG8HuQNXgcsTjY7ExAlAuuC9W
	tdgxH7L13hI6Clmw+zvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpsLx-000699-CW; Thu, 17 Dec 2020 12:25:53 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpsLv-00068Y-6D
 for linux-riscv@lists.infradead.org; Thu, 17 Dec 2020 12:25:52 +0000
Received: by mail-wr1-x432.google.com with SMTP id 91so26390405wrj.7
 for <linux-riscv@lists.infradead.org>; Thu, 17 Dec 2020 04:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=KZbr9OOBVECBNZeY7Oj4pAoQSTgNksiY0KEYRPr/Q3s=;
 b=IZ11l0VpPddx5JLCXAmCZeupIXiEUMRbZdQxzfx+rPPs3ulSw5xvpVp0RqIymAlTIf
 PzpFwL6OQlH9uf+jiLQvaHagbNXVt9QtnFoP8QTLNIeF8JXqUjkV4hnuyWC5o0bKAUjO
 95TX1tMHyuBSsDwHvaW9LEkBvJjAEK9H4ic6Y3PjxVri9PYxyl8MwQwaJ37M25swJQbS
 IJVBmmFT1w1ryWsFARNEiwKXyC1fRzCB9xdwNLlJy0qW1PYS65Rio+FK5HpyCL3B1NHQ
 bwd3rQ/YL3zMpuvoPv+688wy6lHQujOeFahq0yBxOHKqsu9ftJbUf/zS6Ds2J9nA44i2
 owWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=KZbr9OOBVECBNZeY7Oj4pAoQSTgNksiY0KEYRPr/Q3s=;
 b=a4rBf+H0k77RhHCNEHhCxGIKVMfxoRxfqrQaijYXoxUiwvsOwuQ8hN8TjjH3JaUg3C
 H7+0VW7+FgR3tMSNE1oO+AMJHTG6C4fyKkfWk8iCocTAf4ZYUSg2Sthm7rHMT3wkrD9L
 iFdazDHhqkzX/t4Pftkfx/N/+Oz4MoVXwdkbWU3mv+sXAXfGEPKbY+T8PyC4rK6UQaCb
 jJ19CpbvUVWn9DAnK9MTZ0nP6Tdxcx2qsm1adv6Ipdv4jzV2O0/F7EIoxXI0j9DwYVpA
 dmbHMO2cTRSJ6Ygt2t8aHPHIaZQa/d6JgMvsprf7lG7qAIGk8txBgeWNPkL/6hPa5zMD
 Rpww==
X-Gm-Message-State: AOAM5317dSPk0O1MV3ebsu1qSmOqI9AORo2IAjLPQvTFQQrgLXeGi3g7
 4gtR7rv53IJwWALfsGmfzvMhg3ajeuGb9w==
X-Google-Smtp-Source: ABdhPJypvXYsqtXIz0uA0tDGK3dLtyicplOvLaETdUQqZHv5q19AcSXnOgOtdxA1UkEJUWqt3jf7Zw==
X-Received: by 2002:a5d:6cc9:: with SMTP id c9mr40347098wrc.411.1608207947605; 
 Thu, 17 Dec 2020 04:25:47 -0800 (PST)
Received: from [192.168.77.163] (ip5f5aa659.dynamic.kabel-deutschland.de.
 [95.90.166.89])
 by smtp.gmail.com with ESMTPSA id b13sm8636262wrt.31.2020.12.17.04.25.46
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Dec 2020 04:25:46 -0800 (PST)
To: linux-riscv@lists.infradead.org
From: Varad Gautam <varadgautam@gmail.com>
Subject: Looking for a Roadmap / TODOs
Message-ID: <5684d662-b0ae-15d7-687a-3cf9daf174d4@gmail.com>
Date: Thu, 17 Dec 2020 13:25:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_072551_339328_818D504C 
X-CRM114-Status: GOOD (  11.69  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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

Hi linux-riscv developers,

I'm interested in getting involved with kernel development on the 
platform. ATM, I only have qemu available (no real hw), but I suppose 
that could be a good start.

I've started looking into enabling CONFIG_RELOCATABLE + 
CONFIG_RANDOMIZE_BASE as a first task, since I found these missing on 
for-next [1].

Since I am new to the riscv ecosystem, is there a checklist/roadmap of 
things missing from the kernel where I can find stuff to help out with?

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/?h=for-next

Thanks,
Varad Gautam


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
