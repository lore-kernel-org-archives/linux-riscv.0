Return-Path: <SRS0=QS6p=P7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE62C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Nov 2021 21:52:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7943160FBF
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Nov 2021 21:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7943160FBF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=a6J4ezrUMYdhiw18YRzSUN0STMpd9fRzq94a2RjDlIE=; b=IbIEwzQq0A7RNbQfvSDfMjcdfM
	xRnHe+BRDd3AAV2wYB5P+60MsMT9W2WDiQ941ZTMD45EmA1tF4IcRS/HUlBMcv7IUXR5H3RA90i0Y
	aScZQxqWFSer/j4R9/PPPxO4mTccs5P6nDuZ378+2UxT9Nzw2sa8e9IqcoVqtJ+swTpFkiBc3cqGC
	wa1WDx7UC1PP0A5fNb20iN6vidP0nVDjkJYKnwriApCWPbRDMpFf37soF4GuH0e4+L4EohUTckVVR
	ra8T4vWOC+nYQa5/HmICkgloo1qlJ0JRv4Q5VanQ7KA51RB3+CNYxxe4A+iuI2ut8w2/aKo39hVG1
	elf0xLuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mleTb-00BeGh-QI; Fri, 12 Nov 2021 21:52:51 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mleTY-00BeFV-V1
 for linux-riscv@lists.infradead.org; Fri, 12 Nov 2021 21:52:50 +0000
Received: by mail-pl1-x62c.google.com with SMTP id y8so4018687plg.1
 for <linux-riscv@lists.infradead.org>; Fri, 12 Nov 2021 13:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ANGtRiBuH7W5lz4MAhh+1EIghppJj6tpt87fCZ9Im08=;
 b=EEfeFvaAPlQ5UrnzruceLnzgqGeLnQNeSft5NxoAHIx125qUbbMgbakB+xT6q4ZtHT
 JDhzBM84OdmsPG1SJ2ixCFGlr1//0kU5lB8p9PB7POOmlpYjltmR39TN4TZDtP+zx/IP
 URN9ems4qD3EkiNQ8tajXbs1suzS3uBJYgjYV96LK5R5FeaDQBgOiPNdDvABVnNU9pPM
 NYomEwmwPSnTiSQoLHD41hkjgOln46OIPJuSncYTZfystCW4HZhMjKWd3+NmFZISCox9
 ZjdSt8S2tuKQLK7E9SBLgYuXt70cJy7eimM0QJrvpnb0uVu40kssaiYl79rCrHeNjcpi
 sX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ANGtRiBuH7W5lz4MAhh+1EIghppJj6tpt87fCZ9Im08=;
 b=1aj/hKcTAWTrSPf0APzVypsoSNxmrqBC9THauU2/Ny8o5AUC0kdGPXrghEIEtQlBar
 HJ/RJ+dv0dSknospNmx92/7OCl7kh/gt75DkS7/HXFC5WJ78J7YfofVoOycxEi2bPVEw
 Xbnx+U5kHvz92Koho4DJIJaEr4r99wTuR+e3/WM6GKsSCY1WGD0QTUJkA16sT7RpadpD
 aHpWB+HbF2RVb0zdlbNqAyGkbfy75tu9+ba0zztkq6ljtZ+sh+h2F5+xoHw4g3NxRct6
 +iUlerWPaYUzQqVZljf1qqKQgUbdk2rA1cSi2yj9FxDooqC8DULUZLqimZ3A8WuKLGX3
 lsoA==
X-Gm-Message-State: AOAM531cgiRA04WZy/+u5K+BKxVjQMVnIdfJ24n8UNuuHf/0JVVFebfQ
 ANtEYE0DdGqRFAe8A/nsRJEPfg==
X-Google-Smtp-Source: ABdhPJyC7MkUqX+Vo06PtKpg4AaN1sPiv/QSwbIQMW5YrbN4z210PwCJTcTJytum2Q1jSD4kIX5nIw==
X-Received: by 2002:a17:902:860b:b0:143:87bf:648f with SMTP id
 f11-20020a170902860b00b0014387bf648fmr11696909plo.11.1636753967481; 
 Fri, 12 Nov 2021 13:52:47 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id z1sm5461684pge.4.2021.11.12.13.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 13:52:46 -0800 (PST)
Date: Fri, 12 Nov 2021 13:52:46 -0800 (PST)
X-Google-Original-Date: Fri, 12 Nov 2021 13:52:44 PST (-0800)
Subject: Re: [GIT PULL] RISC-V Patches for the 5.16 Merge Window, Part 1
In-Reply-To: <CAHk-=whkh5Qma5rHtiRQXF9jVRXDe=bRG+D+LFu4dZpwP1uWAw@mail.gmail.com>
CC: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-8aed9afb-1b05-413b-9808-5d0936c9f131@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_135249_088547_0D1B9D9C 
X-CRM114-Status: GOOD (  12.48  )
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

On Fri, 12 Nov 2021 13:37:46 PST (-0800), Linus Torvalds wrote:
> On Fri, Nov 12, 2021 at 9:32 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> RISC-V Patches for the 5.16 Merge Window, Part 1
>
> What's "part 1" about this?
>
> This was sent on a Friday of the second week of the merge window.
>
> No way in hell is there going to be a "part 2" that I would possibly
> accept at this stage. It's late as-is.

Sorry that was misleading, I guess I just wrote "Part 1" as a matter of 
habit because it was the first merge window PR I sent out (it's late 
because I changed jobs and my test suite wasn't playing nice with the 
new computers).  I wasn't planning on sending anything else for the 
merge window.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
