Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DE3C27C79
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 18:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=10/ZLZIt9a3qaIQVdtuUN3x9Gz07Pc2j5PPyqTGYUJo=; b=qXUQehXC5XM69Y
	xiRS2Rdl2ZNAjXcinhjkawMb191UIi7+g3ts2s2P/Ia5s2HzIIWuVlnNi8Ep2gYjQ9io2/f2EvhX2
	rI9XE7M1FR1iF7dOXDEYHakcWKvhiDC2O2+vYoY2chIHNBoyez30rZCkAsYQ+aEWJMaX8Hel8LB1d
	Aa/j6Aup728Sjb368Xwqw6jgO5rYVKlz7hn3YT3MGyYTJIrAu9AWy7YvIhYlDpLkT8A9U5GBZ0w66
	LU1UzsNjCBc5znOcgOuCTofIjbsvWDsJojM5cETSQK/E5XTQl0OYi+9NDmF0xZKyA2XYnxI4pC8RK
	YUwZ/jT8bdIu8KG9Uu3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKMtE-00000006MjT-0Fvl;
	Thu, 20 Jun 2024 18:52:08 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKMtA-00000006Mia-2gHe
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jun 2024 18:52:06 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-57d1d614049so1483108a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jun 2024 11:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718909522; x=1719514322; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVDuY1tK8O4XAXxIL/j26gAakgY66nxVupbQ97z0yFQ=;
        b=dEOlyQf0cS73BoJ+qdGTb4KnwsvEt7cE1hMRojnGUZRiA0eiwmK9koF0Ynx3LGTVeD
         YaX9m8TmOutZbLiropi2naKrIVbpLUzvFvLQO4WDjahxLvkARM6PGYSuQ4Z54lqwlMKh
         HyXs8uhB96Cg3XPMEoh87TgqEseWsZKj4fHo2H0Z2/3HZVZkNmGRzjYcu19YPznMOGmc
         vXGu88ojZ3qccgYyuuX8Fxau/hKW0MOx0SwTj/aGky5/TCg27fWlHpcm8HCYODOeLnhn
         cu+9hfVzLdpAiuLPwMQXefJzlEKsaXRcclw3mluFAE5Qj8btA8gdr96AWR96a5uUvctz
         Zj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718909522; x=1719514322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UVDuY1tK8O4XAXxIL/j26gAakgY66nxVupbQ97z0yFQ=;
        b=UQB29s+QKyhOZfwU4CZryM3YYMOjERwDhWoutW4HUPFN70tGlcsyvJjNC5UDEFJ4vX
         jRwziH8kgSb22H+sZB+L1iT4524sHkH09LuuUF+UX45PIfN5KJRDnnmKEQtuSdxqlDvT
         R7jV+MmDbvPtJAIEnRQNI5ZJ6aaBV7VdnlP7b8ja2UvIXvDGXX+kZJvcUPvBQIiPca9Z
         TXB03rEKQ8yxc0utVJXX1Cjif5/yamn5jqQeLPZg+IL7kC7s0VgcOYpKMoCJqLsVwfD4
         n7AY4d0GWX08oTF650jYgLgO6niZx9fdv7x90ogQPOF7GFSlrU2uSBLpxbotC9E24k0L
         WLcA==
X-Gm-Message-State: AOJu0YwNQh4FRuCXRU1UVE5MYIdgjDsAcjHTrXJXDx31VcszacxH55WN
	tEwS1wpKdmm4ZGets6ogThKWWW1LI5CmjYGZ/aU6vHCxCrM5qLZd2O+yhWGhvWTAgHWzrlJjLRu
	hMLatWRoGaRQKtVnp/Jx7gzwOyepRrBW72FOXfEW1jXwf45qzs2Q=
X-Google-Smtp-Source: AGHT+IEQzvgg4VGHyUlRo+eqwYsckLUIf9MsEs4G+q5TI9DtWxbGLapuVfQAwEwLLu7jIZ+TrQNgKbi0vAanRN54ZRk=
X-Received: by 2002:a17:907:7625:b0:a6f:53f9:7974 with SMTP id
 a640c23a62f3a-a6fab7791a4mr399958366b.52.1718909522135; Thu, 20 Jun 2024
 11:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240613191616.2101821-1-jesse@rivosinc.com> <20240613191616.2101821-7-jesse@rivosinc.com>
In-Reply-To: <20240613191616.2101821-7-jesse@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 20 Jun 2024 11:51:25 -0700
Message-ID: <CALs-HssqVkEX0=x+jhQDjwjRQb9TjbskLvrpvzFG_g-2iDXy3w@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] RISC-V: hwprobe: Document unaligned vector perf key
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>, 
	Eric Biggers <ebiggers@google.com>, Greentime Hu <greentime.hu@sifive.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Heiko Stuebner <heiko@sntech.de>, Costa Shulyupin <costa.shul@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Anup Patel <apatel@ventanamicro.com>, Zong Li <zong.li@sifive.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Erick Archer <erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_115204_818458_FD011414 
