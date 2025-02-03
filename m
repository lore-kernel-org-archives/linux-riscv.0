Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18151C02192
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 19:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GSqZ4975uajr4ek3/Dbuowf4LYtOA71xKK4NDrXIp1s=; b=PaXoCHKxC4Z+vi
	+BPhGKw2T4DhSshsMxnh1Xz5tMekYQE6zv7XCiWU/p4BEz+TaSk9XYJudvLVu7pG4t6lOf68k/jq1
	iDyS6iPkxAhDP+TzetDL11ZFihuzY07tGUkmvd+qag15xwzynVPWQcifCByy3gEvuKsGDgEGoMd6H
	JgBkrxjs9AA+K9nCr2ys1Bxn4lHYokzoQwgopwCNqFPnrUhtkrwGqVOzpye87l3ZmeNNS0o1DGFwx
	t/c+1WT+faJ3KNUs8mSZjXbVQ8dT+p4U5AbUy2kwVeqWaG9B7mFxjaZ1+aotbGCFmht/BLnd6DOgz
	fOmVcwLWvKwxJFEJEqSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf29m-0000000GT7u-3GIt;
	Mon, 03 Feb 2025 19:30:54 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf29k-0000000GT7J-3RsN
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 19:30:54 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-844d555491eso123503339f.0
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 11:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1738611052; x=1739215852; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=668K+R2E5Th67DzQSufp3lAZyns5vzsbC/BEn5KLY64=;
        b=fahO23bCrXre7IaQMXQm6s1x/7bGn4OzfAyKJRK8SOl2pEXwoWk3xhRMzyn+XAvsDg
         QNEE31rDqLAzkWifTkfe1bYUGtNYO6HHJoEWR2N0gmSsoDWtRL+v9Y3U9PaEIi7T1T8j
         F/zBhvnDf9qa8pJsg2p3Di82Je1RtBdyuUPEwoarVyOA6U+khOFjJouFhkSw7ILWSpBx
         dBMBXKF4IJ3TvhnI6NmT1jM99MMLGlj7vJyhTC0Dg4tUrbFZtuTgWP5RZz0qxs2LBYtR
         L/kJORwMAn4/2I3CaL7ePqAFtkZxMc4f85+A2z5uT9jk+eSeB/PPxOqQtshJ/QslB3DH
         V3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738611052; x=1739215852;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=668K+R2E5Th67DzQSufp3lAZyns5vzsbC/BEn5KLY64=;
        b=fmFlfWqVnC6CL3nOW4uSkf06tRtnMizfUcMvbt9NwiC8ahhS4C0O1yB/57OxqoigkR
         aHpPZGBUvLB+OC1JW8C4555nISQHjdD0F0xdI95PIpUIUetrXHYzHkGTR7ARKee9XWWD
         9vZhw7uNO/g7s/k2Tzf4B2sg1NXAiyaTdyMv4jv9g6bI6ZzH5K87BoPDnSI65eQ/Naef
         xfjXhjq6lJ05yQyMTyBMBO2fQ8kAaRJFBB2DWGqA0GGqGLa/flUF9kmTs8/C6oJq94mb
         hy4L78E605+MhXt+78D1jKS2r12oG9QeAhAmsZLryr6Kn10mGMsOdUyVhK+5C/RS0umT
         Em/w==
X-Forwarded-Encrypted: i=1; AJvYcCUGIdPccY7BaYD/EgwRO+r7L/JBETlFpYmv0a4TaNhe+xEskEaKisjSHun1CuQF4sZ4CDODHt6QVlBIJA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxjvSiebSBRISIezf6Fv/ccmv8CZbgiE/xpl0EsoGUrzFz94NPC
	u/yR+BPOdFE0x37Ysbm6CryndA6TvsJOUPm7zaT0yaksYbusWo7J4aswG6TcHC4=
X-Gm-Gg: ASbGnctLDtZcor1aVmY68wPeNFhjx5WBgspKFDzWDL9P9rZYp88no/KRjOsipIVgOlN
	KPCuw64XET6xCjIIPHNydbd9jV48CAghbt9KbGhm7g4bRKEl65qjtiqC16Xtma+PfJwZP6eRBfh
	Bn7TAK5DFRQnu9kc1X/TuKsJ1IDUGLtZ7ZRSidKDZGhcxWN839LSmbd47iAr8ZB6e6S6D3MTMiv
	mCeGlOdCBSFyzeexQOmyerBXnhhSEPluz8EJIJm0yA6ARZxfuWozoG20ABCkfxLZ4d8nV1FSOHN
	cf7V+vN99TUHn8zfdsJtSG1/v8LpvmCzIQ==
X-Google-Smtp-Source: AGHT+IFbABpV8Uj9LIoKwwHpxBqQtyfAOfzmrEnef+d6XFjuyKUbHUDqoK4KXRXN7WCIv6jozSOc2g==
X-Received: by 2002:a92:c266:0:b0:3d0:1101:9d07 with SMTP id e9e14a558f8ab-3d011019f3cmr133245175ab.10.1738611051717;
        Mon, 03 Feb 2025 11:30:51 -0800 (PST)
