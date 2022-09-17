Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DD8ECAAD8
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Sep 2022 01:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d76rPJ5Wjt/qfop1SBC5AEdq3nZDi0mzmrroDpR7AQY=; b=qQkL+Ps1TUzxBd
	P7pCElS7Z9psxcUD2LQt8OhhbD7mOX7I4d1lzs31EdyoB7xc80qVjHARy4z7AWVkvKvnc1BHCWE7b
	N5QYfu2jfUWb5RSCH75145Gr5XtMZq7bwQwSQ3vvuD2REkZUEhxd/Nbfysk2acQYObg3H69Usfuue
	ou2LYv8ycVZettvni0Zq02Xkx1WUOTYeQOMi3arUjQjrkDXk1fIk58W5YP7M8J5z7hHH+QX5ysbjO
	7sfmRhW1EBNExS6ezzji9n4tUEH3G3XxJeRqrDRFjKpqb2br6h5YI2cC1b2B0T1SfnWWBRTcvTxOg
	hlZrzJ0cFsfBCxR7H4MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZMgw-001PZn-4R; Sat, 17 Sep 2022 01:32:22 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZMgs-001PX6-8t
	for linux-riscv@lists.infradead.org; Sat, 17 Sep 2022 01:32:20 +0000
Received: by mail-oi1-x233.google.com with SMTP id u131so8158433oie.5
        for <linux-riscv@lists.infradead.org>; Fri, 16 Sep 2022 18:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=BlVQwXVfr3GW5iAF6OT2YMTv6rkyyGCnSP6Ag3jREYU=;
        b=KP+HNwDETUuPHLPcIapFdjnoF2cUScO3YXyr8jfUFet6LzZxXtjL1a9d5PDo4/pRYG
         8cdGuQDun45WLXn09gwMq4miu1+Wfmgf5C10SUtvLKiJylwDvbIGKFfHpydRHY1XlmjD
         K4Snl08qVjp19NDbWD0K/wYGVVR1PRdZuW+4u8dKOKo0+G8pjFNiQTGPC2jjurepOjQF
         0h7kbUTkGqbz423D0olnF+OATvKeTZ5SJqIjxYUKnpRtOf56nC+x1rkBSPExdpc5gZJd
         6oQk/O20nbHyGdOFiiLUJZ3EifAF3rSX6cXNMFIQ59Xp/X2vjnv6yz5HBLZd4clS878g
         ZD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=BlVQwXVfr3GW5iAF6OT2YMTv6rkyyGCnSP6Ag3jREYU=;
        b=XSZ0zAXwS4VZCibkuxis/518rSJKqRpZX+dfcx39Twl2qgH6LhIH3vjaOo++nDEBhy
         w5+AgEsEcMiPOhwYZwV9YK/5Hf3zch7WWrkX1hzgTeDfhyZhS6vlk+6NbLx6uEWfKhKH
         cipVU4bovYSvBxaxLGpmfLyF6SjnLGICZcatHclDGgFPrfUR+hv/bchJUsEX8SxHLLRh
         mc5urZwQlevX7igceg4ob5ePliYoPwpDm/b/A0ScgHVFgYYDfqSF9lnyySJyUGpt9Iwd
         Fe4XzK7WlMwKhDKUglq0QJopJOJ/PYnzjhnZRnmp3+nQJdmyBO07pG4/NKz0y7GoML67
         0p5w==
X-Gm-Message-State: ACrzQf0KmB/I8KBpoxXXQwpSsr8YXITMUyuegrntusVo8GyUOjP9sUo8
	MP40kzeC+vp2hy0l/2RR3w01bela60rigEd9NAdI5Q==
X-Google-Smtp-Source: AMsMyM4JyQBf2phyIkZLp3fghM4p+hZVmExpKQsnCaRgJb+PYCFIowVBZpaDctVfmjLRm5A0Bg40Mqp40BiGc6ovbTk=
X-Received: by 2002:a05:6808:49:b0:350:77ce:3368 with SMTP id
 v9-20020a056808004900b0035077ce3368mr956893oic.195.1663378336284; Fri, 16 Sep
 2022 18:32:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220916103817.9490-1-guoren@kernel.org> <20220916103817.9490-2-guoren@kernel.org>
In-Reply-To: <20220916103817.9490-2-guoren@kernel.org>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Sat, 17 Sep 2022 02:32:01 +0100
Message-ID: <CABgGipWdm+-pOrj-ROR8fsVO7JEr4m64z7+zNW1_NszW74e5SA@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: ftrace: Fixup panic by disabling preemption
To: guoren@kernel.org
Cc: arnd@arndb.de, palmer@rivosinc.com, rostedt@goodmis.org, 
	greentime.hu@sifive.com, zong.li@sifive.com, jrtc27@jrtc27.com, 
	mingo@redhat.com, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_183218_389960_7AC97BAB 
X-CRM114-Status: UNSURE (   4.11  )
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

Yes, by disabling preemption and ensuring all sub-functions called by
the busy waiting loop of stop_machine, which happens to be true on
non-preemptive kernels, solve the problem from the original
implementation.

Andy Chiu <andy.chiu@sifive.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
