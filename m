Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED0EC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 21:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=AND5dsW4mH1pb5lOLTXFFeiOIr8PO9NQZyXFWtd4YAM=; b=he7mCx9IaMtAamKBuCLiVZJp5e
	PPfJUcGXJ1JAN/mjByOzqhCNmP01YdN9V6DINnkrGiXPoiKfzN/rzyVw7IAbm+DgOxKqoYhyrVWfx
	WQAbUbTaZoVOUFS4Db4e2SYlXwwiYaRuzaDb20SasuBcFxFJnN29JCMLP9G1w/68xgHbhJTV84xFK
	dueFvmFG71d+kdDYs2EepznYhgG8BrQ62A/WYGNLDfzmV3ZKcO0EZLOm+UeVtPSMru8zAsNIOE/2M
	ea0KDcxtlgjpoOjkCkKEuzeSL2iud3IoVmJDX51fAcNX/iUyRQZOOX27HbeOZy/vftZT/go6YSg5X
	O0JQ/PPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAImc-007Ydc-PN; Wed, 19 Jan 2022 21:46:22 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAIma-007YcZ-7T
 for linux-riscv@lists.infradead.org; Wed, 19 Jan 2022 21:46:21 +0000
Received: by mail-pj1-x102e.google.com with SMTP id pf13so3803663pjb.0
 for <linux-riscv@lists.infradead.org>; Wed, 19 Jan 2022 13:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=jZ6lVTSSFLFuFM/L+SjIupfkrZNssGv8z3Ianidrykk=;
 b=T5Ut7gDpIfiZ5vSn4GajrcdCDWzj3ncSvpr6z6u/ZHn+J7ACma+MqlbYIBGh6deKu+
 AGSqX//MqiJnhFlcxxPXGhsyfGy4OUZt5/o8LkpVe126EQuZ1otC9ZvfvCSyaq5xOigZ
 5cNXaMKmqRIOE+fQIwzIpvPLiavpe7QZVSlv401/WOfqOnxY6I+NazU64BPtwtOsDxpj
 3H0Hao4uRWffQHJ212dZlw4d92bI0U2aaqU8cd3Uwsx+gcdBJxwzsRw/pjJjrr+qXPez
 ixx7wBTUnNLEC1vtxF5KOL4CEnwnE3Jpirk2c7r96x4GdSWtrM5oroLNP+PoZb4BHjIP
 FSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=jZ6lVTSSFLFuFM/L+SjIupfkrZNssGv8z3Ianidrykk=;
 b=J868P1GAgl4Ztto32oH3jSFxUQRcuAF9J7ezn17zUJWwEzg41pr8o0+vwz1CxhGE2S
 zfxBmt9MHUgpzBX5L+RFZQzQns/drDwX/YjHRkChAOKext1uBBc3cYuNB37KAlnS1p2U
 nM8KQrQoqp3nGoOJbb6jDtgvRLQTTrvpMV0zrdnWtFIbfBt0xAgy3vRrp0mQLcsKTJu1
 IVv19phqgs3tob/ArCBe54WmqLQnpZnImW/GAX8PFub44wVOTzam1LQJkjAp71MPMpUi
 c6QQlLuwtHcFLg1SGrgqPjW8lCIjQ9tVncZFJV39yCTHbZytiSAwACRUSlNHBq+Ukxd9
 psuQ==
X-Gm-Message-State: AOAM531KgYJXg+CzQH8raUg++Grdfz1S+mGf3OqUBVFbAqtxUdIjyg6j
 ZeDMCLNxnks2yKsI8LC1+Jo7Jg==
X-Google-Smtp-Source: ABdhPJyOycOjSe9Y3DxhPWvgMrJUgy5U1hJ1ti7S8lIPGcJ4Ev3rPpSEkhI1yF9/JudNuJm4lJE5Sg==
X-Received: by 2002:a17:90b:1bcc:: with SMTP id
 oa12mr6853102pjb.4.1642628778470; 
 Wed, 19 Jan 2022 13:46:18 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id j4sm635045pfc.125.2022.01.19.13.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 13:46:17 -0800 (PST)
Date: Wed, 19 Jan 2022 13:46:17 -0800 (PST)
X-Google-Original-Date: Wed, 19 Jan 2022 13:45:49 PST (-0800)
Subject: Re: [PATCH riscv-next] riscv: bpf: Fix eBPF's exception tables
In-Reply-To: <mhng-db82dcc8-e5f7-4da5-9f5c-d7f6eb225735@palmer-ri-x1c9>
CC: Bjorn Topel <bjorn.topel@gmail.com>, jszhang@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, ast@kernel.org,
 andrii@kernel.org, kafai@fb.com, 
 songliubraving@fb.com, yhs@fb.com, john.fastabend@gmail.com, kpsingh@kernel.org,
 netdev@vger.kernel.org, bpf@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, tongtiangen@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: daniel@iogearbox.net
Message-ID: <mhng-5a4269e6-dca2-4a28-b9c8-336c023b8450@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_134620_348835_A5522E96 
X-CRM114-Status: GOOD (  22.62  )
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

On Wed, 19 Jan 2022 10:04:24 PST (-0800), Palmer Dabbelt wrote:
> On Wed, 19 Jan 2022 07:59:40 PST (-0800), Bjorn Topel wrote:
>> On Wed, 19 Jan 2022 at 16:42, Daniel Borkmann <daniel@iogearbox.net> wrote:
>>>
>> [...]
>>> > AFAIK, Jisheng's extable work is still in Palmer's for-next tree.
>>> >
>>> > Daniel/Alexei: This eBPF must follow commit 1f77ed9422cb ("riscv:
>>> > switch to relative extable and other improvements"), which is in
>>> > Palmer's tree. It cannot go via bpf-next.
>>>
>>> Thanks for letting us know, then lets route this fix via Palmer. Maybe he could
>>> also add Fixes tags when applying, so stable can pick it up later on.
>>>
>>
>> It shouldn't have a fixes-tag, since it's a new feature for RV. This
>> was adapting to that new feature. It hasn't made it upstream yet (I
>> hope!).
>
> That was actually just merged this morning into Linus' tree.  I'm still
> happy to take the fix via my tree, but you're welcome to take it via a
> BPF tree as well.  I'm juggling some other patches right now, just LMK
> what works on your end.
>
> IMO it should have a fixes tag: it's a bit of a grey area, but one
> something's in I generally try and put those tags on it.  That way folks
> who try and backport features at least have a shot at finding the fix
> (or at least, finding the fix without chasing around the bug ;)).
>
> I also tried poking you guys on the BPF Slack, but I don't really use it
> and I'm not sure if anyone else does either.

As per the slack discussion with Daniel, I've put this into the RISC-V 
for-next tree.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
