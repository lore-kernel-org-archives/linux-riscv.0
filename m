Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B886082BF4
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 16:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j04DWIHB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Puyq/GHS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=y7YhA2OrSk/Su3YOawAhkb5Dr+lr0tiWUk4IdGLDxoQ=; b=j04DWIHBRdyqsnWl6u05rLvODP
	8njEYU+d6zol5eeAdnb/YbujBWJkjOWOp621gZ8nGt/RQTcaq9MyFCPf9eCI+b57rOwX65e4OTl1g
	OmFW/IxWvnaIaBJoBNugdiwGGPVk0nZzc1N9Nz08eLGnjm1pWi1hDRpn04X502Pp63aYBhwHcfLXT
	ceheXx4BxmWvTiZAJ93wxoi/2Fl4enlgR2dM+Edl8fRd7OLNh/A/Mwc6R9Vtt0Mt8U6PKnfAqfzcD
	jDMwnjVhLh6w0aM6L3rZTkp82X8oWm96ig6uK9oz3CaRwAqCjOd570yIWmig2x/A5NXl9+98xyR40
	LJOFRJCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRtv-000000019mg-3yrm;
	Mon, 09 Nov 2026 16:07:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRtu-000000019mR-1hJ2
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 16:07:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 15A1C45AA9
	for <linux-riscv@lists.infradead.org>; Mon,  9 Nov 2026 16:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F04CA1F00921
	for <linux-riscv@lists.infradead.org>; Mon,  9 Nov 2026 16:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794240438;
	bh=GFQPb65NT7RMSCppnWXFsuqs6MvLmEnYZdDh5XC4mjA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Puyq/GHSaxDgBRMYK4eabz6Z3GYKDUO07DGeh0jwnCvTp3v+z2sg1MCkJBFhXrlKH
	 xGe4jUBrFKWOPxi3Nm52k6itYEZmiCf3G2CJ/LBewN+EqZjhO4nhxj0ZG04W4LqAfK
	 EaysLBv6Vg8AbkSBm7N/Ngm0nVnLBmHUjVugKDjbd15YyE+Zdlg+9JlSUDpACvmhhC
	 +dxpDMtRekkCUxlJn0oX+BL4UpfgfutKwx606W8jYMXyWlPc0krQuzpJXsiGcdFDoL
	 kILuY0b8/omMfXu888a5rIHXEskSYU/Z6iaJROpp0putugvHmFWK4OZ5oRF0gHitXZ
	 OjjlYvIA7GILQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c14f7768acso757421e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 08:07:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErECR6dTFtYX9S8GuFqajNFalgXbdHStuO3kZJowyo7xyGrNBBlaPNLIORqM+sqTchfPhCbNLNO2GbuQvg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/98YtZwD5rgXPKZlcYW0dtGWphlU1+JyvMdgPOR3bN8yO6o15n
	29pd42xWQEWEDfmS4LZQbOi9J9L4nUHob1KrPBry0LS2qYMuqLnaRlp1ITEce9nrVE+qBI5R036
	UZRWU+AqS1G3WOCN0xzuuMJ5H3P6RfVw=
X-Received: by 2002:a05:6512:1396:b0:5c1:4974:c15e with SMTP id
 2adb3069b0e04-5c14c0347cbmr1335285e87.52.1794240436213; Mon, 09 Nov 2026
 08:07:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261009-a733-clk-v6-6-ae8178fce7e8@pigmoral.tech>
