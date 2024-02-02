Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFC9C47DB3
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 12:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QUd0it/3HLw+Sc7XwXqcCQEBgWIUa+fqXhFh13NjKdo=; b=G5MmHBtulckqLK
	xJiHsWvlQs5MELYO2JBDRqYslx79oAzQcuI0ktiNX88WPjRbQWN4qIjwUndkdX+AGU/vYyUaZLJEa
	8wUBB7OZYo1qF4lzoH+2oCRgFKBrMRf9MG4kLelih4lqby5aqH95AQv5Kfe0ORK/Y06gncnBLDa+d
	MvKDe418jh7+eGFT12HlVKxyhJ50BHytroJfG2JAjMLRrpgWNtB4lvPhI8Bscj7e3Cuo3oNwaZNNC
	rpAqnSyJ9Vtyi/IXPEUfeO7SCz0v6xEw/mgIR/5uCtfbAsG0SwYO1W76B/n1t+fMNOV9JW0tuQWE6
	MgOyFL75rZtTLDAnkNDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVsTw-0000000BRMR-2cze;
	Fri, 02 Feb 2024 12:17:20 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVsTt-0000000BRKp-1eAG
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 12:17:18 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d7232dcb3eso15144035ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Feb 2024 04:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706876236; x=1707481036; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WuDd3zOQAiqDRvFUN46e91vQJ5JvtevogL67l6y45OI=;
        b=VVKfDqJU8mWjAnoQC9hFDrk6q6P79qxl+H26m/HRLrMOOKZ4BkG8v46Q/HhHfrgekR
         f1E213XLxPEVa/CqCfLuVRZ/4ROzSxdQifyc1T9HXZVIUEnhYXQ4N0SoH+OMDY0YB5DJ
         PeYrrUcFzuNntv9fENbvlZbG1K1fWAWvE1Btmm1pTatYFOLcDUG1HO2Ii95S2t89uXZ9
         0f0lwnmdjbkntS8QFYZQWCJkM2Wnv5swZ5Yc677E/IOmWJLwhxhXEyeazkchPX2/OaEa
         CpgboJaJVzbyHhMIkUFZDrP1YiZfKayhigpaI6KC4lMjncEfuMfmnZNc9Fj0Hz6YmJdE
         MDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706876236; x=1707481036;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WuDd3zOQAiqDRvFUN46e91vQJ5JvtevogL67l6y45OI=;
        b=ckQInt5RBpJXIbNfU5s8TOYU4g+j1OwPozDTPB7fNxUpedZvAmoj6cvqEW7hHGOTRA
         Z2EaAfRKf0lvLT94Ev/0/iwgGNY8+ueRi2WvR1ON5MLztlT0AqJyWPlZHm/R8GgbyUZU
         okV/xOocfo4/l0Miv2CNLUzWGkkZ/H0Wo6BgRKotgYhBhxnR2CNRJrUarn/GxSEDgZqN
         UGrdfpIcez4oBhxrWblSjGtuG6RoilKwmz2qRZAFAAD1rdPHCnjbpN+cjEH1pGWZ1oH/
         5pW5wm8TZYT7GGTZSmk3palH0D1VXkQsvd8m0O+Bds9r/VlzYgPVKnmKBjrwmRMoWlPN
         Sb9A==
X-Gm-Message-State: AOJu0Yw2kWoSwcNta6bYk5kOy0is9NrzLaQ9HSbbw7dFdMpZuI0gu/lW
	GocanrK9F9c8qaAm81E58ZJU1TPN/tyXThNTOFVewThrN8/XpyZedJK0LSTNHI8=
