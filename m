Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4447CA5534
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 10:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=avqJC5FIQRImjdi362ST7eL0TT7SNv1RY/LkkID0eeM=; b=YRieZrpXnplvxJnaDEFf0+cW2I
	u9Tsf6Tcfh0stH8LLb3zhmDHIge0DAszf2q/MP39HW64o3Xx0P8nHqF8t4TZZe7fFXcUem8zXus0F
	a5BRBnjFxBP3E4YP+ZRAIpuncl8gyKNporM4R0QXPdvJ2/k4vjaboFwyE7KPLsw6LNa6CZOzkUPAK
	8UgBnE79dSDEw7KER9OYvWvDnBIcIbym2dsfYM4wz8Qc6cxvk2YiASb5su6hfl1ExM1hggoZv8z4d
	FT0Vg2CRDFE5xm00ATi7AeLLQwEhiC1pqaHKd4y+u6TsHYXSgKFqXsu8pWoXloA2K2kgIY2fgqeHh
	jOac0TUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgNOK-005dzQ-1u;
	Wed, 13 Sep 2023 10:46:40 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgNOH-005due-11
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 10:46:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MhRMOIvN2kf1Nhyx139WTv1vjOrG0YZeeK9jDdKA63Y=; b=bhrysTAapPT8ykO09GDfdzsnsA
	HDLIy8lYQBXdRqx9oMKaiU1Pc0KY/BbVKVnhJWN2eI1tU1Npq8UaUTtdIKr2+NexeMsDwXAj/6zcE
	qs4jLmf21UNrmicEpV0+Wxa7WUkDCwrVa6pbG3b/bshY3tXUjGvv7kT4owHSonONKS0zrVScHcMEu
	Wz1BAeOG5n82vQT4sxazfWnQ3Z+Rix/KjGWfq8i9erRYD+A9LIoCGvSTTBAknd9dbwvReTdqhnCez
	TFUSo4Z/hzm8ObXtKeHfvxxjCMMmNxVgCcWwiOpKSgAfqqifdS67+Z7xaMfStveDexLkwteSP80+j
	fKhVcT9w==;
Received: from [134.238.52.102] (helo=[10.8.4.124])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1qgNOB-007U4I-Oc; Wed, 13 Sep 2023 11:46:31 +0100
Message-ID: <17d351c6-e6c3-43ce-a466-691778ba05c3@codethink.co.uk>
Date: Wed, 13 Sep 2023 11:46:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: boot time regressed a lot due to misaligned access probe
Content-Language: en-GB
To: Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
 PalmerDabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Evan Green <evan@rivosinc.com>
References: <ZQD+0BWNU8wlnC9d@xhacker>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <ZQD+0BWNU8wlnC9d@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_034637_438542_DCE632FB 
X-CRM114-Status: GOOD (  11.94  )
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

On 13/09/2023 01:14, Jisheng Zhang wrote:
> Hi all,
> 
> Probing one cpu for misaligned access cost about 0.06s, so it will cost
> about 3.8s on platforms with 64 CPUs, for example, milkv pioneer which
> is powered by sg2042.
> 
> I'm not sure the reason of probing misaligned access for all CPUs. If
> the HW doesn't behave as SMP from misalligned access side, then unless
> userspace processes force cpu affinity, they always suffer from this
> non-SMP pain.
> 
> So, can we only probe the boot cpu?

So a couple of ideas:

#1 is it worth adding a device-tree property to explicitly to say if
the unaligned access has been measured and known

#2 only probe one cpu in a cluster if there are multiple clusters of
cpus?

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
