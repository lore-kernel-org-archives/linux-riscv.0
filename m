Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52753E7C4E2
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 16:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=zz24x0uxQ/0UxLSXzaq/2wdZBXtAsleKXztuvvHXHG0=; b=b6SDDvjybBKN5Xf6IMYO7A/McB
	tVnJtUWRaMiYnvwP9KDkNEJKK4oqxbkVpk+6BDieptwxegTS9RpAdldEU3VvSyn4/tTgk0OFdTaja
	nwFqNZiqRbgmouT1Q0I72PdXtzsRY/VqFhyHu4KGALBQg7qQcovkwSmj2kuUoAeRhb6UET12xSgcd
	ipcjRKMon0/9/HK8hu84la+eAXa3y0/Vl9kzmGcZDqSu/Jtn/+tT4wOvNoAyo2JsFLCXXG3TSoa3G
	Vc9PQtD+dm1WC6dTYgRT0fWogJK1d6Dcpg3aCv9i2/EaStS/3VpWnAkAFXWLGaXusT7WGDt0SCW3d
	lIHyBZ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo4rz-000Uxv-34;
	Wed, 04 Oct 2023 16:37:07 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo4rw-000UwE-06
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 16:37:06 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-694ed84c981so1868693b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 09:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1696437421; x=1697042221; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KBByGH7WLfxooOHCdCARZqpfIQQBFdcDsbHiFKU/Lk4=;
        b=VeesO/HTwXx1KpYd1znozyaP4cIoWihYlELxG78xDt4DbPjRwGP4g/mOM3rMV6aLXK
         chNecQ7LM6tzdGKutYHUSAwPRNE22ssW4dg6Cbscn79xZ4s6vDRRtI3+jQ34kqSeR9ao
         vfRdHBxAqmyeaASNsSzxnft6kPZsB58GShsYsPellToh0FCV5WBlAvR5c4sItf6zRJpE
         baWqkhnqAXn6r4fXhubuYTB/hHn0MsuVBF83efIIQjbJHE9Gf/Tu42xh9U3LNiTzUtUv
         RzIFj9Iir3B5mS+pxoEK/dJBiLLSD6Osa77OKL2qSyx6F6k7saQ8eVzJGaDKFQmZpbVE
         vazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696437421; x=1697042221;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBByGH7WLfxooOHCdCARZqpfIQQBFdcDsbHiFKU/Lk4=;
        b=iArYqWl97sRbOq95sRD+MPs739B22gXMSoyYfNZ9NxHkNBEsLS9QXGcJzyvtsbkm56
         GtUF4BVuTLU/LgGTioUna7q1P6kpz1h37RUturAdrX+txACYYaZJFlYqF5/2DqOzvZZ5
         pCzNTTr5ItIzQYxQYxEve7CQGWAaEFkrsngGuZ2y3LtdniahXNgH2q6hT3Y89XpeyM+p
         xfXgQz9iosnkA2FpHKytugYqwgNy5jGK3j8J4awuNV9vTumpC/hXnt1KO4KAnD/WDZI4
         oqXkoX1EfamYOk28tGuvjtHSkZgkKrb/g9wUR3R5Bs34cYomQFoSuBTZf2uJAAvtvzbb
         KQ9w==
X-Gm-Message-State: AOJu0Ywr0u5ckT4Vv+IgN/lLmFeTXbiUkiow/Mdl0VkE0X5Ien2Ke0Aj
	/JQntH71AqwbOrV6lV74nx0joAdgcmzxrP1i4WM=
X-Google-Smtp-Source: AGHT+IHeF3ptFZw1d8bIM/SHWAP9FEFc1h6dLK/CIBtQtNjlYUixjt9DZxLgYcSIK1sodazHs/r1Yg==
X-Received: by 2002:a05:6a21:8cc5:b0:14c:c393:6af with SMTP id ta5-20020a056a218cc500b0014cc39306afmr2808720pzb.0.1696437420714;
        Wed, 04 Oct 2023 09:37:00 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id jk12-20020a170903330c00b001bc2831e1a8sm3949808plb.80.2023.10.04.09.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 09:37:00 -0700 (PDT)
Date: Wed, 04 Oct 2023 09:37:00 -0700 (PDT)
X-Google-Original-Date: Wed, 04 Oct 2023 09:36:50 PDT (-0700)
Subject: Re: [PATCH -fixes 0/2] Fix set_huge_pte_at()
In-Reply-To: <20231003090443.67a2e2692b68211e05b53248@linux-foundation.org>
CC: alex@ghiti.fr, alexghiti@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, ajones@ventanamicro.com, panqinglin2020@iscas.ac.cn, ryan.roberts@arm.com,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: akpm@linux-foundation.org
Message-ID: <mhng-83247622-bffb-4bbe-8f2f-89dd5badab64@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_093704_287410_4DD2CC92 
X-CRM114-Status: GOOD (  13.23  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAwMyBPY3QgMjAyMyAwOTowNDo0MyBQRFQgKC0wNzAwKSwgYWtwbUBsaW51eC1mb3Vu
ZGF0aW9uLm9yZyB3cm90ZToKPiBPbiBUdWUsIDMgT2N0IDIwMjMgMTc6NDM6MTAgKzAyMDAgQWxl
eGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPiB3cm90ZToKPgo+PiArY2MgQW5kcmV3OiBXb3Vs
ZMKgIHlvdSBtaW5kIHRha2luZyB0aGlzIHBhdGNoc2V0IGluIHlvdXIgdHJlZSBmb3IgdGhlIAo+
PiBuZXh0IHJjPyBUaGlzIHBhdGNoc2V0IGRlcGVuZHMgb24gYSBwcmV2aW91cyBmaXggZm9yIGFy
bTY0IHRoYXQgeW91IAo+PiBtZXJnZWQgaW4gcmM0IHdoaWNoIGlzIG5vdCBpbiB0aGUgcmlzY3Yg
LWZpeGVzIGJyYW5jaCB5ZXQuCj4+IAo+PiBJIHNhdyB3aXRoIFBhbG1lciBhbmQgaGUgc2hvdWxk
IGFjayB0aGlzIHNob3J0bHkuCj4KPiBXZWxsIEkgZ3JhYmJlZCB0aGVtIGludG8gbW0uZ2l0J3Mg
bW0taG90Zml4ZXMtdW5zdGFibGUgcXVldWUuICBBbGwKPiBiZWluZyB3ZWxsIEknbGwgbW92ZSB0
aGVtIGludG8gbW0taG90Zml4ZXMtc3RhYmxlIHdpdGhpbiBhIHdlZWsgdGhlbgo+IGludG8gTGlu
dXMgc2hvcnRseSBhZnRlci4KPgo+IFVubGVzcyBzb21ldGhpbmcgY2hhbmdlcy4gIEl0J3Mgb2Rk
IHRoYXQgdGhlIHJpc2N2IHRyZWUocykgYXJlbid0IHNldAo+IHVwIHRvIG1lcmdlIGZpeGVzIGFn
YWluc3QgLXJjND8KCkl0J3MgbW9zdGx5IHRoYXQgSSBoYXZlIENPVklELCBzbyBldmVyeXRoaW5n
J3Mga2luZCBvZiBhIG1lc3MgcmlnaHQgbm93LgoKQWNrZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxw
YWxtZXJAcml2b3NpbmMuY29tPgoKVGhhbmtzIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