X-Google-Smtp-Source: AGHT+IELLNH6lWdm0s+G2HbC/KWATTA/vsyct7pz0+9b+4Hl12z0rekIe8r2GVhwtMQnByPle+FQLA==
X-Received: by 2002:a17:902:da92:b0:1d8:b8df:79f4 with SMTP id j18-20020a170902da9200b001d8b8df79f4mr2378238plx.17.1706876236115;
        Fri, 02 Feb 2024 04:17:16 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXiIR/itsnWnL1cYJ2OcTY6EoEK531FbhCQgmajYPOLag9Pn/hn1011psN0PdOlnWFiCO3Pl7QzTF7ASCpJtLkcC8afhklPJ5blqucvlLhvzbbGcgZjklNOCtCWmOghvWbPoAazvdXfe2MtAEYveR9SiN/Btj0BfjZZoUxwGik0E9pdD+i8nqL38Ou8e/WtpBfRvw7t+MeIiVhJZ+CXJqogfa3tF6jeWX70+4N8KPHFzuKJttY7H4U5gKw5NOh++nPlx7TkjU70fazXM/7dykap7nIu6meMXFNV6+5DHAJF3CZWF0/xlvLaToMNmXgIBQ8grxl10She4NsanWIJZcXR+BJLfI5+YOVUS8mNPgzn3eKImcR9iDmju9bQNUFesVN9Y0O+1WKM2+k2px/45ayy3Xue/cYB/TnSO18utI7unRCRpOwYUhjSEtDBkRrIANziYcu35JZM6JTk+Mp6Na/1Uk626Cx9+Ez/9sgKHnYzEiFuxkK0U60iaLGa0jn6Wy1QgSZiHqXSSXYzuDhsJ7TNMtj7zCfK0+i6cLjDllPTlKFjAQAqx5uYH6V7VDlJmMALStyGMQmRGJrNQAoJ8oat7T7aXiZgUTWNyfxEm1k=
Received: from sunil-laptop ([106.51.184.12])
        by smtp.gmail.com with ESMTPSA id d18-20020a170903209200b001d8cde39e8bsm1467536plc.194.2024.02.02.04.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 04:17:15 -0800 (PST)
Date: Fri, 2 Feb 2024 17:47:07 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>, Haibo Xu <haibo1.xu@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [RFC PATCH v3 00/17] RISC-V: ACPI: Add external interrupt
 controller support
Message-ID: <ZbzdQ2TdsSsb7PL/@sunil-laptop>
References: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
 <CAJZ5v0j6Veze8xDFKTbVZ5=WAfmLdeJ8NXRnh9kwCZgyaDdgew@mail.gmail.com>
 <ZbiQ/tO/odnJCBD1@sunil-laptop>
 <CAJZ5v0gnH0uPEM0q9VzJOg2Z_7bOP9XdQbOttpRtnkLGej45Sw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0gnH0uPEM0q9VzJOg2Z_7bOP9XdQbOttpRtnkLGej45Sw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_041717_472389_FE8D4E57 
X-CRM114-Status: GOOD (  44.23  )
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

