Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B914F53D96
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 21:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=daOR9qpZG2FbPwtQd6vBGxu0t+OPzcNyZcmZ7UO0kJw=; b=OqSoYQi/6IdnQH
	bFloHp/BC3WxcHUYGObc6J5mDpvrPev+tFGOvbtu+D0hT9U4vYky7Iv9n9y8C2NUEajJaz8w6yvI7
	QehgQ63DO7ccp1ZBIapf3QvB+/aTaw960qwMNH7lmrfwlV+aj6RK60ktBOgqvu5RdC5bEZtDUrFou
	ZwG28QKxCFE5bGsSvurs1/3Q1Wu0ucYJ040mFo7t8L2ZuMVbTPfz/wQZ3BbODfh7s9SCuBDCr576n
	vNbRGx8FC/FH9CzIXM7BjsBEg3trxqCP/RiJcXCoiSvjiT3vMKZvG/5ClaRk1es1FwO9P7gSN1Jh+
	5+fEC5Vtgsvlxg5bE3aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2FJo-00000004vPp-05hj;
	Mon, 16 Mar 2026 21:17:44 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2FJl-00000004vPH-0My9
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 21:17:42 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-1279eced0b9so6818974c88.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 14:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773695860; x=1774300660; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XQCZ/ZXmbI6IEAQ2g9jA2nQCx3mjUiyHmJV0MNIZfdc=;
        b=OWcA1PlqQ/BhGqiUhdke6qX/3ZTg81KTDD/PzF7sEOzA2yYnU/FyE4x8rJhiqwcHa+
         PexhqcizEIO1IvHE0bCIYYoHpsjf54hdgh8DBuX/DbYtIiRdIC0OB5uHhMpNfmyHvC3K
         /ZT2M1Z9KRPwt+1W9eeXWLp6T9UXce7xVGY0FAxo9IZF+oNu8Q50KXneXf8gi+jkBjKg
         ZkLQwSlOgYTonO9ff+K8lXa9CyRLPqFWav+dqDwVZg3xn1cp/zvzAKppCyPHxK4wHja5
         4ozpUPy6Ek2JWVvA0+6QVMFJebvPW9FRjBrEK0UPrn0NCjLmMwEKYiZVqFts7j1krmaj
         yrsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773695860; x=1774300660;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQCZ/ZXmbI6IEAQ2g9jA2nQCx3mjUiyHmJV0MNIZfdc=;
        b=nsTm+mq3z/P7wO0rN2mCt7XgIYs0oVtfS97vv9jjZmvRUs0xGFumMgEfUG529DW/bp
         s7LBolzGJOFAQyqogyNzTphg6lI22t3Vo/H2pWyA8pBobxMh/MtRrgLUelFiL+Q5a7sL
         eosmmvLQQqlcg2zSnVULkO2kUaVst1rHJDyHWKRenOGxtxK+ZEjLnFzW/NnSVZQmxlv5
         tV2lUaKD5M/6GZ/7LAOSt9kJZmCpCd8A3MS9zGQ4tpt675eibEor6PnQm4zd/T+8KY6e
         EXHkfU9qbL2bFxxgo6LbvXAOZZXKiXVEpArY8xo1K0GJTqxBEQcDHvso2b0MRY7nQxVZ
         2LmA==
X-Gm-Message-State: AOJu0YwMSK+BtDtpC2L+0qMxDMuECbTOBIJFGUbwLlUUAwEfIb2bJDQh
	ZHMRgWH5N7Pnv7WKYtTgOOHYnFSutXrAj8eU5PA5JmvEnvduq33W61Gr
X-Gm-Gg: ATEYQzyLdYufRnRMOvqI0UlA2z33v7NS0xIknClXRCCGywf2xghZPQPcc3n+KOGUPJP
	xFfENoYHYxxDfvoBlqVcUMNa88TllplXLGeQgxIzol4ovf6S3E+bnqpwtqwivCo8l1yPc3+7173
	J5vcG50gFdOtaICGprDO1uI8bMab8vzUNiG9vbgms1F6NW+kIaNPFHxCPCTdNIxgTfvM9CqZ4h2
	leVlUQNfQb5+SYQV1tN8aatTtiJrMnkfC6U6frvs3C2DIMRDUQdTrckoHd3vnrp3DhGJHcO0TrY
	5T3IFPg9j7oypnQ/0SRNvTnlI99ATztwVor6tKl7P4jn/JaOUfhCN4/ZsQWUMOEFDp86ISV7FJw
	oaypR+oDqXkAAzVwvrkpBu4IeMpMQBmq60bRjLRKKzVwHNKsWtxO+hAowTElOKAKhVySHKDfGSf
	v5EPiXMAvgR3xLdF7Wte/PmOGqqoJVF79Hp7qb/PIk7kK9IqE=
