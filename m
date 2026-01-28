Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65A6D46BFB
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 20:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+JxIJlaE5pZpxpflXMkznAIrxYWf3vZsz3Sc2HVhJhk=; b=bVs6BzquOiI4Tl
	c9ZyG5Rd6ToqPrfjNq7NxuIsxY4ZppZlzJKnqy2p5uf7OzklN/ChZlQqgduRUV/4q/ole9fpUTqSv
	0RRNZeFekaqZQ3VUsUrmsgtkLytg/hpqgYD3WAu5tqG6PWyZz3AZrSUsIDRqehE+Nu33WLkLLaiMS
	SIEAthJNo7iWM2Sie+RRafq2PVJoQRYcCJhxl6yth5LHCFUih5nT+OWc6gOQTzGobcdDyVRtDRDiM
	6qGbBoQTQ84++KI73pKF0AS6j3Ei/IUqksisfvWxRQFisht0mqXzXCJqlZZd8sC2vCqW7cS1jZE1A
	llZL5BDmrT+XwaQWzbsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCCK-0000000GlgS-175h;
	Wed, 28 Jan 2026 20:31:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCCH-0000000Glg6-1x0I
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 20:31:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E422244512
	for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 20:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9080C116C6
	for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 20:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769632288;
	bh=gBKZeGXmRB72ugZQee9uLksgDTLcgvK/XSgyK0HBTYs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fJV8AyCjQjvZdUGePNhoVfrZMdJ8GUJEIoBRWGtSh9gGvFIbEe9/lQ5JyFCmnyMRd
	 LW5m8YYPHmQceI1ZKQQ9P8xMSo5IiNoqlbxq1tfORv65VIsTFCydOco9+eUa6UtmAt
	 vS6+nmhkALtkUIZMtlkKHXoz4kZ7svueDOmz9icuRSMhnAKTcsuU+0DaEKdtJOtRRI
	 ietsL1xrzMh4ibjlyiE5a0gI16gGcpoAgMak67adSFZPL5QkwrXl8TsG7EadV11am9
	 92JPLOlDDWG7sNt1pNxfZ86fHE+RcUVheKB7+ANlu9cmdH/LKuQLrCaPYU0hqbPjyR
	 R2hGaCris2jOg==
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-662f62af84bso86606eaf.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 12:31:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8vhsWU5QEXIecieYjdHZi/Tvjxl9E1caepO5wdY9uiUxK8M1tzAEoNWJyLk93q4XAgmfEXy/2S/q64A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxwMMCn3CbIDSBy4tPVLzoa0bK8Kx/rtVzzvte5KzHU6JLLo+QJ
	YShvSyUsWNnJtaActtRC+vOFZxc7ECGlPj+ef+TMZ+ry1nd3eAsM3+jJn9jOGINHIJBST5CwrdN
	Wrumm1pDAmkF2Xs6CZNXncuTgpGZLmow=
X-Received: by 2002:a05:6820:4888:b0:661:1d0c:a5b5 with SMTP id
 006d021491bc7-662f20b2282mr3218498eaf.48.1769632287212; Wed, 28 Jan 2026
 12:31:27 -0800 (PST)
