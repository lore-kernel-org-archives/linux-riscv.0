Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1D3C02197
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 21:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCTy8dIepmv/FNxImjQzEjIBUz1KmyOFjrZ+jMYWaUQ=; b=LhgcSgutpDTtYC
	xDNB7jqDFtMvHFkDtlEH4SKHUOi71U5O/W9Km9VKyR7djD7tz0mshAUjUdyyQI0GcHKhaW5r2ziRE
	GUWboArEY0ESm7cKKxHTAt2D99uic3I0Pjo578ji9Fs8dlXDoTj1xR6fYP67IHq+1ZCJ10C0DmaQ9
	iLSpkUW45arYYWY2Cw+a7eRAa22KdZoMDGuIwup4TEfljA9TUgnVc/GgdkVpm/ZSLeclsOOUlwd32
	oRCDD8bmkU0jacQOxI7xXhA2fJj35qm0CTPGHzp7LKHT4qP9Dg+NVx7v3mVPYlVmnByMb/u0jX9Z0
	OBqbCfgLWx6yqRcP3dbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3w4-0000000GeYE-2AaP;
	Mon, 03 Feb 2025 21:24:52 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3uN-0000000GeL2-3pPv
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 21:23:09 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-38637614567so2182350f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 13:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1738617786; x=1739222586; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQvpp2LRYRT3K/cLfPDLqNS+9MqkGBxxZ8pBUN+MW2s=;
        b=Y4XuqvoeS6VFKMyEy82CqULgWEuE8xMcESN+vnmPv8Y5KeIaRmzYmngxi2Jr7oxMpW
         kd/RcfFM04DlqcPptoQciQwK8dqAnaXgDdMXa+Urp75slFUqFU6XftWcVx9/49/cPIK0
         KjVk4ziPSkvRjyp44WJ/aooiQvBUS6yMZkXwF/B7W8ENEGRyysvHRdulb+f5Zi7s2/uu
         qiNIwWNeTwpHW9+a6oQxG4P4KE4MparxNeWf20rcSXJ8zdTQ4l+btimfeiTAbRzSIhNk
         iaxUeM8+xRRKbOWRnBkgH2L8UFvbqdIldEWmRLJO7XiZQa+HsmnTU2Il1Bf6QHx4KMkr
         jfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738617786; x=1739222586;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQvpp2LRYRT3K/cLfPDLqNS+9MqkGBxxZ8pBUN+MW2s=;
        b=rHssvtMoU5W8CFnHUJfX3DLz2GZJod9maitazlgBk4cWO17Tpa+4E7cILRmnXxwqBw
         RNFcWrhRk5MRIkLmrCnTgmLChqKO8GksLKmVZFbZjip3tm01/QM7oqKz0V44Dnlxv40x
         UIngfdcwP6P04x3PQchdhQa9T+qZFJDozsWgTfgrTZRmOkY3ossURWgra5aORo+OmK/q
         GfZ33QuJRDHUnyZuwGuw+EA9jvSQZy1VG/29julLhBXdKyB89nemmQk3rcL6xQl9YxW4
         8arYZS1Pt70Tw4VxkujiYnx84unLqy/rqFXt7yTVtmXISQermyVxXJD4mI/nQgRjaRco
         dkFw==
X-Forwarded-Encrypted: i=1; AJvYcCViQBXcF/mBl7SQFyutgSiWR8IGFg5NryAleaNENXABPYLzUEUMaX/LQGA2TqJJwDZhuZSPscrP8pkehg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxG5blsXzIObn9O7TD7aPIOd9WbLLznAeILwBaW/IQZVM0iv0Gh
	dcq6eQNPSdqARJwMhbGxJbZc6Hap6+DPzTn5g1mwn6es3PobptU5wWvG6pF3eD4=
