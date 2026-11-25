Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C382606A32D
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 14:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k2YQ6DoC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V5ojKlhB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k7qoV310uqE7/bQ/XJjTXN+FknCysT5Sfkh+iEdLof8=; b=k2YQ6DoCph0XpQF5Nav9ITcCaR
	y5o52xHNAocpjIu98vbnhTc6qm4LtQu2BYR6NgovudmHwEPbuB9rJjnLzCKLbuN0b8QiWDq3D46B5
	ZCNerhQ5jxPxS673h0Uut/L9/aKXmt1zlItKqV4MMp8etVBfV2FC4K9DnhFgTMcZgPqO/69uPx+s5
	dTMkh9to5J7eAKoSdXzWE5WWYaCi5BSaKZe8Inpon3YeqrfbC5novImckcRwD3m2F2q8esYIxQNRt
	tAidi8V0PN8GnnAhVRpI/sZ+9sc1Kpfn9svcNkDuUXRL+bMs8VJcfCURLqioHm3YVSN0oXWLogiIz
	YU5vM7dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDgM-0000000A6ap-3vDx;
	Wed, 25 Nov 2026 14:09:10 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDgJ-0000000A6Z6-1TW1
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 14:09:08 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-8b335eeb340so50905707b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 06:09:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795615744; cv=none;
        d=google.com; s=arc-20260327;
        b=s5MK6XeH2YbhvdpUV3V5+TMS/r8LEz9sEA08VVyqtMaztTWlvWjuiacMIMKnZjOHXJ
         gGbE2aDTTP1T6qOXdsHUZ9RQiPQQPCrq5Crj0F+XAn7II++lJ9Yjup3C545MO4PwSkS7
         ymGVn3RE6cbDuIvmGgF/lI0Yr15L29prLXZl/eJIR1V3WP5yXn0LM3Y+SgpIDT7aANZt
         oB+guFo/hOTW6BLRKeTBi1JHkKFQ0iVc3uTcwpOfB/ebLQG/h41a1ykkINnuPYPgaxzr
         n1Me7wY5fxkEqdHyERcFvqbRNXkoACm7pk5HomNfSl8DiUkDtutG78J+VmjZ43BX9/pl
         K8Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iLkwGEgoZKDBRJGRawfRikHKQChVaEK1bu7vklD9lCY=;
        fh=8+i79w2Dxg2HcbnQOpD2hZkpCeC42Fq1/wC2UTTuOjA=;
        b=NJJR5LbOFSJac4oGgkWSaMRYQku+LpKtHlnRl0fSApXhJl1LK1a99tl4Tmhtx9pfXs
         RNGD5WrGRKVbuJ/sICNDwLHCWJjR/OEyHUaQeob1m7sJpSVm2Y/fayZUgxvTNEefgr5O
         7G+QZwlevvU3nkES/11ZSQChZouHfk7idkxKeENKvClP93Tf+4d947LUdIkkpU82z7kr
         D7fZ9cAae4oWD7leIsvx19bcDFz1f+Fj58VWLdZmPc7+QtOuqE3aXn88fMBj6hUig1O2
         vPlKHtYm2QU2KBk56jg4MsHpSXRVAS9O+b/LlNWXVtpjalakZ0RINC54MK+hd/FYsXEu
         wsNw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795615744; x=1796220544; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iLkwGEgoZKDBRJGRawfRikHKQChVaEK1bu7vklD9lCY=;
        b=V5ojKlhBiHbd1jfU3Bq6qybOw0fg0pLPVajgm/ZSlDsZjydhyLDtG1ETB8tWkl1uCt
         q4e74ynOwxTZwghANR3ri1yAMoewB/d9bgED/QPOnYAcaywpyyBAXRLJkzGjKreX3pFc
         vglUg2OwJqJk6D1gENCw+DSvzQrS8ZnQA4gUWcpkprED8heE8SPaUoOa9ubk5aSwswpi
         LC1bLDCNFyofdtb6WNe43kJHDhIw3XfPGsrMTyMoSIQDLBu4F8B+dT05D43xFsYZJTKD
         u3p3v/IeHfktTD4+H3xeXI7deUHU7EwFQfrlM+iRAtUaQWQfh4jYDyiwAWSd1mOIO/am
         bOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795615744; x=1796220544;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iLkwGEgoZKDBRJGRawfRikHKQChVaEK1bu7vklD9lCY=;
        b=QzLnmuRLSTsvvXjxn3k45UB3eKJ29+bxan3vB2Qzthfgd9kN4QSDepQYCTLYojheV1
         zzP+e2QRTcP2BLmcrVo8UAoNlppj9n/9NQHjDiUntgondpHETHg0zBk3Z1tvmut5FVRP
         SzYvLdtu55cNjEFyfo8sQke8eC9STu0zZUtX3XD7KsWaqgVhzNOaeUlIMSzCp2ApgGMZ
         u3OXopWXHkMMxlAIvw4zsRdTGyL/hkaOETvVu3o0L9VFZBoAtin67QM1MuBlxYREO1hT
         nnQt/ZdSYLVyhRW5elJ5wHKkiAl91G9aLyc8qsVpCRYUmVe7Lg5ExvA4iBdRuG8yGda/
         0ORw==
