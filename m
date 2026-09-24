Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01522C9830E
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 16:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tvswUFyrc6x5g2mAJNQndLPHsF2xZ7PmHHMNzAM5jU4=; b=4ASbIMGYnCFrZp
	X743ztCxLNxTThvnBb4cxV4y/10cI+gUFeZVfOuz5j1WrVf16UXfpJld8aPl9sBMQIcUlNT4Z/VQI
	I1yZZfYjMt87M+37VYSiE5zQFrmEwFnSpzk03z5VQ69tug41QoaxzmNk2nzThQWd5H5hpREFQugec
	MFR94wXthloxmQohaSin3LKdE2L6icZ3G+OTACUIGTJss29PPNMcb9q12ideYHmT7LyiiH2+zbZ4X
	dxWO+QfYy7cWztaOim0EAwZxA8I7KAt5wnNEl6KKNrlUTMj2VL5BW3eqW7aEKC094a4TJieS5tGeh
	MNRWcAeXF9bbnneIk6UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lw0-0000000BWJC-0p0P;
	Thu, 24 Sep 2026 16:04:32 +0000
Received: from mail-pj2-x18.google.com ([2607:f8b0:4864:39::18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lvy-0000000BWIJ-0Hct
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 16:04:31 +0000
Received: by mail-pj2-x18.google.com with SMTP id d9443c01a7336-2d747ed9866so18247375ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 09:04:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790265868; cv=none;
        d=google.com; s=arc-20260327;
        b=KjBh1k1ORwclx3HoBqnjcdBlj6la/4E1vPdNjN+UlrJ1MkI3fo004NwTM7AgM+1Sph
         mprHIWQJ865Azkh2Zo4i6H7WRmSMdin7drkEPVDwDDqAK2C3NntuR2YzX/IDug+18Qlg
         bTt/EuFUZwpYexPJtPMGjMY2pBzdxCws1G4EIN5Fsf10eE34Bh/DFhrQDBBlALg/XB+g
         iIbNAGH6PYDQD9JbFG+Yn/dHyl6JRdjp8yMU8h5JQsl0ExRifc6s4VmyrG6ne4PMVQsF
         BacONfdZ7tGXtrYB5ibF+hHVQevEwRIqMW2jNDaKHfmdnQL6aHkYLKhKTs+R6CDZIBKC
         SYKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kqi2ANKnW2qvvr8zwDtZcFzCEFjbnOYnIOy4wRTL3RY=;
        fh=2BHq0seowPU4kLBo6oqncz3hgaupJH7+VeChPcu53Dk=;
        b=r5E+64i6S/dvIM/wbQeudZceehw07TjV5D1m6FGLLG6stHO50dj817AU8E+nVg0Ij5
         zStPbslbWWx0oFmtge2x1v3AZSV+HSS+ulqp5qaBvbRkisLeH6Ic9lGFdy4OW9eUzOnW
         IOpLRU111RfsMtlxwujOveqURYPY09sTa0WQA8Ltz0Ak/m1pm7+0xNT3AW0cvmCCv7rQ
         03RNjjb4+ZkYuWdL3MIeoUJzkPe0Q2ltXJ5mD0oyc5CFRpHReFjzAWeUHh7Gq1qzJ5sD
         gGY7GZtbDd/lWliX0Rr+BqNjUI+QpCgKgvS3Nl/Bfb0pVXQ8NjlhYSlsIjCMQd3C57iw
         Yvjw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790265868; x=1790870668; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kqi2ANKnW2qvvr8zwDtZcFzCEFjbnOYnIOy4wRTL3RY=;
        b=dJg8LhCEvy5oRTQ8fYwXCsVKCDSunM2dlB7+Z0KSfZaoji+/xAWByzj2VSq/0jjPXW
         RVtYu2W8fmyJgaq50m6HLcGAGduRYfca25dGanyXr9J25Zf+bCmapO8hJCVLe6REwuu9
         5LkWtlMllItR1e5UyvpDh/QVo6+/xLdVqeXCXrIvzKxoX/5MDE9mm1PmTf9TJ6bwqckA
         WF10avjhbYicXRNDSP8t5QphmDbaWIc2/7bI+s+mC9mhPyEU62Ze3kRklRHS+TZ6Q63i
         3fRETVGv8Xg2gv463huYk98GX8eyVtITgDHeZbvcFYOCE+QFdms7unALGlFliwnEY7Zp
         jhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790265868; x=1790870668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kqi2ANKnW2qvvr8zwDtZcFzCEFjbnOYnIOy4wRTL3RY=;
        b=UqQ8nexQsitt1l0TdUOo5zTgzM94BxGXIJVZ2Iy8RJsnz76me4In9lYPXncb99rOgX
         l56lde6VIMGQ5HsuPJn46L7j2R+MEEAZ9rWHMlnEUDj5Tnnf/Ifl5Z4ZVcNNiahYDyfa
         4FFeJOALsGxYLkmLiR86YNI37oUd9v3ySftUvJSoEBZpT8JD2YdxcsCxcEhanUR3Ok06
         nO2VohCONi+UL0IUR/2v2I5EX/QKBQ8j6bT7fZT7rIYYwuHJvX3etdth7wnoTwyiPEeA
         m7GvnhkSRCZm+Cg54nz/xaaBj8mTYKkVZ+6WqF31uKY1ABXbCy2LaBB1aQQ3xK+tD5Rf
         /spA==
X-Forwarded-Encrypted: i=1; AKwUvBwCPWmBLKXE+JzJV0202Vn37syiNocpuJKyCdKAvrOVT5P5mqH5hOFQ0+PMrMT1XZWmv9IuZAeirZW5Hw==@lists.infradead.org
X-Gm-Message-State: AFuF++la6RZ9AZBSVD8YZBD4+VSUhYOmq1fjETBqTeqG5DM7GSN2N8Xp
	1UPMzEUbAWkeJrticSHyDvvAEgQGq72QtcwBp2nMfcKUOnnqxK+hWMnhtmNkOh0KZyJrhe9axYv
	Ka0zn77OHYchY/hThhU3Py7HOj8M/Iyg=
X-Gm-Gg: AYBFou1jSIPLs4pL+HewJ368hlPbiS+/mNYnKseW/EsXLiUJQRN/wG7oiSCOG2efTZY
	32hfUe5WuSUYydnj82Bs4ZPB+qxkSS+Dx/iJze0TnzsMwspkUkrnuUvQNAXL04Qq1gL1DRzsAPc
	dQ24fM+0s9kiHc2gtNJpUcP8hlMBDATHijEC7BZZY5jJPTywbEQ7ADC+0UXHV7u+1/YVwikQCLL
	aTjZNBU9H2Fp2nX8odw1NZ66BHE3kJTRB9Sz6PbRAeCfbzJQbGWkRy3/g0rAJct66piVf25Yw84
	Di2FNJdAQFIWohsAqYHnWKMgkxM6vulCnvqgnchhsCWp3kXtHEPO6K66tkc1gyxusAOAdGKk+FN
	LwdUCmy4AYWVtdwPGaMDFwASK0xgYw6b8lMP73ULZupBSO/T3Ixo=
X-Received: by 2002:a17:903:228c:b0:2dd:68a4:16f1 with SMTP id
 d9443c01a7336-2df7da5e2e2mr29161885ad.11.1790265867984; Thu, 24 Sep 2026
 09:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260924110054.1553880-1-lgs201920130244@gmail.com>
In-Reply-To: <20260924110054.1553880-1-lgs201920130244@gmail.com>
From: Felix Gu <ustc.gu@gmail.com>
Date: Fri, 25 Sep 2026 00:04:16 +0800
X-Gm-Features: AclHuK-5-ik7DCNqbXRBBn79KX4N90FkMwdKIx-DAhcczRvnhM_JJvyNUphu-t0
Message-ID: <CAN4SLj2Rf2jT3tkQNexBueqLy4DMEppqj0V+BPTw02D6vzeyKg@mail.gmail.com>
Subject: Re: [PATCH] soc: mpfs: use kref cleanup on probe failure
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: conor.dooley@microchip.com, daire.mcnamara@microchip.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_090430_129770_87E32252 
X-CRM114-Status: GOOD (  17.48  )
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

SGkgR3VhbmdzaHVvLAoKT24gVGh1LCBTZXAgMjQsIDIwMjYgYXQgNzowMeKAr1BNIEd1YW5nc2h1
byBMaSA8bGdzMjAxOTIwMTMwMjQ0QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBZnRlciBrcmVmX2lu
aXQoKSwgdGhlIGRldmljZV9nZXRfbWF0Y2hfZGF0YSgpIGZhaWx1cmUgcGF0aCBqdW1wcyB0bwo+
IG91dF9mcmVlX2NoYW5uZWwuIFRoYXQgcGF0aCBmcmVlcyB0aGUgbWFpbGJveCBjaGFubmVsIGFu
ZCB0aGVuIGZhbGxzCj4gdGhyb3VnaCB0byBrZnJlZSgpLCBieXBhc3NpbmcgbXBmc19zeXNfY29u
dHJvbGxlcl9wdXQoKSBmb3IgdGhlIGluaXRpYWwKPiByZWZlcmVuY2UuCj4KPiBDYWxsIG1wZnNf
c3lzX2NvbnRyb2xsZXJfcHV0KCkgb24gdGhhdCBwYXRoIGFuZCByZXR1cm4gaW1tZWRpYXRlbHku
IFRoZQo+IGV4aXN0aW5nIGtyZWYgcmVsZWFzZSBjYWxsYmFjayB0aGVuIHBlcmZvcm1zIHRoZSBt
YXRjaGluZyBjbGVhbnVwLCBhbmQKPiB0aGUgcmV0dXJuIHByZXZlbnRzIGEgc2Vjb25kIGZyZWUg
dGhyb3VnaCBvdXRfZnJlZS4gVGhpcyBpcyB0aGUgbWluaW1hbAo+IGNoYW5nZSBuZWVkZWQgdG8g
a2VlcCB0aGUgaW5pdGlhbGl6ZWQgbGlmZXRpbWUgYmFsYW5jZWQuCj4KCkkgZG9uJ3QgdGhpbmsg
dGhpcyBpcyBhIGZpeC4gIG1wZnNfc3lzX2NvbnRyb2xsZXJfcHV0KCkgZG9lcyB0aGUgc2FtZQpt
Ym94X2ZyZWVfY2hhbm5lbCgpICsga2ZyZWUoKSB0aGUgY3VycmVudCBwYXRoIGFscmVhZHkgZG9l
cy4KCj4gRml4ZXM6IDc1ZWYyMzM5NzU1OCAoInNvYzogbWljcm9jaGlwOiBtcGZzLXN5cy1jb250
cm9sbGVyOiBmaXggcmVzb3VyY2UgbGVhayBvbiBwcm9iZSBlcnJvciIpCj4gLS0tCj4gIGRyaXZl
cnMvc29jL21pY3JvY2hpcC9tcGZzLXN5cy1jb250cm9sbGVyLmMgfCAzICsrLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9zb2MvbWljcm9jaGlwL21wZnMtc3lzLWNvbnRyb2xsZXIuYyBiL2RyaXZlcnMvc29j
L21pY3JvY2hpcC9tcGZzLXN5cy1jb250cm9sbGVyLmMKPiBpbmRleCAwNDAwYTAxYjIzMzguLjM3
OWU0ZjY0OWZhYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NvYy9taWNyb2NoaXAvbXBmcy1zeXMt
Y29udHJvbGxlci5jCj4gKysrIGIvZHJpdmVycy9zb2MvbWljcm9jaGlwL21wZnMtc3lzLWNvbnRy
b2xsZXIuYwo+IEBAIC0xNzQsNyArMTc0LDggQEAgc3RhdGljIGludCBtcGZzX3N5c19jb250cm9s
bGVyX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAgICAgICByZXR1cm4g
MDsKPgo+ICBvdXRfZnJlZV9jaGFubmVsOgo+IC0gICAgICAgbWJveF9mcmVlX2NoYW5uZWwoc3lz
X2NvbnRyb2xsZXItPmNoYW4pOwo+ICsgICAgICAgbXBmc19zeXNfY29udHJvbGxlcl9wdXQoc3lz
X2NvbnRyb2xsZXIpOwo+ICsgICAgICAgcmV0dXJuIHJldDsKCklmIHlvdSBkbyBrZWVwIHRoaXMs
IHRoZSBvdXRfZnJlZV9jaGFubmVsIGxhYmVsIG5vIGxvbmdlciBmaXRzLgoKVGhhbmtzLApGZWxp
eAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
