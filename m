Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9CBCA1009
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 19:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OjNX9c1Na20oriaSnYXYtxcYiN8XqY6gfGoY60KQh9g=; b=sogSKuDXE19iyq
	zCvdif05GXYbsK7E5R3KLXIxApoIOtu021NqBYK/qZSFYqX2RxgsV/VAikYBa0diiVeYpzArL1kVk
	CfIR4gqpvBcvqm2VED8b2X40hycwREsakV/EgrtTL9SMq3MV1L7RMH1hS1Yg/OL4q+ituMEk+eeLi
	aKhfWyuOP+Nrkvsq9JTL4VrieEbQr+g5gL/sTuk/WAeAUH1t3CZ+4UDOprY7spoKkDhMMe2/fGpuX
	oF6zwJO6nAJeZeI9/cbPc5so60mBHojCaTRXIfDniUr0M2s5I5neRNGzWTGGXEoToXCanJ5n9qfSo
	OezDePI7svQ5LygkptBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utt0Q-00000007QvK-2TfG;
	Wed, 03 Sep 2025 19:18:54 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utoWc-00000006jzc-27Mn
	for linux-riscv@lists.infradead.org;
	Wed, 03 Sep 2025 14:31:52 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3f664c47aafso985975ab.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Sep 2025 07:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1756909909; x=1757514709; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xK1Ixt22UPQpRV6eJF15nySq1ENYn93GAeXzGVGJzQ=;
        b=HS10yvRhALYRTlIYhA3IQOSs3VeFdsMN11ggNjyRTZ7BMolCr7amynq+Vl3Jlp9IUJ
         /KwTmG82xEwyP1U4OBYmbXh167AqNmwr860zWpUoQv5zfn+JMMXLsJdFFR6dwPhV+GW5
         JkuYH0dBbmSS8cQpEWwRDid9nV7WIptR8bLmaL5HKTIxYJti+HTNEiWAefkcPv5y8V/5
         6iplWPyhbstrBhtLYgV3rS8bKhv+rWkk+NEJUAPct8Udy+OI7G8j/88Y2cumNPiYk3z5
         bE6r1ZxI6tXGmitO98U6SJ2ghU2ZB5VEWiHJig61adrEaeTGC5uJ2A23aq8wZHJOEPCe
         0KMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756909909; x=1757514709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xK1Ixt22UPQpRV6eJF15nySq1ENYn93GAeXzGVGJzQ=;
        b=jHM6L1Vi/pT8/NMhMqMHY57Xr/RBhg/FLMeyGhmbR0zPioDwyS1F6bQhK6DaZ71SCo
         /uQ7uKgg7sLnpWe783fGc8ZIvQdf4PhPzWLH+j04D5n81Z++XiU/u56bf5EzHtaDfqHH
         lrCUpbE+h7dANF3FX9daxJBXR7HY5XTQNT0ojroABZRQxSjbHLXXxTL3GbF7w223TGSh
         D2AJYF5K++bkPyFLeF98uzISHYFeSPBTzYzkKHlvo9TGyNvren/QJsPNeIQmfK7oTXqO
         q04CDUcL49bP4i9t++zb6VeHHY1a2iqbKXgZh9bz0MjdEfgQ9EWSN7rOC27OLke9A/YZ
         9mDg==
X-Forwarded-Encrypted: i=1; AJvYcCVcUVSkR1sJbv15DOzJcmSTI10Cf9JzWxfpqotSJq+auCaLAXGeDl57kIzVH4Lk9D3WUuAl6Z1ea+npEw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZLivgSOiSndIYppJM5MvYrtVygcs4gLwSYfWlvXY0Oay3p8m9
	GUz/FrYVTlOEWQpqdlfDuZCrToemhCQo+Ia42VdwZRSLU4VTHICDkQmIuYna3T96kQ02PcVTcAA
	bJncNLY4WBg1V5jkkRyv+ZAYxJPWjujS8oglFPT7aFQ==
