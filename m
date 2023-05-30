Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E76C77B73
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 06:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7wtL5XIP6qeCHWSH4/UUbMji19eTayz4GjGRAlxUiMY=; b=zNqestNLLMDi3b
	8cP0YlO62gcI0JeuWeFL2hyyJ7yfzt6e2ICsrwV5pQeVzF4HSX5tCZbPD2syQTjTK+9BYstlpfNL9
	8JvTvbcW0W/czjlPILWdUvk0lDScUsJDqPxH0K8ZbVVRlHaW9FOREqp8xvHXjZv8kjOXEkWaDSuNv
	IVJjSt2w6jHkm4VSCAAY0jopB25srmrlVFq8pRgvgJHnhno7a4oCIn/BEZdxLDjVvbiza8kqcpiDd
	SC7hzhBoSsiz9sqBbG0SQidIioj05dxF0na4BJFnuumPNtC1dLfuKCiNDxWBgSOSYAGiOgfuSmUy2
	TzS8O3E97WUqX1rPfdug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tDV-00Ccpb-2o;
	Tue, 30 May 2023 06:52:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tDT-00Ccop-12
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 06:52:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E0DBD62AB1
	for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 06:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D30C433EF
	for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 06:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685429542;
	bh=siy9Ko3UbHkih669rTBXTrvvQJb6+6k5h7kksul6NjI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hjuWY8Xz1RNVPltId3hJptIderckVfGZUOze/C01KfNLTniS/9JvZq2ZLrX62m+HX
	 EP8gdcj04gBtPPWvc9nwSGzRvfmKo0HA9WC7hNmtkBldqQyq3DGgLLvFO3BWlo2O9R
	 uAY0MOAIxcm/zSAvPsDy+tqReP/Qe2/TX+NraxQbqG7mhubXOytt1d8UjzkZMBWNil
	 h7iQqH3U8EKBI9YuUDTXf6jPR8tGkQSolZ8YcyWYnohyrWQegVohXQnwKZpug06zU5
	 jIlCETnkZ/11wjn4aC3gXIJJmgxTjUO3H68E3sZsyUw6WMApoWhKyKg7decYv1/0JK
	 CBW7gFicrQBNQ==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-51492ae66a4so4006366a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 May 2023 23:52:22 -0700 (PDT)
X-Gm-Message-State: AC+VfDwW8+OUPL6SfTJgKadLNn9Ezmn/hVLeyxFWvv/LVWAuK1dEWf44
	38dX3jXE9Gu/j4nRPSKdXpBc9Kml0d7QWYAyHdQ=
X-Google-Smtp-Source: ACHHUZ7TPl4oqNW3y5WapM499wNVHLkNCZ/pq+hqHH1T3d3rEcKGogkr0Z5uJqSVymnmk+X6pAcpDng3aDt3ARvmnGk=
X-Received: by 2002:aa7:c504:0:b0:504:b228:878d with SMTP id
 o4-20020aa7c504000000b00504b228878dmr878888edq.25.1685429540598; Mon, 29 May
 2023 23:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230529073845.2859178-1-guoren@kernel.org> <20230529-jasmine-amigo-6d01f6852b35@wendy>
 <CAJF2gTRSoZbexqka=_7nf4+dHZW2FGf++BiTMypfTbeoGAbUiA@mail.gmail.com>
In-Reply-To: <CAJF2gTRSoZbexqka=_7nf4+dHZW2FGf++BiTMypfTbeoGAbUiA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 30 May 2023 14:52:09 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTzUfp7xDr8myA+xMcxGNEQ+XLEYMfoR91NShdBAQMu7Q@mail.gmail.com>
Message-ID: <CAJF2gTTzUfp7xDr8myA+xMcxGNEQ+XLEYMfoR91NShdBAQMu7Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: vector: Fixup modules compile error
To: Conor Dooley <conor.dooley@microchip.com>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, andy.chiu@sifive.com, 
	paul.walmsley@sifive.com, palmer@rivosinc.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_235223_436266_B22B2348 
X-CRM114-Status: GOOD (  24.34  )
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

