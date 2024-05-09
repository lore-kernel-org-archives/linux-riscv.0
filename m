Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CCEC25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 21:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZgRTjozkxNZ8b9BxgitOtmCI4iZ4jvlsW/ETJrWaN/c=; b=CWV/Aq7ceITq6y
	FON8P4wZER75gbiF/iQHYeVjZgmATA7Jf6OUGS6AKCecUNDLwAEly5NcIMt1rvkYSzFcVEvGh901Q
	64av71sQDDtEiLCOxdLOTn8kBnYib0i/il6KB++y0d5Uw5pTgmdy94G34oCZDbUaHx25aOI6g7e59
	fWxl4IBrgLSRzupXDTi3xH9CaZEt2X5qw1JjKPJ/fVoCGfORIiGH1IM1FX58PvUcvc5sctE7Nvymq
	56Jv+ld6caFBLT1Z8Jt6egfTGlnBKFDFUZzV4M2yf8NpYuL9Fw3MsQamFn+YPZSqZERF17lARsOzo
	mWnvO1awN4hX/6AjJXzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5BBE-00000002vnF-2zwf;
	Thu, 09 May 2024 21:19:57 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5BB8-00000002vlo-3K2Z
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 21:19:52 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-572a1b3d6baso1766a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 14:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715289589; x=1715894389; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qgi3h+IjdR+qGYdA2wxHQV5wR5eEl2tpr3YsgoeQfBs=;
        b=KEGHtVbJmzVMXSBPCs6IGWVXvp4Xear04QVFPR5yri9o/pQlO2l5QSrOvELtwmBVz/
         oIOY3L5D57MYYeiw0RJxKXfwpR52yx4BcgUWpdeecv8toUvdFpm1a5p9dIRZJP3Gn2bm
         uCAa4jKHV/MAkVSNTqp5v/HnECILDxUFyh2pSIdZihtIfrkMmwnH/nYp7JWCu4SsrLKB
         dxcWFyhkRMRjfGDVsl2ODF+FR27TETjF9e5HKBx0+GXKoo8RsbPCzcWIvflOkNpKHupU
         gs4z/GwE7kDRHxMmQh0vvKgkZNsSxvn0EPJJEid4Qv/cb5pysK0wBjD3MOVntgsOB9JL
         Xd7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715289589; x=1715894389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qgi3h+IjdR+qGYdA2wxHQV5wR5eEl2tpr3YsgoeQfBs=;
        b=fCtIaXDEUrdAS4v57xHwqpFfX0VHFTQm2dXBr0VLVPVtbWdotSs41LYWaiV+svk6HJ
         UoMhSW2qg/6+l0DwK9ElCdRzFvtBKqH3GfzYTeSBHWAceDWTSLI+H2aS3l4wkswxbv9D
         /2hD8OcMjxjCWlYComa2dTLX5CowsqbrHjsbIT9s4wkQOgjazPP0oNWt2ZnKvx2TeNTx
         NKfmhTP8MyPiRZo3m0IzlDZA9AzeunqlBVwWknrlcAIeDTZ/ibHrHQsr9uZhFL7ccNG3
         7dTFoVN7NH8MYVVlRWsMFi6vOtApwqrifdy8oe8avkxBR5Qh8ad3OqtY6nJvAiGS09WI
         NE2A==
X-Forwarded-Encrypted: i=1; AJvYcCWJ5VJo6ihcxzGcSRwuJMsemQ/RGS3LmkbTfUpejwGRgxA9db8lh4JNxXntIUvlktPgFEfjkvnDbpMfBJokmha3OooEioKQGZLRLOudKx/L
X-Gm-Message-State: AOJu0Yz/maMp9SzhNs9wGcT5tQG741Jb8xC4ZMFyXIyZC5+KtVJS0jiX
	YNs5yof8DXxMr/dp6exbGvtrkRs6Qd0SgRA8F+/enrN/ufPWBH+LRXeTlPodxwnlOWVIFUWj4bw
	cIC1F5NV7I1g0ruTq0yDsOMzrWmN9oV/aqNTh
