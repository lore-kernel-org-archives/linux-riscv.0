Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8E7C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 18:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=HXajmWhNnrYCsaUu9mXcH58Bp0A9Z3mU6LWrKCT5vps=; b=vc4ibHQ6HZFaVykwJxmador623
	bNMXEyfzXbNq2ip+yZ3in1GGKcV3qFUgMPLMWswzBwU5KMV3lACPyxSG92uxQ7shAXGobXDIvTKTG
	Sc+q6YfHhfpu59Oh4S0sYRAmhFSTOAqhmb0x20I+m606BPYE2YDWRICYhQjcZap4967zL2wIgkBKK
	ltUsHziNXdP7gPSiucDnfR5umwaziuTIDL3C2lJJAG2aGR8T1nl5otdYQhRM6Xp8eLoCUivSfz0nC
	McIVi03WoI3Y/WqswrM8mav6ws5nbIpaJXvnDZA2pii8c41HAsmAHTtdnKt2qAfsl6LcTZNrQMQf4
	sNsHg19g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAFJz-006iRk-2p; Wed, 19 Jan 2022 18:04:35 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAFJq-006iNR-73
 for linux-riscv@lists.infradead.org; Wed, 19 Jan 2022 18:04:27 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d1so2921079plh.10
 for <linux-riscv@lists.infradead.org>; Wed, 19 Jan 2022 10:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Gi0oK+fPiedFcLKwooWAnMK7r0Lqu+rB2qQcbSleGhs=;
 b=w+9b5KmJD/a+xfKIB+Y5jwntxsAjQel9/8AIlRQKmb6gfg0CyQNkl6RgIihWkmVAPw
 6dH59ZFdAaVoU5CSqESAtCth9hveeSbYp2LKQESSq/x/uiAnXGYtZv1vMs6r4lhwcY5i
 cqUrrmo83YbyhIZTq63FEvjsGTgqiNE0PFpVYPnqFSOYgFKkYNFRcIMyMZwax+yp2bKE
 RtB1wopnCsMkX3tBRZKDt+BgvxFE11ky7sHw3hlI1ybHbpt/GJ61NXlncUl6/+57z8OX
 CdO/F+tGEpsOtmkEUWKeEiBruYcqWbM0zzvmjWYEobnDlEjeMVJg+g0qGj+pfF/0Vg3I
 mtoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Gi0oK+fPiedFcLKwooWAnMK7r0Lqu+rB2qQcbSleGhs=;
 b=kNAn/eYrbqOf/npc4hKD/Z3qJfTStQwzYi9SmXR1cqvJT7hpW0bhe5ufcFyJ6pTMHo
 WH+2ExohkHYxVCPixZlxp6/dEDfU3KXZsD6KJtFHwUv0+ACI1mkz2dFdxe6uKYEAhnsn
 kW/1Dn3dofoRs5HE+DgiX2xoZKxPfMmQVMOAHl2en1nYocS9ti6P13Vlvyjc0FylzdMY
 agZ1CvfqVUY1xcISeLFbyGF6sArLk6kT0lKJDqEE7RMWKRaRTrfca7NJao5aHAToA1ik
 kQP5sbMH8hBzsWFlYD6XKuhmgPgqDf9lmKLFA3V1WulyY35yFVfFPS4zjj2nCbL74a8M
 uZDw==
X-Gm-Message-State: AOAM533ZSjjN34Iw6OSr3NARC/hNbHbhdKTC4BwcyLMHCUOwKKpyjlb+
 C5K+kU0KnVRsNXBsZjd/7WKjAg==
X-Google-Smtp-Source: ABdhPJyTs4le+F5zP1oVfHJ5eTadlQPGgFbplihq3u4uSSSzmdN/Ut9DNT5Q+29K6m2hzIGTzVDn9g==
X-Received: by 2002:a17:902:7d8f:b0:14a:b712:bbfb with SMTP id
 a15-20020a1709027d8f00b0014ab712bbfbmr17071277plm.63.1642615465039; 
 Wed, 19 Jan 2022 10:04:25 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id u35sm275750pfg.195.2022.01.19.10.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 10:04:24 -0800 (PST)
Date: Wed, 19 Jan 2022 10:04:24 -0800 (PST)
X-Google-Original-Date: Wed, 19 Jan 2022 10:03:56 PST (-0800)
Subject: Re: [PATCH riscv-next] riscv: bpf: Fix eBPF's exception tables
In-Reply-To: <CAJ+HfNikH3OMH_b3=uvfSqAJZkjJabn9yipbYdnTxsh_=VDHOQ@mail.gmail.com>
CC: daniel@iogearbox.net, jszhang@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, ast@kernel.org,
 andrii@kernel.org, kafai@fb.com, 
 songliubraving@fb.com, yhs@fb.com, john.fastabend@gmail.com, kpsingh@kernel.org,
 netdev@vger.kernel.org, bpf@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, tongtiangen@huawei.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Bjorn Topel <bjorn.topel@gmail.com>
Message-ID: <mhng-db82dcc8-e5f7-4da5-9f5c-d7f6eb225735@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_100426_362005_0DEE628C 
X-CRM114-Status: GOOD (  18.36  )
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

On Wed, 19 Jan 2022 07:59:40 PST (-0800), Bjorn Topel wrote:
> On Wed, 19 Jan 2022 at 16:42, Daniel Borkmann <daniel@iogearbox.net> wrote:
>>
> [...]
>> > AFAIK, Jisheng's extable work is still in Palmer's for-next tree.
>> >
>> > Daniel/Alexei: This eBPF must follow commit 1f77ed9422cb ("riscv:
>> > switch to relative extable and other improvements"), which is in
>> > Palmer's tree. It cannot go via bpf-next.
>>
>> Thanks for letting us know, then lets route this fix via Palmer. Maybe he could
>> also add Fixes tags when applying, so stable can pick it up later on.
>>
>
> It shouldn't have a fixes-tag, since it's a new feature for RV. This
> was adapting to that new feature. It hasn't made it upstream yet (I
> hope!).

That was actually just merged this morning into Linus' tree.  I'm still 
happy to take the fix via my tree, but you're welcome to take it via a 
BPF tree as well.  I'm juggling some other patches right now, just LMK 
what works on your end.

IMO it should have a fixes tag: it's a bit of a grey area, but one 
something's in I generally try and put those tags on it.  That way folks 
who try and backport features at least have a shot at finding the fix 
(or at least, finding the fix without chasing around the bug ;)).

I also tried poking you guys on the BPF Slack, but I don't really use it 
and I'm not sure if anyone else does either.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
