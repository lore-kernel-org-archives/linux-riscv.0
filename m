Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F22AEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 02:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Cj6QPagCeTyHqVzdgbA8gb1wgNP/jNNQIrCC9J59aoM=; b=4iu59VlBEhbyvbOWmpe9aDNKb8
	7Hb4uxbfKZ7DCVFmcBEY0S8ab71dvjkzj6bjy68JarEFuzHOwiTiS6sy1/Hb/LemQWGAbHEovK5X5
	pPqfa7/lB5R6XVBx5lzCcIMGxj76WCJ2nwIuwEhTUz+m3o66NTMIlGSZiLRDYxF/5j/ppAjeGT1Ik
	7wItRhZvWIe2PST/POjLo7yLleh4teoDycKKms+IsPM+mzYQpF9m+F7we0xm3IAe60DOWuLzOevDE
	viHYVnS4mMd3WjJnpeiCWGL1LfrQm9ItixEu21i2dsBgkj4Cg61QfCoKhPSCZyqWojTCjFWMcWS5w
	izOKOvyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDcNR-009Bn1-2p;
	Mon, 26 Jun 2023 02:54:53 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDcNO-009Bma-2G
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 02:54:52 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7836164a08aso9787039f.1
        for <linux-riscv@lists.infradead.org>; Sun, 25 Jun 2023 19:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1687748089; x=1690340089;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oe898F/ffsJMUw2yiRdqMyZnDfV5Af+l4vque2ZH6fo=;
        b=Y8QLvQKDtphi3w29TRqCxG1CgC5SLHTHPJgZvlNl9fNfUwzKI7qQDD8W0/CmtC3ARN
         yY2w6lOJNtA18kSrIRrefWAI3QurrQntiZuVly1xszJ9c+JrmLuuZTJuYRv6HqWjLYh5
         WcKSlNLMAa1BWsYaJZSdMuRNyjAGLDygcGtLoqH+XFuHbpuRE05zxU2SC+BOMbXX53Up
         4aGyoeCD+aRLTb9chp8puDRt74haeM5fB3V9QxUYzsKpnB0v/OPtloGaP1zKFDWAC/dR
         P5rEry1g1gr5yyV2NN0OaY91N3Bb7P41MrBS+7+DlJD7uE8dgXXeIqBN5i4O8iEcLlAq
         fWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687748089; x=1690340089;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oe898F/ffsJMUw2yiRdqMyZnDfV5Af+l4vque2ZH6fo=;
        b=Ki8TV2B33jqBIqy/hqE/Hrv7sD5kA0ODCr+YjedPKEUybAaGxrPmAXplNc4TiBx/Og
         yJkSnEJ2hmnnodPozGRUfyLbUs5ComrZIizadPLIwd2+X7WKG+vCeIAJdT5fByaHTxol
         4zOm3/OavIVVrIXhtKsHze/CQ7Ua2i4GB1YJMBAkPbQAesTg6hh7WLcPtRUlq5nzJMyM
         MimefbWh+aFYn+BEWcwIm2TM39+WLjyavxZu8EqD8eYGmzFOhd4ZTCAwxb61n8VqZcmY
         SxiSuvVPN87ZD40owNIZnAzDqSNfQbMaYpCphjsFCGi/opNyfn3aAq6hkI9YLDJJXZWm
         o7Eg==
X-Gm-Message-State: AC+VfDyelOAbJQSJyzuzRnotjYxQxl7o6vlzLKx7Ebo6W0gL2Q4/cLHL
	sklDI/+LTXN1SLFJwsdiDIIxOJjH57hm7yixJL6wLg==
X-Google-Smtp-Source: ACHHUZ615xhJwtejY7OBv9Vr1PrPfhnmy/+F15DzYviSu9aEuxrRSqaHPcXGNyMW6ZoCWQh0tDuw9Bif6+WOgKQz52c=
X-Received: by 2002:a92:d091:0:b0:345:6e6e:5351 with SMTP id
 h17-20020a92d091000000b003456e6e5351mr6562449ilh.22.1687748089020; Sun, 25
 Jun 2023 19:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230531090141.23546-1-zong.li@sifive.com>
In-Reply-To: <20230531090141.23546-1-zong.li@sifive.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 26 Jun 2023 10:54:38 +0800
Message-ID: <CANXhq0rVred1YMcV5449yYt+MhOu2NUx9Oa-1xJqbS=o_1Qb6g@mail.gmail.com>
Subject: Re: [PATCH v3] dmaengine: xilinx: dma: remove arch dependency
To: vkoul@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	radhey.shyam.pandey@amd.com, dmaengine@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_195450_783036_74C11177 
X-CRM114-Status: GOOD (  19.92  )
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

