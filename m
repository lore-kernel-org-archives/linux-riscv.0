Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E842E7717F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 20:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/1toOJcKcSjkCOHOTEVZ1T2iSl7PCEHq1d/JxOAc+qE=; b=dLTON5Uun/P1nF
	U4ulwFkyA7taEjgv7SKZUqdIogqdDKiMiogl+H+1S12Iue7FxFeTVzSQqGjVg/mqMzqZC/rBWIu34
	2SH8WXwdjmqoPD4rwiEEGqByjFk4nI0kIVGUgIeGprf278ZSY7TZe1DpsyuOSLIM9JkbDxHEQHtXt
	ZKV9wc4lZmh4DAMKB7L1hesn0cgyHK50OgLD85t5h4MkTae4SVk7OgXCAJrrFBq+FgLX0hRozkqoA
	rznkEklhXm/5taCCYHN9cNUWcW8rm4NYWyqF8kJ07lgaCUHAPxc4kcNaKSSxXrw5BolR8uwvpqtoL
	f+sMaDDmpKSX0rEdXvTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMC2F-00000004x3I-2tWo;
	Fri, 13 Dec 2024 20:13:15 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMC2C-00000004x1r-3XD4;
	Fri, 13 Dec 2024 20:13:14 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6dccccd429eso1283996d6.3;
        Fri, 13 Dec 2024 12:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734120791; x=1734725591; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iRonZJxea5tra4fNXdRilKepTreMvxGV66B9FX5uzo8=;
        b=itIMzPqF4v7Ta6Vg1fpz4BQP3L1gSzL6iZDbrixNRxbLQBMv/HaWYctZ6uFV3Z6pHr
         4S+UpZeSjNFzAt2WF/209cx97Dx6lGQSiWLaF2CIiYnWOAqDHpl01ut0ZXs1dg32GKS6
         rD/KWUoJu8cbJtNPkBFhcydwTa+02XBRfEzONMGlkouqJYhm7R8dfWqxR79bi8PZKITb
         6WBabXe2mIUWgd+/IVldgxSuTX1/peBELsl3/ucLNDT7MUU+5z4/flAGRiaAGl6Rlsa4
         WdjKH5dlIAdlXRfTVCsYF2o8nFGZ1+KpO4Dcr0yywc7gjAgtuFD1uD4JtAf364Izef4V
         nnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734120791; x=1734725591;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iRonZJxea5tra4fNXdRilKepTreMvxGV66B9FX5uzo8=;
        b=hG7qBDEAHSepVYFsNHGeYXrSCP+p0CxCQ3ufQnUq8KlfkHdvCWtS3/aOYbq6KCcUVQ
         jd9AGVe9fjW99DOo5qIjzKG6UGxObTNtP0xXqp8WDqxPVd7rd+uLlbp89TycaukPK+uv
         bCbFIliMjLHNdQThgZ/+5b4D//YYTqErK1EJBBNFtdMbY9oMmVDE9aM+3c3reSV/OXGq
         cSzImmU/07rGqhXisVQ8I3MwlUc9YMrNMvyk10h6f/i4zkM863P7DFo6ZiKDDI5a2y/G
         fy7dz8tQvjC2/Nx7aFo+AFBGPvUBMp21Q7iy0KUA8FUNMVLzBVp0dSLAoTAn6zoDjP4h
         uXCg==
X-Forwarded-Encrypted: i=1; AJvYcCWsS/ekXI2Oe1qsJuU1CbcZMiatvByEz87YaTNFVjdMj4NcL47oz3tfTWcikhsNJF/l6fx7BpgaF8F7WsI=@lists.infradead.org, AJvYcCWxCGkjppTCcx0RA72vEaXWOkIj8OVKXll8Go9+uT2vH/t9l1ETvU+sAYGFprSFc7FpfAKdYWHBtXHO/DsO9LxB@lists.infradead.org
X-Gm-Message-State: AOJu0YyPQQZS1xSIe4v4KaGtyOhA8dlUgt/fAf9CuxbzOSh2/TuOHL5l
	YRqIA8vL+BxtWWarM9K1e1tmyKCTzJtdCpNRof+oaSn8ygRn6qcu
