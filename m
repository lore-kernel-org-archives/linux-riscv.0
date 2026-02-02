Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4189E73159
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 11:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SbihXbTb21O3MqgkWpn2MaI2jXZytgNi8wp06rOKEFk=; b=Pq5N762Xc1D5Qt
	VTVO2BMAPH+LzoBvnmCetW9JQOdvxSuM9WVQcqvDtPp0C8zfXToHR8n2Yf8yxrb983x2NPQv0sOK9
	ITk4I0Qy66l5/brdh/l2Uh2K2iQYRZG7R7sLf+MpJarQ9hb+Jw9Yh0IrFKgjW2GI8miuPl8ne680j
	ZXtPy5n+LEHO+BBJXrR4vD0w9zF/dKYZLWl0MQvX/XPahjTKLRFXgghgJNLXXp+Ms6vWLV2QMoljQ
	pNSl1FQz4/ZFDjuvoL0K8u1Sd0TEfPSl6bfAPiXIMrNxvWGF9SBKcmbLB4SGVUvfnxGbxhIlMpmZV
	EoAmJ9nkDXUehQ8ks2Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmrnm-00000004sTy-09iI;
	Mon, 02 Feb 2026 11:09:06 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmrni-00000004sTb-47FG
	for linux-riscv@lists.infradead.org;
	Mon, 02 Feb 2026 11:09:04 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b884ad1026cso692077366b.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Feb 2026 03:09:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770030540; cv=none;
        d=google.com; s=arc-20240605;
        b=CJ8W8orc9iJ41nkdEZKCQKzLI+BihdoPllggkyoHMJdScVScTk4lneF05AOe5jNWUp
         9yCWZSQUQhyokMkNyR7faByVU3waH1nUOAz6fA116j5W/iU8fe50B4m4kH/QroI4Pj5v
         fb/Dn45K3+vrKfMfp6ONYY7WyIx+xpARshY1Ha52HhRI0YZgBR/68ij+9KC6C20yDl17
         XASaVtEq3O2WVxO0vznMmLpPaDIZTGXlme+1GJpcf1LE3LYxHsKx/27KAAVE0rNRgONv
         D2byUl4o40nclhJEJ+SwbLHsccV3H8z3ivlsZ9/Uzks/H+1ECqQ+h0Cdp63emKB/tNMf
         VE4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MoxmKC3AEBhB/kOsYxXfyqRCe6TK6YEU6RcRE5k82eE=;
        fh=NYQPzQGI2wWXbS5pTM3nVWEPkxlBAt2YZfWhfQbUHNk=;
        b=XLJqDcoE7qW6BmlvR2FNGk6MCSYM9xthFkjnN+9989cLa4DYboDGDbBZfongX8fBlm
         sWnzDfXQ03ptAi/+vJwE9u5P3e3Usdn9v0+Y9/CpbHz8c8emWV7oA82Mvf/cDkBq5uOE
         Crgg19pjFOEJzB0+BxB6fQpLAJlZFAch8AmE7M7VUeYHiaTFwg1o5XkVcT++quxYN2tK
         JxaJTh9KElLtoWh1nROOVippfl8+SXGFe1XRdX/+m/GpGlgHXnj5fTvZwPVeJ2iYtUp6
         tfQYX0T4evSz9Us/Q/b36qDp87tt63BTJgiBB3EoeluEfBq5S09ndo8KzuSwWodbXuZx
         XHDA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1770030540; x=1770635340; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MoxmKC3AEBhB/kOsYxXfyqRCe6TK6YEU6RcRE5k82eE=;
        b=H7QZKDx2m3rHEQA84SrxYwapEPXRE4yHsRNTU0YgIHZ37UON9P2wch9iZhD1HhGRn9
         t8pxK8EFN63znFwibZe7nJt5KqCOdSbILyjdLsZu1tG9zUD5LfjEINX4EhgIjAj7I6pi
         HfJtbyMSrmGq8r6Ef8yUI+fWWYrlGLj3nl0bQc7rQK2/xAYllt3vAbph9DJkenLtNALP
         0gNnyrLJ5E/UC/LLDZpvPifoTCN9tL3yPsgVy4zhTyuS6RsJvQR5CMX8pgzhtT2Z/HTi
         5JSCkKFCMVTJdTuoc/+aoVBxSDdNt6Jy1oTSPchOkPd8u5GrlzMl2+agKyxFOd5I0rvn
         X4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770030540; x=1770635340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MoxmKC3AEBhB/kOsYxXfyqRCe6TK6YEU6RcRE5k82eE=;
        b=eu2UEVQ46N9HLvYrni+lvOJNnISALAHzci0yS8hhB1/45n7GYjOeVGimRLX9V2hdSg
         QAvc4EVFWnRaUQyTVUEAOERe6KyR/ZFOdrmzF0knqg4cB7KuBVQFpq7kpGUmu996V5RE
         jWh/aP0PRWK0AcJabUA0rrk3gddRj6vA63gGLhTTKIiO20bjk2pHNzGMwyu1vpht/F19
         AxAGJ29DwM6cgq4Svw7YIcJgm+jwtemT1JwZAA66Nc1LJppR6SoMnDrbxCBzS7xRt4yV
         MVGU2XoiGsZu+UbG+MBNm6oMj9a/BJZMWTaAefQ9cPQjKqXYlkUSPWj4X7vip6vODT30
         uNXA==
