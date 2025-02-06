Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF812C02199
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 18:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+KiW95O1WpSifsIz9f07DJsq6hTmBulsxDIr55Lw9Ss=; b=vvbBqBRI6NcAHK
	zcbkjmFEPicL/vm/I3Q1odK+Kk/FdEHU0oO1Kc/Kobeg/3AR4wf15SsP/k0E4ubCxcqFZEQ53OJkD
	NpbeYhOYYJ6rUOzjckfFILpQKFSqIqlSISdNjQB/pl4FSmV2ecF0I4l/OFulkwkAa2ysykan9IsMw
	LSQVTefhtMunzneoWzj4gma6Ez6/mTf+mt2tgXXDJVSJHOv0HVoumiMpxe4/PHMNLQ36qDzxqycwt
	44njDkCU4ll32QdAD/1nwBx9i2PSE4tH7iag/7hzoRenfrlmaIJZrX9mG4tKBmYq01r8QXFE8lt8X
	0Yd0d4YqTgH44NXsmsGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg6LC-000000076qm-0PY0;
	Thu, 06 Feb 2025 18:11:06 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg6L9-000000076pp-1k8B;
	Thu, 06 Feb 2025 18:11:04 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38daf156e97so688711f8f.0;
        Thu, 06 Feb 2025 10:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738865461; x=1739470261; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ttuWAvJobLlg56YrOVOmHOt13ZH7wD3gGicocchpzQ=;
        b=e9tFlzcM2RKbq4Tz1Hbea1l46kV0H1Vgd7e/YYnSoL0XDGn+Npcx7b/7uedLdl/v9o
         U2iiV97ieYrE1cC+1NKMquhiY+20vnkECZRkSi5ZojioU+G+VdOZgqrTr2t2izQKb/5C
         VXt2DTiqG0sHOBj7WwazlLLbql6CFU2RvqBKh47y3q3BLiP1IXn0usi50dc/fe1zDhTD
         Yc31VlUL9uxNtPlxrcGy8J5PjRvBl0ioUh9Ba+qMM76uqVJ7ivpWga1iy13c5gE0bemj
         pEzk9LXaMPl6dZrNlgkMZBMftRnziUB5SSBvekeFdktUb5s7o7gPL+mxrag5RYY8epVw
         qqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865461; x=1739470261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ttuWAvJobLlg56YrOVOmHOt13ZH7wD3gGicocchpzQ=;
        b=FESm5a9bIeLArVo9Ud+nkBjFzReoLlhr6XFfURMolmfWQJ1moUixS+euhTpgy6kKRl
         ds+6ghydCFlF3rgurVb3YyHIBbtCXZDjP1EFtCiPeM30+JXED/hWValxdEXu3BSrkY6c
         0nqIGL0OwuW8rAKEEo++rgv14TlqhiP9qfFW3woxV4w1rjGpNPhNMSZv+FxXHTGM8w+8
         Tqx6TSl+hiGFyDXWo++R+c3gxK8WSfw4pTyIyPZH4v+s3Yz0k7h3OEj4qrHYmMylqMTy
         j9hF6CF2zscDaXfychV0Eam5lOaYzx4LhUcDDAYPKLzC3yuiS/K6E26RbKOtO7VoveHW
         R8jA==
X-Forwarded-Encrypted: i=1; AJvYcCWONlfsFFnEsjUtS8+u5xeJDc1PD752zwi1XkvdKo16CRcjLN94tjsqjFS04YBvRa9JzCd4i90GVCES9p8=@lists.infradead.org, AJvYcCXkEAk0B4m4DxZC0896c/7HLIJqZYA9pK1gyJda5vJGurwA+3nqyG3T8nNd2wft0HFfRqg9bfLDKG8upEMveMpK@lists.infradead.org
X-Gm-Message-State: AOJu0YyJK8YHNXEkqWtNJgPyMyu2GqTLJKcyAX0H63dodrgELiArUspK
	W1Z5iZ53Vmh6BiO0VW3xJfPrtLiUO/rL+dMMAuMkStNNYZ2838Oglbudv5iIoA8avPkt9dY52tz
	Dc17IzAjNXRVCYi1r07GfMTHGfww=
