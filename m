Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8BB606A32A
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 12:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jR8cK+sf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=hHmJpDOR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:From:References:In-Reply-To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=Tg/YiH53r44oSoF8vOqyUbL083TLSgujB0osjMlEp/s=; b=jR8cK+sfkMybrtnA/x16YdBrMQ
	jsZtsYa7kP6h+3NdYsN5MRk5ZAozi+qeo/trYWmlkrAdT+76QM3okCzcYOT4K1gUUya3+pdYjALDx
	aaKCcXUWI0nz7Tm2may0oZsEqFeqgu2Y7Ua4roWty+DaoEvhCzgcvWVCiPAPttpn3rwsxDIZZUv7j
	khAbe+y6tm4p1dWSxxO0aO57n5r8LCj7I/t//3Iw42M7WH2nhAJRx8EPMbM9DxhIFIndqiBW7wS9p
	M6ADSEpzkG4SelKD/TAfs/AZFJYJaEjtsjUchu6dhum+rREQOxdhEW6Z/dYGLF1UbYHgacuADq9Lk
	tEY0Olrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1XZ-0000000Bute-1Ift;
	Thu, 19 Nov 2026 12:47:01 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1XX-0000000Busq-0ePn
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 12:47:00 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-67db35e7953so2440185d50.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Nov 2026 04:46:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795092418; cv=none;
        d=google.com; s=arc-20260327;
        b=QEKIe7JqtyuB+zMdK/F+H8yLToczKeCyQG1mwaDty01TebPPllgyDq3aEUxy9DbNwz
         ii2FGa6v5GN6+A0CbhInlaq4wrVZetVDO1yftgdS7ROmlviv73cUG2aeiaD3C/9i/YnQ
         4sIbN0bvNHnAwoj448yRFbdPIuxhJvGxbdsO4URe8HrZaXO72pM5VzVfp/05lj0AvxJf
         9VrKkZ38JzS0a+0lJXRey/mIGQ0ZhQurb/2VNrbglPh1ed1sBbkTgXnjI6m2wicDnmLC
         +q0E2/gSLHkpAvf9aqCVAbrcJzxEtp5xZRMR7eOvlPmGvyT7AcsVhBIr+XOOWhDo7yjE
         dWCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:user-agent:mime-version:from
         :references:in-reply-to:dkim-signature;
        bh=DQI1OZNYohFiuung2XmK2sEz1Uw+tUzC41KeP4vlNw8=;
        fh=DCbNnd29MnA1c1Wejy8+Z0K6uQw6EYF7tX1aTRDecLw=;
        b=R/kuPthBGyA4HrwlfxvyIrcCbl4KIpDniiw/ODRVOKP6hQd6oRHlojiRQpCkXkyzxe
         HKznmZ3kKI+ZRJ5VfE30WcwDVt+48eqxdkAmBp5kE5kbGGL5VTKrYwzaRLfa52LtgoRB
         RiVVsKW8WCTYZPH5QUCyxys10spKmLmDSbao2wl2354RuVlsIjcyLxVUdw4E5euUS4gW
         Ma3BG07p3yavn+VTZ7O2RHUR3BHKLrIAhNQJ/cRjATA5gpAm0qE6QzbuUBMTZFZnwOV2
         7+MJiOUvrxvRuMoHE0a3YPSl1y7+9Tt7k8ve8XetExFVNELRgk0YmKQejPx7oqK+UeEs
         eTlA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795092418; x=1795697218; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:user-agent:mime-version
         :from:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DQI1OZNYohFiuung2XmK2sEz1Uw+tUzC41KeP4vlNw8=;
        b=hHmJpDORQ6fs/UBOXgRJ3WjtOMB01GWP0N+h9FocWG0rxQt6xa2R7GXthXssxT4mQR
         lcqV4OYoubAyhXxIV7eW4UP4iu6mM34QHqZTKVOWGK64A9aBIqrpqBkOtWe6r3V71Tuv
         Jvd3t0dgOpUQerWlDgRqdWYLSbYjZsiqDa0agq1E36I7+nDKg8hkgw7XMa8A7pVWy5eT
         qd96nSdU0u6oAXIrWMi6YkBBaswbfBzT4Xe8EfwjjspcFb1QJ/nZwtirCwAcZ4OBI0dC
         qALg1TMaNs2xMofJIhxYKdanYgA1jgjECVyE2cMddhqxQ7b6PiM3LXhiDzez004rl1Zn
         oGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092418; x=1795697218;
        h=content-type:cc:to:subject:message-id:date:user-agent:mime-version
         :from:references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DQI1OZNYohFiuung2XmK2sEz1Uw+tUzC41KeP4vlNw8=;
        b=HMr0pFpqzBxtZDtARp57KpgIoIWfubo8WHFj/BhGjMTAxoADNp/7OwJhadoGuAc9ed
         LrMqEUA1fYkVKl9yPBCHyVhJAL35F0fIyyHed83K3UgD7pPnPmtQgHNr39b+WChrOKwU
         6W1PqZI+Yio1H6f4Nw3bImWHcWiYmXcJ2QXMMP1zCZtBL9uWGfGqsZByEIPTPcqFTXDN
         AeeY+C32i2jXHfx2NBvigtHuNlBSbynjFhcEuYFxvZ3z8V+uFQHRaoXRr/a5sH3pGf/f
         i+5x98yIjqKAoV3Gs5MUXMNxtq/MYZjzlwUXwwSaVNR4gFKrBv/3JsXxOfNGjWfNgb8i
         16eA==
