Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80245C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 20:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=imD9Lmc3MNy1H70kDUbVPIAhZyDSVcOMa5SkaDQdr2I=; b=fDJ1OoGEzChI0f
	BxBI6Y2CMIEfLQRopCOKAtcWlfHwGubfosjINHem9WgryBzReCH/yrH4WrN+9IJbfVvH5dnNxl4nq
	xVNBNoz8neGQ19UR6O0SP4pCg0I3ssxgApzmo5jgEPLVmfdKfINtkcrl9vxd/DjRqmVZ0AMa8RDhQ
	03fdRcglktJNHkfWch+Vo2vCZ9cjvy2YSg4VNZoJ2MzZcZd/4C8DtF5Y1q/V29Zof3e7lC9u4KUR9
	+XMD4cpmHko+bwZOR/QEOfPp1+hPKoUkHoCuQ6fq6DwALgtyQIe2XC13CLavTGvfhRJvdlFrqOyZn
	N+wOu4jGpwWkhiwrRfrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB0Gc-004jGc-Ee; Mon, 11 Jul 2022 20:44:30 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB0GZ-004jC4-EN
	for linux-riscv@lists.infradead.org; Mon, 11 Jul 2022 20:44:29 +0000
Received: by mail-wm1-x32e.google.com with SMTP id y22-20020a7bcd96000000b003a2e2725e89so3386993wmj.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 Jul 2022 13:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=NszzDZbzIBuzddjjLcc7vBaxX8gjDVh0ornBGpIQwwk=;
        b=ehl0wMadrdZh+hOsLTT0aerkVfKNk9R0W/YoHZTdNuhwlsa31MQQzwOuXyYXep0Sqi
         age01vgGJEUJop/eumchgnOeElE9sjKOMy+8yAuIDM/wX90sMlX28wcyqmwMByus47PI
         dz8YIBSPqUm6yaDplyZig0FuqVfU5GHqpnEAd9uJiMT04oh7Q5NCA5ywCh2I/h4u4XO9
         THnP8ZAEynmbw91bRdhq+d1yN58IpqJzbGDBhEfFjRSc3Gc+v35PLcH/LQoZKOdyuGdd
         rs7FbqsMWD5Wis64hii8iZ2Ll+JADsfHLnMeUyx7+lOttE/y+fyTGekaHwe6merdEF9s
         dZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NszzDZbzIBuzddjjLcc7vBaxX8gjDVh0ornBGpIQwwk=;
        b=zxEbw0ILPDhqnaPrcHMExTvXzNbNuTD0N7A2bwUHddtUyaAPFOShV5yqK77FS7JAPD
         wOSvbbMOQkOGVzcBSEzJu6g7YGmB3BBniUTgKRdXp4eXWJi1N+SqTgoHF/mshXv6HOow
         7LMJ6dsjTVVHkqHFda4njgT3ehvx4igWSes0RU45Wb1v5Azl3smyeFBu61Tm2+NBlq57
         6Wo+Txw1onTVN/yNeTWN9dp7vy+mMHrmW6b5YoimdQ2pw2xZVHiF0GGc6pqxD0FxBndw
         YRQ7YrkGek8SWicqjCtQzCs6Ut8dkTU0NUwjvXain6kEne9LuyEv1MgvRe+wLIDduonQ
         q11Q==
X-Gm-Message-State: AJIora+ZEliNuO8OwUHs8biX3fxBaPvcestLJzmY108nhqtRBlsYy1u5
	+JFoPZPIHN9EVJr30i/M9aSJOg==
X-Google-Smtp-Source: AGRyM1tzq1LrSO5VxsyCr4+uiBUAZz48qCILZwNlSzykzx/99rzNyEwJEl7IBWxVzVTx6rCcwpFNwQ==
X-Received: by 2002:a05:600c:28d:b0:3a2:d06d:3894 with SMTP id 13-20020a05600c028d00b003a2d06d3894mr189007wmk.51.1657572263586;
        Mon, 11 Jul 2022 13:44:23 -0700 (PDT)
