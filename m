Return-Path: <SRS0=QS6p=P7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2042C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Nov 2021 21:38:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92E0C60E54
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Nov 2021 21:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92E0C60E54
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qFvuIjIBYzAjFz9cdzsk2oc0ZI6a8FTIBQtHio8e3oM=; b=bdmTYtcbn/qStJ
	xPJDio5/PBndgTqE8crJIJCIfW2xNg58UvR2E643CFXMl8rp3lQmQIGgEYLf7fJrj8GRiv5/ygz6E
	3r/Y8UYGLjGACPUvgCvGw0cQawmECpZmrKPj7fnAuj1rnUFwOmCOqnZSQheWP8Doyxuq1vHlWn+Sl
	WmZ2rULaHMrYvi8bi0EGUDlPU0KvbQHwQ6QgWXeswGszwCmnJ31GeEymg6bfOuOX9mBh0i2VZeSoI
	RY2K6YlUtJzYMGafzWqsQDYnuNklWtx+FR8hULo3xmUkc1xKOY1HaGnNfQ/RtavDyDh1AovwM+hiT
	Lbvy+7hex7jp78xUmsZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mleFO-00Bcmm-96; Fri, 12 Nov 2021 21:38:10 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mleFL-00BcmK-Vw
 for linux-riscv@lists.infradead.org; Fri, 12 Nov 2021 21:38:09 +0000
Received: by mail-ed1-x52a.google.com with SMTP id w1so43116725edd.10
 for <linux-riscv@lists.infradead.org>; Fri, 12 Nov 2021 13:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZCxwnQCDR0eJyCVNlEWzdsZAk9jtBC7W2J8msKvVqpU=;
 b=WqzHqDbnt/+jF2n1F59ai/W0Nq428ldUNWjyMV5m32acjV1SvMOR4wyy35SsAX8gRr
 2Fi/Jtb/EQs/rqMVUXtInOKR9oIOkyXzhE+aehxoyYIxN/WaJ6pjCOzBEzhTtgg8Rwv1
 yhNcD7yTSUBHLuzuPFBfYsqx1UjpeyXOvrsUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZCxwnQCDR0eJyCVNlEWzdsZAk9jtBC7W2J8msKvVqpU=;
 b=NLjDiJ+Ug0PO+I4lmJ6ywTu7ny+itHMuLRVBHRRYoH9WBwfgSuFm/v0GHeI1s3MSrx
 J+TChvbqjb9FQPuibeMIeRj7jV1gT7vh0T4ivUlZ0Afz4iiA0IayHYF/Q/kpoubZYf/N
 9wHB0CFUoy6k9szXZqAhdvNPq31K5wzR03DszXcISC5rBXh0XNbbm4ld+veVld0IX8qn
 XIrZz2htaMERXJt2Wp2ojYO+yShTwRNmG4gw4AX+BFxcXyVHqZOGV+ZxscBGX1PUik7M
 lc31ywKSTwFaTxhhBuYLPZBymDaPBxo03HUQtgPv2wTK947uhkPuIHZUOAk56sXNojK3
 sjdQ==
X-Gm-Message-State: AOAM532yv/BMdistRkJYhkJOfoCDSAOgCDnaNb021hNuhNXKg1x55C7j
 y7Nz/NsFd5qG3u7yxulbeqD1mdK1d4+GTTYHDjM=
X-Google-Smtp-Source: ABdhPJxrVn6V+0U3r9rEXZLRCdYJpJz8jEzxdFugxmiMBZdst0PN3B0Wlr6O2Ju0IejrkqIEJHV4uw==
X-Received: by 2002:a17:907:3d9e:: with SMTP id
 he30mr23157429ejc.177.1636753085007; 
 Fri, 12 Nov 2021 13:38:05 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50])
 by smtp.gmail.com with ESMTPSA id h18sm2972628ejt.29.2021.11.12.13.38.02
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 13:38:04 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id d24so17915514wra.0
 for <linux-riscv@lists.infradead.org>; Fri, 12 Nov 2021 13:38:02 -0800 (PST)
X-Received: by 2002:adf:cf05:: with SMTP id o5mr23057906wrj.325.1636753082761; 
 Fri, 12 Nov 2021 13:38:02 -0800 (PST)
MIME-Version: 1.0
References: <mhng-109b0503-bc7c-4da8-8621-28aec8d9df59@palmer-ri-x1c9>
In-Reply-To: <mhng-109b0503-bc7c-4da8-8621-28aec8d9df59@palmer-ri-x1c9>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 12 Nov 2021 13:37:46 -0800
X-Gmail-Original-Message-ID: <CAHk-=whkh5Qma5rHtiRQXF9jVRXDe=bRG+D+LFu4dZpwP1uWAw@mail.gmail.com>
Message-ID: <CAHk-=whkh5Qma5rHtiRQXF9jVRXDe=bRG+D+LFu4dZpwP1uWAw@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Patches for the 5.16 Merge Window, Part 1
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_133808_062707_7554FDF1 
X-CRM114-Status: UNSURE (   7.68  )
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

On Fri, Nov 12, 2021 at 9:32 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> RISC-V Patches for the 5.16 Merge Window, Part 1

What's "part 1" about this?

This was sent on a Friday of the second week of the merge window.

No way in hell is there going to be a "part 2" that I would possibly
accept at this stage. It's late as-is.

                 Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
