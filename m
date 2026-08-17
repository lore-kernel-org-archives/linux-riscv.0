Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E0BC5DF74
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 22:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eg1yhxxBDhsNHvbZlnlzwd6tj76r72JZdyL4ZEHR2L0=; b=AZSZVmbl04jdCf
	GcZ6TYzXbBWqW448n1MberT3BUTaD/vqprJUQdxQM4ng9DIXUhKm1yr02pYYSmHcAcqgSm+yFih87
	+zSWADwgyoVT2Hg4LJOO8YBhJP4za6wDd9AZ23aDLWM0vw5qESBZnDrMjhPig6gJmRiNVjbn7vOTS
	uQzAJFhmiKkd2+0l5ww2zC2dKPLDs73km/hqS52ZWhhaO7ZkiTOAhjSzWsndzx80t0t1bo6S75/eS
	N5JpHPKTuddEtPK0U3tjLJk13QBal8a6CgjL6XbLgqDFOH1GC0hV70B7TI675ww4mTNFQfkmPCHwE
	hPFW24O+Wg9fEk7yi+6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww6Dg-00000006xHe-3Wgd;
	Mon, 17 Aug 2026 22:54:16 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww6Dd-00000006xHJ-1cyn
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 22:54:14 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c2055f5a993so450913366b.2
        for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 15:54:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787007251; cv=none;
        d=google.com; s=arc-20260327;
        b=dvv82nswIenYg0zGNEWkZDdwmBfNm23Xkb2E4gc0oeq489N1nn31A2KA9nFxNXvL1t
         cETWptuABZHVb59gAQbyBJauOhTrT6BXOz9mwHk1HnTf+HgTZUSOutY5XWnaQDBebHfq
         JF5a+XnoVq24ONAha5usOry0VnGnZVlpFPWgDxrvghQL6AC3gkc4vP90Ls1jo7qijHOg
         xGWKZYdvd/hz5L5wo0kkgEFf2IL0fs0GdDlHU1fVPc+fPgdgU0E58NH4c9tYWo/DpOBU
         76hvT4iza1HWW0z1FB2GNmeIjDvthuU5xzTzj1CcgEHpRgyo933W+USQ6kYgWaKu5PFw
         1oIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u5dhNWMYyRmUyG6+pD3T6b5XVM3Qf6OaAA8jv9AvKJU=;
        fh=GQElAgBt4gJsqfuaE6NIxCIzRPrqmeQcoCiCpXAIT8c=;
        b=i+bV3uGZD208RPXQ156HGBuF5YF0noWdMBLS4NDt4t7N6MFKKR7+hHVf7Yi+ic6yis
         XPDsNEYQWotYjOs3eTWVG95BR4J0TEJh6r6XldHWHTwYchiewP6T7bbZWUDLLS1ewU73
         YnQQSkojglXCq1dumrNB5w4srmElchaoJEH//7NvnAP2eIHXp9cf4cWdC8x/BhwopgKs
         zy5sXY0hciG/N/Ye7Gm5ft/DCANMeqnAgz846II9xGVA+Wnt7yCA2l2cJY4VxU4Ftyil
         6SFF2oRw44s1ROzMen/y3XiovDn3p1eJoaopW3IDA/+ozldUz/EH67w8oBFPT+po884h
         Fk7g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787007251; x=1787612051; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u5dhNWMYyRmUyG6+pD3T6b5XVM3Qf6OaAA8jv9AvKJU=;
        b=i/32BfWksXQo7x1aYUH2V55R+LN4nCvcDSSLpwByLvwAhMswdFiYNU18uWGr/l4AgH
         S2SD4HH0P1FisywaJtUtc9p6T9jJLDwum9E2Gx/LvRATXRfX3anNX77FrLeKGBlal5Ts
         NXSgRGuA9zkw2Q/+sij0KPeBksSf8FIRVy77V5v5Xe5CFPcocq2EyQmQ3XoaWCioS23y
         xOM3ajLN2zZNPHW7MSnWTzQ5yNXDrgPv1zliSFm4nxWTpb3E94ASXB8cOAUR+KJtVWmN
         y4QiAmxfQ0ftjRU7QpvZ4rzkhtaSTD4tnwB9cntavTAyMFsun4PxI+WWgj0IQvxIlUoH
         BT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787007251; x=1787612051;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u5dhNWMYyRmUyG6+pD3T6b5XVM3Qf6OaAA8jv9AvKJU=;
        b=idaw4pIzfNsymA52XRYxCPAyXfFsnM/YJ37/oUmMD9HsoNwLD3BRHU7WbM8NMj0ev6
         PAY7EZCeZNbC5bIIMYK7Ff3olTHPbIKRKLokHBgM8ipLK9ZUV+UkN2axEdHyGoGFOJ28
         Rqs2zlF93cQkIT6Re4w/mGxWiXLcvKQhqppv6ZpCagV0iFZA96xDeZeYV5RfgV93oy+N
         NeyUY+kr72X2dgn7xSTN4kcruaIuWZ8VqSaJqp1Kda/DqPTIvqyHcG+ITQNc2jyvXcC6
         F3TWJVod3lpe6hBkWYA+x8FOj1ZqFXdjf5KaL4btyVqojf0fBGVN1AegNcp2mHZV3+Ku
         ac0A==
