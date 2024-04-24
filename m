Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A0FC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 09:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QHzSDShEbw20Fh/0utk9Dhs/WueVKO6Ts0nQbQA50sA=; b=DZOvyjS7ZCk/EC
	e+XLYEtt7lt2vtl9cXTkV7UsU7OpagbzeaSsYDHs8Z+Nm+JfMs97PVl1dmzis8Z6Z5w9TrNWKq0vD
	cisY8zx/SszNLUWCii8bEetUj7c38fTjPGyKxigjW+NlE6qh6ozO7AxfPnWMTHiNn9eOZqr1J6ZBl
	93HnSCj0saJE3MblprjNCezZe6LrJx47B3dm1FbJFYrmZaVQCsWr7C3JTBqJu3wcao8DKlVxaMOGj
	UsnZ2DCEgHC176eafb/z/9FCYEN8Pe43hv/yg4FJ0oBnIk/vRy2BB0GNzj1j64JQ/249UmTWVh2yf
	8505+KL7A5d2XoLai/+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzYhP-00000003Rbk-2ily;
	Wed, 24 Apr 2024 09:13:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzYhL-00000003RZW-2Lk7
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 09:13:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8CD8C619C5;
	Wed, 24 Apr 2024 09:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA785C2BD11;
	Wed, 24 Apr 2024 09:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713950030;
	bh=wWp0kC0f24K1UMqnicLBYBOSUnN/lBPXIwSVeU+KJ5g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CV2h6DL9iv2ythhvD/13ptoyATcTW+G96JRcj/SvrgZCkvJxD92Lw3pcFLpOzbxCe
	 BnM4SO92UtECCHk1IyaDMIMOwVl3ofArv6esZBXJXNwjMHuGpM1gFP0ncMhfieTHVE
	 gA+qn9ShcJiVn+DuC67KdIW6OpUxb/+ybBaJYmrfELRvDwhN4SXFUN6y/CjuB4ABR7
	 BKEhfpZtbpF7/OQF+vahNOmAaLojngSGFHyPIsG7w94aalXnInh/92tcusj/b9QL6p
	 kDUs1gwBmpbxM8aBZQ3Jp1OxAEeXqnkqf8ikvL/+it2oDGMQN73fGKUebdBdp8K/J6
	 BQth9A7Y/X8Yg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Puranjay Mohan <puranjay@kernel.org>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Steven Rostedt <rostedt@goodmis.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sami
 Tolvanen <samitolvanen@google.com>, Guo Ren <guoren@kernel.org>, Ley Foon
 Tan <leyfoon.tan@starfivetech.com>, Deepak Gupta <debug@rivosinc.com>, Sia
 Jee Heng <jeeheng.sia@starfivetech.com>, Song Shuai
 <suagrfillet@gmail.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?=
 <cleger@rivosinc.com>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Cc: puranjay12@gmail.com
Subject: Re: [PATCH] ftrace: riscv: move from REGS to ARGS
In-Reply-To: <20240405142453.4187-1-puranjay@kernel.org>
References: <20240405142453.4187-1-puranjay@kernel.org>
Date: Wed, 24 Apr 2024 11:13:46 +0200
Message-ID: <87il0786np.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_021351_969812_81EDF3D6 
X-CRM114-Status: GOOD (  19.99  )
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

UHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5QGtlcm5lbC5vcmc+IHdyaXRlczoKCj4gVGhpcyBjb21t
aXQgcmVwbGFjZXMgcmlzY3YncyBzdXBwb3J0IGZvciBGVFJBQ0VfV0lUSF9SRUdTIHdpdGggc3Vw
cG9ydAo+IGZvciBGVFJBQ0VfV0lUSF9BUkdTLiBUaGlzIGlzIHJlcXVpcmVkIGZvciB0aGUgb25n
b2luZyBlZmZvcnQgdG8gc3RvcAo+IHJlbHlpbmcgb24gc3RvcF9tYWNoaW5lKCkgZm9yIFJJU0NW
J3MgaW1wbGVtZW50YXRpb24gb2YgZnRyYWNlLgo+Cj4gVGhlIG1haW4gcmVsZXZhbnQgYmVuZWZp
dCB0aGF0IHRoaXMgY2hhbmdlIHdpbGwgYnJpbmcgZm9yIHRoZSBhYm92ZQo+IHVzZS1jYXNlIGlz
IHRoYXQgbm93IHdlIGRvbid0IGhhdmUgc2VwYXJhdGUgZnRyYWNlX2NhbGxlciBhbmQKPiBmdHJh
Y2VfcmVnc19jYWxsZXIgdHJhbXBvbGluZXMuIFRoaXMgd2lsbCBhbGxvdyB0aGUgY2FsbHNpdGUg
dG8gY2FsbAo+IGZ0cmFjZV9jYWxsZXIgYnkgbW9kaWZ5aW5nIGEgc2luZ2xlIGluc3RydWN0aW9u
LiBOb3cgdGhlIGNhbGxzaXRlIGNhbgo+IGRvIHNvbWV0aGluZyBzaW1pbGFyIHRvOgo+Cj4gV2hl
biBub3QgdHJhY2luZzogICAgICAgICAgICB8ICAgICAgICAgICAgIFdoZW4gdHJhY2luZzoKPgo+
IGZ1bmM6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmdW5jOgo+ICAgYXVp
cGMgdDAsIGZ0cmFjZV9jYWxsZXJfdG9wICAgICAgICAgICAgICAgIGF1aXBjIHQwLCBmdHJhY2Vf
Y2FsbGVyX3RvcAo+ICAgbm9wICA8PT09PT09PT09PEVuYWJsZS9EaXNhYmxlPj09PT09PT09PT4g
IGphbHIgIHQwLCBmdHJhY2VfY2FsbGVyX2JvdHRvbQo+ICAgWy4uLl0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFsuLi5dCj4KPiBUaGUgYWJvdmUgYXNzdW1lcyB0aGF0IHdl
IGFyZSBkcm9wcGluZyB0aGUgc3VwcG9ydCBvZiBjYWxsaW5nIGEgZGlyZWN0Cj4gdHJhbXBvbGlu
ZSBmcm9tIHRoZSBjYWxsc2l0ZS4gV2UgbmVlZCB0byBkcm9wIHRoaXMgYXMgdGhlIGNhbGxzaXRl
IGNhbid0Cj4gY2hhbmdlIHRoZSB0YXJnZXQgYWRkcmVzcyB0byBjYWxsLCBpdCBjYW4gb25seSBl
bmFibGUvZGlzYWJsZSBhIGNhbGwgdG8KPiBhIHByZXNldCB0YXJnZXQgKGZ0cmFjZV9jYWxsZXIg
aW4gdGhlIGFib3ZlIGRpYWdyYW0pLiBXZSBjYW4gbGF0ZXIgb3B0aW1pemUKPiB0aGlzIGJ5IGNh
bGxpbmcgYW4gaW50ZXJtZWRpYXRlIGRpc3BhdGNoZXIgdHJhbXBvbGluZSBiZWZvcmUgZnRyYWNl
X2NhbGxlci4KPgo+IEN1cnJlbnRseSwgZnRyYWNlX3JlZ3NfY2FsbGVyIHNhdmVzIGFsbCBDUFUg
cmVnaXN0ZXJzIGluIHRoZSBmb3JtYXQgb2YKPiBzdHJ1Y3QgcHRfcmVncyBhbmQgYWxsb3dzIHRo
ZSB0cmFjZXIgdG8gbW9kaWZ5IHRoZW0uIFdlIGRvbid0IG5lZWQgdG8KPiBzYXZlIGFsbCBvZiB0
aGUgQ1BVIHJlZ2lzdGVycyBiZWNhdXNlIGF0IGZ1bmN0aW9uIGVudHJ5IG9ubHkgYSBzdWJzZXQg
b2YKPiBwdF9yZWdzIGlzIGxpdmU6Cj4KPiB8LS0tLS0tLS0tLSstLS0tLS0tLS0tKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLXwKPiB8IFJlZ2lzdGVyIHwgQUJJ
IE5hbWUgfCBEZXNjcmlwdGlvbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKPiB8
LS0tLS0tLS0tLSstLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLXwKPiB8IHgxICAgICAgIHwgcmEgICAgICAgfCBSZXR1cm4gYWRkcmVzcyBmb3Ig
dHJhY2VkIGZ1bmN0aW9uICAgICAgICAgIHwKPiB8IHgyICAgICAgIHwgc3AgICAgICAgfCBTdGFj
ayBwb2ludGVyICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKPiB8IHg1ICAgICAgIHwg
dDAgICAgICAgfCBSZXR1cm4gYWRkcmVzcyBmb3IgZnRyYWNlX2NhbGxlciB0cmFtcG9saW5lIHwK
PiB8IHg4ICAgICAgIHwgczAvZnAgICAgfCBGcmFtZSBwb2ludGVyICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwKPiB8IHgxMC0xMSAgIHwgYTAtMSAgICAgfCBGdW5jdGlvbiBhcmd1bWVu
dHMvcmV0dXJuIHZhbHVlcyAgICAgICAgICAgIHwKPiB8IHgxMi0xNyAgIHwgYTItNyAgICAgfCBG
dW5jdGlvbiBhcmd1bWVudHMgICAgICAgICAgICAgICAgICAgICAgICAgIHwKPiB8LS0tLS0tLS0t
LSstLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LXwKPgo+IFNlZSBSSVNDViBjYWxsaW5nIGNvbnZlbnRpb25bMV0gZm9yIHRoZSBhYm92ZSB0YWJs
ZS4KPgo+IFNhdmluZyBqdXN0IHRoZSBsaXZlIHJlZ2lzdGVycyBkZWNyZWFzZXMgdGhlIGFtb3Vu
dCBvZiBzdGFjayBzcGFjZQo+IHJlcXVpcmVkIGZyb20gMjg4IEJ5dGVzIHRvIDExMiBCeXRlcy4K
Pgo+IEJhc2ljIHRlc3Rpbmcgd2FzIGRvbmUgd2l0aCB0aGlzIG9uIHRoZSBWaXNpb25GaXZlIDIg
ZGV2ZWxvcG1lbnQgYm9hcmQuCj4KPiBOb3RlOgo+ICAgLSBNb3ZpbmcgZnJvbSBSRUdTIHRvIEFS
R1Mgd2lsbCBtZWFuIHRoYXQgUklTQ1Ygd2lsbCBzdG9wIHN1cHBvcnRpbmcKPiAgICAgS1BST0JF
U19PTl9GVFJBQ0UgYXMgaXQgcmVxdWlyZXMgZnVsbCBwdF9yZWdzIHRvIGJlIHNhdmVkLgo+ICAg
LSBLUFJPQkVTX09OX0ZUUkFDRSB3aWxsIGJlIHN1cHBsYW50ZWQgYnkgRlBST0JFUyBzZWUgWzJd
LgoKUHVyYW5qYXksCgpBcG9sb2dpZXMgZm9yIHRoZSBzbG93IHJlc3BvbnNlLgoKUmVzdGF0aW5n
IGZyb20gdGhlIFJGQzsgVGhpcyBjaGFuZ2UgaXMgYSBwcmVyZXF1aXNpdGUgZm9yIG1vdmluZyB0
b3dhcmRzCmEgIkZUUkFDRV9XSVRIX0NBTExfT1BTIiBtb2RlbCBvbiByaXNjdiwgYW5kIGZpbmFs
bHkgZ2V0dGluZyByaWQgb2YgdGhlCnN0b3BfbWFjaGluZSgpIHRleHQgcGF0Y2hpbmcuCgpJJ3Zl
IHRlc3RlZCB0aGlzIG9uIFFFTVUsIGFuZCBvbiB0aGUgVmlzaW9uRml2ZTIuIE5vIHJlZ3Jlc3Np
b25zCihGVFJBQ0VfU1RBUlRVUF8qLCBhbmQga3NlbGZ0ZXN0KSwgb3RoZXIgdGhhbiB0aGF0IEtQ
Uk9CRVNfT05fRlRSQUNFIG5vCmxvbmdlciB3b3Jrcy4gKFdoaWNoIHdpbGwgYmUgYWRkcmVzc2Vk
IGJ5IFsyXSkuCgpQYWxtZXIsIG15IHByZWZlcmVuY2UgaXMgdGhhdCB0aGlzIHNob3VsZCBnbyBv
biBmb3ItbmV4dCwgcmF0aGVyIHRoYW4KYmVpbmcgcGFydCBvZiB0aGUgdXBjb21pbmcgdGV4dCBw
YXRjaGluZyBzdXBwb3J0ICh3b3JrZWQgb24gYnkgQW5keSksCmJ1dCByZWFsbHkgdXAgdG8geW91
LgoKVGVzdGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+ClJldmlld2Vk
LWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
