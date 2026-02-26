Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F21DFD45FF
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 01:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=53eeFGfOsco6KgpJkFkMQ2vtPlOkUAIBAyqz4f4o/Zk=; b=aQlsztrHhmtcac
	xwXTaaHtvpTCKKNdDNR5DIUE937m4V6fI1UXYEWf6/6Rro34FYtICGkT9xFm4wGE6ot31SpLAOX9S
	loTaEmtns2CQyX7LabXBGX3IPQi/XRNXf9Dd/IVTZi0x3y0jKJ93QzDmQ7Pxrc4WhXxBqzuByO9J/
	bnoJaX/fzjKBoG16KVuviAT5Wsmc4R/hWFCck/FBVgnPWKbbpyZt+yFUOn49oyLipemiU7KrPYffD
	ksL4EMfrDXfPUpab/+wHb66GWELtWomGpVbG4A/5UjEqe+cnF6KJhS1oeAwslI/r5zWr4RtsqE8J9
	uXBEqmTCYrfRSJlSvpyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvQGy-00000005Bzm-2ZiU;
	Thu, 26 Feb 2026 01:34:36 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvQGw-00000005Bye-2ut1
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 01:34:35 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ada9e4ea32so25965ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Feb 2026 17:34:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772069670; cv=none;
        d=google.com; s=arc-20240605;
        b=chkj9EwPro0V9bn24M6KFUp+amkeZDJOgO09MMC2xzhZakBbdwUm2etdiMn5Ft8biK
         WMJlfyLqpJMHnif/tjc3VK9y0wYvQ3Lv74+zQN9qVA6Hdz615EG2pkRqwg28ymkvPdNY
         NtX9ArDb/3Ygs0sBstcQ9HHQBGu5H01UiDNHzvcptoPafq1G1HGIr/MK9QkmOuYmFpOd
         EAk8viMaO5SimLG1qW3Chx7w8zDXOpRnjRnCex0pynkbFSVvDqF19rrWD789inN6gBNX
         umK+1Cr7+DvrOU76+QVvI99X7vQi1tjbKO0BrJGxgwPH8I3m5wQ66EMuVZGa9ckwsOIh
         1HAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wjQ53JZFB5yfDU+VhP3J0dlwnX2GHMinS2bwduWJ8k0=;
        fh=dyVPWBQBmRyTkn02Araiq7klHEDoYXNt+WvbcFtjIH0=;
        b=C5cJAJ9Gxfcglf8/Gh8qMvRbdomw53NarZWqHn5+2bLCS7ZcxnycLJjV8x31vRhRoD
         +oghrI8RtIOijhrOfLniudjzIUenYRNr3Y5hrEDMawIVFDUamEWOJFo93ahyXMc4th7n
         nCxN75D/tz6tMzoNULWMJV8af8+X9APUHtzk7x5IXHEIeS5wmg5Nz5pM5a2kd+JcSuhE
         USXgsQEmIS1cDlLjK/S1U4942hseCiN+D6MxebgX6tWE73libdihkXshKhbNSxaMmUwW
         j+2wm0Xfte69nN6qb6OHla3FDgqQeDnnrLmao35HxEFKmynLn5oTvfta26ygL5KHyhIs
         WUkg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772069670; x=1772674470; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjQ53JZFB5yfDU+VhP3J0dlwnX2GHMinS2bwduWJ8k0=;
        b=BpE0yGtnHwPJm8yBhYDZBgHHbZhZ4K/L3kE7SYIH4iTYAg61gv5/NLJtEvuRhU6ac+
         54ZsSAImCqNAe6BPI+vfQ0aG5p/3oUeQs7akX6q21Y618J35NC0i9cMoI2pln6Csri+S
         K9pfm4qDI8GAmLGPYvGkxQ4prRVAsCCiyWCN2t+rq8bIWWpc2CMQeF/oZ+k1dmDzhTm0
         qaAtegi/K/ZvcyfOnFhAJeoMwFKtGFBduH35OoX/yv0KmA5voaiAU9Xoq8HGTU2e0F9N
         saqZ9Nfo5FBtF0gaG2Jar9dE5ozxXR4YTTW8W1nNp5/feFLH7cs9VFWjGcHsoIZiTXhc
         IXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772069670; x=1772674470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wjQ53JZFB5yfDU+VhP3J0dlwnX2GHMinS2bwduWJ8k0=;
        b=QbHeqI05aA8iEynyRZQBvIQ1yyvaQfiMJi/k0GoQgHyIvq6u8XbbLPHx2upEuLgOwM
         ekkT+F8csRS7q93tz4Fr//4kkzGXw8+i4O2/3GTa6TVZBe0lVXQYWY/6uFT7ZBEGv2Kq
         3XCQlYTE+VBnyitBVeINdAyBVKlOzARtkMLt5PmI4IZafqnBdn4LjoSoH87C2LLKksJE
         tNBInpFaZnskrF/GpoC1y7RRUUqqkWq2/+BflAG3z51UziROjOcD8oIHx28cAxBqfJ/M
         Ky4a30JV/TLAQ57QEbTzWOZokizsYXo67gFdEiTR6Wzur1XSiUVysu7KT6ZU1CF547lV
         aQPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU12QkV/2h2D888jmVdOUWtub3oG2SlqZafke3YTFlXw0VjaMMNi51Hzkarc7KitaqQ8RPeaLpdSQ54sA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3u29mv9CG/yVMwuHF5wK/Sq82LH/m72uOcrWgIYjh6GUclBq2
	4j2pYVZXyDs+r3hQnPCqP1doN0yrU7F5at6kJ89yi9C9kk1PqCrcqfMxr2A98kb4YJdQH9YvlFH
	PaPGat5U0DFxdRJ3R8KAlUYYj5T6a/LxQxbJS2L7c
