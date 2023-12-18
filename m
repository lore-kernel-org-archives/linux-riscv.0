Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88BBC35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 13:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JjRoFAJku+EZ6oQWLTLf4peCoy4euD2Ia7QxmS7GsOk=; b=GM5jvm00jjO933
	5aV7IyKYnzItiN2CAkeSqEthJjLH10oWNlw0iMoo4B5T/CndTCsPG24stdU84cNMu9gFYDsvjQUdh
	wLHHLiK252C2xR0qE19daKKYRyPv69jq4duMjlYgchDNdmdHbB5aF0n0Ac8m6sniNGXLm4BrezwRM
	/0M5SH3GOsycBDhRtmQw3djShTzu5Xwkz05rJ8riPu/Ekc4hUy+m9xV67rThndvjX8OzqfF0jVNpP
	gsveZOtNXe7YcRq0YBOw8A+XOFaAqGsklFaEbr1pDuSbIfW2A7Xn+7WU8n776rG/OYpGE6ATQN5V7
	gV0+k6kMspk2aAUlhwpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFDSO-00Ap67-2Q;
	Mon, 18 Dec 2023 13:14:52 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFDSK-00Ap3S-37;
	Mon, 18 Dec 2023 13:14:50 +0000
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6d9db2f1ddfso894863a34.0;
        Mon, 18 Dec 2023 05:14:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702905286; x=1703510086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7pNpyU2ryow+CaLgg5WjtqJLreEscZp2rrpn9BXxGtI=;
        b=LndMnLbbjCk/D8vst1uIjeJfmDzRCX7wrzQw+x9lFaTM/kJYiKJCJGk023E93kOQNR
         V5/i69n+Bnxew26jzJX9HlkTNlhlNfpdz311IPP/tm/5ash8qZ0a7UDrvtaSZSC6m+/d
         Ecndh4PZ3mGV2dwyRbfX2Iu2FbHHp5+AbEQBiHpfCqpi1uaHrY2D4BNIGuz8YfKeFRV7
         r3HZemTfJOIofPa/f/Vov/0+EYfb0VigPtlb1zUu0V5t1vtMgChwQkEaIeGpEsZYQznr
         DqTatiBu75z+NGziGMe4+iHT3pR5MDZOqxdL4b7jsa+LPIPMvKvZx4DUWUdR+coFl1Zp
         i5Zw==
X-Gm-Message-State: AOJu0YxCroYCWEy8+78nwikjBrJ4fEe/QjDt/1BaYx1xPE6YJe4ngIZ+
	mFcex161/91U+Nk1B8pPZ2MvBh8GH1M6z1rrzhA=
X-Google-Smtp-Source: AGHT+IGUbGitVTHQvmgL9TrX5vuBwIcknqlxcDjvg6GX7UZ1bnRcd/SOCXRu68x81Op7UDAQkGoBQI9yiRAPn8sEAhY=
X-Received: by 2002:a05:6871:2284:b0:1fb:648:5207 with SMTP id
 sd4-20020a056871228400b001fb06485207mr29349775oab.2.1702905285904; Mon, 18
 Dec 2023 05:14:45 -0800 (PST)
MIME-Version: 1.0
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk> <E1rDOgs-00Dvko-6t@rmk-PC.armlinux.org.uk>
 <20231215162322.00007391@Huawei.com> <ZXyEiHLFBsoUkfNI@shell.armlinux.org.uk> <ZYAPhlwPUT/7dN4n@lpieralisi>
In-Reply-To: <ZYAPhlwPUT/7dN4n@lpieralisi>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 18 Dec 2023 14:14:30 +0100
Message-ID: <CAJZ5v0hyUqJspPbGTgTMSVHVBe=wHR6swPx-O3UcsH5dXDFpTA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 13/21] ACPICA: Add new MADT GICC flags fields
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	linux-pm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org, 
	acpica-devel@lists.linuxfoundation.org, linux-csky@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-parisc@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com, justin.he@arm.com, 
	James Morse <james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_051449_002216_396E6624 
X-CRM114-Status: GOOD (  24.34  )
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

