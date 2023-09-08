Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A868EC875F
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 01:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=57EFbpXAMKpJZvudjsy0e33SoIRh0dvakB9W/F+MFzU=; b=3glGTSTd0L80nT
	NpnLx3+kbGaz0IUKLX4YURU3Mny8Nc5qSHV7OOnMTfh4Bkb3H02y+mV/AsoOGIgzSLq8LWsPs3OWN
	Sah4FQVGONk//KFdpnIkKvEePbgHmDEjH0lxdV0pn4f8HPcegUcVcoGSQ3RvSzQQjOr5zswqJXD78
	BOkgGCw1uQW9xLthEHDtOOnsUSEvy7xaSFaIGh24RcmB4hMAhEoX9eOnfGYIY7Zo8zp1m5SprfMdD
	T83kr263PLZjfRCz1vE3/eqlptSrrDRawFOV/a2VyVHFBrmR7iTuHOctu5jzliq2Yp0wg+iJPIloI
	wq4sX/+5ayb3gNHUrpsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeQA3-00Ct2y-1z;
	Fri, 08 Sep 2023 01:19:51 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeQA1-00Ct2P-1r;
	Fri, 08 Sep 2023 01:19:51 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2bcb50e194dso27222271fa.3;
        Thu, 07 Sep 2023 18:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694135986; x=1694740786; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTau3cyTONyicNIG022ikGJaiNee6rRJkeeHB5/yKBk=;
        b=Hk/ayASOW4nITq29/GhdwzZlNYB8dh5BtkrSQ4c/R9Nd0IheMsgfdl2sjfwgLOzS6J
         kTUVnuWQIczYcvPx+i5rTvBrRYBCJ4abudnjMbzQlA6kfmlMLkashFiDY19aGCKYNH4j
         yIDt6yi3wgdffXkDPMIytHX9mjIGG1XTJlslJKZaNOHmfdDKqNyMcFBlXw3ugd098Y0M
         KCEotR/KGyk5HKiyMRAhTRJo1v9S0j65Cl7cdL8ZsTulYv3l3TJsOlst/xWEal6xfcEG
         J9UFQCPpMKaBYzfP8zir1D5iFK7o2Ty9tpCHoMMOJRO8eIENQtsJvDubMswji74SmSqN
         HlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694135986; x=1694740786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iTau3cyTONyicNIG022ikGJaiNee6rRJkeeHB5/yKBk=;
        b=QD8/zl6YB+fPW0d6jLG6cLRgJ50O+pNmYWaIkFQoGJuNihT9cQhOLTHBtKs5UcQPnb
         7OVR6Zzcnuxb1dEuunD+yAD3j1nNUBlvGuMNFNT+VfwPVj+JsTd/GeTxwrgP6FkDeCOG
         +3Vr9Eiffp0LLu5aPmDKT9UtrGcjMz3PEL5zITdg9ka44DSu4qgMiiMCxVWlk4ht2TT4
         1ik9YtsQdjXboSBUZMTxzcaG4iRVLfkwJM/Q0Os1agMnWd1saIqx0WbwAhRPEgpkN3io
         rqWfcSO4Q/RK5FPekB6AWF6c33tC2cJ5vHP4+YRoqAHTE2DwbGKRQgIuwFrl7PEpsqOG
         rsrw==
X-Gm-Message-State: AOJu0YyW30ZmDV9XlNOTsK/hZTYtwxbfdSXlO3cDGHbS8Lloi68OkXcY
	RIlHpaFbmJNmxCgVkfyHeIagRZYbvpR8YiB3O9s=