X-Forwarded-Encrypted: i=1; AHgh+RrNCxwKB9K2qR9mOXRcL0iJP2dKAgfw0q7rNjkE40J7NnOECfQ/wdbaDprV7Eh1Xf8Y7u19hG5mshhluA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy053wXd+QCPvoUfWEwcpcT+Y1k7aKECOorIYweWbsNkeQOA3bX
	KCcZu6fLz2SLSE4abGtpKhenTEIs3EMOLy5/o7Fox/eojVDgSIwEiAg1JemI+us2XiaayvDyAMo
	aog0SSDCvro2L+aRmqhwQ4iRQsJCBc1Mz2cLDPeEW
X-Gm-Gg: AR+sD10d/V+o5yQ2cNUB+R4q5fB3gOORggPA98NgAiVUzJb24Hv/uTM1pYteYVDwLXR
	gY5mU2Tju6wwC9tEcZa9vfSd5uGQJj36VJSo5WDa8SLfzvEwV5TjfhFrUsQkIYEb8tGpaQBYNtC
	QoDs4ygOerQGMwA3vvAoTspQptqqaK6g0qWLWKdeDGAmKXU1gWh606XNygJRt6F/7TWT2ZyjlX2
	DZbqkQ0kKZGlGEQziItoEUdlneBXdqu53mwSEuhcqPtjmo2RsikTglVLmSae9TbzN1Y4vf7mk2Z
	Qh0l2phnE9KPb8v/Um9lgbIZKvt5O/EosSnMQ5VbbtZAUxwXa6ij1KqQk2oFISHQMVjD5AOjwki
	wZgRShl25qN9hAHNguDZfdtKlKeUHusuxHnfT2XClm/GphLe/4bH7lWsr
X-Received: by 2002:a17:907:d08c:b0:c21:180c:d82d with SMTP id
 a640c23a62f3a-c212a1858femr1259170866b.20.1787007250883; Mon, 17 Aug 2026
 15:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260813075304.75988-1-thuth@redhat.com>
In-Reply-To: <20260813075304.75988-1-thuth@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 17 Aug 2026 15:53:59 -0700
X-Gm-Features: AcwNN1XLIBynaITswGLdvzxuB2Uj3-hZ60VtqOVVnBmJvH47W0N_DNVtiARsPdg
Message-ID: <CAKwvOd=B2o5bdup0YRoKdN0J3GrZh+4M6VLamDAmit0k53o=0A@mail.gmail.com>
Subject: Re: [PATCH] kselftest/riscv: Replace __ASSEMBLY__ with __ASSEMBLER__
To: Thomas Huth <thuth@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Deepak Gupta <debug@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_155413_470087_46BCEACA 
X-CRM114-Status: GOOD (  16.95  )
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

