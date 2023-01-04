Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70712C53210
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 20:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4LpEhjMGB+b1GEjGvjnx8s6bN6O/Qoglln27X8MkRw8=; b=Ybm6GddrU96cgM
	k7Jx8ODOZPT4rNSTik7ESxl9r9qDT1RVbnG59JwWh/Sc13D3TX83sFvPLrbe1Q8BkZzthKG1uZ5Rc
	BrPd3ZdFH6WUn8z17t90weKgOkOZ/hcusMp54kXGbLAgsq9PEAhwnZMRIAe4mRP5O+Z/oOLQreCSw
	KI0cd5jcX6jyTtXFO9TLdEUe8B97EXIx+KAO+Ww0GTlynwzuGx3ywXbSP8g4eU7u+lARHX3HdvCOw
	+iPRzh+dhhESAeOkLJNdWqcxPsyO0SNuyCP+wcvkiGzWK4WzAqRUNoE+1SCB6pF8Dv7ld1kkQ2DB3
	clyo6x6Cy0l4b1/4OmIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDAeS-00BxPd-7h; Wed, 04 Jan 2023 20:46:20 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDAeP-00BxNl-Ct
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 20:46:19 +0000
Received: by mail-pj1-x1036.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso40174531pjt.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jan 2023 12:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lle/zB44oW9ABB/MA6O0Fos1v7FE/0S5wxzDNIjMM9M=;
        b=l7f7AdRX6pFC6Xks4/zDMCQeItS7tzcMvS0pweFf7QPcgZu+IbxG5W/lj4h9iVqWOP
         tMBItJTu4eZyu0N5iHs7f8iV4tawzvaKZy9fyH1pbqrmwgMGRZpIu30A+3T0iJyWrHnB
         ufeaTymGwS8E+D0tTFb81p6yRn2yb5YLG+kIvXRrKxQJZXjiawAUwWkcq8IvxWrjXiZ3
         Gs0b1fkqP3ObLmhESg/8uL7YpfnU87xwXLjvfKDJ3+Y+bHuvZKzirn3qfPKxYUVwvtwU
         ieyGZpcUvTXgFrGzKWvfoeiX27jHiDj/gntqlq2O8AmyzAsEhwq1Upu0RwifCGdA5s/M
         ixUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lle/zB44oW9ABB/MA6O0Fos1v7FE/0S5wxzDNIjMM9M=;
        b=ZDveLWVUZnmq8NnfeiJ6QaYmV2MK2PlqfhHaxVgM8d2q4Z/YCOVqYYuLxYQ9qG5Ov6
         3AwCfcKS35xZjWSbpntFQcIVzqI2+tS7SffpjB32HM38uF8Syg9/ysWLk5EKfLQuZP+x
         06/xFUDKxD9GW/ax9WmE0Y5Ueu/qzfq3b5li/Tg+ZVTMtHUq9YW1YeTFmH/WjV2a74KC
         Qg9LaH9YrmowwheQLlyhPU87NSZcbIaAT6zqA3wOQPsfa1FkrjjqkYLrQ1g4igw0r95t
         p3JW+Cr+VkMySK1sdPLj8CASkZhdEFceakJ26TsV2TTXvOYc1uRYJFnPlL+OD1LH8pe6
         o+sg==
X-Gm-Message-State: AFqh2krPsc5FL6/eM4S2IzjYg7RU4PgoLr4pxKkhDhVv1xzrUwqky5cP
	huU2vEOMnY/2e4zylO2pyMZEG8fQsZh8O2gaIxk=
X-Google-Smtp-Source: AMrXdXt+pZAzLb6BO6C8Ql5trJ4pGHaK0eCIqNlBw37Nbs+K3Ez2k8kvEb7U7nhlzD9o0LvzSmVrFQ==
X-Received: by 2002:a17:90b:92:b0:225:eda7:13e with SMTP id bb18-20020a17090b009200b00225eda7013emr35690275pjb.40.1672865173676;
        Wed, 04 Jan 2023 12:46:13 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id gn23-20020a17090ac79700b0020bfd6586c6sm1436pjb.7.2023.01.04.12.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 12:46:12 -0800 (PST)
Message-ID: <a559e7dc-83fa-fac1-5811-95d37c6e662a@rivosinc.com>
Date: Wed, 4 Jan 2023 12:46:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Adding V-ext regs to signal context w/o expanding kernel struct
 sigcontext to avoid glibc ABI break