Received: from [100.64.0.1] ([165.188.116.9])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d00c83afb9sm23354015ab.55.2025.02.03.11.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 11:30:50 -0800 (PST)
Message-ID: <6cac61f1-cf6d-4a43-836c-e83a0b0da096@sifive.com>
Date: Mon, 3 Feb 2025 13:30:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: Use Zalrsc extension to implement atomic
 functions
To: Charlie Jenkins <charlie@rivosinc.com>, Conor Dooley <conor@kernel.org>
Cc: Aleksandar Rikalo <arikalo@gmail.com>, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Andrea Parri <parri.andrea@gmail.com>, Leonardo Bras <leobras@redhat.com>,
 Guo Ren <guoren@kernel.org>, Eric Chan <ericchancf@google.com>,
 linux-kernel@vger.kernel.org,
 Djordje Todorovic <djordje.todorovic@htecgroup.com>
References: <20241225082412.36727-1-arikalo@gmail.com>
 <Z4CSpE9UKkJNM_g5@ghost>
 <CAGQJe6oA8oiZmg0HGW7KrjdOJ7nXNK9hQFm4jdQ6n0WTG6i-vA@mail.gmail.com>
 <20250202-clammy-skewed-eb0a0fce18f1@spud> <Z6EVIPc_t6zMU9qb@ghost>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <Z6EVIPc_t6zMU9qb@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_113052_877921_80248DD1 
X-CRM114-Status: GOOD (  17.57  )
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