X-Forwarded-Encrypted: i=1; AL+hErGmBElLGAM5etYGvTeu0ykVMfH5O4VF+nn2qKuxFdXZtFICTgSk0MuD1SGMujQGZx2arC7W2ZzGgSN+cg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+G6URpjRPxteZEDIobwk1hXdXId6OTxQzRfFsx5x+7flEdWN68
	pJT94B/lc2/JmYqc2pkfWNtwNYIZtZwQOUhsDGv5ZhGV/PuxwVc1Hw/eOpz+vZLrGllB4qQrfcd
	lwx2WbPpMfhH57o4h9IvvhsaMGTU6TT0=
X-Gm-Gg: AZFdTZdg+O6wWYo5a3D0ps+BnnVmIEVkjGN2yrcsuhsLY00zEdepwH8Y2OVHOzGDove
	tKPPFReKYxEahtusQc3jSg8Sjme+6+qaYkVXa8g34ku9wgvAUNZIePOcWZoVqZPiyAa47wSYmM7
	Tn3ii5OSrF5sm0Tua0pkvsw7IopBPAVbu4LgSJTKp+Bj/9EcYYee3sm2hVwl5rSVLb3divWbEre
	7mxJN+XtKYUe3VOE4xdKO4xJaGZbbFV/kJTkQYun/Xwv7C6FEJGuEZFNNW3ztGEqDHomN74kWP8
	nWzwOvyEt+AkCLMjRdvoK60xzFjx4xGiUheFJ4lcRnYK8h4k++dZspboIKD9eLeEiExs17wDj8H
	n/jTOgocZ5RZ0mrXz0RUNT5VA+7KMa0win3zrzBM=
X-Received: by 2002:a05:690c:29b:b0:8b4:d882:4a1c with SMTP id
 00721157ae682-8b5204619cfmr60963077b3.40.1795615743848; Wed, 25 Nov 2026
 06:09:03 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111-pvr-gem-drop-zeroing-v1-1-2dc725857053@baylibre.com>
 <CAKbEznssOrO84z_msOZ0tYjVYkaQ8P+f8uma3PhOF6+zp32Hvw@mail.gmail.com> <5278036d-c939-4726-a591-91c7dbedd431@baylibre.com>
