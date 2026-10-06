Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132B8CA5FF0
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 14:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YDC9kb+iVHdEf3kcvhYLwgFzzuWnI2vuVrgnKwwB584=; b=v1g6xwNLvF3lzG
	g6X5+Hilpi2hcc+26CbP/WcltbvbDdt4gvf82vxRyUgJW7IEJNhQ6DnVPd0DToRxcG/h+oQz+aisg
	qoG73XYbfCzobdmrCS0odsbrnEEMItEAcDRZHAtyDNinVk95Rn4CW6bwrQv4UZK4tCLQvMU2S1BKW
	nDAN8EIa9KGl71++WSGGIiru8op7onTN6fhECCKzMIKUgq2gOaiy4+Ty77sCas0jsDBaV9F/eG+bt
	8yxl08mLdSKgW5ZyMNwfZCxow+8HOBQd3w2LHl73wFj4pC4lLfmR0fHDrXxEebLafR05CHJWUgBVU
	TtmSNwL9vySIRZtkGLzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE5oD-00000000vgH-1gfr;
	Tue, 06 Oct 2026 14:06:21 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE5o9-00000000vfG-0vp7
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 14:06:20 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-678febd9307so656121d50.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 07:06:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791295576; cv=none;
        d=google.com; s=arc-20260327;
        b=IJspgvwwTJqhvZCljjBIsYckMJ5eAwGTnw8+IvvpaaJpI2YTVBtlG3z0+0hkMbgjMY
         x+cO6n+Jx1gJIqWvEXq+7YKHb85ynFNbqAjIMqvzhm2uH4cklFm3AjLW6nWBBdcOxkfh
         TO9PxLMH+gx090ivcJPuzyYUxDqg9m6nfJ7UI6JVpGfUlqvyV121T6KN3T1EHlm2ChHZ
         UAbuY1NvH5kw0X7XvN0BTiTPTBdycXi+oPzvNZe8bKbObmFfVaE3ICYJ5EGQ9qaMMoHN
         jCnMjWQAaE6R3sIs9taZB3A2rENezqClksZEYjc7xXyiNkqGnOec1duV3APj5X3rWdvZ
         skzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7eTRhpUdAPhibVitSf9ugYG/3fmwl3lSEUIJCeeRHDY=;
        fh=HuU43f5EJQ37+e/HtT4uVInm/UqTBl6HvcSWHD3zFsU=;
        b=SBzz7PV8hYMtknleaKtAU+76h2T4pkGzfoCqHvXb3llc/cJO04gzteFkF4Q57CPabY
         4EeQOZCdHh28bPe35lLGgPjaYZ5a3Gher0XoQpORlULdaDvpV69t4mXZYNUJcCx9NxBq
         JRfx0Tjc+Gk+h5B4VnEuTHneLwV4ghXSjYxQ9sOfmFFe/R/kPk3DBrcBLroaQ5vPdqke
         kI7HbWDdNaokWuiurAyj/5WL+BzZVFREiPQeLuJDN6a13K9dybt1tupowq1jOaC7decC
         boZaz/uKNGQwKn9lb1O5Eyv1Y1zNMbngCKfF+IJ5OZMOWV9QVhO02nKk+eKUjV3g3xCJ
         a4sA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1791295576; x=1791900376; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7eTRhpUdAPhibVitSf9ugYG/3fmwl3lSEUIJCeeRHDY=;
        b=SZlj9pAruqW6s8mr/rEHFSLzMd5PgdsPB+KTR1J6Jj3q0vNoTkAlr7/VOiwh3NbwJ2
         fSY09qxQ6p+TGGR5zkQQ2m/1fSQ32Uo6VvC6EVrlH3XR2mAQv8Esmh8EiYrEBHoWAwha
         LwVzf5WYk7hxTXlQNj1e2B6E7Bj6imndVf1YdcIiN7emmHAVeCer9z7cV96Fb9GrnXq9
         8p1VIIt0yu6KgoPE0mOrrnbGZjuYUv7ddnA0C9RkDbBZQufNmV/ojvyIy6iSsIBwbm3M
         bylzA05eO20CX1zf9m3ZcA92GM9F90tyQ3Ws+J6UCeAuRVN6vCgoHH6eYwHnWYklll0f
         8l9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791295576; x=1791900376;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7eTRhpUdAPhibVitSf9ugYG/3fmwl3lSEUIJCeeRHDY=;
        b=av8IuSkZk5lL6a667nJ4t4Y8U+gUf2CyD7GnDMNsE2lBFxKaUW2XcWsAfxgysH4ozR
         d8pOw8SGppJv/SDW9LhDYN/I3GqV3sQUaTTwldomlTa8Hv/Q0OQ7VN+BmoDyL61rNcsf
         PZJlH2DPf+UN6L8xU4sokw0dl+2Ny3aHnvY0WVk3G6A1qEs8uoOydOxOvtZ7nwtXZJQO
         YrqZY03ysQUR9EQpyLS7KRoUzB4/CjQBOwIAKHCByCSamKuiPnK25N4k+uPIVWP6iK9X
         /344RJQdGJyLXCQAfg11w+4qSHcN9Rmp97TbXl2MzYpIsVEVMrQ7rX5EQjHW9cpgVzsj
         Gt4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxJRwOAjZuJ88XBjkSSiJ0EVMxkW6KgEh981UJl6clBm7V8jo7kOvuVOdzAeLQh+rFGM7CHc4cYye9YJA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLChmF4SQ5Nesda4bvafbF0kYDDK1NLdzVXW4LNGo650C8vQSIU
	gJ+DXSKIWmJoGwwpWTYlV3qUywSAxzqJQmOvSoBXK9SH20q3yaTWP+V3hIyy/EQtQqn5K2RavtP
	5YZ/axLAy1zTD9RpGjY8kbyYhNnVt4cnohzx1Tsq6bQ==
