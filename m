Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118D3C4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Apr 2024 02:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J9cYgU0w1nLOj12HRreo9hKk+yTIYSelgzdCqJptzR4=; b=Fl0+XidNcbnJM8
	iz+it+wB/Rs1Q4ijDJADjfL6Jsyoh1ZKibQUCJrYGUdLTY/X1sdcipXUAtXO/v8Ok511hn4nh7x8s
	2oRPotZLP359N8moIZ6yjRwWzsnpIIv8S/Saq6reWDQtEi5cCbcouTR4xuTVS3KnrnDYgqcOuMmMN
	jVnlhWtpeA0W2cvf69mVtZpDDqipy8zShbbtdafatIEE30ofgMkY3xiJ+BLXviAcWiDHGsR7YxpWV
	CSG1+YcLQFDXtSXAyvjEzRRrJAiNs7vcENcARcElVV+BGAv32xugKK4VSEeltC97Bde3VN8zZDO4+
	6XA52A2Ehw2noeF9YB6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvpnc-00000004QR8-0BK1;
	Sun, 14 Apr 2024 02:40:56 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvpnX-00000004QQ3-3tQu
	for linux-riscv@lists.infradead.org;
	Sun, 14 Apr 2024 02:40:54 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-22ed075a629so1345803fac.3
        for <linux-riscv@lists.infradead.org>; Sat, 13 Apr 2024 19:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1713062445; x=1713667245; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wg5h8uRNuNN02FjEj+e/nOQiSG+uVSKaRhJ+VyPOQkA=;
        b=cSOwReJF0AfP7t37E/cT6/OZXOyIFvzk7Ga0Q67eAAtHRk8sOcy3f8ex/1GI4Q2ArI
         bN6oRmn0jmQ2WrL/vWqxvj7k66lmWGLcjTyGktgVsgwEE6WIU5Rr2aKBWtewxSsvehH6
         JPCRBC6F8sKdSeeoWTPednbaJp2YWgvSAr7O/IdaxV+R7w7sJI7OuWuSVj6vDBwsQyLL
         eeFURwqtfW0PbBpmibCIHjT4xx4JAs5e1NZSCVxePHU9fm4ad2hWr4nufJDJayyj1/hl
         qLY9fJqLMw0OzyQbG+jP5Le17mnFrk5dNvl+jCiRJ0hCwSsSrSi5suKAbTTLDT+UrkHV
         iXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713062445; x=1713667245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wg5h8uRNuNN02FjEj+e/nOQiSG+uVSKaRhJ+VyPOQkA=;
        b=Ys1jcPWkSiU3IBT0ZFrTuItEM984KJQZ0Zo08gHlBYjabud0Tp1SYeOPwiaxu9W+1N
         VFVtCIrhk9Suh5Lpg4KOKZOYpm7+gyLefSjYyrN4dMhh7GWDZ+pna1/SuMa/eTaA7hpU
         e/ge0Emvpj9jylERQx6+SaYDkXyEll9SvRp66Hz3/FAMf/rt8IATAUXnpzpU9cqGmAkS
         2hykXlx9dlprc5i6YY/c80baA7xwfIfPefmebsxtO/2S38a3t0WpCwfPtk5uCZZxGa25
         mz2wFII38HOKqEuw8ScW0eeq7o3PEOmWpKYBU7NVL8+/RvoJM/rrbwUTJOO+NzwSiB8U
         xSjw==
X-Forwarded-Encrypted: i=1; AJvYcCU8x8pgZv1BgmCxNNIi+bW30+dsoZtaq3TMJf7iEiHUKVmZOZHiiHXnbTcttsHoRFGI8SzAlKfEQkx3m0Y3NHPTCDL91dKzzf+wht1VhtUN
X-Gm-Message-State: AOJu0YxOHXFDvhXecy843FqTJiQUGA8oNtQZM+LGl/aduPmIzLOBBfR/
	BmEsTHP1jN4NogjqN1vru5327PtAn8r0eyFiiEg3y+/gCENuBNZmC/R6krN+ICnugAqNMXyJ+K9
	iqt2Wn8ryBePx6oqdfSk2S3pjC1JH3o0gn6UT1o53uomfGS7FWgo=
X-Google-Smtp-Source: AGHT+IGG1vbolPF8XedWyN268VhRLxaCyGKWzCADzcv/mukMs/gFqjPg6R/T4v4fW1herfdfnjmDrf4faIvQBZtWKe8=
X-Received: by 2002:a05:6871:322f:b0:21e:9aa5:f3f7 with SMTP id
 mo47-20020a056871322f00b0021e9aa5f3f7mr5658929oac.58.1713062445707; Sat, 13
 Apr 2024 19:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240407123829.36474-1-cuiyunhui@bytedance.com>
 <abd135fa-c432-4e37-9792-07a0e17e93d5@arm.com> <CAEEQ3w=+C2J0ZS227-1P-B+pe_NRp_3i4c4CxGssiKqbpXx_qw@mail.gmail.com>
 <2cde00c8-7878-45c0-8621-fca4e70c75e7@arm.com> <ZhlcYRolZwm7UwJu@bogus> <Zhlg67dbl_S1GD0u@bogus>
In-Reply-To: <Zhlg67dbl_S1GD0u@bogus>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Sun, 14 Apr 2024 10:40:34 +0800
Message-ID: <CAEEQ3w=VrQRammHcKBhT=YGPTZ=ktK9PDhLCBM9ODpYMJw_=-Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/2] ACPI: PPTT: Populate cacheinfo
 entirely with PPTT
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Jeremy Linton <jeremy.linton@arm.com>, rafael@kernel.org, lenb@kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_194052_166594_F507EA87 
X-CRM114-Status: GOOD (  14.60  )
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