Content-Language: en-US
To: Andy Chiu <andy.chiu@sifive.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Vincent Chen <vincent.chen@sifive.com>, Florian Weimer <fweimer@redhat.com>,
 Rich Felker <dalias@libc.org>, Andrew Waterman <andrew@sifive.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 =?UTF-8?Q?Christoph_M=c3=bcllner?= <christoph.muellner@vrull.eu>,
 davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Szabolcs Nagy <szabolcs.nagy@arm.com>, Greentime Hu
 <greentime.hu@sifive.com>, Aaron Durbin <adurbin@rivosinc.com>,
 Andrew de los Reyes <adlr@rivosinc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 GNU C Library <libc-alpha@sourceware.org>
References: <1631497278-29829-1-git-send-email-vincent.chen@sifive.com>
 <871r5sd1zq.fsf@oldenburg.str.redhat.com>
 <20210913135247.GL13220@brightrain.aerifal.cx>
 <CABvJ_xjGZ3S0oAkT08x4DToQFdcUH06omk2OTT1EHDZRJ-2wKg@mail.gmail.com>
 <87sfy5ndid.fsf@oldenburg.str.redhat.com>
 <CABvJ_xjSREsdemJkCJMGSx+09jrNoSbXCwuxF0zEQmZtHrWMvg@mail.gmail.com>
 <d613968f-0fae-1994-3bee-fb10765167c3@rivosinc.com>
 <73c0124c-4794-6e40-460c-b26df407f322@rivosinc.com>
 <CABvJ_xgDsthnm_h6mYowK03VUKqYk=nZsSZ7R=0BTwFHGKEAMw@mail.gmail.com>
 <50c598a6-e3b3-3062-abe7-23a406067533@rivosinc.com>
 <7430f494-9b43-5e03-c1e9-6b83e2611a11@rivosinc.com>
 <b67238bf-4b5d-dd17-99ff-88b0270ce10a@linaro.org>
 <CABgGipVT9L5p623Q2rbjrm=tTwcnjSr178CRKTNs+WMbm7=+-Q@mail.gmail.com>
 <91ef3c45-165f-d2b3-7c77-322c01802c41@rivosinc.com>
 <CABgGipXqEkasz2HTC4y6otCP6pFMmyEdYabA+OkUruUOfwypHg@mail.gmail.com>
 <18465ca3-934f-5b3e-170c-1ff0edea3a89@rivosinc.com>
 <CABgGipW66rdMnC99-h9ccuR+E+7fnaMfmzt=1ehGZnvxO34PwQ@mail.gmail.com>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <CABgGipW66rdMnC99-h9ccuR+E+7fnaMfmzt=1ehGZnvxO34PwQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_124617_686287_69E334F6 
X-CRM114-Status: GOOD (  16.53  )
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



On 1/4/23 08:34, Andy Chiu wrote:
> Hi Vineet,
>
> On Wed, Jan 4, 2023 at 3:17 AM Vineet Gupta <vineetg@rivosinc.com> wrote:
>> The prctl support in there is really rudimentary and incomplete. There's
>> more work needed to use the dynamic state of enablement - for say signal
>> frame etc.
> Yes, I agree that signal and ptrace need special handling if we'd turn
> off Vector with prctl. For example, we may not need to save/restore
> vector context on context switches and signal handlings. And we may
> have to prevent ptrace from setting/getting vector context in such
> case. I can implement this into the series if this is what you're
> looking for.

Perfect. This is exactly the coverage I was hoping to see. Go for it.

>> The new Kconfig CONFIG_RISCV_VSTATE_INIT_ALL seems like a
>> hack bolted on top.
> IIUC, most opinions suggested that we should keep the default Vector
> state to ON in thread:
> https://lore.kernel.org/all/20220921214439.1491510-17-stillson@rivosinc.com/T/#u

Actually community feedback is that they *don't * want the default 
vector state to be on due to power implications, increased stack and 
memory usage for vector contents (in that thread and else where as 
well). So we should keep it disabled by default, but indeed we could 
have that Kconfig option to enable it. Granted distro kernels will keep 
it disabled by default, this lets vendors enable it selectively until 
the full userspace enabling bits are in place.

> So IMHO adding a build option to those who prefer not to
> unconditionally enable V should be sufficient.

As above, it should be other way round.

Thx,
-Vineet

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
