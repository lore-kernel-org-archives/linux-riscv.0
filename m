Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F85AC71143
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 18:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6pdm/NANIPp3bVYqpJQPaEFu9JJYbrfr1/Lebrme0Gk=; b=bnwjmCS68KdwwL
	i6zow9OcfcubrIgPlIF0FteinOgC0luSx/8zVk58BQk/CcVSkbop4CYOGS24VLP42amyXn+qqBVGt
	OSIaHdBv6VsZjvTGQfiX6cmUIMtKcUm0n+/UGxofDXk31UNOE4JoobbtA+5WSPb/+G4tp2YEhs6s2
	oGn6gdNmtfo+hgddBZDe0Fwem8uMYdU8TeuQbD5YPZldjP2yY6b9B5KOoOWNJBH//1rF8zKcAHQM1
	xq9Ba6IyTlOR4swfNbAAKB9wKslfMk95NyZN2wkVpfuMErzdRAAPVvdbwQz+XEDa+KyiOwkKDY7q9
	dq/qOVjOWp810tLMoplQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPk6-0000000AmZr-3X2z;
	Wed, 11 Jun 2025 18:00:06 +0000
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPLts-0000000A0ov-1IqZ
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 13:53:57 +0000
Date: Wed, 11 Jun 2025 15:53:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749650033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6SmcMnYbOWQzWCVt53CcxqUoekdqiVe1d0Bbrj8p7r4=;
	b=rVRrJ6ddkczAocQzeJy62uoVW+EqUuHoTzfGHO5VbnuDz9oOhPOeaJjbfQbD5g34I1uOk0
	DBgaDtqveDXWm46GpekqL+ncbR80suUOjuTnOaGqyClK5eQEMIGLbCykN5aWjyEk4vKgpa
	VZyORSDLkWqG6ZBbMc63a+OIr1KFqrs=
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
Subject: Re: [PATCH v3 02/16] kbuild: userprogs: also inherit byte order and
 ABI from kernel
Message-ID: <20250611-celadon-buzzard-of-wholeness-d8c0ce@l-nschier-aarch64>
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
 <20250611-kunit-kselftests-v3-2-55e3d148cbc6@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611-kunit-kselftests-v3-2-55e3d148cbc6@linutronix.de>
Organization: AVM GmbH
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_065356_485970_4D2A9891 
X-CRM114-Status: GOOD (  11.73  )
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

T24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgMDk6Mzg6MDhBTSArMDIwMCwgVGhvbWFzIFdlacOfc2No
dWggd3JvdGU6Cj4gTWFrZSBzdXJlIHRoZSBieXRlIG9yZGVyIGFuZCBBQkkgb2YgdGhlIHVzZXJw
cm9ncyBtYXRjaGVzIHRoZSBvbmUgb2YgdGhlCj4ga2VybmVsLCBzaW1pbGFyIHRvIGhvdyB0aGUg
Yml0IHNpemUgaXMgaGFuZGxlZC4KPiBPdGhlcndpc2UgdGhlIHVzZXJwcm9ncyBtYXkgbm90IGJl
IGV4ZWN1dGFibGUuCj4gVGhpcyBoYXBwZW5zIGZvciBleGFtcGxlIG9uIHBvd2VycGMgbGl0dGxl
IGVuZGlhbiwgb3IgcmlzY3YzMi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1
aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KPiAtLS0KPiAgTWFrZWZpbGUgfCA0
ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
PiAKClJldmlld2VkLWJ5OiBOaWNvbGFzIFNjaGllciA8bi5zY2hpZXJAYXZtLmRlPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
