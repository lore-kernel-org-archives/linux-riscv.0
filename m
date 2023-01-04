Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD40C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 15:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PaHQ3HPTRx8WsddK1I5uhGP0o5Un3giUQ+klS9mdTfk=; b=lyij8aoI+eG7wp
	UpcV7Z81jeyUJMX/IawtmuzC3pXSyqX5sV/lA7u8BlynlAtTSyAgrAf2or0/cNbxsdd56pJNAOU3w
	1/9Xd6Gt5WIC7t5XfI+a02vlbWUOy2tMfUEqSOwp/YkNPHEyNTPLAKk6ZYNvw/hzffq/l3jmEFg5D
	fXSvLUj7EaRBjTZ2icVJD6JKr06Ko5Z/ynNzmA8FRnq5tUTkybK+NxfQMQVJupCoya3jK2jRhbQcf
	usK+5sR1LnOsNqle/3sBvIx/d93SOC+pu9sYdM8vcE7Xq4CN30RS7nrPnlgeA+pwFlRh2u1XnAGHR
	y/sg7vyG3+LcL69ZnAEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD5Ry-009zrb-Mk; Wed, 04 Jan 2023 15:13:06 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD4OA-009Z31-MN
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 14:05:08 +0000
Received: by mail-vs1-xe34.google.com with SMTP id m129so29111297vsc.11
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jan 2023 06:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbYqEYMuK4QQdOqZ2O5qfwO8lqdYM3p9ldHBfSASKhU=;
        b=an3SkIec6n/usy8qQfvGM+/vshmxGPQdaG3L7Cb0q+0wEUv4qG7txU/8PMXwd9/p7P
         iKenT/Kb4jYLH7i2XPhN3/Q5iZ0aVZ62ai/3bKPZhQrBDVAiSMHI+zXjZTNBYIjMmOrH
         b8xq9/LS4wuTf4ZyNZXrIeOh1GfLzZrQqOALnYTsIqveInzXRXd0jGXm0lN7jk/be+8t
         63xMhntFWce9EnN0aajrD3eRhhFiP1oE5g9vePdyLzMaiGP9icV4USSi9MI+dCc1DsPd
         R7QZxppptA/HyZ9PDQSBThLGDhkv0kpn+Wk9zzTwzfF19Hi0cG/cJ7JXiW5dyLFIiwQc
         YK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbYqEYMuK4QQdOqZ2O5qfwO8lqdYM3p9ldHBfSASKhU=;
        b=fiA6A8tnoIP7MlEJrc9Z2NbuxOpKs39TPjv2L4JQ7Mr2PDw6qlKl9+T/M3siy/ajSK
         O7GkbfRs9uhE+4KZD7Lo78RsQYMiNeOArVy7NT4kRnN9dsFBkhOZP1Q890Mu3mdCZo05
         5Ib2gwqsaLwB9wmKxgJLFDd3NAu6d5NHqBdMsS40Ej3EYylYbgZ8wXj5a+XUmwKfPcB8
         gyuUa9QayPGwXN22wPVmrdPCqC1WNebjW4HNgM6oNKrb29OjZhGKVi2fwvcMRj1zG6T0
         tVBqhTgKLhz17POdwkKvSvLo1OpA3swqGpZqmKGx1EDhLTC7bBpPru+l/sVoW9VgUO61
         U+uw==
X-Gm-Message-State: AFqh2krY3ARyTQvHDtO2nRVO3uaN8FMcDErP0gDiq6ZWwEbpLuymyy2l
	pTDlq1mw1tJL9AE0la/xpE5v392OwRbv/QlzVc9XXA==
X-Google-Smtp-Source: AMrXdXtM8lyaKq6Vjld3wibhq6Rsi6BKDrfwzZTLeVJU64asXWBb5lJt0ZvPvWi0bZs2234bpkxCZyga/AHBhU3l+RI=
X-Received: by 2002:a05:6102:302d:b0:3ce:a2e1:b574 with SMTP id
 v13-20020a056102302d00b003cea2e1b574mr694108vsa.55.1672841101340; Wed, 04 Jan
 2023 06:05:01 -0800 (PST)
MIME-Version: 1.0
References: <20230103141102.772228-1-apatel@ventanamicro.com> <9a98300c-e845-60d6-bdf1-12010eae2075@linaro.org>
In-Reply-To: <9a98300c-e845-60d6-bdf1-12010eae2075@linaro.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 4 Jan 2023 19:34:49 +0530
Message-ID: <CAK9=C2WkiE7W3yU7NoUn_neS8yW1Hs1ErNA+FXsad164QgtndQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Improve CLOCK_EVT_FEAT_C3STOP feature setting
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>, 
	Samuel Holland <samuel@sholland.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_060506_814059_EB325DAC 
X-CRM114-Status: GOOD (  19.69  )
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