In-Reply-To: <20261009-a733-clk-v6-6-ae8178fce7e8@pigmoral.tech>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Nov 2026 01:07:03 +0900
X-Gmail-Original-Message-ID: <CAGb2v67M2bN6a4AsNL_Lv70QmHTvdSWUCbPQat6Po_7KbbqA-w@mail.gmail.com>
X-Gm-Features: AclHuK9agX6QEN1ILAcd18vE_t6MGmoL64ggMRVBKmQGQ0cwuc_S8X4_YIrWVls
Message-ID: <CAGb2v67M2bN6a4AsNL_Lv70QmHTvdSWUCbPQat6Po_7KbbqA-w@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] clk: sunxi-ng: a733: Add mod clocks support
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Enzo Adriano <enzo.adriano.code@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>, Norman Herms <dockseed@proton.me>, 
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: wens@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU2F0LCBPY3QgMTAsIDIwMjYgYXQgMTI6NTTigK9BTSBKdW5odWkgTGl1IDxqdW5odWkubGl1
QHBpZ21vcmFsLnRlY2g+IHdyb3RlOgo+Cj4gQWRkIHRoZSBtb2R1bGUgY2xvY2tzIGZvdW5kIGlu
IHRoZSBBbGx3aW5uZXIgQTczMyBTb0MsIGluY2x1ZGluZyB2aWRlbywKPiBzdG9yYWdlLCBpbnRl
cmZhY2VzIGFuZCBvdGhlcnMuIFdoaWxlIG1vc3Qgb2YgdGhlc2UgY2xvY2tzIGFyZSBzaW1pbGFy
Cj4gdG8gdGhvc2UgaW4gdGhlIEE1MjMgU29DLCB0aGlzIGltcGxlbWVudGF0aW9uIGFjY291bnRz
IGZvciBjaGFuZ2VzIGluCj4gcmVnaXN0ZXIgb2Zmc2V0cyBhbmQgaW50cm9kdWNlcyBzdXBwb3J0
IGZvciBuZXcgbW9kdWxlcy4KPgo+IFRlc3RlZC1ieTogSmVyb21lIEJydW5ldCA8amJydW5ldEBi
YXlsaWJyZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSnVuaHVpIExpdSA8anVuaHVpLmxpdUBwaWdt
b3JhbC50ZWNoPgo+IC0tLQo+ICBkcml2ZXJzL2Nsay9zdW54aS1uZy9jY3Utc3VuNjBpLWE3MzMu
YyB8IDExMDMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDExMDMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3N1bnhp
LW5nL2NjdS1zdW42MGktYTczMy5jIGIvZHJpdmVycy9jbGsvc3VueGktbmcvY2N1LXN1bjYwaS1h
NzMzLmMKPiBpbmRleCAzNzFjNDI5N2MzYWIuLjc4NDdlZWM4NDMxMyAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2Nsay9zdW54aS1uZy9jY3Utc3VuNjBpLWE3MzMuYwo+ICsrKyBiL2RyaXZlcnMvY2xr
L3N1bnhpLW5nL2NjdS1zdW42MGktYTczMy5jCgpbLi4uXQoKPiArc3RhdGljIGNvbnN0IHN0cnVj
dCBjbGtfcGFyZW50X2RhdGEgZHJhbV9wYXJlbnRzW10gPSB7Cj4gKyAgICAgICB7IC5odyA9ICZw
bGxfZGRyX2Nsay5jb21tb24uaHcsIH0sCj4gKyAgICAgICB7IC5odyA9ICZwbGxfcGVyaXBoMF84
MDBNX2Nsay5jb21tb24uaHcsIH0sCj4gKyAgICAgICB7IC5odyA9ICZwbGxfcGVyaXBoMF82MDBN
X2Nsay5odywgfSwKPiArICAgICAgIHsgLmh3ID0gJnBsbF9kZV9jbGsuY29tbW9uLmh3LCB9LAo+
ICsgICAgICAgeyAuaHcgPSAmcGxsX25wdV9jbGsuY29tbW9uLmh3LCB9LAo+ICt9Owo+ICtzdGF0
aWMgU1VOWElfQ0NVX01fREFUQV9XSVRIX01VWF9HQVRFX0ZFQVQoZHJhbTBfY2xrLCAiZHJhbTAi
LCBkcmFtX3BhcmVudHMsIDB4YzAwLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAwLCA0LCAgICAgICAgLyogTSAqLwoKTXkgTExNIGFnZW50IGZsYWdnZWQgdGhp
czogdGhlIGRpdmlkZXIgaXMgNSBiaXRzIHdpZGUsIG5vdCA0LgpCb3RoIHRoZSB1c2VyIG1hbnVh
bCAocGFnZSAxNDkgZnJvbSBzdGFydCBvciAxMjggYXMgbnVtYmVyZWQgb24gdGhlIHBhZ2UpCmFu
ZCB0aGUgQlNQIGFncmVlLgoKCkNoZW5ZdQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