X-Gm-Gg: ASbGncv15jkrd60digd1pCF0+hjKNlZirn7kIZowxxPFJzBAEi6zu4N1LAQGEh5r/h5
	sXfYmKoN61GiT6zMUfoNsg2iHxY5wopfgYK3W6X6k1H86wS6K7FKG08OzLSubG0IJOy1iI8kjlA
	+PsJ0sdFYeUpth+Ps1sR/TBlt5ikDSzV2hY3AcC4fRTiEEAbXXMrZvwu0ORhW7/0sGePxcBEI0S
	iqPcGrnjrBKzqD/mGUUB/WDLst1yo2DnnQ2nTyfOZKKaBkaWOAfEhhNyltyVQ==
X-Google-Smtp-Source: AGHT+IEdqptgFgnh5uv2GzzQGJFqAZUOszFTkmnyBR24wl/TgHUrHJeCtE9hinNDxe7tcZMD8cJExtpH41CpN+afzKw=
X-Received: by 2002:a92:ca4a:0:b0:3f2:1a77:4876 with SMTP id
 e9e14a558f8ab-3f4024cb129mr260307905ab.26.1756909909294; Wed, 03 Sep 2025
 07:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756710918.git.dayss1224@gmail.com>
In-Reply-To: <cover.1756710918.git.dayss1224@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 3 Sep 2025 20:01:37 +0530
X-Gm-Features: Ac12FXwG5rgdOIo0vaX3JEvtxdbhO8ebAqv0PdEvBcoUhtsHNdiKMQlA4BgxMFY
Message-ID: <CAAhSdy0DriNa-90QO_YgUbuxrjkDSQ_iTtNVG5ie0h09y2xSHA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] KVM: riscv: selftests: Enable supported test cases
To: dayss1224@gmail.com
Cc: pbonzini@redhat.com, shuah@kernel.org, atish.patra@linux.dev, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_073150_779330_FEBB4980 
X-CRM114-Status: GOOD (  11.07  )
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

T24gTW9uLCBTZXAgMSwgMjAyNSBhdCAxOjA24oCvUE0gPGRheXNzMTIyNEBnbWFpbC5jb20+IHdy
b3RlOgo+Cj4gRnJvbTogRG9uZyBZYW5nIDxkYXlzczEyMjRAZ21haWwuY29tPgo+Cj4gQWRkIHN1
cHBvcnRlZCBLVk0gdGVzdCBjYXNlcyBhbmQgZml4IHRoZSBjb21waWxhdGlvbiBkZXBlbmRlbmNp
ZXMuCj4gLS0tCj4gQ2hhbmdlcyBpbiB2MzoKPiAtIFJlb3JkZXIgcGF0Y2hlcyB0byBmaXggYnVp
bGQgZGVwZW5kZW5jaWVzCj4gLSBTb3J0IGNvbW1vbiBzdXBwb3J0ZWQgdGVzdCBjYXNlcyBhbHBo
YWJldGljYWxseQo+IC0gTW92ZSB1Y2FsbF9jb21tb24uaCBpbmNsdWRlIGZyb20gY29tbW9uIGhl
YWRlciB0byBzcGVjaWZpYyBzb3VyY2UgZmlsZXMKPgo+IENoYW5nZXMgaW4gdjI6Cj4gLSBEZWxl
dGUgc29tZSByZXBlYXQgS1ZNIHRlc3QgY2FzZXMgb24gcmlzY3YKPiAtIEFkZCBtaXNzaW5nIGhl
YWRlcnMgdG8gZml4IHRoZSBidWlsZCBmb3IgbmV3IFJJU0MtViBLVk0gc2VsZnRlc3RzCj4KPiBE
b25nIFlhbmcgKDEpOgo+ICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBZGQgbWlzc2luZyBoZWFk
ZXJzIGZvciBuZXcgdGVzdGNhc2VzCj4KPiBRdWFuIFpob3UgKDIpOgo+ICAgS1ZNOiByaXNjdjog
c2VsZnRlc3RzOiBVc2UgdGhlIGV4aXN0aW5nIFJJU0NWX0ZFTkNFIG1hY3JvIGluCj4gICAgIGBy
c2VxLXJpc2N2LmhgCj4gICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCBjb21tb24gc3VwcG9y
dGVkIHRlc3QgY2FzZXMKClF1ZXVlZCB0aGlzIHNlcmllcyBmb3IgTGludXgtNi4xOAoKVGhhbmtz
LApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
