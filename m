Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7AAC77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 08:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q2du6CtIRnieZAzQstB/5lz1hCom/GtPnepzp+9Fs0s=; b=TJD+xjwgbeMcrq
	usyPeWKhntMvbMQrjUKYZa1W3MnTBJ5NJjD7VsbnPXtmRj+jFC+KsbgL4X6Xvtlxxqky5ibgvI9zk
	NYUcFx1BOSKzGRDfq9SwxsGDKoL26L2yBj11TNuWoJS4LMyPKe7RW0VUS4uhoSSm7jgH+v0Qdz2TH
	EIaDvYtMIZ15FIAP2j/7nGwHZ8FUENDuAPjXP/jaCy6KdZ4+wPj8RF6gdjCMycUlgZHQd7tLmVA81
	XWzYhzNwd+hk07MKBClI4UUQiviwL44JEj1HBz1rJf036+H4j7gQTlTKJNcbZSBqYk3+tvEt50rpi
	Loc0y2JqqliVJt9RX/OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2T3T-001eOQ-38;
	Fri, 26 May 2023 08:44:11 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2T3Q-001eMS-1k
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 08:44:10 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3078cc99232so391743f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 May 2023 01:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685090646; x=1687682646;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d+EoENykicvVhtEx+udnXdT2B4JfjP100xbZZvVxTGI=;
        b=UenbCjy/I9HgH2jdm7xkNf6QaTPRnGD3oJYBWp5gW4oKpljuc7vfgywIdXGGlztlNg
         WBf0GoDaqIVfpEVdwdc5TtB6YVVb0Az0KZa2PFh52MKWCOO7ZOVqX12Fe0P6bEm9nYuD
         7rik9Qe5TOHIQfHDdGe0FR+WPexBQKohZ3LdAXszvji4181FMT+PMnsh75WOkYxHAc6B
         uJXTQ/PBWyvmWnsm4Ii+AX7brHBuF63Bus1NWZyvhiJejHNCZExGzqs9+im3YcQqnE19
         YFt7Yu3IlZpyaIOy/Ks3dLgIR8yXPRN40wjaR9XsNed5xJy67QJFvhrT3y9PYA48il12
         dxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685090646; x=1687682646;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d+EoENykicvVhtEx+udnXdT2B4JfjP100xbZZvVxTGI=;
        b=g/3HpxBIb4tsey+RZI5WSFVYImuXhORqFDohkrWZ2XUmFCIaGOBCjUznA/ic2R4kNp
         0gAyhTTR3sBBX9GkGZkEt+eADvsgqfNdlq051MoUFHelHAdO/I23RrD2eIwtgcXlmbrl
         +5Ox508OqgC5L9N8r+A4e6kCjkPZqtuwP11IdAhOLhSymEGEw3F+FmIlShn9dLa1njH1
         s2tdcz++jtZpikw3CDam9x4wY1xmesmhlN/JA/7nFJOmJBTaaWh3+Ex/Do7vic+kcnbY
         YXxk2AId6xJmzFD+3W0V6+RHL+5jCl9xsbMNyy4otx9iEsG2PaQlUgmArxGdwuZuMzLw
         OIoA==
X-Gm-Message-State: AC+VfDwumn1XKMRFQdsoFg4vFMhOkW6u0Tt/Nfe7d5EOItq+hrG9A511
	jvV3kOhmnfUMTf+nNKgZO4Q0ww==
X-Google-Smtp-Source: ACHHUZ7RVhrzhanSXX26T3aKZBacngzR1xiMWVIi1+n3GAfzb+yNlrKHcOySJ8/US+hibf/xDoZPYg==
X-Received: by 2002:a5d:6291:0:b0:309:e24:57b3 with SMTP id k17-20020a5d6291000000b003090e2457b3mr826087wru.4.1685090646345;
        Fri, 26 May 2023 01:44:06 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id x6-20020a5d6506000000b0030639a86f9dsm4312201wru.51.2023.05.26.01.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 01:44:06 -0700 (PDT)
Date: Fri, 26 May 2023 10:44:05 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <xiaobo55x@gmail.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, maz@kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, David Matlack <dmatlack@google.com>, 
	Ben Gardon <bgardon@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v2 09/11] KVM: riscv: selftests: Make check_supported
 arch specific
Message-ID: <20230526-d8d768a23cd6bdc274bc165c@orel>
References: <cover.1684999824.git.haibo1.xu@intel.com>
 <26dea518fc5e8da51e61db279d175364bfecd009.1684999824.git.haibo1.xu@intel.com>
 <20230525-705ddcbcd43aa63e3fd356c8@orel>
 <CAJve8onF9MFuaVsThFnhjWr6ZomB0Lhr9WXGvMiJDt5vrjeKLg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJve8onF9MFuaVsThFnhjWr6ZomB0Lhr9WXGvMiJDt5vrjeKLg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_014408_584640_0E13833E 
X-CRM114-Status: GOOD (  28.96  )
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

