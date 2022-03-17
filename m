Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE43CC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 09:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6oD45kYD5txudbfhPanc+mGLo7GuBMQClU2Srmh3jqw=; b=QUsCqr88OwTc+C
	zerO7pOj5pj/HAXz+iE0O+aBwpmM/oCSUEt62xMsMPI/rHcbvlEqVIJoo8qTw/xR4bcey6FxAuA6C
	78xEjrGvL9QjzNbO2E1ithnfI3SSMFJ6nOGldUoD4TYKUkurwZeJEWhGv3oQ0BrU6mieggEWS4IwJ
	CVVFw7PJrQ1gYvjPGj2p4LGp5Cs8LNU0dPwIixzXnPZQuQN8DPnsdRWHdh235GrhjPnqPwZMMR77H
	7C7xj5s6duPacdlj0U9JqCwJPRWcH+RRHUkZE733kPwEcUsxXFU1rTMhAsAWhcRcbKWTMQt5QvGIN
	8LPeag39jcX0iFdaRt4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUmjT-00FZvd-Oc; Thu, 17 Mar 2022 09:47:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUmjR-00FZtq-Jm
 for linux-riscv@bombadil.infradead.org; Thu, 17 Mar 2022 09:47:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yicCny8nHaglYevrNfwan/4wAlISyppq00h0F352WzQ=; b=ZP/S7WXk4z47FcQpOt16Es+QV/
 mHBHwX5fKFAqB8OgbZx6AiTNt2RxYoE7tq5GQMY90fLYxK6/+nm9tykIoDW6vqVP4G2ukcTEADEBt
 xTLqFxudQwo2nW6cZU+XiilIkB+IDfwTxFFUn6Mt4IkcHz/l2pEAptD8I3aZS29muBfzLygCcMLX3
 1Kb+fFyLIhNjMo0ZetK9ycqowu+OHIRYtXuPYuf9udj0ItwyLBisExr02IE0e3JrCp1LalMULVDbJ
 ZTWlZtcgsXUjWkVG8EH0OFTk1/yBNApnj5Ov6khXYYCURE8gsJPglhG4z8rbwVPPubCILUaopumkh
 t7Zr+Wsw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUmjJ-001qtK-La; Thu, 17 Mar 2022 09:47:37 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id CC7883001EA;
 Thu, 17 Mar 2022 10:47:35 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id BD191201CD1C3; Thu, 17 Mar 2022 10:47:35 +0100 (CET)
Date: Thu, 17 Mar 2022 10:47:35 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 mingo@redhat.com, Will Deacon <will@kernel.org>, longman@redhat.com,
 boqun.feng@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, jszhang@kernel.org,
 wangkefeng.wang@huawei.com, openrisc@lists.librecores.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH 5/5] RISC-V: Move to queued RW locks
Message-ID: <YjMDt8BgtIZZH8IY@hirez.programming.kicks-ass.net>
References: <20220316232600.20419-1-palmer@rivosinc.com>
 <20220316232600.20419-6-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220316232600.20419-6-palmer@rivosinc.com>
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

On Wed, Mar 16, 2022 at 04:26:00PM -0700, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> With the move to fair spinlocks, we might as well move to fair rwlocks.

s/might as well/can/ ?

Note that qrwlock relies on spinlock to be/provide fairness.

> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