MIME-Version: 1.0
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org> <20260128-ssqosid-cbqri-v2-14-dca586b091b9@kernel.org>
In-Reply-To: <20260128-ssqosid-cbqri-v2-14-dca586b091b9@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 28 Jan 2026 21:31:16 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iSZ6qvhUWHtrWuO5XBviMcLUMfRB_hWn-FxAhe=LoA-Q@mail.gmail.com>
X-Gm-Features: AZwV_QhTWYQto4BrtdQANhW7sZdsYf8E3diyh5q6rhkPzFH1j0ccCk27nUICkrQ
Message-ID: <CAJZ5v0iSZ6qvhUWHtrWuO5XBviMcLUMfRB_hWn-FxAhe=LoA-Q@mail.gmail.com>
Subject: Re: [PATCH RFC v2 14/17] include: acpi: actbl2: Add structs for RQSC table
To: Drew Fustini <fustini@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_123129_568768_8CBE4D2D 
X-CRM114-Status: GOOD (  17.68  )
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
Cc: Atish Patra <atish.patra@linux.dev>, Adrien Ricciardi <aricciardi@baylibre.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor+dt@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, devicetree@vger.kernel.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, guo.wenjia23@zte.com.cn, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, x86@kernel.org, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, liu.qingtao2@zte.com.cn, linux-acpi@vger.kernel.org, Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, Dave Martin <Dave.Martin@arm.com>, Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>, Chen Pei <cp0613@linux.alibaba.com>, Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, Babu Moger <babu.moger@amd.com>, Weiwei Li <liwei1518@gmail.com>, yunhui cui <cuiyunhui@bytedance.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ved Shanbhogue <ved@rivosinc.com>, Reinette Chatre <reinette.chatre@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, Tony Luck <tony.luck@intel.com>, Peter Newman <peternewman@google.com>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKYW4gMjgsIDIwMjYgYXQgOToyOOKAr1BNIERyZXcgRnVzdGluaSA8ZnVzdGluaUBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IEFkZCBzdHJ1Y3RzIGZvciB0aGUgUlFTQyB0YWJsZSB3aGlj
aCBkZXNjcmliZXMgdGhlIHByb3BlcnRpZXMgb2YgdGhlCj4gUklTQy1WIFFvUyBjb250cm9sbGVy
cyAoQ0JRUkkpIGluIHRoZSBzeXN0ZW0uIFRoZSB0YWJsZSBhbHNvIGRlc2NyaWJlcwo+IHRoZSB0
b3BvbG9naWNhbCBhcnJhbmdlbWVudCBvZiB0aGUgUW9TIGNvbnRyb2xsZXJzIGFuZCByZXNvdXJj
ZXMgaW4gdGhlCj4gc3lzdGVtLiBUaGUgdG9wb2xvZ3kgaXMgZXhwcmVzc2VkIGluIHRlcm1zIG9m
IHRoZSBsb2NhdGlvbiBvZiB0aGUKPiByZXNvdXJjZXMgd2l0aGluIHRoZSBzeXN0ZW0gYW5kIHRo
ZSByZWxhdGlvbiBiZXR3ZWVuIHRoZSBRb1MgQ29udHJvbGxlcgo+IGFuZCB0aGUgcmVzb3VyY2Ug
aXQgbWFuYWdlcy4KPgo+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jp
c2N2LWNicXJpL3JlbGVhc2VzL3RhZy92MS4wCj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL3Jp
c2N2LW5vbi1pc2EvcmlzY3YtcnFzYy9ibG9iL21haW4vc3JjL2NoYXB0ZXIyLmFkb2MKPiBTaWdu
ZWQtb2ZmLWJ5OiBEcmV3IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9yZz4KCk9mIGNvdXJzZSwg
dGhpcyBjaGFuZ2UgbmVlZHMgdG8gZ28gdGhyb3VnaCB1cHN0cmVhbSBBQ1BJQ0EuCgo+IC0tLQo+
ICBpbmNsdWRlL2FjcGkvYWN0YmwyLmggfCA5MiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDkyIGluc2VydGlvbnMo
KykKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2FjcGkvYWN0YmwyLmggYi9pbmNsdWRlL2FjcGkv
YWN0YmwyLmgKPiBpbmRleCBmNzI2YmNlM2ViODQuLjczNjc5OTAzNDllZSAxMDA2NDQKPiAtLS0g
YS9pbmNsdWRlL2FjcGkvYWN0YmwyLmgKPiArKysgYi9pbmNsdWRlL2FjcGkvYWN0YmwyLmgKPiBA
QCAtNTMsNiArNTMsNyBAQAo+ICAjZGVmaW5lIEFDUElfU0lHX1JHUlQgICAgICAgICAgICJSR1JU
IiAvKiBSZWd1bGF0b3J5IEdyYXBoaWNzIFJlc291cmNlIFRhYmxlICovCj4gICNkZWZpbmUgQUNQ
SV9TSUdfUkhDVCAgICAgICAgICAgIlJIQ1QiIC8qIFJJU0MtViBIYXJ0IENhcGFiaWxpdGllcyBU
YWJsZSAqLwo+ICAjZGVmaW5lIEFDUElfU0lHX1JJTVQgICAgICAgICAgICJSSU1UIiAvKiBSSVND
LVYgSU8gTWFwcGluZyBUYWJsZSAqLwo+ICsjZGVmaW5lIEFDUElfU0lHX1JRU0MgICAgICAgICAg
ICJSUVNDIiAvKiBSSVNDLVYgUklTQy1WIFF1YWxpdHkgb2YgU2VydmljZSBDb250cm9sbGVyICov
Cj4gICNkZWZpbmUgQUNQSV9TSUdfU0JTVCAgICAgICAgICAgIlNCU1QiIC8qIFNtYXJ0IEJhdHRl
cnkgU3BlY2lmaWNhdGlvbiBUYWJsZSAqLwo+ICAjZGVmaW5lIEFDUElfU0lHX1NERUkgICAgICAg
ICAgICJTREVJIiAvKiBTb2Z0d2FyZSBEZWxlZ2F0ZWQgRXhjZXB0aW9uIEludGVyZmFjZSBUYWJs
ZSAqLwo+ICAjZGVmaW5lIEFDUElfU0lHX1NERVYgICAgICAgICAgICJTREVWIiAvKiBTZWN1cmUg
RGV2aWNlcyB0YWJsZSAqLwo+IEBAIC0zMTY1LDYgKzMxNjYsOTcgQEAgZW51bSBhY3BpX3JncnRf
aW1hZ2VfdHlwZSB7Cj4gICAgICAgICBBQ1BJX1JHUlRfVFlQRV9SRVNFUlZFRCA9IDIgICAgIC8q
IDIgYW5kIGdyZWF0ZXIgYXJlIHJlc2VydmVkICovCj4gIH07Cj4KPiArLyoqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioKPiArICoKPiArICogUlFTQyAtIFJJU0MtViBRdWFsaXR5IG9mIFNlcnZpY2UgQ29u
dHJvbGxlcgo+ICsgKiAgICAgICAgVmVyc2lvbiAxCj4gKyAqCj4gKyAqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKiovCj4gKwo+ICtzdHJ1Y3QgYWNwaV90YWJsZV9ycXNjX2ZpZWxkc19yZXMgewo+ICsgICAg
ICAgdTggdHlwZTsgICAgICAgIC8vIDEKPiArICAgICAgIHU4IHJlc3Y7ICAgICAgICAvLyAxCj4g
KyAgICAgICB1MTYgbGVuZ3RoOyAgICAgLy8gMgo+ICsgICAgICAgdTE2IGZsYWdzOyAgICAgIC8v
IDIKPiArICAgICAgIHU4IHJlc3YyOyAgICAgICAvLyAxCj4gKyAgICAgICB1OCBpZF90eXBlOyAg
ICAgLy8gMQo+ICsgICAgICAgdTY0IGlkMTsgICAgICAgIC8vIDgKPiArICAgICAgIHUzMiBpZDI7
ICAgICAgICAvLyA0Cj4gK307Cj4gKwo+ICtzdHJ1Y3QgYWNwaV90YWJsZV9ycXNjX2ZpZWxkcyB7
Cj4gKyAgICAgICB1OCB0eXBlOyAgICAgICAgLy8gIDEKPiArICAgICAgIHU4IHJlc3Y7ICAgICAg
ICAvLyAgMQo+ICsgICAgICAgdTE2IGxlbmd0aDsgICAgIC8vICAyCj4gKyAgICAgICB1MzIgcmVn
WzNdOyAgICAgLy8gMTIKPiArICAgICAgIHUzMiByY2lkOyAgICAgICAvLyAgNAo+ICsgICAgICAg
dTMyIG1jaWQ7ICAgICAgIC8vICA0Cj4gKyAgICAgICB1MTYgZmxhZ3M7ICAgICAgLy8gIDIKPiAr
ICAgICAgIHUxNiBucmVzOyAgICAgICAvLyAgMgo+ICsgICAgICAgc3RydWN0IGFjcGlfdGFibGVf
cnFzY19maWVsZHNfcmVzIHJlczsgLy8gMjAKPiArfTsKPiArCj4gK3N0cnVjdCBhY3BpX3RhYmxl
X3Jxc2Mgewo+ICsgICAgICAgc3RydWN0IGFjcGlfdGFibGVfaGVhZGVyIGhlYWRlcjsgICAgICAg
IC8qIENvbW1vbiBBQ1BJIHRhYmxlIGhlYWRlciAqLwo+ICsgICAgICAgdTMyIG51bTsKPiArICAg
ICAgIHN0cnVjdCBhY3BpX3RhYmxlX3Jxc2NfZmllbGRzIGZbNl07Cj4gK307Cj4gKwo+ICsvKiBS
UVNDIEZsYWdzICovCj4gKyNkZWZpbmUgQUNQSV9SUVNDX1RJTUVSX0NBTk5PVF9XQUtFVVBfQ1BV
ICAgICAgICgxKQo+ICsKPiArLyoKPiArICogUlFTQyBzdWJ0YWJsZXMKPiArICovCj4gK3N0cnVj
dCBhY3BpX3Jxc2Nfbm9kZV9oZWFkZXIgewo+ICsgICAgICAgdTE2IHR5cGU7Cj4gKyAgICAgICB1
MTYgbGVuZ3RoOwo+ICsgICAgICAgdTE2IHJldmlzaW9uOwo+ICt9Owo+ICsKPiArLyogVmFsdWVz
IGZvciBSUVNDIHN1YnRhYmxlIFR5cGUgYWJvdmUgKi8KPiArZW51bSBhY3BpX3Jxc2Nfbm9kZV90
eXBlIHsKPiArICAgICAgIEFDUElfUlFTQ19OT0RFX1RZUEVfSVNBX1NUUklORyA9IDB4MDAwMCwK
PiArICAgICAgIEFDUElfUlFTQ19OT0RFX1RZUEVfQ01PID0gMHgwMDAxLAo+ICsgICAgICAgQUNQ
SV9SUVNDX05PREVfVFlQRV9NTVUgPSAweDAwMDIsCj4gKyAgICAgICBBQ1BJX1JRU0NfTk9ERV9U
WVBFX1JFU0VSVkVEID0gMHgwMDAzLAo+ICsgICAgICAgQUNQSV9SUVNDX05PREVfVFlQRV9IQVJU
X0lORk8gPSAweEZGRkYsCj4gK307Cj4gKwo+ICsvKgo+ICsgKiBSUVNDIG5vZGUgc3BlY2lmaWMg
c3VidGFibGVzCj4gKyAqLwo+ICsKPiArLyogSVNBIHN0cmluZyBub2RlIHN0cnVjdHVyZSAqLwo+
ICtzdHJ1Y3QgYWNwaV9ycXNjX2lzYV9zdHJpbmcgewo+ICsgICAgICAgdTE2IGlzYV9sZW5ndGg7
Cj4gKyAgICAgICBjaGFyIGlzYVtdOwo+ICt9Owo+ICsKPiArc3RydWN0IGFjcGlfcnFzY19jbW9f
bm9kZSB7Cj4gKyAgICAgICB1OCByZXNlcnZlZDsgICAgICAgICAgICAvKiBNdXN0IGJlIHplcm8g
Ki8KPiArICAgICAgIHU4IGNib21fc2l6ZTsgICAgICAgICAgIC8qIENCT00gc2l6ZSBpbiBwb3dl
cm9mIDIgKi8KPiArICAgICAgIHU4IGNib3Bfc2l6ZTsgICAgICAgICAgIC8qIENCT1Agc2l6ZSBp
biBwb3dlcm9mIDIgKi8KPiArICAgICAgIHU4IGNib3pfc2l6ZTsgICAgICAgICAgIC8qIENCT1og
c2l6ZSBpbiBwb3dlcm9mIDIgKi8KPiArfTsKPiArCj4gK3N0cnVjdCBhY3BpX3Jxc2NfbW11X25v
ZGUgewo+ICsgICAgICAgdTggcmVzZXJ2ZWQ7ICAgICAgICAgICAgLyogTXVzdCBiZSB6ZXJvICov
Cj4gKyAgICAgICB1OCBtbXVfdHlwZTsgICAgICAgICAgICAvKiBWaXJ0dWFsIEFkZHJlc3MgU2No
ZW1lICovCj4gK307Cj4gKwo+ICtlbnVtIGFjcGlfcnFzY19tbXVfdHlwZSB7Cj4gKyAgICAgICBB
Q1BJX1JRU0NfTU1VX1RZUEVfU1YzOSA9IDAsCj4gKyAgICAgICBBQ1BJX1JRU0NfTU1VX1RZUEVf
U1Y0OCA9IDEsCj4gKyAgICAgICBBQ1BJX19NTVVfVFlQRV9TVjU3ID0gMgo+ICt9Owo+ICsKPiAr
LyogSGFydCBJbmZvIG5vZGUgc3RydWN0dXJlICovCj4gK3N0cnVjdCBhY3BpX3Jxc2NfaGFydF9p
bmZvIHsKPiArICAgICAgIHUxNiBudW1fb2Zmc2V0czsKPiArICAgICAgIHUzMiB1aWQ7ICAgICAg
ICAgICAgICAgIC8qIEFDUEkgcHJvY2Vzc29yIFVJRCAqLwo+ICt9Owo+ICsKPiAgLyoqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioKPiAgICoKPiAgICogUkhDVCAtIFJJU0MtViBIYXJ0IENhcGFiaWxpdGll
cyBUYWJsZQo+Cj4gLS0KPiAyLjQzLjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