X-Gm-Gg: ASbGncsOmXnXJVW9ZBsfMhZ2VcFsHL0UK80wBn1fvpbKzSC4WNpFV4Gh0KckgLaRobn
	CFkvU9nEsl31j6oRbwLsxbB6x9ed4BVmpP0RKDazhuXioleljFdoOvP+bH63bGLFP3t0YXmQEa+
	9giHNPy5XjGb4dBhK8OO7SqmcG92Zu4Ez4/y2+3R4n5ihzKrksDkE61FDxmnckHJznbm7TcJhyn
	/0plZRhdJzKbuW6mTmzx+ODgTgo1GE7Aj20gp46Ht/K7ewLtluduemBSBzzVI3NxdWiXY1vjfH+
	zRXosF+z+vQd8QPjxi8Z+h23vHlG
X-Google-Smtp-Source: AGHT+IGRgSY98as0FO+OEr+iCd27zkPxvZBzkNQKfXeu12EQ7NnYzWoYKMRb+N3FcwOpbqZjf43ybA==
X-Received: by 2002:a05:6000:1789:b0:386:4277:6cf1 with SMTP id ffacd0b85a97d-38c5208fb3emr21016029f8f.39.1738617785948;
        Mon, 03 Feb 2025 13:23:05 -0800 (PST)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23deddcsm165659455e9.14.2025.02.03.13.23.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Feb 2025 13:23:05 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH] riscv/atomic: Do proper sign extension also for unsigned
 in arch_cmpxchg
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <alpine.DEB.2.21.2502030510390.41663@angie.orcam.me.uk>
Date: Mon, 3 Feb 2025 21:22:54 +0000
Cc: Andreas Schwab <schwab@suse.de>,
 Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <0DF64D04-D609-4790-8279-7DFE24D1FB2C@jrtc27.com>
References: <mvmed0k4prh.fsf@suse.de>
 <c9cbc2be-d1fd-44ef-aa14-fd25a5ff8490@ghiti.fr> <mvm5xlw4anb.fsf@suse.de>
 <ac53a62e-4f89-49c9-a755-fdfa7a582337@ghiti.fr> <mvmwmec2t7u.fsf@suse.de>
 <CC2D9220-F8DE-4CC8-ACAD-7B1A21E276FE@jrtc27.com>
 <alpine.DEB.2.21.2502030510390.41663@angie.orcam.me.uk>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_132307_966015_D7F93BB2 
X-CRM114-Status: GOOD (  14.54  )
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

