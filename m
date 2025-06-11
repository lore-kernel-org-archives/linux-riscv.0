Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCC4C71141
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 18:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7kRaGJ4fN32/O0/VpVvbgMfqMpu1IATBkEZRb3QuFlM=; b=OixGJ9QAIm0YvV
	gFWR2lmJ14nydzyDV5Vld01QSCY7jcBjR3k70VgqZzC6QfD15mOEEpcUeA4IOkyYIeEunLHc7Wd8b
	wMH4l/ZyLzzOT8Is9M+IrMQV+eKRzDfaF/M5aqm0ebo5v5P1690wWuwM87Or9qXVaMhSxOqT7Dq6R
	XqkLyujg8Suwmh8u2S1X/BO/jN1eZlz8dv3B644KgqqKzIoRZobzO/hHcUPT5y/ixidlZh2IM5TzP
	p8iTFKs8VqE746zepWHwktF0/h+nWZcCGoqPLSNXG6A6oQA5+IRzX7DE7obSjxvFra30DPcJXfzW3
	bCobZHZPU/5DAZh52WSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPkf-0000000AnWi-2Wa5;
	Wed, 11 Jun 2025 18:00:41 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPM8b-0000000A3Gi-2QW9
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 14:09:10 +0000
Date: Wed, 11 Jun 2025 16:09:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749650945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cKUNapIic7qcB73602nGRDfvP380aXrb6L7bSN67WMc=;
	b=Odn9UwMvxjKy/QQm+4jej/I3CNptvQ3o060oWmenfpkhbV/QGd7dk84HzyM3XF6VsjI+V5
	MsNXgE6jzkLmgABa+TWcBWwuz0Q6myVpuB6QFUymOBZYiOLNOVuKXvIvgxaqlclbiHSwSo
	C0TZQfzUuQkfMQT2/WnZmpS0J3HpN+Q=
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
Subject: Re: [PATCH v3 04/16] kbuild: userprogs: add nolibc support
Message-ID: <20250611-horned-prudent-saluki-b5a5df@l-nschier-aarch64>
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
 <20250611-kunit-kselftests-v3-4-55e3d148cbc6@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611-kunit-kselftests-v3-4-55e3d148cbc6@linutronix.de>
Organization: AVM GmbH
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_070909_764763_CD5066A8 
X-CRM114-Status: GOOD (  15.78  )
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

T24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgMDk6Mzg6MTBBTSArMDIwMCwgVGhvbWFzIFdlacOfc2No
dWggd3JvdGU6Cj4gVXNlcnByb2dzIGFyZSBidWlsdCB3aXRoIHRoZSByZWd1bGFyIGtlcm5lbCBj
b21waWxlciAkQ0MuCj4gQSBrZXJuZWwgY29tcGlsZXIgZG9lcyBub3QgbmVjZXNzYXJpbHkgY29u
dGFpbiBhIGxpYmMgd2hpY2ggaXMgcmVxdWlyZWQKPiBmb3IgYSBub3JtYWwgdXNlcnNwYWNlIGFw
cGxpY2F0aW9uLgo+IEhvd2V2ZXIgdGhlIGtlcm5lbCB0cmVlIGRvZXMgY29udGFpbiBhIG1pbmlt
YWwgbGliYyBpbXBsZW1lbnRhdGlvbgo+ICJub2xpYmMiIHdoaWNoIGNhbiBiZSB1c2VkIHRvIGJ1
aWxkIHVzZXJzcGFjZSBhcHBsaWNhdGlvbnMuCj4gCj4gSW50cm9kdWNlIHN1cHBvcnQgdG8gYnVp
bGQgdXNlcnByb2dzIGFnYWluc3Qgbm9saWJjIGluc3RlYWQgb2YgdGhlCj4gZGVmYXVsdCBsaWJj
IG9mIHRoZSBjb21waWxlciwgd2hpY2ggbWF5IG5vdCBleGlzdC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KPiAK
PiAtLS0KPiBUaGlzIGNvdWxkIHByb2JhYmx5IGJlIG1vdmVkIG91dCBvZiB0aGUgZ2VuZXJpYyBr
YnVpbGQgbWFrZWZpbGVzLgo+IEkgdGhpbmsgdGhlIGVyZ29uaW1pY3Mgd291bGQgc3VmZmVyIGFu
ZCB0aGlzIGZ1bmN0aW9uYWxpdHkgY291bGQgYmUKPiB1c2VkIGJ5IG90aGVyIHVzZXJzIG9mIHVz
ZXJwcm9ncy4KPiAKPiBBbHNvIHRoaXMgZG9lcyBjdXJyZW50bHkgbm90IHN1cHBvcnQgb3V0LW9m
LXRyZWUgYnVpbGRzLgo+IEZvciB0aGF0IHRvb2xzL2luY2x1ZGUvbm9saWJjLyouaCBhbmQgdXNy
L2luY2x1ZGUvKi5oIHdvdWxkIG5lZWQgdG8gYmUKPiBpbnN0YWxsZWQgaW50byB0aGUgYnVpbGQg
ZGlyZWN0b3J5LgoKVGhhbmtzIQoKUmV2aWV3ZWQtYnk6IE5pY29sYXMgU2NoaWVyIDxuLnNjaGll
ckBhdm0uZGU+CgpQcm9iYWJseSBvdmVya2lsbCwgYnV0IG1pZ2h0IGl0IG1ha2Ugc2Vuc2UgdG8g
YWJvcnQgKi1ub2xpYmMgY29tcGlsYXRpb24gCnJlcXVlc3RzIGZvciBvdXQtb2YtdHJlZSBidWls
ZHM/CgpLaW5kIHJlZ2FyZHMsCk5pY29sYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
