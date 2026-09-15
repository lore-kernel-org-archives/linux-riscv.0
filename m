Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456BCC88E53
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 09:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EhG4QmhYf7P4snpzvTatD6CujQgoeEcRWgz3tDzxzVc=; b=vmliV5PDU5Kdm6
	dENS5hb8OBl/7jOVXSep37gMORt45vERpfh6p01Bpt3VXf4h+vOmnhVtSprhioZMDjSPSmvcTsonK
	0iFCxqE7CLIktKH6rhhyHCrLz9GgC7WToqvdkcA0n7hepb+iXcZk/OZ/tqfe4VU3QzY2/YcCJIihp
	6UF35oNh+AVAH0aAYh3agk8KGwQ3cT8vW5J4v2BHtmY2v86c7sw2RVjA7whEKlOatqxhcKpMUPBSI
	dHWWZkTnRORDMgbNM0Q6n9HtCoI1iWOs2czFonW1NLkFU297cRNIrTcN/DkZsFQPK8nCuQZubKIAm
	r/27NAubRaAHTZg2iiEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P6J-00000005jiF-07vk;
	Tue, 15 Sep 2026 09:05:15 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P6G-00000005jhG-1kHE
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 09:05:13 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea34f01so25102a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 02:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789463111; x=1790067911; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5OftSuNw6O3AgitXo4CDVX+TOcz6GDkEK6rb5ipL/z0=;
        b=d2Ld/pfMukUPh04tJnbJ9Ad5CR64ublKYzgWZLJeCwFpD/6SsXtc3VfmRH/vXmhnfO
         SesXGH+2g2AOEnjVcZEtdqCUIcQRHwbZqGe0fl5ubbSek2mIoAAzjrUDP1BfY9PgMjeI
         ju2zUtnxcZz1Y9JPyChIxG1iEBpVABITk246Au3w6orWgAbfZBDhC13S6E/zutN2AozG
         fkVkMNqVeBBmuvqwKmjgMAu3qw3GS9S9rwfWwjn9oTCP6R9yDUS9ur1JbYU9wzyTxCne
         pNkR270vrrMp2UNDqCp2fE4SYTmOERBBdr5ewXK8ua1JodvhHnZjRI465AcWPjcIdb8k
         jCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789463111; x=1790067911;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5OftSuNw6O3AgitXo4CDVX+TOcz6GDkEK6rb5ipL/z0=;
        b=ugQ/uBPWtW3ZXwd/MPxLmRKGNLQWjics/qDCSqfSYolq8NsA541glWlyd8IG3u034c
         elHpUawBjosiY+NLYpDTAkbpTM5+5F/s+/xCvtxfFBi8PIQ/RLmTh4yU16EZgrvLlaYD
         5XrmZjLTVENhIAYja1s2ILdUlgF5QBcs0J0jekVSDSPXf042Tb4tA7FdhVXvL1ieE7qW
         +jtuKajI7v7Fz3kTOMpPnhaDBfw1SH5VpgWvwn7WPrjizTxpAhD0IP2f+cdkM3nrqf8l
         //DnQlWQib16w2E9nRIQpyPKHsNdXNLWRzGrkG4m3EpZMZIXZVisyc4bcVZHEHesKpxM
         Ozpw==
X-Forwarded-Encrypted: i=1; AKwUvBzzr6mqlULCLP1QOmi5jAecJEkADUL4iF+Ac/QlWrpZpfEt3JZV2PvrFEjHYQtufv9T+xPrUxC2hx4WeA==@lists.infradead.org
X-Gm-Message-State: AFuF++kMikc1Ya/YI1xE1EKQ/msujr6qGoTUJuQzXH/RO5ul1PjVOXUi
	YTaMTUr03HsRzYia6vEgiveZin5HUVl/2AY2y8LPSBgEhLVbsJ1fTukK
