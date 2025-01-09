Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93BFE7719A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2025 21:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i2EreP6tbEMMcD2cyiCjMDR77q7JgFpncjxgQi4Kq5E=; b=XqVaoVvjRPo5pI
	zCPT5eA7eH8tyojntAVjl42m+k3zhdHOoaGli0thyciZohd/7u/miz7hIbalcYhlsTZ+bD9OdD7vz
	b2UfTjKZ4dg37G0tzqFPfF4xzvgzYJOh4A/AKh8ZtiQlb4RtmNdyrs59a+2KYIBlp5MwEz2hlMnsz
	tpZ1dF24/sRE0UX/uASkgPAXUlesqyCBL5f6jKC07orFr0lykHaP+c7/iU7Be19kKQLUzOB0I7XpB
	5kwlsYVtl2KP59tDG2x/p5g8rXeZakikhOjHpm2v3Xmhfevcbafl2EylnzZQGIXSYvQC5VQDewytO
	TimMaJbt8SpUclivndlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW0S4-0000000DPNM-1ZXV;
	Thu, 09 Jan 2025 21:52:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW0Qo-0000000DOzO-20sc;
	Thu, 09 Jan 2025 21:51:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AC9B65C5CC5;
	Thu,  9 Jan 2025 21:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C59C4CEE5;
	Thu,  9 Jan 2025 21:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736459469;
	bh=0x1L7px6GPDuN8m2XYejKWaY2IIWooxoAEoHV0V6Woc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a6JeSpPBmvIKVy1aiaXseMKmL48kdpl1zcK4ql1QqBBn+kNNyPLZPO8aZme2NZukJ
	 YiCoQBT5HTYD0iErWGTusMGjWgIH6e1GmDPgrYDXxcCw4ib6o9fahInGGItWRgUuRP
	 bnxJ5ZHSeOgCFNb32NdoIMI8VQnfDI+s6pSm6K4MuFkYmKLZRnELrBi6jHur+Px00N
	 IHoRP0b/+Xkt86vziXDu55mu0FCOklUTrpqtiQ/py3BKro3MOUtLcrtH/HK89y8gIU
	 +FZ88rpN8hQRVkhT+pFUTbMWc0B9oYpxGwxUiPD7B3HGahhHMuNE3eSyckDn76exf7
	 czOJNAWpptSPw==
Date: Thu, 9 Jan 2025 18:51:06 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Christian Brauner <brauner@kernel.org>, Guo Ren <guoren@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 00/16] perf tools: Use generic syscall scripts for all
 archs
Message-ID: <Z4BEygdXmofWBr0-@x1>
References: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com>
 <Z3_ybwWW3QZvJ4V6@x1>
 <Z4AoFA974kauIJ9T@ghost>
 <Z4A2Y269Ffo0ERkS@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z4A2Y269Ffo0ERkS@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_135110_596756_05E4B082 
X-CRM114-Status: UNSURE (   9.87  )
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

