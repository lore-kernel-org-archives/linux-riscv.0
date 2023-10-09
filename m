Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E39E95A91
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 13:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oy3ZlYBwSk8HyBS3tUW2MtqWq+azQgd/KldfElNzC4Y=; b=aNPu+TUEef6OCK
	5FzYBPFgiKeZxB8xUxaNBtjBGNe3bfW99XkRk8/I39a52a9x+q0RRRFqoAMY2Fdb5mjRlLHVapk6D
	2/+h/V6wAudYOXdnNQ3EztqyA6iyT4jfIElyZcCldxf14icQMmeAXtqodSbRjWtrDumlrj8tMahi8
	exaahbMxZaUP8yTCDRNvGNyIrvINY4atjKbO3AbRNqBJsIRYoc0EZhAL2h3BgbSFlqGgl2Fh1PToJ
	XHt8dqPntRGG6lD3DkwzRBdiFQTvU5yaHAQRVA2hT1qbdUBmSMh+KszamPN+bqsHnh85Kw6pBCisE
	ay7Pho0SaP56CCKUKw+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpqL9-00AoL4-1S;
	Mon, 09 Oct 2023 13:30:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpqL6-00AoK5-2w
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 13:30:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B866BB811F0;
	Mon,  9 Oct 2023 13:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1135BC433CB;
	Mon,  9 Oct 2023 13:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696858226;
	bh=C39SPpzW99vurbXbnnvIqZlQvyv6UcGtJqYlt3AsiaU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KXDAW8bqXCIGms7jk5QAOFHZd2FZbviViTXgR5WMHGGl8Qxd5MXTHhJGS+27kOzC2
	 vXuPUOi3QVwJWRBH87coO+uUp8ifGFD4thAJoTtyxwxck3Bgg+mwPR1YB35rPl7C/5
	 ypRUmyLRSuwc4CWpa7XVXIQWrVsr03NMXAcXA6Tja6liZGY2BDou003VnYJd6FMnvx
	 Qd+tmyXnPR5oB36DVJqOVqi4+P/pg4QEoYnMpgjW0e/xrV8LAznH+c1kf48cC8xgyd
	 TvxBmz/OB7BeZUwCdUksPIw+wvpSjV6CSyn9lYh94ocSq30j4VsWlpslNzE8hThmf0
	 ruAWACqdmhm0Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E7E12E11F46;
	Mon,  9 Oct 2023 13:30:25 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf 0/2] riscv, bpf: Properly sign-extend return values
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169685822594.15728.14523871698572342357.git-patchwork-notify@kernel.org>
Date: Mon, 09 Oct 2023 13:30:25 +0000
References: <20231004120706.52848-1-bjorn@kernel.org>
In-Reply-To: <20231004120706.52848-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@ci.codeaurora.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org, pulehui@huawei.com,
 bjorn@rivosinc.com, linux-kernel@vger.kernel.org, luke.r.nels@gmail.com,
 xi.wang@gmail.com, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_063029_115572_B27B4506 
X-CRM114-Status: UNSURE (   8.57  )
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

SGVsbG86CgpUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byBicGYvYnBmLmdpdCAobWFzdGVyKQpi
eSBEYW5pZWwgQm9ya21hbm4gPGRhbmllbEBpb2dlYXJib3gubmV0PjoKCk9uIFdlZCwgIDQgT2N0
IDIwMjMgMTQ6MDc6MDQgKzAyMDAgeW91IHdyb3RlOgo+IEZyb206IEJqw7ZybiBUw7ZwZWwgPGJq
b3JuQHJpdm9zaW5jLmNvbT4KPiAKPiBUaGUgUklTQy1WIGFyY2hpdGVjdHVyZSBkb2VzIG5vdCBl
eHBvc2Ugc3ViLXJlZ2lzdGVycywgYW5kIGhvbGQgYWxsCj4gMzItYml0IHZhbHVlcyBpbiBhIHNp
Z24tZXh0ZW5kZWQgZm9ybWF0IFsxXSBbMl06Cj4gCj4gICB8IFRoZSBjb21waWxlciBhbmQgY2Fs
bGluZyBjb252ZW50aW9uIG1haW50YWluIGFuIGludmFyaWFudCB0aGF0IGFsbAo+ICAgfCAzMi1i
aXQgdmFsdWVzIGFyZSBoZWxkIGluIGEgc2lnbi1leHRlbmRlZCBmb3JtYXQgaW4gNjQtYml0Cj4g
ICB8IHJlZ2lzdGVycy4gRXZlbiAzMi1iaXQgdW5zaWduZWQgaW50ZWdlcnMgZXh0ZW5kIGJpdCAz
MSBpbnRvIGJpdHMKPiAgIHwgNjMgdGhyb3VnaCAzMi4gQ29uc2VxdWVudGx5LCBjb252ZXJzaW9u
IGJldHdlZW4gdW5zaWduZWQgYW5kCj4gICB8IHNpZ25lZCAzMi1iaXQgaW50ZWdlcnMgaXMgYSBu
by1vcCwgYXMgaXMgY29udmVyc2lvbiBmcm9tIGEgc2lnbmVkCj4gICB8IDMyLWJpdCBpbnRlZ2Vy
IHRvIGEgc2lnbmVkIDY0LWJpdCBpbnRlZ2VyLgo+IAo+IFsuLi5dCgpIZXJlIGlzIHRoZSBzdW1t
YXJ5IHdpdGggbGlua3M6CiAgLSBbYnBmLDEvMl0gcmlzY3YsIGJwZjogU2lnbi1leHRlbmQgcmV0
dXJuIHZhbHVlcwogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9icGYvYnBmL2MvMmYxYjBkM2Q3
MzMxCiAgLSBbYnBmLDIvMl0gcmlzY3YsIGJwZjogVHJhY2sgYm90aCBhMCAoUklTQy1WIEFCSSkg
YW5kIGE1IChCUEYpIHJldHVybiB2YWx1ZXMKICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvYnBm
L2JwZi9jLzcxMTJjZDI2ZTYwNgoKWW91IGFyZSBhd2Vzb21lLCB0aGFuayB5b3UhCi0tIApEZWV0
LWRvb3QtZG90LCBJIGFtIGEgYm90LgpodHRwczovL2tvcmcuZG9jcy5rZXJuZWwub3JnL3BhdGNo
d29yay9wd2JvdC5odG1sCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
