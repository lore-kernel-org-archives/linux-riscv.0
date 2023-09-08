Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764E5EB8FB1
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 02:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2lXv+vPByxrIPw0fn3jrVsFNr38gMbFbuwp1JudlATY=; b=v9LTTHHoKVBeov
	gULFjf0+gSxa4m5slr3MIe0Fn4DKjtIOttpKNPT6jehh0oPyIG74kXpYjiWjxs2k8oZcMvbeDDUP2
	VGxA3TJdD2iiVJwx3CTz5b1Im08vdbbjMNTh0ikdWXLBWXcEOrgC4fvjU5HuguapJKE8p/9KHFZMF
	u1TC7/gtiBXFtRg2agxu4jwmga27CiDz5P661kfI02DXrf0C2S46b3RA34OrGVUttnrATjApEwNAW
	tRL9qRG+OLuW1dCCsSMyloHl/gywSGfLtEsmOUx6SKUZqPCrggRIfaAAENdm+U6bw7JASdH7tSVao
	hHz0AlfqUkV6JIgTDvTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeRMB-00CwPn-0g;
	Fri, 08 Sep 2023 02:36:27 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeRM8-00CwP2-2E;
	Fri, 08 Sep 2023 02:36:26 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2bcda0aaf47so32875611fa.1;
        Thu, 07 Sep 2023 19:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694140581; x=1694745381; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3SloDScCMx4oSLnsTG5Eji59Tx/5anpswbLezsyOC20=;
        b=eCE/0YXE7IPLps/v/ksa/Q+oEawl66i+gNIK7lsriKEVTheCtanFCQrz09IzV6abTW
         iq/Dhqjs7ONTDQCyGDdb8DOTWdWJEOFADL56+QXKKFu+Oa/RflJLIFW79yVoCX6ZE7+s
         fbPMXLonBlYOvIzcFE4Te1kPIuZjSAv0S8f0umWtb0eAGGbEq8YIM28cLPsBM2plHayj
         puWhOOUfVAqxTpkJimWxz+x4SkC+v4nE4dSzt5mmZ5Py+G4dkIC7+01ADec8BIzCg+//
         KQVNtk9v+rWiK+VygQk4G9/dxCZxv7VRdhqLxPpPxaV9ojKU+CNT+wcq11wQDcBG05Yk
         gPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694140581; x=1694745381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3SloDScCMx4oSLnsTG5Eji59Tx/5anpswbLezsyOC20=;
        b=LFCHoAGSHChXPTb5TuiIqV5ar+Zi/OT86fTAJ8eLuIupZhg+SpyP/fr7v1zJ4+y6Vr
         GocP+evzUJSeIceqoaDtsN7gvdQF06b3Q30Bh+fMSZsoUkX4VZD/gReUrWrq5UhY1S6c
         LRc/62U8dY8QsiKnn4Ts1Lgbuhjd0dtufvGJ5CBZ3rRakz0XtetS7ojwl6WWLcd6WLIk
         G2Z0YzOfgVarVOQzLjPfiYGP4MsMYm3Nd9ffPluJuSlmhHZ2RHY3BN9225mpV0sjPa7V
         3DXD8jn0NFvedO8NmhTsEkQkWij0x9shvEKgFSDtGCxwQWL0eV2pRyXVMGR5vNzpdbMl
         ySVg==
X-Gm-Message-State: AOJu0YzmsjLYPL5pEvzlaOfq9NvW7WqmB/Oe4Lt5sQu9ep93saDllHa4
	vxDoSLieVZ4PAnofmzYGmMqS1ZOxJ49hZLYCka8=
X-Google-Smtp-Source: AGHT+IGPnaH1hB1XaAWpoSpVu9fE6H6lAvlQx/cBu/gZNMgWAzXLEKoti/amvId+mp2eIUJ6sUeQ6zygE6V1VF/TXK8=
X-Received: by 2002:a2e:800f:0:b0:2b9:601d:2c0 with SMTP id
 j15-20020a2e800f000000b002b9601d02c0mr285241ljg.25.1694140580444; Thu, 07 Sep
 2023 19:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693659382.git.haibo1.xu@intel.com> <d2b3c53537fef3f0a2d27d8be663a64123d4bc3c.1693659382.git.haibo1.xu@intel.com>
 <20230904-a69c6a228bf4553cc58bca17@orel> <CAJve8ok03P-t7pTA9mH=5vvkUy4NtxHac_Z_NM88cs55YQZATg@mail.gmail.com>
 <20230907-5d3da2b6dca23bedb31b33a0@orel> <CAJve8om1VibbkHBuG4B+KbKY2eug42wGk9wiYtCYeF-WDY8EgQ@mail.gmail.com>
