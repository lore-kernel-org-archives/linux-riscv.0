Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716FAC71136
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 18:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=otdqK9XQgOKGQ4pBZ9JnOopq9CFLAxWz9DJ1nYE+jNw=; b=mWmvpiIOlnlQR0
	az1aOKUsi2KORI8G5i1XDlrd7yYh6oveT9LnNoCiwyO7KwsUwb4VizDz2qVPyBHs12Nm+UEYptBdx
	/luukXINrDL7ro+uaLWXuImUcjtlBKbg6llhHx7uE71t3cnxm4jesMNwqLUpNwNZjPmFCuWW8DD7J
	et1uw+nRbyGIqM8cTo/l9a0hZCo3wnV1AW4LbXjOioWG6TgVXe29SCyiXDMsGPv0+xq3rDs/hKv7l
	lqXoOuAiISU+NHFh8u565v3Oz+B2F2uManeDFpl+22tXaSeSxVOQYJbmp40uUYmWzzYux7JeaxQm5
	69XP2mNAo+Jlb80AtP6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPk5-0000000AmXo-2bhc;
	Wed, 11 Jun 2025 18:00:05 +0000
Received: from out-177.mta0.migadu.com ([2001:41d0:1004:224b::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPLtF-0000000A0hi-0oQF
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 13:53:18 +0000
Date: Wed, 11 Jun 2025 15:52:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749649990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4zq30Zx1gm5+DnliSP1IJP9mnbwAcrHCYpwo6PmyzBc=;
	b=WYdAW6izimj/1gDUnPW+moaf3Nr5+ezwcwuLHSc4IvraMglv8YBB9VUujsatvLjE7apE7p
	u9v5WzRBHxvmN01qtvUkfX2q9urcqWHuzQ2J9T3qKK3D1YvTQTqQ18DDnJz95VqMnpFJVF
	LrIlkoskO2W4MhCJ1lY8fuv0ZUIvBeA=
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
Subject: Re: [PATCH v3 01/16] kbuild: userprogs: avoid duplicating of flags
 inherited from kernel
Message-ID: <20250611-overjoyed-vengeful-goshawk-0aaf8c@l-nschier-aarch64>
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
 <20250611-kunit-kselftests-v3-1-55e3d148cbc6@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611-kunit-kselftests-v3-1-55e3d148cbc6@linutronix.de>
Organization: AVM GmbH
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_065317_743450_66885A85 
X-CRM114-Status: GOOD (  10.56  )
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

T24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgMDk6Mzg6MDdBTSArMDIwMCwgVGhvbWFzIFdlacOfc2No
dWggd3JvdGU6Cj4gVGhlIGR1cGxpY2F0aW9uIG1ha2VzIG1haW50ZW5hbmNlIGhhcmRlci4gQ2hh
bmdlcyBuZWVkIHRvIGJlIGRvbmUgaW4gdHdvCj4gcGxhY2VzIGFuZCB0aGUgbGluZXMgd2lsbCBn
cm93IG92ZXJseSBsb25nLgo+IAo+IFVzZSBhbiBpbnRlcm1lZGlhcnkgdmFyaWFibGUgaW5zdGVh
ZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2No
dWhAbGludXRyb25peC5kZT4KPiAtLS0KPiAgTWFrZWZpbGUgfCA1ICsrKy0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCgpSZXZpZXdlZC1ieTog
Tmljb2xhcyBTY2hpZXIgPG4uc2NoaWVyQGF2bS5kZT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