X-Google-Smtp-Source: AGHT+IEL308YxAoiG5EsgNnKWxBjdP+kxPSyqo+hXH6H8rBb5eKOkbqrZtAmLlCbAvhCqZW27NcA1wdyNy3dVkq5eys=
X-Received: by 2002:a2e:9090:0:b0:2b6:cdfb:d06a with SMTP id
 l16-20020a2e9090000000b002b6cdfbd06amr631578ljg.22.1694135986206; Thu, 07 Sep
 2023 18:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693659382.git.haibo1.xu@intel.com> <d2b3c53537fef3f0a2d27d8be663a64123d4bc3c.1693659382.git.haibo1.xu@intel.com>
 <20230904-a69c6a228bf4553cc58bca17@orel> <CAJve8ok03P-t7pTA9mH=5vvkUy4NtxHac_Z_NM88cs55YQZATg@mail.gmail.com>
 <20230907-5d3da2b6dca23bedb31b33a0@orel>
In-Reply-To: <20230907-5d3da2b6dca23bedb31b33a0@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Fri, 8 Sep 2023 09:19:32 +0800
Message-ID: <CAJve8om1VibbkHBuG4B+KbKY2eug42wGk9wiYtCYeF-WDY8EgQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] KVM: riscv: selftests: Add sstc timer test
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Greentime Hu <greentime.hu@sifive.com>, 
	wchen <waylingii@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	Sean Christopherson <seanjc@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, David Matlack <dmatlack@google.com>, 
	Aaron Lewis <aaronlewis@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Vipin Sharma <vipinsh@google.com>, Maxim Levitsky <mlevitsk@redhat.com>, 
	Peter Gonda <pgonda@google.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Like Xu <likexu@tencent.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, Michal Luczaj <mhal@rbox.co>, zhang songyi <zhang.songyi@zte.com.cn>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_181949_615214_4C1E24AD 
X-CRM114-Status: GOOD (  35.61  )
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