X-Gm-Gg: AYBFou0t7THA4ok1dsmcEFUqt2aI8CJ06DR/Vqbmvqm9OAc7/wYXAOJY96y6koghb+M
	U4V7+ItOYeaOeIf+trWldNeJnWgCmaCLMUZGx7SN5jNSITNvnxWpWQ9HXsOAD9qHwWds6KOJXx8
	Jx2dOZkRwHUPieg55f6SlF/SQ3Atw2tHMWD/YOu1n/Z5ArTbI9+0rexp+dmdN9h+A6tOWZgWmQC
	94Y7A215BY9VQ5VfjYD89pN6TOv6saU3O+Jh7IhYji1DPjvX5Kf2Phv9874/W3+dcedwySktgGG
	0R8afj9CYHZL6O/FfjJ+6FbU+qyOB+zkkfZWed6f+0yo1wQBL+jA7ub1L3f8gICYEjwVdwWJ5qX
	P/ppNDxHzom4NktjAR7bJCD0bsFTLfR2053FK/1LnBlHdUQLw+nKNjdHTw+ZcuGv1y7JU6O7Jap
	+KP7HgfuFee75TrYAioBqLqgCvKG7wtsaRow6gg6DJt/+LhoWjGMj+hjIktowR1UhHBLUIXi8tJ
	ZKdG+jMXCfqnVIEXFqA1QX5wTLmgXiyhvc3VFDsBKtcNfsxDoA9
X-Received: by 2002:a05:6a21:920e:b0:3da:f21a:23ca with SMTP id adf61e73a8af0-3dd52a2a52bmr559662637.22.1789463111413;
        Tue, 15 Sep 2026 02:05:11 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c65a8120sm6495512a12.30.2026.09.15.02.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:05:10 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	mkchauras@gmail.com,
	ynorov@nvidia.com,
	david@davidgow.net,
	joelagnelf@nvidia.com,
	fujita.tomonori@gmail.com,
	linkmauve@linkmauve.fr,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 0/2] powerpc: Add ARCH_WARN_ASM and KUnit tests for Rust WARN() support
Date: Tue, 15 Sep 2026 14:34:51 +0530
Message-ID: <20260915090453.1227034-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_020512_460748_C41CD982 
X-CRM114-Status: GOOD (  14.17  )
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

