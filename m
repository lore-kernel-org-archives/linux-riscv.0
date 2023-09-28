Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8934ACE7B19
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 11:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xpgx2iBcIhqUNrGSBjs8es+1zjWf408HciuGN2thBGU=; b=VDdg+cwtl8+Wkb
	zIQa4PrPjeqZwOeo1dffUYmeRe7aPZAEzqeVvtZTdV0vxSab7VP1ychWyX3q7NwhxTJwp8Q2KT6Ui
	FPpm1yQUSz9Rk/ly9if0al0caOrcy7BLgOVIoACyDCK5yCJGXJTkvMm4Hmnw2MR+QZsyRgzCWDGB4
	Dtjk81l4bfZixA1q3L+69LQSHbm3nUR5bc4U1A/vmTEhmjYZB6DGzQxFDQS/l4LXCT5tf1AQF5ObD
	BHoo8cen4GgCd7CA+5EsM82ocP+OZBDyOOcbxqZKwsBWo/LWZtO5SJesq7QL/n0etJIBZEfn8x/xz
	SGLKIyDXqiJ7xXJnCAJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlon5-0032GY-1e;
	Thu, 28 Sep 2023 11:02:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qloms-00329Z-16
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 11:02:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E032ECE1D0A;
	Thu, 28 Sep 2023 11:02:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2180C433C8;
	Thu, 28 Sep 2023 11:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695898947;
	bh=ja0DZ6OOOWx3SoES56Dma1x4gAPtESb30QOtChRcEZ0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YGywSVE8eBruJR7SW6VH+qa877kACiuvPFYhlWPsWpyEQwhOlPUZZiJP8lgcyIeKz
	 IMfffi4oRfaeDxaCVjAbFx5CbkG+dZvhELmQ2OPXal4YefMv3xn16eRub/IWVc+UHs
	 dUZk9eJ8oCJo9wopp746kPezpo42d/SkMaT0hMluDkmRsulJEJ17Z8+McrMn8QeaeO
	 Vij7yL6K3uSEz/P1D9jWmso9ohW7br2MH7Msy52Xo+pP7GyrZmHRBDLoqJGBy6KcV5
	 n4KSh/Lk+fjfcBd1+jFuyUvPgToqabjYhsiR9acFXw47J37nM+aB4PfiS+kOtndmRd
	 PdNC7FH1qY+bQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Luke Nelson
 <luke.r.nels@gmail.com>, Pu Lehui <pulehui@huawei.com>, Pu Lehui
 <pulehui@huaweicloud.com>
Subject: Re: [PATCH bpf-next v2 4/6] riscv, bpf: Add necessary Zbb instructions
In-Reply-To: <20230919035839.3297328-5-pulehui@huaweicloud.com>
References: <20230919035839.3297328-1-pulehui@huaweicloud.com>
 <20230919035839.3297328-5-pulehui@huaweicloud.com>