T24gRnJpLCBNYXkgMjYsIDIwMjMgYXQgMDM6NTA6MzJQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6
Cj4gT24gRnJpLCBNYXkgMjYsIDIwMjMgYXQgMTI6NDDigK9BTSBBbmRyZXcgSm9uZXMgPGFqb25l
c0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIE1heSAyNSwgMjAyMyBh
dCAwMzozODozM1BNICswODAwLCBIYWlibyBYdSB3cm90ZToKPiA+ID4gY2hlY2tfc3VwcG9ydGVk
KCkgd2FzIHVzZWQgdG8gdmVyaWZ5IHdoZXRoZXIgYSBmZWF0dXJlL2V4dGVuc2lvbiB3YXMKPiA+
ID4gc3VwcG9ydGVkIGluIGEgZ3Vlc3QgaW4gdGhlIGdldC1yZWctbGlzdCB0ZXN0LiBDdXJyZW50
bHkgdGhpcyBpbmZvCj4gPiA+IGNhbiBiZSByZXRyaWV2ZWQgdGhyb3VnaCB0aGUgS1ZNX0NBUF9B
Uk1fKiBBUEkgaW4gYWFyY2g2NCwgYnV0IGluCj4gPiA+IHJpc2N2LCB0aGlzIGluZm8gd2FzIG9u
bHkgZXhwb3NlZCB0aHJvdWdoIHRoZSBLVk1fR0VUX09ORV9SRUcgb24KPiA+ID4gS1ZNX1JFR19S
SVNDVl9JU0FfRVhUIHBzZXVkbyByZWdpc3RlcnMuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6
IEhhaWJvIFh1IDxoYWlibzEueHVAaW50ZWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gIHRvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2t2bS9nZXQtcmVnLWxpc3QuYyB8IDMyICsrKysrKysrKysrLS0tLS0t
LS0tLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlv
bnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2
bS9nZXQtcmVnLWxpc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9nZXQtcmVnLWxp
c3QuYwo+ID4gPiBpbmRleCBmNmFkNzk5MWE4MTIuLmYxZmMxMTNlOTcxOSAxMDA2NDQKPiA+ID4g
LS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2dldC1yZWctbGlzdC5jCj4gPiA+ICsr
KyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9nZXQtcmVnLWxpc3QuYwo+ID4gPiBAQCAt
OTksNiArOTksMjAgQEAgdm9pZCBfX3dlYWsgcHJpbnRfcmVnKGNvbnN0IGNoYXIgKnByZWZpeCwg
X191NjQgaWQpCj4gPiA+ICB9Cj4gPiA+Cj4gPiA+ICAjaWZkZWYgX19hYXJjaDY0X18KPiA+ID4g
K3N0YXRpYyB2b2lkIGNoZWNrX3N1cHBvcnRlZChzdHJ1Y3QgdmNwdV9yZWdfbGlzdCAqYykKPiA+
ID4gK3sKPiA+ID4gKyAgICAgc3RydWN0IHZjcHVfcmVnX3N1Ymxpc3QgKnM7Cj4gPiA+ICsKPiA+
ID4gKyAgICAgZm9yX2VhY2hfc3VibGlzdChjLCBzKSB7Cj4gPiA+ICsgICAgICAgICAgICAgaWYg
KCFzLT5jYXBhYmlsaXR5KQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4g
Pgo+ID4gSSB3YXMgZ29pbmcgdG8gc2F5IHRoYXQgbWFraW5nIHRoaXMgZnVuY3Rpb24gYWFyY2g2
NCBzaG91bGRuJ3QgYmUKPiA+IG5lY2Vzc2FyeSwgc2luY2UgcmlzY3YgbGVhdmVzIGNhcGFiaWxp
dHkgc2V0IHRvIHplcm8gYW5kIHRoaXMgZnVuY3Rpb24KPiA+IGRvZXNuJ3QgZG8gYW55dGhpbmcs
IGJ1dCB0aGVuIGxvb2tpbmcgYWhlYWQgSSBzZWUgcmlzY3YgaXMgYWJ1c2luZwo+ID4gY2FwYWJp
bGl0eSBieSBwdXR0aW5nIGlzYSBleHRlbnNpb25zIGluIGl0LiBJTU8sIGNhcGFiaWxpdHkgc2hv
dWxkCj4gPiBvbmx5IGJlIHNldCB0byBLVk1fQ0FQXyogdmFsdWVzLiBTaW5jZSByaXNjdiBkb2Vz
bid0IHVzZSBpdCwgdGhlbiBpdAo+ID4gc2hvdWxkIGJlIGxlZnQgemVyby4KPiA+Cj4gPiBJZiB3
ZSdyZSBnb2luZyB0byBhYnVzZSBzb21ldGhpbmcsIHRoZW4gSSdkIHJhdGhlciBhYnVzZSB0aGUg
J2ZlYXR1cmUnCj4gPiBtZW1iZXIsIGJ1dCBzaW5jZSBpdCdzIG9ubHkgYW4gaW50IChub3QgYW4g
dW5zaWduZWQgbG9uZyksIHRoZW4gbGV0J3MKPiA+IGp1c3QgYWRkIGFuICd1bnNpZ25lZCBsb25n
IGV4dGVuc2lvbicgbWVtYmVyLgo+ID4KPiAKPiBHb29kIGlkZWEhCj4gCj4gRm9yIHRoZSBuZXcg
J2V4dGVuc2lvbicgbWVtYmVyIGluIHJpc2N2LCBJIHRoaW5rIGl0cyB1c2UgY2FzZSBzaG91bGQg
YmUKPiBpZGVudGljYWwgdG8gdGhlICdmZWF0dXJlJyBtZW1iZXIgaW4gYWFyY2g2NChLVk1fUklT
Q1ZfSVNBX0VYVF9GCj4gd2FzIHNpbWlsYXIgdG8gS1ZNX0FSTV9WQ1BVX1NWRSk/IElmIHNvLCBJ
IHRoaW5rIHdlIGNhbiBqdXN0IHJldXNlCj4gdGhlICdmZWF0dXJlJyBtZW1iZXIgc2luY2UgdGhl
IGRhdGEgdHlwZSB3YXMgbm90IGEgYmlnIGRlYWwuCgpZb3UncmUgcmlnaHQuIEFuIGludCBpcyBm
aW5lIGZvciB0aGUgaXNhIGV4dGVuc2lvbiBpbmRleCwgd2hpY2ggaXMgYWxsIHdlCm5lZWQgdG8g
cmVwcmVzZW50LgoKVGhhbmtzLApkcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
