Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E98CC04A6A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 21:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2FCfNhIiCxeRmzsoHFkKq/e/2ZzTGcURlPiMvwefhBw=; b=o56Gyf3IoBs3M2
	zKGipeaU8zG08wjyEttXbNCpe53a/SooJqS9ZtpjzdDnxOL6gI58jdVsIOs4AIXlBNlpDD3bQd4O4
	Uua4+DIUC6rhSeDuCK1QkBIK1rvwzMoKvinlj4eZJDJhu/znnWyX3lVR/M612Zj5tfh8f0JBBBU1K
	vkQ2Z4TnXtajYPi6fU6sY3Dod10HYR6WsIHcSFpQRGJuoVFvV71LoWQGbcqQ7DPNewaAcgXdszGrT
	jOxprioD9wSDMa3T+zPPfbGEWMcFh/Xfno9c3g23O2kiDZk4bLMsT00lyxWxI9dJrdM3tSDZ17dKa
	O6fbJxV77tuTvWAKb6Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUZFK-00BdcW-2E;
	Fri, 11 Aug 2023 21:00:34 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUZFH-00BdZ6-2p
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 21:00:33 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-40a47e8e38dso27081cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Aug 2023 14:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691787622; x=1692392422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dg6w6uZ0dRKMCs1yFFd5Ty/4oQw+/NVdYykf8kUdf9o=;
        b=lcFGBAp4zn3di2vpGU1cgvo1jIdiaYUPpUtRabRS6fAqG33cQc+OSKddzuDhJknceO
         1x4podGW3ZZWsIHPvms81tYknU/ZJ1D8dF0r4HxKkS72+YQrRJ1vo155il/PjQdXjirK
         09IbEEgNu+3T1yH9jt2XBFJiYVkkwKM5fNqR8jXd8c1wupsaHSXvBLoSeTVdghAeELlv
         s+0uxE2TblBkaS36uOpUoavh/CuJ94NIpevTYdqD5d1AKYnxHNr5yKQqv1x4YbHc0wj1
         NMyA9OsGvtKYxEfvet3ZJxRUmrYZ47+w6c2vBdJjsiZm5bVg1Hs+kIP5OCjbtmSM97wo
         JRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691787622; x=1692392422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dg6w6uZ0dRKMCs1yFFd5Ty/4oQw+/NVdYykf8kUdf9o=;
        b=HtJ8gpmK5junWKl0toVHEe9flZmAltW5R/k3lcbQ4mMBmdIJEDmkfjdLVLFj1sYcm+
         biYvYhx7CLZWfSdBcnavI4SaFUI/FVoVd6w+9XXtMO68gWimOZobC45NfR0RuCjq0DRx
         8uKpp+7phrQ46qIY/1YOA0m2+fGNSPHtXyOCOYHVK6fMYlRoVv6KAqxLYvzJKNuzFX5M
         AqN+20IIWL0GcJ0n7v6Ifnb+lsz2BmWk/h8ZH57s48Ich+yrEA/Fc13sO0k4tUX4Ct8D
         1kfL+SYbF+qCavXivo7032lVcA6ofbfF8XED09o4FVGFgGREETHNSVDI9L2so3Z8nwwA
         g+Lg==
X-Gm-Message-State: AOJu0YwYLoS5/ry4JLnpYIcFDBBVnHTx+6xJ7F/iUZbWceNNLxqJ/BO8
	sLJNFtBBDsY4nuLw89aIPCf2cqLsZXjqxkF+FUFn3Q==
X-Google-Smtp-Source: AGHT+IHHZ3nhL46CLGUvs4mMOWOUKG4JET9jKQEC1PVcb3KGxv0PigYsrkFmwn0CutRN32ifouOk/EgcVCoTLp5h/D0=
X-Received: by 2002:a05:622a:10d:b0:3f4:f0fd:fe7e with SMTP id
 u13-20020a05622a010d00b003f4f0fdfe7emr273205qtw.3.1691787622264; Fri, 11 Aug
 2023 14:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230802150018.327079-1-apatel@ventanamicro.com>
 <20230802150018.327079-3-apatel@ventanamicro.com> <20230811193924.GA3997669-robh@kernel.org>
