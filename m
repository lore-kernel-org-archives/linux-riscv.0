Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92251C3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 11:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2aGAeb6ZcyxigJjbg63rGU8QXCvEbGWYfRARWwUb3ew=; b=0WiIxl30dsRA69
	p28hoEChzKhaCKrgDsFrjcAme6adN3mHX0Z1+RkZnFeR4LrYGIJRviGkwhO+nZWH/++KaL3Ld2b9t
	Ikhwxj9wgUVPaN2ESNWKeP7sDOsxUoLEiNUqOjpb8q9SV8vLD27+u5cTbB65c9lbsfJ/pjiTDbBCb
	FNI4VCScpChTOz8Uyc+pEoD49mpbPel/cSOda6BDS41Wn2r6y+93LsAzonuDzqBwJW0iGZjEBbjO9
	HPyAsB6zIZMhGQmpSCHnvwzPM2k8YLrPWROExp1Kt1KWM41RMZ01uWpbmXyMoKSUJ0YVfv3i0VRr6
	/GuedDidWbkZIS1QAxpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZUHz-00000004xjM-2u5P;
	Thu, 01 Aug 2024 11:48:11 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZUHT-00000004xa4-0ArV;
	Thu, 01 Aug 2024 11:47:42 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out2.suse.de (Postfix) with ESMTP id B228D1FB4C;
	Thu,  1 Aug 2024 11:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722512855; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1V+CVVFrMSoc0AF1TLg4EtDnvPKvuhwL2BSJpc+RBB0=;
	b=nvBlzXEaIqUuiQDJkBfAV+n2oPVtHK//yr96/GvqozddRN2PDhFTPE7pwB/mbaahOi/V97
	rpnHZkm5vy+l1XldcsF5F/SIox8ld9iAJkkHOFeFiUyQanJ/B8/8XZuoddAhl4iMsiTLjz
	fvorecREk3BogxpTMXq2b4Lz2yJVcSo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722512855;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1V+CVVFrMSoc0AF1TLg4EtDnvPKvuhwL2BSJpc+RBB0=;
	b=6Ph/GSOa+4my2qscx31XcmuWmXCqO6ZhnI81TsSAqD1yE64L5kIT+dLfLMWqJDG3WHzEtp
	sWExgwD8r1TI7WDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722512855; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1V+CVVFrMSoc0AF1TLg4EtDnvPKvuhwL2BSJpc+RBB0=;
	b=nvBlzXEaIqUuiQDJkBfAV+n2oPVtHK//yr96/GvqozddRN2PDhFTPE7pwB/mbaahOi/V97
	rpnHZkm5vy+l1XldcsF5F/SIox8ld9iAJkkHOFeFiUyQanJ/B8/8XZuoddAhl4iMsiTLjz
	fvorecREk3BogxpTMXq2b4Lz2yJVcSo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722512855;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1V+CVVFrMSoc0AF1TLg4EtDnvPKvuhwL2BSJpc+RBB0=;
	b=6Ph/GSOa+4my2qscx31XcmuWmXCqO6ZhnI81TsSAqD1yE64L5kIT+dLfLMWqJDG3WHzEtp
	sWExgwD8r1TI7WDw==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 4C8374A051B; Thu,  1 Aug 2024 13:47:35 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Florian Weimer <fweimer@redhat.com>
Cc: linux-riscv@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
  linux-api@vger.kernel.org,  linux-kernel@vger.kernel.org,  Arnd Bergmann
 <arnd@arndb.de>,  Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: syscall.tbl refactoring seems to have dropped definition of
 __NR_newfstatat on arm64 and riscv (64-bit) at least
In-Reply-To: <87sevoqy7v.fsf@oldenburg.str.redhat.com> (Florian Weimer's
	message of "Thu, 01 Aug 2024 13:28:04 +0200")
References: <87sevoqy7v.fsf@oldenburg.str.redhat.com>
X-Yow: I want a WESSON OIL lease!!
Date: Thu, 01 Aug 2024 13:47:35 +0200
Message-ID: <mvmh6c4fors.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [-3.96 / 50.00];
	BAYES_HAM(-2.96)[99.81%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_044739_250906_2527D5EA 
X-CRM114-Status: UNSURE (   6.83  )
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

On Aug 01 2024, Florian Weimer wrote:

> It's been repported that __NR_newfstatat has gone missing from the UAPI
> headers.

It has actually been wrongly renamed to __NR_fstatat.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
