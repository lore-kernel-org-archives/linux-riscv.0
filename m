Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30089CD8C8C
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Jun 2026 06:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mLBT/oSotCZqo7wpwIm0IUvF00DiyEliiCFho6jJOEw=; b=zuLfNLytiAGkQ9
	j9FtKUpX42ak7/oVhr2bQpKGNCieRrh+baCzw5d6Bn+KR0GogwAcHgPeSRgOBrmLF8AVRAsR5Vxdv
	3HX2CmEMY7zLhOHst9wbvRuOvUDtS4d143cTmwEKH5hYbz9LVEID8VLBHnBf+dYvhfuAbNhzOvWRp
	JTEcjkpUEiIq3rdJrLwWuS5tatfQbDwTE0bPF0pD2E3m5E0FAaYTZly9XrXEsMwZXINt5rGp5rWgJ
	jGIi2AXje8NsIHKOH4B78HkBFHuThe2OlmVS2dNC5x0nWbdZS2exT+n72PcO5GVCNPqT6bDb6avNd
	T2Na/OiWqK8gKnrem9Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW6sJ-0000000246x-2ag0;
	Sun, 07 Jun 2026 06:20:47 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW6sF-0000000246F-3wMV
	for linux-riscv@lists.infradead.org;
	Sun, 07 Jun 2026 06:20:45 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7e6ec655c80so1769860a34.0
        for <linux-riscv@lists.infradead.org>; Sat, 06 Jun 2026 23:20:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780813242; cv=none;
        d=google.com; s=arc-20240605;
        b=OEHHJnpnWP6M6MeXXgAUMOfAiAmQsGvLoxYtzOBmbwwgXVfjfkd/4uSe1fEJm25PgU
         +fUhyOWteozBe/9VBAsB8jdbnAjOVsWd9jhdvhmCbyPC9x0uxG2h5UtkEUsapN6dlh9/
         EtZXyZiar0AW210sQ2oWxb7EIrgrb0EaX6dEyjmbgilCIn2LcM6pn1EflnuwLPe9uWqW
         NXEG8fL83gryjByhU8/lZM5EQ/a4VDgk1eBT2WsiFsKaA/nurjugNR1NotkIWdIiQdgj
         18eH6KsOxzi4YWWyDW9Y8G3HV1nSj0aip4W0Na+XaQPcrLPEa/2Y7bdOeYhjeJ/furN9
         UXMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vhujZ4A3wvVpGOkzPEzqlti0wTqzoqDWtQRHQ5CXPug=;
        fh=vDgTlml/Eos/cpvAn67X7hO+qVowqpAY+2pmFteIyO0=;
        b=XvwmUQyQ86an6mFsYIkU2mDcNDNBsED7dK0kYxsVdhrnKQQhTGR3j5iScUkoc7lgKD
         t6N9600gPkBEr+sn/v8AH9zs63u4hPgI4n3gWijXu0wPcC5t1sYIih7r3jMf41ktQBXe
         7NZhPxbIeJVTRVC8QFimU+plmyLqzqMdOyKrFftQpatHNuKAJcpsG0KTjANpxVwUe5gS
         OFYE9fSQW/XiFRsqCDyT/R03Xizh+oPPPoSCxMD90WTaIdacLQBvqExuzy1WK8HIT0JL
         WkafMLwtBG9QDyNtZ7toWd6MB9zYPEP2z7PH+B0ugf/zozYRFV71hn1JfOgzTKuRatRL
         EVOA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780813242; x=1781418042; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhujZ4A3wvVpGOkzPEzqlti0wTqzoqDWtQRHQ5CXPug=;
        b=K+sE+rjtnDQpNedG42gHbx45RA6rBnfHNkAZ/CHnNFhDsOEB1u4p5yBHrWXv7t3rqo
         yDmKrp98+o/M6rVYg2crIAFGcJ4uinSCmoxjz5X7IRyoQI31eSI45d0hZRDvH+JTX331
         KPjQKPzcZsYKw0KBxKwIxalxaGbUb2fpzuLeVSIZQK9WMzU8kAvkP3RGSnN6kBAHKew0
         TxNFpzzcmIPhbmyutP2bFo7fxdlqDCTXje/HCcD2bOhjLzulxcy8kx6zkIG4uqWDzbFc
         ipQEmzbGOduNZCxVjGMceihMIjHPX6TiTW96Nmwfqh9eShSXzsvXFue3LZAWX7W5Uzb3
         rsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780813242; x=1781418042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vhujZ4A3wvVpGOkzPEzqlti0wTqzoqDWtQRHQ5CXPug=;
        b=kuDLQayAb0odl0Gxea09M3RQWLzzDxqDH4Rs/d/4S5on1NN2r8m2M2cIT/UPZCVzMD
         X9+tfBWT3E2LPOu7je4Jek+hxYbuMhDBxUsFVXCFDVZS3brmFoFX0DHgehzMyhT2c81E
         uMuDkpwm/xxwot5ElrXt4xxJA5qVoURVfIplqj+gbUmBis7Ayf/trzkIiuTiL2ooaf/h
         OJS6f/hutxycl+cQko0IxFPvZo63HtQJwFqp8LVSpHO+cVkZ7hZzpyXMtWEuwXdfF6Tn
         lFK2K45ePo2E3WkTHsdvMB0ViCk/w4+/F/OqlbSBXkP77/B2wsM5Wg9fYRz3MBLGsm6N
         jy/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+N+F75zXp5Q2NI9sVvvxLXi96Dyh9pH+p/pQJCaoFJNze00tjWzxHODTgHHOJwwlTVTDkQAIymuuFX9A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxseFd6w8pqZnNSCDQd0dzvRPmhptdREpUQhQWCdF9jP3M5NHiA
	jmIo2V+2fCI7iMbMF615USk5ujIteodVsmAdny+8SKGMWfJxdPeNbVJbxkonicRoXoDZzhcEZsp
	PyBMVNBWYW7rVgOeK3diwiUI6Y4M3R6VZuW3FA0idTg==
