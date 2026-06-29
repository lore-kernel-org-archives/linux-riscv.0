Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C235EC43602
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 14:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HeiZP9GDnwuHLojKhNQXZ+4YE8qBIklGxqpIBcnCSl8=; b=dnCCiVELN/x2h9
	uGSfnHOi/1B4TJDqwttyzM+2fK2X0NPFMmC+3kcCmwCyXSOeDuLw4IgmwIa1NwOg2eNOR8Jla6xp2
	5Ps6UJHHFPtimxOqL+l4MKGTsrTwaPT4dwhcYdqMoufFky+27VZsW+dnmwQFsLVfa5vZ3LhxCcEQC
	1IjrRsCyecducgrT9AUEnEMIxSwBe4YFu18vylUF0qSHv0vC8rFIyX3i/72TdRYklUM/GvTfZns4p
	8p38juqlZBiEKodT+dpDWvrY4ILx0gYkrF6ERJvTkzaf0Uw9yCL6VMsOmB6b+YoArSW7c/grvXb/Y
	OFQhIt4Vx4Ei+SAQvMnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCrf-0000000ErhR-0hfc;
	Mon, 29 Jun 2026 14:21:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCrd-0000000ErhG-47hv
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 14:21:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 46662600C8
	for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 14:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E62531F00ADB
	for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 14:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782742892;
	bh=6N8TZdOGZpYdvkdEzYl4kczOMe5OzzYX7K8rWlif55w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RvQnH6MTIBL/G8eXLoFHj7YZth3vXHgnVDXJCKfbDeZp6RXJ3BXCLE0grbrZzyii9
	 /yS+oreF3/8JQ0puL6llRqgTg/xs0Cq6sBDFGYeEx0Jn2TNR8YyXcwWfx7IFN9yhDc
	 LAeHBiDlmOvu5L0mCxDtz88UL3GCczmBaYd7WLSbKcWud45EtrT6OBPZlaK5rm+Blh
	 EXN6Mz8LoFkMbpJlxxk1YxWVGragpChsvDFhry132uDN5YZ65ejpW5hQOSCugXRW/E
	 eru4jKMDGMjr0kdGORU6W4odDhBapVkVRXRIO6N1HFgDXjeiME51cqnc6Ow4xWVIZI
	 jd0YuLgRbDZCA==
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92e5d50b0dbso45708585a.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 07:21:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ914VlV0AujWjZ7oPexzP2JxIQ4lI4F7QCv0YFe/U2AEz6UgROL2zCAGMH9yOyUFKjDldi+bC7q9VSieg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcP/n1G53echeCgF1jlmb7CSewu2gXIM6WxEBSsMwA8X3ITFrO
	hglsRxjiKz0mSCgFIyYrGQ2x6YZTKCnBFlHCD4DjhS/Anlk8hD1M/02sZJlFnPdDnGioRbzVnPc
	E6L4t8onV69rCCHlSSM0R/4FK9R2WsKA=
X-Received: by 2002:a05:620a:29ca:b0:92e:56f7:c5fb with SMTP id
 af79cd13be357-92e56f7d387mr348831685a.12.1782742892220; Mon, 29 Jun 2026
 07:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260629140048.733346-1-pulehui@huaweicloud.com>
In-Reply-To: <20260629140048.733346-1-pulehui@huaweicloud.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Mon, 29 Jun 2026 16:21:20 +0200
X-Gmail-Original-Message-ID: <CAJ+HfNhn9eK+3xsd3ewEsG-duCgBeYXeLAtNan=qefas2Ya0dQ@mail.gmail.com>
X-Gm-Features: AVVi8CfLeBnCl8UWbgTGDyVcouBIu1AOkUzgbXfQlr0DRYJvmC-HJ0Ezdj90Wog
Message-ID: <CAJ+HfNhn9eK+3xsd3ewEsG-duCgBeYXeLAtNan=qefas2Ya0dQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 0/6] Mixing bpf2bpf and tailcalls for RV64
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Pu Lehui <pulehui@huawei.com>
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

