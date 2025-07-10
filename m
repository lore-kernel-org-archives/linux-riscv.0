Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A5AC83F17
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 16:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vzbb4i6eR4OjmvpCDPoTy2xZh1DxHDkr81fb02zIkwY=; b=sLdIjX2pJJaXXq
	XGS0VPWdGQjUGjS28rW6N1N8glXLGdaPSur60bDSZIJmEkRYRMpG0ThYnvn6gceUHFqr8jMIW9F0I
	09c/lfmkedK5SE9hglLuIiHmgBUScKOs9c8MYAbDkuN/fr3OIvMF9aFEMkUvIlgFl1sRweYwFELQy
	p4lYHr/+LVKG0nDSMdI6WRuQDGTUjfdaoCTxX7IvG3Avb4yAFscQtzdJrgKZOM7CRVXqV6pAsMTbM
	uO1EObeE9WabXMxvL/v24CaH8qoTegQZIuwlOIgXhnkIwiBDfkQNcVLtpfm1ULs6yHIMM2VkCc0t/
	Tg/P/9lJ6I+nsAfzHOJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZu7G-0000000CPhU-3Uon;
	Thu, 10 Jul 2025 16:27:22 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZriQ-0000000C1Y7-2W4l
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 13:53:35 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out1.suse.de (Postfix) with ESMTP id 0C34B2174F;
	Thu, 10 Jul 2025 13:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752155613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dqHAb6A+qGi2SOHcnTAX3cJ4NSLLXaw7K2xbvYD8taY=;
	b=vVaSeGDfJu/KnM9Cltgj9f2dojKl+74uBYN13F8FRS2moAPpUh9CiYnOo2PLHzBAp3w3Rs
	3RTNYP2MqgDBC9XJRgZeaw7L8Nf82na3ks901hIvIFwu4xS1Mx4Vg4iNveRq349yDbMVwP
	5igKMjO3ZrHCN0Mc3ciT3mjO9e5VfxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752155613;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dqHAb6A+qGi2SOHcnTAX3cJ4NSLLXaw7K2xbvYD8taY=;
	b=I2F3ZpKFKYQQ6zf1Q7x6jPjegu89n3KXj82r4B6+dt8WY/1IjsujZ3itop5lHClVHobkca
	fXf4/Ey3siEMj1Cw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752155613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dqHAb6A+qGi2SOHcnTAX3cJ4NSLLXaw7K2xbvYD8taY=;
	b=vVaSeGDfJu/KnM9Cltgj9f2dojKl+74uBYN13F8FRS2moAPpUh9CiYnOo2PLHzBAp3w3Rs
	3RTNYP2MqgDBC9XJRgZeaw7L8Nf82na3ks901hIvIFwu4xS1Mx4Vg4iNveRq349yDbMVwP
	5igKMjO3ZrHCN0Mc3ciT3mjO9e5VfxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752155613;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dqHAb6A+qGi2SOHcnTAX3cJ4NSLLXaw7K2xbvYD8taY=;
	b=I2F3ZpKFKYQQ6zf1Q7x6jPjegu89n3KXj82r4B6+dt8WY/1IjsujZ3itop5lHClVHobkca
	fXf4/Ey3siEMj1Cw==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id F1C374A0569; Thu, 10 Jul 2025 15:53:32 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>
Cc: linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  linux-riscv@lists.infradead.org,  Palmer Dabbelt <palmer@dabbelt.com>,
  Paul Walmsley <paul.walmsley@sifive.com>,  Shuah Khan <shuah@kernel.org>,
  Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v4] selftests: riscv: add misaligned access testing
In-Reply-To: <20250710133506.994476-1-cleger@rivosinc.com> (=?utf-8?Q?=22C?=
 =?utf-8?Q?l=C3=A9ment_L=C3=A9ger=22's?=
	message of "Thu, 10 Jul 2025 15:35:05 +0200")
References: <20250710133506.994476-1-cleger@rivosinc.com>
Date: Thu, 10 Jul 2025 15:53:32 +0200
Message-ID: <mvmecuognj7.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.20 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.989];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_065334_782675_5445F166 
X-CRM114-Status: UNSURE (   5.69  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gSnVsIDEwIDIwMjUsIENsw6ltZW50IEzDqWdlciB3cm90ZToKCj4gVGhpcyBzZWxmdGVzdCB0
ZXN0cyBhbGwgdGhlIGN1cnJlbnRseSBlbXVsYXRlZCBpbnN0cnVjdGlvbnMgKGV4Y2VwdCBmb3IK
PiB0aGUgUlYzMiBjb21wcmVzc2VkIG9uZXMgd2hpY2ggYXJlIGxlZnQgYXMgYSBmdXR1cmUgZXhl
cmNpc2UgZm9yIGEgUlYzMgo+IHVzZXIpLiBGb3IgdGhlIEZQVSBpbnN0cnVjdGlvbnMsIGFsbCB0
aGUgRlBVIHJlZ2lzdGVycyBhcmUgdGVzdGVkLgoKSWYgdGhhdCBkaWRuJ3QgY2F0Y2ggdGhlIG1p
c3Npbmcgc2lnbiBleHRlbnNpb24gdGhhdCBJIGp1c3QgZml4ZWQgaW4KPGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LXJpc2N2L212bWlrazBnb2lsLmZzZkBzdXNlLmRlPiwgeW91CnNob3Vs
ZCBjb25zaWRlciBleHRlbmRpbmcgdGhlIHRlc3RzLgoKLS0gCkFuZHJlYXMgU2Nod2FiLCBTVVNF
IExhYnMsIHNjaHdhYkBzdXNlLmRlCkdQRyBLZXkgZmluZ2VycHJpbnQgPSAwMTk2IEJBRDggMUNF
OSAxOTcwIEY0QkUgIDE3NDggRTRENCA4OEUzIDBFRUEgQjlENwoiQW5kIG5vdyBmb3Igc29tZXRo
aW5nIGNvbXBsZXRlbHkgZGlmZmVyZW50LiIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
