Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1AFEB64D9
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 03:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lsedEDxIlDwbBGRBl4VgHE69u4b+HBM1dzPHoIAA5VA=; b=n7VNV1S2CEtaOgCs4yHYJPde7s
	epQqS5zvrqP4J0cKilLOawQ6r3LChle02mo/hION8nVJGqu+OQ1TOPXCJKFszQl8sLfKp6GLDJPIT
	R0RjUsakjZ2liU2PRL+V85cFT/Sriq4nQaD+aij0SbhokpeEAEgMLoOQuwdZmPijyoc2OeC73K8eO
	NCCgODQNqaZfwgiXflf/LgHQ6a20XMyUagviM3/vuHbV4Q/t9+ZMHgqbLUovXEoiePpYlheomlaDw
	guKwvLdQ0YEWq+TspUZoiIC9w+E80hKK4uYS1Tnwn03nbfA4erRQxPa96QfgSmMSH5f6g5RNAW9J7
	2OXHUlFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF4P0-002k6e-0P;
	Fri, 30 Jun 2023 03:02:30 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF4Ox-002k67-0O
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 03:02:28 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1b80b3431d2so8204165ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 29 Jun 2023 20:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688094146; x=1690686146;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Va3tAPpwtxEmLPxNg69OFrJC2hoHfa4rp2U1Z8KvtRU=;
        b=A67+C+eWJHOVAterElQo91+WZz+bzJSt1esSLU8WwT85tAotyuG6kRiAtWCCPxoFzy
         gGO5bRrXkxkVeSvDJXwXXWA+1YBHIS/yTMzGrA7BjZxwP8M8Wfz4DR2CZ+fmlRNN6JU9
         GW8SxlPonEpwOjzFQDTE6OVIE30cYAAMt87Awytwg4Y9I2ZNgsmsXa/vVog93RFkV4d7
         yPyUjfzUWiNSoqjrjWKA379hJRYHW1beW1C/BkHhExtl6dYhLB7UDbYx9Wyy4OyN1DEu
         oWRStgoOfWVt23isXsMsuaWjXfdvBWVvYFjeyCFYpkcGQHM/v/CI6pLl31UUJfqX+4Ai
         3t1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688094146; x=1690686146;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Va3tAPpwtxEmLPxNg69OFrJC2hoHfa4rp2U1Z8KvtRU=;
        b=XEHLE+HyeWigpeD7bEVzBYKMt8pn2khMwc1szTxWpwYS1/2THGAKNRh0MWTvrXCAXi
         ZcBwC7mDrXXLh1c2tNb3ZHxV1howRv1ont6fnI4WkpxP2c+BxbS3H00E3cKmDxnKNRbi
         E+d42a4Y6xek21492bhmZ8yYo7kco+XBNQmlOsgoEpyURB2nlQwPQ9V1/SyFUK6o77IM
         Vfe3rpvqZIv0FYeuiCzy2J3vfWV2QHWztTOAPGQZuzK+6XC7T0mQ0SGf54mbVeoYCjtD
         AoNdndVnsYqgZb8PTmgpGf7vF5CZCF53rKFlGGT0WzrCEGsT2O11cForIgef7zHEYGsm
         n3PQ==
X-Gm-Message-State: ABy/qLYfcH/VGsAuot/GAWFxgiooIuYKn9Hvy6jTVaKD2y+o3RulyxZE
	Vv39wQ3hONvL1I2RhdW7bRU=
X-Google-Smtp-Source: APBJJlFcEd5YX9HITYzLp54d+gol3Qp11faPUNSzChKdnTHk6pnRYxsToE3fBOzdECXM8TiXc7wNTg==
X-Received: by 2002:a17:902:da92:b0:1b8:525a:f685 with SMTP id j18-20020a170902da9200b001b8525af685mr988169plx.37.1688094145942;
        Thu, 29 Jun 2023 20:02:25 -0700 (PDT)
Received: from [0.0.0.0] ([5.180.77.117])
        by smtp.gmail.com with ESMTPSA id p8-20020a170902b08800b001b8307c81c8sm3745102plr.121.2023.06.29.20.02.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 20:02:25 -0700 (PDT)
Message-ID: <0787532c-4520-6d01-c50c-63df207f570c@gmail.com>
Date: Fri, 30 Jun 2023 11:02:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] riscv: BUG_ON() for no cpu nodes in setup_smp
To: Conor Dooley <conor.dooley@microchip.com>
References: <20230629105839.1160895-1-suagrfillet@gmail.com>
 <20230629-maverick-kelp-17327f04482a@wendy>
