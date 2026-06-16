Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997AACD98E4
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 19:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wsdx4JY8PKrHctH3B/njg+th1UZZ/tPOh2hJPT/yNpM=; b=sfAEs7TZwHhUWb
	D044kZK9vQ94kqm1E2OHZOGD+e4267N/6M0mXJ8Bn2Gr+0Bmc+w0J5dTtQUTz9WNr4z5F48WCqXWJ
	tS8Wttw0QeGCO6YJZhrug+Xzvu8Q7g7c2gmLWe1RSzCfze6D4xwm2+tVh2m31kQWh7NoNfBtsMltO
	XQDE4RfnPeT5Z5h4m/A71CfdSRZ2Yv9FSQ2q004ga9AW+N4lurXVNS2YvAl5luMCB4xeqSwWxP2rx
	J0C4uNsowgNfuVJuEdGWA2IvJLxBBOoGq57L8cec17v9FFTE6LbsRQO7h41mfZJqSQUfUReJD7Jum
	SvPP/kSwvZ8m+Utht6eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZZpC-0000000GGJ0-42ky;
	Tue, 16 Jun 2026 19:51:54 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZZpA-0000000GGI2-1NYp
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 19:51:53 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4624a44e152so163513f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jun 2026 12:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781639510; x=1782244310; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oopXsR4ZloQpsMUe2KpHNKd/hTq06Y8sLkgS8GBE8k8=;
        b=Mv84w187ktcmdYwTx0mDw06vVu0dhYi1JXVByxwtYs4gs0BBVRSoRykMXEtioMKWz2
         jvJ986RuZtxQ8GN1EPAeiNIIH/MfY3FmPZgHb5dLyDbChSwrX5CDX78rvkKKOrPnDZKw
         N9+rGE0AZtjD/l/l/ucziHWNfhveZUCsMr3XUP0bc5DM7GPOcLdvTnVibZwrbPO1GHcn
         Q67KuICW/WL1iqkQXUCMq1VWNyd6W+v7vVuuDO9/aDpl1TV4Y7Bd1npX4pIbXYmlTVX3
         BSwyMXG/bj7GPEbqzRdAVlIO3rRWv72epGl4dCPGbi20zvfSJSTKS1Y8D47Z5HUmLc0R
         bFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781639510; x=1782244310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oopXsR4ZloQpsMUe2KpHNKd/hTq06Y8sLkgS8GBE8k8=;
        b=lhORj5YpaVsZhgY4EM/GgoCrYl+45+yhLZLim7a+7oFqGAUFGEcbFSv2b48R/waU8w
         kzYH+wuZjXtRpCJnttpVKcrcUQN5Ll2BWA2dr/cs21/dK2BYgEWJ8BDC6e+jkksct9VB
         IFsbHz+bqMhMURXFUTKCwDouorg9oFFty/jN2NSzs46DmmjjFEdPeHXsuplgPJJ4l6Ez
         1uijuKKWxMG1aRW6am2I1oCFXE6PG3Y64+Kh76IzHvqZnCAghaMSEdQYvW3eDvZapsYZ
         wE6mWVi2PTtZxMUW1EMIJbxnWyl9slQwGR47EbgIfZPwwBJDHybq/gF0oCSGyaqIIqWp
         EVgw==
X-Forwarded-Encrypted: i=1; AFNElJ+HnNMFVSzwzMLc8JveBgR5xM429G3R/NPaVDmduRaYMSxhL4Nyz2OVR8Inn6i+b5K0UvwdZcRtWtVxhg==@lists.infradead.org
X-Gm-Message-State: AOJu0YymMeu/qT9nP5F9/Q3LbOFc2A4nQzkCjFe9kl/KMeX0imEbFP8f
	D+i52oLtaiq/a0fMHSnXoA/zIB7T8+5rSOuXEknY8XZuIRCGA/bB6TY7
X-Gm-Gg: Acq92OG9jekUUeM6trML5Eo+TjNnOfSr7pmstjkJN9PyI81+l1Tcb9yzpopCzuSutIE
	IMuNBqomqLTb4AMog20fLaaSzM5XJ8ii/YaFRiPGKHm9y2jnQN60Q3fRJxRZtsIiNj8ThT5yu9i
	kIyoMFakdZTOXMLOO8mUgBmKALlgbUeFj8q++k1KXl9jnVHt/MOKnsCsP+QDf+bB9AIhvT80V7g
	mfyDzbxMsBTSYKU+3fTnSdBN79iOXXtzMjSZ7yw3mb3nzICu7tq8VFx1n6pMY/kUjocAGBx59eG
	CfqGwsauuR4a2Hac3acGf2MY6RoT9Dej+hgJ2qf/NaS4miPzWKnZ5VMrFW/dD7rFp0k6NtNgdSo
	RgKe43Sxa/NN8wMeumjeOdI6DDqoapnhYKyJJwW5I77kII8H0/skNr2zAkdEC7R3wT2EsrbWltJ
	1Yxvs5/ZeIrHtR5iOPSztzW4UjW569Oif6FKA7PB3kl41KSIzkkNBG/SKREkr4
