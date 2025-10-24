Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E84CCD1BF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 15:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aY1EdBBrK+2x8vJpnxXWw/OYqOuF5QZRJdgBSnqmq9Q=; b=kYP50iSMjPokOL
	/5kf0f65MwUYm61K0EiswnR1fZgM8mHtwFdM7DNlvCu7TB+jw8lcC7A+RtLpToFsxt4FpUwF16EL9
	oNFcwC+6URuyVR920v0Vp43yLrgQI8Izygxsw9JPl7RSpjqSTNCoKWVfQ748l3KFXv7h1n1FHj6PX
	exIEBKgKS0yzk2qzdTK36q4FbcFsnJMfwLVweb5i6nGJSyXOD37RGNDqG7K8JrGqGAuTjUGpgh2O4
	QV40TOV9gLPg10L6frckaNy16KWr2x+nTtgKvBT/NPQOEa4ekyqcl6Gw50ktKQCfE2P+oUlPgkY7+
	GVXJtXm0G/N+P00x11cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKAL-00000009shs-2MiD;
	Fri, 24 Oct 2025 15:57:21 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKAI-00000009sgp-3gbN
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 15:57:20 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-42e2c336adcso9390195ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 08:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1761321438; x=1761926238; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWiGG85ath2jzAlAPFhCB5oiKw5XwqI4VvMQg5Ys3AE=;
        b=Y9H9q75gXnHyQVBoIheHGJGNGiS3OJ78renfWOJLBMuhjz4aHubzzCxUGXZFNh66DC
         OkF5i+e5qmc2HCq2lAxt/7U9j4y+kPhx0YXWux+5UOGoKG2ccn3NGP4F4ZGrAe9dygvV
         4dfX5E0cFn5R0JpvIrCsu4DueYuR404k59LUuEcm2r4DV3LFMrRKE5RTuZlsbfyTBh/d
         gCVlX7dPr57T+donqFNjfktNfdebRDPvwMFUVKRPo1q0uVsXrpvqYh4/ySJ7Qr8abmMu
         /5yWf4yAJFuUT7KNCHolP1/3httDYoLsuJdX7FjrydfopadUEJ4tnNwweYnPfuFT8Zc3
         Jbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761321438; x=1761926238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DWiGG85ath2jzAlAPFhCB5oiKw5XwqI4VvMQg5Ys3AE=;
        b=kkY57CoM9MibV3F+FSGsM6zFoUYxTXqo2J/anyXc6Yg/8/XCO0RQNZaKUK4NUlQkGg
         Dl+UlMVwNCFbKqvsGkJ+vKnJ8LwErONohARG+SCLW9Ygt1UTV05SJw08ezPiaM+Nq+eb
         nXl4VzX5K/byBzGv36dOlm+P41xOJl2sXH8hSYomnNQNipQ61/NXSryknp95JbnmVPju
         6IY0WygXmfyoQ/R6YCmRC1uMIQzDqyIfwhoe+d8/mOeiZAp6O1ht/WQhX7/05OYHBvei
         VrK4uJJlpeGNZHjnsJvYBplViNfa1k02Vxvnk5MFBn4Cyt8dcbX0iKRTGoDLXGLpCvze
         VUiQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4mqR5ZOAmuLwF4rrOBSj3/BPUP05LVRnKHQR1Wn6+ASwAB2v02JQ2xV1r7ibmU+GY3HUIhykNTIcaAw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwlAJxWtBTedo5ymfCs6Ie7WUrCjopi/QKaiQYcQbq4CcPdq/y3
	3SzS9BLlHerv6Tz47UYL3SUGbKB9AVI9iXgVd6R2i+nWbGug+aPafsnfXhIZRChEZGVs4SPtidQ
	uh0UGB5/vAlrD63vQf1yn05lJswHt34mRYgUgYZ76FQ==
X-Gm-Gg: ASbGncuHrijZ5NFgVAyD4BrNqsBXSU/Jj2EqHWsSJKIlF2j2jY3dD6RnSmQHocD1/xs
	tDUBRXRQUnvHbLgJqQTkHb7m0uFADev3Et/hNBLuflIS9DLi7gxQcMKgqF9DxTu+d5slA5o1eh9
	q7fjZ9/fgzje+7ETvC4vapzeksm33erUuOzcxb3Yv4Iec6pYvA6GPpDSCgg53FRxbZo+ViSanV9
	JQ4tQnSoScqUa7BVlcK1xKeIxyZlybAO3t8o8Fs6iYIp7EK3SyDJrs5gsQqa5gv6AFQzJ10GOAQ
	RdswS42QbKoJZBq3eLfG15mCFpjj
X-Google-Smtp-Source: AGHT+IHEWvX0kFGAJ7kHIWxzKY5dF/OETQwGko7y9vL4NrCbfZQtWvnUvuQjJv0i7nzg2wW4twAN7C9YdUXGq4v36l4=
X-Received: by 2002:a05:6e02:4711:b0:431:d63a:9203 with SMTP id
 e9e14a558f8ab-431d63a93fbmr101492025ab.19.1761321437606; Fri, 24 Oct 2025
 08:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy1fCCdciZLqmoeWDG_QoOHDi9j0_ZZKYkpGJmWrf14Q-g@mail.gmail.com>
 <20251024133116.73803-1-fangyu.yu@linux.alibaba.com> <CAAhSdy3E7-uC=pwU3c93bj3_xykPnLUcDXgKJtJ0KYeL91tijw@mail.gmail.com>
