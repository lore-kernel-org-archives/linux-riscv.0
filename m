Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6C0CDB474
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 11:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HiAy55GnKM60EWNUV7WBPMeGRAElPyGRgDfolKdVSg4=; b=BqN4/tajVSGlgw
	58Yh+XJnMQEb+jxZPvz427VSCOSYY/zekn5pFnoqU8hBqrc719urqVSrhuYKr4jIs3WgwnVxqJLSv
	vAufV71xvIgUlsEzckR2uZKezuGex9JTk1v/MbErx0xYsuMGc/h4AeqlR6SMGmDXHm70070bOnfxM
	/kHKFd/Zl8RkrPwe/HNcznnbz+skwg/OVjJuh4zW3ItugLTnZjbB8kvz9twh8L1R0Fu1PS9LIrVFE
	Hpo70vmwVUQHir8KHupJyggX5fsL5mSBGGsd5iSbEAdSgTLVNhoRrwr6mwOLjp2iyZqagyVY/nxyD
	D4jrVWrx9bA5iplaTIkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtnSA-00279F-24;
	Fri, 20 Oct 2023 11:14:06 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtnS7-00278D-0n
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 11:14:05 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-351437112c1so2536275ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 20 Oct 2023 04:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1697800441; x=1698405241; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Ui4lAScxS4avp7oCJ7ZH8jd7TnRHOi5lmcUoRRDmRE=;
        b=A+bC1zEjVAHom3tXoaC1SdWiF26hkSZW+hpNwAeKD4MBkLpualRH7mZ1ytgwoCiX4z
         Q+LzNLfq9IagIViXCQMiu48KOefOgRvRJUb7c1Qp9cB4Oku9aNOemNdM80vHUZm45S9E
         foPW4ic3K8SderD1BHWyVeYZ1RQg+Tvy/Qx6mltRBVDZIJzpuV2HTpVFm5bjCAIm0bK0
         F9Ivxl+FRRkpk5MDb+kkfrPwofYWFqTXFrBVO5uvCzgRQsuHMuXCtPMEsiG5hwQyaGxj
         mYo5PSTbi0ChXElhXSLpifafMBt/cqfCMaqkDVJYr7oizVJfur/0MpvEAMvReTFkB933
         vm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697800441; x=1698405241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Ui4lAScxS4avp7oCJ7ZH8jd7TnRHOi5lmcUoRRDmRE=;
        b=TSAYoOecf6JYC5XzSYfZ+er7vGlEu56bO+3D7U4/bwYMzSxIUO+bX/prLo6+rFbkLZ
         hjhqWJG3BkT/QL16tHqQTKBPDqkMRFz0jKbjTzgLEAntn8reb4okpEf8UF79J/syCg1/
         mUeDpm4bc+OgZe6qPB3Rsl5XWNfIuSHER3IqlzGbaRzJJz8ZU/By9yIkzHA2ubvYVrCo
         xtfCqUJSvz7V39k4sYM9IgAbYlzy4RhsEOWZTn7T48yuhpVIireh9Dz6U+rTco8wXsFa
         poa64hgUkoZKOFdRNzEUe6iozoMTrKIyn6bJwVyT13MSyFJ7u7nTL+76z6AApWa8YIsr
         i5xQ==
X-Gm-Message-State: AOJu0Yyed8q/3FnghJ39jdcnlNOgBPDEGd7XoQofOTbwcdImxKiYfLda
	6mNYN8HCgLiqDrKgXaZn6e16O3f1B8upOWn1DECpOQ==
X-Google-Smtp-Source: AGHT+IEitVBts/lHHu15Qiuy69Q0OAhUE5hrFg148JtL4A9RHhcapJhDM1ssRdMIbsrFJ9GgKO6swmiB+E5FvbTcRNA=
X-Received: by 2002:a05:6e02:147:b0:357:5234:802d with SMTP id
 j7-20020a056e02014700b003575234802dmr1903255ilr.10.1697800441567; Fri, 20 Oct
 2023 04:14:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231020072140.900967-1-apatel@ventanamicro.com>
In-Reply-To: <20231020072140.900967-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 20 Oct 2023 16:43:49 +0530
Message-ID: <CAAhSdy2Ncc4+fvjrWHGZuHKB8jFtd1WkRhPifiTEfftpyEY7+w@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] RISC-V SBI debug console extension support
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_041403_597048_F2BBB2DE 
X-CRM114-Status: GOOD (  21.27  )
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