X-Received: by 2002:a5d:6d44:0:b0:460:3234:293f with SMTP id ffacd0b85a97d-4623983b959mr1183937f8f.42.1781639510142;
        Tue, 16 Jun 2026 12:51:50 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619a041986sm22952948f8f.23.2026.06.16.12.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:51:49 -0700 (PDT)
Date: Tue, 16 Jun 2026 20:51:47 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Guo Ren <guoren@kernel.org>
Cc: zhangzhanpeng.jasper@bytedance.com, alex@ghiti.fr,
 aou@eecs.berkeley.edu, cuiyunhui@bytedance.com, iommu@lists.linux.dev,
 joro@8bytes.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, luxu.kernel@bytedance.com,
 palmer@dabbelt.com, pjw@kernel.org, robin.murphy@arm.com,
 tjeznach@rivosinc.com, will@kernel.org, yuanzhu@bytedance.com
Subject: Re: [PATCH v1] iommu/riscv: Support 32-bit register accesses
Message-ID: <20260616205147.6aa7df98@pumpkin>
In-Reply-To: <CAJF2gTTh1zyAZkKt7AQNZptG_H=-8xSum6PVTyxEmw23pN6-9g@mail.gmail.com>
References: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
	<20260615123821.373248-1-guoren@kernel.org>
	<20260616113651.1048a19a@pumpkin>
	<CAJF2gTTh1zyAZkKt7AQNZptG_H=-8xSum6PVTyxEmw23pN6-9g@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_125152_385345_B52B4BDE 
X-CRM114-Status: GOOD (  26.16  )
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