T24gVHVlLCBNYXkgMzAsIDIwMjMgYXQgMTA6NTnigK9BTSBHdW8gUmVuIDxndW9yZW5Aa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIE1heSAyOSwgMjAyMyBhdCA5OjQz4oCvUE0gQ29ub3Ig
RG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gTW9u
LCBNYXkgMjksIDIwMjMgYXQgMDM6Mzg6NDVBTSAtMDQwMCwgZ3VvcmVuQGtlcm5lbC5vcmcgd3Jv
dGU6Cj4gPiA+IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+ID4K
PiA+ID4gU29tZSAua28gYWxzbyBuZWVkIHRoZSByaXNjdl92X3VzZXJfYWxsb3dlZCBzeW1ib2wu
Cj4gPiA+Cj4gPiA+IEVSUk9SOiBtb2Rwb3N0OiAicmlzY3Zfdl91c2VyX2FsbG93ZWQiIFthcmNo
L3Jpc2N2L2t2bS9rdm0ua29dCj4gPiA+IHVuZGVmaW5lZCEKPiA+ID4gbWFrZVszXTogKioqCj4g
PiA+IFsvaG9tZS9ndW9yZW4vc291cmNlL2tlcm5lbC9saW51eC9zY3JpcHRzL01ha2VmaWxlLm1v
ZHBvc3Q6MTM2Ogo+ID4gPiBNb2R1bGUuc3ltdmVyc10gRXJyb3IgMQo+ID4gPgo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+ID4gPiAtLS0KPiA+ID4gIGFy
Y2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jIHwgMSArCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Zl
Y3Rvci5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMKPiA+ID4gaW5kZXggMWM0YWM4MjFl
MDA4Li4zYWUwODgxNmQ2MDggMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Zl
Y3Rvci5jCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jCj4gPiA+IEBAIC0x
MjksNiArMTI5LDcgQEAgYm9vbCByaXNjdl92X3VzZXJfYWxsb3dlZCh2b2lkKQo+ID4gPiAgewo+
ID4gPiAgICAgICByZXR1cm4gcmlzY3Zfdl9nZXRfY3VyX2N0cmwoY3VycmVudCkgPT0gUFJfUklT
Q1ZfVl9WU1RBVEVfQ1RSTF9PTjsKPiA+ID4gIH0KPiA+ID4gK0VYUE9SVF9TWU1CT0wocmlzY3Zf
dl91c2VyX2FsbG93ZWQpOwo+ID4KPiA+IElzIHRoZXJlIGEgcmVhc29uIHRoYXQgdGhpcyBzaG91
bGQgbm90IGJlIEVYUE9SVF9TWU1CT0xfR1BMKCk/Cj4gR29vZCBxdWVzdGlvbiwgYnV0IEkganVz
dCBmb2xsb3cgb3VyIGFyY2gvcmlzY3YgaGFiYml0LCBtYXliZSB3ZQo+IHNob3VsZCBjaGFuZ2Ug
YWxsIG9mIHRoYXQgaW4gYW5vdGhlciBwYXRjaC4KPgo+IOKenCAgbGludXgtczY0aWxwMzIgZ2l0
OihzNjRpbHAzMikg4pyXIGdyZXAgRVhQT1JUX1NZTUJPTCAgYXJjaC9yaXNjdiAtciB8IHdjIC1s
Cj4gNjYKPiDinpwgIGxpbnV4LXM2NGlscDMyIGdpdDooczY0aWxwMzIpIOKclyBncmVwIEVYUE9S
VF9TWU1CT0xfR1BMICBhcmNoL3Jpc2N2IC1yIHwgd2MgLWwKPiAxNQoKV2h5ICFNT0RVTEVfTElD
RU5TRShHUEwpIG1vZHVsZXMgY291bGRuJ3QgdXNlIHJpc2N2X3ZfdXNlcl9hbGxvd2VkPwpTZWVt
cyBFWFBPUlRfU1lNQk9MX0dQTCBoYXMgbW9yZSBsaW1pdGF0aW9ucy4KCjpjOmZ1bmM6YEVYUE9S
VF9TWU1CT0xfR1BMKClgCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpEZWZpbmVkIGlu
IGBgaW5jbHVkZS9saW51eC9leHBvcnQuaGBgCgpTaW1pbGFyIHRvIDpjOmZ1bmM6YEVYUE9SVF9T
WU1CT0woKWAgZXhjZXB0IHRoYXQgdGhlIHN5bWJvbHMKZXhwb3J0ZWQgYnkgOmM6ZnVuYzpgRVhQ
T1JUX1NZTUJPTF9HUEwoKWAgY2FuIG9ubHkgYmUgc2VlbiBieQptb2R1bGVzIHdpdGggYSA6Yzpm
dW5jOmBNT0RVTEVfTElDRU5TRSgpYCB0aGF0IHNwZWNpZmllcyBhIEdQTApjb21wYXRpYmxlIGxp
Y2Vuc2UuIEl0IGltcGxpZXMgdGhhdCB0aGUgZnVuY3Rpb24gaXMgY29uc2lkZXJlZCBhbgppbnRl
cm5hbCBpbXBsZW1lbnRhdGlvbiBpc3N1ZSwgYW5kIG5vdCByZWFsbHkgYW4gaW50ZXJmYWNlLiBT
b21lCm1haW50YWluZXJzIGFuZCBkZXZlbG9wZXJzIG1heSBob3dldmVyIHJlcXVpcmUgRVhQT1JU
X1NZTUJPTF9HUEwoKQp3aGVuIGFkZGluZyBhbnkgbmV3IEFQSXMgb3IgZnVuY3Rpb25hbGl0eS4K
CkZvciBrdm0gaXMgb2theToKCk1PRFVMRV9BVVRIT1IoIlF1bXJhbmV0Iik7Ck1PRFVMRV9MSUNF
TlNFKCJHUEwiKTsKClNvLCBJIHdvdWxkIGxlYXZlIHRoZSBkZWNpdGlvbiB0byBBbmR5LiBJZiBo
ZSBkaWRuJ3Qgd2FudCBpdCB1c2VkIHdpdGgKb3RoZXIgbm9uLWdwbCBtb2R1bGVzLCBjaG9vc2Ug
dGhlIEVYUE9SVF9TWU1CT0xfR1BMLgoKPgo+ID4KPiA+IEkgZmlndXJlIEFuZHkgd2lsbCByb2xs
IHRoaXMgaW50byB0aGlzIG5leHQgcmV2aXNpb24uCj4gPgo+ID4gQ2hlZXJzLAo+ID4gQ29ub3Iu
Cj4KPgo+Cj4gLS0KPiBCZXN0IFJlZ2FyZHMKPiAgR3VvIFJlbgoKCgotLSAKQmVzdCBSZWdhcmRz
CiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