X-Gm-Gg: ASbGncswdT0LGM2jLDTnbK8di2APeCj+GX33gznLOLXvGv68G74/stTf695F4DJKFIh
	D7VGMjYXOThOxoISDMsGhbp5b4fm75z4IYfH/onceyFduLjWsiG20qo6hr2cweIXvCopmBBOgQQ
	==
X-Google-Smtp-Source: AGHT+IGjlT6+E7s19Biqi+L66hD4CAB7+vWZ8IxthOzy0VOqSvauytoG4hxkI1K7a56pR3Wt3sBZqEuajrgrIm/RerQ=
X-Received: by 2002:a5d:6da4:0:b0:38c:5b52:3a5e with SMTP id
 ffacd0b85a97d-38dc8dc342amr4349f8f.8.1738865461496; Thu, 06 Feb 2025 10:11:01
 -0800 (PST)
MIME-Version: 1.0
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZd1dpqv+rM2jD1fNGvhU_0+6c8MjzsgEsi2V-RkHVteJg@mail.gmail.com> <cj2w476ui6g6bjtrnmhozgruhudjx7dbeifxtx4q26c4sqmobt@ill63v5yc3ke>
In-Reply-To: <cj2w476ui6g6bjtrnmhozgruhudjx7dbeifxtx4q26c4sqmobt@ill63v5yc3ke>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 6 Feb 2025 19:10:50 +0100
X-Gm-Features: AWEUYZkYq87i7dcuraqL9nv2V2zM6XbkuTsSw_RSaFUD-ppNitROYVtIB8RMtyU
Message-ID: <CA+fCnZfTvFzX32ZU=Xa0qsNACM4Y1vA1xQDtJkhhk1fYH1QxRA@mail.gmail.com>
Subject: Re: [PATCH 00/15] kasan: x86: arm64: risc-v: KASAN tag-based mode for x86
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: luto@kernel.org, xin@zytor.com, kirill.shutemov@linux.intel.com, 
	palmer@dabbelt.com, tj@kernel.org, brgerst@gmail.com, ardb@kernel.org, 
	dave.hansen@linux.intel.com, jgross@suse.com, will@kernel.org, 
	akpm@linux-foundation.org, arnd@arndb.de, corbet@lwn.net, dvyukov@google.com, 
	richard.weiyang@gmail.com, ytcoode@gmail.com, tglx@linutronix.de, 
	hpa@zytor.com, seanjc@google.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, justinstitt@google.com, jason.andryuk@amd.com, 
	glider@google.com, ubizjak@gmail.com, jannh@google.com, bhe@redhat.com, 
	vincenzo.frascino@arm.com, rafael.j.wysocki@intel.com, 
	ndesaulniers@google.com, mingo@redhat.com, catalin.marinas@arm.com, 
	junichi.nomura@nec.com, nathan@kernel.org, ryabinin.a.a@gmail.com, 
	dennis@kernel.org, bp@alien8.de, kevinloughlin@google.com, morbo@google.com, 
	dan.j.williams@intel.com, julian.stecklina@cyberus-technology.de, 
	peterz@infradead.org, cl@linux.com, kees@kernel.org, 
	kasan-dev@googlegroups.com, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_101103_452120_F05D6B35 
X-CRM114-Status: GOOD (  17.70  )
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