In-Reply-To: <20230811193924.GA3997669-robh@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Fri, 11 Aug 2023 13:59:46 -0700
Message-ID: <CAGETcx8d-VfOewKAMX6aksx9e-_eaWOtU=7i3R624-B-aStBQA@mail.gmail.com>
Subject: Re: [PATCH v7 02/15] of: property: Add fw_devlink support for msi-parent
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_140031_914689_B4EB0AEE 
X-CRM114-Status: GOOD (  23.23  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBBdWcgMTEsIDIwMjMgYXQgMTI6MznigK9QTSBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgQXVnIDAyLCAyMDIzIGF0IDA4OjMwOjA1UE0gKzA1
MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBUaGlzIGFsbG93cyBmd19kZXZsaW5rIHRvIGNyZWF0
ZSBkZXZpY2UgbGlua3MgYmV0d2VlbiBjb25zdW1lcnMgb2YKPiA+IGEgTVNJIGFuZCB0aGUgc3Vw
cGxpZXIgb2YgdGhlIE1TSS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0
ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvb2YvcHJvcGVydHkuYyB8
IDMyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDMyIGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9wcm9wZXJ0
eS5jIGIvZHJpdmVycy9vZi9wcm9wZXJ0eS5jCj4gPiBpbmRleCBkZGM3NWNkNTA4MjUuLmJjMjA1
MzVkZWVkNyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvb2YvcHJvcGVydHkuYwo+ID4gKysrIGIv
ZHJpdmVycy9vZi9wcm9wZXJ0eS5jCj4gPiBAQCAtMTMyNSw2ICsxMzI1LDM3IEBAIHN0YXRpYyBz
dHJ1Y3QgZGV2aWNlX25vZGUgKnBhcnNlX2ludGVycnVwdHMoc3RydWN0IGRldmljZV9ub2RlICpu
cCwKPiA+ICAgICAgIHJldHVybiBvZl9pcnFfcGFyc2Vfb25lKG5wLCBpbmRleCwgJnN1cF9hcmdz
KSA/IE5VTEwgOiBzdXBfYXJncy5ucDsKPiA+ICB9Cj4gPgo+ID4gK3N0YXRpYyBzdHJ1Y3QgZGV2
aWNlX25vZGUgKnBhcnNlX21zaV9wYXJlbnQoc3RydWN0IGRldmljZV9ub2RlICpucCwKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKnByb3Bf
bmFtZSwgaW50IGluZGV4KQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCBvZl9waGFuZGxlX2FyZ3Mg
c3VwX2FyZ3M7Cj4gPiArICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm1zaV9ucDsKPiA+ICsKPiA+
ICsgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19TUEFSQykpCj4gPiArICAgICAgICAgICAgIHJl
dHVybiBOVUxMOwo+ID4gKwo+ID4gKyAgICAgaWYgKHN0cmNtcChwcm9wX25hbWUsICJtc2ktcGFy
ZW50IikpCj4gPiArICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ID4gKwo+ID4gKyAgICAgbXNp
X25wID0gb2ZfcGFyc2VfcGhhbmRsZShucCwgcHJvcF9uYW1lLCAwKTsKPiA+ICsgICAgIGlmICht
c2lfbnApIHsKPiA+ICsgICAgICAgICAgICAgaWYgKCFvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wobXNp
X25wLCAiI21zaS1jZWxscyIpKSB7Cj4KPiBVc2Ugb2ZfcHJvcGVydHlfcHJlc2VudCgpIHRvIGNo
ZWNrIHByZXNlbmNlLgo+Cj4gSG93ZXZlciwgdGhpcyBjaGVjayBpcyB3cm9uZy4gI21zaS1jZWxs
cyBpcyBvcHRpb25hbCBhbmQgYXNzdW1lZCB0byBiZSAwCj4gaWYgbm90IHByZXNlbnQuIFRoZXJl
J3MgYW5vdGhlciBmbGF2b3Igb2Ygb2ZfcGFyc2VfcGhhbmRsZV93aXRoX2FyZ3MoKQo+IHRoYXQg
YWxsb3dzIHNwZWNpZnlpbmcgYSBkZWZhdWx0IGNlbGwgY291bnQsIHNvIEkgdGhpbmsgeW91IGNh
biBnZXQgcmlkCj4gb2YgYWxsIHRoaXMgY2hlY2tpbmcuCgpSb2IsCgpUaGUgZXhpc3RpbmcgREVG
SU5FX1NJTVBMRV9QUk9QKCkgYWxyZWFkeSBkb2VzIHRoaXMgYnR3LiBTZWUgY29tbWl0CmZmMjRm
ZWQxMGJhNDEuIEFudXAganVzdCBpZ25vcmVzIHJldmlldyBjb21tZW50cy4KCkFudXAsCgpTYXcg
eW91ciByZXBseSBoZXJlOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL0NBSzk9QzJXKzNw
T1dMMzZaUG1lMUxwSHo1UEVCVmRLV3Yra1I3RFlLbVJ5dzFBeW1NQUBtYWlsLmdtYWlsLmNvbS8K
CkRpZCB5b3UgZXZlbiB0cnkgdGhlIG1hY3JvPyBXaHkgYXJlIHlvdSBzbyBoZWxsIGJlbnQgb24g
d2FzdGluZyBvdXIKdGltZSBieSBpZ25vcmluZyBjb2RlIHJldmlldyBjb21tZW50cyBhbmQgc2Vu
ZGluZyB0aGUgc2FtZSB1c2VsZXNzCnBhdGNoPwoKLVNhcmF2YW5hCgo+Cj4gPiArICAgICAgICAg
ICAgICAgICAgICAgaWYgKGluZGV4KSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBvZl9ub2RlX3B1dChtc2lfbnApOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIE5VTEw7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgfQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiBtc2lfbnA7Cj4gPiArICAgICAgICAgICAgIH0KPiA+ICsgICAgICAg
ICAgICAgb2Zfbm9kZV9wdXQobXNpX25wKTsKPiA+ICsgICAgIH0KPiA+ICsKPiA+ICsgICAgIGlm
IChvZl9wYXJzZV9waGFuZGxlX3dpdGhfYXJncyhucCwgcHJvcF9uYW1lLCAiI21zaS1jZWxscyIs
IGluZGV4LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZzdXBfYXJn
cykpCj4gPiArICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ID4gKwo+ID4gKyAgICAgcmV0dXJu
IHN1cF9hcmdzLm5wOwo+ID4gK30KPiA+ICsKPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHN1cHBs
aWVyX2JpbmRpbmdzIG9mX3N1cHBsaWVyX2JpbmRpbmdzW10gPSB7Cj4gPiAgICAgICB7IC5wYXJz
ZV9wcm9wID0gcGFyc2VfY2xvY2tzLCB9LAo+ID4gICAgICAgeyAucGFyc2VfcHJvcCA9IHBhcnNl
X2ludGVyY29ubmVjdHMsIH0sCj4gPiBAQCAtMTM1OSw2ICsxMzkwLDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBzdXBwbGllcl9iaW5kaW5ncyBvZl9zdXBwbGllcl9iaW5kaW5nc1tdID0gewo+ID4g
ICAgICAgeyAucGFyc2VfcHJvcCA9IHBhcnNlX3JlZ3VsYXRvcnMsIH0sCj4gPiAgICAgICB7IC5w
YXJzZV9wcm9wID0gcGFyc2VfZ3BpbywgfSwKPiA+ICAgICAgIHsgLnBhcnNlX3Byb3AgPSBwYXJz
ZV9ncGlvcywgfSwKPiA+ICsgICAgIHsgLnBhcnNlX3Byb3AgPSBwYXJzZV9tc2lfcGFyZW50LCB9
LAo+ID4gICAgICAge30KPiA+ICB9Owo+ID4KPiA+IC0tCj4gPiAyLjM0LjEKPiA+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