T24gVGh1LCBBdWcgMTMsIDIwMjYgYXQgMTI6NTPigK9BTSBUaG9tYXMgSHV0aCA8dGh1dGhAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT4K
Pgo+IFdoaWxlIHRoZSBHQ0MgYW5kIENsYW5nIGNvbXBpbGVycyBhbHJlYWR5IGRlZmluZSBfX0FT
U0VNQkxFUl9fCj4gYXV0b21hdGljYWxseSB3aGVuIGNvbXBpbGluZyBhc3NlbWJseSBjb2RlLCBf
X0FTU0VNQkxZX18gaXMgYQo+IG1hY3JvIHRoYXQgb25seSBnZXRzIGRlZmluZWQgYnkgdGhlIE1h
a2VmaWxlcyBpbiB0aGUga2VybmVsLgoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpDb3JyZWN0
IQokIGNsYW5nIC1kTSAtRSAteCBhc3NlbWJsZXItd2l0aC1jcHAgLSA8IC9kZXYvbnVsbCB8IGdy
ZXAgQVNTCiNkZWZpbmUgX19BU1NFTUJMRVJfXyAxCi4uLgoKPiBUaGlzIGNhbiBiZSB2ZXJ5IGNv
bmZ1c2luZyB3aGVuIHN3aXRjaGluZyBiZXR3ZWVuIHVzZXJzcGFjZQo+IGFuZCBrZXJuZWxzcGFj
ZSBjb2RpbmcsIG9yIHdoZW4gZGVhbGluZyB3aXRoIHVhcGkgaGVhZGVycyB0aGF0Cj4gcmF0aGVy
IHNob3VsZCB1c2UgX19BU1NFTUJMRVJfXyBpbnN0ZWFkLiBTbyBsZXQncyBzdGFuZGFyZGl6ZSBu
b3cKPiBvbiB0aGUgX19BU1NFTUJMRVJfXyBtYWNybyB0aGF0IGlzIHByb3ZpZGVkIGJ5IHRoZSBj
b21waWxlcnMuCgpZZXMsIHRoYW5rcyBmb3IgY2xlYW5pbmcgdXAgdGhpcyBsZWdhY3kgY3J1ZnQu
IEdvZHNwZWVkIG9uIGZpeGluZyB0aGUKcmVzdCBvZiB0aGUga2VybmVsLgpSZXZpZXdlZC1ieTog
TmljayBEZXNhdWxuaWVycyA8bmRlc2F1bG5pZXJzQGdvb2dsZS5jb20+Cgo+Cj4gU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIEh1dGggPHRodXRoQHJlZGhhdC5jb20+Cj4gLS0tCj4gIHRvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL3Jpc2N2L2NmaS9jZmlfcnZfdGVzdC5oIHwgMiArLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9jZmkvY2ZpX3J2X3Rlc3QuaCBiL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL3Jpc2N2L2NmaS9jZmlfcnZfdGVzdC5oCj4gaW5kZXggMWM4MDQzZjJiNzc4
Yi4uMTg0ZGY2OTAzZDAxYyAxMDA2NDQKPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9y
aXNjdi9jZmkvY2ZpX3J2X3Rlc3QuaAo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jp
c2N2L2NmaS9jZmlfcnZfdGVzdC5oCj4gQEAgLTU2LDcgKzU2LDcgQEAKPgo+ICAjZGVmaW5lIENT
Ul9TU1AgMHgwMTEKPgo+IC0jaWZkZWYgX19BU1NFTUJMWV9fCj4gKyNpZmRlZiBfX0FTU0VNQkxF
Ul9fCj4gICNkZWZpbmUgX19BU01fU1RSKHgpICAgIHgKPiAgI2Vsc2UKPiAgI2RlZmluZSBfX0FT
TV9TVFIoeCkgICAgI3gKPiAtLQo+IDIuNTUuMAo+CgoKLS0gClRoYW5rcywKfk5pY2sgRGVzYXVs
bmllcnMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
