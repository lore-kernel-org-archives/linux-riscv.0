Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E15C636D4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 14:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BI0HhD/4cqkSnGZoQGJ27A4Rt85MGHOFOi+hc1upVlQ=; b=4FsegUjYHTIWto
	qzu9sMprwqWDD5s06URkBX/CjgBQredDTxwbCWV0e9EgrB4Cgis18gVIwS0zHZU6TCa8ZuWyKc7FF
	1CJ8TlG+9jFJVlwa5UuvpnMmfy3nh955uiNmrlgn1qgCWoMm7F9/SQe6ybNPNTqSVQ6+h5B/QV3xG
	f472YerGwEaqthcK9f2ClCIXjZS/Z1/KiDxaJlw8SBnJk5k+5vYp7wzYm4PGv6edqHEApR8XZIgIY
	IHi5EKFWADO/yjqcTtBQNwVnr48DyfUMxzVA6fkQMt3SvzerIOd/n/t/Smpi/e8Ha6l/9XsdMZRui
	IyrlJ9oGtda3CjPTDvjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRZr9-00Ez0H-Lu; Mon, 13 Feb 2023 14:30:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRZr6-00Eyy8-Tw
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 14:30:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A4FB16108D;
	Mon, 13 Feb 2023 14:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F96EC433EF;
	Mon, 13 Feb 2023 14:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676298651;
	bh=cDc4IsiB86tpg1vB4zCOCaSjbBP1jEgnrT19b56SQY4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Bd+N4+6m85prGtqvR00XliSxuGo9oQ6xTSHk85/NRIEtA5W/dx9pI5vJywxA0Bmcy
	 y2mNflRkXrMzaPXOn9K4yiLoHBTqEb4HGsL7SZzKYxjUyKGEgbzAVZGORrnZNA1yX/
	 PAv076SK4ckRYh/lp9NIzXj079tyAdQOHuXjGTsGPmYlZCTxG9JIuJV0RYHD0DCrRz
	 n7K+fuQI7g+zSj/B81t/H1C3hmwxwiBIS47reB8bpZmp/KwFV+XP50Kcg3EFVmz+Bu
	 PdlWv6vUWr7WZEXSu7XRKXfDvMVzKAEf6g8HMWkgyUkozVaC09u1KPUvHwT5EuSzay
	 6Moeh+0R24oiQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 bpf@vger.kernel.org, netdev@vger.kernel.org
Cc: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Jean-Philippe
 Brucker
 <jean-philippe@linaro.org>, linux-kselftest@vger.kernel.org, Anders Roxell
 <anders.roxell@linaro.org>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH bpf-next] selftests/bpf: Cross-compile bpftool
In-Reply-To: <20230210084326.1802597-1-bjorn@kernel.org>
References: <20230210084326.1802597-1-bjorn@kernel.org>
Date: Mon, 13 Feb 2023 15:30:48 +0100
Message-ID: <87pmad63jb.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_063057_045533_A807AE04 
X-CRM114-Status: GOOD (  13.46  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBGcm9tOiBCasO2cm4g
VMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4KPiBXaGVuIHRoZSBCUEYgc2VsZnRlc3RzIGFy
ZSBjcm9zcy1jb21waWxlZCwgb25seSB0aGUgYSBob3N0IHZlcnNpb24gb2YKPiBicGZ0b29sIGlz
IGJ1aWx0LiBUaGlzIHZlcnNpb24gb2YgYnBmdG9vbCBpcyB1c2VkIHRvIGdlbmVyYXRlIHZhcmlv
dXMKPiBpbnRlcm1lZGlhdGVzLCBlLmcuLCBza2VsZXRvbnMuCj4KPiBUaGUgdGVzdCBydW5uZXJz
IGFyZSBhbHNvIHVzaW5nIGJwZnRvb2wuIFRoZSBNYWtlZmlsZSB3aWxsIHN5bWxpbmsKPiBicGZ0
b29sIGZyb20gdGhlIHNlbGZ0ZXN0L2JwZiByb290LCB3aGVyZSB0aGUgdGVzdCBydW5uZXJzIHdp
bGwgbG9vawo+IGZvciB0aGUgdG9vbDoKPgo+ICAgfCAuLi4KPiAgIHwgJChRKWxuIC1zZiAkKGlm
ICQyLC4uLC4pL3Rvb2xzL2J1aWxkL2JwZnRvb2wvYm9vdHN0cmFwL2JwZnRvb2wgXAo+ICAgfCAg
ICAkKE9VVFBVVCkvJChpZiAkMiwkMi8pYnBmdG9vbAo+Cj4gVGhlcmUgYXJlIHR3byBpc3N1ZXMg
Zm9yIGNyb3NzLWNvbXBpbGF0aW9uIGJ1aWxkczoKPgo+ICAxLiBUaGVyZSBpcyBubyBuYXRpdmUg
KGNyb3NzLWNvbXBpbGF0aW9uIHRhcmdldCkgYnVpbGQgb2YgYnBmdG9vbAo+ICAyLiBUaGUgYm9v
dHN0cmFwIHZhcmlhbnQgb2YgYnBmdG9vbCBpcyBuZXZlciBjcm9zcy1jb21waWxlZCAoYnkKPiAg
ICAgZGVzaWduKQo+Cj4gTWFrZSBzdXJlIHRoYXQgYSBuYXRpdmUvY3Jvc3MtY29tcGlsZWQgdmVy
c2lvbiBvZiBicGZ0b29sIGlzIGJ1aWx0LAo+IGFuZCBpZiBDUk9TU19DT01QSUxFIGlzIHNldCwg
c3ltbGluayB0byB0aGUgbmF0aXZlL25vbi1ib290c3RyYXAKPiB2ZXJzaW9uLgoKLi4uYW5kIHRo
ZSBncmFuZCBtYXN0ZXIgcGxhbiBpcyB0byBhZGQgQlBGIENJIHN1cHBvcnQgZm9yIHJpc2N2NjQs
IHdoZXJlCnRoaXMgcGF0Y2ggYSBwcmVyZXF1aXNpdGUgdG8gWzFdLiBJIHdvdWxkIHN1c3BlY3Qg
dGhhdCBvdGhlciBwbGF0Zm9ybXMKbWlnaHQgYmVuZWZpdCBmcm9tIGNyb3NzLWNvbXBpbGF0aW9u
IGJ1aWxkcyBhcyB3ZWxsLgoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9rZXJuZWwtcGF0Y2hlcy92
bXRlc3QvcHVsbC8xOTQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
