Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0F1C61DA4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 09:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2Y9566ZeF4P4aNzy25mbvYacsUt0y1GcAY0VQ9XaAw=; b=bviipwSB2nk0o8
	XXaC5u419sdhUJfWW4xtyr7tpuiPlrXgqcCh7bcOMB1VJ3Owx6StyY3+I2Yqpn5x5R/8a9j3ZUJ9J
	T/n2t66IF93zX7NRPd1Aa+BulAG40GeARAsbSZdhNmOI6dt8gbCQJMrYi416R6fvTngTZRjXZPZi0
	+WF6L8eTogxmlRQDe4/Rd1xiSaQad4NU8+aY5kkQh3IHajkD9O6gCmomY9FbOOd+X0uR/M5v7bopq
	a1yHpwTOLv9nS8eAqVu8nDlRUY6figXefcloyptNpsQmmxz1yLmVHsS8wuzCEKpWHQNpUpxMrP/HG
	I0ueyxqZFL66ICRJs/rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrrb-000mCG-0U; Tue, 14 Feb 2023 09:44:39 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrrY-000mB5-6Z
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 09:44:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C605AB81CA5;
	Tue, 14 Feb 2023 09:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2965AC433D2;
	Tue, 14 Feb 2023 09:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676367873;
	bh=FOmsk5fnXqo2RHs4yKki8c5ZfBF1FXU8FSjoNcYsGtE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LFPC2xCHyZEp+4VSCp/bh0BjqK/nLUOVJuP44VcN3L6g+/v7hByLQ08R6Qw1JLtiE
	 lmWOAKkcIGrpkyOknb7ezKfSurGekGVRYptLz8LM2H+SpRKrW7pTcWWQvjH2lwTVrS
	 i5VH1nQmrRh7+iGeMos/QYBsK8HL95Bxc/KwclK8dsRWqASBi7QXOM1bwQG4tPekUt
	 tx01+zA4cC0ij4RJYk6qOTcPd0ZmM1t+Q3sU4P1fTVIoQUGX2X1NKDm9lkQIdRzstG
	 hxADpk4AnrP/BziRQ/d6cavRWEZuoi+SgkEkd/eenlIKudozD4YVdbv2OaCrfjRTES
	 Ws/yVWPpMwCeg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Zachary Leaf <zachary.leaf@arm.com>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, bpf@vger.kernel.org, netdev@vger.kernel.org
Cc: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Jean-Philippe
 Brucker
 <jean-philippe@linaro.org>, linux-kselftest@vger.kernel.org, Anders Roxell
 <anders.roxell@linaro.org>, linux-riscv@lists.infradead.org, Quentin
 Monnet <quentin@isovalent.com>, linux-morello@op-lists.linaro.org
Subject: Re: [PATCH bpf-next] selftests/bpf: Cross-compile bpftool
In-Reply-To: <9d83e21c-01c8-9729-0e2b-54d405b6b1ee@arm.com>
References: <20230210084326.1802597-1-bjorn@kernel.org>
 <87pmad63jb.fsf@all.your.base.are.belong.to.us>
 <9d83e21c-01c8-9729-0e2b-54d405b6b1ee@arm.com>
Date: Tue, 14 Feb 2023 10:44:30 +0100
Message-ID: <87y1p08ttt.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_014436_415736_FD635F42 
X-CRM114-Status: GOOD (  12.26  )
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

