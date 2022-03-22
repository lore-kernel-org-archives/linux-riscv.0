Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0E6C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Mar 2022 20:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=pPvYNa48B+7MqK9kdxn4/DfmDiz45HliHIy3ZnpiApQ=; b=xjIcAex37V/OKBAoY6itoOjRB9
	UPHEUuhD5s0HSZsSOIRZBL3HLLg0m8QeUO5vShPcAfBRlsejGiZsi8FApQEsKxT/Cqi00uas5UuCx
	jNWEv7ZWhlQuYOel4k9MMu3W6P6qjufhx062RbKN8eQgVHA9qxZ5OXS+225T5kUBa3eY3JteKlDeI
	QjhuSs22T/QOdGN3wmj8OU/gBlpdRKZVuYEszpFp82ExyKsImuoSv81nOvlx+Jh5DKQS4q/zxssQb
	cueeqzDEwbrRAgBQcGvr2VMfYmbH2Cj/BbF3XVzdO6edmmNFrbukcgJepcrO+pksTzyf+eMQJZ6y2
	ebjgWzrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWkic-00C3nd-Nn; Tue, 22 Mar 2022 20:03:02 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWkiZ-00C3my-P9
 for linux-riscv@lists.infradead.org; Tue, 22 Mar 2022 20:03:01 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 o68-20020a17090a0a4a00b001c686a48263so2343244pjo.1
 for <linux-riscv@lists.infradead.org>; Tue, 22 Mar 2022 13:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=9z2OhjirVkz2pUbqaGLshsVzbhbV6ISeuMuKyH7hsWQ=;
 b=K2Z9Zm7zGkxEMQYec2pWhgy2XOQfPvprN/HESKZHkKo7Ap1wOflyxcYFVKuQSFNTtJ
 b9eFHIu5L4AWWJc2rbAjlYQK/tgMamITSdBIPTLzdCBvH8/DXHUfNKDYKSV7uYAznF90
 5FxANI/+CMn1ACq4S2PDBARc6QZrHnYt+JDhpLr4w8ewc+e7OZeymUewObip6OUr83bx
 ISHC6wAzK0V580zpUIfhQ0ipyyDhSG+fqlhmjqKrcby6Xp2j4oPkxHvlbuOTiWi5cEHr
 onyxLF1gkS/IltPtPUFuIQ6wdwtukxWWzPL22YWYSAJ3n74leqv6DMiSscTz9OOEhs1N
 LAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=9z2OhjirVkz2pUbqaGLshsVzbhbV6ISeuMuKyH7hsWQ=;
 b=3uXU2iaS0gVJffCYFnsoLLLlxm7QWW5BLrmibAWA5wMDaRLryLdfhGrdNpF6YqdzkN
 6gQ8sLT1LKqiGs146YlPSB4xEi3jeBobj8W7hqUACoLhO0inl5y7cbz2mG69pDvRksWS
 xbKWFP9RPCZEXtgOdB8wI0mDpVJadO4uX07YZSdr3UmVhWBoR1PwLc65WCPvOqy6Re5l
 2ds3hS1uU7gBj+JgeFj/vY/Sh6nlcZ3YEzcPU16gf/92mK5WJeXSqduqmghB5u6cmUQD
 nicfduPG869sPmuv/yudljy64E3P2Dj1QjtQnZUAX6UvAC6vC+Fx836Y8chPH0Yzor5S
 KJ+A==
X-Gm-Message-State: AOAM533rUg3N+SSBbWvYrFhX72VfPEbnIlMlxWHM5Etxv9TOQhUsvUUd
 jDk7YG1okN4Vm3L7hzpMBnktNlrFLc+GhY3O
X-Google-Smtp-Source: ABdhPJxGBLZF1jlZKcKbjlOflMXaW/vAHBWu7fR9pPGvxm7TO7lO3LkOEzMtr4yuUNUKm16mJIbDEQ==
X-Received: by 2002:a17:902:e88e:b0:154:7562:176d with SMTP id
 w14-20020a170902e88e00b001547562176dmr8166892plg.13.1647979378618; 
 Tue, 22 Mar 2022 13:02:58 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 h2-20020a056a00218200b004f6519ce666sm24451135pfi.170.2022.03.22.13.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 13:02:58 -0700 (PDT)
