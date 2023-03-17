Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04CBC74A5B
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 14:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F2i/ZkAtzz7E0bhfAWEIXpNJFeY++oHWmfTPd77w2kc=; b=F7SrTKZxAyl+0T
	IeLBcsXlfxcJZEgbR0+7QAKsGp+SaQ1UVGH+nIN4G0wn4Xnv908VcVyO4r01QwPJKvx+Bgggzf0d/
	90AJdAgRYaiVCytRMDZ0a0PwSUQ8MSiDYmJH2IJg0sWMd0dXno03EprrDkQorVWkxY+T5WsSBam14
	gOSxTVNt4eWcb5RbdnMAcJa96Gb8TpL2fh8BGj81TEiNYX+YAIY/g9K4UjxiehKkapKVAXb/vs2hW
	4Tlt4asGafWkKf6rwQJJnffOv8+o0abWOBOnrzuRb6/xWBSSlMEcBUUZvDjTgJtEP63wL6HxbdiOt
	e5v0B/i+yK4NgmbFwCSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdB3q-002SRn-2r;
	Fri, 17 Mar 2023 14:28:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdB3n-002SQl-27;
	Fri, 17 Mar 2023 14:28:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2EA06622CE;
	Fri, 17 Mar 2023 14:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC1EC43442;
	Fri, 17 Mar 2023 14:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679063277;
	bh=Ja0gXd3YfBR6uYrUbXl92wXVqvLZJFGUpGHdiwj+ROI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mdwCqXGqNep4EKAupw8jzfhWRrjq79YWH/MMQgK3tQSZC3hiyuYvbCWPTxwxLwpHJ
	 FhfR3yNKFqj/NDBbszx/GvZ/J3/VMSeXoWCDwzES0AjdQiL1tvLD0BBMZ//FgxkrFf
	 rRZHPmusSP2wcH9FuRjE8NFAqd7RVcTHkYI4fFrxuBQTLwnCSup5sz3Pq3dyCuOkyy
	 Yi4E+sbyIKDivzUMuGYa8qkS9ILxgOwMjxYArHb//UyvvSyvqI8tHbgy89AH02HhIV
	 agzW+EDeGvYcmM54DsDVhSg7ETaaEAxyM6Q15ke0yOFXafWjNuoaAIC7GScvP7ngF8
	 BGyMe2skQ+W4w==
Received: by mail-ua1-f43.google.com with SMTP id m5so3438455uae.11;
        Fri, 17 Mar 2023 07:27:57 -0700 (PDT)
X-Gm-Message-State: AO0yUKXcTRB33esrBdMWhRnLTFLnRidcr6ugxii0k5Wzy/q/ao8V99qN
	UMCmTUiOx0mezMfczuTHb+HGchICxMJXc4k1EA==
X-Google-Smtp-Source: AK7set+opXfvV0KuRUWrTn9+KJEXDQa7roIGehinVec3htJJWc+YaBCYf2jrEie3nmO3df834BaxB7f6VqlHHcNfwWw=
X-Received: by 2002:a1f:2cd7:0:b0:401:73f4:dfe with SMTP id
 s206-20020a1f2cd7000000b0040173f40dfemr8088vks.3.1679063276330; Fri, 17 Mar
 2023 07:27:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
 <20230315114806.3819515-2-cristian.ciocaltea@collabora.com>
 <20230316203417.GA3833267-robh@kernel.org> <20230316222619.r4jzk3lzdxzamr2s@bogus>
 <d5881d9f-90cc-f7a2-72a3-0701348a03fe@collabora.com>
In-Reply-To: <d5881d9f-90cc-f7a2-72a3-0701348a03fe@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 17 Mar 2023 09:27:44 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL_EogoKOQ1xwU75=rJSC4o7yV3Jej4vadtacX2Pt3-hw@mail.gmail.com>
Message-ID: <CAL_JsqL_EogoKOQ1xwU75=rJSC4o7yV3Jej4vadtacX2Pt3-hw@mail.gmail.com>
Subject: Re: [PATCH 01/11] dt-bindings: firmware: arm,scmi: Document
 assigned-clocks and assigned-clock-rates
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Stephen Boyd <sboyd@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Daniel Drake <drake@endlessm.com>, 
	Katsuhiro Suzuki <katsuhiro@katsuster.net>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, alsa-devel@alsa-project.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, 
	kernel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_072759_774056_BAC424DB 
X-CRM114-Status: GOOD (  19.25  )
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