SGV5IQoKT24gTW9uLCAyOSBKdW4gMjAyNiBhdCAxNTo1NiwgUHUgTGVodWkgPHB1bGVodWlAaHVh
d2VpY2xvdWQuY29tPiB3cm90ZToKPgo+IEZyb206IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5j
b20+Cj4KPiBJbiB0aGUgY3VycmVudCBSVjY0IEpJVCwgaWYgd2UganVzdCBkb24ndCBpbml0aWFs
aXplIHRoZSBUQ0MgaW4gc3VicHJvZywKPiB0aGUgVENDIGNhbiBiZSBwcm9wYWdhdGVkIGZyb20g
dGhlIHBhcmVudCBwcm9jZXNzIHRvIHRoZSBzdWJwcm9jZXNzLCBidXQKPiB0aGUgdXBkYXRlZCBU
Q0Mgb2YgdGhlIHBhcmVudCBwcm9jZXNzIGNhbm5vdCBiZSByZXN0b3JlZCB3aGVuIHRoZQo+IHN1
YnByb2Nlc3MgZXhpdHMuIFNpbmNlIHRoZSBSVjY0IFRDQyBpcyBpbml0aWFsaXplZCBiZWZvcmUg
c2F2aW5nIHRoZQo+IGNhbGxlZSBzYXZlZCByZWdpc3RlcnMgaW50byB0aGUgc3RhY2ssIHdlIGNh
bm5vdCB1c2UgdGhlIGNhbGxlZSBzYXZlZAo+IHJlZ2lzdGVyIHRvIHBhc3MgdGhlIFRDQywgb3Ro
ZXJ3aXNlIHRoZSBvcmlnaW5hbCB2YWx1ZSBvZiB0aGUgY2FsbGVlCj4gc2F2ZWQgcmVnaXN0ZXIg
d2lsbCBiZSBkZXN0cm95ZWQuIFNvIHdlIGltcGxlbWVudGVkIG1peGluZyBicGYyYnBmIGFuZAo+
IHRhaWxjYWxscyBzaW1pbGFyIHRvIHg4Nl82NCwgaS5lLiB1c2luZyBhIG5vbi1jYWxsZWUgc2F2
ZWQgcmVnaXN0ZXIgdG8KPiB0cmFuc2ZlciB0aGUgVENDIGJldHdlZW4gZnVuY3Rpb25zLCBhbmQg
c2F2aW5nIHRoYXQgcmVnaXN0ZXIgdG8gdGhlCj4gc3RhY2sgdG8gcHJvdGVjdCB0aGUgVENDIHZh
bHVlLiBBcyBmb3IgdGhlIHRhaWxjYWxsIGhpZXJhcmNoeSBpc3N1ZSwKPiBpbnNwaXJlZCBieSB0
aGUgczM5MCdzIGxvdy1vdmVyaGVhZCBhcHByb2FjaCwgd2Ugc3RvcmUgVENDIGZyb20KPiBSVl9S
RUdfVENDIGJhY2sgdG8gc3RhY2sgYWZ0ZXIgY2FsbGluZyBicGYyYnBmIGNhbGwgb3IgY2FsbGlu
ZyBvcmlnIGJwZgo+IGZ1bmMgaW4gYnBmIHRyYW1wb2xpbmUuCj4KPiBJbiBhZGRpdGlvbiwgc29t
ZSBjb2RlIGNsZWFucyBhcmUgYWxzbyBhdHRhY2hlZCB0byB0aGlzIHBhdGNoc2V0Lgo+Cj4gVGVz
dHMgdGVzdF9icGYua28gYW5kIHRlc3RfdmVyaWZpZXIgaGF2ZSBwYXNzZWQsIGFzIHdlbGwgYXMg
dGhlIHJlbGF0aXZlCj4gdGVzdGNhc2VzIG9mIHRlc3RfcHJvZ3MqLgo+Cj4gdjQ6Cj4gLSBGaXgg
dGFpbGNhbGwgaGllcmFyY2h5IGlzc3VlLgo+IC0gdXNlIGlzX3N0cnVjdF9vcHNfdHJhbXAgaGVs
cGVyIGluIGJwZiB0cmFtcG9saW5lCgpBbGV4ZWkgb3V0bGluZWQgc29tZSAobWFqb3IpIGNvbmNl
cm5zIG9uIHRoZSB3aG9sZSBtaXhpbmcgc2lkZSBvZgp0aGluZ3MgWzBdLiBJIGhhdmVuJ3QgYmVl
biBmb2xsb3dpbmcgdGhhdCBzcGFjZSAtLSBkaWQgTGVvbiBoYXZlIGEKd29ya2Fyb3VuZC9maXg/
IENhbiB5b3UgZXhwbGFpbiBtb3JlIGhvdyB5b3UgZml4ZWQgaXQsIGFuZCB3aHkgaXQKd291bGQg
bWFrZSBzZW5zZSB0byBhZGQgaXQgdG8gUklTQy1WIG5vdz8KClRoYW5rcywKQmrDtnJuCgoKWzBd
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2JwZi9DQUFEblZRK3JMbmVPNHQ9WVltTFl0Yzk0NUZ6
MD11Y05UV1pCeGd2czh0b0ZZLW9uUmdAbWFpbC5nbWFpbC5jb20vCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
