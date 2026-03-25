Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59ECE1075269
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 01:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cZPQgETMTNij/YTBYYW6/gO+4qz/NDo76NALXgyr5oE=; b=jj69UmBf2+JNgz
	/Tx9ObSvXx6XKGOgbBbOhYMmwjyhtnas4G3kN/tJ9ZqYGHonZf3fXZd4ZRkKCS7AXzRz0qYjKWTnd
	GULrUuTbFM+ulll5OVb4jWqB8cVovIkutaIOdwcCHct18aWYv42UhS71/sH+8RTuFe0cJ7AsQTXSo
	56TOg/bvAt3DoI95KlScyrJ3W268FYcbpNzyq1/JTkHmSgpiEMsOQxi5s1AL0SRpE5J+MpSwIZir6
	6RKooPcxNEAkZutIVejK43zjO4mcSZH0j2HoEdM/UgS41dfg0ipH5euVJi+cWLh49KNg2Gkm1MHaP
	tk0ZLfVPaPowiU8Vs/wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5DMb-00000002Svz-2ehU;
	Wed, 25 Mar 2026 01:48:53 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5DMX-00000002Svb-3kXT
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 01:48:51 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7d9bba96f7dso1551594a34.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Mar 2026 18:48:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774403328; cv=none;
        d=google.com; s=arc-20240605;
        b=GpKHw8QTGvOW/zt+dG9fqmEZdIQB3Ki694HgWiJ5jyV1IOMQS/8is19yt+EtyAv+Kr
         Dlrjg9T5Zn40PXLyhE+xngdNP8DjLOJ1FXi8QiulfJXHgTWwy8fKy0dGU5F1GysE3DUX
         qs6X/onRGEtaHbHYeDBoKf/TpAH7oSwL8oSndfqtlnnTWtqamUQb/7QjKvJ4j2rl10Oh
         jvpZZXUQRQrMcHeAhRFTaS5w4crMthWZPgM+j6R3HqjV9rkVMNt4+jWWf4gpIZ8vf2r5
         fo/RyUZGcQ+ZENT6dSyqaQ9vS1LMyxdN424W2jiPDQCVHmOmU19r+Lqjmu4VSWJ02izJ
         qUCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vGfOtY7DNTv8x0CTjSLzY868SkapZdn6D7qzRjb9QRw=;
        fh=rZsCyxupJ0tIGs2eFW9rDYYibZ6ML2qVLKzRfEX/rhk=;
        b=kxH8cQHbS7KPEcm32uXwvvDj8XQ9k/ZfCBdiR6wL4jMk5phiB0LfUzvBhl+tZgf788
         zSmoIidWYfKgT1EAHmRmOV7hs52GpjAo/cDIaPx4uAeFQazmJfKCba/dW9Xfs/UF0ARH
         XS9CwvrM3AXbStohe7xwpjNQ0BrKZ2hpQ9BrT4j8K+RUCEZgZfoi4TTn2p0J4xrScP+Z
         MC5YWfgsdckKtI6roI2g3SC5FU2PPcil7L24cBzdjxwKHfw1AS1Mh0iIFqRnPWZGSLS9
         YH47pAS9TPY0+EQknMZJm8K+4drWsq6X+dama1JlGQTpdJtq9RuD0dmO1ofWhmB1Ec39
         ojLg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1774403328; x=1775008128; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGfOtY7DNTv8x0CTjSLzY868SkapZdn6D7qzRjb9QRw=;
        b=i8y8cIUVEARGmXCV3VsnlHZoQ7q++oF3k0PCdr16PfMa2/hsUe3r7gC0KQS19dE4Uy
         N39KdT+kpbfWc2fiEtsAWfNfHfAxNFYV2gYUkQdXZQjWY5agvjCPCjkFZN8U8YOtpGiX
         YJEdjtp/unE8AStI2PmeOLnYUHbWR2J0pP0jpqRYQrkKphdS6jHZbRbAYMkGN+3qhNWt
         2kmYmTa38Yoa5FEI4nZpw1TOT5U2mIIUEZxpKXugyfwxD9raHzz+Vj1rCJPLYIzPrTUG
         qulXhkEk0lvpiXfvdSi2SEcR41DUTAOHhHl+0BPZtEHvpLSIirpsDGxbR2KS0W953XYP
         +h6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774403328; x=1775008128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vGfOtY7DNTv8x0CTjSLzY868SkapZdn6D7qzRjb9QRw=;
        b=fwLFbKZNKaQnLJ9VzS7v5dcirV3XcQyze03tlBOg+QyLfE+17pkvmVtbajGFO097Qd
         CBV2tOdzOyD+GSSr3cWns1KT5O+/+FAzsypXnHur/wilJk+CG5m98pNBOoiDcuOGh7Zg
         qrmogUfApwY2xwzYNq2LLThEiH8iAeayv9XmZ8MfIYH0EZUNdNfIlSieobsYNmtD3aF6
         hHg6xNEgsz/ERR+gv4vI2LsMt5A77bmvuNZG7M70Kg/YXEiLnTSUYF+XHmiCy11DXvUH
         aP8yiTsPsL0tU35KfFHEWp/bsQu6dWRnzn+XnANOdYJrbt7awi5xFGVuhldz4BuUJ94S
         YI4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXSTptrzKIRHvpU44EKrsAELvEV0pekwd4TY3iM1IB8zCxYwgdVZ8ANElSlpQd4aoXx0VgrnG6eddhoDw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6IQvkyOo03VpSL1S8D6f+YOpcxvpBNG7pFI54iaHfaBOmsBuK
	gIcnUgrYSYkUWnbyIFtREH7La3uk21avdflDgvw1qb5TpPbsO7vSjnZN/NJNNuXmOAhtWpmFhKE
	EZ8XqY8JGEFWvTZvyT+2NHSnUz4PAohdyyP5ozJRIVw==