cG93ZXJwYyBjdXJyZW50bHkgaGFzIG5vIEFSQ0hfV0FSTl9BU00gb3IgQVJDSF9XQVJOX1JFQUNI
QUJMRSBkZWZpbml0aW9ucywKd2hpY2ggY2F1c2VzIFJ1c3Qga2VybmVsIGJ1aWxkcyBvbiBwb3dl
cnBjIHRvIGZhaWwgd2l0aCBhIG1hY3JvIGV4cGFuc2lvbgplcnJvciB3aGVuIHRoZSBnZW5lcmlj
IFJ1c3QgV0FSTigpIGluZnJhc3RydWN0dXJlIHRyaWVzIHRvIGNhbGwKQVJDSF9XQVJOX0FTTSgp
IHRocm91Z2ggZ2VuZXJhdGVkX2FyY2hfd2Fybl9hc20ucnMuUy4gRXZlcnkgb3RoZXIKYXJjaGl0
ZWN0dXJlIHRoYXQgc3VwcG9ydHMgUnVzdCAoeDg2LCBhcm02NCwgczM5MCwgcmlzY3YpIGFscmVh
ZHkgcHJvdmlkZXMKdGhlc2UgZGVmaW5pdGlvbnMuIFRoaXMgc2VyaWVzIGJyaW5ncyBwb3dlcnBj
IGludG8gbGluZS4KClBhdGNoIDEgcmVmYWN0b3JzIF9FTUlUX0JVR19FTlRSWSBpbiBhcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vYnVnLmguClRoZSBvbGQgbWFjcm8gd2FzIGEgcG9zaXRpb25hbC1v
cGVyYW5kIHRlbXBsYXRlIHRoYXQgaGFyZGNvZGVkIHRoZSAxYgpsYWJlbCByZWZlcmVuY2UgYW5k
IGVtYmVkZGVkIC5vcmcvLnByZXZpb3VzIGRpcmVjdGl2ZXMsIG1ha2luZyBpdAppbXBvc3NpYmxl
IHRvIGNvbXBvc2UgYXMgYSBmcmVlIHN0cmluZyBvdXRzaWRlIGFuIGFzbSBvcGVyYW5kIGNvbnRl
eHQuClRoZSByZWZhY3RvcmVkIHZlcnNpb24gdGFrZXMgZXhwbGljaXQgKGxhYmVsLCBmaWxlLCBs
aW5lLCBmbGFncykgYXJndW1lbnRzCnZpYSBzdHJpbmcgY29uY2F0ZW5hdGlvbjsgLm9yZy8ucHJl
dmlvdXMgYXJlIG1vdmVkIHRvIGVhY2ggY2FsbCBzaXRlIHNvCkJVR19FTlRSWSgpIGNhbiBjb250
aW51ZSB0byBwYXNzIHNpemVvZihzdHJ1Y3QgYnVnX2VudHJ5KSBhcyBhbiBhc20Kb3BlcmFuZCB3
aGlsZSBBUkNIX1dBUk5fQVNNIHN1cHBsaWVzIGl0cyBvd24gc2l6ZSBzdHJpbmcuIFdpdGgKX0VN
SVRfQlVHX0VOVFJZIGNvbXBvc2FibGUgYXMgYSBwbGFpbiBzdHJpbmcsIGFkZGluZyBBUkNIX1dB
Uk5fQVNNIGFuZApBUkNIX1dBUk5fUkVBQ0hBQkxFIGlzIHRoZW4gc3RyYWlnaHRmb3J3YXJkLgoK
UGF0Y2ggMiBhZGRzIGZpdmUgS1VuaXQgdGVzdHMgdW5kZXIgQ09ORklHX1JVU1RfQlVHX1BPV0VS
UENfS1VOSVRfVEVTVAooZGVwZW5kcyBvbiBQUEMgJiYgR0VORVJJQ19CVUcsIGNvdmVyaW5nIGJv
dGggcHBjMzIgYW5kIHBwYzY0KSB0aGF0CnZlcmlmeSB0aGUgX19idWdfdGFibGUgZW50cnkgZW1p
dHRlZCBieSBBUkNIX1dBUk5fQVNNIGlzIGNvcnJlY3RseQpmb3JtZWQuIGZpbmRfYnVnKCkgaXMg
Y2FsbGVkIHdpdGggdGhlIGV4YWN0IHZpcnR1YWwgYWRkcmVzcyBvZiB0aGUgdHdpCmluc3RydWN0
aW9uLCBjYXB0dXJlZCBhdCBsaW5rIHRpbWUgdmlhIGEgLmRjLmEgcmVsb2NhdGlvbiBpbiBhCmds
b2JhbF9hc20hIGJsb2NrLiAuZGMuYSBlbWl0cyBhIHBvaW50ZXItd2lkdGggd29yZCAoNCBieXRl
cyBvbiBwcGMzMiwKOCBieXRlcyBvbiBwcGM2NCk7IEJVR19LVU5JVF9UUkFQX0FERFIgaXMgZGVj
bGFyZWQgYXMgdXNpemUgb24gdGhlIFJ1c3QKc2lkZSBzbyB0aGUgc2FtZSB0ZXN0IGNvZGUgaXMg
Y29ycmVjdCBvbiBib3RoLiBUaGUgZml2ZSB0ZXN0cyBjaGVjayB0aGF0CnRoZSBlbnRyeSBpcyBm
b3VuZCwgY2FycmllcyBCVUdGTEFHX1dBUk5JTkcsIHJlY29yZHMgdGhlIHJpZ2h0IHNvdXJjZQpm
aWxlIGFuZCBhIG5vbi16ZXJvIGxpbmUgbnVtYmVyLCBhbmQgdGhhdCB0aGUgdHJhcCBhZGRyZXNz
IGxpZXMgaW4Ka2VybmVsIHRleHQuCgpUaGUgZ2xvYmFsX2FzbSEgYmxvY2sgaXMgc3BsaXQgaW50
byBmb3VyIGNmZy1nYXRlZCB2YXJpYW50cyBjb3ZlcmluZyBhbGwKY29tYmluYXRpb25zIG9mIENP
TkZJR19QUEM2NCB4IENPTkZJR19ERUJVR19CVUdWRVJCT1NFLiBUaGUgc3BsaXQgb24KQ09ORklH
X0RFQlVHX0JVR1ZFUkJPU0UgaXMgbmVjZXNzYXJ5IGJlY2F1c2Ugd2hlbiBpdCBpcyBkaXNhYmxl
ZCwKX0VNSVRfQlVHX0VOVFJZIGRyb3BzIHRoZSBmaWxlIGFuZCBsaW5lIGZpZWxkcyBmcm9tIHRo
ZSBidWcgdGFibGUgZW50cnksCmxlYXZpbmcgdGhlIHtmaWxlfSBhbmQge2xpbmV9IGdsb2JhbF9h
c20hIG9wZXJhbmRzIHVudXNlZCDigJQgd2hpY2ggaXMgYQpoYXJkIGNvbXBpbGUgZXJyb3IgaW4g
UnVzdC4gVGhlIHNwbGl0IG9uIENPTkZJR19QUEM2NCBpcyBuZWNlc3NhcnkKYmVjYXVzZSBjb25j
YXQhKCkgb25seSBhY2NlcHRzIGxpdGVyYWxzIChub3QgZXhwcmVzc2lvbnMpLCBzbyAuYmFsaWdu
CjQgdnMgLmJhbGlnbiA4IG11c3QgYmUgc2VsZWN0ZWQgc3RhdGljYWxseS4KCkNoYW5nZWxvZzoK
VjQgLT4gVjU6CiAtIEZpeGVkIGEgYnVpbGQgZXJyb3Igd2l0aCBERUJVR19CVUdWRVJCT1NFPW4K
IC0gQWRkZWQgYSBsYWJlbCBmb3IgYnVnIGVudHJ5ClY0OiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvMjAyNjA5MTIwNjU5MDIuMjQwMTctMS1ta2NoYXVyYXNAZ21haWwuY29tLwoKVjMgLT4g
VjQ6CiAtIEZpeCBMYWJlbCB3aXRoIGFwcGVuZGluZyBiIGF0IGVuZCAKIC0gQWRkIEtVbml0IHRl
c3QgcGF0Y2guCiAtIFRlc3RlZCBvbiBwcGM2NGxlIHBzZXJpZXM6CiAgIHBhc3M6NSBmYWlsOjAg
c2tpcDowLgogLSBUZXN0ZWQgb24gcHBjMzIgUUVNVSBtYWM5OSBHNDoKICAgcGFzczo1IGZhaWw6
MCBza2lwOjAuCiAtIFRlc3RlZCBvbiBwcGM2NGxlIFFFTVUgcHNlcmllczoKICAgcGFzczo1IGZh
aWw6MCBza2lwOjAuClYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA5MTAxMDA4
MDEuMjE1OTc4NS0yLW1rY2hhdXJhc0BnbWFpbC5jb20KClYyIC0+IFYzOgogLSBBZGQgbGFiZWwg
YXJndW1lbnQgaW4gX0VNSVRfQlVHX0VOVFJZClYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyNjA5MTAwNzEyNTIuMTk1MDQ4OC0yLW1rY2hhdXJhc0BnbWFpbC5jb20KClYxIC0+IFYy
OgotIGNvbW1pdCBtZXNzYWdlIG5vdyBoYXMgZXJyb3IsIGZpeGVzIHRhZyBhbmQgY2xvc2VzIHRh
ZwpWMTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwODE5MDg0ODI1Ljk2OTExNi0x
LW1rY2hhdXJhc0BnbWFpbC5jb20KCk11a2VzaCBLdW1hciBDaGF1cmFzaXlhIChJQk0pICgyKToK
ICBwb3dlcnBjL2J1ZzogQWRkIEFSQ0hfV0FSTl9BU00gYW5kIHJlZmFjdG9yIF9FTUlUX0JVR19F
TlRSWSBmb3IgUnVzdAogICAgc3VwcG9ydAogIHJ1c3Q6IGtlcm5lbDogQWRkIEtVbml0IHRlc3Rz
IGZvciBwb3dlcnBjIEFSQ0hfV0FSTl9BU00gYnVnIHRhYmxlCiAgICBlbWlzc2lvbgoKIGFyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9idWcuaCB8ICAzNiArKysrLS0tCiBydXN0L2tlcm5lbC9LY29u
ZmlnLnRlc3QgICAgICAgfCAgMTMgKysrCiBydXN0L2tlcm5lbC9idWcucnMgICAgICAgICAgICAg
fCAyMjIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQs
IDI1MSBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCi0tIAoyLjU1LjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
