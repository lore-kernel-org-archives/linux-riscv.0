Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44E2C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 May 2023 06:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XK6BMAFn7Y/LHbATC9hiCNfFNfjIOyhNQpiWvTMzSfk=; b=JZJiZEC0Zg6K32
	sxboiCHDSBFdOcJDZfAICgGYYI99/iQ/7xGYCLJ6XqAaci2rtmnaM25UFwELb9Vu0KYLSnvVS706F
	CCMf8a4Stuc8PkgTKiuCFv+8Lch0XKNSFWRH3N1nPTh4Jm4RKr6JKPPVFORYy4DRFY1LIH29hwVv9
	jkBtMhb9LTfo3wCSycl3k+2+1n1HWfJv8vEy/S0ZsWgeeKi9//R4/B7UR7WLCcwPPjbLs/z6TyMlC
	Yov2eCoRLvCGOrX9lYPsFsM3VNmDFM5DF7her1Qt+8Jcak25N0GHJ2qGwzJJha/w+RmobRKPD6k4V
	S4KoutHmGye5Q05zYXQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puojk-009odf-0u;
	Fri, 05 May 2023 06:16:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puoji-009od2-0k
	for linux-riscv@lists.infradead.org;
	Fri, 05 May 2023 06:16:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A151663B55
	for <linux-riscv@lists.infradead.org>; Fri,  5 May 2023 06:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D12C433A1
	for <linux-riscv@lists.infradead.org>; Fri,  5 May 2023 06:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683267368;
	bh=hrper4WhtLjFNY18UGFgjzsA+mCk03IQ4Jteq7M1Jnc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qc1OUzYOL54KzabNb7zVzYcpjXyOq+v6EG5saKsoR7ih6oANfnzED/Xoe0BB6royG
	 zklHltMsn7pTqDXVGkyejcrVlh3k6V9UbrfEgxXbwBSdXhLY4WC9noS9I8Z5jfbwYL
	 F3HBkJGRyliTSOfTx//LdoHhP+HS5376R+UBBcskXy8Zyv+YB5/LnFIIciXfS3Qx2I
	 lmQMqWfOXAWRW4F81ahlxFrN4V7qejrNPvqwLm2r+Z/DDFepy0FmPH+NCg9ejWLXbG
	 YrqfTEuonelu2l8klGacDjUJxY0EZe84ar0di4l9Zkr4hkPxLSpjZvg/XS0ov8Q+Cy
	 NJN2vz3BxJj2w==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-965e93f915aso20470066b.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 May 2023 23:16:08 -0700 (PDT)
X-Gm-Message-State: AC+VfDx2/KvdiDfZRtT+y+QKZfogcxMecKtSrumCXfeMnca1ZnV+QCfI
	SVDnTWd7K+vO/Eu2kZqV2ny+/KsIu6v/G1pcWB8=
X-Google-Smtp-Source: ACHHUZ6RfU0q/eWQU+IF/RV0AY+yhq6TUsivMtMzC8Rgkla6BMNJdv8oIeorZBtaL7imZBSIYYh4jNrIjXnXmgO7NxI=
X-Received: by 2002:a17:907:3f9a:b0:961:be96:b093 with SMTP id
 hr26-20020a1709073f9a00b00961be96b093mr213111ejc.36.1683267366674; Thu, 04
 May 2023 23:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAKXUXMyVeg2kQK_edKHtMD3eADrDK_PKhCSVkMrLDdYgTQQ5rg@mail.gmail.com>
In-Reply-To: <CAKXUXMyVeg2kQK_edKHtMD3eADrDK_PKhCSVkMrLDdYgTQQ5rg@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 5 May 2023 14:15:55 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRNxex0JBMt21HLeHDKh78e9aBEw81Q3TVyb-=CunSH4Q@mail.gmail.com>
Message-ID: <CAJF2gTRNxex0JBMt21HLeHDKh78e9aBEw81Q3TVyb-=CunSH4Q@mail.gmail.com>
Subject: Re: In-flight collision: ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP renaming
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Guo Ren <guoren@linux.alibaba.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	linux-riscv@lists.infradead.org, Linux-MM <linux-mm@kvack.org>, 
	kernel-janitors <kernel-janitors@vger.kernel.org>, Muchun Song <songmuchun@bytedance.com>, 
	Andrew Jones <ajones@ventanamicro.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, 
	Andrew Morton <akpm@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_231610_333786_B01C6A7C 