X-Gm-Gg: AYBFou0DWlSRSgKXLBbnYvk4tr9mhnluA1/IovyDpQTW3sdGavDs3NHhCu2ymYEiRwC
	pacVy5N5UR8SW5+4RbxvP3JMUC4TlWkX2LQzxc6N7mYrkBxYwm93hwmcxhyNxIXT5G1Q1xXSSNq
	vzWeaNpNOng9QZMQjmYKFVtVp86fQHK02x0iIhqRj6SJDjN3btjerfC0ZdCGWM3CcbHPDBvOwNB
	Mktq2xUeDeuN0Ajuo8onu6AMI3AerZO0uu6BYBmS73yszRdt5NysKGTjXRs7NrKykMrha1eizw4
	GJn2QG8lQBHzI4U8STuHsLcRkfbNdIfe66eV1x7NEZa/HzLSeR+3D8kmDN1zQmYJ1BNftspApRT
	94Gd+cn/SYa8=
X-Received: by 2002:a05:690e:bc5:b0:66f:c1bc:4045 with SMTP id
 956f58d0204a3-678fcec34d3mr595987d50.38.1791295575798; Tue, 06 Oct 2026
 07:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260929-stmmac-ptp-added-systime-error-v3-1-ddd6afe936b4@oss.qualcomm.com>
 <dy5xfj3754wnp3gh2kpoyf3vpx3vfsfhblgbwbwsgts27xqxga@dzb33gt3zgca>
 <asQcQIh56MV1OJur@lore-desk> <CAEev2e8+fr1tJnSErD+2TtLDw5fGJbQOMcM5eefMnLyFUR+m7w@mail.gmail.com>
 <asSb3RNcityVg6ia@lore-desk>
In-Reply-To: <asSb3RNcityVg6ia@lore-desk>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Tue, 6 Oct 2026 09:06:03 -0500
X-Gm-Features: AclHuK8FBU2I3CZudI7_swPmDfZGR4Ssa4TCnIVoMwFoQK6fIquDhT8Z6kXaqsg
Message-ID: <CAEev2e8c6hZQQom6NV-URgdSoWiafCcRR3BtA6yxxqy7T-me8g@mail.gmail.com>
Subject: Re: [PATCH net v3] net: stmmac: propagate PTP addend and system time
 programming errors
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Jose Abreu <Jose.Abreu@synopsys.com>, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <fustini@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_070618_091217_8D28965B 
X-CRM114-Status: GOOD (  29.43  )
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

