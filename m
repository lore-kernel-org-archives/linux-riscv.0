Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BD7C54E94
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 21:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q+yug6aGvowLQ8fdgdCUy87E+F4gQN0aTfmdyLLY7zo=; b=douOkd76sBC+j7
	84tMuj9RAqkSLKxbnjlnni+0IIMdHuf+X3+w2mBLqzlAJpb3Q33Yyv+8bFTVeWBsu62ahxe42tWST
	nvslZNQ9+YO07TQj8dyC7LkEE97VJGUPwND3qQRabotFlJ9JS/LWKOlZqRgshu7pzE7l1nOgzY+5E
	o28OkqHpvmkKC08WVfEjldP69xUEIXPgEeK+HVxEbTfhTtYJWwjajDYo8emiwgnfj1RllIGcMY1MN
	HhCOWSNY93eSeLAuRZM1Mec2d1Zw3bNdOwX+eLSbzCMis9KI3HDjFXvXoYJupaT0l0+WwTCoMAM9t
	9jWTW2/AE0j68Qc+0wAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKnlx-008vig-Oo; Wed, 25 Jan 2023 21:57:37 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKnlt-008vgx-GA
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 21:57:36 +0000
Received: by mail-pl1-x62d.google.com with SMTP id v23so244227plo.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 13:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z2vhwDs0FbIEqY+iDhOA3obE1vwwrXQgUVCCUgwo1gY=;
        b=E0MQN0N1mmnXVpE4uf7kU/gwYZWArkmYq+VIImssSdUfHzpbRxiTXmkBRVWUPOYaMV
         hi1lHB5AA8w4affJg/dvVBQcspynoh/ZYvhGNDugls48WaGic3Bi68kyYQ35DdK/ZjSV
         HLUAMgJRQx8nFfHqouuI7dC7uht35pn+01veJZvkXanheZrkPUzzsCvrtR7k7ojRXP9A
         MLXKVRcEv4ZzI5faTshM62DUMedxE6g6qlQInCWUR1LUO5aK7pQmQdpmUU3hkPatZ5be
         jRxW2hAZrKEWks7bpIC0X3EBOAlQkkpvKE0xP5wo487dxha4Jl/rHajXZqPLvpGox/Vx
         jK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z2vhwDs0FbIEqY+iDhOA3obE1vwwrXQgUVCCUgwo1gY=;
        b=4utZhStxXKG2slDYp0SQdyRD+hdKmf3cyAWosMbM0ZGnGgLwlA/Mq/H/9toraaaI+D
         Hzy88hj4T9pkd2cDyYvLGCMDXQ1nz3iOCO6xLNB1fyXXz6zrCF8cTQ/AFjI3jjHVuaQl
         yPM9UIJh6ITM818BZQXXKnbfwr7tRXWA0yiOqEO3/C5B/GHnVNd6aU+8WqlU3xsLggtQ
         JAsvHho35yiDHgV8Cj1EEq6QSMEdcmF8L0w4V9CWmru0fYl2L/ND8mtipiwxmB2bmCt4
         Szqc/FB7tSrg50aDbVRno6VrOP2HCZaoyf9KAeCl0aQ/iXfB8a+u+5yeyfRIi9rzlbaR
         wFaA==
X-Gm-Message-State: AFqh2kqtwwt3tHdUgwmykkf7snHp0AJm/bmdcRJvHQqO/IR+Hse2kgpc
	buuMVxe4YACCmRXThvSE2jRMKA==
X-Google-Smtp-Source: AMrXdXtM4DMMtUycfvOjJNqyg8XXT3U4FOV+OCwywv9YV0usgBP8yfUVDDapp+CeLGBVHTv220oGYA==
X-Received: by 2002:a05:6a20:9f95:b0:b9:478f:9720 with SMTP id mm21-20020a056a209f9500b000b9478f9720mr26088969pzb.42.1674683851207;
        Wed, 25 Jan 2023 13:57:31 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id w7-20020a628207000000b005815a371177sm4087507pfd.52.2023.01.25.13.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 13:57:30 -0800 (PST)
Message-ID: <428eb479-5066-f8c6-ad98-4eeac53a5be8@rivosinc.com>
Date: Wed, 25 Jan 2023 13:57:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH -next v13 04/19] riscv: Clear vector regfile on bootup
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org,
 atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Vincent Chen <vincent.chen@sifive.com>,
 Myrtle Shah <gatecat@ds0.me>, Alexandre Ghiti <alexandre.ghiti@canonical.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-5-andy.chiu@sifive.com> <Y9Gk/FCFBbWC/Pyi@spud>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <Y9Gk/FCFBbWC/Pyi@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_135733_826389_937F71A4 
X-CRM114-Status: GOOD (  10.05  )
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


On 1/25/23 13:54, Conor Dooley wrote:
> n Wed, Jan 25, 2023 at 02:20:41PM +0000, Andy Chiu wrote:
>> clear vector registers on boot if kernel supports V.
>>
>> Signed-off-by: Greentime Hu<greentime.hu@sifive.com>
>> Signed-off-by: Vineet Gupta<vineetg@rivosinc.com>
>> [vineetg: broke this out to a seperate patch]
>> Signed-off-by: Andy Chiu<andy.chiu@sifive.com>
> But this patch didn't carry over the long list of contributors from it's
> source? Seems a bit odd, that's all.
> There was also an Rb from Palmer that got dropped too. Was that
> intentional?
> https://lore.kernel.org/linux-riscv/20220921214439.1491510-6-stillson@rivosinc.com/

In v12 this and 5/19 were in one patch, which I broke off into two for 
clarity. Hence the Rb technically doesn't apply.

-Vineet

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
