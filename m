Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5867D606A330
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 20:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qwxIlLaZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qIBn5KSU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:To:
	From:Subject:Cc:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DU8X/KR8tGvDovgEz8QEt5sTn3U8+wUKsqwpxBQKmyg=; b=qwxIlLaZqiU3+UPp5at8w4SUvR
	3z7aF94qlrQSK0ccLk9V//UYO3E9aeNcjkoVEyZ5AdqTJZmzSj+4A/bOY5EeI7lwlLtWQCuwP6iE9
	sPzGTT9zKyphGYeqT1Z248nFjV1eebcLHSeq64OwHEN/Axgy+xJezQbdkIG/0VvGsAmi2Ue5PXDfu
	CjAcHFceoByWoCOy0qwJhRBSandqNPubN+Bdgh4tzMzREM70OfjxoQauSKaXd0tKnhIRqJlkbW9Mn
	3jUslWfVj6z7SgGb5JM/f8VhQIeP3e+0aUUSzwL4ftfOKNPq7q2LRuH9E0U7OoxoNVQeh6PEM+T7z
	jc/Eeuaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVx8t-00000007j2x-18ga;
	Tue, 24 Nov 2026 20:29:31 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVx8q-00000007j2S-33QE
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 20:29:30 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2f03920c477so42097725ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 12:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795552167; x=1796156967; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C3HV32h/nzJ/HO0KCnWYYz1pnwdnCDCq2Tq04usC3zg=;
        b=qIBn5KSUeOsJzeR+ZhdicclrQYs2bQ274+Ii9t8eM49p6Hp9D1BSWY2HDcGXM+/z1z
         Sw3K6NquRVTg0MMly7ykDAZWulPRPatJMFyn2dMK9bIbI+wfOOp0LMXiv/09ZBkQOKG5
         rzP6IspMO7EHbDptphIM1iVPCoTWx+W5eL07CgdSM7WNDrwOrwKRByINTJowdtoIhGi0
         3l58IT/mll8//NypuqDw/+90gUy5sQv72KvFK+tfVwtPWO1ZCyFGZjamNdeiC3mLAJwi
         R8MLlfehn62tM3l2FSA4PyAgeh6c3ls2Rg04xVu6DSKAD4WE4e/ASAR+VImNDXn7DH+B
         NcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795552167; x=1796156967;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C3HV32h/nzJ/HO0KCnWYYz1pnwdnCDCq2Tq04usC3zg=;
        b=rKcA3erJs+gwXwFS80K9RfQNvRtTtsp3ZMArKeAB5JZdYwHt+AZ0/FNee7blUlWTbd
         nxr8Cf1NoFJifx/X7QMcSNm9SKZWX67qSmUkR9FnYKDukNOgUUbDEG1POOs9IBsMC8FR
         Rb4rewLN336B/Z5MrIQcpkbFfnD7WtzP5KX+V4Qpqbyse0gy+1FvMHeEhqZUFCoH15Zj
         pEJzCbTRAbTGr94X1TS0m/7sUPBMKk/TFkE2PDLvEyZvEb7yFc2IVBGrbesK7YEuECGb
         2iJFEhA381+j0FyWFrZaj/OsSUQez33QG/qy4fgfJs6uCWSttidfot5KnN2lN4f/TIeY
         o9tQ==
X-Forwarded-Encrypted: i=1; AL+hErFL8Dy4Vo+h/6HIUYW1/i52YhmbYzkuTatTbIZdzcdQCUD+Wqx2VYr/FxoZ+BbMc54h8zGnoS+3vCjT2Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z+IcajolwzfasjCqCa2oSvJ6wIWNnav1US3S4ZbcXMuinxcuDJW
	+WzPYExHSvZMJPWLXs/SEvusBHWLviIkOi1Wc1OtOxO8934c7PmJwhgf
X-Gm-Gg: AZFdTZcBna5jM4QxFqCtpGuKsBgaO+7thOc9uPjTZnU1O64qRStePlH7UJh9e04EB1U
	R1vGy4Qx7AKNQgTqdg4msJ3LnNbu+VjGXpPdgRpXeBcqM4VplRVLUJ14gpk5IDzdmdpB6G2EptP
	8Wvw9w5VY7D+13hUzssvaq52+8QF7N4rgW/GNo1oG6WyVmwobJHATdtsgrSSZSMtKRAni9+qJAA
	co0nkMjntpdpgeB4SIrKM4pXBwdHPdq2MILmHe7q4C6m3lEgyUV/gGq0R1C8kqqVW9ChWv97aA8
	CaIMe40qacOCGjdODYdRTp9wbYOYlIdUVLCCVPnEaCrvatKk+XK7JVZWMFHFikRpIe6n03Luct3
	RI3d9zIqWsxhMYj1qO9pe0GiitcAb/NEW4blsw9sDygfA6FitRVihaYnjl697Qv6UTQ/6amGG4n
	b2jhb082xXQT+R0v0mL6dU0SDQNuhP01tLnY1E2Ggvb2ZipJcW4E+TBruYiRBOhHkhqdeO9opDj
	3VH0BeyYtJfDkZQkfKVjvQiaUDlcvVs3PTuKpPgt8jDE5hwrAr6RNpuuV5ImHLfEaNzHBZlbZm1
	+T3u2Yq78VdOqrYOhVfUqMhe9/RWPIg0fWrfVF5AxMkVJtqbP3stGID4//leFBvDB1dCzSxW8BC
	eKfl/T1jm/G/EcReIQJ3WM1XjXhYrPWQ1ew==
X-Received: by 2002:a17:90b:4d10:b0:3ac:9669:846b with SMTP id 98e67ed59e1d1-3b41c852826mr14406212a91.9.1795552167442;
        Tue, 24 Nov 2026 12:29:27 -0800 (PST)
Received: from localhost ([153.61.198.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm26492190a91.11.2026.11.24.12.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:29:27 -0800 (PST)
Date: Tue, 24 Nov 2026 20:29:26 +0000
Message-Id: <DN3Q4DUI8GEF.PX8U99J6LKA4@gmail.com>
Cc: "Chen Pei" <cp0613@linux.alibaba.com>, <memxor@gmail.com>,
 <bjorn@kernel.org>, <puranjay@kernel.org>, <eddyz87@gmail.com>,
 <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>,
 <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <alex@ghiti.fr>, <luke.r.nels@gmail.com>, <xi.wang@gmail.com>,
 <shuah@kernel.org>, <rgbi3307@gmail.com>, <guoren@kernel.org>,
 <bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 bpf-next 0/3] riscv: bpf: Add BPF private stack
 support
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Pu Lehui" <pulehui@huawei.com>, <daniel@iogearbox.net>,
 <andrii@kernel.org>
In-Reply-To: <6f594d21-f5c5-4224-b4ff-04ba3183a414@huawei.com>
References: <20261106181558.1564-1-cp0613@linux.alibaba.com> <6f594d21-f5c5-4224-b4ff-04ba3183a414@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_122928_765982_A65FB00A 
X-CRM114-Status: UNSURE (   7.34  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 22, 2026 at 11:46 PM Pu Lehui <pulehui@huawei.com> wrote:
> Gentle ping on this series -- it looks good to me and bpf selftests pass
> on RV64. Some upcoming patches will conflict with these changes, so it
> would be helpful to get this applied first.

Sorry for delay,
please rebase and resend.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
