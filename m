Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB621C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 14:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5xCo01/n0NoIiGKeThEqVW3LcwmF1um0TBedb8sNdHE=; b=MMShTjcSwfDio8
	VV2/8Mu/ImO5I8hibb3Ffn1AvCwfpL2JYtKK2/fAowiMM20fJKe4drKCLq3LaRnt39roqG1nSUkuh
	KftKBh2oscc6v3dtv+ezqP1nIjwKEF4XYK59zuaQyT5xezBeOSbojOFwoJtXxzqYW6n8AKCKYFzn0
	od2ohl90Ki6YV0kwK/tkJnL2J8J1W8apgmWyBOi3Wy2oIfygnKT2MXhY+ko1Cl+0QKAih4A4DgNFA
	eK9ZULNTI2emC0UwlAHrhL4e8Nci4PFyzjzdNsHBdN7ltFFn6sqAlF0wHFfjNZ02fPf9jpvKk/0Nv
	kZgH3kcTd7Kdj4Zb9wew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7cD6-002e7a-2b;
	Mon, 27 Nov 2023 14:03:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7cD3-002e6n-2M;
	Mon, 27 Nov 2023 14:03:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D0FEA61255;
	Mon, 27 Nov 2023 14:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A278EC433C7;
	Mon, 27 Nov 2023 14:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701093816;
	bh=KCZKisXR1n78+RfI83KrbOl2Cm27WXfa6iz/K1QPJPo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=a2aOf09I75DdKUvvNJhSkD9GQ6WGBE1jrWs9pDpOCpwNhS0TbxHWoRRSn9ck5Mhc+
	 gZca7EfxNyQp1inBZAfRqD47gcVR/2j2P6kSPCkih7i49cwEZ7pOo/irs5zW0XlMiF
	 9t3wBImUkMRmLnPX2jf+oEXtdtP3HdA2v5iDopicDPaZiELC/QCHIid2KwS9yeW8Yk
	 sDtIdNfLMQ2+8k4BxzPSCP/qhcQirHg9eszKNpXUSGX6VzAN3kehB6MI8Qj+xuPUcx
	 pQuQyJsiwfL3/G2Nx7qvojox0+j3lTPPcUWpxZDJzU/NZmi7fMpyxZ2ILAb/+cKK1F
	 d3or7UmfDwFkA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50943ccbbaeso5863773e87.2;
        Mon, 27 Nov 2023 06:03:36 -0800 (PST)
X-Gm-Message-State: AOJu0Yw8Z0rDfCBxDIMaZd24DbaNU95y8GS4OeerWw8DNyhcgeV/jcEY
	hgwIV5bKto9X4j/KvKbUeY6h/0QVzCpEN5rePQ==
X-Google-Smtp-Source: AGHT+IHHn/0tbob/Zvt/F/xavRxwGiGH47uaym2qWQ3/Wvw2D2ahyijP+Gg34c/5ffttsPErtLGmPrZcuMVpkTAoeU0=
X-Received: by 2002:a19:7514:0:b0:4fb:9168:1fce with SMTP id
 y20-20020a197514000000b004fb91681fcemr7182211lfe.59.1701093814870; Mon, 27
 Nov 2023 06:03:34 -0800 (PST)
MIME-Version: 1.0
References: <20231122-dtc-warnings-v2-0-bd4087325392@kernel.org> <CAK7LNASVMjVg4dr=KdSDHwGww_47H78H7rMXA=wf+ncugesDSA@mail.gmail.com>
In-Reply-To: <CAK7LNASVMjVg4dr=KdSDHwGww_47H78H7rMXA=wf+ncugesDSA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 27 Nov 2023 08:03:22 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+N0GxwZ2YmspEzfiuGOw7M+DmYkyhLgaYtk+Ov2ycY_A@mail.gmail.com>
Message-ID: <CAL_Jsq+N0GxwZ2YmspEzfiuGOw7M+DmYkyhLgaYtk+Ov2ycY_A@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] kbuild: Per arch/platform dtc warning levels
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_060337_878452_208CE4DA 
X-CRM114-Status: GOOD (  20.29  )
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