Date: Tue, 22 Mar 2022 13:02:58 -0700 (PDT)
X-Google-Original-Date: Tue, 22 Mar 2022 13:02:56 PDT (-0700)
Subject: Re: [PATCH 0/5] Generic Ticket Spinlocks
In-Reply-To: <c0328672-6dd1-b65b-1e2f-6f2562084f2d@conchuod.ie>
CC: linux-riscv@lists.infradead.org, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi, shorne@gmail.com, mingo@redhat.com,
 Will Deacon <will@kernel.org>, longman@redhat.com, boqun.feng@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, jszhang@kernel.org,
 wangkefeng.wang@huawei.com, 
 openrisc@lists.librecores.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, peterz@infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: mail@conchuod.ie
Message-ID: <mhng-f97b1e7d-1523-4ae5-923b-e73a8db48824@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_130259_886569_A482E3C7 
X-CRM114-Status: GOOD (  29.23  )
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

On Tue, 22 Mar 2022 11:18:18 PDT (-0700), mail@conchuod.ie wrote:
> On 16/03/2022 23:25, Palmer Dabbelt wrote:
>> Peter sent an RFC out about a year ago
>> <https://lore.kernel.org/lkml/YHbBBuVFNnI4kjj3@hirez.programming.kicks-ass.net/>,
>> but after a spirited discussion it looks like we lost track of things.
>> IIRC there was broad consensus on this being the way to go, but there
>> was a lot of discussion so I wasn't sure.  Given that it's been a year,
>> I figured it'd be best to just send this out again formatted a bit more
>> explicitly as a patch.
>>
>> This has had almost no testing (just a build test on RISC-V defconfig),
>> but I wanted to send it out largely as-is because I didn't have a SOB
>> from Peter on the code.  I had sent around something sort of similar in
>> spirit, but this looks completely re-written.  Just to play it safe I
>> wanted to send out almost exactly as it was posted.  I'd probably rename
>> this tspinlock and tspinlock_types, as the mis-match kind of makes my
>> eyes go funny, but I don't really care that much.  I'll also go through
>> the other ports and see if there's any more candidates, I seem to
>> remember there having been more than just OpenRISC but it's been a
>> while.
>>
>> I'm in no big rush for this and given the complex HW dependencies I
>> think it's best to target it for 5.19, that'd give us a full merge
>> window for folks to test/benchmark it on their systems to make sure it's
>> OK.
>
> Is there a specific way you have been testing/benching things, or is it
> just a case of test what we ourselves care about?

I do a bunch of functional testing in QEMU (it's all in my 
riscv-systems-ci repo, but that's not really fit for human consumption 
so I don't tell folks to use it).  That's pretty much useless for 
something like this: sure it'd find something just straight-up broken in 
the lock implementation, but the stuff I'm really worried about here 
would be poor interactions with hardware that wasn't designed/tested 
against this flavor of locks.

I don't currently do any regular testing on HW, but there's a handful of 
folks who do.  If you've got HW you care about then the best bet is to 
give this a shot on it.  There's already been some boot test reports, so 
it's at least mostly there (on RISC-V, last I saw it was breaking 
OpenRISC so there's probably some lurking issue somewhere).  I was 
hoping we'd get enough coverage that way to have confidence in this, but 
if not then I've got a bunch of RISC-V hardware lying around that I can 
spin up to fill the gaps.

As far as what workloads, I really don't know here.  At least on RISC-V, 
I think any lock microbenchmarks would be essentially meaningless: this 
is fair, so even if lock/unlock is a bit slower that's probably a win 
for real workloads.  That said, I'm not sure any of the existing 
hardware runs any workloads that I'm personally interested in so unless 
this is some massive hit to just general system responsiveness or 
make/GCC then I'm probably not going to find anything.

Happy to hear if anyone has ideas, though.

>
> Thanks,
> Conor.
>
>> RISC-V has a forward progress guarantee so we should be safe, but
>> these can always trip things up.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
