Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8558E69EA2
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 00:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dq3NUkZ13vjw86A3HPcSrxfF0Sp3E40Ab5yfQG3DLiw=; b=vQgTjTaCDO8cWs
	L1cpWOWijGALRw/i84ukD7Tk81JrVFYfsHpKOKp49uMPfo6yOvv58/8mKxVGkDu97Yd9uQG5P9i77
	W5DsvZ9tN5TJ+a7n2ieetlO8jV424FqJxS3Cb0noYFLmR/Qqxolm2RrQ1b+MLOZg7+AKvVOWMOSS1
	GroIeAnDkcD8vOkISXlxdAJIUSBO4Aacn1ggBA7Bftgx2i/779ZDbIeJCkB41YPQzog1S3TmLJdzK
	v5dusRI8I9y4rIi4r15dMfS3xJM6h7ke/TusygPAiBa79tonT7if28XoT5oBZXmIbae0cvEgNdYBI
	HCytk7Q2VJOHPcB/zXgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIGak-00000007mff-0syN;
	Tue, 03 Dec 2024 00:16:39 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIGZj-00000007mYx-1vud
	for linux-riscv@lists.infradead.org;
	Tue, 03 Dec 2024 00:15:37 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ee86a1a92dso1828024a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Dec 2024 16:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733184934; x=1733789734; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+YlV66sEeV5Gi1JEnWTwo3a+A+kAB7BmLzMmDK0RYY=;
        b=gkGcjqHR4VkRBnsMyxSqYOC7ZH0VGErmv1iM1HFeNmAEkRcC3r4WG2HGOTv4mrX1NA
         C879sMM9TIzW3OnfqQW9qI9K/qqItRDqk4uQ+xWuxfkYXhcU7+lgQjSbkDbY+QIl5ocL
         PVTQtpaHlDAnHZENHoNJvCGZf8gZwv14RIxsWTSxbqiIuDzWpc43shmULGP+Z057alrC
         5tP3CEC++CE/onu/X85hxaETsXpH8LyeusqcxCm90UXY0agT7wwa82oxpE2ZBj0Olmf/
         Wc8KwIsrwbC/J2rPEBdj01bgLjBX26RXPgAnceg+8jwUwdHBKbLe/02+hxzmIdZCAKeN
         Dkpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733184934; x=1733789734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+YlV66sEeV5Gi1JEnWTwo3a+A+kAB7BmLzMmDK0RYY=;
        b=j9aSNZbU8cSWUK4Ywjzn7bmlWeuJ+LXxCHIoqxAHRe78P7Zjrdw/0CZDiZ/KcZRHCe
         12BDm1ezPMkRGLsmMsmv+A24JhSqaiLCaUip1UruONQbbKfbDsSHDieT9Vc34VcxMxs4
         rDJh5yqFQctJ2HcLWarrbwazP+LV7jEQNECNbjBRiPEVaOhly9BQ9MRqTey4gWPg6eTZ
         fUOs17H6MEO1jH9tdqAbSgyh2r4egdl5eENw/BxIVWBOBSUfyZafbVmQhadd0uYUo/yW
         g2qeV4q1pGXe4TEZjJMsIJlE39/GVojYhh/DwtnPHg8AGcdHL7wL9KVv2a8nkMo1q4W8
         v5aQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1uxFWfWeyhyrsx2aDp9OOfVcH0InbsFzxMUPdGMPU6OHer48MrWjXPSELAbA+8OAYExHDRNIggTCJ/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YybAyLTo9yEIBIsv7eedBeD/R9dzfugS3oHWIwcAglDr5gFeOQz
	/lIKwBbQw/U5R1aDpBM348ZUmn6yWi3L625tTD2i9xZ1/w+Ukvxit8fd4ZOQ+qnGFq7P8F/Bp7h
	W+zW5KA9/39+uhe090uLl/+Sr4qZW5eHfvuOqDA==
X-Gm-Gg: ASbGncu9XHqXyVRT4eh6gPPdM8uuaQ92il4LZe0Er8767rO10iTwVzeqSW42tTLkU8x
	T5BDkwN9Y5iEazFqofKfYRfrXRvjfnw==