T24gVGh1LCBOb3YgMjMsIDIwMjMgYXQgMTozOeKAr0FNIE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhp
cm95QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBOb3YgMjMsIDIwMjMgYXQgNzoxMuKA
r0FNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IFRoaXMgc2Vy
aWVzIGFkZHMgc3VwcG9ydCB0byBzZXQgdGhlIGR0YyBleHRyYSB3YXJuaW5nIGxldmVsIG9uIGEg
cGVyCj4gPiBhcmNoIG9yIHBlciBwbGF0Zm9ybSAoZGlyZWN0b3J5IHJlYWxseSkgYmFzaXMuCj4g
Pgo+ID4gVGhlIGZpcnN0IHZlcnNpb24gb2YgdGhpcyB3YXMganVzdCBhIHNpbXBsZSBwZXIgZGly
ZWN0b3J5IG92ZXJyaWRlIGZvcgo+ID4gU2Ftc3VuZyBwbGF0Zm9ybXMsIGJ1dCBDb25vciBhc2tl
ZCB0byBiZSBhYmxlIHRvIGRvIHRoaXMgZm9yIGFsbCBvZgo+ID4gcmlzY3YuCj4gPgo+ID4gRm9y
IG1lcmdpbmcsIGVpdGhlciBJIGNhbiB0YWtlIHRoZSB3aG9sZSB0aGluZyBvciB0aGUgcmlzY3Yg
YW5kIHNhbXN1bmcKPiA+IHBhdGNoZXMgY2FuIGdvIHZpYSB0aGVpciBub3JtYWwgdHJlZXMuIFRo
ZSBhZGRlZCB2YXJpYWJsZSB3aWxsIGhhdmUgbm8KPiA+IGVmZmVjdCB1bnRpbCBtZXJnZWQgd2l0
aCBwYXRjaCAyLgo+ID4KPiA+IHYxOgo+ID4gIC0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjMxMTE2MjExNzM5LjMyMjgyMzktMS1yb2JoQGtlcm5lbC5vcmcvCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiA+IC0tLQo+Cj4KPiBUaGVy
ZSB3ZXJlIHNvbWUgYXR0ZW1wdHMgaW4gdGhlIHBhc3QgdG8gZW5hYmxlIFc9MSBpbiBwYXJ0aWN1
bGFyIHN1YnN5c3RlbXMsCj4gc28gaGVyZSBpcyBhIHNpbWlsYXIgY29tbWVudC4KPgo+IEFkZGlu
ZyBhIG5ldyB3YXJuaW5nIGZsYWcgdG8gVz0xIGlzIGFsd2F5cyBzYWZlIHdpdGhvdXQgZG9pbmcg
YW55IGNvbXBpbGUgdGVzdC4KPgo+IFdpdGggdGhpcyBzZXJpZXMsIGl0IHdvdWxkIG5vdCBiZSB0
cnVlIGFueSBtb3JlIGJlY2F1c2UgYSBuZXcgd2FybmluZyBpbiBXPTEKPiB3b3VsZCBwb3RlbnRp
YWxseSBicmVhayByaXNjdi9zYW1zdW5nIHBsYXRmb3Jtcy4KClRoZSBkaWZmZXJlbmNlIGhlcmUg
aXMgdGhlIHBlb3BsZSBwb3RlbnRpYWxseSBhZGRpbmcgd2FybmluZ3MgYXJlIGFsc28KdGhlIG9u
ZXMgZW5zdXJpbmcgbm8gd2FybmluZ3MuCgo+IExpbnVzIHJlcXVpcmVzIGEgY2xlYW4gYnVpbGQg
KGkuZS4gemVybyB3YXJuaW5nKSB3aGVuIFc9IG9wdGlvbiBpcyBub3QgZ2l2ZW4uCgpMaW51cyBk
b2Vzbid0IGJ1aWxkIGFueSBvZiB0aGlzIEFGQUlDVC4gV2UgYXJlIG5vdCBhbHdheXMgd2Fybmlu
ZyBmcmVlCmZvciBXPTAgd2l0aCBkdGJzLgoKUm9iCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