SGkgTG9yZW56bywKCk9uIFR1ZSwgT2N0IDYsIDIwMjYgYXQgMTo1N+KAr0FNIExvcmVuem8gQmlh
bmNvbmkKPGxvcmVuem8uYmlhbmNvbmlAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiA+IEhp
IExvcmVuem8sCj4gPgo+ID4gT24gTW9uLCBPY3QgNSwgMjAyNiBhdCA0OjUz4oCvUE0gTG9yZW56
byBCaWFuY29uaQo+ID4gPGxvcmVuem8uYmlhbmNvbmlAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6
Cj4gPiA+Cj4gPiA+ID4gT24gVHVlLCBTZXAgMjksIDIwMjYgYXQgMDM6MTA6MTFQTSArMDIwMCwg
TG9yZW56byBCaWFuY29uaSB3cm90ZToKPiA+ID4gPiA+IHN0bW1hY191cGRhdGVfc3Vic2Vjb25k
X2luY3JlbWVudCgpIGlnbm9yZXMgdGhlIGVycm9yIHJldHVybmVkIGJ5Cj4gPiA+ID4gPiBzdG1t
YWNfY29uZmlnX2FkZGVuZCgpLCBhbmQgc3RtbWFjX2luaXRfdHN0YW1wX2NvdW50ZXIoKSBkaXNj
YXJkcyB0aGUKPiA+ID4gPiA+IGFkZGVuZCBhbmQgc3lzdGVtIHRpbWUgcHJvZ3JhbW1pbmcgZXJy
b3JzLCBhbHdheXMgcmV0dXJuaW5nIHN1Y2Nlc3MuIEEKPiA+ID4gPiA+IGZhaWx1cmUgdG8gcHJv
Z3JhbSB0aGUgYWRkZW5kIChQVFBfVENSX1RTQUREUkVHKSBvciB0byBpbml0aWFsaXplIHRoZQo+
ID4gPiA+ID4gc3lzdGVtIHRpbWUgY291bnRlciAoUFRQX1RDUl9UU0lOSVQpIGlzIHRoZXJlZm9y
ZSBzaWxlbnRseSBzd2FsbG93ZWQsCj4gPiA+ID4gPiBsZWF2aW5nIHRoZSBoYXJkd2FyZSB0aW1l
c3RhbXAgY291bnRlciBpbiBhIG5vbi1ydW5uaW5nIG9yIHBhcnRpYWxseQo+ID4gPiA+ID4gY29u
ZmlndXJlZCBzdGF0ZSB3aGlsZSB0aGUgZHJpdmVyIGtlZXBzIG9wZXJhdGluZyBhcyBpZiB0aW1l
c3RhbXBpbmcKPiA+ID4gPiA+IHdlcmUgdXAuIFRoaXMgbWF0dGVycyBmb3IgVEFQUklPL0VTVCBv
ZmZsb2FkaW5nLCB3aGljaCBkZXJpdmVzIHRoZSBnYXRlCj4gPiA+ID4gPiBiYXNlIHRpbWUgZnJv
bSB0aGUgaGFyZHdhcmUgdGltZXN0YW1wIGNvdW50ZXIuCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhl
IHNhbWUgaG9va3MgYXJlIGFsc28gY2FsbGVkIGZyb20gdGhlIFBIQyBjYWxsYmFja3M6IHNldHRp
bWU2NCBhbmQKPiA+ID4gPiA+IGFkamZpbmUgZHJvcCB0aGUgZXJyb3IgYW5kIHJlcG9ydCBzdWNj
ZXNzIHRvIGNsb2NrX3NldHRpbWUoKSBhbmQKPiA+ID4gPiA+IGNsb2NrX2FkanRpbWUoKSwgc28g
YSBkZWFkIFBUUCByZWZlcmVuY2UgY2xvY2sgZ29lcyB1bm5vdGljZWQgYnkKPiA+ID4gPiA+IHB0
cDRsL3BoYzJzeXMuCj4gPiA+ID4gPgo+ID4gPiA+ID4gUmV0dXJuIGVycm9yIGNvZGVzIGZyb20g
c3RtbWFjX3VwZGF0ZV9zdWJzZWNvbmRfaW5jcmVtZW50KCksCj4gPiA+ID4gPiBzdG1tYWNfaW5p
dF90c3RhbXBfY291bnRlcigpLCBzdG1tYWNfZGxfdHNfY29hcnNlX3NldCgpIGFuZCB0aGUKPiA+
ID4gPiA+IHNldHRpbWU2NC9hZGpmaW5lIGNhbGxiYWNrcyBpbnN0ZWFkIG9mIHNpbGVudGx5IHJl
dHVybmluZyBzdWNjZXNzLiBPbgo+ID4gPiA+ID4gZmFpbHVyZSwgcm9sbCBiYWNrIHRoZSBwYXJ0
aWFsbHkgYXBwbGllZCBjb25maWd1cmF0aW9uIHNvIHRoZSBoYXJkd2FyZQo+ID4gPiA+ID4gYW5k
IHRoZSBkcml2ZXIgYm9va2tlZXBpbmcgc3RheSBjb25zaXN0ZW50LCBhbmQgcmVwb3J0IHRoZSBy
ZWFzb24KPiA+ID4gPiA+IHRocm91Z2ggdGhlIGRldmxpbmsgZXh0YWNrLiBBbHNvIGd1YXJkIGFn
YWluc3QgYSB6ZXJvIHN1Yi1zZWNvbmQKPiA+ID4gPiA+IGluY3JlbWVudCwgd2hpY2ggd291bGQg
b3RoZXJ3aXNlIGRpdmlkZSBieSB6ZXJvIHdoZW4gY29tcHV0aW5nIHRoZQo+ID4gPiA+ID4gYWRk
ZW5kLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFJlc2V0IHRoZSBwZXJzaXN0ZW50IHRpbWVzdGFtcGlu
ZyBzdGF0ZSAoaHd0c190eF9lbiwgaHd0c19yeF9lbiwKPiA+ID4gPiA+IHRzdGFtcF9jb25maWcs
IHN5c3RpbWVfZmxhZ3MgYW5kIHRzZnVwZHRfY29hcnNlKSB3aGVuIChyZSlpbml0aWFsaXppbmcK
PiA+ID4gPiA+IHRpbWVzdGFtcGluZywgc28gYSBmYWlsZWQgaW5pdCBkb2VzIG5vdCBsZWF2ZSBU
WC9SWCB0aW1lc3RhbXBpbmcKPiA+ID4gPiA+IGVuYWJsZWQgb24gYSBjb3VudGVyIHRoYXQgbmV2
ZXIgc3RhcnRlZC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBGaXhlczogY2M0YzkwMDFjZTMxICgibmV0
OiBzdG1tYWM6IFN3aXRjaCBzdG1tYWNfaHd0aW1lc3RhbXAgdG8gZ2VuZXJpYyBIVyBJbnRlcmZh
Y2UgSGVscGVycyIpCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMb3JlbnpvIEJpYW5jb25pIDxs
b3JlbnpvLmJpYW5jb25pQG9zcy5xdWFsY29tbS5jb20+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+
IENoYW5nZXMgaW4gdjM6Cj4gPiA+ID4gPiAtIERvIG5vdCBydW4gc3RtbWFjX2NvbmZpZ19hZGRl
bmQoKSBpbgo+ID4gPiA+ID4gICBzdG1tYWNfdXBkYXRlX3N1YnNlY29uZF9pbmNyZW1lbnQoKSBl
cnJvciBwYXRoLgo+ID4gPiA+ID4gLSBSZXR1cm4gZXJyb3IgZnJvbSBzdG1tYWNfYWRqdXN0X2Zy
ZXEoKSBhbmQgc3RtbWFjX3NldF90aW1lKCkuCj4gPiA+ID4gPiAtIFJlc2V0IGh3IHRzIGNvbmZp
Z3VyYXRpb24gaW4gc3RtbWFjX2luaXRfdGltZXN0YW1waW5nKCkuCj4gPiA+ID4gPiAtIExpbmsg
dG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjA5MjQtc3RtbWFjLXB0cC1hZGRl
ZC1zeXN0aW1lLWVycm9yLXYyLTEtYmViMmE2YjVmODY2QG9zcy5xdWFsY29tbS5jb20KPiA+ID4g
PiA+Cj4gPiA+ID4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gPiA+ID4gLSBJbml0aWFsaXplIHNlY19p
bmMgdG8gMCBpbiBzdG1tYWNfcmVzdG9yZV9zdWJzZWNvbmRfaW5jcmVtZW50KCkKPiA+ID4gPiA+
ICAgcm91dGluZS4KPiA+ID4gPiA+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDI2MDkyMC1zdG1tYWMtcHRwLWFkZGVkLXN5c3RpbWUtZXJyb3ItdjEtMS04YWM5ZTdh
M2ZjZTJAb3NzLnF1YWxjb21tLmNvbQo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgZHJpdmVycy9u
ZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYyB8IDEwNiArKysrKysrKysr
KysrKysrLS0tLS0tCj4gPiA+ID4gPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1t
YWMvc3RtbWFjX3B0cC5jICB8ICAxMCArLQo+ID4gPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgODQg
aW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25zKC0pCj4gPiA+ID4KPiA+ID4gPiBIZWxsbywgSSdt
IG5vdGljaW5nIHRoYXQgYWZ0ZXIgdGhpcyBwYXRjaCB3YXMgbWVyZ2VkIGludG8gbGludXgtbmV4
dCwKPiA+ID4gPiBib290IHNlZW1zIHRvIGhhbmcgd2hlbiBpcD1kaGNwIGlzIHVzZWQgYmVjYXVz
ZSBldGhlcm5ldCBpc24ndCB3b3JraW5nCj4gPiA+ID4gb24gdGhlIFRIMTUyMCBMaWNoZWUgUGkg
NGEuIFRoZXNlIGxpbmVzIGdldCBwcmludGVkIGluIGEgbG9vcCBvdmVyIGFuZAo+ID4gPiA+IG92
ZXIKPiA+ID4gPgo+ID4gPiA+IElQLUNvbmZpZzogZW5kMCBoYXJkd2FyZSBhZGRyZXNzIDcyOmNh
OmE4OmViOjI3OlsgICAyNC44NzI5ODJdIHRoZWFkLWR3bWFjIGZmZTcwNzAwMDAuZXRoZXJuZXQg
ZW5kMDogUmVnaXN0ZXIgTUVNX1RZUEVfUEFHRV9QT09MIFJ4US0wCj4gPiA+ID4gZjIgbXR1IDE1
MDAgREhDUAo+ID4gPiA+IFsgICAyNC45MDA0MTJdIHRoZWFkLWR3bWFjIGZmZTcwNzAwMDAuZXRo
ZXJuZXQgZW5kMDogUEhZIFtzdG1tYWMtMDowMV0gZHJpdmVyIFtSVEw4MjExRiBHaWdhYml0IEV0
aGVybmV0XSAoaXJxPVBPTEwpCj4gPiA+ID4gWyAgIDI0LjkxMjc4MF0gZHdtYWMxMDAwOiBNYXN0
ZXIgQVhJIHBlcmZvcm1zIGFueSBidXJzdCBsZW5ndGgKPiA+ID4gPiBbICAgMjQuOTEyODAxXSB0
aGVhZC1kd21hYyBmZmU3MDcwMDAwLmV0aGVybmV0IGVuZDA6IE5vIFNhZmV0eSBGZWF0dXJlcyBz
dXBwb3J0IGZvdW5kCj4gPiA+ID4gWyAgIDI1LjAxMDIyOV0gdGhlYWQtZHdtYWMgZmZlNzA3MDAw
MC5ldGhlcm5ldCBlbmQwOiBQVFAgaW5pdCBmYWlsZWQKPiA+ID4gPiBTSU9DU0lGRkxBR1M6IENv
bm5lY3Rpb24gdGltZWQgb3V0Cj4gPiA+Cj4gPiA+IEhpIEFuaXJ1ZGgsCj4gPiA+Cj4gPiA+IGJh
c2VkIG9uIHRoZSByZXBvcnRlZCBlcnJvciwgc3RtbWFjX2luaXRfdHN0YW1wX2NvdW50ZXIoKSBm
YWlscyB3aXRoCj4gPiA+IC1FVElNRURPVVQuIEluIHBhcnRpY3VsYXIgdGhpcyBjYW4gb2NjdXJz
IGlmOgo+ID4gPgo+ID4gPiBzdG1tYWNfaW5pdF90c3RhbXBfY291bnRlcigpCj4gPiA+ICAtPiBz
dG1tYWNfdXBkYXRlX3N1YnNlY29uZF9pbmNyZW1lbnQoKSAtPiBzdG1tYWNfY29uZmlnX2FkZGVu
ZCgpIC0+IC1FVElNRURPVVQKPiA+ID4gIC0+IHN0bW1hY19pbml0X3N5c3RpbWUoKSAtPiAtRVRJ
TUVET1VUCj4gPiA+Cj4gPiA+IEkgZ3Vlc3Mgd2Ugc2hvdWxkIHVuZGVyc3RhbmQgd2hpY2ggb25l
IGlzIGZhaWxpbmcgYW5kIHdoeSBpdCBpcyBmYWlsaW5nLgo+ID4KPiA+IEl0IHNlZW1zIGxpa2Ug
Ym90aCBhcmUgdGltaW5nIG91dCwgYm90aCBjb25maWdfYWRkZW5kCj4gPiAoUFRQX1RDUl9UU0FE
RFJFRykgYW5kIGluaXRfc3lzdGltZSAoUFRQX1RDUl9UU0lOSVQpLgo+Cj4gSXQgc2VlbXMgaHcg
dGltZXN0YW1waW5nIGhhcyBuZXZlciB3b3JrZWQgb24gdGhpcyBib2FyZCwgaXQgd2FzIGp1c3QK
PiB1bmRpc2NvdmVyZWQgc2luY2Ugc3RtbWFjX2luaXRfdHN0YW1wX2NvdW50ZXIoKSB3YXMgbm90
IHJlcG9ydGluZyBhbnkKPiBlcnJvciBiZWZvcmUgKHRoaXMgaXMgZXhhY3RseSB0aGUgZ29hbCBv
ZiB0aGlzIHBhdGNoKS4KPgo+IFdoYXQgYXJlIHRoZSBvdXRwdXQgZm9yOgo+IC0gSUVFRSAxNTg4
LTIwMDIgVGltZSBTdGFtcAo+IC0gSUVFRSAxNTg4LTIwMDggQWR2YW5jZWQgVGltZSBTdGFtcAo+
Cj4gcm9vdEByYjMtZ2VuMjp+IyBncmVwICdUaW1lIFN0YW1wJyAvc3lzL2tlcm5lbC9kZWJ1Zy9z
dG1tYWNldGgvZXRoMC9kbWFfY2FwCj4gSUVFRSAxNTg4LTIwMDIgVGltZSBTdGFtcDogTgo+IElF
RUUgMTU4OC0yMDA4IEFkdmFuY2VkIFRpbWUgU3RhbXA6IFkKClRoaXMgaXMgd2hhdCBJIHNlZQoK
cm9vdEBkZWJpYW4tdHJpeGllLXJpc2N2NjQ6LyMgZ3JlcCAnVGltZSBTdGFtcCcKL3N5cy9rZXJu
ZWwvZGVidWcvc3RtbWFjZXRoL2VuZDAvZG1hX2NhcApJRUVFIDE1ODgtMjAwMiBUaW1lIFN0YW1w
OiBOCklFRUUgMTU4OC0yMDA4IEFkdmFuY2VkIFRpbWUgU3RhbXA6IFkKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