T24gRnJpLCBTZXAgOCwgMjAyMyBhdCAzOjAx4oCvQU0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIFNlcCAwNywgMjAyMyBhdCAxMjoyMDoy
OVBNICswODAwLCBIYWlibyBYdSB3cm90ZToKPiA+IE9uIE1vbiwgU2VwIDQsIDIwMjMgYXQgMTA6
NTjigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+
ID4KPiA+ID4gT24gU2F0LCBTZXAgMDIsIDIwMjMgYXQgMDg6NTk6MzBQTSArMDgwMCwgSGFpYm8g
WHUgd3JvdGU6Cj4gPiA+ID4gQWRkIGEgS1ZNIHNlbGZ0ZXN0IHRvIHZhbGlkYXRlIHRoZSBTc3Rj
IHRpbWVyIGZ1bmN0aW9uYWxpdHkuCj4gPiA+ID4gVGhlIHRlc3Qgd2FzIHBvcnRlZCBmcm9tIGFy
bTY0IGFyY2ggdGltZXIgdGVzdC4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEhhaWJv
IFh1IDxoYWlibzEueHVAaW50ZWwuY29tPgo+ID4gPiA+IC0tLQo+ID4KPiA+ID4gPiBkaWZmIC0t
Z2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2FyY2hfdGltZXIuYyBiL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9hcmNoX3RpbWVyLmMKPiA+ID4gPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+ID4gPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uYzUwYTMzYzFlNGY5
Cj4gPiA+ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2t2bS9yaXNjdi9hcmNoX3RpbWVyLmMKPiA+ID4gPiBAQCAtMCwwICsxLDEzMCBAQAo+ID4g
PiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Cj4gPiA+ID4gKy8q
Cj4gPiA+ID4gKyAqIGFyY2hfdGltZXIuYyAtIFRlc3RzIHRoZSByaXNjdjY0IHNzdGMgdGltZXIg
SVJRIGZ1bmN0aW9uYWxpdHkKPiA+ID4gPiArICoKPiA+ID4gPiArICogVGhlIHRlc3QgdmFsaWRh
dGVzIHRoZSBzc3RjIHRpbWVyIElSUXMgdXNpbmcgdnN0aW1lY21wIHJlZ2lzdGVycy4KPiA+ID4g
PiArICogSXQncyBwb3J0ZWQgZnJvbSB0aGUgYWFyY2g2NCBhcmNoX3RpbWVyIHRlc3QuCj4gPiA+
ID4gKyAqCj4gPgo+ID4gPiBndWVzdF9ydW5bX3N0YWdlXSgpIGNhbiBiZSBzaGFyZWQgd2l0aCBh
YXJjaDY0LCB3ZSBqdXN0IGhhdmUgYSBzaW5nbGUKPiA+ID4gc3RhZ2U9MCBmb3IgcmlzY3YuCj4g
PiA+Cj4gPgo+ID4gWWVzLCB3ZSBjYW4uIEJ1dCBpZiB3ZSBzaGFyZSB0aGUgZ3Vlc3RfcnVuW19z
dGFnZV0oKSBieSBtb3ZpbmcgaXQgdG8KPiA+IGt2bS9hcmNoX3RpbWVyLmMKPiA+IG9yIGt2bS9p
bmNsdWRlL3RpbWVyX3Rlc3QuaCwgd2UgbmVlZCB0byBkZWNsYXJlIGV4dHJhIHN1Yi1mdW5jdGlv
bnMKPiA+IHNvbWV3aGVyZSBpbiBhCj4gPiBoZWFkZXIgZmlsZShldGMuIGd1ZXN0X2NvbmZpZ3Vy
ZV90aW1lcl9hY3Rpb24oKSkuCj4KPiBPSywgd2hhdGV2ZXIgYmFsYW5jZXMgdGhlIHJlZHVjdGlv
biBvZiBkdXBsaWNhdGUgY29kZSBhbmQgYXZvaWRhbmNlIG9mCj4gZXhwb3J0aW5nIGhlbHBlciBm
dW5jdGlvbnMuIEJUVywgcmlzY3YgbWF5IG5vdCBuZWVkL3dhbnQgYWxsIHRoZSBzYW1lCj4gaGVs
cGVyIGZ1bmN0aW9ucyBhcyBhYXJjaDY0LiBBbnl3YXksIEkgZ3Vlc3MgSSdsbCBzZWUgaG93IHRo
ZSBuZXh0IHZlcnNpb24KPiB0dXJucyBvdXQuCj4KPiA+Cj4gPiA+ID4gKwo+ID4gPiA+ICtzdGF0
aWMgdm9pZCBndWVzdF9jb2RlKHZvaWQpCj4gPiA+ID4gK3sKPiA+ID4gPiArICAgICB1aW50MzJf
dCBjcHUgPSBndWVzdF9nZXRfdmNwdWlkKCk7Cj4gPiA+ID4gKyAgICAgc3RydWN0IHRlc3RfdmNw
dV9zaGFyZWRfZGF0YSAqc2hhcmVkX2RhdGEgPSAmdmNwdV9zaGFyZWRfZGF0YVtjcHVdOwo+ID4g
PiA+ICsKPiA+ID4gPiArICAgICBsb2NhbF9pcnFfZGlzYWJsZSgpOwo+ID4gPiA+ICsgICAgIHRp
bWVyX2lycV9kaXNhYmxlKCk7Cj4gPiA+ID4gKyAgICAgbG9jYWxfaXJxX2VuYWJsZSgpOwo+ID4g
Pgo+ID4gPiBJIGRvbid0IHRoaW5rIHdlIG5lZWQgdG8gZGlzYWJsZSBhbGwgaW50ZXJydXB0cyB3
aGVuIGRpc2FibGluZyB0aGUgdGltZXIKPiA+ID4gaW50ZXJydXB0Lgo+ID4gPgo+ID4KPiA+IFRo
ZXJlIGlzIG5vIGxvY2FsX2lycV9kaXNhYmxlKCkgcHJvdGVjdGlvbiBkdXJpbmcgdGhlIGluaXRp
YWwgZGVidWcKPiA+IHBoYXNlLCBidXQgdGhlIHRlc3QgYWx3YXlzCj4gPiBmYWlsIHdpdGggYmVs
b3cgZXJyb3IgbWVzc2FnZXM6Cj4gPgo+ID4gR3Vlc3QgYXNzZXJ0IGZhaWxlZCwgIHZjcHUgMDsg
c3RhZ2U7IDA7IGl0ZXI6IDAKPiA+ID09PT0gVGVzdCBBc3NlcnRpb24gRmFpbHVyZSA9PT09Cj4g
PiAgIHJpc2N2L2FyY2hfdGltZXIuYzo3ODogY29uZmlnX2l0ZXIgKyAxID09IGlycV9pdGVyCj4g
PiAgIHBpZD01ODUgdGlkPTU4NiBlcnJubz00IC0gSW50ZXJydXB0ZWQgc3lzdGVtIGNhbGwKPiA+
ICAgKHN0YWNrIHRyYWNlIGVtcHR5KQo+ID4gICAweDEgIT0gMHgwIChjb25maWdfaXRlciArIDEg
IT0gaXJxX2l0ZXIpCj4gPgo+ID4gVG8gYmUgZnJhbmssIEkgYW0gbm90IHF1aXRlIHN1cmUgd2h5
IHRoZSBsb2NhbF9pcnFfZGlzYWJsZS9lbmFibGUoKSBtYXR0ZXJzLgo+ID4gT25lIHBvc3NpYmxl
IHJlYXNvbiBtYXkgYmUgc29tZSB0aW1lciBpcnEgd2FzIHRyaWdnZXJlZCBiZWZvcmUgd2Ugc2V0
IHVwIHRoZQo+ID4gdGltZWNtcCByZWdpc3Rlci4KPgo+IFdlIHNob3VsZCBlbnN1cmUgd2Uga25v
dyB0aGUgZXhhY3QsIGV4cGVjdGVkIHN0YXRlIG9mIHRoZSB2Y3B1IGJlZm9yZSwKPiBkdXJpbmcs
IGFuZCBhZnRlciB0aGUgdGVzdC4gSWYgYSBzdGF0ZSBkb2Vzbid0IG1hdGNoIGV4cGVjdGF0aW9u
cywKPiB0aGVuIHRoZSB0ZXN0IHNob3VsZCBhc3NlcnQgYW5kIHdlIHNob3VsZCBnbyBpbnZlc3Rp
Z2F0ZSB0aGUgdGVzdCBjb2RlCj4gdG8gc2VlIGlmIHNldHVwL2NoZWNraW5nIGlzIGNvcnJlY3Qu
IElmIGl0IGlzLCB0aGVuIHdlJ3ZlIGZvdW5kIGEgYnVnCj4gaW4gS1ZNIHRoYXQgd2UgbmVlZCB0
byBnbyBpbnZlc3RpZ2F0ZS4KPgo+IEZvciBTc3RjLCBhIHBlbmRpbmcgdGltZXIgaW50ZXJydXB0
IGNvbXBsZXRlbHkgZGVwZW5kcyBvbiBzdGltZWNtcCwgc28KPiB3ZSBuZWVkIHRvIHdhdGNoIHRo
YXQgY2xvc2VseS4gVGFrZSBhIGxvb2sgYXQgdGhlIGF0dGFjaGVkIHNpbXBsZSB0aW1lcgo+IHRl
c3QgSSBwdWxsZWQgdG9nZXRoZXIgdG8gaWxsdXN0cmF0ZSBob3cgc3RpbWVjbXAsIHRpbWVyIGlu
dGVycnVwdCBlbmFibGUsCj4gYW5kIGFsbCBpbnRlcnJ1cHQgZW5hYmxlIGludGVyYWN0LiBZb3Ug
bWF5IHdhbnQgdG8gdXNlIGl0IHRvIGhlbHAgcG9ydAo+IHRoZSBhcmNoX3RpbWVyLgo+CgpUaGFu
a3MgZm9yIHNoYXJpbmcgdGhlIHRlc3QgY29kZXMuIFdpbGwgaGF2ZSBhbiBpbnZlc3RpZ2F0aW9u
IG9uIGl0LgoKPiBUaGFua3MsCj4gZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