T24gRnJpLCBNYXIgMTcsIDIwMjMgYXQgNDo1OeKAr0FNIENyaXN0aWFuIENpb2NhbHRlYQo8Y3Jp
c3RpYW4uY2lvY2FsdGVhQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+Cj4gT24gMy8xNy8yMyAwMDoy
NiwgU3VkZWVwIEhvbGxhIHdyb3RlOgo+ID4gT24gVGh1LCBNYXIgMTYsIDIwMjMgYXQgMDM6MzQ6
MTdQTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPj4gK1N0ZXBoZW4KPiA+Pgo+ID4+IE9u
IFdlZCwgTWFyIDE1LCAyMDIzIGF0IDAxOjQ3OjU2UE0gKzAyMDAsIENyaXN0aWFuIENpb2NhbHRl
YSB3cm90ZToKPiA+Pj4gU2luY2UgY29tbWl0IGRmNGZkZDBkYjQ3NSAoImR0LWJpbmRpbmdzOiBm
aXJtd2FyZTogYXJtLHNjbWk6IFJlc3RyaWN0Cj4gPj4+IHByb3RvY29sIGNoaWxkIG5vZGUgcHJv
cGVydGllcyIpIHRoZSBmb2xsb3dpbmcgZHRic19jaGVjayB3YXJuaW5nIGlzCj4gPj4+IHNob3du
Ogo+ID4+Pgo+ID4+PiAgICByazM1ODgtcm9jay01Yi5kdGI6IHNjbWk6IHByb3RvY29sQDE0OiBV
bmV2YWx1YXRlZCBwcm9wZXJ0aWVzIGFyZSBub3QgYWxsb3dlZCAoJ2Fzc2lnbmVkLWNsb2NrLXJh
dGVzJywgJ2Fzc2lnbmVkLWNsb2Nrcycgd2VyZSB1bmV4cGVjdGVkKQo+ID4+Cj4gPj4gSSB0aGlu
ayB0aGF0J3MgYSBzb21ld2hhdCBxdWVzdGlvbmFibGUgdXNlIG9mIGFzc2lnbmVkLWNsb2NrLXJh
dGVzLiBJdAo+ID4+IHNob3VsZCBiZSBsb2NhdGVkIHdpdGggdGhlIGNvbnN1bWVyIHJhdGhlciB0
aGFuIHRoZSBwcm92aWRlciBJTU8uIFRoZQo+ID4+IGNvbnN1bWVycyBvZiB0aG9zZSAyIGNsb2Nr
cyBhcmUgdGhlIENQVSBub2Rlcy4KPiA+Pgo+ID4KPiA+IEFncmVlZC4gV2UgZGVmaW5pdGVseSBk
b24ndCB1c2UgdGhvc2UgaW4gdGhlIHNjbWkgY2xrIHByb3ZpZGVyIGRyaXZlci4KPiA+IFNvIE5B
Q0sgZm9yIHRoZSBnZW5lcmljIFNDTUkgYmluZGluZyBjaGFuZ2UuCj4KPiBBY2NvcmRpbmcgdG8g
WzFdLCAiY29uZmlndXJhdGlvbiBvZiBjb21tb24gY2xvY2tzLCB3aGljaCBhZmZlY3QgbXVsdGlw
bGUKPiBjb25zdW1lciBkZXZpY2VzIGNhbiBiZSBzaW1pbGFybHkgc3BlY2lmaWVkIGluIHRoZSBj
bG9jayBwcm92aWRlciBub2RlIi4KClRydWUsIGJ1dCBpbiB0aGlzIGNhc2UgaXQncyByZWFsbHkg
YSBzaW5nbGUgY29uc3VtZXIgYmVjYXVzZSBpdCdzIGFsbApDUFUgbm9kZXMgd2hpY2ggYXJlIG1h
bmFnZWQgdG9nZXRoZXIuCgo+IFRoYXQgd291bGQgYXZvaWQgZHVwbGljYXRpbmcgYXNzaWduZWQt
Y2xvY2stcmF0ZXMgaW4gdGhlIENQVSBub2Rlcy4KCldvdWxkbid0IG9uZSBub2RlIGJlIHN1ZmZp
Y2llbnQ/CgpUaGlua2luZyBtb3JlIGFib3V0IHRoaXMsIHdoeSBhcmVuJ3QgeW91IHVzaW5nIE9Q
UCB0YWJsZXMgdG8gZGVmaW5lCkNQVSBmcmVxdWVuY2llcy4gQXNzaWduZWQtY2xvY2tzIGxvb2tz
IGxpa2UgYSB0ZW1wb3JhcnkgaGFjayBiZWNhdXNlCnlvdSBoYXZlbid0IGRvbmUgcHJvcGVyIE9Q
UCB0YWJsZXMuCgpSb2IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
