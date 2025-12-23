Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F991E6B272
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 12:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9bYb5LGYurF3RC6zvEF1+pTm59x0QtK1uSwXt3HfU18=; b=GCvUsiFYd8rXzL
	Mirim3ZrEcza4vUJQXDzQyMsyIUTX7UNfURGHiTBkma5p3OdU3aw2s77PfqxAE66Ge60Rwy6v6sfA
	3JegZgJ5bWAItvTLcflowEcsIjPvHfRwFRCganCSOKpseZhHAe6vUDEjHJTTA2tIwUGWSpOl0qyF7
	bvktWzO5GqRJ7emCURcyj5scMIpk05go8/X5+IVMjXhnvnjd3oY620yvCPxYiQN8MCXZS9WWpJeeg
	Ry92ABI29kgA6JNfgST/eSX6fB4O8Hg1SRTNnZfg6skwdtt2F40kkFQYWv1Ay8HGOko6DJIZ9g4oU
	AXe4VPpR7xvubnsatUlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1DN-0000000FPkG-3LQE;
	Tue, 23 Dec 2025 12:10:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1DE-0000000FPWJ-0boh
	for linux-riscv@bombadil.infradead.org;
	Tue, 23 Dec 2025 12:10:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=H02B5FH0lksVMqZay3jTPWbUMEUjk2LqJQqa53ND8l4=; b=dd1gkxD429q7G04UhsggkDbhct
	1lZRhdGTaYyI9gCWM3c8/AiTMNdAzVTPDflTiNkhOAP5wjAcMcgdrza62otp2QkN1jSkpJUihNzD7
	zP3Zutnnyv/EoMpjFM3KH6ARgZtX7bLuPSgFZARnN/Z3JxKi7T6ZuHof3V5TM152dfaEGr/5T6nt2
	tN4NHGko2mOxI0WNjjfk5We8s3y9rzRY3YAKwcBBSU9VMY5WorYBqsPf+APMgT4tL1sNY/KWIXjda
	x/h92dfJ80tPCMT3WMbwYWpeusy9GTlZhvk4m2/z2rRP38SrO/07kl54V+8Y+S36A57BDqOqJnjHP
	eiwjwJuQ==;
Received: from relay4.mymailcheap.com ([137.74.80.154])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0Lj-0000000GiLP-3XQf
	for linux-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 11:14:45 +0000
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay4.mymailcheap.com (Postfix) with ESMTPS id EEBB4202F1;
	Tue, 23 Dec 2025 12:09:49 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id F3967400EA;
	Tue, 23 Dec 2025 12:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1766491787; bh=hShu0VvTqLqoPnYAtOi90jcL9XwDFeX2rrLnK8xEvXc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kdY7NMD0uAbptoodukmzohX6nCDGwGUFnQXtBWnQWGDUKCLQXrQDJRwMOgedlefk9
	 VAn6l/nni+E6VEp2JEbvGDRpxE/FHui6ZLjUxUkykpZho4jM39GEeshYlbzhm21pSE
	 TYOwHLYDAJ/xUCwgnYwX4W/nrePK1+lTniGJOnk4=
Received: from [198.18.0.1] (li1893-83.members.linode.com [172.105.239.83])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 07013404AD;
	Tue, 23 Dec 2025 12:09:34 +0000 (UTC)
Message-ID: <6bd26802-e3ce-43e2-b28d-f23e13492458@aosc.io>
Date: Tue, 23 Dec 2025 20:09:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] rust: generate a fatal error if BINDGEN_TARGET is
 undefined
To: Asuna Yang <spriteovo@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Jonathan Corbet <corbet@lwn.net>, Jason Montleon <jmontleo@redhat.com>,
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Kexy Biscuit <kexybiscuit@aosc.io>,
 Xi Ruoyao <xry111@xry111.site>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
 <20251204-gcc-rust-v5-v5-2-2d4f20d86c24@gmail.com>
Content-Language: en-US
From: Mingcong Bai <jeffbai@aosc.io>
In-Reply-To: <20251204-gcc-rust-v5-v5-2-2d4f20d86c24@gmail.com>
X-Rspamd-Queue-Id: F3967400EA
X-Rspamd-Server: nf2.mymailcheap.com
X-Spamd-Result: default: False [1.40 / 10.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[lkml];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,dabbelt.com,eecs.berkeley.edu,ghiti.fr,lwn.net,redhat.com,iscas.ac.cn,aosc.io,xry111.site];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,protonmail.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_111444_035288_3B08CA94 
X-CRM114-Status: GOOD (  10.71  )
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