X-Gm-Gg: ATEYQzyS5uGmJwx4R+EGHJyBG7KKbF6Cndnmd+JWXIvbVCu5YpTA2fUOL8I5F1jbtxp
	lxGxje9AOJYFsBkzzylzMsXMlfEldWAgmqN0VsAiJg8CQomFhbLyxrLWP8mrIzyspd5PaNERac9
	TOpUQgRfXquR2ttSgtFqyW3akx62+bb18kd8NQbZEsSEYASW11FS5yU0uUbKdaRyyhQgeCE8gv5
	CWpAGb+NnooQH2iWYs70VTA9SIpS3XNoDwNMz1RIZnGsrNzh1aVritDLwBjsnc+KCXgJfjEKipA
	EZ9pWw/gV3CH6Q==
X-Received: by 2002:a05:6830:44a4:b0:7d7:cb13:3fe9 with SMTP id
 46e09a7af769-7d9d66ebce6mr746710a34.19.1774403328448; Tue, 24 Mar 2026
 18:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org> <20260128-ssqosid-cbqri-v2-14-dca586b091b9@kernel.org>
In-Reply-To: <20260128-ssqosid-cbqri-v2-14-dca586b091b9@kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 25 Mar 2026 09:48:37 +0800
X-Gm-Features: AaiRm50a2XpCtEI0EunEN7ujOM94GRAQRhXw7yAPEIMaeAZSdyGXWlKvSXA68yk
Message-ID: <CAEEQ3wnhvV03FYfqBqz8ihyFCcxKS5ztdvCHDF789ubSQAMw1A@mail.gmail.com>
Subject: Re: [External] [PATCH RFC v2 14/17] include: acpi: actbl2: Add
 structs for RQSC table
