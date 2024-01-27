Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED428C46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jan 2024 17:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kZld1w+LDZuh/w0kgZ9bv5rJvrce/KC51K9yoUJWg3s=; b=i9RJHFzCP6z826
	DZOpOFcfxQ/n+qpitDS5wdH91I+RgUxOPDRqEfBlm2zMLzVh0I0e8sT8kpNENcye/fTEgrz5xh4qf
	yF2BfbxC/2TZajo+jn7sqiEttMW5xD2vGm4H2kjHryCoKHVZ9swbAK5qVck2XHQCk0MtyZERZkDd3
	vMR1iwAmHWUJXWsL5v4Z55DI9lC4aOhDUvUHhdSYSjDF+b9KNplTWTcy3JaKHSTjr1BVaQBdQyBVW
	f/zcbIVshxobh/dQqXZylGudyGNJ0PVXWVV8j4O8xm3DKGq+CeWC+8VnOQAj/vOXpAnXduR949CgS
	N3rX05hGY4S1jy3vuhrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTmIV-00000007tKl-1YFu;
	Sat, 27 Jan 2024 17:16:51 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTmIS-00000007tK9-3pca
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jan 2024 17:16:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 17CC6CE1C72;
	Sat, 27 Jan 2024 17:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF65C433C7;
	Sat, 27 Jan 2024 17:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706375804;
	bh=acwMSsV+BIR9hyLFitq87kqodiG+FRm654GOucmVCbs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=d0pJFd5/Ogi3PYIzIdOfS+uXGLLhXwNmFvODpGYYHNd0ZRdWnZMSNftcaoja1+UJ/
	 WNlYbyrSatfTW6jnUqJg5L8eYFf/abJkI1/gQbij0fZzVMAyprj6oosOxSWMm1MdiC
	 rafss5up2RjIJI/XX80bU03wVJUimUHRhEWSLAEm3cOErp7V4yoW8K4kjETTtVfAZs
	 4wVszg/b5fLO1SJwlRVnhBF+OvD/yj/sYoCix3aC9npoV+6i74W3cbj7Xjlg6u+wbp
	 3c1eNuwxcEjO+4cCJzAo7/F/BmmHkis7BJE3aLuqnuj+UE8Fhmnp9ZlO4dQqRVgliI
	 x/HAiCRJPZVkA==
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
Subject: Re: [PATCH RESEND bpf-next v3 4/6] riscv, bpf: Add necessary Zbb
 instructions
In-Reply-To: <20240115131235.2914289-5-pulehui@huaweicloud.com>
References: <20240115131235.2914289-1-pulehui@huaweicloud.com>
 <20240115131235.2914289-5-pulehui@huaweicloud.com>
Date: Sat, 27 Jan 2024 18:16:41 +0100
Message-ID: <871qa2zog6.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_091649_148612_F82DB1EE 
X-CRM114-Status: GOOD (  10.48  )
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
MF0KPiBTaWduZWQtb2ZmLWJ5OiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgo+IC0tLQo+
ICBhcmNoL3Jpc2N2L25ldC9icGZfaml0LmggfCAzMiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXQuaCBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXQuaAo+
IGluZGV4IGUzMDUwMWI0NmY4Zi4uNTFmNmQyMTQwODZmIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3YvbmV0L2JwZl9qaXQuaAo+ICsrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXQuaAo+IEBAIC0x
OCw2ICsxOCwxMSBAQCBzdGF0aWMgaW5saW5lIGJvb2wgcnZjX2VuYWJsZWQodm9pZCkKPiAgCXJl
dHVybiBJU19FTkFCTEVEKENPTkZJR19SSVNDVl9JU0FfQyk7Cj4gIH0KPiAgCj4gK3N0YXRpYyBp
bmxpbmUgYm9vbCBydnpiYl9lbmFibGVkKHZvaWQpCj4gK3sKPiArCXJldHVybiBJU19FTkFCTEVE
KENPTkZJR19SSVNDVl9JU0FfWkJCKSAmJiByaXNjdl9oYXNfZXh0ZW5zaW9uX2xpa2VseShSSVND
Vl9JU0FfRVhUX1pCQik7CgpIbW0sIEknbSB0aGlua2luZyBhYm91dCB0aGUgSVNfRU5BQkxFRChD
T05GSUdfUklTQ1ZfSVNBX1pCQikgc2VtYW50aWNzCmZvciBhIGtlcm5lbCBKSVQgY29tcGlsZXIu
CgpJU19FTkFCTEVEKENPTkZJR19SSVNDVl9JU0FfWkJCKSBhZmZlY3RzIHRoZSBrZXJuZWwgY29t
cGlsZXIgZmxhZ3MuClNob3VsZCBpdCBiZSBlbm91Z2ggdG8ganVzdCBoYXZlIHRoZSBydW4tdGlt
ZSBjaGVjaz8gU2hvdWxkIGEga2VybmVsCmJ1aWx0IHcvbyBaYmIgYmUgYWJsZSB0byBlbWl0IFpi
YiBmcm9tIHRoZSBKSVQ/CgoKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