X-Forwarded-Encrypted: i=1; AJvYcCWlaTxXEJdbJ4MM37KgGlTih/adNHM8qpHg/N/jW5B4RuxRQTskch8z0t5+19vAJYq7OinN44i5Wxeo9w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxxn5CeQte+iRo2SEUCsI48ZI9+rDrhvaMDfu73+RnUgjNdS149
	hWLDuAVGEVdeY6EXq4jQIaV67TD2PxvJMoJCPtVdaTKf3qppooggpzgyGfzonmnOielEblykVOr
	PIwmUx7LMsQpKTDqcUc6zhLU4r63C6U1wKyP8sX8Nog==
X-Gm-Gg: AZuq6aJwVv7GwgxucBmYx9VlEG7GY8kMf8ylWMFSljapH7iXMeGFbJCSV6ATvnhUe4j
	PGONYOqPHsZr+/y7IinZeaY8VzrSWtERCSyK8JRnq8elWC2Pjo4XWOyxW/8fG8t0rsFlje1gTXB
	28WnhH518/yb1shS8upwpmnGu4Lcr77cc6dG5j+9Yg3GIw8+r8lo90M3MLwrtUHMwsz3MAeKTyH
	uB+1TSA3SakGrvvJG5BvMAL2+6HvNW0NEKIDd8wjNgzLJdv88+pvVgDCwr88LqDuDI+dS4End55
	1Q==
X-Received: by 2002:a17:906:6a29:b0:b88:6c85:6284 with SMTP id
 a640c23a62f3a-b8dff5488d5mr604091766b.15.1770030539874; Mon, 02 Feb 2026
 03:08:59 -0800 (PST)
MIME-Version: 1.0
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org> <20260128-ssqosid-cbqri-v2-16-dca586b091b9@kernel.org>
In-Reply-To: <20260128-ssqosid-cbqri-v2-16-dca586b091b9@kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 2 Feb 2026 19:08:48 +0800
X-Gm-Features: AZwV_QhzRM-HhD39oxnkszZgHj-oBq0usZXp2z8CIfC66bnYNgWIMZ8r9zOmvVI
Message-ID: <CAEEQ3wnAqSFUhezyUmJQut8eXThGJ1zxtdNTbFtJusyDstgVUg@mail.gmail.com>
Subject: Re: [External] [PATCH RFC v2 16/17] acpi: riscv: Parse RISC-V Quality
 of Service Controller (RQSC) table