Date: Thu, 28 Sep 2023 13:02:23 +0200
Message-ID: <87y1gqmugw.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_040234_393701_1310AFA8 
X-CRM114-Status: GOOD (  12.32  )
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
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBBZGQgbmVjZXNzYXJ5IFpiYiBpbnN0cnVjdGlv
bnMgaW50cm9kdWNlZCBieSBbMF0gdG8gcmVkdWNlIGNvZGUgc2l6ZSBhbmQKPiBpbXByb3ZlIHBl
cmZvcm1hbmNlIG9mIFJWNjQgSklULiBNZWFud2hpbGUsIGEgcnVudGltZSBkZXRldGVkIGhlbHBl
ciBpcwo+IGFkZGVkIHRvIGNoZWNrIHdoZXRoZXIgdGhlIENQVSBzdXBwb3J0cyBaYmIgaW5zdHJ1
Y3Rpb25zLgo+Cj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWJpdG1hbmlw
L3JlbGVhc2VzL2Rvd25sb2FkLzEuMC4wL2JpdG1hbmlwLTEuMC4wLTM4LWc4NjVlN2E3LnBkZiBb
MF0KPiBTdWdnZXN0ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4KPiBTaWdu
ZWQtb2ZmLWJ5OiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgo+IC0tLQo+ICBhcmNoL3Jp
c2N2L25ldC9icGZfaml0LmggfCAyNiArKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
bmV0L2JwZl9qaXQuaCBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXQuaAo+IGluZGV4IDhlMGVmNGQw
OC4uNGUyNGZiMmJkIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXQuaAo+ICsr
KyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXQuaAo+IEBAIC0xOCw2ICsxOCwxMSBAQCBzdGF0aWMg
aW5saW5lIGJvb2wgcnZjX2VuYWJsZWQodm9pZCkKPiAgCXJldHVybiBJU19FTkFCTEVEKENPTkZJ
R19SSVNDVl9JU0FfQyk7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBydnpiYl9lbmFi
bGVkKHZvaWQpCj4gK3sKPiArCXJldHVybiBJU19FTkFCTEVEKENPTkZJR19SSVNDVl9JU0FfWkJC
KSAmJiByaXNjdl9oYXNfZXh0ZW5zaW9uX2xpa2VseShSSVNDVl9JU0FfRVhUX1pCQik7Cj4gK30K
PiArCj4gIGVudW0gewo+ICAJUlZfUkVHX1pFUk8gPQkwLAkvKiBUaGUgY29uc3RhbnQgdmFsdWUg
MCAqLwo+ICAJUlZfUkVHX1JBID0JMSwJLyogUmV0dXJuIGFkZHJlc3MgKi8KPiBAQCAtNzI3LDYg
KzczMiwyNyBAQCBzdGF0aWMgaW5saW5lIHUxNiBydmNfc3dzcCh1MzIgaW1tOCwgdTggcnMyKQo+
ICAJcmV0dXJuIHJ2X2Nzc19pbnNuKDB4NiwgaW1tLCByczIsIDB4Mik7Cj4gIH0KPiAgCj4gKy8q
IFJWWkJCIGluc3RydXRpb25zLiAqLwo+ICtzdGF0aWMgaW5saW5lIHUzMiBydnpiYl9zZXh0Yih1
OCByZCwgdTggcnMxKQo+ICt7Cj4gKwlyZXR1cm4gcnZfaV9pbnNuKDB4NjA0LCByczEsIDEsIHJk
LCAweDEzKTsKPiArfQo+ICsKPiArc3RhdGljIGlubGluZSB1MzIgcnZ6YmJfc2V4dGgodTggcmQs
IHU4IHJzMSkKPiArewo+ICsJcmV0dXJuIHJ2X2lfaW5zbigweDYwNSwgcnMxLCAxLCByZCwgMHgx
Myk7Cj4gK30KPiArCj4gK3N0YXRpYyBpbmxpbmUgdTMyIHJ2emJiX3pleHRoKHU4IHJkLCB1OCBy
cykKPiArewo+ICsJcmV0dXJuIHJ2X2lfaW5zbigweDgwLCBycywgNCwgcmQsIF9fcmlzY3ZfeGxl
biA9PSA2NCA/IDB4M2IgOiAweDMzKTsKCkVuY29kaW5nIGZ1bmNzIGFyZSBoYXJkIHRvIHJlYWQg
YXMgaXQgaXMsIHNvIGxldCdzIHRyeSB0byBiZSBhIGJpdCBtb3JlCmV4cGxpY2l0LgoKSSB3b3Vs
ZCBwcmVmZXIgYQoKICB8ICAgICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfNjRCSVQpKQogIHwg
ICAgICAgICAgICAgICAgcmV0dXJuIDY0Yml0dmFyaWFudAogIHwgICAgICAgICByZXR1cm4gMzJi
aXR2YXJpYW50Cgp2ZXJzaW9uLgoKT3IgYSA2NC1iaXQgb25seSB2YXJpYW50IGVsc2V3aGVyZSwg
c2luY2UgdGhpcyBzZXJpZXMgaXMgb25seSBhaW1lZCBmb3IKNjQtYml0IGFueXdheS4KCj4gK30K
PiArCj4gK3N0YXRpYyBpbmxpbmUgdTMyIHJ2emJiX3JldjgodTggcmQsIHU4IHJzKQo+ICt7Cj4g
KwlyZXR1cm4gcnZfaV9pbnNuKF9fcmlzY3ZfeGxlbiA9PSA2NCA/IDB4NmI4IDogMHg2OTgsIHJz
LCA1LCByZCwgMHgxMyk7CgpEaXRvLgoKCgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