SGkgU3VkZWVw77yMSmVyZW1577yMCgpPbiBTYXQsIEFwciAxMywgMjAyNCBhdCAxMjoyN+KAr0FN
IFN1ZGVlcCBIb2xsYSA8c3VkZWVwLmhvbGxhQGFybS5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBB
cHIgMTIsIDIwMjQgYXQgMDU6MDg6MDFQTSArMDEwMCwgU3VkZWVwIEhvbGxhIHdyb3RlOgo+ID4g
ZGlmZiAtLWdpdCBpL2FyY2gvcmlzY3Yva2VybmVsL2NhY2hlaW5mby5jIHcvYXJjaC9yaXNjdi9r
ZXJuZWwvY2FjaGVpbmZvLmMKPiA+IGluZGV4IDA5ZTliODgxMTBkMS4uOTJhYjczZWQ1MjM0IDEw
MDY0NAo+ID4gLS0tIGkvYXJjaC9yaXNjdi9rZXJuZWwvY2FjaGVpbmZvLmMKPiA+ICsrKyB3L2Fy
Y2gvcmlzY3Yva2VybmVsL2NhY2hlaW5mby5jCj4gPiBAQCAtNzksNiArNzksMjcgQEAgaW50IHBv
cHVsYXRlX2NhY2hlX2xlYXZlcyh1bnNpZ25lZCBpbnQgY3B1KQo+ID4gICAgICAgICBzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKnByZXYgPSBOVUxMOwo+ID4gICAgICAgICBpbnQgbGV2ZWxzID0gMSwgbGV2
ZWwgPSAxOwo+ID4KPiA+ICsgICAgICAgaWYgKCFhY3BpX2Rpc2FibGVkKSB7Cj4gPiArICAgICAg
ICAgICAgICAgaW50IHJldCwgZndfbGV2ZWxzLCBzcGxpdF9sZXZlbHM7Cj4gPiArCj4gPiArICAg
ICAgICAgICAgICAgcmV0ID0gYWNwaV9nZXRfY2FjaGVfaW5mbyhjcHUsICZmd19sZXZlbHMsICZz
cGxpdF9sZXZlbHMpOwo+ID4gKyAgICAgICAgICAgICAgIGlmIChyZXQpCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgIC8qIG11
c3QgYmUgc2V0LCBzbyB3ZSBjYW4gZHJvcCBudW1fbGVhdmVzIGFzc2lnbm1lbnQgYmVsb3cgKi8K
PiA+ICsgICAgICAgICAgICAgICB0aGlzX2NwdV9jaS0+bnVtX2xlYXZlcyA9IGZ3X2xldmVscyAr
IHNwbGl0X2xldmVsczsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICBmb3IgKGlkeCA9IDA7IGxl
dmVsIDw9IHRoaXNfY3B1X2NpLT5udW1fbGV2ZWxzICYmCj4gPiArICAgICAgICAgICAgICAgICAg
ICBpZHggPCB0aGlzX2NwdV9jaS0+bnVtX2xlYXZlczsgaWR4KyssIGxldmVsKyspIHsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGlmIChsZXZlbCA8PSBzcGxpdF9sZXZlbHMpIHsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2lfbGVhZl9pbml0KHRoaXNfbGVhZisrLCBD
QUNIRV9UWVBFX0RBVEEsIGxldmVsKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY2lfbGVhZl9pbml0KHRoaXNfbGVhZisrLCBDQUNIRV9UWVBFX0lOU1QsIGxldmVsKTsKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNpX2xlYWZfaW5pdCh0aGlzX2xlYWYrKywgQ0FDSEVfVFlQRV9VTklGSUVE
LCBsZXZlbCk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICB9Cj4gPiArICAgICAgICAgICAg
ICAgfQo+Cj4gT2Zjb3Vyc2Ugd2UgbmVlZCB0byBhZGQgaGVyZSwKPiAgICAgICAgICAgICAgICAg
cmV0dXJuIDA7Cj4KPiA+ICsgICAgICAgfQo+ID4gKwo+ID4gICAgICAgICBpZiAob2ZfcHJvcGVy
dHlfcmVhZF9ib29sKG5wLCAiY2FjaGUtc2l6ZSIpKQo+ID4gICAgICAgICAgICAgICAgIGNpX2xl
YWZfaW5pdCh0aGlzX2xlYWYrKywgbnAsIENBQ0hFX1RZUEVfVU5JRklFRCwgbGV2ZWwpOwo+ID4g
ICAgICAgICBpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAiaS1jYWNoZS1zaXplIikpCj4g
Pgo+Cj4gLS0KPiBSZWdhcmRzLAo+IFN1ZGVlcAoKV2l0aCB0aGlzIG1vZGlmaWNhdGlvbiwgSSB0
ZXN0ZWQgdGhhdCBJIGNhbiBvYnRhaW4gY2FjaGVpbmZvCmNvcnJlY3RseS4gSWYgUklTQy1WIGxh
dGVyIGFkZHMgYSBuZXcgcmVnaXN0ZXIgZGVzY3JpYmluZyB0aGUgY2FjaGUsCnRoZW4gd2UgY2Fu
IGNvbnRpbnVlIHRvIGltcHJvdmUgaXQgaW4gcG9wdWxhdGVfY2FjaGVfbGVhdmVzKCkuClRoYW5r
IHlvdSBmb3IgeW91ciBjb21tZW50cyBhbmQgSSB3aWxsIGFkZCB5b3UgYXMgU3VnZ2VzdGVkLWJ5
IGluIHYyLgoKVGhhbmtzLApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
