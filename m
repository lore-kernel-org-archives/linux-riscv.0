Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174ACC2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 08:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4I47qcj289V4XrbCgstwEnYB3Ym0zJn6gvyGRTKwgkI=; b=tKbuYd4VGm/iiQ
	W/xmvweEhnVsR7q17WPvn5YlCT7Vxnapi6WLD8RqL/tuAkMr7hwtIKaBYvlCDq3BMlYubmxcJCiZ0
	JFdQitwDg5uPdYczL/AZhYKhMRISLEo24qIV2TcXGLtgkgcJnJcjI/Kqw7ybmyB24JHvlqvXC4DdM
	r6+HaBSaZMuV97R4FtaSG73pF7eYsvo/N8E5k2O+LPefB/KJ7gvwD2YP3DeT/9i+oL//Qu1WKCCIm
	kxLOSe9DdC27MmjVnRRTa1IpTcADtOVi0y1EJ785gp1As/k3CnkVAmzoaKKaSMet/JruvCVlj9Rhn
	OEpGRRiqs/Yh9TImnvoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMkDL-00000009gSz-0l7i;
	Thu, 27 Jun 2024 08:10:43 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMkDD-00000009gQH-2Ovv
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 08:10:42 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out1.suse.de (Postfix) with ESMTP id 56D9E21B62;
	Thu, 27 Jun 2024 08:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719475833; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O/6bKq4Llc5fVguWZOvySL2EpXqSm5wW1VCRN/H060g=;
	b=T5e3TRNw5488vzhgVQe8aAo7J4NB8KWUWaZHJo4LGBaTy3ne3FrCpWvGjq2cQtK8i+Alad
	55EJ5ZMN5w5aHbGtTpj8zg3TIlwtbpolQdk6xiGX48ShQeaKdybr8j6qG2jGvpzdl7DUkr
	B+supgOhi4HSt8HZixhtdd2kaxs0/4o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719475833;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O/6bKq4Llc5fVguWZOvySL2EpXqSm5wW1VCRN/H060g=;
	b=UWJzLCu0nbusV2XQPoU19fjHKw/YjolxGL0/UPRAYbBXsbvUYAuPYNrSFExHdQGDx668zT
	4HCL2tIeIBsiDtAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719475831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O/6bKq4Llc5fVguWZOvySL2EpXqSm5wW1VCRN/H060g=;
	b=SJsXO90ZTmZNvd4HrKg1Fo0TWZe72U5/Y04jsZ9hbmds6RxuY7Uu98Z1BGKo82Mivv0D+j
	vA4qXWao6T3R2ceo0XB3EfYlWQIbD7YZWSBVKBYQhiMGo1aw2G+XGY9NwhSl5Dw88qAK+U
	t/z53QSdbqtkEce5d5cPR7ixccuJjqg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719475831;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O/6bKq4Llc5fVguWZOvySL2EpXqSm5wW1VCRN/H060g=;
	b=IF6HcUwx4qYltG85wA4ByX/ubyFpy9+iwe1K0Zqp5nzBAimsG8e5GwY3L1LwDBOGSu5zYv
	/rwX5I07a6KRs3CA==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 476F94A050D; Thu, 27 Jun 2024 10:10:31 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Celeste Liu <coelacanthushex@gmail.com>
Cc: "Dmitry V. Levin" <ldv@strace.io>,  Palmer Dabbelt
 <palmer@rivosinc.com>,  Paul Walmsley <paul.walmsley@sifive.com>,  Albert
 Ou <aou@eecs.berkeley.edu>,  Guo Ren <guoren@kernel.org>,  =?utf-8?B?Qmo=?=
 =?utf-8?B?w7ZybiBUw7ZwZWw=?=
 <bjorn@rivosinc.com>,  Conor Dooley <conor.dooley@microchip.com>,
  linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org,  David
 Laight <David.Laight@ACULAB.COM>,  Felix Yan <felixonmars@archlinux.org>,
  Ruizhe Pan <c141028@gmail.com>,  Shiqi Zhang <shiqi@isrc.iscas.ac.cn>,
  Emil Renner Berthing <emil.renner.berthing@canonical.com>,  "Ivan A.
 Melnikov" <iv@altlinux.org>
Subject: Re: [PATCH v5] riscv: entry: set a0 = -ENOSYS only when syscall != -1
In-Reply-To: <9c102328-6bb3-46b6-bc2f-d011a284d5b0@gmail.com> (Celeste Liu's
	message of "Thu, 27 Jun 2024 15:47:47 +0800")
References: <20230801141607.435192-1-CoelacanthusHex@gmail.com>
	<20240627071422.GA2626@altlinux.org>
	<9c102328-6bb3-46b6-bc2f-d011a284d5b0@gmail.com>
X-Yow: Your CHEEKS sit like twin NECTARINES above a MOUTH that knows no
 BOUNDS --
Date: Thu, 27 Jun 2024 10:10:31 +0200
Message-ID: <mvmr0cin6vc.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.20 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[strace.io,rivosinc.com,sifive.com,eecs.berkeley.edu,kernel.org,microchip.com,lists.infradead.org,vger.kernel.org,ACULAB.COM,archlinux.org,gmail.com,isrc.iscas.ac.cn,canonical.com,altlinux.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hawking.nue2.suse.org:helo,suse.de:email];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_011035_861088_EC5A67DE 
X-CRM114-Status: UNSURE (   5.44  )
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

On Jun 27 2024, Celeste Liu wrote:

> suggestion and we found cast long to ulong is implementation-defined
> behavior in C

There is nothing implementaton-defined in a long to ulong conversion.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
