Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C12FE67A92
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 08:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zbpZRy/pgug3YkfPaqikdJyy+n5byWxPgSGyeFo9z/c=; b=DmG96ZJk+qZeq5
	WTQJh0jfqXW3swF8Ln/uqrTPqRryo/UdyO9KrM1y8iccKR7ycNnUMjuqIDvXelXf1S7s0AtqfOe0B
	2ZzHMAQZoJfylHPt60SaxGzspHM68qNzBSBSxm5toYSORM0hGaaXN+09pVOdrA3PI2gd75chK88uV
	rv2njjf8a3jYwVlGMxVWK7vFAweBjoYSTKoaDFHlwdtmsfx6aW104jTcC/v3KPBbguigNBmkqeSvF
	FfocMc5U+s34NmX00cVxAZVaqUwbsRHBvMtrZPqpftkANEx4a+WJvMLeRr3kzyUn4GjHoqF4UUGMC
	uTlELORIRUthO1w05WUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKn5-0000000El2A-0hsG;
	Tue, 03 Mar 2026 08:07:39 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKn1-0000000El0w-1Sjb
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 08:07:37 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-413c2977db8so403929fac.3
        for <linux-riscv@lists.infradead.org>; Tue, 03 Mar 2026 00:07:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772525254; cv=none;
        d=google.com; s=arc-20240605;
        b=cYERmExFAlKJSPRMs7d178xKpJaOz/Lj9SEsi9mYCucn/5NGeNkPxFNx+FK/4Le5ot
         m+4ZbI//iJ4g+hqnu2fhDERnEKXzkV/dunIaax3gVyVaxompP1PMFxcBCk073BpK7N9e
         37/YF+o/SOp1ChiyobDs9HTAnXD97xruD5+vV4tFcXgmnFRH8ej4Ehl9lTV9JRi/4HSX
         4H8dy1aTYQJj5Zx/Cn2VT2AX6ydLtWHMTMbTPRmh+f4kAcQdGX4a8X2w+CqkmKswXqLQ
         sB44+z5W1t9MPg44hJQwgCcoVLnomfCnzmqQaHLuVY7V6QgrXWRIWf3IKV7u9ANIxBLL
         +CHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GuqFHghzfd5h3VXh4yNDT2Yb5ts6QshO2bl6Hh7Yh40=;
        fh=rEXOSQehnsTYeV+8xekiTGytDqmoWQGZoJE6AIz4fb4=;
        b=GQfSNeJZw6z6WnnK3qKlAEiqRBpnh876rU4rZ5oHNERbTw0dTJemK94s4qDHD9v8ch
         zkbVEc7UxSm97qqfRmGot2ql3urRtIS4KzBn4h/QjNn0UDnezh2eiOzPVk4Ukp9fugAD
         qCjsqY+wKaxcHhJiLqvVqoRDqc+uJ95ZK3XmotSmpuoimkdiaSU2d2BFXhOb8djZTetX
         MU4yCXQWPXjRLG1pbiBE/Tfn+cg3njVUIw3NxI6UHkG4n2q3hTde8tM0ndLU03oNf/x1
         wWr+Uo7CyFxxJZOwa5vhE35SWaCgeFHVhFRYeS51LtgFkwcMmpfgumDLGs9McttQLRWk
         5Ytg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772525254; x=1773130054; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuqFHghzfd5h3VXh4yNDT2Yb5ts6QshO2bl6Hh7Yh40=;
        b=ngutDaOfHiWt+63wnyzD1hkCnvsooyws5YvgVEWXLuqRul4GOqRUO3DeEdcnn4EdeD
         W6bjqtHH4INWbPeA2hztcM7cnD154/+W84bwEQDFQ5kEckz3+jhbC/xqXV+0XA3xH77u
         zRgTyD70NB9DGGRNipLKb2mUD0Pev8zRsdJyf6TAmuarbKvTqGLylyMXAxnxp4d3Z9Pg
         PZVzuLsejjjsKOE6ObntOzvNc3fq6amStGdMhBDr3DTN1sz9PdadFwPKK988lPIoDf+k
         MpcbK32Pv03KZ6tBkr1DK0DVKRdMhIdumU3ktp2C0g2egmcV4bd1kbggnl4cgWTDeoYA
         sk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772525254; x=1773130054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GuqFHghzfd5h3VXh4yNDT2Yb5ts6QshO2bl6Hh7Yh40=;
        b=taKcsnwZRFfpN3nGVDcKSP2MgJmWxWzOuGgby+X6c88KWq5TDDmJwxHmvNEVEdhmQd
         mkAZZE1+aNYfRjDxj6L2pq2rr5K0ODAYXH2u/JzMp49qPvpVi8f/CCygh1RTRRALUb7G
         6jAOFvTsFA6Mp2GpknyrKfMNq8HvjEcj0n5MV3ggXUa30q+hX7pOXahrCHhGBsYO3PCC
         EHuu1V13Llnrxe4v5SDC3yDjgiwLUqboCmL41gjbXqrkrCAaXN93B/3F6AMxLSV0H82s
         tRKjJWG2tOa3OkswmC88wo0QV+CZVeuLEOR8AZfMOdMuJZLcT2F8CfA1UTQs0OHuQuEC
         ChEg==