T24gTW9uLCBEZWMgMTgsIDIwMjMgYXQgMTA6MjPigK9BTSBMb3JlbnpvIFBpZXJhbGlzaQo8bHBp
ZXJhbGlzaUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgRGVjIDE1LCAyMDIzIGF0IDA0
OjUzOjI4UE0gKzAwMDAsIFJ1c3NlbGwgS2luZyAoT3JhY2xlKSB3cm90ZToKPiA+IE9uIEZyaSwg
RGVjIDE1LCAyMDIzIGF0IDA0OjIzOjIyUE0gKzAwMDAsIEpvbmF0aGFuIENhbWVyb24gd3JvdGU6
Cj4gPiA+IE9uIFdlZCwgMTMgRGVjIDIwMjMgMTI6NTA6MTggKzAwMDAKPiA+ID4gUnVzc2VsbCBL
aW5nIChPcmFjbGUpIDxybWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4gPiA+Cj4g
PiA+ID4gRnJvbTogSmFtZXMgTW9yc2UgPGphbWVzLm1vcnNlQGFybS5jb20+Cj4gPiA+ID4KPiA+
ID4gPiBBZGQgdGhlIG5ldyBmbGFnIGZpZWxkIHRvIHRoZSBNQURUJ3MgR0lDQyBzdHJ1Y3R1cmUu
Cj4gPiA+ID4KPiA+ID4gPiAnT25saW5lIENhcGFibGUnIGluZGljYXRlcyBhIGRpc2FibGVkIENQ
VSBjYW4gYmUgZW5hYmxlZCBsYXRlci4gU2VlCj4gPiA+ID4gQUNQSSBzcGVjaWZpY2F0aW9uIDYu
NSBUYWJlbCA1LjM3OiBHSUNDIENQVSBJbnRlcmZhY2UgRmxhZ3MuCj4gPiA+ID4KPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBKYW1lcyBNb3JzZSA8amFtZXMubW9yc2VAYXJtLmNvbT4KPiA+ID4gPiBU
ZXN0ZWQtYnk6IE1pZ3VlbCBMdWlzIDxtaWd1ZWwubHVpc0BvcmFjbGUuY29tPgo+ID4gPiA+IFRl
c3RlZC1ieTogVmlzaG51IFBhamp1cmkgPHZpc2hudUBvcy5hbXBlcmVjb21wdXRpbmcuY29tPgo+
ID4gPiA+IFRlc3RlZC1ieTogSmlhbnlvbmcgV3UgPGppYW55b25nLnd1QGFybS5jb20+Cj4gPiA+
ID4gU2lnbmVkLW9mZi1ieTogUnVzc2VsbCBLaW5nIChPcmFjbGUpIDxybWsra2VybmVsQGFybWxp
bnV4Lm9yZy51az4KPiA+ID4KPiA+ID4gSSBzZWUgdGhlcmUgaXMgYW4gYWNwaWNhIHB1bGwgcmVx
dWVzdCBpbmNsdWRpbmcgdGhpcyBiaXQgYnV0IHdpdGggYSBkaWZmZXJlbnQgbmFtZQo+ID4gPiBG
b3IgcmVmZXJlbmNlLgo+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vYWNwaWNhL2FjcGljYS9wdWxs
LzkxNC9jb21taXRzLzQ1M2E1ZjY3NTY3Nzg2NTIyMDIxZDVmNjkxM2Y1NjFmOGIzY2FiZjYKPiA+
ID4KPiA+ID4gK0NDIExvcmVuem8gd2hvIHN1Ym1pdHRlZCB0aGF0Lgo+ID4KPiA+ID4gPiArI2Rl
ZmluZSBBQ1BJX01BRFRfR0lDQ19DUFVfQ0FQQUJMRSAgICAgICgxPDwzKSAgIC8qIDAzOiBDUFUg
aXMgb25saW5lIGNhcGFibGUgKi8KPiA+ID4KPiA+ID4gQUNQSV9NQURUX0dJQ0NfT05MSU5FX0NB
UEFCTEUKPiA+Cj4gPiBJdCdzIHNvbWV3aGF0IGRpc2FwcG9pbnRpbmcsIGJ1dCBubyBiaWcgZGVh
bC4gSXQncyBlYXN5IGVub3VnaCB0byBjaGFuZ2UKPiA+ICJpcnFjaGlwL2dpYy12MzogQWRkIHN1
cHBvcnQgZm9yIEFDUEkncyBkaXNhYmxlZCBidXQgJ29ubGluZSBjYXBhYmxlJyBDUFVzIgo+ID4g
dG8gdXNlIExvcmVuem8ncyBuYW1lIHdoZW4gdGhhdCBwYXRjaCBoaXRzIC0gYW5kIGl0IGJlY29t
ZXMgb25lIGxlc3MKPiA+IHBhdGNoIGluIHRoaXMgcGF0Y2ggc2V0IHdoZW4gTG9yZW56bydzIGNo
YW5nZSBldmVudHVhbGx5IGhpdHMgbWFpbmxpbmUuCj4gPgo+ID4gRG9lcyBhbnlvbmUga25vdyBo
b3cgbG9uZyBpdCBtYXkgdGFrZSBmb3IgTG9yZW56bydzIGNoYW5nZSB0byBnZXQgaW50bwo+ID4g
bWFpbmxpbmU/IFdvdWxkIGl0IGJlIGJ5IHRoZSA2LjggbWVyZ2Ugd2luZG93IG9yIHRoZSBmb2xs
b3dpbmcgb25lPwo+Cj4gSSB3aXNoIEkga25ldy4gSSBzdWJtaXR0ZWQgQUNQSUNBIGNoYW5nZXMg
Zm9yIHRoZSBvbmxpbmUgY2FwYWJsZSBiaXQKPiBzaW5jZSBJIGhhZCB0byBhZGQgYWRkaXRpb25h
bCBmbGFncyBvbiB0b3AgKGllIERNQSBjb2hlcmVudCkgYW5kIGl0Cj4gd291bGQgbm90IG1ha2Ug
c2Vuc2UgdG8gc3VibWl0IHRoZSBsYXR0ZXIgd2l0aG91dCB0aGUgZm9ybWVyLgo+Cj4gSSdkIGJl
IGdyZWF0IGlmIHRoZSBBQ1BJQ0EgaGVhZGVycyBjYW4gbWFrZSBpdCBpbnRvIExpbnV4IGZvciB0
aGUgdXBjb21pbmcKPiBtZXJnZSB3aW5kb3csIG5vdCBzdXJlIHdoYXQgSSBjYW4gZG8gdG8gZmFz
dHRyYWNrIHRoZSBwcm9jZXNzIHRob3VnaAo+IChJIHNoYWxsIHBpbmcgdGhlIG1haW50YWluZXJz
KS4KCklmIHlvdXIgdXBzdHJlYW0gcHVsbCByZXF1ZXN0IGhhcyBiZWVuIG1lcmdlZCwgSSBjYW4g
cGljayB1cCBMaW51eApwYXRjaGVzIGNhcnJ5aW5nIExpbms6IHRhZ3MgcG9pbnRpbmcgdG8gdGhl
IHVwc3RyZWFtIEFDUElDQSBjb21taXRzIGluCnRoYXQgcHVsbCByZXF1ZXN0LgoKVGhhbmtzIQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