T24gVHVlLCAxNiBKdW4gMjAyNiAyMzo0NzowNSArMDgwMApHdW8gUmVuIDxndW9yZW5Aa2VybmVs
Lm9yZz4gd3JvdGU6Cgo+IE9uIFR1ZSwgSnVuIDE2LCAyMDI2IGF0IDY6MzbigK9QTSBEYXZpZCBM
YWlnaHQKPiA8ZGF2aWQubGFpZ2h0LmxpbnV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24g
TW9uLCAxNSBKdW4gMjAyNiAxMjozODoxNyArMDAwMAo+ID4gR3VvIFJlbiA8Z3VvcmVuQGtlcm5l
bC5vcmc+IHdyb3RlOgo+ID4gIAo+ID4gPiBIaSBaaGFucGVuZyBaaGFuZywgIAo+ID4gLi4gIAo+
ID4gPiAzLiBPbmx5IHBlcmZvcm1hbmNlLW1vbml0b3JpbmcgY291bnRlcnMgcmVxdWlyZSA2NC1i
aXQgSU8gYWNjZXNzIG9yIHRoZQo+ID4gPiBoaWdoLWxvdy1oaWdoIGRvLXdoaWxlIHJldHJ5IHN0
cmF0ZWd5LiBGb3Igb3JkaW5hcnkgc3RhdHVzIGFuZCBjb250cm9sCj4gPiA+IE1NSU8gcmVnaXN0
ZXJzLCBhIHNpbmdsZSByZWFkIGlzIHN1ZmZpY2llbnQuICAKPiA+Cj4gPiBBY3R1YWxseSB0aGlz
IHNlcXVlbmNlIHNob3VsZCBiZSBlbm91Z2ggZm9yIGEgY291bnRlcjoKPiA+ICAgICAgICAgaGkg
PSByZWFkX2hpKCk7Cj4gPiAgICAgICAgIGxvID0gcmVhZF9sbygpOwo+ID4gICAgICAgICBpZiAo
aGkgIT0gcmVhZF9oaSgpKSB7Cj4gPiAgICAgICAgICAgICAgICAgLy8gUGljayBhIHZhbHVlIHRo
YXQgaGFwcGVuZWQgd2hpbGUgZG9pbmcgdGhlIHJlYWRzLgo+ID4gICAgICAgICAgICAgICAgIGhp
Kys7Cj4gPiAgICAgICAgICAgICAgICAgbG8gPSAwOwo+ID4gICAgICAgICB9ICAKPiBUaGlzIGlz
IG5vdCBhIGZyZWUgb3B0aW1pemF0aW9uIOKAlCBpdCBkb2VzIG5vdCBwcmVzZXJ2ZSB0aGUgc2Ft
ZQo+IHNlbWFudGljcyBhcyBhbiBhdG9taWMgNjQtYml0IHJlYWQuIFRoZXJlIGFyZSBhdCBsZWFz
dCB0d28gY29ycmVjdG5lc3MKPiBpc3N1ZXM6Cj4gCj4gMS4gTG9zcyBvZiBwcmVjaXNpb246IElm
IGhpIGNoYW5nZWQgZHVyaW5nIHRoZSByZWFkLCBzZXR0aW5nIGxvID0gMAo+IGRpc2NhcmRzIHRo
ZSBhY3R1YWwgbG8gdmFsdWUuIFRoZSBjb3JyZWN0IGFwcHJvYWNoIGlzIHRvIHJlLXJlYWQgbG8K
PiBhZnRlciBkZXRlY3RpbmcgdGhlIGNoYW5nZSwgbm90IGZhYnJpY2F0ZSBhIHZhbHVlLgo+IAo+
IDIuIE11bHRpcGxlIG92ZXJmbG93czogVGhpcyBhc3N1bWVzIGF0IG1vc3Qgb25lIG92ZXJmbG93
IG9jY3Vycwo+IGJldHdlZW4gcmVhZHMuIElmIHR3byBvdmVyZmxvd3MgaGFwcGVuIChlLmcuLCBk
dWUgdG8gaW50ZXJydXB0Cj4gaW5qZWN0aW9uKSwgaGkrKyB3aWxsIHByb2R1Y2UgYW4gaW5jb3Jy
ZWN0IHJlc3VsdCwgc2lsZW50bHkgY29ycnVwdGluZwo+IHRoZSBjb3VudGVyIHZhbHVlLgo+IAo+
IE5lZ2xpZ2libGUgYmVuZWZpdDogaGkgY2hhbmdpbmcgYmV0d2VlbiByZWFkcyBpcyBhbiBleHRy
ZW1lbHkgcmFyZQo+IGV2ZW50LiBPcHRpbWl6aW5nIGF3YXkgdGhlIHJldHJ5IGxvb3AgZm9yIHN1
Y2ggYSByYXJlIGNhc2UgcHJvdmlkZXMgbm8KPiBtZWFuaW5nZnVsIHBlcmZvcm1hbmNlIGdhaW4u
IEFuZCBpZiBoaSBuZXZlciBzdGFiaWxpemVzLCB0aGF0Cj4gaW5kaWNhdGVzIGEgaGFyZHdhcmUg
ZmFpbHVyZSDigJQgaW4gd2hpY2ggY2FzZSBoYW5naW5nIGluIHRoZSByZXRyeSBsb29wCj4gaXMg
YWN0dWFsbHkgdGhlIG1vcmUgYXBwcm9wcmlhdGUgYmVoYXZpb3IsIGFzIGl0IG1ha2VzIHRoZSBm
YWlsdXJlCj4gdmlzaWJsZSByYXRoZXIgdGhhbiBzaWxlbnRseSBwcm9kdWNpbmcgZ2FyYmFnZSB2
YWx1ZXMuCj4gCj4gVGhlIGhpZ2gtbG93LWhpZ2ggZG8td2hpbGUgcmV0cnkgc3RyYXRlZ3kgZXhp
c3RzIHByZWNpc2VseSB0byBoYW5kbGUKPiB0aGVzZSBjYXNlcyBjb3JyZWN0bHkuIEkgZG9uJ3Qg
dGhpbmsgdGhpcyBwcm9wb3NlZCBzZXF1ZW5jZSBpcyBhIHZhbGlkCj4gcmVwbGFjZW1lbnQuCj4g
CgpUaGUgcG9pbnQgaXMgdGhhdCBpZiB0aGUgdmFsdWUgaXMgYW4gaW5jcmVtZW50aW5nIGNvdW50
ZXIgKG9mIHNvbWUgZm9ybSkKdGhlbiB0aGUgdmFsdWUgaXMgc3RhbGUgYnkgdGhlIHRpbWUgdGhl
IHJlYWRpbmcgc2VxdWVuY2UgY29tcGxldGVzLgpTbyBhbGwgdGhlIGNvZGUgY2FuIGJlIGFzc3Vt
ZWQgdG8gZG8gaXMgcmV0dXJuIGEgdmFsdWUgdGhlIGNvdW50ZXIgaGFkCnNvbWV0aW1lIGJldHdl
ZW4gd2hlbiB0aGUgY29kZSBzdGFydGVkIGFuZCB3aGVuIGl0IGZpbmlzaGVkLgpJZiBoaSBjaGFu
Z2VzIHRoZW4gaGkrMTowIG11c3QgaGF2ZSBoYXBwZW5lZCB3aGlsZSB0aGUgY29kZSB3YXMgcnVu
bmluZwpzbyBpdCBpcyBhIHNhZmUgcmV0dXJuIHZhbHVlLgoKSXQgaXMgbGlrZWx5IHRoYXQgdGhl
IHJlYWRzIGFyZSBhbHNvIG11Y2ggc2xvd2VyIHRoYW4gbWVtb3J5IHJlYWRzLgpJZiBoaSBjaGFu
Z2VzIHJlbGF0aXZlbHkgaW5mcmVxdWVudGx5IChjb21wYXJlZCB0byB0aGUgbnVtYmVyIG9mIHJl
YWRzKQppdCBtYXkgYmUgd29ydGggc2F2aW5nIHRoZSBwcmV2aW91c2x5IHJlYWQgdmFsdWUgYW5k
IGF2b2lkaW5nIHRoZSBzZWNvbmQKcmVhZCBvZiBoaSBpZiBpdCBpcyB0aGUgc2FtZSBhcyB0aGUg
cHJldmlvdXMgcmVhZCBoaSBhbmQgbG8gaGFzIGdvdCBsYXJnZXIuCgoJRGF2aWQKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