X-Received: by 2002:a05:7300:f692:b0:2be:1f58:32a3 with SMTP id 5a478bee46e88-2bea551b070mr6352335eec.29.1773695860010;
        Mon, 16 Mar 2026 14:17:40 -0700 (PDT)
Received: from [172.16.0.242] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab3e4a54sm18177198eec.10.2026.03.16.14.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 14:17:38 -0700 (PDT)
Message-ID: <9bec308b-0f69-4515-91ce-a2e517d47be4@gmail.com>
Date: Mon, 16 Mar 2026 14:22:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] riscv: Add a custom, simplified version of Svpbmt
 "XPbmtUC"
To: Conor Dooley <conor@kernel.org>, Bo Gan <ganboing@gmail.com>
Cc: linux-riscv@lists.infradead.org, samuel.holland@sifive.com,
 david@redhat.com, palmer@dabbelt.com, pjw@kernel.org, gaohan@iscas.ac.cn,
 me@ziyao.cc, lizhi2@eswincomputing.com, hal.feng@starfivetech.com,
 marcel@ziswiler.com, kernel@esmil.dk, devicetree@vger.kernel.org
References: <20260313084407.29669-1-ganboing@gmail.com>
 <20260313084407.29669-2-ganboing@gmail.com>
 <20260313-visitor-majestic-1a6888dc57b2@spud>
 <25a8565d-a6bb-401f-b776-d743a2ec9ee0@gmail.com>
 <20260313-spiny-duration-702fff6bca17@spud>
 <ba44e0ed-9a6f-4d4d-b3bc-a6e0bac19940@gmail.com>
 <20260314-errant-gnarly-dcca92457051@spud>
 <9592ecf2-8410-4df7-9b2c-17564426240d@gmail.com>
 <20260314-subdued-morally-f20a84fd446c@spud>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260314-subdued-morally-f20a84fd446c@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_141741_143948_C480F384 
X-CRM114-Status: GOOD (  21.33  )
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

On 3/14/26 05:17, Conor Dooley wrote:
> On Fri, Mar 13, 2026 at 10:06:42PM -0700, Bo Gan wrote:
>>> To be honest, I'm not completely dead-set opposed to a property that has
>>> the bit positioning, but any property being added for what is
>>> effectively an erratum needs to pass a high bar when the info could be
>>> gathered in another way. That the eic7700 one depends on firmware for
>>> what the bit may be is points in your favour, since firmware variability
>>> is part of what dt is there to do. The jh7110 is points against, since
>>> it could be fished out of the errata handling code.
>>>
>> Even for JH7110, I don't think it can be handled through the errata. It
>> describes the errata of the core (if I'm not mistaken), and there can be
>> other SoCs using the same core with the same archid/impid, but maps the
>> peripherals differently, and the UC bit position doesn't apply there. I
>> think you are probably looking for "SoC level errata" handling. It's not
>> there AFAIK. Hence I guess both SoC cases point in favor of the dt prop?
> 
> I dunno, nothing wrong with checking the devicetree during the errata
> "probe" code. Checks are not limited to imp/arch ids, can do ecalls etc
> etc in there too, so looking at the root compatible would be possible.
> 
> Either way, if people like what you've done here generally (because
> coming up with our own use of PTE bits could be controversial), and a
> custom property of some sort is to be used, you need to provide a good
> justification of why it is needed in the commit messages because you're
> setting a precedent of being the first "extension" conjured up to suit
> linux that would need that kind of functionality.
> Need to demonstrate that it describes an aspect of the hardware, and
> isn't being conjured up to configure software to use one out of several
> possible values, that it may even be able to determine heuristically
> from information already provided in the devicetree (like the root
> compatible or a completely described memory node).

Got your point. I've moved away from DT and "extension" in v2 and made
it a sifive "errata", given that mapping memory twice through front/sys
port is more of a sifive concept, not something generic to other core
vendors. The DT is kept untouched, and the detection logic is done by
a LUT and sbi ecalls if not predefined. Link:

https://lore.kernel.org/linux-riscv/20260316060328.1173634-1-ganboing@gmail.com

Bo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
