Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9E2C02194
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 19:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bIXRt3ancpzpyjorTp2kMgqXOc0kdbWb5To0y5WOWUw=; b=0UI/Jdt7YtNW2T
	NMLCHh+lhewTJsJKCbfY+o/+/RRX/g1ySZYzoQ2Pa4uUFC2rEs28VAB4zZhWR6k1HEPMCWNRG6dYb
	xNnHsjztiIx4VT/KR/+toZnAgZv5rjxVEgoiN13K/jr0W+S3fQxAm5hevA1mL2xFzYaJV0a2HAyEc
	zuCBNmUVDop06P5uDIdhHGT7QLhRDDbeU+UXjS6nGTb7pUGqyDtAXy+hleMBSn0Hcrq3XWQ0oJNIm
	bSMxhPgQ8NPugqcm4cX69YyijPjfsefS/2axrnGzollV08SInWWGnDiGobZ+lW5TSr9rGXMPbNMNJ
	tE7RYTKVfdtXa+6/QFKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOU8-00000001LRD-2HI2;
	Tue, 04 Feb 2025 19:21:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOEy-00000001JdW-36we
	for linux-riscv@bombadil.infradead.org;
	Tue, 04 Feb 2025 19:05:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HYITfMxdo9z4e5O1OPoM+RWhoGSmHNU/Bz6nSPQzi+o=; b=TA1Cw0+79Y6j3Pe/+cq91OrsrQ
	rDfW6TnlgaPI/lx4pwdEZ3LWwDY9wNbxaJZIJ1ghzM8r7V+Sb0/NxUJsFU3m22Ct41EzkBJHmErbe
	8JTFnx8aF+wMehHfRKW0y+Keg0A28QC8pnsrJJQZ8w7q7xUgax3xvGYBFkrBFTvWPzBHiLYxxryYu
	7S41+35zPpUUlj86im6pUfBlwfto/FClSzgUbC1dAWBGYbTEpzBeI/jP9FR+FmKhmhSW3yNMHQeMK
	EuEqBxvyWk20UR9Xqib+bCeeqlwFri2MAYY2sybLT9aSZ4QTaG6I2UXlPPp6mAbAieA2OsDs+5zp/
	Atm2BhVQ==;
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOEu-0000000GONZ-2b5O
	for linux-riscv@lists.infradead.org;
	Tue, 04 Feb 2025 19:05:43 +0000
Received: by mail-il1-x141.google.com with SMTP id e9e14a558f8ab-3d04d655fefso2847255ab.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 11:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738695938; x=1739300738; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HYITfMxdo9z4e5O1OPoM+RWhoGSmHNU/Bz6nSPQzi+o=;
        b=DHd2XtzKnL6L/FLItM9ZWuRENZpgagPPyoTBGjLmVQvqmd6GbA2cgSPAQhu7IdIKSG
         eaRbxnMOJ1ltYZG7rB/wf3mphuibRWdRuot2BZONaa02IAEUEUbT84CkRybtyBEZPkeI
         C6BabGUC5oO4emfYFJOwlz+Dkou5iaO2V9uC7QPj6ooc52JAiGQrfs8wEoSHSYGdC2jV
         PgS7rzHGl5+1GBOX+LBPqeoHGuyIQOtcZGblUt65H7kd3/VKSWfFfEGCpW/mzfABGUWa
         ScodPTY5COQzhnTjyues7IRlh1Uh52i6y6x5qyYLjq2LvT1eyiwcdzyqt0xCvPkqwwhQ
         O2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738695938; x=1739300738;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HYITfMxdo9z4e5O1OPoM+RWhoGSmHNU/Bz6nSPQzi+o=;
        b=RmUJTNlMvwZQhg1qh2nT+7YeN8A2nxGQqOm7hY17bQGuoSrXlbSNmkvLjnVCjMcInb
         J7zFmMmVoVx5EIDNIQw/fDW5p0/LctwcYzuWVsk6fC9liTXfp0083gOC2R9iBKOYrG1k
         CxymYtJKTmSIMxISw6MBTEfrpM+Ytcx/lP6vhqZ8sKfjDv9YakuEjdsRp1yE26uFELUP
         jnITPVWDqEZQNFRK5C0a2LMQn8h4etPkrT9/6R1O8VuQ0h7Hq9cJxTNuz8U+UlOcSEoX
         DvyDjUoS2XPawWLs672L2a36bRNKEC/9vGHUK5aBgUW6lmB2HHBcENRU1eCLopmn4X4s
         PuXA==