X-Forwarded-Encrypted: i=1; AJvYcCVtuWAyVEqZ0KUIxmQtAYqAmeHX2synlhr2ex61CnRooAfKzDiZzUUlm/28Yd5cE77n+tXdwqZ81z61JQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZYdg2KLTBbbH7U29FVj54elMOIfkNLsxfJBQYuHzb+L37ahLS
	E0vxvMc81sEH19p5UR1b/r2I2xYCY9iOP+SGbHyIgGFR+uX8XtPVQ8k1Pf3umpue9ri4nxL84bV
	D9hDv4iYbM4aD/EqonS/8sKM4UPxMPfjbEPPvMaZ94w==
X-Gm-Gg: ATEYQzx0bFC/bOE5svoVQwrMWEzaaqK7jF+kZw9q6LUFY+SxhmiUvwqBDvnUl5yL0Gn
	JJ9Xr9HvwLjoY4MgJWUWKPxM+tP58PyUGdIiJBM7TBe6doO7Ts5jUnq/WAcegLpp13cmElBaxyF
	m9hedYYMpVWiITSQiJdWe7eXe9S3OLNo4PvBsWXXT+mZynfMcgVhMXN3L12cWvyZmvD3WOG1uQL
	+lKMi54Kp5Fd8017FWn01x3p7Vcwdp7xUv7LyBmhRRVMzovsPentneqgSOpZqlKPrESF8+wHYfs
	V5kv/YPyl3pXgGfPxmHPsUotj5y0jgy3r80Ginxjt1WKrTDMVYJwmTE9VTJBgpNxKU2y6Hcd8xa
	nIpPPC77YozboYIcQay2zQd65/g==
X-Received: by 2002:a05:6820:201c:b0:662:f74d:69f5 with SMTP id
 006d021491bc7-679fae7d3dfmr8743971eaf.31.1772525253820; Tue, 03 Mar 2026
 00:07:33 -0800 (PST)
MIME-Version: 1.0
References: <20260226172245358qVZavIykLL2QC0KoqTO-I@zte.com.cn>
In-Reply-To: <20260226172245358qVZavIykLL2QC0KoqTO-I@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 3 Mar 2026 13:37:22 +0530
X-Gm-Features: AaiRm51tbzRHHGrkI3BQgXsKymJuy3CHgi-XuP_FlIJWr5ikP6Oe5JI6W0vZKCk
Message-ID: <CAAhSdy2uJxYX6r1K=EWEqqYoZ1BjJDqkYC+Byv_3Wy65xDyCaw@mail.gmail.com>
Subject: Re: RISC-V: KVM: Fix hugepage mapping handling during dirty logging
To: wang.yechao255@zte.com.cn
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_000735_552740_B3801452 
X-CRM114-Status: GOOD (  16.19  )
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