In-Reply-To: <CAJve8om1VibbkHBuG4B+KbKY2eug42wGk9wiYtCYeF-WDY8EgQ@mail.gmail.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Fri, 8 Sep 2023 10:36:09 +0800
Message-ID: <CAJve8o=_09khYSEapJfb2xiqzCLdM6FbR=Q9gAawZ6nhHDUZCQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230907_193624_756017_2A105C7E 
X-CRM114-Status: GOOD (  32.76  )
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

T24gRnJpLCBTZXAgOCwgMjAyMyBhdCA5OjE54oCvQU0gSGFpYm8gWHUgPHhpYW9ibzU1eEBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBTZXAgOCwgMjAyMyBhdCAzOjAx4oCvQU0gQW5kcmV3
IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBT
ZXAgMDcsIDIwMjMgYXQgMTI6MjA6MjlQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiA+IE9u
IE1vbiwgU2VwIDQsIDIwMjMgYXQgMTA6NTjigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIFNhdCwgU2VwIDAyLCAyMDIz
IGF0IDA4OjU5OjMwUE0gKzA4MDAsIEhhaWJvIFh1IHdyb3RlOgo+ID4gPiA+ID4gQWRkIGEgS1ZN
IHNlbGZ0ZXN0IHRvIHZhbGlkYXRlIHRoZSBTc3RjIHRpbWVyIGZ1bmN0aW9uYWxpdHkuCj4gPiA+
ID4gPiBUaGUgdGVzdCB3YXMgcG9ydGVkIGZyb20gYXJtNjQgYXJjaCB0aW1lciB0ZXN0Lgo+ID4g
PiA+ID4KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEhhaWJvIFh1IDxoYWlibzEueHVAaW50ZWwu
Y29tPgo+ID4gPiA+ID4gLS0tCj4gPiA+Cj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2FyY2hfdGltZXIuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS9yaXNjdi9hcmNoX3RpbWVyLmMKPiA+ID4gPiA+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4gPiA+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmM1MGEzM2MxZTRmOQo+ID4gPiA+ID4g
LS0tIC9kZXYvbnVsbAo+ID4gPiA+ID4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3Zt
L3Jpc2N2L2FyY2hfdGltZXIuYwo+ID4gPiA+ID4gQEAgLTAsMCArMSwxMzAgQEAKPiA+ID4gPiA+
ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Cj4gPiA+ID4gPiArLyoK
PiA+ID4gPiA+ICsgKiBhcmNoX3RpbWVyLmMgLSBUZXN0cyB0aGUgcmlzY3Y2NCBzc3RjIHRpbWVy
IElSUSBmdW5jdGlvbmFsaXR5Cj4gPiA+ID4gPiArICoKPiA+ID4gPiA+ICsgKiBUaGUgdGVzdCB2
YWxpZGF0ZXMgdGhlIHNzdGMgdGltZXIgSVJRcyB1c2luZyB2c3RpbWVjbXAgcmVnaXN0ZXJzLgo+
ID4gPiA+ID4gKyAqIEl0J3MgcG9ydGVkIGZyb20gdGhlIGFhcmNoNjQgYXJjaF90aW1lciB0ZXN0
LgoKPiA+ID4KPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICtzdGF0aWMgdm9pZCBndWVzdF9jb2RlKHZv
aWQpCj4gPiA+ID4gPiArewo+ID4gPiA+ID4gKyAgICAgdWludDMyX3QgY3B1ID0gZ3Vlc3RfZ2V0
X3ZjcHVpZCgpOwo+ID4gPiA+ID4gKyAgICAgc3RydWN0IHRlc3RfdmNwdV9zaGFyZWRfZGF0YSAq
c2hhcmVkX2RhdGEgPSAmdmNwdV9zaGFyZWRfZGF0YVtjcHVdOwo+ID4gPiA+ID4gKwo+ID4gPiA+
ID4gKyAgICAgbG9jYWxfaXJxX2Rpc2FibGUoKTsKPiA+ID4gPiA+ICsgICAgIHRpbWVyX2lycV9k
aXNhYmxlKCk7Cj4gPiA+ID4gPiArICAgICBsb2NhbF9pcnFfZW5hYmxlKCk7Cj4gPiA+ID4KPiA+
ID4gPiBJIGRvbid0IHRoaW5rIHdlIG5lZWQgdG8gZGlzYWJsZSBhbGwgaW50ZXJydXB0cyB3aGVu
IGRpc2FibGluZyB0aGUgdGltZXIKPiA+ID4gPiBpbnRlcnJ1cHQuCj4gPiA+ID4KPiA+ID4KPiA+
ID4gVGhlcmUgaXMgbm8gbG9jYWxfaXJxX2Rpc2FibGUoKSBwcm90ZWN0aW9uIGR1cmluZyB0aGUg
aW5pdGlhbCBkZWJ1Zwo+ID4gPiBwaGFzZSwgYnV0IHRoZSB0ZXN0IGFsd2F5cwo+ID4gPiBmYWls
IHdpdGggYmVsb3cgZXJyb3IgbWVzc2FnZXM6Cj4gPiA+Cj4gPiA+IEd1ZXN0IGFzc2VydCBmYWls
ZWQsICB2Y3B1IDA7IHN0YWdlOyAwOyBpdGVyOiAwCj4gPiA+ID09PT0gVGVzdCBBc3NlcnRpb24g
RmFpbHVyZSA9PT09Cj4gPiA+ICAgcmlzY3YvYXJjaF90aW1lci5jOjc4OiBjb25maWdfaXRlciAr
IDEgPT0gaXJxX2l0ZXIKPiA+ID4gICBwaWQ9NTg1IHRpZD01ODYgZXJybm89NCAtIEludGVycnVw
dGVkIHN5c3RlbSBjYWxsCj4gPiA+ICAgKHN0YWNrIHRyYWNlIGVtcHR5KQo+ID4gPiAgIDB4MSAh
PSAweDAgKGNvbmZpZ19pdGVyICsgMSAhPSBpcnFfaXRlcikKPiA+ID4KPiA+ID4gVG8gYmUgZnJh
bmssIEkgYW0gbm90IHF1aXRlIHN1cmUgd2h5IHRoZSBsb2NhbF9pcnFfZGlzYWJsZS9lbmFibGUo
KSBtYXR0ZXJzLgo+ID4gPiBPbmUgcG9zc2libGUgcmVhc29uIG1heSBiZSBzb21lIHRpbWVyIGly
cSB3YXMgdHJpZ2dlcmVkIGJlZm9yZSB3ZSBzZXQgdXAgdGhlCj4gPiA+IHRpbWVjbXAgcmVnaXN0
ZXIuCj4gPgo+ID4gV2Ugc2hvdWxkIGVuc3VyZSB3ZSBrbm93IHRoZSBleGFjdCwgZXhwZWN0ZWQg
c3RhdGUgb2YgdGhlIHZjcHUgYmVmb3JlLAo+ID4gZHVyaW5nLCBhbmQgYWZ0ZXIgdGhlIHRlc3Qu
IElmIGEgc3RhdGUgZG9lc24ndCBtYXRjaCBleHBlY3RhdGlvbnMsCj4gPiB0aGVuIHRoZSB0ZXN0
IHNob3VsZCBhc3NlcnQgYW5kIHdlIHNob3VsZCBnbyBpbnZlc3RpZ2F0ZSB0aGUgdGVzdCBjb2Rl
Cj4gPiB0byBzZWUgaWYgc2V0dXAvY2hlY2tpbmcgaXMgY29ycmVjdC4gSWYgaXQgaXMsIHRoZW4g
d2UndmUgZm91bmQgYSBidWcKPiA+IGluIEtWTSB0aGF0IHdlIG5lZWQgdG8gZ28gaW52ZXN0aWdh
dGUuCj4gPgo+ID4gRm9yIFNzdGMsIGEgcGVuZGluZyB0aW1lciBpbnRlcnJ1cHQgY29tcGxldGVs
eSBkZXBlbmRzIG9uIHN0aW1lY21wLCBzbwo+ID4gd2UgbmVlZCB0byB3YXRjaCB0aGF0IGNsb3Nl
bHkuIFRha2UgYSBsb29rIGF0IHRoZSBhdHRhY2hlZCBzaW1wbGUgdGltZXIKPiA+IHRlc3QgSSBw
dWxsZWQgdG9nZXRoZXIgdG8gaWxsdXN0cmF0ZSBob3cgc3RpbWVjbXAsIHRpbWVyIGludGVycnVw
dCBlbmFibGUsCj4gPiBhbmQgYWxsIGludGVycnVwdCBlbmFibGUgaW50ZXJhY3QuIFlvdSBtYXkg
d2FudCB0byB1c2UgaXQgdG8gaGVscCBwb3J0Cj4gPiB0aGUgYXJjaF90aW1lci4KPiA+Cj4KPiBU
aGFua3MgZm9yIHNoYXJpbmcgdGhlIHRlc3QgY29kZXMuIFdpbGwgaGF2ZSBhbiBpbnZlc3RpZ2F0
aW9uIG9uIGl0Lgo+CgpIaSBBbmRyZXcsCgpZb3UgYXJlIHJpZ2h0LiBUaGUgbG9jYWxfaXJxX2Rp
c2FibGUoKSB3YXMgbm90IG5lZWRlZCBoZXJlLgpJdCdzIG15IGZhdWx0IHRoYXQgSSBhbHNvIHJl
bW92ZWQgdGhlIGxvY2FsX2lycV9lbmFibGUoKSB3aGVuIHRyeWluZwp5b3VyIHN1Z2dlc3Rpb24u
CgpUaGFua3MgZm9yIHlvdXIgcmV2aWV3IGFuZCBoZWxwIG9uIHRoaXMgcGF0Y2ggc2V0IQoKUmVn
YXJkcywKSGFpYm8KCj4gPiBUaGFua3MsCj4gPiBkcmV3CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
