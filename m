Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A972C00140
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Aug 2022 17:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FZTSS3OB+7DMQS24Uv5kq7pdhyJIde65giYJXkvBl7Q=; b=ynlFJ792iOpXLy
	OhVp2+LgBtiAmr7qyij3z/wAuq/JNbSCtCyorkLZI/4JQsQwZJpgYMdwpz9Hn/ks9ddwX+62r/4Eb
	BfsHvTqKknrYSh9MYIN+EDD2zOIEB18x9S30/DM9Xl0GX+Cu/K7vYnbSy68EVwy+eqzIWshDWwx7X
	2yXVsZLa+urInHccVmGIuNKEDay4FcR5eBy9xcA7vPnjSWRVd41xPfhM3XipyyUiQ3VdZXQPGYkWS
	4V5ABrndai74JdUGEmVhKrLwyfT8uFr8ctOpV+kNAUZRfG+Y1iH2f436YOTHIXY7lCjowVFevPD5t
	IBvxQNNmYj92D1F0361g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIvyn-00GHhO-Be; Tue, 02 Aug 2022 17:46:53 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIvyT-00GHVq-Je; Tue, 02 Aug 2022 17:46:37 +0000
Received: by mail-io1-xd2d.google.com with SMTP id x64so11213846iof.1;
        Tue, 02 Aug 2022 10:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KjAZA+RBJyFCRVs3/+3jiKse67/26F8E/TlaG4k7TyI=;
        b=G1ZC9vkFJ4/eIUWgdyFRStYtBBwbb1Zif38+6Kd6XjFeJpq0EDYF5HEYZANxccxOAb
         HmDVHGEm41eETriohYDDkKfsfhiS1kgVPFbEY4rtweJ1QJ1w8sFeRIN71ItWO6BPmvwR
         8ySNPXjJA7WIgGsGRmXgKwdyXVub6MJulx221Nk9d5iPBQyqj6nT41qN3sjBcMtODkzh
         YVggKsNuk881EIvL8fVF0dABkRzDdp+uzsz7L1RfHwhrgeGxg09GhCRL77vLtcefM4Z1
         g8BDmDPc0IdBGSMtP/pcTI7F8/Li326UqJekszusX2sd2U1KdEOWLdx+003Nps6DRXrj
         M3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KjAZA+RBJyFCRVs3/+3jiKse67/26F8E/TlaG4k7TyI=;
        b=PV5QrenVtVGIHi20v6nGYgGQ1O75dzyWpX1xboTCEK4ILNH0jlegpN87+9yn9EvOOF
         7GGcGIyMEh5NdxYyZMvGWieGFto8eCjFKyEi+vPK508RjOK23U8e3fRcj2yKBjyT/xl4
         FsJuWkkmlHUEwPLvZsX/NhkeQy9UPvSnpbwFeVtHVWHAjJeaN1tMX4kIGqQXobsXVK2b
         QQNeqVhhKrPQRM3G0hreZHovTfQ/hhgbh3CiVRACHPYSVW1PJF6KmhO8Tw7/iodE+jPm
         CNOHCcGuHITQZBpgBDxioKbrD0fXxKgs9ryaziD/STI77Z7aXpMvh/VxmWr5bt3ta0+M
         dpxA==
X-Gm-Message-State: AJIora+BKHl2dO3hd9AnybEsUQIYc32/mbqBlj0HpblXYvDKg/zc9P92
	bCPnC8TFotW+hU13PN1Jdo01848I4q6p72k8V5w=
X-Google-Smtp-Source: AGRyM1sTchBu9DJxxSaHL1GJ3B7rxsIGwFJokjusWYxkrpam9ZondCiC/NMBhmRLcxl3wlnfbZ37BaFnTFAFjGKVsvA=
X-Received: by 2002:a05:6638:25cb:b0:341:6546:1534 with SMTP id
 u11-20020a05663825cb00b0034165461534mr8585003jat.308.1659462388257; Tue, 02
 Aug 2022 10:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220802015052.10452-1-ojeda@kernel.org> <YukYByl76DKqa+iD@casper.infradead.org>
 <CANiq72k7JKqq5-8Nqf3Q2r2t_sAffC8g86A+v8yBc=W-1--_Tg@mail.gmail.com>
 <YukuUtuXm/xPUuoP@casper.infradead.org> <CANiq72kgwssTSE7F+4xkRrXBGVgHeWxCyjeZ-NHLUXWnFjMyTg@mail.gmail.com>
In-Reply-To: <CANiq72kgwssTSE7F+4xkRrXBGVgHeWxCyjeZ-NHLUXWnFjMyTg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 2 Aug 2022 19:46:17 +0200
Message-ID: <CANiq72=551t+CeiuCZz-SSx+uDaz238xjDFMRmkTwRuSFNcqmw@mail.gmail.com>
Subject: Re: [PATCH v8 00/31] Rust support
To: Matthew Wilcox <willy@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jarkko Sakkinen <jarkko@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-um@lists.infradead.org, live-patching@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_104635_923471_7AEE9796 
X-CRM114-Status: UNSURE (   8.55  )
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

On Tue, Aug 2, 2022 at 5:09 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Yeah, patch 17, exactly (patch 11 is the `alloc` import). I have asked
> Konstantin privately about them.

The patches are showing up now in lore -- not sure if it was just a
delay (which would be consistent with the lack of bounce) or somebody
did something (thank you if so!).

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