X-Gm-Gg: ATEYQzy/snKUBih+iWgDbQffdoIPm7ffpD6TnvPRgsZlUzhoW3xlqfQkXsHesriYD2K
	hFM9Vhn0en4vIs0JB56FjaAP+E4PyGFRhkWDlI6Oi7A5rM5GCq+RWjBnXp/68hC/hMT8hpOTLA5
	SQEAeU/cBgkVTG6IpRXsGmMIN4hnNVSgzb4/GDdSmWQZOHJ6Cn+i/A5wgY88Sm6iwTkUDtSYCoI
	51pnSi3hKr0PHgoJQNz/WqY3ceQ4fN8GtMHsbZuULN7WMGUVZiJRvzjlMPlxYwDYoCjr3qkHZvF
	tOEFvhkRCsHYXx4/smkH5E5v1CeW62gYBWi3aw==
X-Received: by 2002:a17:903:40cb:b0:2ad:6f9b:7819 with SMTP id
 d9443c01a7336-2adf77de594mr1447145ad.24.1772069669550; Wed, 25 Feb 2026
 17:34:29 -0800 (PST)
MIME-Version: 1.0
References: <20260224142938.26088-1-irogers@google.com> <20260224142938.26088-8-irogers@google.com>
 <q3oys2ukvylrd7xfn7267bh3wpumyxbbxpk2udhps375cmk64p@l7sjnlxll6c7>
In-Reply-To: <q3oys2ukvylrd7xfn7267bh3wpumyxbbxpk2udhps375cmk64p@l7sjnlxll6c7>
From: Ian Rogers <irogers@google.com>
Date: Wed, 25 Feb 2026 17:34:18 -0800
X-Gm-Features: AaiRm53aNAb6Tlux87h_8UOmv876w-RjbJJ3ZYy7jl1sfvFunMT13zrT8xA0lxo
Message-ID: <CAP-5=fWVU3ktkGAnZQrjQJf+Z5AtQo73BVUhj-nr3H95GdcEJQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 7/7] perf unwind-libunwind: Add RISC-V libunwind support
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dmitrii Dolgov <9erthalion6@gmail.com>, 
	Blake Jones <blakejones@google.com>, Tomas Glozar <tglozar@redhat.com>, 
	Yuzhuo Jing <yuzhuo@google.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Shimin Guo <shimin.guo@skydio.com>, Athira Rajeev <atrajeev@linux.ibm.com>, 
	Chun-Tse Shao <ctshao@google.com>, Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Thomas Richter <tmricht@linux.ibm.com>, 
	libunwind-devel@nongnu.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_173434_728003_4532DBDC 
X-CRM114-Status: GOOD (  12.93  )
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

T24gV2VkLCBGZWIgMjUsIDIwMjYgYXQgMTowOOKAr1BNIEFuZHJldyBKb25lcwo8YW5kcmV3Lmpv
bmVzQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBGZWIgMjQsIDIwMjYgYXQg
MDY6Mjk6MzdBTSAtMDgwMCwgSWFuIFJvZ2VycyB3cm90ZToKPiAuLi4KPiA+ICtzdHJ1Y3QgdW53
aW5kX2luZm8gKl9fbGlidW53aW5kX2FyY2hfdW53aW5kX2luZm9fX25ld19yaXNjdihzdHJ1Y3Qg
dGhyZWFkICp0aHJlYWQgX19tYXliZV91bnVzZWQsCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwZXJmX3NhbXBsZSAq
c2FtcGxlICBfX21heWJlX3VudXNlZCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IG1heF9zdGFjayBfX21heWJlX3VudXNl
ZCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgYm9vbCBiZXN0X2VmZm9ydCAgX19tYXliZV91bnVzZWQsCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQ2NF90
IGZpcnN0X2lwICBfX21heWJlX3VudXNlZCkKPiA+ICt7Cj4gPiArI2lmZGVmIEhBVkVfTElCVU5X
SU5EX1JJU0NWX1NVUFBPUlQKPiA+ICsgICAgIHN0cnVjdCB4ODZfNjRfdW53aW5kX2luZm8gewo+
ICAgICAgICAgICAgICAgIF4gY29weStwYXN0ZSBpc3N1ZT8KClNlZW1zIHZlcnkgbGlrZWx5IDot
KSBXaWxsIGZpeCBpbiB2Mi4gSSdtIHN0aWxsIGFmdGVyIGEgd2F5IHRvCmdlbmVyYXRlIGEgY29t
cGlsZSBvZiBsaWJ1bndpbmQgZnJvbSBpdHMgZ2l0aHViIHdpdGggYWxsIHRoZSByZW1vdGUKaGVh
ZGVycyBidWlsdCBhbmQgbm90IGp1c3QgdGhlIG9uZSBmb3IgdGhlIGhvc3QgSSdtIG9uLiBJdCBz
ZWVtcyB0aGVyZQppcyBhbiBBbmRyb2lkIHNvbHV0aW9uIGZvciB0aGlzLCBidXQgSSB3YXMgaG9w
aW5nIGZvciBzb21ldGhpbmcgbW9yZQp1cHN0cmVhbS4gQXQgdGhpcyBwb2ludCBpdCBpcyBsb29r
aW5nIHRvIG1lIHRoYXQgbGlidW53aW5kIGlzIGEgZGVhZApwcm9qZWN0IGFuZCB3ZSBtYXkgYmUg
YmV0dGVyIGp1c3QgZGVsZXRpbmcgdGhlIGFzc29jaWF0ZWQgY29kZS4KClRoYW5rcywKSWFuCgo+
IFRoYW5rcywKPiBkcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
