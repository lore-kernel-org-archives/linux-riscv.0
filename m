Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674F0C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 15:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c+sC+PbwKibjbn0YKGJHVjn40vM649aBkSQnC3/rWWY=; b=Zm0c12XLmjFWk6
	hkyCA4tWC3ocHzoFhiaj+OAA8tuEX+hJpHivPPek9jrj3G4alHoc5C/2WtfRDpWcHTuuZ8Zo+aWdr
	MZLB8CzL0n6m+yX7rDvA3NVOWR2FauPfTNlUmoiKhT/dcg4lDcIGi0qCh4fYOTUJgYd/RXC7zhvDV
	y6UCJodbdEixkn+R4KMOCqAZHJoaOV4ws+BhCJvFPan7oRGvHNTjIzspjjeE7ZWwqkHWlSF9PAZml
	+pQfZ7eSZdDmhb2mfpBCIdxBrxRbVuioHQ9aszmY59SPK/90UynxZwI99yAQ1rb0cYRw8c8HigJVj
	+1nH6Q1abceD5W+nlhBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVCbD-00000004Ezr-2sX7;
	Wed, 31 Jan 2024 15:34:03 +0000
Received: from smtpout.efficios.com ([2607:5300:203:b2ee::31e5])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVCbB-00000004Exx-10Xh
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 15:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1706715240;
	bh=JvE4wxUL3PufVxrqn37IX2VRkyiWvVzHahoJOEeAAN0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lPSfX5mKN8KAdjUyhp4wQqLXqMyQtU4oXSSaIK93ceIbBz3nqA+xyShSZ63eNMUEY
	 4ltH4cpctRQ2bKBh2jPUz7YzlckoykLXBXL1iKZGhjEsqitBuZDmZyJzJykroyGZYI
	 UBRzcNKyl0x3ztSsfJ0bzfrYwiCZy2rcArsz5GTC+j1RVGNmPtBcLry/HUkANuRMO7
	 COWdL0YdaUce34kcdlXBa1wur1kg1WwGiV7ZRfpL1fu8Ts2gaEHLM78D8xZmtK+QV5
	 D2TwH4bbt7gA4rZTlIw2qNkrfTkpwniCn8FOD4uTIYdA+HjQ3EqofTYkLu5XDgPZiF
	 wGhhl/Jzf6dQg==
Received: from [172.16.0.134] (192-222-143-198.qc.cable.ebox.net [192.222.143.198])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4TQ5fv5JhHzVrW;
	Wed, 31 Jan 2024 10:33:59 -0500 (EST)
Message-ID: <8325617c-51a4-4747-8082-befe9ff1c0f3@efficios.com>
Date: Wed, 31 Jan 2024 10:33:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] membarrier: riscv: Provide core serializing
 command
Content-Language: en-US
To: Andrea Parri <parri.andrea@gmail.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, paulmck@kernel.org, corbet@lwn.net
Cc: mmaas@google.com, hboehm@google.com, striker@us.ibm.com,
 charlie@rivosinc.com, rehn@rivosinc.com, rdunlap@infradead.org,
 sorear@fastmail.com, linux-riscv@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240131144936.29190-1-parri.andrea@gmail.com>
 <20240131144936.29190-5-parri.andrea@gmail.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
In-Reply-To: <20240131144936.29190-5-parri.andrea@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_073401_384478_359BBA62 
X-CRM114-Status: UNSURE (   7.56  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2024-01-31 09:49, Andrea Parri wrote:
> RISC-V uses xRET instructions on return from interrupt and to go back
> to user-space; the xRET instruction is not core serializing.
> 
> Use FENCE.I for providing core serialization as follows:
> 
>   - by calling sync_core_before_usermode() on return from interrupt (cf.
>     ipi_sync_core()),
> 
>   - via switch_mm() and sync_core_before_usermode() (respectively, for
>     uthread->uthread and kthread->uthread transitions) before returning
>     to user-space.
> 
> On RISC-V, the serialization in switch_mm() is activated by resetting
> the icache_stale_mask of the mm at prepare_sync_core_cmd().
> 
> Suggested-by: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Andrea Parri <parri.andrea@gmail.com>

Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