T24gVGh1LCBGZWIgNiwgMjAyNSBhdCAxMTo0MeKAr0FNIE1hY2llaiBXaWVjem9yLVJldG1hbgo8
bWFjaWVqLndpZWN6b3ItcmV0bWFuQGludGVsLmNvbT4gd3JvdGU6Cj4KPiA+SSBzdGFydGVkIHJl
dmlld2luZyB0aGUgcGF0Y2hlcywgYnV0IHRoaXMgaXMgc29tZXdoYXQgY29tcGxpY2F0ZWQsIGFz
Cj4gPnRoZSBkZW5zZSBtb2RlIGNoYW5nZXMgYXJlIHNxdWFzaGVkIHRvZ2V0aGVyIHdpdGggdGhl
IGdlbmVyaWMgb25lcyBmb3IKPiA+eDg2IHN1cHBvcnQuIENvdWxkIHlvdSBwbGVhc2Ugc3BsaXQg
dGhpcyBzZXJpZXMgaW50byAyPyBPciBhdCBsZWFzdAo+ID5yZW9yZGVyIHRoZSBwYXRjaGVzIHNv
IHRoYXQgZXZlcnl0aGluZyBuZWVkZWQgZm9yIGJhc2ljIHg4NiBzdXBwb3J0Cj4gPmNvbWVzIGZp
cnN0IGFuZCBjYW4gYmUgcmV2aWV3ZWQgYW5kIHRlc3RlZCBzZXBhcmF0ZWx5Lgo+Cj4gSSdsbCB0
cnkgcmVvcmRlcmluZyBmaXJzdCBhbmQgc2VlIGlmIGl0IGxvb2tzIG5pY2UuIFNpbmNlIHRoZSBk
ZW5zZSBtb2RlIHdvdWxkCj4gbWFrZSBzb21lIHBhcnRzIGFyY2ggc3BlY2lmaWMgSSB0aGluayBp
dCdzIGJldHRlciB0byBoYXZlIHRoZSB0d28gcGFydHMgaW4gb25lCj4gc2VyaWVzIGZvciBlYXNp
ZXIgcmVmZXJlbmNlLiBCdXQgaWYgaXQgdHVybnMgb3V0IG1vcmUgY29udm9sdXRlZCBJJ2xsIGp1
c3Qgc3BsaXQKPiBpdCBhcyB5b3Ugc3VnZ2VzdGVkLgoKWWVzLCBwbGVhc2UgZG8uIEkgYWxzbyB0
aGluayBpZiB5b3Ugc3BsaXQgdGhlIHNlcmllcywgd2UgY2FuIGxhbmQgdGhlCmJhc2ljIHg4NiBz
dXBwb3J0IGZhaXJseSBxdWlja2x5LCBvciBhdCBsZWFzdCBJIGNhbiBkbyB0aGUgcmV2aWV3IGFu
ZApnaXZlIHRoZSBhY2sgZnJvbSB0aGUgS0FTQU4gc2lkZS4gRm9yIHRoZSBkZW5zZSBtb2RlIHBh
cnQsIEknZCBsaWtlIHRvCmFsc28gaGVhciB0aGUgb3BpbmlvbiBvZiBvdGhlciBLQVNBTiBkZXZl
bG9wZXJzIHdydCB0aGUgb3ZlcmFsbApkZXNpZ24uCgo+ID5BbHNvIGZlZWwgZnJlZSB0byBkcm9w
IHRoZSBkZXBlbmRlbmN5IG9uIHRoYXQgcmlzYy12IHNlcmllcywgYXMgaXQKPiA+ZG9lc24ndCBn
ZXQgdXBkYXRlZCB2ZXJ5IG9mdGVuLiBCdXQgdXAgdG8geW91Lgo+Cj4gT2theSwgSSB3YXMgbW9z
dGx5IGludGVyZXN0ZWQgaW4gdGhlIHBhdGNoIHRoYXQgcmVkZWZpbmVzIEtBU0FOX1NIQURPV19F
TkQgYXMKPiBLQVNBTl9TSEFET1dfT0ZGU0VUIGFuZCB0aGVuIGdldHMgc2hhZG93IGFkZHJlc3Nl
cyBieSB1c2luZyBhIHNpZ25lZCBvZmZzZXQuIEJ1dAo+IEkgc3VwcG9zZSBJIGNhbiBqdXN0IHRh
a2UgdGhhdCBwYXRjaCBhbmQgcHJlcGVuZCBteSBzZXJpZXMgd2l0aCB0aGF0PyAoYWZ0ZXIKPiBh
cHBseWluZyB5b3VyIGNvbW1lbnRzIGZyb20gdGhhdCBzZXJpZXMpCgpTb3VuZHMgZ29vZCB0byBt
ZSEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