In-Reply-To: <CAAhSdy3E7-uC=pwU3c93bj3_xykPnLUcDXgKJtJ0KYeL91tijw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 24 Oct 2025 21:27:06 +0530
X-Gm-Features: AWmQ_blSmL4OTf6qXTR2BfjEwNydZe5Z-dw51LCKSd1XhTinIaUMHniok6lfuns
Message-ID: <CAAhSdy1+TLUgi54uiHg7xomUo7tA_rs7Kt6b4OdUCvDQXjZYiQ@mail.gmail.com>
Subject: Re: Re: [PATCH] RISC-V: KVM: Remove automatic I/O mapping for VM_PFNMAP
To: fangyu.yu@linux.alibaba.com
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, atish.patra@linux.dev, 
	guoren@kernel.org, jiangyifei@huawei.com, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, pbonzini@redhat.com, 
	pjw@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_085718_914469_A2E74F66 
X-CRM114-Status: GOOD (  18.64  )
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

T24gRnJpLCBPY3QgMjQsIDIwMjUgYXQgODo1NeKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBPY3QgMjQsIDIwMjUgYXQgNzowMeKAr1BNIDxm
YW5neXUueXVAbGludXguYWxpYmFiYS5jb20+IHdyb3RlOgo+ID4KPiA+ID4+IEZyb206IEZhbmd5
dSBZdSA8ZmFuZ3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPj4KPiA+ID4+IEFzIG9mIGNv
bW1pdCBhYWM2ZGI3NWE5ZmMgKCJ2ZmlvL3BjaTogVXNlIHVubWFwX21hcHBpbmdfcmFuZ2UoKSIp
LAo+ID4gPj4gdm1fcGdvZmYgbWF5IG5vIGxvbmdlciBndWFyYW50ZWVkIHRvIGhvbGQgdGhlIFBG
TiBmb3IgVk1fUEZOTUFQCj4gPiA+PiByZWdpb25zLiBVc2luZyB2bWEtPnZtX3Bnb2ZmIHRvIGRl
cml2ZSB0aGUgSFBBIGhlcmUgbWF5IHRoZXJlZm9yZQo+ID4gPj4gcHJvZHVjZSBpbmNvcnJlY3Qg
bWFwcGluZ3MuCj4gPiA+Pgo+ID4gPj4gSW5zdGVhZCwgSS9PIG1hcHBpbmdzIGZvciBzdWNoIHJl
Z2lvbnMgY2FuIGJlIGVzdGFibGlzaGVkIG9uLWRlbWFuZAo+ID4gPj4gZHVyaW5nIGctc3RhZ2Ug
cGFnZSBmYXVsdHMsIG1ha2luZyB0aGUgdXBmcm9udCBpb3JlbWFwIGluIHRoaXMgcGF0aAo+ID4g
Pj4gaXMgdW5uZWNlc3NhcnkuCj4gPiA+Pgo+ID4gPj4gRml4ZXM6IDlkMDVjMWZlZTgzNyAoIlJJ
U0MtVjogS1ZNOiBJbXBsZW1lbnQgc3RhZ2UyIHBhZ2UgdGFibGUgcHJvZ3JhbW1pbmciKQo+ID4g
Pj4gU2lnbmVkLW9mZi1ieTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20+
Cj4gPiA+Cj4gPiA+TEdUTS4KPiA+ID4KPiA+ID5RdWV1ZWQgaXQgYXMgZml4IGZvciBMaW51eC02
LjE4Cj4gPiA+Cj4gPiA+UmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5v
cmc+Cj4gPiA+Cj4gPiA+VGhhbmtzLAo+ID4gPkFudXAKPiA+ID4KPiA+Cj4gPiBIaSBBbnVwOgo+
ID4KPiA+IFRoYW5rcyBmb3IgdGhlIHJldmlldy4KPiA+Cj4gPiBQbGVhc2Ugbm90ZSB0aGF0IHRo
aXMgcGF0Y2ggaGFzIHR3byBidWlsZCB3YXJuaW5ncywgYW5kIEkgaGF2ZSBmaXhlZAo+ID4gb24g
cGF0Y2ggVjI6Cj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI1MTAy
MTE0MjEzMS43ODc5Ni0xLWZhbmd5dS55dUBsaW51eC5hbGliYWJhLmNvbS8KPiA+Cj4KPiBDYW4g
eW91IHNlbmQgYSBzZXBhcmF0ZSBwYXRjaCB3aXRoIEZpeGVzIHRhZyB0byB0aGlzIHBhdGNoPwo+
Cj4gWW91IGNhbiBiYXNlIHRoZSBwYXRjaCBvbiByaXNjdl9rdm1fbmV4dCBicmFuY2ggYXQ6Cj4g
aHR0cHM6Ly9naXRodWIuY29tL2t2bS1yaXNjdi9saW51eC5naXQKPgoKRm9yIHNvbWUgcmVhc29u
LCB5b3VyIHYyIHBhdGNoIG5ldmVyIHNob3dlZCB1cCBpbiBteSBpbmJveCA6KAoKTm8gbmVlZCBm
b3IgYSBzZXBhcmF0ZSBwYXRjaC4gSSBoYXZlIHBpY2tlZCB5b3VyIHYyLgoKUmVnYXJkcywKQW51
cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