T24gVGh1LCBKYW4gMDksIDIwMjUgYXQgMDU6NDk6NDJQTSAtMDMwMCwgQXJuYWxkbyBDYXJ2YWxo
byBkZSBNZWxvIHdyb3RlOgo+IEJUVyB0aGlzIHNlcmllcyBpcyBhbHJlYWR5IHB1c2hlZCBvdXQg
dG8gcGVyZi10b29scy1uZXh0Ogo+IAo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3BlcmYvcGVyZi10b29scy1uZXh0LmdpdC9sb2cvP2g9cGVyZi10b29s
cy1uZXh0CgpIZXksIG5vdyBJIG5vdGljZWQgdGhhdCB3aXRoIHRoaXMgbGF0ZXN0IHZlcnNpb24g
d2Ugc2VlOgoK4qyiIFthY21lQHRvb2xib3ggcGVyZi10b29scy1uZXh0XSQgbQptYWtlOiBFbnRl
cmluZyBkaXJlY3RvcnkgJy9ob21lL2FjbWUvZ2l0L3BlcmYtdG9vbHMtbmV4dC90b29scy9wZXJm
JwogIEJVSUxEOiAgIERvaW5nICdtYWtlIC1qMjgnIHBhcmFsbGVsIGJ1aWxkCldhcm5pbmc6IEtl
cm5lbCBBQkkgaGVhZGVyIGRpZmZlcmVuY2VzOgogIGRpZmYgLXUgdG9vbHMvYXJjaC9hcm02NC9p
bmNsdWRlL3VhcGkvYXNtL3VuaXN0ZC5oIGFyY2gvYXJtNjQvaW5jbHVkZS91YXBpL2FzbS91bmlz
dGQuaAoKQXV0by1kZXRlY3Rpbmcgc3lzdGVtIGZlYXR1cmVzOgouLi4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGxpYmR3OiBbIG9uICBdCi4uLiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZ2xpYmM6IFsgb24gIF0KLi4uICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGxpYmJmZDogWyBvbiAgXQouLi4gICAgICAgICAgICAgICAgICAgICAgICAgIGxp
YmJmZC1idWlsZGlkOiBbIG9uICBdCi4uLiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBsaWJlbGY6IFsgb24gIF0KLi4uICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGli
bnVtYTogWyBvbiAgXQouLi4gICAgICAgICAgICAgICAgICBudW1hX251bV9wb3NzaWJsZV9jcHVz
OiBbIG9uICBdCi4uLiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnBlcmw6IFsg
b24gIF0KLi4uICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnB5dGhvbjogWyBvbiAg
XQouLi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGliY3J5cHRvOiBbIG9uICBdCi4u
LiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ1bndpbmQ6IFsgb24gIF0KLi4uICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJjYXBzdG9uZTogWyBvbiAgXQouLi4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgbGx2bS1wZXJmOiBbIG9uICBdCi4uLiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHpsaWI6IFsgb24gIF0KLi4uICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgbHptYTogWyBvbiAgXQouLi4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZ2V0X2NwdWlkOiBbIG9uICBdCi4uLiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBicGY6IFsgb24gIF0KLi4uICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGxpYmFpbzogWyBvbiAgXQouLi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBsaWJ6c3RkOiBbIG9uICBdCgogICAvaG9tZS9hY21lL2dpdC9wZXJmLXRvb2xzLW5leHQvdG9v
bHMvcGVyZi9zY3JpcHRzL3N5c2NhbGx0Ymwuc2ggIC0tYWJpcyBjb21tb24sMzIsaTM4NiAvaG9t
ZS9hY21lL2dpdC9wZXJmLXRvb2xzLW5leHQvdG9vbHMvcGVyZi9hcmNoL3g4Ni9lbnRyeS9zeXNj
YWxscy9zeXNjYWxsXzMyLnRibCAvdG1wL2J1aWxkL3BlcmYtdG9vbHMtbmV4dC9hcmNoL3g4Ni9p
bmNsdWRlL2dlbmVyYXRlZC9hc20vc3lzY2FsbHNfMzIuaAogICAvaG9tZS9hY21lL2dpdC9wZXJm
LXRvb2xzLW5leHQvdG9vbHMvcGVyZi9zY3JpcHRzL3N5c2NhbGx0Ymwuc2ggIC0tYWJpcyBjb21t
b24sNjQgL2hvbWUvYWNtZS9naXQvcGVyZi10b29scy1uZXh0L3Rvb2xzL3BlcmYvYXJjaC94ODYv
ZW50cnkvc3lzY2FsbHMvc3lzY2FsbF82NC50YmwgL3RtcC9idWlsZC9wZXJmLXRvb2xzLW5leHQv
YXJjaC94ODYvaW5jbHVkZS9nZW5lcmF0ZWQvYXNtL3N5c2NhbGxzXzY0LmgKICBHRU4gICAgIC90
bXAvYnVpbGQvcGVyZi10b29scy1uZXh0L2NvbW1vbi1jbWRzLmgKICBHRU4gICAgIC90bXAvYnVp
bGQvcGVyZi10b29scy1uZXh0L2FyY2gvYXJtNjQvaW5jbHVkZS9nZW5lcmF0ZWQvYXNtL3N5c3Jl
Zy1kZWZzLmgKICBQRVJGX1ZFUlNJT04gPSA2LjEzLnJjMi5nZDczOTgyYzM5MTgzCiAgR0VOICAg
ICBwZXJmLWFyY2hpdmUKICBHRU4gICAgIHBlcmYtaW9zdGF0CiAgTUtESVIgICAvdG1wL2J1aWxk
L3BlcmYtdG9vbHMtbmV4dC9qdm10aS8KICBNS0RJUiAgIC90bXAvYnVpbGQvcGVyZi10b29scy1u
ZXh0L2p2bXRpLwogIE1LRElSICAgL3RtcC9idWlsZC9wZXJmLXRvb2xzLW5leHQvanZtdGkvCiAg
TUtESVIgICAvdG1wL2J1aWxkL3BlcmYtdG9vbHMtbmV4dC9qdm10aS8KCgpXaGlsZSB3aXRoIHRo
ZSBwcmV2aW91cyBvbmUgd2Ugd291bGQgc2VlIHNvbWV0aGluZyBsaWtlIFNZU0NBTExUQkwgYXMK
dGhlIHN0ZXAgbmFtZSwgbGlrZSB3ZSBoYXZlIEdFTiwgTUtESVIsIGV0YywgY2FuIHlvdSB0YWtl
IGEgbG9vaz8KCkFsbCBpcyBvdXQgdGhlcmUgaW4gcGVyZi10b29scy1uZXh0LgoKLSBBcm5hbGRv
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