X-Google-Smtp-Source: AGHT+IHkfSZg8nwRSMyT59R8Thc83SJq1L85mjo/aMDSMjUafqwNxe8ioi4sjLMkGcNLINNqRnY9VhmQH6Pl1GzeePc=
X-Received: by 2002:a17:90b:4f4e:b0:2ee:693e:ed7a with SMTP id
 98e67ed59e1d1-2ef012796c8mr807474a91.35.1733184934283; Mon, 02 Dec 2024
 16:15:34 -0800 (PST)
MIME-Version: 1.0
References: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
 <20241119-pmu_event_info-v1-3-a4f9691421f8@rivosinc.com> <e124c532-7a08-4788-843d-345827e35f5f@sifive.com>
In-Reply-To: <e124c532-7a08-4788-843d-345827e35f5f@sifive.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 2 Dec 2024 16:15:23 -0800
Message-ID: <CAHBxVyEwkPUcut0L7K9eewcmhOOidU16WnGRiPiP3D7-OS7HvQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] drivers/perf: riscv: Add raw event v2 support
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_161535_498999_52B5B077 
X-CRM114-Status: GOOD (  26.57  )
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

T24gTW9uLCBEZWMgMiwgMjAyNCBhdCAyOjM34oCvUE0gU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5o
b2xsYW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gSGkgQXRpc2gsCj4KPiBPbiAyMDI0LTExLTE5
IDI6MjkgUE0sIEF0aXNoIFBhdHJhIHdyb3RlOgo+ID4gU0JJIHYzLjAgaW50cm9kdWNlZCBhIG5l
dyByYXcgZXZlbnQgdHlwZSB0aGF0IGFsbG93cyB3aWRlcgo+ID4gbWhwbWV2ZW50WCB3aWR0aCB0
byBiZSBwcm9ncmFtbWVkIHZpYSBDRkdfTUFUQ0guCj4gPgo+ID4gVXNlIHRoZSByYXcgZXZlbnQg
djIgaWYgU0JJIHYzLjAgaXMgYXZhaWxhYmxlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEF0aXNo
IFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9zYmkuaCB8ICA0ICsrKysKPiA+ICBkcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5j
IHwgMTggKysrKysrKysrKysrLS0tLS0tCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRp
b25zKCspLCA2IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+ID4gaW5kZXgg
OWJlMzhiMDVmNGFkLi4zZWU5YmZhNWU3N2MgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3NiaS5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4g
PiBAQCAtMTU5LDcgKzE1OSwxMCBAQCBzdHJ1Y3QgcmlzY3ZfcG11X3NuYXBzaG90X2RhdGEgewo+
ID4KPiA+ICAjZGVmaW5lIFJJU0NWX1BNVV9SQVdfRVZFTlRfTUFTSyBHRU5NQVNLX1VMTCg0Nywg
MCkKPiA+ICAjZGVmaW5lIFJJU0NWX1BNVV9QTEFUX0ZXX0VWRU5UX01BU0sgR0VOTUFTS19VTEwo
NjEsIDApCj4gPiArLyogU0JJIHYzLjAgYWxsb3dzIGV4dGVuZGVkIGhwbWV2ZW50WCB3aWR0aCB2
YWx1ZSAqLwo+ID4gKyNkZWZpbmUgUklTQ1ZfUE1VX1JBV19FVkVOVF9WMl9NQVNLIEdFTk1BU0tf
VUxMKDU1LCAwKQo+ID4gICNkZWZpbmUgUklTQ1ZfUE1VX1JBV19FVkVOVF9JRFggMHgyMDAwMAo+
ID4gKyNkZWZpbmUgUklTQ1ZfUE1VX1JBV19FVkVOVF9WMl9JRFggMHgzMDAwMAo+ID4gICNkZWZp
bmUgUklTQ1ZfUExBVF9GV19FVkVOVCAgMHhGRkZGCj4gPgo+ID4gIC8qKiBHZW5lcmFsIHBtdSBl
dmVudCBjb2RlcyBzcGVjaWZpZWQgaW4gU0JJIFBNVSBleHRlbnNpb24gKi8KPiA+IEBAIC0yMTcs
NiArMjIwLDcgQEAgZW51bSBzYmlfcG11X2V2ZW50X3R5cGUgewo+ID4gICAgICAgU0JJX1BNVV9F
VkVOVF9UWVBFX0hXID0gMHgwLAo+ID4gICAgICAgU0JJX1BNVV9FVkVOVF9UWVBFX0NBQ0hFID0g
MHgxLAo+ID4gICAgICAgU0JJX1BNVV9FVkVOVF9UWVBFX1JBVyA9IDB4MiwKPiA+ICsgICAgIFNC
SV9QTVVfRVZFTlRfVFlQRV9SQVdfVjIgPSAweDMsCj4gPiAgICAgICBTQklfUE1VX0VWRU5UX1RZ
UEVfRlcgPSAweGYsCj4gPiAgfTsKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wZXJmL3Jp
c2N2X3BtdV9zYmkuYyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiA+IGluZGV4IDUw
Y2JkYmY2NmJiNy4uZjBlODQ1ZmY2Yjc5IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9wZXJmL3Jp
c2N2X3BtdV9zYmkuYwo+ID4gKysrIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+ID4g
QEAgLTU5LDcgKzU5LDcgQEAgYXNtIHZvbGF0aWxlKEFMVEVSTkFUSVZFKCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAgI2RlZmluZSBQRVJGX0VWRU5UX0ZM
QUdfVVNFUl9BQ0NFU1MgIEJJVChTWVNDVExfVVNFUl9BQ0NFU1MpCj4gPiAgI2RlZmluZSBQRVJG
X0VWRU5UX0ZMQUdfTEVHQUNZICAgICAgICAgICAgICAgQklUKFNZU0NUTF9MRUdBQ1kpCj4gPgo+
ID4gLVBNVV9GT1JNQVRfQVRUUihldmVudCwgImNvbmZpZzowLTQ3Iik7Cj4gPiArUE1VX0ZPUk1B
VF9BVFRSKGV2ZW50LCAiY29uZmlnOjAtNTUiKTsKPiA+ICBQTVVfRk9STUFUX0FUVFIoZmlybXdh
cmUsICJjb25maWc6NjItNjMiKTsKPiA+Cj4gPiAgc3RhdGljIGJvb2wgc2JpX3YyX2F2YWlsYWJs
ZTsKPiA+IEBAIC01MjcsMTggKzUyNywyNCBAQCBzdGF0aWMgaW50IHBtdV9zYmlfZXZlbnRfbWFw
KHN0cnVjdCBwZXJmX2V2ZW50ICpldmVudCwgdTY0ICplY29uZmlnKQo+ID4gICAgICAgICAgICAg
ICBicmVhazsKPiA+ICAgICAgIGNhc2UgUEVSRl9UWVBFX1JBVzoKPiA+ICAgICAgICAgICAgICAg
LyoKPiA+IC0gICAgICAgICAgICAgICogQXMgcGVyIFNCSSBzcGVjaWZpY2F0aW9uLCB0aGUgdXBw
ZXIgMTYgYml0cyBtdXN0IGJlIHVudXNlZAo+ID4gLSAgICAgICAgICAgICAgKiBmb3IgYSBoYXJk
d2FyZSByYXcgZXZlbnQuCj4gPiArICAgICAgICAgICAgICAqIEFzIHBlciBTQkkgdjAuMyBzcGVj
aWZpY2F0aW9uLAo+ID4gKyAgICAgICAgICAgICAgKiAgLS0gdGhlIHVwcGVyIDE2IGJpdHMgbXVz
dCBiZSB1bnVzZWQgZm9yIGEgaGFyZHdhcmUgcmF3IGV2ZW50Lgo+ID4gKyAgICAgICAgICAgICAg
KiBBcyBwZXIgU0JJIHYzLjAgc3BlY2lmaWNhdGlvbiwKPiA+ICsgICAgICAgICAgICAgICogIC0t
IHRoZSB1cHBlciA4IGJpdHMgbXVzdCBiZSB1bnVzZWQgZm9yIGEgaGFyZHdhcmUgcmF3IGV2ZW50
Lgo+ID4gICAgICAgICAgICAgICAgKiBCaXRzIDYzOjYyIGFyZSB1c2VkIHRvIGRpc3Rpbmd1aXNo
IGJldHdlZW4gcmF3IGV2ZW50cwo+ID4gICAgICAgICAgICAgICAgKiAwMCAtIEhhcmR3YXJlIHJh
dyBldmVudAo+ID4gICAgICAgICAgICAgICAgKiAxMCAtIFNCSSBmaXJtd2FyZSBldmVudHMKPiA+
ICAgICAgICAgICAgICAgICogMTEgLSBSaXNjLVYgcGxhdGZvcm0gc3BlY2lmaWMgZmlybXdhcmUg
ZXZlbnQKPiA+ICAgICAgICAgICAgICAgICovCj4gPiAtCj4gPiAgICAgICAgICAgICAgIHN3aXRj
aCAoY29uZmlnID4+IDYyKSB7Cj4gPiAgICAgICAgICAgICAgIGNhc2UgMDoKPiA+IC0gICAgICAg
ICAgICAgICAgICAgICByZXQgPSBSSVNDVl9QTVVfUkFXX0VWRU5UX0lEWDsKPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAqZWNvbmZpZyA9IGNvbmZpZyAmIFJJU0NWX1BNVV9SQVdfRVZFTlRfTUFT
SzsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBpZiAoc2JpX3YzX2F2YWlsYWJsZSkgewo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKmVjb25maWcgPSBjb25maWcgJiBSSVNDVl9Q
TVVfUkFXX0VWRU5UX1YyX01BU0s7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBy
ZXQgPSBSSVNDVl9QTVVfUkFXX0VWRU5UX1YyX0lEWDsKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICB9IGVsc2Ugewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKmVjb25maWcgPSBj
b25maWcgJiBSSVNDVl9QTVVfUkFXX0VWRU5UX01BU0s7Cj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZXQgPSBSSVNDVl9QTVVfUkFXX0VWRU5UX0lEWDsKPgo+IFNob3VsZG4ndCB3
ZSBjaGVjayB0byBzZWUgaWYgYW55IG9mIGJpdHMgNDgtNTUgYXJlIHNldCBhbmQgcmV0dXJuIGFu
IGVycm9yLAo+IGluc3RlYWQgb2Ygc2lsZW50bHkgcmVxdWVzdGluZyB0aGUgd3JvbmcgZXZlbnQ/
Cj4KCldlIGNhbi4gSSBkaWQgbm90IGFkZCBpdCBvcmlnaW5hbGx5IGFzIHdlIGNhbid0IGRvIG11
Y2ggdmFsaWRhdGlvbiBmb3IKdGhlIHJhdyBldmVudHMgZm9yIGFueXdheXMuCklmIHRoZSBlbmNv
ZGluZyBpcyBub3Qgc3VwcG9ydGVkIHRoZSB1c2VyIHdpbGwgZ2V0IHRoZSBlcnJvciBhbnl3YXlz
CmFzIGl0IGNhbid0IGZpbmQgYSBjb3VudGVyLgpXZSB3aWxsIGp1c3Qgc2F2ZSAxIFNCSSBjYWxs
IGlmIHRoZSBrZXJuZWwgZG9lc24ndCBhbGxvdyByZXF1ZXN0aW5nIGFuCmV2ZW50IGlmIGJpdHMg
NDgtNTUgYXJlIHNldC4KCj4gUmVnYXJkcywKPiBTYW11ZWwKPgo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIH0KPiA+ICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+ICAgICAgICAgICAg
ICAgY2FzZSAyOgo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJldCA9IChjb25maWcgJiAweEZG
RkYpIHwgKFNCSV9QTVVfRVZFTlRfVFlQRV9GVyA8PCAxNik7Cj4gPgo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
