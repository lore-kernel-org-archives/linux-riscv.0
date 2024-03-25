Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39966C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 19:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wfsrtq+cf7dduewtX1Bcc9LjTX+ZZFF1Ops7ombgqSU=; b=YYqsBIH3bU/PFM
	mo34aictUzm8qf8YRdvx/Dn6vNO/Bmoe+nY82EORNa9l1u7RtYd9ePXN5ncu2FxOS9vn1tIifCQ0w
	i1k8d/j53iRHS6G+TaKyBEoCFDg4r39Lqmj02ApFZ7dD7ipnzpNKrNoFQl6qj/uw9AyjWmNVWzSUp
	54OnTzmCnXFGqIBTnVTdzt+qbJPvyWhDM8ZBwB6mZWT7VUkZV99f/yQbZqW4FQJJZmAnpWdXqZWi+
	P4++8GN7HqGQF3HS5UL03nc9uaKXzC/XljTl1BoA4/JFOsJbEIjq89haWqzv1420PvcHry35HtzXO
	/cE2N/XcXkv2990wi2Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ropuy-00000001Zuj-1PGF;
	Mon, 25 Mar 2024 19:23:36 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roput-00000001Zrl-3MfC
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 19:23:33 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5157af37806so5603331e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2024 12:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711394610; x=1711999410; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8aQL/Qh+/g6MnD8suhJB3IMrCXrJXRjBKFx//tw32U=;
        b=NnvQU4FKuJWk5cBwCcyE817ihqXDp92OHhM+hQZHwYv/pBPx1rtO4VyR7G3eIc+UyS
         5PBa8z49rn67f8KGVugPvbmOkfxrb47xm1Q3eiBP9WS9UEeo4WGylFnylSMwFMOhj46J
         /1Bq6+/WmyA7Wb3R1mSUwr2HVnKLXlfJAK+BI/a1zoOx71Rhuv19R70HewQSBjJHeAOt
         99NQrt+OqWzsa98SVwneKxJdU97ajxJMDqIYUYtUeT+Xi0lsehGxeo59S4PP2V+7ZWm8
         wZkKj7FBTyb2pjleJlOEw4THepsp01cJMx8Lk/Tpv7MIQAju7kaIk/iqbk8oAFoU+hFu
         z3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711394610; x=1711999410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8aQL/Qh+/g6MnD8suhJB3IMrCXrJXRjBKFx//tw32U=;
        b=KVaCyUGdwmjIThVH+2a8qt2ChDfp/ntBm/XuKClrObfXeY0fr1kGEURv8rLL9BjgWN
         x4nq+0Uy5BD8HsCz2PEIV2vG8YnlG/Amm5Jgf4XZXilhxoqGGVQGLhOmMt/eWakI2UA0
         CTkfkd9sDQy1zQrdzAFlZPjxTfkS7maXRZmMPjhy6bvxxUu9ipqYJdA7VXUKD2bLUL+p
         CIbNooq5EdTdLGPVidHTRALUjSazuu2secF2LN8+ih2BL0jJPrv4Aj75oY4L/Ws7J7Dz
         PJNOZdbDSx1YvpHiwKbHc0FGVsECdwSVzPrGzKWEtO2UufqsCXU2mn11ulbLPR7LxGsx
         AqNw==
X-Forwarded-Encrypted: i=1; AJvYcCUDHyfkrEEk1mDdrCaLrZnP6j1eMQp7k4PZzR7FJA6u8T1/ycWDv1gDGTWyj+bcALgFfqbd55EZP7kz9oAeddhb7OroAVlkrc8bwEm1zt1q
X-Gm-Message-State: AOJu0YzLemjv+6Rgch/DlecAxbpWPJT21iLeKZ94CtNu8SLjhlpB3MBD
	A9q+qaUxk8tsyktD7DUQWZnZk+RUICZ2Yk6CKrY0Q/5iuf8tlznjITHlB7B1TdEeCwVxqkLa7zU
	mNSybFAAnT7MTNvMd+KNHc+8+1z6pSUMRSX1I6DY0F5Y=
X-Google-Smtp-Source: AGHT+IF1vk0UqW4liOGXjTqYiEBinsMXHGgEH6imFqIZGuouD3c8EayVtDMaf81Q2NsKzMpYNbz0b49BjVvEX9PL1hQ=
X-Received: by 2002:ac2:5df0:0:b0:513:d5bb:3017 with SMTP id
 z16-20020ac25df0000000b00513d5bb3017mr568024lfq.36.1711394609647; Mon, 25 Mar
 2024 12:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240325155434.65589-1-puranjay12@gmail.com> <20240325155434.65589-3-puranjay12@gmail.com>
 <20240325-nineteen-unvaried-cb5cb5fd3a73@spud> <CANk7y0gWtwN7EJ24aoY9-RB9629d5Ks-9fMc3wnAAjjERcZhFw@mail.gmail.com>
 <20240325-perpetual-liking-25f26e485b65@spud>
In-Reply-To: <20240325-perpetual-liking-25f26e485b65@spud>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Mon, 25 Mar 2024 20:23:18 +0100
Message-ID: <CANk7y0jtURUC6PWx5nSDigMpScUT+p3qd=hTtqJkCqAN+Nq32A@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 2/2] bpf,riscv: Implement bpf_addr_space_cast instruction
To: Conor Dooley <conor@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, bpf@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Pu Lehui <pulehui@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_122332_029770_26A0C515 
X-CRM114-Status: GOOD (  21.85  )
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