X-Gm-Gg: Acq92OFoMINAZ2VfEn4Bu8bptl20pnqeGDYTwy9U5kw9tOC9AWiDYKOmYmQw6WZw+/o
	dQEsvJrTlFa1XAvB+JKve266wwS2M6xPgLYM3TFtyDBuSVBtrdL5WZvWOezEAwRYd7Vo6PltixD
	Y8UwXiGN0t/zMvDnOXZXgQgZ3eWtcRNkho0tCUlJTJ1QsE1bFNAClBGGmaS6V/1YtHoitvsLmLI
	L23DWqgYr3GV57TF5+MEWvoNjFE/o8EGPAx/lFPbePDoSU34J+lB3BabQSGYxwRiWd7WeAlyU7r
	7sWwc03Nyf6RdtfSa2C+EZpwNBp+gAJCwX4DmWnd7j2nH4OhOLWxri2iZzmETSWpXs40i4LYYP8
	PCbQb8bxb5xI8CqriOrF3/p6Hk9xvYhD53B1YmQ==
X-Received: by 2002:a4a:ec4b:0:b0:69d:e28e:2fff with SMTP id
 006d021491bc7-69e68c51309mr5003541eaf.40.1780813242384; Sat, 06 Jun 2026
 23:20:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260604230317.30501-1-atwufei@163.com> <20260604230317.30501-2-atwufei@163.com>
In-Reply-To: <20260604230317.30501-2-atwufei@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 7 Jun 2026 11:50:31 +0530
X-Gm-Features: AVVi8CfslfRV_nfpl1lMc7NvFioZQ6rmEDmBn5uL68s_8AeUTuE046d7lHCFWAE
Message-ID: <CAAhSdy3hugWgSPKiuos38-osAFWkvQ3fHph9AMhGQZZAAf+pSw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] RISC-V: KVM: Fix skip of valid pages in kvm_riscv_gstage_wp_range
To: atwufei@163.com
Cc: seanjc@google.com, Atish Patra <atish.patra@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Wu Fei <wu.fei9@sanechips.com.cn>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_232044_123030_19D8D8B4 
X-CRM114-Status: GOOD (  17.09  )
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

