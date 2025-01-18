Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5371C02185
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jan 2025 03:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K8xe/yzLz9pNilUFlzeLPvFpxeRIzG46JA8h2bWCdIg=; b=RrRtzYai0tD/+6
	owUhsErTsi+oLBN8O5+l05jUVtO8Gp2NpJ4n48nRuJmiz4O0smYX2R2k693ZaZm7kzXiN1ziwekhh
	TbeSOuairvmocnSSik2MauB/ggwoFlq8LWiEBToKrmnor5tsNLfImU2PB6qeUqfysNCfamtrb10+r
	6wklfYCI+PF70Thm1ThTKg/IyZu8y8Jkr27jOMdbInzK04MZ0qNTXAy30ZD0FRygoz3TBZF8Wq3kB
	xsiYH+vbMxCmQv2wdevorvVY9tHa7QcITWDLCbmE4AAgVCIId23XgD6O0cbj4w1G+JwWI+yGq347c
	I3h+n2FfWON3ijM3yz5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYzni-00000001nmg-1iNO;
	Sat, 18 Jan 2025 03:47:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYznf-00000001nmA-2nOf
	for linux-riscv@lists.infradead.org;
	Sat, 18 Jan 2025 03:47:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B53325C541F
	for <linux-riscv@lists.infradead.org>; Sat, 18 Jan 2025 03:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4141C4AF0B
	for <linux-riscv@lists.infradead.org>; Sat, 18 Jan 2025 03:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737172025;
	bh=Ltk/YZ4kvA2CUsTMz3d+TXGk+YjrWjqcCe/iNAennxE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lUnBJLU6r9HGcUSS2aTFryllrZK/b3fEK1aasc4tWxpp1rwwQEvZ1atX8w/4R5LsO
	 Z/pnCxp9nKSIutpQGBWY7vP3wCx+lIHKdSTGe/jgtX6cQkQ5AJb7Q+cvUQK5cfztAJ
	 RKLKJ/nFRbeqkSSGpgpusZ54KkryQvX1b16mrOKDR3Cqlo1wQ57JK1KnNh7E0pdpqK
	 y6aS+C3HkDz017bubRsX+op8ZyiwJM7VoRU0+hnQyzc6Nej4XIA8xOISY64qmkaNBS
	 p6rnU/SPXXcrquNzx04qJEHVcq0axj7E3OrrKnzoSCi/wGpKMUTijqa+vWVP+jlom9
	 d4UoYUNUNjJ3Q==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d3d143376dso4153738a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jan 2025 19:47:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXK2vDfBq3WKX7/58ZuikqYHV1z+4TwEy3wYs4rDlbUjwAVKf5mTY6tIohy+Mt2bpATcKTzqMstpkE9Yg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFHx3FstitOGtNT3ezIQ/pYRVh9NPB3r4HDNhCx3HQ8AvCbu+3
	JCNMRzLen8K/DdJSW1i11DthNxkifu+pmxFrMMkvGRFsgsj7MMj/08/RPiHxP2oj8BoichxShyc
	qod6I4jC7oZGSD3WIvw52ULAXRIM=
X-Google-Smtp-Source: AGHT+IHOB9pogUl8oa74wGMk8bSOqoM4SUca80qbQr0cwPYK8SOBSF18Op+STH978Jg+WbIM2pqtTEYRn/E6qWmY6jw=
X-Received: by 2002:a17:906:1759:b0:ab3:a18f:fe7f with SMTP id
 a640c23a62f3a-ab3a1900066mr164870666b.28.1737172024387; Fri, 17 Jan 2025
 19:47:04 -0800 (PST)
MIME-Version: 1.0
References: <20241214143039.4139398-1-guoren@kernel.org> <20241214143039.4139398-2-guoren@kernel.org>
 <Z4q9MDsywT5MrlEa@ghost>
In-Reply-To: <Z4q9MDsywT5MrlEa@ghost>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 18 Jan 2025 11:46:52 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQzvPey8pqsnZ+A2xvNFmb054wdp3+cgnq_p=eq+REBbg@mail.gmail.com>
X-Gm-Features: AbW1kvaztRRBtWoKbMRICEs6wc5VFl6TCE_CyL0OkZuTanFfdIHIKudhEDwD4L0
Message-ID: <CAJF2gTQzvPey8pqsnZ+A2xvNFmb054wdp3+cgnq_p=eq+REBbg@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: Move vendor errata definitions into vendorid_list.h
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: conor@kernel.org, alexghiti@rivosinc.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	bjorn@rivosinc.com, leobras@redhat.com, corbet@lwn.net, 
	peterlin@andestech.com, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_194707_756323_B333EC6D 
X-CRM114-Status: UNSURE (   8.16  )
X-CRM114-Notice: Please train this message.
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

T24gU2F0LCBKYW4gMTgsIDIwMjUgYXQgNDoyN+KAr0FNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCBEZWMgMTQsIDIwMjQgYXQgMDk6MzA6
MzhBTSAtMDUwMCwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiBGcm9tOiBHdW8gUmVuIDxn
dW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPgo+ID4gTW92ZSB2ZW5kb3IgZXJyYXRhIGRlZmlu
aXRpb25zIGludG8gdmVuZG9yaWRfbGlzdCBhbmQgbWFrZSBpdCByZS11c2VhYmxlCj4gPiBmb3Ig
b3RoZXIgaGVhZGVyIGZpbGVzLgo+Cj4gV2h5IGNhbid0IGVycmF0YV9saXN0LmggYmUgaW5jbHVk
ZWQgd2hlcmV2ZXIgdGhlIGVycmF0YSBkZWZpbml0aW9ucyBhcmUKPiBuZWVkZWQ/CmVycmF0YV9s
aXN0LmggY2FuJ3QgYmUgaW5jbHVkZWQgaW4gcndvbmNlLmguCgo+Cj4gLSBDaGFybGllCj4KCgot
LSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