T24gVGh1LCBGZWIgMjYsIDIwMjYgYXQgMjo1MuKAr1BNIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPiB3cm90ZToKPgo+IEZyb206IFdhbmcgWWVjaGFvIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPgo+Cj4gV2hlbiBkaXJ0eSBsb2dnaW5nIGlzIGVuYWJsZWQsIHRoZSBnc3RhZ2UgcGFnZSB0
YWJsZXMgbXVzdCBiZSBtYXBwZWQKPiBhdCBQQUdFX1NJWkUgZ3JhbnVsYXJpdHkgdG8gdHJhY2sg
ZGlydHkgcGFnZXMgYWNjdXJhdGVseS4gQ3VycmVudGx5LAo+IGlmIGEgaHVnZSBQVEUgaXMgZW5j
b3VudGVyZWQgZHVyaW5nIHRoZSB3cml0ZS1wcm90ZWN0IGZhdWx0LCB0aGUgY29kZQo+IHJldHVy
bnMgLUVFWElTVCwgd2hpY2ggYnJlYWtzIFZNIG1pZ3JhdGlvbi4KPgo+IEluc3RlYWQgb2YgcmV0
dXJuaW5nIGFuIGVycm9yLCBkcm9wIHRoZSBodWdlIFBURSBhbmQgbWFwIG9ubHkgdGhlIHBhZ2UK
PiB0aGF0IGlzIGN1cnJlbnRseSBiZWluZyBhY2Nlc3NlZC4gVGhpcyBvbuKAkWRlbWFuZCBhcHBy
b2FjaCBhdm9pZHMgdGhlCj4gb3ZlcmhlYWQgb2Ygc3BsaXR0aW5nIHRoZSBlbnRpcmUgaHVnZSBw
YWdlIGludG8gc21hbGwgcGFnZXMgdXBmcm9udC4KPgo+IFNpZ25lZC1vZmYtYnk6IFdhbmcgWWVj
aGFvIDx3YW5nLnllY2hhbzI1NUB6dGUuY29tLmNuPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9n
c3RhZ2UuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMgYi9hcmNoL3Jp
c2N2L2t2bS9nc3RhZ2UuYwo+IGluZGV4IGI2N2Q2MGQ3MjJjMi4uMTZjOGFmZGFmYmZiIDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0v
Z3N0YWdlLmMKPiBAQCAtMTM0LDcgKzEzNCw3IEBAIGludCBrdm1fcmlzY3ZfZ3N0YWdlX3NldF9w
dGUoc3RydWN0IGt2bV9nc3RhZ2UgKmdzdGFnZSwKPgo+ICAgICAgICAgd2hpbGUgKGN1cnJlbnRf
bGV2ZWwgIT0gbWFwLT5sZXZlbCkgewo+ICAgICAgICAgICAgICAgICBpZiAoZ3N0YWdlX3B0ZV9s
ZWFmKHB0ZXApKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUVYSVNUOwo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHNldF9wdGUocHRlcCwgX19wdGUoMCkpOwoKTWFraW5nIGEg
bGVhZiBQVEUgaW52YWxpZCBtdXQgYmUgZm9sbG93ZWQgYnkgVExCIGludmFsaWRhdGlvbgp1c2lu
ZyBnc3RhZ2VfdGxiX2ZsdXNoKCkuCgpJIHRoaW5rIHJldHVybmluZyAtRUVYSVNUIGlzIHRoZSBy
aWdodCB0aGluZyB0byBkbyBoZXJlIGJlY2F1c2UKY2FsbGVyIGhhcyB0byBzcGxpdCBhIGh1Z2Ug
UFRFIHdpdGggcHJvcGVyIFRMQiBpbnZhbGlkYXRpb24uCgpSZWdhcmRzLApBbnVwCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
