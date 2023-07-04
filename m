Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEE4C001DD
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 01:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qq7Y9Fa0Fvbqx2tG8Uw7AB+7FnAsH/5zkZ/oyu5Fuq0=; b=Y8iNph2j+C92Yn
	hLdgyMsIeoJUD8y/09SSfUtgGYegexKXJUYebByTeGyFBRbiOaqKRA2weRsSDQ4q8W4GmG7P1Lj0V
	8faZq5+T2elOydHXIPz+Rj3e0+XEN6kFbAiU6iK4PV8BpuUnjP323WlrCtdDXQZSHUd9qsV2KWn9y
	cY4ipr735dKe8J2pk0sSPZ8cvFmuyJp+J7fff98LamUIg4nCOGgdM7kyxDi6UDNWc7MKbdsysVIz1
	zpMxeawhwf6jM4BfoFyYuT9h8J84LiyAgOrum3NsAFlj63PIjkIQS9XamVYARABCgnAeYfTKGwOIc
	O1P7Tdu8HX26izcOg0RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGUYX-00Bo5f-0z;
	Tue, 04 Jul 2023 01:10:13 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGUYU-00Bo4y-1W;
	Tue, 04 Jul 2023 01:10:11 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b6ef64342aso13308081fa.3;
        Mon, 03 Jul 2023 18:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688433008; x=1691025008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NanNEKu00OV4dGi7G0zvqpvZhV9czNdIron8MRqRfZI=;
        b=eLCXFaLroQ5MoaLRSPbNjWaACX61zx1cLYCRkq3boGYpFlVmf8gtDCfzTAw2qdS3Ub
         ozu8Ff4DqPjlyqIbk/MtR7tq1BYGzsWtkTT7gFrBQ/S+rBGY+a5FqO86Mh7S7Lodvd6/
         d1t56l5wcCUN7lU4sIr+FBq3VcR4xcxN7uYojfMdTGTlyJ69Zii2bollYU8snTcP4v5v
         4cgFMeQ5R1c+5ogbAsMLV0DvNXruXSAscfFxZWXXWHfnDBfbMFoC8hs8bE5gg71RY0Pw
         Bx2+ahtaEvxVOLWc9DPAFQW5JJo+ZC/2wKRECxa8Pk7mRMnXLM7Rwa5WD3Nx+dT3Uyxw
         geSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688433008; x=1691025008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NanNEKu00OV4dGi7G0zvqpvZhV9czNdIron8MRqRfZI=;
        b=JgOMsEoJ7ND54EZGDdWIXS1kJ7A8Cz02HwiGhIpU/fHy05opVS8+bSKZfy921YkL5a
         4b5XzyfQrKauQPGOmfUMrRCJjAH9y7g9wvAgbRcerUJ/PMDGOzBU6X9UBkqGC5bjDLeT
         +ZGlOVzxT5RRCWNKNqbgT/ZhyM+9uWzIoxyiKqpclAbljC1I45dxkuVqkdYoNlgkkcYW
         SrWqd3UJqLe7n/B5fgkyFU+uiRPhJLlb06BF3xt+viDAgheVNnvNFE7K9MDhtBYNRE1f
         Kyf50UI3kyTQ3eu4nsIs+nxzatv00t0ImONo+VP1i5o7ztETXpex+/KbTgggM0zUboJk
         +Odw==
X-Gm-Message-State: ABy/qLZ1s6lcx2obQJpVQ9LCnKCB0l+aQoKFCuMIl+GGUO7vLeTuYIcz
	o1uhyfiayeUFOtriKkKqv6QhlcZA9A4wnQC/wys=
X-Google-Smtp-Source: APBJJlGiNQwrknvCAy76rNcAE/MkDTPW2U3FZfJqSOgzlNETgHG1hunCNunvnDb4FfPWDhNrPhJSZ0ADPdMbvQoO9hw=
X-Received: by 2002:a2e:918e:0:b0:2b6:e96c:5414 with SMTP id
 f14-20020a2e918e000000b002b6e96c5414mr2899927ljg.52.1688433007852; Mon, 03
 Jul 2023 18:10:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1688010022.git.haibo1.xu@intel.com> <f44c3aa46971d524319c6340f9ce1b00c0182fd2.1688010022.git.haibo1.xu@intel.com>
 <20230702-49c5545eb1ae2d0cf11c7b95@orel>