In-Reply-To: <5278036d-c939-4726-a591-91c7dbedd431@baylibre.com>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Wed, 25 Nov 2026 23:08:52 +0900
X-Gm-Features: Aa3M54qOr79PeiutPSDb1eipCMvAo_wgF6iTGw-vGiWO2UW3uE7iANiunQsQyms
Message-ID: <CAKbEznuzRy_sUeqyVoe54QGcvQbcs2cSFXkXE5F6Bb_=3fLeBQ@mail.gmail.com>
Subject: Re: [PATCH] drm/imagination: drop redundant zeroing of new GEM objects
To: Guillaume La Roque <glaroque@baylibre.com>
Cc: Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, imagination@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_060907_506282_93BDD4C4 
X-CRM114-Status: GOOD (  24.23  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgR3VpbGxhdW1lLAoKT24gTW9uLCBOb3YgMjMsIDIwMjYgYXQgMTA6NTXigK9QTSBHdWlsbGF1
bWUgTGEgUm9xdWUKPGdsYXJvcXVlQGJheWxpYnJlLmNvbT4gd3JvdGU6Cgo+ID4gSSdtIG5vdCB2
ZXJ5IGZhbWlsaWFyIHdpdGggc2htZW0sIHNvIEknZCBsaWtlIHRvIGFzazogaXMgdGhpcyB6ZXJv
aW5nCj4gPiBzb21ldGhpbmcgc2htZW0gZ3VhcmFudGVlcywgb3IganVzdCBhIGN1cnJlbnQgaW1w
bGVtZW50YXRpb24gZGV0YWlsPwo+ICBGcm9tIHdoYXQgSSBzZWUgaW4gdGhlIGNvZGUsIGl0IGlz
IGd1YXJhbnRlZWQgYnkgc2htZW0sIG5vdCBqdXN0IGFuCj4gaW1wbGVtZW50YXRpb24gZGV0YWls
LiBUaGUgemVyb2luZyBpcyBkb25lIGluIHNobWVtX2dldF9mb2xpb19nZnAoKToKPgo+ICAgICAg
ICAgICAgaWYgKHNncCAhPSBTR1BfV1JJVEUgJiYgIWZvbGlvX3Rlc3RfdXB0b2RhdGUoZm9saW8p
KSB7Cj4gICAgICAgICAgICAgICAgICAgIGxvbmcgaSwgbiA9IGZvbGlvX25yX3BhZ2VzKGZvbGlv
KTsKPgo+ICAgICAgICAgICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgbjsgaSsrKQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNsZWFyX2hpZ2hwYWdlKGZvbGlvX3BhZ2UoZm9saW8sIGkp
KTsKPiAgICAgICAgICAgICAgICAgICAgZmx1c2hfZGNhY2hlX2ZvbGlvKGZvbGlvKTsKPiAgICAg
ICAgICAgICAgICAgICAgZm9saW9fbWFya191cHRvZGF0ZShmb2xpbyk7Cj4gICAgICAgICAgICB9
Cj4KPiBwdnIgb2JqZWN0cyBnZXQgdGhlaXIgcGFnZXMgdGhyb3VnaCBkcm1fZ2VtX3NobWVtX2dl
dF9wYWdlc19zZ3QoKSAtPgo+IGRybV9nZW1fZ2V0X3BhZ2VzKCkgLT4gc2htZW1fcmVhZF9mb2xp
b19nZnAoKSwgd2hpY2ggdXNlcyBTR1BfQ0FDSEUuCj4gRWFjaCBvYmplY3QgaXMgYSBuZXcgc2ht
ZW0gZmlsZSwgc28gYWxsIGl0cyBmb2xpb3MgYXJlIG5ld2x5IGFsbG9jYXRlZAo+IGFuZCBub3Qg
dXB0b2RhdGUsIGFuZCB0aGV5IGFyZSBhbHdheXMgY2xlYXJlZCBoZXJlLgo+Cj4gcGFuZnJvc3Qg
YW5kIHBhbnRob3IgYWxyZWFkeSByZWx5IG9uIHRoaXMgdG9vLCB0aGV5IG5ldmVyIGNsZWFyIG5l
dwo+IG9iamVjdHMuIFRoZXJlIGlzIGV2ZW4gYSBjb21tZW50IGFib3V0IGl0IGluIHNob3VsZF9t
YXBfd2MoKSBpbiBib3RoCj4gZHJpdmVyczoKPgo+ICAgICAgLyogV2UgY2FuJ3QgZG8gdW5jYWNo
ZWQgbWFwcGluZ3MgaWYgdGhlIGRldmljZSBpcyBjb2hlcmVudCwKPiAgICAgICogYmVjYXVzZSB0
aGUgemVyb2luZyBkb25lIGJ5IHRoZSBzaG1lbSBsYXllciBhdCBwYWdlIGFsbG9jYXRpb24KPiAg
ICAgICogdGltZSBoYXBwZW5zIG9uIGEgY2FjaGVkIG1hcHBpbmcgd2hpY2ggaXNuJ3QgQ1BVLWZs
dXNoZWQgLi4uCj4KPiBGb3IgcHZyIHRoZXJlIGlzIG5vIHByb2JsZW0gd2l0aCB0aGF0OiBjb2hl
cmVudCBkZXZpY2VzIGFsd2F5cyBnZXQKPiBQVlJfQk9fQ1BVX0NBQ0hFRCwgYW5kIG9uIG5vbi1j
b2hlcmVudCBvbmVzIHRoZSB6ZXJvZXMgYXJlIGZsdXNoZWQgYnkKPiBkbWFfbWFwX3NndGFibGUo
KSBhbmQgYnkgdGhlIGRtYV9zeW5jX3NndGFibGVfZm9yX2RldmljZSgpIGFscmVhZHkgZG9uZQo+
IGluIHB2cl9nZW1fb2JqZWN0X2NyZWF0ZSgpLgoKVGhhbmtzLCB0aGF0IG1ha2VzIHNlbnNlLiBG
b2xsb3dpbmcgdGhlIHBhdGggdGhyb3VnaCBzaG1lbSB3YXMgdXNlZnVsCmZvciBtZSBhcyB3ZWxs
LgoKPiA+IFNpbmNlIHRoZSBkcml2ZXIgd291bGQgbm93IHJlbHkgb24gaXQsIGNvdWxkIHlvdSBz
cGVsbCBvdXQgaW4gdGhlCj4gPiBjb21taXQgbWVzc2FnZSB3aGVyZSB0aGUgemVyb2luZyBoYXBw
ZW5zIGFuZCB3aHkgaXQgY2FuIGJlIHJlbGllZCBvbj8KPiA+Cj4gaSB3aWxsIGFkZCB0aGVzZSBk
ZXRhaWwgaW4gY29tbWl0IG1lc3NhZ2UgaW4gdjIgaWYgaXQgbG9vayBvayBmb3IgeW91LgoKWWVz
LCBwbGVhc2UgYWRkIGl0IHRvIHRoZSBjb21taXQgbWVzc2FnZSBpbiB2Mi4gT3RoZXJ3aXNlIExH
VE0uCgpJIGFsc28gdGVzdGVkIGl0IG9uIGEgQmVhZ2xlWS1BSSAoSjcyMlMsIEJYUy00LTY0KTog
dmtjdWJlIHJ1bnMgd2l0aG91dCBpc3N1ZXMuCgpUZXN0ZWQtYnk6IEd5ZXlvdW5nIEJhZWsgPGd5
ZTk3NkBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBHeWV5b3VuZyBCYWVrIDxneWU5NzZAZ21haWwu
Y29tPgoKLS0gClRoYW5rcywKR3lleW91bmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
