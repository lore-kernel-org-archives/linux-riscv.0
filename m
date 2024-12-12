Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC600E7717F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Dec 2024 17:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SBc6hlSxfxOFVrD59PKpQTvY0mpEJOyQjULmjMbj0SA=; b=VcJmfGru7iw5cZ
	qOjsCa4dGGjGb65mNP4Si8gavE8w/MeBwZzDzzxMv4mSXdpdRyXf+xRr9jBSUJ5lYon0TXlVOEVhw
	RETEmljDJyBvsaLFmUwO6PbVtzN9mbLa5VlGw65eEmQ5kD2udoclzUxJGK1QE5NJdNbyzhxPKqHQ5
	O5tuChjrBTPUZioNvB7ag94T8AWT6A9fD2OKSFHy3etZM7FZu+UH07831eAfQeVln+/CSBsgbtL44
	g56XEhsgFm743SVLNBcTmtg+G/yrVfHhkceJjNn2LnSTTIqFjPJ4SHZBu2NJ07IjKRnFanDTa2BZs
	bq2qJYtrbe3WLayZ5T5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLn6D-00000001Cqq-2LSF;
	Thu, 12 Dec 2024 17:35:41 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmee-000000016ix-1joj;
	Thu, 12 Dec 2024 17:07:13 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7b6f0afda3fso82796585a.2;
        Thu, 12 Dec 2024 09:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734023231; x=1734628031; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ydWT1UsTHYhWkkUUpo46STYyAYlSEKPTYHT7UawS7ks=;
        b=Gg32LEhmnu0HqfnjZL19it68Hkpgy1JduQYTwV8Xt6IBWSKmmvuGoqQR4naR/JKItk
         7hIQoofFx2aE58xroqPFZHWFmhetK/or5tn1AzPp24ezHa7YTbuaITPYj0M4UfgJBhzf
         OkH8EYfECYJxkn9zRoHTfv8Pz+xogzgwmNthR0k5Rzk2DvI1NJyGZemrzCJjV8GcLYgd
         ufOg7NSi7aJr2pLiznXvdMN/YuUUyEEd+oNHCsMiN3AoJ6Ra7wknN7wbL0c24r3CnEEr
         bRboU0orSR675dyYtO9obUsicd7jJfAYIlEnwrLfuslAOlgsQqDkKUkxSPs/HoMnjuIS
         HymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734023231; x=1734628031;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ydWT1UsTHYhWkkUUpo46STYyAYlSEKPTYHT7UawS7ks=;
        b=fBGiif1e5sbO8s4jMYuoSzJXyXFse3ZnyeXiBwzWdq3UbwC50EFQzis68UFghbw/XH
         DjZGFAWu422LWBWVFs+P4SQFahqWS49IGl4lSNehsXMNtnV/ruZeK6cvCvmF3juCV5xx
         rOpaZ4vUe+Lw3Vk3HYzQDX+c37YOXD5H66DIWeW6rpj+EN3T6Gk71WmRKmfStHEW/dnU
         Q/dntoWgDpXvnjfEy8MeK5Bwi1mFSTR+XbnbA2Qu7GY2xKS7qaX/aep12PCT49XHHr5n
         6v3WX/cZy1JL7AM7b5Lr/uTe97hKpC6AaEwXROFbcuSwpTvcjgkdFAGqCtiwtqgTd3jV
         /U8w==
X-Forwarded-Encrypted: i=1; AJvYcCVGxwubbUhULhyC+TqLmhmNGwca2oggMmluwnKRRX5nFN8PfnZ2PNzQ7JBC9sR3Xe1/qSB3F0XOm204IJHdkRlS@lists.infradead.org, AJvYcCXx4vYF7DzUg/xiSR6HAWqPQGczeM6EVTgyuG/OYHN+L3vAf/j+eBM4SpTdden0fwQwtWiXjAI8Fh+Ysqk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/4qeNXOUrF4oZw6sddOxhL3ktXMUANSQFI3oZlK/wX/9Zib8/
	K/nFSN869OmkKclxm5/f64stju8WRtmXiaUNIzeEkouQAwKUi44K
X-Gm-Gg: ASbGncvJrzRmtdqIALBzds1FbNPneduBuSnTPs3t+AHfcXKFpZiNco6NRNnk8v1L471
	2GeM5NOuxA46Ar9KM87RUSNpVLvHCkkeSn6JcwnhvK1SA+KLoUJ3sqCP5nZjk8jHT3khwtJUqWC
	uPDUygfMsdTa3NlNCTpOqyheJNGXiiaw0WsMVCznCDomryjANaMyaPB1EeF+7GIRF7hQcxttIZI
	yy7gAkIPii15URVQRdKS4la3NvoeFljADVsMJcyM3NEteoBt9EQBVW3joMKPUAxXTP+g1xFv/WH
	dscwMWq8FUTWVipUjisBNNraLphTWcgBg11aFg4cZGcw0MQ=