In-Reply-To: <20230702-49c5545eb1ae2d0cf11c7b95@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Tue, 4 Jul 2023 09:09:56 +0800
Message-ID: <CAJve8om-r67p7WojymsfP0T3MdZWchhujCZMzGyQ8de2AbykBQ@mail.gmail.com>
Subject: Re: [PATCH v5 10/13] KVM: selftests: Only do get/set tests on present
 blessed list
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, maz@kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Vipin Sharma <vipinsh@google.com>, 
	David Matlack <dmatlack@google.com>, Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_181010_534128_729D5FDF 
X-CRM114-Status: GOOD (  19.01  )
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

T24gTW9uLCBKdWwgMywgMjAyMyBhdCA0OjE44oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBTYXQsIEp1bCAwMSwgMjAyMyBhdCAwOTo0Mjo1
OFBNICswODAwLCBIYWlibyBYdSB3cm90ZToKPiA+IE9ubHkgZG8gdGhlIGdldC9zZXQgdGVzdHMg
b24gcHJlc2VudCBhbmQgYmxlc3NlZCByZWdpc3RlcnMKPiA+IHNpbmNlIHdlIGRvbid0IGtub3cg
dGhlIGNhcGFiaWxpdGllcyBvZiBhbnkgbmV3IG9uZXMuCj4gPgo+ID4gU3VnZ2VzdGVkLWJ5OiBB
bmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+ID4gU2lnbmVkLW9mZi1ieTog
SGFpYm8gWHUgPGhhaWJvMS54dUBpbnRlbC5jb20+Cj4gPiBSZXZpZXdlZC1ieTogQW5kcmV3IEpv
bmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiA+IC0tLQo+ID4gIHRvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2t2bS9nZXQtcmVnLWxpc3QuYyB8IDI5ICsrKysrKysrKysrKysrLS0tLS0tLS0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9nZXQtcmVnLWxp
c3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9nZXQtcmVnLWxpc3QuYwo+ID4gaW5k
ZXggYzYxMDkwODA2MDA3Li43NGZiNmY2ZmRkMDkgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9rdm0vZ2V0LXJlZy1saXN0LmMKPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2t2bS9nZXQtcmVnLWxpc3QuYwo+ID4gQEAgLTQ5LDYgKzQ5LDEwIEBAIGV4dGVy
biBpbnQgdmNwdV9jb25maWdzX247Cj4gPiAgICAgICBmb3JfZWFjaF9yZWdfZmlsdGVyZWQoaSkg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAgICAg
ICAgICAgICAgIGlmICghZmluZF9yZWcoYmxlc3NlZF9yZWcsIGJsZXNzZWRfbiwgcmVnX2xpc3Qt
PnJlZ1tpXSkpCj4gPgo+ID4gKyNkZWZpbmUgZm9yX2VhY2hfcHJlc2VudF9ibGVzc2VkX3JlZyhp
KSAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICBmb3IgKChpKSA9IDA7IChpKSA8IGJs
ZXNzZWRfbjsgKysoaSkpICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAgIGlmIChmaW5kX3Jl
ZyhyZWdfbGlzdC0+cmVnLCByZWdfbGlzdC0+biwgYmxlc3NlZF9yZWdbaV0pKQo+Cj4gSSBqdXN0
IHJlYWxpemVkIHRoaXMgaXMgYmFja3dhcmRzLiBXZSBuZWVkICdpJyB0byBpbmRleCByZWdfbGlz
dC0+cmVnIGluCj4gdGhlIGJvZHkgb2YgdGhlIGxvb3AuIFRoYXQgbWVhbnMgd2UgbmVlZCB0byB3
cml0ZSB0aGlzIGFzCj4KPiAjZGVmaW5lIGZvcl9lYWNoX3ByZXNlbnRfYmxlc3NlZF9yZWcoaSkg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAgIGZvcl9l
YWNoX3JlZyhpKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiAgICAgICAgICAgICAgICAgaWYgKGZpbmRfcmVnKGJsZXNzZWRfcmVnLCBi
bGVzc2VkX24sIHJlZ19saXN0LT5yZWdbaV0pKQo+Cj4gKFdoaWNoLCBpbiBoaW5kc2lnaHQsIG1h
a2VzIHNlbnNlIHNpbmNlIHdlJ3JlIHJlcGxhY2luZyBhIGZvcl9lYWNoX3JlZygpCj4gbG9vcC4p
Cj4KClN1cmUsIEkgd2lsbCB1cGRhdGUgaXQgaW4gdjYuCgpUaGFua3MhCgo+IFRoYW5rcywKPiBk
cmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
