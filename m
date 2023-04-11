Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F89C76196
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 15:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t4b2HQ9l6UR30FIluIPMOJciy8lrCNHg+mSagpUqDAc=; b=uAcoZWg6SxpwQe
	CPDDpqYPKKT+ujapFWrv/ZYr2cCLdH+b9jBUgxZTlCu7jPnpOKCPcZ1vjkd2fr5zc5BFQflsDwgAd
	j0T7qXzsVQjE99DOmJXSFM98IAhliA706mm9Kv3cTjk3f06S4Hu1gzosw9ndOrpzWTRJo9Sbp3JlX
	7V4Xh/sKUxqZFiROB/jctS2HhPW/nfRFpxl4EBXoZbnj79Ek6ey4ED/JbFxa7LbWdfrSF08mRJ3ht
	Y/z3xO6ikHAXDF5Z0JMyxIx9yVsFHJZppRUX/ziE/7fHeWgPfW0+SNHi2mBCNabgIZfpg3ICKDCHH
	Wli4xCrE6Gzwic1KIjEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmGOp-000Uuu-13;
	Tue, 11 Apr 2023 15:59:15 +0000
Received: from mail-ej1-f53.google.com ([209.85.218.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmGOm-000Uty-0O
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 15:59:13 +0000
Received: by mail-ej1-f53.google.com with SMTP id sg7so33045711ejc.9
        for <linux-riscv@lists.infradead.org>; Tue, 11 Apr 2023 08:59:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681228749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+t+hSLymjtcl9tDYP+77CnMcRbQzN7gTbEgZPOkpgNo=;
        b=v90cikWYselyO3CQYCf8StPfN+f2vnWtctiWjqyph+dtHRdBJyOmo8Wpzgdg1T+8Bz
         vbvKBiIxgJaqGdgMuQByQr9Zj6ERazZByczG76rKlBgsvJemYS1oByeZeeQKBJI3H/qQ
         OX0bxV1IMvD9oOonP1pVElrEU2ZnnSlNpyzNj/GHFy23bsnnbQSz5Dw0WA7VqhzaVr7y
         81J1FQl3H0fIgJz6TIPiGtLIB//cvNDPoIvjMDcvH+ozV13hWdvMVsH3F/dlRwao+fVF
         hPnU/toqyBJ6ONpir1hS8/5rJzpQkKX60wYxeVO/3Sun7KyEfTc8RIhCkh9vriLuGoKq
         woeg==
X-Gm-Message-State: AAQBX9en91ijr1yBidzWY4lwafvmMCP2djsuHvxZznNwqFS7b4GsvLNS
	YJ1tzOUWNStc+cu3YRqRpU1J5UV0Brtc89myars=
X-Google-Smtp-Source: AKy350bNaptOkAI1KLdu2T1meyD/APPTK9ZKzELBXmDXzLaPX7iTDs2GdfkgJS/ZGwOadRpz+hvMivBZgH9t1VCwwCU=
X-Received: by 2002:a17:907:8a0e:b0:94e:7ce:4d1f with SMTP id
 sc14-20020a1709078a0e00b0094e07ce4d1fmr1675049ejc.2.1681228748909; Tue, 11
 Apr 2023 08:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230411083257.16155-1-mason.huo@starfivetech.com>
In-Reply-To: <20230411083257.16155-1-mason.huo@starfivetech.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 11 Apr 2023 17:58:57 +0200
Message-ID: <CAJZ5v0j_MCv6e08qYKMhiZ2kKzovO+W4scMAKUokNJvt2myS-A@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Add JH7110 cpufreq support
To: Mason Huo <mason.huo@starfivetech.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Shengyu Qu <wiagn233@outlook.com>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_085912_156152_1F0C0F4D 
X-CRM114-Status: GOOD (  15.48  )
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

T24gVHVlLCBBcHIgMTEsIDIwMjMgYXQgMTA6MzPigK9BTSBNYXNvbiBIdW8gPG1hc29uLmh1b0Bz
dGFyZml2ZXRlY2guY29tPiB3cm90ZToKPgo+IFRoZSBTdGFyRml2ZSBKSDcxMTAgU29DIGhhcyBm
b3VyIFJJU0MtViBjb3JlcywKPiBhbmQgaXQgc3VwcG9ydHMgdXAgdG8gNCBjcHUgZnJlcXVlbmN5
IGxvYWRzLgo+Cj4gVGhpcyBwYXRjaHNldCBhZGRzIHRoZSBjb21wYXRpYmxlIHN0cmluZ3MgaW50
byB0aGUgYWxsb3dsaXN0Cj4gZm9yIHN1cHBvcnRpbmcgdGhlIGdlbmVyaWMgY3B1ZnJlcSBkcml2
ZXIgb24gSkg3MTEwIFNvQy4KPiBBbHNvLCBpdCBlbmFibGVzIHRoZSBheHAxNTA2MCBwbWljIGZv
ciB0aGUgY3B1IHBvd2VyIHNvdXJjZS4KPgo+IFRoZSBzZXJpZXMgaGFzIGJlZW4gdGVzdGVkIG9u
IHRoZSBWaXNpb25GaXZlIDIgYm9hcmRzIHdoaWNoCj4gYXJlIGVxdWlwcGVkIHdpdGggSkg3MTEw
IFNvQyBhbmQgYXhwMTUwNjAgcG1pYy4KPgo+Cj4gVGhpcyBwYXRjaHNldCBpcyBiYXNlZCBvbiB2
Ni4zLXJjNCB3aXRoIHRoZXNlIHBhdGNoZXMgYXBwbGllZDoKPiBbMV0gKCJCYXNpYyBjbG9jaywg
cmVzZXQgJiBkZXZpY2UgdHJlZSBzdXBwb3J0IGZvciBTdGFyRml2ZSBKSDcxMTAgUklTQy1WIFNv
QyIpCj4gICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDQwMTExMTkzNC4xMzA4
NDQtMS1oYWwuZmVuZ0BzdGFyZml2ZXRlY2guY29tLwo+IFsyXSAoIkFkZCBYLVBvd2VycyBBWFAx
NTA2MCBQTUlDIHN1cHBvcnQiKQo+ICAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvVFkz
UDI4Nk1CMjYxMUE4MTRFNTgwQzk2REM2RjE4N0I3OTg5NjlAVFkzUDI4Nk1CMjYxMS5KUE5QMjg2
LlBST0QuT1VUTE9PSy5DT00vCj4KPiBNYXNvbiBIdW8gKDMpOgo+ICAgcmlzY3Y6IGR0czogc3Rh
cmZpdmU6IEVuYWJsZSBheHAxNTA2MCBwbWljIGZvciBjcHVmcmVxCj4gICBjcHVmcmVxOiBkdC1w
bGF0ZGV2OiBBZGQgSkg3MTEwIFNPQyB0byB0aGUgYWxsb3dsaXN0Cj4gICByaXNjdjogZHRzOiBz
dGFyZml2ZTogQWRkIGNwdSBzY2FsaW5nIGZvciBKSDcxMTAgU29DCj4KPiAgLi4uL2poNzExMC1z
dGFyZml2ZS12aXNpb25maXZlLTIuZHRzaSAgICAgICAgIHwgNDAgKysrKysrKysrKysrKysrKysr
Kwo+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC5kdHNpICAgICAgfCAyNSAr
KysrKysrKysrKysKPiAgZHJpdmVycy9jcHVmcmVxL2NwdWZyZXEtZHQtcGxhdGRldi5jICAgICAg
ICAgIHwgIDEgKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDY2IGluc2VydGlvbnMoKykKClZpcmVzaCwg
Y2FuIHlvdSBoYXZlIGEgbG9vayBhdCB0aGlzLCBwbGVhc2U/CgpJdCBpcyB2ZXJ5IHNpbWlsYXIg
dG8gdGhlIEFSTSB0aGluZyBBRkFJQ1MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
