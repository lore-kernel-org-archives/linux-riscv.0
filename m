Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AE4C32771
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Sep 2022 10:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=hLElIX7As+1E2NgQnciVFljQcZKWQugYb1yHyOj7Qqw=; b=wyWaR8qo0+8WIb1qNIcXruIRbx
	y13b+mOtuoJXhqR7C2tswKN+cLHOz5Ntb/P5BxlS48CP4EDYzkyz/w+hFpMaKQRgDlPW7MfggHuMh
	P3xbcQjymyjTJfVHmW4cWl0BEYljumZr1Xbo+gRfbFhxLZDnNwW9EyYjukv1VNTVp5Bl4LvPpLieq
	l9aC1Buanl1uyAbaaUFmfeKM+NzUb3izh5Jxp3yPoCigEbZ/TkWTDpXJPsVTWUP7k4dIpfyNoiJX9
	zf2a487boru7B6j2KGMDA1ABvju2+bXjkocSjEIqhe9kly3FxaUK7MF4DTjzOO9revU/Kyu4yjddF
	Rhb9QekA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZrBQ-00Eeg1-9k; Sun, 18 Sep 2022 10:05:52 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZrBN-00Eed5-GT
	for linux-riscv@lists.infradead.org; Sun, 18 Sep 2022 10:05:51 +0000
Received: by mail-pl1-x62e.google.com with SMTP id c24so3784571plo.3
        for <linux-riscv@lists.infradead.org>; Sun, 18 Sep 2022 03:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date;
        bh=d/wxx4iWyVgQOkswP2hVsavkLpdK+7bXx+tSZhX51o0=;
        b=peuct5ZyDpnnGsosOiZzuaf8D7N7LI9gIpMPjlEX0FzOOn1+dmtES5ugGR9SKR3W3L
         /TggSWme2mTnAhoPHbeXtejFdeZPetfRCOuvhEY4mVOtJgv8ym0vQQhBcijQUpoGKdq+
         dz/dSZaRy6ZqfXA4vcPVPGmGGYr8PZ2YMEo6DuFYIdjX7mMKRUKIQB/D6qHeIy+LniCD
         jyLC0vZEpa5lEt8KGQw7jDIW0LEnKItXHz2aDqrGt94mdqs4tPk2Y4gWsPgRzr2elhAd
         PB80l1yNzo2MPYC3WUDxRG00sASezsW9ys8Cri9yeTZ+G4NudGAdi1/xsjybe4R3iaC5
         Yq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
        bh=d/wxx4iWyVgQOkswP2hVsavkLpdK+7bXx+tSZhX51o0=;
        b=mj/wzgjJyraPfayBQdG9sqp5482sC9zq8A5Q3Gk3AQ/MA6l1GsCG/VNKITzhA9MDIk
         4iZPKA4MC3VSLr7z3UjLbVRJ6weLrPmRfbY5YhMH9DOjDQQAKQ4rvM3mXjOWEsfnGU9Q
         0dqOVLD4hR3RT2Kq/0W38nts5zm8DZwbSqH0eStFVtzRg2PUPRqZHbIxZfZImbYv2EoR
         4w9yozITIy9Vc261I0FfeNanxZAlnVkKvh+39fFg361Qz2veakOrZsbOZgGwvVTktn/Y
         QfFbhuFMWoJ3NNt3OLdqFQ6XfV2twqjjb5uQx43aZsFrbwA92Zb2AxcRYVcUFVlEaSSS
         L2LA==
X-Gm-Message-State: ACrzQf28GgEuCiyVCKVAb1K5RWKAMJEnOjCtCl3TyS+s9tD2MX7zQ+I1
	NbuyaSGXrabn9yfmjSC56AFCtg==
X-Google-Smtp-Source: AMsMyM4h5IDMu3QiJCBrIJE4G+mnm4sAC9KP0Nq9Z8Mg3ntGP4YB4fk85xdOHPGP1W3cMesVpzRCLA==
X-Received: by 2002:a17:903:124e:b0:178:6946:a2ba with SMTP id u14-20020a170903124e00b001786946a2bamr7891419plh.89.1663495548260;
        Sun, 18 Sep 2022 03:05:48 -0700 (PDT)
Received: from localhost (vpn-konference.ms.mff.cuni.cz. [195.113.20.101])
        by smtp.gmail.com with ESMTPSA id d2-20020a170902cec200b0015e8d4eb219sm18366335plg.99.2022.09.18.03.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Sep 2022 03:05:47 -0700 (PDT)
Date: Sun, 18 Sep 2022 03:05:47 -0700 (PDT)
X-Google-Original-Date: Sun, 18 Sep 2022 03:05:41 PDT (-0700)
Subject: Re: [PATCH v4] riscv: Fix permissions for all mm's during mm init
In-Reply-To: <CAHk-=wg0vQFgiBEuJKHzxrS8JB=CxJFNf5WgtaofRn+bqs65oA@mail.gmail.com>
CC: vladimir.isaev@syntacore.com, linux-riscv@lists.infradead.org,
  linux-arch@vger.kernel.org, ajones@ventanamicro.com, conor.dooley@microchip.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-16e91ca9-0ee8-4103-845e-56e9b394cae0@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_030549_572539_7F2EB298 
X-CRM114-Status: GOOD (  16.73  )
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

On Sat, 17 Sep 2022 11:58:48 PDT (-0700), Linus Torvalds wrote:
> Sorry for html crud, I'm afk right now.
>
> But no, this does not help at all.
>
> Now you're doing a blocking semaphore operation under a spinning rwlock
> instead.
>
> Which also is completely invalid.
>
> Your can't do blocking locks in atomic context, and it doesn't matter
> whether the atomic context is a rcu read section or a spin lock.

OK, sorry for screwing up a second time.  I'll go try and make sure we 
get this right before sending anything up.  Vladimir: I'll just take 
this one over and send a v5, I'll find some time this week to make sure 
I can get it right this time.

Sorry for the mess!

> Stop making random locking changes like this. And enable lockdep and the
> lock verification that would have told you all this immediately.
>
>        Linus
>
>
> On Sat, Sep 17, 2022, 11:48 Vladimir Isaev <vladimir.isaev@syntacore.com>
> wrote:
>
>> );
>> +
>> +       read_lock(&tasklist_lock);
>> +       for_each_process(t) {
>> +               if (t->flags & PF_KTHREAD)
>> +                       continue;
>> +               for_each_thread(t, s) {
>> +                       if (s->mm) {
>> +                               __set_memory_mm(s->mm, start, end,
>> set_mask,
>> +                                               clear_mask);
>> +                       }
>> +               }
>> +       }
>> +       read_unlock(&tasklist_lock);
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
