Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E48C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 22:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pZ314wsPMK8F5t/laG0M6aDG4ILB1dZI0pbIUJAmIz8=; b=s7TAGY25bsJUMN
	U2KuOXECx8BHNskzX6of4jVCGzla3aWaWSRGT2zzpRkKxzGTnREFBNy19OHbPEoht9nWC8H0U00SE
	7fwGfrtPKFojQvW0UPrOFY52RWFNFSClnb7r49IA3iBkifUYQ7vyo7ix1SH96WRA+VnaOtvgpjuRr
	xNmSvtzZmWqy7pFdzW4yj4F1NXVQgQBo3BJrwdsKod0ZB0xm2U6wOauwcXlj5MCTnrpFzyRhK01cL
	V0EZHZuLKlKrW3NnkUrWN2RoWlfWaJBqUHN3+4YvygLOjjOMBM13T/mJX3EXwbYK6zA2NWtk3XGS/
	hSqKPvjUuiKj4v4BvTyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r86Wf-006Twg-13;
	Tue, 28 Nov 2023 22:25:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r86Wa-006TuH-2Y;
	Tue, 28 Nov 2023 22:25:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 82524618B6;
	Tue, 28 Nov 2023 22:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB15CC43215;
	Tue, 28 Nov 2023 22:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701210344;
	bh=xw0jvipvintPrN+TgSa50fPhSr/OQ4+PLz58lH+HcbQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jm81GYhQKdtghqZzcibJps70VcRXNVXYv83wu50oGnscBqTrRc/YtqxTp7E7cuE/6
	 NRtc0GGIDU1bI0MyNKDuFDCKQ3kZsEU6iskMiWTMYb47Sas28ml6p2C7WuDCa7ELxO
	 hvOBXHoJDFIrncf8lWiN0ssSqT3s1B6AdpdM02wtvE8DiCCElHXjSIBepJ+06NwGMf
	 H+Cy8uxOmMfNP5eSAoB87/JM0Refr5wwxVmXtgsVTtanzxTxI/alFcRPXGLRtNomUG
	 UVg2asGdOH/+adDowrri+E8+XK4W0HhI5LNyHdJAwEuWNo8vXHLOxRRRqxHGIJlBmn
	 0cz0ceMXh2McA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-507a0907896so7925118e87.2;
        Tue, 28 Nov 2023 14:25:44 -0800 (PST)
X-Gm-Message-State: AOJu0YyrkxrEgBu08BM/Dcj8ujVGo0UoVSaDQ2wqfjMdm2M2nJNiEdDM
	CPs2C3JHgA/hYxqI3R5tgU8mRMs9yf4vQE/yLA==
X-Google-Smtp-Source: AGHT+IGnIgBpTrIKTkP3WlvgS+ZB8HvzDAmJkPSscfGKFyVApWHtyV/uoYFyVwHsgH3F68YSqBbNeCx6OMJVUk8qodo=
X-Received: by 2002:a05:6512:4d1:b0:50b:a806:966b with SMTP id
 w17-20020a05651204d100b0050ba806966bmr7526326lfq.23.1701210342779; Tue, 28
 Nov 2023 14:25:42 -0800 (PST)
MIME-Version: 1.0
References: <20231122-dtc-warnings-v2-0-bd4087325392@kernel.org>
 <CAK7LNASVMjVg4dr=KdSDHwGww_47H78H7rMXA=wf+ncugesDSA@mail.gmail.com>
 <CAL_Jsq+N0GxwZ2YmspEzfiuGOw7M+DmYkyhLgaYtk+Ov2ycY_A@mail.gmail.com> <CAK7LNAT6-pBjUbB+Fcik27QWniK7BizvoUG+EiFvFtJ+MTdmJA@mail.gmail.com>
In-Reply-To: <CAK7LNAT6-pBjUbB+Fcik27QWniK7BizvoUG+EiFvFtJ+MTdmJA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 28 Nov 2023 16:25:30 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJSFnVG6+CfcbgVFGo3EyiSTt-et0NSW2qWjei+zXURcg@mail.gmail.com>
Message-ID: <CAL_JsqJSFnVG6+CfcbgVFGo3EyiSTt-et0NSW2qWjei+zXURcg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231128_142548_940722_67E2CE26 
X-CRM114-Status: GOOD (  33.03  )
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