T24gRnJpLCBKdW4gNSwgMjAyNiBhdCA0OjMz4oCvQU0gPGF0d3VmZWlAMTYzLmNvbT4gd3JvdGU6
Cj4KPiBGcm9tOiBXdSBGZWkgPHd1LmZlaTlAc2FuZWNoaXBzLmNvbS5jbj4KPgo+IFRoZSBjdXJy
ZW50IGdzdGFnZSByYW5nZSB3YWxrZXIgdW5jb25kaXRpb25hbGx5IGFkdmFuY2VzIGJ5ICdwYWdl
X3NpemUnCj4gd2hlbiBhIGxlYWYgUFRFIGlzIG5vdCBmb3VuZCwgZS5nLiB3aGVuIHRoZSByYW5n
ZSB0byB3cCBpcwo+IFsweGZmZmZmMDFmYzAwMCwgMHhmZmZmZjAyM2MwMDApIGFuZCBwYWdlX3Np
emUgaXMgMk1CLCBpZiBmb3VuZF9sZWFmIG9mCj4gMHhmZmZmZjAxZmMwMDAgcmV0dXJucyBmYWxz
ZSwgaXQgc2tpcCB0aGUgd2hvbGUgcmFuZ2UsIGJ1dCBpdCdzIHBvc3NpYmxlCj4gdG8gaGF2ZSB2
YWxpZCBlbnRyaWVzIGluIFsweGZmZmZmMDIwMDAwMCwgMHhmZmZmZjAyM2MwMDApLgo+Cj4gU2ln
bmVkLW9mZi1ieTogV3UgRmVpIDx3dS5mZWk5QHNhbmVjaGlwcy5jb20uY24+CgpMR1RNLgoKUmV2
aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpRdWV1ZWQgdGhpcyBw
YXRjaCBmb3IgTGludXgtNy4yCgpUaGFua3MsCkFudXAKCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2
bS9nc3RhZ2UuYyB8IDE2ICsrKysrKysrLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2
bS9nc3RhZ2UuYyBiL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jCj4gaW5kZXggZDlmZThiZTJhMTUx
Li4yYjE0MWE3OGVjYWMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMKPiAr
KysgYi9hcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYwo+IEBAIC00MjksMTQgKzQyOSwxNCBAQCB2b2lk
IGt2bV9yaXNjdl9nc3RhZ2Vfd3BfcmFuZ2Uoc3RydWN0IGt2bV9nc3RhZ2UgKmdzdGFnZSwgZ3Bh
X3Qgc3RhcnQsIGdwYV90IGVuZAo+ICAgICAgICAgICAgICAgICBpZiAocmV0KQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGJyZWFrOwo+Cj4gLSAgICAgICAgICAgICAgIGlmICghZm91bmRfbGVh
ZikKPiAtICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG5leHQ7Cj4gLQo+IC0gICAgICAgICAg
ICAgICBhZGRyID0gQUxJR05fRE9XTihhZGRyLCBwYWdlX3NpemUpOwo+IC0gICAgICAgICAgICAg
ICBrdm1fcmlzY3ZfZ3N0YWdlX29wX3B0ZShnc3RhZ2UsIGFkZHIsIHB0ZXAsCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHB0ZXBfbGV2ZWwsIEdTVEFHRV9PUF9XUCk7
Cj4gLW5leHQ6Cj4gLSAgICAgICAgICAgICAgIGFkZHIgKz0gcGFnZV9zaXplOwo+ICsgICAgICAg
ICAgICAgICBpZiAoIWZvdW5kX2xlYWYpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBhZGRy
ID0gQUxJR04oYWRkciArIDEsIHBhZ2Vfc2l6ZSk7Cj4gKyAgICAgICAgICAgICAgIH0gZWxzZSB7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgYWRkciA9IEFMSUdOX0RPV04oYWRkciwgcGFnZV9z
aXplKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBrdm1fcmlzY3ZfZ3N0YWdlX29wX3B0ZShn
c3RhZ2UsIGFkZHIsIHB0ZXAsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcHRlcF9sZXZlbCwgR1NUQUdFX09QX1dQKTsKPiArICAgICAgICAgICAgICAg
ICAgICAgICBhZGRyICs9IHBhZ2Vfc2l6ZTsKPiArICAgICAgICAgICAgICAgfQo+ICAgICAgICAg
fQo+ICB9Cj4KPiAtLQo+IDIuNTEuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