To: Drew Fustini <fustini@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_184850_065879_D2AC3C8F 
X-CRM114-Status: GOOD (  17.55  )
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
Cc: Atish Patra <atish.patra@linux.dev>, Adrien Ricciardi <aricciardi@baylibre.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor+dt@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, devicetree@vger.kernel.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, guo.wenjia23@zte.com.cn, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Peter Newman <peternewman@google.com>, x86@kernel.org, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, liu.qingtao2@zte.com.cn, linux-acpi@vger.kernel.org, Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, Dave Martin <Dave.Martin@arm.com>, Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>, Chen Pei <cp0613@linux.alibaba.com>, Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, Babu Moger <babu.moger@amd.com>, Weiwei Li <liwei1518@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ved Shanbhogue <ved@rivosinc.com>, Reinette Chatre <reinette.chatre@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, Tony Luck <tony.luck@intel.com>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgRHJldywKCk9uIFRodSwgSmFuIDI5LCAyMDI2IGF0IDQ6MjjigK9BTSBEcmV3IEZ1c3Rpbmkg
PGZ1c3RpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBBZGQgc3RydWN0cyBmb3IgdGhlIFJRU0Mg
dGFibGUgd2hpY2ggZGVzY3JpYmVzIHRoZSBwcm9wZXJ0aWVzIG9mIHRoZQo+IFJJU0MtViBRb1Mg
Y29udHJvbGxlcnMgKENCUVJJKSBpbiB0aGUgc3lzdGVtLiBUaGUgdGFibGUgYWxzbyBkZXNjcmli
ZXMKPiB0aGUgdG9wb2xvZ2ljYWwgYXJyYW5nZW1lbnQgb2YgdGhlIFFvUyBjb250cm9sbGVycyBh
bmQgcmVzb3VyY2VzIGluIHRoZQo+IHN5c3RlbS4gVGhlIHRvcG9sb2d5IGlzIGV4cHJlc3NlZCBp
biB0ZXJtcyBvZiB0aGUgbG9jYXRpb24gb2YgdGhlCj4gcmVzb3VyY2VzIHdpdGhpbiB0aGUgc3lz
dGVtIGFuZCB0aGUgcmVsYXRpb24gYmV0d2VlbiB0aGUgUW9TIENvbnRyb2xsZXIKPiBhbmQgdGhl
IHJlc291cmNlIGl0IG1hbmFnZXMuCj4KPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Yt
bm9uLWlzYS9yaXNjdi1jYnFyaS9yZWxlYXNlcy90YWcvdjEuMAo+IExpbms6IGh0dHBzOi8vZ2l0
aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LXJxc2MvYmxvYi9tYWluL3NyYy9jaGFwdGVyMi5h
ZG9jCj4gU2lnbmVkLW9mZi1ieTogRHJldyBGdXN0aW5pIDxmdXN0aW5pQGtlcm5lbC5vcmc+Cj4g
LS0tCj4gIGluY2x1ZGUvYWNwaS9hY3RibDIuaCB8IDkyICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOTIgaW5zZXJ0
aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvYWNwaS9hY3RibDIuaCBiL2luY2x1ZGUv
YWNwaS9hY3RibDIuaAo+IGluZGV4IGY3MjZiY2UzZWI4NC4uNzM2Nzk5MDM0OWVlIDEwMDY0NAo+
IC0tLSBhL2luY2x1ZGUvYWNwaS9hY3RibDIuaAo+ICsrKyBiL2luY2x1ZGUvYWNwaS9hY3RibDIu
aAo+IEBAIC01Myw2ICs1Myw3IEBACj4gICNkZWZpbmUgQUNQSV9TSUdfUkdSVCAgICAgICAgICAg
IlJHUlQiIC8qIFJlZ3VsYXRvcnkgR3JhcGhpY3MgUmVzb3VyY2UgVGFibGUgKi8KPiAgI2RlZmlu
ZSBBQ1BJX1NJR19SSENUICAgICAgICAgICAiUkhDVCIgLyogUklTQy1WIEhhcnQgQ2FwYWJpbGl0
aWVzIFRhYmxlICovCj4gICNkZWZpbmUgQUNQSV9TSUdfUklNVCAgICAgICAgICAgIlJJTVQiIC8q
IFJJU0MtViBJTyBNYXBwaW5nIFRhYmxlICovCj4gKyNkZWZpbmUgQUNQSV9TSUdfUlFTQyAgICAg
ICAgICAgIlJRU0MiIC8qIFJJU0MtViBSSVNDLVYgUXVhbGl0eSBvZiBTZXJ2aWNlIENvbnRyb2xs
ZXIgKi8KPiAgI2RlZmluZSBBQ1BJX1NJR19TQlNUICAgICAgICAgICAiU0JTVCIgLyogU21hcnQg
QmF0dGVyeSBTcGVjaWZpY2F0aW9uIFRhYmxlICovCj4gICNkZWZpbmUgQUNQSV9TSUdfU0RFSSAg
ICAgICAgICAgIlNERUkiIC8qIFNvZnR3YXJlIERlbGVnYXRlZCBFeGNlcHRpb24gSW50ZXJmYWNl
IFRhYmxlICovCj4gICNkZWZpbmUgQUNQSV9TSUdfU0RFViAgICAgICAgICAgIlNERVYiIC8qIFNl
Y3VyZSBEZXZpY2VzIHRhYmxlICovCj4gQEAgLTMxNjUsNiArMzE2Niw5NyBAQCBlbnVtIGFjcGlf
cmdydF9pbWFnZV90eXBlIHsKPiAgICAgICAgIEFDUElfUkdSVF9UWVBFX1JFU0VSVkVEID0gMiAg
ICAgLyogMiBhbmQgZ3JlYXRlciBhcmUgcmVzZXJ2ZWQgKi8KPiAgfTsKPgo+ICsvKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKgo+ICsgKgo+ICsgKiBSUVNDIC0gUklTQy1WIFF1YWxpdHkgb2YgU2Vydmlj
ZSBDb250cm9sbGVyCj4gKyAqICAgICAgICBWZXJzaW9uIDEKPiArICoKPiArICoqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKi8KPiArCj4gK3N0cnVjdCBhY3BpX3RhYmxlX3Jxc2NfZmllbGRzX3JlcyB7Cj4g
KyAgICAgICB1OCB0eXBlOyAgICAgICAgLy8gMQo+ICsgICAgICAgdTggcmVzdjsgICAgICAgIC8v
IDEKPiArICAgICAgIHUxNiBsZW5ndGg7ICAgICAvLyAyCj4gKyAgICAgICB1MTYgZmxhZ3M7ICAg
ICAgLy8gMgo+ICsgICAgICAgdTggcmVzdjI7ICAgICAgIC8vIDEKPiArICAgICAgIHU4IGlkX3R5
cGU7ICAgICAvLyAxCj4gKyAgICAgICB1NjQgaWQxOyAgICAgICAgLy8gOAo+ICsgICAgICAgdTMy
IGlkMjsgICAgICAgIC8vIDQKPiArfTsKPiArCj4gK3N0cnVjdCBhY3BpX3RhYmxlX3Jxc2NfZmll
bGRzIHsKPiArICAgICAgIHU4IHR5cGU7ICAgICAgICAvLyAgMQo+ICsgICAgICAgdTggcmVzdjsg
ICAgICAgIC8vICAxCj4gKyAgICAgICB1MTYgbGVuZ3RoOyAgICAgLy8gIDIKPiArICAgICAgIHUz
MiByZWdbM107ICAgICAvLyAxMgo+ICsgICAgICAgdTMyIHJjaWQ7ICAgICAgIC8vICA0Cj4gKyAg
ICAgICB1MzIgbWNpZDsgICAgICAgLy8gIDQKClRoZSBzcGVjIGFwcGVhcnMgdG8gc3BlY2lmeSBh
IGxlbmd0aCBvZiAyIGJ5dGVzIGZvciB0aGlzIGZpZWxkPwoKCj4gKyAgICAgICB1MTYgZmxhZ3M7
ICAgICAgLy8gIDIKPiArICAgICAgIHUxNiBucmVzOyAgICAgICAvLyAgMgo+ICsgICAgICAgc3Ry
dWN0IGFjcGlfdGFibGVfcnFzY19maWVsZHNfcmVzIHJlczsgLy8gMjAKPiArfTsKPiArCj4gK3N0
cnVjdCBhY3BpX3RhYmxlX3Jxc2Mgewo+ICsgICAgICAgc3RydWN0IGFjcGlfdGFibGVfaGVhZGVy
IGhlYWRlcjsgICAgICAgIC8qIENvbW1vbiBBQ1BJIHRhYmxlIGhlYWRlciAqLwo+ICsgICAgICAg
dTMyIG51bTsKPiArICAgICAgIHN0cnVjdCBhY3BpX3RhYmxlX3Jxc2NfZmllbGRzIGZbNl07Cj4g
K307Cj4gKwo+ICsvKiBSUVNDIEZsYWdzICovCj4gKyNkZWZpbmUgQUNQSV9SUVNDX1RJTUVSX0NB
Tk5PVF9XQUtFVVBfQ1BVICAgICAgICgxKQo+ICsKPiArLyoKPiArICogUlFTQyBzdWJ0YWJsZXMK
PiArICovCj4gK3N0cnVjdCBhY3BpX3Jxc2Nfbm9kZV9oZWFkZXIgewo+ICsgICAgICAgdTE2IHR5
cGU7Cj4gKyAgICAgICB1MTYgbGVuZ3RoOwo+ICsgICAgICAgdTE2IHJldmlzaW9uOwo+ICt9Owo+
ICsKPiArLyogVmFsdWVzIGZvciBSUVNDIHN1YnRhYmxlIFR5cGUgYWJvdmUgKi8KPiArZW51bSBh
Y3BpX3Jxc2Nfbm9kZV90eXBlIHsKPiArICAgICAgIEFDUElfUlFTQ19OT0RFX1RZUEVfSVNBX1NU
UklORyA9IDB4MDAwMCwKPiArICAgICAgIEFDUElfUlFTQ19OT0RFX1RZUEVfQ01PID0gMHgwMDAx
LAo+ICsgICAgICAgQUNQSV9SUVNDX05PREVfVFlQRV9NTVUgPSAweDAwMDIsCj4gKyAgICAgICBB
Q1BJX1JRU0NfTk9ERV9UWVBFX1JFU0VSVkVEID0gMHgwMDAzLAo+ICsgICAgICAgQUNQSV9SUVND
X05PREVfVFlQRV9IQVJUX0lORk8gPSAweEZGRkYsCj4gK307Cj4gKwo+ICsvKgo+ICsgKiBSUVND
IG5vZGUgc3BlY2lmaWMgc3VidGFibGVzCj4gKyAqLwo+ICsKPiArLyogSVNBIHN0cmluZyBub2Rl
IHN0cnVjdHVyZSAqLwo+ICtzdHJ1Y3QgYWNwaV9ycXNjX2lzYV9zdHJpbmcgewo+ICsgICAgICAg
dTE2IGlzYV9sZW5ndGg7Cj4gKyAgICAgICBjaGFyIGlzYVtdOwo+ICt9Owo+ICsKPiArc3RydWN0
IGFjcGlfcnFzY19jbW9fbm9kZSB7Cj4gKyAgICAgICB1OCByZXNlcnZlZDsgICAgICAgICAgICAv
KiBNdXN0IGJlIHplcm8gKi8KPiArICAgICAgIHU4IGNib21fc2l6ZTsgICAgICAgICAgIC8qIENC
T00gc2l6ZSBpbiBwb3dlcm9mIDIgKi8KPiArICAgICAgIHU4IGNib3Bfc2l6ZTsgICAgICAgICAg
IC8qIENCT1Agc2l6ZSBpbiBwb3dlcm9mIDIgKi8KPiArICAgICAgIHU4IGNib3pfc2l6ZTsgICAg
ICAgICAgIC8qIENCT1ogc2l6ZSBpbiBwb3dlcm9mIDIgKi8KPiArfTsKPiArCj4gK3N0cnVjdCBh
Y3BpX3Jxc2NfbW11X25vZGUgewo+ICsgICAgICAgdTggcmVzZXJ2ZWQ7ICAgICAgICAgICAgLyog
TXVzdCBiZSB6ZXJvICovCj4gKyAgICAgICB1OCBtbXVfdHlwZTsgICAgICAgICAgICAvKiBWaXJ0
dWFsIEFkZHJlc3MgU2NoZW1lICovCj4gK307Cj4gKwo+ICtlbnVtIGFjcGlfcnFzY19tbXVfdHlw
ZSB7Cj4gKyAgICAgICBBQ1BJX1JRU0NfTU1VX1RZUEVfU1YzOSA9IDAsCj4gKyAgICAgICBBQ1BJ
X1JRU0NfTU1VX1RZUEVfU1Y0OCA9IDEsCj4gKyAgICAgICBBQ1BJX19NTVVfVFlQRV9TVjU3ID0g
Mgo+ICt9Owo+ICsKPiArLyogSGFydCBJbmZvIG5vZGUgc3RydWN0dXJlICovCj4gK3N0cnVjdCBh
Y3BpX3Jxc2NfaGFydF9pbmZvIHsKPiArICAgICAgIHUxNiBudW1fb2Zmc2V0czsKPiArICAgICAg
IHUzMiB1aWQ7ICAgICAgICAgICAgICAgIC8qIEFDUEkgcHJvY2Vzc29yIFVJRCAqLwo+ICt9Owo+
ICsKPiAgLyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioKPiAgICoKPiAgICogUkhDVCAtIFJJU0MtViBI
YXJ0IENhcGFiaWxpdGllcyBUYWJsZQo+Cj4gLS0KPiAyLjQzLjAKPgoKVGhhbmtzLApZdW5odWkK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