SGkgQXN1bmEsCgrlnKggMjAyNS8xMi80IDE1OjU0LCBBc3VuYSBZYW5nIOWGmemBkzoKPiBGcm9t
OiBBc3VuYSBZYW5nIDxzcHJpdGVvdm9AZ21haWwuY29tPgo+IAo+IEdlbmVyYXRlIGEgZnJpZW5k
bHkgZmF0YWwgZXJyb3IgaWYgdGhlIHRhcmdldCB0cmlwbGV0IGlzIHVuZGVmaW5lZCBmb3IKPiBi
aW5kZ2VuLCByYXRoZXIgdGhhbiBoYXZpbmcgdGhlIGNvbXBpbGVyIGdlbmVyYXRlIG9ic2N1cmUg
ZXJyb3IgbWVzc2FnZXMKPiBkdXJpbmcgdGhlIGJ1aWxkIHN0YWdlLgo+IAo+IFRoaXMgcGllY2Ug
b2YgY29kZSBpcyBjb3BpZWQgZnJvbSBgc2NyaXB0cy9NYWtlZmlsZS5jbGFuZ2AuCj4gCj4gQmVm
b3JlIHRoaXMgY29tbWl0LCBlcnJvciBtZXNzYWdlcyBtaWdodCBsb29rIGxpa2U6Cj4gCj4gZXJy
b3I6IHVua25vd24gYXJndW1lbnQ6ICctbW5vLXJpc2N2LWF0dHJpYnV0ZScKPiBlcnJvcjogdW5z
dXBwb3J0ZWQgYXJndW1lbnQgJ21lZGFueScgdG8gb3B0aW9uICctbWNtb2RlbD0nIGZvciB0YXJn
ZXQKPiAndW5rbm93bicKPiBlcnJvcjogdW5zdXBwb3J0ZWQgb3B0aW9uICctbWFyY2g9JyBmb3Ig
dGFyZ2V0ICcnCj4gZXJyb3I6IHVuc3VwcG9ydGVkIG9wdGlvbiAnLW1uby1zYXZlLXJlc3RvcmUn
IGZvciB0YXJnZXQgJycKPiBlcnJvcjogdW5rbm93biB0YXJnZXQgdHJpcGxlICd1bmtub3duJwo+
IHBhbmlja2VkIGF0IGJpbmRnZW4vaXIvY29udGV4dC5yczo1NjI6MTU6Cj4gbGliY2xhbmcgZXJy
b3I7IHBvc3NpYmxlIGNhdXNlcyBpbmNsdWRlOgo+IC0gSW52YWxpZCBmbGFnIHN5bnRheAo+IC0g
VW5yZWNvZ25pemVkIGZsYWdzCj4gLSBJbnZhbGlkIGZsYWcgYXJndW1lbnRzCj4gLSBGaWxlIEkv
TyBlcnJvcnMKPiAtIEhvc3QgdnMuIHRhcmdldCBhcmNoaXRlY3R1cmUgbWlzbWF0Y2gKPiAKPiBB
Y2tlZC1ieTogTWlndWVsIE9qZWRhIDxvamVkYUBrZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6
IEFzdW5hIFlhbmcgPFNwcml0ZU92T0BnbWFpbC5jb20+CgpVbmZvcnR1bmF0ZWx5LCB0aGlzIGJy
b2tlIGJ1aWxkIGZvciBNSVBTIGFuZCBQb3dlclBDLCBuZWl0aGVyIG9mIHdoaWNoIApoYXMgc3Vw
cG9ydCBmb3IgUnVzdC4gSSBhbHNvIGZlZWwgYXMgdGhvdWdoIGl0IG1pZ2h0IGJlIHBvaW50bGVz
cyB0byBhc2sgCmFsbCBhcmNoaXRlY3R1cmUgdG8gZGVmaW5lIEJJTkRHRU5fVEFSR0VULCBlc3Bl
Y2lhbGx5IHdoZW4gc3VjaCBhIHRhcmdldCAKc3BlY2lmaWNhdGlvbiBtYXkgbm90IGV2ZW4gZXhp
c3QgdXBzdHJlYW0gKGluIFJ1c3Qgb3IgZXZlbiBpbiBMTFZNKS4KCkFzIHNob3duIGluIHRoZSBm
aXJzdCBwYXRjaCwgdGhlIG9yaWdpbmFsIE1ha2VmaWxlIGRpZCBub3QgcmVxdWlyZSB0aGlzIApk
ZWZpbml0aW9uIGVpdGhlciAocGxlYXNlIGRvIGVubGlnaHRlbiBtZSkuCgpCZXN0IFJlZ2FyZHMs
Ck1pbmdjb25nIEJhaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
