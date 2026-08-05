Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FAFC55174
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 11:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Co3gSAX6NGLZ6+5gTDikExqfJ1JgcdFjjZCcGKlW28Y=; b=O18nowzg1Kun9z
	AkB6olcoV4q6X022Kufw9tlpzusrJOtVuIMzAm/TJuHS8++LnVI+6ryWBk2DPSzqHYHmqE4zooSTJ
	l/31WkHi1H3xHXDa1Hvpz/ES9is1qAmgE1oNsATN05XguZVs7g0KekpIAcd0f/ftnW4iTOvf5Rdv8
	vdL0RAxv5F35xpvkMsW7cWNzkrMidwQgvGzItn9pBNWSsnFmG51TH9NojNLkSNAcRIbilnZExCjy9
	MOzygWmGWjKHSTcWt3n0HX6IBFEBnFTNKMTTv1rVO4wiobgNXCLkvCgNvUOq/aBkR3uxGlSn0zyeh
	+Cx0q8nVxMHalSnx5Uig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrZrV-00000003p0h-1I27;
	Wed, 05 Aug 2026 11:32:41 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrZrS-00000003p0E-1ijK;
	Wed, 05 Aug 2026 11:32:39 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785929556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P/Nf6Gxd/9lfzxOV0ouil77PrRiaEFU9fAACLKEQtOY=;
	b=D4u5DeMcHBr5Jvn13Ts7KxRLuaWEUxiEJ45DAneVZfkLVTBIyo9wvmYiu9TU+Nv/VR6xA7
	v79jHnmt7zVdnZLq7cZrV6iHvh3JJF6y6Lj7SYiS/22jhZe2IqAmq6OQxrDpEexT6MOfHC
	mrLV5alkk0bi5KO0o4TH6teeP0SK1xVl/UO7ou/iYuonEIBUPaD4Ennxco2dUqlU+WAnpB
	+meWBcqsWk4lOKVUoRucAfiyIShLcbwlLuo1qfCpmc1V6X4smcCKnJFvTAMP+zAeFON80x
	LYX52nD/TpYB/qZfU4esytHVfC0Ryuf/20hM7ZvOiSWQ7bfSw4Zerefilm32dg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785929556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P/Nf6Gxd/9lfzxOV0ouil77PrRiaEFU9fAACLKEQtOY=;
	b=MEB8PzqI5BETYkCdp/BgCLKYzCRG3v74fMGD8qYkXY6irlE/pWNs1VTPronLaaa1Ov7KPA
	pVD+5x5D8AWi/pCA==
To: Charlie Jenkins <thecharlesjenkins@gmail.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Atish Patra
 <atish.patra@linux.dev>, Conor Dooley <conor@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Shuah
 Khan <shuah@kernel.org>, Radim =?utf-8?B?S3LEjW3DocWZ?=
 <radim.krcmar@oss.qualcomm.com>,
 Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Charlie Jenkins
 <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH v3 01/17] riscv: Introduce instruction table generation
In-Reply-To: <20260707-riscv_insn_table-v3-1-3f8e5f75ba97@gmail.com>
References: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
 <20260707-riscv_insn_table-v3-1-3f8e5f75ba97@gmail.com>
Date: Wed, 05 Aug 2026 13:32:35 +0200
Message-ID: <87v79o950s.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_043238_649434_828A50D5 
X-CRM114-Status: UNSURE (   4.41  )
X-CRM114-Notice: Please train this message.
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

Charlie Jenkins <thecharlesjenkins@gmail.com> writes:
> +        # Replace all . with _
> +        formatted_inst_name=$name
> +        while [ ! ${formatted_inst_name##*.*} ]; do
> +            prefix=${formatted_inst_name%.*}
> +            suffix=${formatted_inst_name##*.}
> +            contains_dot=${formatted_inst_name##*.*}

Isn't contains_dot always empty, because we only get here if
formatted_inst_name has a dot?

> +        # Instruction only appears in one base
> +        only_base=
> +        if [ "${base}" != "${base%32}" ]; then

Does
           if [ "${base}" = "32" ]; then

work?

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
