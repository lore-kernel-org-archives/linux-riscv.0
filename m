Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32460606A31C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 02:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QsLzlMl2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=WBrtLAjO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ivkGJNiw/sS46srYMKGF6e6UtKJYOIb1uC59v/Js6Yo=; b=QsLzlMl2DPU9tiMZl6CQWvlmf1
	H9MEeuD3HMbDANTi8ub95A4UYwdgEYEoQ1sa9AQaYb7yhqkYP0oLe4dWvLBbBd9UtZwNX0+S5328r
	XfZLzUR73veiFJmIE4+MTuRRcPNl/HsTPQ7aesU3dylRyQA9zHakT39hn313+yuSclcXb/qqkTkOn
	5N7zIu3EgZmjM59TeHH0dXhDi7YHVSfltPYVONsRneoQuZIOvQMMwbkmJcDf2dnk1y/YbQR/1g3cW
	YZxKXfQ5T4+9JyXBhrhwGsBakHftsDqHLRzX0bs2dP9GDZtsLMh07O6Z3tBATkVoKCcU0J1o6iX4M
	F7LNOcNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmVf-00000000wi7-0su5;
	Mon, 16 Nov 2026 02:31:55 +0000
Received: from outgoing2021.csail.mit.edu ([128.30.2.78])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmVd-00000000whA-0IRf
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 02:31:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6gHWPvZNXm1/ip60eIFXciIe68jdkeSrwUtnZT7TE2Q=; t=1794796313; x=1795660313; 
	b=WBrtLAjOJLRKmT4jxXRNAxuYAXKmKpHMhgx603AvOmDL6OiRiT8uNdOz9j0rDEkCKOdiWIKrRwc
	SBB5S6chg5xLNBAW6B6IFGBqANS5gQuBqkU/UJo6caTFoDAedzB/UpVMBQHAcfVZxJlviZUFeC/zA
	gUxIm0y/B2OPlXCo46jACZDgq5IzL0IvDSzAS489ESVBM4RXnVmderrKArY2fMDP3scjvaeYJUgFz
	r4/uNy2sT1QEh8w1y9Znhgzrked9pAoWCkQm5zbFKJVdOCLpvU0VeSdZhpb18QMdAOs/8Npull2AJ
	o3+rAULqd3wNpvVA7ZVqHdKt3zPurqSTD6YQ==;
Received: from mail-dl1-f45.google.com ([74.125.82.45])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xSmVb-004DGw-Uv
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 21:31:51 -0500
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b244fb7fffso3285569c88.1
        for <linux-riscv@lists.infradead.org>; Sun, 15 Nov 2026 18:31:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGogiBNcDVj0u3L0URxpYielKoEsUAS9i57IHtNBsBK70gaoYXuKJPgTazrABAdyOKWf6BuFa7gsO3l+Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z8s8Wg+zVS+sCXwPPqZmaBmUS5rv8g73ZiNbnuNuuq27bMCbNPU
	2zd501Pv6fO4lqX2SGDT8tO1Zwurgm0Y4xSheLkR/bOtUlIvEiDTWnguWv8L8rNJNAV5fOBEWn6
	SGc1B2rMvdpRqtYGtp5qDf6rF6Y7bqIc=
X-Received: by 2002:a05:7022:290:b0:185:4ad4:3d15 with SMTP id
 a92af1059eb24-1b503068235mr8029692c88.1.1794796311011; Sun, 15 Nov 2026
 18:31:51 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261031161826.858908-1-nickolai@csail.mit.edu>
 <20261031161826.858908-3-nickolai@csail.mit.edu> <auzD6JgYSnW186Bb@Tao-Chiu's-Mac>
In-Reply-To: <auzD6JgYSnW186Bb@Tao-Chiu's-Mac>
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
Date: Sun, 15 Nov 2026 21:31:38 -0500
X-Gmail-Original-Message-ID: <CADGQE7HyKgMpUojhmFJBRD1xLiPaBrc4_60yj=9+4Q6AFC4G=Q@mail.gmail.com>
X-Gm-Features: AclHuK_fTJKor30RYSxlkDn1OTApsOaQoTALBaQe3huilFGKC2-TOlZHcinNap8
Message-ID: <CADGQE7HyKgMpUojhmFJBRD1xLiPaBrc4_60yj=9+4Q6AFC4G=Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] selftests: riscv: test FP state restore when
 rt_sigreturn() faults
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Andy Chiu <andybnac@gmail.com>, 
	Guobin Zhang <guobin.zhang@intel.com>, Deepak Gupta <debug@rivosinc.com>, 
	Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_183153_226840_C3A345D4 
X-CRM114-Status: GOOD (  12.89  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBOb3YgNSwgMjAyNiBhdCAxMjo1OeKAr1BNIEFuZHkgQ2hpdSA8dGNoaXVAdGVuc3Rv
cnJlbnQuY29tPiB3cm90ZToKPgo+IEhpIE5pY2tvbGFpLAo+Cj4gT24gU2F0LCBPY3QgMzEsIDIw
MjYgYXQgMTI6MTg6MjZQTSAtMDQwMCwgTmlja29sYWkgWmVsZG92aWNoIHdyb3RlOgo+ID4gQWRk
IGEgdGVzdCBmb3IgdGhlIHByZXZpb3VzIHBhdGNoOiB0aGUgc2lnbmFsIGZyYW1lIHNpdHMgb24g
YQo+ID4gdXNlcmZhdWx0ZmQgcGFnZSB0aGF0IHRoZSBoYW5kbGVyIGRyb3BzIGFmdGVyIGRpcnR5
aW5nIHRoZSBGUAo+ID4gcmVnaXN0ZXJzLCBzbyBydF9zaWdyZXR1cm4oKSBzbGVlcHMgaW4gdGhl
IG1pZGRsZSBvZiBjb3B5aW5nIHRoZSBGUAo+ID4gcmVnaXN0ZXJzIGZyb20gdGhlIGZyYW1lLiBU
aGUgaW50ZXJydXB0ZWQgY29kZSBtdXN0IGdldCBpdHMgb3duCj4gPiByZWdpc3RlcnMgYmFjay4K
PiA+Cj4gPiBUaGUgdGVzdCBpcyBza2lwcGVkIHdpdGhvdXQgdGhlIEQgZXh0ZW5zaW9uIG9yIHdo
ZW4gdXNlcmZhdWx0ZmQgaXMgbm90Cj4gPiBhdmFpbGFibGUgdG8gdGhlIGNhbGxlci4KPiA+Cj4K
PiBUaGUgdGVzdCBpcyBmYWlsaW5nIG9uIHFlbXUsIHdpdGggb3Igd2l0aG91dCB0aGUgcGF0Y2gg
YXBwbGllZC4KCk9vcHMsIHRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhhdCwgaXQgd2FzIGEgYnVnIGlu
IHRoZSB0ZXN0IChjbGFuZwpwcmVzZXJ2ZWQgdGhlIGxvY2FsIHJlZ2lzdGVyIHZhcmlhYmxlcyB1
bnRpbCB0aGUgaW5saW5lIGFzbSBlY2FsbCwgYnV0CmdjYyBkaWRuJ3QpLiAgU2VuZGluZyBhIHYz
IHdpdGggYSBmaXhlZCB0ZXN0IHRoYXQgZG9lc24ndCBuZWVkbGVzc2x5CnJlbHkgb24gbG9jYWwg
cmVnaXN0ZXIgdmFyaWFibGVzLgoKTmlja29sYWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