To: Drew Fustini <fustini@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_030903_384434_384AF14F 
X-CRM114-Status: GOOD (  28.84  )
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
Cc: Atish Patra <atish.patra@linux.dev>, Adrien Ricciardi <aricciardi@baylibre.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor+dt@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, devicetree@vger.kernel.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, guo.wenjia23@zte.com.cn, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Peter Newman <peternewman@google.com>, x86@kernel.org, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, liu.qingtao2@zte.com.cn, linux-acpi@vger.kernel.org, Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, Dave Martin <Dave.Martin@arm.com>, Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>, Chen Pei <cp0613@linux.alibaba.com>, Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, Babu Moger <babu.moger@amd.com>, Weiwei Li <liwei1518@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ved Shanbhogue <ved@rivosinc.com>, Reinette Chatre <reinette.chatre@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, Tony Luck <tony.luck@intel.com>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgRHJldywKCk9uIFRodSwgSmFuIDI5LCAyMDI2IGF0IDQ6MjjigK9BTSBEcmV3IEZ1c3Rpbmkg
PGZ1c3RpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBBZGQgZHJpdmVyIHRvIHBhcnNlIHRoZSBB
Q1BJIFJJU0MtViBRdWFsaXR5IG9mIFNlcnZpY2UgQ29udHJvbGxlciAoUlFTQykKPiB0YWJsZSB3
aGljaCBkZXNjcmliZXMgdGhlIGNhcGFjaXR5IGFuZCBiYW5kd2lkdGggUW9TIGNvbnRyb2xsZXJz
IGluIGEKPiBzeXN0ZW0uIFRoZSBRb1MgY29udHJvbGxlcnMgaW1wbGVtZW50IHRoZSBSSVNDLVYg
Q2FwYWNpdHkgYW5kIEJhbmR3aWR0aAo+IENvbnRyb2xsZXIgUW9TIFJlZ2lzdGVyIEludGVyZmFj
ZSAoQ0JRUkkpIHNwZWNpZmljYXRpb24uCj4KPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vcmlz
Y3Ytbm9uLWlzYS9yaXNjdi1jYnFyaS9yZWxlYXNlcy90YWcvdjEuMAo+IExpbms6IGh0dHBzOi8v
Z2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LXJxc2MvYmxvYi9tYWluL3NyYy8KPiBTaWdu
ZWQtb2ZmLWJ5OiBEcmV3IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9yZz4KPiAtLS0KPiAgTUFJ
TlRBSU5FUlMgICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2FjcGkuaCB8ICAxMCArKysrCj4gIGRyaXZlcnMvYWNwaS9yaXNjdi9NYWtlZmlsZSAgIHwg
ICAyICstCj4gIGRyaXZlcnMvYWNwaS9yaXNjdi9ycXNjLmMgICAgIHwgMTEyICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDEyNCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMg
Yi9NQUlOVEFJTkVSUwo+IGluZGV4IDk2ZWFkMzU3YTYzNC4uZTk2YTgzZGM5YTAyIDEwMDY0NAo+
IC0tLSBhL01BSU5UQUlORVJTCj4gKysrIGIvTUFJTlRBSU5FUlMKPiBAQCAtMjI1MTIsNiArMjI1
MTIsNyBAQCBTOiAgICAgIFN1cHBvcnRlZAo+ICBGOiAgICAgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9xb3MuaAo+ICBGOiAgICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9yZXNjdHJsLmgKPiAgRjog
ICAgIGFyY2gvcmlzY3Yva2VybmVsL3Fvcy8KPiArRjogICAgIGRyaXZlcnMvYWNwaS9yaXNjdi9y
cXNjLmMKPiAgRjogICAgIGluY2x1ZGUvbGludXgvcmlzY3ZfcW9zLmgKPgo+ICBSSVNDLVYgUlBN
SSBBTkQgTVBYWSBEUklWRVJTCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
YWNwaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hY3BpLmgKPiBpbmRleCA2ZTEzNjk1MTIw
YmMuLjE2YzZlMjVlZWQxZSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Fj
cGkuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYWNwaS5oCj4gQEAgLTcxLDYgKzcx
LDE2IEBAIGludCBhY3BpX2dldF9yaXNjdl9pc2Eoc3RydWN0IGFjcGlfdGFibGVfaGVhZGVyICp0
YWJsZSwKPgo+ICB2b2lkIGFjcGlfZ2V0X2Nib19ibG9ja19zaXplKHN0cnVjdCBhY3BpX3RhYmxl
X2hlYWRlciAqdGFibGUsIHUzMiAqY2JvbV9zaXplLAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdTMyICpjYm96X3NpemUsIHUzMiAqY2JvcF9zaXplKTsKPiArCj4gKyNpZmRlZiBDT05G
SUdfUklTQ1ZfSVNBX1NTUU9TSUQKPiAraW50IGFjcGlfcGFyc2VfcnFzYyhzdHJ1Y3QgYWNwaV90
YWJsZV9oZWFkZXIgKnRhYmxlKTsKPiArI2Vsc2UKPiArc3RhdGljIGlubGluZSBpbnQgYWNwaV9w
YXJzZV9ycXNjKHN0cnVjdCBhY3BpX3RhYmxlX2hlYWRlciAqdGFibGUpCj4gK3sKPiArICAgICAg
IHJldHVybiAtRUlOVkFMOwo+ICt9Cj4gKyNlbmRpZiAvKiBDT05GSUdfUklTQ1ZfSVNBX1NTUU9T
SUQgKi8KPiArCj4gICNlbHNlCj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBhY3BpX2luaXRfcmludGNf
bWFwKHZvaWQpIHsgfQo+ICBzdGF0aWMgaW5saW5lIHN0cnVjdCBhY3BpX21hZHRfcmludGMgKmFj
cGlfY3B1X2dldF9tYWR0X3JpbnRjKGludCBjcHUpCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNw
aS9yaXNjdi9NYWtlZmlsZSBiL2RyaXZlcnMvYWNwaS9yaXNjdi9NYWtlZmlsZQo+IGluZGV4IDEy
ODRhMDc2ZmE4OC4uY2YwZjM4YzkzYTlmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYWNwaS9yaXNj
di9NYWtlZmlsZQo+ICsrKyBiL2RyaXZlcnMvYWNwaS9yaXNjdi9NYWtlZmlsZQo+IEBAIC0xLDUg
KzEsNSBAQAo+ICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKPiAtb2Jq
LXkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKz0gcmhjdC5vIGluaXQubyBpcnEu
bwo+ICtvYmoteSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICArPSByaGN0Lm8gcnFz
Yy5vIGluaXQubyBpcnEubwo+ICBvYmotJChDT05GSUdfQUNQSV9QUk9DRVNTT1JfSURMRSkgICAg
ICArPSBjcHVpZGxlLm8KPiAgb2JqLSQoQ09ORklHX0FDUElfQ1BQQ19MSUIpICAgICAgICAgICAg
Kz0gY3BwYy5vCj4gIG9iai0kKENPTkZJR19BQ1BJX1JJTVQpICAgICAgICAgICAgICAgICAgICAg
ICAgKz0gcmltdC5vCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNwaS9yaXNjdi9ycXNjLmMgYi9k
cml2ZXJzL2FjcGkvcmlzY3YvcnFzYy5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAw
MDAwMDAwMDAwMDAuLmE4NmRkYjM5ZmFlNAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9kcml2ZXJz
L2FjcGkvcmlzY3YvcnFzYy5jCj4gQEAgLTAsMCArMSwxMTIgQEAKPiArLy8gU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+ICsvKgo+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjUg
VGVuc3RvcnJlbnQKPiArICogICAgIEF1dGhvcjogRHJldyBGdXN0aW5pIDxmdXN0aW5pQGtlcm5l
bC5vcmc+Cj4gKyAqCj4gKyAqLwo+ICsKPiArI2RlZmluZSBwcl9mbXQoZm10KSAiQUNQSTogUlFT
QzogIiBmbXQKPiArCj4gKyNpbmNsdWRlIDxsaW51eC9hY3BpLmg+Cj4gKyNpbmNsdWRlIDxsaW51
eC9iaXRzLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9yaXNjdl9xb3MuaD4KPiArCj4gKyNpZmRlZiBD
T05GSUdfUklTQ1ZfSVNBX1NTUU9TSUQKPiArCj4gKyNkZWZpbmUgQ0JRUklfQ1RSTF9TSVpFIDB4
MTAwMAo+ICsKPiArc3RhdGljIHN0cnVjdCBhY3BpX3RhYmxlX3Jxc2MgKmFjcGlfZ2V0X3Jxc2Mo
dm9pZCkKPiArewo+ICsgICAgICAgc3RhdGljIHN0cnVjdCBhY3BpX3RhYmxlX2hlYWRlciAqcnFz
YzsKPiArICAgICAgIGFjcGlfc3RhdHVzIHN0YXR1czsKPiArCj4gKyAgICAgICAvKgo+ICsgICAg
ICAgICogUlFTQyB3aWxsIGJlIHVzZWQgYXQgcnVudGltZSBvbiBldmVyeSBDUFUsIHNvIHdlCj4g
KyAgICAgICAgKiBkb24ndCBuZWVkIHRvIGNhbGwgYWNwaV9wdXRfdGFibGUoKSB0byByZWxlYXNl
IHRoZSB0YWJsZSBtYXBwaW5nLgo+ICsgICAgICAgICovCj4gKyAgICAgICBpZiAoIXJxc2MpIHsK
PiArICAgICAgICAgICAgICAgc3RhdHVzID0gYWNwaV9nZXRfdGFibGUoQUNQSV9TSUdfUlFTQywg
MCwgJnJxc2MpOwo+ICsgICAgICAgICAgICAgICBpZiAoQUNQSV9GQUlMVVJFKHN0YXR1cykpIHsK
PiArICAgICAgICAgICAgICAgICAgICAgICBwcl93YXJuX29uY2UoIk5vIFJRU0MgdGFibGUgZm91
bmRcbiIpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ICsgICAgICAg
ICAgICAgICB9Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgcmV0dXJuIChzdHJ1Y3QgYWNwaV90
YWJsZV9ycXNjICopcnFzYzsKPiArfQo+ICsKPiAraW50IGFjcGlfcGFyc2VfcnFzYyhzdHJ1Y3Qg
YWNwaV90YWJsZV9oZWFkZXIgKnRhYmxlKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgYWNwaV90YWJs
ZV9ycXNjICpycXNjOwo+ICsgICAgICAgaW50IGVycjsKPiArCj4gKyAgICAgICBCVUdfT04oYWNw
aV9kaXNhYmxlZCk7Cj4gKyAgICAgICBpZiAoIXRhYmxlKSB7Cj4gKyAgICAgICAgICAgICAgIHJx
c2MgPSBhY3BpX2dldF9ycXNjKCk7Cj4gKyAgICAgICAgICAgICAgIGlmICghcnFzYykKPiArICAg
ICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT0VOVDsKPiArICAgICAgIH0gZWxzZSB7Cj4g
KyAgICAgICAgICAgICAgIHJxc2MgPSAoc3RydWN0IGFjcGlfdGFibGVfcnFzYyAqKXRhYmxlOwo+
ICsgICAgICAgfQo+ICsKPiArICAgICAgIGZvciAoaW50IGkgPSAwOyBpIDwgcnFzYy0+bnVtOyBp
KyspIHsKPiArICAgICAgICAgICAgICAgc3RydWN0IGNicXJpX2NvbnRyb2xsZXJfaW5mbyAqY3Ry
bF9pbmZvOwo+ICsKPiArICAgICAgICAgICAgICAgY3RybF9pbmZvID0ga3phbGxvYyhzaXplb2Yo
KmN0cmxfaW5mbyksIEdGUF9LRVJORUwpOwo+ICsgICAgICAgICAgICAgICBpZiAoIWN0cmxfaW5m
bykKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiArCj4gKyAgICAg
ICAgICAgICAgIGN0cmxfaW5mby0+dHlwZSA9IHJxc2MtPmZbaV0udHlwZTsKPiArICAgICAgICAg
ICAgICAgY3RybF9pbmZvLT5hZGRyID0gcnFzYy0+ZltpXS5yZWdbMV07Cj4gKyAgICAgICAgICAg
ICAgIGN0cmxfaW5mby0+c2l6ZSA9IENCUVJJX0NUUkxfU0laRTsKPiArICAgICAgICAgICAgICAg
Y3RybF9pbmZvLT5yY2lkX2NvdW50ID0gcnFzYy0+ZltpXS5yY2lkOwo+ICsgICAgICAgICAgICAg
ICBjdHJsX2luZm8tPm1jaWRfY291bnQgPSBycXNjLT5mW2ldLm1jaWQ7Cj4gKwo+ICsgICAgICAg
ICAgICAgICBwcl9pbmZvKCJGb3VuZCBjb250cm9sbGVyIHdpdGggdHlwZSAldSBhZGRyIDB4JWx4
IHNpemUgICVsdSByY2lkICAldSBtY2lkICAldSIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
Y3RybF9pbmZvLT50eXBlLCBjdHJsX2luZm8tPmFkZHIsIGN0cmxfaW5mby0+c2l6ZSwKPiArICAg
ICAgICAgICAgICAgICAgICAgICBjdHJsX2luZm8tPnJjaWRfY291bnQsIGN0cmxfaW5mby0+bWNp
ZF9jb3VudCk7Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAoY3RybF9pbmZvLT50eXBlID09IENC
UVJJX0NPTlRST0xMRVJfVFlQRV9DQVBBQ0lUWSkgewo+ICsgICAgICAgICAgICAgICAgICAgICAg
IGN0cmxfaW5mby0+Y2FjaGUuY2FjaGVfaWQgPSBycXNjLT5mW2ldLnJlcy5pZDE7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgY3RybF9pbmZvLT5jYWNoZS5jYWNoZV9sZXZlbCA9Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBmaW5kX2FjcGlfY2FjaGVfbGV2ZWxfZnJvbV9pZChj
dHJsX2luZm8tPmNhY2hlLmNhY2hlX2lkKTsKPiArCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
c3RydWN0IGFjcGlfcHB0dF9jYWNoZSAqY2FjaGU7Cj4gKwo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGNhY2hlID0gZmluZF9hY3BpX2NhY2hlX2Zyb21faWQoY3RybF9pbmZvLT5jYWNoZS5jYWNo
ZV9pZCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKGNhY2hlKSB7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjdHJsX2luZm8tPmNhY2hlLmNhY2hlX3NpemUgPSBjYWNo
ZS0+c2l6ZTsKPiArICAgICAgICAgICAgICAgICAgICAgICB9IGVsc2Ugewo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcHJfd2FybigiJXMoKTogZmFpbGVkIHRvIGRldGVybWluZSBz
aXplIGZvciBjYWNoZSBpZCAweCV4IiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgX19mdW5jX18sIGN0cmxfaW5mby0+Y2FjaGUuY2FjaGVfaWQpOwo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY3RybF9pbmZvLT5jYWNoZS5jYWNoZV9zaXplID0gMDsK
PiArICAgICAgICAgICAgICAgICAgICAgICB9Cj4gKwo+ICsgICAgICAgICAgICAgICAgICAgICAg
IHByX2luZm8oIkNhY2hlIGNvbnRyb2xsZXIgaGFzIElEIDB4JXggbGV2ZWwgJXUgc2l6ZSAldSAi
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY3RybF9pbmZvLT5jYWNoZS5jYWNo
ZV9pZCwgY3RybF9pbmZvLT5jYWNoZS5jYWNoZV9sZXZlbCwKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGN0cmxfaW5mby0+Y2FjaGUuY2FjaGVfc2l6ZSk7Cj4gKwo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIC8qCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICogRm9yIENCUVJJ
LCBhbnkgY3B1ICh0ZWNobmljYWxseSBhIGhhcnQgaW4gUklTQy1WIHRlcm1zKQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAqIGNhbiBhY2Nlc3MgdGhlIG1lbW9yeS1tYXBwZWQgcmVnaXN0ZXJz
IG9mIGFueSBDQlFSSQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIGNvbnRyb2xsZXIgaW4g
dGhlIHN5c3RlbS4KPiArICAgICAgICAgICAgICAgICAgICAgICAgKi8KPiArICAgICAgICAgICAg
ICAgICAgICAgICBlcnIgPSBjcHVtYXNrX3BhcnNlKCJGRiIsICZjdHJsX2luZm8tPmNhY2hlLmNw
dV9tYXNrKTsKCkhhcmRjb2RlPyBhY3BpX3BwdHRfZ2V0X2NwdW1hc2tfZnJvbV9jYWNoZV9pZChj
dHJsX2luZm8tPmNhY2hlLmNhY2hlX2lkLAomY3RybF9pbmZvLT5jYWNoZS5jcHVfbWFzayk7ID8K
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKGVycikKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHByX2VycigiRmFpbGVkIHRvIGNvbnZlcnQgY29yZXMgbWFzayBzdHJpbmcg
dG8gY3B1bWFzayAoJWQpIiwgZXJyKTsKPiArCj4gKyAgICAgICAgICAgICAgIH0gZWxzZSBpZiAo
Y3RybF9pbmZvLT50eXBlID09IENCUVJJX0NPTlRST0xMRVJfVFlQRV9CQU5EV0lEVEgpIHsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICBjdHJsX2luZm8tPm1lbS5wcm94X2RvbSA9IHJxc2MtPmZb
aV0ucmVzLmlkMTsKPiArICAgICAgICAgICAgICAgICAgICAgICBwcl9pbmZvKCJNZW1vcnkgY29u
dHJvbGxlciB3aXRoIHByb3hpbWl0eSBkb21haW4gJXUiLAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY3RybF9pbmZvLT5tZW0ucHJveF9kb20pOwo+ICsgICAgICAgICAgICAgICB9
Cj4gKwo+ICsgICAgICAgICAgICAgICAvKiBGaWxsIHRoZSBsaXN0IHNoYXJlZCB3aXRoIFJJU0Mt
ViBRb1MgcmVzY3RybCAqLwo+ICsgICAgICAgICAgICAgICBJTklUX0xJU1RfSEVBRCgmY3RybF9p
bmZvLT5saXN0KTsKPiArICAgICAgICAgICAgICAgbGlzdF9hZGRfdGFpbCgmY3RybF9pbmZvLT5s
aXN0LCAmY2JxcmlfY29udHJvbGxlcnMpOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIHJldHVy
biAwOwo+ICt9Cj4gKwo+ICsjZW5kaWYgLyogQ09ORklHX1JJU0NWX0lTQV9TU1FPU0lEICovCj4K
PiAtLQo+IDIuNDMuMAo+CgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
