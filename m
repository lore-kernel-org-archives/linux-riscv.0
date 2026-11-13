Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806DD606A337
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 08:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ezYvIWsB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=PErNCUXT;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=Y9v4pOya
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bNlpEhNZ5WjUsShhB87uCEdaJNkybim/mbc7YMJT078=; b=ezYvIWsBeHYrieOLd/TnVrccP4
	tGywK4H/+NeidoozcRFVMJU/bjxQxdBbrwDdw3rQeR/Z9ID4wH+DXO6jmVvSV/VRztSXNZyzB+9Hv
	JBLwpurBeOR4DI/y+qLdbbID2RbcnwuSOzv20dKxEFYqG3zXgIFlwD1KXAiysffpGiL7NQTW341qU
	/khLwcvoKMd5+pScxOmFhmTjcViXVQDWXY/Tb7lA/RSvtRMtC9kBjoOIy3jrT+juv0DIDm1tEoBkW
	cL9nt5K0gP0NE3O8mGXsJ5LQFwV6VdLmrEttcouR3/G0/AsGWLDPBPXhsPSabY48WQqmaavMEA1YP
	qYmP+UcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmni-0000000C5no-1vNj;
	Fri, 13 Nov 2026 08:38:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmmz-0000000C5PR-1DRW
	for linux-riscv@bombadil.infradead.org;
	Fri, 13 Nov 2026 08:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yst+eH4qPHKZ+Mz1qLQUp8ASMlTj1NxEgEqc21eSWaw=; b=PErNCUXT0VkmNYNBwwoNPxJnoG
	Xq+QQraDqx6wGLgO5EhrMdcIErvasF5Kll8LX4NIzc/YqnBn+q2W0ad8EB+gN6WGyatyre9C1Scn+
	HFKxnOZ0tW1QFs36nI/HgB+RAWeK4oMIxCZsnSJe0/3b1RWDK4iLk/T9Yx23LeEpn+GhpieSZU0dh
	lmeiDeV0ygwKKcnItE4sKYrgHbapf30Kpg7ivt2F6Vx1J8kAQlq7CG0WYUMpGyia+Yg/+Cg8YBWaH
	KCGb5En1kDS+fWSBcnRKYq3b0X1/r89pxZc+rRYTUd9CY4eLAo7EPAwGurs8NDtgwISz6xc0DQZXa
	RMI1Y0sg==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmmu-0000000B4r5-0eGD
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 08:37:39 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2e9ae391a05so3618995ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 00:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559053; x=1795163853; darn=lists.infradead.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yst+eH4qPHKZ+Mz1qLQUp8ASMlTj1NxEgEqc21eSWaw=;
        b=Y9v4pOyaS9lemRIxNyGFz+asVqMohjPnn7Xe9Nnfv8rdpelqkiVoRzaDr0hy0mEIMy
         LDe2ufX/INSGliHQx1R2ill/YQ5i/yeOWIuvgLP6feWaTFItUXoQtIVySpvQlGXhRAna
         FROSSOKZ0XkuDGe97ppHOXgwhVOaEd45OGWg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559053; x=1795163853;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yst+eH4qPHKZ+Mz1qLQUp8ASMlTj1NxEgEqc21eSWaw=;
        b=Me5DwYv+kKNHLnuGXCXw+3K1t3/x506ZwKyClu042bAWebYhtKX0+smkH/o9h0U34s
         S2LK6g4XCF/J07PepDfcc78nLymh24R4Om3fqROeLifBKatzo4OgR7ICxogf9qbLUCbb
         ICpRNIKW4KfAIXbBntJsGel8sgNyJIha4UQtUyl95DEBHXAn795t+tQBkZjZLCw7YGB+
         3luO5985zdtsD9+9S3iOnhWYi8tiuRYEzBmbhDayM0CqdoCMvUF4yHYjW9iIOsRi7ADJ
         JhEXIkGMqlCIw5sJbHRBoWD6KuobJbk67tI0cn4l9l8c+uF8RwhOeHCoMsjBmkAbat0f
         Vcyg==
