Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6D5C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 23:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KYGaY1QBf/hm9TJhSt/ip588bL0v4rzARuz4wEwNc9s=; b=m6zcN8vUcP7FLQ
	ciFtT7Giufv0TY2Mwpg0pd9VILGzw05buN7GC9fNgu3NAqk5iEDy1cuJK99aL3GmapEsnFyHDolEF
	rGEnvKWyN3UENvVj4t/TtLHWLpEzRMbqkCh7kQN7XPMZaFQc7yH1/Y9DZR79vGBMWZfr+aB+3ZPo7
	3Qe0JIF1loXGs6rvKSB6tvix6gKan5LHR5SZSoa4UYEORZRKyyOdxkcKI+DsND/d0arXItPLF2mRF
	m+69EsXWIB3LLQgFZcgH/YuXLMGNWRY4ElxJfflSKs6lPJdG414MhDOwQ8lv8Agmty4kM2Nrh64/G
	4DswqGYh2XgJ3Tol8UOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8VSt-0017Ei-Ml; Thu, 22 Dec 2022 23:59:07 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8VSZ-00177s-C7
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 23:58:49 +0000
Received: by mail-pj1-x1033.google.com with SMTP id p4so3457655pjk.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 Dec 2022 15:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wuQb18hsH3PVKKhlNX3iIN37M1+/+r0ie7whgaMIAuI=;
        b=JWTRj/CS6QleDMkVnOcUuDhwl4FBxyuEcl1DJkuBzancbxmUVcaJCRv5n96N7pB+AS
         V5sZLbwaURsOe0GW0gnWnMgTKAFu70S8L2Dwy5tNUeI3gjz4ZbHTJbbBgG7jSXE3ew0/
         cYjcUDnZKVeD5sWWgjtwO/6WCXfnhs5DZrC5sTSf6C07bakGHzjMGWQMRQWAM6KbleBH
         PW7GnMhx8uJESRYt1W3pcNAXlK9NQD0MIGQeWbFJ6mpU8Px18T07tZWBxqLOblatcCQT
         LtlExVx+eJvlYWOUaDejAHT3sENc9kbxMJcthmAjNjJ9YVVZd3a6x6oP46+nxoktP2mW
         dvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wuQb18hsH3PVKKhlNX3iIN37M1+/+r0ie7whgaMIAuI=;
        b=qSLnHVFmUYSsNWj+dL6RRmIN6pSdWQuXrpyU19g+m0fy6a1ygQ1/kKT2B+bCMii2PF
         0Eb3m8ENU80SWDEGoC5EAEb+7VYd7vyxhGftftqcDbAZCMQQ0IbYU6942IXt3GWB7j2d
         Ndu9MKVE8XpkJyfxC/9a0frmMvhFR1PkiIzMZCB45zixdWMkFXz9d1hZ9s2B+qr2kug3
         ndbLXUusR0KUNkm7AAjNEM7gElHw1cIJSaug8+OWyuBg6Fpry2lC0cCMkadmvQqVpQ20
         4UhVvhg9dVxw+siJgGvbDH5xswxQ3ElQ/LSkHIzBKKaf4ywbbAEabMtQRVHMPGulW+wl
         WxYQ==
X-Gm-Message-State: AFqh2kp3ZkqgIDBA8ZhkftO6TJtUzMATj00geuk4ksm+MoGrWGJnfqM3
	cLMRVCwe/5lsh/+1lNKg73WfbQ==
X-Google-Smtp-Source: AMrXdXuSxui2eZcxC12b3uNSSsVrt7hM2p8XGfKziz4RHlFkfHTJw7jHoXHNI/kfX52FFs4bn9lpMA==
X-Received: by 2002:a05:6a20:698b:b0:a5:35f1:95d1 with SMTP id t11-20020a056a20698b00b000a535f195d1mr11822531pzk.35.1671753525608;
        Thu, 22 Dec 2022 15:58:45 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id j186-20020a6255c3000000b00576259507c0sm1242500pfb.100.2022.12.22.15.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 15:58:45 -0800 (PST)
Message-ID: <56d98923-7b74-f8c9-b65d-a4942071c92d@rivosinc.com>
Date: Thu, 22 Dec 2022 15:58:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Adding V-ext regs to signal context w/o expanding kernel struct
 sigcontext to avoid glibc ABI break
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Andy Chiu <andy.chiu@sifive.com>
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
References: <CABvJ_xjGZ3S0oAkT08x4DToQFdcUH06omk2OTT1EHDZRJ-2wKg@mail.gmail.com>
 <87sfy5ndid.fsf@oldenburg.str.redhat.com>
 <CABvJ_xjSREsdemJkCJMGSx+09jrNoSbXCwuxF0zEQmZtHrWMvg@mail.gmail.com>
 <d613968f-0fae-1994-3bee-fb10765167c3@rivosinc.com>
 <73c0124c-4794-6e40-460c-b26df407f322@rivosinc.com>
 <CABvJ_xgDsthnm_h6mYowK03VUKqYk=nZsSZ7R=0BTwFHGKEAMw@mail.gmail.com>
 <50c598a6-e3b3-3062-abe7-23a406067533@rivosinc.com>
 <7430f494-9b43-5e03-c1e9-6b83e2611a11@rivosinc.com>
 <b67238bf-4b5d-dd17-99ff-88b0270ce10a@linaro.org>
 <CABgGipVT9L5p623Q2rbjrm=tTwcnjSr178CRKTNs+WMbm7=+-Q@mail.gmail.com>
 <Y6Tsn3RZ4tt8k/2m@spud>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <Y6Tsn3RZ4tt8k/2m@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_155847_710125_9EC7A2B5 
X-CRM114-Status: GOOD (  12.98  )
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



On 12/22/22 15:47, Conor Dooley wrote:
> On Fri, Dec 23, 2022 at 02:33:26AM +0800, Andy Chiu wrote:
>   
>> I wrote a PoC patch for this and it has been pushed into the following git tree:
>> https://github.com/sifive/riscv-linux/tree/dev/andyc/for-next-v13
>> I tested it on a rv32 QEMU virt machine and the user space can get/set
>> Vector registers normally. I haven't tested it on rv64 yet but it
>> should be no difference. The patch is not the final version and maybe
>> I missed some basic ideas.
>> But if everyone agrees with this approach
>> then I would like to start formalizing and submit the series.
> Between yourself and the Rivos folk, you should probably sort out who is
> doing what with the series at the very least, so that you're not both
> working on "competing" v13s...

No we are not competing ;-)
I'm mostly facilitating since this got stuck in a stalemate and original 
contributors had gone radio silent for a while.

-Vineet

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
