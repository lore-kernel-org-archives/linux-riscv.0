Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CC8C27C55
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 18:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hPMmlByYeMBhm0wIkHQnGM74csc6ddI3BBtdRWD7SPY=; b=R8sNq3PRdcz9Th
	mCAdmVzhqjd7K4i0AvQhB4XOYTAPfX+oiyGiSxSuioKTbGVJ/OkTQsGgC+Bky/7r+JDngUol3VCLZ
	tGcLzYKdzh+Dd9LdMajGdKUe0K7RBVXBP5QlRo1FtrXunCRi7ljPlOi19yq9OoKrjxR0gT9V9qq8d
	b+jHLeAn/4KPAvoKPxsfdnLXT9FkMnGWRB7LJp0O4yj/jH5hQknqjOa85y4+SqhgZq1u7hFTJxZcz
	1TQ+IkmnvzfyhE/MxnmYpXBraNLlVvjv05+Ge/zcRpqMUzimr0TIpzlPSJYmWybtTRdhRn+HbI96j
	LeKeExdVE8dsC6DBfBBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGk4P-00000006Bf8-1LXi;
	Mon, 10 Jun 2024 18:48:41 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGk4M-00000006BeV-1sR8
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 18:48:40 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2bfdae7997aso235501a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jun 2024 11:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718045315; x=1718650115; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1zkxMfHh2XP11CPVX//08KVDgqqC8nwRqfn9/6C548=;
        b=A5jh3gmuxxxb+Bgy52zYJRT52Q4AktJAOh9kxZJ+N9dWLc+18WYwB3aMNwVUcPkG7p
         tfCS8Y82deTumHWzW1xaGT5RJwuHgOJbQ57IAOm03fuEZiUol5Z4LJ4uudMhvQUk3qrF
         1T2JjT105uxGVzbb4+RW5gQlWFKpinAsmGSKF6eanw5cqbsYuyhmXwES8JDclUjJp/fc
         VzOCCgxmUAmFkZc309j9HmnZByy2fYaz1nDotoBa2i4QwQjIIqoEi2iYWD9XXU8FN9dj
         ZfRrE+CXanLU3/3wZtmnaMENl30usJ4bhEZqLfcm7/CmfDNTaOpRhlNhDXLY3LhLaHgH
         3usg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718045315; x=1718650115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1zkxMfHh2XP11CPVX//08KVDgqqC8nwRqfn9/6C548=;
        b=h8xYMYWzIo07XdWtQNi5zNJQ47xQF9WzfJK3/AmBzJPgFaya93nVVu9Ab3LIrN0lRp
         6lLk87/ySojqzXXGG5AVW9irhQm76kyXWU53WW7WpAmC0ylYpHDonN0bzoARrKzZoXpD
         cSiwLx2tSRKKLpT14yohE6Hjj5O2yCAKJQzy5ZutLaydHmrEd+3tMHXkF3ML0YzU/BNm
         ooPxRUqkH8HxmK6qu3lNO3zaZVUE6kAlrLQWPQQUJZMpMzvTSJVDDeDYtKvpre0uBvld
         raboGDgmPGs8IXfF7aDUrpVVD/Lq9QY+eoeGPPKIMQNjMIujMm1ABepTzd2sV+4QRe2d
         f6Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWjZb62RLEb9cuNLjZ85Sl9mgiAEO8bZNVxm4UtAbLjTbs5Cc/DwjkegJhT3Z0MwDqCWUJ25ojAImJeDNRi84WV2OuYWjFvmuYsRIGsMtfS
X-Gm-Message-State: AOJu0YzebNcqDaV243cEmxV2mCDJi/Cx8AJnorU+fUV52dEmbMmEXNIy
	qPPg09LaNdVXFaCNEL9XMhMmPk8gEHr3cF4e0Ng0423t4hMPlr0hBlWymRv/CflwM9EOwCKBwZ8
	fwc9x14jofn4HbFBAPztu+eXRAaTM8HREUUECFQ==
X-Google-Smtp-Source: AGHT+IGBy6VZxEdF6cbSLt6ZlKOXJu423/i8aKL4dzbh+nLx8RnrXexnJssaOg3HPDyzDxqJnqu3KJgm5ET48MCaFWo=
X-Received: by 2002:a17:90a:fa01:b0:2c3:792:a649 with SMTP id
 98e67ed59e1d1-2c30792a75amr2976706a91.2.1718045315113; Mon, 10 Jun 2024
 11:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1716578450.git.tjeznach@rivosinc.com> <e18ec8ac169ae7f76e9044c26d0768e6469bad19.1716578450.git.tjeznach@rivosinc.com>
 <CANXhq0p4gERQeROSCSKqxnRZq9-fGfmROGV8JZyqFaenNpnsLA@mail.gmail.com> <20240610174934.GM791043@ziepe.ca>