WmFjaGFyeSBMZWFmIDx6YWNoYXJ5LmxlYWZAYXJtLmNvbT4gd3JpdGVzOgoKPiBPbiAxMy8wMi8y
MDIzIDE0OjMwLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+PiBCasO2cm4gVMO2cGVsIDxiam9ybkBr
ZXJuZWwub3JnPiB3cml0ZXM6Cj4+IAo+Pj4gRnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2
b3NpbmMuY29tPgo+Pj4KPj4+IFdoZW4gdGhlIEJQRiBzZWxmdGVzdHMgYXJlIGNyb3NzLWNvbXBp
bGVkLCBvbmx5IHRoZSBhIGhvc3QgdmVyc2lvbiBvZgo+Pj4gYnBmdG9vbCBpcyBidWlsdC4gVGhp
cyB2ZXJzaW9uIG9mIGJwZnRvb2wgaXMgdXNlZCB0byBnZW5lcmF0ZSB2YXJpb3VzCj4+PiBpbnRl
cm1lZGlhdGVzLCBlLmcuLCBza2VsZXRvbnMuCj4+Pgo+Pj4gVGhlIHRlc3QgcnVubmVycyBhcmUg
YWxzbyB1c2luZyBicGZ0b29sLiBUaGUgTWFrZWZpbGUgd2lsbCBzeW1saW5rCj4+PiBicGZ0b29s
IGZyb20gdGhlIHNlbGZ0ZXN0L2JwZiByb290LCB3aGVyZSB0aGUgdGVzdCBydW5uZXJzIHdpbGwg
bG9vawo+Pj4gZm9yIHRoZSB0b29sOgo+Pj4KPj4+ICAgfCAuLi4KPj4+ICAgfCAkKFEpbG4gLXNm
ICQoaWYgJDIsLi4sLikvdG9vbHMvYnVpbGQvYnBmdG9vbC9ib290c3RyYXAvYnBmdG9vbCBcCj4+
PiAgIHwgICAgJChPVVRQVVQpLyQoaWYgJDIsJDIvKWJwZnRvb2wKPj4+Cj4+PiBUaGVyZSBhcmUg
dHdvIGlzc3VlcyBmb3IgY3Jvc3MtY29tcGlsYXRpb24gYnVpbGRzOgo+Pj4KPj4+ICAxLiBUaGVy
ZSBpcyBubyBuYXRpdmUgKGNyb3NzLWNvbXBpbGF0aW9uIHRhcmdldCkgYnVpbGQgb2YgYnBmdG9v
bAo+Pj4gIDIuIFRoZSBib290c3RyYXAgdmFyaWFudCBvZiBicGZ0b29sIGlzIG5ldmVyIGNyb3Nz
LWNvbXBpbGVkIChieQo+Pj4gICAgIGRlc2lnbikKPj4+Cj4+PiBNYWtlIHN1cmUgdGhhdCBhIG5h
dGl2ZS9jcm9zcy1jb21waWxlZCB2ZXJzaW9uIG9mIGJwZnRvb2wgaXMgYnVpbHQsCj4+PiBhbmQg
aWYgQ1JPU1NfQ09NUElMRSBpcyBzZXQsIHN5bWxpbmsgdG8gdGhlIG5hdGl2ZS9ub24tYm9vdHN0
cmFwCj4+PiB2ZXJzaW9uLgo+PiAKPj4gLi4uYW5kIHRoZSBncmFuZCBtYXN0ZXIgcGxhbiBpcyB0
byBhZGQgQlBGIENJIHN1cHBvcnQgZm9yIHJpc2N2NjQsIHdoZXJlCj4+IHRoaXMgcGF0Y2ggYSBw
cmVyZXF1aXNpdGUgdG8gWzFdLiBJIHdvdWxkIHN1c3BlY3QgdGhhdCBvdGhlciBwbGF0Zm9ybXMK
Pj4gbWlnaHQgYmVuZWZpdCBmcm9tIGNyb3NzLWNvbXBpbGF0aW9uIGJ1aWxkcyBhcyB3ZWxsLgo+
Cj4gU2ltaWxhciB1c2UgY2FzZS4gVGhlcmUgYWxzbyBzZWVtcyB0byBiZSBhIGxvdCBvZiBpc3N1
ZXMgYnVpbGRpbmcgdGhlc2UKPiB0ZXN0cyBvdXQgb2YgdHJlZS4KPgo+IEkgaGF2ZSBzb21lIHBv
dGVudGlhbCBmaXhlcyB1cCB0byA2LjEgYnV0IGxpbnV4LW5leHQgc2VlbXMgdG8gaGF2ZQo+IGlu
dHJvZHVjZWQgYSBmZXcgbW9yZSBpc3N1ZXMgb24gdG9wLgoKQWgsIHllcy4gRldJVywgdGhlIEJQ
RiBDSSBidWlsZHMgdGhlIHNlbGZ0ZXN0cyAqaW4tdHJlZSosIHNvIHdpdGggdGhpcwpwYXRjaCAo
YW5kIG15IFBScykgdGhlIEJQRiBDSSBpcyBjYXBhYmxlIG9mIGNyb3NzLWNvbXBpbGluZy4KCgpC
asO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