X-Google-Smtp-Source: AGHT+IESFwBeKEPJHXIvjKnYagQw1HEdTMzk6jry3RDX75zlENIpGV8y1GohMsEmGFBkNbvjuiuL//wMmjE86393x/o=
X-Received: by 2002:a50:85cb:0:b0:573:438c:7789 with SMTP id
 4fb4d7f45d1cf-57351de5880mr11488a12.1.1715289588869; Thu, 09 May 2024
 14:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240509200022.253089-14-edliaw@google.com> <20240509203113.63537-1-sj@kernel.org>
In-Reply-To: <20240509203113.63537-1-sj@kernel.org>
From: Edward Liaw <edliaw@google.com>
Date: Thu, 9 May 2024 14:19:23 -0700
Message-ID: <CAG4es9WMDZ6qD1+0MhDN_dD676tB1em34fpRe2wuoefkTGGPHA@mail.gmail.com>
Subject: Re: [PATCH v3 13/68] selftests/damon: Drop define _GNU_SOURCE
To: SeongJae Park <sj@kernel.org>
Cc: shuah@kernel.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Christian Brauner <brauner@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, damon@lists.linux.dev, 
	linux-mm@kvack.org, mathieu.desnoyers@efficios.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_141950_854948_F8AFE1BF 
X-CRM114-Status: GOOD (  21.33  )
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