X-CRM114-Status: GOOD (  17.33  )
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

T24gVGh1LCBKdW4gMTMsIDIwMjQgYXQgMTI6MTjigK9QTSBKZXNzZSBUYXViZSA8amVzc2VAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IERvY3VtZW50IGtleSBmb3IgcmVwb3J0aW5nIHRoZSBzcGVl
ZCBvZiB1bmFsaWduZWQgdmVjdG9yIGFjY2Vzc2VzLgo+IFRoZSBkZXNjcmlwdGlvbnMgYXJlIHRo
ZSBzYW1lIGFzIHRoZSBzY2FsYXIgZXF1aXZhbGVudCB2YWx1ZXMuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBKZXNzZSBUYXViZSA8amVzc2VAcml2b3NpbmMuY29tPgo+IC0tLQo+IFYxIC0+IFYyOgo+ICAg
LSBOZXcgcGF0Y2gKPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0
IHwgMTYgKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygr
KQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCBi
L0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+IGluZGV4IDcwODVhNjk0Yjgw
MS4uMzQ0YmVhMWUyMWJkIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9o
d3Byb2JlLnJzdAo+ICsrKyBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+
IEBAIC0yMzYsMyArMjM2LDE5IEBAIFRoZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKPgo+
ICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0tFWV9aSUNCT1pfQkxPQ0tfU0laRWA6IEFuIHVu
c2lnbmVkIGludCB3aGljaAo+ICAgIHJlcHJlc2VudHMgdGhlIHNpemUgb2YgdGhlIFppY2JveiBi
bG9jayBpbiBieXRlcy4KPiArCj4gKyogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX1ZFQ19N
SVNBTElHTkVEX1BFUkZgOiBBbiBlbnVtIHZhbHVlIGRlc2NyaWJpbmcgdGhlCj4gKyAgcGVyZm9y
bWFuY2Ugb2YgbWlzYWxpZ25lZCB2ZWN0b3IgYWNjZXNzZXMgb24gdGhlIHNlbGVjdGVkIHNldCBv
ZiBwcm9jZXNzb3JzLgo+ICsKPiArICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX1ZFQ19NSVNB
TElHTkVEX1VOS05PV05gOiBUaGUgcGVyZm9ybWFuY2Ugb2YgbWlzYWxpZ25lZAo+ICsgICAgYWNj
ZXNzZXMgaXMgdW5rbm93bi4KPiArCj4gKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9WRUNf
TUlTQUxJR05FRF9TTE9XYDogTWlzYWxpZ25lZCBhY2Nlc3NlcyBhcmUgc2xvd2VyCgpTaG91bGQg
d2Ugc3BlY2lmeSB3aGF0IHNpemUgb2YgdmVjdG9yIGFjY2VzcyB3ZSdyZSBjb21wYXJpbmcgYWdh
aW5zdD8KSW4gb3RoZXIgd29yZHMsIGNyaXNwZW4gdXAgd2hhdCAibWlzYWxpZ25lZCBhY2Nlc3Mi
IGV4YWN0bHkgbWVhbnMuIEkKcmVhbGl6ZSB5b3UgY29waWVkIHRoaXMgZnJvbSBteSB0ZXh0LiBJ
IHJlYWxseSBzaG91bGQgaGF2ZSBzYWlkCiJtaXNhbGlnbmVkIG5hdGl2ZSB3b3JkIHNpemUgYWNj
ZXNzZXMiLgoKPiArICAgIHRoYW4gZXF1aXZhbGVudCBieXRlIGFjY2Vzc2VzLiAgTWlzYWxpZ25l
ZCBhY2Nlc3NlcyBtYXkgYmUgc3VwcG9ydGVkCj4gKyAgICBkaXJlY3RseSBpbiBoYXJkd2FyZSwg
b3IgdHJhcHBlZCBhbmQgZW11bGF0ZWQgYnkgc29mdHdhcmUuCj4gKwo+ICsgICogOmM6bWFjcm86
YFJJU0NWX0hXUFJPQkVfVkVDX01JU0FMSUdORURfRkFTVGA6IE1pc2FsaWduZWQgYWNjZXNzZXMg
YXJlIGZhc3Rlcgo+ICsgICAgdGhhbiBlcXVpdmFsZW50IGJ5dGUgYWNjZXNzZXMuCj4gKwo+ICsg
ICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfVkVDX01JU0FMSUdORURfVU5TVVBQT1JURURgOiBN
aXNhbGlnbmVkIGFjY2Vzc2VzIGFyZQo+ICsgICAgbm90IHN1cHBvcnRlZCBhdCBhbGwgYW5kIHdp
bGwgZ2VuZXJhdGUgYSBtaXNhbGlnbmVkIGFkZHJlc3MgZmF1bHQuCj4gLS0KPiAyLjQzLjAKPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