T24gTW9uLCBNYXIgMjUsIDIwMjQgYXQgODoxOeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIE1hciAyNSwgMjAyNCBhdCAwODoxMzoxMFBNICsw
MTAwLCBQdXJhbmpheSBNb2hhbiB3cm90ZToKPiA+IE9uIE1vbiwgTWFyIDI1LCAyMDI0IGF0IDg6
MTDigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4g
PiBPbiBNb24sIE1hciAyNSwgMjAyNCBhdCAwMzo1NDozNFBNICswMDAwLCBQdXJhbmpheSBNb2hh
biB3cm90ZToKPiA+ID4gPiBMTFZNIGdlbmVyYXRlcyBicGZfYWRkcl9zcGFjZV9jYXN0IGluc3Ry
dWN0aW9uIHdoaWxlIHRyYW5zbGF0aW5nCj4gPiA+ID4gcG9pbnRlcnMgYmV0d2VlbiBuYXRpdmUg
KHplcm8pIGFkZHJlc3Mgc3BhY2UgYW5kCj4gPiA+ID4gX19hdHRyaWJ1dGVfXygoYWRkcmVzc19z
cGFjZShOKSkpLiBUaGUgYWRkcl9zcGFjZT0wIGlzIHJlc2VydmVkIGFzCj4gPiA+ID4gYnBmX2Fy
ZW5hIGFkZHJlc3Mgc3BhY2UuCj4gPiA+ID4KPiA+ID4gPiByWSA9IGFkZHJfc3BhY2VfY2FzdChy
WCwgMCwgMSkgaXMgcHJvY2Vzc2VkIGJ5IHRoZSB2ZXJpZmllciBhbmQKPiA+ID4gPiBjb252ZXJ0
ZWQgdG8gbm9ybWFsIDMyLWJpdCBtb3ZlOiB3WCA9IHdZCj4gPiA+ID4KPiA+ID4gPiByWSA9IGFk
ZHJfc3BhY2VfY2FzdChyWCwgMSwgMCkgaGFzIHRvIGJlIGNvbnZlcnRlZCBieSBKSVQuCj4gPiA+
ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQdXJhbmpheSBNb2hhbiA8cHVyYW5qYXkxMkBnbWFp
bC5jb20+Cj4gPiA+Cj4gPiA+IERvZXNuJ3QgY29tcGlsZSBmb3IgYWxsbW9kY29uZmlnOgo+ID4g
PiAgIC4uL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmM6MTA4Njo3OiBlcnJvcjogY2Fs
bCB0byB1bmRlY2xhcmVkIGZ1bmN0aW9uICdpbnNuX2lzX2Nhc3RfdXNlcic7IElTTyBDOTkgYW5k
IGxhdGVyIGRvIG5vdCBzdXBwb3J0IGltcGxpY2l0IGZ1bmN0aW9uIGRlY2xhcmF0aW9ucyBbLVdp
bXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiA+ID4KPiA+ID4gQ2hlZXJzLAo+ID4gPiBD
b25vci4KPiA+Cj4gPiBZZXMsCj4gPiBJIG1lbnRpb25lZCBpbiB0aGUgY292ZXIgbGV0dGVyIHRo
YXQgYSBwYXRjaCBpcyByZXF1aXJlZC4KPiA+IEl0IGp1c3QgZ290IG1lcmdlZCBpbiBicGYtbmV4
dC9tYXN0ZXI6Cj4gPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9icGYvYnBmLW5leHQuZ2l0L2NvbW1pdC8/aWQ9NzcwNTQ2YWU5ZjRjMWFlMWViY2FmMDg3
NGYwZGQ5NjMxZDc3ZWM5Nwo+ID4KPiA+IFNvLCByZWJhc2luZyBvbiB0aGUgbGF0ZXN0IGJwZi1u
ZXh0L21hc3RlciBzaG91bGQgZml4IHRoZSBpc3N1ZS4KPgo+IEFoLCBJIHNlZSBub3cgdGhhdCB0
aGVyZSB3YXMgYSBtZW50aW9uIGluIHRoZSBjb3ZlciBsZXR0ZXIgdGhhdCBJIGRpZAo+IG5vdCBz
ZWUgZmlyc3QgdGltZSBhcm91bmQuCj4KPiBCam9ybiwgZG8geW91IHRoaW5rIHRoZXJlJ3MgYW55
dGhpbmcgd2UgY2FuIGRvIGFib3V0IHRoZXNlIGtpbmRhCj4gbWlzbGVhZGluZyBDSSBmYWlsdXJl
cyBmb3IgYnBmIHN0dWZmPyBTb21lIHN0dWZmIHRoYXQgdG91Y2hlcyBicGYKPiBkZWZpbml0ZWx5
IGlzIHdvcnRoIHVzIGJ1aWxkaW5nLCBidXQgc2hvdWxkIHdlIHRyeSBhbmQgYnVpbGQgaXQgb24g
dG9wCj4gb2YgdGhlIGJwZiB0cmVlIGluc3RlYWQ/CgpJcyB0aGVyZSBhIHNlcGFyYXRlIENJIGZv
ciBSSVNDViByZWxhdGVkIHN0dWZmPyBpcyBpdCBwdWJsaWM/CgpJIHdvdWxkIGJlIGludGVyZXN0
ZWQgaW4gYWRkaW5nIFJJU0MtViBzdXBwb3J0IGluCmh0dHBzOi8vZ2l0aHViLmNvbS9rZXJuZWwt
cGF0Y2hlcy9icGYKSXMgc29tZW9uZSBhbHJlYWR5IHdvcmtpbmcgb24gdGhpcz8KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