T24gRnJpLCBPY3QgMjAsIDIwMjMgYXQgMTI6NTHigK9QTSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBUaGUgU0JJIHYyLjAgc3BlY2lmaWNhdGlvbiBpcyBu
b3cgZnJvemVuLiBUaGUgU0JJIHYyLjAgc3BlY2lmaWNhdGlvbiBkZWZpbmVzCj4gU0JJIGRlYnVn
IGNvbnNvbGUgKERCQ04pIGV4dGVuc2lvbiB3aGljaCByZXBsYWNlcyB0aGUgbGVnYWN5IFNCSSB2
MC4xCj4gZnVuY3Rpb25zIHNiaV9jb25zb2xlX3B1dGNoYXIoKSBhbmQgc2JpX2NvbnNvbGVfZ2V0
Y2hhcigpLgo+IChSZWZlciB2Mi4wLXJjNSBhdCBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9u
LWlzYS9yaXNjdi1zYmktZG9jL3JlbGVhc2VzKQo+Cj4gVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0
IGZvciBTQkkgZGVidWcgY29uc29sZSAoREJDTikgZXh0ZW5zaW9uIGluIEtWTSBSSVNDLVYKPiBh
bmQgTGludXggUklTQy1WLgo+Cj4gVG8gdHJ5IHRoZXNlIHBhdGNoZXMgd2l0aCBLVk0gUklTQy1W
LCB1c2UgS1ZNVE9PTCBmcm9tIHJpc2N2X3NiaV9kYmNuX3YxCj4gYnJhbmNoIGF0OiBodHRwczov
L2dpdGh1Yi5jb20vYXZwYXRlbC9rdm10b29sLmdpdAo+Cj4gVGhlc2UgcGF0Y2hlcyBjYW4gYWxz
byBiZSBmb3VuZCBpbiB0aGUgcmlzY3Zfc2JpX2RiY25fdjMgYnJhbmNoIGF0Ogo+IGh0dHBzOi8v
Z2l0aHViLmNvbS9hdnBhdGVsL2xpbnV4LmdpdAo+Cj4gQ2hhbmdlcyBzaW5jZSB2MjoKPiAgLSBS
ZWJhc2VkIG9uIExpbnV4LTYuNi1yYzUKPiAgLSBIYW5kbGVkIHBhZ2UtY3Jvc3NpbmcgaW4gUEFU
Q0g3IG9mIHYyIHNlcmllcwo+ICAtIEFkZHJlc3NlZCBEcmV3J3MgY29tbWVudCBpbiBQQVRDSDMg
b2YgdjIgc2VyaWVzCj4gIC0gQWRkZWQgbmV3IFBBVENINSB0byBtYWtlIGdldC1yZWctbGlzdCB0
ZXN0IGF3YXJlIG9mIFNCSSBEQkNOIGV4dGVuc2lvbgo+Cj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAg
LSBSZW1vdmUgdXNlIG9mICNpZmRlZiBmcm9tIFBBVENINCBhbmQgUEFUQ0g1IG9mIHRoZSB2MSBz
ZXJpZXMKPiAgLSBJbXByb3ZlZCBjb21taXQgZGVzY3JpcHRpb24gb2YgUEFUQ0gzIGluIHYxIHNl
cmllcwo+ICAtIEludHJvZHVjZWQgbmV3IFBBVENIMyBpbiB0aGlzIHNlcmllcyB0byBhbGxvdyBz
b21lIFNCSSBleHRlbnNpb25zCj4gICAgKHN1Y2ggYXMgU0JJIERCQ04pIGRvIHRvIGRpc2FibGVk
IGJ5IGRlZmF1bHQgc28gdGhhdCBvbGRlciBLVk0gdXNlciBzcGFjZQo+ICAgIHdvcmsgZmluZSBh
bmQgbmV3ZXIgS1ZNIHVzZXIgc3BhY2UgaGF2ZSB0byBleHBsaWNpdGx5IG9wdC1pbiBmb3IgZW11
bGF0aW5nCj4gICAgU0JJIERCQ04uCj4gIC0gSW50cm9kdWNlZCBuZXcgUEFUQ0g1IGluIHRoaXMg
c2VyaWVzIHdoaWNoIGFkZHMgaW5saW5lIHZlcnNpb24gb2YKPiAgICBzYmlfY29uc29sZV9nZXRj
aGFyKCkgYW5kIHNiaV9jb25zb2xlX3B1dGNoYXIoKSBmb3IgdGhlIGNhc2Ugd2hlcmUKPiAgICBD
T05GSUdfUklTQ1ZfU0JJX1YwMSBpcyBkaXNhYmxlZC4KPgo+IEFudXAgUGF0ZWwgKDgpOgo+ICAg
UklTQy1WOiBBZGQgZGVmaW5lcyBmb3IgU0JJIGRlYnVnIGNvbnNvbGUgZXh0ZW5zaW9uCj4gICBS
SVNDLVY6IEtWTTogQ2hhbmdlIHRoZSBTQkkgc3BlY2lmaWNhdGlvbiB2ZXJzaW9uIHRvIHYyLjAK
PiAgIFJJU0MtVjogS1ZNOiBBbGxvdyBzb21lIFNCSSBleHRlbnNpb25zIHRvIGJlIGRpc2FibGVk
IGJ5IGRlZmF1bHQKPiAgIFJJU0MtVjogS1ZNOiBGb3J3YXJkIFNCSSBEQkNOIGV4dGVuc2lvbiB0
byB1c2VyLXNwYWNlCj4gICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCBTQkkgREJDTiBleHRl
bnNpb24gdG8gZ2V0LXJlZy1saXN0IHRlc3QKPiAgIFJJU0MtVjogQWRkIHN0dWJzIGZvciBzYmlf
Y29uc29sZV9wdXRjaGFyL2dldGNoYXIoKQo+ICAgdHR5L3NlcmlhbDogQWRkIFJJU0MtViBTQkkg
ZGVidWcgY29uc29sZSBiYXNlZCBlYXJseWNvbgo+ICAgUklTQy1WOiBFbmFibGUgU0JJIGJhc2Vk
IGVhcmx5Y29uIHN1cHBvcnQKPgo+IEF0aXNoIFBhdHJhICgxKToKPiAgIHR0eTogQWRkIFNCSSBk
ZWJ1ZyBjb25zb2xlIHN1cHBvcnQgdG8gSFZDIFNCSSBkcml2ZXIKClF1ZXVlZCBQQVRDSDEgdG8g
UEFUQ0g1IGZvciBMaW51eC02LjcKClJlbWFpbmluZyBQQVRDSDYgdG8gUEFUQ0g5IGFyZSBzdGls
bCB1bmRlciByZXZpZXcuCgpUaGFua3MsCkFudXAKCj4KPiAgYXJjaC9yaXNjdi9jb25maWdzL2Rl
ZmNvbmZpZyAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBhcmNoL3Jpc2N2L2NvbmZpZ3MvcnYz
Ml9kZWZjb25maWcgICAgICAgICAgICAgfCAgMSArCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
a3ZtX3ZjcHVfc2JpLmggICAgICAgICB8ICA3ICstCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
c2JpLmggICAgICAgICAgICAgICAgICB8IDEyICsrKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20va3ZtLmggICAgICAgICAgICAgfCAgMSArCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICA2ICsrCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2Jp
LmMgICAgICAgICAgICAgICAgICAgICB8IDYxICsrKysrKystLS0tLS0tCj4gIGFyY2gvcmlzY3Yv
a3ZtL3ZjcHVfc2JpX3JlcGxhY2UuYyAgICAgICAgICAgICB8IDMyICsrKysrKysrCj4gIGRyaXZl
cnMvdHR5L2h2Yy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZl
cnMvdHR5L2h2Yy9odmNfcmlzY3Zfc2JpLmMgICAgICAgICAgICAgICB8IDgyICsrKysrKysrKysr
KysrKysrLS0KPiAgZHJpdmVycy90dHkvc2VyaWFsL0tjb25maWcgICAgICAgICAgICAgICAgICAg
IHwgIDIgKy0KPiAgZHJpdmVycy90dHkvc2VyaWFsL2Vhcmx5Y29uLXJpc2N2LXNiaS5jICAgICAg
IHwgMzIgKysrKysrKy0KPiAgLi4uL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMg
ICAgICAgIHwgIDIgKwo+ICAxMyBmaWxlcyBjaGFuZ2VkLCAxOTggaW5zZXJ0aW9ucygrKSwgNDMg
ZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuMzQuMQo+Cj4KPiAtLQo+IGt2bS1yaXNjdiBtYWlsaW5n
IGxpc3QKPiBrdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
