Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8693C5DF86
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 10:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7rxRgn19StyBXmOyixCaddJBjoAGmgYoo5wskoWNWek=; b=1iYJxlxnDHUnQ7
	60sZ3b5+12zHYKQ7+lqmYJ+DF6aoMVXnu6IYZsFEyVAsgaHBV93cNP4/dRZ7Jg0xC39WBAXuKCtCa
	t8jyxPtX1krJLBhIy/BnP70C6K8fUYGFtmyGE2rKJ8nnz7oUkMZg3cCDEleQZ79/MhbPs+ScbF6Mv
	ezuKgtmO6Mca72Se0zV7GhLCvj8uR3hQOwiM6i41izJn828u4rSAD2u+ghI3VNq4H+S8Ip/vsTg4s
	Aj2CPLUo67QDjkwRc8sqRyN5q2lAxy3PNBIiHCwzqXXhk0zZEk+iCnOp9V1z4tgmGVgQi90zvFewU
	2rVwU2PNCXJgkLodXJ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdkP-00000009ZjS-31t8;
	Wed, 19 Aug 2026 10:42:17 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdkL-00000009Zio-1mPl
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 10:42:15 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so930655a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Aug 2026 03:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787136132; x=1787740932; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4i/Wj7VbjVfeq660KhfTJWgWKQG02yPSN0FVJhBIXyM=;
        b=HOC2efwEOkwkhzBrLav9m3yf4jYziWOHCTnKdYNOA4KGwhMK5xzgv/7ocQtHHLldJw
         7NwesruAMSNf8pOGACNiOfHVAp9kEqhLp2oPJbQawhS3w+cJSxAK5gTORM4sP5Gsou9G
         6SngaBeTtJvsmosFOjr7S084s9sDyW868rf7944Bt9BkSgfc0lx2pWCHkJ06fLkY7eBd
         gwx4ZFvrIx+PbjEYqWQalBFe1PH7PyM9g/P/BhN9ghm3GBH1yTqjpvaMEbpjrEop7/Zz
         OQs6C7WcQZNIEBaoFu17OtfTn6fl1w1NpydCc4ZdfcxZ/TFaKN6DKBSvLmmP26A81tZu
         o13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787136132; x=1787740932;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4i/Wj7VbjVfeq660KhfTJWgWKQG02yPSN0FVJhBIXyM=;
        b=jD9CRAm/C2TPc13nh98F/tCqz5LMOttTinjZckHP3CNKKVhUa3HRNdL8ajPVB7uiLn
         RkHDWalNjTbS7oAUoIMiXDZb6KZ6S6yZG6K7mkG5EvywchmcYKBaSdpOVOXRM63ATbW4
         GQPnRMAyKebLM0oKcdvzwDtlacsyZg0Gg6fnLx4Cn7+4iV1N13/vSMuMKmWXTs+/sF+v
         0D/+tT5jU70M5Naan3F/s5z5bro3Pe3DFq1p+JlSxa7LJsqVC2RkIY2SYBb9Jbcy8IJz
         VuZ3havkeTBFzQWCPxi/vrWs7siJXwXv4iuGvx4AoZx7iYGCV+uHgTeVKsQot9sswfao
         9bsw==
X-Forwarded-Encrypted: i=1; AHgh+Rqr005ujLCuLvCEnphx7jzAf6hfi7flcyzY/MRSd+EBPz6xzhx8c6MDmF3vntuMoaI5TYEjkqbrMR4Zqw==@lists.infradead.org
X-Gm-Message-State: AFuF++lHa/CRxNY3DuJAEiJ2iDZdBRiQtJUfxwZqaM1blmePHgBJZiwL
	5ysHfvS8eR87O1YenF8G9U9MyAC9K4EvU/JG3Idqqcdw5d7oa8IPu9zv
X-Gm-Gg: AR+sD12jYeFWmVO9IwenjqyuiZOyhFzO7/T2ruykve8Xlch866tBy2r7jSPbUNqRjGt
	W5C42trclZABj4DskdiRPWFGJHg7vrNCW26nLk9wSdcAVV4N/zjH9eY3Vqu3fuwTuEXKRI60lS8
	2bHovgLfVWJ4AMKapSX3lrX8+Qe97GrE+ALN9JgVr5rO4dtwHWKO38ueh9PD8Z7i7g2DVBsLakF
	cgojLRCZXuDzVI72ZB3bZXf3PgDTWGknPFl3kw7yGd/F9ltKdXrcfBQHuG5MhHRDHo+xlsE1Lx0
	O5aLhkq4ZdpyB336f3Dt71j/ZMbv87jbzd7k9Yiq4RWXWZCRWyhgLDqUdwqQL6oIvrR5ZqleXwo
	sT9AK/7j/11KSnkLH0C+HXVy/KibUkCnadBP4+mtRY8kcW5SbUFNL+BUDq/DL0DaiY7T6QpWnwu
	GDr6UfqDgPK8EqQ6mV9lipRKfnptZZwyPoavYuhcVD+BK0RTMlNh3u/E/Lj11cGeGjuPwJfDyO5
	/B0H4wpNcSj1LJMLGcaxQfjL6CXZd+PAp8nHnOt0dY=