X-Google-Smtp-Source: AGHT+IHzAm46RcSXBdKh7khSXQnNQaNdgKhsnso06GP4zS9LyrwkArKfWLLbGnkC5+ATJVA0mg3gEA==
X-Received: by 2002:a05:620a:2611:b0:7b6:f31a:7804 with SMTP id af79cd13be357-7b6f88d41fbmr175715585a.9.1734023229981;
        Thu, 12 Dec 2024 09:07:09 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6b5a5b38asm756057285a.27.2024.12.12.09.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 09:07:09 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6D25F1200066;
	Thu, 12 Dec 2024 12:07:08 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 12 Dec 2024 12:07:08 -0500
X-ME-Sender: <xms:PBhbZ3cQLAN_Jwg2nfFOrMDCfGaWRrRFbXQYziRhDf3g7DcjsoxX0A>
    <xme:PBhbZ9MIOJjMK5Ci1Rx0U8drurfX5Z8vfCJ5hl7jTwxUEoI9Ax-i4QvrOS5GldGIS
    FDYFAU9Gp3sTL-SeA>
X-ME-Received: <xmr:PBhbZwisrTsmLp3KgtNCrMDg-4rt-GJSjviToXQq0H1yhXeXsULCxvGmzI4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrkeehgdelhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeen
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeegkeegtedtleffkeeftdevleeuieduveejgeei
    kedvgeekudefteefieeivdeuleenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdo
    mhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejke
    ehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgr
    mhgvpdhnsggprhgtphhtthhopeehjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    eprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprhhushhtqdhf
    ohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhgtuh
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgv
    lhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhgthh
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehllhhvmheslhhishhtshdr
    lhhinhhugidruggvvhdprhgtphhtthhopehlkhhmmheslhhishhtshdrlhhinhhugidrug
    gvvhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegr
    lhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:PBhbZ4_bxD1EdvvG1pcQ0R28qVCKk5b1Ij5sJnCIkw0wthcCOTXQcw>
    <xmx:PBhbZzu6K9CAjXTJEmCre--Q3suO2c4QNTjNGWbz_PoA_d_m3CkCqQ>
    <xmx:PBhbZ3HpOUUjR6jpHda2k5BsqDusYqLfOENcb4YvFpvKyqqICyKNQA>
    <xmx:PBhbZ6N8LSYi4w1v6G2BzN1MBMLjz8Ug032w7mdTrpEt5IG0elKaqA>
    <xmx:PBhbZ0NQTWjbv0n97eX1zsur6i2Rspp3fpybEeEVwF91xUUBuqTz31Wa>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Dec 2024 12:07:06 -0500 (EST)
Date: Thu, 12 Dec 2024 09:07:00 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	llvm@lists.linux.dev, lkmm@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nicholas Piggin <npiggin@gmail.com>,	David Howells <dhowells@redhat.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,	Luc Maranget <luc.maranget@inria.fr>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,	Daniel Lustig <dlustig@nvidia.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,	kent.overstreet@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, elver@google.com,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,	Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Catalin Marinas <catalin.marinas@arm.com>,	torvalds@linux-foundation.org,
 linux-arm-kernel@lists.infradead.org,	linux-fsdevel@vger.kernel.org,
 Trevor Gross <tmgross@umich.edu>,	dakr@redhat.com,
 Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,	Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Subject: Re: [RFC v2 02/13] rust: sync: Add basic atomic operation mapping
 framework
Message-ID: <Z1sYNOYJPzQmJXn6@boqun-archlinux>
References: <20241101060237.1185533-1-boqun.feng@gmail.com>
 <20241101060237.1185533-3-boqun.feng@gmail.com>
 <CAH5fLghYjcb-mpR_rr2aC_W8rRb6g8jCFxgky7iEqVgmpHjf=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH5fLghYjcb-mpR_rr2aC_W8rRb6g8jCFxgky7iEqVgmpHjf=Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_090712_466334_4BADE76D 
X-CRM114-Status: GOOD (  41.49  )
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

