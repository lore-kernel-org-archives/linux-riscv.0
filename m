Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B33C87FD1
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Aug 2025 06:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d7rxE0b5aMb6kIyzW+pA6wc2QIrtxTaZTI09Kcev+nE=; b=R06PBOH13fSX+H
	v33KDNmmd49hzJ0woNXKZUjFOjfgBc7X+oy+9ZO5VnNn6xe9oFppZWAbzldgvSOWySxbavftr9AV/
	b80ryIw0JBHeVqLdD+GTtqcVbs4WiKsEVBZ3XnT4wzjWqlliafXQoOtBirNsTHSl0tbmJb/uK0Ybp
	9W+DWv3gPkQzJkcR7MKdRVfrRqfaGlEIAW6zmL8PTHsjytWKNO+5maMP5XMWfGK/aNmuOqJw2KK9S
	5W1YsqlXMY5IVC2oWxs5uE1ixtSQSXm8HSSO+rvnYBMVhsAUo/sfWijGRXcXWfq+ZdVk02sLt1gv0
	cMLR7QFVA0PO9kiKyhfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujB8J-0000000Bszj-0oHZ;
	Tue, 05 Aug 2025 06:26:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujB4O-0000000BsTU-2maa
	for linux-riscv@lists.infradead.org;
	Tue, 05 Aug 2025 06:22:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 643CE43E9F;
	Tue,  5 Aug 2025 06:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA625C4CEF4;
	Tue,  5 Aug 2025 06:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754374964;
	bh=5xIvnTl3bYzB7tPvwCECdm4JozJkV4aSeyKvq1EVy6w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HpmpZB9V3hIsTH/be+3zyRLB/VhBeWtBUlrgkxyrgwJFWOs4T8AIYYBO+bYiXplfn
	 tsEWezuLTMRRd3bJe/Dr90g8ia1xSWgvSxpGzDpUbPCpylVi11PUgU4wKdwjo7do02
	 C1yTL1XZ+u9r0VeUrNd7C67PbcwZpxixebmzjAyUAYjFoTg0951ULmQTknPaGKT9GG
	 g9qpi9bke/lqVf9QHtbyqV9zsDbttQnQiBVA91QfS1L7RG5kiCl48ojxKm2Eo6q04q
	 r8t9NyJL3HPEn/EyRKrPmuynXv5w3GoDE7aCLzN5siEnbefEVyWMzElQpFzSI6HK7p
	 M8gJsQT3osK5w==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard
 Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Pu Lehui
 <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next 08/10] riscv, bpf: Add ex_insn_off and
 ex_jmp_off for exception table handling
In-Reply-To: <20250719091730.2660197-9-pulehui@huaweicloud.com>
References: <20250719091730.2660197-1-pulehui@huaweicloud.com>
 <20250719091730.2660197-9-pulehui@huaweicloud.com>
Date: Tue, 05 Aug 2025 08:22:41 +0200
Message-ID: <874ium2spa.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_232244_722584_D13BF221 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IEZyb206IFB1IExl
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBBZGQgZXhfaW5zbl9vZmYgYW5kIGV4X2ptcF9v
ZmYgZmllbGRzIHRvIHN0cnVjdCBydl9qaXRfY29udGV4dCBzbyB0aGF0Cj4gYWRkX2V4Y2VwdGlv
bl9oYW5kbGVyKCkgZG9lcyBub3QgbmVlZCB0byBiZSBpbW1lZGlhdGVseSBmb2xsb3dlZCBieSB0
aGUKPiBpbnN0cnVjdGlvbiB0byBhZGQgdGhlIGV4Y2VwdGlvbiB0YWJsZS4gZXhfaW5zbl9vZmYg
aW5kaWNhdGVzIHRoZSBvZmZzZXQKPiBvZiB0aGUgaW5zdHJ1Y3Rpb24gdG8gYWRkIHRoZSBleGNl
cHRpb24gdGFibGUsIGFuZCBleF9qbXBfb2ZmIGluZGljYXRlcwo+IHRoZSBvZmZzZXQgdG8ganVt
cCBvdmVyIHRoZSBmYXVsdGluZyBpbnN0cnVjdGlvbi4gVGhpcyBpcyB0byBwcmVwYXJlIGZvcgo+
IGFkZGluZyB0aGUgZXhjZXB0aW9uIHRhYmxlIHRvIGF0b21pYyBpbnN0cnVjdGlvbnMgbGF0ZXIs
IGJlY2F1c2Ugc29tZQo+IGF0b21pYyBpbnN0cnVjdGlvbnMgbmVlZCB0byBwZXJmb3JtIHpleHQg
b3Igb3RoZXIgb3BlcmF0aW9ucy4KPgo+IFNpZ25lZC1vZmYtYnk6IFB1IExlaHVpIDxwdWxlaHVp
QGh1YXdlaS5jb20+CgpbLi4uXQoKPiBAQCAtNzQ4LDcgKzc0NSw3IEBAIHN0YXRpYyBpbnQgYWRk
X2V4Y2VwdGlvbl9oYW5kbGVyKGNvbnN0IHN0cnVjdCBicGZfaW5zbiAqaW5zbiwKPiAgCSAqIHRo
YXQgbWF5IGZhdWx0LiBUaGUgZXhlY3V0aW9uIHdpbGwganVtcCB0byB0aGlzIGFmdGVyIGhhbmRs
aW5nIHRoZQo+ICAJICogZmF1bHQuCj4gIAkgKi8KCk5pdDogQWZ0ZXIgdGhlIHVwY29taW5nIGNo
YW5nZSwgdGhlIGNvbW1lbnQgXl5eIGlzIG5vdCBlbnRpZXJseSB0cnVlLgpEb24ndCByZXNwaW4g
Zm9yIHRoaXMsIGJ1dCBhIGZvbGxvdyB1cCB3b3VsZCBiZSBuaWNlIQoKUmV2aWV3ZWQtYnk6IEJq
w7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