X-Received: by 2002:a17:90b:17c5:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-395814cf6c4mr5225113a91.16.1787136132380;
        Wed, 19 Aug 2026 03:42:12 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb3069csm2609681a91.15.2026.08.19.03.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:42:11 -0700 (PDT)
Date: Wed, 19 Aug 2026 16:12:01 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, thuth@redhat.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <tomo@flapping.org>
Subject: Re: [PATCH] powerpc/bug: Add ARCH_WARN_ASM and refactor
 _EMIT_BUG_ENTRY for Rust support
Message-ID: <aoWG-0xRUhzDiuqg@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260819084825.969116-1-mkchauras@gmail.com>
 <CANiq72n=C68iaxuLVR5dbuBpf2FLMGwH8wtB+d5sNgOTv4BQ7A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANiq72n=C68iaxuLVR5dbuBpf2FLMGwH8wtB+d5sNgOTv4BQ7A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_034213_498912_4CB52A6D 
X-CRM114-Status: GOOD (  13.95  )
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

T24gV2VkLCBBdWcgMTksIDIwMjYgYXQgMTI6MDI6MDFQTSArMDIwMCwgTWlndWVsIE9qZWRhIHdy
b3RlOgo+IE9uIFdlZCwgQXVnIDE5LCAyMDI2IGF0IDEwOjQ44oCvQU0gTXVrZXNoIEt1bWFyIENo
YXVyYXNpeWEgKElCTSkKPiA8bWtjaGF1cmFzQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gVGhp
cyBicmluZ3MgcG93ZXJwYyBpbnRvIGxpbmUgd2l0aCB4ODYsIGFybTY0LCBzMzkwLCBhbmQgcmlz
Y3YsIGFsbCBvZgo+ID4gd2hpY2ggYWxyZWFkeSBkZWZpbmUgQVJDSF9XQVJOX0FTTSBhbmQgQVJD
SF9XQVJOX1JFQUNIQUJMRS4KPiA+Cj4gPiBTdWdnZXN0ZWQtYnk6IEZVSklUQSBUb21vbm9yaSA8
dG9tb0BmbGFwcGluZy5vcmc+Cj4gCj4gU2hvdWxkIHRoaXMgYmUgUmVwb3J0ZWQtYnk/Cj4gClRo
ZSBjaGFuZ2UgaXRzZWxmIGlzIHN1Z2dlc3RlZCBieSBUb21vbm9yaSBzbyBpIHdhcyBub3Qgc3Vy
ZS4KClllYWggdGhlcmUgc2hvdWxkIGJlCgpSZXBvcnRlZC1ieTogTGluayBNYXV2ZSA8bGlua21h
dXZlQGxpbmttYXV2ZS5mcj4KQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvYW5H
NjdRNlk1OWtEcWgtY0BkZXNrdG9wCkZpeGVzOiA3M2I3NDFhZGIyNjQgKCJydXN0OiBBZGQgUG93
ZXJQQyBzdXBwb3J0IikKPiBJbiBhZGRpdGlvbiwgcHJvYmFibHkgd2Ugd2FudCBhIExpbmsgdG8g
dGhlIG9yaWdpbmFsIHJlcG9ydCwgYW5kIGEgRml4ZXMgdGFnLgo+IAo+IElkZWFsbHksIHBsZWFz
ZSBpbmNsdWRlIHRoZSBlcnJvciBtZXNzYWdlIGluIHRoZSBjb21taXQgbWVzc2FnZSAtLSBpdAo+
IGhlbHBzIHRvIHRyaWFnaW5nIGFuZCBhbHNvIHRvIHNlYXJjaCBpdCBsYXRlciBvbiBldGMuCj4g
ClN1cmUgaSdsbCBhZGQgdGhlIGVycm9yIHRvIHRoZSBjb21taXQgbWVzc2FnZSBhbmQgc2VuZCBv
dXQgYSBuZXcKcmV2aXNpb24uCgoKPiBUaGFua3MhCj4gCj4gQ2hlZXJzLAo+IE1pZ3VlbAoKVGhh
bmtzIGZvciB0aGUgcXVpY2sgcmV2aWV3LgoKUmVnYXJkcywKTXVrZXNoCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