X-Gm-Gg: ASbGnctwCK6ejIEi+hqhXmTEewlTGfPd9MizDiOh0GrgHhGsVEA8A6RD4nuNHX3mpoU
	k17H7CSnT0w3ceM8hkKykRPEE4r7AnJohApTXYfvRXN39YjiBtucJ3IjRmhOb85A5ox2kfnZCwE
	slg0gaygHtLwlBapgFTUka0qCe/alyh/3IzvxQjliAe1/XfktJ9Xv7bV7haeFsW/k3vrCTork1L
	vwX+IOGE5pY/M2+qDV9GjAMDPGJ07khtkIqudMMgK4/EljJzXYfzHu1kb/F5bNmS5zUC0VjV07l
	1lzP+atOyKgihM/Pdw6kpNB7bsZcbYZhHHbp2vv9S6XmHhY=
X-Google-Smtp-Source: AGHT+IG1PW/C5OMjo4cQ0IoIVEfOD0HFvhBMielHi6rGrf7TgUA3hF8fjAtB05FlB63eXg9v86DtGA==
X-Received: by 2002:a05:6214:21a9:b0:6d8:9002:bde2 with SMTP id 6a1803df08f44-6dc8ca93c47mr58205836d6.28.1734120790880;
        Fri, 13 Dec 2024 12:13:10 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2cbb69asm1138711cf.39.2024.12.13.12.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 12:13:10 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 73AE9120006A;
	Fri, 13 Dec 2024 15:13:09 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 13 Dec 2024 15:13:09 -0500
X-ME-Sender: <xms:VZVcZ2qm-gu0s5limXzj9CZtxmfXx-mAmK6XnJfcqZqIlz2H7Jg3Lg>
    <xme:VZVcZ0oz6uhXAI5mxSKLN9h20-Upxd-X6g00btvJxS-QjAmx4cL7LNMaXQOfaSIp6
    Wps8lgGWLSKs9fybw>
X-ME-Received: <xmr:VZVcZ7OqZAG8r-rJe68lZBczKBXcFOthWJt97mY426ybeMQERtCYzdJIEMD3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrkeejgddufedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhepvefghfeuveekudetgfevudeuudejfeeltdfh
    gfehgeekkeeigfdukefhgfegleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeehjedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrd
    gtohhmpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheprhgtuhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdgrrhgthhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehllhhvmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehl
    khhmmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehojhgvuggrsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgt
    ohhm
X-ME-Proxy: <xmx:VZVcZ17sIOWSp0-LnbL-fy2QYuFdSefH1z64bjLq5i0dlHHmLM4ABw>
    <xmx:VZVcZ17cTMpI_xHOYGh92J2TPP7xAIvXKWEVuYhNw1ypPrtkJoMSIQ>
    <xmx:VZVcZ1jkRFzWZAWC-Ye4VlQO89TxiV19LoR25aIcLJrsS0YavTcA9Q>
    <xmx:VZVcZ_7aOXLCRagx9UfKTR-SJr85felqwQWrfbxdholKhOG_rXSiXA>
    <xmx:VZVcZwI_O8zWb7p8jSNmkNTjjYElFeZR68mnl6uDR6jLfCN-yWQAj0yk>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Dec 2024 15:13:07 -0500 (EST)
Date: Fri, 13 Dec 2024 12:13:06 -0800
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
Subject: Re: [RFC v2 04/13] rust: sync: atomic: Add generic atomics
Message-ID: <Z1yVUmGBIxKH1xR-@tardis.local>
References: <20241101060237.1185533-1-boqun.feng@gmail.com>
 <20241101060237.1185533-5-boqun.feng@gmail.com>
 <CAH5fLgjhQouU=kqVx7LET2yeWt6sKt-VO5PR5SnQ8doaG4ihuQ@mail.gmail.com>
 <Z1seogLmy5H8-hXn@boqun-archlinux>
 <CAH5fLgjGg8_s8imOkmPb0yLAMwD1sF1aoBZWkAy-YLNh41zCuw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH5fLgjGg8_s8imOkmPb0yLAMwD1sF1aoBZWkAy-YLNh41zCuw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_121312_883971_0B64CFD1 
X-CRM114-Status: GOOD (  37.23  )
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