X-Forwarded-Encrypted: i=1; AJvYcCUwjU+kfEK6tVyZdW58kB/0A9gV77JMTxvogJ5D3JAAADaBDUk18pjATputUEcXNp4EcZ7tLZr0W3JT9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5u0BOU0AXhWvTDq42DflUid8sVF65KticKEIF+QbjM4kI2EAf
	DLEZxVFhJauilMJWlMp57IPDv2TpyR8zC6713LkWsPTvouaPvpLS62cIv8YP4KM=
X-Gm-Gg: ASbGncuKwbsU2J2RDutdif2isVMLUBIEub5yhLK+U6id4e9jDO+HD/X/X2yTfSKXRI6
	PK3Ks6Wz+58gQLqzRzyRYi4334ZpMRCs9xNZOfWxOOKHlsi1jamIiqmNz1vD32qHDeBA6Jriry3
	JON++Xh3W2hKhCG5tf8E1JvQpxCENjA93dW3VVo033XdVJwXMNVN2ZD5NkxJR/6fukywngYL5mT
	I9ytspMT0aAeARjLvlgHAuwisWLt8AGWuRychnwt6eV2uaRhv6MAebD18BSjtZfxKkz33iNjNu0
	HY0JtA==
X-Google-Smtp-Source: AGHT+IGX0H3nuw7h5Pjn1noXiepBaQQUopjt9QfDVUMZhCxuDfrTzW15XFUboTC/O2xCeIBQM6sASg==
X-Received: by 2002:a05:6e02:1945:b0:3cf:bb11:a3a4 with SMTP id e9e14a558f8ab-3d04f6e596emr607745ab.15.1738695937767;
        Tue, 04 Feb 2025 11:05:37 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec7469eee7sm2833134173.91.2025.02.04.11.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 11:05:36 -0800 (PST)
Date: Tue, 4 Feb 2025 11:05:33 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>,
	Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 0/7] perf: Support multiple system call tables in the
 build
Message-ID: <Z6Jk_UN9i69QGqUj@ghost>
References: <20250201071455.718247-1-irogers@google.com>
 <Z6EStkn-YZ8zaO7u@ghost>
 <CAP-5=fXRz_8CKNz4Fr-=0yhKbf_QE2ND+PPykSAO5p8wcUz7xA@mail.gmail.com>
 <Z6EVwaOVYaKtaK1j@ghost>
 <CAP-5=fX1hCNWWmGJPKYxj93S=zM1-eRucqzb4WW5fB_sZBCRLg@mail.gmail.com>
 <Z6Eh1QLuqTbUKLCc@ghost>
 <CAP-5=fXZr8L4Z=Lb28QDZF8cbv2eJJEHSb0H9zcqSOB9cn5-9g@mail.gmail.com>
 <Z6FLDHz6V5L-HGR7@ghost>
 <CAP-5=fVk6N=FVXsJ9xRJZhYSh2sbmUkEPr5HqRd-pR7mbGts+w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fVk6N=FVXsJ9xRJZhYSh2sbmUkEPr5HqRd-pR7mbGts+w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_190540_944723_C0080096 
X-CRM114-Status: GOOD (  56.48  )
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