T24gVHVlLCBOb3YgMjgsIDIwMjMgYXQgNjowM+KAr0FNIE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhp
cm95QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBOb3YgMjcsIDIwMjMgYXQgMTE6MDPi
gK9QTSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUs
IE5vdiAyMywgMjAyMyBhdCAxOjM54oCvQU0gTWFzYWhpcm8gWWFtYWRhIDxtYXNhaGlyb3lAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFRodSwgTm92IDIzLCAyMDIzIGF0IDc6MTLi
gK9BTSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+
IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCB0byBzZXQgdGhlIGR0YyBleHRyYSB3YXJuaW5nIGxl
dmVsIG9uIGEgcGVyCj4gPiA+ID4gYXJjaCBvciBwZXIgcGxhdGZvcm0gKGRpcmVjdG9yeSByZWFs
bHkpIGJhc2lzLgo+ID4gPiA+Cj4gPiA+ID4gVGhlIGZpcnN0IHZlcnNpb24gb2YgdGhpcyB3YXMg
anVzdCBhIHNpbXBsZSBwZXIgZGlyZWN0b3J5IG92ZXJyaWRlIGZvcgo+ID4gPiA+IFNhbXN1bmcg
cGxhdGZvcm1zLCBidXQgQ29ub3IgYXNrZWQgdG8gYmUgYWJsZSB0byBkbyB0aGlzIGZvciBhbGwg
b2YKPiA+ID4gPiByaXNjdi4KPiA+ID4gPgo+ID4gPiA+IEZvciBtZXJnaW5nLCBlaXRoZXIgSSBj
YW4gdGFrZSB0aGUgd2hvbGUgdGhpbmcgb3IgdGhlIHJpc2N2IGFuZCBzYW1zdW5nCj4gPiA+ID4g
cGF0Y2hlcyBjYW4gZ28gdmlhIHRoZWlyIG5vcm1hbCB0cmVlcy4gVGhlIGFkZGVkIHZhcmlhYmxl
IHdpbGwgaGF2ZSBubwo+ID4gPiA+IGVmZmVjdCB1bnRpbCBtZXJnZWQgd2l0aCBwYXRjaCAyLgo+
ID4gPiA+Cj4gPiA+ID4gdjE6Cj4gPiA+ID4gIC0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjMxMTE2MjExNzM5LjMyMjgyMzktMS1yb2JoQGtlcm5lbC5vcmcvCj4gPiA+ID4KPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+ID4gPiA+IC0t
LQo+ID4gPgo+ID4gPgo+ID4gPiBUaGVyZSB3ZXJlIHNvbWUgYXR0ZW1wdHMgaW4gdGhlIHBhc3Qg
dG8gZW5hYmxlIFc9MSBpbiBwYXJ0aWN1bGFyIHN1YnN5c3RlbXMsCj4gPiA+IHNvIGhlcmUgaXMg
YSBzaW1pbGFyIGNvbW1lbnQuCj4gPiA+Cj4gPiA+IEFkZGluZyBhIG5ldyB3YXJuaW5nIGZsYWcg
dG8gVz0xIGlzIGFsd2F5cyBzYWZlIHdpdGhvdXQgZG9pbmcgYW55IGNvbXBpbGUgdGVzdC4KPiA+
ID4KPiA+ID4gV2l0aCB0aGlzIHNlcmllcywgaXQgd291bGQgbm90IGJlIHRydWUgYW55IG1vcmUg
YmVjYXVzZSBhIG5ldyB3YXJuaW5nIGluIFc9MQo+ID4gPiB3b3VsZCBwb3RlbnRpYWxseSBicmVh
ayByaXNjdi9zYW1zdW5nIHBsYXRmb3Jtcy4KPiA+Cj4gPiBUaGUgZGlmZmVyZW5jZSBoZXJlIGlz
IHRoZSBwZW9wbGUgcG90ZW50aWFsbHkgYWRkaW5nIHdhcm5pbmdzIGFyZSBhbHNvCj4gPiB0aGUg
b25lcyBlbnN1cmluZyBubyB3YXJuaW5ncy4KPiA+Cj4gPiA+IExpbnVzIHJlcXVpcmVzIGEgY2xl
YW4gYnVpbGQgKGkuZS4gemVybyB3YXJuaW5nKSB3aGVuIFc9IG9wdGlvbiBpcyBub3QgZ2l2ZW4u
Cj4gPgo+ID4gTGludXMgZG9lc24ndCBidWlsZCBhbnkgb2YgdGhpcyBBRkFJQ1QuIFdlIGFyZSBu
b3QgYWx3YXlzIHdhcm5pbmcgZnJlZQo+ID4gZm9yIFc9MCB3aXRoIGR0YnMuCj4KPgo+Cj4gRG9l
cyBpdCBtZWFuLCB5b3UgY2FuIGVuYWJsZSBhbGwgd2FybmluZ3MgYnkgZGVmYXVsdD8KCk5vLCBM
aW51cyBtaWdodCBub3QgY2FyZSwgYnV0IG90aGVycyAobWUpIGRvLiBUaGUgd2hvbGUgcG9pbnQg
b2Ygbm90CmFsbG93aW5nIHdhcm5pbmdzIGlzIHRoZSBzYW1lLiBHZXQgdG8gemVybyB3YXJuaW5n
cyBzbyBhbnkgbmV3Cndhcm5pbmdzIHN0YW5kIG91dC4gV2Ugbm93IGhhdmUgc29tZSBzdWJzZXQg
b2YgcGxhdGZvcm1zIHdoaWNoIGFyZQp3YXJuaW5nIGZyZWUgYW5kIHdhbnQgd2FybmluZ3MgZW5h
YmxlZCBieSBkZWZhdWx0IHRvIGtlZXAgdGhlbSB0aGF0CndheS4gSG93IGRvIHlvdSBzdWdnZXN0
IHdlIGRvIHRoYXQ/CgpJIHVuZGVyc3RhbmQgeW91ciBwb2ludCBvbiBXPTEgaW4gZ2VuZXJhbCwg
YnV0IEkgdGhpbmsgaXQganVzdCBkb2Vzbid0CmFwcGx5IGluIHRoaXMgY2FzZS4gSW4gZ2VuZXJh
bCwKc29tZW9uZSBtYXkgYmUgdGVzdGluZyBhIG5ldyBjb21waWxlciBhbmQgdGhlcmUncyBzb21l
IG5ldyB3YXJuaW5nIHRvCmVuYWJsZSwgc28gdGhleSBhZGQgaXQgdG8gVz0xLiBUaGV5IGFyZSB3
b3JraW5nIGluZGVwZW5kZW50bHkgb2YgYW55CnN1YnN5c3RlbSAoYW5kIExpbnVzKSBhbmQgaW50
cm9kdWNpbmcgbmV3IHdhcm5pbmdzIHdvdWxkIGJlIGEgYnVyZGVuCnRvIGZpeCBhbmQgYSBwcm9i
bGVtIHRvIGxlYXZlLiBGb3IgRFQsIGl0IGlzIGEgYml0IGRpZmZlcmVudCBhcyBhZGRpbmcKbmV3
IHdhcm5pbmdzLCB1cGRhdGluZyBkdGMgdmVyc2lvbiwgYW5kIHNlbGVjdGluZyB3YXJuaW5ncyB0
byBlbmFibGUKYXJlIHByZXR0eSBtdWNoIGFsbCBkb25lIHRvZ2V0aGVyLiBQbHVzLCBzY2hlbWEg
d2FybmluZ3MgaGF2ZSBwcmV0dHkKbXVjaCBzdXBlcnNlZGVkIGR0YyB3YXJuaW5ncy4gSWYgd2Ug
ZG8gYWRkIG5ldyB3YXJuaW5ncyB3aGljaCBjYW4ndCBiZQpmaXhlZCB1cCBmcm9udCwgdGhlbiB3
ZSBjb3VsZCBzdGlsbCBvbmx5IGVuYWJsZSB0aGUgd2FybmluZyBmb3IgVz0xCmZyb20gdGhlIGNv
bW1hbmQgbGluZS4gU29tZXRoaW5nIGxpa2UgdGhpcyBvbiB0b3Agb2YgdGhpcyBzZXJpZXM6Cgpk
aWZmIC0tZ2l0IGEvc2NyaXB0cy9NYWtlZmlsZS5saWIgYi9zY3JpcHRzL01ha2VmaWxlLmxpYgpp
bmRleCA1M2E3NGU1M2UwY2EuLjQxMzA3YzZlMWZlZSAxMDA2NDQKLS0tIGEvc2NyaXB0cy9NYWtl
ZmlsZS5saWIKKysrIGIvc2NyaXB0cy9NYWtlZmlsZS5saWIKQEAgLTM0MSw2ICszNDEsMTAgQEAg
cXVpZXRfY21kX2d6aXAgPSBHWklQICAgICRACiAjIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogRFRDID89
ICQob2JqdHJlZSkvc2NyaXB0cy9kdGMvZHRjCgoraWZlcSAoJChmaW5kc3RyaW5nIDEsJChLQlVJ
TERfRVhUUkFfV0FSTikpLCkKK0RUQ19GTEFHUyArPSAtV25vLXNvbWVfbmV3X3dhcm5pbmdfd2Vf
bmVlZF9vZmZfZ2xvYmFsbHkKK2VuZGlmCisKIEtCVUlMRF9FWFRSQV9XQVJOX0RUQyArPSAkKEtC
VUlMRF9FWFRSQV9XQVJOKQoKICMgRGlzYWJsZSBub2lzeSBjaGVja3MgYnkgZGVmYXVsdAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