T24gVGh1LCBGZWIgMDEsIDIwMjQgYXQgMDc6MTA6MjhQTSArMDEwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gVHVlLCBKYW4gMzAsIDIwMjQgYXQgNzowMuKAr0FNIFN1bmlsIFYgTCA8
c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUsIERlYyAxOSwg
MjAyMyBhdCAwNjo1MDoxOVBNICswMTAwLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZToKPiA+ID4g
T24gVHVlLCBEZWMgMTksIDIwMjMgYXQgNjo0NeKAr1BNIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IFRoaXMgc2VyaWVzIGFkZHMgc3Vw
cG9ydCBmb3IgdGhlIGJlbG93IEVDUiBhcHByb3ZlZCBieSBBU1dHLgo+ID4gPiA+IDEpIE1BRFQg
LSBodHRwczovL2RyaXZlLmdvb2dsZS5jb20vZmlsZS9kLzFvTUdQeU9ENThKYVBnTWwxcEthc1Qt
VktzSUtpYTd6Ui92aWV3P3VzcD1zaGFyaW5nCj4gPiA+ID4KPiA+ID4gPiBUaGUgc2VyaWVzIHBy
aW1hcmlseSBlbmFibGVzIGlycWNoaXAgZHJpdmVycyBmb3IgUklTQy1WIEFDUEkgYmFzZWQKPiA+
ID4gPiBwbGF0Zm9ybXMuCj4gPiA+ID4KPiA+ID4gPiBUaGUgc2VyaWVzIGNhbiBiZSBicm9hZGx5
IGNhdGVnb3JpemVkIGxpa2UgYmVsb3cuCj4gPiA+ID4KPiA+ID4gPiAxKSBQQ0kgQUNQSSByZWxh
dGVkIGZ1bmN0aW9ucyBhcmUgbWlncmF0ZWQgZnJvbSBhcm02NCB0byBjb21tb24gZmlsZSBzbwo+
ID4gPiA+IHRoYXQgd2UgZG9uJ3QgbmVlZCB0byBkdXBsaWNhdGUgdGhlbSBmb3IgUklTQy1WLgo+
ID4gPiA+Cj4gPiA+ID4gMikgSW50cm9kdWNlZCBzdXBwb3J0IGZvciBmd19kZXZsaW5rIGZvciBB
Q1BJIG5vZGVzIGZvciBJUlEgZGVwZW5kZW5jeS4KPiA+ID4gPiBUaGlzIGhlbHBzIHRvIHN1cHBv
cnQgZGVmZXJyZWQgcHJvYmUgb2YgaW50ZXJydXB0IGNvbnRyb2xsZXIgZHJpdmVycy4KPiA+ID4g
Pgo+ID4gPiA+IDMpIE1vZGlmaWVkIHBucF9pcnEoKSB0byB0cnkgcmVnaXN0ZXJpbmcgdGhlIElS
USAgYWdhaW4gaWYgaXQgc2VlcyBpdCBpbgo+ID4gPiA+IGRpc2FibGVkIHN0YXRlLiBUaGlzIHNv
bHV0aW9uIGlzIHNpbWlsYXIgdG8gaG93Cj4gPiA+ID4gcGxhdGZvcm1fZ2V0X2lycV9vcHRpb25h
bCgpIHdvcmtzIGZvciByZWd1bGFyIHBsYXRmb3JtIGRldmljZXMuCj4gPiA+ID4KPiA+ID4gPiA0
KSBBZGRlZCBzdXBwb3J0IGZvciByZS1vcmRlcmluZyB0aGUgcHJvYmUgb2YgaW50ZXJydXB0IGNv
bnRyb2xsZXJzIHdoZW4KPiA+ID4gPiBJUlFDSElQX0FDUElfREVDTEFSRSBpcyB1c2VkLgo+ID4g
PiA+Cj4gPiA+ID4gNSkgQUNQSSBzdXBwb3J0IGFkZGVkIGluIFJJU0MtViBpbnRlcnJ1cHQgY29u
dHJvbGxlciBkcml2ZXJzLgo+ID4gPiA+Cj4gPiA+ID4gVGhpcyBzZXJpZXMgaXMgYmFzZWQgb24g
QW51cCdzIEFJQSB2MTEgc2VyaWVzLiBTaW5jZSBBbnVwJ3MgQUlBIHYxMSBpcwo+ID4gPiA+IG5v
dCBtZXJnZWQgeWV0IGFuZCBmaXJzdCB0aW1lIGludHJvZHVjaW5nIGZ3X2RldmxpbmssIGRlZmVy
cmVkIHByb2JlIGFuZAo+ID4gPiA+IHJlb3JkZXJpbmcgc3VwcG9ydCBmb3IgSVJRQ0hJUCBwcm9i
ZSwgdGhpcyBzZXJpZXMgaXMgc3RpbGwga2VwdCBhcyBSRkMuCj4gPiA+ID4gTG9va2luZyBmb3J3
YXJkIGZvciB0aGUgZmVlZGJhY2shCj4gPiA+ID4KPiA+ID4gPiBDaGFuZ2VzIHNpbmNlIFJGQyB2
MjoKPiA+ID4gPiAgICAgICAgIDEpIEludHJvZHVjZWQgZndfZGV2bGluayBmb3IgQUNQSSBub2Rl
cyBmb3IgSVJRIGRlcGVuZGVuY3kuCj4gPiA+ID4gICAgICAgICAyKSBEcm9wcGVkIHBhdGNoZXMg
aW4gZHJpdmVycyB3aGljaCBhcmUgbm90IHJlcXVpcmVkIGR1ZSB0bwo+ID4gPiA+ICAgICAgICAg
ICAgZndfZGV2bGluayBzdXBwb3J0Lgo+ID4gPiA+ICAgICAgICAgMykgRHJvcHBlZCBwY2lfc2V0
X21zaSgpIHBhdGNoIGFuZCBhZGRlZCBhIHBhdGNoIGluCj4gPiA+ID4gICAgICAgICAgICBwY2lf
Y3JlYXRlX3Jvb3RfYnVzKCkuCj4gPiA+ID4gICAgICAgICA0KSBVcGRhdGVkIHBucF9pcnEoKSBw
YXRjaCBzbyB0aGF0IG5vbmUgb2YgdGhlIGFjdHVhbCBQTlAKPiA+ID4gPiAgICAgICAgICAgIGRy
aXZlcnMgbmVlZCB0byBjaGFuZ2UuCj4gPiA+ID4KPiA+ID4gPiBDaGFuZ2VzIHNpbmNlIFJGQyB2
MToKPiA+ID4gPiAgICAgICAgIDEpIEFiYW5kb25lZCBzd25vZGUgYXBwcm9hY2ggYXMgcGVyIE1h
cmMncyBmZWVkYmFjay4KPiA+ID4gPiAgICAgICAgIDIpIFRvIGNvcGUgdXAgd2l0aCBBSUEgc2Vy
aWVzIGNoYW5nZXMgd2hpY2ggY2hhbmdlZCBpcnFjaGlwIGRyaXZlcgo+ID4gPiA+ICAgICAgICAg
ICAgcHJvYmUgZnJvbSBjb3JlX2luaXRjYWxsKCkgdG8gcGxhdGZvcm1fZHJpdmVyLCBhZGRlZCBw
YXRjaGVzCj4gPiA+ID4gICAgICAgICAgICB0byBzdXBwb3J0IGRlZmVycmVkIHByb2JpbmcuCj4g
PiA+ID4gICAgICAgICAzKSBSZWJhc2VkIG9uIHRvcCBvZiBBbnVwJ3MgQUlBIHYxMSBhbmQgYWRk
ZWQgdGFncy4KPiA+ID4gPgo+ID4gPiA+IFRvIHRlc3QgdGhlIHNlcmllcywKPiA+ID4gPgo+ID4g
PiA+IDEpIFFlbXUgc2hvdWxkIGJlIGJ1aWx0IHVzaW5nIHRoZSByaXNjdl9hY3BpX2IyX3Y4IGJy
YW5jaCBhdAo+ID4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS92bHN1bmlsL3FlbXUuZ2l0Cj4gPiA+
ID4KPiA+ID4gPiAyKSBFREsyIHNob3VsZCBiZSBidWlsdCB1c2luZyB0aGUgaW5zdHJ1Y3Rpb25z
IGF0Ogo+ID4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS90aWFub2NvcmUvZWRrMi9ibG9iL21hc3Rl
ci9Pdm1mUGtnL1Jpc2NWVmlydC9SRUFETUUubWQKPiA+ID4gPgo+ID4gPiA+IDMpIEJ1aWxkIExp
bnV4IHVzaW5nIHRoaXMgc2VyaWVzIG9uIHRvcCBvZiBBbnVwJ3MgQUlBIHYxMSBzZXJpZXMuCj4g
PiA+ID4KPiA+ID4gPiBSdW4gUWVtdToKPiA+ID4gPiBxZW11LXN5c3RlbS1yaXNjdjY0IFwKPiA+
ID4gPiAgLU0gdmlydCxwZmxhc2gwPXBmbGFzaDAscGZsYXNoMT1wZmxhc2gxLGFpYT1hcGxpYy1p
bXNpYyBcCj4gPiA+ID4gIC1tIDJHIC1zbXAgOCBcCj4gPiA+ID4gIC1zZXJpYWwgbW9uOnN0ZGlv
IFwKPiA+ID4gPiAgLWRldmljZSB2aXJ0aW8tZ3B1LXBjaSAtZnVsbC1zY3JlZW4gXAo+ID4gPiA+
ICAtZGV2aWNlIHFlbXUteGhjaSBcCj4gPiA+ID4gIC1kZXZpY2UgdXNiLWtiZCBcCj4gPiA+ID4g
IC1ibG9ja2RldiBub2RlLW5hbWU9cGZsYXNoMCxkcml2ZXI9ZmlsZSxyZWFkLW9ubHk9b24sZmls
ZW5hbWU9UklTQ1ZfVklSVF9DT0RFLmZkIFwKPiA+ID4gPiAgLWJsb2NrZGV2IG5vZGUtbmFtZT1w
Zmxhc2gxLGRyaXZlcj1maWxlLGZpbGVuYW1lPVJJU0NWX1ZJUlRfVkFSUy5mZCBcCj4gPiA+ID4g
IC1uZXRkZXYgdXNlcixpZD1uZXQwIC1kZXZpY2UgdmlydGlvLW5ldC1wY2ksbmV0ZGV2PW5ldDAg
XAo+ID4gPiA+ICAta2VybmVsIGFyY2gvcmlzY3YvYm9vdC9JbWFnZSBcCj4gPiA+ID4gIC1pbml0
cmQgcm9vdGZzLmNwaW8gXAo+ID4gPiA+ICAtYXBwZW5kICJyb290PS9kZXYvcmFtIHJvIGNvbnNv
bGU9dHR5UzAgcm9vdHdhaXQgZWFybHljb249dWFydDgyNTAsbW1pbywweDEwMDAwMDAwIgo+ID4g
PiA+Cj4gPiA+ID4gVG8gYm9vdCB3aXRoIEFQTElDIG9ubHksIHVzZSBhaWE9YXBsaWMuCj4gPiA+
ID4gVG8gYm9vdCB3aXRoIFBMSUMsIHJlbW92ZSBhaWE9IG9wdGlvbi4KPiA+ID4gPgo+ID4gPiA+
IFRoaXMgc2VyaWVzIGlzIGFsc28gYXZhaWxhYmxlIGluIGFjcGlfYjJfdjNfcmlzY3ZfYWlhX3Yx
MSBicmFuY2ggYXQKPiA+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vdmxzdW5pbC9saW51eC5naXQK
PiA+ID4gPgo+ID4gPiA+IEJhc2VkLW9uOiAyMDIzMTAyMzE3MjgwMC4zMTUzNDMtMS1hcGF0ZWxA
dmVudGFuYW1pY3JvLmNvbQo+ID4gPiA+IChodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIw
MjMxMDIzMTcyODAwLjMxNTM0My0xLWFwYXRlbEB2ZW50YW5hbWljcm8uY29tLykKPiA+ID4gPgo+
ID4gPiA+IFN1bmlsIFYgTCAoMTcpOgo+ID4gPiA+ICAgYXJtNjQ6IFBDSTogTWlncmF0ZSBBQ1BJ
IHJlbGF0ZWQgZnVuY3Rpb25zIHRvIHBjaS1hY3BpLmMKPiA+ID4gPiAgIFJJU0MtVjogQUNQSTog
SW1wbGVtZW50IFBDSSByZWxhdGVkIGZ1bmN0aW9uYWxpdHkKPiA+ID4gPiAgIFBDSTogTWFrZSBw
Y2lfY3JlYXRlX3Jvb3RfYnVzKCkgZGVjbGFyZSBpdHMgcmVsaWFuY2Ugb24gTVNJIGRvbWFpbnMK
PiA+ID4gPiAgIEFDUEk6IEFkZCBmd19kZXZsaW5rIHN1cHBvcnQgZm9yIEFDUEkgZndub2RlIGZv
ciBJUlEgZGVwZW5kZW5jeQo+ID4gPiA+ICAgQUNQSTogaXJxOiBBZGQgc3VwcG9ydCBmb3IgZGVm
ZXJyZWQgcHJvYmUgaW4gYWNwaV9yZWdpc3Rlcl9nc2koKQo+ID4gPiA+ICAgcG5wLmg6IFJlY29u
ZmlndXJlIElSUSBpbiBwbnBfaXJxKCkgdG8gc3VwcG9ydCBkZWZlcnJlZCBwcm9iZQo+ID4gPiA+
ICAgQUNQSTogc2Nhbi5jOiBBZGQgd2VhayBhcmNoIHNwZWNpZmljIGZ1bmN0aW9uIHRvIHJlb3Jk
ZXIgdGhlIElSUUNISVAKPiA+ID4gPiAgICAgcHJvYmUKPiA+ID4gPiAgIEFDUEk6IFJJU0MtVjog
SW1wbGVtZW50IGFyY2ggZnVuY3Rpb24gdG8gcmVvcmRlciBpcnFjaGlwIHByb2JlIGVudHJpZXMK
PiA+ID4gPiAgIGlycWNoaXA6IHJpc2N2LWludGM6IEFkZCBBQ1BJIHN1cHBvcnQgZm9yIEFJQQo+
ID4gPiA+ICAgaXJxY2hpcDogcmlzY3YtaW1zaWM6IEFkZCBBQ1BJIHN1cHBvcnQKPiA+ID4gPiAg
IGlycWNoaXA6IHJpc2N2LWFwbGljOiBBZGQgQUNQSSBzdXBwb3J0Cj4gPiA+ID4gICBpcnFjaGlw
OiBpcnEtc2lmaXZlLXBsaWM6IEFkZCBBQ1BJIHN1cHBvcnQKPiA+ID4gPiAgIEFDUEk6IGJ1czog
QWRkIFJJTlRDIElSUSBtb2RlbCBmb3IgUklTQy1WCj4gPiA+ID4gICBBQ1BJOiBidXM6IEFkZCBh
Y3BpX3Jpc2N2X2luaXQgZnVuY3Rpb24KPiA+ID4gPiAgIEFDUEk6IFJJU0MtVjogQ3JlYXRlIEFQ
TElDIHBsYXRmb3JtIGRldmljZQo+ID4gPiA+ICAgQUNQSTogUklTQy1WOiBDcmVhdGUgUExJQyBw
bGF0Zm9ybSBkZXZpY2UKPiA+ID4gPiAgIGlycWNoaXA6IHJpc2N2LWludGM6IFNldCBBQ1BJIGly
cW1vZGVsCj4gPiA+Cj4gPiA+IEpGWUksIEkgaGF2ZSBubyBjYXBhY2l0eSB0byBwcm92aWRlIGFu
eSBmZWVkYmFjayBvbiB0aGlzIHRpbGwgNi44LXJjMSBpcyBvdXQuCj4gPiA+Cj4gPiBIaSBSYWZh
ZWwsCj4gPgo+ID4gR2VudGxlIHBpbmcuCj4gPgo+ID4gQ291bGQgeW91IHBsZWFzZSBwcm92aWRl
IGZlZWRiYWNrIG9uIHRoZSBzZXJpZXM/IFBhdGNoZXMgNCwgNSwgNiwgNyBhbmQKPiA+IDggYXJl
IGJpdCBjcml0aWNhbCBJTU8uIFNvLCBJIHJlYWxseSBsb29rIGZvcndhcmQgZm9yIHlvdXIgYW5k
IG90aGVyCj4gPiBBQ1BJIGV4cGVydHMhLgo+IAo+IFRoZXJlIHdhcyBxdWl0ZSBhIGJpdCBvZiBk
aXNjdXNzaW9uIG9uIHBhdGNoIFs2LzIxXSBhbmQgaXQgc3RpbGwgc2VlbXMKPiByZWxldmFudCB0
byBtZS4KPiAKPiBBQ1BJIGFjdHVhbGx5IGhhcyBhIHdheSB0byBhdCBsZWFzdCBpbmRpY2F0ZSB3
aGF0IHRoZSBwcm9iZSBvcmRlcmluZwo+IHNob3VsZCBiZSB3aGljaCBpcyBfREVQLgo+IAo+IFRo
ZSBjdXJyZW50IGhhbmRsaW5nIG9mIF9ERVAgaW4gdGhlIGtlcm5lbCBtYXkgbm90IGJlIGNvdmVy
aW5nIHRoaXMKPiBwYXJ0aWN1bGFyIHVzZSBjYXNlLCBidXQgSSB3b3VsZCByYXRoZXIgZXh0ZW5k
IGl0IChpZiBuZWNlc3NhcnkpCj4gaW5zdGVhZCBvZiBkb2luZyBhbGwgb2YgdGhlIC1FUFJPQkVf
REVGRVIgZGFuY2Ugd2hpY2ggc2VlbXMgZnJhZ2lsZSB0bwo+IG1lLgo+IApIaSBSYWZhZWwsCgpB
cHByZWNpYXRlIHlvdXIgaGVscCB0byBsb29rIGF0IHRoZSBwYXRjaGVzLiBUaGFuayB5b3UgdmVy
eSBtdWNoIS4KCkkgYW0gbm90IHZlcnkgc3VyZSB3aGV0aGVyIHlvdSBsb29rZWQgaW50byBwYXRj
aGVzIGluIHRoZSB2MyBvZiB0aGUKc2VyaWVzLiBCZWNhdXNlLCB1bmxpa2UgaW4gdjIsIHYzIGRv
ZXNuJ3QgbmVlZCBjaGFuZ2luZyBhbGwgZHJpdmVycyB0bwpoYW5kbGUgRVBST0JFX0RFRkVSLiBJ
biB2MywgaXQgY3JlYXRlcyBmd19kZXZsaW5rIGZvciB0aGUgZGVwZW5kZW5jeSBhcwpzdWdnZXN0
ZWQgYnkgTWFyYy4gUGxlYXNlIHRha2UgYSBsb29rIGF0IFBBVENIIDQvMTcuCgpGb3IgdGhlIElS
USBkZXBlbmRlbmN5LCBJIHRoaW5rIGFkZGluZyBfREVQIGlzIG5vdCByZXF1aXJlZC4gVGhlCiJF
eHRlbmRlZCBJbnRlcnJ1cHQgRGVzY3JpcHRvciIgc3VwcG9ydHMgUmVzb3VyY2VTb3VyY2UgdG8K
aW5kaWNhdGUgdGhlIGRlcGVuZGVuY3kuIE9yIEdTSSBtYXBwaW5nIGNhbiBpbmRpY2F0ZSB0aGUg
c291cmNlLiBUaGlzIGlzCmFscmVhZHkgaGFuZGxlZCBpbiBhY3BpX2lycV9wYXJzZV9vbmVfY2Io
KS4gUEFUQ0ggNCB1c2VzIHRoaXMKaW5mb3JtYXRpb24gdG8gY3JlYXRlIGxpbmtzIGJldHdlZW4g
cHJvZHVjZXIgYW5kIGNvbnN1bWVyIHNvIHRoYXQgREQKZnJhbWV3b3JrIHByb2JlcyB0aGUgZHJp
dmVyIGluIHRoZSByZXF1aXJlZCBvcmRlci4KCkFzIHlvdSBrbm93LCBQTlAgZGV2aWNlcyBhcmUg
ZW51bWVyYXRlZCBpbiBhIGRpZmZlcmVudCB3YXkuIEkgZG9uJ3Qga25vdwp3aHkgaXQgd2FzIGRv
bmUgbGlrZSB0aGlzLiBCdXQgcG5wYWNwaV9pbml0KCkgaXMgY2FsbGVkIHZpYQpmc19pbml0Y2Fs
bCgpIGFuZCBhY3BpX2Rldl9yZXNvdXJjZV9pbnRlcnJ1cHQoKSBjYWxsZWQgZnJvbQpwbnBhY3Bp
X2FsbG9jYXRlZF9yZXNvdXJjZSgpIGRvZXNuJ3QgaGFuZGxlIHRoZSBSZXNvdXJjZVNvdXJjZQpk
ZXBlbmRlbmN5LiBJdCBjYWNoZXMgdGhlIGluZm9ybWF0aW9uIGluIFBOUCBkYXRhIHN0cnVjdHVy
ZSBhbmQgZXhwZWN0cwp0aGUgSVJRIG1hcHBpbmcgdG8gYmUgYXZhaWxhYmxlLiBFdmVuIGlmIHdl
IGFkZCBzdXBwb3J0IHRvCmhhbmRsZSBleHRlbmRlZCBpbnRlcnJ1cHQgZGVzY3JpcHRvciwgaXQg
aXMgbm90IGdvaW5nIHRvIGhlbHAuIEhlbmNlLCBJCmhhZCB0byBhZGQgUEFUQ0ggNS8xNyBhbmQg
UEFUQ0ggNi8xNy4gQWdhaW4sIHRoZSBjaGFuZ2UgaXMgbWFpbmx5IGluCnBucF9pcnEoKSBub3cg
YW5kIGhlbmNlIGl0IGRvZXNuJ3QgbmVlZCBjaGFuZ2luZyBhbGwgZHJpdmVycy4KClRoYW5rcywK
U3VuaWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