T24gV2VkLCBNYXkgMzEsIDIwMjMgYXQgNTowMeKAr1BNIFpvbmcgTGkgPHpvbmcubGlAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBBcyBmb2xsb3dpbmcgcGF0Y2hlcywgeGlsaW54IGRtYSBpcyBhbHNv
IG5vdyBhcmNoaXRlY3R1cmUgYWdub3N0aWMsCj4gYW5kIGl0IGNhbiBiZSBjb21waWxlZCBmb3Ig
c2V2ZXJhbCBhcmNoaXRlY3R1cmVzLiBXZSBoYXZlIHZlcmlmaWVkIHRoZQo+IENETUEgb24gUklT
Qy1WIHBsYXRmb3JtLCBsZXQncyByZW1vdmUgdGhlIEFSQ0ggZGVwZW5kZW5jeSBsaXN0IGluc3Rl
YWQKPiBvZiBhZGRpbmcgbmV3IEFSQ0guCj4KPiBUbyBhdm9pZCBicmVha2luZyB0aGUgczM5MCBi
dWlsZCwgYWRkIGEgZGVwZW5kZW5jeSBvbiBIQVNfSU9NRU0uCj4KPiAnZThiNmM1NGY2ZDU3ICgi
bmV0OiB4aWxpbng6IHRlbWFjOiBSZWxheCBLY29uZmlnIGRlcGVuZGVuY2llcyIpJwo+ICdkN2Vh
Zjk2MmE5MGIgKCJuZXQ6IGF4aWVuZXQ6IEluIGtjb25maWcgcmVtb3ZlIGFyY2ggZGVwZW5kZW5j
eSBmb3IgYXhpX2VtYWMiKScKPgo+IFNpZ25lZC1vZmYtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lm
aXZlLmNvbT4KPiBBY2tlZC1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+
Cj4gU3VnZ2VzdGVkLWJ5OiBSYWRoZXkgU2h5YW0gUGFuZGV5IDxyYWRoZXkuc2h5YW0ucGFuZGV5
QGFtZC5jb20+Cj4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29t
Pgo+IC0tLQo+Cj4gIENoYW5nZXMgaW4gdjM6Cj4gIC0gQWRkIGEgZGVwZW5kZW5jeSBvbiBIQVNf
SU9NRU0gdG8gYXZvaWQgYnJlYWtpbmcgdGhlIHMzOTAgYnVpbGQKPgo+ICBDaGFuZ2VzIGluIHYy
Ogo+ICAtIFJlbW92ZSBBUkNIIGRlcGVuZGVuY3kgbGlzdCBpbnN0ZWFkIG9mIGFkZGluZyBuZXcg
QVJDSAo+Cj4gIGRyaXZlcnMvZG1hL0tjb25maWcgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1h
L0tjb25maWcgYi9kcml2ZXJzL2RtYS9LY29uZmlnCj4gaW5kZXggZjVmNDIyZjliODUwLi5mZDVh
OTRlNjcxNjMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9kbWEvS2NvbmZpZwo+ICsrKyBiL2RyaXZl
cnMvZG1hL0tjb25maWcKPiBAQCAtNjk2LDcgKzY5Niw3IEBAIGNvbmZpZyBYR0VORV9ETUEKPgo+
ICBjb25maWcgWElMSU5YX0RNQQo+ICAgICAgICAgdHJpc3RhdGUgIlhpbGlueCBBWEkgRE1BUyBF
bmdpbmUiCj4gLSAgICAgICBkZXBlbmRzIG9uIChBUkNIX1pZTlEgfHwgTUlDUk9CTEFaRSB8fCBB
Uk02NCkKPiArICAgICAgIGRlcGVuZHMgb24gSEFTX0lPTUVNCj4gICAgICAgICBzZWxlY3QgRE1B
X0VOR0lORQo+ICAgICAgICAgaGVscAo+ICAgICAgICAgICBFbmFibGUgc3VwcG9ydCBmb3IgWGls
aW54IEFYSSBWRE1BIFNvZnQgSVAuCj4gLS0KPiAyLjE3LjEKPgoKSGkgVmlub2QsCkxpbnV4IDYu
NS1yYzEgaXMgb3BlbmluZywgY291bGQgSSBrbm93IGlmIHRoaXMgcGF0Y2ggaXMgZ29vZCBmb3Ig
eW91PwpXb3VsZCBpdCBiZSBjb25zaWRlcmVkIGluIHRoaXMgbWVyZ2Ugd2luZG93PwpUaGFua3Mu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
