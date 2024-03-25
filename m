Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418E7C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 20:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nWZNabA99Zo9sEVWgx4YaN8lQOozsZnILlB4cN+7Swk=; b=Oi4Ehu3z6tq0th
	uH5TJWp4mM1+P5cj8xe5l/a1NO8nd1mg9TtRvsTpGpcCaawjdzKTgtZp3t0MPLCDfiaaPa/fPG8h2
	dxTHcowtqPGIXYIWr4kYr5tivarW2ZDrAB4A1beJ31VIaYb/PRlpwgRcS8hmeFYtmTm8dooW+vhIk
	VwlWt85tQE6CPTIYunn30JdnGLXcO1SsHSyNxLgvY+GaQVh+K8AKyh9wMbQmFun+6EglW5YmDqOUd
	Zu4on7g8XQm46veGEMfr06HhscikWftsdbf/v+hsyfwpHmMtBGnCb7+i1YHOvSZ94wG9KLXg9bQrP
	ffNOz91VBOCxXYImKKdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roqyY-00000001oLs-0jcy;
	Mon, 25 Mar 2024 20:31:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roqyS-00000001oKK-1fw4
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 20:31:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D433C61035;
	Mon, 25 Mar 2024 20:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7DDC433C7;
	Mon, 25 Mar 2024 20:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711398671;
	bh=nD0S0HBjHRK4yrg36noMRJ6p5zTTPnr1zy2wYZ1vL+Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SCgGYaWCWESKfwcXnv/GMus7WOS80RJzGQFjdD0a86l6riuGwhfZ8MgMv4ERjhrM/
	 M7R27wq88yxd7GpkzUVai+PHZ4FWpy0uuwfmLBmYXwciojwsd9G/A66lpAcM9NybWR
	 fCiMPYecDMzbvBThaZVZGhc3156X17MWF0CkVAVL9/nwgk6tFBv55VP+j/8cGiTDQo
	 jZmXnhis6fMdhmwLAo1MHErUeqidYOlOqRCxylDCR5Spyo6pQRVPo5ik8838uBWBro
	 fjYSucUy2KGQldTKfku64YUJXrFAvD5mOrdCZsZPFJaYS/uXlhgxZH5DOW05PbsTqM
	 Wt4TNHu0WkJrw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Puranjay Mohan <puranjay12@gmail.com>, Conor Dooley <conor@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang
 <xi.wang@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pu Lehui <pulehui@huaweicloud.com>, Manu
 Bretelle <chantra@meta.com>, Mykola Lysenko <mykolal@meta.com>, Nikolay
 Yurin <yurinnick@meta.com>
Subject: Re: [PATCH bpf-next v2 2/2] bpf,riscv: Implement
 bpf_addr_space_cast instruction
In-Reply-To: <CANk7y0jtURUC6PWx5nSDigMpScUT+p3qd=hTtqJkCqAN+Nq32A@mail.gmail.com>
References: <20240325155434.65589-1-puranjay12@gmail.com>
 <20240325155434.65589-3-puranjay12@gmail.com>
 <20240325-nineteen-unvaried-cb5cb5fd3a73@spud>
 <CANk7y0gWtwN7EJ24aoY9-RB9629d5Ks-9fMc3wnAAjjERcZhFw@mail.gmail.com>
 <20240325-perpetual-liking-25f26e485b65@spud>
 <CANk7y0jtURUC6PWx5nSDigMpScUT+p3qd=hTtqJkCqAN+Nq32A@mail.gmail.com>
Date: Mon, 25 Mar 2024 21:31:08 +0100
Message-ID: <878r263vg3.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_133116_620677_7ABE8D82 
X-CRM114-Status: UNSURE (   9.00  )
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

UHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5MTJAZ21haWwuY29tPiB3cml0ZXM6Cgo+IElzIHRoZXJl
IGEgc2VwYXJhdGUgQ0kgZm9yIFJJU0NWIHJlbGF0ZWQgc3R1ZmY/IGlzIGl0IHB1YmxpYz8KPgo+
IEkgd291bGQgYmUgaW50ZXJlc3RlZCBpbiBhZGRpbmcgUklTQy1WIHN1cHBvcnQgaW4KPiBodHRw
czovL2dpdGh1Yi5jb20va2VybmVsLXBhdGNoZXMvYnBmCj4gSXMgc29tZW9uZSBhbHJlYWR5IHdv
cmtpbmcgb24gdGhpcz8KCitDYyBNYW51L015a29sYS9OaWNvIHdobydzIGRvaW5nIGFsbCBvZiB0
aGUgYXdlc29tZSBCUEYgQ0kgd29yayBhdCBNZXRhLAphbmQgY2FuIGtlZXAgbWUgaG9uZXN0LiA7
LSkKCkkgZGlkIHNvbWUgZWFybHkgaGFja3MgZm9yIHRvIGFkZCBSSVNDLVYgc3VwcG9ydCBmb3Ig
dGhlIEJQRiBDSSwgYnV0CmhhdmVuJ3QgaGFkIHRpbWUgdG8gd29yayBvbiBpdCByZWNlbnRseS4g
Oi0oCgogIFsxXSBodHRwczovL2dpdGh1Yi5jb20vbGliYnBmL2NpL3B1bGwvODcKICBbMl0gaHR0
cHM6Ly9naXRodWIuY29tL2tlcm5lbC1wYXRjaGVzL3ZtdGVzdC9wdWxsLzE5NAoKSSd2ZSBiZWVu
IHRhbGtpbmcgcmVjZW50bHkgdG8gTGVodWkgYWJvdXQgaXQgYXMgd2VsbC4KClR3byBtYWpvciB0
aGluZ3MgYXJlIG1pc3Npbmc6CgoxLiBDcm9zcy1jb21waWxhdGlvbiBzdXBwb3J0IChleHBhbmQg
b24gWzFdKQoyLiBBbGlnbiB0aGUgcm9vdGZzIHdpdGggd2hhdCB0aGUgb3RoZXIgYXJjaCBhcmUg
dXNpbmcsIHRvIHJ1biB0aGUgdGVzdHMKICAgb24gUWVtdS9UQ0cgKGFuZCBwcm9wZXIgSFcgYXQg
c29tZSBwb2ludCEpLiBSSVNDLVYgZG9lcyBub3QgaGF2ZQogICBEZWJpYW4gU3RhYmxlIHN1cHBv
cnQsIGFuZCB3b3VsZCBwcm9iYWJseSBuZWVkIFVidW50dSBvciBEZWJpYW4gU2lkCiAgIHNuYXBz
aG9wLiBNYW51IG91dGxpbmVzIHNvbWUgaXNzdWVzIGhlcmU6CiAgIGh0dHBzOi8vZ2l0aHViLmNv
bS9saWJicGYvY2kvcHVsbC84MwoKSGF2aW5nIHRvIG1hbnVhbGx5IHJ1biBCUEYgdGVzdHMgKCJu
b24tb2ZmaWNpYWwgUklTQy1WIEJQRiBDSSIpIGlzIGEKbWVzcyEKCgpCasO2cm4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
