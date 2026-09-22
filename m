Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53C6C98302
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 13:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/R6fYs03tP4ZFtc0PyuIU1iu3fhJBLn/4XXMTcOieW0=; b=kuvpDEGdUuUpHF
	kPEdi77Fg9/MPUL6SGTApdfnVV+JhUW3RSE59kwLXPP4crWOcVuFCFrvUyhaawcGZmmotifHwLCO6
	uoTzhgkTZyk3fxmjMJOf0GIlcvbVCkD2ZbwtaaCiZqC9+hlv218NkgPnM5a8DGCnimW1AfFc+U5In
	2VaWhylUqQe15ENipz2NWxYkghU2o2D5S52IkXx9vr+RYYnN361n6ofTnQjM3YZ+Vj6qSlOPVM9ZV
	q9IGnJiUyXv2MNuXaaBlMPZ1Wj+WGm6mLfxDUxqUFMj4Yt+OuY1vAr82ZViffvAMVFH9JroYgJTc/
	HZ5Hqc27LuZDVjNZWxjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90tB-00000005bFL-1GHS;
	Tue, 22 Sep 2026 13:50:29 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90t9-00000005bED-0ETj
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 13:50:28 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790085024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LD4Dt1VUowZxVym8KcVqrFzWA9GmmHGYh/uLDgQnS14=;
	b=NY/Z972E8io5RKYuLLWT4laqvmc7zfb/pkzogbdqmbPBDLTuyagus4/xOri9jYXR81fT1g
	nLBtkj2zwmiEXI/9FQ5wVrFQrEDs2ZUf7187TMD7llJrIe3ynavsL9uH7gR1rt8ZjZCHVd
	VXDEQYmQXKdVVn9jQDZclayKxdSZehAg+146YApOF5dOF+T2UTDHuT1pyqYTe2DeLgUcRG
	41yup6LLbyBbaykYqQ+3sNmXmhHmFByPWxlTWbbN4KLIBYZRpeqOYBz7MQ2LdhwUHrY0ft
	8AfyRiwgI3csBtQftyvJl2DK3ofb6UdWfmLWYVfQSnxO5d1b2MAkNwUO0y0ERQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790085024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LD4Dt1VUowZxVym8KcVqrFzWA9GmmHGYh/uLDgQnS14=;
	b=Qk23kcZip5Cfoen/tLRwu5rBgruubDgq/l4i8elkpnVTnRsPlPy1F8wJHJXQ3tb5E0g082
	xz5TpahA4l3mONCQ==
To: Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] riscv: word-at-a-time: improve find_zero()
 without Zbb
In-Reply-To: <20260908235312.8440-3-jszhang@kernel.org>
References: <20260908235312.8440-1-jszhang@kernel.org>
 <20260908235312.8440-3-jszhang@kernel.org>
Date: Tue, 22 Sep 2026 15:50:24 +0200
Message-ID: <87pky5e6ov.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_065027_255783_270CCC8B 
X-CRM114-Status: UNSURE (   6.55  )
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

Jisheng Zhang <jszhang@kernel.org> writes:
> Previous commit improved the find_zero() performance for !RISCV_ISA_ZBB.
> What about RISCV_ISA_ZBB=y but the HW doesn't support Zbb? We have the
> same heavy generic fls64() issue.

This patch separation makes sense in your first version. Now it makes
more sense to squash this part to the first patch.

...
> To remove non-necessary zero bits couting on RV32, we also replace the
> 'fls64(mask) >> 3' with '!mask ? 0 : ((__fls(mask) + 1) >> 3);'

This should be its own patch.

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