SGkgQ2hhcmxpZSwKCk9uIDIwMjUtMDItMDMgMToxMiBQTSwgQ2hhcmxpZSBKZW5raW5zIHdyb3Rl
Ogo+IE9uIFN1biwgRmViIDAyLCAyMDI1IGF0IDA4OjA4OjUwUE0gKzAwMDAsIENvbm9yIERvb2xl
eSB3cm90ZToKPj4gT24gU2F0LCBGZWIgMDEsIDIwMjUgYXQgMDE6MDQ6MjVQTSArMDEwMCwgQWxl
a3NhbmRhciBSaWthbG8gd3JvdGU6Cj4+PiBPbiBGcmksIEphbiAxMCwgMjAyNSBhdCA0OjIz4oCv
QU0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4+
PiBGcm9tOiBDaGFvLXlpbmcgRnUgPGNmdUBtaXBzLmNvbT4KPj4+Pj4KPj4+Pj4gVXNlIG9ubHkg
TFIvU0MgaW5zdHJ1Y3Rpb25zIHRvIGltcGxlbWVudCBhdG9taWMgZnVuY3Rpb25zLgo+Pj4+Cj4+
Pj4gSW4gdGhlIHByZXZpb3VzIHBhdGNoIHlvdSBtZW50aW9uIHRoYXQgdGhpcyBpcyB0byBzdXBw
b3J0IE1JUFMgUDg3MDAuIENhbgo+Pj4+IHlvdSBleHBhbmQgb24gd2h5IHRoaXMgY2hhbmdlIGlz
IHJlcXVpcmVkPyBUaGUgZGF0YXNoZWV0IGF0IFsxXSBzYXlzOgo+Pj4+Cj4+Pj4gIlRoZSBQODcw
MCBjb3JlIGlzIGNvbmZpZ3VyZWQgdG8gc3VwcG9ydCB0aGUgUlY2NEdDWmJhX1piYiAoRyA9IElN
QUZEKQo+Pj4+IFN0YW5kYXJkIElTQS4gSXQgaW5jbHVkZXMgdGhlIFJWNjRJIGJhc2UgSVNBLCBN
dWx0aXBseSAoTSksIEF0b21pYyAoQSksCj4+Pj4gU2luZ2xlLVByZWNpc2lvbiBGbG9hdGluZyBQ
b2ludCAoRiksIERvdWJsZSAoRCksIENvbXByZXNzZWQgKEMpIFJJU0MtVgo+Pj4+IGV4dGVuc2lv
bnMsIGFzIHdlbGwgYXMgdGhlIGFzIHdlbGwgYXMgdGhlIGJpdC1tYW5pcHVsYXRpb24gZXh0ZW5z
aW9ucwo+Pj4+IChaYmEpIGFuZCAoWmJiKSIKPj4+Pgo+Pj4+IFRoZSAiQSIgZXh0ZW5zaW9uIGlz
IGEgcGFydCBvZiAiRyIgd2hpY2ggaXMgbW9zdGx5IGFzc3VtZWQgdG8gZXhpc3QgaW4KPj4+PiB0
aGUga2VybmVsLiBBZGRpdGlvbmFsbHksIGhhdmluZyB0aGlzIGJlIGEgY29tcGlsYXRpb24gZmxh
ZyB3aWxsIGNhdXNlCj4+Pj4gdHJhcHMgb24gZ2VuZXJpYyBrZXJuZWxzLiBXZSBnZW5lcmFsbHkg
dHJ5IHRvIHB1c2ggZXZlcnl0aGluZyB3ZSBjYW4KPj4+PiBpbnRvIHJ1bnRpbWUgZmVhdHVyZSBk
ZXRlY3Rpb24gc2luY2UgdGhlcmUgYXJlIHNvIG1hbnkgcG9zc2libGUgdmFyaWFudHMKPj4+PiBv
ZiByaXNjdi4KPj4+Pgo+Pj4+IEV4cHJlc3Npbmcgbm90IGJlaW5nIGFibGUgdG8gcGVyZm9ybSBh
IGZlYXR1cmUgbGlrZSB0aGlzIGlzIG5vcm1hbGx5Cj4+Pj4gYmV0dGVyIGV4cHJlc3NlZCBhcyBh
biBlcnJhdGEuIFRoZW4gZ2VuZXJpYyBrZXJuZWxzIHdpbGwgYmUgYWJsZSB0bwo+Pj4+IGluY2x1
ZGUgdGhpcywgYW5kIGFueWJvZHkgd2hvIGRvZXNuJ3Qgd2FudCB0byBoYXZlIHRoZSBleHRyYSBu
b3BzCj4+Pj4gaW50cm9kdWNlZCBjYW4gZGlzYWJsZSB0aGUgZXJyYXRhLiBBIHNpbWlsYXIgYXBw
cm9hY2ggdG8gd2hhdCBJIHBvaW50ZWQKPj4+PiBvdXQgbGFzdCB0aW1lIHNob3VsZCB3b3JrIGhl
cmUgdG9vIChidXQgd2l0aCBtb3JlIHBsYWNlcyB0byByZXBsYWNlKQo+Pj4+IFsyXS4KPj4+Pgo+
Pj4+IFsxXSBodHRwczovL21pcHMuY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDI0LzExL1A4NzAw
X0RhdGFfU2hlZXQucGRmCj4+Pj4gWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvWjIt
VU5md2NBUVlacVZCVUBnaG9zdC9ULwo+Pj4KPj4+IFNvIGZhciB3ZSBoYXZlbid0IGZvdW5kIGEg
d2F5IHRvIGRvIHRoaXMgdXNpbmcgZXJyYXRhLgo+Pgo+PiBZb3UgbWVhbiB1c2luZyBhbHRlcm5h
dGl2ZXM/IE5vdCBpbXBsZW1lbnRpbmcgQSwgYnV0IGluc3RlYWQKPj4gaW1wbGVtZW50aW5nIFph
bHJzYywgaXMgbm90IGFuIGVycmF0dW0uIEl0J3MgYSBkZXNpZ24gZGVjaXNpb24uCj4gCj4gV2Ug
Y291bGQgZG8gdGhlIHNhbWUgdGhpbmcgd2UgZG8gd2l0aCBtaXNhbGlnbmVkIGFjY2VzcyBkZXRl
Y3Rpb24gYW5kCj4gcnVuIHNvbWUgaW5zdHJ1Y3Rpb25zIHRvIGRldGVybWluZSBpZiB0aGVzZSBp
bnN0cnVjdGlvbnMgYXJlIGJlaW5nCj4gZW11bGF0ZWQuICBJZiB0aGV5IGFyZSBiZWluZyBlbXVs
YXRlZCwgcGF0Y2ggYWxsIG9mIHRoZSBwbGFjZXMgdG8gdXNlCj4gemFscnNjLgoKSXMgdGhlIGlt
cGxpY2F0aW9uIGhlcmUgdGhhdCB0aGUgcmlzY3YsaXNhLWV4dGVuc2lvbnMgbGlzdCBwYXNzZWQg
dG8gdGhlIGtlcm5lbAp3aWxsIGNvbnRhaW4gImEiLCBldmVuIHRob3VnaCB0aGUgaGFyZHdhcmUg
ZG9lcyBub3Qgc3VwcG9ydCBpdCwgYmVjYXVzZSBBTU9zIGFyZQplbXVsYXRlZCBpbiBNLW1vZGU/
CgpJZiB0aGF0IGlzIG5vdCB0aGUgY2FzZSwgdGhlcmUgaXMgbm8gbmVlZCBmb3IgcnVudGltZSBk
ZXRlY3Rpb24uIFRoZSBhbHRlcm5hdGl2ZQplbnRyeSBjYW4gY2hlY2sgUklTQ1ZfSVNBX0VYVF9a
QUFNTyAod2hpY2ggd291bGQgYmUgaW1wbGllZCBieSBSSVNDVl9JU0FfRVhUX2EpCmluIHRoZSBJ
U0EgYml0bWFwIGxpa2Ugbm9ybWFsLgoKUmVnYXJkcywKU2FtdWVsCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
