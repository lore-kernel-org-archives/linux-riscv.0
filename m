Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753B3C3DA4B
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 09:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/N5G6g2/vp/UovD7bz5TCSgexjNCW8W2pPidOIqk1eM=; b=RiYdevVpRxqNl+
	rbxp+HYEpBwCSc2kkATph3bM4zOMWrD9qXl5WQpSjKyntpghNYZ93LHAAVboFqFuZoSO1fegZ3yD5
	xeeZkn7mBKArRnnt2vbnc4uGr9IRVBizdbEovSnO5N42FkjqP27k+SQEChQofHNFIbCvlgwJDrMC1
	CstjKO5Zmsa2Pz6TDkrZ28GTa8hssgodOsyNH2JC0TVZvYWKdWIAlABzt0dbVWvo4BEOXVKKhejau
	2JB9AW4S2SxGLo6cY7bhAVHYuf8+Q18vfydyF9a5f6ZD7Hjk/s3iQZzB6z1O5ulv3Rur5WuHgeu9R
	h5BLPnGhe7YDy3UfXaAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU11q-0000000DKRP-3WvD;
	Wed, 17 Jul 2024 09:32:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU11n-0000000DKPX-0Vsl
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 09:32:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8DA4861451
	for <linux-riscv@lists.infradead.org>; Wed, 17 Jul 2024 09:32:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35AAFC32782
	for <linux-riscv@lists.infradead.org>; Wed, 17 Jul 2024 09:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721208770;
	bh=BPoikN4eZbA2j6qnyQHeGQ3/OcpZNXn5SlombO1h5qQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FsyL02OWCdPudNvDch8VJkS2pL8BXFbouQhrvOES9HNNPe7aVLlXyyeZJwQmAcHbN
	 +nKwa/GfHpp4/GlPOaO1BaY9hvGdoYxPyy2PiRdZc2P+/owYMxB4ySL4vVIL4zV1wi
	 9kt5XFq8flxXCc3X6GAPBhTH8M/IGinUnZdgj0xOrA7sNFKJQoovMsP1sO1YkczafW
	 OJwTaeuB6xkvOptTNk/OKKqWuAJNNgESTTjyPgVOu1BcIqVpeH5XYZQXaM+kDw+qS3
	 qCbLDq4zAzI+fifZvm+LB4+pUTTMOWTwRvMbMANLKcVhDbG1d3wSe2ydWMCEu8p7fq
	 V/LbXCDm4Ln0g==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2eeb1ba040aso88141151fa.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jul 2024 02:32:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSyqSjuLbnU0Zx3AH+ib0BoTB123OmVciwQwM5YETb/JwbwOymuUd/LV48eirzV7s37j/ov2kQ/t9D0Au3hA1PyJKKZwWs0AJ2TdXRV/uz
X-Gm-Message-State: AOJu0Yy0jMcXT/sBF1ELfE36upf8mhfn/w12Zpgki2Af1X5CQEEQ5/7O
	XSshQnMV4bN0ecUf5RhnfURxE0lPjXNubY/IkTIXQK28GXjwyys8HyIf54Dq1pY5VP4VVDUoJTz
	T6sxd2Hbfke8vlqpVa+xOpnY19tE=
X-Google-Smtp-Source: AGHT+IG7M8ib0gDD7vtyWehz0t3NlPOXfHBE2/04rhjPNb3w6EkGrjJ+E+Vh6YALH0AXX9TE2DCx448+9eEQnyUh1yM=
X-Received: by 2002:a05:651c:232:b0:2ee:d5c3:3878 with SMTP id
 38308e7fff4ca-2eefd14cf55mr7287111fa.37.1721208768530; Wed, 17 Jul 2024
 02:32:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240717061957.140712-1-alexghiti@rivosinc.com> <20240717061957.140712-3-alexghiti@rivosinc.com>
In-Reply-To: <20240717061957.140712-3-alexghiti@rivosinc.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 17 Jul 2024 17:32:37 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ2W5c1ObdtOosxsjg6gzfW5qL5LAxh4Fg6dg9aWfczMA@mail.gmail.com>
Message-ID: <CAJF2gTQ2W5c1ObdtOosxsjg6gzfW5qL5LAxh4Fg6dg9aWfczMA@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] dt-bindings: riscv: Add Zabha ISA extension description
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_023251_264262_EB2383B0 
X-CRM114-Status: GOOD (  14.45  )
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

T24gV2VkLCBKdWwgMTcsIDIwMjQgYXQgMjoyMuKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBBZGQgZGVzY3JpcHRpb24gZm9yIHRoZSBaYWJo
YSBJU0EgZXh0ZW5zaW9uIHdoaWNoIHdhcyByYXRpZmllZCBpbiBBcHJpbAo+IDIwMjQuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4g
LS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25z
LnlhbWwgfCA2ICsrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4KPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVu
c2lvbnMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRl
bnNpb25zLnlhbWwKPiBpbmRleCA0NjhjNjQ2MjQ3YWEuLmU2NDM2MjYwYmRlYiAxMDA2NDQKPiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55
YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVu
c2lvbnMueWFtbAo+IEBAIC0xNzEsNiArMTcxLDEyIEBAIHByb3BlcnRpZXM6Cj4gICAgICAgICAg
ICAgIG1lbW9yeSB0eXBlcyBhcyByYXRpZmllZCBpbiB0aGUgMjAxOTEyMTMgdmVyc2lvbiBvZiB0
aGUgcHJpdmlsZWdlZAo+ICAgICAgICAgICAgICBJU0Egc3BlY2lmaWNhdGlvbi4KPgo+ICsgICAg
ICAgIC0gY29uc3Q6IHphYmhhCj4gKyAgICAgICAgICBkZXNjcmlwdGlvbjogfAo+ICsgICAgICAg
ICAgICBUaGUgWmFiaGEgZXh0ZW5zaW9uIGZvciBCeXRlIGFuZCBIYWxmd29yZCBBdG9taWMgTWVt
b3J5IE9wZXJhdGlvbnMKPiArICAgICAgICAgICAgYXMgcmF0aWZpZWQgYXQgY29tbWl0IDQ5ZjQ5
Yzg0MmZmOSAoIlVwZGF0ZSB0byBSYWZpZmllZCBzdGF0ZSIpIG9mCj4gKyAgICAgICAgICAgIHJp
c2N2LXphYmhhLgo+ICsKPiAgICAgICAgICAtIGNvbnN0OiB6YWNhcwo+ICAgICAgICAgICAgZGVz
Y3JpcHRpb246IHwKPiAgICAgICAgICAgICAgVGhlIFphY2FzIGV4dGVuc2lvbiBmb3IgQXRvbWlj
IENvbXBhcmUtYW5kLVN3YXAgKENBUykgaW5zdHJ1Y3Rpb25zCj4gLS0KPiAyLjM5LjIKPgpSZXZp
ZXdlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+CgotLSAKQmVzdCBSZWdhcmRzCiBH
dW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