In-Reply-To: <20240610174934.GM791043@ziepe.ca>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Mon, 10 Jun 2024 11:48:23 -0700
Message-ID: <CAH2o1u4c6ttUWTb1zrc8DScDMuDJJYR-tTHCPYW_3FV4uuQDtA@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] iommu/riscv: Device directory management.
To: Jason Gunthorpe <jgg@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_114838_518620_24EE44E2 
X-CRM114-Status: GOOD (  24.85  )
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
Cc: Zong Li <zong.li@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, Jim Shu <jim.shu@sifive.com>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Vincent Chen <vincent.chen@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdW4gMTAsIDIwMjQgYXQgMTA6NDnigK9BTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6
aWVwZS5jYT4gd3JvdGU6Cj4KPiBPbiBGcmksIE1heSAzMSwgMjAyNCBhdCAwMjoyNToxNVBNICsw
ODAwLCBab25nIExpIHdyb3RlOgo+Cj4gPiA+ICtzdGF0aWMgdm9pZCByaXNjdl9pb21tdV9pb2Rp
cl91cGRhdGUoc3RydWN0IHJpc2N2X2lvbW11X2RldmljZSAqaW9tbXUsCj4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYsIHU2NCBmc2Ms
IHU2NCB0YSkKPiA+ID4gK3sKPiA+ID4gKyAgICAgICBzdHJ1Y3QgaW9tbXVfZndzcGVjICpmd3Nw
ZWMgPSBkZXZfaW9tbXVfZndzcGVjX2dldChkZXYpOwo+ID4gPiArICAgICAgIHN0cnVjdCByaXNj
dl9pb21tdV9kYyAqZGM7Cj4gPiA+ICsgICAgICAgdTY0IHRjOwo+ID4gPiArICAgICAgIGludCBp
Owo+ID4gPiArCj4gPiA+ICsgICAgICAgLyogRGV2aWNlIGNvbnRleHQgaW52YWxpZGF0aW9uIGln
bm9yZWQgZm9yIG5vdy4gKi8KPiA+ID4gKwo+ID4gPiArICAgICAgIC8qCj4gPiA+ICsgICAgICAg
ICogRm9yIGRldmljZSBjb250ZXh0IHdpdGggRENfVENfUERUViA9IDAsIHRyYW5zbGF0aW9uIGF0
dHJpYnV0ZXMgdmFsaWQgYml0Cj4gPiA+ICsgICAgICAgICogaXMgc3RvcmVkIGFzIERDX1RDX1Yg
Yml0IChib3RoIHNoYXJpbmcgdGhlIHNhbWUgbG9jYXRpb24gYXQgQklUKDApKS4KPiA+ID4gKyAg
ICAgICAgKi8KPiA+ID4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgZndzcGVjLT5udW1faWRzOyBp
KyspIHsKPiA+ID4gKyAgICAgICAgICAgICAgIGRjID0gcmlzY3ZfaW9tbXVfZ2V0X2RjKGlvbW11
LCBmd3NwZWMtPmlkc1tpXSk7Cj4gPiA+ICsgICAgICAgICAgICAgICB0YyA9IFJFQURfT05DRShk
Yy0+dGMpOwo+ID4gPiArICAgICAgICAgICAgICAgdGMgfD0gdGEgJiBSSVNDVl9JT01NVV9EQ19U
Q19WOwo+ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgICBXUklURV9PTkNFKGRjLT5mc2MsIGZz
Yyk7Cj4gPiA+ICsgICAgICAgICAgICAgICBXUklURV9PTkNFKGRjLT50YSwgdGEgJiBSSVNDVl9J
T01NVV9QQ19UQV9QU0NJRCk7Cj4gPiA+ICsgICAgICAgICAgICAgICAvKiBVcGRhdGUgZGV2aWNl
IGNvbnRleHQsIHdyaXRlIFRDLlYgYXMgdGhlIGxhc3Qgc3RlcC4gKi8KPiA+ID4gKyAgICAgICAg
ICAgICAgIGRtYV93bWIoKTsKPiA+ID4gKyAgICAgICAgICAgICAgIFdSSVRFX09OQ0UoZGMtPnRj
LCB0Yyk7Cj4gPiA+ICsgICAgICAgfQo+ID4KPiA+IERvZXMgaXQgbWFrZSBzZW5zZSB0byBpbnZh
bGlkYXRlIHRoZSBERFRFIGFmdGVyIHdlIHVwZGF0ZSB0aGUgRERURSBpbgo+ID4gbWVtb3J5PyBU
aGlzIGJlaGF2aW9yIHdpbGwgYWZmZWN0IHRoZSBuZXN0ZWQgSU9NTVUgbWVjaGFuaXNtLiBUaGUg
Vk1NCj4gPiBoYXMgdG8gY2F0Y2ggdGhlIGV2ZW50IG9mIGEgRERURSB1cGRhdGUgZnJvbSB0aGUg
Z3Vlc3QgYW5kIHRoZW4KPiA+IGV2ZW50dWFsbHkgZ28gaW50byB0aGUgaG9zdCBJT01NVSBkcml2
ZXIgdG8gY29uZmlndXJlIHRoZSBJT01NVQo+ID4gaGFyZHdhcmUuCj4KPiBSaWdodCwgdGhpcyBp
cyB3aHkgSSBhc2tlZCBhYm91dCBuZWdhdGl2ZSBjYWNoaW5nLgo+Cj4gVGhlIFZNTXMgYXJlIGEg
cHJpbWUgZXhhbXBsZSBvZiBuZWdhdGl2ZSBjYWNoaW5nLCBpbiBzb21ldGhpbmcgbGlrZQo+IHRo
ZSBTTU1VIGltcGxlbWVudGF0aW9uIHRoZSBWTU0gd2lsbCBjYWNoZSB0aGUgVj0wIFNURSB1bnRp
bCB0aGV5IHNlZQo+IGFuIGludmFsaWRhdGlvbi4KPgo+IERyaXZpbmcgdGhlIFZNTSBzaGFkb3dp
bmcvY2FjaGluZyBlbnRpcmVseSBvZmYgb2YgdGhlIHN0YW5kYXJkCj4gaW52YWxpZGF0aW9uIG1l
Y2hhbmlzbSBpcyBzbyBtdWNoIGJldHRlciB0aGFuIGFueSBvdGhlciBvcHRpb24uCj4KPiBJTUhP
IHlvdSBzaG91bGQgaGF2ZSB0aGUgUklTQ1Ygc3BlYyByZXZpc2VkIHRvIGFsbG93IG5lZ2F0aXZl
IGNhY2hpbmcKPiBpbiBhbnkgaW52YWxpZGF0ZWQgZGF0YSBzdHJ1Y3R1cmUgdG8gcGVybWl0IHRo
ZSB0eXBpY2FsIFZNTSBkZXNpZ24KPiBkcml2ZW4gb2ZmIG9mIHNoYWRvd2luZyB0cmlnZ2VyZWQg
YnkgaW52YWxpZGF0aW9uIGNvbW1hbmRzLgo+Cj4gT25jZSB0aGUgc3BlYyBwZXJtaXRzIG5lZ2F0
aXZlIGNhY2hpbmcgdGhlbiB0aGUgc29mdHdhcmUgd291bGQgaGF2ZSB0bwo+IGludmFsaWRhdGUg
YWZ0ZXIgZ29pbmcgVj0wIC0+IFY9MS4KPgo+IEphc29uCgpBbGxvd2luZyBuZWdhdGl2ZSBjYWNo
ZWluZyBieSB0aGUgc3BlYyAoZS5nLiBmb3IgVk1NIHVzZSBjYXNlcykgYW5kCmRvY3VtZW50aW5n
IHJlcXVpcmVkIGludmFsaWRhdGlvbiBzZXF1ZW5jZXMgd291bGQgZGVmaW5pdGVseSBoZWxwCmhl
cmUuIEknbSBoZXNpdGF0aW5nIGFkZGluZyBJT0RJUi5JTlZBTCB0aGF0IGlzIG5vdCByZXF1aXJl
ZCBieSB0aGUKc3BlYyBbMV0sIGJ1dCB0aGlzIGlzIHNvbWV0aGluZyB0aGF0IGNhbiBiZSBjb250
cm9sbGVkIGJ5IGEKY2FwYWJpbGl0aWVzL2ZlYXR1cmUgYml0IG9uY2UgYWRkZWQgdG8gdGhlIHNw
ZWNpZmljYXRpb24gb3IgYmFzZWQgb24KVklEOkRJRCBvZiB0aGUgZW11bGF0ZWQgUmlzYy1WIElP
TU1VLgoKQW5vdGhlciBvcHRpb24gdG8gY29uc2lkZXIgZm9yIFZNTSBpcyB0byB1dGlsaXplIHRo
ZSBXQVJMIHByb3BlcnR5IG9mCkREVFAsIGFuZCBwcm92aWRlIGZpeGVkIGxvY2F0aW9uIG9mIHRo
ZSBzaW5nbGUgbGV2ZWwgRERUUCwgcG9pbnRpbmcgdG8KTU1JTyByZWdpb24sIHdoZXJlIEREVEUg
dXBkYXRlcyB3aWxsIHJlc3VsdCBpbiB2bW0gZXhpdCAvIGZhdWx0CmhhbmRsZXIuIFRoaXMgd2ls
bCBsaWtlbHkgbm90IGJlIGFzIGVmZmljaWVudCBhcyBJT0RJUi5JTlZBTCBpc3N1ZWQKZm9yIGFu
eSBERFRFIHVwZGF0ZXMuCgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2Evcmlz
Y3YtaW9tbXUvYmxvYi9tYWluL3NyYy9pb21tdV9kYXRhX3N0cnVjdHVyZXMuYWRvYyNjYWNoaW5n
LWluLW1lbW9yeS1kYXRhLXN0cnVjdHVyZXMKCi0gVG9tYXN6CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