T24gVGh1LCBEZWMgMTIsIDIwMjQgYXQgMTE6NTE6MjNBTSArMDEwMCwgQWxpY2UgUnlobCB3cm90
ZToKPiBPbiBGcmksIE5vdiAxLCAyMDI0IGF0IDc6MDPigK9BTSBCb3F1biBGZW5nIDxib3F1bi5m
ZW5nQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gUHJlcGFyYXRpb24gZm9yIGdlbmVyaWMgYXRv
bWljIGltcGxlbWVudGF0aW9uLiBUbyB1bmlmeSB0aGUKPiA+IGlwbWxlbWVudGF0aW9uIG9mIGEg
Z2VuZXJpYyBtZXRob2Qgb3ZlciBgaTMyYCBhbmQgYGk2NGAsIHRoZSBDIHNpZGUKPiA+IGF0b21p
YyBtZXRob2RzIG5lZWQgdG8gYmUgZ3JvdXBlZCBzbyB0aGF0IGluIGEgZ2VuZXJpYyBtZXRob2Qs
IHRoZXkgY2FuCj4gPiBiZSByZWZlcnJlZCBhcyA8dHlwZT46OjxtZXRob2Q+LCBvdGhlcndpc2Ug
dGhlaXIgcGFyYW1ldGVycyBhbmQgcmV0dXJuCj4gPiB2YWx1ZSBhcmUgZGlmZmVyZW50IGJldHdl
ZW4gYGkzMmAgYW5kIGBpNjRgLCB3aGljaCB3b3VsZCByZXF1aXJlIHVzaW5nCj4gPiBgdHJhbnNt
dXRlKClgIHRvIHVuaWZ5IHRoZSB0eXBlIGludG8gYSBgVGAuCj4gPgo+ID4gSW50cm9kdWNlIGBB
dG9taWNJcG1sYCB0byByZXByZXNlbnQgYSBiYXNpYyB0eXBlIGluIFJ1c3QgdGhhdCBoYXMgdGhl
Cj4gPiBkaXJlY3QgbWFwcGluZyB0byBhbiBhdG9taWMgaW1wbGVtZW50YXRpb24gZnJvbSBDLiBU
aGlzIHRyYWl0IGlzIHNlYWxlZCwKPiA+IGFuZCBjdXJyZW50bHkgb25seSBgaTMyYCBhbmQgYGk2
NGAgaXBtbCB0aGlzLgo+IAo+IFRoZXJlIHNlZW1zIHRvIGJlIHF1aXRlIGEgZmV3IGluc3RhbmNl
cyBvZiAiaW1wbCIgc3BlbGxlZCBhcyAiaXBtbCIgaGVyZS4KPiAKCldpbGwgZml4IQoKPiA+IEZ1
cnRoZXIsIGRpZmZlcmVudCBtZXRob2RzIGFyZSBwdXQgaW50byBkaWZmZXJlbnQgYCpPcHNgIHRy
YWl0IGdyb3VwcywKPiA+IGFuZCB0aGlzIGlzIGZvciB0aGUgZnV0dXJlIHdoZW4gc21hbGxlciB0
eXBlcyBsaWtlIGBpOGAvYGkxNmAgYXJlCj4gPiBzdXBwb3J0ZWQgYnV0IG9ubHkgd2l0aCBhIGxp
bWl0ZWQgc2V0IG9mIEFQSSAoZS5nLiBvbmx5IHNldCgpLCBsb2FkKCksCj4gPiB4Y2hnKCkgYW5k
IGNtcHhjaGcoKSwgbm8gYWRkKCkgb3Igc3ViKCkgZXRjKS4KPiA+Cj4gPiBXaGlsZSB0aGUgYXRv
bWljIG1vZCBpcyBpbnRyb2R1Y2VkLCBkb2N1bWVudGF0aW9uIGlzIGFsc28gYWRkZWQgZm9yCj4g
PiBtZW1vcnkgbW9kZWxzIGFuZCBkYXRhIHJhY2VzLgo+ID4KPiA+IEFsc28gYnVtcCBteSByb2xl
IHRvIHRoZSBtYWludGFpbmVyIG9mIEFUT01JQyBJTkZSQVNUUlVDVFVSRSB0byByZWZsZWN0Cj4g
PiBteSByZXNwb25zaWJsaXR5IG9uIHRoZSBSdXN0IGF0b21pYyBtb2QuCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogQm9xdW4gRmVuZyA8Ym9xdW4uZmVuZ0BnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBN
QUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0KPiA+ICBydXN0L2tlcm5lbC9z
eW5jLnJzICAgICAgICAgICAgfCAgIDEgKwo+ID4gIHJ1c3Qva2VybmVsL3N5bmMvYXRvbWljLnJz
ICAgICB8ICAxOSArKysrCj4gPiAgcnVzdC9rZXJuZWwvc3luYy9hdG9taWMvb3BzLnJzIHwgMTk5
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDQgZmlsZXMgY2hhbmdlZCwg
MjIyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
cnVzdC9rZXJuZWwvc3luYy9hdG9taWMucnMKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcnVzdC9r
ZXJuZWwvc3luYy9hdG9taWMvb3BzLnJzCj4gPgo+ID4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJT
IGIvTUFJTlRBSU5FUlMKPiA+IGluZGV4IGI3N2Y0NDk1ZGNmNC4uZTA5NDcxMDI3YTYzIDEwMDY0
NAo+ID4gLS0tIGEvTUFJTlRBSU5FUlMKPiA+ICsrKyBiL01BSU5UQUlORVJTCj4gPiBAQCAtMzYz
NSw3ICszNjM1LDcgQEAgRjogICAgICAgIGRyaXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4vYXRtZWxf
bXh0X3RzLmMKPiA+ICBBVE9NSUMgSU5GUkFTVFJVQ1RVUkUKPiA+ICBNOiAgICAgV2lsbCBEZWFj
b24gPHdpbGxAa2VybmVsLm9yZz4KPiA+ICBNOiAgICAgUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBp
bmZyYWRlYWQub3JnPgo+ID4gLVI6ICAgICBCb3F1biBGZW5nIDxib3F1bi5mZW5nQGdtYWlsLmNv
bT4KPiA+ICtNOiAgICAgQm9xdW4gRmVuZyA8Ym9xdW4uZmVuZ0BnbWFpbC5jb20+Cj4gPiAgUjog
ICAgIE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+Cj4gPiAgTDogICAgIGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiA+ICBTOiAgICAgTWFpbnRhaW5lZAo+ID4gQEAgLTM2
NDQsNiArMzY0NCw4IEBAIEY6ICAgICAgICBhcmNoLyovaW5jbHVkZS9hc20vYXRvbWljKi5oCj4g
PiAgRjogICAgIGluY2x1ZGUvKi9hdG9taWMqLmgKPiA+ICBGOiAgICAgaW5jbHVkZS9saW51eC9y
ZWZjb3VudC5oCj4gPiAgRjogICAgIHNjcmlwdHMvYXRvbWljLwo+ID4gK0Y6ICAgICBydXN0L2tl
cm5lbC9zeW5jL2F0b21pYy5ycwo+ID4gK0Y6ICAgICBydXN0L2tlcm5lbC9zeW5jL2F0b21pYy8K
PiAKPiBUaGlzIGlzIHdoeSBtb2QucnMgZmlsZXMgYXJlIHN1cGVyaW9yIDopCj4gCgo7LSkgTm90
IGdvaW5nIHRvIGRvIGFueXRoaW5nIHJpZ2h0IG5vdywgYnV0IGxldCBtZSB0aGluayBhYm91dCB0
aGlzLgoKPiA+IEBAIC0wLDAgKzEsMTkgQEAKPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMAo+ID4gKwo+ID4gKy8vISBBdG9taWMgcHJpbWl0aXZlcy4KPiA+ICsvLyEKPiA+
ICsvLyEgVGhlc2UgcHJpbWl0aXZlcyBoYXZlIHRoZSBzYW1lIHNlbWFudGljcyBhcyB0aGVpciBD
IGNvdW50ZXJwYXJ0czogYW5kIHRoZSBwcmVjaXNlIGRlZmluaXRpb25zIG9mCj4gPiArLy8hIHNl
bWFudGljcyBjYW4gYmUgZm91bmQgYXQgW2BMS01NYF0uIE5vdGUgdGhhdCBMaW51eCBLZXJuZWwg
TWVtb3J5IChDb25zaXN0ZW5jeSkgTW9kZWwgaXMgdGhlCj4gPiArLy8hIG9ubHkgbW9kZWwgZm9y
IFJ1c3QgY29kZSBpbiBrZXJuZWwsIGFuZCBSdXN0J3Mgb3duIGF0b21pY3Mgc2hvdWxkIGJlIGF2
b2lkZWQuCj4gPiArLy8hCj4gPiArLy8hICMgRGF0YSByYWNlcwo+ID4gKy8vIQo+ID4gKy8vISBb
YExLTU1gXSBhdG9taWNzIGhhdmUgZGlmZmVyZW50IHJ1bGVzIHJlZ2FyZGluZyBkYXRhIHJhY2Vz
Ogo+ID4gKy8vIQo+ID4gKy8vISAtIEEgbm9ybWFsIHJlYWQgZG9lc24ndCBkYXRhLXJhY2Ugd2l0
aCBhbiBhdG9taWMgcmVhZC4KPiAKPiBUaGlzIHdhcyBmaXhlZDoKPiBodHRwczovL2dpdGh1Yi5j
b20vcnVzdC1sYW5nL3J1c3QvcHVsbC8xMjg3NzgKPiAKClllYWgsIEkgd2FzIGF3YXJlIG9mIHRo
YXQgZWZmb3J0LCBhbmQgZ29vZCB0byBrbm93IGl0J3MgZmluYWxseSBtZXJnZWQuClRoYW5rcyEK
ClRoaXMgd2lsbCBiZSBpbiAxLjgzLCByaWdodD8gSWYgc28sIHdlIHdpbGwgc3RpbGwgbmVlZCB0
aGUgYWJvdmUgdW50aWwKd2UgYnVtcCB1cCB0aGUgbWluaW1hbCBydXN0YyB2ZXJzaW9uIHRvIDEu
ODMgb3IgYmV5b25kLiBJIHdpbGwgaGFuZGxlCnRoaXMgcHJvcGVybHkgd2l0aCB0aGUgbWluaW1h
bCBydXN0YyAxLjgzIChpLmUuIGlmIHRoaXMgZ29lcyBpbiBmaXJzdCwKd2lsbCBzZW5kIGEgZm9s
bG93IHVwIHBhdGNoKS4gSSB3aWxsIGFsc28gbWVudGlvbiBpbiB0aGUgYWJvdmUgdGhhdCB0aGlz
CmhhcyBiZWVuIGNoYW5nZWQgaW4gMS44My4KClRoaXMgYWxzbyByZW1pbmRzIHRoYXQgSSBzaG91
bGQgYWRkIHRoYXQgTEtNTSBhbGxvd3MgbWl4ZWQtc2l6ZSBhdG9taWMKYWNjZXNzZXMgKGFzIG5v
biBkYXRhIHJhY2UpLCBJIHdpbGwgYWRkIHRoYXQgaW4gdGhlIHZlcnNpb24uCgo+ID4gK21vZCBw
cml2YXRlIHsKPiA+ICsgICAgLy8vIFNlYWxlZCB0cmFpdCBtYXJrZXIgdG8gZGlzYWJsZSBjdXN0
b21pemVkIGltcGxzIG9uIGF0b21pYyBpbXBsZW1lbnRhdGlvbiB0cmFpdHMuCj4gPiArICAgIHB1
YiB0cmFpdCBTZWFsZWQge30KPiA+ICt9Cj4gCj4gSnVzdCBtYWtlIHRoZSB0cmFpdCB1bnNhZmU/
Cj4gCgpBbmQgbWFrZSB0aGUgc2FmZXR5IHJlcXVpcmVtZW50IG9mIGBBdG9taWNJbXBsYCBzb21l
dGhpbmcgbGlrZToKCiAgICBUaGUgdHlwZSBtdXN0IGhhdmUgdGhlIGltcGxlbWVudGF0aW9uIGZv
ciBhdG9taWMgb3BlcmF0aW9ucy4KCj8gSG1tLi4gSSBkb24ndCB0aGluayB0aGF0J3MgYSBnb29k
IHNhZmV0eSByZXF1aXJlbWVudCBUQkguIEFjdHVhbGx5IHRoZQpyZWFzb24gdGhhdCB3ZSBuZWVk
IHRvIHJlc3RyaWN0IGBBdG9taWNJbXBsYCB0eXBlcyBpcyBtb3JlIG9mIGFuCmlwbGVtZW50YXRp
b24gaXNzdWUgKHRoZSBpbXBsZW1lbnRhdGlvbiBuZWVkIHRvIGJlIGRvbmUgaWYgd2Ugd2FudCB0
bwpzdXBwb3J0IGk4IG9yIGkxNikgcmF0aGVyIHRoYW4gc2FmZXR5IGlzc3VlLiBTbyBhIHNlYWxl
ZCB0cmFpdCBpcyBwcm9wZXIKaGVyZS4gRG9lcyB0aGlzIG1ha2Ugc2Vuc2U/IE9yIGFtIEkgbWlz
c2luZyBzb21ldGhpbmc/CgpSZWdhcmRzLApCb3F1bgoKPiBBbGljZQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
