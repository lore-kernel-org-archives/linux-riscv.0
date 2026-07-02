Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AC1C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 09:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ejTKL+QoSMn0Z1WcK9tONKkujfKP+daf8MdwGvBB1E0=; b=vjSZNaZ7amkyHR
	RG68biEQG5lyvcnSY2A0kHqsRIAaAcFdktzXaZCdaTY8G2df00eRevU5wN1H9ZACDL53vcKeqYFmd
	orwZ4Rin9ja1b8H+a//Ayc8ZynB9/g6POFl+0+Cwi4Q22GFxKB1tgEMf/ZVcW+DxNs9uwmqn/4YsN
	tT7kV47yIEyYF5PPA67d2hBc4GdrDvq0ZHdU/0NwX8peXggT7YOjpn1V6Hdlz3FZmthaFlJ8K4V3n
	NWA3KcjHhlF2QIjG0WZq9yr7TKYymmIc4l3l4RhowlBSmVDyH8MYk+Zw9/iEHRsPuHn7sckprRd4a
	vppfMuVaDzlr+hvNysIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDsR-0000000445S-1jkH;
	Thu, 02 Jul 2026 09:38:35 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDsO-000000043zh-0oMk
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 09:38:33 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782985108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=le1pY0cZzch4KB3xevM5B8Vs1Omxe5BuEZ41Xr3LB1w=;
	b=k2JsrNzjKN9sdTwU1KQIhBcQnL37+Bgh58nrQhF8Zs4QOklPCoMMWd5wUu9O70RzDYqB41
	SMX/N7HYsPQawlZKev4fiKNSwoxOPujo0EmrMcm3VJHoxxQMAu3m7+6GPJACNq7hZBeGqc
	lgV4dI3h3S5lhzLlUR6FNZ1WQooO80fdSj1P5d/kbEpdcSKAjG5tYlqDG9CxLkKT19oSiq
	1lkgyS4G+ly5PRw6vOIPLJqPZZRUVWJ8UOwiYAYZ3J09rh6NwePVQ1jSP43H8Ys6+eeMO+
	AE1x1/04fsPAE+cOhXkNktBJ+l2oMsRxNQAa3RPK8hyz6M4UXwz2UsOicVbS2A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782985108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=le1pY0cZzch4KB3xevM5B8Vs1Omxe5BuEZ41Xr3LB1w=;
	b=HGS1HUgcxEI0vVmM7UnXSpfhK8UD0pyk0iOseX5a5RKfDvA+OAq4MfG3jIBNb+zCS35nSg
	67Zx1WG+/SO5nyDg==
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Nathan
 Chancellor <nathan@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 Wende Tan <twd2.me@gmail.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>, kernel test robot <lkp@intel.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH 0/2] riscv: vdso: Do not use LTO for the vDSO
In-Reply-To: <20260701-riscv-vdso-lto-v1-0-89db0cd82077@linutronix.de>
References: <20260701-riscv-vdso-lto-v1-0-89db0cd82077@linutronix.de>
Date: Thu, 02 Jul 2026 11:38:26 +0200
Message-ID: <87bjcpu3xp.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_023832_376195_14071723 
X-CRM114-Status: UNSURE (   4.39  )
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

VGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+IHdyaXRl
czoKPiBXaXRoIExUTyBlbmFibGVkIHRoZSBjb21waWxlciBhc3N1bWVzIHRoYXQgdGhlIHZEU08g
ZnVuY3Rpb25zIGFyZSBub3QKPiB1c2VkIGFuZCBvcHRpbWl6ZXMgdGhlbSBhd2F5IGNvbXBsZXRl
bHkuCj4KPiBEaXNhYmxlIExUTyBmb3IgdGhlIHZEU08sIGFzIHRoZXNlIGZ1bmN0aW9ucyBhcmUg
aGFuZC1vcHRpbWl6ZWQgYW55d2F5cy4KPgo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3Nj
aHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgoKUmV2aWV3ZWQtYnk6IE5hbSBD
YW8gPG5hbWNhb0BsaW51dHJvbml4LmRlPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