T24gV2VkLCBKYW4gNCwgMjAyMyBhdCA2OjMyIFBNIERhbmllbCBMZXpjYW5vIDxkYW5pZWwubGV6
Y2Fub0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+Cj4gSGkgQW51cCwKPgo+IHNoYWxsIEkgcGljayB0
aGUgZW50aXJlIHNlcmllcyBvciBqdXN0IHRoZSBiaW5kaW5ncyBhbmQgdGhlIGRyaXZlciBjaGFu
Z2VzID8KClllcywgdGhhdCB3b3VsZCBiZSBncmVhdC4gUGFsbWVyIGhhcyBhbHJlYWR5IEFDS2Vk
IHRoaXMgc2VyaWVzLgoKVGhhbmtzLApBbnVwCgo+Cj4KPiBPbiAwMy8wMS8yMDIzIDE1OjEwLCBB
bnVwIFBhdGVsIHdyb3RlOgo+ID4gVGhpcyBzZXJpZXMgaW1wcm92ZXMgdGhlIFJJU0MtViB0aW1l
ciBkcml2ZXIgdG8gc2V0IENMT0NLX0VWVF9GRUFUX0MzU1RPUAo+ID4gZmVhdHVyZSBiYXNlZCBv
biBSSVNDLVYgcGxhdGZvcm0gY2FwYWJpbGl0aWVzLgo+ID4KPiA+IFRoZXNlIHBhdGNoZXMgY2Fu
IGFsc28gYmUgZm91bmQgaW4gcmlzY3ZfdGltZXJfZHRfaW1wX3Y2IGJyYW5jaCBhdDoKPiA+IGh0
dHBzOi8vZ2l0aHViLmNvbS9hdnBhdGVsL2xpbnV4LmdpdAo+ID4KPiA+IENoYW5nZXMgc2luY2Ug
djU6Cj4gPiAgIC0gUmViYXNlZCBvbiBMaW51eC02LjItcmMyCj4gPgo+ID4gQ2hhbmdlcyBzaW5j
ZSB2NDoKPiA+ICAgLSBVcGRhdGUgY29tbWl0IHRleHQgb2YgUEFUQ0gxIGJhc2VkIG9uIFNhbXVl
bCdzIGNvbW1lbnRzCj4gPiAgIC0gUmVuYW1lZCBEVCBwcm9wZXJ0eSAicmlzY3YsdGltZXItY2Fu
LXdha2UtY3B1IiB0bwo+ID4gICAgICJyaXNjdix0aW1lci1jYW5ub3Qtd2FrZS1jcHUiIGluIFBB
VENIMiBhbmQgUEFUQ0gzCj4gPiAgIC0gVXBkYXRlZCBkZXNjcmlwdGlvbiBvZiBEVCBwcm9wZXJ0
eSAicmlzY3YsdGltZXItY2Fubm90LXdha2UtY3B1Igo+ID4gICAgIGluIFBBVENIMgo+ID4KPiA+
IENoYW5nZXMgc2luY2UgdjM6Cj4gPiAgIC0gUmViYXNlZCBvbiBMaW51eC02LjEtcmM3Cj4gPiAg
IC0gUmVwbGFjZWQgUEFUQ0gxIHdpdGggYSBwYXRjaCB0byBpbml0aWFsaXplIGJyb2FkY2FzdCB0
aW1lcgo+ID4KPiA+IENoYW5nZXMgc2luY2UgdjI6Cj4gPiAgIC0gSW5jbHVkZSBDb25vcidzIHJl
dmVydCBwYXRjaCBhcyB0aGUgZmlyc3QgcGF0Y2ggYW5kIHJlYmFzZWQgb3RoZXIgcGF0Y2hlcwo+
ID4gICAtIFVwZGF0ZSBQQVRDSDIgdG8gZG9jdW1lbnQgYmluZGluZ3MgZm9yIHNlcGFyYXRlIFJJ
U0MtViB0aW1lciBEVCBub2RlCj4gPiAgIC0gVXBkYXRlIFBBVENIMyBiYXNlZCBvbiBSSVNDLVYg
dGltZXIgRFQgbm9kZSBiaW5kaW5ncwo+ID4KPiA+IENoYW5nZXMgc2luY2UgdjE6Cj4gPiAgIC0g
UmViYXNlZCBvbiBMaW51eC01LjE5LXJjOAo+ID4gICAtIFJlbmFtZWQgInJpc2N2LGFsd2F5cy1v
biIgRFQgcHJvcGVydHkgdG8gInJpc2N2LHRpbWVyLWNhbi13YWtlLWNwdSIKPiA+Cj4gPiBBbnVw
IFBhdGVsICgyKToKPiA+ICAgIGR0LWJpbmRpbmdzOiB0aW1lcjogQWRkIGJpbmRpbmdzIGZvciB0
aGUgUklTQy1WIHRpbWVyIGRldmljZQo+ID4gICAgY2xvY2tzb3VyY2U6IHRpbWVyLXJpc2N2OiBT
ZXQgQ0xPQ0tfRVZUX0ZFQVRfQzNTVE9QIGJhc2VkIG9uIERUCj4gPgo+ID4gQ29ub3IgRG9vbGV5
ICgxKToKPiA+ICAgIFJJU0MtVjogdGltZTogaW5pdGlhbGl6ZSBocnRpbWVyIGJhc2VkIGJyb2Fk
Y2FzdCBjbG9jayBldmVudCBkZXZpY2UKPiA+Cj4gPiAgIC4uLi9iaW5kaW5ncy90aW1lci9yaXNj
dix0aW1lci55YW1sICAgICAgICAgICB8IDUyICsrKysrKysrKysrKysrKysrKysKPiA+ICAgYXJj
aC9yaXNjdi9rZXJuZWwvdGltZS5jICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKysKPiA+ICAg
ZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jICAgICAgICAgICAgIHwgMTAgKysrKwo+
ID4gICAzIGZpbGVzIGNoYW5nZWQsIDY1IGluc2VydGlvbnMoKykKPiA+ICAgY3JlYXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9yaXNjdix0aW1l
ci55YW1sCj4gPgo+Cj4gLS0KPiA8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDi
lIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCj4KPiBGb2xsb3cgTGluYXJvOiAg
PGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo+IDxodHRw
Oi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPiA8aHR0cDovL3d3dy5saW5h
cm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
