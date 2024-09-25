Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112E3CF9C6F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Sep 2024 14:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HKldkyXLDB9sw0sQxcDTxWDLGsbNAraNucKukRtxrk0=; b=a4bRdW1hV1UNdM
	C3JUmx1wbT2vFi2FKOuXNWJVbrejEXtOjuf2dvWr7dA3W5KAZr+kU95tK1394Ot9L4FTdRdX7R0qz
	ZQ2OSWknDDrq/ED0H7Dmz6PKTGpaUqgqvkxg5tlGjoYiYzJLndUFJNkmeE8Lmf2NOPimyCVbwEj6i
	lvpSmKI/Tm6naAuSylwop7GgqGm7lmE7xL/deebj8BODMobaiKNN0RIDTM1Sx1cUBUOI/0O3/VM+0
	wYBXsLUpbIjqGv6d7PJOoTX9Q2beonP96125NwQ1KRMjNyRDtBTNr6EXlQW9AjJkurBbtBT/8ZeMb
	rmB+3ZWzUQFM9fYM3v0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stSii-00000005Y9v-0WMN;
	Wed, 25 Sep 2024 14:10:20 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stSia-00000005Y3j-17iS
	for linux-riscv@lists.infradead.org;
	Wed, 25 Sep 2024 14:10:17 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out2.suse.de (Postfix) with ESMTP id 057681FD56;
	Wed, 25 Sep 2024 14:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1727273409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MQXEWldAB6xaGZH6C2X1lgYW1//ghAx2k+LKF41iwao=;
	b=vbzz3VYhrbDtytL1wqCyg0vtAyAd2YeMTT762AnBwGngo1nKeskqfyEGqSPvzOwMCyxave
	uxXbEqY5RnR/MkA8ILTwNTxd9/JI/z3/EzLGFwsbR15Mo7s4hQrtyaTygwPd6OdmCZE9at
	zBWtnSUxSCbvTpD59wuNDqbHSQuzt78=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727273409;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MQXEWldAB6xaGZH6C2X1lgYW1//ghAx2k+LKF41iwao=;
	b=VLTgCShXNnNi+/2XV9kM0DA0tXN4A2hL5ic2JLqdf8lAITaNWcoMMcM1v9oAw8ulzz1TC4
	2Rkv3RZQ8FIuvJAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1727273409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MQXEWldAB6xaGZH6C2X1lgYW1//ghAx2k+LKF41iwao=;
	b=vbzz3VYhrbDtytL1wqCyg0vtAyAd2YeMTT762AnBwGngo1nKeskqfyEGqSPvzOwMCyxave
	uxXbEqY5RnR/MkA8ILTwNTxd9/JI/z3/EzLGFwsbR15Mo7s4hQrtyaTygwPd6OdmCZE9at
	zBWtnSUxSCbvTpD59wuNDqbHSQuzt78=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727273409;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MQXEWldAB6xaGZH6C2X1lgYW1//ghAx2k+LKF41iwao=;
	b=VLTgCShXNnNi+/2XV9kM0DA0tXN4A2hL5ic2JLqdf8lAITaNWcoMMcM1v9oAw8ulzz1TC4
	2Rkv3RZQ8FIuvJAQ==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 905914A04E6; Wed, 25 Sep 2024 16:10:08 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Xu Lu <luxu.kernel@bytedance.com>,  paul.walmsley@sifive.com,
  palmer@dabbelt.com,  aou@eecs.berkeley.edu,  andy.chiu@sifive.com,
  guoren@kernel.org,  christoph.muellner@vrull.eu,
  linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org,
  lihangjing@bytedance.com,  dengliang.1214@bytedance.com,
  xieyongji@bytedance.com,  chaiwen.cc@bytedance.com
Subject: Re: [PATCH v3 1/2] riscv: process: Introduce idle thread using
 Zawrs extension
In-Reply-To: <20240925-2acd8d9743cf40b999172b40@orel> (Andrew Jones's message
	of "Wed, 25 Sep 2024 15:54:28 +0200")
References: <20240925131547.42396-1-luxu.kernel@bytedance.com>
	<20240925131547.42396-2-luxu.kernel@bytedance.com>
	<20240925-2acd8d9743cf40b999172b40@orel>
X-Yow: On the road, ZIPPY is a pinhead without a purpose, but never
 without a POINT.
Date: Wed, 25 Sep 2024 16:10:08 +0200
Message-ID: <mvmbk0b7rjz.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.20 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	MID_RHS_MATCH_FROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[from(RLajr16mudzow8bnf6sy)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_071012_510732_30039FA2 
X-CRM114-Status: GOOD (  10.02  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sep 25 2024, Andrew Jones wrote:

> On Wed, Sep 25, 2024 at 09:15:46PM GMT, Xu Lu wrote:
>> @@ -148,6 +149,21 @@ static inline void wait_for_interrupt(void)
>>  	__asm__ __volatile__ ("wfi");
>>  }
>>  
>> +static inline void wrs_nto(unsigned long *addr)
>> +{
>> +	int val;
>> +
>> +	__asm__ __volatile__(
>> +#ifdef CONFIG_64BIT
>> +			"lr.d %[p], %[v]\n\t"
>> +#else
>> +			"lr.w %[p], %[v]\n\t"
>> +#endif
>
> val is always 32-bit since it's an int. We should always use lr.w.

Shouldn't val be unsigned long like the pointer that is being read?

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