Received: from [192.168.2.222] ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id b17-20020adff911000000b0021d819c8f6dsm6556110wrr.39.2022.07.11.13.44.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 13:44:23 -0700 (PDT)
Message-ID: <18a1126c-393e-9c52-4b30-caee01975ad1@conchuod.ie>
Date: Mon, 11 Jul 2022 21:44:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4] arch/riscv: add Zihintpause support
Content-Language: en-US
To: Dao Lu <daolu@rivosinc.com>, linux-kernel@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Niklas Cassel <niklas.cassel@wdc.com>,
 Qinglin Pan <panqinglin2020@iscas.ac.cn>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Rob Herring <robh@kernel.org>, Tsukasa OI <research_trasio@irq.a4lg.com>,
 Yury Norov <yury.norov@gmail.com>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
References: <20220620201530.3929352-1-daolu@rivosinc.com>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <20220620201530.3929352-1-daolu@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_134427_526053_496DE2AD 
X-CRM114-Status: GOOD (  26.31  )
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

T24gMjAvMDYvMjAyMiAyMToxNSwgRGFvIEx1IHdyb3RlOgo+IFtQQVRDSCB2NF0gYXJjaC9yaXNj
djogYWRkIFppaGludHBhdXNlIHN1cHBvcnQKCkEgbGl0dGxlIG9ybmVyeS9wZWRhbnRpYyBtYXli
ZSwgYnV0IHRoZSAiYXJjaC8iIGlzbid0IG5lZWRlZC4KR3Vlc3MgaXQgY2FuIGVhc2lseSBiZSBm
aXhlZCBvbiBhcHBsaWNhdGlvbiBvciBpZiB0aGVyZSdzIGEKdjUgc28gdGhlcmUncyBwcm9iIG5v
IG5lZWQgdG8gcmVzZW5kLgoKPiBJbXBsZW1lbnQgc3VwcG9ydCBmb3IgdGhlIFppSGludFBhdXNl
IGV4dGVuc2lvbi4KPiAKPiBUaGUgUEFVU0UgaW5zdHJ1Y3Rpb24gaXMgYSBISU5UIHRoYXQgaW5k
aWNhdGVzIHRoZSBjdXJyZW50IGhhcnTigJlzIHJhdGUKPiBvZiBpbnN0cnVjdGlvbiByZXRpcmVt
ZW50IHNob3VsZCBiZSB0ZW1wb3JhcmlseSByZWR1Y2VkIG9yIHBhdXNlZC4KPiAKPiBSZXZpZXdl
ZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPiBUZXN0ZWQtYnk6IEhlaWtv
IFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+Cj4gU2lnbmVkLW9mZi1ieTogRGFvIEx1IDxkYW9s
dUByaXZvc2luYy5jb20+Cj4gLS0tCj4gCj4gdjEgLT4gdjI6Cj4gIFJlbW92ZSB0aGUgdXNhZ2Ug
b2Ygc3RhdGljIGJyYW5jaCwgdXNlIFBBVVNFIGlmIHRvb2xjaGFpbiBzdXBwb3J0cyBpdAo+IHYy
IC0+IHYzOgo+ICBBZGRlZCB0aGUgc3RhdGljIGJyYW5jaCBiYWNrLCBjcHVfcmVsYXgoKSBiZWhh
dmlvciBpcyBrZXB0IHRoZSBzYW1lIGZvcgo+IHN5c3RlbXMgdGhhdCBkbyBub3Qgc3VwcG9ydCBa
aUhpbnRQYXVzZQo+IHYzIC0+IHY0Ogo+ICBBZG9wdGVkIHRoZSBuZXdseSBhZGRlZCB1bmlmaWVk
IHN0YXRpYyBrZXlzIGZvciBleHRlbnNpb25zCj4gLS0tCj4gIGFyY2gvcmlzY3YvTWFrZWZpbGUg
ICAgICAgICAgICAgICAgICAgICB8ICA0ICsrKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9o
d2NhcC5oICAgICAgICAgIHwgIDUgKysrKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNv
L3Byb2Nlc3Nvci5oIHwgMjEgKysrKysrKysrKysrKysrKysrLS0tCj4gIGFyY2gvcmlzY3Yva2Vy
bmVsL2NwdS5jICAgICAgICAgICAgICAgICB8ICAxICsKPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1
ZmVhdHVyZS5jICAgICAgICAgIHwgIDEgKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvTWFrZWZp
bGUgYi9hcmNoL3Jpc2N2L01ha2VmaWxlCj4gaW5kZXggMzRjZjhhNTk4NjE3Li42ZGRhY2M2ZjQ0
YjkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9NYWtlZmlsZQo+ICsrKyBiL2FyY2gvcmlzY3Yv
TWFrZWZpbGUKPiBAQCAtNTYsNiArNTYsMTAgQEAgcmlzY3YtbWFyY2gtJChDT05GSUdfUklTQ1Zf
SVNBX0MpCTo9ICQocmlzY3YtbWFyY2gteSljCj4gIHRvb2xjaGFpbi1uZWVkLXppY3NyLXppZmVu
Y2VpIDo9ICQoY2FsbCBjYy1vcHRpb24teW4sIC1tYXJjaD0kKHJpc2N2LW1hcmNoLXkpX3ppY3Ny
X3ppZmVuY2VpKQo+ICByaXNjdi1tYXJjaC0kKHRvb2xjaGFpbi1uZWVkLXppY3NyLXppZmVuY2Vp
KSA6PSAkKHJpc2N2LW1hcmNoLXkpX3ppY3NyX3ppZmVuY2VpCj4gIAo+ICsjIENoZWNrIGlmIHRo
ZSB0b29sY2hhaW4gc3VwcG9ydHMgWmloaW50cGF1c2UgZXh0ZW5zaW9uCj4gK3Rvb2xjaGFpbi1z
dXBwb3J0cy16aWhpbnRwYXVzZSA6PSAkKGNhbGwgY2Mtb3B0aW9uLXluLCAtbWFyY2g9JChyaXNj
di1tYXJjaC15KV96aWhpbnRwYXVzZSkKPiArcmlzY3YtbWFyY2gtJCh0b29sY2hhaW4tc3VwcG9y
dHMtemloaW50cGF1c2UpIDo9ICQocmlzY3YtbWFyY2gteSlfemloaW50cGF1c2UKPiArCj4gIEtC
VUlMRF9DRkxBR1MgKz0gLW1hcmNoPSQoc3Vic3QgZmQsLCQocmlzY3YtbWFyY2gteSkpCj4gIEtC
VUlMRF9BRkxBR1MgKz0gLW1hcmNoPSQocmlzY3YtbWFyY2gteSkKPiAgCj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
aHdjYXAuaAo+IGluZGV4IGU0OGVlYmRkMjYzMS4uZGM0NzAxOWEwYjM4IDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vaHdjYXAuaAo+IEBAIC04LDYgKzgsNyBAQAo+ICAjaWZuZGVmIF9BU01fUklTQ1ZfSFdD
QVBfSAo+ICAjZGVmaW5lIF9BU01fUklTQ1ZfSFdDQVBfSAo+ICAKPiArI2luY2x1ZGUgPGFzbS9l
cnJuby5oPgo+ICAjaW5jbHVkZSA8bGludXgvYml0cy5oPgo+ICAjaW5jbHVkZSA8dWFwaS9hc20v
aHdjYXAuaD4KPiAgCj4gQEAgLTU0LDYgKzU1LDcgQEAgZXh0ZXJuIHVuc2lnbmVkIGxvbmcgZWxm
X2h3Y2FwOwo+ICBlbnVtIHJpc2N2X2lzYV9leHRfaWQgewo+ICAJUklTQ1ZfSVNBX0VYVF9TU0NP
RlBNRiA9IFJJU0NWX0lTQV9FWFRfQkFTRSwKPiAgCVJJU0NWX0lTQV9FWFRfU1ZQQk1ULAo+ICsJ
UklTQ1ZfSVNBX0VYVF9aSUhJTlRQQVVTRSwKPiAgCVJJU0NWX0lTQV9FWFRfSURfTUFYID0gUklT
Q1ZfSVNBX0VYVF9NQVgsCj4gIH07Cj4gIAo+IEBAIC02NCw2ICs2Niw3IEBAIGVudW0gcmlzY3Zf
aXNhX2V4dF9pZCB7Cj4gICAqLwo+ICBlbnVtIHJpc2N2X2lzYV9leHRfa2V5IHsKPiAgCVJJU0NW
X0lTQV9FWFRfS0VZX0ZQVSwJCS8qIEZvciAnRicgYW5kICdEJyAqLwo+ICsJUklTQ1ZfSVNBX0VY
VF9LRVlfWklISU5UUEFVU0UsCj4gIAlSSVNDVl9JU0FfRVhUX0tFWV9NQVgsCj4gIH07Cj4gIAo+
IEBAIC04Myw2ICs4Niw4IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgaW50IHJpc2N2X2lzYV9l
eHQya2V5KGludCBudW0pCj4gIAkJcmV0dXJuIFJJU0NWX0lTQV9FWFRfS0VZX0ZQVTsKPiAgCWNh
c2UgUklTQ1ZfSVNBX0VYVF9kOgo+ICAJCXJldHVybiBSSVNDVl9JU0FfRVhUX0tFWV9GUFU7Cj4g
KwljYXNlIFJJU0NWX0lTQV9FWFRfWklISU5UUEFVU0U6Cj4gKwkJcmV0dXJuIFJJU0NWX0lTQV9F
WFRfS0VZX1pJSElOVFBBVVNFOwo+ICAJZGVmYXVsdDoKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAg
CX0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvL3Byb2Nlc3Nvci5o
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvL3Byb2Nlc3Nvci5oCj4gaW5kZXggMTM0Mzg4
Y2JhYWExLi4xZTRmOGI0YWVmNzkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS92ZHNvL3Byb2Nlc3Nvci5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvL3By
b2Nlc3Nvci5oCj4gQEAgLTQsMTUgKzQsMzAgQEAKPiAgCj4gICNpZm5kZWYgX19BU1NFTUJMWV9f
Cj4gIAo+ICsjaW5jbHVkZSA8bGludXgvanVtcF9sYWJlbC5oPgo+ICAjaW5jbHVkZSA8YXNtL2Jh
cnJpZXIuaD4KPiArI2luY2x1ZGUgPGFzbS9od2NhcC5oPgo+ICAKPiAgc3RhdGljIGlubGluZSB2
b2lkIGNwdV9yZWxheCh2b2lkKQo+ICB7Cj4gKwlpZiAoIXN0YXRpY19icmFuY2hfbGlrZWx5KCZy
aXNjdl9pc2FfZXh0X2tleXNbUklTQ1ZfSVNBX0VYVF9LRVlfWklISU5UUEFVU0VdKSkgewo+ICAj
aWZkZWYgX19yaXNjdl9tdWxkaXYKPiAtCWludCBkdW1teTsKPiAtCS8qIEluIGxpZXUgb2YgYSBo
YWx0IGluc3RydWN0aW9uLCBpbmR1Y2UgYSBsb25nLWxhdGVuY3kgc3RhbGwuICovCj4gLQlfX2Fz
bV9fIF9fdm9sYXRpbGVfXyAoImRpdiAlMCwgJTAsIHplcm8iIDogIj1yIiAoZHVtbXkpKTsKPiAr
CQlpbnQgZHVtbXk7Cj4gKwkJLyogSW4gbGlldSBvZiBhIGhhbHQgaW5zdHJ1Y3Rpb24sIGluZHVj
ZSBhIGxvbmctbGF0ZW5jeSBzdGFsbC4gKi8KPiArCQlfX2FzbV9fIF9fdm9sYXRpbGVfXyAoImRp
diAlMCwgJTAsIHplcm8iIDogIj1yIiAoZHVtbXkpKTsKPiAgI2VuZGlmCj4gKwl9IGVsc2Ugewo+
ICsJCS8qCj4gKwkJICogUmVkdWNlIGluc3RydWN0aW9uIHJldGlyZW1lbnQuCj4gKwkJICogVGhp
cyBhc3N1bWVzIHRoZSBQQyBjaGFuZ2VzLgo+ICsJCSAqLwo+ICsjaWZkZWYgX19yaXNjdl96aWhp
bnRwYXVzZQo+ICsJCV9fYXNtX18gX192b2xhdGlsZV9fICgicGF1c2UiKTsKPiArI2Vsc2UKPiAr
CQkvKiBFbmNvZGluZyBvZiB0aGUgcGF1c2UgaW5zdHJ1Y3Rpb24gKi8KPiArCQlfX2FzbV9fIF9f
dm9sYXRpbGVfXyAoIi40Ynl0ZSAweDEwMDAwMEYiKTsKPiArI2VuZGlmCj4gKwl9Cj4gIAliYXJy
aWVyKCk7Cj4gIH0KPiAgCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdS5jIGIv
YXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMKPiBpbmRleCBmYmE5ZTlmNDZhOGMuLmExMjNlOTJiMTRk
ZCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYwo+ICsrKyBiL2FyY2gvcmlz
Y3Yva2VybmVsL2NwdS5jCj4gQEAgLTg5LDYgKzg5LDcgQEAgaW50IHJpc2N2X29mX3BhcmVudF9o
YXJ0aWQoc3RydWN0IGRldmljZV9ub2RlICpub2RlKQo+ICBzdGF0aWMgc3RydWN0IHJpc2N2X2lz
YV9leHRfZGF0YSBpc2FfZXh0X2FycltdID0gewo+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoc3Nj
b2ZwbWYsIFJJU0NWX0lTQV9FWFRfU1NDT0ZQTUYpLAo+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEo
c3ZwYm10LCBSSVNDVl9JU0FfRVhUX1NWUEJNVCksCj4gKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6
aWhpbnRwYXVzZSwgUklTQ1ZfSVNBX0VYVF9aSUhJTlRQQVVTRSksCj4gIAlfX1JJU0NWX0lTQV9F
WFRfREFUQSgiIiwgUklTQ1ZfSVNBX0VYVF9NQVgpLAo+ICB9Owo+ICAKPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVh
dHVyZS5jCj4gaW5kZXggMWIzZWM0NGUyNWY1Li43MDhkZjJjMGJjMzQgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwv
Y3B1ZmVhdHVyZS5jCj4gQEAgLTE5OCw2ICsxOTgsNyBAQCB2b2lkIF9faW5pdCByaXNjdl9maWxs
X2h3Y2FwKHZvaWQpCj4gIAkJCX0gZWxzZSB7Cj4gIAkJCQlTRVRfSVNBX0VYVF9NQVAoInNzY29m
cG1mIiwgUklTQ1ZfSVNBX0VYVF9TU0NPRlBNRik7Cj4gIAkJCQlTRVRfSVNBX0VYVF9NQVAoInN2
cGJtdCIsIFJJU0NWX0lTQV9FWFRfU1ZQQk1UKTsKPiArCQkJCVNFVF9JU0FfRVhUX01BUCgiemlo
aW50cGF1c2UiLCBSSVNDVl9JU0FfRVhUX1pJSElOVFBBVVNFKTsKPiAgCQkJfQo+ICAjdW5kZWYg
U0VUX0lTQV9FWFRfTUFQCj4gIAkJfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