X-CRM114-Status: GOOD (  16.05  )
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

T24gTW9uLCBBcHIgMjQsIDIwMjMgYXQgNTo0MOKAr1BNIEx1a2FzIEJ1bHdhaG4gPGx1a2FzLmJ1
bHdhaG5AZ21haWwuY29tPiB3cm90ZToKPgo+IERlYXIgR3VvIFJlbiwgZGVhciBQYWxtZXIsCj4K
PiBvbiBsaW51eC1uZXh0LCBJIGhhdmUgbm90aWNlZCB0aGF0IHlvdSBoYXZlIHN1Ym1pdHRlZCBh
bmQgYWRkZWQgdGhlCj4gY29tbWl0IGEzYzdkNmI2NDJlNCAoInJpc2N2OiBtbTogaHVnZXRsYjog
RW5hYmxlCj4gQVJDSF9XQU5UX0hVR0VUTEJfUEFHRV9PUFRJTUlaRV9WTUVNTUFQIiksIHRoYXQg
YWRkcyB0aGUgc2VsZWN0Cj4gQVJDSF9XQU5UX0hVR0VUTEJfUEFHRV9PUFRJTUlaRV9WTUVNTUFQ
IHRvIHRoZSBSSVNDViBjb25maWcuIEFzIGl0Cj4gc2VlbXMsIEFuZWVzaCBLdW1hciBLLlYgaGFz
IGNvbmN1cnJlbnRseSByZW5hbWVkIHRoaXMgY29uZmlnCj4gdGhyb3VnaG91dCB0aGUgdHJlZSB3
aXRoIGNvbW1pdCAyMTUyMThkZGRkMjUgKCJtbS9odWdldGxiX3ZtZW1tYXA6Cj4gcmVuYW1lIEFS
Q0hfV0FOVF9IVUdFVExCX1BBR0VfT1BUSU1JWkVfVk1FTU1BUCIpLCBidXQgeW91ciBjb21taXQg
d2FzCj4gbm90IHZpc2libGUgdG8gdGhhdCByZW5hbWluZy4gV2hlbiBib3RoIGNvbW1pdHMgYXJl
IG1lcmdlZCBpbiBhIGNvbW1vbgo+IHRyZWUtLS1hcyBoYXBwZW5zIHdpdGggbGludXgtbmV4dCwg
YW5kIHdpbGwgc29vbiBoYXBwZW4gd2l0aCBMaW51cycKPiB0cmVlLCB5b3VyIGNvbW1pdCBhM2M3
ZDZiNjQyZTQgd2lsbCBkbyBub3RoaW5nIChzZWxlY3Qgbm8gZXhpc3RpbmcKPiBjb25maWcgYW55
bW9yZSkuCj4KPiBJdCBpcyBlYXN5IHRvIGZpeCwgYWRqdXN0IHRoaXMgb25lIGxpbmUgdG8gdGhl
IHJlbmFtaW5nIGFuZCAnc2VsZWN0Cj4gQVJDSF9XQU5UX09QVElNSVpFX1ZNRU1NQVAnLiBGb3Ig
bm93LCBJIGFtIGp1c3QgcmVwb3J0aW5nIHRvIGxldCB5b3UKPiBrbm93OyBwcm9iYWJseSwgaXQg
aXMgYmVzdCB0byBnZXQgYSBxdWljayBmaXgtdXAgcGF0Y2ggd2l0aCAtcmMyLCBvbmNlCj4gYWxs
IHRoZSBjaGFuZ2VzIGxhbmRlZCBpbiAtcmMxLgpUaHggZm9yIHRha2luZyBjYXJlOyBwbGVhc2Ug
Zml4IHRoYXQuCgo+Cj4KPiBCZXN0IHJlZ2FyZHMsCj4KPiBMdWthcwoKCgotLSAKQmVzdCBSZWdh
cmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
