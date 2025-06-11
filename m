Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6EAC71141
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 18:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Mbg2n+OF+ceSXI4URbkBiZRSI7OhoDyleL2e4fWBaU=; b=G3T0igd7jhONeZ
	d8zOMSk4R+AI3GmsKmiSwbY0U3GtRdmtkrCvPKEq/dVtIBoGTyAcPM+3he94YRkIhuMBS/eiSWgnT
	0fF/Q1zkfLH3FnTxENy2rR94t26WuoxgK2VdnLRbrlxdpf3+mrr8ad3PoLf6HhRKaKlVqJNuLQcVr
	tCPqmqMfMhL1zfM8Q6Ao+0mBBBAws/SwmlTJarCwMAaPNRu872rOTzz/yGt12KN5PrSIjFrmsSFFH
	Kaj4N+RKaaTll1ZBBjJErpTNkpYD08dYiXCvxtsqnHBsa4Ie8cVaTch/XqZ7GbAoPGBcZ/9ZKxFvS
	nEEG8MG02sYV9HYQFMPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPkX-0000000AnLD-3uOg;
	Wed, 11 Jun 2025 18:00:33 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPM4K-0000000A2jO-15EO
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 14:04:45 +0000
Date: Wed, 11 Jun 2025 16:04:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749650681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=txq23bJazbIYagctbPRu50Tm0ZoM/NcejOe7Q1liC8k=;
	b=wk0ZcISFpG7EdDimklFUqd02SAESZEZcA+KDyXAEHqt10vo2jUvcEe/cO2Yq6tJFVV4dAc
	L0GmmiPNFoYcR8pSaqlrip1ZkN7z2ZbLbzI7BC9ZgVP4yZxnkyM3JZqpIJm+9YnviJndsI
	lMKJEV+PHU+WLAtw4eKKZD49/eTtZCU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org
Subject: Re: [PATCH v3 03/16] init: re-add CONFIG_CC_CAN_LINK_STATIC
Message-ID: <20250611-nostalgic-terrestrial-armadillo-eecfec@l-nschier-aarch64>
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
 <20250611-kunit-kselftests-v3-3-55e3d148cbc6@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611-kunit-kselftests-v3-3-55e3d148cbc6@linutronix.de>
Organization: AVM GmbH
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_070444_502923_0B98EF47 
X-CRM114-Status: UNSURE (   8.26  )
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

T24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgMDk6Mzg6MDlBTSArMDIwMCwgVGhvbWFzIFdlacOfc2No
dWggd3JvdGU6Cj4gRm9yIHRoZSBrdW5pdCBVQVBJIGZ1bmN0aW9uYWxpdHkgdGhpcyBmZWF0dXJl
IGlzIG5lZWRlZC4KPiAKPiBUaGlzIHJldmVydHMgY29tbWl0IGQxYjk5Y2RmMjJlMCAoImluaXQ6
IHJlbW92ZSB1bnVzZWQgQ09ORklHX0NDX0NBTl9MSU5LX1NUQVRJQyIpCj4gCj4gU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+
Cj4gLS0tCj4gIGluaXQvS2NvbmZpZyB8IDUgKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKQo+IAoKQWNrZWQtYnk6IE5pY29sYXMgU2NoaWVyIDxuLnNjaGllckBhdm0uZGU+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
