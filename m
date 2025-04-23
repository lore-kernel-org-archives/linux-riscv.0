Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B715C369D3
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 17:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m7mV2jZTvczUcSsM4g93Aa0aiyxWEOOl4vSi9rm/z3w=; b=uJu/ZbFVTQqebH
	AnzHyglJxUQf+6TKYb8FELeOdqLAi/AJ3kuGhY9zin39KQXN/Jb0dCGwsNa8n9deWSDA1FT+00bS0
	cPYW8+Hn5ywvpZcWryQAMh6Fh0ODfs1MfwCF46ncwH5GqOHNL9ucKh737NSq8Yh73JAnBNcKzhuwK
	nAB96L9TnoCLDP8gvUqyRO5wMMeU5cMg91FY8VjGCQQyDVmx3EUJaMysXwnkerf6Tsg9d4JXYMrC9
	YHU8iRJblrchEK3SCN5OtB6e1iAGSXDGjY25e+UONKW/3iLhPUlLxjD+KIW3AgPOS8ydKy9PP7Vkq
	3NecxlqzVdhfqEUi4+9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e8d-0000000BNjM-3zxx;
	Wed, 23 Apr 2025 17:43:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7cii-0000000B54V-3Yb2;
	Wed, 23 Apr 2025 16:13:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0F0A0A4BD0E;
	Wed, 23 Apr 2025 16:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4CBEC4CEE2;
	Wed, 23 Apr 2025 16:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745424787;
	bh=qPSQAD2Y9bqIez7eGCC7SKF6Tbh2sTpbA4yJxoW7bq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gQiUG03EYGwTvFI3DcCHA6nOyTKie3dRrnZmNXRmy5GurLVN5HcsXW78RZOmrxRGm
	 7c3RgNw9XV/+D8i0JJcaJNsBpN4jVI73YjUjHxZPSH8ezk8NnOw1C8wsSnAVbaP3gy
	 KW5pLaDI30qxa0OLrg97SLLMtinva9njxKbvgWWRkVllE5N/9XKd3B7/zNqjALB6XI
	 coGhXOyFjiWE/V87L/WEojik/n9Zi9KhDSZCgcxRzeLVpCxQTmgvZmKZ4dqLdOVY0H
	 4BPXEiwCSojI+i5yFP22Qb8oiOHHWCXrA+kbR3+mFS49pZXdrerwSfx4hCArEa6xov
	 nzVpeXfizsLcA==
Date: Wed, 23 Apr 2025 17:13:03 +0100
From: Simon Horman <horms@kernel.org>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Nick Kossifidis <mick@ics.forth.gr>,
	Song Shuai <songshuaishuai@tinylab.org>,
	Li Zhengyu <lizhengyu3@huawei.com>, kexec@lists.infradead.org,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Dave Young <dyoung@redhat.com>, Yixun Lan <yixun.lan@gmail.com>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/4] kexec-tools RISC-V port
Message-ID: <20250423161303.GZ2843373@horms.kernel.org>
References: <20250422162304.169431-1-bjorn@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250422162304.169431-1-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_091308_953506_8358C7A2 
X-CRM114-Status: UNSURE (   8.16  )
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

T24gVHVlLCBBcHIgMjIsIDIwMjUgYXQgMDY6MjI6NTZQTSArMDIwMCwgQmrDtnJuIFTDtnBlbCB3
cm90ZToKPiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gCj4gSGkh
Cj4gCj4gKlBhdGNoIGhpc3RvcnkqCj4gCj4gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2tl
eGVjLzIwMjUwNDA5MjAxNDI4LjY0ODcxNy0xLWJqb3JuQGtlcm5lbC5vcmcvCj4gdjI6IEFkZGVk
IEdpdGh1YiBBY3Rpb25zIHN1cHBvcnQgZm9yIHJpc2N2NjQgKFNpbW9uKQo+ICAgICBTb3J0ZWQg
ZmlsZW5hbWVzIGluIE1ha2VmaWxlIChTaW1vbikKPiAgICAgQWRkZWQgbWlzc2luZyBkaXN0IGZp
bGVzIChTaW1vbikKPiAgICAgRml4ZWQgbWlwcyBidWlsZCAoU2ltb24pCj4gCj4gSGVyZSdzIGEg
cGFzc2VkIENJIHJ1biB3aXRoIHRoaXMgc2VyaWVzIG9uIG1hc3RlcjoKPiBodHRwczovL2dpdGh1
Yi5jb20vYmpvdG8va2V4ZWMtdG9vbHMvYWN0aW9ucy9ydW5zLzE0NTk3OTg4OTUyL2pvYi80MDk0
ODcxNTIxNAoKVGhhbmtzIEJqw7ZybiwgYW5kIGV2ZXJ5b25lIHdobyBnb3QgdXMgaGVyZS4KCkkg
aGF2ZSBhcHBsaWVkIHRoaXMgcGF0Y2gtc2V0IGZvciBpbmNsdXNpb24gaW4gdjIuMC4zMi4KCi0g
eDg2XzY0OiBVc2UgdGhlIHg4Ni02NCBsZXZlbCBmb3IgcHVyZ2F0b3J5CiAgaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL3V0aWxzL2tlcm5lbC9rZXhlYy9rZXhlYy10b29scy5naXQvY29t
bWl0Lz9pZD0xNGY0OGVhODBlNTEKbWFkZWxpZWZqZSB+L3Byb2plY3RzL2tleGVjLXRvb2xzL2tl
eGVjLXRvb2xzIGdpdCBrZXhlYy10b29scy1hcHBsaWVkLWxvZyAgLTQKLSBSSVNDLVY6IFN1cHBv
cnQgbG9hZGluZyBJbWFnZSBiaW5hcnkgZmlsZQogIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS91dGlscy9rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHMuZ2l0L2NvbW1pdC8/aWQ9YjI1N2Yz
MTFmNWYwCi0gUklTQy1WOiBTZXBhcmF0ZSBlbGZfcmlzY3ZfZmluZF9wYmFzZSBvdXQKICBodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vdXRpbHMva2VybmVsL2tleGVjL2tleGVjLXRvb2xz
LmdpdC9jb21taXQvP2lkPTM2MzA4N2NkMTU2ZgotIFJJU0MtVjogRW5hYmxlIGtleGVjX2ZpbGVf
bG9hZCBzeXNjYWxsCiAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL3V0aWxzL2tlcm5l
bC9rZXhlYy9rZXhlYy10b29scy5naXQvY29tbWl0Lz9pZD0wMjdlNmUyMzc0MjcKLSBSSVNDLVY6
IEFkZCBzdXBwb3J0IGZvciByaXNjdiBrZXhlYy9rZHVtcCBvbiBrZXhlYy10b29scwogIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS91dGlscy9rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHMu
Z2l0L2NvbW1pdC8/aWQ9YjNmZDU0YjAyMmZlCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