T24gMyBGZWIgMjAyNSwgYXQgMTM6NTcsIE1hY2llaiBXLiBSb3p5Y2tpIDxtYWNyb0BvcmNhbS5t
ZS51az4gd3JvdGU6Cj4gCj4gT24gVGh1LCAzMCBKYW4gMjAyNSwgSmVzc2ljYSBDbGFya2Ugd3Jv
dGU6Cj4gCj4+Pj4gYTIgaXMgdXNlZCBhcyBpdCBpcyBwYXNzZWQgYnkgdGhlIGNhbGxpbmcgZnVu
Y3Rpb24sIHNvIHdlIGNhbid0IGJlIHN1cmUgYTIKPj4+PiBpcyBzaWduIGV4dGVuZGVkIHRvIG1l
LCB3aGF0IGFtIEkgbWlzc2luZz8KPj4+IAo+Pj4gMzItYml0IHNjYWxhciBhcmd1bWVudHMgYXJl
IGd1YXJhbnRlZWQgdG8gYmUgc2lnbiBleHRlbmRlZCBvbiBlbnRyeS4KPj4gCj4+IEZpcnN0bHks
IHRoZSBjYWxsaW5nIGNvbnZlbnRpb24gaXMgaXJyZWxldmFudCBpZiB0aGUgZnVuY3Rpb24gaXMK
Pj4gaW5saW5lZCwgd2hpY2ggdGhpcyBhbG1vc3QgYWx3YXlzIHdpbGwgYmUuCj4gCj4gVW1tLCB0
aGF0IHdvdWxkIGJlIGEgY29tcGlsZXIgYnVnIHRoZW4sIGFzIGlubGluaW5nIGlzIHN1cHBvc2Vk
IG5vdCB0byAKPiBjaGFuZ2UgbGFuZ3VhZ2Ugc2VtYW50aWNzLiAgSU9XIHRoZSBjb21waWxlciBp
cyBleHBlY3RlZCB0byBleHBsaWNpdGx5IAo+IHNpZ24tZXh0ZW5kIHRoZSBhcmd1bWVudHMgb2Yg
YW4gaW5saW5lZCBmdW5jdGlvbiBhdCB0aGVpciBldmFsdWF0aW9uIHBvaW50IAo+IGp1c3QgYXMg
aXQgd291bGQgYXQgYW4gYWN0dWFsIGZ1bmN0aW9uIGNhbGwgdW5sZXNzIHRoZSBjb21waWxlciBp
cyBhYmxlIHRvIAo+IHByb3ZlIHRoZXkgaGF2ZSBjb21lIG91dCBzaWduLWV4dGVuZGVkIGFscmVh
ZHkgZnJvbSBwcmV2aW91cyBvcGVyYXRpb25zLgoKTm8gaXTigJlzIG5vdC4gVGhlIGNhbGxpbmcg
Y29udmVudGlvbiBpcyB0aGVyZSBzbyB0aGF0IGVhY2ggc2lkZSBvZiB0aGUKY2FsbCBrbm93IGhv
dyB0aGUgZGF0YSBpcyBiZWluZyBwYXNzZWQgYmV0d2VlbiB0aGVtLiBXaGVuIGlubGluaW5nCm9j
Y3VycyB0aGVyZSBpcyBubyBzdWNoIGNhbGwgYW5kIGNvbXBpbGVycyBjYW4gZG8gd2hhdGV2ZXIg
dGhleSBsaWtlLgpDYWxsaW5nIGNvbnZlbnRpb25zIHNheSBhYnNvbHV0ZWx5IG5vdGhpbmcgYWJv
dXQgd2hhdCB0aGUKcmVwcmVzZW50YXRpb24gb2YgYSB2YWx1ZSBpcyB3aGlsc3QgaW5zaWRlIGEg
ZnVuY3Rpb24sIG9ubHkgYXQKYm91bmRhcmllcy4gVGhlIEFCSSBjYW4gYWxzbyB0ZWxsIHlvdSB3
aGF0IHRoZSBvYnNlcnZhYmxlCnJlcHJlc2VudGF0aW9uIG9mIHZhbHVlcyB3aXRoaW4gYSBmdW5j
dGlvbiBzaG91bGQgYmUgKGUuZy4gdGhhdCBpbnQgaXMKYSAzMi1iaXQgdHdv4oCZcyBjb21wbGVt
ZW50IHZhbHVlKSwgYnV0IGp1c3QgbGlrZSBvdGhlciBwbGF0Zm9ybXMgdGhlcmUKaXMgbm90aGlu
ZyBpbiB0aGUgUklTQy1WIEFCSSBzcGVjaWZpY2F0aW9ucyB0byBzYXkgdGhhdCAzMi1iaXQgaW50
ZWdlcnMKYXJlIGtlcHQgc2lnbi1leHRlbmRlZCBpbiByZWdpc3RlcnMsIGFuZCB0aGF04oCZcyBu
b3QgZ29pbmcgdG8gYmUgYWRkZWQKYmVjYXVzZSBMTFZNIGhhcyBuZXZlciBpbXBsZW1lbnRlZCB0
aGF0IGZvciBSSVNDLVYgc28gaXQgd291bGQgYmUgYW4KQUJJIGJyZWFrIGZvciBhbGwgTExWTS1j
b21waWxlZCBSVjY0IGNvZGUgaW4gZXhpc3RlbmNlLgoKSmVzcwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
