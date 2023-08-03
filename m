Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C17BEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 03:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ctj6ZQ2W9yYrRpkVjb/7dp1agb459bPsr038kAEbbg=; b=S2pq+B7f7S9FKl
	Wy7NvTm1XEFzhaw0QWjdbJutxf/l50mqghB1/O9Zak+qBACTiXDO0OOE+3l0r650J12fvCnI4GO9B
	X7HUojhiMhtXRz73blTuceNoau7WShq/Hf+uP/aya7u1CxwzUEW0ulph1r4tVPX672zvvmggWC3kg
	mWVhIv8k8Hj4+gJy7YQZIcFB3opyVl83mZ/Q90XYvG04FFpdT5TPVu4QTjFwt36jnhI3NqwyQe0e8
	7nWezPNSmT8LjSHhm9uLdXNMXm1eKcLQ5LE3Q5ls37MKBfnyJio0MIG4zkkbxK5y1RKJESZMCUJLJ
	zICRtdCHW/UgnPa2XYFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRP9Y-006ZHa-2Z;
	Thu, 03 Aug 2023 03:37:32 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRP9W-006ZGo-0C
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 03:37:31 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-790a590237aso18122639f.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 20:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1691033847; x=1691638647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XezimV1as/cKuTMyLJfYIpzABwFXYSrbRVNfnuICdU=;
        b=giOWK51Dhn9vReA6OJfd8zvKnuve/uokt8ax23zbCVAwmmR36s9yVrixUyaVE4JA7D
         oWS+jn9gNn+g8OAAVMQNVW+gzShA5OHjUhoJhM7ZkkoKfPI8kT643pso7Dn7dXLQ0fD8
         MtD+unY09yWthQYKv4JKiELGU9AbHbs7CIQJUeYXurtQyg3KeSegehAPAiIjicbya9Wu
         btmRsfa0OtDeg99VO+jVo3Cp2FbYCph1ACEm7RB+66jKoVJzhqe0itR5GEp/LrE9Vqzy
         ccuMlaOKScPTnpuspxvUA/6DSzjmypFuCndoiTNyhItlnwGtVoz7lisoyGaokTQLk79b
         PaqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691033847; x=1691638647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5XezimV1as/cKuTMyLJfYIpzABwFXYSrbRVNfnuICdU=;
        b=Miup6Wq+6L7GlV2alap+EfTL5cfpC2YbhXCM2ovDr0Yo+EyhIEob7Yo28t8pm3Vq4E
         GgHzk8J5eWKtTzBR7t8aG/xqm7h8MIrOphCYXNux9I3XFpAV0/ywmERj6LH25PydYJKp
         CfdRJ6ZF46ZnnV4TKjJCfGQ9FvjO3DdYmk1LB7gAMWQOc2p45DfOt+LytqAPnho33n4m
         m+8XXqEy/F6EuNHzVD49fxoVVzTm3Toyu+lk+xXU7EhYXU61s+PtHK8wlq+qIYmlh++d
         0oq5biMhETIAqkDuBaDrLXDBEcmhSq6DFbZ9ycH61G9gozUETD8v44ZxjJqwFkFG12Mk
         EwoA==
X-Gm-Message-State: ABy/qLZV32yFafEG8hbm8lqEBbvr9sQkDgybO4z3idv8gPTmMsPnbzww
	8LyO4UWti3vUcrCPLQSb6gtqaZ7t8Ti8iL1E5qM8Zw==
X-Google-Smtp-Source: APBJJlE6OdMliq0SpqBmWgqkyB7p9epCcw1sbOElJJhGiT0YKv5ld0XCAhfkil/SqKM9pPRldnE9PG5yRhHEvF45DOI=
X-Received: by 2002:a05:6e02:2163:b0:345:dcc1:a1c4 with SMTP id
 s3-20020a056e02216300b00345dcc1a1c4mr18872255ilv.4.1691033847682; Wed, 02 Aug
 2023 20:37:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689792825.git.tjeznach@rivosinc.com> <c33c24036c06c023947ecb47177da273569b3ac7.1689792825.git.tjeznach@rivosinc.com>
 <CANXhq0qRYvTffMnep-aQyTq2tMxbP-s_Lunc+cZ2Rio+BvAE=g@mail.gmail.com> <CAH2o1u5Sr0XigUbhna0E-Zk=U76CLZZ4LbM0u4ahPaN5+nOK6A@mail.gmail.com>