T24gRnJpLCBEZWMgMTMsIDIwMjQgYXQgMDM6MzI6NDdQTSArMDEwMCwgQWxpY2UgUnlobCB3cm90
ZToKPiBPbiBUaHUsIERlYyAxMiwgMjAyNCBhdCA2OjM04oCvUE0gQm9xdW4gRmVuZyA8Ym9xdW4u
ZmVuZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgRGVjIDEyLCAyMDI0IGF0IDEx
OjU3OjA3QU0gKzAxMDAsIEFsaWNlIFJ5aGwgd3JvdGU6Cj4gPiBbLi4uXQo+ID4gPiA+IGRpZmYg
LS1naXQgYS9ydXN0L2tlcm5lbC9zeW5jL2F0b21pYy9nZW5lcmljLnJzIGIvcnVzdC9rZXJuZWwv
c3luYy9hdG9taWMvZ2VuZXJpYy5ycwo+ID4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+
ID4gaW5kZXggMDAwMDAwMDAwMDAwLi4yMDRkYTM4ZTI2OTEKPiA+ID4gPiAtLS0gL2Rldi9udWxs
Cj4gPiA+ID4gKysrIGIvcnVzdC9rZXJuZWwvc3luYy9hdG9taWMvZ2VuZXJpYy5ycwo+ID4gPiA+
IEBAIC0wLDAgKzEsMjUzIEBACj4gPiA+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wCj4gPiA+ID4gKwo+ID4gPiA+ICsvLyEgR2VuZXJpYyBhdG9taWMgcHJpbWl0aXZlcy4K
PiA+ID4gPiArCj4gPiA+ID4gK3VzZSBzdXBlcjo6b3BzOjoqOwo+ID4gPiA+ICt1c2Ugc3VwZXI6
Om9yZGVyaW5nOjoqOwo+ID4gPiA+ICt1c2UgY3JhdGU6OnR5cGVzOjpPcGFxdWU7Cj4gPiA+ID4g
Kwo+ID4gPiA+ICsvLy8gQSBnZW5lcmljIGF0b21pYyB2YXJpYWJsZS4KPiA+ID4gPiArLy8vCj4g
PiA+ID4gKy8vLyBgVGAgbXVzdCBpbXBsIFtgQWxsb3dBdG9taWNgXSwgdGhhdCBpcywgYW4gW2BB
dG9taWNJbXBsYF0gaGFzIHRvIGJlIGNob3Nlbi4KPiA+ID4gPiArLy8vCj4gPiA+ID4gKy8vLyAj
IEludmFyaWFudHMKPiA+ID4gPiArLy8vCj4gPiA+ID4gKy8vLyBEb2luZyBhbiBhdG9taWMgb3Bl
cmF0aW9uIHdoaWxlIGhvbGRpbmcgYSByZWZlcmVuY2Ugb2YgW2BTZWxmYF0gd29uJ3QgY2F1c2Ug
YSBkYXRhIHJhY2UsIHRoaXMKPiA+ID4gPiArLy8vIGlzIGd1YXJhbnRlZWQgYnkgdGhlIHNhZmV0
eSByZXF1aXJlbWVudCBvZiBbYFNlbGY6OmZyb21fcHRyYF0gYW5kIHRoZSBleHRyYSBzYWZldHkg
cmVxdWlyZW1lbnQKPiA+ID4gPiArLy8vIG9mIHRoZSB1c2FnZSBvbiBwb2ludGVycyByZXR1cm5l
ZCBieSBbYFNlbGY6OmFzX3B0cmBdLgo+ID4gPiA+ICsjW3JlcHIodHJhbnNwYXJlbnQpXQo+ID4g
PiA+ICtwdWIgc3RydWN0IEF0b21pYzxUOiBBbGxvd0F0b21pYz4oT3BhcXVlPFQ+KTsKPiA+ID4g
PiArCj4gPiA+ID4gKy8vIFNBRkVUWTogYEF0b21pYzxUPmAgaXMgc2FmZSB0byBzaGFyZSBhbW9u
ZyBleGVjdXRpb24gY29udGV4dHMgYmVjYXVzZSBhbGwgYWNjZXNzZXMgYXJlIGF0b21pYy4KPiA+
ID4gPiArdW5zYWZlIGltcGw8VDogQWxsb3dBdG9taWM+IFN5bmMgZm9yIEF0b21pYzxUPiB7fQo+
ID4gPgo+ID4gPiBTdXJlbHkgaXQgc2hvdWxkIGFsc28gYmUgU2VuZD8KPiA+ID4KPiA+Cj4gPiBJ
dCdzIGBTZW5kYCBoZXJlIGJlY2F1c2UgYE9wYXF1ZTxUPmAgaXMgYFNlbmRgIHdoZW4gYFRgIGlz
IGBTZW5kYC4gQW5kCj4gPiBpbiBwYXRjaCAjOSwgSSBjaGFuZ2VkIHRoZSBkZWZpbml0aW9uIG9m
IGBBbGxvd0F0b21pY2AsIHdoaWNoIGlzIG5vdCBhCj4gPiBzdWJ0cmFpdCBvZiBgU2VuZGAgYW55
bW9yZSwgYW5kIGFuIGBpbXBsIFNlbmRgIGJsb2NrIHdhcyBhZGRlZCB0aGVyZS4KPiA+Cj4gPiA+
ID4gKy8vLyBBdG9taWNzIHRoYXQgc3VwcG9ydCBiYXNpYyBhdG9taWMgb3BlcmF0aW9ucy4KPiA+
ID4gPiArLy8vCj4gPiA+ID4gKy8vLyBUT0RPOiBVbmxlc3MgdGhlIGBpbXBsYCBpcyBhIGAjW3Jl
cHIodHJhbnNwYXJldCldYCBuZXcgdHlwZSBvZiBhbiBleGlzdGluZyBbYEFsbG93QXRvbWljYF0s
IHRoZQo+ID4gPiA+ICsvLy8gaW1wbCBibG9jayBzaG91bGQgYmUgb25seSBkb25lIGluIGF0b21p
YyBtb2QuIEFuZCBjdXJyZW50bHkgb25seSBiYXNpYyBpbnRlZ2VyIHR5cGVzIGNhbgo+ID4gPiA+
ICsvLy8gaW1wbGVtZW50IHRoaXMgdHJhaXQgaW4gYXRvbWljIG1vZC4KPiA+ID4KPiA+ID4gV2hh
dCdzIHVwIHdpdGggdGhpcyBUT0RPPyBDYW4ndCB5b3UganVzdCB3cml0ZSBhbiBhcHByb3ByaWF0
ZSBzYWZldHkKPiA+ID4gcmVxdWlyZW1lbnQ/Cj4gPiA+Cj4gPgo+ID4gQmVjYXVzZSB0aGUgbGlt
aXRlZCBzY29wZSBvZiB0eXBlcyB0aGF0IGFsbG93cyBhdG9taWMgaXMgYW4gYXJ0aWZpY2lhbAo+
ID4gY2hvaWNlLCBpLmUuIHdlIHdhbnQgdG8gc3RhcnQgd2l0aCBhIGxpbWl0ZWQgbnVtYmVyIG9m
IHR5cGVzIGFuZCBtYWtlCj4gPiBmb3J3YXJkIHByb2dyZXNzLCBhbmQgdGhlIHR5cGVzIHRoYXQg
d2UgZG9uJ3Qgd2FudCB0byBzdXBwb3J0IGF0b21pY3MKPiA+IGZvciBub3cgYXJlIG5vdCBiZWNh
dXNlIG9mIHNhZmV0eSByZWFzb25zLCBidXQgbW9yZSBvZiBhIGxhY2sgb2YKPiA+IHVzZXJzL21v
dGl2YXRpb25zLiBTbyBJIGRvbid0IHRoaW5rIHRoaXMgaXMgc29tZXRoaW5nIHdlIHNob3VsZCB1
c2UKPiA+IHNhZmV0eSByZXF1aXJlbWVudCB0byBkZXNjcmliZS4KPiAKPiBJIGZvdW5kIHRoZSB3
b3JkaW5nIHZlcnkgY29uZnVzaW5nLiBDb3VsZCB5b3UgcmV3b3JkIGl0IHRvIHNheQo+IHNvbWV0
aGluZyBhYm91dCBmdXR1cmUgcG9zc2liaWxpdGllcz8KPiAKClN1cmUsIGhvdyBhYm91dDoKCi8v
LyBUT0RPOiBDdXJyZW50bHkgdGhlIFtgQWxsb3dBdG9taWNgXSB0eXBlcyBhcmUgcmVzdHJpY3Rl
ZCB3aXRoaW4KLy8vIGJhc2ljIGludGVnZXIgdHlwZXMgKGFuZCB0aGVpciB0cmFuc3BhcmVudCBu
ZXcgdHlwZXMpLiBJbiB0aGUKLy8vIGZ1dHVyZSwgd2UgY291bGQgZXh0ZW5kIHRoZSBzY29wZSB0
byBtb3JlIGRhdGEgdHlwZXMgd2hlbiB0aGVyZSBpcyBhCi8vLyBjbGVhciBhbmQgbWVhbmluZ2Z1
bCB1c2FnZSwgYnV0IGZvciBub3csIFtgQWxsb3dBdG9taWNgXSBzaG91bGQgb25seQovLy8gYmUg
aW1wbGVtZW50ZWQgaW5zaWRlIGF0b21pYyBtb2QgZm9yIHRoZSByZXN0cmljdGVkIHR5cGVzIG1l
bnRpb25lZAovLy8gYWJvdmUuCgo/Cgo+ID4gPiA+ICsvLy8gIyBTYWZldHkKPiA+ID4gPiArLy8v
Cj4gPiA+ID4gKy8vLyBbYFNlbGZgXSBtdXN0IGhhdmUgdGhlIHNhbWUgc2l6ZSBhbmQgYWxpZ25t
ZW50IGFzIFtgU2VsZjo6UmVwcmBdLgo+ID4gPiA+ICtwdWIgdW5zYWZlIHRyYWl0IEFsbG93QXRv
bWljOiBTaXplZCArIFNlbmQgKyBDb3B5IHsKPiA+ID4gPiArICAgIC8vLyBUaGUgYmFja2luZyBh
dG9taWMgaW1wbGVtZW50YXRpb24gdHlwZS4KPiA+ID4gPiArICAgIHR5cGUgUmVwcjogQXRvbWlj
SW1wbDsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAvLy8gQ29udmVydHMgaW50byBhIFtgU2VsZjo6
UmVwcmBdLgo+ID4gPiA+ICsgICAgZm4gaW50b19yZXByKHNlbGYpIC0+IFNlbGY6OlJlcHI7Cj4g
PiA+ID4gKwo+ID4gPiA+ICsgICAgLy8vIENvbnZlcnRzIGZyb20gYSBbYFNlbGY6OlJlcHJgXS4K
PiA+ID4gPiArICAgIGZuIGZyb21fcmVwcihyZXByOiBTZWxmOjpSZXByKSAtPiBTZWxmOwo+ID4g
Pgo+ID4gPiBXaGF0IGRvIHlvdSBuZWVkIHRoZXNlIG1ldGhvZHMgZm9yPwo+ID4gPgo+ID4KPiA+
IENvbnZlcnRpbmcgYSBgQXRvbWljSW1wbGAgdmFsdWUgKGN1cnJlbnRseSBvbmx5IGBpMzJgIGFu
ZCBgaTY0YCkgdG8gYQo+ID4gYEFsbG93QXRvbWljYCB2YWx1ZSB3aXRob3V0IHVzaW5nIHRyYW5z
bXV0ZSBpbiBgaW1wbGAgYmxvY2sgb2YKPiA+IGBBdG9taWM8VD5gLiBBbnkgYmV0dGVyIGlkZWE/
Cj4gCj4gWW91IGNvdWxkIHVzZSB0cmFuc211dGU/Cj4gCgpJbiBhIGRyYWZ0IHZlcnNpb24sIEkg
ZGlkIHVzZSB0cmFuc211dGUsIGJ1dCBCZW5ubyBjb21tZW50ZWQgdGhhdCBoZQp3YW50ZWQgdG8g
YXZvaWQgYXJiaXRyYXJ5IHRyYW5zbXV0ZSBhcyBoYXJkIGFzIHBvc3NpYmxlIChpZiBJIGRpZG4n
dAptaXN1bmRlcnN0YW5kIGhpbSkuIEhlbmNlIHRoZXNlIHR3byBmdW5jdGlvbnMgYXJlIHByb3Zp
ZGVkLiBOb3cgdGhpbmsKYWJvdXQgaXQsIEkgZG9uJ3QgdGhpbmsgZG9pbmcgZWl0aGVyIHdheSAo
dHJhbnNtdXRlIG9yICpfcmVwcigpCmZ1bmN0aW9uKSB3b3VsZCBhZmZlY3QgbW9zdCBvZiB1c2Vy
cywgc2luY2UgbW9zdCBvZiB1c2VycyB3b24ndCBuZWVkIHRvIAppbXBsIGBBbGxvd0F0b21pY2Ag
dGhlbXNlbHZlcywgdGhlcmVmb3JlIEkgdGhpbmsga2VlcGluZyBpdCBhcyBpdCBpcyBpcwpmaW5l
LiBEbyB5b3UgaGF2ZSBhbnkgdXNlciBvYnNlcnZhYmxlIGNvbmNlcm4gb2YgZGVmaW5pbmcgdGhl
c2UKZnVuY3Rpb25zPwoKUmVnYXJkcywKQm9xdW4KCj4gQWxpY2UKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