From: Song Shuai <suagrfillet@gmail.com>
In-Reply-To: <20230629-maverick-kelp-17327f04482a@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_200227_158142_42CE182B 
X-CRM114-Status: GOOD (  30.71  )
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
Cc: apatel@ventanamicro.com, aou@eecs.berkeley.edu, leyfoon.tan@starfivetech.com, linux-kernel@vger.kernel.org, palmer@dabbelt.com, evan@rivosinc.com, paul.walmsley@sifive.com, greentime.hu@sifive.com, linux-riscv@lists.infradead.org, heiko.stuebner@vrull.eu, ajones@ventanamicro.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CuWcqCAyMDIzLzYvMjkgMjA6MzMsIENvbm9yIERvb2xleSDlhpnpgZM6Cj4gSGV5LAo+IAo+IE9u
IFRodSwgSnVuIDI5LCAyMDIzIGF0IDA2OjU4OjM5UE0gKzA4MDAsIFNvbmcgU2h1YWkgd3JvdGU6
Cj4+IFdoZW4gYm9vdGluZyB3aXRoIEFDUEkgdGFibGVzLCB0aGUgdGlueSBkZXZpY3RyZWUgY3Jl
YXRlZCBieQo+PiBFRkkgU3R1YiBkb2Vzbid0IHByb3ZpZGUgY3B1IG5vZGVzLgo+IAoKIldoZW4g
b25seSB0aGUgQUNQSSB0YWJsZXMgYXJlIHBhc3NlZCB0byBrZXJuZWwsIHRoZSB0aW55Li4uIgpU
aGF0IHNlZW1zIG1vcmUgYWNjdXJhdGUuIFdlIGNhbiB1c2UgImFjcGk9IiBrZXJuZWwKcGFyYW1l
dGVyIHRvIG1hbnVhbGx5IGVuYWJsZS9kaXNhYmxlIEFDUEkuCgo+IFdoYXQgYXJlIHRoZSBjb25k
aXRpb25zIHRoYXQgYXJlIHJlcXVpcmVkIHRvIHJlcHJvZHVjZSB0aGlzIGlzc3VlPwo+IFdoZW4g
Ym9vdGluZyB3aXRoIEFDUEksIHdoeSBpcyBhY3BpX2Rpc2FibGVkIHRydWU/Cj4gSW4gbXkgbmFp
dmV0eSwgdGhhdCBzZWVtcyBsaWtlIGEgYmlnZ2VyIHByb2JsZW0gdG8gYWRkcmVzcy4gPgoKQWN0
dWFsbHksIEkgYXBwZW5kZWQgdGhlICJhY3BpPW9mZiIgdG8ga2VybmVsIGNtZGxpbmUgZm9yIHRl
c3RpbmcgdGhlIAoib2ZmIiBvcHRpb24uIFRoYXQgd291bGQgc2V0IGFjcGlfZGlzYWJsZWQgYXMg
dHJ1ZS4KCj4+IEluIHNldHVwX3NtcCgpLCBvZl9wYXJzZV9hbmRfaW5pdF9jcHVzKCkgd2lsbCBi
dWcgb24gIWZvdW5kX2Jvb3RfY3B1Cj4gCj4gUGxlYXNlLCBzL29uICFmb3VuZF9ib290X2NwdS9p
ZiB0aGUgYm9vdCBjcHUgaXMgbm90IGZvdW5kIGluIHRoZQo+IGRldmljZXRyZWUvLCBvciBzaW1p
bGFyLgo+IApvawo+PiBpZiBhY3BpX2Rpc2FibGVkLgo+IAo+IFdoeSB3b3VsZCBvZl9wYXJzZV9h
bmRfaW5pdF9jcHVzKCkgYmUgY2FsbGVkIGluIGFueSBvdGhlciBjYXNlPyBUaGVyZSdzCj4gb25s
eSB0aGlzIG9uZSBjYWxsZXIsIHJpZ2h0Pwp5ZXMKPiAKPj4gVGhhdCdzIHVuY2xlYXIsIHNvIGJ1
ZyBmb3Igbm8gY3B1IG5vZGVzIGJlZm9yZQo+PiBvZl9wYXJzZV9hbmRfaW5pdF9jcHVzKCkuCj4g
Cj4gV2hhdCBpcyB1bmNsZWFyPyBUaGF0IHRoZSByZWFzb24gZm9yIHRoZSBCVUcoKSB3YXMgdGhh
dCB0aGVyZSB3ZXJlIG5vCj4gY3B1IG5vZGVzLCBzaW5jZSBpdCBjb3VsZCBhbHNvIGJlIHRoYXQg
dGhlcmUgd2VyZSBDUFUgbm9kZXMgYnV0IHRoZXkKPiB3ZXJlIGRpc2FibGVkIGV0Yz8KClRoZSBC
VUcoKSBpbiBvZl9wYXJzZV9hbmRfaW5pdF9jcHVzKCkgaW5kaWNhdGVzIHRoZXJlIHdhcyBubyBi
b290IGNwdSAKZm91bmQgaW4gdGhlIGRldmljZXRyZWUgLCBub3QgdGhlcmUgd2VyZSBubyBjcHUg
bm9kZXMgaW4gdGhlIGRldmljZXMuClRoYXQncyB0aGUgInVuY2xlYXIiIEkgbWVhbi4KCj4gCj4+
IFNpZ25lZC1vZmYtYnk6IFNvbmcgU2h1YWkgPHN1YWdyZmlsbGV0QGdtYWlsLmNvbT4KPj4gLS0t
Cj4+ICAgYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jIHwgNyArKysrKystCj4+ICAgMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9v
dC5jCj4+IGluZGV4IDZjYTJiNTMwOWFhYi4uMjQzYTdiNTMzYWQ3IDEwMDY0NAo+PiAtLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMKPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc21w
Ym9vdC5jCj4+IEBAIC0xODcsOCArMTg3LDEzIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBvZl9wYXJz
ZV9hbmRfaW5pdF9jcHVzKHZvaWQpCj4+ICAgCj4+ICAgdm9pZCBfX2luaXQgc2V0dXBfc21wKHZv
aWQpCj4+ICAgewo+PiAtCWlmIChhY3BpX2Rpc2FibGVkKQo+PiArCWlmIChhY3BpX2Rpc2FibGVk
KSB7Cj4+ICsJCS8qIFdoZW4gYm9vdGluZyB3aXRoIEFDUEkgdGFibGVzLCB0aGUgZGV2aWN0cmVl
IGNyZWF0ZWQgYnkgRUZJIFN0dWIKPiAKPiBUaGlzIGlzIG5vdCBuZXRkZXYsIHBsZWFzZSB1c2Ug
dGhlIGNvcnJlY3QgY29tbWVudCBzdHlsZSA6Lwo+IAo+PiArCQkgKiBkb2Vzbid0IHByb3ZpZGUg
Y3B1IG5vZGVzLiBTbyBCVUcgaGVyZSBmb3IgYW55IGFjcGlfZGlzYWJsZWQuCj4+ICsJCSAqLwo+
PiArCQlCVUdfT04oIW9mX2dldF9uZXh0X2NwdV9ub2RlKE5VTEwpKTsKPj4gICAJCW9mX3BhcnNl
X2FuZF9pbml0X2NwdXMoKTsKPj4gKwl9Cj4+ICAgCWVsc2UKPj4gICAJCWFjcGlfcGFyc2VfYW5k
X2luaXRfY3B1cygpOwo+IAo+IGNoZWNrcGF0Y2ggc2hvdWxkIGhhdmUgdG9sZCB5b3UgdGhhdCB5
b3Ugbm93IG5lZWQgdG8gYWRkIGJyYWNlcyBvbiBhbGwKPiBhcm1zIG9mIHRoaXMgc3RhdGVtZW50
LgpvaywKPiAKPiBPciwgYmV0dGVyIHlldCwgbW92ZSB0aGUgd2hvbGUgdGhpbmcgaW50byBvZl9w
YXJzZV9hbmRfaW5pdF9jcHVzKCkgaW4KPiB0aGUgZmlyc3QgcGxhY2U/IFlvdSBjb3VsZCBkcm9w
IG1vc3Qgb2YgdGhlIGNvbW1lbnQgaW4gdGhlIHByb2Nlc3MsCj4gc2luY2UgSSB0aGluayB0aGUg
ZGV0YWlscyBvZiBob3cgeW91IGhpdCB0aGlzIHByb2JsZW0gd291bGQgbGlrZWx5IG5vdAo+IGJl
IGhlbHBmdWwgdG8gYW55b25lIHRoYXQgaGl0IGl0IHVuZGVyIGRpZmZlcmVudCBjb25kaXRpb25z
Lgo+IApvaywgSSdsbCBhcHBseSB0aGVzZSBjb21tZW50cyBpZiB5b3UncmUgb2sgd2l0aCBteSBy
ZXBsaWVzLgoKPiBDaGVlcnMsCj4gQ29ub3IuCj4gCj4+ICAgfQo+PiAtLSAKPj4gMi4yMC4xCj4+
CgotLSAKVGhhbmtzClNvbmcgU2h1YWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