T24gTW9uLCBGZWIgMDMsIDIwMjUgYXQgMDU6NTg6MjlQTSAtMDgwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPiBPbiBNb24sIEZlYiAzLCAyMDI1IGF0IDM6MDLigK9QTSBDaGFybGllIEplbmtpbnMgPGNo
YXJsaWVAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+IE9uIE1vbiwgRmViIDAzLCAyMDI1IGF0IDEy
OjU0OjU5UE0gLTA4MDAsIElhbiBSb2dlcnMgd3JvdGU6Cj4gW3NuaXBdCj4gPiA+IEkgdGhpbmsg
aXQgbWFrZXMgc2Vuc2UgaW4gdGhlIGtlcm5lbCwgYXMgdGhlIGJ1aWx0IGJpbmFyeSBkb2Vzbid0
IGhhdmUKPiA+ID4gY3Jvc3MtcGxhdGZvcm0gY29uY2VybnMuIFRoaXMgaXMgcHJvYmFibHkgYWxz
byB0aGUgcmVhc29uIHdoeSB0aGUgcGVyZgo+ID4gPiB0b29sIGhhcyBhbiBhcmNoIGRpcmVjdG9y
eS4gTGV0IG1lIGtub3cgd2hhdCB5b3UgdGhpbmsgaXMgdGhlIHJpZ2h0Cj4gPiA+IGRpcmVjdGlv
biBmb3IgdGhlIHBlcmYgdG9vbCBzeXNjYWxsIHRhYmxlIGNvZGUuCj4gPgo+ID4gSSBhbSBoZXNp
dGFudCBhYm91dCBtb3ZpbmcgYWxsIG9mIHRoZSBhcmNoLXNwZWNpZmljIHN5c2NhbGwgZ2VuZXJh
dGlvbgo+ID4gZmxhZ3MgaW50byBhIHNpbmdsZSBmaWxlLgo+IAo+IEluIHRoZXNlIGNoYW5nZXMg
SSBoYWQgYSBzaW5nbGUgZmlsZSB0byBidWlsZCB1cCBhIG1hcHBpbmcgZnJvbSBFTEYKPiBtYWNo
aW5lIHRvIHN5c2NhbGwgdGFibGUgaW4gYW4gYXJyYXkgYW5kIEkgd2FudGVkIHRvIGtlZXAgdGhl
IGxvZ2ljIHRvCj4gYnVpbGQgdGhlIGFycmF5IGFsb25nc2lkZSB0aGUgbG9naWMgdG8gYnVpbGQg
dXAgdGhlIGNvbXBvbmVudHMgb2YgdGhlCj4gYXJyYXkgLSBzbyB0aGUgaWZkZWZzIHdlcmUgdmlz
dWFsbHkgdGhlIHNhbWUuIEFzIHRoZSBzY29wZSBpcyBhIHNpbmdsZQo+IGZpbGUgYW5kIHRoZSB2
YXJpYWJsZXMgYXJlIHN0YXRpYywgdGhpcyBjYW4gZ2l2ZSB1c2VmdWwgQyBjb21waWxlcgo+ICJ1
bnVzZWQgZGVmaW5pdGlvbiIgd2FybmluZ3MuIFlvdSBjYW4gdHJpY2sgdGhlIGxpbmtlciB0byBn
aXZlIHNpbWlsYXIKPiB3YXJuaW5ncyBhdCB0aGUgc2NvcGUgb2YgYSBmaWxlLCBzbyB0aGlzIGlz
bid0IGEgZGVhbCBicmVha2VyLgo+IAo+ID4gVGhlcmUgaXMgY3VycmVudGx5IGEgcmVhbGx5IGNs
ZWFuIHNlcGFyYXRpb24KPiA+IGJldHdlZW4gdGhlIGFyY2hpdGVjdHVyZXMgYW5kIGl0J3MgcG9z
c2libGUgdG8gZ2VuZXJhdGUgYWxsIG9mIHRoZQo+ID4gc3lzY2FsbCB0YWJsZXMgZm9yIGFsbCBv
ZiB0aGUgYXJjaGl0ZWN1dHVyZXMgYmFzZWQgb24gdGhlIHBhdGhzIHRvIHRoZQo+ID4gc3lzY2Fs
bCB0YWJsZS4KPiAKPiBUaGlzIGRvZXNuJ3QgaGFwcGVuIGN1cnJlbnRseSBhcyB0aGUgYnVpbGQg
b2YgdGhlIGFyY2ggZGlyZWN0b3J5IGlzIHRvCj4gYWRkIGluICQoU1JDQVJDSCkgb25seS4gU28K
PiB0b29scy9wZXJmL2FyY2gvYXJtNjQvZW50cnkvc3lzY2FsbHMvTWFrZWZpbGUuc3lzY2FsbHMg
d2lsbCBvbmx5IGJlCj4gaW5jbHVkZWQgaW50byB0aGUgYnVpbGQgaWYgU1JDQVJDSD09YXJtNjQu
IEFzIEkndmUgc2FpZCBJJ20gYWdhaW5zdAo+IHRoZSBpZGVhIG9mIHRoZSBhcmNoIGRpcmVjdG9y
eSBhcyBpdCBuZWFybHkgYWx3YXlzIGNhdXNlcyBjcm9zcwo+IHBsYXRmb3JtIHByb2JsZW1zIC0g
bm90IGFuIGlzc3VlIGluIGEgTGludXgga2VybmVsIGJ1aWxkLiBXZSByZWNlbnRseQo+IGVsaW1p
bmF0ZWQgZHdhcmYtcmVncyBmb3IgdGhpcyByZWFzb24gKGFuZCBob3BlZnVsbHkgZml4aW5nIHVw
IGNyb3NzCj4gcGxhdGZvcm0gZGlzYXNzZW1ibHkgaXNzdWVzIGFzIGEgY29uc2VxdWVuY2UpOgo+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MTEwODIzNDYwNi40Mjk0NTktMS1pcm9n
ZXJzQGdvb2dsZS5jb20vCj4gV2UgY291bGQgaGF2ZSB0aGUgc3lzY2FsbCB0YWJsZSBsb2dpYyBu
b3QgdW5kZXIgYXJjaCBhbmQgZ2VuZXJhdGUKPiBtdWx0aXBsZSBmaWxlcywgYnV0IHdlJ2QgYmUg
YWRkaW5nIGV4dHJhIGxvZ2ljIHRvIHB1bGwgdGhpbmdzIGFwYXJ0IHRvCj4gdGhlbiBwdWxsIHRo
aW5ncyBiYWNrIHRvZ2V0aGVyIGFnYWluLCB3aGljaCBmZWVscyBsaWtlIHVubmVjZXNzYXJ5Cj4g
Y29tcGxleGl0eS4KPiAKPiBJdCBzZWVtcyBpbiB5b3VyIGNoYW5nZXMgdGhlIEtidWlsZCBhbmQg
TWFrZWZpbGUuc3lzY2FsbHMgYXJlIHJ1bm5pbmcKPiBpbiB0aGUgYXJjaCBkaXJlY3RvcnkgLSB0
aGlzIGZlZWxzIGxpa2UgYSBsb3Qgb2YgcGVjdWxpYXIgYW5kCj4gc2VwYXJhdGVkIGJ1aWxkIGxv
Z2ljIGZvciBqdXN0IGl0ZXJhdGluZyBvdmVyIGEgYnVuY2ggb2YgYXJjaAo+IGRpcmVjdG9yeSBu
YW1lcyBhbmQgY2FsbGluZyBhIHNoZWxsIGZ1bmN0aW9uIG9uIHRoZW0gLSBhbGJlaXQgd2l0aAo+
IHNvbWUgYXJjaCBzcGVjaWZpYyBwYXJhbWV0ZXJzLiBUaGVyZSdzIGFsc28gYW4gZXh0cmEgQyBo
ZWxwZXIKPiBleGVjdXRhYmxlIGluIHlvdXIgY29kZS4gCgpZZXMsIEkgY2FuIHVuZGVyc3RhbmQg
d2h5IHlvdSBiZSBvcHBvc2VkIHRvIHRoYXQgYW5kIEkgZG9uJ3QgaGF2ZSBhIGdvb2QKY291bnRl
cmFyZ3VtZW50LgoKPiBJIGtpbmQgb2YgbGlrZSB0aGF0IEkgZ2V0IGEgc2luZ2xlIGhlYWRlcgo+
IHRoYXQgaXMgdGhlIHNhbWUgYWNyb3NzIGFsbCBhcmNoaXRlY3R1cmVzIGFuZCB3aXRoIG5vIG1v
cmUgYnVpbGQKPiBzeXN0ZW0gcmVxdWlyZW1lbnRzIHRoYW4gdG8gc3VwcG9ydCBpZmRlZnMgLSBp
biBmYWN0IHRoZSBpZmRlZnMgYXJlCj4ganVzdCB0aGVyZSB0byBrZWVwIHRoZSBjb2RlIHNpemUg
ZG93biB0aGVyZSBpcyBhICNkZWZpbmUgdG8gbWFrZSB0aGVtCj4gYWxsIGhhdmUgbm8gZWZmZWN0
LiBJIGhlYXIgeW91ciAiY2xlYW4gc2VwYXJhdGlvbiIgYnV0IEkgYWxzbyB0aGluawo+IHNlcGFy
YXRpb24gYWNyb3NzIGZpbGVzIGNhbiBtYWtlIHRoaW5ncyBoYXJkZXIgdG8gcmVhZCwgc3RhdGUg
aXMgaW4gPjEKPiBwbGFjZS4gSSd2ZSB0cmllZCB0byBjbGVhbmx5IHNlcGFyYXRlIHdpdGhpbiB0
aGUgc2NyaXB0Lgo+IAo+IEkgZG8gdGhpbmsgdGhlcmUgaXMgc29tZSB0ZWNoIGRlYnQgaW4gYm90
aCBjaGFuZ2VzLiBNeToKPiBgYGAKPiAjaWYgZGVmaW5lZChBTExfU1lTQ0FMTFRCTCkgfHwgZGVm
aW5lZChfX3Jpc2N2KQo+ICNpZiBfX0JJVFNfUEVSX0xPTkcgIT0gNjQKPiBFT0YKPiBidWlsZF90
YWJsZXMgIiR0b29sc19kaXIvc2NyaXB0cy9zeXNjYWxsLnRibCIgIiRvdXRmaWxlIgo+IGNvbW1v
biwzMixyaXNjdixtZW1mZF9zZWNyZXQgRU1fUklTQ1YKPiBlY2hvICIjZWxzZSIgPj4gIiRvdXRm
aWxlIgo+IGJ1aWxkX3RhYmxlcyAiJHRvb2xzX2Rpci9zY3JpcHRzL3N5c2NhbGwudGJsIiAiJG91
dGZpbGUiCj4gY29tbW9uLDY0LHJpc2N2LHJsaW1pdCxtZW1mZF9zZWNyZXQgRU1fUklTQwo+IFYK
PiBjYXQgPj4gIiRvdXRmaWxlIiA8PEVPRgo+ICNlbmRpZiAvL19fQklUU19QRVJfTE9ORyAhPSA2
NAo+IGBgYAo+IG1lYW5zIHRoZSBwZXJmIGJpbmFyeSB3b3JkIHNpemUgZGV0ZXJtaW5lcyB0aGUg
c3lzY2FsbCB0YWJsZSBzdXBwb3J0Lgo+IFRoaXMgaXMgYmVjYXVzZSB0aGUgZV9tYWNoaW5lIGlu
IHRoZSBFTEYgaGVhZGVyIGlzbid0IHVuaXF1ZSBpbiB0aGVzZQo+IHR3byBjYXNlcyBhbmQgaGF2
aW5nIGJvdGggdGFibGVzIHdvdWxkIGhhdmUgbm8gZWZmZWN0LiBZb3UndmUgbW92ZWQKPiB0aGlz
IGludG8gdGhlIGVudiBhcmNoIG5hbWUgaGFuZGxpbmcsIGJ1dCBJIHRoaW5rIGhhdmluZyA+MSB3
YXkgdG8KPiBlbmNvZGUgYSBiaW5hcnkgdHlwZSBpcyBzdWJvcHRpbWFsLiBUaGVyZSBhcmUgc29t
ZSBFTEYgZmxhZyBBQkkgYml0cwo+IHRoYXQgcmVzb2x2ZSBkaXNhc3NlbWJsZXIgdGhpbmdzIG9u
IGNza3ksIHNvIHBlcmhhcHMgYSByZXNvbHV0aW9uIGlzCj4gdG8gcGFzcyBFTEYgZmxhZ3MgYWxv
bmcgd2l0aCB0aGUgbWFjaGluZSB0eXBlLiBJJ20gbm90IGNsZWFyIGluIHlvdXIKPiBjaGFuZ2Ug
aG93ICIzMl9yaXNjdiIgaXMgZ2VuZXJhdGVkIHRvIHNvbHZlIHRoZSBzYW1lIHByb2JsZW0uIElt
bywKPiBpdCdkIGtpbmQgb2YgYmUgbmljZSBub3QgdG8gaW50cm9kdWNlIG5vdGlvbnMgbGlrZSAi
NjRfYXJtNjQiIGFzIHdlCj4gc2VlbSB0byBiZSBhbHdheXMgbWFwcGluZy9ub3JtYWxpemluZy8u
Li4gdGhlc2UgZGlmZmVyZW50IG5vdGlvbnMgYW5kCj4gdGhleSBmZWVsIGluaGVyZW50bHkgYnJp
dHRsZS4KCk1heWJlIGl0IGlzIGJyaXR0bGU/IEl0IGNvdWxkIGJlIG1hcHBlZCB0byBlX21hY2hp
bmUsIGJ1dCB0aGF0IGp1c3QKbWlnaHQgbm90IGJlIHJlYXNvbmFibGUgdG8gd29yayBpbnRvIHRo
ZSBtZXRob2QgZnJvbSBteSBwYXRjaC4KCj4gCj4gPiBXaGF0IGNhdXNlcyB0aGUgYXJjaCBkaXJl
Y3RvcnkgdG8gYmUgYSBwYWluIGZvciBCYXplbD8gSQo+ID4gZ3Vlc3MgSSBhbSBtb3N0bHkgY29u
ZnVzZWQgd2h5IGl0IG1ha2VzIHNlbnNlIHRvIGNoYW5nZSB0aGUga2VybmVsCj4gPiBNYWtlZmls
ZXMgaW4gb3JkZXIgdG8gYWNjb21pZGF0ZSBhIHJld3JpdGUgb2YgdGhlIGJ1aWxkIHN5c3RlbSBp
biBCYXplbAo+ID4gdGhhdCBpc24ndCBwbGFubmVkIHRvIGJlIHVzZWQgdXBzdHJlYW0uCj4gCj4g
SXQncyBqdXN0IHNvZnR3YXJlIGFuZCBzbyB0aGUgaXNzdWVzIGFyZSByZXNvbHZhYmxlLCBpZSBJ
IGRvbid0IHRoaW5rCj4gYmF6ZWwgc2hvdWxkIGJlIGRldGVybWluaW5nIHdoYXQgaGFwcGVucyB1
cHN0cmVhbSAtIGl0IG1vdGl2YXRlcyBtZSB0bwo+IHNvbWUgZXh0ZW50LiBGb3IgdGhlIGJhemVs
IGJ1aWxkIEkgbmVlZCB0byBtYXRjaCB0aGUgTWFrZWZpbGUgYmVoYXZpb3IKPiB3aXRoIGJpdHMg
b2Ygc2NyaXB0IGNhbGxlZCBnZW5ydWxlLCB0aGUgc2NvcGUgYW5kIHF1YW50aXR5IG9mIHRoZXNl
Cj4gaW5jcmVhc2Ugd2l0aCB0aGUgYXJjaCBkaXJlY3RvcnkgbW9kZWwsIGV4dHJhIGV4ZWN1dGFi
bGVzIHRvIGhhdmUgaW4KPiB0aGUgYnVpbGQgZXRjLiBJIGFsc28gaW1hZ2luZSBjcm9zcyBwbGF0
Zm9ybSBzdHVmZiB3aWxsIGFkZAo+IGNvbXBsZXhpdHksIGxpa2UgbWFwcGluZyBibGF6ZSdzIG5v
dGlvbnMgb2YgbWFjaGluZSB0eXBlIHRvIHRob3NlCj4gaW50cm9kdWNlZCBpbiB5b3VyIGNoYW5n
ZS4gSXQgaXMgYWxsIGEgbG90IG9mIHN0dWZmIGFuZCBJIHRoaW5rIHdoYXQncwo+IGluIHRoZXNl
IGNoYW5nZXMga2VlcHMgdGhpbmdzIGFib3V0IGFzIHNpbXBsZSBhcyB0aGV5IGNhbiBiZS4gSXQn
ZCBiZQo+IG5pY2UgdG8gaW50ZWdyYXRlIHRoZSBiZXN0IGZlYXR1cmVzIG9mIGJvdGggY2hhbmdl
cyBhbmQgSSB0aGluayBzb21lCj4gb2YgdGhlIGVfbWFjaGluZSBzdHVmZiBoZXJlIGNhbiBiZSBh
ZGRlZCBvbnRvIHlvdXIgY2hhbmdlIHRvIGdldCB0aGUKPiBpMzg2L3g4Ni02NCBjYXNlIHRvIHdv
cmsuIEknbSBub3Qgc29sZCBvbiB0aGUgY29tcGxleGl0eSBvZiB0aGUgYnVpbGQKPiBpbiB5b3Vy
IGNoYW5nZXMgdGhvdWdoLCBtdWx0aXBsZSBmaWxlcywgS2J1aWxkIGFuZCBNYWtlZmlsZS5zeXNj
YWxscywKPiB0aGUgYXJjaCBkaXJlY3Rvcnkgbm90IG9wdGlvbmFsbHkgYmVpbmcgYnVpbHQsIGhl
bHBlciBleGVjdXRhYmxlcy4KPiBVbHRpbWF0ZWx5IGl0IGlzIHRoZSBzYW1lIHNoZWxsIGxvZ2lj
IGluIGJvdGggY2hhbmdlcywgYW5kIHlvdXIKPiBwcmV2aW91cyB3b3JrIGxhaWQgb3V0IGFsbCB0
aGUgZ3JvdW5kIHdvcmsgZm9yIHRoaXMgKEknbSB2ZXJ5IGdyYXRlZnVsCj4gZm9yIGl0IDotKSAp
LgoKVGhhbmtzIGZvciBlbGFib3JhdGluZyBvbiB0aGlzISBJIGRvIHdpc2ggd2UgaGFkIG1vcmUg
b2YgdGhpcwpjb252ZXJzYXRpb24gb24gdGhlIG9yaWdpbmFsIHBhdGNoIHNvIHdlIGNvdWxkIGhh
dmUgbW9sZGVkIHRoZSBvcmlnaW5hbApwYXRjaCBjbG9zZXIgdG8gd2hhdCB0aGlzIG9uZSBpcyBk
b2luZy4gSSBrbm93IHlvdSBkaWQgbWVudGlvbiB5b3Ugd291bGQKbGlrZSB0byBnZXQgcmlkIG9m
IHRoZSBhcmNoIGRpcmVjdG9yeSBhcyBmZWVkYmFjayBvbiB0aGF0IHBhdGNoIGJ1dCBJCmhhZG4n
dCByZWFsaXplZCB0aGF0IHRoaXMgd2FzIHRoZSBkaXJlY3Rpb24geW91IHdlcmUgaG9waW5nIHRv
IHRha2UKdGhpcy4gSXQgZG9lcyBzZWVtIGxpa2UgdGhlIGNoYW5nZXMgeW91IGhhdmUgbWFkZSBp
biB0aGlzIHBhdGNoIHdpbGwKbGVhZCB0byBhIHNvbWV0aGluZyB0aGF0IGlzIG1vcmUgcm9idXN0
IGFuZCBzaW1wbGVyIHRvIG1haW50YWluLCBzbyB3ZQpjYW4gbW92ZSBmb3J3YXJkIHdpdGggcmV2
aWV3aW5nIHRoaXMgcGF0Y2ggYW5kIHN0b3AgcmV2aWV3aW5nIHRoZSBvbmUgSQp3cm90ZS4KCi0g
Q2hhcmxpZQoKPiAKPiBUaGFua3MsCj4gSWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
