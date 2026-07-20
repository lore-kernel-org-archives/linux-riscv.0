Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC26C44521
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 07:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zmTmT/6pTOWRx3dOS5avUOfMoIjYn8j6mUSg4+5c+XA=; b=fV+pvfunRrskG4
	rnS2P7w56yBJyCUSJc2pRHculVtUzag0tOgZuied1eezUvdt6zg80E7fbMjG8wqjF0GZB8I/M63R6
	6P2zkrK28abOF4D+26f72bLOFKXPQcb4CRAmwbJ654+HkrhWSCISvfmbeN0z5MplkbaXP8dUzYn0N
	OZMfMUQKufnHIZ7cgzQHxIQjnPe3LT9iNO5CcgTBWymHGALWltGILXYA8g1Q5uTRdLkRwj7FtH3dO
	ar1Elx8fNkjKBM838mqeGNG15uXCXHobVSL37lp4L8plaexB02/q4NvPqNH8XCiE5hm2x8UIeB532
	drXKoAQoBH6dWuRf5ufA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliAD-000000062A9-36Nu;
	Mon, 20 Jul 2026 07:11:45 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliAA-0000000628s-0IBB
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 07:11:44 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784531499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nYD9zXX3c9HHhl9NONzswyD+7eKrsUrSq8O7MLUXBcQ=;
	b=ruOFKnIXwLREv2+wY8QekiaexlWPlXyo0QG4Am8n69WjnYyW9qHtWpm5/TZCdj4cyRxfTv
	SbiIcuiYQhbEr51Jm4hvANqJafFMq6daEM0vTgGIeG7YxfhOMZMRLnhRNqXCrZpxwfJAm9
	Nb8X4e6MPAQzUFKynN4JgwRvfmPb0SRrntS5uq4JEdTf3ZMZ3jW60rFw58NYG0o/OMvGWu
	YCjx+losFM0U3muBz18MSgXodcO6OUtBueJRkpxAp+KDHpTAFTWZy/Hwy0AKvTDWbhjad8
	1DPMQS6qjZtWuaECZOwwxLYC7t3KYfsHG+AH2LujbEYGCZ+DOuObiRp8M3lrHg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784531499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nYD9zXX3c9HHhl9NONzswyD+7eKrsUrSq8O7MLUXBcQ=;
	b=QrCZh3ruDNPXVxsBRAnLKLdVGu5gelwzmrLAr/kCkZrMeO53GqI8erkEMgE4B+NtZtN5Gz
	OxfwrS6xA+k6M5CQ==
To: Xiaofeng Yuan <xiaofengmian@163.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, xiaofengmian@163.com
Subject: Re: [PATCH v4 0/2] riscv: fix kprobes on minimal kernel configs
In-Reply-To: <20260720032258.5188-1-xiaofengmian@163.com>
References: <20260720032258.5188-1-xiaofengmian@163.com>
Date: Mon, 20 Jul 2026 09:11:37 +0200
Message-ID: <87h5luf846.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_001142_269914_2EA12AAB 
X-CRM114-Status: UNSURE (   3.82  )
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

Xiaofeng Yuan <xiaofengmian@163.com> writes:
> When building with an allnoconfig-derived minimal configuration
> (without CONFIG_STRICT_MODULE_RWX), kprobes fails because
> instruction slot pages from EXECMEM_KPROBES are read-only and
> patch_map() bypasses the fixmap writable alias.
>
> These two patches fix the infrastructure.

Reviewed-by: Nam Cao <namcao@linutronix.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
