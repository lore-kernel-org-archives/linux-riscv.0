Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CB3606A323
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 08:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JFDX9KT1;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Xy3KArTh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rDhF3WeW+LBPRjwj/RNjA9SPHWVtaDMgURK3AU5EEIQ=; b=JFDX9KT1PH9FFlGEFEBaLFXNVG
	5XSiZBHTSSWmpY6g+58OwGH2bt3rGoVxv50gan2Hy+BCStWI/0bz0ec5klyGCSZRZ6PxqS2b+3sP/
	mhyzpfeCtzBffs5B3JZ7hGNiPea6A4U9J1h5ZneYkogLt4RfoFRX4j2UZcNU0P5CP9SqT6tXVsz4J
	JwWzCzQRu294Dw6f53Dg1KiUnNxKUqDYVJEfrKkKNq96Lho2Yv8VNPAvuxlTIeYb10kvdqFxMsq5K
	oJOY9F51vPgpmC0DSP4fgtOPRpWGRlTN292truHf4pzthBgPPlBMM1I7xDlmsthXqMH7V9W9YgrkL
	6EbbRT6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmnS-0000000C5eX-3fT3;
	Fri, 13 Nov 2026 08:38:10 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmmo-0000000C5Ki-1Y8T
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 08:37:37 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso292687a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 00:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559049; x=1795163849; darn=lists.infradead.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C0F5qYv7gtQEkIA9c8+UTK9jR4byuBtt4GhvmbtO5Uk=;
        b=Xy3KArThCW6mkPlIOHWXn36On0tvWvLRweMMZsRroLw091LI1JkZCS8o58zLwGSYEw
         s1IuDdZVAAGZJlHKK0btA+dqR1rV5ANLtpdaCoew2sRvX2Hu86A9xMXlVOTaUyMEZkGz
         JpEgqWa3yK6I886EZLjkBl6fdvuXLtqQkffQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559049; x=1795163849;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0F5qYv7gtQEkIA9c8+UTK9jR4byuBtt4GhvmbtO5Uk=;
        b=BnXlsMMyvfZyrVHSCRwQ3rq37NXT69Kph59+Issqx6q/9vUcs9/adH8BS7XtjIGx+U
         vuXXdG0G2amcCKbtfqiL3KpV3XmpuJGOV94a2PAIT1tXT/k/j0fGtUSczVrYGfs+rHT6
         vTzHWSb0Q4AwAqlHaefU2iII4IrJJZNWiE0YOMp4uRqHWl3aRiK5KRtANMLJB3OPrd/u
         MXua0GOuWg+xirLKvCvD2gcYT+UFt9WDHKj7Infn16pMSyJigB2E2wiCzVb/qlD+Ht9B
         DZ/PrAQ6ZNBu3DWR8zhrE4q6VWLRurqXXXgVwmCsrQXuyYrBFu39uJ6iyLWlFsXbRtVd
         oOMQ==
X-Forwarded-Encrypted: i=1; AL+hErF0MYXdnNyWVieqE1nbnM2IKD/wP7LgLBZ3mU8IPHoIl19JHMRdscjb5pCPH7XL7jSHTq67ldwdYa9eOg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9TmTYria/PZkyq8CCkGPNQMiQAayuNyy+GCVDrSlTy0NT+8Zyt
	uscFvl79J9mpbgK5QMruxJ0URWpJeujLv5hEbufYaVBoPl8hH6gieREXSx3A6M3S3dA=
X-Gm-Gg: AYBFou2Xw8oRosVMv7a0XR2R4p6cGk1je9TRzCNZ3PZMDp/gMEipxJQZUIeWt+nsCGk
	58GNYOwnORfw0HS6/hlGBz42lzZgGlv6xjpAReBDz1kATzY/8x7USCuvph/F+jEJsKO4ToyhLdT
	HG/KtWA1cIvGbXiUZKxQLDlfdGWIYyQ/biPrk9ANXTtDNRh3PhowZ3RegTViTq7+dmsgkbC6g4E
	H5Ve5eFXhTGBJ+dJeAH4QwEy2Piyu1FDm8higBMxqFuygWW31JifYpB+j2qKKhjFWwVR01Ztapg
	Y2zjGApQNUSgiNX1Iuy2eLE1wEM3kpdCqnYaYuMlNN0lpJI4F+2eFCLKX9AYRxmO74SOw9AKjBZ
	l0kX9C813nLPHzDrXgTojiaTzbdWw4VtOeqB4UiYB33p3if4HRuRhutGQstURfNckuiRr/M7cMJ
	8Ik5tp1CMkuB8HmgjXO69RZ5KdPLiy8F5/IyJxn93mPDFigLL1JpZNT34uHKLaBdYs5WyLAsbfC
	AoSWQFHkzuwLL0DLySNmhJk7NK01GieIfm2E4Rup+NQSkUY5u7isKZNSv5D6W83az7AuQUQKb3H
	XRR58/+2cpnG3juEhNmGTIwxdWik0fJjs7MP4L6VsoLa3dR/yYBeZFnmRIXPjrqQUZxse4wSqZV
	O2P/V1PNzRzGpO0BvLTSroOAluXCbdALWGUxBh05Q21Rs5mKIkz2eGJycvhK4M8fUClqZ9erux3
	I+ujw+/P/iayTiLtFl1+SqNMalJiEEI/j3yxJ2h18zPeHASCzLei03KNv2KX8dpI+zaC6aJ0R/8
	SoIIUi3
X-Received: by 2002:a17:90b:4c0e:b0:3ac:8741:e2e8 with SMTP id 98e67ed59e1d1-3b1b07ef0bemr1782230a91.8.1794559049401;
        Fri, 13 Nov 2026 00:37:29 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb17042sm3384750a91.6.2026.11.13.00.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:28 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:26 -0800
From: Chris Down <chris@chrisdown.name>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Kees Cook <kees@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/3] sched/core: Skip the shadow stack end check when SCS is disabled
In-Reply-To: <20261027100843.GA2668564@noisy.programming.kicks-ass.net>
References: <cover.1793082868.git.chris@chrisdown.name> <0e607d3aa7c2c4cc1b5b8ba7b0e25ebdb55726af.1793082868.git.chris@chrisdown.name> <20261027100843.GA2668564@noisy.programming.kicks-ass.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Message-ID: <20261113003726.68aef052ac869097@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_003730_654974_E92DD39E 
X-CRM114-Status: UNSURE (   7.30  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Peter,

Peter Zijlstra writes:
>How about you push that scs_is_enabled() into task_scs_end_corrupted(),
>this makes less noise here, and also keeps the next patch saner, no?

Yep, that's nicer. I've done that for v2.

Thanks!

Chris

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