T24gVGh1LCBNYXkgOSwgMjAyNCBhdCAxOjMx4oCvUE0gU2VvbmdKYWUgUGFyayA8c2pAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBIaSBFZHdhcmQsCj4KPiBPbiBUaHUsICA5IE1heSAyMDI0IDE5OjU4
OjA1ICswMDAwIEVkd2FyZCBMaWF3IDxlZGxpYXdAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiA+IF9H
TlVfU09VUkNFIGlzIHByb3ZpZGVkIGJ5IGxpYi5taywgc28gaXQgc2hvdWxkIGJlIGRyb3BwZWQg
dG8gcHJldmVudAo+ID4gcmVkZWZpbml0aW9uIHdhcm5pbmdzLgo+ID4KPiA+IEZpeGVzOiA4MDky
MTYyMzM1NTUgKCJzZWxmdGVzdHMvaGFybmVzczogcmVtb3ZlIHVzZSBvZiBMSU5FX01BWCIpCj4K
PiBJIHNob3cgTWF0aGlldSdzIGNvbW1lbnQgb24gdGhpc1sxXS4gIEkgaGF2ZSBubyBzdHJvbmcg
b3BpbmlvbiBvbiB0aGlzLCBidXQgaWYKPiB5b3UgY29uY2x1ZGUgdG8gcmVtb3ZlIG9yIGNoYW5n
ZSB0aGlzIGxpbmUsIHBsZWFzZSBhcHBseSBzYW1lIGNoYW5nZSB0byB0aGlzCj4gcGF0Y2guCgpX
aWxsIGRvLCB0aGFua3MgZm9yIHJldmlld2luZy4KCj4KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvNjM4YTc4MzEtNDkzYy00OTE3LTliMjItNWFhNjYzZTllZTg0QGVmZmljaW9zLmNvbQo+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBFZHdhcmQgTGlhdyA8ZWRsaWF3QGdvb2dsZS5jb20+Cj4KPiBJ
IGFsc28gYWRkZWQgdHJpdmlhbCBjb21tZW50cyB0aGF0IGNvbWluZyBmcm9tIG15IHBlcnNvbmFs
IGFuZCBodW1ibGUKPiBwcmVmZXJyZW5jZSBiZWxvdy4gIE90aGVyIHRoYW4gdGhlIGFib3ZlIGFu
ZCB0aGUgYmVsb3cgY29tbWVudHMsCj4KPiBSZXZpZXdlZC1ieTogU2VvbmdKYWUgUGFyayA8c2pA
a2VybmVsLm9yZz4KPgo+ID4gLS0tCj4gPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZGFtb24v
ZGVidWdmc190YXJnZXRfaWRzX3BpZF9sZWFrLmMgICAgfCAzIC0tLQo+ID4gIC4uLi9kYW1vbi9k
ZWJ1Z2ZzX3RhcmdldF9pZHNfcmVhZF9iZWZvcmVfdGVybWluYXRlX3JhY2UuYyAgICAgIHwgMiAt
LQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZGFtb24vZGVidWdmc190YXJnZXRfaWRzX3BpZF9s
ZWFrLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9kYW1vbi9kZWJ1Z2ZzX3RhcmdldF9pZHNf
cGlkX2xlYWsuYwo+ID4gaW5kZXggMGNjMmVlZjdkMTQyLi43YTE3YTAzZDU1NWMgMTAwNjQ0Cj4g
PiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9kYW1vbi9kZWJ1Z2ZzX3RhcmdldF9pZHNf
cGlkX2xlYWsuYwo+ID4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZGFtb24vZGVidWdm
c190YXJnZXRfaWRzX3BpZF9sZWFrLmMKPiA+IEBAIC0yLDkgKzIsNiBAQAo+ID4gIC8qCj4gPiAg
ICogQXV0aG9yOiBTZW9uZ0phZSBQYXJrIDxzakBrZXJuZWwub3JnPgo+ID4gICAqLwo+ID4gLQo+
ID4gLSNkZWZpbmUgX0dOVV9TT1VSQ0UKPiA+IC0KPiA+ICAjaW5jbHVkZSA8ZmNudGwuaD4KPgo+
IEknZCBwcmVmZXIgaGF2aW5nIG9uZSBlbXB0eSBsaW5lIGJldHdlZW4gdGhlIGNvbW1lbnQgYW5k
IGluY2x1ZGVzLgo+Cj4gPiAgI2luY2x1ZGUgPHN0ZGJvb2wuaD4KPiA+ICAjaW5jbHVkZSA8c3Rk
aW50Lmg+Cj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZGFtb24vZGVi
dWdmc190YXJnZXRfaWRzX3JlYWRfYmVmb3JlX3Rlcm1pbmF0ZV9yYWNlLmMgYi90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9kYW1vbi9kZWJ1Z2ZzX3RhcmdldF9pZHNfcmVhZF9iZWZvcmVfdGVybWlu
YXRlX3JhY2UuYwo+ID4gaW5kZXggYjA2ZjUyYThjZTJkLi40YWVhYzU1YWM5M2UgMTAwNjQ0Cj4g
PiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9kYW1vbi9kZWJ1Z2ZzX3RhcmdldF9pZHNf
cmVhZF9iZWZvcmVfdGVybWluYXRlX3JhY2UuYwo+ID4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvZGFtb24vZGVidWdmc190YXJnZXRfaWRzX3JlYWRfYmVmb3JlX3Rlcm1pbmF0ZV9yYWNl
LmMKPiA+IEBAIC0yLDggKzIsNiBAQAo+ID4gIC8qCj4gPiAgICogQXV0aG9yOiBTZW9uZ0phZSBQ
YXJrIDxzakBrZXJuZWwub3JnPgo+ID4gICAqLwo+ID4gLSNkZWZpbmUgX0dOVV9TT1VSQ0UKPiA+
IC0KPiA+ICAjaW5jbHVkZSA8ZmNudGwuaD4KPgo+IERpdHRvLgo+Cj4gQW5kIEkgcmVhbGl6ZSBJ
IGFsc28gZm9yZ290IGFkZGluZyBvbmUgZW1wdHkgbGluZSBiZWZvcmUgdGhlIGFib3ZlICNkZWZp
bmUKPiBsaW5lLiAgVGhhdCdzIHdoeSBJJ20gc2F5aW5nIHRoaXMgaXMganVzdCBhIHRyaXZpYWwg
Y29tbWVudCA6KQoKTm8gcHJvYmxlbSwgSSB3aWxsIGFkZCBpdCBiYWNrIGluLgoKVGhhbmtzLApF
ZHdhcmQKCgo+Cj4gPiAgI2luY2x1ZGUgPHN0ZGJvb2wuaD4KPiA+ICAjaW5jbHVkZSA8c3RkaW50
Lmg+Cj4gPiAtLQo+ID4gMi40NS4wLjExOC5nN2ZlMjljOThkNy1nb29nCj4KPgo+IFRoYW5rcywK
PiBTSgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