X-Forwarded-Encrypted: i=1; AL+hErH8R0EMh4lVG8qORFJUDnbXdgmQaqkPPtRTTAM16VnDTfa7NUNEwIOglJnkNnHs3Big530FFd36LSNR/g==@lists.infradead.org
X-Gm-Message-State: APuU4Z8HRifb7QyYypcm51j0NXrJVbjUdKUwQUZIZVvSM6OS70KkhR+G
	JoDfkgxg0sx8XIg9tVfWhY6m+RI9n+xn7x6uElmZGuQmzl7C4KWF1IKLgGV1z5U2/Zo=
X-Gm-Gg: AYBFou3fMxmjUPdlXeKQ0yG/sHqF3xSDUhPPJCQVPUsuyO+gyvsyDvS6rt+a8ayk3WJ
	HQ71EPG+z0wNE92iQS33tzyZYj5VtRy7G0QybuKYieuu38VLEsDP4emu63SfJZvKDfX+Cpl/O1C
	T5M/ODJ+FN8lqms0fsxdl3zcI9Y6HYxnyPqWBUqjD09jQi7TMT6Fqu87FZtoRAqiuUIrX0QCc1c
	kYw17Ed3CjaWs3vcnUr4phRdk907Rg6j0yH0kPIe8GCV5Rx1i5bNfEwOe2+W9ib0ijVQ6xD+MnA
	nk5YLIPLxW8eFlHC1NxMX0jf9M5GzbEinH9Ks7LpXzPzMQgNk7Be5X9YsaieVETyFqmkl5kWisa
	maLo2ogNvKbmqKI3lq7ZqFZeFLzy6bMI8b4fNNNKV3poyLXO/4H/+rjxnGG7ySvigA+GLBOZXX1
	EvGwP3N9H+16fjZiwa7nc10eRNkRafZdyy32OqTserFgBSJIxTxdJcV2rrO+xdYXcOVkGtmy3oz
	Yrg0QDsNoFFgvISh1c184URLTtXeo/Dkkv+4Hkmf4PCi2EJP9IpfbI7YflXdm3PEOLmSyQqVlxQ
	LKLKG2s8+uBhan0oaZ1bXc1rgL7JAWha7entAc9zFIwhc0EeXmoum8Uvm7VGkhGXlQCAotbnAFn
	TUZ6tPtBYP+29QcXoMFyi74+Woc6QT8D8OsR3yBYEOIRsZyM4/LS+1WwEvkxccs7+e/3inofV+m
	1EsMxiY/F4ha3tT2cuE8BUl/vSglYaLPlQlDsoFD2ma7GWfbNL4sSXyqVRq3F4G9dkAFe/uHWeP
	g1nk2G8
X-Received: by 2002:a17:903:3c6e:b0:2e9:8202:508a with SMTP id d9443c01a7336-2edf1ed6cdemr37400075ad.16.1794559053599;
        Fri, 13 Nov 2026 00:37:33 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75ebbcsm6475845ad.26.2026.11.13.00.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:32 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:31 -0800
From: Chris Down <chris@chrisdown.name>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Kees Cook <kees@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 2/3] sched/core: Add sched_stack_end_check= boot parameter
In-Reply-To: <099dc59b-0699-4c2d-875e-289cf6d32cce@infradead.org>
References: <cover.1793082868.git.chris@chrisdown.name> <3d2bb6a8508b9d801878bb82c88165a1b1ff5f40.1793082868.git.chris@chrisdown.name> <099dc59b-0699-4c2d-875e-289cf6d32cce@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Message-ID: <20261113003731.5754ed6732d351dc@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_083736_160290_CAA3A8A9 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
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

Hi Randy,

Randy Dunlap writes:
>This error branch should return 1 since it handled the command
>line parameter -- it just didn't like the "value."
>
>Returning 0 causes the option string to be added to init's
>environment, which is not wanted in this case.

Good catch. I've fixed that for v2.

Thanks!

Chris

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