In-Reply-To: <CAH2o1u5Sr0XigUbhna0E-Zk=U76CLZZ4LbM0u4ahPaN5+nOK6A@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 3 Aug 2023 11:37:16 +0800
Message-ID: <CANXhq0o5898J=U5XmKbmO4wLq5VkKHVaSwzzcixUqGkkFddhWw@mail.gmail.com>
Subject: Re: [PATCH 01/11] RISC-V: drivers/iommu: Add RISC-V IOMMU - Ziommu support.
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, 
	linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_203730_154937_CC1C651C 
X-CRM114-Status: GOOD (  21.45  )
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

T24gVGh1LCBBdWcgMywgMjAyMyBhdCA0OjE14oCvQU0gVG9tYXN6IEplem5hY2ggPHRqZXpuYWNo
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEp1bCAyNywgMjAyMyBhdCA3OjQy4oCv
UE0gWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIEp1
bCAyMCwgMjAyMyBhdCAzOjM04oCvQU0gVG9tYXN6IEplem5hY2ggPHRqZXpuYWNoQHJpdm9zaW5j
LmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+ICtzdGF0aWMgaW50IHJpc2N2X2lvbW11X3BsYXRmb3Jt
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiA+ICt7Cj4gPiA+ICsgICAg
ICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPiA+ID4gKyAgICAgICBzdHJ1Y3Qg
cmlzY3ZfaW9tbXVfZGV2aWNlICppb21tdSA9IE5VTEw7Cj4gPiA+ICsgICAgICAgc3RydWN0IHJl
c291cmNlICpyZXMgPSBOVUxMOwo+ID4gPiArICAgICAgIGludCByZXQgPSAwOwo+ID4gPiArCj4g
PiA+ICsgICAgICAgaW9tbXUgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmlvbW11KSwgR0ZQ
X0tFUk5FTCk7Cj4gPiA+ICsgICAgICAgaWYgKCFpb21tdSkKPiA+ID4gKyAgICAgICAgICAgICAg
IHJldHVybiAtRU5PTUVNOwo+ID4gPiArCj4gPiA+ICsgICAgICAgaW9tbXUtPmRldiA9IGRldjsK
PiA+ID4gKyAgICAgICBkZXZfc2V0X2RydmRhdGEoZGV2LCBpb21tdSk7Cj4gPiA+ICsKPiA+ID4g
KyAgICAgICByZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9NRU0s
IDApOwo+ID4gPiArICAgICAgIGlmICghcmVzKSB7Cj4gPiA+ICsgICAgICAgICAgICAgICBkZXZf
ZXJyKGRldiwgImNvdWxkIG5vdCBmaW5kIHJlc291cmNlIGZvciByZWdpc3RlciByZWdpb25cbiIp
Owo+ID4gPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiA+ICsgICAgICAgfQo+
ID4gPiArCj4gPiA+ICsgICAgICAgaW9tbXUtPnJlZyA9IGRldm1fcGxhdGZvcm1fZ2V0X2FuZF9p
b3JlbWFwX3Jlc291cmNlKHBkZXYsIDAsICZyZXMpOwo+ID4gPiArICAgICAgIGlmIChJU19FUlIo
aW9tbXUtPnJlZykpIHsKPiA+ID4gKyAgICAgICAgICAgICAgIHJldCA9IGRldl9lcnJfcHJvYmUo
ZGV2LCBQVFJfRVJSKGlvbW11LT5yZWcpLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAiY291bGQgbm90IG1hcCByZWdpc3RlciByZWdpb25cbiIpOwo+ID4gPiArICAg
ICAgICAgICAgICAgZ290byBmYWlsOwo+ID4gPiArICAgICAgIH07Cj4gPiA+ICsKPiA+ID4gKyAg
ICAgICBpb21tdS0+cmVnX3BoeXMgPSByZXMtPnN0YXJ0Owo+ID4gPiArCj4gPiA+ICsgICAgICAg
cmV0ID0gLUVOT0RFVjsKPiA+ID4gKwo+ID4gPiArICAgICAgIC8qIFNhbml0eSBjaGVjazogRGlk
IHdlIGdldCB0aGUgd2hvbGUgcmVnaXN0ZXIgc3BhY2UgPyAqLwo+ID4gPiArICAgICAgIGlmICgo
cmVzLT5lbmQgLSByZXMtPnN0YXJ0ICsgMSkgPCBSSVNDVl9JT01NVV9SRUdfU0laRSkgewo+ID4g
PiArICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJkZXZpY2UgcmVnaW9uIHNtYWxsZXIgdGhh
biByZWdpc3RlciBmaWxlICgweCVsbHgpXG4iLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
ICByZXMtPmVuZCAtIHJlcy0+c3RhcnQpOwo+ID4gPiArICAgICAgICAgICAgICAgZ290byBmYWls
Owo+ID4gPiArICAgICAgIH0KPiA+Cj4gPiBDb3VsZCB3ZSBhc3N1bWUgdGhhdCBEVCBzaG91bGQg
YmUgcmVzcG9uc2libGUgZm9yIHNwZWNpZnlpbmcgdGhlIHJpZ2h0IHNpemU/Cj4gPgo+Cj4gVGhp
cyBvbmx5IHRvIHZhbGlkYXRlIERUIHByb3ZpZGVkIGluZm8gYW5kIGRyaXZlciBleHBlY3RlZCBy
ZWdpc3Rlcgo+IGZpbGUgc2l6ZS4gRXhwZWN0YXRpb24gaXMgdGhhdCBEVCB3aWxsIHByb3ZpZGUg
cmlnaHQgc2l6ZS4KPgo+Cj4gPiA+ICtzdGF0aWMgc3RydWN0IGlvbW11X2RvbWFpbiAqcmlzY3Zf
aW9tbXVfZG9tYWluX2FsbG9jKHVuc2lnbmVkIHR5cGUpCj4gPiA+ICt7Cj4gPiA+ICsgICAgICAg
c3RydWN0IHJpc2N2X2lvbW11X2RvbWFpbiAqZG9tYWluOwo+ID4gPiArCj4gPiA+ICsgICAgICAg
aWYgKHR5cGUgIT0gSU9NTVVfRE9NQUlOX0lERU5USVRZICYmCj4gPiA+ICsgICAgICAgICAgIHR5
cGUgIT0gSU9NTVVfRE9NQUlOX0JMT0NLRUQpCj4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4g
TlVMTDsKPiA+ID4gKwo+ID4gPiArICAgICAgIGRvbWFpbiA9IGt6YWxsb2Moc2l6ZW9mKCpkb21h
aW4pLCBHRlBfS0VSTkVMKTsKPiA+ID4gKyAgICAgICBpZiAoIWRvbWFpbikKPiA+ID4gKyAgICAg
ICAgICAgICAgIHJldHVybiBOVUxMOwo+ID4gPiArCj4gPiA+ICsgICAgICAgbXV0ZXhfaW5pdCgm
ZG9tYWluLT5sb2NrKTsKPiA+ID4gKyAgICAgICBJTklUX0xJU1RfSEVBRCgmZG9tYWluLT5lbmRw
b2ludHMpOwo+ID4gPiArCj4gPiA+ICsgICAgICAgZG9tYWluLT5kb21haW4ub3BzID0gJnJpc2N2
X2lvbW11X2RvbWFpbl9vcHM7Cj4gPiA+ICsgICAgICAgZG9tYWluLT5tb2RlID0gUklTQ1ZfSU9N
TVVfRENfRlNDX01PREVfQkFSRTsKPiA+ID4gKyAgICAgICBkb21haW4tPnBzY2lkID0gaWRhX2Fs
bG9jX3JhbmdlKCZyaXNjdl9pb21tdV9wc2NpZHMsIDEsCj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBSSVNDVl9JT01NVV9NQVhfUFNDSUQsIEdGUF9LRVJORUwp
Owo+ID4gPiArCj4gPiA+ICsgICAgICAgcHJpbnRrKCJkb21haW4gdHlwZSAleCBhbGxvYyAldVxu
IiwgdHlwZSwgZG9tYWluLT5wc2NpZCk7Cj4gPiA+ICsKPiA+Cj4gPiBDb3VsZCBpdCB1c2VzIHBy
X3h4eCBpbnN0ZWFkIG9mIHByaW50az8KPiA+Cj4KPiBBYnNvbHV0ZWx5LCBmaXhlZCBoZXJlIGFu
ZCBlbHNld2hlcmUuIEFsc28sIHVzZWQgZGV2X2RiZyB3aGVyZXZlciBhcHBsaWNhYmxlLgo+Cj4g
PiA+ICsKPiA+ID4gK3N0YXRpYyBpbnQgcmlzY3ZfaW9tbXVfZW5hYmxlKHN0cnVjdCByaXNjdl9p
b21tdV9kZXZpY2UgKmlvbW11LCB1bnNpZ25lZCByZXF1ZXN0ZWRfbW9kZSkKPiA+ID4gK3sKPiA+
ID4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSBpb21tdS0+ZGV2Owo+ID4gPiArICAgICAg
IHU2NCBkZHRwID0gMDsKPiA+ID4gKyAgICAgICB1NjQgZGR0cF9wYWRkciA9IDA7Cj4gPiA+ICsg
ICAgICAgdW5zaWduZWQgbW9kZSA9IHJlcXVlc3RlZF9tb2RlOwo+ID4gPiArICAgICAgIHVuc2ln
bmVkIG1vZGVfcmVhZGJhY2sgPSAwOwo+ID4gPiArCj4gPiA+ICsgICAgICAgZGR0cCA9IHJpc2N2
X2lvbW11X2dldF9kZHRwKGlvbW11KTsKPiA+ID4gKyAgICAgICBpZiAoZGR0cCAmIFJJU0NWX0lP
TU1VX0REVFBfQlVTWSkKPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUJVU1k7Cj4gPiA+
ICsKPiA+ID4gKyAgICAgICAvKiBEaXNhbGxvdyBzdGF0ZSB0cmFuc3Rpb24gZnJvbSB4TFZMIHRv
IHhMVkwuICovCj4gPiA+ICsgICAgICAgc3dpdGNoIChGSUVMRF9HRVQoUklTQ1ZfSU9NTVVfRERU
UF9NT0RFLCBkZHRwKSkgewo+ID4gPiArICAgICAgIGNhc2UgUklTQ1ZfSU9NTVVfRERUUF9NT0RF
X0JBUkU6Cj4gPiA+ICsgICAgICAgY2FzZSBSSVNDVl9JT01NVV9ERFRQX01PREVfT0ZGOgo+ID4g
PiArICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiA+ICsgICAgICAgZGVmYXVsdDoKPiA+ID4gKyAg
ICAgICAgICAgICAgIGlmICgobW9kZSAhPSBSSVNDVl9JT01NVV9ERFRQX01PREVfQkFSRSkKPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAmJiAobW9kZSAhPSBSSVNDVl9JT01NVV9ERFRQX01PREVf
T0ZGKSkKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiA+
ICsgICAgICAgICAgICAgICBicmVhazsKPiA+ID4gKyAgICAgICB9Cj4gPiA+ICsKPiA+ID4gKyBy
ZXRyeToKPiA+Cj4gPiBXZSBuZWVkIHRvIGNvbnNpZGVyIHRoZSBgaW9tbXUucGFzc3Rocm91Z2hg
IGJlZm9yZSB3ZSBzZXQgdXAgdGhlIG1vZGUKPiA+IGluIHN3aXRjaCBjYXNlLCBzb21ldGhpbmcg
bGlrZQo+ID4KPgo+IFRoaXMgZnVuY3Rpb24gaXMgb25seSB0byBleGVjdXRlIGNvbmZpZ3VyYXRp
b24gYW5kIHNldCBkZXZpY2UgZGlyZWN0b3J5IG1vZGUuCj4gSGFuZGxpbmcgZ2xvYmFsIGlvbW11
LnBhc3N0aHJvdWdoIHBvbGljeSBpcyBpbXBsZW1lbnRlZCBpbgo+IHJpc2N2X2lvbW11X2luaXQo
KSBjYWxsIChwYXRjaCAjNykuCgpUaGFua3MuIEkgc2F3IHRoYXQgaW4gcGF0Y2ggIzcuCgo+Cj4g
QmVzdCwKPiAtIFRvbWFzegoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