X-Forwarded-Encrypted: i=1; AL+hErE6r2n80TbHQvZyesI1zrZJkDaMAlyZtAJKC9haCR+y3Q52xDFWWWVg9ZyVMSMEk8WoQC8oFNB5339cKg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8wsCWwgvgyv6CgK0jetUx4UqQYx/hHKg3Yot9TfUe6B3+ST7EY
	WfPgdmFv34XP1F9a+npAuaxS7uw8okm0owdTBOhff9oUK4Hqvw8UwS0zL0deNKZY6COrr5/xdAW
	nsDPxwUOuJwxEcncY2NjhZMWrgbUOAf9GD6vt4A9uEw==
X-Gm-Gg: AZFdTZccVAYG+Hh2lml4hVRc3nv9MxbSJbyrzeZBbJSg0EE2Z6MjYfUVER9O6TIkhsM
	zZuZPVDj1YZfecI6YTeGCmumQn88fCEaDBWq3DAudChqiVx3g9KdLRYWvjQoy8teewFgezUMPre
	WcUk7KfyZDHf4RmyChvYDKygOc/1Pm8ygkvkCrSj3BuFDRJwR7lIdP0z9ZWPxziPMu/xU4SoYAF
	ppsAs2mORrEXViaGp514Uw3FXK80xptGMtjKSo+f/Nrbka/3Te8IhxEj0v6PU+w9184VdxWlPg9
	NlAmlxJ/KTqCrkYtQF1d+nIUuaUV7P13hyMRQcXDR0jpqxRxEclQ5IXenlY2GUBzk0MWu0jncKa
	JlE8VgadXdIAi89cYFfZothudRhODEE2bPyggdg==
X-Received: by 2002:a05:690c:7405:b0:8b3:3fe5:f6ab with SMTP id
 00721157ae682-8b4fecfa349mr19565437b3.24.1795092417770; Thu, 19 Nov 2026
 04:46:57 -0800 (PST)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 19 Nov 2026 04:46:57 -0800
In-Reply-To: <29e631f0-c135-bea4-0a3b-81dd715cef54@kernel.org>
References: <20260911121456.33223-1-zhangzhanpeng.jasper@bytedance.com> <29e631f0-c135-bea4-0a3b-81dd715cef54@kernel.org>
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
Date: Thu, 19 Nov 2026 04:46:57 -0800
X-Gm-Features: AclHuK_VCp2Kj6TuYw_2lEwgIiu0LS1C49sX3AV2M1eYDrqr2PQ_yG1as_cK4Hg
Message-ID: <CACnXVne49x1JEPZhCaQzofGDuZa65F6cRpE5Pzj=3s0rzpHUcg@mail.gmail.com>
Subject: Re: [PATCH v10 0/9] riscv: add SBI Supervisor Software Events support
To: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>, 
	Conor Dooley <conor@kernel.org>, Anup Patel <anup@brainfault.org>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, Atish Patra <atish.patra@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Yuanzhu <yuanzhu@bytedance.com>, Yicong Yang <yang.yicong@picoheart.com>, 
	Susheng Yang <yang.susheng@zte.com.cn>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_044659_203565_0319E3C0 
X-CRM114-Status: GOOD (  11.02  )
X-Spam-Score: 0.2 (/)
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
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Paul,

On 10/6/26 6:21 PM, Paul Walmsley wrote:
> Hi Zhanpeng Zhang,
>
> On Fri, 11 Sep 2026, Zhanpeng Zhang wrote:
>
>> [...]
>
> Thanks for taking this series forward.  Could you please rebase this
> series against the current riscv/for-next branch and repost?  I tried
> pulling the series in, but it needs quite a few updates since we've
> queued up quite a few patches that touch SBI.
>

I've posted v13 [1], rebased onto riscv/for-next at 642fb67393c1. Could
you pick it up for the next merge window?

I'll address the crash-kernel kexec restriction in a separate follow-up.

Thanks,
Zhanpeng

[1]
https://lore.kernel.org/r/20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com/

> thanks,
>
>
> - Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
