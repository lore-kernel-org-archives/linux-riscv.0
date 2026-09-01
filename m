Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D006CC61DD3
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 18:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sxKNclFFqIuIaLjPEoLMCb618SYUmPs7wZnRTvPWK7Q=; b=oaWtGBM3Mz398d
	NKF0Xp5KlqA0RNu45erWEOFZ+JBaPLDpp8IX91PT5pUOO6lHTopX9tCxyNA8J/zCGB6Y7XdP3nhJC
	K0r2fPMmX6BgTGIn4FAfZ4iVlGAajWBbfKCEAemfsGpP05CxPWQufhtRf7WOX9HHAundUwBd2P0AN
	PblMl8S+Bd9DOk3Q8fePtfrvI57VDH8y2QZu99p3+LjRMq1urSgyztU7nDOZm3/RydImTonwSEa0p
	jCx0A70Geo/wtHgWTAwj5LgkaIu7Y/QuQ+0uG8SsFxV/ptyS+9N6zD6DtUiQrOKWYeDZTo0R3lNxH
	03Sh8cwSYGRyDVyC+6EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TVb-0000000D09f-0a31;
	Tue, 01 Sep 2026 18:46:59 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TVZ-0000000D08k-1FSf
	for linux-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 18:46:58 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788288410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SyHXRFB8mCilyaBZQnFT9s0cnWeexGCKc/96On91Wp4=;
	b=KKf+4D8QPQTmN7fi2OPoKhQjy3/oFXUF9FuQv1QT6XwYvUOotRvHa1SknjhKNFXgDV5g0H
	mJxHajqJBHSfC6cU0g0UM3z+HUEQr7CY48kbUg6kSgU9tx60EBi2M0UxeJk9fDLT969NHs
	QGyAaUp3dr0QSmaqMQgq7VB7CgDSNHx9lZFNrKc97bBRVeWT3P7iOoWkmQqsz1cTY7yO9T
	RPm4MNNf1ye1rOkkt+VUGHNj9fcTk0s4xruyNNcJTZy1DqKDKPTR9FxvRJqXXogwUm5gHf
	Z5qtqgaw697i3rbB8RRvy48yRFRm9i7lVpB7JpqV3/juwx1Kg/6vj2aAqGcqjw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788288410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SyHXRFB8mCilyaBZQnFT9s0cnWeexGCKc/96On91Wp4=;
	b=txIW24VdDhm9iD4wJl6INCgJlyPmFUhDoJSWnZ0UKR2kCEYA2Kosk6Xg4fOj7FZ6cRG/eD
	IgVr+a/ExvUd5ADA==
To: Zongmin Zhou <min_halo@163.com>, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu
Cc: alex@ghiti.fr, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: Re: [PATCH] riscv: kprobes: Reject reserved branch encodings
In-Reply-To: <20260901115421.109573-1-min_halo@163.com>
References: <20260901115421.109573-1-min_halo@163.com>
Date: Tue, 01 Sep 2026 20:46:50 +0200
Message-ID: <87pkywajxh.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_114657_475767_9A53E2DF 
X-CRM114-Status: UNSURE (   5.35  )
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

Zongmin Zhou <min_halo@163.com> writes:
> A probe on such an encoding, e.g. placed on
> data misdecoded as instructions, therefore keeps the instruction
> pointer on the breakpoint, and the CPU traps on it forever.

How can that happen? Isn't probe on data disallowed? And how can the
instruction pointer be on data?

How did you find this issue? If this is from some LLM, please add
Assisted-by: tag.

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
