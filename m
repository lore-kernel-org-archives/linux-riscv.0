Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBE21061B2A
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 00:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KnUgXM3L3+twS4FnVH36m/9o64mf5bUJfpAMcRthXck=; b=mQTi9Fl4BTAfgX
	9g8NiznbANNl0vsui3oQmSqUuV4+GiT0qHU1UjFn7ZdGqUPqnK+hJ2f9pijbO1zcKHc8gl77W4MCU
	f9ak0K/Hb9I1rg0GggSUz8c2saQZiWyHCt+swID2ZCm8vBhtbeisUwr+dxs2/8cwEoMfIkLRLaX2d
	YjqqC6gAk4GtPI5u5ujEtlYlvTZVBDeRXFoKTRMFxjz75IYonw1CYBMr/HSr1vUTpvlLRbAJj4dM0
	on4OkfUSRlYU+ct/b/nRHFQ2st4nOV2XgRKlVBok7WPmcOcwTFS27swe59C6xATA106Q4oyc3PzIu
	uMHeG3BA1bi1uyS6+pRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Mus-0000000C4BZ-2FiJ;
	Tue, 31 Mar 2026 00:25:10 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77nC-0000000Apmp-2QFB
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 08:16:15 +0000
Received: from hawking.suse.de (unknown [IPv6:2a07:de40:a101:3:92b1:1cff:fe69:ddc])
	by smtp-out1.suse.de (Postfix) with ESMTP id 2B1244D521;
	Mon, 30 Mar 2026 08:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774858571; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dbNuLtuBRyZz7R/BdCbv7TqVDsGtbVA35z28oSZF14E=;
	b=dRRmbq0YC319LT3TyaPsag5yT8ZSEVhRW0hXe6ZknQrqIvD1fNjGMnkN7TFER4eB08Iu4P
	Q6+/Mh7yFnmmOm7101o+Ym2FOS1pvGvDQEvvbsZlPjdYfWtVbhRi2WqhZ/OFpxsblk1w2a
	Swobio+50HXOYiJSRlRJKGAydxkr2Zo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774858571;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dbNuLtuBRyZz7R/BdCbv7TqVDsGtbVA35z28oSZF14E=;
	b=UzzPY2d+6b5GDVjY43Ui0eH2wp9Dk3aSxB76E0HoegMEkVwNpsQunfc/jRmD1p1DWRl9vj
	QIoc04EqxpanbPBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CZrTBLhX;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YoCHFosB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774858570; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dbNuLtuBRyZz7R/BdCbv7TqVDsGtbVA35z28oSZF14E=;
	b=CZrTBLhXXIR0xur/o7J1cjpcb7wIqRI+RWAELp93tWHyl4l24Y1107BhmDisSmnkq4aEtv
	eoJ+K4ELMSR4v/3JOrYFvQk8n7ACgpaZp+pvToo+jwvX0TQIv+JzzeXW4SKCzpKHwXT2/B
	wZ12xIal5Wy3xJBRj9eD5wsSooG1DWA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774858570;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dbNuLtuBRyZz7R/BdCbv7TqVDsGtbVA35z28oSZF14E=;
	b=YoCHFosBferQRNhsCEhAkOJgSzRbYsxmkUAIrZEpXW1BWOxNbmAyMKNI0mYDzTNK/GUfaK
	b4izdpnWrlZ8bYBg==
Received: by hawking.suse.de (Postfix, from userid 17005)
	id E2A9D4A04D9; Mon, 30 Mar 2026 10:16:09 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Michael Neuling <mikey@neuling.org>
Cc: pjw@kernel.org,  palmer@dabbelt.com,  aou@eecs.berkeley.edu,
  alex@ghiti.fr,  debug@rivosinc.com,  thecharlesjenkins@gmail.com,
  linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: ptrace: avoid BIT() in UAPI header
In-Reply-To: <20260330024248.449292-1-mikey@neuling.org> (Michael Neuling's
	message of "Mon, 30 Mar 2026 02:42:48 +0000")
References: <20260330024248.449292-1-mikey@neuling.org>
Date: Mon, 30 Mar 2026 10:16:09 +0200
Message-ID: <mvmjyutivg6.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [15.27 / 50.00];
	SPAM_FLAG(5.00)[];
	NEURAL_SPAM_LONG(3.48)[0.993];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_SPAM_SHORT(3.00)[1.000];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[hawking.suse.de];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[hawking.suse.de];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	DIRECT_TO_MX(0.00)[Gnus/5.13 (Gnus v5.13)];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:a101:3:92b1:1cff:fe69:ddc:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:a101:3:92b1:1cff:fe69:ddc:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_CC(0.00)[kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,rivosinc.com,gmail.com,lists.infradead.org,vger.kernel.org];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hawking.suse.de:helo,suse.de:dkim,suse.de:mid,suse.de:email]
X-Spamd-Bar: +++++++++++++++
X-Rspamd-Queue-Id: 2B1244D521
X-Rspamd-Action: add header
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_011614_765685_E5685C0F 
X-CRM114-Status: UNSURE (   5.89  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 30 Mar 2026 17:25:09 -0700
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

T24gTcOkciAzMCAyMDI2LCBNaWNoYWVsIE5ldWxpbmcgd3JvdGU6Cgo+IEJJVCgpIGlzIG5vdCBh
dmFpbGFibGUgaW4gVUFQSSBoZWFkZXJzIOKAlCB0aGUgaW5zdGFsbGVkIGxpbnV4L2JpdHMuaAo+
IChVQVBJIHZlcnNpb24pIGRvZXMgbm90IGRlZmluZSBpdC4gUmVwbGFjZSBCSVQoKSB3aXRoIG9w
ZW4tY29kZWQKPiAoMVVMIDw8IHgpIHdoaWNoIGlzIHRoZSBzdGFuZGFyZCBwcmFjdGljZSBmb3Ig
VUFQSSBoZWFkZXJzLCBhbmQgZHJvcAo+IHRoZSBsaW51eC9iaXRzLmggaW5jbHVkZSB0aGF0IHdh
cyBhZGRlZCBieSBjb21taXQgOTg1NDU2MjBiMCAoInJpc2N2Ogo+IHB0cmFjZTogRml4IEJJVCgp
IGNvbXBpbGF0aW9uIGlzc3VlcyIpLgoKVGhlcmUgaXMgYWxzbyB0aGUgX0JJVFVMIG1hY3JvLCB3
aGljaCBtYXkgYmUgcHJlZmVyYWJsZS4KCi0tIApBbmRyZWFzIFNjaHdhYiwgU1VTRSBMYWJzLCBz
Y2h3YWJAc3VzZS5kZQpHUEcgS2V5IGZpbmdlcnByaW50ID0gMDE5NiBCQUQ4IDFDRTkgMTk3MCBG
NEJFICAxNzQ4IEU0RDQgODhFMyAwRUVBIEI5RDcKIkFuZCBub3cgZm9yIHNvbWV0aGluZyBjb21w
bGV0ZWx5IGRpZmZlcmVudC4iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
